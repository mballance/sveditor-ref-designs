// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2esr_mon.v
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
module l2esr_mon() ;

reg l2esr_mon_on,l2esr_mon_DAU_on,l2esr_mon_debugon; 

wire take_ade,take_eer,take_dae;
wire [63:0] err_detected0,err_detected1,err_detected2,err_detected3,err_detected4,err_detected5,err_detected6,err_detected7;
wire [63:0] err_logged0,err_logged1,err_logged2,err_logged3,err_logged4,err_logged5,err_logged6,err_logged7;
wire [39:0] err_addr0,err_addr1,err_addr2,err_addr3,err_addr4,err_addr5,err_addr6,err_addr7;
wire [63:0] err_notdata0,err_notdata1,err_notdata2,err_notdata3,err_notdata4,err_notdata5,err_notdata6,err_notdata7;

wire l2_pm,ba01_pm,ba23_pm,ba45_pm,ba67_pm;
wire flush_reset_complete = `TOP.flush_reset_complete;

initial
begin
l2esr_mon_on = 1; //Enabled by default
l2esr_mon_DAU_on = 1;//Enabled by default
l2esr_mon_debugon = 1 ;//Enabled by default
if(flush_reset_complete == 1'b0)
begin
l2esr_mon_on = 0;
l2esr_mon_DAU_on = 0;
end
if($test$plusargs("l2esr_mon_DEBUG_off"))
	l2esr_mon_debugon = 0;
if($test$plusargs("l2esr_mon_off"))
        l2esr_mon_on = 0;
else if($test$plusargs("l2esr_mon_DAU_off"))
	   l2esr_mon_DAU_on = 0;
end

//--------------------------------------------------------------------------------------
// Enable/Disable support : MAQ
//--------------------------------------------------------------------------------------


/****
always @ (flush_reset_complete)
begin
  if (flush_reset_complete == 1'b0)
  begin
    l2esr_mon_debugon = 1'b0;
    l2esr_mon_on = 1'b0;
    l2esr_mon_DAU_on = 1'b0;
  end

  if ((flush_reset_complete == 1'b1) && (!($test$plusargs("l2esr_mon_ALWAYS_off"))))
    l2esr_mon_debugon = 1'b1;
  if ((flush_reset_complete == 1'b1) && (!($test$plusargs("l2esr_mon_off"))))
    l2esr_mon_on = 1'b1;
  if ((flush_reset_complete == 1'b1) && (!($test$plusargs("l2esr_mon_DAU_off"))))
    l2esr_mon_DAU_on = 1'b1;
end
//--------------------------------------------------------------------------------------
***/


//ncu signals for partial mode
assign l2_pm = tb_top.cpu.l2t0.ncu_l2t_pm; 
assign ba01_pm = tb_top.cpu.l2t0.ncu_l2t_ba01; 
assign ba23_pm = tb_top.cpu.l2t0.ncu_l2t_ba23;
assign ba45_pm = tb_top.cpu.l2t0.ncu_l2t_ba45;
assign ba67_pm = tb_top.cpu.l2t0.ncu_l2t_ba67;

assign err_detected0 = tb_top.cpu.l2t0.csreg.err_state_new_c8;
assign err_detected1 = tb_top.cpu.l2t1.csreg.err_state_new_c8;
assign err_detected2 = tb_top.cpu.l2t2.csreg.err_state_new_c8;
assign err_detected3 = tb_top.cpu.l2t3.csreg.err_state_new_c8;
assign err_detected4 = tb_top.cpu.l2t4.csreg.err_state_new_c8;
assign err_detected5 = tb_top.cpu.l2t5.csreg.err_state_new_c8;
assign err_detected6 = tb_top.cpu.l2t6.csreg.err_state_new_c8;
assign err_detected7 = tb_top.cpu.l2t7.csreg.err_state_new_c8;


//assign err_logged0 = tb_top.cpu.l2t0.csreg1.err_status_in;
assign err_logged0 = tb_top.cpu.l2t0.csr.csr_l2_errstate_reg;
assign err_logged1 = tb_top.cpu.l2t1.csr.csr_l2_errstate_reg;
assign err_logged2 = tb_top.cpu.l2t2.csr.csr_l2_errstate_reg;
assign err_logged3 = tb_top.cpu.l2t3.csr.csr_l2_errstate_reg;
assign err_logged4 = tb_top.cpu.l2t4.csr.csr_l2_errstate_reg;
assign err_logged5 = tb_top.cpu.l2t5.csr.csr_l2_errstate_reg;
assign err_logged6 = tb_top.cpu.l2t6.csr.csr_l2_errstate_reg;
assign err_logged7 = tb_top.cpu.l2t7.csr.csr_l2_errstate_reg;

assign err_addr0   = {tb_top.cpu.l2t0.csr.csr_l2_erraddr_reg[39:4],4'b0} ;
assign err_addr1   = {tb_top.cpu.l2t1.csr.csr_l2_erraddr_reg[39:4],4'b0}; 
assign err_addr2   = {tb_top.cpu.l2t2.csr.csr_l2_erraddr_reg[39:4],4'b0} ;
assign err_addr3   = {tb_top.cpu.l2t3.csr.csr_l2_erraddr_reg[39:4],4'b0}; 
assign err_addr4   = {tb_top.cpu.l2t4.csr.csr_l2_erraddr_reg[39:4],4'b0} ;
assign err_addr5   = {tb_top.cpu.l2t5.csr.csr_l2_erraddr_reg[39:4],4'b0}; 
assign err_addr6   = {tb_top.cpu.l2t6.csr.csr_l2_erraddr_reg[39:4],4'b0}; 
assign err_addr7   = {tb_top.cpu.l2t7.csr.csr_l2_erraddr_reg[39:4],4'b0}; 

assign err_notdata0   = {tb_top.cpu.l2t0.csr.csr_l2_notdata_reg[51:4],4'b0} ;
assign err_notdata1   = {tb_top.cpu.l2t1.csr.csr_l2_notdata_reg[51:4],4'b0} ;
assign err_notdata2   = {tb_top.cpu.l2t2.csr.csr_l2_notdata_reg[51:4],4'b0} ;
assign err_notdata3   = {tb_top.cpu.l2t3.csr.csr_l2_notdata_reg[51:4],4'b0} ;
assign err_notdata4   = {tb_top.cpu.l2t4.csr.csr_l2_notdata_reg[51:4],4'b0} ;
assign err_notdata5   = {tb_top.cpu.l2t5.csr.csr_l2_notdata_reg[51:4],4'b0} ;
assign err_notdata6   = {tb_top.cpu.l2t6.csr.csr_l2_notdata_reg[51:4],4'b0} ;
assign err_notdata7   = {tb_top.cpu.l2t7.csr.csr_l2_notdata_reg[51:4],4'b0} ;

assign take_dae = tb_top.cpu.spc0.tlu.trl0.take_dae;   // For Data Access 0x32
assign take_eer   = tb_top.cpu.spc0.tlu.trl0.take_eer; // For Hw Corr 0x63
assign take_ade   = tb_top.cpu.spc0.tlu.trl0.take_ade; // For Sw Recov 0x40


///////////////////////////////////////////////////
////////////////  Monitor For Traps //////////////
/////////////////////////////////////////////////

always @(take_dae)
if(take_dae) `PR_ALWAYS("SPC0",`ALWAYS,"DATA ACCESS Err TRAP TAKEN: 0x32 ");

always @(take_eer)
if(take_dae) `PR_ALWAYS("SPC0",`ALWAYS,"HARDWARE CORRECTED Err TRAP TAKEN: 0x63 ");

always @(take_ade)
if(take_dae) `PR_ALWAYS("SPC0",`ALWAYS,"SOFTWARE RECOVERABLE Err TRAP TAKEN: 0x40 ");

//////////////// End Of Monitor For Traps //////////////

/***  L2 Error Address Register ***/
/*****Bank0***/

always @(err_addr0 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_addr0)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0)\t L2 Error Address Register[39:0] = 0x%h",{err_addr0[39:4],4'h0});

	end
end
/********* Bank1*****/


always @(err_addr1 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_addr1)
	begin
		
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1)\t L2 Error Address Register[39:0] = 0x%h",{err_addr1[39:4],4'h0});

	end
end

/*******Bank2****/

always @(err_addr2 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_addr2)
	begin
		
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2)\t L2 Error Address Register[39:0] = 0x%h",{err_addr2[39:4],4'h0});

	end
end
/*******Bank3****/

always @(err_addr3 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_addr3)
	begin
	
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3)\t L2 Error Address Register[39:0] = 0x%h",{err_addr3[39:4],4'h0});

	end
end
/*******Bank4****/

always @(err_addr4 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_addr4)
	begin
	
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4)\t L2 Error Address Register[39:0] = 0x%h",{err_addr4[39:4],4'h0});

	end
end
/*******Bank5****/

always @(err_addr5 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_addr5)
	begin
	    `PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5)\t L2 Error Address Register[39:0] = 0x%h",{err_addr5[39:4],4'h0});

	end
end
/*******Bank6****/

always @(err_addr6 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_addr6)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6)\t L2 Error Address Register[39:0] = 0x%h",{err_addr6[39:4],4'h0});

	end
end
/*******Bank7****/

always @(err_addr7 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_addr7)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7)\t L2 Error Address Register[39:0] = 0x%h",{err_addr7[39:4],4'h0});

	end
