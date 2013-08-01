// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_lib.v
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
/*********************************************************
***********************************************************

    Project         : Vega

    File name       : niu_ipp_lib.v

    Module(s) name  : niu_ipp_lib
    Original:       : ipp_lib.v main.11, label:               

    Parent modules  : ipp.v

    Child modules   : 

    Author's name   : Jonathan Shen, George Chu

    Date            : Oct. 2001

    Description     : lib files

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module ipp_FD1(D, CP, Q);
input  D;
input  CP;
output Q;

reg state;

assign  Q = state;

always @(posedge CP)
  begin
    state <= D;
  end

endmodule // ipp_FD1


/***********************************
 *  ipp_RegDff
 ***********************************/
module  ipp_RegDff (din, clk, qout);

parameter dwidth = 32;
input 		clk;
input 	[dwidth-1:0] 	din;
output 	[dwidth-1:0] 	qout;

reg   	[dwidth-1:0]	qout;

always @ (posedge clk)
    qout <= din;


endmodule // ipp_RegDff


//*****************************
// Register ipp_xREG
//*****************************
module  ipp_xREG (din, clk, en, reset, qout);

parameter dwidth = 32;
input 		clk, en, reset;
input 	[dwidth-1:0] 	din;
output 	[dwidth-1:0] 	qout;

reg   	[dwidth-1:0] 	qout;

always @ (posedge clk)
  if (reset)
    qout <= 0;
  else if (en)
    qout <= din;
  else
    qout <= qout;
endmodule  // end of ipp_xREG


//*****************************
// Register ipp_RAC_Plus1_Reg
//*****************************
module  ipp_RAC_Plus1_Reg (clk, reset, iInc, iAutoClrEn, iMaxValue,
                 	   iLoad, iLoadValue, oDout, oMaxValueReached);

parameter dwidth = 21;
input              clk,reset; 	// global signals
input              iInc;	// Count Enable
input              iAutoClrEn;
input [dwidth-1:0] iMaxValue; 	// compared value
input              iLoad;
input [dwidth-1:0] iLoadValue; 	// compared value
output[dwidth-1:0] oDout;
output             oMaxValueReached;

reg   [dwidth-1:0] oDout;
wire oMaxValueReached = (oDout == iMaxValue);

always @ (posedge clk)
  if (reset | iAutoClrEn)
    oDout <= 0;
  else if (oMaxValueReached)
    oDout <= oDout;           // Stay at max value.
  else if (iInc)
    oDout <= oDout + 1;
  else if (iLoad)
    oDout <= iLoadValue;
  else
    oDout <= oDout;           // Hold the value.


endmodule  // end of ipp_RAC_Plus1_Reg


/************************************
* Rising edge pulse gen
*************************************/
module ipp_puls_gen (reset, clk, signal_in, puls_out);

input  reset, clk, signal_in;
output puls_out;

reg Q;

always @ (posedge clk)
if (reset)
   Q <= 0;
else
   Q <= signal_in;

wire Qb = ~Q;

wire puls_out = signal_in & Qb;

endmodule


/************************************
* Falling edge pulse gen
*************************************/
module ipp_falling_edge_puls_gen (reset, clk, signal_in, puls_out);

input  reset, clk, signal_in;	
output puls_out;

reg Q;

always @ (posedge clk)
if (reset)
   Q <= 0;
else
   Q <= signal_in;

wire puls_out = ~signal_in & Q;

endmodule


//*****************************
// ipp_PlsGen2
//*****************************
module ipp_PlsGen2 (sig_in, clk, lead, trail);
input 		sig_in, clk;
output 		lead, trail;

wire   		sig_in, sig_out; 
wire		lead, trail;

ipp_FD1 sig_out_FD1(.D(sig_in),.CP(clk),.Q(sig_out));

assign lead  =  sig_in & ~sig_out;
assign trail = ~sig_in &  sig_out;

endmodule // ipp_PlsGen2


//*****************************
// Reset Set Flip Flop
//*****************************
module ipp_RSFF (reset, clk, set, rst, Q);

input  reset, clk, set, rst;
output Q;

reg Q;

always @ (posedge clk)
if (reset)
    Q <= 0;
