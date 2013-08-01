// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_ffl_arbiter.v
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

/**********************************************************
***********************************************************

    Project         : Niu

    File name       : niu_ipp_ffl_arbiter.v

    Module(s) name  : niu_ipp_ffl_arbiter
    Original:       : ipp_arbiter.v main.32, label: IPP_RTL_2.3 IPP_VERIF_2.5 

    Parent modules  : niu_ipp_top.v

    Child modules   :           

    Author's name   : Jonathan Shen, George Chu

    Date            : Jan. 2002

    Description     : 4_to_1 round-robin arbiter for fflp.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_ipp_ffl_arbiter(
/****** input ******/
		  ipp_ffl_req0,
		  ipp_fflp_data0,
		  ipp_fflp_mac_default0,
		  ipp_fflp_dvalid0,
		  ipp_ffl_req1,
		  ipp_fflp_data1,
		  ipp_fflp_mac_default1,
		  ipp_fflp_dvalid1,
`ifdef NEPTUNE
		  ipp_ffl_req2,
		  ipp_fflp_data2,
		  ipp_fflp_mac_default2,
		  ipp_fflp_dvalid2,
		  ipp_ffl_req3,
		  ipp_fflp_data3,
		  ipp_fflp_mac_default3,
		  ipp_fflp_dvalid3,
`endif
                  reset, clk,
/****** output ******/
		  ffl_arb_ack0, 
		  ffl_arb_ack1, 
`ifdef NEPTUNE
		  ffl_arb_ack2, 
		  ffl_arb_ack3, 
`endif
		  ipp_fflp_dvalid,
		  ipp_fflp_data,
		  ipp_fflp_port,
		  ipp_fflp_mac_default
		  );

/* Zin arbiter
 -req ipp_ffl_req0 ipp_ffl_req1 ipp_ffl_req2 ipp_ffl_req3 
 -gnt ffl_arb_ack0_pre ffl_arb_ack1_pre ffl_arb_ack2_pre ffl_arb_ack3_pre 
 -clock clk -reset reset -message "IPP_FFL arbiter"
*/

input           ipp_ffl_req0;
input	[127:0]	ipp_fflp_data0;
input	[11:0]	ipp_fflp_mac_default0;
input		ipp_fflp_dvalid0;

input           ipp_ffl_req1;
input	[127:0]	ipp_fflp_data1;
input	[11:0]	ipp_fflp_mac_default1;
input		ipp_fflp_dvalid1;

`ifdef NEPTUNE
input           ipp_ffl_req2;
input	[127:0]	ipp_fflp_data2;
input	[11:0]	ipp_fflp_mac_default2;
input		ipp_fflp_dvalid2;

input           ipp_ffl_req3;
input	[127:0]	ipp_fflp_data3;
input	[11:0]	ipp_fflp_mac_default3;
input		ipp_fflp_dvalid3;
`endif

input           reset;
input		clk;

output		ffl_arb_ack0;
output		ffl_arb_ack1;
`ifdef NEPTUNE
output		ffl_arb_ack2;
output		ffl_arb_ack3;
`endif

output		ipp_fflp_dvalid;
output	[127:0]	ipp_fflp_data;
output	[1:0]	ipp_fflp_port;
output	[11:0]	ipp_fflp_mac_default;

reg		ffl_arb_ack0_pre;
reg		ffl_arb_ack1_pre;
`ifdef NEPTUNE
reg		ffl_arb_ack2_pre;
reg		ffl_arb_ack3_pre;
`endif
reg		ipp_fflp_dvalid_pre;
reg	[127:0] ipp_fflp_data_pre;
reg	[1:0]   ipp_fflp_port_pre;
reg	[11:0]	ipp_fflp_mac_default_pre;

wire            ffl_arb_ack0;
wire            ffl_arb_ack1;
`ifdef NEPTUNE
wire            ffl_arb_ack2;
wire            ffl_arb_ack3;
`endif
wire            ipp_fflp_dvalid;
wire    [127:0] ipp_fflp_data;
wire    [1:0]   ipp_fflp_port;
wire    [11:0]  ipp_fflp_mac_default;

