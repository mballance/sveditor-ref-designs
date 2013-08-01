// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_regfl.v
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

module niu_smx_regfl(
  clk,
  reset_l,
  wr,
  addr_wr,
  data_wr,
  rd,
  addr_rd,
  data_rd
);

// synopsys template

  parameter DATA_WIDTH= 100;
  parameter ADDR_WIDTH= 5;
  parameter ENTRY_SIZE= 1<<ADDR_WIDTH;
  input reset_l;
  input clk;
  input wr;
  input [ADDR_WIDTH-1:0] addr_wr;
  input [ADDR_WIDTH-1:0] addr_rd;
  input rd;
  input [DATA_WIDTH-1:0] data_wr;
  output [DATA_WIDTH-1:0] data_rd;

  reg [DATA_WIDTH-1:0] data_rd;
  reg [DATA_WIDTH-1:0] data[0:ENTRY_SIZE-1];
  integer i;

  always @(posedge clk) begin
    if(!reset_l) begin
      for(i=0; i<ENTRY_SIZE; i=i+1) 
        data[i]<= `SMX_PD  {DATA_WIDTH{1'b0}};
    end
    else begin
      if(wr)begin
        data[addr_wr]<= `SMX_PD  data_wr;
      end
    end
  end

  always @(posedge clk) begin
    if(rd) begin
      data_rd<= `SMX_PD  data[addr_rd];
    end
  end

endmodule


/*
// not use; to be removed
module niu_smx_regfl_nfo( // non flop out
  clk,
  reset_l,
  wr,
  addr_wr,
  data_wr,
  addr_rd,
  data_rd
);


  parameter DATA_WIDTH= 100;
  parameter ADDR_WIDTH= 5;
  parameter ENTRY_SIZE= 1<<ADDR_WIDTH;
  input reset_l;
  input clk;
  input wr;
  input [ADDR_WIDTH-1:0] addr_wr;
  input [ADDR_WIDTH-1:0] addr_rd;
  input [DATA_WIDTH-1:0] data_wr;
  output [DATA_WIDTH-1:0] data_rd;

  reg [DATA_WIDTH-1:0] data[0:ENTRY_SIZE-1];
  integer i;

  always @(posedge clk) begin
    if(!reset_l) begin
      for(i=0; i<ENTRY_SIZE; i=i+1) 
        data[i]<= `SMX_PD  {DATA_WIDTH{1'b0}};
    end
    else begin
      if(wr)begin
        data[addr_wr]<= `SMX_PD  data_wr;
      end
    end
  end

  wire [DATA_WIDTH-1:0] data_rd_n= data[addr_rd];
  wire [DATA_WIDTH-1:0] data_rd= data_rd_n;

endmodule
*/


