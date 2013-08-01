// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_macros.v
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

/*****************************************************************
 *
 * File Name    : niu_zcp_macros.v
 * Author Name  : John Lo
 * Description  : It contains ZCP macros, 
 *                
 * Parent Module: 
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 3/26/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 ****************************************************************/

		      
module zcp_par_gen (chk_bit_data,din,par);
parameter dwidth = 8;
   input              chk_bit_data;
   input [dwidth-1:0] din;
   output             par;

   wire par_temp =  ^(din[dwidth-1:0]);
   wire par      =  chk_bit_data ^ par_temp;
   
endmodule
 
//*****************************
// Loadable Register
//*****************************
module zcp_RegLd (clk,reset,ld,ld_value,we,din,qout);

parameter dwidth = 10;
input                clk, reset;
input                ld;
input  [dwidth-1:0]  ld_value;
input                we;
input  [dwidth-1:0]  din;
output [dwidth-1:0]  qout;

reg    [dwidth-1:0]  qout;

always @ (posedge clk)
  if (reset)
    qout <= 0;
  else 
    casex({we, ld}) // synopsys parallel_case full_case
      2'b00: qout <= qout;
      2'b01: qout <= ld_value;
      2'b1x: qout <= din;
    endcase

endmodule


/***********************************
 *  RegDff
 * *********************************/
module zcp_RegDff (din,clk,qout);

parameter dwidth = 10;
input clk;
input [dwidth-1:0] din;
output [dwidth-1:0] qout;

reg   [dwidth-1:0] qout;

always @ (posedge clk)
    qout <= din;

 
endmodule // RegDff


//*****************************
// Register xREG
//*****************************
module zcp_xREG (clk,reset,en,din,qout);

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


endmodule

//*****************************
// Register xREG2
//*****************************
module zcp_xREG2 (clk,reset,reset_value,load,din,qout);

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

endmodule // zcp_xREG2

/*****************************
 * RegRst
 *****************************/
module zcp_RegRst (clk,reset,din,qout);

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

endmodule
 


/***********************************
 * Counter
 ***********************************/
module zcp_counter (reset,clk,ce,count);
parameter dwidth = 9;
input reset,clk,ce;
output [dwidth-1:0] count;

reg   [dwidth-1:0] count;

always @ (posedge clk)
  if (reset)
    count <= 0;
  else
    casex(ce)
      1'b0: count <= count;
      1'b1: count <= count + 1;
    endcase
 
endmodule

module zcp_ud_cntr (clk,reset,reset_value,inc,dec,count);
parameter dwidth = 9;
input               reset,clk,inc,dec;
input  [dwidth-1:0] reset_value;
output [dwidth-1:0] count;

reg   [dwidth-1:0] count;

always @ (posedge clk)
  if (reset)
    count <= reset_value;
  else
    casex({inc,dec})
      2'b00:  count <= count;
      2'b01:  count <= count - 1;
      2'b10:  count <= count + 1;
      2'b11:  count <= count;
      default:count <= count;
    endcase
 
endmodule


module zcp_pls_gen2_reg (clk,sig_in,lead,trail);
   input   clk;
   input   sig_in;
   output  lead;
   output  trail; 
   
   reg 	   sig_in_reg,sig_out;
   wire    lead,trail;
   
always @ (posedge clk)
  begin
     sig_in_reg <= sig_in;
     sig_out    <= sig_in_reg;
  end
   
   assign lead =  sig_in_reg & ~sig_out;

   assign trail= ~sig_in_reg &  sig_out;
   
endmodule // pls_gen2_reg


module zcp_pls_gen2 (clk,sig_in,lead,trail);
   input   clk;
   input   sig_in;
   output  lead;
   output  trail;

   wire   sig_in,lead,trail;
   reg 	  sig_out;
   
   
always @ (posedge clk)
  begin
     sig_out    <= sig_in;
  end
 
   assign lead =  sig_in & ~sig_out;
 
   assign trail= ~sig_in &  sig_out;

endmodule // zcp_pls_gen2

module zcp_pls_gen1 (clk,sig_in,lead);
   input   clk;
   input   sig_in;
   output  lead;

   wire   sig_in,lead;
   reg 	  sig_out;
   
   
always @ (posedge clk)
  begin
     sig_out    <= sig_in;
  end
 
   assign lead =  sig_in & ~sig_out;
 

endmodule // zcp_pls_gen1


module zcp_w1c_ff (clk,reset,set,ld,w1c,w1c_data,q);
   input   clk;
   input   reset;
   input   set;
   input   ld;
   input   w1c;
   input   w1c_data;
   output  q;

   wire    w1c,w1c_data;
   wire    set;
   wire    set_pls;
   wire    rst = w1c & w1c_data;
   wire    ld;
   reg 	   q;

zcp_pls_gen1 zcp_pls_gen1(.clk(clk),.sig_in(set),.lead(set_pls));
   
always @ (posedge clk)
  if (reset)
              q <= 0;
  else if (ld)
              q <= w1c_data;
  else
    case({set_pls, rst})
      2'b00:  q <= q;
      2'b01:  q <= 0; // rst
      2'b11:  q <= 0; // rst has hi pri
      2'b10:  q <= 1; // set
     default: q <= q;
    endcase   



endmodule // zcp_w1c_ff


 
module zcp_SRFF (clk,reset,set,rst,q);

input  reset, clk, set, rst;
output q;

reg q;

always @ (posedge clk)
if (reset) 
   q <= 0;
else
   casex({set, rst})
      2'b00:  q <= q;
      2'b01:  q <= 0;
      2'b1x:  q <= 1;
      default:q <= 0;
   endcase