`ifdef NEPTUNE
reg	[1:0]	cur_state;
reg     [1:0]   nex_state;

wire    [3:0]   sel;
assign  sel[0] = ffl_arb_ack0;
assign  sel[1] = ffl_arb_ack1;
assign  sel[2] = ffl_arb_ack2;
assign  sel[3] = ffl_arb_ack3;

parameter
StIpp0          = 2'h0,
StIpp1          = 2'h1,
StIpp2          = 2'h2,
StIpp3          = 2'h3;

/****** state machine ******/
// comb part

always @ (ipp_ffl_req0 or ipp_ffl_req1 or ipp_ffl_req2 or 
	  ipp_ffl_req3 or cur_state)
  begin
    ffl_arb_ack0_pre = 0;
    ffl_arb_ack1_pre = 0;
    ffl_arb_ack2_pre = 0;
    ffl_arb_ack3_pre = 0;

    case (cur_state)	// synopsys parallel_case full_case

      StIpp0:
	if (ipp_ffl_req0 == 1'h1)
	  begin
            ffl_arb_ack0_pre = 1;
            nex_state = cur_state;
          end
	else if (ipp_ffl_req1 == 1'h1)
            nex_state = StIpp1;
        else if (ipp_ffl_req2 == 1'h1)
            nex_state = StIpp2;
        else if (ipp_ffl_req3 == 1'h1)
            nex_state = StIpp3;
        else
            nex_state = StIpp0;

      StIpp1:
	if (ipp_ffl_req1 == 1'h1)
          begin
            ffl_arb_ack1_pre = 1;
            nex_state = cur_state;
          end
        else if (ipp_ffl_req2 == 1'h1)
            nex_state = StIpp2;
        else if (ipp_ffl_req3 == 1'h1)
            nex_state = StIpp3;
        else if (ipp_ffl_req0 == 1'h1)
            nex_state = StIpp0;
        else
            nex_state = StIpp1;

      StIpp2:
	if (ipp_ffl_req2 == 1'h1)
          begin
            ffl_arb_ack2_pre = 1;
            nex_state = cur_state;
          end
        else if (ipp_ffl_req3 == 1'h1)
            nex_state = StIpp3;
        else if (ipp_ffl_req0 == 1'h1)
            nex_state = StIpp0;
        else if (ipp_ffl_req1 == 1'h1)
            nex_state = StIpp1;
        else
            nex_state = StIpp2;

      StIpp3:
	if (ipp_ffl_req3 == 1'h1)
          begin
            ffl_arb_ack3_pre = 1;
            nex_state = cur_state;
          end
        else if (ipp_ffl_req0 == 1'h1)
            nex_state = StIpp0;
        else if (ipp_ffl_req1 == 1'h1)
            nex_state = StIpp1;
        else if (ipp_ffl_req2 == 1'h1)
            nex_state = StIpp2;
        else
            nex_state = StIpp3;

    endcase
  end

// seq part
always @ (posedge clk)
   if (reset)
      cur_state[1:0] <= 2'h0;
   else
      cur_state[1:0] <= nex_state[1:0];

/****** end of state machine ******/

/****** 4:1 mux for ipp_fflp_dvalid ******/
always @ (sel or ipp_fflp_dvalid0 or ipp_fflp_dvalid1 or ipp_fflp_dvalid2
	  or ipp_fflp_dvalid3)
  case (sel[3:0])       // synopsys parallel_case full_case
    4'b0001: ipp_fflp_dvalid_pre = ipp_fflp_dvalid0;
    4'b0010: ipp_fflp_dvalid_pre = ipp_fflp_dvalid1;
    4'b0100: ipp_fflp_dvalid_pre = ipp_fflp_dvalid2;
    4'b1000: ipp_fflp_dvalid_pre = ipp_fflp_dvalid3;
    default: ipp_fflp_dvalid_pre = ipp_fflp_dvalid0;
  endcase

/****** 4:1 mux for data ******/
always @ (sel or ipp_fflp_data0 or ipp_fflp_data1 or ipp_fflp_data2
	  or ipp_fflp_data3)
  case (sel[3:0])       // synopsys parallel_case full_case
    4'b0001: ipp_fflp_data_pre[127:0] = ipp_fflp_data0[127:0];
    4'b0010: ipp_fflp_data_pre[127:0] = ipp_fflp_data1[127:0];
    4'b0100: ipp_fflp_data_pre[127:0] = ipp_fflp_data2[127:0];
    4'b1000: ipp_fflp_data_pre[127:0] = ipp_fflp_data3[127:0];
    default: ipp_fflp_data_pre[127:0] = ipp_fflp_data0[127:0];
  endcase

/****** 4:1 mux port ******/
always @ (sel) 
  case (sel[3:0])       // synopsys parallel_case full_case
    4'b0001: ipp_fflp_port_pre[1:0] = 2'b00; 
    4'b0010: ipp_fflp_port_pre[1:0] = 2'b01;
    4'b0100: ipp_fflp_port_pre[1:0] = 2'b10;
    4'b1000: ipp_fflp_port_pre[1:0] = 2'b11;
    default: ipp_fflp_port_pre[1:0] = 2'b00;
  endcase

/****** 4:1 mux for mac_default ******/
always @ (sel or ipp_fflp_mac_default0 or ipp_fflp_mac_default1 or
	  ipp_fflp_mac_default2 or ipp_fflp_mac_default3)
  case (sel[3:0])       // synopsys parallel_case full_case
    4'b0001: ipp_fflp_mac_default_pre[11:0] = ipp_fflp_mac_default0[11:0];
    4'b0010: ipp_fflp_mac_default_pre[11:0] = ipp_fflp_mac_default1[11:0];
    4'b0100: ipp_fflp_mac_default_pre[11:0] = ipp_fflp_mac_default2[11:0];
    4'b1000: ipp_fflp_mac_default_pre[11:0] = ipp_fflp_mac_default3[11:0];
    default: ipp_fflp_mac_default_pre[11:0] = ipp_fflp_mac_default0[11:0];
  endcase

  assign ffl_arb_ack0         = ffl_arb_ack0_pre;
  assign ffl_arb_ack1         = ffl_arb_ack1_pre;
  assign ffl_arb_ack2         = ffl_arb_ack2_pre;
  assign ffl_arb_ack3         = ffl_arb_ack3_pre;
`else
reg	     	cur_state;
reg             nex_state;

