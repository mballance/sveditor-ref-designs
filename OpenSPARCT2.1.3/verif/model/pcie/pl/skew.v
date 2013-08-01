// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: skew.v
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


module skew(lane_in,lane_in_bar,out,out_bar,link_clk);
input [`LINK_WIDTH-1:0] lane_in;
input [`LINK_WIDTH-1:0] lane_in_bar;
output [`LINK_WIDTH-1:0] out;
output [`LINK_WIDTH-1:0] out_bar;
input link_clk;

wire [`LINK_WIDTH-1:0] lane_in_d1,lane_in_d2,lane_in_d3,lane_in_d4;
wire [`LINK_WIDTH-1:0] lane_in_d5,lane_in_d6,lane_in_d7,lane_in_d8,lane_in_d9;
wire [`LINK_WIDTH-1:0] lane_in_d10,lane_in_d11,lane_in_d12,lane_in_d13,lane_in_d14;
wire [`LINK_WIDTH-1:0] lane_in_d15,lane_in_d16,lane_in_d17,lane_in_d18,lane_in_d19;
wire [`LINK_WIDTH-1:0] lane_in_d20,lane_in_d21,lane_in_d22,lane_in_d23,lane_in_d24;
wire [`LINK_WIDTH-1:0] lane_in_d25,lane_in_d26,lane_in_d27,lane_in_d28,lane_in_d29;
wire [`LINK_WIDTH-1:0] lane_in_d30,lane_in_d31,lane_in_d32,lane_in_d33,lane_in_d34;
wire [`LINK_WIDTH-1:0] lane_in_d35,lane_in_d36,lane_in_d37,lane_in_d38,lane_in_d39;
wire [`LINK_WIDTH-1:0] lane_in_d40,lane_in_d41,lane_in_d42,lane_in_d43,lane_in_d44;
wire [`LINK_WIDTH-1:0] lane_in_d45,lane_in_d46,lane_in_d47,lane_in_d48,lane_in_d49,lane_in_d50;

reg [5:0] tx_lane0_deskew,tx_lane1_deskew,tx_lane2_deskew,tx_lane3_deskew;
reg [5:0] tx_lane4_deskew,tx_lane5_deskew,tx_lane6_deskew,tx_lane7_deskew;
integer i;
reg val;

initial begin
tx_lane0_deskew = 6'h0;
tx_lane1_deskew = 6'h0;
tx_lane2_deskew = 6'h0;
tx_lane3_deskew = 6'h0;
tx_lane4_deskew = 6'h0;
tx_lane5_deskew = 6'h0;
tx_lane6_deskew = 6'h0;
tx_lane7_deskew = 6'h0;

`ifdef NO_SKEW
`else
    /// User defined TX lane skew
