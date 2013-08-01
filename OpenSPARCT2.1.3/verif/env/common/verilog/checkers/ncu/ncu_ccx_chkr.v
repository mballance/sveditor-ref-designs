// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_ccx_chkr.v
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
module ncu_ccx_chkr();

wire por_reset_l = !`NCU.tcu_aclk;


 // 0in default_reset `NCU.tcu_aclk -module ncu_ccx_chkr 

`ifdef X_GUARD
// 0in known_driven -var cpx_ncu_grant_cx          -clock l2clk -name cpx_ncu_grant_cx_x_guard -active por_reset_l -module ncu
   // 0in known_driven -var ncu_cpx_req_cq         -clock l2clk -name ncu_cpx_req_cq_x_guard -active por_reset_l -module ncu
   // 0in known_driven -var ncu_pcx_stall_pq       -clock l2clk -name ncu_pcx_stall_pq_x_guard -active por_reset_l -module ncu
   // 0in known_driven -var pcx_ncu_data_rdy_px1   -clock l2clk -name pcx_ncu_data_rdy_px1_x_guard -active por_reset_l -module ncu

`endif

//****************************************
// checker for PCX interface
//****************************************


//****************************************
// checker for CPX interface
//****************************************
reg [4:0] outstanding_req_cnt0;
reg [4:0] outstanding_req_cnt1;
reg [4:0] outstanding_req_cnt2;
reg [4:0] outstanding_req_cnt3;
reg [4:0] outstanding_req_cnt4;
reg [4:0] outstanding_req_cnt5;
reg [4:0] outstanding_req_cnt6;
reg [4:0] outstanding_req_cnt7;


/* 0in bits_on  
   	-var ncu_cpx_req_cq 
	-max 1
	-message "ncu_cpx_req_cq is not one hot"
	-clock l2clk
	-module ncu
*/



/* 0in overflow 
	-var outstanding_req_cnt0 
	-max 2
	-name ncu_cpx_req_cq0
	-clock l2clk
	-module ncu
*/
/* 0in overflow 
	-var outstanding_req_cnt1 
	-max 2
	-name ncu_cpx_req_cq1
	-clock l2clk
	-module ncu
*/
/* 0in overflow 
	-var outstanding_req_cnt2 
	-max 2
	-name ncu_cpx_req_cq2
	-clock l2clk
	-module ncu
*/
/* 0in overflow 
	-var outstanding_req_cnt3 
	-max 2
	-name ncu_cpx_req_cq3
	-clock l2clk
	-module ncu
*/
/* 0in overflow 
	-var outstanding_req_cnt4 
	-max 2
	-name ncu_cpx_req_cq4
	-clock l2clk
	-module ncu
*/
/* 0in overflow 
	-var outstanding_req_cnt5 
	-max 2
	-name ncu_cpx_req_cq5
	-clock l2clk
	-module ncu
*/
/* 0in overflow 
	-var outstanding_req_cnt6 
	-max 2
	-name ncu_cpx_req_cq6
	-clock l2clk
	-module ncu
*/
/* 0in overflow 
	-var outstanding_req_cnt7 
	-max 2
	-name ncu_cpx_req_cq7
	-clock l2clk
	-module ncu
*/

always @(por_reset_l) begin
  if (!por_reset_l) begin 
	outstanding_req_cnt0 = 0; 
  end
end
always @(por_reset_l) begin
  if (!por_reset_l) begin 
	outstanding_req_cnt1 = 0; 
  end
end
always @(por_reset_l) begin
  if (!por_reset_l) begin 
	outstanding_req_cnt2 = 0; 
  end
end
always @(por_reset_l) begin
  if (!por_reset_l) begin 
	outstanding_req_cnt3 = 0; 
  end
end
always @(por_reset_l) begin
  if (!por_reset_l) begin 
	outstanding_req_cnt4 = 0; 
  end
end
always @(por_reset_l) begin
  if (!por_reset_l) begin 
	outstanding_req_cnt5 = 0; 
  end
end
always @(por_reset_l) begin
  if (!por_reset_l) begin 
	outstanding_req_cnt6 = 0; 
  end
end
always @(por_reset_l) begin
  if (!por_reset_l) begin 
	outstanding_req_cnt7 = 0; 
  end
