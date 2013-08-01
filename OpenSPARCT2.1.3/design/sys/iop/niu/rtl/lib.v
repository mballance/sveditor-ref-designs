// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lib.v
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
/*%W%	%G%*/
//*************************************************************************
//
// File Name    : lib.v
// Author Name  : John Lo
// Description  : This is a collection of library elements from big_mac, 
//                xmac, xpcs, pcs ... etc.
// Parent Module: many
// Child  Module: many
// Interface Mod: many
//
//  Copyright (c) 2008, Sun Microsystems, Inc. 
//  Sun Proprietary and Confidential   
//
//*************************************************************************

module CtsRoot (Z, A);

output Z;
input  A;

assign Z = A;

endmodule


/* -----------------------------------------------------------------------
 * If the 10 bit data stream is i,i,i,....,i,i,a,b,c,d,e,f,g, 
 *  the 20 bit interface can be one of the two:
 *  1. {a,i} -> {c,b} -> {e,d} -> {g,f}
 *  2. {b,a} -> {d,c} -> {f,e} -> {h,g}
 *
 * The a,b,c,d,e,f,g order remains the same between the above two data
 * -----------------------------------------------------------------------
 */

module mac_10to20 (
clk10b,
din10b,
clk20b,
dout20b
);
   input 	   clk10b;
   input  [9:0]    din10b;
   input 	   clk20b;
   output [19:0]   dout20b;
   
   wire   [9:0]    din10b;
   wire   [9:0]    din10b_lo;
   wire   [9:0]    din10b_hi;
   wire 	   clk;
   
`ifdef NEPTUNE
   CtsRoot clk_CtsRoot (.Z(clk),.A(clk20b));   
`else
   assign   clk = clk20b;
`endif

   RegDff #(10) din10b_hi_10to20_RegDff (.din(din10b),   .clk(clk10b),.qout(din10b_hi));
   RegDff #(10) din10b_lo_10to20_RegDff (.din(din10b_hi),.clk(clk10b),.qout(din10b_lo));
   
   RegDff #(20) dout20b_10to20_RegDff (.din({din10b_hi[9:0],din10b_lo[9:0]}),.clk(clk),.qout(dout20b[19:0]));   


endmodule // mac_10to20


module mac_20to10 (
FUNC_MODE,
clk20b,
din20b,
clk10b,
dout10b
);
   input           FUNC_MODE;
   input 	   clk20b;
   input  [19:0]   din20b;
   input 	   clk10b;
   output [9:0]    dout10b;
   
   wire   [19:0]   din20b;
   wire   [19:0]   din20b_reg;
   wire   [9:0]    dout10b;
   wire   [9:0]	   ddr_out;
   wire 	   clk;
   wire 	   clk_FUNC_MODE;
   
`ifdef NEPTUNE
   CtsRoot clk_CtsRoot (.Z(clk),.A(clk20b));   
`else
   assign  clk = clk20b;
`endif

   RegDff #(20) din_20to10_RegDff (.din(din20b[19:0]),.clk(clk),.qout(din20b_reg[19:0]));
   // SYNC RULE 3 of LV requirements to intercept offending path in LV_TM mode. 
   assign clk_FUNC_MODE = clk | (~FUNC_MODE); 
   assign ddr_out = clk_FUNC_MODE ? din20b_reg[9:0] :  din20b_reg[19:10];
   
   RegDff #(10) dout10b_20to10_RegDff (.din(ddr_out[9:0]),.clk(clk10b),.qout(dout10b[9:0]));   


endmodule // mac_20to10


// digitally delay 4 clk.
module DLY8CLK (
clk,
din,
dly4,
dly8
);
   
   input 	  clk;
   input 	  din;
   output 	  dly4;
   output 	  dly8;

   reg 		  dly1,dly2,dly3,dly4,dly5,dly6,dly7,dly8;
   
always @ (posedge clk)
  begin
     dly1  <=  din;
     dly2  <=  dly1;
     dly3  <=  dly2;
     dly4  <=  dly3;
     dly5  <=  dly4;
     dly6  <=  dly5;
     dly7  <=  dly6;
     dly8  <=  dly7;
  end
   
endmodule // DLY8CLK

module DIV4_CLK (
reset,
clk,
clk4		 
);
   
   input 	  reset;
   input 	  clk;
   output 	  clk4;
   
   wire 	  hw_reset_clk;
   wire 	  hw_reset_clk_lead;
   reg [1:0] 	  count;
   
   SYNC_CELL hw_reset_clk_SYNC_CELL(.D(reset),.CP(clk),.Q(hw_reset_clk));
   
   pls_gen hw_reset_clk_lead_pls_gen (.clk(clk),.in(hw_reset_clk),.out(hw_reset_clk_lead));
   

   always @ (posedge clk)
     if (hw_reset_clk_lead)
            count <= 0;
     else   count <= count + 1;
   
   assign   clk4   = count[1];
     
   
endmodule // DIV4_CLK