end


/***** NotDataRegister ***/
/*****Bank0***/

always @(err_notdata0 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_notdata0)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 NotData ErrorRegister For Bank0; Logged");
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank0)\t NDReg.MEND = %b",err_notdata0[51]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank0)\t NDReg.RW = %b,NDReg.VCID = %h",err_notdata0[50],err_notdata0[45:40]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank0)\t NDReg.NDDM = %b,NDReg.NDSP = %b",err_notdata0[48],err_notdata0[49]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank0)\t NotData Address[39:0] = 0x%h",{err_notdata0[39:4],4'h0});

	end
end
/********* Bank1*****/


always @(err_notdata1 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_notdata1)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 NotData ErrorRegister For Bank1; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank1)\t NDReg.MEND = %b",err_notdata1[51]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank1)\t NDReg.RW = %b,NDReg.VCID = %h",err_notdata1[50],err_notdata1[45:40]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank1)\t NDReg.NDDM = %b,NDReg.NDSP = %b",err_notdata1[48],err_notdata1[49]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank1)\t NotData Address[39:0] = 0x%h",{err_notdata1[39:4],4'h0});

	end
end

/*******Bank2****/

always @(err_notdata2 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_notdata2)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 NotData ErrorRegister For Bank2; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank2)\t NDReg.MEND = %b",err_notdata2[51]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank2)\t NDReg.RW = %b,NDReg.VCID = %h",err_notdata2[50],err_notdata2[45:40]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank2)\t NDReg.NDDM = %b,NDReg.NDSP = %b",err_notdata2[48],err_notdata2[49]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank2)\t NotData Address[39:0] = 0x%h",{err_notdata2[39:4],4'h0});

	end
end
/*******Bank3****/

always @(err_notdata3 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_notdata3)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 NotData ErrorRegister For Bank3; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank3)\t NDReg.MEND = %b",err_notdata3[51]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank3)\t NDReg.RW = %b,NDReg.VCID = %h",err_notdata3[50],err_notdata3[45:40]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank3)\t NDReg.NDDM = %b,NDReg.NDSP = %b",err_notdata3[48],err_notdata3[49]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank3)\t NotData Address[39:0] = 0x%h",{err_notdata3[39:4],4'h0});

	end
end
/*******Bank4****/

always @(err_notdata4 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_notdata4)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 NotData ErrorRegister For Bank4; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank4)\t NDReg.MEND = %b",err_notdata4[51]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank4)\t NDReg.RW = %b,NDReg.VCID = %h",err_notdata4[50],err_notdata4[45:40]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank4)\t NDReg.NDDM = %b,NDReg.NDSP = %b",err_notdata4[48],err_notdata4[49]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank4)\t NotData Address[39:0] = 0x%h",{err_notdata4[39:4],4'h0});

	end
end
/*******Bank5****/

always @(err_notdata5 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_notdata5)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 NotData ErrorRegister For Bank5; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank5)\t NDReg.MEND = %b",err_notdata5[51]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank5)\t NDReg.RW = %b,NDReg.VCID = %h",err_notdata5[50],err_notdata5[45:40]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank5)\t NDReg.NDDM = %b,NDReg.NDSP = %b",err_notdata5[48],err_notdata5[49]);
	    `PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank5)\t NotData Address[39:0] = 0x%h",{err_notdata5[39:4],4'h0});
	end
end
/*******Bank6****/

always @(err_notdata6 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_notdata6)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 NotData ErrorRegister For Bank6 ; Logged");
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank6)\t NDReg.MEND = %b",err_notdata6[51]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank6)\t NDReg.RW = %b,NDReg.VCID = %h",err_notdata6[50],err_notdata6[45:40]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank6)\t NDReg.NDDM = %b,NDReg.NDSP = %b",err_notdata6[48],err_notdata6[49]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank6)\t NotData Address[39:0] = 0x%h",{err_notdata6[39:4],4'h0});

	end
end
/*******Bank7****/

always @(err_notdata7 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_notdata7)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 NotData ErrorRegister For Bank7; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank7)\t NDReg.MEND = %b",err_notdata7[51]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank7)\t NDReg.RW = %b,NDReg.VCID = %h",err_notdata7[50],err_notdata7[45:40]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank7)\t NDReg.NDDM = %b,NDReg.NDSP = %b",err_notdata7[48],err_notdata7[49]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS," (Bank7)\t NotData Address[39:0] = 0x%h",{err_notdata7[39:4],4'h0});

	end
end


/*****Error Status Register***/

/*****Bank0***/

always @(err_detected0 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_detected0)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank0; Detected");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_detected0[63],err_detected0[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_detected0[61],err_detected0[60],err_detected0[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_detected0[53],err_detected0[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_detected0[51],err_detected0[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_detected0[49],err_detected0[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_detected0[47],err_detected0[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_detected0[45],err_detected0[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_detected0[43],err_detected0[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_detected0[42],err_detected0[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_detected0[40],err_detected0[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_detected0[38],err_detected0[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_detected0[36],err_detected0[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Det)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_detected0[27:0]);

	end
end
/********* Bank1*****/


always @(err_detected1 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_detected1)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank1; Detected ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_detected1[63],err_detected1[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_detected1[61],err_detected1[60],err_detected1[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_detected1[53],err_detected1[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_detected1[51],err_detected1[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_detected1[49],err_detected1[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_detected1[47],err_detected1[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_detected1[45],err_detected1[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_detected1[43],err_detected1[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_detected1[42],err_detected1[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_detected1[40],err_detected1[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_detected1[38],err_detected1[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_detected1[36],err_detected1[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Det)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_detected1[27:0]);

	end
end

/*******Bank2****/

always @(err_detected2 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_detected2)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank2; Detected ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_detected2[63],err_detected2[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_detected2[61],err_detected2[60],err_detected2[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_detected2[53],err_detected2[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_detected2[51],err_detected2[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_detected2[49],err_detected2[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_detected2[47],err_detected2[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_detected2[45],err_detected2[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_detected2[43],err_detected2[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_detected2[42],err_detected2[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_detected2[40],err_detected2[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_detected2[38],err_detected2[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_detected2[36],err_detected2[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Det)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_detected2[27:0]);

	end
end
/*******Bank3****/

always @(err_detected3 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_detected3)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank3; Detected ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_detected3[63],err_detected3[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_detected3[61],err_detected3[60],err_detected3[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_detected3[53],err_detected3[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_detected3[51],err_detected3[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_detected3[49],err_detected3[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_detected3[47],err_detected3[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_detected3[45],err_detected3[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_detected3[43],err_detected3[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_detected3[42],err_detected3[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_detected3[40],err_detected3[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_detected3[38],err_detected3[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_detected3[36],err_detected3[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Det)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_detected3[27:0]);

	end
end
/*******Bank4****/

always @(err_detected4 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_detected4)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank4; Detected ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_detected4[63],err_detected4[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_detected4[61],err_detected4[60],err_detected4[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_detected4[53],err_detected4[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_detected4[51],err_detected4[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_detected4[49],err_detected4[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_detected4[47],err_detected4[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_detected4[45],err_detected4[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_detected4[43],err_detected4[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_detected4[42],err_detected4[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_detected4[40],err_detected4[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_detected4[38],err_detected4[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_detected4[36],err_detected4[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Det)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_detected4[27:0]);

	end
end
/*******Bank5****/

always @(err_detected5 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_detected5)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank5; Detected ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_detected5[63],err_detected5[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_detected5[61],err_detected5[60],err_detected5[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_detected5[53],err_detected5[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_detected5[51],err_detected5[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_detected5[49],err_detected5[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_detected5[47],err_detected5[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_detected5[45],err_detected5[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_detected5[43],err_detected5[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_detected5[42],err_detected5[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_detected5[40],err_detected5[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_detected5[38],err_detected5[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_detected5[36],err_detected5[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Det)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_detected5[27:0]);

	end
end
/*******Bank6****/

always @(err_detected6 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_detected6)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank6 ; Detected");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_detected6[63],err_detected6[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_detected6[61],err_detected6[60],err_detected6[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_detected6[53],err_detected6[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_detected6[51],err_detected6[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_detected6[49],err_detected6[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_detected6[47],err_detected6[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_detected6[45],err_detected6[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_detected6[43],err_detected6[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_detected6[42],err_detected6[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_detected6[40],err_detected6[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_detected6[38],err_detected6[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_detected6[36],err_detected6[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Det)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_detected6[27:0]);

	end
end
/*******Bank7****/

always @(err_detected7 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_detected7)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank7; Detected ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_detected7[63],err_detected7[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_detected7[61],err_detected7[60],err_detected7[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_detected7[53],err_detected7[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_detected7[51],err_detected7[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_detected7[49],err_detected7[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_detected7[47],err_detected7[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_detected7[45],err_detected7[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_detected7[43],err_detected7[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_detected7[42],err_detected7[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_detected7[40],err_detected7[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_detected7[38],err_detected7[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_detected7[36],err_detected7[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Det)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_detected7[27:0]);

	end
end

/********* Bank0 *****/
always @(err_logged0 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_logged0)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank0;Logged  ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_logged0[63],err_logged0[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_logged0[61],err_logged0[60],err_logged0[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_logged0[53],err_logged0[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_logged0[51],err_logged0[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_logged0[49],err_logged0[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_logged0[47],err_logged0[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_logged0[45],err_logged0[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_logged0[43],err_logged0[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_logged0[42],err_logged0[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_logged0[40],err_logged0[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_logged0[38],err_logged0[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_logged0[36],err_logged0[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0 : Log)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_logged0[27:0]);

	end
end

/********* Bank1*****/


always @(err_logged1 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_logged1)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank1; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_logged1[63],err_logged1[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_logged1[61],err_logged1[60],err_logged1[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_logged1[53],err_logged1[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_logged1[51],err_logged1[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_logged1[49],err_logged1[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_logged1[47],err_logged1[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_logged1[45],err_logged1[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_logged1[43],err_logged1[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_logged1[42],err_logged1[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_logged1[40],err_logged1[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_logged1[38],err_logged1[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_logged1[36],err_logged1[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1 : Log)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_logged1[27:0]);

	end
end

/*******Bank2****/

always @(err_logged2 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_logged2)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank2; Logged  ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_logged2[63],err_logged2[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_logged2[61],err_logged2[60],err_logged2[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_logged2[53],err_logged2[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_logged2[51],err_logged2[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_logged2[49],err_logged2[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_logged2[47],err_logged2[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_logged2[45],err_logged2[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_logged2[43],err_logged2[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_logged2[42],err_logged2[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_logged2[40],err_logged2[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_logged2[38],err_logged2[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_logged2[36],err_logged2[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2 : Log)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_logged2[27:0]);

	end
end
/*******Bank3****/

always @(err_logged3 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_logged3)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3) L2 Error Status Register For Bank3 ; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_logged3[63],err_logged3[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_logged3[61],err_logged3[60],err_logged3[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_logged3[53],err_logged3[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_logged3[51],err_logged3[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_logged3[49],err_logged3[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_logged3[47],err_logged3[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_logged3[45],err_logged3[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_logged3[43],err_logged3[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_logged3[42],err_logged3[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_logged3[40],err_logged3[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_logged3[38],err_logged3[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_logged3[36],err_logged3[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3 : Log)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_logged3[27:0]);

	end
end
/*******Bank4****/

always @(err_logged4 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_logged4)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank4 ; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_logged4[63],err_logged4[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_logged4[61],err_logged4[60],err_logged4[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_logged4[53],err_logged4[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_logged4[51],err_logged4[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_logged4[49],err_logged4[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_logged4[47],err_logged4[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_logged4[45],err_logged4[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_logged4[43],err_logged4[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_logged4[42],err_logged4[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_logged4[40],err_logged4[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_logged4[38],err_logged4[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_logged4[36],err_logged4[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4 : Log)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_logged4[27:0]);

	end
end
/*******Bank5****/

always @(err_logged5 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_logged5)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank5; Logged  ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_logged5[63],err_logged5[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_logged5[61],err_logged5[60],err_logged5[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_logged5[53],err_logged5[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_logged5[51],err_logged5[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_logged5[49],err_logged5[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_logged5[47],err_logged5[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_logged5[45],err_logged5[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_logged5[43],err_logged5[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_logged5[42],err_logged5[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_logged5[40],err_logged5[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_logged5[38],err_logged5[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_logged5[36],err_logged5[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5 : Log)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_logged5[27:0]);

	end
end
/*******Bank6****/

always @(err_logged6 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_logged6)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank6 ; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_logged6[63],err_logged6[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_logged6[61],err_logged6[60],err_logged6[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_logged6[53],err_logged6[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_logged6[51],err_logged6[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_logged6[49],err_logged6[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_logged6[47],err_logged6[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_logged6[45],err_logged6[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_logged6[43],err_logged6[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_logged6[42],err_logged6[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_logged6[40],err_logged6[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_logged6[38],err_logged6[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_logged6[36],err_logged6[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6 : Log)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_logged6[27:0]);

	end
end
/*******Bank7****/

always @(err_logged7 or l2esr_mon_debugon)    
begin
	if(l2esr_mon_debugon == 1 && |err_logged7)
	begin
		`PR_ALWAYS("l2esr_mon",`ALWAYS," L2 Error Status Register For Bank7 ; Logged ");
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.MEU = %b,L2ESR.MEC = %b",err_logged7[63],err_logged7[62]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.RW = %b,L2ESR.MODA = %b,L2ESR.VCID = %h",err_logged7[61],err_logged7[60],err_logged7[59:54]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.LDAC = %b,L2ESR.LDAU = %b",err_logged7[53],err_logged7[52]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.LDWC = %b,L2ESR.LDWU = %b",err_logged7[51],err_logged7[50]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.LDRC = %b,L2ESR.LDRU = %b",err_logged7[49],err_logged7[48]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.LDSC = %b,L2ESR.LDSU = %b",err_logged7[47],err_logged7[46]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.LTC = %b,L2ESR.LRF = %b",err_logged7[45],err_logged7[44]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.LVF = %b,L2ESR.LVC = %b",err_logged7[43],err_logged7[34]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.DAC = %b,L2ESR.DAU = %b",err_logged7[42],err_logged7[41]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.DRC = %b,L2ESR.DRU = %b",err_logged7[40],err_logged7[39]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.DSC = %b,L2ESR.DSU = %b",err_logged7[38],err_logged7[37]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.VEC = %b,L2ESR.VEU = %b",err_logged7[36],err_logged7[35]);
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7 : Log)\tL2ESR.RSVD = 0,L2ESR.SYND = %h",err_logged7[27:0]);

	end
end



/*****End Debug Code*****/


always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank0");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_logged0[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank0");
	else begin end 
end 
end

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank0"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank0");
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged0[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank0"); 
	else if (l2esr_mon_on == 0 && err_logged0[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank0");
end 
end

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank0");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_logged0[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank0");
end 
		
end

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank0"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank0");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_logged0[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank0"); 
	else if (l2esr_mon_on == 0 && err_logged0[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank0");
end
end

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank0"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank0");
end 
else
begin
	if(l2esr_mon_on == 1 && err_logged0[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank0"); 
	else if (l2esr_mon_on == 0 && err_logged0[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank0");
end 
end

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank0");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_logged0[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank0");
end 
end





always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank0");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged0[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank0");
end 
end


always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank0");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_logged0[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank0");
end 
end 

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank0");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged0[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank0");
end 
end

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank0"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank0");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_logged0[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank0"); 
	else if (l2esr_mon_on == 0 && err_logged0[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank0");
end 

end

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank0"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank0");
end
else
begin
	if(l2esr_mon_on == 1 && err_logged0[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank0"); 
	else if (l2esr_mon_on == 0 && err_logged0[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank0");

end 

end

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank0"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_logged0[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank0"); 
end 
end 

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank0"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged0[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank0"); 
end 
end 

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank0");
end
else
begin 
      if(l2esr_mon_on == 1 && err_logged0[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank0");
end 
end 

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on == 1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;      Uncorrectable error in  data from DRAM to  L2   Bank0"); 
	else if(ba01_pm == 0 && l2esr_mon_on == 0 && err_logged0[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank0");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged0[41]== 1 && l2esr_mon_DAU_on == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[41]== 1 && l2esr_mon_DAU_on == 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank0");
end 
end 

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank0"); 
	else if(ba01_pm == 0 && l2esr_mon_on == 0 && err_logged0[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank0"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged0[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank0"); 

end 
end

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank0");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged0[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank0");
end 
end 

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank0");
end
else
begin 
if(l2esr_mon_on == 1 && err_logged0[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank0"); 
	else if(l2esr_mon_on == 0 && err_logged0[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank0");
end 
end 

always @(err_logged0 or l2esr_mon_on or ba01_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged0[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank0"); 
	else  if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged0[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank0");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged0[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank0"); 
	else  if(l2esr_mon_on == 0 && err_logged0[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank0");
end 
end


always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank1");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_logged1[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank1");
	else begin end 
end 
end

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank1"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank1");
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged1[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank1"); 
	else if (l2esr_mon_on == 0 && err_logged1[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank1");
end 
end

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank1");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_logged1[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank1");
end 
		
end

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank1"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank1");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_logged1[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank1"); 
	else if (l2esr_mon_on == 0 && err_logged1[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank1");
end
end

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank1"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank1");
end 
else
begin
	if(l2esr_mon_on == 1 && err_logged1[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank1"); 
	else if (l2esr_mon_on == 0 && err_logged1[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank1");
end 
end

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank1");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_logged1[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank1");
end 
end





always @(err_logged1 )
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank1");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged1[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank1");
end 
end


always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank1");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_logged1[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank1");
end 
end 

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank1");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged1[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank1");
end 
end

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank1"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank1");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_logged1[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank1"); 
	else if (l2esr_mon_on == 0 && err_logged1[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank1");
end 

end

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank1"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank1");
end
else
begin
	if(l2esr_mon_on == 1 && err_logged1[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank1"); 
	else if (l2esr_mon_on == 0 && err_logged1[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank1");

end 

end

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank1"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_logged1[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank1"); 
end 
end 

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank1"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged1[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank1"); 
end 
end 

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank1");
end
else
begin 
      if(l2esr_mon_on == 1 && err_logged1[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank1");
end 
end 

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on == 1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank1"); 
	else if(ba01_pm == 0 && l2esr_mon_on == 0 && err_logged1[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank1");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged1[41]== 1 && l2esr_mon_DAU_on ==1 )
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[41]== 1 && l2esr_mon_DAU_on == 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank1");
end 
end 

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank1"); 
	else if(ba01_pm == 0 && l2esr_mon_on == 0 && err_logged1[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank1"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged1[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank1"); 

end 
end

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank1");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged1[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank1");
end 
end 

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank1");
end
else
begin 
if(l2esr_mon_on == 1 && err_logged1[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank1"); 
	else if(l2esr_mon_on == 0 && err_logged1[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank1");
end 
end 

always @(err_logged1 or l2esr_mon_on or ba01_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_logged1[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank1"); 
	else  if(ba01_pm == 1 && l2esr_mon_on == 0 && err_logged1[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank1");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged1[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank1"); 
	else  if(l2esr_mon_on == 0 && err_logged1[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank1");
end 
end



always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank2");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_logged2[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank2");
	else begin end 
end 
end

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank2"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank2");
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged2[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank2"); 
	else if (l2esr_mon_on == 0 && err_logged2[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank2");
end 
end

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank2");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_logged2[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank2");
end 
		
end

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank2"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank2");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_logged2[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank2"); 
	else if (l2esr_mon_on == 0 && err_logged2[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank2");
end
end

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank2"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank2");
end 
else
begin
	if(l2esr_mon_on == 1 && err_logged2[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank2"); 
	else if (l2esr_mon_on == 0 && err_logged2[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank2");
end 
end

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank2");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_logged2[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank2");
end 
end





always @(err_logged2 )
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank2");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged2[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank2");
end 
end


always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank2");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_logged2[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank2");
end 
end 

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank2");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged2[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank2");
end 
end

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank2"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank2");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_logged2[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank2"); 
	else if (l2esr_mon_on == 0 && err_logged2[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank2");
end 

end

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank2"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank2");
end
else
begin
	if(l2esr_mon_on == 1 && err_logged2[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank2"); 
	else if (l2esr_mon_on == 0 && err_logged2[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank2");

end 

end

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank2"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_logged2[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank2"); 
end 
end 

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank2"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged2[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank2"); 
end 
end 

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged2[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank2");
end
else
begin 
      if(l2esr_mon_on == 1 && err_logged2[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank2");
end 
end 

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on == 1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank2"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_logged2[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank2");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged2[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank2");
end 
end 

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged2[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank2"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_logged2[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank2"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged2[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank2"); 

end 
end

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_logged2[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank2"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_logged2[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank2");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged2[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank2");
end 
end 

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_logged2[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank2"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_logged2[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank2");
end
else
begin 
if(l2esr_mon_on == 1 && err_logged2[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank2"); 
	else if(l2esr_mon_on == 0 && err_logged2[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank2");
end 
end 

always @(err_logged2 or l2esr_mon_on or ba23_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_logged2[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank2"); 
	else  if(ba23_pm == 0 && l2esr_mon_on == 0 && err_logged2[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank2");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged2[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank2"); 
	else  if(l2esr_mon_on == 0 && err_logged2[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank2");
end 
end




always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank3");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_logged3[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank3");
	else begin end 
end 
end

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank3"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank3");
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged3[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank3"); 
	else if (l2esr_mon_on == 0 && err_logged3[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank3");
end 
end

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank3");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_logged3[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank3");
end 
		
end

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank3"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank3");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_logged3[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank3"); 
	else if (l2esr_mon_on == 0 && err_logged3[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank3");
end
end

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank3"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank3");
end 
else
begin
	if(l2esr_mon_on == 1 && err_logged3[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank3"); 
	else if (l2esr_mon_on == 0 && err_logged3[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank3");
end 
end

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank3");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_logged3[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank3");
end 
end





always @(err_logged3 )
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank3");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged3[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank3");
end 
end


always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank3");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_logged3[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank3");
end 
end 

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank3");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged3[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank3");
end 
end

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank3"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank3");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_logged3[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank3"); 
	else if (l2esr_mon_on == 0 && err_logged3[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank3");
end 

end

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank3"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank3");
end
else
begin
	if(l2esr_mon_on == 1 && err_logged3[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank3"); 
	else if (l2esr_mon_on == 0 && err_logged3[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank3");

end 

end

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank3"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_logged3[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank3"); 
end 
end 

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank3"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged3[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank3"); 
end 
end 

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_logged3[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank3");
end
else
begin 
      if(l2esr_mon_on == 1 && err_logged3[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank3");
end 
end 

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank3"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_logged3[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank3");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged3[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank3");
end 
end 

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_logged3[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank3"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_logged3[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank3"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged3[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank3"); 

end 
end

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_logged3[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank3"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_logged3[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank3");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged3[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank3");
end 
end 

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_logged3[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank3"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_logged3[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank3");
end
else
begin 
if(l2esr_mon_on == 1 && err_logged3[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank3"); 
	else if(l2esr_mon_on == 0 && err_logged3[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank3");
end 
end 

always @(err_logged3 or l2esr_mon_on or ba23_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_logged3[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank3"); 
	else  if(ba23_pm == 0 && l2esr_mon_on == 0 && err_logged3[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank3");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged3[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank3"); 
	else  if(l2esr_mon_on == 0 && err_logged3[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank3");
end 
end



always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank4");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_logged4[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank4");
	else begin end 
end 
end

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank4"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank4");
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged4[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank4"); 
	else if (l2esr_mon_on == 0 && err_logged4[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank4");
end 
end

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank4");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_logged4[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank4");
end 
		
end

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank4"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank4");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_logged4[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank4"); 
	else if (l2esr_mon_on == 0 && err_logged4[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank4");
end
end

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank4"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank4");
end 
else
begin
	if(l2esr_mon_on == 1 && err_logged4[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank4"); 
	else if (l2esr_mon_on == 0 && err_logged4[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank4");
end 
end

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank4");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_logged4[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank4");
end 
end





always @(err_logged4 )
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank4");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged4[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank4");
end 
end


always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank4");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_logged4[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank4");
end 
end 

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank4");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged4[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank4");
end 
end

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank4"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank4");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_logged4[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank4"); 
	else if (l2esr_mon_on == 0 && err_logged4[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank4");
end 

end

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank4"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank4");
end
else
begin
	if(l2esr_mon_on == 1 && err_logged4[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank4"); 
	else if (l2esr_mon_on == 0 && err_logged4[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank4");

end 

end

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank4"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_logged4[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank4"); 
end 
end 

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank4"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged4[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank4"); 
end 
end 

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged4[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank4");
end
else
begin 
      if(l2esr_mon_on == 1 && err_logged4[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank4");
end 
end 

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank4"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_logged4[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank4");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged4[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank4");
end 
end 

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged4[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank4"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_logged4[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank4"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged4[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank4"); 

end 
end

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_logged4[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank4"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_logged4[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank4");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged4[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank4");
end 
end 

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_logged4[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank4"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_logged4[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank4");
end
else
begin 
if(l2esr_mon_on == 1 && err_logged4[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank4"); 
	else if(l2esr_mon_on == 0 && err_logged4[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank4");
end 
end 

always @(err_logged4 or l2esr_mon_on or ba45_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_logged4[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank4"); 
	else  if(ba45_pm == 0 && l2esr_mon_on == 0 && err_logged4[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank4");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged4[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank4"); 
	else  if(l2esr_mon_on == 0 && err_logged4[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank4");
end 
end


always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank5");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_logged5[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank5");
	else begin end 
end 
end

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank5"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank5");
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged5[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank5"); 
	else if (l2esr_mon_on == 0 && err_logged5[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank5");
end 
end

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank5");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_logged5[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank5");
end 
		
end

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank5"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank5");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_logged5[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank5"); 
	else if (l2esr_mon_on == 0 && err_logged5[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank5");
end
end

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank5"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank5");
end 
else
begin
	if(l2esr_mon_on == 1 && err_logged5[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank5"); 
	else if (l2esr_mon_on == 0 && err_logged5[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank5");
end 
end

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank5");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_logged5[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank5");
end 
end





always @(err_logged5 )
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank5");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged5[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank5");
end 
end


always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank5");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_logged5[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank5");
end 
end 

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank5");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged5[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank5");
end 
end

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank5"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank5");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_logged5[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank5"); 
	else if (l2esr_mon_on == 0 && err_logged5[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank5");
end 

end

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank5"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank5");
end
else
begin
	if(l2esr_mon_on == 1 && err_logged5[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank5"); 
	else if (l2esr_mon_on == 0 && err_logged5[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank5");

end 

end

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank5"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_logged5[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank5"); 
end 
end 

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank5"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged5[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank5"); 
end 
end 

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_logged5[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank5");
end
else
begin 
      if(l2esr_mon_on == 1 && err_logged5[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank5");
end 
end 

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank5"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_logged5[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank5");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged5[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank5");
end 
end 

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_logged5[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank5"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_logged5[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank5"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged5[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank5"); 

end 
end

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_logged5[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank5"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_logged5[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank5");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged5[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank5");
end 
end 

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_logged5[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank5"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_logged5[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank5");
end
else
begin 
if(l2esr_mon_on == 1 && err_logged5[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank5"); 
	else if(l2esr_mon_on == 0 && err_logged5[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank5");
end 
end 

always @(err_logged5 or l2esr_mon_on or ba45_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_logged5[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank5"); 
	else  if(ba45_pm == 0 && l2esr_mon_on == 0 && err_logged5[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank5");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged5[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank5"); 
	else  if(l2esr_mon_on == 0 && err_logged5[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank5");
end 
end




always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank6");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_logged6[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank6");
	else begin end 
end 
end

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank6"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank6");
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged6[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank6"); 
	else if (l2esr_mon_on == 0 && err_logged6[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank6");
end 
end

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank6");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_logged6[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank6");
end 
		
end

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank6"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank6");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_logged6[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank6"); 
	else if (l2esr_mon_on == 0 && err_logged6[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank6");
end
end

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank6"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank6");
end 
else
begin
	if(l2esr_mon_on == 1 && err_logged6[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank6"); 
	else if (l2esr_mon_on == 0 && err_logged6[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank6");
end 
end

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank6");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_logged6[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank6");
end 
end





always @(err_logged6 )
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank6");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged6[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank6");
end 
end


always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank6");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_logged6[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank6");
end 
end 

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank6");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged6[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank6");
end 
end

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank6"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank6");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_logged6[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank6"); 
	else if (l2esr_mon_on == 0 && err_logged6[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank6");
end 

end

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank6"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank6");
end
else
begin
	if(l2esr_mon_on == 1 && err_logged6[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank6"); 
	else if (l2esr_mon_on == 0 && err_logged6[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank6");

end 

end

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank6"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_logged6[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank6"); 
end 
end 

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank6"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged6[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank6"); 
end 
end 

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged6[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank6");
end
else
begin 
      if(l2esr_mon_on == 1 && err_logged6[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank6");
end 
end 

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank6"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_logged6[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank6");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged6[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank6");
end 
end 

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged6[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank6"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_logged6[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank6"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged6[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank6"); 

end 
end

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_logged6[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank6"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_logged6[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank6");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged6[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank6");
end 
end 

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_logged6[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank6"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_logged6[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank6");
end
else
begin 
if(l2esr_mon_on == 1 && err_logged6[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank6"); 
	else if(l2esr_mon_on == 0 && err_logged6[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank6");
end 
end 

always @(err_logged6 or l2esr_mon_on or ba67_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_logged6[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank6"); 
	else  if(ba67_pm == 0 && l2esr_mon_on == 0 && err_logged6[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank6");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged6[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank6"); 
	else  if(l2esr_mon_on == 0 && err_logged6[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank6");
end 
end


always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank7");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_logged7[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank7");
	else begin end 
end 
end

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank7"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank7");
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged7[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.MEC = 1 Bank7"); 
	else if (l2esr_mon_on == 0 && err_logged7[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.MEC = 1 Bank7");
end 
end

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank7");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_logged7[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank7");
end 
		
end

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank7"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank7");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_logged7[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank7"); 
	else if (l2esr_mon_on == 0 && err_logged7[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank7");
end
end

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank7"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank7");
end 
else
begin
	if(l2esr_mon_on == 1 && err_logged7[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank7"); 
	else if (l2esr_mon_on == 0 && err_logged7[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank7");
end 
end

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank7");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_logged7[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank7");
end 
end





always @(err_logged7 )
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank7");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged7[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank7");
end 
end


always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank7");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_logged7[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank7");
end 
end 

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank7");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged7[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank7");
end 
end

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank7"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank7");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_logged7[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank7"); 
	else if (l2esr_mon_on == 0 && err_logged7[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank7");
end 

end

always @(err_logged7 )
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank7"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank7");
end
else
begin
	if(l2esr_mon_on == 1 && err_logged7[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank7"); 
	else if (l2esr_mon_on == 0 && err_logged7[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank7");

end 

end

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank7"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_logged7[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank7"); 
end 
end 

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank7"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged7[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank7"); 
end 
end 

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_logged7[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank7");
end
else
begin 
      if(l2esr_mon_on == 1 && err_logged7[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank7");
end 
end 

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank7"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_logged7[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank7");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged7[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank7");
end 
end 

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_logged7[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank7"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_logged7[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank7"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_logged7[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRC = 1  Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRC = 1  Bank7"); 

end 
end

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_logged7[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank7"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_logged7[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank7");
end
else
begin 
	if(l2esr_mon_on == 1 && err_logged7[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DRU = 1  Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DRU = 1  Bank7");
end 
end 

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_logged7[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank7"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_logged7[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank7");
end
else
begin 
if(l2esr_mon_on == 1 && err_logged7[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSC = 1  Bank7"); 
	else if(l2esr_mon_on == 0 && err_logged7[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSC = 1  Bank7");
end 
end 

always @(err_logged7 or l2esr_mon_on or ba67_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_logged7[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank7"); 
	else  if(ba67_pm == 0 && l2esr_mon_on == 0 && err_logged7[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank7");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_logged7[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Logged L2ESR.DSU = 1  Bank7"); 
	else  if(l2esr_mon_on == 0 && err_logged7[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Logged L2ESR.DSU = 1  Bank7");
end 
end



always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank0");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_detected0[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank0");
	else begin end 
end 
end

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank0"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank0");
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected0[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank0"); 
	else if (l2esr_mon_on == 0 && err_detected0[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank0");
end 
end

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank0");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_detected0[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank0");
end 
		
end

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank0"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank0");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_detected0[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank0"); 
	else if (l2esr_mon_on == 0 && err_detected0[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank0");
end
end

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank0"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank0");
end 
else
begin
	if(l2esr_mon_on == 1 && err_detected0[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank0"); 
	else if (l2esr_mon_on == 0 && err_detected0[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank0");
end 
end

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank0");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_detected0[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank0");
end 
end





always @(err_detected0 )
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank0");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected0[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank0");
end 
end


always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank0");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_detected0[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank0");
end 
end 

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank0");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected0[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank0");
end 
end

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank0"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank0");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_detected0[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank0"); 
	else if (l2esr_mon_on == 0 && err_detected0[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank0");
end 

end

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank0"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank0");
end
else
begin
	if(l2esr_mon_on == 1 && err_detected0[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank0"); 
	else if (l2esr_mon_on == 0 && err_detected0[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank0");

end 

end

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank0"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_detected0[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank0"); 
end 
end 

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank0"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected0[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank0"); 
end 
end 

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank0");
end
else
begin 
      if(l2esr_mon_on == 1 && err_detected0[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank0");
end 
end 

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank0"); 
	else if(ba01_pm == 0 && l2esr_mon_on == 0 && err_detected0[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank0");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected0[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank0");
end 
end 

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank0"); 
	else if(ba01_pm == 0 && l2esr_mon_on == 0 && err_detected0[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank0"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected0[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank0"); 

end 
end

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank0");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected0[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank0");
end 
end 

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank0"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank0");
end
else
begin 
if(l2esr_mon_on == 1 && err_detected0[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank0"); 
	else if(l2esr_mon_on == 0 && err_detected0[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank0");
end 
end 

always @(err_detected0 or l2esr_mon_on or ba01_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected0[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank0"); 
	else  if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected0[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank0");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected0[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank0"); 
	else  if(l2esr_mon_on == 0 && err_detected0[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank0");
end 
end


always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank1");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_detected1[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank1");
	else begin end 
end 
end

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank1"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank1");
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected1[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank1"); 
	else if (l2esr_mon_on == 0 && err_detected1[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank1");
end 
end

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank1");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_detected1[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank1");
end 
		
end

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank1"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank1");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_detected1[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank1"); 
	else if (l2esr_mon_on == 0 && err_detected1[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank1");
end
end

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank1"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank1");
end 
else
begin
	if(l2esr_mon_on == 1 && err_detected1[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank1"); 
	else if (l2esr_mon_on == 0 && err_detected1[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank1");
end 
end

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank1");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_detected1[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank1");
end 
end





always @(err_detected1 )
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank1");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected1[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank1");
end 
end


always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank1");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_detected1[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank1");
end 
end 

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank1");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected1[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank1");
end 
end

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank1"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank1");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_detected1[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank1"); 
	else if (l2esr_mon_on == 0 && err_detected1[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank1");
end 

end

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank1"); 
	else if (ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank1");
end
else
begin
	if(l2esr_mon_on == 1 && err_detected1[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank1"); 
	else if (l2esr_mon_on == 0 && err_detected1[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank1");

end 

end

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank1"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_detected1[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank1"); 
end 
end 

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank1"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected1[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank1"); 
end 
end 

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank1");
end
else
begin 
      if(l2esr_mon_on == 1 && err_detected1[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank1");
end 
end 

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank1"); 
	else if(ba01_pm == 0 && l2esr_mon_on == 0 && err_detected1[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank1");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected1[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank1");
end 
end 

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank1"); 
	else if(ba01_pm == 0 && l2esr_mon_on == 0 && err_detected1[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank1"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected1[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank1"); 

end 
end

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank1");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected1[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank1");
end 
end 

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank1"); 
	else if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank1");
end
else
begin 
if(l2esr_mon_on == 1 && err_detected1[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank1"); 
	else if(l2esr_mon_on == 0 && err_detected1[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank1");
end 
end 

always @(err_detected1 or l2esr_mon_on or ba01_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba01_pm == 1 && l2esr_mon_on == 1 && err_detected1[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank1"); 
	else  if(ba01_pm == 1 && l2esr_mon_on == 0 && err_detected1[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank1");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected1[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank1"); 
	else  if(l2esr_mon_on == 0 && err_detected1[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank1");
end 
end



always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank2");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_detected2[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank2");
	else begin end 
end 
end

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank2"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank2");
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected2[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank2"); 
	else if (l2esr_mon_on == 0 && err_detected2[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank2");
end 
end

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank2");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_detected2[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank2");
end 
		
end

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank2"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank2");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_detected2[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank2"); 
	else if (l2esr_mon_on == 0 && err_detected2[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank2");
end
end

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank2"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank2");
end 
else
begin
	if(l2esr_mon_on == 1 && err_detected2[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank2"); 
	else if (l2esr_mon_on == 0 && err_detected2[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank2");
end 
end

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank2");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_detected2[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank2");
end 
end





always @(err_detected2 )
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank2");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected2[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank2");
end 
end


always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank2");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_detected2[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank2");
end 
end 

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank2");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected2[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank2");
end 
end

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank2"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank2");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_detected2[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank2"); 
	else if (l2esr_mon_on == 0 && err_detected2[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank2");
end 

end

always @(err_detected2 )
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank2"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank2");
end
else
begin
	if(l2esr_mon_on == 1 && err_detected2[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank2"); 
	else if (l2esr_mon_on == 0 && err_detected2[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank2");

end 

end

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank2"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_detected2[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank2"); 
end 
end 

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank2"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected2[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank2"); 
end 
end 

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank2"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected2[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank2");
end
else
begin 
      if(l2esr_mon_on == 1 && err_detected2[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank2");
end 
end 

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank2"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_detected2[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank2");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected2[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank2");
end 
end 

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected2[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank2"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_detected2[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank2"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected2[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank2"); 

end 
end

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_detected2[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank2"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_detected2[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank2");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected2[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank2");
end 
end 

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_detected2[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank2"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_detected2[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank2");
end
else
begin 
if(l2esr_mon_on == 1 && err_detected2[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank2"); 
	else if(l2esr_mon_on == 0 && err_detected2[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank2");
end 
end 

always @(err_detected2 or l2esr_mon_on or ba23_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_detected2[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank2"); 
	else  if(ba23_pm == 0 && l2esr_mon_on == 0 && err_detected2[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank2");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected2[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank2"); 
	else  if(l2esr_mon_on == 0 && err_detected2[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank2");
end 
end




always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank3");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_detected3[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank3");
	else begin end 
end 
end

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank3"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank3");
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected3[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank3"); 
	else if (l2esr_mon_on == 0 && err_detected3[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank3");
end 
end

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank3");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_detected3[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank3");
end 
		
end

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank3"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank3");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_detected3[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank3"); 
	else if (l2esr_mon_on == 0 && err_detected3[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank3");
end
end

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank3"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank3");
end 
else
begin
	if(l2esr_mon_on == 1 && err_detected3[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank3"); 
	else if (l2esr_mon_on == 0 && err_detected3[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank3");
end 
end

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank3");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_detected3[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank3");
end 
end





always @(err_detected3 )
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank3");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected3[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank3");
end 
end


always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank3");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_detected3[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank3");
end 
end 

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank3");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected3[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank3");
end 
end

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank3"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank3");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_detected3[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank3"); 
	else if (l2esr_mon_on == 0 && err_detected3[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank3");
end 

end

always @(err_detected3 )
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank3"); 
	else if (ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank3");
end
else
begin
	if(l2esr_mon_on == 1 && err_detected3[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank3"); 
	else if (l2esr_mon_on == 0 && err_detected3[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank3");

end 

end

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank3"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_detected3[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank3"); 
end 
end 

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank3"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected3[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank3"); 
end 
end 

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank3"); 
	else if(ba23_pm == 1 && l2esr_mon_on == 0 && err_detected3[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank3");
end
else
begin 
      if(l2esr_mon_on == 1 && err_detected3[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank3");
end 
end 

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank3"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_detected3[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank3");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected3[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank3");
end 
end 

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 1 && l2esr_mon_on == 1 && err_detected3[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank3"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_detected3[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank3"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected3[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank3"); 

end 
end

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_detected3[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank3"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_detected3[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank3");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected3[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank3");
end 
end 

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_detected3[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank3"); 
	else if(ba23_pm == 0 && l2esr_mon_on == 0 && err_detected3[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank3");
end
else
begin 
if(l2esr_mon_on == 1 && err_detected3[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank3"); 
	else if(l2esr_mon_on == 0 && err_detected3[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank3");
end 
end 

always @(err_detected3 or l2esr_mon_on or ba23_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba23_pm == 0 && l2esr_mon_on == 1 && err_detected3[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank3"); 
	else  if(ba23_pm == 0 && l2esr_mon_on == 0 && err_detected3[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank3");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected3[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank3"); 
	else  if(l2esr_mon_on == 0 && err_detected3[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank3");
end 
end



always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank4");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_detected4[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank4");
	else begin end 
end 
end

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank4"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank4");
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected4[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank4"); 
	else if (l2esr_mon_on == 0 && err_detected4[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank4");
end 
end

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank4");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_detected4[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank4");
end 
		
end

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank4"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank4");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_detected4[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank4"); 
	else if (l2esr_mon_on == 0 && err_detected4[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank4");
end
end

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank4"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank4");
end 
else
begin
	if(l2esr_mon_on == 1 && err_detected4[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank4"); 
	else if (l2esr_mon_on == 0 && err_detected4[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank4");
end 
end

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank4");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_detected4[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank4");
end 
end





always @(err_detected4 )
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank4");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected4[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank4");
end 
end


always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank4");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_detected4[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank4");
end 
end 

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank4");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected4[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank4");
end 
end

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank4"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank4");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_detected4[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank4"); 
	else if (l2esr_mon_on == 0 && err_detected4[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank4");
end 

end

always @(err_detected4 )
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank4"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank4");
end
else
begin
	if(l2esr_mon_on == 1 && err_detected4[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank4"); 
	else if (l2esr_mon_on == 0 && err_detected4[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank4");

end 

end

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank4"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_detected4[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank4"); 
end 
end 

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank4"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected4[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank4"); 
end 
end 

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank4"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected4[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank4");
end
else
begin 
      if(l2esr_mon_on == 1 && err_detected4[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank4");
end 
end 

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank4"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_detected4[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank4");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected4[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank4");
end 
end 

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected4[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank4"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_detected4[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank4"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected4[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank4"); 

end 
end

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_detected4[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank4"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_detected4[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank4");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected4[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank4");
end 
end 

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_detected4[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank4"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_detected4[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank4");
end
else
begin 
if(l2esr_mon_on == 1 && err_detected4[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank4"); 
	else if(l2esr_mon_on == 0 && err_detected4[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank4");
end 
end 

always @(err_detected4 or l2esr_mon_on or ba45_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_detected4[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank4"); 
	else  if(ba45_pm == 0 && l2esr_mon_on == 0 && err_detected4[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank4");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected4[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank4"); 
	else  if(l2esr_mon_on == 0 && err_detected4[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank4");
end 
end


always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank5");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_detected5[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank5");
	else begin end 
end 
end

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank5"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank5");
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected5[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank5"); 
	else if (l2esr_mon_on == 0 && err_detected5[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank5");
end 
end

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank5");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_detected5[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank5");
end 
		
end

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank5"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank5");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_detected5[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank5"); 
	else if (l2esr_mon_on == 0 && err_detected5[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank5");
end
end

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank5"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank5");
end 
else
begin
	if(l2esr_mon_on == 1 && err_detected5[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank5"); 
	else if (l2esr_mon_on == 0 && err_detected5[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank5");
end 
end

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank5");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_detected5[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank5");
end 
end





always @(err_detected5 )
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank5");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected5[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank5");
end 
end


always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank5");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_detected5[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank5");
end 
end 

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank5");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected5[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank5");
end 
end

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank5"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank5");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_detected5[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank5"); 
	else if (l2esr_mon_on == 0 && err_detected5[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank5");
end 

end

always @(err_detected5 )
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank5"); 
	else if (ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank5");
end
else
begin
	if(l2esr_mon_on == 1 && err_detected5[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank5"); 
	else if (l2esr_mon_on == 0 && err_detected5[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank5");

end 

end

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank5"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_detected5[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank5"); 
end 
end 

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank5"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected5[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank5"); 
end 
end 

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank5"); 
	else if(ba45_pm == 1 && l2esr_mon_on == 0 && err_detected5[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank5");
end
else
begin 
      if(l2esr_mon_on == 1 && err_detected5[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank5");
end 
end 

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank5"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_detected5[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank5");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected5[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank5");
end 
end 

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 1 && l2esr_mon_on == 1 && err_detected5[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank5"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_detected5[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank5"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected5[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank5"); 

end 
end

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_detected5[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank5"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_detected5[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank5");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected5[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank5");
end 
end 

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_detected5[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank5"); 
	else if(ba45_pm == 0 && l2esr_mon_on == 0 && err_detected5[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank5");
end
else
begin 
if(l2esr_mon_on == 1 && err_detected5[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank5"); 
	else if(l2esr_mon_on == 0 && err_detected5[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank5");
end 
end 

always @(err_detected5 or l2esr_mon_on or ba45_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba45_pm == 0 && l2esr_mon_on == 1 && err_detected5[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank5"); 
	else  if(ba45_pm == 0 && l2esr_mon_on == 0 && err_detected5[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank5");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected5[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank5"); 
	else  if(l2esr_mon_on == 0 && err_detected5[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank5");
end 
end




always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank6");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_detected6[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank6");
	else begin end 
end 
end

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank6"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank6");
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected6[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank6"); 
	else if (l2esr_mon_on == 0 && err_detected6[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank6");
end 
end

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank6");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_detected6[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank6");
end 
		
end

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank6"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank6");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_detected6[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank6"); 
	else if (l2esr_mon_on == 0 && err_detected6[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank6");
end
end

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank6"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank6");
end 
else
begin
	if(l2esr_mon_on == 1 && err_detected6[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank6"); 
	else if (l2esr_mon_on == 0 && err_detected6[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank6");
end 
end

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank6");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_detected6[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank6");
end 
end





always @(err_detected6 )
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank6");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected6[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank6");
end 
end


always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank6");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_detected6[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank6");
end 
end 

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank6");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected6[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank6");
end 
end

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank6"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank6");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_detected6[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank6"); 
	else if (l2esr_mon_on == 0 && err_detected6[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank6");
end 

end

always @(err_detected6 )
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank6"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank6");
end
else
begin
	if(l2esr_mon_on == 1 && err_detected6[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank6"); 
	else if (l2esr_mon_on == 0 && err_detected6[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank6");

end 

end

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank6"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_detected6[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank6"); 
end 
end 

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank6"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected6[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank6"); 
end 
end 

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank6"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected6[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank6");
end
else
begin 
      if(l2esr_mon_on == 1 && err_detected6[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank6");
end 
end 

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank6"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_detected6[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank6");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected6[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank6");
end 
end 

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected6[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank6"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_detected6[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank6"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected6[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank6"); 

end 
end

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_detected6[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank6"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_detected6[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank6");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected6[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank6");
end 
end 

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_detected6[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank6"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_detected6[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank6");
end
else
begin 
if(l2esr_mon_on == 1 && err_detected6[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank6"); 
	else if(l2esr_mon_on == 0 && err_detected6[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank6");
end 
end 

always @(err_detected6 or l2esr_mon_on or ba67_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_detected6[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank6"); 
	else  if(ba67_pm == 0 && l2esr_mon_on == 0 && err_detected6[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank6");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected6[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank6"); 
	else  if(l2esr_mon_on == 0 && err_detected6[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank6");
end 
end


always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)    
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank7");
	else begin end 
end
else
begin
	if(l2esr_mon_on == 1 && err_detected7[63]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[63]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEU = 1; Multiple Uncorrectable errors ;  L2  Bank7");
	else begin end 
end 
end

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
      if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank7"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank7");
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected7[62]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.MEC = 1 Bank7"); 
	else if (l2esr_mon_on == 0 && err_detected7[62]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.MEC = 1 Bank7");
end 
end

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[53] == 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank7");
end 
else
begin 
      if(l2esr_mon_on == 1 && err_detected7[53]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[53]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAC = 1; Correctable errors in data ; L2  Bank7");
end 
		
end

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm == 1)
begin
	if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank7"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank7");
end 
else
begin 
        if(l2esr_mon_on == 1 && err_detected7[52]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank7"); 
	else if (l2esr_mon_on == 0 && err_detected7[52]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDAU = 1; Uncorrectable errors in data from L2 Data Array;  L2 Bank7");
end
end

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if(l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank7"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank7");
end 
else
begin
	if(l2esr_mon_on == 1 && err_detected7[51]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank7"); 
	else if (l2esr_mon_on == 0 && err_detected7[51]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWC = 1; Correctable errors in data on Write Back; L2  Bank7");
end 
end

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
       if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank7");
end
else 
begin 
	if(l2esr_mon_on == 1  &&  err_detected7[50]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[50]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDWU = 1; Uncorrectable errors in Write Back data;  L2 Bank7");
end 
end





always @(err_detected7 )
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank7");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected7[49]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[49]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRC = 1; Correctable errors in data on SIU Rd/Wr;  L2 Bank7");
end 
end


always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank7");
end
else 
begin 
	if(l2esr_mon_on == 1 && err_detected7[48]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[48]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDRU = 1; Uncorrectable errors in data on SIU Rd/Wr;  L2 Bank7");
end 
end 

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank7");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected7[47]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[47]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSC = 1; Correctable errors in data on Scrub ; L2  Bank7");
end 
end

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank7"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank7");
end 
else 
begin 
	if(l2esr_mon_on == 1 && err_detected7[46]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank7"); 
	else if (l2esr_mon_on == 0 && err_detected7[46]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LDSU = 1; UnCorrectable errors in data on Scrub ; L2  Bank7");
end 

end

always @(err_detected7 )
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank7"); 
	else if (ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank7");
end
else
begin
	if(l2esr_mon_on == 1 && err_detected7[45]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2   Bank7"); 
	else if (l2esr_mon_on == 0 && err_detected7[45]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LTC = 1; Correctable errors in Tag Array ; L2  Bank7");

end 

end

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank7"); 

end
else
begin
	 if(l2esr_mon_on == 1 && err_detected7[44]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[44]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.LRF = 1; UnCorrectable directory parity errors ; L2   Bank7"); 
end 
end 

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank7"); 
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected7[43]== 1)
                `PR_ERROR("l2esr_mon",`ERROR,"LVF; VUAD Uncorrectable ECC Error  Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[43]== 1)
                `PR_ALWAYS("l2esr_mon",`ALWAYS,"LVF; VUAD Uncorrectable ECC Error  Bank7"); 
end 
end 

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank7"); 
	else if(ba67_pm == 1 && l2esr_mon_on == 0 && err_detected7[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank7");
end
else
begin 
      if(l2esr_mon_on == 1 && err_detected7[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[42]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAC = 1;  Correctable error in  data from DRAM to  L2   Bank7");
end 
end 

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm or l2esr_mon_DAU_on)
begin
if (l2_pm ==1 && l2esr_mon_DAU_on ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[41]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank7"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_detected7[41]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank7");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected7[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[41]== 1 && l2esr_mon_DAU_on ==1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DAU = 1;    Uncorrectable error in  data from DRAM to  L2   Bank7");
end 
end 

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 1 && l2esr_mon_on == 1 && err_detected7[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank7"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_detected7[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank7"); 
end
else
begin 
        if(l2esr_mon_on == 1 && err_detected7[40]== 1)
	`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRC = 1  Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[40]== 1)
	`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRC = 1  Bank7"); 

end 
end

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_detected7[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank7"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_detected7[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank7");
end
else
begin 
	if(l2esr_mon_on == 1 && err_detected7[39]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DRU = 1  Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[39]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DRU = 1  Bank7");
end 
end 

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm)
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_detected7[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank7"); 
	else if(ba67_pm == 0 && l2esr_mon_on == 0 && err_detected7[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank7");
end
else
begin 
if(l2esr_mon_on == 1 && err_detected7[38]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSC = 1  Bank7"); 
	else if(l2esr_mon_on == 0 && err_detected7[38]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSC = 1  Bank7");
end 
end 

always @(err_detected7 or l2esr_mon_on or ba67_pm or l2_pm) 
begin
if (l2_pm ==1)
begin 
        if(ba67_pm == 0 && l2esr_mon_on == 1 && err_detected7[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank7"); 
	else  if(ba67_pm == 0 && l2esr_mon_on == 0 && err_detected7[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank7");
end 
else
begin 
	if(l2esr_mon_on == 1 && err_detected7[37]== 1)
		`PR_ERROR("l2esr_mon",`ERROR,"Detected L2ESR.DSU = 1  Bank7"); 
	else  if(l2esr_mon_on == 0 && err_detected7[37]== 1)
		`PR_ALWAYS("l2esr_mon",`ALWAYS,"Detected L2ESR.DSU = 1  Bank7");
end 
end



//Later change this to print only if error logged
//Printing Syndrome bits if not zero


always @(tb_top.cpu.l2clk)
begin
if(l2esr_mon_on == 1 && err_logged0[27:0] != 0) `PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank0)  L2ESR.SYND = %0h",err_logged0[27:0]);
end

always @(tb_top.cpu.l2clk)
begin
if(l2esr_mon_on == 1 && err_logged1[27:0] != 0) `PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank1)  L2ESR.SYND = %0h",err_logged1[27:0]);
end

always @(tb_top.cpu.l2clk)
begin
if(l2esr_mon_on == 1 && err_logged2[27:0] != 0) `PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank2)  L2ESR.SYND = %0h",err_logged2[27:0]);
end

always @(tb_top.cpu.l2clk)
begin
if(l2esr_mon_on == 1 && err_logged3[27:0] != 0) `PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank3)  L2ESR.SYND = %0h",err_logged3[27:0]);
end

always @(tb_top.cpu.l2clk)
begin
if(l2esr_mon_on == 1 && err_logged4[27:0] != 0) `PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank4)  L2ESR.SYND = %0h",err_logged4[27:0]);
end

always @(tb_top.cpu.l2clk)
begin
if(l2esr_mon_on == 1 && err_logged5[27:0] != 0) `PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank5)  L2ESR.SYND = %0h",err_logged5[27:0]);
end

always @(tb_top.cpu.l2clk)
begin
if(l2esr_mon_on == 1 && err_logged6[27:0] != 0) `PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank6)  L2ESR.SYND = %0h",err_logged6[27:0]);
end

always @(tb_top.cpu.l2clk)
begin
if(l2esr_mon_on == 1 && err_logged7[27:0] != 0) `PR_ALWAYS("l2esr_mon",`ALWAYS,"(Bank7)  L2ESR.SYND = %0h",err_logged7[27:0]);
end


endmodule