val = $value$plusargs("tx_lane0_deskew=%h",tx_lane0_deskew);
val = $value$plusargs("tx_lane1_deskew=%h",tx_lane1_deskew);
val = $value$plusargs("tx_lane2_deskew=%h",tx_lane2_deskew);
val = $value$plusargs("tx_lane3_deskew=%h",tx_lane3_deskew);
val = $value$plusargs("tx_lane4_deskew=%h",tx_lane4_deskew);
val = $value$plusargs("tx_lane5_deskew=%h",tx_lane5_deskew);
val = $value$plusargs("tx_lane6_deskew=%h",tx_lane6_deskew);
val = $value$plusargs("tx_lane7_deskew=%h",tx_lane7_deskew);
`endif
end

/// The following assignments are for user defined TX lane skewing
/// Maximum skew allowed = 50
assign out[0] = (tx_lane0_deskew == 6'h0)? lane_in[0] :
                (tx_lane0_deskew == 6'h1)? lane_in_d1[0] :
                (tx_lane0_deskew == 6'h2)? lane_in_d2[0] :
                (tx_lane0_deskew == 6'h3)? lane_in_d3[0] :
                (tx_lane0_deskew == 6'h4)? lane_in_d4[0] :
                (tx_lane0_deskew == 6'h5)? lane_in_d5[0] :
                (tx_lane0_deskew == 6'h6)? lane_in_d6[0] :
                (tx_lane0_deskew == 6'h7)? lane_in_d7[0] :
                (tx_lane0_deskew == 6'h8)? lane_in_d8[0] :
                (tx_lane0_deskew == 6'h9)? lane_in_d9[0] :
                (tx_lane0_deskew == 6'ha)? lane_in_d10[0] :
                (tx_lane0_deskew == 6'hb)? lane_in_d11[0] :
                (tx_lane0_deskew == 6'hc)? lane_in_d12[0] :
                (tx_lane0_deskew == 6'hd)? lane_in_d13[0] :
                (tx_lane0_deskew == 6'he)? lane_in_d14[0] :
                (tx_lane0_deskew == 6'hf)? lane_in_d15[0] :
                (tx_lane0_deskew == 6'h10)? lane_in_d16[0] :
                (tx_lane0_deskew == 6'h11)? lane_in_d17[0] :
                (tx_lane0_deskew == 6'h12)? lane_in_d18[0] :
                (tx_lane0_deskew == 6'h13)? lane_in_d19[0] :
                (tx_lane0_deskew == 6'h14)? lane_in_d20[0] :
                (tx_lane0_deskew == 6'h15)? lane_in_d21[0] :
                (tx_lane0_deskew == 6'h16)? lane_in_d22[0] :
                (tx_lane0_deskew == 6'h17)? lane_in_d23[0] :
                (tx_lane0_deskew == 6'h18)? lane_in_d24[0] :
                (tx_lane0_deskew == 6'h19)? lane_in_d25[0] :
                (tx_lane0_deskew == 6'h1a)? lane_in_d26[0] :
                (tx_lane0_deskew == 6'h1b)? lane_in_d27[0] :
                (tx_lane0_deskew == 6'h1c)? lane_in_d28[0] :
                (tx_lane0_deskew == 6'h1d)? lane_in_d29[0] :
                (tx_lane0_deskew == 6'h1e)? lane_in_d30[0] :
                (tx_lane0_deskew == 6'h1f)? lane_in_d31[0] :
                (tx_lane0_deskew == 6'h20)? lane_in_d32[0] :
                (tx_lane0_deskew == 6'h21)? lane_in_d33[0] :
                (tx_lane0_deskew == 6'h22)? lane_in_d34[0] :
                (tx_lane0_deskew == 6'h23)? lane_in_d35[0] :
                (tx_lane0_deskew == 6'h24)? lane_in_d36[0] :
                (tx_lane0_deskew == 6'h25)? lane_in_d37[0] :
                (tx_lane0_deskew == 6'h26)? lane_in_d38[0] :
                (tx_lane0_deskew == 6'h27)? lane_in_d39[0] :
                (tx_lane0_deskew == 6'h28)? lane_in_d40[0] :
                (tx_lane0_deskew == 6'h29)? lane_in_d41[0] :
                (tx_lane0_deskew == 6'h2a)? lane_in_d42[0] :
                (tx_lane0_deskew == 6'h2b)? lane_in_d43[0] :
                (tx_lane0_deskew == 6'h2c)? lane_in_d44[0] :
                (tx_lane0_deskew == 6'h2d)? lane_in_d45[0] :
                (tx_lane0_deskew == 6'h2e)? lane_in_d46[0] :
                (tx_lane0_deskew == 6'h2f)? lane_in_d47[0] :
                (tx_lane0_deskew == 6'h30)? lane_in_d48[0] :
                (tx_lane0_deskew == 6'h31)? lane_in_d49[0] :
                (tx_lane0_deskew == 6'h32)? lane_in_d50[0] : lane_in[0];

assign out[1] = (tx_lane1_deskew == 6'h0)? lane_in[1] :
                (tx_lane1_deskew == 6'h1)? lane_in_d1[1] :
                (tx_lane1_deskew == 6'h2)? lane_in_d2[1] :
                (tx_lane1_deskew == 6'h3)? lane_in_d3[1] :
                (tx_lane1_deskew == 6'h4)? lane_in_d4[1] :
                (tx_lane1_deskew == 6'h5)? lane_in_d5[1] :
                (tx_lane1_deskew == 6'h6)? lane_in_d6[1] :
                (tx_lane1_deskew == 6'h7)? lane_in_d7[1] :
                (tx_lane1_deskew == 6'h8)? lane_in_d8[1] :
                (tx_lane1_deskew == 6'h9)? lane_in_d9[1] :
                (tx_lane1_deskew == 6'ha)? lane_in_d10[1] :
                (tx_lane1_deskew == 6'hb)? lane_in_d11[1] :
                (tx_lane1_deskew == 6'hc)? lane_in_d12[1] :
                (tx_lane1_deskew == 6'hd)? lane_in_d13[1] :
                (tx_lane1_deskew == 6'he)? lane_in_d14[1] :
                (tx_lane1_deskew == 6'hf)? lane_in_d15[1] :
                (tx_lane1_deskew == 6'h10)? lane_in_d16[1] :
                (tx_lane1_deskew == 6'h11)? lane_in_d17[1] :
                (tx_lane1_deskew == 6'h12)? lane_in_d18[1] :
                (tx_lane1_deskew == 6'h13)? lane_in_d19[1] :
                (tx_lane1_deskew == 6'h14)? lane_in_d20[1] :
                (tx_lane1_deskew == 6'h15)? lane_in_d21[1] :
                (tx_lane1_deskew == 6'h16)? lane_in_d22[1] :
                (tx_lane1_deskew == 6'h17)? lane_in_d23[1] :
                (tx_lane1_deskew == 6'h18)? lane_in_d24[1] :
                (tx_lane1_deskew == 6'h19)? lane_in_d25[1] :
                (tx_lane1_deskew == 6'h1a)? lane_in_d26[1] :
                (tx_lane1_deskew == 6'h1b)? lane_in_d27[1] :
                (tx_lane1_deskew == 6'h1c)? lane_in_d28[1] :
                (tx_lane1_deskew == 6'h1d)? lane_in_d29[1] :
                (tx_lane1_deskew == 6'h1e)? lane_in_d30[1] :
                (tx_lane1_deskew == 6'h1f)? lane_in_d31[1] :
                (tx_lane1_deskew == 6'h20)? lane_in_d32[1] :
                (tx_lane1_deskew == 6'h21)? lane_in_d33[1] :
                (tx_lane1_deskew == 6'h22)? lane_in_d34[1] :
                (tx_lane1_deskew == 6'h23)? lane_in_d35[1] :
                (tx_lane1_deskew == 6'h24)? lane_in_d36[1] :
                (tx_lane1_deskew == 6'h25)? lane_in_d37[1] :
                (tx_lane1_deskew == 6'h26)? lane_in_d38[1] :
                (tx_lane1_deskew == 6'h27)? lane_in_d39[1] :
                (tx_lane1_deskew == 6'h28)? lane_in_d40[1] :
                (tx_lane1_deskew == 6'h29)? lane_in_d41[1] :
                (tx_lane1_deskew == 6'h2a)? lane_in_d42[1] :
                (tx_lane1_deskew == 6'h2b)? lane_in_d43[1] :
                (tx_lane1_deskew == 6'h2c)? lane_in_d44[1] :
                (tx_lane1_deskew == 6'h2d)? lane_in_d45[1] :
                (tx_lane1_deskew == 6'h2e)? lane_in_d46[1] :
                (tx_lane1_deskew == 6'h2f)? lane_in_d47[1] :
                (tx_lane1_deskew == 6'h30)? lane_in_d48[1] :
                (tx_lane1_deskew == 6'h31)? lane_in_d49[1] :
                (tx_lane1_deskew == 6'h32)? lane_in_d50[1] : lane_in[1];

assign out[2] = (tx_lane2_deskew == 6'h0)? lane_in[2] :
                (tx_lane2_deskew == 6'h1)? lane_in_d1[2] :
                (tx_lane2_deskew == 6'h2)? lane_in_d2[2] :
                (tx_lane2_deskew == 6'h3)? lane_in_d3[2] :
                (tx_lane2_deskew == 6'h4)? lane_in_d4[2] :
                (tx_lane2_deskew == 6'h5)? lane_in_d5[2] :
                (tx_lane2_deskew == 6'h6)? lane_in_d6[2] :
                (tx_lane2_deskew == 6'h7)? lane_in_d7[2] :
                (tx_lane2_deskew == 6'h8)? lane_in_d8[2] :
                (tx_lane2_deskew == 6'h9)? lane_in_d9[2] :
                (tx_lane2_deskew == 6'ha)? lane_in_d10[2] :
                (tx_lane2_deskew == 6'hb)? lane_in_d11[2] :
                (tx_lane2_deskew == 6'hc)? lane_in_d12[2] :
                (tx_lane2_deskew == 6'hd)? lane_in_d13[2] :
                (tx_lane2_deskew == 6'he)? lane_in_d14[2] :
                (tx_lane2_deskew == 6'hf)? lane_in_d15[2] :
                (tx_lane2_deskew == 6'h10)? lane_in_d16[2] :
                (tx_lane2_deskew == 6'h11)? lane_in_d17[2] :
                (tx_lane2_deskew == 6'h12)? lane_in_d18[2] :
                (tx_lane2_deskew == 6'h13)? lane_in_d19[2] :
                (tx_lane2_deskew == 6'h14)? lane_in_d20[2] :
                (tx_lane2_deskew == 6'h15)? lane_in_d21[2] :
                (tx_lane2_deskew == 6'h16)? lane_in_d22[2] :
                (tx_lane2_deskew == 6'h17)? lane_in_d23[2] :
                (tx_lane2_deskew == 6'h18)? lane_in_d24[2] :
                (tx_lane2_deskew == 6'h19)? lane_in_d25[2] :
                (tx_lane2_deskew == 6'h1a)? lane_in_d26[2] :
                (tx_lane2_deskew == 6'h1b)? lane_in_d27[2] :
                (tx_lane2_deskew == 6'h1c)? lane_in_d28[2] :
                (tx_lane2_deskew == 6'h1d)? lane_in_d29[2] :
                (tx_lane2_deskew == 6'h1e)? lane_in_d30[2] :
                (tx_lane2_deskew == 6'h1f)? lane_in_d31[2] :
                (tx_lane2_deskew == 6'h20)? lane_in_d32[2] :
                (tx_lane2_deskew == 6'h21)? lane_in_d33[2] :
                (tx_lane2_deskew == 6'h22)? lane_in_d34[2] :
                (tx_lane2_deskew == 6'h23)? lane_in_d35[2] :
                (tx_lane2_deskew == 6'h24)? lane_in_d36[2] :
                (tx_lane2_deskew == 6'h25)? lane_in_d37[2] :
                (tx_lane2_deskew == 6'h26)? lane_in_d38[2] :
                (tx_lane2_deskew == 6'h27)? lane_in_d39[2] :
                (tx_lane2_deskew == 6'h28)? lane_in_d40[2] :
                (tx_lane2_deskew == 6'h29)? lane_in_d41[2] :
                (tx_lane2_deskew == 6'h2a)? lane_in_d42[2] :
                (tx_lane2_deskew == 6'h2b)? lane_in_d43[2] :
                (tx_lane2_deskew == 6'h2c)? lane_in_d44[2] :
                (tx_lane2_deskew == 6'h2d)? lane_in_d45[2] :
                (tx_lane2_deskew == 6'h2e)? lane_in_d46[2] :
                (tx_lane2_deskew == 6'h2f)? lane_in_d47[2] :
                (tx_lane2_deskew == 6'h30)? lane_in_d48[2] :
                (tx_lane2_deskew == 6'h31)? lane_in_d49[2] :
                (tx_lane2_deskew == 6'h32)? lane_in_d50[2] : lane_in[2];

assign out[3] = (tx_lane3_deskew == 6'h0)? lane_in[3] :
                (tx_lane3_deskew == 6'h1)? lane_in_d1[3] :
                (tx_lane3_deskew == 6'h2)? lane_in_d2[3] :
                (tx_lane3_deskew == 6'h3)? lane_in_d3[3] :
                (tx_lane3_deskew == 6'h4)? lane_in_d4[3] :
                (tx_lane3_deskew == 6'h5)? lane_in_d5[3] :
                (tx_lane3_deskew == 6'h6)? lane_in_d6[3] :
                (tx_lane3_deskew == 6'h7)? lane_in_d7[3] :
                (tx_lane3_deskew == 6'h8)? lane_in_d8[3] :
                (tx_lane3_deskew == 6'h9)? lane_in_d9[3] :
                (tx_lane3_deskew == 6'ha)? lane_in_d10[3] :
                (tx_lane3_deskew == 6'hb)? lane_in_d11[3] :
                (tx_lane3_deskew == 6'hc)? lane_in_d12[3] :
                (tx_lane3_deskew == 6'hd)? lane_in_d13[3] :
                (tx_lane3_deskew == 6'he)? lane_in_d14[3] :
                (tx_lane3_deskew == 6'hf)? lane_in_d15[3] :
                (tx_lane3_deskew == 6'h10)? lane_in_d16[3] :
                (tx_lane3_deskew == 6'h11)? lane_in_d17[3] :
                (tx_lane3_deskew == 6'h12)? lane_in_d18[3] :
                (tx_lane3_deskew == 6'h13)? lane_in_d19[3] :
                (tx_lane3_deskew == 6'h14)? lane_in_d20[3] :
                (tx_lane3_deskew == 6'h15)? lane_in_d21[3] :
                (tx_lane3_deskew == 6'h16)? lane_in_d22[3] :
                (tx_lane3_deskew == 6'h17)? lane_in_d23[3] :
                (tx_lane3_deskew == 6'h18)? lane_in_d24[3] :
                (tx_lane3_deskew == 6'h19)? lane_in_d25[3] :
                (tx_lane3_deskew == 6'h1a)? lane_in_d26[3] :
                (tx_lane3_deskew == 6'h1b)? lane_in_d27[3] :
                (tx_lane3_deskew == 6'h1c)? lane_in_d28[3] :
                (tx_lane3_deskew == 6'h1d)? lane_in_d29[3] :
                (tx_lane3_deskew == 6'h1e)? lane_in_d30[3] :
                (tx_lane3_deskew == 6'h1f)? lane_in_d31[3] :
                (tx_lane3_deskew == 6'h20)? lane_in_d32[3] :
                (tx_lane3_deskew == 6'h21)? lane_in_d33[3] :
                (tx_lane3_deskew == 6'h22)? lane_in_d34[3] :
                (tx_lane3_deskew == 6'h23)? lane_in_d35[3] :
                (tx_lane3_deskew == 6'h24)? lane_in_d36[3] :
                (tx_lane3_deskew == 6'h25)? lane_in_d37[3] :
                (tx_lane3_deskew == 6'h26)? lane_in_d38[3] :
                (tx_lane3_deskew == 6'h27)? lane_in_d39[3] :
                (tx_lane3_deskew == 6'h28)? lane_in_d40[3] :
                (tx_lane3_deskew == 6'h29)? lane_in_d41[3] :
                (tx_lane3_deskew == 6'h2a)? lane_in_d42[3] :
                (tx_lane3_deskew == 6'h2b)? lane_in_d43[3] :
                (tx_lane3_deskew == 6'h2c)? lane_in_d44[3] :
                (tx_lane3_deskew == 6'h2d)? lane_in_d45[3] :
                (tx_lane3_deskew == 6'h2e)? lane_in_d46[3] :
                (tx_lane3_deskew == 6'h2f)? lane_in_d47[3] :
                (tx_lane3_deskew == 6'h30)? lane_in_d48[3] :
                (tx_lane3_deskew == 6'h31)? lane_in_d49[3] :
                (tx_lane3_deskew == 6'h32)? lane_in_d50[3] : lane_in[3];

assign out[4] = (tx_lane4_deskew == 6'h0)? lane_in[4] :
                (tx_lane4_deskew == 6'h1)? lane_in_d1[4] :
                (tx_lane4_deskew == 6'h2)? lane_in_d2[4] :
                (tx_lane4_deskew == 6'h3)? lane_in_d3[4] :
                (tx_lane4_deskew == 6'h4)? lane_in_d4[4] :
                (tx_lane4_deskew == 6'h5)? lane_in_d5[4] :
                (tx_lane4_deskew == 6'h6)? lane_in_d6[4] :
                (tx_lane4_deskew == 6'h7)? lane_in_d7[4] :
                (tx_lane4_deskew == 6'h8)? lane_in_d8[4] :
                (tx_lane4_deskew == 6'h9)? lane_in_d9[4] :
                (tx_lane4_deskew == 6'ha)? lane_in_d10[4] :
                (tx_lane4_deskew == 6'hb)? lane_in_d11[4] :
                (tx_lane4_deskew == 6'hc)? lane_in_d12[4] :
                (tx_lane4_deskew == 6'hd)? lane_in_d13[4] :
                (tx_lane4_deskew == 6'he)? lane_in_d14[4] :
                (tx_lane4_deskew == 6'hf)? lane_in_d15[4] :
                (tx_lane4_deskew == 6'h10)? lane_in_d16[4] :
                (tx_lane4_deskew == 6'h11)? lane_in_d17[4] :
                (tx_lane4_deskew == 6'h12)? lane_in_d18[4] :
                (tx_lane4_deskew == 6'h13)? lane_in_d19[4] :
                (tx_lane4_deskew == 6'h14)? lane_in_d20[4] :
                (tx_lane4_deskew == 6'h15)? lane_in_d21[4] :
                (tx_lane4_deskew == 6'h16)? lane_in_d22[4] :
                (tx_lane4_deskew == 6'h17)? lane_in_d23[4] :
                (tx_lane4_deskew == 6'h18)? lane_in_d24[4] :
                (tx_lane4_deskew == 6'h19)? lane_in_d25[4] :
                (tx_lane4_deskew == 6'h1a)? lane_in_d26[4] :
                (tx_lane4_deskew == 6'h1b)? lane_in_d27[4] :
                (tx_lane4_deskew == 6'h1c)? lane_in_d28[4] :
                (tx_lane4_deskew == 6'h1d)? lane_in_d29[4] :
                (tx_lane4_deskew == 6'h1e)? lane_in_d30[4] :
                (tx_lane4_deskew == 6'h1f)? lane_in_d31[4] :
                (tx_lane4_deskew == 6'h20)? lane_in_d32[4] :
                (tx_lane4_deskew == 6'h21)? lane_in_d33[4] :
                (tx_lane4_deskew == 6'h22)? lane_in_d34[4] :
                (tx_lane4_deskew == 6'h23)? lane_in_d35[4] :
                (tx_lane4_deskew == 6'h24)? lane_in_d36[4] :
                (tx_lane4_deskew == 6'h25)? lane_in_d37[4] :
                (tx_lane4_deskew == 6'h26)? lane_in_d38[4] :
                (tx_lane4_deskew == 6'h27)? lane_in_d39[4] :
                (tx_lane4_deskew == 6'h28)? lane_in_d40[4] :
                (tx_lane4_deskew == 6'h29)? lane_in_d41[4] :
                (tx_lane4_deskew == 6'h2a)? lane_in_d42[4] :
                (tx_lane4_deskew == 6'h2b)? lane_in_d43[4] :
                (tx_lane4_deskew == 6'h2c)? lane_in_d44[4] :
                (tx_lane4_deskew == 6'h2d)? lane_in_d45[4] :
                (tx_lane4_deskew == 6'h2e)? lane_in_d46[4] :
                (tx_lane4_deskew == 6'h2f)? lane_in_d47[4] :
                (tx_lane4_deskew == 6'h30)? lane_in_d48[4] :
                (tx_lane4_deskew == 6'h31)? lane_in_d49[4] :
                (tx_lane4_deskew == 6'h32)? lane_in_d50[4] : lane_in[4];

assign out[5] = (tx_lane5_deskew == 6'h0)? lane_in[5] :
                (tx_lane5_deskew == 6'h1)? lane_in_d1[5] :
                (tx_lane5_deskew == 6'h2)? lane_in_d2[5] :
                (tx_lane5_deskew == 6'h3)? lane_in_d3[5] :
                (tx_lane5_deskew == 6'h4)? lane_in_d4[5] :
                (tx_lane5_deskew == 6'h5)? lane_in_d5[5] :
                (tx_lane5_deskew == 6'h6)? lane_in_d6[5] :
                (tx_lane5_deskew == 6'h7)? lane_in_d7[5] :
                (tx_lane5_deskew == 6'h8)? lane_in_d8[5] :
                (tx_lane5_deskew == 6'h9)? lane_in_d9[5] :
                (tx_lane5_deskew == 6'ha)? lane_in_d10[5] :
                (tx_lane5_deskew == 6'hb)? lane_in_d11[5] :
                (tx_lane5_deskew == 6'hc)? lane_in_d12[5] :
                (tx_lane5_deskew == 6'hd)? lane_in_d13[5] :
                (tx_lane5_deskew == 6'he)? lane_in_d14[5] :
                (tx_lane5_deskew == 6'hf)? lane_in_d15[5] :
                (tx_lane5_deskew == 6'h10)? lane_in_d16[5] :
                (tx_lane5_deskew == 6'h11)? lane_in_d17[5] :
                (tx_lane5_deskew == 6'h12)? lane_in_d18[5] :
                (tx_lane5_deskew == 6'h13)? lane_in_d19[5] :
                (tx_lane5_deskew == 6'h14)? lane_in_d20[5] :
                (tx_lane5_deskew == 6'h15)? lane_in_d21[5] :
                (tx_lane5_deskew == 6'h16)? lane_in_d22[5] :
                (tx_lane5_deskew == 6'h17)? lane_in_d23[5] :
                (tx_lane5_deskew == 6'h18)? lane_in_d24[5] :
                (tx_lane5_deskew == 6'h19)? lane_in_d25[5] :
                (tx_lane5_deskew == 6'h1a)? lane_in_d26[5] :
                (tx_lane5_deskew == 6'h1b)? lane_in_d27[5] :
                (tx_lane5_deskew == 6'h1c)? lane_in_d28[5] :
                (tx_lane5_deskew == 6'h1d)? lane_in_d29[5] :
                (tx_lane5_deskew == 6'h1e)? lane_in_d30[5] :
                (tx_lane5_deskew == 6'h1f)? lane_in_d31[5] :
                (tx_lane5_deskew == 6'h20)? lane_in_d32[5] :
                (tx_lane5_deskew == 6'h21)? lane_in_d33[5] :
                (tx_lane5_deskew == 6'h22)? lane_in_d34[5] :
                (tx_lane5_deskew == 6'h23)? lane_in_d35[5] :
                (tx_lane5_deskew == 6'h24)? lane_in_d36[5] :
                (tx_lane5_deskew == 6'h25)? lane_in_d37[5] :
                (tx_lane5_deskew == 6'h26)? lane_in_d38[5] :
                (tx_lane5_deskew == 6'h27)? lane_in_d39[5] :
                (tx_lane5_deskew == 6'h28)? lane_in_d40[5] :
                (tx_lane5_deskew == 6'h29)? lane_in_d41[5] :
                (tx_lane5_deskew == 6'h2a)? lane_in_d42[5] :
                (tx_lane5_deskew == 6'h2b)? lane_in_d43[5] :
                (tx_lane5_deskew == 6'h2c)? lane_in_d44[5] :
                (tx_lane5_deskew == 6'h2d)? lane_in_d45[5] :
                (tx_lane5_deskew == 6'h2e)? lane_in_d46[5] :
                (tx_lane5_deskew == 6'h2f)? lane_in_d47[5] :
                (tx_lane5_deskew == 6'h30)? lane_in_d48[5] :
                (tx_lane5_deskew == 6'h31)? lane_in_d49[5] :
                (tx_lane5_deskew == 6'h32)? lane_in_d50[5] : lane_in[5];

assign out[6] = (tx_lane6_deskew == 6'h0)? lane_in[6] :
                (tx_lane6_deskew == 6'h1)? lane_in_d1[6] :
                (tx_lane6_deskew == 6'h2)? lane_in_d2[6] :
                (tx_lane6_deskew == 6'h3)? lane_in_d3[6] :
                (tx_lane6_deskew == 6'h4)? lane_in_d4[6] :
                (tx_lane6_deskew == 6'h5)? lane_in_d5[6] :
                (tx_lane6_deskew == 6'h6)? lane_in_d6[6] :
                (tx_lane6_deskew == 6'h7)? lane_in_d7[6] :
                (tx_lane6_deskew == 6'h8)? lane_in_d8[6] :
                (tx_lane6_deskew == 6'h9)? lane_in_d9[6] :
                (tx_lane6_deskew == 6'ha)? lane_in_d10[6] :
                (tx_lane6_deskew == 6'hb)? lane_in_d11[6] :
                (tx_lane6_deskew == 6'hc)? lane_in_d12[6] :
                (tx_lane6_deskew == 6'hd)? lane_in_d13[6] :
                (tx_lane6_deskew == 6'he)? lane_in_d14[6] :
                (tx_lane6_deskew == 6'hf)? lane_in_d15[6] :
                (tx_lane6_deskew == 6'h10)? lane_in_d16[6] :
                (tx_lane6_deskew == 6'h11)? lane_in_d17[6] :
                (tx_lane6_deskew == 6'h12)? lane_in_d18[6] :
                (tx_lane6_deskew == 6'h13)? lane_in_d19[6] :
                (tx_lane6_deskew == 6'h14)? lane_in_d20[6] :
                (tx_lane6_deskew == 6'h15)? lane_in_d21[6] :
                (tx_lane6_deskew == 6'h16)? lane_in_d22[6] :
                (tx_lane6_deskew == 6'h17)? lane_in_d23[6] :
                (tx_lane6_deskew == 6'h18)? lane_in_d24[6] :
                (tx_lane6_deskew == 6'h19)? lane_in_d25[6] :
                (tx_lane6_deskew == 6'h1a)? lane_in_d26[6] :
                (tx_lane6_deskew == 6'h1b)? lane_in_d27[6] :
                (tx_lane6_deskew == 6'h1c)? lane_in_d28[6] :
                (tx_lane6_deskew == 6'h1d)? lane_in_d29[6] :
                (tx_lane6_deskew == 6'h1e)? lane_in_d30[6] :
                (tx_lane6_deskew == 6'h1f)? lane_in_d31[6] :
                (tx_lane6_deskew == 6'h20)? lane_in_d32[6] :
                (tx_lane6_deskew == 6'h21)? lane_in_d33[6] :
                (tx_lane6_deskew == 6'h22)? lane_in_d34[6] :
                (tx_lane6_deskew == 6'h23)? lane_in_d35[6] :
                (tx_lane6_deskew == 6'h24)? lane_in_d36[6] :
                (tx_lane6_deskew == 6'h25)? lane_in_d37[6] :
                (tx_lane6_deskew == 6'h26)? lane_in_d38[6] :
                (tx_lane6_deskew == 6'h27)? lane_in_d39[6] :
                (tx_lane6_deskew == 6'h28)? lane_in_d40[6] :
                (tx_lane6_deskew == 6'h29)? lane_in_d41[6] :
                (tx_lane6_deskew == 6'h2a)? lane_in_d42[6] :
                (tx_lane6_deskew == 6'h2b)? lane_in_d43[6] :
                (tx_lane6_deskew == 6'h2c)? lane_in_d44[6] :
                (tx_lane6_deskew == 6'h2d)? lane_in_d45[6] :
                (tx_lane6_deskew == 6'h2e)? lane_in_d46[6] :
                (tx_lane6_deskew == 6'h2f)? lane_in_d47[6] :
                (tx_lane6_deskew == 6'h30)? lane_in_d48[6] :
                (tx_lane6_deskew == 6'h31)? lane_in_d49[6] :
                (tx_lane6_deskew == 6'h32)? lane_in_d50[6] : lane_in[6];

assign out[7] = (tx_lane7_deskew == 6'h0)? lane_in[7] :
                (tx_lane7_deskew == 6'h1)? lane_in_d1[7] :
                (tx_lane7_deskew == 6'h2)? lane_in_d2[7] :
                (tx_lane7_deskew == 6'h3)? lane_in_d3[7] :
                (tx_lane7_deskew == 6'h4)? lane_in_d4[7] :
                (tx_lane7_deskew == 6'h5)? lane_in_d5[7] :
                (tx_lane7_deskew == 6'h6)? lane_in_d6[7] :
                (tx_lane7_deskew == 6'h7)? lane_in_d7[7] :
                (tx_lane7_deskew == 6'h8)? lane_in_d8[7] :
                (tx_lane7_deskew == 6'h9)? lane_in_d9[7] :
                (tx_lane7_deskew == 6'ha)? lane_in_d10[7] :
                (tx_lane7_deskew == 6'hb)? lane_in_d11[7] :
                (tx_lane7_deskew == 6'hc)? lane_in_d12[7] :
                (tx_lane7_deskew == 6'hd)? lane_in_d13[7] :
                (tx_lane7_deskew == 6'he)? lane_in_d14[7] :
                (tx_lane7_deskew == 6'hf)? lane_in_d15[7] :
                (tx_lane7_deskew == 6'h10)? lane_in_d16[7] :
                (tx_lane7_deskew == 6'h11)? lane_in_d17[7] :
                (tx_lane7_deskew == 6'h12)? lane_in_d18[7] :
                (tx_lane7_deskew == 6'h13)? lane_in_d19[7] :
                (tx_lane7_deskew == 6'h14)? lane_in_d20[7] :
                (tx_lane7_deskew == 6'h15)? lane_in_d21[7] :
                (tx_lane7_deskew == 6'h16)? lane_in_d22[7] :
                (tx_lane7_deskew == 6'h17)? lane_in_d23[7] :
                (tx_lane7_deskew == 6'h18)? lane_in_d24[7] :
                (tx_lane7_deskew == 6'h19)? lane_in_d25[7] :
                (tx_lane7_deskew == 6'h1a)? lane_in_d26[7] :
                (tx_lane7_deskew == 6'h1b)? lane_in_d27[7] :
                (tx_lane7_deskew == 6'h1c)? lane_in_d28[7] :
                (tx_lane7_deskew == 6'h1d)? lane_in_d29[7] :
                (tx_lane7_deskew == 6'h1e)? lane_in_d30[7] :
                (tx_lane7_deskew == 6'h1f)? lane_in_d31[7] :
                (tx_lane7_deskew == 6'h20)? lane_in_d32[7] :
                (tx_lane7_deskew == 6'h21)? lane_in_d33[7] :
                (tx_lane7_deskew == 6'h22)? lane_in_d34[7] :
                (tx_lane7_deskew == 6'h23)? lane_in_d35[7] :
                (tx_lane7_deskew == 6'h24)? lane_in_d36[7] :
                (tx_lane7_deskew == 6'h25)? lane_in_d37[7] :
                (tx_lane7_deskew == 6'h26)? lane_in_d38[7] :
                (tx_lane7_deskew == 6'h27)? lane_in_d39[7] :
                (tx_lane7_deskew == 6'h28)? lane_in_d40[7] :
                (tx_lane7_deskew == 6'h29)? lane_in_d41[7] :
                (tx_lane7_deskew == 6'h2a)? lane_in_d42[7] :
                (tx_lane7_deskew == 6'h2b)? lane_in_d43[7] :
                (tx_lane7_deskew == 6'h2c)? lane_in_d44[7] :
                (tx_lane7_deskew == 6'h2d)? lane_in_d45[7] :
                (tx_lane7_deskew == 6'h2e)? lane_in_d46[7] :
                (tx_lane7_deskew == 6'h2f)? lane_in_d47[7] :
                (tx_lane7_deskew == 6'h30)? lane_in_d48[7] :
                (tx_lane7_deskew == 6'h31)? lane_in_d49[7] :
                (tx_lane7_deskew == 6'h32)? lane_in_d50[7] : lane_in[7];


assign out_bar[0] = (tx_lane0_deskew == 6'h0)? ~lane_in[0] :
                (tx_lane0_deskew == 6'h1)? ~lane_in_d1[0] :
                (tx_lane0_deskew == 6'h2)? ~lane_in_d2[0] :
                (tx_lane0_deskew == 6'h3)? ~lane_in_d3[0] :
                (tx_lane0_deskew == 6'h4)? ~lane_in_d4[0] :
                (tx_lane0_deskew == 6'h5)? ~lane_in_d5[0] :
                (tx_lane0_deskew == 6'h6)? ~lane_in_d6[0] :
                (tx_lane0_deskew == 6'h7)? ~lane_in_d7[0] :
                (tx_lane0_deskew == 6'h8)? ~lane_in_d8[0] :
                (tx_lane0_deskew == 6'h9)? ~lane_in_d9[0] :
                (tx_lane0_deskew == 6'ha)? ~lane_in_d10[0] :
                (tx_lane0_deskew == 6'hb)? ~lane_in_d11[0] :
                (tx_lane0_deskew == 6'hc)? ~lane_in_d12[0] :
                (tx_lane0_deskew == 6'hd)? ~lane_in_d13[0] :
                (tx_lane0_deskew == 6'he)? ~lane_in_d14[0] :
                (tx_lane0_deskew == 6'hf)? ~lane_in_d15[0] :
                (tx_lane0_deskew == 6'h10)? ~lane_in_d16[0] :
                (tx_lane0_deskew == 6'h11)? ~lane_in_d17[0] :
                (tx_lane0_deskew == 6'h12)? ~lane_in_d18[0] :
                (tx_lane0_deskew == 6'h13)? ~lane_in_d19[0] :
                (tx_lane0_deskew == 6'h14)? ~lane_in_d20[0] :
                (tx_lane0_deskew == 6'h15)? ~lane_in_d21[0] :
                (tx_lane0_deskew == 6'h16)? ~lane_in_d22[0] :
                (tx_lane0_deskew == 6'h17)? ~lane_in_d23[0] :
                (tx_lane0_deskew == 6'h18)? ~lane_in_d24[0] :
                (tx_lane0_deskew == 6'h19)? ~lane_in_d25[0] :
                (tx_lane0_deskew == 6'h1a)? ~lane_in_d26[0] :
                (tx_lane0_deskew == 6'h1b)? ~lane_in_d27[0] :
                (tx_lane0_deskew == 6'h1c)? ~lane_in_d28[0] :
                (tx_lane0_deskew == 6'h1d)? ~lane_in_d29[0] :
                (tx_lane0_deskew == 6'h1e)? ~lane_in_d30[0] :
                (tx_lane0_deskew == 6'h1f)? ~lane_in_d31[0] :
                (tx_lane0_deskew == 6'h20)? ~lane_in_d32[0] :
                (tx_lane0_deskew == 6'h21)? ~lane_in_d33[0] :
                (tx_lane0_deskew == 6'h22)? ~lane_in_d34[0] :
                (tx_lane0_deskew == 6'h23)? ~lane_in_d35[0] :
                (tx_lane0_deskew == 6'h24)? ~lane_in_d36[0] :
                (tx_lane0_deskew == 6'h25)? ~lane_in_d37[0] :
                (tx_lane0_deskew == 6'h26)? ~lane_in_d38[0] :
                (tx_lane0_deskew == 6'h27)? ~lane_in_d39[0] :
                (tx_lane0_deskew == 6'h28)? ~lane_in_d40[0] :
                (tx_lane0_deskew == 6'h29)? ~lane_in_d41[0] :
                (tx_lane0_deskew == 6'h2a)? ~lane_in_d42[0] :
                (tx_lane0_deskew == 6'h2b)? ~lane_in_d43[0] :
                (tx_lane0_deskew == 6'h2c)? ~lane_in_d44[0] :
                (tx_lane0_deskew == 6'h2d)? ~lane_in_d45[0] :
                (tx_lane0_deskew == 6'h2e)? ~lane_in_d46[0] :
                (tx_lane0_deskew == 6'h2f)? ~lane_in_d47[0] :
                (tx_lane0_deskew == 6'h30)? ~lane_in_d48[0] :
                (tx_lane0_deskew == 6'h31)? ~lane_in_d49[0] :
                (tx_lane0_deskew == 6'h32)? ~lane_in_d50[0] : ~lane_in[0];

assign out_bar[1] = (tx_lane1_deskew == 6'h0)? ~lane_in[1] :
                (tx_lane1_deskew == 6'h1)? ~lane_in_d1[1] :
                (tx_lane1_deskew == 6'h2)? ~lane_in_d2[1] :
                (tx_lane1_deskew == 6'h3)? ~lane_in_d3[1] :
                (tx_lane1_deskew == 6'h4)? ~lane_in_d4[1] :
                (tx_lane1_deskew == 6'h5)? ~lane_in_d5[1] :
                (tx_lane1_deskew == 6'h6)? ~lane_in_d6[1] :
                (tx_lane1_deskew == 6'h7)? ~lane_in_d7[1] :
                (tx_lane1_deskew == 6'h8)? ~lane_in_d8[1] :
                (tx_lane1_deskew == 6'h9)? ~lane_in_d9[1] :
                (tx_lane1_deskew == 6'ha)? ~lane_in_d10[1] :
                (tx_lane1_deskew == 6'hb)? ~lane_in_d11[1] :
                (tx_lane1_deskew == 6'hc)? ~lane_in_d12[1] :
                (tx_lane1_deskew == 6'hd)? ~lane_in_d13[1] :
                (tx_lane1_deskew == 6'he)? ~lane_in_d14[1] :
                (tx_lane1_deskew == 6'hf)? ~lane_in_d15[1] :
                (tx_lane1_deskew == 6'h10)? ~lane_in_d16[1] :
                (tx_lane1_deskew == 6'h11)? ~lane_in_d17[1] :
                (tx_lane1_deskew == 6'h12)? ~lane_in_d18[1] :
                (tx_lane1_deskew == 6'h13)? ~lane_in_d19[1] :
                (tx_lane1_deskew == 6'h14)? ~lane_in_d20[1] :
                (tx_lane1_deskew == 6'h15)? ~lane_in_d21[1] :
                (tx_lane1_deskew == 6'h16)? ~lane_in_d22[1] :
                (tx_lane1_deskew == 6'h17)? ~lane_in_d23[1] :
                (tx_lane1_deskew == 6'h18)? ~lane_in_d24[1] :
                (tx_lane1_deskew == 6'h19)? ~lane_in_d25[1] :
                (tx_lane1_deskew == 6'h1a)? ~lane_in_d26[1] :
                (tx_lane1_deskew == 6'h1b)? ~lane_in_d27[1] :
                (tx_lane1_deskew == 6'h1c)? ~lane_in_d28[1] :
                (tx_lane1_deskew == 6'h1d)? ~lane_in_d29[1] :
                (tx_lane1_deskew == 6'h1e)? ~lane_in_d30[1] :
                (tx_lane1_deskew == 6'h1f)? ~lane_in_d31[1] :
                (tx_lane1_deskew == 6'h20)? ~lane_in_d32[1] :
                (tx_lane1_deskew == 6'h21)? ~lane_in_d33[1] :
                (tx_lane1_deskew == 6'h22)? ~lane_in_d34[1] :
                (tx_lane1_deskew == 6'h23)? ~lane_in_d35[1] :
                (tx_lane1_deskew == 6'h24)? ~lane_in_d36[1] :
                (tx_lane1_deskew == 6'h25)? ~lane_in_d37[1] :
                (tx_lane1_deskew == 6'h26)? ~lane_in_d38[1] :
                (tx_lane1_deskew == 6'h27)? ~lane_in_d39[1] :
                (tx_lane1_deskew == 6'h28)? ~lane_in_d40[1] :
                (tx_lane1_deskew == 6'h29)? ~lane_in_d41[1] :
                (tx_lane1_deskew == 6'h2a)? ~lane_in_d42[1] :
                (tx_lane1_deskew == 6'h2b)? ~lane_in_d43[1] :
                (tx_lane1_deskew == 6'h2c)? ~lane_in_d44[1] :
                (tx_lane1_deskew == 6'h2d)? ~lane_in_d45[1] :
                (tx_lane1_deskew == 6'h2e)? ~lane_in_d46[1] :
                (tx_lane1_deskew == 6'h2f)? ~lane_in_d47[1] :
                (tx_lane1_deskew == 6'h30)? ~lane_in_d48[1] :
                (tx_lane1_deskew == 6'h31)? ~lane_in_d49[1] :
                (tx_lane1_deskew == 6'h32)? ~lane_in_d50[1] : ~lane_in[1];

assign out_bar[2] = (tx_lane2_deskew == 6'h0)? ~lane_in[2] :
                (tx_lane2_deskew == 6'h1)? ~lane_in_d1[2] :
                (tx_lane2_deskew == 6'h2)? ~lane_in_d2[2] :
                (tx_lane2_deskew == 6'h3)? ~lane_in_d3[2] :
                (tx_lane2_deskew == 6'h4)? ~lane_in_d4[2] :
                (tx_lane2_deskew == 6'h5)? ~lane_in_d5[2] :
                (tx_lane2_deskew == 6'h6)? ~lane_in_d6[2] :
                (tx_lane2_deskew == 6'h7)? ~lane_in_d7[2] :
                (tx_lane2_deskew == 6'h8)? ~lane_in_d8[2] :
                (tx_lane2_deskew == 6'h9)? ~lane_in_d9[2] :
                (tx_lane2_deskew == 6'ha)? ~lane_in_d10[2] :
                (tx_lane2_deskew == 6'hb)? ~lane_in_d11[2] :
                (tx_lane2_deskew == 6'hc)? ~lane_in_d12[2] :
                (tx_lane2_deskew == 6'hd)? ~lane_in_d13[2] :
                (tx_lane2_deskew == 6'he)? ~lane_in_d14[2] :
                (tx_lane2_deskew == 6'hf)? ~lane_in_d15[2] :
                (tx_lane2_deskew == 6'h10)? ~lane_in_d16[2] :
                (tx_lane2_deskew == 6'h11)? ~lane_in_d17[2] :
                (tx_lane2_deskew == 6'h12)? ~lane_in_d18[2] :
                (tx_lane2_deskew == 6'h13)? ~lane_in_d19[2] :
                (tx_lane2_deskew == 6'h14)? ~lane_in_d20[2] :
                (tx_lane2_deskew == 6'h15)? ~lane_in_d21[2] :
                (tx_lane2_deskew == 6'h16)? ~lane_in_d22[2] :
                (tx_lane2_deskew == 6'h17)? ~lane_in_d23[2] :
                (tx_lane2_deskew == 6'h18)? ~lane_in_d24[2] :
                (tx_lane2_deskew == 6'h19)? ~lane_in_d25[2] :
                (tx_lane2_deskew == 6'h1a)? ~lane_in_d26[2] :
                (tx_lane2_deskew == 6'h1b)? ~lane_in_d27[2] :
                (tx_lane2_deskew == 6'h1c)? ~lane_in_d28[2] :
                (tx_lane2_deskew == 6'h1d)? ~lane_in_d29[2] :
                (tx_lane2_deskew == 6'h1e)? ~lane_in_d30[2] :
                (tx_lane2_deskew == 6'h1f)? ~lane_in_d31[2] :
                (tx_lane2_deskew == 6'h20)? ~lane_in_d32[2] :
                (tx_lane2_deskew == 6'h21)? ~lane_in_d33[2] :
                (tx_lane2_deskew == 6'h22)? ~lane_in_d34[2] :
                (tx_lane2_deskew == 6'h23)? ~lane_in_d35[2] :
                (tx_lane2_deskew == 6'h24)? ~lane_in_d36[2] :
                (tx_lane2_deskew == 6'h25)? ~lane_in_d37[2] :
                (tx_lane2_deskew == 6'h26)? ~lane_in_d38[2] :
                (tx_lane2_deskew == 6'h27)? ~lane_in_d39[2] :
                (tx_lane2_deskew == 6'h28)? ~lane_in_d40[2] :
                (tx_lane2_deskew == 6'h29)? ~lane_in_d41[2] :
                (tx_lane2_deskew == 6'h2a)? ~lane_in_d42[2] :
                (tx_lane2_deskew == 6'h2b)? ~lane_in_d43[2] :
                (tx_lane2_deskew == 6'h2c)? ~lane_in_d44[2] :
                (tx_lane2_deskew == 6'h2d)? ~lane_in_d45[2] :
                (tx_lane2_deskew == 6'h2e)? ~lane_in_d46[2] :
                (tx_lane2_deskew == 6'h2f)? ~lane_in_d47[2] :
                (tx_lane2_deskew == 6'h30)? ~lane_in_d48[2] :
                (tx_lane2_deskew == 6'h31)? ~lane_in_d49[2] :
                (tx_lane2_deskew == 6'h32)? ~lane_in_d50[2] : ~lane_in[2];

assign out_bar[3] = (tx_lane3_deskew == 6'h0)? ~lane_in[3] :
                (tx_lane3_deskew == 6'h1)? ~lane_in_d1[3] :
                (tx_lane3_deskew == 6'h2)? ~lane_in_d2[3] :
                (tx_lane3_deskew == 6'h3)? ~lane_in_d3[3] :
                (tx_lane3_deskew == 6'h4)? ~lane_in_d4[3] :
                (tx_lane3_deskew == 6'h5)? ~lane_in_d5[3] :
                (tx_lane3_deskew == 6'h6)? ~lane_in_d6[3] :
                (tx_lane3_deskew == 6'h7)? ~lane_in_d7[3] :
                (tx_lane3_deskew == 6'h8)? ~lane_in_d8[3] :
                (tx_lane3_deskew == 6'h9)? ~lane_in_d9[3] :
                (tx_lane3_deskew == 6'ha)? ~lane_in_d10[3] :
                (tx_lane3_deskew == 6'hb)? ~lane_in_d11[3] :
                (tx_lane3_deskew == 6'hc)? ~lane_in_d12[3] :
                (tx_lane3_deskew == 6'hd)? ~lane_in_d13[3] :
                (tx_lane3_deskew == 6'he)? ~lane_in_d14[3] :
                (tx_lane3_deskew == 6'hf)? ~lane_in_d15[3] :
                (tx_lane3_deskew == 6'h10)? ~lane_in_d16[3] :
                (tx_lane3_deskew == 6'h11)? ~lane_in_d17[3] :
                (tx_lane3_deskew == 6'h12)? ~lane_in_d18[3] :
                (tx_lane3_deskew == 6'h13)? ~lane_in_d19[3] :
                (tx_lane3_deskew == 6'h14)? ~lane_in_d20[3] :
                (tx_lane3_deskew == 6'h15)? ~lane_in_d21[3] :
                (tx_lane3_deskew == 6'h16)? ~lane_in_d22[3] :
                (tx_lane3_deskew == 6'h17)? ~lane_in_d23[3] :
                (tx_lane3_deskew == 6'h18)? ~lane_in_d24[3] :
                (tx_lane3_deskew == 6'h19)? ~lane_in_d25[3] :
                (tx_lane3_deskew == 6'h1a)? ~lane_in_d26[3] :
                (tx_lane3_deskew == 6'h1b)? ~lane_in_d27[3] :
                (tx_lane3_deskew == 6'h1c)? ~lane_in_d28[3] :
                (tx_lane3_deskew == 6'h1d)? ~lane_in_d29[3] :
                (tx_lane3_deskew == 6'h1e)? ~lane_in_d30[3] :
                (tx_lane3_deskew == 6'h1f)? ~lane_in_d31[3] :
                (tx_lane3_deskew == 6'h20)? ~lane_in_d32[3] :
                (tx_lane3_deskew == 6'h21)? ~lane_in_d33[3] :
                (tx_lane3_deskew == 6'h22)? ~lane_in_d34[3] :
                (tx_lane3_deskew == 6'h23)? ~lane_in_d35[3] :
                (tx_lane3_deskew == 6'h24)? ~lane_in_d36[3] :
                (tx_lane3_deskew == 6'h25)? ~lane_in_d37[3] :
                (tx_lane3_deskew == 6'h26)? ~lane_in_d38[3] :
                (tx_lane3_deskew == 6'h27)? ~lane_in_d39[3] :
                (tx_lane3_deskew == 6'h28)? ~lane_in_d40[3] :
                (tx_lane3_deskew == 6'h29)? ~lane_in_d41[3] :
                (tx_lane3_deskew == 6'h2a)? ~lane_in_d42[3] :
                (tx_lane3_deskew == 6'h2b)? ~lane_in_d43[3] :
                (tx_lane3_deskew == 6'h2c)? ~lane_in_d44[3] :
                (tx_lane3_deskew == 6'h2d)? ~lane_in_d45[3] :
                (tx_lane3_deskew == 6'h2e)? ~lane_in_d46[3] :
                (tx_lane3_deskew == 6'h2f)? ~lane_in_d47[3] :
                (tx_lane3_deskew == 6'h30)? ~lane_in_d48[3] :
                (tx_lane3_deskew == 6'h31)? ~lane_in_d49[3] :
                (tx_lane3_deskew == 6'h32)? ~lane_in_d50[3] : ~lane_in[3];

assign out_bar[4] = (tx_lane4_deskew == 6'h0)? ~lane_in[4] :
                (tx_lane4_deskew == 6'h1)? ~lane_in_d1[4] :
                (tx_lane4_deskew == 6'h2)? ~lane_in_d2[4] :
                (tx_lane4_deskew == 6'h3)? ~lane_in_d3[4] :
                (tx_lane4_deskew == 6'h4)? ~lane_in_d4[4] :
                (tx_lane4_deskew == 6'h5)? ~lane_in_d5[4] :
                (tx_lane4_deskew == 6'h6)? ~lane_in_d6[4] :
                (tx_lane4_deskew == 6'h7)? ~lane_in_d7[4] :
                (tx_lane4_deskew == 6'h8)? ~lane_in_d8[4] :
                (tx_lane4_deskew == 6'h9)? ~lane_in_d9[4] :
                (tx_lane4_deskew == 6'ha)? ~lane_in_d10[4] :
                (tx_lane4_deskew == 6'hb)? ~lane_in_d11[4] :
                (tx_lane4_deskew == 6'hc)? ~lane_in_d12[4] :
                (tx_lane4_deskew == 6'hd)? ~lane_in_d13[4] :
                (tx_lane4_deskew == 6'he)? ~lane_in_d14[4] :
                (tx_lane4_deskew == 6'hf)? ~lane_in_d15[4] :
                (tx_lane4_deskew == 6'h10)? ~lane_in_d16[4] :
                (tx_lane4_deskew == 6'h11)? ~lane_in_d17[4] :
                (tx_lane4_deskew == 6'h12)? ~lane_in_d18[4] :
                (tx_lane4_deskew == 6'h13)? ~lane_in_d19[4] :
                (tx_lane4_deskew == 6'h14)? ~lane_in_d20[4] :
                (tx_lane4_deskew == 6'h15)? ~lane_in_d21[4] :
                (tx_lane4_deskew == 6'h16)? ~lane_in_d22[4] :
                (tx_lane4_deskew == 6'h17)? ~lane_in_d23[4] :
                (tx_lane4_deskew == 6'h18)? ~lane_in_d24[4] :
                (tx_lane4_deskew == 6'h19)? ~lane_in_d25[4] :
                (tx_lane4_deskew == 6'h1a)? ~lane_in_d26[4] :
                (tx_lane4_deskew == 6'h1b)? ~lane_in_d27[4] :
                (tx_lane4_deskew == 6'h1c)? ~lane_in_d28[4] :
                (tx_lane4_deskew == 6'h1d)? ~lane_in_d29[4] :
                (tx_lane4_deskew == 6'h1e)? ~lane_in_d30[4] :
                (tx_lane4_deskew == 6'h1f)? ~lane_in_d31[4] :
                (tx_lane4_deskew == 6'h20)? ~lane_in_d32[4] :
                (tx_lane4_deskew == 6'h21)? ~lane_in_d33[4] :
                (tx_lane4_deskew == 6'h22)? ~lane_in_d34[4] :
                (tx_lane4_deskew == 6'h23)? ~lane_in_d35[4] :
                (tx_lane4_deskew == 6'h24)? ~lane_in_d36[4] :
                (tx_lane4_deskew == 6'h25)? ~lane_in_d37[4] :
                (tx_lane4_deskew == 6'h26)? ~lane_in_d38[4] :
                (tx_lane4_deskew == 6'h27)? ~lane_in_d39[4] :
                (tx_lane4_deskew == 6'h28)? ~lane_in_d40[4] :
                (tx_lane4_deskew == 6'h29)? ~lane_in_d41[4] :
                (tx_lane4_deskew == 6'h2a)? ~lane_in_d42[4] :
                (tx_lane4_deskew == 6'h2b)? ~lane_in_d43[4] :
                (tx_lane4_deskew == 6'h2c)? ~lane_in_d44[4] :
                (tx_lane4_deskew == 6'h2d)? ~lane_in_d45[4] :
                (tx_lane4_deskew == 6'h2e)? ~lane_in_d46[4] :
                (tx_lane4_deskew == 6'h2f)? ~lane_in_d47[4] :
                (tx_lane4_deskew == 6'h30)? ~lane_in_d48[4] :
                (tx_lane4_deskew == 6'h31)? ~lane_in_d49[4] :
                (tx_lane4_deskew == 6'h32)? ~lane_in_d50[4] : ~lane_in[4];

assign out_bar[5] = (tx_lane5_deskew == 6'h0)? ~lane_in[5] :
                (tx_lane5_deskew == 6'h1)? ~lane_in_d1[5] :
                (tx_lane5_deskew == 6'h2)? ~lane_in_d2[5] :
                (tx_lane5_deskew == 6'h3)? ~lane_in_d3[5] :
                (tx_lane5_deskew == 6'h4)? ~lane_in_d4[5] :
                (tx_lane5_deskew == 6'h5)? ~lane_in_d5[5] :
                (tx_lane5_deskew == 6'h6)? ~lane_in_d6[5] :
                (tx_lane5_deskew == 6'h7)? ~lane_in_d7[5] :
                (tx_lane5_deskew == 6'h8)? ~lane_in_d8[5] :
                (tx_lane5_deskew == 6'h9)? ~lane_in_d9[5] :
                (tx_lane5_deskew == 6'ha)? ~lane_in_d10[5] :
                (tx_lane5_deskew == 6'hb)? ~lane_in_d11[5] :
                (tx_lane5_deskew == 6'hc)? ~lane_in_d12[5] :
                (tx_lane5_deskew == 6'hd)? ~lane_in_d13[5] :
                (tx_lane5_deskew == 6'he)? ~lane_in_d14[5] :
                (tx_lane5_deskew == 6'hf)? ~lane_in_d15[5] :
                (tx_lane5_deskew == 6'h10)? ~lane_in_d16[5] :
                (tx_lane5_deskew == 6'h11)? ~lane_in_d17[5] :
                (tx_lane5_deskew == 6'h12)? ~lane_in_d18[5] :
                (tx_lane5_deskew == 6'h13)? ~lane_in_d19[5] :
                (tx_lane5_deskew == 6'h14)? ~lane_in_d20[5] :
                (tx_lane5_deskew == 6'h15)? ~lane_in_d21[5] :
                (tx_lane5_deskew == 6'h16)? ~lane_in_d22[5] :
                (tx_lane5_deskew == 6'h17)? ~lane_in_d23[5] :
                (tx_lane5_deskew == 6'h18)? ~lane_in_d24[5] :
                (tx_lane5_deskew == 6'h19)? ~lane_in_d25[5] :
                (tx_lane5_deskew == 6'h1a)? ~lane_in_d26[5] :
                (tx_lane5_deskew == 6'h1b)? ~lane_in_d27[5] :
                (tx_lane5_deskew == 6'h1c)? ~lane_in_d28[5] :
                (tx_lane5_deskew == 6'h1d)? ~lane_in_d29[5] :
                (tx_lane5_deskew == 6'h1e)? ~lane_in_d30[5] :
                (tx_lane5_deskew == 6'h1f)? ~lane_in_d31[5] :
                (tx_lane5_deskew == 6'h20)? ~lane_in_d32[5] :
                (tx_lane5_deskew == 6'h21)? ~lane_in_d33[5] :
                (tx_lane5_deskew == 6'h22)? ~lane_in_d34[5] :
                (tx_lane5_deskew == 6'h23)? ~lane_in_d35[5] :
                (tx_lane5_deskew == 6'h24)? ~lane_in_d36[5] :
                (tx_lane5_deskew == 6'h25)? ~lane_in_d37[5] :
                (tx_lane5_deskew == 6'h26)? ~lane_in_d38[5] :
                (tx_lane5_deskew == 6'h27)? ~lane_in_d39[5] :
                (tx_lane5_deskew == 6'h28)? ~lane_in_d40[5] :
                (tx_lane5_deskew == 6'h29)? ~lane_in_d41[5] :
                (tx_lane5_deskew == 6'h2a)? ~lane_in_d42[5] :
                (tx_lane5_deskew == 6'h2b)? ~lane_in_d43[5] :
                (tx_lane5_deskew == 6'h2c)? ~lane_in_d44[5] :
                (tx_lane5_deskew == 6'h2d)? ~lane_in_d45[5] :
                (tx_lane5_deskew == 6'h2e)? ~lane_in_d46[5] :
                (tx_lane5_deskew == 6'h2f)? ~lane_in_d47[5] :
                (tx_lane5_deskew == 6'h30)? ~lane_in_d48[5] :
                (tx_lane5_deskew == 6'h31)? ~lane_in_d49[5] :
                (tx_lane5_deskew == 6'h32)? ~lane_in_d50[5] : ~lane_in[5];

assign out_bar[6] = (tx_lane6_deskew == 6'h0)? ~lane_in[6] :
                (tx_lane6_deskew == 6'h1)? ~lane_in_d1[6] :
                (tx_lane6_deskew == 6'h2)? ~lane_in_d2[6] :
                (tx_lane6_deskew == 6'h3)? ~lane_in_d3[6] :
                (tx_lane6_deskew == 6'h4)? ~lane_in_d4[6] :
                (tx_lane6_deskew == 6'h5)? ~lane_in_d5[6] :
                (tx_lane6_deskew == 6'h6)? ~lane_in_d6[6] :
                (tx_lane6_deskew == 6'h7)? ~lane_in_d7[6] :
                (tx_lane6_deskew == 6'h8)? ~lane_in_d8[6] :
                (tx_lane6_deskew == 6'h9)? ~lane_in_d9[6] :
                (tx_lane6_deskew == 6'ha)? ~lane_in_d10[6] :
                (tx_lane6_deskew == 6'hb)? ~lane_in_d11[6] :
                (tx_lane6_deskew == 6'hc)? ~lane_in_d12[6] :
                (tx_lane6_deskew == 6'hd)? ~lane_in_d13[6] :
                (tx_lane6_deskew == 6'he)? ~lane_in_d14[6] :
                (tx_lane6_deskew == 6'hf)? ~lane_in_d15[6] :
                (tx_lane6_deskew == 6'h10)? ~lane_in_d16[6] :
                (tx_lane6_deskew == 6'h11)? ~lane_in_d17[6] :
                (tx_lane6_deskew == 6'h12)? ~lane_in_d18[6] :
                (tx_lane6_deskew == 6'h13)? ~lane_in_d19[6] :
                (tx_lane6_deskew == 6'h14)? ~lane_in_d20[6] :
                (tx_lane6_deskew == 6'h15)? ~lane_in_d21[6] :
                (tx_lane6_deskew == 6'h16)? ~lane_in_d22[6] :
                (tx_lane6_deskew == 6'h17)? ~lane_in_d23[6] :
                (tx_lane6_deskew == 6'h18)? ~lane_in_d24[6] :
                (tx_lane6_deskew == 6'h19)? ~lane_in_d25[6] :
                (tx_lane6_deskew == 6'h1a)? ~lane_in_d26[6] :
                (tx_lane6_deskew == 6'h1b)? ~lane_in_d27[6] :
                (tx_lane6_deskew == 6'h1c)? ~lane_in_d28[6] :
                (tx_lane6_deskew == 6'h1d)? ~lane_in_d29[6] :
                (tx_lane6_deskew == 6'h1e)? ~lane_in_d30[6] :
                (tx_lane6_deskew == 6'h1f)? ~lane_in_d31[6] :
                (tx_lane6_deskew == 6'h20)? ~lane_in_d32[6] :
                (tx_lane6_deskew == 6'h21)? ~lane_in_d33[6] :
                (tx_lane6_deskew == 6'h22)? ~lane_in_d34[6] :
                (tx_lane6_deskew == 6'h23)? ~lane_in_d35[6] :
                (tx_lane6_deskew == 6'h24)? ~lane_in_d36[6] :
                (tx_lane6_deskew == 6'h25)? ~lane_in_d37[6] :
                (tx_lane6_deskew == 6'h26)? ~lane_in_d38[6] :
                (tx_lane6_deskew == 6'h27)? ~lane_in_d39[6] :
                (tx_lane6_deskew == 6'h28)? ~lane_in_d40[6] :
                (tx_lane6_deskew == 6'h29)? ~lane_in_d41[6] :
                (tx_lane6_deskew == 6'h2a)? ~lane_in_d42[6] :
                (tx_lane6_deskew == 6'h2b)? ~lane_in_d43[6] :
                (tx_lane6_deskew == 6'h2c)? ~lane_in_d44[6] :
                (tx_lane6_deskew == 6'h2d)? ~lane_in_d45[6] :
                (tx_lane6_deskew == 6'h2e)? ~lane_in_d46[6] :
                (tx_lane6_deskew == 6'h2f)? ~lane_in_d47[6] :
                (tx_lane6_deskew == 6'h30)? ~lane_in_d48[6] :
                (tx_lane6_deskew == 6'h31)? ~lane_in_d49[6] :
                (tx_lane6_deskew == 6'h32)? ~lane_in_d50[6] : ~lane_in[6];

assign out_bar[7] = (tx_lane7_deskew == 6'h0)? ~lane_in[7] :
                (tx_lane7_deskew == 6'h1)? ~lane_in_d1[7] :
                (tx_lane7_deskew == 6'h2)? ~lane_in_d2[7] :
                (tx_lane7_deskew == 6'h3)? ~lane_in_d3[7] :
                (tx_lane7_deskew == 6'h4)? ~lane_in_d4[7] :
                (tx_lane7_deskew == 6'h5)? ~lane_in_d5[7] :
                (tx_lane7_deskew == 6'h6)? ~lane_in_d6[7] :
                (tx_lane7_deskew == 6'h7)? ~lane_in_d7[7] :
                (tx_lane7_deskew == 6'h8)? ~lane_in_d8[7] :
                (tx_lane7_deskew == 6'h9)? ~lane_in_d9[7] :
                (tx_lane7_deskew == 6'ha)? ~lane_in_d10[7] :
                (tx_lane7_deskew == 6'hb)? ~lane_in_d11[7] :
                (tx_lane7_deskew == 6'hc)? ~lane_in_d12[7] :
                (tx_lane7_deskew == 6'hd)? ~lane_in_d13[7] :
                (tx_lane7_deskew == 6'he)? ~lane_in_d14[7] :
                (tx_lane7_deskew == 6'hf)? ~lane_in_d15[7] :
                (tx_lane7_deskew == 6'h10)? ~lane_in_d16[7] :
                (tx_lane7_deskew == 6'h11)? ~lane_in_d17[7] :
                (tx_lane7_deskew == 6'h12)? ~lane_in_d18[7] :
                (tx_lane7_deskew == 6'h13)? ~lane_in_d19[7] :
                (tx_lane7_deskew == 6'h14)? ~lane_in_d20[7] :
                (tx_lane7_deskew == 6'h15)? ~lane_in_d21[7] :
                (tx_lane7_deskew == 6'h16)? ~lane_in_d22[7] :
                (tx_lane7_deskew == 6'h17)? ~lane_in_d23[7] :
                (tx_lane7_deskew == 6'h18)? ~lane_in_d24[7] :
                (tx_lane7_deskew == 6'h19)? ~lane_in_d25[7] :
                (tx_lane7_deskew == 6'h1a)? ~lane_in_d26[7] :
                (tx_lane7_deskew == 6'h1b)? ~lane_in_d27[7] :
                (tx_lane7_deskew == 6'h1c)? ~lane_in_d28[7] :
                (tx_lane7_deskew == 6'h1d)? ~lane_in_d29[7] :
                (tx_lane7_deskew == 6'h1e)? ~lane_in_d30[7] :
                (tx_lane7_deskew == 6'h1f)? ~lane_in_d31[7] :
                (tx_lane7_deskew == 6'h20)? ~lane_in_d32[7] :
                (tx_lane7_deskew == 6'h21)? ~lane_in_d33[7] :
                (tx_lane7_deskew == 6'h22)? ~lane_in_d34[7] :
                (tx_lane7_deskew == 6'h23)? ~lane_in_d35[7] :
                (tx_lane7_deskew == 6'h24)? ~lane_in_d36[7] :
                (tx_lane7_deskew == 6'h25)? ~lane_in_d37[7] :
                (tx_lane7_deskew == 6'h26)? ~lane_in_d38[7] :
                (tx_lane7_deskew == 6'h27)? ~lane_in_d39[7] :
                (tx_lane7_deskew == 6'h28)? ~lane_in_d40[7] :
                (tx_lane7_deskew == 6'h29)? ~lane_in_d41[7] :
                (tx_lane7_deskew == 6'h2a)? ~lane_in_d42[7] :
                (tx_lane7_deskew == 6'h2b)? ~lane_in_d43[7] :
                (tx_lane7_deskew == 6'h2c)? ~lane_in_d44[7] :
                (tx_lane7_deskew == 6'h2d)? ~lane_in_d45[7] :
                (tx_lane7_deskew == 6'h2e)? ~lane_in_d46[7] :
                (tx_lane7_deskew == 6'h2f)? ~lane_in_d47[7] :
                (tx_lane7_deskew == 6'h30)? ~lane_in_d48[7] :
                (tx_lane7_deskew == 6'h31)? ~lane_in_d49[7] :
                (tx_lane7_deskew == 6'h32)? ~lane_in_d50[7] : ~lane_in[7];
            
/// D-Flip-flops to add skew delays accordingly
pl_dff_p #(`LINK_WIDTH) ff0 (.in_sig(lane_in),
                .out_sig(lane_in_d1),
                .clk(link_clk));