module DIV2_CLK (
reset,
clk,
clk2		 
);
   
   input 	  reset;
   input 	  clk;
   output 	  clk2;
   
   wire 	  hw_reset_clk;
   wire 	  hw_reset_clk_lead;
   
   SYNC_CELL hw_reset_clk_SYNC_CELL(.D(reset),.CP(clk),.Q(hw_reset_clk));
   
   pls_gen hw_reset_clk_lead_pls_gen (.clk(clk),.in(hw_reset_clk),.out(hw_reset_clk_lead));
   
   TFF clk2_TFF (.toggle(1'b1), 
                    .clk(clk),
                    .reset(hw_reset_clk_lead),
                    .qout(clk2));

endmodule // DIV2_CLK


/***********************************
 * Counter
 ***********************************/
module Counter (reset,clk,ce,count);
parameter dwidth = 9;
input reset,clk,ce;
output [dwidth-1:0] count;

reg   [dwidth-1:0] count;

always @ (posedge clk)
  if (reset)
    count <= 0;
  else
    casex(ce) // synopsys parallel_case full_case 
      1'b0: count <= count;
      1'b1: count <= count + 1;
    endcase
 
endmodule // Counter


//*****************************
// Set Reset Flip Flop
//*****************************
module SRFF (reset,clk,iSet,iRst,oQ);

input  reset, clk, iSet, iRst;
output oQ;

reg oQ;

always @ (posedge clk)
if (reset) 
   oQ <= 0;
else
   casex({iSet, iRst}) // synopsys parallel_case full_case 
      2'b00:  oQ <= oQ;
      2'b01:  oQ <= 0;
      2'b1x:  oQ <= 1;
   endcase

endmodule // end of Set Reset Flip Flop


//*****************************
// Reset Set Flip Flop
//*****************************   
module RSFF (reset,clk,iSet,iRst,oQ);

input  reset, clk, iSet, iRst;
output oQ;

reg oQ;

always @ (posedge clk)
if (reset) 
   oQ <= 0;
else
   casex({iSet, iRst}) // synopsys parallel_case full_case 
      2'b00:  oQ <= oQ;
      2'bx1:  oQ <= 0;
      2'b10:  oQ <= 1;
   endcase

endmodule // end of Reset Set Flip Flop


//*****************************
// Register xREG
//*****************************
module xREG (clk,reset,en,din,qout);
parameter dwidth = 10;
input clk, en, reset;
input [dwidth-1:0] din;
output [dwidth-1:0] qout;

reg   [dwidth-1:0] qout;

always @ (posedge clk)
  if (reset)
    qout <= 0;
  else if (en)
    qout <= din;
  else
    qout <= qout;


endmodule // end of xREG


//*****************************
// Register xREG2
//*****************************
module xREG2 (clk,reset,reset_value,load,din,qout);

   parameter dwidth = 10;
   input               clk;
   input               reset;
   input [dwidth-1:0]  reset_value;
   input 	       load;
   input [dwidth-1:0]  din;
   output [dwidth-1:0] qout;

   reg [dwidth-1:0]  qout;
   

always @ (posedge clk)
  if (reset)
    qout <= reset_value;
  else if (load)
    qout <= din;
  else
    qout <= qout;

endmodule // end of xREG2


//*****************************
// Register xREG3
//*****************************
module xREG3 (clk,reset,rst,en,din,qout);
parameter dwidth = 10;
input clk, en, reset, rst;
input [dwidth-1:0] din;
output [dwidth-1:0] qout;

reg   [dwidth-1:0] qout;

always @ (posedge clk)
  if (reset)
    qout <= 0;
  else if (rst)
    qout <= 0;
  else if (en)
    qout <= din;
  else
    qout <= qout;


endmodule // end of xREG3


/************************************
* Rising edge pulse gen
*************************************/
module PlsGen (reset,clk,iSigIn,oPlsOut);

input  reset, clk, iSigIn;
output oPlsOut;

reg Q;

always @ (posedge clk)
if (reset) 
   Q <= 0;
else
   Q <= iSigIn;

wire Qb = ~Q;

wire oPlsOut = iSigIn & Qb;

endmodule 




//*******************************
//  High Speed Loadable Counter
//*******************************
module hs_cntr_cell_X16 (
   // Outputs
   Q, 
   // Inputs
   clk, reset, cnt, clr, load, load_value
   );

   input               clk;
   input 	       reset;
   input 	       cnt;
   input 	       clr;
   input 	       load;
   input  [15:0]       load_value;
   output [15:0]       Q;

   wire [15:1] 	       toggle;
   reg  [15:0] 	       Q;

assign  toggle[15] = Q[14] & Q[13] & Q[12] & Q[11] & Q[10] & Q[9]  & Q[8]  & Q[7]  & Q[6]  & Q[5]  & Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[14] = Q[13] & Q[12] & Q[11] & Q[10] & Q[9]  & Q[8]  & Q[7]  & Q[6]  & Q[5]  & Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[13] = Q[12] & Q[11] & Q[10] & Q[9]  & Q[8]  & Q[7]  & Q[6]  & Q[5]  & Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[12] = Q[11] & Q[10] & Q[9]  & Q[8]  & Q[7]  & Q[6]  & Q[5]  & Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[11] = Q[10] & Q[9]  & Q[8]  & Q[7]  & Q[6]  & Q[5]  & Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[10] = Q[9]  & Q[8]  & Q[7]  & Q[6]  & Q[5]  & Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[9]  = Q[8]  & Q[7]  & Q[6]  & Q[5]  & Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[8]  = Q[7]  & Q[6]  & Q[5]  & Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[7]  = Q[6]  & Q[5]  & Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[6]  = Q[5]  & Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[5]  = Q[4]  & Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[4]  = Q[3]  & Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[3]  = Q[2]  & Q[1]  & Q[0]  ;
assign  toggle[2]  = Q[1]  & Q[0]  ;
assign  toggle[1]  = Q[0]  ;


always @ (posedge clk)
  if (reset | clr)
            Q     <= 16'b0;
  else if (load)
            Q     <= load_value[15:0];
  else if (cnt)
         begin
	    Q[15] <= toggle[15] ? ~Q[15] : Q[15];
	    Q[14] <= toggle[14] ? ~Q[14] : Q[14];
	    Q[13] <= toggle[13] ? ~Q[13] : Q[13];
	    Q[12] <= toggle[12] ? ~Q[12] : Q[12];
	    Q[11] <= toggle[11] ? ~Q[11] : Q[11];
	    Q[10] <= toggle[10] ? ~Q[10] : Q[10];
	    Q[9]  <= toggle[9]  ? ~Q[9]  : Q[9] ;
	    Q[8]  <= toggle[8]  ? ~Q[8]  : Q[8] ;
	    Q[7]  <= toggle[7]  ? ~Q[7]  : Q[7] ;
	    Q[6]  <= toggle[6]  ? ~Q[6]  : Q[6] ;
	    Q[5]  <= toggle[5]  ? ~Q[5]  : Q[5] ;
	    Q[4]  <= toggle[4]  ? ~Q[4]  : Q[4] ;
	    Q[3]  <= toggle[3]  ? ~Q[3]  : Q[3] ;
	    Q[2]  <= toggle[2]  ? ~Q[2]  : Q[2] ;
	    Q[1]  <= toggle[1]  ? ~Q[1]  : Q[1] ;
	    Q[0]  <=              ~Q[0]         ;
         end
  else  
            Q     <= Q;           // Hold the value.


endmodule // hs_cntr_cell_X16




//*******************************
//  High Speed Loadable Counter
//*******************************
module hs_ld_counter_X32 (
   // Outputs
   Q, max_value_reached, 
   // Inputs
   clk, reset, inc, clr, max_value, load, load_value
   );
   
   input              clk;
   input              reset;      // global signals
   input              inc;        // Count Enable
   input              clr;        // read auto clear input. 
   input [31:0]       max_value;  // compared value
   input              load;
   input  [31:0]      load_value; // compared value
   output [31:0]      Q ;
   output             max_value_reached;
 
   wire 	      inc_msb;
   wire 	      set_flag;
   wire [31:0]        max_value;
   wire [15:0] 	      Q1;
   wire [15:0]	      Q0;
   wire [31:0] 	      Q = {Q1[15:0],Q0[15:0]};
   wire 	      flag_lv;
   
   wire 	      max_value_reached = (max_value[31:0] == Q[31:0]);

   wire               inc_count = ~max_value_reached & inc;

   assign 	      set_flag = (Q0[15:0] == 16'hFFFE) & inc_count;

   SR_FF flag_count_SR_FF(.set(set_flag),
                          .rst(inc_msb),
                          .clk(clk),
                          .reset(reset | clr), // loj @6-16-06
                          .qout(flag_lv));

   // flag_lv = (Q0 == 16'hFFFF)
   assign 	     inc_msb = flag_lv & inc_count;
   
        

/* ----- counter instantiation ----- */   
hs_cntr_cell_X16 lsb_hs_cntr_cell_X16(
.clk(clk),
.reset(reset),
.cnt(inc_count),
.clr(clr),
.load(load),
.load_value(load_value[15:0]),
.Q(Q0[15:0])
);

hs_cntr_cell_X16 msb_hs_cntr_cell_X16(
.clk(clk),
.reset(reset),
.cnt(inc_msb),
.clr(clr),
.load(load),
.load_value(load_value[31:16]),
.Q(Q1[15:0])
);



endmodule // hs_ld_counter_X31



//*****************************
// Register RAC_FF
//*****************************
module RAC_FF (clk,reset,set,rst,
                 load,load_data,dout);

input              clk,reset ; // global signals
input 	           set,rst   ;
input              load      ;
input              load_data ; // compared value
output             dout      ;

   reg 		   dout;
   
always @ (posedge clk)
  if (reset | rst)
    dout <= 0;
  else if (set)
   dout  <= 1;
  else if (load)
    dout <= load_data;
  else 
    dout <= dout;

endmodule // RAC_FF






// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

/**********************************************************************
 * From here on are mainly for mac and xmac design
 * ********************************************************************/
 
/* ------------------------------ Flip-Flops ------------------------------- */


module FD1(CP, D, Q);

input CP, D;
output Q;

reg Q;

always @(posedge CP) Q <= D; 

endmodule // FD1

module FD1H(CP, D, Q);

input CP, D;
output Q;

reg Q;
// vlint flag_negedge_always_block off 
always @(negedge CP) Q <= D;
// vlint flag_negedge_always_block on 

endmodule // FD1H

 /* ----------------------- Synchronizers ----------------------------- */

/******************************************
 * The following SYNC_CELLs are used by mac
 ******************************************/
module SYNC_CELL(D,CP,Q);
 input  D;
 input  CP;
 output Q;

`ifdef NEPTUNE

reg Q,sync1;

always @ (posedge CP)
  begin
    sync1 <=  D;
    Q     <=  sync1;
  end        
  

`else

   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire so;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   
   
 cl_a1_clksyncff_4x SYNC_CELL (.l1clk(CP),
                               .d(D),
                               .si(1'b0),
                               .siclk(1'b0),
                               .soclk(1'b0),
                               .q(Q),
                               .so(so) );

`endif 
  
endmodule // SYNC_CELL

module FAST_SYNC_CELL(D,CP,Q);
 input  D;
 input  CP;
 output Q;

  reg Q,sync1;
  always @ (posedge CP)
    sync1 <=  D;

// vlint flag_negedge_always_block off 
  always @ (negedge CP)  // Negative edge clock
    Q     <=  sync1;
// vlint flag_negedge_always_block on 

endmodule // FAST_SYNC_CELL

module FAST_INV_SYNC_CELL(D,CP,Q);
 input  D;
 input  CP;
 output Q;

  reg Q,sync1;


// vlint flag_negedge_always_block off 
  always @ (negedge CP)
    sync1 <=  D;
// vlint flag_negedge_always_block on 

  always @ (posedge CP)
    Q     <=  sync1;

endmodule // FAST_INV_SYNC_CELL

//*****************************
//* SYNC_MOD
//*****************************
module SYNC_PLS (src_pls,src_clk,src_reset,des_clk,out_pls);
   input  src_pls;
   input  src_clk;
   input  src_reset; // power on reset
   input  des_clk;
   output out_pls;

   wire   sr_ff_2_sync_cell,src_rst_internal,des_level_out;

   SR_FF SR_FF_u1(.set(src_pls),
                  .rst(src_rst_internal),
                  .clk(src_clk),
                  .reset(src_reset),
                  .qout(sr_ff_2_sync_cell));
   
   SYNC_CELL go_to_des_SYNC_CELL  (.D(sr_ff_2_sync_cell),.CP(des_clk),
                                   .Q(des_level_out));
   
   SYNC_CELL back_to_src_SYNC_CELL(.D(des_level_out),.CP(src_clk),
                                   .Q(src_rst_internal));
   
   pls_gen pls_gen_u6(.clk(des_clk),.in(des_level_out),.out(out_pls));
   
endmodule // SYNC_PLS


/******************************************
 * The following SYNC_CELLs are used by pcs
 ******************************************/

/*
** NEC library dependent wrapper for SYNC generic
*/
module SYNCREG (qout, clk, din);
//non-resettable variable width register 
//only one Q output

output qout;
input clk;
input din; 

SYNC_CELL PCS_SYNC_CELL(.D(din),.CP(clk),.Q(qout));

endmodule
 

module SYNCREG16 (qout, clk, din);
//non-resettable variable width register 
//only one Q output

output [15:0] qout;
input clk;
input [15:0] din; 

SYNCREG R_SYNC_0(.din(din[0]),    .clk(clk), .qout(qout[0]));

SYNCREG R_SYNC_1(.din(din[1]),    .clk(clk), .qout(qout[1]));

SYNCREG R_SYNC_2(.din(din[2]),    .clk(clk), .qout(qout[2]));

SYNCREG R_SYNC_3(.din(din[3]),    .clk(clk), .qout(qout[3]));

SYNCREG R_SYNC_4(.din(din[4]),    .clk(clk), .qout(qout[4]));

SYNCREG R_SYNC_5(.din(din[5]),    .clk(clk), .qout(qout[5]));

SYNCREG R_SYNC_6(.din(din[6]),    .clk(clk), .qout(qout[6]));

SYNCREG R_SYNC_7(.din(din[7]),    .clk(clk), .qout(qout[7]));

SYNCREG R_SYNC_8(.din(din[8]),    .clk(clk), .qout(qout[8]));

SYNCREG R_SYNC_9(.din(din[9]),    .clk(clk), .qout(qout[9]));

SYNCREG R_SYNC_10(.din(din[10]),    .clk(clk), .qout(qout[10]));

SYNCREG R_SYNC_11(.din(din[11]),    .clk(clk), .qout(qout[11]));

SYNCREG R_SYNC_12(.din(din[12]),    .clk(clk), .qout(qout[12]));

SYNCREG R_SYNC_13(.din(din[13]),    .clk(clk), .qout(qout[13]));

SYNCREG R_SYNC_14(.din(din[14]),    .clk(clk), .qout(qout[14]));

SYNCREG R_SYNC_15(.din(din[15]),    .clk(clk), .qout(qout[15]));

endmodule

// @(#)SYNCREG17.v	1.2 06/07/99
module SYNCREG17 (qout, clk, din);
//non-resettable variable width register 
//only one Q output

output [16:0] qout;
input clk;
input [16:0] din; 

SYNCREG R_SYNC_0(.din(din[0]),    .clk(clk),	.qout(qout[0]));

SYNCREG R_SYNC_1(.din(din[1]),    .clk(clk),	.qout(qout[1]));

SYNCREG R_SYNC_2(.din(din[2]),    .clk(clk),	.qout(qout[2]));

SYNCREG R_SYNC_3(.din(din[3]),    .clk(clk),	.qout(qout[3]));

SYNCREG R_SYNC_4(.din(din[4]),    .clk(clk),	.qout(qout[4]));

SYNCREG R_SYNC_5(.din(din[5]),    .clk(clk),	.qout(qout[5]));

SYNCREG R_SYNC_6(.din(din[6]),    .clk(clk),	.qout(qout[6]));

SYNCREG R_SYNC_7(.din(din[7]),    .clk(clk),	.qout(qout[7]));

SYNCREG R_SYNC_8(.din(din[8]),    .clk(clk),	.qout(qout[8]));

SYNCREG R_SYNC_9(.din(din[9]),    .clk(clk),	.qout(qout[9]));

SYNCREG R_SYNC_10(.din(din[10]),    .clk(clk),	.qout(qout[10]));

SYNCREG R_SYNC_11(.din(din[11]),    .clk(clk),	.qout(qout[11]));

SYNCREG R_SYNC_12(.din(din[12]),    .clk(clk),	.qout(qout[12]));

SYNCREG R_SYNC_13(.din(din[13]),    .clk(clk),	.qout(qout[13]));

SYNCREG R_SYNC_14(.din(din[14]),    .clk(clk),	.qout(qout[14]));

SYNCREG R_SYNC_15(.din(din[15]),    .clk(clk),	.qout(qout[15]));

SYNCREG R_SYNC_16(.din(din[16]),    .clk(clk),	.qout(qout[16]));

endmodule


// @(#)SYNCREG22.v	1.2 06/07/99
module SYNCREG22 (qout, clk, din);
//non-resettable variable width register 
//only one Q output

output [21:0] qout;
input clk;
input [21:0] din; 

SYNCREG R_SYNC_0(.din(din[0]),    .clk(clk),	.qout(qout[0]));

SYNCREG R_SYNC_1(.din(din[1]),    .clk(clk),	.qout(qout[1]));

SYNCREG R_SYNC_2(.din(din[2]),    .clk(clk),	.qout(qout[2]));

SYNCREG R_SYNC_3(.din(din[3]),    .clk(clk),	.qout(qout[3]));

SYNCREG R_SYNC_4(.din(din[4]),    .clk(clk),	.qout(qout[4]));

SYNCREG R_SYNC_5(.din(din[5]),    .clk(clk),	.qout(qout[5]));

SYNCREG R_SYNC_6(.din(din[6]),    .clk(clk),	.qout(qout[6]));

SYNCREG R_SYNC_7(.din(din[7]),    .clk(clk),	.qout(qout[7]));

SYNCREG R_SYNC_8(.din(din[8]),    .clk(clk),	.qout(qout[8]));

SYNCREG R_SYNC_9(.din(din[9]),    .clk(clk),	.qout(qout[9]));

SYNCREG R_SYNC_10(.din(din[10]),    .clk(clk),	.qout(qout[10]));

SYNCREG R_SYNC_11(.din(din[11]),    .clk(clk),	.qout(qout[11]));

SYNCREG R_SYNC_12(.din(din[12]),    .clk(clk),	.qout(qout[12]));

SYNCREG R_SYNC_13(.din(din[13]),    .clk(clk),	.qout(qout[13]));

SYNCREG R_SYNC_14(.din(din[14]),    .clk(clk),	.qout(qout[14]));

SYNCREG R_SYNC_15(.din(din[15]),    .clk(clk),	.qout(qout[15]));

SYNCREG R_SYNC_16(.din(din[16]),    .clk(clk),	.qout(qout[16]));

SYNCREG R_SYNC_17(.din(din[17]),    .clk(clk),	.qout(qout[17]));

SYNCREG R_SYNC_18(.din(din[18]),    .clk(clk),	.qout(qout[18]));

SYNCREG R_SYNC_19(.din(din[19]),    .clk(clk),	.qout(qout[19]));

SYNCREG R_SYNC_20(.din(din[20]),    .clk(clk),	.qout(qout[20]));

SYNCREG R_SYNC_21(.din(din[21]),    .clk(clk),	.qout(qout[21]));

endmodule


// @(#)SYNCREG6.v	1.2 06/07/99
module SYNCREG6 (qout, clk, din);
//non-resettable variable width register 
//only one Q output

output [5:0] qout;
input clk;
input [5:0] din; 

SYNCREG R_SYNC_0(.din(din[0]),    .clk(clk), .qout(qout[0]));

SYNCREG R_SYNC_1(.din(din[1]),    .clk(clk), .qout(qout[1]));

SYNCREG R_SYNC_2(.din(din[2]),    .clk(clk), .qout(qout[2]));

SYNCREG R_SYNC_3(.din(din[3]),    .clk(clk), .qout(qout[3]));

SYNCREG R_SYNC_4(.din(din[4]),    .clk(clk), .qout(qout[4]));

SYNCREG R_SYNC_5(.din(din[5]),    .clk(clk), .qout(qout[5]));

endmodule

 /* -----------------end of Synchronizers ----------------------------- */


 /* ------------------------- Registers ------------------------------- */

module register_X8(clk,din,dout);
 input         clk;
 input  [7:0]  din;
 output [7:0]  dout;


   wire [7:0]  din;
   reg  [7:0]  dout;
   
always @ (posedge clk)
    dout <= din;

endmodule // register_X8



module register_X8_inv(clk,din,dout);
 input         clk;
 input  [7:0]  din;
 output [7:0]  dout;

   wire        clk_n = ~clk;
   wire [7:0]  din;
   reg  [7:0]  dout;
   
always @ (posedge clk_n)
    dout <= din;

endmodule // register_X8_inv


module register_X10(clk,din,dout);
 input        clk;
 input  [9:0] din;
 output [9:0] dout;


   wire [9:0]  din;
   reg  [9:0]  dout;
   
always @ (posedge clk)
    dout <= din;


endmodule // register_X10

module register_X14(clk,din,dout);
 input         clk;
 input  [13:0] din;
 output [13:0] dout;

   wire [13:0] din;
   reg  [13:0] dout;
   
always @ (posedge clk)
    dout <= din;


endmodule

module register_X15(clk,din,dout); 
 input         clk; 
 input  [14:0] din; 
 output [14:0] dout;
 
   wire [14:0]  din;
   reg  [14:0]  dout;
   
always @ (posedge clk)
    dout <= din;

 
endmodule

module register_X16(clk,din,dout);
 input         clk;
 input  [15:0] din;
 output [15:0] dout;

   wire [15:0]  din;
   reg  [15:0]  dout;
   
always @ (posedge clk)
    dout <= din;


endmodule // register_X16

module register_X17(clk,din,dout);
 input        clk;
 input  [16:0] din;
 output [16:0] dout;

   wire [16:0]  din;
   reg  [16:0]  dout;
   
always @ (posedge clk)
    dout <= din;

 
endmodule // register_X17

module register_X32(clk,din,dout,dout_n);
 input         clk;
 input  [31:0] din;
 output [31:0] dout;
 output [31:0] dout_n;


   wire [31:0]  din;
   wire [31:0]  dout_n;
   reg  [31:0]  dout;
   
always @ (posedge clk)
    dout <= din;


 assign dout_n = ~dout;

endmodule // register_X32


module register_load_X4(clk,load,din,dout);
 input         clk;
 input         load;
 input  [3:0]  din;
 output [3:0]  dout;

   wire        clk;
   wire        load;
   wire [3:0]  din;
   reg  [3:0]  dout;

 always @ (posedge clk)
   if (load)
     dout <= din;
   else
     dout <= dout;

endmodule

module register_load_X8(clk,load,din,dout);
 input         clk;
 input         load;
 input  [7:0]  din;
 output [7:0]  dout;

   wire        clk;
   wire        load;
   wire [7:0]  din;
   reg  [7:0]  dout;

 always @ (posedge clk)
   if (load)
     dout <= din;
   else
     dout <= dout;

endmodule // register_load_X8

module register_load_X10(clk,load,din,dout);
 input         clk;
 input         load;
 input  [9:0]  din;
 output [9:0]  dout;

   wire        clk;
   wire        load;
   wire [9:0]  din;
   reg  [9:0]  dout;

 always @ (posedge clk)
   if (load)
     dout <= din;
   else
     dout <= dout;

endmodule // register_load_X10

module register_load_X14(clk,load,din,dout);
 input         clk;
 input         load;
 input  [13:0] din;
 output [13:0] dout;

   wire        clk;
   wire        load;
   wire [13:0] din;
   reg  [13:0] dout;

 always @ (posedge clk)
   if (load)
     dout <= din;
   else
     dout <= dout;

endmodule // register_load_X14


module register_load_X15(clk,load,din,dout);
 input         clk;
 input         load;
 input  [14:0] din;
 output [14:0] dout;

   wire        clk;
   wire        load;
   wire [14:0] din;
   reg  [14:0] dout;

 always @ (posedge clk)
   if (load)
     dout <= din;
   else
     dout <= dout;

endmodule // register_load_X15



module register_load_X16(clk,load,din,dout);
 input         clk;
 input         load;
 input  [15:0] din;
 output [15:0] dout;

   wire        clk;
   wire        load;
   wire [15:0] din;
   reg  [15:0] dout;

 always @ (posedge clk)
   if (load)
     dout <= din;
   else
     dout <= dout;
 
endmodule // register_load_X16

module register_load_X17(clk,load,din,dout);
 input         clk;
 input         load;
 input  [16:0] din;
 output [16:0] dout;

   wire        clk;
   wire        load;
   wire [16:0] din;
   reg  [16:0] dout;

 always @ (posedge clk)
   if (load)
     dout <= din;
   else
     dout <= dout;

   
endmodule // register_load_X17

module register_load_X64(clk,load,din,dout);
 input         clk;
 input         load;
 input  [63:0] din;
 output [63:0] dout;

   wire        clk;
   wire        load;
   wire [63:0] din;
   reg  [63:0] dout;

 always @ (posedge clk)
   if (load)
     dout <= din;
   else
     dout <= dout;

endmodule


module register_load_X66(clk,load,din,dout);
 input         clk;
 input         load;
 input  [65:0] din;
 output [65:0] dout;

   wire        clk;
   wire        load;
   wire [65:0] din;
   reg  [65:0] dout;

 always @ (posedge clk)
   if (load)
     dout <= din;
   else
     dout <= dout;

endmodule // register_load_X66



 /* ------------------------------- Pipelines ------------------------------- */
module pipeline_4X8(clk,din,dout);
 input        clk;
 input  [7:0] din;
 output [7:0] dout;

 wire [7:0] stage0_dout,stage1_dout,stage2_dout;

 register_X8 STAGE0(clk,din,stage0_dout);
 register_X8 STAGE1(clk,stage0_dout,stage1_dout);
 register_X8 STAGE2(clk,stage1_dout,stage2_dout);
 register_X8 STAGE3(clk,stage2_dout,dout);

endmodule

module bit_shifter_en_ld_X32(reset,clk,ld_en,shift_en,shift_in,din,shift_out,dout);
 input         reset;
 input         clk;
 input         ld_en;
 input         shift_en;
 input         shift_in;
 input  [31:0] din;
 output        shift_out;
 output [31:0] dout;


   wire        shift_in;
   wire        shift_out;
   wire [31:0] din;
   reg  [31:0] dout;
   
always @ (posedge clk)
  if (reset)
             dout     <= 0;
  else if (ld_en)
             dout     <= din;
  else if (shift_en)
           begin
             dout[0 ] <= shift_in;
             dout[1 ] <= dout[0 ];
             dout[2 ] <= dout[1 ];
             dout[3 ] <= dout[2 ];
             dout[4 ] <= dout[3 ];
             dout[5 ] <= dout[4 ];
             dout[6 ] <= dout[5 ];
             dout[7 ] <= dout[6 ];
             dout[8 ] <= dout[7 ];
             dout[9 ] <= dout[8 ];
             dout[10] <= dout[9 ];
             dout[11] <= dout[10];
             dout[12] <= dout[11];
             dout[13] <= dout[12];
             dout[14] <= dout[13];
             dout[15] <= dout[14];
             dout[16] <= dout[15];
             dout[17] <= dout[16];
             dout[18] <= dout[17];
             dout[19] <= dout[18];
             dout[20] <= dout[19];
             dout[21] <= dout[20];
             dout[22] <= dout[21];
             dout[23] <= dout[22];
             dout[24] <= dout[23];
             dout[25] <= dout[24];
             dout[26] <= dout[25];
             dout[27] <= dout[26];
             dout[28] <= dout[27];
             dout[29] <= dout[28];
             dout[30] <= dout[29];
             dout[31] <= dout[30];
           end			      

 assign   shift_out = dout[31];


endmodule // bit_shifter_en_ld_X32

module nibble_shifter_X16(clk,din,dout);
 input         clk;
 input   [3:0] din;
 output [15:0] dout;

 FD1 FD1_0(.D(din[0]),.CP(clk),.Q(dout[0]));
 FD1 FD1_1(.D(din[1]),.CP(clk),.Q(dout[1]));
 FD1 FD1_2(.D(din[2]),.CP(clk),.Q(dout[2]));
 FD1 FD1_3(.D(din[3]),.CP(clk),.Q(dout[3]));
 FD1 FD1_4(.D(dout[0]),.CP(clk),.Q(dout[4]));
 FD1 FD1_5(.D(dout[1]),.CP(clk),.Q(dout[5]));
 FD1 FD1_6(.D(dout[2]),.CP(clk),.Q(dout[6]));
 FD1 FD1_7(.D(dout[3]),.CP(clk),.Q(dout[7]));
 FD1 FD1_8(.D(dout[4]),.CP(clk),.Q(dout[8]));
 FD1 FD1_9(.D(dout[5]),.CP(clk),.Q(dout[9]));
 FD1 FD1_10(.D(dout[6]),.CP(clk),.Q(dout[10]));
 FD1 FD1_11(.D(dout[7]),.CP(clk),.Q(dout[11]));
 FD1 FD1_12(.D(dout[8]),.CP(clk),.Q(dout[12]));
 FD1 FD1_13(.D(dout[9]),.CP(clk),.Q(dout[13]));
 FD1 FD1_14(.D(dout[10]),.CP(clk),.Q(dout[14]));
 FD1 FD1_15(.D(dout[11]),.CP(clk),.Q(dout[15]));

endmodule // nibble_shifter_X16

module byte_shifter_X16(clk,din,dout); // for fedx
 input         clk;
 input   [7:0] din;
 output [15:0] dout;

 wire [7:0] stage0_dout,stage1_dout;

 register_X8 STAGE0(clk,din,stage0_dout);
 register_X8 STAGE1(clk,stage0_dout,stage1_dout);

 assign dout = {stage0_dout,stage1_dout};

endmodule // byte_shifter_X16

module byte_shifter_X64(clk,din,dout); // for cassini
 input         clk;
 input   [7:0] din;
 output [63:0] dout;

 wire [7:0] stage0_dout,stage1_dout,stage2_dout,stage3_dout,
            stage4_dout,stage5_dout,stage6_dout,stage7_dout;

 register_X8 STAGE0(clk,din,stage0_dout);
 register_X8 STAGE1(clk,stage0_dout,stage1_dout);
 register_X8 STAGE2(clk,stage1_dout,stage2_dout);
 register_X8 STAGE3(clk,stage2_dout,stage3_dout);
 register_X8 STAGE4(clk,stage3_dout,stage4_dout);
 register_X8 STAGE5(clk,stage4_dout,stage5_dout);
 register_X8 STAGE6(clk,stage5_dout,stage6_dout);
 register_X8 STAGE7(clk,stage6_dout,stage7_dout);

 assign dout = {stage0_dout,stage1_dout,stage2_dout,stage3_dout,
                stage4_dout,stage5_dout,stage6_dout,stage7_dout
               };

endmodule

 /* -------------------------------- Counters ------------------------------- */       
   
module counter_X2(clk,clr,enable,count);
 input        clk;
 input        clr;
 input        enable;
 output [1:0] count;

 reg    [1:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;

endmodule // counter_X2

module counter_X3(clk,clr,enable,count);
 input        clk;
 input        clr;
 input        enable;
 output [2:0] count;

 reg    [2:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;

endmodule // counter_X3

module counter_X4(clk,clr,enable,count);
 input        clk;
 input        clr;
 input        enable;
 output [3:0] count;

 reg    [3:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;

endmodule // counter_X4

module counter_X5(clk,clr,enable,count);
 input        clk;
 input        clr;
 input        enable;
 output [4:0] count;

 reg    [4:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;

endmodule // counter_X5

module counter_X6(clk,clr,enable,count);
 input        clk;
 input        clr;
 input        enable;
 output [5:0] count;

 reg    [5:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;

endmodule // counter_X6

module counter_X8(clk,clr,enable,count);
 input        clk;
 input        clr;
 input        enable;
 output [7:0] count;

 reg    [7:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;

endmodule // counter_X8

module counter_X10(clk,clr,enable,count);
 input        clk;
 input        clr;
 input        enable;
 output [9:0] count;

 reg    [9:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;

endmodule // counter_X10

module counter_X12(clk,clr,enable,count);
 input         clk;
 input         clr;
 input         enable;
 output [11:0] count;


 reg    [11:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;

   
endmodule // counter_X12

module counter_X14(clk,clr,enable,count);
 input         clk;
 input         clr;
 input         enable;
 output [13:0] count;

 reg    [13:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;


endmodule // counter_X14


module counter_X15(clk,clr,enable,count);
 input         clk;
 input         clr;
 input         enable;
 output [14:0] count;


 reg    [14:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;


endmodule


module counter_X16(clk,clr,enable,count);
 input         clk;
 input         clr;
 input         enable;
 output [15:0] count;


 reg    [15:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (enable) count <= count + 1;
   else             count <= count;


endmodule // counter_X16



module counter_load_X8(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [7:0]  din;
 output [7:0]  count;

 reg    [7:0]  count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count + 1;
   else             count <= count;

endmodule // counter_load_X8

module counter_rac_load_X8(clk,clr,enable,load,din,count);
 input        clk;
 input        clr;
 input        enable;
 input        load;
 input  [7:0] din;
 output [7:0] count;

 reg    [7:0] count;

always @ (posedge clk)
   if      (clr)      count <= 0;
   else if (load)     count <= din;
   else if (enable & (count != {8{1'b1}}))
                      count <= count + 1;
   else               count <= count;


endmodule // counter_rac_load_X8

module counter_load_X10(clk,clr,enable,load,din,count);
 input        clk;
 input        clr;
 input        enable;
 input        load;
 input  [9:0] din;
 output [9:0] count;


 reg    [9:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count + 1;
   else             count <= count;


endmodule // counter_load_X10

module counter_ld_dn_X15(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [14:0] din;
 output [14:0] count;


 reg    [14:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count - 1;
   else             count <= count;


endmodule // counter_ld_dn_X15


module counter_load_X16(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [15:0] din;
 output [15:0] count;

 reg    [15:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count + 1;
   else             count <= count;


endmodule // counter_load_X16

module counter_rac_load_X16(clk,clr,enable,load,din,count);
 input         clk; 
 input         clr;
 input         enable;
 input         load;
 input  [15:0] din;
 output [15:0] count;


 reg    [15:0] count;

always @ (posedge clk)
   if      (clr)      count <= 0;
   else if (load)     count <= din;
   else if (enable & (count != {16{1'b1}}))
                      count <= count + 1;
   else               count <= count;

 
endmodule // counter_rac_load_X16

module counter_load_X17(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [16:0] din;
 output [16:0] count;
 
 reg    [16:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count + 1;
   else             count <= count;

 
endmodule // counter_load_X17

module counter_rac_load_X17(clk,clr,enable,load,din,count);
 input         clk; 
 input         clr;
 input         enable;
 input         load;
 input  [16:0] din;
 output [16:0] count;


 reg    [16:0] count;

always @ (posedge clk)
   if      (clr)      count <= 0;
   else if (load)     count <= din;
   else if (enable & (count != {17{1'b1}}))
                      count <= count + 1;
   else               count <= count;


endmodule // counter_rac_load_X17

module counter_load_X18(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [17:0] din;
 output [17:0] count;
 
 reg    [17:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count + 1;
   else             count <= count;


endmodule // counter_load_X18

module counter_rac_load_X18(clk,clr,enable,load,din,count);
 input         clk; 
 input         clr;
 input         enable;
 input         load;
 input  [17:0] din;
 output [17:0] count;


 reg    [17:0] count;

always @ (posedge clk)
   if      (clr)      count <= 0;
   else if (load)     count <= din;
   else if (enable & (count != {18{1'b1}}))
                      count <= count + 1;
   else               count <= count;


endmodule // counter_rac_load_X18

module counter_load_X19(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [18:0] din;
 output [18:0] count;
 
 reg    [18:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count + 1;
   else             count <= count;

 
endmodule // counter_load_X19

module counter_rac_load_X19(clk,clr,enable,load,din,count);
 input         clk; 
 input         clr;
 input         enable;
 input         load;
 input  [18:0] din;
 output [18:0] count;


 reg    [18:0] count;

always @ (posedge clk)
   if      (clr)      count <= 0;
   else if (load)     count <= din;
   else if (enable & (count != {19{1'b1}}))
                      count <= count + 1;
   else               count <= count;

 
endmodule // counter_rac_load_X19


module counter_rac_load_X20(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [19:0] din;
 output [19:0] count;
 

 reg    [19:0] count;

always @ (posedge clk)
   if      (clr)      count <= 0;
   else if (load)     count <= din;
   else if (enable & (count != {20{1'b1}}))
                      count <= count + 1;
   else               count <= count;


endmodule // counter_rac_load_X20

module counter_load_X21(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [20:0] din;
 output [20:0] count;

 reg    [20:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count + 1;
   else             count <= count;


endmodule // counter_load_X21

module counter_rac_load_X21(clk,clr,enable,load,din,count);
 input         clk; 
 input         clr;
 input         enable;
 input         load;
 input  [20:0] din;
 output [20:0] count;


 reg    [20:0] count;

always @ (posedge clk)
   if      (clr)      count <= 0;
   else if (load)     count <= din;
   else if (enable & (count != {21{1'b1}}))
                      count <= count + 1;
   else               count <= count;

 
endmodule // counter_rac_load_X21

module counter_load_X24(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [23:0] din;
 output [23:0] count;
 
 reg    [23:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count + 1;
   else             count <= count;


endmodule // counter_load_X24

module counter_rac_load_X24(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [23:0] din;
 output [23:0] count;
 

 reg    [23:0] count;

always @ (posedge clk)
   if      (clr)      count <= 0;
   else if (load)     count <= din;
   else if (enable & (count != {24{1'b1}}))
                      count <= count + 1;
   else               count <= count;


endmodule // counter_rac_load_X24

module counter_load_X27(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [26:0] din;
 output [26:0] count;
 
 reg    [26:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count + 1;
   else             count <= count;

 
endmodule // counter_load_X27

module counter_rac_load_X27(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [26:0] din;
 output [26:0] count;


 reg    [26:0] count;

always @ (posedge clk)
   if      (clr)      count <= 0;
   else if (load)     count <= din;
   else if (enable & (count != {27{1'b1}}))
                      count <= count + 1;
   else               count <= count;


endmodule // counter_rac_load_X27

/* ------------------------------------------------------------------------- */

module counter_ld_dn_X16(clk,clr,enable,load,din,count);
 input         clk;
 input         clr;
 input         enable;
 input         load;
 input  [15:0] din;
 output [15:0] count;


 reg    [15:0] count;

always @ (posedge clk)
   if      (clr)    count <= 0;
   else if (load)   count <= din;
   else if (enable) count <= count - 1;
   else             count <= count;


endmodule // counter_ld_dn_X16


module inc_1_2_3_4(clk,clr,inc1,inc2,inc3,inc4,count);
 input        clk;
 input        clr;
 input        inc1;
 input        inc2;
 input        inc3;
 input        inc4;
 output [2:0] count;
 
 wire [2:0] new_count;
 
 function [2:0] counter_logic;
  input       clr;
  input       inc1;
  input       inc2;
  input       inc3;
  input       inc4;
  input [2:0] count;
  reg   [2:0] new_count;
  begin
   if (clr)     new_count = 3'h0;
   else
    begin
     case ({inc1,inc2,inc3,inc4}) // synopsys parallel_case full_case 
      4'h0: new_count = count;
      4'h1: new_count = count + 3'h1;
      4'h2: new_count = count + 3'h1;
      4'h3: new_count = count + 3'h2;
      4'h4: new_count = count + 3'h1;
      4'h5: new_count = count + 3'h2;
      4'h6: new_count = count + 3'h2;
      4'h7: new_count = count + 3'h3;
      4'h8: new_count = count + 3'h1;
      4'h9: new_count = count + 3'h2;
      4'hA: new_count = count + 3'h2;
      4'hB: new_count = count + 3'h3;
      4'hC: new_count = count + 3'h2;
      4'hD: new_count = count + 3'h3;
      4'hE: new_count = count + 3'h3;
      4'hF: new_count = count + 3'h4;
     endcase
    end
   counter_logic = new_count;
  end
 endfunction
 assign new_count = counter_logic(clr,inc1,inc2,inc3,inc4,count);
 
 RegDff #(3) inc_1_2_3_4_RegDff(.din(new_count),.clk(clk),.qout(count));
 
endmodule // inc_1_2_3_4


module inc_1_2_3_4_5_6_7_8(clk,clr,inc1,inc2,inc3,inc4,inc5,inc6,inc7,inc8,count);
 input        clk;
 input        clr;
 input        inc1;
 input        inc2;
 input        inc3;
 input        inc4;
 input        inc5;
 input        inc6;
 input        inc7;
 input        inc8;
 output [2:0] count;

 wire [2:0] new_count;
 wire [2:0] add_count_1;
 wire [2:0] add_count_2;

 function [2:0] counter_logic_1;
  input       inc1;
  input       inc2;
  input       inc3;
  input       inc4;
  reg   [2:0] add_count_1;
  begin
   begin
    case ({inc1,inc2,inc3,inc4}) // synopsys parallel_case full_case 
     4'h0: add_count_1 = 3'h0;
     4'h1: add_count_1 = 3'h1;
     4'h2: add_count_1 = 3'h1;
     4'h3: add_count_1 = 3'h2;
     4'h4: add_count_1 = 3'h1;
     4'h5: add_count_1 = 3'h2;
     4'h6: add_count_1 = 3'h2;
     4'h7: add_count_1 = 3'h3;
     4'h8: add_count_1 = 3'h1;
     4'h9: add_count_1 = 3'h2;
     4'hA: add_count_1 = 3'h2;
     4'hB: add_count_1 = 3'h3;
     4'hC: add_count_1 = 3'h2;
     4'hD: add_count_1 = 3'h3;
     4'hE: add_count_1 = 3'h3;
     4'hF: add_count_1 = 3'h4;
    endcase
   end
   counter_logic_1 = add_count_1;
  end
 endfunction
 assign add_count_1 = counter_logic_1(inc1,inc2,inc3,inc4);

 function [2:0] counter_logic_2;
  input       inc5;
  input       inc6;
  input       inc7;
  input       inc8;
  reg   [2:0] add_count_2;
  begin
   begin
    case ({inc5,inc6,inc7,inc8}) // synopsys parallel_case full_case 
     4'h0: add_count_2 = 3'h0;
     4'h1: add_count_2 = 3'h1;
     4'h2: add_count_2 = 3'h1;
     4'h3: add_count_2 = 3'h2;
     4'h4: add_count_2 = 3'h1;
     4'h5: add_count_2 = 3'h2;
     4'h6: add_count_2 = 3'h2;
     4'h7: add_count_2 = 3'h3;
     4'h8: add_count_2 = 3'h1;
     4'h9: add_count_2 = 3'h2;
     4'hA: add_count_2 = 3'h2;
     4'hB: add_count_2 = 3'h3;
     4'hC: add_count_2 = 3'h2;
     4'hD: add_count_2 = 3'h3;
     4'hE: add_count_2 = 3'h3;
     4'hF: add_count_2 = 3'h4;
    endcase
   end
   counter_logic_2 = add_count_2;
  end
 endfunction
 assign add_count_2 = counter_logic_2(inc5,inc6,inc7,inc8);

 function [2:0] counter_logic_3;
  input       clr;
  input [2:0] add_count_1;
  input [2:0] add_count_2;
  input [2:0] count;
  reg   [2:0] new_count;
  begin
   if (clr) new_count = 3'h0;
   else     new_count = count + add_count_1 + add_count_2;
   counter_logic_3 = new_count;
  end
 endfunction
 assign new_count = counter_logic_3(clr,add_count_1,add_count_2,count);

 RegDff #(3) inc_1_2_3_4_5_6_7_8_RegDff(.din(new_count),.clk(clk),.qout(count));

endmodule // inc_1_2_3_4_5_6_7_8

module counter_udh_X3(clk,clr,enable_up,enable_down,count);
 input        clk;
 input        clr;
 input        enable_up;
 input        enable_down;
 output [2:0] count;

 reg    [2:0] count;

always @ (posedge clk)
     if      (clr)                               
                     count <= 0;
     else if (enable_up & !enable_down & (count != 3'h7))
                     count <= count + 1;
     else if (!enable_up & enable_down & (count != 3'h0))
                     count <= count - 1;
     else            count <= count;

endmodule // counter_udh_X3



module inc_1_16(clk,clr,inc1,inc2,inc3,inc4,inc5,inc6,inc7,inc8,inc9,inc10,inc11,
                inc12,inc13,inc14,inc15,inc16,count);
 input        clk;
 input        clr;
 input        inc1;
 input        inc2;
 input        inc3;
 input        inc4;
 input        inc5;
 input        inc6;
 input        inc7;
 input        inc8;
 input        inc9;
 input        inc10;
 input        inc11;
 input        inc12;
 input        inc13;
 input        inc14;
 input        inc15;
 input        inc16;
 output [3:0] count;

 wire [2:0] count_1;
 wire [2:0] count_2;
 wire [2:0] count_3;
 wire [2:0] count_4;
 wire [3:0] add_1;
 wire [3:0] add_2;
 wire [3:0] add_3;
 wire [3:0] new_count;

 function [2:0] encoder_1;
  input       inc1;
  input       inc2;
  input       inc3;
  input       inc4;
  reg   [2:0] count_1;
  begin
   begin
    case ({inc1,inc2,inc3,inc4}) // synopsys parallel_case full_case 
     4'h0: count_1 = 3'h0;
     4'h1: count_1 = 3'h1;
     4'h2: count_1 = 3'h1;
     4'h3: count_1 = 3'h2;
     4'h4: count_1 = 3'h1;
     4'h5: count_1 = 3'h2;
     4'h6: count_1 = 3'h2;
     4'h7: count_1 = 3'h3;
     4'h8: count_1 = 3'h1;
     4'h9: count_1 = 3'h2;
     4'hA: count_1 = 3'h2;
     4'hB: count_1 = 3'h3;
     4'hC: count_1 = 3'h2;
     4'hD: count_1 = 3'h3;
     4'hE: count_1 = 3'h3;
     4'hF: count_1 = 3'h4;
    endcase
   end
   encoder_1 = count_1;
  end
 endfunction
 assign count_1 = encoder_1(inc1,inc2,inc3,inc4);

 function [2:0] encoder_2;
  input       inc5;
  input       inc6;
  input       inc7;
  input       inc8;
  reg   [2:0] count_2;
  begin
   begin
    case ({inc5,inc6,inc7,inc8}) // synopsys parallel_case full_case 
     4'h0: count_2 = 3'h0;
     4'h1: count_2 = 3'h1;
     4'h2: count_2 = 3'h1;
     4'h3: count_2 = 3'h2;
     4'h4: count_2 = 3'h1;
     4'h5: count_2 = 3'h2;
     4'h6: count_2 = 3'h2;
     4'h7: count_2 = 3'h3;
     4'h8: count_2 = 3'h1;
     4'h9: count_2 = 3'h2;
     4'hA: count_2 = 3'h2;
     4'hB: count_2 = 3'h3;
     4'hC: count_2 = 3'h2;
     4'hD: count_2 = 3'h3;
     4'hE: count_2 = 3'h3;
     4'hF: count_2 = 3'h4;
    endcase
   end
   encoder_2 = count_2;
  end
 endfunction
 assign count_2 = encoder_2(inc5,inc6,inc7,inc8);

 function [2:0] encoder_3;
  input       inc9;
  input       inc10;
  input       inc11;
  input       inc12;
  reg   [2:0] count_3;
  begin
   begin
    case ({inc9,inc10,inc11,inc12}) // synopsys parallel_case full_case 
     4'h0: count_3 = 3'h0;
     4'h1: count_3 = 3'h1;
     4'h2: count_3 = 3'h1;
     4'h3: count_3 = 3'h2;
     4'h4: count_3 = 3'h1;
     4'h5: count_3 = 3'h2;
     4'h6: count_3 = 3'h2;
     4'h7: count_3 = 3'h3;
     4'h8: count_3 = 3'h1;
     4'h9: count_3 = 3'h2;
     4'hA: count_3 = 3'h2;
     4'hB: count_3 = 3'h3;
     4'hC: count_3 = 3'h2;
     4'hD: count_3 = 3'h3;
     4'hE: count_3 = 3'h3;
     4'hF: count_3 = 3'h4;
    endcase
   end
   encoder_3 = count_3;
  end
 endfunction
 assign count_3 = encoder_3(inc9,inc10,inc11,inc12);

 function [2:0] encoder_4;
  input       inc13;
  input       inc14;
  input       inc15;
  input       inc16;
  reg   [2:0] count_4;
  begin
   begin
    case ({inc13,inc14,inc15,inc16}) // synopsys parallel_case full_case 
     4'h0: count_4 = 3'h0;
     4'h1: count_4 = 3'h1;
     4'h2: count_4 = 3'h1;
     4'h3: count_4 = 3'h2;
     4'h4: count_4 = 3'h1;
     4'h5: count_4 = 3'h2;
     4'h6: count_4 = 3'h2;
     4'h7: count_4 = 3'h3;
     4'h8: count_4 = 3'h1;
     4'h9: count_4 = 3'h2;
     4'hA: count_4 = 3'h2;
     4'hB: count_4 = 3'h3;
     4'hC: count_4 = 3'h2;
     4'hD: count_4 = 3'h3;
     4'hE: count_4 = 3'h3;
     4'hF: count_4 = 3'h4;
    endcase
   end
   encoder_4 = count_4;
  end
 endfunction
 assign count_4 = encoder_4(inc13,inc14,inc15,inc16);

 assign add_1 = {1'b0,count_1} + {1'b0,count_2};
 assign add_2 = {1'b0,count_3} + {1'b0,count_4};
 assign add_3 = add_1 + add_2;

 assign new_count = clr ? 4'h0 : (count + add_3);

 RegDff #(4) inc_1_16_RegDff(.din(new_count),.clk(clk),.qout(count));


endmodule // inc_1_16


module counter_udh_X4(clk,clr,enable_up,enable_down,count);
 input        clk;
 input        clr;
 input        enable_up;
 input        enable_down;
 output [3:0] count;

 reg    [3:0] count;

always @ (posedge clk)
     if      (clr)                               
                     count <= 0;
     else if (enable_up & !enable_down & (count != 4'hF))
                     count <= count + 1;
     else if (!enable_up & enable_down & (count != 4'h0))
                     count <= count - 1;
     else            count <= count;

endmodule // counter_udh_X4


module inc_1_2_dec_1(clk,clr,inc1,inc2,dec,count);
 input        clk;
 input        clr;
 input        inc1;
 input        inc2;
 input        dec;
 output [1:0] count;

 wire [1:0] new_count;

 function [1:0] counter_logic;
  input       clr;
  input       inc1;
  input       inc2;
  input       dec;
  input [1:0] count;
  reg   [1:0] new_count;
  begin
   if (clr)     new_count = 2'h0;
   else
    begin
     case ({inc1,inc2,dec})       // synopsys parallel_case full_case 
      3'h0: new_count = count;
      3'h1: new_count = count - 2'h1;
      3'h2: new_count = count + 2'h1;
      3'h3: new_count = count;
      3'h4: new_count = count + 2'h1;
      3'h5: new_count = count;
      3'h6: new_count = count + 2'h2;
      3'h7: new_count = count + 2'h1;
     endcase
    end
   counter_logic = new_count;
  end
 endfunction
 assign new_count = counter_logic(clr,inc1,inc2,dec,count);

 FD1 FD1_0(.D(new_count[0]),.CP(clk),.Q(count[0]));
 FD1 FD1_1(.D(new_count[1]),.CP(clk),.Q(count[1]));

endmodule // inc_1_2_dec_1


/* ------------- ---------- Muxes --------------------------------- */
module xMUX_2to1 (din0,din1,sel,dout);
// variable width row of 2 to 1 muxes; active high output

parameter dwidth = 4;
input  [dwidth-1:0] din0;
input  [dwidth-1:0] din1;
input 	            sel;
output [dwidth-1:0] dout;


   wire [dwidth-1:0]   din0;
   wire [dwidth-1:0]   din1;
   wire 	       sel;
   reg [dwidth-1:0]    dout;

  always @ (sel or din0 or din1)
    begin:xMUX_2to1
       case (sel) // synopsys parallel_case full_case 
	 1'b0: dout = din0;
	 1'b1: dout = din1;
       endcase
    end
 
endmodule // end of xMUX_2to1 



module xMUX_3to1(dout,sel,din0,din1,din2);
// variable width row of 3 to 1 muxes; active high output
parameter dwidth = 2;
   output [dwidth-1:0] dout;
   input [1:0]	       sel;
   input [dwidth-1:0]  din0;
   input [dwidth-1:0]  din1;
   input [dwidth-1:0]  din2;
   

   wire [dwidth-1:0]   din0;
   wire [dwidth-1:0]   din1;
   wire [dwidth-1:0]   din2;
   wire [1:0]	       sel;
   reg  [dwidth-1:0]   dout;

  always @ (sel or din0 or din1 or din2)
    begin:xMUX_3to1
       case (sel) // synopsys parallel_case full_case 
	 2'b00: dout = din0;
	 2'b01: dout = din1;
	 2'b10: dout = din2;
	 2'b11: dout = din2;
       endcase
    end

endmodule


 
module xMUX_4to1 (din0,din1,din2,din3,sel,dout);
// variable width row of 4 to 1 muxes; active high output
parameter dwidth = 2;
   output [dwidth-1:0] dout;
   input [1:0]	       sel;
   input [dwidth-1:0]  din0;
   input [dwidth-1:0]  din1;
   input [dwidth-1:0]  din2;
   input [dwidth-1:0]  din3;
   

   wire [dwidth-1:0]   din0;
   wire [dwidth-1:0]   din1;
   wire [dwidth-1:0]   din2;
   wire [dwidth-1:0]   din3;
   wire [1:0]	       sel;
   reg  [dwidth-1:0]   dout;

  always @ (sel or din0 or din1 or din2 or din3)
    begin:xMUX_4to1
       case (sel) // synopsys parallel_case full_case 
	 2'b00: dout = din0;
	 2'b01: dout = din1;
	 2'b10: dout = din2;
	 2'b11: dout = din3;
       endcase
    end

 
endmodule // xMUX_4to1


module xMUX_6to1  (dout,sel,din0,din1,din2,din3,din4,din5);
// variable width row of 6 to 1 muxes; active high output
parameter dwidth = 2;
   output [dwidth-1:0] dout;
   input [2:0]	       sel;
   input [dwidth-1:0]  din0;
   input [dwidth-1:0]  din1;
   input [dwidth-1:0]  din2;
   input [dwidth-1:0]  din3;
   input [dwidth-1:0]  din4;
   input [dwidth-1:0]  din5;
   

   wire [dwidth-1:0]   din0;
   wire [dwidth-1:0]   din1;
   wire [dwidth-1:0]   din2;
   wire [dwidth-1:0]   din3;
   wire [dwidth-1:0]   din4;
   wire [dwidth-1:0]   din5;
   wire [2:0]	       sel;
   reg  [dwidth-1:0]   dout;

  always @ (sel or din0 or din1 or din2 or din3 or din4 or din5)
    begin:xMUX_6to1
       case (sel) // synopsys parallel_case full_case 
	 3'h0: dout = din0;
	 3'h1: dout = din1;
	 3'h2: dout = din2;
	 3'h3: dout = din3;
	 3'h4: dout = din4;
	 3'h5: dout = din5;
	 default:  dout= din0;
       endcase
    end


endmodule


module func_mux1(dout, select, din1, din0);
 input         select;
 input         din1, din0;
 output        dout;

   wire        din0;
   wire        din1;
   wire        select;


`ifdef NEPTUNE   
   reg 	       dout;
  always @ (select or din1 or din0)
    begin :func_mux
       case (select) // synopsys parallel_case full_case infer_mux
	 1'b0: dout = din0;
	 1'b1: dout = din1;
       endcase
    end
   
`else // n2
   wire dout;
//  wire        dout = select ? din1 : din0;
//  sel0 is negative signal so the din1 and din0 are swapped.
cl_a1_clk_mux2_8x n2_FUNC_MUX (
                                 .in0(din1),
                                 .in1(din0),
                                 .sel0(select),
                                 .out(dout)
                                );

`endif
   
endmodule // func_mux1

 
module lv_mux1(dout, select, din1, din0);
 input         select;
 input         din1, din0;
 output        dout;

   wire        din0;
   wire        din1;
   wire        select;

   
`ifdef NEPTUNE   
   reg 	       dout;
  always @ (select or din1 or din0)
    begin :lv_mux
       case (select) // synopsys parallel_case full_case infer_mux
	 1'b0: dout = din0;
	 1'b1: dout = din1;
       endcase
    end
   
`else // n2
   wire dout;
//  wire        dout = select ? din1 : din0;
//  sel0 is negative signal so the din1 and din0 are swapped.
cl_a1_clk_mux2_8x n2_LV_MUX (
                                 .in0(din1),
                                 .in1(din0),
                                 .sel0(select),
                                 .out(dout)
                                );

`endif
   
endmodule // lv_mux1
 

module mux_2_1_X1(dout, select, din1, din0);
 input         select;
 input         din1, din0;
 output        dout;

   wire        din0;
   wire        din1;
   wire        select;
   reg 	       dout;

  always @ (select or din1 or din0)
    begin :mux_2_1_X1
       case (select) // synopsys parallel_case full_case 
	 1'b0: dout = din0;
	 1'b1: dout = din1;
       endcase
    end
  
endmodule // mux_2_1_X1
 

// by loj
module mux_2_1_X2(dout, select, din1, din0);
 input         select;
 input  [1:0]  din1, din0;
 output [1:0]  dout;

   wire  [1:0]      din0;
   wire  [1:0]      din1;
   wire             select;
   reg 	 [1:0]      dout;

  always @ (select or din1 or din0)
    begin :mux_2_1_X2
       case (select) // synopsys parallel_case full_case 
	 1'b0: dout = din0;
	 1'b1: dout = din1;
       endcase
    end

endmodule // mux_2_1_X2


module mux_2_1_X4(dout, select, din1, din0);
 input         select;
 input  [3:0]  din1, din0;
 output [3:0]  dout;

   wire  [3:0]      din0;
   wire  [3:0]      din1;
   wire             select;
   reg 	 [3:0]      dout;

  always @ (select or din1 or din0)
    begin :mux_2_1_X4
       case (select) // synopsys parallel_case full_case 
	 1'b0: dout = din0;
	 1'b1: dout = din1;
       endcase
    end

endmodule // mux_2_1_X4

module mux_821_X16(din0,din1,din2,din3,din4,din5,din6,din7,select,dout);
  input   [2:0] select;
  input  [15:0] din0,din1,din2,din3,din4,din5,din6,din7;
  output [15:0] dout;

  wire   [2:0]  select;
  wire   [15:0] din0,din1,din2,din3,din4,din5,din6,din7;
  reg    [15:0] dout_reg;

always @ (/*AUTOSENSE*/din0 or din1 or din2 or din3 or din4 or din5
	  or din6 or din7 or select)
  begin: mux_821_X16
    case (select) // synopsys parallel_case full_case 
     3'h0: dout_reg = din0;
     3'h1: dout_reg = din1;
     3'h2: dout_reg = din2;
     3'h3: dout_reg = din3;
     3'h4: dout_reg = din4;
     3'h5: dout_reg = din5;
     3'h6: dout_reg = din6;
     3'h7: dout_reg = din7;
    endcase
  end

endmodule // mux_821_X16

module mux_821_X17(din0,din1,din2,din3,din4,din5,din6,din7,select,dout);
  input   [2:0]  select;
  input   [16:0] din0,din1,din2,din3,din4,din5,din6,din7;
  output  [16:0] dout;

  wire   [2:0] select;
  wire  [16:0] din0,din1,din2,din3,din4,din5,din6,din7;
  reg   [16:0] dout;

always @ (/*AUTOSENSE*/din0 or din1 or din2 or din3 or din4 or din5
	  or din6 or din7 or select)
    begin:mux_821_X17
      case (select)      // synopsys parallel_case full_case 
        3'h0: dout = din0;
        3'h1: dout = din1;
        3'h2: dout = din2;
        3'h3: dout = din3;
        3'h4: dout = din4;
        3'h5: dout = din5;
        3'h6: dout = din6;
        3'h7: dout = din7;
      endcase
     end 

endmodule // mux_821_X17

module mux_421_X64(din0,din1,din2,din3,select,dout);
  input   [1:0]  select;
  input   [63:0] din0,din1,din2,din3;
  output  [63:0] dout;

  wire    [1:0]  select;
  wire    [63:0] din0,din1,din2,din3;
  reg     [63:0] dout;

always @ (/*AUTOSENSE*/din0 or din1 or din2 or din3 or select)
  begin:mux_421_X64
    case (select) // synopsys parallel_case full_case                               
     2'h0: dout = din0;
     2'h1: dout = din1;
     2'h2: dout = din2;
     2'h3: dout = din3;
    endcase
  end

endmodule // mux_421_X64


module mux_821_X64(din0,din1,din2,din3,din4,din5,din6,din7,select,dout);
  input   [2:0]  select;
  input   [63:0] din0,din1,din2,din3,din4,din5,din6,din7;
  output  [63:0] dout;

  wire    [2:0]  select;
  wire    [63:0] din0,din1,din2,din3,din4,din5,din6,din7;
  reg     [63:0] dout;

always @ (/*AUTOSENSE*/din0 or din1 or din2 or din3 or din4 or din5
	  or din6 or din7 or select)
  begin:mux_821_X64
    case (select) // synopsys parallel_case full_case 
     3'h0: dout = din0;
     3'h1: dout = din1;
     3'h2: dout = din2;
     3'h3: dout = din3;
     3'h4: dout = din4;
     3'h5: dout = din5;
     3'h6: dout = din6;
     3'h7: dout = din7;
    endcase
  end

endmodule // mux_821_X64


module mux_1621_X65(din0,din1,din2,din3,din4,din5,din6,din7,din8,din9,din10,
                    din11,din12,din13,din14,din15,select,dout);
  input   [3:0]  select;
  input   [64:0] din0,din1,din2,din3,din4,din5,din6,din7,din8,din9,din10,din11,
                 din12,din13,din14,din15;
  output  [64:0] dout;

  wire    [3:0]  select;
  wire    [64:0] din0,din1,din2,din3,din4,din5,din6,din7,din8,din9,din10,din11,
                 din12,din13,din14,din15;
  reg     [64:0] dout;

always @ (/*AUTOSENSE*/din0 or din1 or din10 or din11 or din12
	  or din13 or din14 or din15 or din2 or din3 or din4 or din5
	  or din6 or din7 or din8 or din9 or select)
    begin:mux_1621_X65
      case (select) // synopsys parallel_case full_case 
        4'h0: dout = din0;
        4'h1: dout = din1;
        4'h2: dout = din2;
        4'h3: dout = din3;
        4'h4: dout = din4;
        4'h5: dout = din5;
        4'h6: dout = din6;
        4'h7: dout = din7;
        4'h8: dout = din8;
        4'h9: dout = din9;
        4'hA: dout = din10;
        4'hB: dout = din11;
        4'hC: dout = din12;
        4'hD: dout = din13;
        4'hE: dout = din14;
        4'hF: dout = din15;
      endcase
    end 

endmodule // mux_1621_X65

module mux_1621_X66(din0,din1,din2,din3,din4,din5,din6,din7,din8,din9,din10,
                    din11,din12,din13,din14,din15,select,dout);
 input   [3:0]  select;
 input   [65:0] din0,din1,din2,din3,din4,din5,din6,din7,din8,din9,din10,din11,
                din12,din13,din14,din15;
 output  [65:0] dout;

 wire    [3:0]  select;
 wire    [65:0] din0,din1,din2,din3,din4,din5,din6,din7,din8,din9,din10,din11,
                din12,din13,din14,din15;
 reg     [65:0] dout;

always @ (/*AUTOSENSE*/din0 or din1 or din10 or din11 or din12
	  or din13 or din14 or din15 or din2 or din3 or din4 or din5
	  or din6 or din7 or din8 or din9 or select)
    begin:mux_1621_X66
      case (select) // synopsys parallel_case full_case 
        4'h0: dout = din0;
        4'h1: dout = din1;
        4'h2: dout = din2;
        4'h3: dout = din3;
        4'h4: dout = din4;
        4'h5: dout = din5;
        4'h6: dout = din6;
        4'h7: dout = din7;
        4'h8: dout = din8;
        4'h9: dout = din9;
        4'hA: dout = din10;
        4'hB: dout = din11;
        4'hC: dout = din12;
        4'hD: dout = din13;
        4'hE: dout = din14;
        4'hF: dout = din15;
      endcase
    end 

endmodule // mux_1621_X65


 /* ------ end of big_mac stuff --------------------------------------- */

module RS_FF (set,rst,clk,reset,qout);
input  set,rst,clk,reset;
output qout;

reg qout;

always @ (posedge clk)
if (reset) 
   qout <= 0;
else
   casex({set, rst})
      2'b00:  qout <= qout;// hold
      2'bx1:  qout <= 0;   // rst
      2'b10:  qout <= 1;   // set
   endcase

endmodule // RS_FF

module SR_FF (set,rst,clk,reset,qout);
input  set,rst,clk,reset;
output qout;

reg qout;

always @ (posedge clk)
if (reset) 
   qout <= 0;
else
   casex({set, rst})
      2'b00:  qout <= qout;// hold
      2'b01:  qout <= 0;   // rst
      2'b1x:  qout <= 1;   // set
   endcase

endmodule // SR_FF



module TFF (toggle,clk,reset,qout);
input  toggle,clk,reset;
output qout;

reg qout;

always @ (posedge clk)
if (reset) 
   qout <= 0;
else
   casex(toggle)
      1'b0:  qout <= qout; // hold
      1'b1:  qout <= ~qout;// toggle
   endcase

endmodule // TFF

//*****************************
//* Leading Edge Digital Pulse Generator
//*****************************

module pls_gen (clk,in,out);
   input  clk;
   input  in;
   output out;
   
   wire   Qb;
   wire   out;
   reg 	  Q;
   
   
   always @ (posedge clk)
	     Q <= in;

   assign Qb = ~Q;
   assign out = in & Qb;
   
endmodule // pls_gen

//*****************************
//* Trailing Edge Digital Pulse Generator
//*****************************

module pls_gen_trail (clk,in,out);
   input  clk;
   input  in;
   output out;
   
   wire   out;
   reg 	  Q;
   
   
   always @ (posedge clk)
	     Q <= in;

   assign out = ~in & Q;
   
endmodule // pls_gen


/***********************************
 *  RegDff
 * *********************************/
module RegDff (din,clk,qout);

parameter dwidth = 10;
input clk;
input [dwidth-1:0] din;
output [dwidth-1:0] qout;

reg   [dwidth-1:0] qout;

always @ (posedge clk)
    qout <= din;

 
endmodule // RegDff

/***********************************
 *  RegDffWithMux
 * *********************************/
module RegDffWithMux (din0,din1,sel,clk,qout);

parameter dwidth = 10;
input clk;
input [dwidth-1:0] din0;
input [dwidth-1:0] din1;
input sel;
output [dwidth-1:0] qout;

   wire [dwidth-1:0] din0;
   wire [dwidth-1:0] din1;
   wire [dwidth-1:0] dout;
   wire [dwidth-1:0] qout;
   wire 	     sel;
   wire 	     clk;
   
xMUX_2to1 #(dwidth) dout_xMUX_2to1(.din0(din0),
                                   .din1(din1),
                                   .sel(sel),
                                   .dout(dout));

RegDff #(dwidth) qout_RegDff(.din(dout),.clk(clk),.qout(qout));

//always @ (posedge clk)
//    qout <= dout;

 
endmodule // RegDffWithMux


/*****************************
 * RegRst
 *****************************/
module RegRst (clk,reset,din,qout);

parameter dwidth = 10;
input clk, reset;
input [dwidth-1:0] din;
output [dwidth-1:0] qout;

reg   [dwidth-1:0] qout;

always @ (posedge clk)
  if (reset)
    qout <= 0;
  else
    qout <= din;

endmodule // RegRst

/*****************************
 * RegRst2
 *****************************/
module RegRst2 (clk,reset,reset_value,din,qout);

parameter dwidth = 10;
input clk, reset;
input [dwidth-1:0] reset_value;
input [dwidth-1:0] din;
output [dwidth-1:0] qout;

reg   [dwidth-1:0] qout;

always @ (posedge clk)
  if (reset)
    qout <= reset_value;
  else
    qout <= din;

endmodule // RegRst2



// PlsGen2 2/24/00
module PlsGen2 (sig_in,clk,lead,trail);
   input sig_in, clk;
   output lead,trail;

   wire   sig_in, sig_out,lead,trail;
   FD1 sig_out_FD1(.D(sig_in),.CP(clk),.Q(sig_out));
   assign lead =  sig_in & ~sig_out;
   assign trail= ~sig_in &  sig_out;

endmodule // PlsGen2


/* ---------- start of 5bit domain ----------------------------------- */

module g_cntr_5bit (reset,clk,ce,g_cnt);
   input reset;
   input clk;
   input ce;
   output [4:0] g_cnt;
   /* 0in gray_code
      -var g_cnt
      -clock clk
      -reset reset
      -message "(* 0in test 5bit gray_code counter *)"
   */

   wire [4:0] 	g_cnt;    // current state
   reg [4:0] 	nx_g_cnt; // next state

   parameter g_ZERO           =  5'b0_0000,
	     g_ONE            =  5'b0_0001,
	     g_TWO            =  5'b0_0011,
	     g_THREE          =  5'b0_0010,
	     g_FOUR           =  5'b0_0110,
	     g_FIVE           =  5'b0_0111,
	     g_SIX            =  5'b0_0101,
	     g_SEVEN          =  5'b0_0100,
	     g_EIGHT          =  5'b0_1100,
	     g_NINE           =  5'b0_1101,
	     g_TEN            =  5'b0_1111,
	     g_ELEVEN         =  5'b0_1110,
	     g_TWELVE         =  5'b0_1010,
	     g_THIRTEEN       =  5'b0_1011,
	     g_FORTEEN        =  5'b0_1001,
	     g_FIFTEEN        =  5'b0_1000, // reflection
	     g_SIXTEEN        =  5'b1_1000, // reflection
	     g_SEVENTEEN      =  5'b1_1001,
	     g_EIGHTEEN       =  5'b1_1011,
	     g_NINETEEN       =  5'b1_1010,
	     g_TWENTY         =  5'b1_1110,
	     g_TWENTY_ONE     =  5'b1_1111,
	     g_TWENTY_TWO     =  5'b1_1101,
	     g_TWENTY_THREE   =  5'b1_1100,
   	     g_TWENTY_FOUR    =  5'b1_0100,
	     g_TWENTY_FIVE    =  5'b1_0101,
	     g_TWENTY_SIX     =  5'b1_0111,
	     g_TWENTY_SEVEN   =  5'b1_0110,
	     g_TWENTY_EIGHT   =  5'b1_0010,
	     g_TWENTY_NINE    =  5'b1_0011,
	     g_THIRTY         =  5'b1_0001,
	     g_THIRTY_ONE     =  5'b1_0000;


// com part
always @ (ce or g_cnt)
  begin
     nx_g_cnt =  g_ZERO;
     if (ce)
     case(g_cnt)         // synopsys parallel_case full_case   
       g_ZERO          : nx_g_cnt =  g_ONE;          
       g_ONE           : nx_g_cnt =  g_TWO;          
       g_TWO           : nx_g_cnt =  g_THREE;        
       g_THREE         : nx_g_cnt =  g_FOUR;         
       g_FOUR          : nx_g_cnt =  g_FIVE;         
       g_FIVE          : nx_g_cnt =  g_SIX;          
       g_SIX           : nx_g_cnt =  g_SEVEN;        
       g_SEVEN         : nx_g_cnt =  g_EIGHT;        
       g_EIGHT         : nx_g_cnt =  g_NINE;         
       g_NINE          : nx_g_cnt =  g_TEN;          
       g_TEN           : nx_g_cnt =  g_ELEVEN;       
       g_ELEVEN        : nx_g_cnt =  g_TWELVE;       
       g_TWELVE        : nx_g_cnt =  g_THIRTEEN;     
       g_THIRTEEN      : nx_g_cnt =  g_FORTEEN;      
       g_FORTEEN       : nx_g_cnt =  g_FIFTEEN;      
       g_FIFTEEN       : nx_g_cnt =  g_SIXTEEN;      
       g_SIXTEEN       : nx_g_cnt =  g_SEVENTEEN;    
       g_SEVENTEEN     : nx_g_cnt =  g_EIGHTEEN;     
       g_EIGHTEEN      : nx_g_cnt =  g_NINETEEN;     
       g_NINETEEN      : nx_g_cnt =  g_TWENTY;       
       g_TWENTY        : nx_g_cnt =  g_TWENTY_ONE;   
       g_TWENTY_ONE    : nx_g_cnt =  g_TWENTY_TWO;   
       g_TWENTY_TWO    : nx_g_cnt =  g_TWENTY_THREE; 
       g_TWENTY_THREE  : nx_g_cnt =  g_TWENTY_FOUR;  
       g_TWENTY_FOUR   : nx_g_cnt =  g_TWENTY_FIVE;  
       g_TWENTY_FIVE   : nx_g_cnt =  g_TWENTY_SIX;   
       g_TWENTY_SIX    : nx_g_cnt =  g_TWENTY_SEVEN; 
       g_TWENTY_SEVEN  : nx_g_cnt =  g_TWENTY_EIGHT; 
       g_TWENTY_EIGHT  : nx_g_cnt =  g_TWENTY_NINE;  
       g_TWENTY_NINE   : nx_g_cnt =  g_THIRTY;       
       g_THIRTY        : nx_g_cnt =  g_THIRTY_ONE;   
       g_THIRTY_ONE    : nx_g_cnt =  g_ZERO;         
       default         : nx_g_cnt =  g_ZERO;         
     endcase // case(g_cnt)            
     else                nx_g_cnt =   g_cnt; // hold the value         
  end // always @ (ce or g_cnt)

// seq part
RegRst #(5) gb5_cntr_RegRst (.clk(clk),
                             .reset(reset),
                             .din(nx_g_cnt),
                             .qout(g_cnt));

endmodule // g_cntr_5bit


module g2b_5bit (g_cnt,b_cnt);
   input  [4:0] g_cnt;
   output [4:0] b_cnt;

   reg [4:0] b_cnt;
   
   parameter g_ZERO           =  5'b0_0000,
	     g_ONE            =  5'b0_0001,
	     g_TWO            =  5'b0_0011,
	     g_THREE          =  5'b0_0010,
	     g_FOUR           =  5'b0_0110,
	     g_FIVE           =  5'b0_0111,
	     g_SIX            =  5'b0_0101,
	     g_SEVEN          =  5'b0_0100,
	     g_EIGHT          =  5'b0_1100,
	     g_NINE           =  5'b0_1101,
	     g_TEN            =  5'b0_1111,
	     g_ELEVEN         =  5'b0_1110,
	     g_TWELVE         =  5'b0_1010,
	     g_THIRTEEN       =  5'b0_1011,
	     g_FORTEEN        =  5'b0_1001,
	     g_FIFTEEN        =  5'b0_1000, // reflection
	     g_SIXTEEN        =  5'b1_1000, // reflection
	     g_SEVENTEEN      =  5'b1_1001,
	     g_EIGHTEEN       =  5'b1_1011,
	     g_NINETEEN       =  5'b1_1010,
	     g_TWENTY         =  5'b1_1110,
	     g_TWENTY_ONE     =  5'b1_1111,
	     g_TWENTY_TWO     =  5'b1_1101,
	     g_TWENTY_THREE   =  5'b1_1100,
   	     g_TWENTY_FOUR    =  5'b1_0100,
	     g_TWENTY_FIVE    =  5'b1_0101,
	     g_TWENTY_SIX     =  5'b1_0111,
	     g_TWENTY_SEVEN   =  5'b1_0110,
	     g_TWENTY_EIGHT   =  5'b1_0010,
	     g_TWENTY_NINE    =  5'b1_0011,
	     g_THIRTY         =  5'b1_0001,
	     g_THIRTY_ONE     =  5'b1_0000;


   parameter   ZERO           =  5'b0_0000,
	       ONE            =  5'b0_0001,
	       TWO            =  5'b0_0010,
	       THREE          =  5'b0_0011,
	       FOUR           =  5'b0_0100,
	       FIVE           =  5'b0_0101,
	       SIX            =  5'b0_0110,
	       SEVEN          =  5'b0_0111,
	       EIGHT          =  5'b0_1000,
	       NINE           =  5'b0_1001,
	       TEN            =  5'b0_1010,
	       ELEVEN         =  5'b0_1011,
	       TWELVE         =  5'b0_1100,
	       THIRTEEN       =  5'b0_1101,
	       FORTEEN        =  5'b0_1110,
	       FIFTEEN        =  5'b0_1111,
	       SIXTEEN        =  5'b1_0000,
	       SEVENTEEN      =  5'b1_0001,
	       EIGHTEEN       =  5'b1_0010,
	       NINETEEN       =  5'b1_0011,
	       TWENTY         =  5'b1_0100,
	       TWENTY_ONE     =  5'b1_0101,
	       TWENTY_TWO     =  5'b1_0110,
	       TWENTY_THREE   =  5'b1_0111,
   	       TWENTY_FOUR    =  5'b1_1000,
	       TWENTY_FIVE    =  5'b1_1001,
	       TWENTY_SIX     =  5'b1_1010,
	       TWENTY_SEVEN   =  5'b1_1011,
	       TWENTY_EIGHT   =  5'b1_1100,
	       TWENTY_NINE    =  5'b1_1101,
	       THIRTY         =  5'b1_1110,
	       THIRTY_ONE     =  5'b1_1111;

// g to b decoder
always @ (g_cnt)
  begin
     b_cnt =  ZERO;
     case(g_cnt)          // synopsys parallel_case full_case    
       g_ZERO          : b_cnt = ZERO;          
       g_ONE           : b_cnt = ONE;           
       g_TWO           : b_cnt = TWO;           
       g_THREE         : b_cnt = THREE;         
       g_FOUR          : b_cnt = FOUR;          
       g_FIVE          : b_cnt = FIVE;          
       g_SIX           : b_cnt = SIX;           
       g_SEVEN         : b_cnt = SEVEN;         
       g_EIGHT         : b_cnt = EIGHT;         
       g_NINE          : b_cnt = NINE;          
       g_TEN           : b_cnt = TEN;           
       g_ELEVEN        : b_cnt = ELEVEN;        
       g_TWELVE        : b_cnt = TWELVE;        
       g_THIRTEEN      : b_cnt = THIRTEEN;      
       g_FORTEEN       : b_cnt = FORTEEN;       
       g_FIFTEEN       : b_cnt = FIFTEEN;       
       g_SIXTEEN       : b_cnt = SIXTEEN;       
       g_SEVENTEEN     : b_cnt = SEVENTEEN;     
       g_EIGHTEEN      : b_cnt = EIGHTEEN;      
       g_NINETEEN      : b_cnt = NINETEEN;      
       g_TWENTY        : b_cnt = TWENTY;        
       g_TWENTY_ONE    : b_cnt = TWENTY_ONE;    
       g_TWENTY_TWO    : b_cnt = TWENTY_TWO;    
       g_TWENTY_THREE  : b_cnt = TWENTY_THREE;  
       g_TWENTY_FOUR   : b_cnt = TWENTY_FOUR;   
       g_TWENTY_FIVE   : b_cnt = TWENTY_FIVE;   
       g_TWENTY_SIX    : b_cnt = TWENTY_SIX;    
       g_TWENTY_SEVEN  : b_cnt = TWENTY_SEVEN;  
       g_TWENTY_EIGHT  : b_cnt = TWENTY_EIGHT;  
       g_TWENTY_NINE   : b_cnt = TWENTY_NINE;   
       g_THIRTY        : b_cnt = THIRTY;        
       g_THIRTY_ONE    : b_cnt = THIRTY_ONE;    
       default         : b_cnt = ZERO; 
     endcase 
  end // always @ (g_cnt)
   
endmodule // g2b_5bit


/* ---------- end of 5bit domain ------------------------------------- */


/* ---------- start of 4bit domain ----------------------------------- */
module g_cntr_4bit (reset,clk,ce,g_cnt);
   input           reset;
   input           clk;
   input           ce;
   output [3:0]    g_cnt;
   /* 0in gray_code
      -var g_cnt
      -clock clk
      -reset reset
      -message "(* 0in test 4bit gray_code counter *)"
   */

   wire [3:0] 	g_cnt;    // current state
   reg [3:0] 	nx_g_cnt; // next state

   parameter g_ZERO           =  4'b0000,
	     g_ONE            =  4'b0001,
	     g_TWO            =  4'b0011,
	     g_THREE          =  4'b0010,
	     g_FOUR           =  4'b0110,
	     g_FIVE           =  4'b0111,
	     g_SIX            =  4'b0101,
	     g_SEVEN          =  4'b0100,
	     g_EIGHT          =  4'b1100,
	     g_NINE           =  4'b1101,
	     g_TEN            =  4'b1111,
	     g_ELEVEN         =  4'b1110,
	     g_TWELVE         =  4'b1010,
	     g_THIRTEEN       =  4'b1011,
	     g_FORTEEN        =  4'b1001,
	     g_FIFTEEN        =  4'b1000; // reflection


// com part
always @ (ce or g_cnt)
  begin
     nx_g_cnt =  g_ZERO;
     if (ce)
     case(g_cnt)         // synopsys parallel_case full_case      
       g_ZERO          : nx_g_cnt =  g_ONE;          
       g_ONE           : nx_g_cnt =  g_TWO;          
       g_TWO           : nx_g_cnt =  g_THREE;        
       g_THREE         : nx_g_cnt =  g_FOUR;         
       g_FOUR          : nx_g_cnt =  g_FIVE;         
       g_FIVE          : nx_g_cnt =  g_SIX;          
       g_SIX           : nx_g_cnt =  g_SEVEN;        
       g_SEVEN         : nx_g_cnt =  g_EIGHT;        
       g_EIGHT         : nx_g_cnt =  g_NINE;         
       g_NINE          : nx_g_cnt =  g_TEN;          
       g_TEN           : nx_g_cnt =  g_ELEVEN;       
       g_ELEVEN        : nx_g_cnt =  g_TWELVE;       
       g_TWELVE        : nx_g_cnt =  g_THIRTEEN;     
       g_THIRTEEN      : nx_g_cnt =  g_FORTEEN;      
       g_FORTEEN       : nx_g_cnt =  g_FIFTEEN;      
       g_FIFTEEN       : nx_g_cnt =  g_ZERO;         
       default         : nx_g_cnt =  g_ZERO;
     endcase // case(g_cnt)            
     else                nx_g_cnt =   g_cnt; // hold the value         
  end // always @ (ce or g_cnt)

// seq part
RegRst #(4)  g_cnt_RegRst (.clk(clk),
                           .reset(reset),
                           .din(nx_g_cnt),
                           .qout(g_cnt));

endmodule // g_cntr_4bit


module g2b_4bit (g_cnt,b_cnt);
   input  [3:0] g_cnt;
   output [3:0] b_cnt;

   reg [3:0] b_cnt;
   
   parameter g_ZERO           =  4'b0000,
	     g_ONE            =  4'b0001,
	     g_TWO            =  4'b0011,
	     g_THREE          =  4'b0010,
	     g_FOUR           =  4'b0110,
	     g_FIVE           =  4'b0111,
	     g_SIX            =  4'b0101,
	     g_SEVEN          =  4'b0100,
	     g_EIGHT          =  4'b1100,
	     g_NINE           =  4'b1101,
	     g_TEN            =  4'b1111,
	     g_ELEVEN         =  4'b1110,
	     g_TWELVE         =  4'b1010,
	     g_THIRTEEN       =  4'b1011,
	     g_FORTEEN        =  4'b1001,
	     g_FIFTEEN        =  4'b1000; // reflection

   parameter   ZERO           =  4'b0000,
	       ONE            =  4'b0001,
	       TWO            =  4'b0010,
	       THREE          =  4'b0011,
	       FOUR           =  4'b0100,
	       FIVE           =  4'b0101,
	       SIX            =  4'b0110,
	       SEVEN          =  4'b0111,
	       EIGHT          =  4'b1000,
	       NINE           =  4'b1001,
	       TEN            =  4'b1010,
	       ELEVEN         =  4'b1011,
	       TWELVE         =  4'b1100,
	       THIRTEEN       =  4'b1101,
	       FORTEEN        =  4'b1110,
	       FIFTEEN        =  4'b1111;
   


// g to b decoder
always @ (g_cnt)
  begin
     b_cnt =  ZERO;
     case(g_cnt)      // synopsys parallel_case full_case            
       g_ZERO          : b_cnt = ZERO;          
       g_ONE           : b_cnt = ONE;           
       g_TWO           : b_cnt = TWO;           
       g_THREE         : b_cnt = THREE;         
       g_FOUR          : b_cnt = FOUR;          
       g_FIVE          : b_cnt = FIVE;          
       g_SIX           : b_cnt = SIX;           
       g_SEVEN         : b_cnt = SEVEN;         
       g_EIGHT         : b_cnt = EIGHT;         
       g_NINE          : b_cnt = NINE;          
       g_TEN           : b_cnt = TEN;           
       g_ELEVEN        : b_cnt = ELEVEN;        
       g_TWELVE        : b_cnt = TWELVE;        
       g_THIRTEEN      : b_cnt = THIRTEEN;      
       g_FORTEEN       : b_cnt = FORTEEN;       
       g_FIFTEEN       : b_cnt = FIFTEEN;       
       default         : b_cnt = ZERO;
     endcase 
  end // always @ (g_cnt)
   
endmodule // g2b_4bit

/* ---------- end of 4bit domain ------------------------------------- */


 
/* ---------- start of 3bit domain ----------------------------------- */

module g_cntr_3bit (reset,clk,ce,g_cnt);
   input           reset;
   input           clk;
   input           ce;
   output [2:0]    g_cnt;
   /* 0in gray_code
      -var g_cnt
      -clock clk
      -reset reset
      -message "(* 0in test 3bit gray_code counter *)"
   */

   wire [2:0] 	g_cnt;    // current state
   reg [2:0] 	nx_g_cnt; // next state

   parameter g_ZERO           =  3'b000,
	     g_ONE            =  3'b001,
	     g_TWO            =  3'b011,
	     g_THREE          =  3'b010,
	     g_FOUR           =  3'b110,
	     g_FIVE           =  3'b111,
	     g_SIX            =  3'b101,
	     g_SEVEN          =  3'b100; // reflection


// com part
always @ (ce or g_cnt)
  begin
     nx_g_cnt =  g_ZERO;
     if (ce)
     case(g_cnt)         // synopsys parallel_case full_case      
       g_ZERO          : nx_g_cnt =  g_ONE;          
       g_ONE           : nx_g_cnt =  g_TWO;          
       g_TWO           : nx_g_cnt =  g_THREE;        
       g_THREE         : nx_g_cnt =  g_FOUR;         
       g_FOUR          : nx_g_cnt =  g_FIVE;         
       g_FIVE          : nx_g_cnt =  g_SIX;          
       g_SIX           : nx_g_cnt =  g_SEVEN;        
       g_SEVEN         : nx_g_cnt =  g_ZERO;        
       default         : nx_g_cnt =  g_ZERO;
     endcase // case(g_cnt)            
     else                nx_g_cnt =   g_cnt; // hold the value         
  end // always @ (ce or g_cnt)

// seq part
RegRst #(3)  g_cnt_RegRst (.clk(clk),
                           .reset(reset),
                           .din(nx_g_cnt),
                           .qout(g_cnt));

endmodule // g_cntr_3bit


module g2b_3bit (g_cnt,b_cnt);
   input  [2:0] g_cnt;
   output [2:0] b_cnt;

   reg [2:0] b_cnt;
   
   parameter g_ZERO           =  3'b000,
	     g_ONE            =  3'b001,
	     g_TWO            =  3'b011,
	     g_THREE          =  3'b010,
	     g_FOUR           =  3'b110,
	     g_FIVE           =  3'b111,
	     g_SIX            =  3'b101,
	     g_SEVEN          =  3'b100; // reflection
                                                   
   parameter   ZERO           =  3'b000,
	       ONE            =  3'b001,
	       TWO            =  3'b010,
	       THREE          =  3'b011,
	       FOUR           =  3'b100,
	       FIVE           =  3'b101,
	       SIX            =  3'b110,
	       SEVEN          =  3'b111;
   

// g to b decoder
always @ (g_cnt)
  begin
     b_cnt =  ZERO;
     case(g_cnt)      // synopsys parallel_case full_case            
       g_ZERO          : b_cnt = ZERO;          
       g_ONE           : b_cnt = ONE;           
       g_TWO           : b_cnt = TWO;           
       g_THREE         : b_cnt = THREE;         
       g_FOUR          : b_cnt = FOUR;          
       g_FIVE          : b_cnt = FIVE;          
       g_SIX           : b_cnt = SIX;           
       g_SEVEN         : b_cnt = SEVEN;       
       default         : b_cnt = ZERO;
     endcase 
  end // always @ (g_cnt)
   
endmodule // g2b_3bit

/* ---------- end of 3bit domain ------------------------------------- */


module SYNC_FAST_5bit (din,clk,qout);
   input [4:0]      din;
   input 	    clk;
   output [4:0]     qout;

FAST_SYNC_CELL   bit_0_FAST_SYNC_CELL (.D(din[0]),
                                       .CP(clk),
                                       .Q(qout[0]));

FAST_SYNC_CELL   bit_1_FAST_SYNC_CELL (.D(din[1]),
                                       .CP(clk),
                                       .Q(qout[1]));

FAST_SYNC_CELL   bit_2_FAST_SYNC_CELL (.D(din[2]),
                                       .CP(clk),
                                       .Q(qout[2]));

FAST_SYNC_CELL   bit_3_FAST_SYNC_CELL (.D(din[3]),
                                       .CP(clk),
                                       .Q(qout[3]));
FAST_SYNC_CELL   bit_4_FAST_SYNC_CELL (.D(din[4]),
                                       .CP(clk),
                                       .Q(qout[4]));


endmodule // SYNC_FAST_5bit

module SYNC_5bit (din,clk,qout);
   input [4:0]      din;
   input 	    clk;
   output [4:0]     qout;

SYNC_CELL   bit_0_SYNC_CELL (.D(din[0]),
                                       .CP(clk),
                                       .Q(qout[0]));

SYNC_CELL   bit_1_SYNC_CELL (.D(din[1]),
                                       .CP(clk),
                                       .Q(qout[1]));

SYNC_CELL   bit_2_SYNC_CELL (.D(din[2]),
                                       .CP(clk),
                                       .Q(qout[2]));

SYNC_CELL   bit_3_SYNC_CELL (.D(din[3]),
                                       .CP(clk),
                                       .Q(qout[3]));
SYNC_CELL   bit_4_SYNC_CELL (.D(din[4]),
                                       .CP(clk),
                                       .Q(qout[4]));


endmodule // SYNC_5bit


module SYNC_4bit (din,clk,qout);
   input [3:0]      din;
   input 	    clk;
   output [3:0]     qout;

SYNC_CELL   bit_0_SYNC_CELL (.D(din[0]),
                                       .CP(clk),
                                       .Q(qout[0]));

SYNC_CELL   bit_1_SYNC_CELL (.D(din[1]),
                                       .CP(clk),
                                       .Q(qout[1]));

SYNC_CELL   bit_2_SYNC_CELL (.D(din[2]),
                                       .CP(clk),
                                       .Q(qout[2]));

SYNC_CELL   bit_3_SYNC_CELL (.D(din[3]),
                                       .CP(clk),
                                       .Q(qout[3]));

endmodule // SYNC_4bit


module SYNC_3bit (din,clk,qout);
   input [2:0]      din;
   input 	    clk;
   output [2:0]     qout;

SYNC_CELL   bit_0_SYNC_CELL (.D(din[0]),
                                       .CP(clk),
                                       .Q(qout[0]));

SYNC_CELL   bit_1_SYNC_CELL (.D(din[1]),
                                       .CP(clk),
                                       .Q(qout[1]));

SYNC_CELL   bit_2_SYNC_CELL (.D(din[2]),
                                       .CP(clk),
                                       .Q(qout[2]));

endmodule // SYNC_3bit


module byte_counter (   
        clk,
        reset,
        byte_count_en,
        dv_en_8bit, // data valid enable
// outputs			   
        byte_count,
        nx_byte_count
       );
   input 	     clk;
   input 	     reset;
   input 	     byte_count_en;
   input [7:0] 	     dv_en_8bit;
// outputs
   output [13:0]     byte_count;
   output [13:0]     nx_byte_count;
   
   wire [13:0] 	     nx_byte_count;
   wire [13:0] 	     byte_count;
   reg [13:0] 	     addend;
   
			     
/***** byte_count  * ****/
always @ (byte_count_en or dv_en_8bit)
     if (byte_count_en)
         casex (dv_en_8bit) // synopsys parallel_case full_case 
           8'b1xxxxxxx: addend = 14'd8;
           8'b01xxxxxx: addend = 14'd7;
           8'b001xxxxx: addend = 14'd6;
           8'b0001xxxx: addend = 14'd5;
           8'b00001xxx: addend = 14'd4;
           8'b000001xx: addend = 14'd3;
           8'b0000001x: addend = 14'd2;
           8'b00000001: addend = 14'd1;
           8'b00000000: addend = 14'd0; // hold
           default:     addend = 14'd0; // hold
         endcase // casex(dv_en_8bit)
     else 	        addend = 14'd0; // hold

   assign nx_byte_count = byte_count + addend;

// original total cell: 396
// improved total cell: 269 + very fast compilation time   


// We can only support 16k jumbo packet	
RegRst #(14) byte_count_RegRst (.clk(clk),
                                .reset(reset),
                                .din(nx_byte_count),
                                .qout(byte_count));

endmodule // byte_counter



module ones_comp_16bit_adder (
   addend1,
   addend2,
   sum_big   // in big endian format
			      );
input   [15:0]   addend1;
input   [15:0]   addend2;
output  [15:0]   sum_big;   // in big endian format

/**************************************************************************
 * the look_ahead_adder: to save one adder for just adding "1", a technique
 * is used.  By adding one more bit to look_ahead_adder LSB on both addends
 * and make them '1' then effectively the result is 2'b10. Discard the
 * LSB position to get the effective 1
 * ************************************************************************/

wire [17:0] look_ahead_adder      = {1'b0, addend1, 1'b1} + {1'b0, addend2, 1'b1};
wire [17:0] twos_comp_16bit_adder = {1'b0, addend1, 1'b0} + {1'b0, addend2, 1'b0};
wire [15:0] sum_big;

assign  sum_big [15:0]= twos_comp_16bit_adder[17] ? look_ahead_adder[16:1]:
                        twos_comp_16bit_adder[16:1];

endmodule // ones_comp_16bit_adder


		       
module delay_cell (Z,A);
   input A;
   output Z;

   wire   Z,b;
   assign b = ~A;
   assign Z = ~b;

endmodule // delay_cell


module clock_doubler_model(rbc0,rbc1,rbcx2);

input	rbc0;	// input from external SERDES, clocks odd bytes
input	rbc1;	// input from external SERDES, clocks even bytes
output	rbcx2;	// doubled version of clocks

wire 	rbc0_del4ns; 	// rbc0 delayed 4 ns
wire	rbc1_del4ns;	// rbc1 delayed 4 ns

// The following two lines should be replaced with ASIC vendor's delay cell.
//DEL4ns d_rbc0_del4ns (.A(rbc0),.Z(rbc0_del4ns));
//DEL4ns d_rbc1_del4ns (.A(rbc1),.Z(rbc1_del4ns));
// vlint flag_unsynthesizable_delay_control off
   assign #4 rbc0_del4ns = rbc0;
   assign #4 rbc1_del4ns = rbc1;
// vlint flag_unsynthesizable_delay_control on

   assign rbcx2 = (~rbc0_del4ns & rbc0) | (~rbc1_del4ns & rbc1);

endmodule

module inv_buffer (z,a);
   input  a;
   output z;
   wire   z = ~a;
endmodule // inv_buffer



module my_buffers (z,a);
parameter dwidth = 8;
   input  [dwidth-1:0] a;
   output [dwidth-1:0] z;

   wire   [dwidth-1:0] b = ~a;
   wire   [dwidth-1:0] z = ~b;

endmodule


// 1ns delay
module DEL1ns(A,Z);
input A;
output Z;

   wire A,Z;
  // vlint flag_unsynthesizable_delay_control off
  assign #1 Z = A;
  // vlint flag_unsynthesizable_delay_control on


endmodule

// -----------------------------------------------------------
// NEC relatively balanced (rise/fall) output delay cell spec.
// -----------------------------------------------------------
//                Tpd       Tpd       Tdp       of delay circuit
// cell name    Min case  Max case    Typ      (info only)
// ---------    --------  --------   ------  -----------------
// TCDLY1VX2     ~200ps    ~400ps    300ps       2 levels
// TCDLY2VX2     ~350ps    ~700ps    500ps       4 levels
// TCDLY3VX2     ~500ps   ~1000ps    750ps       6 levels


// 2ns delay
module DEL2ns(A,Z);
input A;
output Z;

   wire A,Z;
  // vlint flag_unsynthesizable_delay_control off
  assign #2 Z =  A;
  // vlint flag_unsynthesizable_delay_control on


endmodule


module DEL4ns (Z,A);
input  A;
output Z;
 
   wire A,Z;
  // vlint flag_unsynthesizable_delay_control off
  assign #4 Z =  A;
  // vlint flag_unsynthesizable_delay_control on

endmodule

// 5ns delay
module DEL5ns(A,Z);
input A;
output Z;

   wire A,Z;
  // vlint flag_unsynthesizable_delay_control off
  assign #5 Z =  A;
  // vlint flag_unsynthesizable_delay_control on

endmodule



/**********************************************************************/
/* Project Name  :  GEM                                               	*/
/* Module Name   :  DEL_PAT						*/
/* Description   :  Delay element to aid in meeting hold requirement    */
/*			to lfsr.					*/
/* Assumptions   :  none						*/
/*									*/
/*									*/
/* Parent module : pcs_lfsr.v						*/
/* Child modules : none                                               	*/
/* Author Name   : Linda Cheng                                         	*/
/* Date Created  : 11/7/97                                           	*/
/*                                                                    	*/
/*              Copyright (c) 1994, Sun Microsystems, Inc.            	*/
/*                   Sun Proprietary and Confidential                 	*/
/*                                                                    	*/ 
/* Modifications : none yet						*/
/* Synthesis Notes :  none yet                                        	*/
/************************************************************************/

module DEL2ns_PAT (Z,A);
input [17:0]	A;
output [17:0] 	Z;

DEL2ns PAT0_DEL2ns  (.Z(Z[0]), .A(A[0]));
DEL2ns PAT1_DEL2ns  (.Z(Z[1]), .A(A[1]));
DEL2ns PAT2_DEL2ns  (.Z(Z[2]), .A(A[2]));
DEL2ns PAT3_DEL2ns  (.Z(Z[3]), .A(A[3]));
DEL2ns PAT4_DEL2ns  (.Z(Z[4]), .A(A[4]));
DEL2ns PAT5_DEL2ns  (.Z(Z[5]), .A(A[5]));
DEL2ns PAT6_DEL2ns  (.Z(Z[6]), .A(A[6]));
DEL2ns PAT7_DEL2ns  (.Z(Z[7]), .A(A[7]));
DEL2ns PAT8_DEL2ns  (.Z(Z[8]), .A(A[8]));
DEL2ns PAT9_DEL2ns  (.Z(Z[9]), .A(A[9]));
DEL2ns PAT10_DEL2ns (.Z(Z[10]), .A(A[10]));
DEL2ns PAT11_DEL2ns (.Z(Z[11]), .A(A[11]));
DEL2ns PAT12_DEL2ns (.Z(Z[12]), .A(A[12]));
DEL2ns PAT13_DEL2ns (.Z(Z[13]), .A(A[13]));
DEL2ns PAT14_DEL2ns (.Z(Z[14]), .A(A[14]));
DEL2ns PAT15_DEL2ns (.Z(Z[15]), .A(A[15]));
DEL2ns PAT16_DEL2ns (.Z(Z[16]), .A(A[16]));
DEL2ns PAT17_DEL2ns (.Z(Z[17]), .A(A[17]));

endmodule 



/****************************************************
 * copy from: /import/cassini/central/asic/LIB/   
 * Used by pcs
 ****************************************************/

module MUX2TO1 (dout, sel, data0, data1);
parameter dwidth = 2;
   output [dwidth-1:0] dout;
   input 	       sel;
   input [dwidth-1:0]  data0;
   input [dwidth-1:0]  data1;
   
   wire [dwidth-1:0]   data0;
   wire [dwidth-1:0]   data1;
   wire 	       sel;
   reg [dwidth-1:0]    dout;

  always @ (sel or data0 or data1)
    begin:MUX2TO1
       case (sel) // synopsys parallel_case full_case 
	 1'b0: dout = data0;
	 1'b1: dout = data1;
       endcase
    end

   
endmodule
 
// but from /vobs/vega_asic/mac/phy/rtl/
module MUX3TO1(dout,sel,data0,data1,data2);
parameter dwidth = 2;
   output [dwidth-1:0] dout;
   input [1:0]	       sel;
   input [dwidth-1:0]  data0;
   input [dwidth-1:0]  data1;
   input [dwidth-1:0]  data2;
   

   wire [dwidth-1:0]   data0;
   wire [dwidth-1:0]   data1;
   wire [dwidth-1:0]   data2;
   wire [1:0]	       sel;
   reg  [dwidth-1:0]   dout;

  always @ (sel or data0 or data1 or data2)
    begin:MUX3TO1
       case (sel) // synopsys parallel_case full_case 
	 2'b00: dout = data0;
	 2'b01: dout = data1;
	 2'b10: dout = data2;
	 2'b11: dout = data2;
       endcase
    end
 
endmodule



module MUX4TO1 (dout, sel, data0, data1, data2, data3);
parameter dwidth = 2;
   output [dwidth-1:0] dout;
   input [1:0]	       sel;
   input [dwidth-1:0]  data0;
   input [dwidth-1:0]  data1;
   input [dwidth-1:0]  data2;
   input [dwidth-1:0]  data3;
   

   wire [dwidth-1:0]   data0;
   wire [dwidth-1:0]   data1;
   wire [dwidth-1:0]   data2;
   wire [dwidth-1:0]   data3;
   wire [1:0]	       sel;
   reg  [dwidth-1:0]   dout;

  always @ (sel or data0 or data1 or data2 or data3)
    begin:MUX4TO1
       case (sel) // synopsys parallel_case full_case 
	 2'b00: dout = data0;
	 2'b01: dout = data1;
	 2'b10: dout = data2;
	 2'b11: dout = data3;
       endcase
    end

endmodule



module MUX6TO1 (dout,sel,D0,D1,D2,D3,D4,D5);
parameter dwidth = 2;
   output [dwidth-1:0] dout;
   input [2:0]	       sel;
   input [dwidth-1:0]  D0;
   input [dwidth-1:0]  D1;
   input [dwidth-1:0]  D2;
   input [dwidth-1:0]  D3;
   input [dwidth-1:0]  D4;
   input [dwidth-1:0]  D5;
   

   wire [dwidth-1:0]   D0;
   wire [dwidth-1:0]   D1;
   wire [dwidth-1:0]   D2;
   wire [dwidth-1:0]   D3;
   wire [dwidth-1:0]   D4;
   wire [dwidth-1:0]   D5;
   wire [2:0]	       sel;
   reg  [dwidth-1:0]   dout;

  always @ (sel or D0 or D1 or D2 or D3 or D4 or D5)
    begin:MUX6TO1
       case (sel) // synopsys parallel_case full_case 
	 3'h0: dout = D0;
	 3'h1: dout = D1;
	 3'h2: dout = D2;
	 3'h3: dout = D3;
	 3'h4: dout = D4;
	 3'h5: dout = D5;
	 default:  dout= D0;
       endcase
    end

 
endmodule



module REG (qout, clk, din);
//non-resettable variable width register 
//only one Q output
//if used as flop, just instantiate with #1

parameter dwidth = 2;
output [dwidth-1:0] qout;
input clk;
input [dwidth-1:0] din; 

reg   [dwidth-1:0] qout;

always @ (posedge clk)
    qout <= din;
endmodule



module RREG (qout, clk, rst, din);
//synchronous reset variable width register 
//active hi reset (rst); 
//only one Q output
//if used as flop, just instantiate with #1

parameter dwidth = 2;
output [dwidth-1:0] qout;
input clk, rst;
input [dwidth-1:0] din; 

reg   [dwidth-1:0] qout;

always @ (posedge clk)
if (rst)
    qout <= 0;
else
    qout <= din; 
endmodule



module SRREG (qout, clk, en, rst, din);
//synchronous reset variable width register with active hi enable
//active hi reset (rst); 
//only one Q output
//if used as flop, just instantiate with #1

parameter dwidth = 2;
output [dwidth-1:0] qout;
input clk, en, rst;
input [dwidth-1:0] din; 

reg   [dwidth-1:0] qout;

always @ (posedge clk)
if (rst)
    qout <= 0;
else if (en)
    qout <= din;
     else 
        qout <= qout; 
endmodule



module EREG (qout, clk, en, din);
//synchronous variable width register with active hi enable
//only one Q output
//if used as flop, just instantiate with #1

parameter dwidth = 2;
output [dwidth-1:0] qout;
input clk, en;
input [dwidth-1:0] din; 

reg   [dwidth-1:0] qout;

always @ (posedge clk)
  if (en)
    qout <= din;
  else 
    qout <= qout; 
endmodule




/*********************************************************

   Project         : Niu

   Date            : Oct. 2005

   Description     : 4 sets of {nand3, nor2, inv, mux2, reg}

   Synthesis Notes:

   Modification History:

   Date       Description
   ----       -----------

***********************************************************/

`ifdef NEPTUNE
module mac_spare_gates (
                      di_nd3,
                      di_nd2,
                      di_nd1,
                      di_nd0,
                      di_nr3,
                      di_nr2,
                      di_nr1,
                      di_nr0,
                      di_inv,
                      di_mx3,
                      di_mx2,
                      di_mx1,
                      di_mx0,
                      mx_sel,
                      di_reg,
                      wt_ena,
                      rst,
                      si,
                      se,
                      clk,
                      do_nad,
                      do_nor,
                      do_inv,
                      do_mux,
                      do_q,
                      so
                     );

input     [2:0] di_nd3;
input     [2:0] di_nd2;
input     [2:0] di_nd1;
input     [2:0] di_nd0;

input     [1:0] di_nr3;
input     [1:0] di_nr2;
input     [1:0] di_nr1;
input     [1:0] di_nr0;

input     [3:0] di_inv;

input     [1:0] di_mx3;
input     [1:0] di_mx2;
input     [1:0] di_mx1;
input     [1:0] di_mx0;
input     [3:0] mx_sel;

input     [3:0] di_reg;
input     [3:0] wt_ena;
input     [3:0] rst;

input           si;
input           se;
input           clk;

output    [3:0] do_nad;
output    [3:0] do_nor;
output    [3:0] do_inv;
output    [3:0] do_mux;
output    [3:0] do_q;
output          so;

wire      [3:0] do_nad;
wire      [3:0] do_nor;
wire      [3:0] do_inv;
wire      [3:0] do_mux;
wire      [3:0] do_q;
wire            so  = do_q[3];

wire      [3:0] rst_l;

  ND3M1P     nand3_3  ( .Z(do_nad[3]), .A(di_nd3[0]), .B(di_nd3[1]), .C(di_nd3[2]) );
  ND3M1P     nand3_2  ( .Z(do_nad[2]), .A(di_nd2[0]), .B(di_nd2[1]), .C(di_nd2[2]) );
  ND3M1P     nand3_1  ( .Z(do_nad[1]), .A(di_nd1[0]), .B(di_nd1[1]), .C(di_nd1[2]) );
  ND3M1P     nand3_0  ( .Z(do_nad[0]), .A(di_nd0[0]), .B(di_nd0[1]), .C(di_nd0[2]) );

  NR2M1P     nor_3    ( .Z(do_nor[3]), .A(di_nr3[0]), .B(di_nr3[1]) );
  NR2M1P     nor_2    ( .Z(do_nor[2]), .A(di_nr2[0]), .B(di_nr2[1]) );
  NR2M1P     nor_1    ( .Z(do_nor[1]), .A(di_nr1[0]), .B(di_nr1[1]) );
  NR2M1P     nor_0    ( .Z(do_nor[0]), .A(di_nr0[0]), .B(di_nr0[1]) );

  N1M1P      inv_3    ( .Z(do_inv[3]), .A(di_inv[3]) );
  N1M1P      inv_2    ( .Z(do_inv[2]), .A(di_inv[2]) );
  N1M1P      inv_1    ( .Z(do_inv[1]), .A(di_inv[1]) );
  N1M1P      inv_0    ( .Z(do_inv[0]), .A(di_inv[0]) );

  MUX21HM1P  mux21_3  ( .Z(do_mux[3]), .A(di_mx3[0]), .B(di_mx3[1]), .S(mx_sel[3]) );
  MUX21HM1P  mux21_2  ( .Z(do_mux[2]), .A(di_mx2[0]), .B(di_mx2[1]), .S(mx_sel[2]) );
  MUX21HM1P  mux21_1  ( .Z(do_mux[1]), .A(di_mx1[0]), .B(di_mx1[1]), .S(mx_sel[1]) );
  MUX21HM1P  mux21_0  ( .Z(do_mux[0]), .A(di_mx0[0]), .B(di_mx0[1]), .S(mx_sel[0]) );

  FD2SL2QM1P regtre_3 ( .Q(do_q[3]), .D(di_reg[3]), .CP(clk), .CD(rst_l[3]), .TI(do_q[2]), .TE(se), .LD(wt_ena[3]) );
  FD2SL2QM1P regtre_2 ( .Q(do_q[2]), .D(di_reg[2]), .CP(clk), .CD(rst_l[2]), .TI(do_q[1]), .TE(se), .LD(wt_ena[2]) );
  FD2SL2QM1P regtre_1 ( .Q(do_q[1]), .D(di_reg[1]), .CP(clk), .CD(rst_l[1]), .TI(do_q[0]), .TE(se), .LD(wt_ena[1]) );
  FD2SL2QM1P regtre_0 ( .Q(do_q[0]), .D(di_reg[0]), .CP(clk), .CD(rst_l[0]), .TI(si),      .TE(se), .LD(wt_ena[0]) );

  N1M1P      inv_rst_3( .Z(rst_l[3]),  .A(rst[3]) );
  N1M1P      inv_rst_2( .Z(rst_l[2]),  .A(rst[2]) );
  N1M1P      inv_rst_1( .Z(rst_l[1]),  .A(rst[1]) );
  N1M1P      inv_rst_0( .Z(rst_l[0]),  .A(rst[0]) );

endmodule 


`else // !ifdef NEPTUNE
`endif