else
  casex({set, rst})
    2'b00: Q <= Q;
    2'bx1: Q <= 0;
    2'b10: Q <= 1;
  endcase

endmodule // end of Reset Set Flip Flop


//*****************************
// Register ipp_RAC_FF
//*****************************
module  ipp_RAC_FF (clk, reset, set, rst,
                    load, load_data, dout);

input           clk, reset; 		// global signals
input           set, rst;
input           load;
input           load_data; 		// compared value
output          dout;

reg      	dout;
  
always @ (posedge clk)
  if (reset | rst)
    dout <= 0;
  else if (set)
   dout  <= 1;
  else if (load)
    dout <= load_data;
  else
    dout <= dout;

endmodule // ipp_RAC_FF


/****************************************************************
*  ipp_phase_sm2: Use this state machine to count phases.
*****************************************************************/
module ipp_phase_sm2 (clk, reset, valid, rx_tag,
		  rd_eop, rd_status, cur_state);

input		clk;
input		reset;
input		valid;
input	[1:0]	rx_tag;

output	[1:0]	rd_eop;
output	[1:0]	rd_status;
output	[1:0]	cur_state;

reg	[1:0]	cur_state, nex_state;
reg	[1:0]	rd_eop;
reg	[1:0]	rd_status;

parameter	StIdle	     = 2'b00;
parameter	StWait1stTag = 2'b01;
parameter	StWait2ndTag = 2'b10;


// Comb part
always @ (valid or rx_tag or cur_state)
  begin
    rd_eop = 0;
    rd_status = 0;
    nex_state = 0;

    case (cur_state) // synopsys parallel_case full_case
	StIdle:					// 'h0
	  if (valid)
	      	nex_state = StWait1stTag;	// 'h1
	  else
	      	nex_state = cur_state;		// 'h0

	StWait1stTag:				// 'h1
	  casex (rx_tag[1:0])
	    2'b00:
	      	nex_state = cur_state;		// 'h1
	    2'b01:
	      begin
		nex_state = StIdle;		// 'h0
//		$display("ERROR: MAC status is ahead of end of packet at simtime = %d", $time);
	      end
	    2'b10:
	      begin
		nex_state = StWait2ndTag;	// 'h2
		rd_eop = 2'b10;
		rd_status = 2'b0;
	      end
	    2'b11:
	      begin
		nex_state = StIdle;		// 'h0
		rd_eop = 2'b11;
		rd_status = 2'b11;
	      end
	  endcase

	StWait2ndTag:				// 'h2
	  casex (rx_tag[0])
	    1'b0:
	      nex_state = cur_state;            // 'h2
	    1'b1: begin
	      rd_eop = 2'b0;
              rd_status = 2'b01;
              nex_state = StIdle;             	// 'h0
	    end
	  endcase
/*
	  if (rx_tag[1:0] == 2'b01)
	      begin
		rd_eop = 2'b0;
		rd_status = 2'b01;
	     	nex_state = StIdle;		// 'h0
	      end
	  else
	      nex_state = cur_state;		// 'h2
*/
	default:
	  nex_state = StIdle;
    endcase // end major endcase
  end  // end of comb part

// Seq part
always @ (posedge clk)
  if (reset)
      cur_state <= 2'b0;
  else
      cur_state <= nex_state;


endmodule // end of ipp_phase_sm2


module ipp_spare(di, reset, clk, qo);
input           di;
input           reset;
input           clk;
output          qo;

wire            qo;

  ipp_reg_r_1 ipp_reg_r_1_dum (.di(di), .rs(reset), .ck(clk), .qo(qo));

endmodule // ipp_spare


// =====================================================================
// This is a FSM for controlling IPP_EN
//  Original:       : ipp_en_rst_fsm in ipp.v main.70, label: IPP_VERIF_1.84

module niu_ipp_en_rst_fsm (clk, reset, ipp_enable,
		       wr_ipp_en_bit0, mac_stat, IFG,
		       rst_ipp_en, ipp_en_rst_fsm_curstate);

input		clk, reset;
input		ipp_enable;
input		wr_ipp_en_bit0;
input		mac_stat;
input		IFG;