end


always @(posedge `NCU.l2clk) begin
    if (`NCU.cpx_ncu_grant_cx[0]) begin
	if (outstanding_req_cnt0 <= 0)begin
		$display ("ERROR! %m outstanding_req_cnt0 will become negtive value") ;
	end
	outstanding_req_cnt0 = outstanding_req_cnt0 - 1;
    end
    if (`NCU.ncu_cpx_req_cq[0]) begin
	outstanding_req_cnt0 = outstanding_req_cnt0 + 1;
    end
end
always @(posedge `NCU.l2clk) begin
    if (`NCU.cpx_ncu_grant_cx[1]) begin
	if (outstanding_req_cnt1 <= 0)begin
		$display ("ERROR! %m outstanding_req_cnt1 will become negtive value") ;
	end
	outstanding_req_cnt1 = outstanding_req_cnt1 - 1;
    end
    if (`NCU.ncu_cpx_req_cq[1]) begin
	outstanding_req_cnt1 = outstanding_req_cnt1 + 1;
    end
end
always @(posedge `NCU.l2clk) begin
    if (`NCU.cpx_ncu_grant_cx[2]) begin
	if (outstanding_req_cnt2 <= 0)begin
		$display ("ERROR! %m outstanding_req_cnt2 will become negtive value") ;
	end
	outstanding_req_cnt2 = outstanding_req_cnt2 - 1;
    end
    if (`NCU.ncu_cpx_req_cq[2]) begin
	outstanding_req_cnt2 = outstanding_req_cnt2 + 1;
    end
end
always @(posedge `NCU.l2clk) begin
    if (`NCU.cpx_ncu_grant_cx[3]) begin
	if (outstanding_req_cnt3 <= 0)begin
		$display ("ERROR! %m outstanding_req_cnt3 will become negtive value") ;
	end
	outstanding_req_cnt3 = outstanding_req_cnt3 - 1;
    end
    if (`NCU.ncu_cpx_req_cq[3]) begin
	outstanding_req_cnt3 = outstanding_req_cnt3 + 1;
    end
end
always @(posedge `NCU.l2clk) begin
    if (`NCU.cpx_ncu_grant_cx[4]) begin
	if (outstanding_req_cnt4 <= 0)begin
		$display ("ERROR! %m outstanding_req_cnt4 will become negtive value") ;
	end
	outstanding_req_cnt4 = outstanding_req_cnt4 - 1;
    end
    if (`NCU.ncu_cpx_req_cq[4]) begin
	outstanding_req_cnt4 = outstanding_req_cnt4 + 1;
    end
end
always @(posedge `NCU.l2clk) begin
    if (`NCU.cpx_ncu_grant_cx[5]) begin
	if (outstanding_req_cnt5 <= 0)begin
		$display ("ERROR! %m outstanding_req_cnt5 will become negtive value") ;
	end
	outstanding_req_cnt5 = outstanding_req_cnt5 - 1;
    end
    if (`NCU.ncu_cpx_req_cq[5]) begin
	outstanding_req_cnt5 = outstanding_req_cnt5 + 1;
    end
end
always @(posedge `NCU.l2clk) begin
    if (`NCU.cpx_ncu_grant_cx[6]) begin
	if (outstanding_req_cnt6 <= 0)begin
		$display ("ERROR! %m outstanding_req_cnt6 will become negtive value") ;
	end
	outstanding_req_cnt6 = outstanding_req_cnt6 - 1;
    end
    if (`NCU.ncu_cpx_req_cq[6]) begin
	outstanding_req_cnt6 = outstanding_req_cnt6 + 1;
    end
end
always @(posedge `NCU.l2clk) begin
    if (`NCU.cpx_ncu_grant_cx[7]) begin
	if (outstanding_req_cnt7 <= 0)begin
		$display ("ERROR! %m outstanding_req_cnt7 will become negtive value") ;
	end
	outstanding_req_cnt7 = outstanding_req_cnt7 - 1;
    end
    if (`NCU.ncu_cpx_req_cq[7]) begin
	outstanding_req_cnt7 = outstanding_req_cnt7 + 1;
    end
end

endmodule
