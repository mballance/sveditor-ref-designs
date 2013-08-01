// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: serializer.v
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

/// Module to serialize the data before putting it on the bus
module serializer(  lane_in0,
                    lane_in1,
                    lane_in2,
                    lane_in3,
                    lane_in4,
                    lane_in5,
                    lane_in6,
                    lane_in7,
                    lane_in8,
                    lane_in9,
                    link_clk,
                    out,
                    out_bar,
                    frame_boundary
                    );


input [`LINK_WIDTH-1:0] lane_in0;
input [`LINK_WIDTH-1:0] lane_in1;
input [`LINK_WIDTH-1:0] lane_in2;
input [`LINK_WIDTH-1:0] lane_in3;
input [`LINK_WIDTH-1:0] lane_in4;
input [`LINK_WIDTH-1:0] lane_in5;
input [`LINK_WIDTH-1:0] lane_in6;
input [`LINK_WIDTH-1:0] lane_in7;
input [`LINK_WIDTH-1:0] lane_in8;
input [`LINK_WIDTH-1:0] lane_in9;
input link_clk; // SymbolClk/10
input frame_boundary;
output [`LINK_WIDTH-1:0] out, out_bar;

reg [3:0] counter, prev_counter, lock_counter;
reg [3:0] curr_state;
reg [5:0] tx_lane0_deskew,tx_lane1_deskew,tx_lane2_deskew,tx_lane3_deskew;
reg [5:0] tx_lane4_deskew,tx_lane5_deskew,tx_lane6_deskew,tx_lane7_deskew;
integer i;
reg val;

 



reg [`LINK_WIDTH-1:0] out_reg,out_bar_reg;



reg comma_detected;
reg sequence_start;
wire all_lanes_detected;
wire sym_boundary;

// Inputs to this module do not have any skew, since they come from the TL,DLL
// Only outputs to the bus will have necessary skew
// Max skew = 20ns or 50 UI


assign out     = out_reg[`LINK_WIDTH-1:0];
assign out_bar = out_bar_reg[`LINK_WIDTH-1:0];


initial begin
comma_detected = 1'b0;
sequence_start = 1'b0;
counter = 4'ha;
lock_counter = 4'h0;
prev_counter = 4'h0;
curr_state = 4'h0;

//$fsdbDumpvars;
end


// Above codes for getting symbol boundary lock...

// Now the main code for reading in incoming data and do the work of serial-parallel
// Always block takes care of the serialization.
// If only some of the 32 lanes are active, the inactive ones will have all zeroes(or encoded version of zeroes, which have no meaning)

always @(posedge link_clk)
begin
    case(curr_state)
    4'h0 : begin 
           for(i=0;i<`LINK_WIDTH;i=i+1)
               begin
                   out_reg[i] <= lane_in0[i] ; out_bar_reg[i] <= ~lane_in0[i] ;  
               end
           end
    4'h1 : begin
           for(i=0;i<`LINK_WIDTH;i=i+1)
               begin
                   out_reg[i] <= lane_in1[i] ; out_bar_reg[i] <= ~lane_in1[i] ;  
               end
           end
    4'h2 : begin 
            for(i=0;i<`LINK_WIDTH;i=i+1)
               begin
                   out_reg[i] <= lane_in2[i] ; out_bar_reg[i] <= ~lane_in2[i] ;  
               end
           end
    4'h3 : begin 
           for(i=0;i<`LINK_WIDTH;i=i+1)
               begin
                   out_reg[i] <= lane_in3[i] ; out_bar_reg[i] <= ~lane_in3[i] ;  
               end
           end
    4'h4 : begin 
           for(i=0;i<`LINK_WIDTH;i=i+1)
               begin
                   out_reg[i] <= lane_in4[i] ; out_bar_reg[i] <= ~lane_in4[i] ;  
               end
           end
    4'h5 : begin 
           for(i=0;i<`LINK_WIDTH;i=i+1)
               begin
                   out_reg[i] <= lane_in5[i] ; out_bar_reg[i] <= ~lane_in5[i] ;  
               end
           end
    4'h6 : begin 
           for(i=0;i<`LINK_WIDTH;i=i+1)
               begin
                   out_reg[i] <= lane_in6[i] ; out_bar_reg[i] <= ~lane_in6[i] ;  
               end
           end
    4'h7 : begin 
           for(i=0;i<`LINK_WIDTH;i=i+1)
               begin
                   out_reg[i] <= lane_in7[i] ; out_bar_reg[i] <= ~lane_in7[i] ;  
               end
           end
    4'h8 : begin 
           for(i=0;i<`LINK_WIDTH;i=i+1)
               begin
                   out_reg[i] <= lane_in8[i] ; out_bar_reg[i] <= ~lane_in8[i] ;  
               end
           end
    4'h9 : begin 
           for(i=0;i<`LINK_WIDTH;i=i+1)
               begin
                   out_reg[i] <= lane_in9[i] ; out_bar_reg[i] <= ~lane_in9[i] ;  
               end
           end
    endcase
end
    
/// State counter block
always @(negedge link_clk)
begin
    case(curr_state)
    4'h0 : begin curr_state <= 4'h1 ; end
    4'h1 : begin curr_state <= 4'h2 ; end
    4'h2 : begin curr_state <= 4'h3 ; end
    4'h3 : begin curr_state <= 4'h4 ; end
    4'h4 : begin curr_state <= 4'h5 ; end
    4'h5 : begin curr_state <= 4'h6 ; end
    4'h6 : begin curr_state <= 4'h7 ; end
    4'h7 : begin curr_state <= 4'h8 ; end
    4'h8 : begin curr_state <= 4'h9 ; end
    4'h9 : begin if(frame_boundary) curr_state <= 4'h0 ; end
    endcase
end



           
endmodule