pl_dff_p #(`LINK_WIDTH) ff1 (.in_sig(lane_in_d1),
                .out_sig(lane_in_d2),
                .clk(link_clk));

pl_dff_p #(`LINK_WIDTH) ff2 (.in_sig(lane_in_d2),
                .out_sig(lane_in_d3),
                .clk(link_clk));

pl_dff_p #(`LINK_WIDTH) ff3 (.in_sig(lane_in_d3),
                .out_sig(lane_in_d4),
                .clk(link_clk));

pl_dff_p #(`LINK_WIDTH) ff4 (.in_sig(lane_in_d4),
                .out_sig(lane_in_d5),
                .clk(link_clk));

pl_dff_p #(`LINK_WIDTH) ff5 (.in_sig(lane_in_d5),
                .out_sig(lane_in_d6),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff6 (.in_sig(lane_in_d6),
                .out_sig(lane_in_d7),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff7 (.in_sig(lane_in_d7),
                .out_sig(lane_in_d8),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff8 (.in_sig(lane_in_d8),
                .out_sig(lane_in_d9),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff9 (.in_sig(lane_in_d9),
                .out_sig(lane_in_d10),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff10 (.in_sig(lane_in_d10),
                .out_sig(lane_in_d11),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff11 (.in_sig(lane_in_d11),
                .out_sig(lane_in_d12),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff12 (.in_sig(lane_in_d12),
                .out_sig(lane_in_d13),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff13 (.in_sig(lane_in_d13),
                .out_sig(lane_in_d14),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff14 (.in_sig(lane_in_d14),
                .out_sig(lane_in_d15),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff15 (.in_sig(lane_in_d15),
                .out_sig(lane_in_d16),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff16 (.in_sig(lane_in_d16),
                .out_sig(lane_in_d17),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff17 (.in_sig(lane_in_d17),
                .out_sig(lane_in_d18),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff18 (.in_sig(lane_in_d18),
                .out_sig(lane_in_d19),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff19 (.in_sig(lane_in_d19),
                .out_sig(lane_in_d20),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff20 (.in_sig(lane_in_d20),
                .out_sig(lane_in_d21),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff21 (.in_sig(lane_in_d21),
                .out_sig(lane_in_d22),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff22 (.in_sig(lane_in_d22),
                .out_sig(lane_in_d23),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff23 (.in_sig(lane_in_d23),
                .out_sig(lane_in_d24),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff24 (.in_sig(lane_in_d24),
                .out_sig(lane_in_d25),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff25 (.in_sig(lane_in_d25),
                .out_sig(lane_in_d26),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff26 (.in_sig(lane_in_d26),
                .out_sig(lane_in_d27),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff27 (.in_sig(lane_in_d27),
                .out_sig(lane_in_d28),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff28 (.in_sig(lane_in_d28),
                .out_sig(lane_in_d29),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff29 (.in_sig(lane_in_d29),
                .out_sig(lane_in_d30),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff30 (.in_sig(lane_in_d30),
                .out_sig(lane_in_d31),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff31 (.in_sig(lane_in_d31),
                .out_sig(lane_in_d32),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff32 (.in_sig(lane_in_d32),
                .out_sig(lane_in_d33),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff33 (.in_sig(lane_in_d33),
                .out_sig(lane_in_d34),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff34 (.in_sig(lane_in_d34),
                .out_sig(lane_in_d35),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff35 (.in_sig(lane_in_d35),
                .out_sig(lane_in_d36),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff36 (.in_sig(lane_in_d36),
                .out_sig(lane_in_d37),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff37 (.in_sig(lane_in_d37),
                .out_sig(lane_in_d38),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff38 (.in_sig(lane_in_d38),
                .out_sig(lane_in_d39),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff39 (.in_sig(lane_in_d39),
                .out_sig(lane_in_d40),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff40 (.in_sig(lane_in_d40),
                .out_sig(lane_in_d41),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff41 (.in_sig(lane_in_d41),
                .out_sig(lane_in_d42),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff42 (.in_sig(lane_in_d42),
                .out_sig(lane_in_d43),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff43 (.in_sig(lane_in_d43),
                .out_sig(lane_in_d44),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff44 (.in_sig(lane_in_d44),
                .out_sig(lane_in_d45),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff45 (.in_sig(lane_in_d45),
                .out_sig(lane_in_d46),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff46 (.in_sig(lane_in_d46),
                .out_sig(lane_in_d47),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff47 (.in_sig(lane_in_d47),
                .out_sig(lane_in_d48),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff48 (.in_sig(lane_in_d48),
                .out_sig(lane_in_d49),
                .clk(link_clk));
pl_dff_p #(`LINK_WIDTH) ff49 (.in_sig(lane_in_d49),
                .out_sig(lane_in_d50),
                .clk(link_clk));
endmodule