wire    [1:0]   sel;
assign  sel[0] = ffl_arb_ack0;
assign  sel[1] = ffl_arb_ack1;

parameter
StIpp0          = 1'h0,
StIpp1          = 1'h1;

/****** state machine ******/
// comb part

always @ (ipp_ffl_req0 or ipp_ffl_req1 or 
	  cur_state)
  begin
    ffl_arb_ack0_pre = 0;
    ffl_arb_ack1_pre = 0;

    case (cur_state)	// synopsys parallel_case full_case

      StIpp0:
	if (ipp_ffl_req0 == 1'h1)
	  begin
            ffl_arb_ack0_pre = 1;
            nex_state = cur_state;
          end
	else if (ipp_ffl_req1 == 1'h1)
            nex_state = StIpp1;
        else
            nex_state = StIpp0;

      StIpp1:
	if (ipp_ffl_req1 == 1'h1)
          begin
            ffl_arb_ack1_pre = 1;
            nex_state = cur_state;
          end
        else if (ipp_ffl_req0 == 1'h1)
            nex_state = StIpp0;
        else
            nex_state = StIpp1;
    endcase
  end

// seq part
always @ (posedge clk)
   if (reset)
      cur_state      <= 1'h0;
   else
      cur_state      <= nex_state;

/****** end of state machine ******/

/****** 2:1 mux for ipp_fflp_dvalid ******/
always @ (sel or ipp_fflp_dvalid0 or ipp_fflp_dvalid1) 
  case (sel[1:0])       // synopsys parallel_case 
    2'b01: ipp_fflp_dvalid_pre = ipp_fflp_dvalid0;
    2'b10: ipp_fflp_dvalid_pre = ipp_fflp_dvalid1;
    default: ipp_fflp_dvalid_pre = ipp_fflp_dvalid0;
  endcase

/****** 2:1 mux for data ******/
always @ (sel or ipp_fflp_data0 or ipp_fflp_data1)
  case (sel[1:0])       // synopsys parallel_case 
    2'b01: ipp_fflp_data_pre[127:0] = ipp_fflp_data0[127:0];
    2'b10: ipp_fflp_data_pre[127:0] = ipp_fflp_data1[127:0];
    default: ipp_fflp_data_pre[127:0] = ipp_fflp_data0[127:0];
  endcase

/****** 2:1 mux port ******/
always @ (sel) 
  case (sel[1:0])       // synopsys parallel_case 
    2'b01: ipp_fflp_port_pre[1:0] = 2'b0; 
    2'b10: ipp_fflp_port_pre[1:0] = 2'b1;
    default: ipp_fflp_port_pre[1:0] = 2'b0;
  endcase

/****** 2:1 mux for mac_default ******/
always @ (sel or ipp_fflp_mac_default0 or ipp_fflp_mac_default1) 
  case (sel[1:0])       // synopsys parallel_case full_case
    2'b01: ipp_fflp_mac_default_pre[11:0] = ipp_fflp_mac_default0[11:0];
    2'b10: ipp_fflp_mac_default_pre[11:0] = ipp_fflp_mac_default1[11:0];
    default: ipp_fflp_mac_default_pre[11:0] = ipp_fflp_mac_default0[11:0];
  endcase

  assign ffl_arb_ack0         = ffl_arb_ack0_pre;
  assign ffl_arb_ack1         = ffl_arb_ack1_pre;
`endif

  ipp_reg_r_1   reg_r_1_dva   (.di(ipp_fflp_dvalid_pre),           .rs(reset),.ck(clk),.qo(ipp_fflp_dvalid));
  ipp_reg_r_128 reg_r_128_dat (.di(ipp_fflp_data_pre[127:0]),      .rs(reset),.ck(clk),.qo(ipp_fflp_data[127:0]));
  ipp_reg_r_2   reg_r_2_por   (.di(ipp_fflp_port_pre[1:0]),        .rs(reset),.ck(clk),.qo(ipp_fflp_port[1:0]));
  ipp_reg_r_12  reg_r_12_def  (.di(ipp_fflp_mac_default_pre[11:0]),.rs(reset),.ck(clk),.qo(ipp_fflp_mac_default[11:0]));

endmodule