output		rst_ipp_en;
output	[1:0]	ipp_en_rst_fsm_curstate;

reg	[1:0]	cur_state;
reg	[1:0]	nex_state;
reg		rst_ipp_en;

wire	[1:0]	ipp_en_rst_fsm_curstate = cur_state[1:0];

parameter
  StIdle        = 2'h0,
  StIppEn1      = 2'h1,
  StIppEn2      = 2'h2,
  StDly1        = 2'h3;

always @(cur_state or ipp_enable or wr_ipp_en_bit0 or mac_stat or IFG)
  begin
    rst_ipp_en = 1'b0;
    nex_state = 2'b0;

    casex(cur_state)	// synopsys parallel_case full_case
      StIdle:
	begin
	  if (ipp_enable)
	    nex_state = StIppEn1;
	  else
	    nex_state = cur_state;
	end

      StIppEn1:
	casex ({wr_ipp_en_bit0, IFG})
	  2'b0x: nex_state = cur_state;
	  2'b10: nex_state = StIppEn2;
	  2'b11: begin
		   nex_state = StDly1;
		   rst_ipp_en = 1'b1;
		 end
	endcase

      StIppEn2:
	begin
	  if (mac_stat)
	    begin
	      rst_ipp_en = 1'b1;
	      nex_state = StDly1;
	    end
	  else
	      nex_state = cur_state;   
	end

      StDly1:
	nex_state = StIdle;

    endcase
  end

always @(posedge clk)
  if (reset)
    cur_state <= 2'h0;
  else
    cur_state <= nex_state;

endmodule

// =====================================================================
module ipp_reg_r_1 (di, rs, ck, qo);
input           di;
input           rs;
input           ck;
output          qo;

reg             qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 1'h0;
      else
        qo <= #1 di;
    end

endmodule


module ipp_reg_r_2 (di, rs, ck, qo);
input     [1:0] di;
input           rs;
input           ck;
output    [1:0] qo;

