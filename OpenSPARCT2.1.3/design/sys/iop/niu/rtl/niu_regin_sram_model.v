// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_regin_sram_model.v
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
/*************************************************************************
 *
 * File Name    : niu_regin_sram_model
 * Author Name  : John Lo
 * Description  : A parameterizable register in SRAM model.  
 * Parent Module:  
 * Child  Module: 
 * Interface Mod:
 * Date Created : 4/15/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module niu_regin_sram_model (
din,
we,
waddr,
clk,
re,
raddr,
dout
);

parameter WIDTH = 16,           // Width (# of bits)
	  ADDR_BITS = 4,        // number of address bits
	  DEPTH = 1<<ADDR_BITS; // number of entries

//======================================================================
// Input/Outputs declarations
//======================================================================

input   [WIDTH-1:0]     din;    // data in
input 	                we;     // Write strobe
input   [ADDR_BITS-1:0] waddr;  // write address
input                   clk;    // Clock
input 	                re;     // read enable
input   [ADDR_BITS-1:0] raddr;  // read address
output  [WIDTH-1:0]     dout;

wire    [WIDTH-1:0]     dout;
   
// The memory array
reg     [WIDTH-1:0]     mem [DEPTH-1:0];
reg     [ADDR_BITS-1:0] raddr_reg;  // read address
wire    [ADDR_BITS-1:0] raddr;      // read address

// latch read address
always @(posedge clk)
  if (re) 
     raddr_reg <= raddr;
  else
     raddr_reg <= raddr_reg;
   
// Output mux
assign    dout  = mem[raddr_reg];

// verilint 257 off
// verilint 280 off
// verilint 548 off
// verilint 193 off
// verilint 529 off

//latch write data
always @(posedge clk)
begin
   if (we)
      mem[waddr] <= din;
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
    $display("Register Array Memory dump.  Width=%0d, Depth=%0d",WIDTH,DEPTH);
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


endmodule // niu_regin_sram_model