endmodule

 
module zcp_RSFF (clk,reset,set,rst,q);

input  reset, clk, set, rst;
output q;

reg q;

always @ (posedge clk)
if (reset) 
   q <= 0;
else
   casex({set, rst})
      2'b00:  q <= q;
      2'bx1:  q <= 0;
      2'b10:  q <= 1;
      default:q <= 0;
   endcase

endmodule


// *************************************************************************
// Copyright (c) 1995 - 2001 Sun Microsystems, Inc.
//
//  All rights reserved. No part of this design may be reproduced stored 
//  in a retrieval system, or transmitted, in any form or by any means, 
//  electronic, mechanical, photocopying, recording, or otherwise, without 
//  prior written permission of Sun Microsystems, Inc.    
//
//  Sun Proprietary: Need-To-Know 
// *************************************************************************
//
//
//  Description    :  A parameterizable register file made using flip flops.
//                    Warning: Appropriate only for small number of entries.
//
//

module zcp_RegFile (
    d_in,
    wr_addr,
    rd_addr,
    wr,
            
    clk,
    
    d_out    

);

parameter WIDTH = 16,   // Width (# of bits)
	  ADDR_BITS = 4, // number of address bits
	  DEPTH = 1<<ADDR_BITS; // number of entries

//======================================================================
// Input/Outputs declarations
//======================================================================
input   clk;        // Clock

input 	wr;                          // Write strobe
input   [WIDTH-1:0] d_in;            // data in
input   [ADDR_BITS-1:0] wr_addr;     // write address
input   [ADDR_BITS-1:0] rd_addr;     // read address

output  [WIDTH-1:0] d_out;



// The memory array
reg [WIDTH-1:0] mem [DEPTH-1:0];



// Output mux
assign d_out = mem[rd_addr];


// verilint 257 off
// verilint 280 off
// verilint 548 off
// verilint 193 off
// verilint 529 off


// data_in
always @(posedge clk)
begin
   if (wr)
      mem[wr_addr] <= #1 d_in;
   else
      ;
end

//----------------------------------------------------------------------
// Debugging stuff
// verilint translate off
// synopsys translate_off
//simtech modcovoff -bpe
`ifdef DEBUG

wire [WIDTH-1:0] peek_0 = mem[0];
wire [WIDTH-1:0] peek_1 = mem[1];
wire [WIDTH-1:0] peek_2 = mem[2];
wire [WIDTH-1:0] peek_3 = mem[3];
wire [WIDTH-1:0] peek_4 = mem[4];
wire [WIDTH-1:0] peek_5 = mem[5];
wire [WIDTH-1:0] peek_6 = mem[6];
wire [WIDTH-1:0] peek_7 = mem[7];
wire [WIDTH-1:0] peek_8 = mem[8];
wire [WIDTH-1:0] peek_9 = mem[9];
wire [WIDTH-1:0] peek_10 = mem[10];
wire [WIDTH-1:0] peek_11 = mem[11];
wire [WIDTH-1:0] peek_12 = mem[12];
wire [WIDTH-1:0] peek_13 = mem[13];
wire [WIDTH-1:0] peek_14 = mem[14];
wire [WIDTH-1:0] peek_15 = mem[15];

integer i;

task dump;
begin
    $display("========================================");
    $display("Memory dump.  Width=%0d, Depth=%0d",WIDTH,DEPTH); 
    `ifdef VERILOG
    $showscopes;
    `endif
    for (i=0; i<DEPTH; i=i+1) begin
        $display("#%0x: mem(%x)",i,mem[i]);
    end
    $display("========================================");

end
endtask


`endif // DEBUG
// synopsys translate_on
// verilint translate on
//simtech modcovon -bpe


endmodule  




module zcpfifo_16d (clk,reset,we,wp,din,rp,dout);
   parameter WIDTH = 16;
   input               clk;
   input 	       reset;
   input 	       we;
   input  [3:0]        wp,rp;
   input  [WIDTH-1:0]  din;
   output [WIDTH-1:0]  dout;
   
reg  [WIDTH-1:0]  zcpfifo_reg   [0:15];  // 16 deep

// vlint flag_empty_statement off
// vlint flag_null_else_statement off
always @ (posedge clk)
  begin
  if (reset)
    begin
    zcpfifo_reg[0]  <= 0;
    zcpfifo_reg[1]  <= 0;
    zcpfifo_reg[2]  <= 0;
    zcpfifo_reg[3]  <= 0;
    zcpfifo_reg[4]  <= 0;
    zcpfifo_reg[5]  <= 0;
    zcpfifo_reg[6]  <= 0;
    zcpfifo_reg[7]  <= 0;
    zcpfifo_reg[8]  <= 0;
    zcpfifo_reg[9]  <= 0;
    zcpfifo_reg[10] <= 0;
    zcpfifo_reg[11] <= 0;
    zcpfifo_reg[12] <= 0;
    zcpfifo_reg[13] <= 0;
    zcpfifo_reg[14] <= 0;
    zcpfifo_reg[15] <= 0;
    end
  else
    case (we) // synopsys parallel_case full_case infer_mux
      1'b1: zcpfifo_reg[wp] <= din;
      1'b0: zcpfifo_reg[wp] <= zcpfifo_reg[wp]; // hold
    endcase
  end // always @ (posedge clk)
// vlint flag_empty_statement on
// vlint flag_null_else_statement on
   
   assign     dout =  zcpfifo_reg[rp];


endmodule // zcpfifo_16d




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
module zcp_spare_gates (
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



