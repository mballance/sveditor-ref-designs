// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: library.v
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
module dff_l  (signal_in,signal_out,clk);

parameter SIZE = 1;
parameter INITIAL_VALUE=0;

input [SIZE-1:0] signal_in;
output [SIZE-1:0] signal_out;
input clk;
reg [SIZE-1:0] signal_out_reg;

assign signal_out = signal_out_reg;

always@(posedge clk)
begin
  signal_out_reg[SIZE-1:0] <= signal_in[SIZE-1:0];
end

initial begin
 signal_out_reg = INITIAL_VALUE;
end

endmodule


module dff_p  (signal_in,signal_out,clk);

parameter SIZE = 1;
parameter INITIAL_VALUE=0;

input [SIZE-1:0] signal_in;
output [SIZE-1:0] signal_out;
input clk;
reg [SIZE-1:0] signal_out_reg;

assign signal_out = signal_out_reg;

always@(posedge clk)
begin
  signal_out_reg[SIZE-1:0] <= signal_in[SIZE-1:0];
end

initial begin
 signal_out_reg = INITIAL_VALUE;
end

endmodule

module dff_n  (signal_in,signal_out,clk);

parameter SIZE = 1;
parameter INITIAL_VALUE=0;

input [SIZE-1:0] signal_in;
output [SIZE-1:0] signal_out;
input clk;
reg [SIZE-1:0] signal_out;

always@(negedge clk)
begin
  signal_out[SIZE-1:0] <= signal_in[SIZE-1:0];
end

initial begin
 signal_out = INITIAL_VALUE;
end


endmodule

module dff_fbd  (signal_in,signal_out,clk);

parameter SIZE = 1;

input [SIZE-1:0] signal_in;
output [SIZE-1:0] signal_out;
input clk;
reg [SIZE-1:0] signal_out;

always@(negedge clk)
begin
  signal_out[SIZE-1:0] <= signal_in[SIZE-1:0];
end


endmodule


