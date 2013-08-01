// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: deserializer.v
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
`timescale 100ps / 10ps
`ifdef LINK_1
    `define LINK_WIDTH 1
`else
    `ifdef LINK_2
        `define LINK_WIDTH 2
    `else
        `ifdef LINK_4
            `define LINK_WIDTH 4
        `else
            `ifdef LINK_12
                `define LINK_WIDTH 12
            `else
                `ifdef LINK_16
                    `define LINK_WIDTH 16
                `else
                    `ifdef LINK_24
                        `define LINK_WIDTH 24
                    `else
                        `ifdef LINK_32
                            `define LINK_WIDTH 32
                        `else
                            `define LINK_WIDTH 8
                        `endif
                    `endif
                `endif
            `endif
        `endif
    `endif
`endif


`define IDLE 0
`define ACTIVE 1
/// This module deserializes the data after it samples it from the bus
module deserializer(  lane_in,
                      lane_in_bar,
                      lane_out0,
                      lane_out1,
                      lane_out2,
                      lane_out3,
                      lane_out4,
                      lane_out5,
                      lane_out6,
                      lane_out7,
                      lane_out8,
                      lane_out9,
                      lane_out0_b,
                      lane_out1_b,
                      lane_out2_b,
                      lane_out3_b,
                      lane_out4_b,
                      lane_out5_b,
                      lane_out6_b,
                      lane_out7_b,
                      lane_out8_b,
                      lane_out9_b,
                      frm_boundary,
                      init_done,
                      ts1_pattern_received,
                      data_rdy,
                      link_clk);


output [`LINK_WIDTH-1:0] lane_out0;
output [`LINK_WIDTH-1:0] lane_out1;
output [`LINK_WIDTH-1:0] lane_out2;
output [`LINK_WIDTH-1:0] lane_out3;
output [`LINK_WIDTH-1:0] lane_out4;
output [`LINK_WIDTH-1:0] lane_out5;
output [`LINK_WIDTH-1:0] lane_out6;
output [`LINK_WIDTH-1:0] lane_out7;
output [`LINK_WIDTH-1:0] lane_out8;
output [`LINK_WIDTH-1:0] lane_out9;
output [`LINK_WIDTH-1:0] lane_out0_b;
output [`LINK_WIDTH-1:0] lane_out1_b;
output [`LINK_WIDTH-1:0] lane_out2_b;
output [`LINK_WIDTH-1:0] lane_out3_b;
output [`LINK_WIDTH-1:0] lane_out4_b;
output [`LINK_WIDTH-1:0] lane_out5_b;
output [`LINK_WIDTH-1:0] lane_out6_b;
output [`LINK_WIDTH-1:0] lane_out7_b;
output [`LINK_WIDTH-1:0] lane_out8_b;
output [`LINK_WIDTH-1:0] lane_out9_b;
output                   data_rdy;
input  [`LINK_WIDTH-1:0] lane_in;
input  [`LINK_WIDTH-1:0] lane_in_bar;
input init_done;

input link_clk;
input frm_boundary;
input ts1_pattern_received;

reg [3:0] curr_state;
reg [1:0] curr_pl_state;
reg [`LINK_WIDTH-1:0] reg_out0;
reg [`LINK_WIDTH-1:0] reg_out1;
reg [`LINK_WIDTH-1:0] reg_out2;
reg [`LINK_WIDTH-1:0] reg_out3;
reg [`LINK_WIDTH-1:0] reg_out4;
reg [`LINK_WIDTH-1:0] reg_out5;
reg [`LINK_WIDTH-1:0] reg_out6;
reg [`LINK_WIDTH-1:0] reg_out7;
reg [`LINK_WIDTH-1:0] reg_out8;
reg [`LINK_WIDTH-1:0] reg_out9;

reg [`LINK_WIDTH-1:0] reg_out0_b;
reg [`LINK_WIDTH-1:0] reg_out1_b;
reg [`LINK_WIDTH-1:0] reg_out2_b;
reg [`LINK_WIDTH-1:0] reg_out3_b;
reg [`LINK_WIDTH-1:0] reg_out4_b;
reg [`LINK_WIDTH-1:0] reg_out5_b;
reg [`LINK_WIDTH-1:0] reg_out6_b;
reg [`LINK_WIDTH-1:0] reg_out7_b;
reg [`LINK_WIDTH-1:0] reg_out8_b;
reg [`LINK_WIDTH-1:0] reg_out9_b;

reg [`LINK_WIDTH-1:0] reg_in0;
reg [`LINK_WIDTH-1:0] reg_in1;
reg [`LINK_WIDTH-1:0] reg_in2;
reg [`LINK_WIDTH-1:0] reg_in3;
reg [`LINK_WIDTH-1:0] reg_in4;
reg [`LINK_WIDTH-1:0] reg_in5;
reg [`LINK_WIDTH-1:0] reg_in6;
reg [`LINK_WIDTH-1:0] reg_in7;
reg [`LINK_WIDTH-1:0] reg_in8;
reg [`LINK_WIDTH-1:0] reg_in9;
reg [`LINK_WIDTH-1:0] reg_in0_b;

reg [`LINK_WIDTH-1:0] reg_in1_b;
reg [`LINK_WIDTH-1:0] reg_in2_b;
reg [`LINK_WIDTH-1:0] reg_in3_b;
reg [`LINK_WIDTH-1:0] reg_in4_b;
reg [`LINK_WIDTH-1:0] reg_in5_b;
reg [`LINK_WIDTH-1:0] reg_in6_b;
reg [`LINK_WIDTH-1:0] reg_in7_b;
reg [`LINK_WIDTH-1:0] reg_in8_b;
reg [`LINK_WIDTH-1:0] reg_in9_b;
reg [9:0]              ireg_in;
reg [9:0]              ireg_in_b;
reg [3:0]              sym_counter;
reg [3:0]              lock_counter;
reg [3:0]              prev_sym_counter;
reg                    com_detected;