reg       [1:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 2'h0;
      else
        qo <= #1 di[1:0];
    end

endmodule


module ipp_reg_r_10 (di, rs, ck, qo);
input     [9:0] di;
input           rs;
input           ck;
output    [9:0] qo;

reg       [9:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 10'h0;
      else
        qo <= #1 di[9:0];
    end

endmodule


module ipp_reg_r_11 (di, rs, ck, qo);
input    [10:0] di;
input           rs;
input           ck;
output   [10:0] qo;

reg      [10:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 11'h0;
      else
        qo <= #1 di[10:0];
    end

endmodule


module ipp_reg_r_12 (di, rs, ck, qo);
input    [11:0] di;
input           rs;
input           ck;
output   [11:0] qo;

reg      [11:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 12'h0;
      else
        qo <= #1 di[11:0];
    end

endmodule


module ipp_reg_r_16 (di, rs, ck, qo);
input    [15:0] di;
input           rs;
input           ck;
output   [15:0] qo;

reg      [15:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 16'h0;
      else
        qo <= #1 di[15:0];
    end

endmodule


module ipp_reg_r_128 (di, rs, ck, qo);
input   [127:0] di;
input           rs;
input           ck;
output  [127:0] qo;

reg     [127:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 128'h0;
      else
        qo <= #1 di[127:0];
    end

endmodule


module ipp_reg_r_130 (di, rs, ck, qo);
input   [129:0] di;
input           rs;
input           ck;
output  [129:0] qo;

reg     [129:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 130'h0;
      else
        qo <= #1 di[129:0];
    end

endmodule


module ipp_reg_w_r_32 (di, wr, rs, ck, qo);
input    [31:0] di;
input           wr;
input           rs;
input           ck;
output   [31:0] qo;

reg      [31:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 32'h0;
      else if (wr)
        qo <= #1 di[31:0];
      else
        qo <= #1 qo[31:0];
    end

endmodule


module ipp_reg_w_s_17 (di, wr, rs, ck, qo);
input    [16:0] di;
input           wr;
input           rs;
input           ck;
output   [16:0] qo;

reg      [16:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 17'h1_ffff;
      else if (wr)
        qo <= #1 di[16:0];
      else
        qo <= #1 qo[16:0];
    end

endmodule


module ipp_reg_w_sti_r_rac_1 (di, wr, rs, rac, ck, qo);
input           di;
input           wr;
input           rs;
input           rac;
input           ck;
output          qo;

reg             qo;
reg             wrote;

  always @(posedge ck)
    begin
      if      (rs || rac) begin
        qo    <= #1  1'h0;
        wrote <= #1  1'h0;
      end
      else if (wr && !wrote) begin
        qo    <= #1 di;
        wrote <= #1  1'h1;
      end
      else begin
        qo    <= #1 qo;
        wrote <= #1 wrote;
      end
    end

endmodule


module ipp_reg_w_sti_r_rac_5 (di, wr, rs, rac, ck, qo);
input     [4:0] di;
input           wr;
input           rs;
input           rac;
input           ck;
output    [4:0] qo;

reg       [4:0] qo;
reg             wrote;

  always @(posedge ck)
    begin
      if      (rs || rac) begin
        qo    <= #1  5'h0;
        wrote <= #1  1'h0;
      end
      else if (wr && !wrote) begin
        qo    <= #1 di[4:0];
        wrote <= #1  1'h1;
      end
      else begin
        qo    <= #1 qo[4:0];
        wrote <= #1 wrote;
      end
    end

endmodule


module ipp_reg_w_sti_r_rac_6 (di, wr, rs, rac, ck, qo);
input     [5:0] di;
input           wr;
input           rs;
input           rac;
input           ck;
output    [5:0] qo;

reg       [5:0] qo;
reg             wrote;

  always @(posedge ck)
    begin
      if      (rs || rac) begin
        qo    <= #1  6'h0;
        wrote <= #1  1'h0;
      end
      else if (wr && !wrote) begin
        qo    <= #1 di[5:0];
        wrote <= #1  1'h1;
      end
      else begin
        qo    <= #1 qo[5:0];
        wrote <= #1 wrote;
      end
    end

endmodule


module ipp_reg_w_sti_r_rac_11 (di, wr, rs, rac, ck, qo);
input    [10:0] di;
input           wr;
input           rs;
input           rac;
input           ck;
output   [10:0] qo;

reg      [10:0] qo;
reg             wrote;

  always @(posedge ck)
    begin
      if      (rs || rac) begin
        qo    <= #1 11'h0;
        wrote <= #1  1'h0;
      end
      else if (wr && !wrote) begin
        qo    <= #1 di[10:0];
        wrote <= #1  1'h1;
      end
      else begin
        qo    <= #1 qo[10:0];
        wrote <= #1 wrote;
      end
    end

endmodule


module ipp_reg_w_sti_r_rac_12 (di, wr, rs, rac, ck, qo);
input    [11:0] di;
input           wr;
input           rs;
input           rac;
input           ck;
output   [11:0] qo;

reg      [11:0] qo;
reg             wrote;

  always @(posedge ck)
    begin
      if      (rs || rac) begin
        qo    <= #1 12'h0;
        wrote <= #1  1'h0;
      end
      else if (wr && !wrote) begin
        qo    <= #1 di[11:0];
        wrote <= #1  1'h1;
      end
      else begin
        qo    <= #1 qo[11:0];
        wrote <= #1 wrote;
      end
    end

endmodule


module ipp_reg_w_sti_r_rac_16 (di, wr, rs, rac, ck, qo);
input    [15:0] di;
input           wr;
input           rs;
input           rac;
input           ck;
output   [15:0] qo;

reg      [15:0] qo;
reg             wrote;

  always @(posedge ck)
    begin
      if      (rs || rac) begin
        qo    <= #1 16'h0;
        wrote <= #1  1'h0;
      end
      else if (wr && !wrote) begin
        qo    <= #1 di[15:0];
        wrote <= #1  1'h1;
      end
      else begin
        qo    <= #1 qo[15:0];
        wrote <= #1 wrote;
      end
    end

endmodule


module niu_ipp_reset_blk (reset_l, clk, reset);

input           reset_l;
input           clk;
output          reset;

reg             reset;

wire            reset_p = !reset_l;

  always @(posedge clk)
    reset     <= #1 reset_p;

endmodule