wire [`LINK_WIDTH-1:0] in_val;
wire [`LINK_WIDTH-1:0] in_val_bar;
reg data_rdy_reg;

assign lane_out0 = reg_out0;
assign lane_out1 = reg_out1;
assign lane_out2 = reg_out2;
assign lane_out3 = reg_out3;
assign lane_out4 = reg_out4;
assign lane_out5 = reg_out5;
assign lane_out6 = reg_out6;
assign lane_out7 = reg_out7;
assign lane_out8 = reg_out8;
assign lane_out9 = reg_out9;
assign lane_out0_b = reg_out0_b;
assign lane_out1_b = reg_out1_b;
assign lane_out2_b = reg_out2_b;
assign lane_out3_b = reg_out3_b;
assign lane_out4_b = reg_out4_b;
assign lane_out5_b = reg_out5_b;
assign lane_out6_b = reg_out6_b;
assign lane_out7_b = reg_out7_b;
assign lane_out8_b = reg_out8_b;
assign lane_out9_b = reg_out9_b;
assign data_rdy = data_rdy_reg;

assign in_val = lane_in;
assign in_val_bar = lane_in_bar;


initial
begin
curr_state = 4'h0;
curr_pl_state = 2'h0;
sym_counter   = 4'h0;
lock_counter  = 4'h0;
prev_sym_counter = 0;
end

always @(negedge link_clk)
begin
   if(sym_counter === 4'ha)
       sym_counter <= 1;
   else
       sym_counter <= sym_counter + 1;
end

always @(negedge link_clk)
begin
    case(curr_pl_state)
    `IDLE   : begin
              if(lane_in !== lane_in_bar)
                  curr_pl_state <= `ACTIVE;
              end

    `ACTIVE : begin
              if((lane_in === lane_in_bar) && init_done)
                  curr_pl_state <= `IDLE;
              end
    endcase
end

/// data shifting logic
always @(posedge link_clk)
begin
    if((curr_pl_state === `ACTIVE))
    begin
       ireg_in[9:0] <= {in_val[0],ireg_in[9:1]};
       ireg_in_b[9:0] <= {in_val_bar[0],ireg_in_b[9:1]};
    end
end


always @(negedge link_clk)
begin
    if(init_done || !ts1_pattern_received)
    begin
        case(curr_state)
        4'h0 : begin curr_state <= 1; end 
        4'h1 : begin curr_state <= 2; end
        4'h2 : begin curr_state <= 3; end
        4'h3 : begin curr_state <= 4; end
        4'h4 : begin curr_state <= 5; end
        4'h5 : begin curr_state <= 6; end
        4'h6 : begin curr_state <= 7; end
        4'h7 : begin curr_state <= 8; end
        4'h8 : begin curr_state <= 9; end
        4'h9 : begin if(frm_boundary) curr_state <= 0; end
        endcase
   end
end

/// Store the incoming data into registers
always @(negedge link_clk)
begin
    reg_out0 <= reg_in0;
    reg_out1 <= reg_in1;
    reg_out2 <= reg_in2;
    reg_out3 <= reg_in3;
    reg_out4 <= reg_in4;
    reg_out5 <= reg_in5;
    reg_out6 <= reg_in6;
    reg_out7 <= reg_in7;
    reg_out8 <= reg_in8;
    reg_out9 <= reg_in9;
    reg_out0_b <= reg_in0_b;
    reg_out1_b <= reg_in1_b;
    reg_out2_b <= reg_in2_b;
    reg_out3_b <= reg_in3_b;
    reg_out4_b <= reg_in4_b;
    reg_out5_b <= reg_in5_b;
    reg_out6_b <= reg_in6_b;
    reg_out7_b <= reg_in7_b;
    reg_out8_b <= reg_in8_b;
    reg_out9_b <= reg_in9_b;
end


/// Based on the current state counters assign values to registers
/// Reset current state counter if ini not yet done
always @(posedge link_clk)
begin
    if(init_done || !ts1_pattern_received)
    begin
        case(curr_state)
            4'h0 : begin reg_in0 <= in_val; reg_in0_b <= in_val_bar; end
            4'h1 : begin reg_in1 <= in_val; reg_in1_b <= in_val_bar; end
            4'h2 : begin reg_in2 <= in_val; reg_in2_b <= in_val_bar; end
            4'h3 : begin reg_in3 <= in_val; reg_in3_b <= in_val_bar; end
            4'h4 : begin reg_in4 <= in_val; reg_in4_b <= in_val_bar; end
            4'h5 : begin reg_in5 <= in_val; reg_in5_b <= in_val_bar; end
            4'h6 : begin reg_in6 <= in_val; reg_in6_b <= in_val_bar; end
            4'h7 : begin reg_in7 <= in_val; reg_in7_b <= in_val_bar; end
            4'h8 : begin reg_in8 <= in_val; reg_in8_b <= in_val_bar; end
            4'h9 : begin reg_in9 <= in_val; reg_in9_b <= in_val_bar; end
        endcase
    end
    else
        curr_state <= 4'h0;
end

endmodule
