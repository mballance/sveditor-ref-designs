// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nb_bit_lane_deskew.v
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
`ifdef STINGRAY

module nb_bit_lane_deskew(pn_in,pn_out,init,sclk);
parameter DS=0;

// interface signals
input  [13:0] pn_in;
output [13:0] pn_out;
input         init;
input         sclk;

reg [9:0] pn0_deskew,pn1_deskew,pn2_deskew,pn3_deskew;
reg [9:0] pn4_deskew,pn5_deskew,pn6_deskew,pn7_deskew;
reg [9:0] pn8_deskew,pn9_deskew,pn10_deskew,pn11_deskew;
reg [9:0] pn12_deskew,pn13_deskew;
reg dummy;

initial begin

pn0_deskew=10'h0;
pn1_deskew=10'h0;
pn2_deskew=10'h0;
pn3_deskew=10'h0;
pn4_deskew=10'h0;
pn5_deskew=10'h0;
pn6_deskew=10'h0;
pn7_deskew=10'h0;
pn8_deskew=10'h0;
pn9_deskew=10'h0;
pn10_deskew=10'h0;
pn11_deskew=10'h0;
pn12_deskew=10'h0;
pn13_deskew=10'h0;

`ifdef AXIS_FBDIMM_HW
`else
dummy=$value$plusargs("pn0_deskew=%h",pn0_deskew);
dummy=$value$plusargs("pn1_deskew=%h",pn1_deskew);
dummy=$value$plusargs("pn2_deskew=%h",pn2_deskew);
dummy=$value$plusargs("pn3_deskew=%h",pn3_deskew);
dummy=$value$plusargs("pn4_deskew=%h",pn4_deskew);
dummy=$value$plusargs("pn5_deskew=%h",pn5_deskew);
dummy=$value$plusargs("pn6_deskew=%h",pn6_deskew);
dummy=$value$plusargs("pn7_deskew=%h",pn7_deskew);
dummy=$value$plusargs("pn8_deskew=%h",pn8_deskew);
dummy=$value$plusargs("pn9_deskew=%h",pn9_deskew);
dummy=$value$plusargs("pn10_deskew=%h",pn10_deskew);
dummy=$value$plusargs("pn11_deskew=%h",pn11_deskew);
dummy=$value$plusargs("pn12_deskew=%h",pn12_deskew);
dummy=$value$plusargs("pn13_deskew=%h",pn13_deskew);
`endif

end

wire [13:0] pn_d1,pn_d2,pn_d3,pn_d4,pn_d5,pn_d6,pn_d7,pn_d8,pn_d9,pn_d10;
wire [13:0] pn_d11,pn_d12,pn_d13,pn_d14,pn_d15,pn_d16,pn_d17,pn_d18,pn_d19,pn_d20;
wire [13:0] pn_d21,pn_d22,pn_d23,pn_d24,pn_d25,pn_d26,pn_d27,pn_d28,pn_d29,pn_d30;
wire [13:0] pn_d31,pn_d32,pn_d33,pn_d34,pn_d35,pn_d36,pn_d37,pn_d38,pn_d39,pn_d40;
wire [13:0] pn_d41,pn_d42,pn_d43,pn_d44,pn_d45,pn_d46,pn_d47,pn_d48,pn_d49,pn_d50;
wire [13:0] pn_d51,pn_d52,pn_d53,pn_d54,pn_d55,pn_d56,pn_d57,pn_d58,pn_d59,pn_d60;
wire [13:0] pn_d61,pn_d62,pn_d63,pn_d64,pn_d65,pn_d66,pn_d67,pn_d68,pn_d69,pn_d70;
wire [13:0] pn_d71,pn_d72,pn_d73,pn_d74,pn_d75,pn_d76,pn_d77,pn_d78,pn_d79,pn_d80;
wire [13:0] pn_d81,pn_d82,pn_d83,pn_d84,pn_d85,pn_d86,pn_d87,pn_d88,pn_d89,pn_d90;
wire [13:0] pn_d91,pn_d92,pn_d93,pn_d94,pn_d95,pn_d96,pn_d97,pn_d98,pn_d99,pn_d100;
wire [13:0] pn_d101,pn_d102,pn_d103,pn_d104,pn_d105,pn_d106,pn_d107,pn_d108,pn_d109,pn_d110;
wire [13:0] pn_d111,pn_d112,pn_d113,pn_d114,pn_d115,pn_d116,pn_d117,pn_d118,pn_d119,pn_d120;
wire [13:0] pn_d121,pn_d122,pn_d123,pn_d124,pn_d125,pn_d126,pn_d127,pn_d128,pn_d129,pn_d130;
wire [13:0] pn_d131,pn_d132,pn_d133,pn_d134,pn_d135,pn_d136,pn_d137,pn_d138,pn_d139,pn_d140;
wire [13:0] pn_d141,pn_d142,pn_d143,pn_d144,pn_d145,pn_d146,pn_d147,pn_d148,pn_d149,pn_d150;
 
 assign pn_out[0] = ( pn0_deskew == 10'h0 ) ? pn_in[0] : 
                    ( pn0_deskew == 10'h1 ) ? pn_d1[0] : 
                    ( pn0_deskew == 10'h2 ) ? pn_d2[0] : 
                    ( pn0_deskew == 10'h3 ) ? pn_d3[0] : 
                    ( pn0_deskew == 10'h4 ) ? pn_d4[0] : 
                    ( pn0_deskew == 10'h5 ) ? pn_d5[0] : 
                    ( pn0_deskew == 10'h6 ) ? pn_d6[0] : 
                    ( pn0_deskew == 10'h7 ) ? pn_d7[0] : 
                    ( pn0_deskew == 10'h8 ) ? pn_d8[0] : 
                    ( pn0_deskew == 10'h9 ) ? pn_d9[0] : 
                    ( pn0_deskew == 10'ha ) ? pn_d10[0] : 
                    ( pn0_deskew == 10'hb ) ? pn_d11[0] : 
                    ( pn0_deskew == 10'hc ) ? pn_d12[0] : 
                    ( pn0_deskew == 10'hd ) ? pn_d13[0] : 
                    ( pn0_deskew == 10'he ) ? pn_d14[0] : 
                    ( pn0_deskew == 10'hf ) ? pn_d15[0] : 
                    ( pn0_deskew == 10'h10 ) ? pn_d16[0] : 
                    ( pn0_deskew == 10'h11 ) ? pn_d17[0] : 
                    ( pn0_deskew == 10'h12 ) ? pn_d18[0] : 
                    ( pn0_deskew == 10'h13 ) ? pn_d19[0] : 
                    ( pn0_deskew == 10'h14 ) ? pn_d20[0] : 
                    ( pn0_deskew == 10'h15 ) ? pn_d21[0] : 
                    ( pn0_deskew == 10'h16 ) ? pn_d22[0] : 
                    ( pn0_deskew == 10'h17 ) ? pn_d23[0] : 
                    ( pn0_deskew == 10'h18 ) ? pn_d24[0] : 
                    ( pn0_deskew == 10'h19 ) ? pn_d25[0] : 
                    ( pn0_deskew == 10'h1a ) ? pn_d26[0] : 
                    ( pn0_deskew == 10'h1b ) ? pn_d27[0] : 
                    ( pn0_deskew == 10'h1c ) ? pn_d28[0] : 
                    ( pn0_deskew == 10'h1d ) ? pn_d29[0] : 
                    ( pn0_deskew == 10'h1e ) ? pn_d30[0] : 
                    ( pn0_deskew == 10'h1f ) ? pn_d31[0] : 
                    ( pn0_deskew == 10'h20 ) ? pn_d32[0] : 
                    ( pn0_deskew == 10'h21 ) ? pn_d33[0] : 
                    ( pn0_deskew == 10'h22 ) ? pn_d34[0] : 
                    ( pn0_deskew == 10'h23 ) ? pn_d35[0] : 
                    ( pn0_deskew == 10'h24 ) ? pn_d36[0] : 
                    ( pn0_deskew == 10'h25 ) ? pn_d37[0] : 
                    ( pn0_deskew == 10'h26 ) ? pn_d38[0] : 
                    ( pn0_deskew == 10'h27 ) ? pn_d39[0] : 
                    ( pn0_deskew == 10'h28 ) ? pn_d40[0] : 
                    ( pn0_deskew == 10'h29 ) ? pn_d41[0] : 
                    ( pn0_deskew == 10'h2a ) ? pn_d42[0] : 
                    ( pn0_deskew == 10'h2b ) ? pn_d43[0] : 
                    ( pn0_deskew == 10'h2c ) ? pn_d44[0] : 
                    ( pn0_deskew == 10'h2d ) ? pn_d45[0] : 
                    ( pn0_deskew == 10'h2e ) ? pn_d46[0] : 
                    ( pn0_deskew == 10'h2f ) ? pn_d47[0] : 
                    ( pn0_deskew == 10'h30 ) ? pn_d48[0] : 
                    ( pn0_deskew == 10'h31 ) ? pn_d49[0] : 
                    ( pn0_deskew == 10'h32 ) ? pn_d50[0] : 
                    ( pn0_deskew == 10'h33 ) ? pn_d51[0] : 
                    ( pn0_deskew == 10'h34 ) ? pn_d52[0] : 
                    ( pn0_deskew == 10'h35 ) ? pn_d53[0] : 
                    ( pn0_deskew == 10'h36 ) ? pn_d54[0] : 
                    ( pn0_deskew == 10'h37 ) ? pn_d55[0] : 
                    ( pn0_deskew == 10'h38 ) ? pn_d56[0] : 
                    ( pn0_deskew == 10'h39 ) ? pn_d57[0] : 
                    ( pn0_deskew == 10'h3a ) ? pn_d58[0] : 
                    ( pn0_deskew == 10'h3b ) ? pn_d59[0] : 
                    ( pn0_deskew == 10'h3c ) ? pn_d60[0] : 
                    ( pn0_deskew == 10'h3d ) ? pn_d61[0] : 
                    ( pn0_deskew == 10'h3e ) ? pn_d62[0] : 
                    ( pn0_deskew == 10'h3f ) ? pn_d63[0] : 
                    ( pn0_deskew == 10'h40 ) ? pn_d64[0] : 
                    ( pn0_deskew == 10'h41 ) ? pn_d65[0] : 
                    ( pn0_deskew == 10'h42 ) ? pn_d66[0] : 
                    ( pn0_deskew == 10'h43 ) ? pn_d67[0] : 
                    ( pn0_deskew == 10'h44 ) ? pn_d68[0] : 
                    ( pn0_deskew == 10'h45 ) ? pn_d69[0] : 
                    ( pn0_deskew == 10'h46 ) ? pn_d70[0] : 
                    ( pn0_deskew == 10'h47 ) ? pn_d71[0] : 
                    ( pn0_deskew == 10'h48 ) ? pn_d72[0] : 
                    ( pn0_deskew == 10'h49 ) ? pn_d73[0] : 
                    ( pn0_deskew == 10'h4a ) ? pn_d74[0] : 
                    ( pn0_deskew == 10'h4b ) ? pn_d75[0] : 
                    ( pn0_deskew == 10'h4c ) ? pn_d76[0] : 
                    ( pn0_deskew == 10'h4d ) ? pn_d77[0] : 
                    ( pn0_deskew == 10'h4e ) ? pn_d78[0] : 
                    ( pn0_deskew == 10'h4f ) ? pn_d79[0] : 
                    ( pn0_deskew == 10'h50 ) ? pn_d80[0] : 
                    ( pn0_deskew == 10'h51 ) ? pn_d81[0] : 
                    ( pn0_deskew == 10'h52 ) ? pn_d82[0] : 
                    ( pn0_deskew == 10'h53 ) ? pn_d83[0] : 
                    ( pn0_deskew == 10'h54 ) ? pn_d84[0] : 
                    ( pn0_deskew == 10'h55 ) ? pn_d85[0] : 
                    ( pn0_deskew == 10'h56 ) ? pn_d86[0] : 
                    ( pn0_deskew == 10'h57 ) ? pn_d87[0] : 
                    ( pn0_deskew == 10'h58 ) ? pn_d88[0] : 
                    ( pn0_deskew == 10'h59 ) ? pn_d89[0] : 
                    ( pn0_deskew == 10'h5a ) ? pn_d90[0] : 
                    ( pn0_deskew == 10'h5b ) ? pn_d91[0] : 
                    ( pn0_deskew == 10'h5c ) ? pn_d92[0] : 
                    ( pn0_deskew == 10'h5d ) ? pn_d93[0] : 
                    ( pn0_deskew == 10'h5e ) ? pn_d94[0] : 
                    ( pn0_deskew == 10'h5f ) ? pn_d95[0] : 
                    ( pn0_deskew == 10'h60 ) ? pn_d96[0] : 
                    ( pn0_deskew == 10'h61 ) ? pn_d97[0] : 
                    ( pn0_deskew == 10'h62 ) ? pn_d98[0] : 
                    ( pn0_deskew == 10'h63 ) ? pn_d99[0] : 
                    ( pn0_deskew == 10'h64 ) ? pn_d100[0] : 
                    ( pn0_deskew == 10'h65 ) ? pn_d101[0] : 
                    ( pn0_deskew == 10'h66 ) ? pn_d102[0] : 
                    ( pn0_deskew == 10'h67 ) ? pn_d103[0] : 
                    ( pn0_deskew == 10'h68 ) ? pn_d104[0] : 
                    ( pn0_deskew == 10'h69 ) ? pn_d105[0] : 
                    ( pn0_deskew == 10'h6a ) ? pn_d106[0] : 
                    ( pn0_deskew == 10'h6b ) ? pn_d107[0] : 
                    ( pn0_deskew == 10'h6c ) ? pn_d108[0] : 
                    ( pn0_deskew == 10'h6d ) ? pn_d109[0] : 
                    ( pn0_deskew == 10'h6e ) ? pn_d110[0] : 
                    ( pn0_deskew == 10'h6f ) ? pn_d111[0] : 
                    ( pn0_deskew == 10'h70 ) ? pn_d112[0] : 
                    ( pn0_deskew == 10'h71 ) ? pn_d113[0] : 
                    ( pn0_deskew == 10'h72 ) ? pn_d114[0] : 
                    ( pn0_deskew == 10'h73 ) ? pn_d115[0] : 
                    ( pn0_deskew == 10'h74 ) ? pn_d116[0] : 
                    ( pn0_deskew == 10'h75 ) ? pn_d117[0] : 
                    ( pn0_deskew == 10'h76 ) ? pn_d118[0] : 
                    ( pn0_deskew == 10'h77 ) ? pn_d119[0] : 
                    ( pn0_deskew == 10'h78 ) ? pn_d120[0] : 
                    ( pn0_deskew == 10'h79 ) ? pn_d121[0] : 
                    ( pn0_deskew == 10'h7a ) ? pn_d122[0] : 
                    ( pn0_deskew == 10'h7b ) ? pn_d123[0] : 
                    ( pn0_deskew == 10'h7c ) ? pn_d124[0] : 
                    ( pn0_deskew == 10'h7d ) ? pn_d125[0] : 
                    ( pn0_deskew == 10'h7e ) ? pn_d126[0] : 
                    ( pn0_deskew == 10'h7f ) ? pn_d127[0] : 
                    ( pn0_deskew == 10'h80 ) ? pn_d128[0] : 
                    ( pn0_deskew == 10'h81 ) ? pn_d129[0] : 
                    ( pn0_deskew == 10'h82 ) ? pn_d130[0] : 
                    ( pn0_deskew == 10'h83 ) ? pn_d131[0] : 
                    ( pn0_deskew == 10'h84 ) ? pn_d132[0] : 
                    ( pn0_deskew == 10'h85 ) ? pn_d133[0] : 
                    ( pn0_deskew == 10'h86 ) ? pn_d134[0] : 
                    ( pn0_deskew == 10'h87 ) ? pn_d135[0] : 
                    ( pn0_deskew == 10'h88 ) ? pn_d136[0] : 
                    ( pn0_deskew == 10'h89 ) ? pn_d137[0] : 
                    ( pn0_deskew == 10'h8a ) ? pn_d138[0] : 
                    ( pn0_deskew == 10'h8b ) ? pn_d139[0] : 
                    ( pn0_deskew == 10'h8c ) ? pn_d140[0] : 
                    ( pn0_deskew == 10'h8d ) ? pn_d141[0] : 
                    ( pn0_deskew == 10'h8e ) ? pn_d142[0] : 
                    ( pn0_deskew == 10'h8f ) ? pn_d143[0] : 
                    ( pn0_deskew == 10'h90 ) ? pn_d144[0] : 
                    ( pn0_deskew == 10'h91 ) ? pn_d145[0] : pn_in[0]; 
assign pn_out[1] = ( pn1_deskew == 10'h0 ) ? pn_in[1] : 
                    ( pn1_deskew == 10'h1 ) ? pn_d1[1] : 
                    ( pn1_deskew == 10'h2 ) ? pn_d2[1] : 
                    ( pn1_deskew == 10'h3 ) ? pn_d3[1] : 
                    ( pn1_deskew == 10'h4 ) ? pn_d4[1] : 
                    ( pn1_deskew == 10'h5 ) ? pn_d5[1] : 
                    ( pn1_deskew == 10'h6 ) ? pn_d6[1] : 
                    ( pn1_deskew == 10'h7 ) ? pn_d7[1] : 
                    ( pn1_deskew == 10'h8 ) ? pn_d8[1] : 
                    ( pn1_deskew == 10'h9 ) ? pn_d9[1] : 
                    ( pn1_deskew == 10'ha ) ? pn_d10[1] : 
                    ( pn1_deskew == 10'hb ) ? pn_d11[1] : 
                    ( pn1_deskew == 10'hc ) ? pn_d12[1] : 
                    ( pn1_deskew == 10'hd ) ? pn_d13[1] : 
                    ( pn1_deskew == 10'he ) ? pn_d14[1] : 
                    ( pn1_deskew == 10'hf ) ? pn_d15[1] : 
                    ( pn1_deskew == 10'h10 ) ? pn_d16[1] : 
                    ( pn1_deskew == 10'h11 ) ? pn_d17[1] : 
                    ( pn1_deskew == 10'h12 ) ? pn_d18[1] : 
                    ( pn1_deskew == 10'h13 ) ? pn_d19[1] : 
                    ( pn1_deskew == 10'h14 ) ? pn_d20[1] : 
                    ( pn1_deskew == 10'h15 ) ? pn_d21[1] : 
                    ( pn1_deskew == 10'h16 ) ? pn_d22[1] : 
                    ( pn1_deskew == 10'h17 ) ? pn_d23[1] : 
                    ( pn1_deskew == 10'h18 ) ? pn_d24[1] : 
                    ( pn1_deskew == 10'h19 ) ? pn_d25[1] : 
                    ( pn1_deskew == 10'h1a ) ? pn_d26[1] : 
                    ( pn1_deskew == 10'h1b ) ? pn_d27[1] : 
                    ( pn1_deskew == 10'h1c ) ? pn_d28[1] : 
                    ( pn1_deskew == 10'h1d ) ? pn_d29[1] : 
                    ( pn1_deskew == 10'h1e ) ? pn_d30[1] : 
                    ( pn1_deskew == 10'h1f ) ? pn_d31[1] : 
                    ( pn1_deskew == 10'h20 ) ? pn_d32[1] : 
                    ( pn1_deskew == 10'h21 ) ? pn_d33[1] : 
                    ( pn1_deskew == 10'h22 ) ? pn_d34[1] : 
                    ( pn1_deskew == 10'h23 ) ? pn_d35[1] : 
                    ( pn1_deskew == 10'h24 ) ? pn_d36[1] : 
                    ( pn1_deskew == 10'h25 ) ? pn_d37[1] : 
                    ( pn1_deskew == 10'h26 ) ? pn_d38[1] : 
                    ( pn1_deskew == 10'h27 ) ? pn_d39[1] : 
                    ( pn1_deskew == 10'h28 ) ? pn_d40[1] : 
                    ( pn1_deskew == 10'h29 ) ? pn_d41[1] : 
                    ( pn1_deskew == 10'h2a ) ? pn_d42[1] : 
                    ( pn1_deskew == 10'h2b ) ? pn_d43[1] : 
                    ( pn1_deskew == 10'h2c ) ? pn_d44[1] : 
                    ( pn1_deskew == 10'h2d ) ? pn_d45[1] : 
                    ( pn1_deskew == 10'h2e ) ? pn_d46[1] : 
                    ( pn1_deskew == 10'h2f ) ? pn_d47[1] : 
                    ( pn1_deskew == 10'h30 ) ? pn_d48[1] : 
                    ( pn1_deskew == 10'h31 ) ? pn_d49[1] : 
                    ( pn1_deskew == 10'h32 ) ? pn_d50[1] : 
                    ( pn1_deskew == 10'h33 ) ? pn_d51[1] : 
                    ( pn1_deskew == 10'h34 ) ? pn_d52[1] : 
                    ( pn1_deskew == 10'h35 ) ? pn_d53[1] : 
                    ( pn1_deskew == 10'h36 ) ? pn_d54[1] : 
                    ( pn1_deskew == 10'h37 ) ? pn_d55[1] : 
                    ( pn1_deskew == 10'h38 ) ? pn_d56[1] : 
                    ( pn1_deskew == 10'h39 ) ? pn_d57[1] : 
                    ( pn1_deskew == 10'h3a ) ? pn_d58[1] : 
                    ( pn1_deskew == 10'h3b ) ? pn_d59[1] : 
                    ( pn1_deskew == 10'h3c ) ? pn_d60[1] : 
                    ( pn1_deskew == 10'h3d ) ? pn_d61[1] : 
                    ( pn1_deskew == 10'h3e ) ? pn_d62[1] : 
                    ( pn1_deskew == 10'h3f ) ? pn_d63[1] : 
                    ( pn1_deskew == 10'h40 ) ? pn_d64[1] : 
                    ( pn1_deskew == 10'h41 ) ? pn_d65[1] : 
                    ( pn1_deskew == 10'h42 ) ? pn_d66[1] : 
                    ( pn1_deskew == 10'h43 ) ? pn_d67[1] : 
                    ( pn1_deskew == 10'h44 ) ? pn_d68[1] : 
                    ( pn1_deskew == 10'h45 ) ? pn_d69[1] : 
                    ( pn1_deskew == 10'h46 ) ? pn_d70[1] : 
                    ( pn1_deskew == 10'h47 ) ? pn_d71[1] : 
                    ( pn1_deskew == 10'h48 ) ? pn_d72[1] : 
                    ( pn1_deskew == 10'h49 ) ? pn_d73[1] : 
                    ( pn1_deskew == 10'h4a ) ? pn_d74[1] : 
                    ( pn1_deskew == 10'h4b ) ? pn_d75[1] : 
                    ( pn1_deskew == 10'h4c ) ? pn_d76[1] : 
                    ( pn1_deskew == 10'h4d ) ? pn_d77[1] : 
                    ( pn1_deskew == 10'h4e ) ? pn_d78[1] : 
                    ( pn1_deskew == 10'h4f ) ? pn_d79[1] : 
                    ( pn1_deskew == 10'h50 ) ? pn_d80[1] : 
                    ( pn1_deskew == 10'h51 ) ? pn_d81[1] : 
                    ( pn1_deskew == 10'h52 ) ? pn_d82[1] : 
                    ( pn1_deskew == 10'h53 ) ? pn_d83[1] : 
                    ( pn1_deskew == 10'h54 ) ? pn_d84[1] : 
                    ( pn1_deskew == 10'h55 ) ? pn_d85[1] : 
                    ( pn1_deskew == 10'h56 ) ? pn_d86[1] : 
                    ( pn1_deskew == 10'h57 ) ? pn_d87[1] : 
                    ( pn1_deskew == 10'h58 ) ? pn_d88[1] : 
                    ( pn1_deskew == 10'h59 ) ? pn_d89[1] : 
                    ( pn1_deskew == 10'h5a ) ? pn_d90[1] : 
                    ( pn1_deskew == 10'h5b ) ? pn_d91[1] : 
                    ( pn1_deskew == 10'h5c ) ? pn_d92[1] : 
                    ( pn1_deskew == 10'h5d ) ? pn_d93[1] : 
                    ( pn1_deskew == 10'h5e ) ? pn_d94[1] : 
                    ( pn1_deskew == 10'h5f ) ? pn_d95[1] : 
                    ( pn1_deskew == 10'h60 ) ? pn_d96[1] : 
                    ( pn1_deskew == 10'h61 ) ? pn_d97[1] : 
                    ( pn1_deskew == 10'h62 ) ? pn_d98[1] : 
                    ( pn1_deskew == 10'h63 ) ? pn_d99[1] : 
                    ( pn1_deskew == 10'h64 ) ? pn_d100[1] : 
                    ( pn1_deskew == 10'h65 ) ? pn_d101[1] : 
                    ( pn1_deskew == 10'h66 ) ? pn_d102[1] : 
                    ( pn1_deskew == 10'h67 ) ? pn_d103[1] : 
                    ( pn1_deskew == 10'h68 ) ? pn_d104[1] : 
                    ( pn1_deskew == 10'h69 ) ? pn_d105[1] : 
                    ( pn1_deskew == 10'h6a ) ? pn_d106[1] : 
                    ( pn1_deskew == 10'h6b ) ? pn_d107[1] : 
                    ( pn1_deskew == 10'h6c ) ? pn_d108[1] : 
                    ( pn1_deskew == 10'h6d ) ? pn_d109[1] : 
                    ( pn1_deskew == 10'h6e ) ? pn_d110[1] : 
                    ( pn1_deskew == 10'h6f ) ? pn_d111[1] : 
                    ( pn1_deskew == 10'h70 ) ? pn_d112[1] : 
                    ( pn1_deskew == 10'h71 ) ? pn_d113[1] : 
                    ( pn1_deskew == 10'h72 ) ? pn_d114[1] : 
                    ( pn1_deskew == 10'h73 ) ? pn_d115[1] : 
                    ( pn1_deskew == 10'h74 ) ? pn_d116[1] : 
                    ( pn1_deskew == 10'h75 ) ? pn_d117[1] : 
                    ( pn1_deskew == 10'h76 ) ? pn_d118[1] : 
                    ( pn1_deskew == 10'h77 ) ? pn_d119[1] : 
                    ( pn1_deskew == 10'h78 ) ? pn_d120[1] : 
                    ( pn1_deskew == 10'h79 ) ? pn_d121[1] : 
                    ( pn1_deskew == 10'h7a ) ? pn_d122[1] : 
                    ( pn1_deskew == 10'h7b ) ? pn_d123[1] : 
                    ( pn1_deskew == 10'h7c ) ? pn_d124[1] : 
                    ( pn1_deskew == 10'h7d ) ? pn_d125[1] : 
                    ( pn1_deskew == 10'h7e ) ? pn_d126[1] : 
                    ( pn1_deskew == 10'h7f ) ? pn_d127[1] : 
                    ( pn1_deskew == 10'h80 ) ? pn_d128[1] : 
                    ( pn1_deskew == 10'h81 ) ? pn_d129[1] : 
                    ( pn1_deskew == 10'h82 ) ? pn_d130[1] : 
                    ( pn1_deskew == 10'h83 ) ? pn_d131[1] : 
                    ( pn1_deskew == 10'h84 ) ? pn_d132[1] : 
                    ( pn1_deskew == 10'h85 ) ? pn_d133[1] : 
                    ( pn1_deskew == 10'h86 ) ? pn_d134[1] : 
                    ( pn1_deskew == 10'h87 ) ? pn_d135[1] : 
                    ( pn1_deskew == 10'h88 ) ? pn_d136[1] : 
                    ( pn1_deskew == 10'h89 ) ? pn_d137[1] : 
                    ( pn1_deskew == 10'h8a ) ? pn_d138[1] : 
                    ( pn1_deskew == 10'h8b ) ? pn_d139[1] : 
                    ( pn1_deskew == 10'h8c ) ? pn_d140[1] : 
                    ( pn1_deskew == 10'h8d ) ? pn_d141[1] : 
                    ( pn1_deskew == 10'h8e ) ? pn_d142[1] : 
                    ( pn1_deskew == 10'h8f ) ? pn_d143[1] : 
                    ( pn1_deskew == 10'h90 ) ? pn_d144[1] : 
                    ( pn1_deskew == 10'h91 ) ? pn_d145[1] : pn_in[1]; 
assign pn_out[2] = ( pn2_deskew == 10'h0 ) ? pn_in[2] : 
                    ( pn2_deskew == 10'h1 ) ? pn_d1[2] : 
                    ( pn2_deskew == 10'h2 ) ? pn_d2[2] : 
                    ( pn2_deskew == 10'h3 ) ? pn_d3[2] : 
                    ( pn2_deskew == 10'h4 ) ? pn_d4[2] : 
                    ( pn2_deskew == 10'h5 ) ? pn_d5[2] : 
                    ( pn2_deskew == 10'h6 ) ? pn_d6[2] : 
                    ( pn2_deskew == 10'h7 ) ? pn_d7[2] : 
                    ( pn2_deskew == 10'h8 ) ? pn_d8[2] : 
                    ( pn2_deskew == 10'h9 ) ? pn_d9[2] : 
                    ( pn2_deskew == 10'ha ) ? pn_d10[2] : 
                    ( pn2_deskew == 10'hb ) ? pn_d11[2] : 
                    ( pn2_deskew == 10'hc ) ? pn_d12[2] : 
                    ( pn2_deskew == 10'hd ) ? pn_d13[2] : 
                    ( pn2_deskew == 10'he ) ? pn_d14[2] : 
                    ( pn2_deskew == 10'hf ) ? pn_d15[2] : 
                    ( pn2_deskew == 10'h10 ) ? pn_d16[2] : 
                    ( pn2_deskew == 10'h11 ) ? pn_d17[2] : 
                    ( pn2_deskew == 10'h12 ) ? pn_d18[2] : 
                    ( pn2_deskew == 10'h13 ) ? pn_d19[2] : 
                    ( pn2_deskew == 10'h14 ) ? pn_d20[2] : 
                    ( pn2_deskew == 10'h15 ) ? pn_d21[2] : 
                    ( pn2_deskew == 10'h16 ) ? pn_d22[2] : 
                    ( pn2_deskew == 10'h17 ) ? pn_d23[2] : 
                    ( pn2_deskew == 10'h18 ) ? pn_d24[2] : 
                    ( pn2_deskew == 10'h19 ) ? pn_d25[2] : 
                    ( pn2_deskew == 10'h1a ) ? pn_d26[2] : 
                    ( pn2_deskew == 10'h1b ) ? pn_d27[2] : 
                    ( pn2_deskew == 10'h1c ) ? pn_d28[2] : 
                    ( pn2_deskew == 10'h1d ) ? pn_d29[2] : 
                    ( pn2_deskew == 10'h1e ) ? pn_d30[2] : 
                    ( pn2_deskew == 10'h1f ) ? pn_d31[2] : 
                    ( pn2_deskew == 10'h20 ) ? pn_d32[2] : 
                    ( pn2_deskew == 10'h21 ) ? pn_d33[2] : 
                    ( pn2_deskew == 10'h22 ) ? pn_d34[2] : 
                    ( pn2_deskew == 10'h23 ) ? pn_d35[2] : 
                    ( pn2_deskew == 10'h24 ) ? pn_d36[2] : 
                    ( pn2_deskew == 10'h25 ) ? pn_d37[2] : 
                    ( pn2_deskew == 10'h26 ) ? pn_d38[2] : 
                    ( pn2_deskew == 10'h27 ) ? pn_d39[2] : 
                    ( pn2_deskew == 10'h28 ) ? pn_d40[2] : 
                    ( pn2_deskew == 10'h29 ) ? pn_d41[2] : 
                    ( pn2_deskew == 10'h2a ) ? pn_d42[2] : 
                    ( pn2_deskew == 10'h2b ) ? pn_d43[2] : 
                    ( pn2_deskew == 10'h2c ) ? pn_d44[2] : 
                    ( pn2_deskew == 10'h2d ) ? pn_d45[2] : 
                    ( pn2_deskew == 10'h2e ) ? pn_d46[2] : 
                    ( pn2_deskew == 10'h2f ) ? pn_d47[2] : 
                    ( pn2_deskew == 10'h30 ) ? pn_d48[2] : 
                    ( pn2_deskew == 10'h31 ) ? pn_d49[2] : 
                    ( pn2_deskew == 10'h32 ) ? pn_d50[2] : 
                    ( pn2_deskew == 10'h33 ) ? pn_d51[2] : 
                    ( pn2_deskew == 10'h34 ) ? pn_d52[2] : 
                    ( pn2_deskew == 10'h35 ) ? pn_d53[2] : 
                    ( pn2_deskew == 10'h36 ) ? pn_d54[2] : 
                    ( pn2_deskew == 10'h37 ) ? pn_d55[2] : 
                    ( pn2_deskew == 10'h38 ) ? pn_d56[2] : 
                    ( pn2_deskew == 10'h39 ) ? pn_d57[2] : 
                    ( pn2_deskew == 10'h3a ) ? pn_d58[2] : 
                    ( pn2_deskew == 10'h3b ) ? pn_d59[2] : 
                    ( pn2_deskew == 10'h3c ) ? pn_d60[2] : 
                    ( pn2_deskew == 10'h3d ) ? pn_d61[2] : 
                    ( pn2_deskew == 10'h3e ) ? pn_d62[2] : 
                    ( pn2_deskew == 10'h3f ) ? pn_d63[2] : 
                    ( pn2_deskew == 10'h40 ) ? pn_d64[2] : 
                    ( pn2_deskew == 10'h41 ) ? pn_d65[2] : 
                    ( pn2_deskew == 10'h42 ) ? pn_d66[2] : 
                    ( pn2_deskew == 10'h43 ) ? pn_d67[2] : 
                    ( pn2_deskew == 10'h44 ) ? pn_d68[2] : 
                    ( pn2_deskew == 10'h45 ) ? pn_d69[2] : 
                    ( pn2_deskew == 10'h46 ) ? pn_d70[2] : 
                    ( pn2_deskew == 10'h47 ) ? pn_d71[2] : 
                    ( pn2_deskew == 10'h48 ) ? pn_d72[2] : 
                    ( pn2_deskew == 10'h49 ) ? pn_d73[2] : 
                    ( pn2_deskew == 10'h4a ) ? pn_d74[2] : 
                    ( pn2_deskew == 10'h4b ) ? pn_d75[2] : 
                    ( pn2_deskew == 10'h4c ) ? pn_d76[2] : 
                    ( pn2_deskew == 10'h4d ) ? pn_d77[2] : 
                    ( pn2_deskew == 10'h4e ) ? pn_d78[2] : 
                    ( pn2_deskew == 10'h4f ) ? pn_d79[2] : 
                    ( pn2_deskew == 10'h50 ) ? pn_d80[2] : 
                    ( pn2_deskew == 10'h51 ) ? pn_d81[2] : 
                    ( pn2_deskew == 10'h52 ) ? pn_d82[2] : 
                    ( pn2_deskew == 10'h53 ) ? pn_d83[2] : 
                    ( pn2_deskew == 10'h54 ) ? pn_d84[2] : 
                    ( pn2_deskew == 10'h55 ) ? pn_d85[2] : 
                    ( pn2_deskew == 10'h56 ) ? pn_d86[2] : 
                    ( pn2_deskew == 10'h57 ) ? pn_d87[2] : 
                    ( pn2_deskew == 10'h58 ) ? pn_d88[2] : 
                    ( pn2_deskew == 10'h59 ) ? pn_d89[2] : 
                    ( pn2_deskew == 10'h5a ) ? pn_d90[2] : 
                    ( pn2_deskew == 10'h5b ) ? pn_d91[2] : 
                    ( pn2_deskew == 10'h5c ) ? pn_d92[2] : 
                    ( pn2_deskew == 10'h5d ) ? pn_d93[2] : 
                    ( pn2_deskew == 10'h5e ) ? pn_d94[2] : 
                    ( pn2_deskew == 10'h5f ) ? pn_d95[2] : 
                    ( pn2_deskew == 10'h60 ) ? pn_d96[2] : 
                    ( pn2_deskew == 10'h61 ) ? pn_d97[2] : 
                    ( pn2_deskew == 10'h62 ) ? pn_d98[2] : 
                    ( pn2_deskew == 10'h63 ) ? pn_d99[2] : 
                    ( pn2_deskew == 10'h64 ) ? pn_d100[2] : 
                    ( pn2_deskew == 10'h65 ) ? pn_d101[2] : 
                    ( pn2_deskew == 10'h66 ) ? pn_d102[2] : 
                    ( pn2_deskew == 10'h67 ) ? pn_d103[2] : 
                    ( pn2_deskew == 10'h68 ) ? pn_d104[2] : 
                    ( pn2_deskew == 10'h69 ) ? pn_d105[2] : 
                    ( pn2_deskew == 10'h6a ) ? pn_d106[2] : 
                    ( pn2_deskew == 10'h6b ) ? pn_d107[2] : 
                    ( pn2_deskew == 10'h6c ) ? pn_d108[2] : 
                    ( pn2_deskew == 10'h6d ) ? pn_d109[2] : 
                    ( pn2_deskew == 10'h6e ) ? pn_d110[2] : 
                    ( pn2_deskew == 10'h6f ) ? pn_d111[2] : 
                    ( pn2_deskew == 10'h70 ) ? pn_d112[2] : 
                    ( pn2_deskew == 10'h71 ) ? pn_d113[2] : 
                    ( pn2_deskew == 10'h72 ) ? pn_d114[2] : 
                    ( pn2_deskew == 10'h73 ) ? pn_d115[2] : 
                    ( pn2_deskew == 10'h74 ) ? pn_d116[2] : 
                    ( pn2_deskew == 10'h75 ) ? pn_d117[2] : 
                    ( pn2_deskew == 10'h76 ) ? pn_d118[2] : 
                    ( pn2_deskew == 10'h77 ) ? pn_d119[2] : 
                    ( pn2_deskew == 10'h78 ) ? pn_d120[2] : 
                    ( pn2_deskew == 10'h79 ) ? pn_d121[2] : 
                    ( pn2_deskew == 10'h7a ) ? pn_d122[2] : 
                    ( pn2_deskew == 10'h7b ) ? pn_d123[2] : 
                    ( pn2_deskew == 10'h7c ) ? pn_d124[2] : 
                    ( pn2_deskew == 10'h7d ) ? pn_d125[2] : 
                    ( pn2_deskew == 10'h7e ) ? pn_d126[2] : 
                    ( pn2_deskew == 10'h7f ) ? pn_d127[2] : 
                    ( pn2_deskew == 10'h80 ) ? pn_d128[2] : 
                    ( pn2_deskew == 10'h81 ) ? pn_d129[2] : 
                    ( pn2_deskew == 10'h82 ) ? pn_d130[2] : 
                    ( pn2_deskew == 10'h83 ) ? pn_d131[2] : 
                    ( pn2_deskew == 10'h84 ) ? pn_d132[2] : 
                    ( pn2_deskew == 10'h85 ) ? pn_d133[2] : 
                    ( pn2_deskew == 10'h86 ) ? pn_d134[2] : 
                    ( pn2_deskew == 10'h87 ) ? pn_d135[2] : 
                    ( pn2_deskew == 10'h88 ) ? pn_d136[2] : 
                    ( pn2_deskew == 10'h89 ) ? pn_d137[2] : 
                    ( pn2_deskew == 10'h8a ) ? pn_d138[2] : 
                    ( pn2_deskew == 10'h8b ) ? pn_d139[2] : 
                    ( pn2_deskew == 10'h8c ) ? pn_d140[2] : 
                    ( pn2_deskew == 10'h8d ) ? pn_d141[2] : 
                    ( pn2_deskew == 10'h8e ) ? pn_d142[2] : 
                    ( pn2_deskew == 10'h8f ) ? pn_d143[2] : 
                    ( pn2_deskew == 10'h90 ) ? pn_d144[2] : 
                    ( pn2_deskew == 10'h91 ) ? pn_d145[2] : pn_in[2]; 
assign pn_out[3] = ( pn3_deskew == 10'h0 ) ? pn_in[3] : 
                    ( pn3_deskew == 10'h1 ) ? pn_d1[3] : 
                    ( pn3_deskew == 10'h2 ) ? pn_d2[3] : 
                    ( pn3_deskew == 10'h3 ) ? pn_d3[3] : 
                    ( pn3_deskew == 10'h4 ) ? pn_d4[3] : 
                    ( pn3_deskew == 10'h5 ) ? pn_d5[3] : 
                    ( pn3_deskew == 10'h6 ) ? pn_d6[3] : 
                    ( pn3_deskew == 10'h7 ) ? pn_d7[3] : 
                    ( pn3_deskew == 10'h8 ) ? pn_d8[3] : 
                    ( pn3_deskew == 10'h9 ) ? pn_d9[3] : 
                    ( pn3_deskew == 10'ha ) ? pn_d10[3] : 
                    ( pn3_deskew == 10'hb ) ? pn_d11[3] : 
                    ( pn3_deskew == 10'hc ) ? pn_d12[3] : 
                    ( pn3_deskew == 10'hd ) ? pn_d13[3] : 
                    ( pn3_deskew == 10'he ) ? pn_d14[3] : 
                    ( pn3_deskew == 10'hf ) ? pn_d15[3] : 
                    ( pn3_deskew == 10'h10 ) ? pn_d16[3] : 
                    ( pn3_deskew == 10'h11 ) ? pn_d17[3] : 
                    ( pn3_deskew == 10'h12 ) ? pn_d18[3] : 
                    ( pn3_deskew == 10'h13 ) ? pn_d19[3] : 
                    ( pn3_deskew == 10'h14 ) ? pn_d20[3] : 
                    ( pn3_deskew == 10'h15 ) ? pn_d21[3] : 
                    ( pn3_deskew == 10'h16 ) ? pn_d22[3] : 
                    ( pn3_deskew == 10'h17 ) ? pn_d23[3] : 
                    ( pn3_deskew == 10'h18 ) ? pn_d24[3] : 
                    ( pn3_deskew == 10'h19 ) ? pn_d25[3] : 
                    ( pn3_deskew == 10'h1a ) ? pn_d26[3] : 
                    ( pn3_deskew == 10'h1b ) ? pn_d27[3] : 
                    ( pn3_deskew == 10'h1c ) ? pn_d28[3] : 
                    ( pn3_deskew == 10'h1d ) ? pn_d29[3] : 
                    ( pn3_deskew == 10'h1e ) ? pn_d30[3] : 
                    ( pn3_deskew == 10'h1f ) ? pn_d31[3] : 
                    ( pn3_deskew == 10'h20 ) ? pn_d32[3] : 
                    ( pn3_deskew == 10'h21 ) ? pn_d33[3] : 
                    ( pn3_deskew == 10'h22 ) ? pn_d34[3] : 
                    ( pn3_deskew == 10'h23 ) ? pn_d35[3] : 
                    ( pn3_deskew == 10'h24 ) ? pn_d36[3] : 
                    ( pn3_deskew == 10'h25 ) ? pn_d37[3] : 
                    ( pn3_deskew == 10'h26 ) ? pn_d38[3] : 
                    ( pn3_deskew == 10'h27 ) ? pn_d39[3] : 
                    ( pn3_deskew == 10'h28 ) ? pn_d40[3] : 
                    ( pn3_deskew == 10'h29 ) ? pn_d41[3] : 
                    ( pn3_deskew == 10'h2a ) ? pn_d42[3] : 
                    ( pn3_deskew == 10'h2b ) ? pn_d43[3] : 
                    ( pn3_deskew == 10'h2c ) ? pn_d44[3] : 
                    ( pn3_deskew == 10'h2d ) ? pn_d45[3] : 
                    ( pn3_deskew == 10'h2e ) ? pn_d46[3] : 
                    ( pn3_deskew == 10'h2f ) ? pn_d47[3] : 
                    ( pn3_deskew == 10'h30 ) ? pn_d48[3] : 
                    ( pn3_deskew == 10'h31 ) ? pn_d49[3] : 
                    ( pn3_deskew == 10'h32 ) ? pn_d50[3] : 
                    ( pn3_deskew == 10'h33 ) ? pn_d51[3] : 
                    ( pn3_deskew == 10'h34 ) ? pn_d52[3] : 
                    ( pn3_deskew == 10'h35 ) ? pn_d53[3] : 
                    ( pn3_deskew == 10'h36 ) ? pn_d54[3] : 
                    ( pn3_deskew == 10'h37 ) ? pn_d55[3] : 
                    ( pn3_deskew == 10'h38 ) ? pn_d56[3] : 
                    ( pn3_deskew == 10'h39 ) ? pn_d57[3] : 
                    ( pn3_deskew == 10'h3a ) ? pn_d58[3] : 
                    ( pn3_deskew == 10'h3b ) ? pn_d59[3] : 
                    ( pn3_deskew == 10'h3c ) ? pn_d60[3] : 
                    ( pn3_deskew == 10'h3d ) ? pn_d61[3] : 
                    ( pn3_deskew == 10'h3e ) ? pn_d62[3] : 
                    ( pn3_deskew == 10'h3f ) ? pn_d63[3] : 
                    ( pn3_deskew == 10'h40 ) ? pn_d64[3] : 
                    ( pn3_deskew == 10'h41 ) ? pn_d65[3] : 
                    ( pn3_deskew == 10'h42 ) ? pn_d66[3] : 
                    ( pn3_deskew == 10'h43 ) ? pn_d67[3] : 
                    ( pn3_deskew == 10'h44 ) ? pn_d68[3] : 
                    ( pn3_deskew == 10'h45 ) ? pn_d69[3] : 
                    ( pn3_deskew == 10'h46 ) ? pn_d70[3] : 
                    ( pn3_deskew == 10'h47 ) ? pn_d71[3] : 
                    ( pn3_deskew == 10'h48 ) ? pn_d72[3] : 
                    ( pn3_deskew == 10'h49 ) ? pn_d73[3] : 
                    ( pn3_deskew == 10'h4a ) ? pn_d74[3] : 
                    ( pn3_deskew == 10'h4b ) ? pn_d75[3] : 
                    ( pn3_deskew == 10'h4c ) ? pn_d76[3] : 
                    ( pn3_deskew == 10'h4d ) ? pn_d77[3] : 
                    ( pn3_deskew == 10'h4e ) ? pn_d78[3] : 
                    ( pn3_deskew == 10'h4f ) ? pn_d79[3] : 
                    ( pn3_deskew == 10'h50 ) ? pn_d80[3] : 
                    ( pn3_deskew == 10'h51 ) ? pn_d81[3] : 
                    ( pn3_deskew == 10'h52 ) ? pn_d82[3] : 
                    ( pn3_deskew == 10'h53 ) ? pn_d83[3] : 
                    ( pn3_deskew == 10'h54 ) ? pn_d84[3] : 
                    ( pn3_deskew == 10'h55 ) ? pn_d85[3] : 
                    ( pn3_deskew == 10'h56 ) ? pn_d86[3] : 
                    ( pn3_deskew == 10'h57 ) ? pn_d87[3] : 
                    ( pn3_deskew == 10'h58 ) ? pn_d88[3] : 
                    ( pn3_deskew == 10'h59 ) ? pn_d89[3] : 
                    ( pn3_deskew == 10'h5a ) ? pn_d90[3] : 
                    ( pn3_deskew == 10'h5b ) ? pn_d91[3] : 
                    ( pn3_deskew == 10'h5c ) ? pn_d92[3] : 
                    ( pn3_deskew == 10'h5d ) ? pn_d93[3] : 
                    ( pn3_deskew == 10'h5e ) ? pn_d94[3] : 
                    ( pn3_deskew == 10'h5f ) ? pn_d95[3] : 
                    ( pn3_deskew == 10'h60 ) ? pn_d96[3] : 
                    ( pn3_deskew == 10'h61 ) ? pn_d97[3] : 
                    ( pn3_deskew == 10'h62 ) ? pn_d98[3] : 
                    ( pn3_deskew == 10'h63 ) ? pn_d99[3] : 
                    ( pn3_deskew == 10'h64 ) ? pn_d100[3] : 
                    ( pn3_deskew == 10'h65 ) ? pn_d101[3] : 
                    ( pn3_deskew == 10'h66 ) ? pn_d102[3] : 
                    ( pn3_deskew == 10'h67 ) ? pn_d103[3] : 
                    ( pn3_deskew == 10'h68 ) ? pn_d104[3] : 
                    ( pn3_deskew == 10'h69 ) ? pn_d105[3] : 
                    ( pn3_deskew == 10'h6a ) ? pn_d106[3] : 
                    ( pn3_deskew == 10'h6b ) ? pn_d107[3] : 
                    ( pn3_deskew == 10'h6c ) ? pn_d108[3] : 
                    ( pn3_deskew == 10'h6d ) ? pn_d109[3] : 
                    ( pn3_deskew == 10'h6e ) ? pn_d110[3] : 
                    ( pn3_deskew == 10'h6f ) ? pn_d111[3] : 
                    ( pn3_deskew == 10'h70 ) ? pn_d112[3] : 
                    ( pn3_deskew == 10'h71 ) ? pn_d113[3] : 
                    ( pn3_deskew == 10'h72 ) ? pn_d114[3] : 
                    ( pn3_deskew == 10'h73 ) ? pn_d115[3] : 
                    ( pn3_deskew == 10'h74 ) ? pn_d116[3] : 
                    ( pn3_deskew == 10'h75 ) ? pn_d117[3] : 
                    ( pn3_deskew == 10'h76 ) ? pn_d118[3] : 
                    ( pn3_deskew == 10'h77 ) ? pn_d119[3] : 
                    ( pn3_deskew == 10'h78 ) ? pn_d120[3] : 
                    ( pn3_deskew == 10'h79 ) ? pn_d121[3] : 
                    ( pn3_deskew == 10'h7a ) ? pn_d122[3] : 
                    ( pn3_deskew == 10'h7b ) ? pn_d123[3] : 
                    ( pn3_deskew == 10'h7c ) ? pn_d124[3] : 
                    ( pn3_deskew == 10'h7d ) ? pn_d125[3] : 
                    ( pn3_deskew == 10'h7e ) ? pn_d126[3] : 
                    ( pn3_deskew == 10'h7f ) ? pn_d127[3] : 
                    ( pn3_deskew == 10'h80 ) ? pn_d128[3] : 
                    ( pn3_deskew == 10'h81 ) ? pn_d129[3] : 
                    ( pn3_deskew == 10'h82 ) ? pn_d130[3] : 
                    ( pn3_deskew == 10'h83 ) ? pn_d131[3] : 
                    ( pn3_deskew == 10'h84 ) ? pn_d132[3] : 
                    ( pn3_deskew == 10'h85 ) ? pn_d133[3] : 
                    ( pn3_deskew == 10'h86 ) ? pn_d134[3] : 
                    ( pn3_deskew == 10'h87 ) ? pn_d135[3] : 
                    ( pn3_deskew == 10'h88 ) ? pn_d136[3] : 
                    ( pn3_deskew == 10'h89 ) ? pn_d137[3] : 
                    ( pn3_deskew == 10'h8a ) ? pn_d138[3] : 
                    ( pn3_deskew == 10'h8b ) ? pn_d139[3] : 
                    ( pn3_deskew == 10'h8c ) ? pn_d140[3] : 
                    ( pn3_deskew == 10'h8d ) ? pn_d141[3] : 
                    ( pn3_deskew == 10'h8e ) ? pn_d142[3] : 
                    ( pn3_deskew == 10'h8f ) ? pn_d143[3] : 
                    ( pn3_deskew == 10'h90 ) ? pn_d144[3] : 
                    ( pn3_deskew == 10'h91 ) ? pn_d145[3] : pn_in[3]; 
assign pn_out[4] = ( pn4_deskew == 10'h0 ) ? pn_in[4] : 
                    ( pn4_deskew == 10'h1 ) ? pn_d1[4] : 
                    ( pn4_deskew == 10'h2 ) ? pn_d2[4] : 
                    ( pn4_deskew == 10'h3 ) ? pn_d3[4] : 
                    ( pn4_deskew == 10'h4 ) ? pn_d4[4] : 
                    ( pn4_deskew == 10'h5 ) ? pn_d5[4] : 
                    ( pn4_deskew == 10'h6 ) ? pn_d6[4] : 
                    ( pn4_deskew == 10'h7 ) ? pn_d7[4] : 
                    ( pn4_deskew == 10'h8 ) ? pn_d8[4] : 
                    ( pn4_deskew == 10'h9 ) ? pn_d9[4] : 
                    ( pn4_deskew == 10'ha ) ? pn_d10[4] : 
                    ( pn4_deskew == 10'hb ) ? pn_d11[4] : 
                    ( pn4_deskew == 10'hc ) ? pn_d12[4] : 
                    ( pn4_deskew == 10'hd ) ? pn_d13[4] : 
                    ( pn4_deskew == 10'he ) ? pn_d14[4] : 
                    ( pn4_deskew == 10'hf ) ? pn_d15[4] : 
                    ( pn4_deskew == 10'h10 ) ? pn_d16[4] : 
                    ( pn4_deskew == 10'h11 ) ? pn_d17[4] : 
                    ( pn4_deskew == 10'h12 ) ? pn_d18[4] : 
                    ( pn4_deskew == 10'h13 ) ? pn_d19[4] : 
                    ( pn4_deskew == 10'h14 ) ? pn_d20[4] : 
                    ( pn4_deskew == 10'h15 ) ? pn_d21[4] : 
                    ( pn4_deskew == 10'h16 ) ? pn_d22[4] : 
                    ( pn4_deskew == 10'h17 ) ? pn_d23[4] : 
                    ( pn4_deskew == 10'h18 ) ? pn_d24[4] : 
                    ( pn4_deskew == 10'h19 ) ? pn_d25[4] : 
                    ( pn4_deskew == 10'h1a ) ? pn_d26[4] : 
                    ( pn4_deskew == 10'h1b ) ? pn_d27[4] : 
                    ( pn4_deskew == 10'h1c ) ? pn_d28[4] : 
                    ( pn4_deskew == 10'h1d ) ? pn_d29[4] : 
                    ( pn4_deskew == 10'h1e ) ? pn_d30[4] : 
                    ( pn4_deskew == 10'h1f ) ? pn_d31[4] : 
                    ( pn4_deskew == 10'h20 ) ? pn_d32[4] : 
                    ( pn4_deskew == 10'h21 ) ? pn_d33[4] : 
                    ( pn4_deskew == 10'h22 ) ? pn_d34[4] : 
                    ( pn4_deskew == 10'h23 ) ? pn_d35[4] : 
                    ( pn4_deskew == 10'h24 ) ? pn_d36[4] : 
                    ( pn4_deskew == 10'h25 ) ? pn_d37[4] : 
                    ( pn4_deskew == 10'h26 ) ? pn_d38[4] : 
                    ( pn4_deskew == 10'h27 ) ? pn_d39[4] : 
                    ( pn4_deskew == 10'h28 ) ? pn_d40[4] : 
                    ( pn4_deskew == 10'h29 ) ? pn_d41[4] : 
                    ( pn4_deskew == 10'h2a ) ? pn_d42[4] : 
                    ( pn4_deskew == 10'h2b ) ? pn_d43[4] : 
                    ( pn4_deskew == 10'h2c ) ? pn_d44[4] : 
                    ( pn4_deskew == 10'h2d ) ? pn_d45[4] : 
                    ( pn4_deskew == 10'h2e ) ? pn_d46[4] : 
                    ( pn4_deskew == 10'h2f ) ? pn_d47[4] : 
                    ( pn4_deskew == 10'h30 ) ? pn_d48[4] : 
                    ( pn4_deskew == 10'h31 ) ? pn_d49[4] : 
                    ( pn4_deskew == 10'h32 ) ? pn_d50[4] : 
                    ( pn4_deskew == 10'h33 ) ? pn_d51[4] : 
                    ( pn4_deskew == 10'h34 ) ? pn_d52[4] : 
                    ( pn4_deskew == 10'h35 ) ? pn_d53[4] : 
                    ( pn4_deskew == 10'h36 ) ? pn_d54[4] : 
                    ( pn4_deskew == 10'h37 ) ? pn_d55[4] : 
                    ( pn4_deskew == 10'h38 ) ? pn_d56[4] : 
                    ( pn4_deskew == 10'h39 ) ? pn_d57[4] : 
                    ( pn4_deskew == 10'h3a ) ? pn_d58[4] : 
                    ( pn4_deskew == 10'h3b ) ? pn_d59[4] : 
                    ( pn4_deskew == 10'h3c ) ? pn_d60[4] : 
                    ( pn4_deskew == 10'h3d ) ? pn_d61[4] : 
                    ( pn4_deskew == 10'h3e ) ? pn_d62[4] : 
                    ( pn4_deskew == 10'h3f ) ? pn_d63[4] : 
                    ( pn4_deskew == 10'h40 ) ? pn_d64[4] : 
                    ( pn4_deskew == 10'h41 ) ? pn_d65[4] : 
                    ( pn4_deskew == 10'h42 ) ? pn_d66[4] : 
                    ( pn4_deskew == 10'h43 ) ? pn_d67[4] : 
                    ( pn4_deskew == 10'h44 ) ? pn_d68[4] : 
                    ( pn4_deskew == 10'h45 ) ? pn_d69[4] : 
                    ( pn4_deskew == 10'h46 ) ? pn_d70[4] : 
                    ( pn4_deskew == 10'h47 ) ? pn_d71[4] : 
                    ( pn4_deskew == 10'h48 ) ? pn_d72[4] : 
                    ( pn4_deskew == 10'h49 ) ? pn_d73[4] : 
                    ( pn4_deskew == 10'h4a ) ? pn_d74[4] : 
                    ( pn4_deskew == 10'h4b ) ? pn_d75[4] : 
                    ( pn4_deskew == 10'h4c ) ? pn_d76[4] : 
                    ( pn4_deskew == 10'h4d ) ? pn_d77[4] : 
                    ( pn4_deskew == 10'h4e ) ? pn_d78[4] : 
                    ( pn4_deskew == 10'h4f ) ? pn_d79[4] : 
                    ( pn4_deskew == 10'h50 ) ? pn_d80[4] : 
                    ( pn4_deskew == 10'h51 ) ? pn_d81[4] : 
                    ( pn4_deskew == 10'h52 ) ? pn_d82[4] : 
                    ( pn4_deskew == 10'h53 ) ? pn_d83[4] : 
                    ( pn4_deskew == 10'h54 ) ? pn_d84[4] : 
                    ( pn4_deskew == 10'h55 ) ? pn_d85[4] : 
                    ( pn4_deskew == 10'h56 ) ? pn_d86[4] : 
                    ( pn4_deskew == 10'h57 ) ? pn_d87[4] : 
                    ( pn4_deskew == 10'h58 ) ? pn_d88[4] : 
                    ( pn4_deskew == 10'h59 ) ? pn_d89[4] : 
                    ( pn4_deskew == 10'h5a ) ? pn_d90[4] : 
                    ( pn4_deskew == 10'h5b ) ? pn_d91[4] : 
                    ( pn4_deskew == 10'h5c ) ? pn_d92[4] : 
                    ( pn4_deskew == 10'h5d ) ? pn_d93[4] : 
                    ( pn4_deskew == 10'h5e ) ? pn_d94[4] : 
                    ( pn4_deskew == 10'h5f ) ? pn_d95[4] : 
                    ( pn4_deskew == 10'h60 ) ? pn_d96[4] : 
                    ( pn4_deskew == 10'h61 ) ? pn_d97[4] : 
                    ( pn4_deskew == 10'h62 ) ? pn_d98[4] : 
                    ( pn4_deskew == 10'h63 ) ? pn_d99[4] : 
                    ( pn4_deskew == 10'h64 ) ? pn_d100[4] : 
                    ( pn4_deskew == 10'h65 ) ? pn_d101[4] : 
                    ( pn4_deskew == 10'h66 ) ? pn_d102[4] : 
                    ( pn4_deskew == 10'h67 ) ? pn_d103[4] : 
                    ( pn4_deskew == 10'h68 ) ? pn_d104[4] : 
                    ( pn4_deskew == 10'h69 ) ? pn_d105[4] : 
                    ( pn4_deskew == 10'h6a ) ? pn_d106[4] : 
                    ( pn4_deskew == 10'h6b ) ? pn_d107[4] : 
                    ( pn4_deskew == 10'h6c ) ? pn_d108[4] : 
                    ( pn4_deskew == 10'h6d ) ? pn_d109[4] : 
                    ( pn4_deskew == 10'h6e ) ? pn_d110[4] : 
                    ( pn4_deskew == 10'h6f ) ? pn_d111[4] : 
                    ( pn4_deskew == 10'h70 ) ? pn_d112[4] : 
                    ( pn4_deskew == 10'h71 ) ? pn_d113[4] : 
                    ( pn4_deskew == 10'h72 ) ? pn_d114[4] : 
                    ( pn4_deskew == 10'h73 ) ? pn_d115[4] : 
                    ( pn4_deskew == 10'h74 ) ? pn_d116[4] : 
                    ( pn4_deskew == 10'h75 ) ? pn_d117[4] : 
                    ( pn4_deskew == 10'h76 ) ? pn_d118[4] : 
                    ( pn4_deskew == 10'h77 ) ? pn_d119[4] : 
                    ( pn4_deskew == 10'h78 ) ? pn_d120[4] : 
                    ( pn4_deskew == 10'h79 ) ? pn_d121[4] : 
                    ( pn4_deskew == 10'h7a ) ? pn_d122[4] : 
                    ( pn4_deskew == 10'h7b ) ? pn_d123[4] : 
                    ( pn4_deskew == 10'h7c ) ? pn_d124[4] : 
                    ( pn4_deskew == 10'h7d ) ? pn_d125[4] : 
                    ( pn4_deskew == 10'h7e ) ? pn_d126[4] : 
                    ( pn4_deskew == 10'h7f ) ? pn_d127[4] : 
                    ( pn4_deskew == 10'h80 ) ? pn_d128[4] : 
                    ( pn4_deskew == 10'h81 ) ? pn_d129[4] : 
                    ( pn4_deskew == 10'h82 ) ? pn_d130[4] : 
                    ( pn4_deskew == 10'h83 ) ? pn_d131[4] : 
                    ( pn4_deskew == 10'h84 ) ? pn_d132[4] : 
                    ( pn4_deskew == 10'h85 ) ? pn_d133[4] : 
                    ( pn4_deskew == 10'h86 ) ? pn_d134[4] : 
                    ( pn4_deskew == 10'h87 ) ? pn_d135[4] : 
                    ( pn4_deskew == 10'h88 ) ? pn_d136[4] : 
                    ( pn4_deskew == 10'h89 ) ? pn_d137[4] : 
                    ( pn4_deskew == 10'h8a ) ? pn_d138[4] : 
                    ( pn4_deskew == 10'h8b ) ? pn_d139[4] : 
                    ( pn4_deskew == 10'h8c ) ? pn_d140[4] : 
                    ( pn4_deskew == 10'h8d ) ? pn_d141[4] : 
                    ( pn4_deskew == 10'h8e ) ? pn_d142[4] : 
                    ( pn4_deskew == 10'h8f ) ? pn_d143[4] : 
                    ( pn4_deskew == 10'h90 ) ? pn_d144[4] : 
                    ( pn4_deskew == 10'h91 ) ? pn_d145[4] : pn_in[4]; 
assign pn_out[5] = ( pn5_deskew == 10'h0 ) ? pn_in[5] : 
                    ( pn5_deskew == 10'h1 ) ? pn_d1[5] : 
                    ( pn5_deskew == 10'h2 ) ? pn_d2[5] : 
                    ( pn5_deskew == 10'h3 ) ? pn_d3[5] : 
                    ( pn5_deskew == 10'h4 ) ? pn_d4[5] : 
                    ( pn5_deskew == 10'h5 ) ? pn_d5[5] : 
                    ( pn5_deskew == 10'h6 ) ? pn_d6[5] : 
                    ( pn5_deskew == 10'h7 ) ? pn_d7[5] : 
                    ( pn5_deskew == 10'h8 ) ? pn_d8[5] : 
                    ( pn5_deskew == 10'h9 ) ? pn_d9[5] : 
                    ( pn5_deskew == 10'ha ) ? pn_d10[5] : 
                    ( pn5_deskew == 10'hb ) ? pn_d11[5] : 
                    ( pn5_deskew == 10'hc ) ? pn_d12[5] : 
                    ( pn5_deskew == 10'hd ) ? pn_d13[5] : 
                    ( pn5_deskew == 10'he ) ? pn_d14[5] : 
                    ( pn5_deskew == 10'hf ) ? pn_d15[5] : 
                    ( pn5_deskew == 10'h10 ) ? pn_d16[5] : 
                    ( pn5_deskew == 10'h11 ) ? pn_d17[5] : 
                    ( pn5_deskew == 10'h12 ) ? pn_d18[5] : 
                    ( pn5_deskew == 10'h13 ) ? pn_d19[5] : 
                    ( pn5_deskew == 10'h14 ) ? pn_d20[5] : 
                    ( pn5_deskew == 10'h15 ) ? pn_d21[5] : 
                    ( pn5_deskew == 10'h16 ) ? pn_d22[5] : 
                    ( pn5_deskew == 10'h17 ) ? pn_d23[5] : 
                    ( pn5_deskew == 10'h18 ) ? pn_d24[5] : 
                    ( pn5_deskew == 10'h19 ) ? pn_d25[5] : 
                    ( pn5_deskew == 10'h1a ) ? pn_d26[5] : 
                    ( pn5_deskew == 10'h1b ) ? pn_d27[5] : 
                    ( pn5_deskew == 10'h1c ) ? pn_d28[5] : 
                    ( pn5_deskew == 10'h1d ) ? pn_d29[5] : 
                    ( pn5_deskew == 10'h1e ) ? pn_d30[5] : 
                    ( pn5_deskew == 10'h1f ) ? pn_d31[5] : 
                    ( pn5_deskew == 10'h20 ) ? pn_d32[5] : 
                    ( pn5_deskew == 10'h21 ) ? pn_d33[5] : 
                    ( pn5_deskew == 10'h22 ) ? pn_d34[5] : 
                    ( pn5_deskew == 10'h23 ) ? pn_d35[5] : 
                    ( pn5_deskew == 10'h24 ) ? pn_d36[5] : 
                    ( pn5_deskew == 10'h25 ) ? pn_d37[5] : 
                    ( pn5_deskew == 10'h26 ) ? pn_d38[5] : 
                    ( pn5_deskew == 10'h27 ) ? pn_d39[5] : 
                    ( pn5_deskew == 10'h28 ) ? pn_d40[5] : 
                    ( pn5_deskew == 10'h29 ) ? pn_d41[5] : 
                    ( pn5_deskew == 10'h2a ) ? pn_d42[5] : 
                    ( pn5_deskew == 10'h2b ) ? pn_d43[5] : 
                    ( pn5_deskew == 10'h2c ) ? pn_d44[5] : 
                    ( pn5_deskew == 10'h2d ) ? pn_d45[5] : 
                    ( pn5_deskew == 10'h2e ) ? pn_d46[5] : 
                    ( pn5_deskew == 10'h2f ) ? pn_d47[5] : 
                    ( pn5_deskew == 10'h30 ) ? pn_d48[5] : 
                    ( pn5_deskew == 10'h31 ) ? pn_d49[5] : 
                    ( pn5_deskew == 10'h32 ) ? pn_d50[5] : 
                    ( pn5_deskew == 10'h33 ) ? pn_d51[5] : 
                    ( pn5_deskew == 10'h34 ) ? pn_d52[5] : 
                    ( pn5_deskew == 10'h35 ) ? pn_d53[5] : 
                    ( pn5_deskew == 10'h36 ) ? pn_d54[5] : 
                    ( pn5_deskew == 10'h37 ) ? pn_d55[5] : 
                    ( pn5_deskew == 10'h38 ) ? pn_d56[5] : 
                    ( pn5_deskew == 10'h39 ) ? pn_d57[5] : 
                    ( pn5_deskew == 10'h3a ) ? pn_d58[5] : 
                    ( pn5_deskew == 10'h3b ) ? pn_d59[5] : 
                    ( pn5_deskew == 10'h3c ) ? pn_d60[5] : 
                    ( pn5_deskew == 10'h3d ) ? pn_d61[5] : 
                    ( pn5_deskew == 10'h3e ) ? pn_d62[5] : 
                    ( pn5_deskew == 10'h3f ) ? pn_d63[5] : 
                    ( pn5_deskew == 10'h40 ) ? pn_d64[5] : 
                    ( pn5_deskew == 10'h41 ) ? pn_d65[5] : 
                    ( pn5_deskew == 10'h42 ) ? pn_d66[5] : 
                    ( pn5_deskew == 10'h43 ) ? pn_d67[5] : 
                    ( pn5_deskew == 10'h44 ) ? pn_d68[5] : 
                    ( pn5_deskew == 10'h45 ) ? pn_d69[5] : 
                    ( pn5_deskew == 10'h46 ) ? pn_d70[5] : 
                    ( pn5_deskew == 10'h47 ) ? pn_d71[5] : 
                    ( pn5_deskew == 10'h48 ) ? pn_d72[5] : 
                    ( pn5_deskew == 10'h49 ) ? pn_d73[5] : 
                    ( pn5_deskew == 10'h4a ) ? pn_d74[5] : 
                    ( pn5_deskew == 10'h4b ) ? pn_d75[5] : 
                    ( pn5_deskew == 10'h4c ) ? pn_d76[5] : 
                    ( pn5_deskew == 10'h4d ) ? pn_d77[5] : 
                    ( pn5_deskew == 10'h4e ) ? pn_d78[5] : 
                    ( pn5_deskew == 10'h4f ) ? pn_d79[5] : 
                    ( pn5_deskew == 10'h50 ) ? pn_d80[5] : 
                    ( pn5_deskew == 10'h51 ) ? pn_d81[5] : 
                    ( pn5_deskew == 10'h52 ) ? pn_d82[5] : 
                    ( pn5_deskew == 10'h53 ) ? pn_d83[5] : 
                    ( pn5_deskew == 10'h54 ) ? pn_d84[5] : 
                    ( pn5_deskew == 10'h55 ) ? pn_d85[5] : 
                    ( pn5_deskew == 10'h56 ) ? pn_d86[5] : 
                    ( pn5_deskew == 10'h57 ) ? pn_d87[5] : 
                    ( pn5_deskew == 10'h58 ) ? pn_d88[5] : 
                    ( pn5_deskew == 10'h59 ) ? pn_d89[5] : 
                    ( pn5_deskew == 10'h5a ) ? pn_d90[5] : 
                    ( pn5_deskew == 10'h5b ) ? pn_d91[5] : 
                    ( pn5_deskew == 10'h5c ) ? pn_d92[5] : 
                    ( pn5_deskew == 10'h5d ) ? pn_d93[5] : 
                    ( pn5_deskew == 10'h5e ) ? pn_d94[5] : 
                    ( pn5_deskew == 10'h5f ) ? pn_d95[5] : 
                    ( pn5_deskew == 10'h60 ) ? pn_d96[5] : 
                    ( pn5_deskew == 10'h61 ) ? pn_d97[5] : 
                    ( pn5_deskew == 10'h62 ) ? pn_d98[5] : 
                    ( pn5_deskew == 10'h63 ) ? pn_d99[5] : 
                    ( pn5_deskew == 10'h64 ) ? pn_d100[5] : 
                    ( pn5_deskew == 10'h65 ) ? pn_d101[5] : 
                    ( pn5_deskew == 10'h66 ) ? pn_d102[5] : 
                    ( pn5_deskew == 10'h67 ) ? pn_d103[5] : 
                    ( pn5_deskew == 10'h68 ) ? pn_d104[5] : 
                    ( pn5_deskew == 10'h69 ) ? pn_d105[5] : 
                    ( pn5_deskew == 10'h6a ) ? pn_d106[5] : 
                    ( pn5_deskew == 10'h6b ) ? pn_d107[5] : 
                    ( pn5_deskew == 10'h6c ) ? pn_d108[5] : 
                    ( pn5_deskew == 10'h6d ) ? pn_d109[5] : 
                    ( pn5_deskew == 10'h6e ) ? pn_d110[5] : 
                    ( pn5_deskew == 10'h6f ) ? pn_d111[5] : 
                    ( pn5_deskew == 10'h70 ) ? pn_d112[5] : 
                    ( pn5_deskew == 10'h71 ) ? pn_d113[5] : 
                    ( pn5_deskew == 10'h72 ) ? pn_d114[5] : 
                    ( pn5_deskew == 10'h73 ) ? pn_d115[5] : 
                    ( pn5_deskew == 10'h74 ) ? pn_d116[5] : 
                    ( pn5_deskew == 10'h75 ) ? pn_d117[5] : 
                    ( pn5_deskew == 10'h76 ) ? pn_d118[5] : 
                    ( pn5_deskew == 10'h77 ) ? pn_d119[5] : 
                    ( pn5_deskew == 10'h78 ) ? pn_d120[5] : 
                    ( pn5_deskew == 10'h79 ) ? pn_d121[5] : 
                    ( pn5_deskew == 10'h7a ) ? pn_d122[5] : 
                    ( pn5_deskew == 10'h7b ) ? pn_d123[5] : 
                    ( pn5_deskew == 10'h7c ) ? pn_d124[5] : 
                    ( pn5_deskew == 10'h7d ) ? pn_d125[5] : 
                    ( pn5_deskew == 10'h7e ) ? pn_d126[5] : 
                    ( pn5_deskew == 10'h7f ) ? pn_d127[5] : 
                    ( pn5_deskew == 10'h80 ) ? pn_d128[5] : 
                    ( pn5_deskew == 10'h81 ) ? pn_d129[5] : 
                    ( pn5_deskew == 10'h82 ) ? pn_d130[5] : 
                    ( pn5_deskew == 10'h83 ) ? pn_d131[5] : 
                    ( pn5_deskew == 10'h84 ) ? pn_d132[5] : 
                    ( pn5_deskew == 10'h85 ) ? pn_d133[5] : 
                    ( pn5_deskew == 10'h86 ) ? pn_d134[5] : 
                    ( pn5_deskew == 10'h87 ) ? pn_d135[5] : 
                    ( pn5_deskew == 10'h88 ) ? pn_d136[5] : 
                    ( pn5_deskew == 10'h89 ) ? pn_d137[5] : 
                    ( pn5_deskew == 10'h8a ) ? pn_d138[5] : 
                    ( pn5_deskew == 10'h8b ) ? pn_d139[5] : 
                    ( pn5_deskew == 10'h8c ) ? pn_d140[5] : 
                    ( pn5_deskew == 10'h8d ) ? pn_d141[5] : 
                    ( pn5_deskew == 10'h8e ) ? pn_d142[5] : 
                    ( pn5_deskew == 10'h8f ) ? pn_d143[5] : 
                    ( pn5_deskew == 10'h90 ) ? pn_d144[5] : 
                    ( pn5_deskew == 10'h91 ) ? pn_d145[5] : pn_in[5]; 
assign pn_out[6] = ( pn6_deskew == 10'h0 ) ? pn_in[6] : 
                    ( pn6_deskew == 10'h1 ) ? pn_d1[6] : 
                    ( pn6_deskew == 10'h2 ) ? pn_d2[6] : 
                    ( pn6_deskew == 10'h3 ) ? pn_d3[6] : 
                    ( pn6_deskew == 10'h4 ) ? pn_d4[6] : 
                    ( pn6_deskew == 10'h5 ) ? pn_d5[6] : 
                    ( pn6_deskew == 10'h6 ) ? pn_d6[6] : 
                    ( pn6_deskew == 10'h7 ) ? pn_d7[6] : 
                    ( pn6_deskew == 10'h8 ) ? pn_d8[6] : 
                    ( pn6_deskew == 10'h9 ) ? pn_d9[6] : 
                    ( pn6_deskew == 10'ha ) ? pn_d10[6] : 
                    ( pn6_deskew == 10'hb ) ? pn_d11[6] : 
                    ( pn6_deskew == 10'hc ) ? pn_d12[6] : 
                    ( pn6_deskew == 10'hd ) ? pn_d13[6] : 
                    ( pn6_deskew == 10'he ) ? pn_d14[6] : 
                    ( pn6_deskew == 10'hf ) ? pn_d15[6] : 
                    ( pn6_deskew == 10'h10 ) ? pn_d16[6] : 
                    ( pn6_deskew == 10'h11 ) ? pn_d17[6] : 
                    ( pn6_deskew == 10'h12 ) ? pn_d18[6] : 
                    ( pn6_deskew == 10'h13 ) ? pn_d19[6] : 
                    ( pn6_deskew == 10'h14 ) ? pn_d20[6] : 
                    ( pn6_deskew == 10'h15 ) ? pn_d21[6] : 
                    ( pn6_deskew == 10'h16 ) ? pn_d22[6] : 
                    ( pn6_deskew == 10'h17 ) ? pn_d23[6] : 
                    ( pn6_deskew == 10'h18 ) ? pn_d24[6] : 
                    ( pn6_deskew == 10'h19 ) ? pn_d25[6] : 
                    ( pn6_deskew == 10'h1a ) ? pn_d26[6] : 
                    ( pn6_deskew == 10'h1b ) ? pn_d27[6] : 
                    ( pn6_deskew == 10'h1c ) ? pn_d28[6] : 
                    ( pn6_deskew == 10'h1d ) ? pn_d29[6] : 
                    ( pn6_deskew == 10'h1e ) ? pn_d30[6] : 
                    ( pn6_deskew == 10'h1f ) ? pn_d31[6] : 
                    ( pn6_deskew == 10'h20 ) ? pn_d32[6] : 
                    ( pn6_deskew == 10'h21 ) ? pn_d33[6] : 
                    ( pn6_deskew == 10'h22 ) ? pn_d34[6] : 
                    ( pn6_deskew == 10'h23 ) ? pn_d35[6] : 
                    ( pn6_deskew == 10'h24 ) ? pn_d36[6] : 
                    ( pn6_deskew == 10'h25 ) ? pn_d37[6] : 
                    ( pn6_deskew == 10'h26 ) ? pn_d38[6] : 
                    ( pn6_deskew == 10'h27 ) ? pn_d39[6] : 
                    ( pn6_deskew == 10'h28 ) ? pn_d40[6] : 
                    ( pn6_deskew == 10'h29 ) ? pn_d41[6] : 
                    ( pn6_deskew == 10'h2a ) ? pn_d42[6] : 
                    ( pn6_deskew == 10'h2b ) ? pn_d43[6] : 
                    ( pn6_deskew == 10'h2c ) ? pn_d44[6] : 
                    ( pn6_deskew == 10'h2d ) ? pn_d45[6] : 
                    ( pn6_deskew == 10'h2e ) ? pn_d46[6] : 
                    ( pn6_deskew == 10'h2f ) ? pn_d47[6] : 
                    ( pn6_deskew == 10'h30 ) ? pn_d48[6] : 
                    ( pn6_deskew == 10'h31 ) ? pn_d49[6] : 
                    ( pn6_deskew == 10'h32 ) ? pn_d50[6] : 
                    ( pn6_deskew == 10'h33 ) ? pn_d51[6] : 
                    ( pn6_deskew == 10'h34 ) ? pn_d52[6] : 
                    ( pn6_deskew == 10'h35 ) ? pn_d53[6] : 
                    ( pn6_deskew == 10'h36 ) ? pn_d54[6] : 
                    ( pn6_deskew == 10'h37 ) ? pn_d55[6] : 
                    ( pn6_deskew == 10'h38 ) ? pn_d56[6] : 
                    ( pn6_deskew == 10'h39 ) ? pn_d57[6] : 
                    ( pn6_deskew == 10'h3a ) ? pn_d58[6] : 
                    ( pn6_deskew == 10'h3b ) ? pn_d59[6] : 
                    ( pn6_deskew == 10'h3c ) ? pn_d60[6] : 
                    ( pn6_deskew == 10'h3d ) ? pn_d61[6] : 
                    ( pn6_deskew == 10'h3e ) ? pn_d62[6] : 
                    ( pn6_deskew == 10'h3f ) ? pn_d63[6] : 
                    ( pn6_deskew == 10'h40 ) ? pn_d64[6] : 
                    ( pn6_deskew == 10'h41 ) ? pn_d65[6] : 
                    ( pn6_deskew == 10'h42 ) ? pn_d66[6] : 
                    ( pn6_deskew == 10'h43 ) ? pn_d67[6] : 
                    ( pn6_deskew == 10'h44 ) ? pn_d68[6] : 
                    ( pn6_deskew == 10'h45 ) ? pn_d69[6] : 
                    ( pn6_deskew == 10'h46 ) ? pn_d70[6] : 
                    ( pn6_deskew == 10'h47 ) ? pn_d71[6] : 
                    ( pn6_deskew == 10'h48 ) ? pn_d72[6] : 
                    ( pn6_deskew == 10'h49 ) ? pn_d73[6] : 
                    ( pn6_deskew == 10'h4a ) ? pn_d74[6] : 
                    ( pn6_deskew == 10'h4b ) ? pn_d75[6] : 
                    ( pn6_deskew == 10'h4c ) ? pn_d76[6] : 
                    ( pn6_deskew == 10'h4d ) ? pn_d77[6] : 
                    ( pn6_deskew == 10'h4e ) ? pn_d78[6] : 
                    ( pn6_deskew == 10'h4f ) ? pn_d79[6] : 
                    ( pn6_deskew == 10'h50 ) ? pn_d80[6] : 
                    ( pn6_deskew == 10'h51 ) ? pn_d81[6] : 
                    ( pn6_deskew == 10'h52 ) ? pn_d82[6] : 
                    ( pn6_deskew == 10'h53 ) ? pn_d83[6] : 
                    ( pn6_deskew == 10'h54 ) ? pn_d84[6] : 
                    ( pn6_deskew == 10'h55 ) ? pn_d85[6] : 
                    ( pn6_deskew == 10'h56 ) ? pn_d86[6] : 
                    ( pn6_deskew == 10'h57 ) ? pn_d87[6] : 
                    ( pn6_deskew == 10'h58 ) ? pn_d88[6] : 
                    ( pn6_deskew == 10'h59 ) ? pn_d89[6] : 
                    ( pn6_deskew == 10'h5a ) ? pn_d90[6] : 
                    ( pn6_deskew == 10'h5b ) ? pn_d91[6] : 
                    ( pn6_deskew == 10'h5c ) ? pn_d92[6] : 
                    ( pn6_deskew == 10'h5d ) ? pn_d93[6] : 
                    ( pn6_deskew == 10'h5e ) ? pn_d94[6] : 
                    ( pn6_deskew == 10'h5f ) ? pn_d95[6] : 
                    ( pn6_deskew == 10'h60 ) ? pn_d96[6] : 
                    ( pn6_deskew == 10'h61 ) ? pn_d97[6] : 
                    ( pn6_deskew == 10'h62 ) ? pn_d98[6] : 
                    ( pn6_deskew == 10'h63 ) ? pn_d99[6] : 
                    ( pn6_deskew == 10'h64 ) ? pn_d100[6] : 
                    ( pn6_deskew == 10'h65 ) ? pn_d101[6] : 
                    ( pn6_deskew == 10'h66 ) ? pn_d102[6] : 
                    ( pn6_deskew == 10'h67 ) ? pn_d103[6] : 
                    ( pn6_deskew == 10'h68 ) ? pn_d104[6] : 
                    ( pn6_deskew == 10'h69 ) ? pn_d105[6] : 
                    ( pn6_deskew == 10'h6a ) ? pn_d106[6] : 
                    ( pn6_deskew == 10'h6b ) ? pn_d107[6] : 
                    ( pn6_deskew == 10'h6c ) ? pn_d108[6] : 
                    ( pn6_deskew == 10'h6d ) ? pn_d109[6] : 
                    ( pn6_deskew == 10'h6e ) ? pn_d110[6] : 
                    ( pn6_deskew == 10'h6f ) ? pn_d111[6] : 
                    ( pn6_deskew == 10'h70 ) ? pn_d112[6] : 
                    ( pn6_deskew == 10'h71 ) ? pn_d113[6] : 
                    ( pn6_deskew == 10'h72 ) ? pn_d114[6] : 
                    ( pn6_deskew == 10'h73 ) ? pn_d115[6] : 
                    ( pn6_deskew == 10'h74 ) ? pn_d116[6] : 
                    ( pn6_deskew == 10'h75 ) ? pn_d117[6] : 
                    ( pn6_deskew == 10'h76 ) ? pn_d118[6] : 
                    ( pn6_deskew == 10'h77 ) ? pn_d119[6] : 
                    ( pn6_deskew == 10'h78 ) ? pn_d120[6] : 
                    ( pn6_deskew == 10'h79 ) ? pn_d121[6] : 
                    ( pn6_deskew == 10'h7a ) ? pn_d122[6] : 
                    ( pn6_deskew == 10'h7b ) ? pn_d123[6] : 
                    ( pn6_deskew == 10'h7c ) ? pn_d124[6] : 
                    ( pn6_deskew == 10'h7d ) ? pn_d125[6] : 
                    ( pn6_deskew == 10'h7e ) ? pn_d126[6] : 
                    ( pn6_deskew == 10'h7f ) ? pn_d127[6] : 
                    ( pn6_deskew == 10'h80 ) ? pn_d128[6] : 
                    ( pn6_deskew == 10'h81 ) ? pn_d129[6] : 
                    ( pn6_deskew == 10'h82 ) ? pn_d130[6] : 
                    ( pn6_deskew == 10'h83 ) ? pn_d131[6] : 
                    ( pn6_deskew == 10'h84 ) ? pn_d132[6] : 
                    ( pn6_deskew == 10'h85 ) ? pn_d133[6] : 
                    ( pn6_deskew == 10'h86 ) ? pn_d134[6] : 
                    ( pn6_deskew == 10'h87 ) ? pn_d135[6] : 
                    ( pn6_deskew == 10'h88 ) ? pn_d136[6] : 
                    ( pn6_deskew == 10'h89 ) ? pn_d137[6] : 
                    ( pn6_deskew == 10'h8a ) ? pn_d138[6] : 
                    ( pn6_deskew == 10'h8b ) ? pn_d139[6] : 
                    ( pn6_deskew == 10'h8c ) ? pn_d140[6] : 
                    ( pn6_deskew == 10'h8d ) ? pn_d141[6] : 
                    ( pn6_deskew == 10'h8e ) ? pn_d142[6] : 
                    ( pn6_deskew == 10'h8f ) ? pn_d143[6] : 
                    ( pn6_deskew == 10'h90 ) ? pn_d144[6] : 
                    ( pn6_deskew == 10'h91 ) ? pn_d145[6] : pn_in[6]; 
assign pn_out[7] = ( pn7_deskew == 10'h0 ) ? pn_in[7] : 
                    ( pn7_deskew == 10'h1 ) ? pn_d1[7] : 
                    ( pn7_deskew == 10'h2 ) ? pn_d2[7] : 
                    ( pn7_deskew == 10'h3 ) ? pn_d3[7] : 
                    ( pn7_deskew == 10'h4 ) ? pn_d4[7] : 
                    ( pn7_deskew == 10'h5 ) ? pn_d5[7] : 
                    ( pn7_deskew == 10'h6 ) ? pn_d6[7] : 
                    ( pn7_deskew == 10'h7 ) ? pn_d7[7] : 
                    ( pn7_deskew == 10'h8 ) ? pn_d8[7] : 
                    ( pn7_deskew == 10'h9 ) ? pn_d9[7] : 
                    ( pn7_deskew == 10'ha ) ? pn_d10[7] : 
                    ( pn7_deskew == 10'hb ) ? pn_d11[7] : 
                    ( pn7_deskew == 10'hc ) ? pn_d12[7] : 
                    ( pn7_deskew == 10'hd ) ? pn_d13[7] : 
                    ( pn7_deskew == 10'he ) ? pn_d14[7] : 
                    ( pn7_deskew == 10'hf ) ? pn_d15[7] : 
                    ( pn7_deskew == 10'h10 ) ? pn_d16[7] : 
                    ( pn7_deskew == 10'h11 ) ? pn_d17[7] : 
                    ( pn7_deskew == 10'h12 ) ? pn_d18[7] : 
                    ( pn7_deskew == 10'h13 ) ? pn_d19[7] : 
                    ( pn7_deskew == 10'h14 ) ? pn_d20[7] : 
                    ( pn7_deskew == 10'h15 ) ? pn_d21[7] : 
                    ( pn7_deskew == 10'h16 ) ? pn_d22[7] : 
                    ( pn7_deskew == 10'h17 ) ? pn_d23[7] : 
                    ( pn7_deskew == 10'h18 ) ? pn_d24[7] : 
                    ( pn7_deskew == 10'h19 ) ? pn_d25[7] : 
                    ( pn7_deskew == 10'h1a ) ? pn_d26[7] : 
                    ( pn7_deskew == 10'h1b ) ? pn_d27[7] : 
                    ( pn7_deskew == 10'h1c ) ? pn_d28[7] : 
                    ( pn7_deskew == 10'h1d ) ? pn_d29[7] : 
                    ( pn7_deskew == 10'h1e ) ? pn_d30[7] : 
                    ( pn7_deskew == 10'h1f ) ? pn_d31[7] : 
                    ( pn7_deskew == 10'h20 ) ? pn_d32[7] : 
                    ( pn7_deskew == 10'h21 ) ? pn_d33[7] : 
                    ( pn7_deskew == 10'h22 ) ? pn_d34[7] : 
                    ( pn7_deskew == 10'h23 ) ? pn_d35[7] : 
                    ( pn7_deskew == 10'h24 ) ? pn_d36[7] : 
                    ( pn7_deskew == 10'h25 ) ? pn_d37[7] : 
                    ( pn7_deskew == 10'h26 ) ? pn_d38[7] : 
                    ( pn7_deskew == 10'h27 ) ? pn_d39[7] : 
                    ( pn7_deskew == 10'h28 ) ? pn_d40[7] : 
                    ( pn7_deskew == 10'h29 ) ? pn_d41[7] : 
                    ( pn7_deskew == 10'h2a ) ? pn_d42[7] : 
                    ( pn7_deskew == 10'h2b ) ? pn_d43[7] : 
                    ( pn7_deskew == 10'h2c ) ? pn_d44[7] : 
                    ( pn7_deskew == 10'h2d ) ? pn_d45[7] : 
                    ( pn7_deskew == 10'h2e ) ? pn_d46[7] : 
                    ( pn7_deskew == 10'h2f ) ? pn_d47[7] : 
                    ( pn7_deskew == 10'h30 ) ? pn_d48[7] : 
                    ( pn7_deskew == 10'h31 ) ? pn_d49[7] : 
                    ( pn7_deskew == 10'h32 ) ? pn_d50[7] : 
                    ( pn7_deskew == 10'h33 ) ? pn_d51[7] : 
                    ( pn7_deskew == 10'h34 ) ? pn_d52[7] : 
                    ( pn7_deskew == 10'h35 ) ? pn_d53[7] : 
                    ( pn7_deskew == 10'h36 ) ? pn_d54[7] : 
                    ( pn7_deskew == 10'h37 ) ? pn_d55[7] : 
                    ( pn7_deskew == 10'h38 ) ? pn_d56[7] : 
                    ( pn7_deskew == 10'h39 ) ? pn_d57[7] : 
                    ( pn7_deskew == 10'h3a ) ? pn_d58[7] : 
                    ( pn7_deskew == 10'h3b ) ? pn_d59[7] : 
                    ( pn7_deskew == 10'h3c ) ? pn_d60[7] : 
                    ( pn7_deskew == 10'h3d ) ? pn_d61[7] : 
                    ( pn7_deskew == 10'h3e ) ? pn_d62[7] : 
                    ( pn7_deskew == 10'h3f ) ? pn_d63[7] : 
                    ( pn7_deskew == 10'h40 ) ? pn_d64[7] : 
                    ( pn7_deskew == 10'h41 ) ? pn_d65[7] : 
                    ( pn7_deskew == 10'h42 ) ? pn_d66[7] : 
                    ( pn7_deskew == 10'h43 ) ? pn_d67[7] : 
                    ( pn7_deskew == 10'h44 ) ? pn_d68[7] : 
                    ( pn7_deskew == 10'h45 ) ? pn_d69[7] : 
                    ( pn7_deskew == 10'h46 ) ? pn_d70[7] : 
                    ( pn7_deskew == 10'h47 ) ? pn_d71[7] : 
                    ( pn7_deskew == 10'h48 ) ? pn_d72[7] : 
                    ( pn7_deskew == 10'h49 ) ? pn_d73[7] : 
                    ( pn7_deskew == 10'h4a ) ? pn_d74[7] : 
                    ( pn7_deskew == 10'h4b ) ? pn_d75[7] : 
                    ( pn7_deskew == 10'h4c ) ? pn_d76[7] : 
                    ( pn7_deskew == 10'h4d ) ? pn_d77[7] : 
                    ( pn7_deskew == 10'h4e ) ? pn_d78[7] : 
                    ( pn7_deskew == 10'h4f ) ? pn_d79[7] : 
                    ( pn7_deskew == 10'h50 ) ? pn_d80[7] : 
                    ( pn7_deskew == 10'h51 ) ? pn_d81[7] : 
                    ( pn7_deskew == 10'h52 ) ? pn_d82[7] : 
                    ( pn7_deskew == 10'h53 ) ? pn_d83[7] : 
                    ( pn7_deskew == 10'h54 ) ? pn_d84[7] : 
                    ( pn7_deskew == 10'h55 ) ? pn_d85[7] : 
                    ( pn7_deskew == 10'h56 ) ? pn_d86[7] : 
                    ( pn7_deskew == 10'h57 ) ? pn_d87[7] : 
                    ( pn7_deskew == 10'h58 ) ? pn_d88[7] : 
                    ( pn7_deskew == 10'h59 ) ? pn_d89[7] : 
                    ( pn7_deskew == 10'h5a ) ? pn_d90[7] : 
                    ( pn7_deskew == 10'h5b ) ? pn_d91[7] : 
                    ( pn7_deskew == 10'h5c ) ? pn_d92[7] : 
                    ( pn7_deskew == 10'h5d ) ? pn_d93[7] : 
                    ( pn7_deskew == 10'h5e ) ? pn_d94[7] : 
                    ( pn7_deskew == 10'h5f ) ? pn_d95[7] : 
                    ( pn7_deskew == 10'h60 ) ? pn_d96[7] : 
                    ( pn7_deskew == 10'h61 ) ? pn_d97[7] : 
                    ( pn7_deskew == 10'h62 ) ? pn_d98[7] : 
                    ( pn7_deskew == 10'h63 ) ? pn_d99[7] : 
                    ( pn7_deskew == 10'h64 ) ? pn_d100[7] : 
                    ( pn7_deskew == 10'h65 ) ? pn_d101[7] : 
                    ( pn7_deskew == 10'h66 ) ? pn_d102[7] : 
                    ( pn7_deskew == 10'h67 ) ? pn_d103[7] : 
                    ( pn7_deskew == 10'h68 ) ? pn_d104[7] : 
                    ( pn7_deskew == 10'h69 ) ? pn_d105[7] : 
                    ( pn7_deskew == 10'h6a ) ? pn_d106[7] : 
                    ( pn7_deskew == 10'h6b ) ? pn_d107[7] : 
                    ( pn7_deskew == 10'h6c ) ? pn_d108[7] : 
                    ( pn7_deskew == 10'h6d ) ? pn_d109[7] : 
                    ( pn7_deskew == 10'h6e ) ? pn_d110[7] : 
                    ( pn7_deskew == 10'h6f ) ? pn_d111[7] : 
                    ( pn7_deskew == 10'h70 ) ? pn_d112[7] : 
                    ( pn7_deskew == 10'h71 ) ? pn_d113[7] : 
                    ( pn7_deskew == 10'h72 ) ? pn_d114[7] : 
                    ( pn7_deskew == 10'h73 ) ? pn_d115[7] : 
                    ( pn7_deskew == 10'h74 ) ? pn_d116[7] : 
                    ( pn7_deskew == 10'h75 ) ? pn_d117[7] : 
                    ( pn7_deskew == 10'h76 ) ? pn_d118[7] : 
                    ( pn7_deskew == 10'h77 ) ? pn_d119[7] : 
                    ( pn7_deskew == 10'h78 ) ? pn_d120[7] : 
                    ( pn7_deskew == 10'h79 ) ? pn_d121[7] : 
                    ( pn7_deskew == 10'h7a ) ? pn_d122[7] : 
                    ( pn7_deskew == 10'h7b ) ? pn_d123[7] : 
                    ( pn7_deskew == 10'h7c ) ? pn_d124[7] : 
                    ( pn7_deskew == 10'h7d ) ? pn_d125[7] : 
                    ( pn7_deskew == 10'h7e ) ? pn_d126[7] : 
                    ( pn7_deskew == 10'h7f ) ? pn_d127[7] : 
                    ( pn7_deskew == 10'h80 ) ? pn_d128[7] : 
                    ( pn7_deskew == 10'h81 ) ? pn_d129[7] : 
                    ( pn7_deskew == 10'h82 ) ? pn_d130[7] : 
                    ( pn7_deskew == 10'h83 ) ? pn_d131[7] : 
                    ( pn7_deskew == 10'h84 ) ? pn_d132[7] : 
                    ( pn7_deskew == 10'h85 ) ? pn_d133[7] : 
                    ( pn7_deskew == 10'h86 ) ? pn_d134[7] : 
                    ( pn7_deskew == 10'h87 ) ? pn_d135[7] : 
                    ( pn7_deskew == 10'h88 ) ? pn_d136[7] : 
                    ( pn7_deskew == 10'h89 ) ? pn_d137[7] : 
                    ( pn7_deskew == 10'h8a ) ? pn_d138[7] : 
                    ( pn7_deskew == 10'h8b ) ? pn_d139[7] : 
                    ( pn7_deskew == 10'h8c ) ? pn_d140[7] : 
                    ( pn7_deskew == 10'h8d ) ? pn_d141[7] : 
                    ( pn7_deskew == 10'h8e ) ? pn_d142[7] : 
                    ( pn7_deskew == 10'h8f ) ? pn_d143[7] : 
                    ( pn7_deskew == 10'h90 ) ? pn_d144[7] : 
                    ( pn7_deskew == 10'h91 ) ? pn_d145[7] : pn_in[7]; 
assign pn_out[8] = ( pn8_deskew == 10'h0 ) ? pn_in[8] : 
                    ( pn8_deskew == 10'h1 ) ? pn_d1[8] : 
                    ( pn8_deskew == 10'h2 ) ? pn_d2[8] : 
                    ( pn8_deskew == 10'h3 ) ? pn_d3[8] : 
                    ( pn8_deskew == 10'h4 ) ? pn_d4[8] : 
                    ( pn8_deskew == 10'h5 ) ? pn_d5[8] : 
                    ( pn8_deskew == 10'h6 ) ? pn_d6[8] : 
                    ( pn8_deskew == 10'h7 ) ? pn_d7[8] : 
                    ( pn8_deskew == 10'h8 ) ? pn_d8[8] : 
                    ( pn8_deskew == 10'h9 ) ? pn_d9[8] : 
                    ( pn8_deskew == 10'ha ) ? pn_d10[8] : 
                    ( pn8_deskew == 10'hb ) ? pn_d11[8] : 
                    ( pn8_deskew == 10'hc ) ? pn_d12[8] : 
                    ( pn8_deskew == 10'hd ) ? pn_d13[8] : 
                    ( pn8_deskew == 10'he ) ? pn_d14[8] : 
                    ( pn8_deskew == 10'hf ) ? pn_d15[8] : 
                    ( pn8_deskew == 10'h10 ) ? pn_d16[8] : 
                    ( pn8_deskew == 10'h11 ) ? pn_d17[8] : 
                    ( pn8_deskew == 10'h12 ) ? pn_d18[8] : 
                    ( pn8_deskew == 10'h13 ) ? pn_d19[8] : 
                    ( pn8_deskew == 10'h14 ) ? pn_d20[8] : 
                    ( pn8_deskew == 10'h15 ) ? pn_d21[8] : 
                    ( pn8_deskew == 10'h16 ) ? pn_d22[8] : 
                    ( pn8_deskew == 10'h17 ) ? pn_d23[8] : 
                    ( pn8_deskew == 10'h18 ) ? pn_d24[8] : 
                    ( pn8_deskew == 10'h19 ) ? pn_d25[8] : 
                    ( pn8_deskew == 10'h1a ) ? pn_d26[8] : 
                    ( pn8_deskew == 10'h1b ) ? pn_d27[8] : 
                    ( pn8_deskew == 10'h1c ) ? pn_d28[8] : 
                    ( pn8_deskew == 10'h1d ) ? pn_d29[8] : 
                    ( pn8_deskew == 10'h1e ) ? pn_d30[8] : 
                    ( pn8_deskew == 10'h1f ) ? pn_d31[8] : 
                    ( pn8_deskew == 10'h20 ) ? pn_d32[8] : 
                    ( pn8_deskew == 10'h21 ) ? pn_d33[8] : 
                    ( pn8_deskew == 10'h22 ) ? pn_d34[8] : 
                    ( pn8_deskew == 10'h23 ) ? pn_d35[8] : 
                    ( pn8_deskew == 10'h24 ) ? pn_d36[8] : 
                    ( pn8_deskew == 10'h25 ) ? pn_d37[8] : 
                    ( pn8_deskew == 10'h26 ) ? pn_d38[8] : 
                    ( pn8_deskew == 10'h27 ) ? pn_d39[8] : 
                    ( pn8_deskew == 10'h28 ) ? pn_d40[8] : 
                    ( pn8_deskew == 10'h29 ) ? pn_d41[8] : 
                    ( pn8_deskew == 10'h2a ) ? pn_d42[8] : 
                    ( pn8_deskew == 10'h2b ) ? pn_d43[8] : 
                    ( pn8_deskew == 10'h2c ) ? pn_d44[8] : 
                    ( pn8_deskew == 10'h2d ) ? pn_d45[8] : 
                    ( pn8_deskew == 10'h2e ) ? pn_d46[8] : 
                    ( pn8_deskew == 10'h2f ) ? pn_d47[8] : 
                    ( pn8_deskew == 10'h30 ) ? pn_d48[8] : 
                    ( pn8_deskew == 10'h31 ) ? pn_d49[8] : 
                    ( pn8_deskew == 10'h32 ) ? pn_d50[8] : 
                    ( pn8_deskew == 10'h33 ) ? pn_d51[8] : 
                    ( pn8_deskew == 10'h34 ) ? pn_d52[8] : 
                    ( pn8_deskew == 10'h35 ) ? pn_d53[8] : 
                    ( pn8_deskew == 10'h36 ) ? pn_d54[8] : 
                    ( pn8_deskew == 10'h37 ) ? pn_d55[8] : 
                    ( pn8_deskew == 10'h38 ) ? pn_d56[8] : 
                    ( pn8_deskew == 10'h39 ) ? pn_d57[8] : 
                    ( pn8_deskew == 10'h3a ) ? pn_d58[8] : 
                    ( pn8_deskew == 10'h3b ) ? pn_d59[8] : 
                    ( pn8_deskew == 10'h3c ) ? pn_d60[8] : 
                    ( pn8_deskew == 10'h3d ) ? pn_d61[8] : 
                    ( pn8_deskew == 10'h3e ) ? pn_d62[8] : 
                    ( pn8_deskew == 10'h3f ) ? pn_d63[8] : 
                    ( pn8_deskew == 10'h40 ) ? pn_d64[8] : 
                    ( pn8_deskew == 10'h41 ) ? pn_d65[8] : 
                    ( pn8_deskew == 10'h42 ) ? pn_d66[8] : 
                    ( pn8_deskew == 10'h43 ) ? pn_d67[8] : 
                    ( pn8_deskew == 10'h44 ) ? pn_d68[8] : 
                    ( pn8_deskew == 10'h45 ) ? pn_d69[8] : 
                    ( pn8_deskew == 10'h46 ) ? pn_d70[8] : 
                    ( pn8_deskew == 10'h47 ) ? pn_d71[8] : 
                    ( pn8_deskew == 10'h48 ) ? pn_d72[8] : 
                    ( pn8_deskew == 10'h49 ) ? pn_d73[8] : 
                    ( pn8_deskew == 10'h4a ) ? pn_d74[8] : 
                    ( pn8_deskew == 10'h4b ) ? pn_d75[8] : 
                    ( pn8_deskew == 10'h4c ) ? pn_d76[8] : 
                    ( pn8_deskew == 10'h4d ) ? pn_d77[8] : 
                    ( pn8_deskew == 10'h4e ) ? pn_d78[8] : 
                    ( pn8_deskew == 10'h4f ) ? pn_d79[8] : 
                    ( pn8_deskew == 10'h50 ) ? pn_d80[8] : 
                    ( pn8_deskew == 10'h51 ) ? pn_d81[8] : 
                    ( pn8_deskew == 10'h52 ) ? pn_d82[8] : 
                    ( pn8_deskew == 10'h53 ) ? pn_d83[8] : 
                    ( pn8_deskew == 10'h54 ) ? pn_d84[8] : 
                    ( pn8_deskew == 10'h55 ) ? pn_d85[8] : 
                    ( pn8_deskew == 10'h56 ) ? pn_d86[8] : 
                    ( pn8_deskew == 10'h57 ) ? pn_d87[8] : 
                    ( pn8_deskew == 10'h58 ) ? pn_d88[8] : 
                    ( pn8_deskew == 10'h59 ) ? pn_d89[8] : 
                    ( pn8_deskew == 10'h5a ) ? pn_d90[8] : 
                    ( pn8_deskew == 10'h5b ) ? pn_d91[8] : 
                    ( pn8_deskew == 10'h5c ) ? pn_d92[8] : 
                    ( pn8_deskew == 10'h5d ) ? pn_d93[8] : 
                    ( pn8_deskew == 10'h5e ) ? pn_d94[8] : 
                    ( pn8_deskew == 10'h5f ) ? pn_d95[8] : 
                    ( pn8_deskew == 10'h60 ) ? pn_d96[8] : 
                    ( pn8_deskew == 10'h61 ) ? pn_d97[8] : 
                    ( pn8_deskew == 10'h62 ) ? pn_d98[8] : 
                    ( pn8_deskew == 10'h63 ) ? pn_d99[8] : 
                    ( pn8_deskew == 10'h64 ) ? pn_d100[8] : 
                    ( pn8_deskew == 10'h65 ) ? pn_d101[8] : 
                    ( pn8_deskew == 10'h66 ) ? pn_d102[8] : 
                    ( pn8_deskew == 10'h67 ) ? pn_d103[8] : 
                    ( pn8_deskew == 10'h68 ) ? pn_d104[8] : 
                    ( pn8_deskew == 10'h69 ) ? pn_d105[8] : 
                    ( pn8_deskew == 10'h6a ) ? pn_d106[8] : 
                    ( pn8_deskew == 10'h6b ) ? pn_d107[8] : 
                    ( pn8_deskew == 10'h6c ) ? pn_d108[8] : 
                    ( pn8_deskew == 10'h6d ) ? pn_d109[8] : 
                    ( pn8_deskew == 10'h6e ) ? pn_d110[8] : 
                    ( pn8_deskew == 10'h6f ) ? pn_d111[8] : 
                    ( pn8_deskew == 10'h70 ) ? pn_d112[8] : 
                    ( pn8_deskew == 10'h71 ) ? pn_d113[8] : 
                    ( pn8_deskew == 10'h72 ) ? pn_d114[8] : 
                    ( pn8_deskew == 10'h73 ) ? pn_d115[8] : 
                    ( pn8_deskew == 10'h74 ) ? pn_d116[8] : 
                    ( pn8_deskew == 10'h75 ) ? pn_d117[8] : 
                    ( pn8_deskew == 10'h76 ) ? pn_d118[8] : 
                    ( pn8_deskew == 10'h77 ) ? pn_d119[8] : 
                    ( pn8_deskew == 10'h78 ) ? pn_d120[8] : 
                    ( pn8_deskew == 10'h79 ) ? pn_d121[8] : 
                    ( pn8_deskew == 10'h7a ) ? pn_d122[8] : 
                    ( pn8_deskew == 10'h7b ) ? pn_d123[8] : 
                    ( pn8_deskew == 10'h7c ) ? pn_d124[8] : 
                    ( pn8_deskew == 10'h7d ) ? pn_d125[8] : 
                    ( pn8_deskew == 10'h7e ) ? pn_d126[8] : 
                    ( pn8_deskew == 10'h7f ) ? pn_d127[8] : 
                    ( pn8_deskew == 10'h80 ) ? pn_d128[8] : 
                    ( pn8_deskew == 10'h81 ) ? pn_d129[8] : 
                    ( pn8_deskew == 10'h82 ) ? pn_d130[8] : 
                    ( pn8_deskew == 10'h83 ) ? pn_d131[8] : 
                    ( pn8_deskew == 10'h84 ) ? pn_d132[8] : 
                    ( pn8_deskew == 10'h85 ) ? pn_d133[8] : 
                    ( pn8_deskew == 10'h86 ) ? pn_d134[8] : 
                    ( pn8_deskew == 10'h87 ) ? pn_d135[8] : 
                    ( pn8_deskew == 10'h88 ) ? pn_d136[8] : 
                    ( pn8_deskew == 10'h89 ) ? pn_d137[8] : 
                    ( pn8_deskew == 10'h8a ) ? pn_d138[8] : 
                    ( pn8_deskew == 10'h8b ) ? pn_d139[8] : 
                    ( pn8_deskew == 10'h8c ) ? pn_d140[8] : 
                    ( pn8_deskew == 10'h8d ) ? pn_d141[8] : 
                    ( pn8_deskew == 10'h8e ) ? pn_d142[8] : 
                    ( pn8_deskew == 10'h8f ) ? pn_d143[8] : 
                    ( pn8_deskew == 10'h90 ) ? pn_d144[8] : 
                    ( pn8_deskew == 10'h91 ) ? pn_d145[8] : pn_in[8]; 
assign pn_out[9] = ( pn9_deskew == 10'h0 ) ? pn_in[9] : 
                    ( pn9_deskew == 10'h1 ) ? pn_d1[9] : 
                    ( pn9_deskew == 10'h2 ) ? pn_d2[9] : 
                    ( pn9_deskew == 10'h3 ) ? pn_d3[9] : 
                    ( pn9_deskew == 10'h4 ) ? pn_d4[9] : 
                    ( pn9_deskew == 10'h5 ) ? pn_d5[9] : 
                    ( pn9_deskew == 10'h6 ) ? pn_d6[9] : 
                    ( pn9_deskew == 10'h7 ) ? pn_d7[9] : 
                    ( pn9_deskew == 10'h8 ) ? pn_d8[9] : 
                    ( pn9_deskew == 10'h9 ) ? pn_d9[9] : 
                    ( pn9_deskew == 10'ha ) ? pn_d10[9] : 
                    ( pn9_deskew == 10'hb ) ? pn_d11[9] : 
                    ( pn9_deskew == 10'hc ) ? pn_d12[9] : 
                    ( pn9_deskew == 10'hd ) ? pn_d13[9] : 
                    ( pn9_deskew == 10'he ) ? pn_d14[9] : 
                    ( pn9_deskew == 10'hf ) ? pn_d15[9] : 
                    ( pn9_deskew == 10'h10 ) ? pn_d16[9] : 
                    ( pn9_deskew == 10'h11 ) ? pn_d17[9] : 
                    ( pn9_deskew == 10'h12 ) ? pn_d18[9] : 
                    ( pn9_deskew == 10'h13 ) ? pn_d19[9] : 
                    ( pn9_deskew == 10'h14 ) ? pn_d20[9] : 
                    ( pn9_deskew == 10'h15 ) ? pn_d21[9] : 
                    ( pn9_deskew == 10'h16 ) ? pn_d22[9] : 
                    ( pn9_deskew == 10'h17 ) ? pn_d23[9] : 
                    ( pn9_deskew == 10'h18 ) ? pn_d24[9] : 
                    ( pn9_deskew == 10'h19 ) ? pn_d25[9] : 
                    ( pn9_deskew == 10'h1a ) ? pn_d26[9] : 
                    ( pn9_deskew == 10'h1b ) ? pn_d27[9] : 
                    ( pn9_deskew == 10'h1c ) ? pn_d28[9] : 
                    ( pn9_deskew == 10'h1d ) ? pn_d29[9] : 
                    ( pn9_deskew == 10'h1e ) ? pn_d30[9] : 
                    ( pn9_deskew == 10'h1f ) ? pn_d31[9] : 
                    ( pn9_deskew == 10'h20 ) ? pn_d32[9] : 
                    ( pn9_deskew == 10'h21 ) ? pn_d33[9] : 
                    ( pn9_deskew == 10'h22 ) ? pn_d34[9] : 
                    ( pn9_deskew == 10'h23 ) ? pn_d35[9] : 
                    ( pn9_deskew == 10'h24 ) ? pn_d36[9] : 
                    ( pn9_deskew == 10'h25 ) ? pn_d37[9] : 
                    ( pn9_deskew == 10'h26 ) ? pn_d38[9] : 
                    ( pn9_deskew == 10'h27 ) ? pn_d39[9] : 
                    ( pn9_deskew == 10'h28 ) ? pn_d40[9] : 
                    ( pn9_deskew == 10'h29 ) ? pn_d41[9] : 
                    ( pn9_deskew == 10'h2a ) ? pn_d42[9] : 
                    ( pn9_deskew == 10'h2b ) ? pn_d43[9] : 
                    ( pn9_deskew == 10'h2c ) ? pn_d44[9] : 
                    ( pn9_deskew == 10'h2d ) ? pn_d45[9] : 
                    ( pn9_deskew == 10'h2e ) ? pn_d46[9] : 
                    ( pn9_deskew == 10'h2f ) ? pn_d47[9] : 
                    ( pn9_deskew == 10'h30 ) ? pn_d48[9] : 
                    ( pn9_deskew == 10'h31 ) ? pn_d49[9] : 
                    ( pn9_deskew == 10'h32 ) ? pn_d50[9] : 
                    ( pn9_deskew == 10'h33 ) ? pn_d51[9] : 
                    ( pn9_deskew == 10'h34 ) ? pn_d52[9] : 
                    ( pn9_deskew == 10'h35 ) ? pn_d53[9] : 
                    ( pn9_deskew == 10'h36 ) ? pn_d54[9] : 
                    ( pn9_deskew == 10'h37 ) ? pn_d55[9] : 
                    ( pn9_deskew == 10'h38 ) ? pn_d56[9] : 
                    ( pn9_deskew == 10'h39 ) ? pn_d57[9] : 
                    ( pn9_deskew == 10'h3a ) ? pn_d58[9] : 
                    ( pn9_deskew == 10'h3b ) ? pn_d59[9] : 
                    ( pn9_deskew == 10'h3c ) ? pn_d60[9] : 
                    ( pn9_deskew == 10'h3d ) ? pn_d61[9] : 
                    ( pn9_deskew == 10'h3e ) ? pn_d62[9] : 
                    ( pn9_deskew == 10'h3f ) ? pn_d63[9] : 
                    ( pn9_deskew == 10'h40 ) ? pn_d64[9] : 
                    ( pn9_deskew == 10'h41 ) ? pn_d65[9] : 
                    ( pn9_deskew == 10'h42 ) ? pn_d66[9] : 
                    ( pn9_deskew == 10'h43 ) ? pn_d67[9] : 
                    ( pn9_deskew == 10'h44 ) ? pn_d68[9] : 
                    ( pn9_deskew == 10'h45 ) ? pn_d69[9] : 
                    ( pn9_deskew == 10'h46 ) ? pn_d70[9] : 
                    ( pn9_deskew == 10'h47 ) ? pn_d71[9] : 
                    ( pn9_deskew == 10'h48 ) ? pn_d72[9] : 
                    ( pn9_deskew == 10'h49 ) ? pn_d73[9] : 
                    ( pn9_deskew == 10'h4a ) ? pn_d74[9] : 
                    ( pn9_deskew == 10'h4b ) ? pn_d75[9] : 
                    ( pn9_deskew == 10'h4c ) ? pn_d76[9] : 
                    ( pn9_deskew == 10'h4d ) ? pn_d77[9] : 
                    ( pn9_deskew == 10'h4e ) ? pn_d78[9] : 
                    ( pn9_deskew == 10'h4f ) ? pn_d79[9] : 
                    ( pn9_deskew == 10'h50 ) ? pn_d80[9] : 
                    ( pn9_deskew == 10'h51 ) ? pn_d81[9] : 
                    ( pn9_deskew == 10'h52 ) ? pn_d82[9] : 
                    ( pn9_deskew == 10'h53 ) ? pn_d83[9] : 
                    ( pn9_deskew == 10'h54 ) ? pn_d84[9] : 
                    ( pn9_deskew == 10'h55 ) ? pn_d85[9] : 
                    ( pn9_deskew == 10'h56 ) ? pn_d86[9] : 
                    ( pn9_deskew == 10'h57 ) ? pn_d87[9] : 
                    ( pn9_deskew == 10'h58 ) ? pn_d88[9] : 
                    ( pn9_deskew == 10'h59 ) ? pn_d89[9] : 
                    ( pn9_deskew == 10'h5a ) ? pn_d90[9] : 
                    ( pn9_deskew == 10'h5b ) ? pn_d91[9] : 
                    ( pn9_deskew == 10'h5c ) ? pn_d92[9] : 
                    ( pn9_deskew == 10'h5d ) ? pn_d93[9] : 
                    ( pn9_deskew == 10'h5e ) ? pn_d94[9] : 
                    ( pn9_deskew == 10'h5f ) ? pn_d95[9] : 
                    ( pn9_deskew == 10'h60 ) ? pn_d96[9] : 
                    ( pn9_deskew == 10'h61 ) ? pn_d97[9] : 
                    ( pn9_deskew == 10'h62 ) ? pn_d98[9] : 
                    ( pn9_deskew == 10'h63 ) ? pn_d99[9] : 
                    ( pn9_deskew == 10'h64 ) ? pn_d100[9] : 
                    ( pn9_deskew == 10'h65 ) ? pn_d101[9] : 
                    ( pn9_deskew == 10'h66 ) ? pn_d102[9] : 
                    ( pn9_deskew == 10'h67 ) ? pn_d103[9] : 
                    ( pn9_deskew == 10'h68 ) ? pn_d104[9] : 
                    ( pn9_deskew == 10'h69 ) ? pn_d105[9] : 
                    ( pn9_deskew == 10'h6a ) ? pn_d106[9] : 
                    ( pn9_deskew == 10'h6b ) ? pn_d107[9] : 
                    ( pn9_deskew == 10'h6c ) ? pn_d108[9] : 
                    ( pn9_deskew == 10'h6d ) ? pn_d109[9] : 
                    ( pn9_deskew == 10'h6e ) ? pn_d110[9] : 
                    ( pn9_deskew == 10'h6f ) ? pn_d111[9] : 
                    ( pn9_deskew == 10'h70 ) ? pn_d112[9] : 
                    ( pn9_deskew == 10'h71 ) ? pn_d113[9] : 
                    ( pn9_deskew == 10'h72 ) ? pn_d114[9] : 
                    ( pn9_deskew == 10'h73 ) ? pn_d115[9] : 
                    ( pn9_deskew == 10'h74 ) ? pn_d116[9] : 
                    ( pn9_deskew == 10'h75 ) ? pn_d117[9] : 
                    ( pn9_deskew == 10'h76 ) ? pn_d118[9] : 
                    ( pn9_deskew == 10'h77 ) ? pn_d119[9] : 
                    ( pn9_deskew == 10'h78 ) ? pn_d120[9] : 
                    ( pn9_deskew == 10'h79 ) ? pn_d121[9] : 
                    ( pn9_deskew == 10'h7a ) ? pn_d122[9] : 
                    ( pn9_deskew == 10'h7b ) ? pn_d123[9] : 
                    ( pn9_deskew == 10'h7c ) ? pn_d124[9] : 
                    ( pn9_deskew == 10'h7d ) ? pn_d125[9] : 
                    ( pn9_deskew == 10'h7e ) ? pn_d126[9] : 
                    ( pn9_deskew == 10'h7f ) ? pn_d127[9] : 
                    ( pn9_deskew == 10'h80 ) ? pn_d128[9] : 
                    ( pn9_deskew == 10'h81 ) ? pn_d129[9] : 
                    ( pn9_deskew == 10'h82 ) ? pn_d130[9] : 
                    ( pn9_deskew == 10'h83 ) ? pn_d131[9] : 
                    ( pn9_deskew == 10'h84 ) ? pn_d132[9] : 
                    ( pn9_deskew == 10'h85 ) ? pn_d133[9] : 
                    ( pn9_deskew == 10'h86 ) ? pn_d134[9] : 
                    ( pn9_deskew == 10'h87 ) ? pn_d135[9] : 
                    ( pn9_deskew == 10'h88 ) ? pn_d136[9] : 
                    ( pn9_deskew == 10'h89 ) ? pn_d137[9] : 
                    ( pn9_deskew == 10'h8a ) ? pn_d138[9] : 
                    ( pn9_deskew == 10'h8b ) ? pn_d139[9] : 
                    ( pn9_deskew == 10'h8c ) ? pn_d140[9] : 
                    ( pn9_deskew == 10'h8d ) ? pn_d141[9] : 
                    ( pn9_deskew == 10'h8e ) ? pn_d142[9] : 
                    ( pn9_deskew == 10'h8f ) ? pn_d143[9] : 
                    ( pn9_deskew == 10'h90 ) ? pn_d144[9] : 
                    ( pn9_deskew == 10'h91 ) ? pn_d145[9] : pn_in[9]; 
assign pn_out[10] = ( pn10_deskew == 10'h0 ) ? pn_in[10] : 
                    ( pn10_deskew == 10'h1 ) ? pn_d1[10] : 
                    ( pn10_deskew == 10'h2 ) ? pn_d2[10] : 
                    ( pn10_deskew == 10'h3 ) ? pn_d3[10] : 
                    ( pn10_deskew == 10'h4 ) ? pn_d4[10] : 
                    ( pn10_deskew == 10'h5 ) ? pn_d5[10] : 
                    ( pn10_deskew == 10'h6 ) ? pn_d6[10] : 
                    ( pn10_deskew == 10'h7 ) ? pn_d7[10] : 
                    ( pn10_deskew == 10'h8 ) ? pn_d8[10] : 
                    ( pn10_deskew == 10'h9 ) ? pn_d9[10] : 
                    ( pn10_deskew == 10'ha ) ? pn_d10[10] : 
                    ( pn10_deskew == 10'hb ) ? pn_d11[10] : 
                    ( pn10_deskew == 10'hc ) ? pn_d12[10] : 
                    ( pn10_deskew == 10'hd ) ? pn_d13[10] : 
                    ( pn10_deskew == 10'he ) ? pn_d14[10] : 
                    ( pn10_deskew == 10'hf ) ? pn_d15[10] : 
                    ( pn10_deskew == 10'h10 ) ? pn_d16[10] : 
                    ( pn10_deskew == 10'h11 ) ? pn_d17[10] : 
                    ( pn10_deskew == 10'h12 ) ? pn_d18[10] : 
                    ( pn10_deskew == 10'h13 ) ? pn_d19[10] : 
                    ( pn10_deskew == 10'h14 ) ? pn_d20[10] : 
                    ( pn10_deskew == 10'h15 ) ? pn_d21[10] : 
                    ( pn10_deskew == 10'h16 ) ? pn_d22[10] : 
                    ( pn10_deskew == 10'h17 ) ? pn_d23[10] : 
                    ( pn10_deskew == 10'h18 ) ? pn_d24[10] : 
                    ( pn10_deskew == 10'h19 ) ? pn_d25[10] : 
                    ( pn10_deskew == 10'h1a ) ? pn_d26[10] : 
                    ( pn10_deskew == 10'h1b ) ? pn_d27[10] : 
                    ( pn10_deskew == 10'h1c ) ? pn_d28[10] : 
                    ( pn10_deskew == 10'h1d ) ? pn_d29[10] : 
                    ( pn10_deskew == 10'h1e ) ? pn_d30[10] : 
                    ( pn10_deskew == 10'h1f ) ? pn_d31[10] : 
                    ( pn10_deskew == 10'h20 ) ? pn_d32[10] : 
                    ( pn10_deskew == 10'h21 ) ? pn_d33[10] : 
                    ( pn10_deskew == 10'h22 ) ? pn_d34[10] : 
                    ( pn10_deskew == 10'h23 ) ? pn_d35[10] : 
                    ( pn10_deskew == 10'h24 ) ? pn_d36[10] : 
                    ( pn10_deskew == 10'h25 ) ? pn_d37[10] : 
                    ( pn10_deskew == 10'h26 ) ? pn_d38[10] : 
                    ( pn10_deskew == 10'h27 ) ? pn_d39[10] : 
                    ( pn10_deskew == 10'h28 ) ? pn_d40[10] : 
                    ( pn10_deskew == 10'h29 ) ? pn_d41[10] : 
                    ( pn10_deskew == 10'h2a ) ? pn_d42[10] : 
                    ( pn10_deskew == 10'h2b ) ? pn_d43[10] : 
                    ( pn10_deskew == 10'h2c ) ? pn_d44[10] : 
                    ( pn10_deskew == 10'h2d ) ? pn_d45[10] : 
                    ( pn10_deskew == 10'h2e ) ? pn_d46[10] : 
                    ( pn10_deskew == 10'h2f ) ? pn_d47[10] : 
                    ( pn10_deskew == 10'h30 ) ? pn_d48[10] : 
                    ( pn10_deskew == 10'h31 ) ? pn_d49[10] : 
                    ( pn10_deskew == 10'h32 ) ? pn_d50[10] : 
                    ( pn10_deskew == 10'h33 ) ? pn_d51[10] : 
                    ( pn10_deskew == 10'h34 ) ? pn_d52[10] : 
                    ( pn10_deskew == 10'h35 ) ? pn_d53[10] : 
                    ( pn10_deskew == 10'h36 ) ? pn_d54[10] : 
                    ( pn10_deskew == 10'h37 ) ? pn_d55[10] : 
                    ( pn10_deskew == 10'h38 ) ? pn_d56[10] : 
                    ( pn10_deskew == 10'h39 ) ? pn_d57[10] : 
                    ( pn10_deskew == 10'h3a ) ? pn_d58[10] : 
                    ( pn10_deskew == 10'h3b ) ? pn_d59[10] : 
                    ( pn10_deskew == 10'h3c ) ? pn_d60[10] : 
                    ( pn10_deskew == 10'h3d ) ? pn_d61[10] : 
                    ( pn10_deskew == 10'h3e ) ? pn_d62[10] : 
                    ( pn10_deskew == 10'h3f ) ? pn_d63[10] : 
                    ( pn10_deskew == 10'h40 ) ? pn_d64[10] : 
                    ( pn10_deskew == 10'h41 ) ? pn_d65[10] : 
                    ( pn10_deskew == 10'h42 ) ? pn_d66[10] : 
                    ( pn10_deskew == 10'h43 ) ? pn_d67[10] : 
                    ( pn10_deskew == 10'h44 ) ? pn_d68[10] : 
                    ( pn10_deskew == 10'h45 ) ? pn_d69[10] : 
                    ( pn10_deskew == 10'h46 ) ? pn_d70[10] : 
                    ( pn10_deskew == 10'h47 ) ? pn_d71[10] : 
                    ( pn10_deskew == 10'h48 ) ? pn_d72[10] : 
                    ( pn10_deskew == 10'h49 ) ? pn_d73[10] : 
                    ( pn10_deskew == 10'h4a ) ? pn_d74[10] : 
                    ( pn10_deskew == 10'h4b ) ? pn_d75[10] : 
                    ( pn10_deskew == 10'h4c ) ? pn_d76[10] : 
                    ( pn10_deskew == 10'h4d ) ? pn_d77[10] : 
                    ( pn10_deskew == 10'h4e ) ? pn_d78[10] : 
                    ( pn10_deskew == 10'h4f ) ? pn_d79[10] : 
                    ( pn10_deskew == 10'h50 ) ? pn_d80[10] : 
                    ( pn10_deskew == 10'h51 ) ? pn_d81[10] : 
                    ( pn10_deskew == 10'h52 ) ? pn_d82[10] : 
                    ( pn10_deskew == 10'h53 ) ? pn_d83[10] : 
                    ( pn10_deskew == 10'h54 ) ? pn_d84[10] : 
                    ( pn10_deskew == 10'h55 ) ? pn_d85[10] : 
                    ( pn10_deskew == 10'h56 ) ? pn_d86[10] : 
                    ( pn10_deskew == 10'h57 ) ? pn_d87[10] : 
                    ( pn10_deskew == 10'h58 ) ? pn_d88[10] : 
                    ( pn10_deskew == 10'h59 ) ? pn_d89[10] : 
                    ( pn10_deskew == 10'h5a ) ? pn_d90[10] : 
                    ( pn10_deskew == 10'h5b ) ? pn_d91[10] : 
                    ( pn10_deskew == 10'h5c ) ? pn_d92[10] : 
                    ( pn10_deskew == 10'h5d ) ? pn_d93[10] : 
                    ( pn10_deskew == 10'h5e ) ? pn_d94[10] : 
                    ( pn10_deskew == 10'h5f ) ? pn_d95[10] : 
                    ( pn10_deskew == 10'h60 ) ? pn_d96[10] : 
                    ( pn10_deskew == 10'h61 ) ? pn_d97[10] : 
                    ( pn10_deskew == 10'h62 ) ? pn_d98[10] : 
                    ( pn10_deskew == 10'h63 ) ? pn_d99[10] : 
                    ( pn10_deskew == 10'h64 ) ? pn_d100[10] : 
                    ( pn10_deskew == 10'h65 ) ? pn_d101[10] : 
                    ( pn10_deskew == 10'h66 ) ? pn_d102[10] : 
                    ( pn10_deskew == 10'h67 ) ? pn_d103[10] : 
                    ( pn10_deskew == 10'h68 ) ? pn_d104[10] : 
                    ( pn10_deskew == 10'h69 ) ? pn_d105[10] : 
                    ( pn10_deskew == 10'h6a ) ? pn_d106[10] : 
                    ( pn10_deskew == 10'h6b ) ? pn_d107[10] : 
                    ( pn10_deskew == 10'h6c ) ? pn_d108[10] : 
                    ( pn10_deskew == 10'h6d ) ? pn_d109[10] : 
                    ( pn10_deskew == 10'h6e ) ? pn_d110[10] : 
                    ( pn10_deskew == 10'h6f ) ? pn_d111[10] : 
                    ( pn10_deskew == 10'h70 ) ? pn_d112[10] : 
                    ( pn10_deskew == 10'h71 ) ? pn_d113[10] : 
                    ( pn10_deskew == 10'h72 ) ? pn_d114[10] : 
                    ( pn10_deskew == 10'h73 ) ? pn_d115[10] : 
                    ( pn10_deskew == 10'h74 ) ? pn_d116[10] : 
                    ( pn10_deskew == 10'h75 ) ? pn_d117[10] : 
                    ( pn10_deskew == 10'h76 ) ? pn_d118[10] : 
                    ( pn10_deskew == 10'h77 ) ? pn_d119[10] : 
                    ( pn10_deskew == 10'h78 ) ? pn_d120[10] : 
                    ( pn10_deskew == 10'h79 ) ? pn_d121[10] : 
                    ( pn10_deskew == 10'h7a ) ? pn_d122[10] : 
                    ( pn10_deskew == 10'h7b ) ? pn_d123[10] : 
                    ( pn10_deskew == 10'h7c ) ? pn_d124[10] : 
                    ( pn10_deskew == 10'h7d ) ? pn_d125[10] : 
                    ( pn10_deskew == 10'h7e ) ? pn_d126[10] : 
                    ( pn10_deskew == 10'h7f ) ? pn_d127[10] : 
                    ( pn10_deskew == 10'h80 ) ? pn_d128[10] : 
                    ( pn10_deskew == 10'h81 ) ? pn_d129[10] : 
                    ( pn10_deskew == 10'h82 ) ? pn_d130[10] : 
                    ( pn10_deskew == 10'h83 ) ? pn_d131[10] : 
                    ( pn10_deskew == 10'h84 ) ? pn_d132[10] : 
                    ( pn10_deskew == 10'h85 ) ? pn_d133[10] : 
                    ( pn10_deskew == 10'h86 ) ? pn_d134[10] : 
                    ( pn10_deskew == 10'h87 ) ? pn_d135[10] : 
                    ( pn10_deskew == 10'h88 ) ? pn_d136[10] : 
                    ( pn10_deskew == 10'h89 ) ? pn_d137[10] : 
                    ( pn10_deskew == 10'h8a ) ? pn_d138[10] : 
                    ( pn10_deskew == 10'h8b ) ? pn_d139[10] : 
                    ( pn10_deskew == 10'h8c ) ? pn_d140[10] : 
                    ( pn10_deskew == 10'h8d ) ? pn_d141[10] : 
                    ( pn10_deskew == 10'h8e ) ? pn_d142[10] : 
                    ( pn10_deskew == 10'h8f ) ? pn_d143[10] : 
                    ( pn10_deskew == 10'h90 ) ? pn_d144[10] : 
                    ( pn10_deskew == 10'h91 ) ? pn_d145[10] : pn_in[10]; 
assign pn_out[11] = ( pn11_deskew == 10'h0 ) ? pn_in[11] : 
                    ( pn11_deskew == 10'h1 ) ? pn_d1[11] : 
                    ( pn11_deskew == 10'h2 ) ? pn_d2[11] : 
                    ( pn11_deskew == 10'h3 ) ? pn_d3[11] : 
                    ( pn11_deskew == 10'h4 ) ? pn_d4[11] : 
                    ( pn11_deskew == 10'h5 ) ? pn_d5[11] : 
                    ( pn11_deskew == 10'h6 ) ? pn_d6[11] : 
                    ( pn11_deskew == 10'h7 ) ? pn_d7[11] : 
                    ( pn11_deskew == 10'h8 ) ? pn_d8[11] : 
                    ( pn11_deskew == 10'h9 ) ? pn_d9[11] : 
                    ( pn11_deskew == 10'ha ) ? pn_d10[11] : 
                    ( pn11_deskew == 10'hb ) ? pn_d11[11] : 
                    ( pn11_deskew == 10'hc ) ? pn_d12[11] : 
                    ( pn11_deskew == 10'hd ) ? pn_d13[11] : 
                    ( pn11_deskew == 10'he ) ? pn_d14[11] : 
                    ( pn11_deskew == 10'hf ) ? pn_d15[11] : 
                    ( pn11_deskew == 10'h10 ) ? pn_d16[11] : 
                    ( pn11_deskew == 10'h11 ) ? pn_d17[11] : 
                    ( pn11_deskew == 10'h12 ) ? pn_d18[11] : 
                    ( pn11_deskew == 10'h13 ) ? pn_d19[11] : 
                    ( pn11_deskew == 10'h14 ) ? pn_d20[11] : 
                    ( pn11_deskew == 10'h15 ) ? pn_d21[11] : 
                    ( pn11_deskew == 10'h16 ) ? pn_d22[11] : 
                    ( pn11_deskew == 10'h17 ) ? pn_d23[11] : 
                    ( pn11_deskew == 10'h18 ) ? pn_d24[11] : 
                    ( pn11_deskew == 10'h19 ) ? pn_d25[11] : 
                    ( pn11_deskew == 10'h1a ) ? pn_d26[11] : 
                    ( pn11_deskew == 10'h1b ) ? pn_d27[11] : 
                    ( pn11_deskew == 10'h1c ) ? pn_d28[11] : 
                    ( pn11_deskew == 10'h1d ) ? pn_d29[11] : 
                    ( pn11_deskew == 10'h1e ) ? pn_d30[11] : 
                    ( pn11_deskew == 10'h1f ) ? pn_d31[11] : 
                    ( pn11_deskew == 10'h20 ) ? pn_d32[11] : 
                    ( pn11_deskew == 10'h21 ) ? pn_d33[11] : 
                    ( pn11_deskew == 10'h22 ) ? pn_d34[11] : 
                    ( pn11_deskew == 10'h23 ) ? pn_d35[11] : 
                    ( pn11_deskew == 10'h24 ) ? pn_d36[11] : 
                    ( pn11_deskew == 10'h25 ) ? pn_d37[11] : 
                    ( pn11_deskew == 10'h26 ) ? pn_d38[11] : 
                    ( pn11_deskew == 10'h27 ) ? pn_d39[11] : 
                    ( pn11_deskew == 10'h28 ) ? pn_d40[11] : 
                    ( pn11_deskew == 10'h29 ) ? pn_d41[11] : 
                    ( pn11_deskew == 10'h2a ) ? pn_d42[11] : 
                    ( pn11_deskew == 10'h2b ) ? pn_d43[11] : 
                    ( pn11_deskew == 10'h2c ) ? pn_d44[11] : 
                    ( pn11_deskew == 10'h2d ) ? pn_d45[11] : 
                    ( pn11_deskew == 10'h2e ) ? pn_d46[11] : 
                    ( pn11_deskew == 10'h2f ) ? pn_d47[11] : 
                    ( pn11_deskew == 10'h30 ) ? pn_d48[11] : 
                    ( pn11_deskew == 10'h31 ) ? pn_d49[11] : 
                    ( pn11_deskew == 10'h32 ) ? pn_d50[11] : 
                    ( pn11_deskew == 10'h33 ) ? pn_d51[11] : 
                    ( pn11_deskew == 10'h34 ) ? pn_d52[11] : 
                    ( pn11_deskew == 10'h35 ) ? pn_d53[11] : 
                    ( pn11_deskew == 10'h36 ) ? pn_d54[11] : 
                    ( pn11_deskew == 10'h37 ) ? pn_d55[11] : 
                    ( pn11_deskew == 10'h38 ) ? pn_d56[11] : 
                    ( pn11_deskew == 10'h39 ) ? pn_d57[11] : 
                    ( pn11_deskew == 10'h3a ) ? pn_d58[11] : 
                    ( pn11_deskew == 10'h3b ) ? pn_d59[11] : 
                    ( pn11_deskew == 10'h3c ) ? pn_d60[11] : 
                    ( pn11_deskew == 10'h3d ) ? pn_d61[11] : 
                    ( pn11_deskew == 10'h3e ) ? pn_d62[11] : 
                    ( pn11_deskew == 10'h3f ) ? pn_d63[11] : 
                    ( pn11_deskew == 10'h40 ) ? pn_d64[11] : 
                    ( pn11_deskew == 10'h41 ) ? pn_d65[11] : 
                    ( pn11_deskew == 10'h42 ) ? pn_d66[11] : 
                    ( pn11_deskew == 10'h43 ) ? pn_d67[11] : 
                    ( pn11_deskew == 10'h44 ) ? pn_d68[11] : 
                    ( pn11_deskew == 10'h45 ) ? pn_d69[11] : 
                    ( pn11_deskew == 10'h46 ) ? pn_d70[11] : 
                    ( pn11_deskew == 10'h47 ) ? pn_d71[11] : 
                    ( pn11_deskew == 10'h48 ) ? pn_d72[11] : 
                    ( pn11_deskew == 10'h49 ) ? pn_d73[11] : 
                    ( pn11_deskew == 10'h4a ) ? pn_d74[11] : 
                    ( pn11_deskew == 10'h4b ) ? pn_d75[11] : 
                    ( pn11_deskew == 10'h4c ) ? pn_d76[11] : 
                    ( pn11_deskew == 10'h4d ) ? pn_d77[11] : 
                    ( pn11_deskew == 10'h4e ) ? pn_d78[11] : 
                    ( pn11_deskew == 10'h4f ) ? pn_d79[11] : 
                    ( pn11_deskew == 10'h50 ) ? pn_d80[11] : 
                    ( pn11_deskew == 10'h51 ) ? pn_d81[11] : 
                    ( pn11_deskew == 10'h52 ) ? pn_d82[11] : 
                    ( pn11_deskew == 10'h53 ) ? pn_d83[11] : 
                    ( pn11_deskew == 10'h54 ) ? pn_d84[11] : 
                    ( pn11_deskew == 10'h55 ) ? pn_d85[11] : 
                    ( pn11_deskew == 10'h56 ) ? pn_d86[11] : 
                    ( pn11_deskew == 10'h57 ) ? pn_d87[11] : 
                    ( pn11_deskew == 10'h58 ) ? pn_d88[11] : 
                    ( pn11_deskew == 10'h59 ) ? pn_d89[11] : 
                    ( pn11_deskew == 10'h5a ) ? pn_d90[11] : 
                    ( pn11_deskew == 10'h5b ) ? pn_d91[11] : 
                    ( pn11_deskew == 10'h5c ) ? pn_d92[11] : 
                    ( pn11_deskew == 10'h5d ) ? pn_d93[11] : 
                    ( pn11_deskew == 10'h5e ) ? pn_d94[11] : 
                    ( pn11_deskew == 10'h5f ) ? pn_d95[11] : 
                    ( pn11_deskew == 10'h60 ) ? pn_d96[11] : 
                    ( pn11_deskew == 10'h61 ) ? pn_d97[11] : 
                    ( pn11_deskew == 10'h62 ) ? pn_d98[11] : 
                    ( pn11_deskew == 10'h63 ) ? pn_d99[11] : 
                    ( pn11_deskew == 10'h64 ) ? pn_d100[11] : 
                    ( pn11_deskew == 10'h65 ) ? pn_d101[11] : 
                    ( pn11_deskew == 10'h66 ) ? pn_d102[11] : 
                    ( pn11_deskew == 10'h67 ) ? pn_d103[11] : 
                    ( pn11_deskew == 10'h68 ) ? pn_d104[11] : 
                    ( pn11_deskew == 10'h69 ) ? pn_d105[11] : 
                    ( pn11_deskew == 10'h6a ) ? pn_d106[11] : 
                    ( pn11_deskew == 10'h6b ) ? pn_d107[11] : 
                    ( pn11_deskew == 10'h6c ) ? pn_d108[11] : 
                    ( pn11_deskew == 10'h6d ) ? pn_d109[11] : 
                    ( pn11_deskew == 10'h6e ) ? pn_d110[11] : 
                    ( pn11_deskew == 10'h6f ) ? pn_d111[11] : 
                    ( pn11_deskew == 10'h70 ) ? pn_d112[11] : 
                    ( pn11_deskew == 10'h71 ) ? pn_d113[11] : 
                    ( pn11_deskew == 10'h72 ) ? pn_d114[11] : 
                    ( pn11_deskew == 10'h73 ) ? pn_d115[11] : 
                    ( pn11_deskew == 10'h74 ) ? pn_d116[11] : 
                    ( pn11_deskew == 10'h75 ) ? pn_d117[11] : 
                    ( pn11_deskew == 10'h76 ) ? pn_d118[11] : 
                    ( pn11_deskew == 10'h77 ) ? pn_d119[11] : 
                    ( pn11_deskew == 10'h78 ) ? pn_d120[11] : 
                    ( pn11_deskew == 10'h79 ) ? pn_d121[11] : 
                    ( pn11_deskew == 10'h7a ) ? pn_d122[11] : 
                    ( pn11_deskew == 10'h7b ) ? pn_d123[11] : 
                    ( pn11_deskew == 10'h7c ) ? pn_d124[11] : 
                    ( pn11_deskew == 10'h7d ) ? pn_d125[11] : 
                    ( pn11_deskew == 10'h7e ) ? pn_d126[11] : 
                    ( pn11_deskew == 10'h7f ) ? pn_d127[11] : 
                    ( pn11_deskew == 10'h80 ) ? pn_d128[11] : 
                    ( pn11_deskew == 10'h81 ) ? pn_d129[11] : 
                    ( pn11_deskew == 10'h82 ) ? pn_d130[11] : 
                    ( pn11_deskew == 10'h83 ) ? pn_d131[11] : 
                    ( pn11_deskew == 10'h84 ) ? pn_d132[11] : 
                    ( pn11_deskew == 10'h85 ) ? pn_d133[11] : 
                    ( pn11_deskew == 10'h86 ) ? pn_d134[11] : 
                    ( pn11_deskew == 10'h87 ) ? pn_d135[11] : 
                    ( pn11_deskew == 10'h88 ) ? pn_d136[11] : 
                    ( pn11_deskew == 10'h89 ) ? pn_d137[11] : 
                    ( pn11_deskew == 10'h8a ) ? pn_d138[11] : 
                    ( pn11_deskew == 10'h8b ) ? pn_d139[11] : 
                    ( pn11_deskew == 10'h8c ) ? pn_d140[11] : 
                    ( pn11_deskew == 10'h8d ) ? pn_d141[11] : 
                    ( pn11_deskew == 10'h8e ) ? pn_d142[11] : 
                    ( pn11_deskew == 10'h8f ) ? pn_d143[11] : 
                    ( pn11_deskew == 10'h90 ) ? pn_d144[11] : 
                    ( pn11_deskew == 10'h91 ) ? pn_d145[11] : pn_in[11]; 
assign pn_out[12] = ( pn12_deskew == 10'h0 ) ? pn_in[12] : 
                    ( pn12_deskew == 10'h1 ) ? pn_d1[12] : 
                    ( pn12_deskew == 10'h2 ) ? pn_d2[12] : 
                    ( pn12_deskew == 10'h3 ) ? pn_d3[12] : 
                    ( pn12_deskew == 10'h4 ) ? pn_d4[12] : 
                    ( pn12_deskew == 10'h5 ) ? pn_d5[12] : 
                    ( pn12_deskew == 10'h6 ) ? pn_d6[12] : 
                    ( pn12_deskew == 10'h7 ) ? pn_d7[12] : 
                    ( pn12_deskew == 10'h8 ) ? pn_d8[12] : 
                    ( pn12_deskew == 10'h9 ) ? pn_d9[12] : 
                    ( pn12_deskew == 10'ha ) ? pn_d10[12] : 
                    ( pn12_deskew == 10'hb ) ? pn_d11[12] : 
                    ( pn12_deskew == 10'hc ) ? pn_d12[12] : 
                    ( pn12_deskew == 10'hd ) ? pn_d13[12] : 
                    ( pn12_deskew == 10'he ) ? pn_d14[12] : 
                    ( pn12_deskew == 10'hf ) ? pn_d15[12] : 
                    ( pn12_deskew == 10'h10 ) ? pn_d16[12] : 
                    ( pn12_deskew == 10'h11 ) ? pn_d17[12] : 
                    ( pn12_deskew == 10'h12 ) ? pn_d18[12] : 
                    ( pn12_deskew == 10'h13 ) ? pn_d19[12] : 
                    ( pn12_deskew == 10'h14 ) ? pn_d20[12] : 
                    ( pn12_deskew == 10'h15 ) ? pn_d21[12] : 
                    ( pn12_deskew == 10'h16 ) ? pn_d22[12] : 
                    ( pn12_deskew == 10'h17 ) ? pn_d23[12] : 
                    ( pn12_deskew == 10'h18 ) ? pn_d24[12] : 
                    ( pn12_deskew == 10'h19 ) ? pn_d25[12] : 
                    ( pn12_deskew == 10'h1a ) ? pn_d26[12] : 
                    ( pn12_deskew == 10'h1b ) ? pn_d27[12] : 
                    ( pn12_deskew == 10'h1c ) ? pn_d28[12] : 
                    ( pn12_deskew == 10'h1d ) ? pn_d29[12] : 
                    ( pn12_deskew == 10'h1e ) ? pn_d30[12] : 
                    ( pn12_deskew == 10'h1f ) ? pn_d31[12] : 
                    ( pn12_deskew == 10'h20 ) ? pn_d32[12] : 
                    ( pn12_deskew == 10'h21 ) ? pn_d33[12] : 
                    ( pn12_deskew == 10'h22 ) ? pn_d34[12] : 
                    ( pn12_deskew == 10'h23 ) ? pn_d35[12] : 
                    ( pn12_deskew == 10'h24 ) ? pn_d36[12] : 
                    ( pn12_deskew == 10'h25 ) ? pn_d37[12] : 
                    ( pn12_deskew == 10'h26 ) ? pn_d38[12] : 
                    ( pn12_deskew == 10'h27 ) ? pn_d39[12] : 
                    ( pn12_deskew == 10'h28 ) ? pn_d40[12] : 
                    ( pn12_deskew == 10'h29 ) ? pn_d41[12] : 
                    ( pn12_deskew == 10'h2a ) ? pn_d42[12] : 
                    ( pn12_deskew == 10'h2b ) ? pn_d43[12] : 
                    ( pn12_deskew == 10'h2c ) ? pn_d44[12] : 
                    ( pn12_deskew == 10'h2d ) ? pn_d45[12] : 
                    ( pn12_deskew == 10'h2e ) ? pn_d46[12] : 
                    ( pn12_deskew == 10'h2f ) ? pn_d47[12] : 
                    ( pn12_deskew == 10'h30 ) ? pn_d48[12] : 
                    ( pn12_deskew == 10'h31 ) ? pn_d49[12] : 
                    ( pn12_deskew == 10'h32 ) ? pn_d50[12] : 
                    ( pn12_deskew == 10'h33 ) ? pn_d51[12] : 
                    ( pn12_deskew == 10'h34 ) ? pn_d52[12] : 
                    ( pn12_deskew == 10'h35 ) ? pn_d53[12] : 
                    ( pn12_deskew == 10'h36 ) ? pn_d54[12] : 
                    ( pn12_deskew == 10'h37 ) ? pn_d55[12] : 
                    ( pn12_deskew == 10'h38 ) ? pn_d56[12] : 
                    ( pn12_deskew == 10'h39 ) ? pn_d57[12] : 
                    ( pn12_deskew == 10'h3a ) ? pn_d58[12] : 
                    ( pn12_deskew == 10'h3b ) ? pn_d59[12] : 
                    ( pn12_deskew == 10'h3c ) ? pn_d60[12] : 
                    ( pn12_deskew == 10'h3d ) ? pn_d61[12] : 
                    ( pn12_deskew == 10'h3e ) ? pn_d62[12] : 
                    ( pn12_deskew == 10'h3f ) ? pn_d63[12] : 
                    ( pn12_deskew == 10'h40 ) ? pn_d64[12] : 
                    ( pn12_deskew == 10'h41 ) ? pn_d65[12] : 
                    ( pn12_deskew == 10'h42 ) ? pn_d66[12] : 
                    ( pn12_deskew == 10'h43 ) ? pn_d67[12] : 
                    ( pn12_deskew == 10'h44 ) ? pn_d68[12] : 
                    ( pn12_deskew == 10'h45 ) ? pn_d69[12] : 
                    ( pn12_deskew == 10'h46 ) ? pn_d70[12] : 
                    ( pn12_deskew == 10'h47 ) ? pn_d71[12] : 
                    ( pn12_deskew == 10'h48 ) ? pn_d72[12] : 
                    ( pn12_deskew == 10'h49 ) ? pn_d73[12] : 
                    ( pn12_deskew == 10'h4a ) ? pn_d74[12] : 
                    ( pn12_deskew == 10'h4b ) ? pn_d75[12] : 
                    ( pn12_deskew == 10'h4c ) ? pn_d76[12] : 
                    ( pn12_deskew == 10'h4d ) ? pn_d77[12] : 
                    ( pn12_deskew == 10'h4e ) ? pn_d78[12] : 
                    ( pn12_deskew == 10'h4f ) ? pn_d79[12] : 
                    ( pn12_deskew == 10'h50 ) ? pn_d80[12] : 
                    ( pn12_deskew == 10'h51 ) ? pn_d81[12] : 
                    ( pn12_deskew == 10'h52 ) ? pn_d82[12] : 
                    ( pn12_deskew == 10'h53 ) ? pn_d83[12] : 
                    ( pn12_deskew == 10'h54 ) ? pn_d84[12] : 
                    ( pn12_deskew == 10'h55 ) ? pn_d85[12] : 
                    ( pn12_deskew == 10'h56 ) ? pn_d86[12] : 
                    ( pn12_deskew == 10'h57 ) ? pn_d87[12] : 
                    ( pn12_deskew == 10'h58 ) ? pn_d88[12] : 
                    ( pn12_deskew == 10'h59 ) ? pn_d89[12] : 
                    ( pn12_deskew == 10'h5a ) ? pn_d90[12] : 
                    ( pn12_deskew == 10'h5b ) ? pn_d91[12] : 
                    ( pn12_deskew == 10'h5c ) ? pn_d92[12] : 
                    ( pn12_deskew == 10'h5d ) ? pn_d93[12] : 
                    ( pn12_deskew == 10'h5e ) ? pn_d94[12] : 
                    ( pn12_deskew == 10'h5f ) ? pn_d95[12] : 
                    ( pn12_deskew == 10'h60 ) ? pn_d96[12] : 
                    ( pn12_deskew == 10'h61 ) ? pn_d97[12] : 
                    ( pn12_deskew == 10'h62 ) ? pn_d98[12] : 
                    ( pn12_deskew == 10'h63 ) ? pn_d99[12] : 
                    ( pn12_deskew == 10'h64 ) ? pn_d100[12] : 
                    ( pn12_deskew == 10'h65 ) ? pn_d101[12] : 
                    ( pn12_deskew == 10'h66 ) ? pn_d102[12] : 
                    ( pn12_deskew == 10'h67 ) ? pn_d103[12] : 
                    ( pn12_deskew == 10'h68 ) ? pn_d104[12] : 
                    ( pn12_deskew == 10'h69 ) ? pn_d105[12] : 
                    ( pn12_deskew == 10'h6a ) ? pn_d106[12] : 
                    ( pn12_deskew == 10'h6b ) ? pn_d107[12] : 
                    ( pn12_deskew == 10'h6c ) ? pn_d108[12] : 
                    ( pn12_deskew == 10'h6d ) ? pn_d109[12] : 
                    ( pn12_deskew == 10'h6e ) ? pn_d110[12] : 
                    ( pn12_deskew == 10'h6f ) ? pn_d111[12] : 
                    ( pn12_deskew == 10'h70 ) ? pn_d112[12] : 
                    ( pn12_deskew == 10'h71 ) ? pn_d113[12] : 
                    ( pn12_deskew == 10'h72 ) ? pn_d114[12] : 
                    ( pn12_deskew == 10'h73 ) ? pn_d115[12] : 
                    ( pn12_deskew == 10'h74 ) ? pn_d116[12] : 
                    ( pn12_deskew == 10'h75 ) ? pn_d117[12] : 
                    ( pn12_deskew == 10'h76 ) ? pn_d118[12] : 
                    ( pn12_deskew == 10'h77 ) ? pn_d119[12] : 
                    ( pn12_deskew == 10'h78 ) ? pn_d120[12] : 
                    ( pn12_deskew == 10'h79 ) ? pn_d121[12] : 
                    ( pn12_deskew == 10'h7a ) ? pn_d122[12] : 
                    ( pn12_deskew == 10'h7b ) ? pn_d123[12] : 
                    ( pn12_deskew == 10'h7c ) ? pn_d124[12] : 
                    ( pn12_deskew == 10'h7d ) ? pn_d125[12] : 
                    ( pn12_deskew == 10'h7e ) ? pn_d126[12] : 
                    ( pn12_deskew == 10'h7f ) ? pn_d127[12] : 
                    ( pn12_deskew == 10'h80 ) ? pn_d128[12] : 
                    ( pn12_deskew == 10'h81 ) ? pn_d129[12] : 
                    ( pn12_deskew == 10'h82 ) ? pn_d130[12] : 
                    ( pn12_deskew == 10'h83 ) ? pn_d131[12] : 
                    ( pn12_deskew == 10'h84 ) ? pn_d132[12] : 
                    ( pn12_deskew == 10'h85 ) ? pn_d133[12] : 
                    ( pn12_deskew == 10'h86 ) ? pn_d134[12] : 
                    ( pn12_deskew == 10'h87 ) ? pn_d135[12] : 
                    ( pn12_deskew == 10'h88 ) ? pn_d136[12] : 
                    ( pn12_deskew == 10'h89 ) ? pn_d137[12] : 
                    ( pn12_deskew == 10'h8a ) ? pn_d138[12] : 
                    ( pn12_deskew == 10'h8b ) ? pn_d139[12] : 
                    ( pn12_deskew == 10'h8c ) ? pn_d140[12] : 
                    ( pn12_deskew == 10'h8d ) ? pn_d141[12] : 
                    ( pn12_deskew == 10'h8e ) ? pn_d142[12] : 
                    ( pn12_deskew == 10'h8f ) ? pn_d143[12] : 
                    ( pn12_deskew == 10'h90 ) ? pn_d144[12] : 
                    ( pn12_deskew == 10'h91 ) ? pn_d145[12] : pn_in[12]; 
assign pn_out[13] = ( pn13_deskew == 10'h0 ) ? pn_in[13] : 
                    ( pn13_deskew == 10'h1 ) ? pn_d1[13] : 
                    ( pn13_deskew == 10'h2 ) ? pn_d2[13] : 
                    ( pn13_deskew == 10'h3 ) ? pn_d3[13] : 
                    ( pn13_deskew == 10'h4 ) ? pn_d4[13] : 
                    ( pn13_deskew == 10'h5 ) ? pn_d5[13] : 
                    ( pn13_deskew == 10'h6 ) ? pn_d6[13] : 
                    ( pn13_deskew == 10'h7 ) ? pn_d7[13] : 
                    ( pn13_deskew == 10'h8 ) ? pn_d8[13] : 
                    ( pn13_deskew == 10'h9 ) ? pn_d9[13] : 
                    ( pn13_deskew == 10'ha ) ? pn_d10[13] : 
                    ( pn13_deskew == 10'hb ) ? pn_d11[13] : 
                    ( pn13_deskew == 10'hc ) ? pn_d12[13] : 
                    ( pn13_deskew == 10'hd ) ? pn_d13[13] : 
                    ( pn13_deskew == 10'he ) ? pn_d14[13] : 
                    ( pn13_deskew == 10'hf ) ? pn_d15[13] : 
                    ( pn13_deskew == 10'h10 ) ? pn_d16[13] : 
                    ( pn13_deskew == 10'h11 ) ? pn_d17[13] : 
                    ( pn13_deskew == 10'h12 ) ? pn_d18[13] : 
                    ( pn13_deskew == 10'h13 ) ? pn_d19[13] : 
                    ( pn13_deskew == 10'h14 ) ? pn_d20[13] : 
                    ( pn13_deskew == 10'h15 ) ? pn_d21[13] : 
                    ( pn13_deskew == 10'h16 ) ? pn_d22[13] : 
                    ( pn13_deskew == 10'h17 ) ? pn_d23[13] : 
                    ( pn13_deskew == 10'h18 ) ? pn_d24[13] : 
                    ( pn13_deskew == 10'h19 ) ? pn_d25[13] : 
                    ( pn13_deskew == 10'h1a ) ? pn_d26[13] : 
                    ( pn13_deskew == 10'h1b ) ? pn_d27[13] : 
                    ( pn13_deskew == 10'h1c ) ? pn_d28[13] : 
                    ( pn13_deskew == 10'h1d ) ? pn_d29[13] : 
                    ( pn13_deskew == 10'h1e ) ? pn_d30[13] : 
                    ( pn13_deskew == 10'h1f ) ? pn_d31[13] : 
                    ( pn13_deskew == 10'h20 ) ? pn_d32[13] : 
                    ( pn13_deskew == 10'h21 ) ? pn_d33[13] : 
                    ( pn13_deskew == 10'h22 ) ? pn_d34[13] : 
                    ( pn13_deskew == 10'h23 ) ? pn_d35[13] : 
                    ( pn13_deskew == 10'h24 ) ? pn_d36[13] : 
                    ( pn13_deskew == 10'h25 ) ? pn_d37[13] : 
                    ( pn13_deskew == 10'h26 ) ? pn_d38[13] : 
                    ( pn13_deskew == 10'h27 ) ? pn_d39[13] : 
                    ( pn13_deskew == 10'h28 ) ? pn_d40[13] : 
                    ( pn13_deskew == 10'h29 ) ? pn_d41[13] : 
                    ( pn13_deskew == 10'h2a ) ? pn_d42[13] : 
                    ( pn13_deskew == 10'h2b ) ? pn_d43[13] : 
                    ( pn13_deskew == 10'h2c ) ? pn_d44[13] : 
                    ( pn13_deskew == 10'h2d ) ? pn_d45[13] : 
                    ( pn13_deskew == 10'h2e ) ? pn_d46[13] : 
                    ( pn13_deskew == 10'h2f ) ? pn_d47[13] : 
                    ( pn13_deskew == 10'h30 ) ? pn_d48[13] : 
                    ( pn13_deskew == 10'h31 ) ? pn_d49[13] : 
                    ( pn13_deskew == 10'h32 ) ? pn_d50[13] : 
                    ( pn13_deskew == 10'h33 ) ? pn_d51[13] : 
                    ( pn13_deskew == 10'h34 ) ? pn_d52[13] : 
                    ( pn13_deskew == 10'h35 ) ? pn_d53[13] : 
                    ( pn13_deskew == 10'h36 ) ? pn_d54[13] : 
                    ( pn13_deskew == 10'h37 ) ? pn_d55[13] : 
                    ( pn13_deskew == 10'h38 ) ? pn_d56[13] : 
                    ( pn13_deskew == 10'h39 ) ? pn_d57[13] : 
                    ( pn13_deskew == 10'h3a ) ? pn_d58[13] : 
                    ( pn13_deskew == 10'h3b ) ? pn_d59[13] : 
                    ( pn13_deskew == 10'h3c ) ? pn_d60[13] : 
                    ( pn13_deskew == 10'h3d ) ? pn_d61[13] : 
                    ( pn13_deskew == 10'h3e ) ? pn_d62[13] : 
                    ( pn13_deskew == 10'h3f ) ? pn_d63[13] : 
                    ( pn13_deskew == 10'h40 ) ? pn_d64[13] : 
                    ( pn13_deskew == 10'h41 ) ? pn_d65[13] : 
                    ( pn13_deskew == 10'h42 ) ? pn_d66[13] : 
                    ( pn13_deskew == 10'h43 ) ? pn_d67[13] : 
                    ( pn13_deskew == 10'h44 ) ? pn_d68[13] : 
                    ( pn13_deskew == 10'h45 ) ? pn_d69[13] : 
                    ( pn13_deskew == 10'h46 ) ? pn_d70[13] : 
                    ( pn13_deskew == 10'h47 ) ? pn_d71[13] : 
                    ( pn13_deskew == 10'h48 ) ? pn_d72[13] : 
                    ( pn13_deskew == 10'h49 ) ? pn_d73[13] : 
                    ( pn13_deskew == 10'h4a ) ? pn_d74[13] : 
                    ( pn13_deskew == 10'h4b ) ? pn_d75[13] : 
                    ( pn13_deskew == 10'h4c ) ? pn_d76[13] : 
                    ( pn13_deskew == 10'h4d ) ? pn_d77[13] : 
                    ( pn13_deskew == 10'h4e ) ? pn_d78[13] : 
                    ( pn13_deskew == 10'h4f ) ? pn_d79[13] : 
                    ( pn13_deskew == 10'h50 ) ? pn_d80[13] : 
                    ( pn13_deskew == 10'h51 ) ? pn_d81[13] : 
                    ( pn13_deskew == 10'h52 ) ? pn_d82[13] : 
                    ( pn13_deskew == 10'h53 ) ? pn_d83[13] : 
                    ( pn13_deskew == 10'h54 ) ? pn_d84[13] : 
                    ( pn13_deskew == 10'h55 ) ? pn_d85[13] : 
                    ( pn13_deskew == 10'h56 ) ? pn_d86[13] : 
                    ( pn13_deskew == 10'h57 ) ? pn_d87[13] : 
                    ( pn13_deskew == 10'h58 ) ? pn_d88[13] : 
                    ( pn13_deskew == 10'h59 ) ? pn_d89[13] : 
                    ( pn13_deskew == 10'h5a ) ? pn_d90[13] : 
                    ( pn13_deskew == 10'h5b ) ? pn_d91[13] : 
                    ( pn13_deskew == 10'h5c ) ? pn_d92[13] : 
                    ( pn13_deskew == 10'h5d ) ? pn_d93[13] : 
                    ( pn13_deskew == 10'h5e ) ? pn_d94[13] : 
                    ( pn13_deskew == 10'h5f ) ? pn_d95[13] : 
                    ( pn13_deskew == 10'h60 ) ? pn_d96[13] : 
                    ( pn13_deskew == 10'h61 ) ? pn_d97[13] : 
                    ( pn13_deskew == 10'h62 ) ? pn_d98[13] : 
                    ( pn13_deskew == 10'h63 ) ? pn_d99[13] : 
                    ( pn13_deskew == 10'h64 ) ? pn_d100[13] : 
                    ( pn13_deskew == 10'h65 ) ? pn_d101[13] : 
                    ( pn13_deskew == 10'h66 ) ? pn_d102[13] : 
                    ( pn13_deskew == 10'h67 ) ? pn_d103[13] : 
                    ( pn13_deskew == 10'h68 ) ? pn_d104[13] : 
                    ( pn13_deskew == 10'h69 ) ? pn_d105[13] : 
                    ( pn13_deskew == 10'h6a ) ? pn_d106[13] : 
                    ( pn13_deskew == 10'h6b ) ? pn_d107[13] : 
                    ( pn13_deskew == 10'h6c ) ? pn_d108[13] : 
                    ( pn13_deskew == 10'h6d ) ? pn_d109[13] : 
                    ( pn13_deskew == 10'h6e ) ? pn_d110[13] : 
                    ( pn13_deskew == 10'h6f ) ? pn_d111[13] : 
                    ( pn13_deskew == 10'h70 ) ? pn_d112[13] : 
                    ( pn13_deskew == 10'h71 ) ? pn_d113[13] : 
                    ( pn13_deskew == 10'h72 ) ? pn_d114[13] : 
                    ( pn13_deskew == 10'h73 ) ? pn_d115[13] : 
                    ( pn13_deskew == 10'h74 ) ? pn_d116[13] : 
                    ( pn13_deskew == 10'h75 ) ? pn_d117[13] : 
                    ( pn13_deskew == 10'h76 ) ? pn_d118[13] : 
                    ( pn13_deskew == 10'h77 ) ? pn_d119[13] : 
                    ( pn13_deskew == 10'h78 ) ? pn_d120[13] : 
                    ( pn13_deskew == 10'h79 ) ? pn_d121[13] : 
                    ( pn13_deskew == 10'h7a ) ? pn_d122[13] : 
                    ( pn13_deskew == 10'h7b ) ? pn_d123[13] : 
                    ( pn13_deskew == 10'h7c ) ? pn_d124[13] : 
                    ( pn13_deskew == 10'h7d ) ? pn_d125[13] : 
                    ( pn13_deskew == 10'h7e ) ? pn_d126[13] : 
                    ( pn13_deskew == 10'h7f ) ? pn_d127[13] : 
                    ( pn13_deskew == 10'h80 ) ? pn_d128[13] : 
                    ( pn13_deskew == 10'h81 ) ? pn_d129[13] : 
                    ( pn13_deskew == 10'h82 ) ? pn_d130[13] : 
                    ( pn13_deskew == 10'h83 ) ? pn_d131[13] : 
                    ( pn13_deskew == 10'h84 ) ? pn_d132[13] : 
                    ( pn13_deskew == 10'h85 ) ? pn_d133[13] : 
                    ( pn13_deskew == 10'h86 ) ? pn_d134[13] : 
                    ( pn13_deskew == 10'h87 ) ? pn_d135[13] : 
                    ( pn13_deskew == 10'h88 ) ? pn_d136[13] : 
                    ( pn13_deskew == 10'h89 ) ? pn_d137[13] : 
                    ( pn13_deskew == 10'h8a ) ? pn_d138[13] : 
                    ( pn13_deskew == 10'h8b ) ? pn_d139[13] : 
                    ( pn13_deskew == 10'h8c ) ? pn_d140[13] : 
                    ( pn13_deskew == 10'h8d ) ? pn_d141[13] : 
                    ( pn13_deskew == 10'h8e ) ? pn_d142[13] : 
                    ( pn13_deskew == 10'h8f ) ? pn_d143[13] : 
                    ( pn13_deskew == 10'h90 ) ? pn_d144[13] : 
                    ( pn13_deskew == 10'h91 ) ? pn_d145[13] : pn_in[13];  
 

dff_p #(14) ff0( .signal_in   (pn_in),
                   .signal_out  (pn_d1),
                   .clk (sclk));
dff_p #(14) ff1( .signal_in   (pn_d1),
                   .signal_out  (pn_d2),
                   .clk (sclk));
dff_p #(14) ff2( .signal_in   (pn_d2),
                   .signal_out  (pn_d3),
                   .clk (sclk));
dff_p #(14) ff3( .signal_in   (pn_d3),
                   .signal_out  (pn_d4),
                   .clk (sclk));
dff_p #(14) ff4( .signal_in   (pn_d4),
                   .signal_out  (pn_d5),
                   .clk (sclk));
dff_p #(14) ff5( .signal_in   (pn_d5),
                   .signal_out  (pn_d6),
                   .clk (sclk));
dff_p #(14) ff6( .signal_in   (pn_d6),
                   .signal_out  (pn_d7),
                   .clk (sclk));
dff_p #(14) ff7( .signal_in   (pn_d7),
                   .signal_out  (pn_d8),
                   .clk (sclk));
dff_p #(14) ff8( .signal_in   (pn_d8),
                   .signal_out  (pn_d9),
                   .clk (sclk));
dff_p #(14) ff9( .signal_in   (pn_d9),
                   .signal_out  (pn_d10),
                   .clk (sclk));
dff_p #(14) ff10( .signal_in   (pn_d10),
                   .signal_out  (pn_d11),
                   .clk (sclk));
dff_p #(14) ff11( .signal_in   (pn_d11),
                   .signal_out  (pn_d12),
                   .clk (sclk));
dff_p #(14) ff12( .signal_in   (pn_d12),
                   .signal_out  (pn_d13),
                   .clk (sclk));
dff_p #(14) ff13( .signal_in   (pn_d13),
                   .signal_out  (pn_d14),
                   .clk (sclk));
dff_p #(14) ff14( .signal_in   (pn_d14),
                   .signal_out  (pn_d15),
                   .clk (sclk));
dff_p #(14) ff15( .signal_in   (pn_d15),
                   .signal_out  (pn_d16),
                   .clk (sclk));
dff_p #(14) ff16( .signal_in   (pn_d16),
                   .signal_out  (pn_d17),
                   .clk (sclk));
dff_p #(14) ff17( .signal_in   (pn_d17),
                   .signal_out  (pn_d18),
                   .clk (sclk));
dff_p #(14) ff18( .signal_in   (pn_d18),
                   .signal_out  (pn_d19),
                   .clk (sclk));
dff_p #(14) ff19( .signal_in   (pn_d19),
                   .signal_out  (pn_d20),
                   .clk (sclk));
dff_p #(14) ff20( .signal_in   (pn_d20),
                    .signal_out  (pn_d21),
                    .clk (sclk));

dff_p #(14) ff21( .signal_in   (pn_d21),
                    .signal_out  (pn_d22),
                    .clk (sclk));
dff_p #(14) ff22( .signal_in   (pn_d22),
                    .signal_out  (pn_d23),
                    .clk (sclk));
dff_p #(14) ff23( .signal_in   (pn_d23),
                    .signal_out  (pn_d24),
                    .clk (sclk));
dff_p #(14) ff24( .signal_in   (pn_d24),
                    .signal_out  (pn_d25),
                    .clk (sclk));
dff_p #(14) ff25( .signal_in   (pn_d25),
                    .signal_out  (pn_d26),
                    .clk (sclk));
dff_p #(14) ff26( .signal_in   (pn_d26),
                    .signal_out  (pn_d27),
                    .clk (sclk));
dff_p #(14) ff27( .signal_in   (pn_d27),
                    .signal_out  (pn_d28),
                    .clk (sclk));
dff_p #(14) ff28( .signal_in   (pn_d28),
                    .signal_out  (pn_d29),
                    .clk (sclk));
dff_p #(14) ff29( .signal_in   (pn_d29),
                    .signal_out  (pn_d30),
                    .clk (sclk));
dff_p #(14) ff30( .signal_in   (pn_d30),
                    .signal_out  (pn_d31),
                    .clk (sclk));
dff_p #(14) ff31( .signal_in   (pn_d31),
                    .signal_out  (pn_d32),
                    .clk (sclk));
dff_p #(14) ff32( .signal_in   (pn_d32),
                    .signal_out  (pn_d33),
                    .clk (sclk));
dff_p #(14) ff33( .signal_in   (pn_d33),
                    .signal_out  (pn_d34),
                    .clk (sclk));
dff_p #(14) ff34( .signal_in   (pn_d34),
                    .signal_out  (pn_d35),
                    .clk (sclk));
dff_p #(14) ff35( .signal_in   (pn_d35),
                    .signal_out  (pn_d36),
                    .clk (sclk));
dff_p #(14) ff36( .signal_in   (pn_d36),
                    .signal_out  (pn_d37),
                    .clk (sclk));
dff_p #(14) ff37( .signal_in   (pn_d37),
                    .signal_out  (pn_d38),
                    .clk (sclk));
dff_p #(14) ff38( .signal_in   (pn_d38),
                    .signal_out  (pn_d39),
                    .clk (sclk));
dff_p #(14) ff39( .signal_in   (pn_d39),
                    .signal_out  (pn_d40),
                    .clk (sclk));
dff_p #(14) ff40( .signal_in   (pn_d40),
                    .signal_out  (pn_d41),
                    .clk (sclk));
dff_p #(14) ff41( .signal_in   (pn_d41),
                    .signal_out  (pn_d42),
                    .clk (sclk));
dff_p #(14) ff42( .signal_in   (pn_d42),
                    .signal_out  (pn_d43),
                    .clk (sclk));
dff_p #(14) ff43( .signal_in   (pn_d43),
                    .signal_out  (pn_d44),
                    .clk (sclk));
dff_p #(14) ff44( .signal_in   (pn_d44),
                    .signal_out  (pn_d45),
                    .clk (sclk));
dff_p #(14) ff45( .signal_in   (pn_d45),
                    .signal_out  (pn_d46),
                    .clk (sclk));
dff_p #(14) ff46( .signal_in   (pn_d46),
                    .signal_out  (pn_d47),
                    .clk (sclk));
dff_p #(14) ff47( .signal_in   (pn_d47),
                    .signal_out  (pn_d48),
                    .clk (sclk));
dff_p #(14) ff48( .signal_in   (pn_d48),
                    .signal_out  (pn_d49),
                    .clk (sclk));
dff_p #(14) ff49( .signal_in   (pn_d49),
                    .signal_out  (pn_d50),
                    .clk (sclk));

dff_p #(14) ff50( .signal_in   (pn_d50),
                    .signal_out  (pn_d51),
                    .clk (sclk));
dff_p #(14) ff51( .signal_in   (pn_d51),
                    .signal_out  (pn_d52),
                    .clk (sclk));
dff_p #(14) ff52( .signal_in   (pn_d52),
                    .signal_out  (pn_d53),
                    .clk (sclk));
dff_p #(14) ff53( .signal_in   (pn_d53),
                    .signal_out  (pn_d54),
                    .clk (sclk));
dff_p #(14) ff54( .signal_in   (pn_d54),
                    .signal_out  (pn_d55),
                    .clk (sclk));
dff_p #(14) ff55( .signal_in   (pn_d55),
                    .signal_out  (pn_d56),
                    .clk (sclk));
dff_p #(14) ff56( .signal_in   (pn_d56),
                    .signal_out  (pn_d57),
                    .clk (sclk));
dff_p #(14) ff57( .signal_in   (pn_d57),
                    .signal_out  (pn_d58),
                    .clk (sclk));
dff_p #(14) ff58( .signal_in   (pn_d58),
                    .signal_out  (pn_d59),
                    .clk (sclk));
dff_p #(14) ff59( .signal_in   (pn_d59),
                    .signal_out  (pn_d60),
                    .clk (sclk));
dff_p #(14) ff60( .signal_in   (pn_d60),
                    .signal_out  (pn_d61),
                    .clk (sclk));
dff_p #(14) ff61( .signal_in   (pn_d61),
                    .signal_out  (pn_d62),
                    .clk (sclk));
dff_p #(14) ff62( .signal_in   (pn_d62),
                    .signal_out  (pn_d63),
                    .clk (sclk));
dff_p #(14) ff63( .signal_in   (pn_d63),
                    .signal_out  (pn_d64),
                    .clk (sclk));
dff_p #(14) ff64( .signal_in   (pn_d64),
                    .signal_out  (pn_d65),
                    .clk (sclk));
dff_p #(14) ff65( .signal_in   (pn_d65),
                    .signal_out  (pn_d66),
                    .clk (sclk));
dff_p #(14) ff66( .signal_in   (pn_d66),
                    .signal_out  (pn_d67),
                    .clk (sclk));
dff_p #(14) ff67( .signal_in   (pn_d67),
                    .signal_out  (pn_d68),
                    .clk (sclk));
dff_p #(14) ff68( .signal_in   (pn_d68),
                    .signal_out  (pn_d69),
                    .clk (sclk));
dff_p #(14) ff69( .signal_in   (pn_d69),
                    .signal_out  (pn_d70),
                    .clk (sclk));
dff_p #(14) ff70( .signal_in   (pn_d70),
                    .signal_out  (pn_d71),
                    .clk (sclk));
dff_p #(14) ff71( .signal_in   (pn_d71),
                    .signal_out  (pn_d72),
                    .clk (sclk));
dff_p #(14) ff72( .signal_in   (pn_d72),
                    .signal_out  (pn_d73),
                    .clk (sclk));
dff_p #(14) ff73( .signal_in   (pn_d73),
                    .signal_out  (pn_d74),
                    .clk (sclk));
dff_p #(14) ff74( .signal_in   (pn_d74),
                    .signal_out  (pn_d75),
                    .clk (sclk));
dff_p #(14) ff75( .signal_in   (pn_d75),
                    .signal_out  (pn_d76),
                    .clk (sclk));
dff_p #(14) ff76( .signal_in   (pn_d76),
                    .signal_out  (pn_d77),
                    .clk (sclk));
dff_p #(14) ff77( .signal_in   (pn_d77),
                    .signal_out  (pn_d78),
                    .clk (sclk));
dff_p #(14) ff78( .signal_in   (pn_d78),
                    .signal_out  (pn_d79),
                    .clk (sclk));
dff_p #(14) ff79( .signal_in   (pn_d79),
                    .signal_out  (pn_d80),
                    .clk (sclk));
dff_p #(14) ff80( .signal_in   (pn_d80),
                    .signal_out  (pn_d81),
                    .clk (sclk));
dff_p #(14) ff81( .signal_in   (pn_d81),
                    .signal_out  (pn_d82),
                    .clk (sclk));
dff_p #(14) ff82( .signal_in   (pn_d82),
                    .signal_out  (pn_d83),
                    .clk (sclk));
dff_p #(14) ff83( .signal_in   (pn_d83),
                    .signal_out  (pn_d84),
                    .clk (sclk));
dff_p #(14) ff84( .signal_in   (pn_d84),
                    .signal_out  (pn_d85),
                    .clk (sclk));
dff_p #(14) ff85( .signal_in   (pn_d85),
                    .signal_out  (pn_d86),
                    .clk (sclk));
dff_p #(14) ff86( .signal_in   (pn_d86),
                    .signal_out  (pn_d87),
                    .clk (sclk));
dff_p #(14) ff87( .signal_in   (pn_d87),
                    .signal_out  (pn_d88),
                    .clk (sclk));
dff_p #(14) ff88( .signal_in   (pn_d88),
                    .signal_out  (pn_d89),
                    .clk (sclk));
dff_p #(14) ff89( .signal_in   (pn_d89),
                    .signal_out  (pn_d90),
                    .clk (sclk));
dff_p #(14) ff90( .signal_in   (pn_d90),
                    .signal_out  (pn_d91),
                    .clk (sclk));
dff_p #(14) ff91( .signal_in   (pn_d91),
                    .signal_out  (pn_d92),
                    .clk (sclk));
dff_p #(14) ff92( .signal_in   (pn_d92),
                    .signal_out  (pn_d93),
                    .clk (sclk));
dff_p #(14) ff93( .signal_in   (pn_d93),
                    .signal_out  (pn_d94),
                    .clk (sclk));
dff_p #(14) ff94( .signal_in   (pn_d94),
                    .signal_out  (pn_d95),
                    .clk (sclk));
dff_p #(14) ff95( .signal_in   (pn_d95),
                    .signal_out  (pn_d96),
                    .clk (sclk));
dff_p #(14) ff96( .signal_in   (pn_d96),
                    .signal_out  (pn_d97),
                    .clk (sclk));
dff_p #(14) ff97( .signal_in   (pn_d97),
                    .signal_out  (pn_d98),
                    .clk (sclk));

dff_p #(14) ff98( .signal_in   (pn_d98),
                    .signal_out  (pn_d99),
                    .clk (sclk));
dff_p #(14) ff99( .signal_in   (pn_d99),
                    .signal_out  (pn_d100),
                    .clk (sclk));
dff_p #(14) ff100( .signal_in   (pn_d100),
                    .signal_out  (pn_d101),
                    .clk (sclk));
dff_p #(14) ff101( .signal_in   (pn_d101),
                    .signal_out  (pn_d102),
                    .clk (sclk));
dff_p #(14) ff102( .signal_in   (pn_d102),
                    .signal_out  (pn_d103),
                    .clk (sclk));
dff_p #(14) ff103( .signal_in   (pn_d103),
                    .signal_out  (pn_d104),
                    .clk (sclk));
dff_p #(14) ff104( .signal_in   (pn_d104),
                    .signal_out  (pn_d105),
                    .clk (sclk));
dff_p #(14) ff105( .signal_in   (pn_d105),
                    .signal_out  (pn_d106),
                    .clk (sclk));
dff_p #(14) ff106( .signal_in   (pn_d106),
                    .signal_out  (pn_d107),
                    .clk (sclk));
dff_p #(14) ff107( .signal_in   (pn_d107),
                    .signal_out  (pn_d108),
                    .clk (sclk));
dff_p #(14) ff108( .signal_in   (pn_d108),
                    .signal_out  (pn_d109),
                    .clk (sclk));


dff_p #(14) ff109 ( .signal_in   (pn_d109),
                   .signal_out  (pn_d110),
                   .clk (sclk)); 

dff_p #(14) ff110 ( .signal_in   (pn_d110),
                   .signal_out  (pn_d111),
                   .clk (sclk)); 

dff_p #(14) ff111 ( .signal_in   (pn_d111),
                   .signal_out  (pn_d112),
                   .clk (sclk)); 

dff_p #(14) ff112 ( .signal_in   (pn_d112),
                   .signal_out  (pn_d113),
                   .clk (sclk)); 

dff_p #(14) ff113 ( .signal_in   (pn_d113),
                   .signal_out  (pn_d114),
                   .clk (sclk)); 

dff_p #(14) ff114 ( .signal_in   (pn_d114),
                   .signal_out  (pn_d115),
                   .clk (sclk)); 

dff_p #(14) ff115 ( .signal_in   (pn_d115),
                   .signal_out  (pn_d116),
                   .clk (sclk)); 

dff_p #(14) ff116 ( .signal_in   (pn_d116),
                   .signal_out  (pn_d117),
                   .clk (sclk)); 

dff_p #(14) ff117 ( .signal_in   (pn_d117),
                   .signal_out  (pn_d118),
                   .clk (sclk)); 

dff_p #(14) ff118 ( .signal_in   (pn_d118),
                   .signal_out  (pn_d119),
                   .clk (sclk)); 

dff_p #(14) ff119 ( .signal_in   (pn_d119),
                   .signal_out  (pn_d120),
                   .clk (sclk)); 

dff_p #(14) ff120 ( .signal_in   (pn_d120),
                   .signal_out  (pn_d121),
                   .clk (sclk)); 

dff_p #(14) ff121 ( .signal_in   (pn_d121),
                   .signal_out  (pn_d122),
                   .clk (sclk)); 

dff_p #(14) ff122 ( .signal_in   (pn_d122),
                   .signal_out  (pn_d123),
                   .clk (sclk)); 

dff_p #(14) ff123 ( .signal_in   (pn_d123),
                   .signal_out  (pn_d124),
                   .clk (sclk)); 

dff_p #(14) ff124 ( .signal_in   (pn_d124),
                   .signal_out  (pn_d125),
                   .clk (sclk)); 

dff_p #(14) ff125 ( .signal_in   (pn_d125),
                   .signal_out  (pn_d126),
                   .clk (sclk)); 

dff_p #(14) ff126 ( .signal_in   (pn_d126),
                   .signal_out  (pn_d127),
                   .clk (sclk)); 

dff_p #(14) ff127 ( .signal_in   (pn_d127),
                   .signal_out  (pn_d128),
                   .clk (sclk)); 

dff_p #(14) ff128 ( .signal_in   (pn_d128),
                   .signal_out  (pn_d129),
                   .clk (sclk)); 

dff_p #(14) ff129 ( .signal_in   (pn_d129),
                   .signal_out  (pn_d130),
                   .clk (sclk)); 

dff_p #(14) ff130 ( .signal_in   (pn_d130),
                   .signal_out  (pn_d131),
                   .clk (sclk)); 

dff_p #(14) ff131 ( .signal_in   (pn_d131),
                   .signal_out  (pn_d132),
                   .clk (sclk)); 

dff_p #(14) ff132 ( .signal_in   (pn_d132),
                   .signal_out  (pn_d133),
                   .clk (sclk)); 

dff_p #(14) ff133 ( .signal_in   (pn_d133),
                   .signal_out  (pn_d134),
                   .clk (sclk)); 

dff_p #(14) ff134 ( .signal_in   (pn_d134),
                   .signal_out  (pn_d135),
                   .clk (sclk)); 

dff_p #(14) ff135 ( .signal_in   (pn_d135),
                   .signal_out  (pn_d136),
                   .clk (sclk)); 

dff_p #(14) ff136 ( .signal_in   (pn_d136),
                   .signal_out  (pn_d137),
                   .clk (sclk)); 

dff_p #(14) ff137 ( .signal_in   (pn_d137),
                   .signal_out  (pn_d138),
                   .clk (sclk)); 

dff_p #(14) ff138 ( .signal_in   (pn_d138),
                   .signal_out  (pn_d139),
                   .clk (sclk)); 

dff_p #(14) ff139 ( .signal_in   (pn_d139),
                   .signal_out  (pn_d140),
                   .clk (sclk)); 

dff_p #(14) ff140 ( .signal_in   (pn_d140),
                   .signal_out  (pn_d141),
                   .clk (sclk)); 

dff_p #(14) ff141 ( .signal_in   (pn_d141),
                   .signal_out  (pn_d142),
                   .clk (sclk)); 

dff_p #(14) ff142 ( .signal_in   (pn_d142),
                   .signal_out  (pn_d143),
                   .clk (sclk)); 

dff_p #(14) ff143 ( .signal_in   (pn_d143),
                   .signal_out  (pn_d144),
                   .clk (sclk)); 

dff_p #(14) ff144 ( .signal_in   (pn_d144),
                   .signal_out  (pn_d145),
                   .clk (sclk)); 

dff_p #(14) ff145 ( .signal_in   (pn_d145),
                   .signal_out  (pn_d146),
                   .clk (sclk)); 

dff_p #(14) ff146 ( .signal_in   (pn_d146),
                   .signal_out  (pn_d147),
                   .clk (sclk)); 


endmodule


`else
module nb_bit_lane_deskew(pn_in,pn_out,init,sclk);
parameter DS=0;

// interface signals
input  [13:0] pn_in;
output [13:0] pn_out;
input         init;
input         sclk;

reg [9:0] pn0_deskew,pn1_deskew,pn2_deskew,pn3_deskew;
reg [9:0] pn4_deskew,pn5_deskew,pn6_deskew,pn7_deskew;
reg [9:0] pn8_deskew,pn9_deskew,pn10_deskew,pn11_deskew;
reg [9:0] pn12_deskew,pn13_deskew;
reg dummy;

initial begin

pn0_deskew=10'h0;
pn1_deskew=10'h0;
pn2_deskew=10'h0;
pn3_deskew=10'h0;
pn4_deskew=10'h0;
pn5_deskew=10'h0;
pn6_deskew=10'h0;
pn7_deskew=10'h0;
pn8_deskew=10'h0;
pn9_deskew=10'h0;
pn10_deskew=10'h0;
pn11_deskew=10'h0;
pn12_deskew=10'h0;
pn13_deskew=10'h0;

`ifdef AXIS_FBDIMM_HW
`else
dummy=$value$plusargs("pn0_deskew=%h",pn0_deskew);
dummy=$value$plusargs("pn1_deskew=%h",pn1_deskew);
dummy=$value$plusargs("pn2_deskew=%h",pn2_deskew);
dummy=$value$plusargs("pn3_deskew=%h",pn3_deskew);
dummy=$value$plusargs("pn4_deskew=%h",pn4_deskew);
dummy=$value$plusargs("pn5_deskew=%h",pn5_deskew);
dummy=$value$plusargs("pn6_deskew=%h",pn6_deskew);
dummy=$value$plusargs("pn7_deskew=%h",pn7_deskew);
dummy=$value$plusargs("pn8_deskew=%h",pn8_deskew);
dummy=$value$plusargs("pn9_deskew=%h",pn9_deskew);
dummy=$value$plusargs("pn10_deskew=%h",pn10_deskew);
dummy=$value$plusargs("pn11_deskew=%h",pn11_deskew);
dummy=$value$plusargs("pn12_deskew=%h",pn12_deskew);
dummy=$value$plusargs("pn13_deskew=%h",pn13_deskew);
`endif

end

wire [13:0] pn_d1,pn_d2,pn_d3,pn_d4,pn_d5,pn_d6,pn_d7,pn_d8,pn_d9,pn_d10;
wire [13:0] pn_d11,pn_d12,pn_d13,pn_d14,pn_d15,pn_d16,pn_d17,pn_d18,pn_d19,pn_d20;
wire [13:0] pn_d21,pn_d22,pn_d23,pn_d24,pn_d25,pn_d26,pn_d27,pn_d28,pn_d29,pn_d30;
wire [13:0] pn_d31,pn_d32,pn_d33,pn_d34,pn_d35,pn_d36,pn_d37,pn_d38,pn_d39,pn_d40;
wire [13:0] pn_d41,pn_d42,pn_d43,pn_d44,pn_d45,pn_d46,pn_d47,pn_d48,pn_d49,pn_d50;
wire [13:0] pn_d51,pn_d52,pn_d53,pn_d54,pn_d55,pn_d56,pn_d57,pn_d58,pn_d59,pn_d60;
wire [13:0] pn_d61,pn_d62,pn_d63,pn_d64,pn_d65,pn_d66,pn_d67,pn_d68,pn_d69,pn_d70;
wire [13:0] pn_d71,pn_d72,pn_d73,pn_d74,pn_d75,pn_d76,pn_d77,pn_d78,pn_d79,pn_d80;
wire [13:0] pn_d81,pn_d82,pn_d83,pn_d84,pn_d85,pn_d86,pn_d87,pn_d88,pn_d89,pn_d90;
wire [13:0] pn_d91,pn_d92,pn_d93,pn_d94,pn_d95,pn_d96,pn_d97,pn_d98,pn_d99,pn_d100;
wire [13:0] pn_d101,pn_d102,pn_d103,pn_d104,pn_d105,pn_d106,pn_d107,pn_d108,pn_d109,pn_d110;
wire [13:0] pn_d111,pn_d112,pn_d113,pn_d114,pn_d115,pn_d116,pn_d117,pn_d118,pn_d119,pn_d120;
wire [13:0] pn_d121,pn_d122,pn_d123,pn_d124,pn_d125,pn_d126,pn_d127,pn_d128,pn_d129,pn_d130;
wire [13:0] pn_d131,pn_d132,pn_d133,pn_d134,pn_d135,pn_d136,pn_d137,pn_d138,pn_d139,pn_d140;
wire [13:0] pn_d141,pn_d142,pn_d143,pn_d144,pn_d145,pn_d146,pn_d147,pn_d148,pn_d149,pn_d150;
 
wire [13:0] pn_out_local;

 assign pn_out_local[0] = ( pn0_deskew == 10'h0 && init ) ? pn_in[0] : 
                    ( pn0_deskew == 10'h1 && init ) ? pn_d1[0] : 
                    ( pn0_deskew == 10'h2 && init ) ? pn_d2[0] : 
                    ( pn0_deskew == 10'h3 && init ) ? pn_d3[0] : 
                    ( pn0_deskew == 10'h4 && init ) ? pn_d4[0] : 
                    ( pn0_deskew == 10'h5 && init ) ? pn_d5[0] : 
                    ( pn0_deskew == 10'h6 && init ) ? pn_d6[0] : 
                    ( pn0_deskew == 10'h7 && init ) ? pn_d7[0] : 
                    ( pn0_deskew == 10'h8 && init ) ? pn_d8[0] : 
                    ( pn0_deskew == 10'h9 && init ) ? pn_d9[0] : 
                    ( pn0_deskew == 10'ha && init ) ? pn_d10[0] : 
                    ( pn0_deskew == 10'hb && init ) ? pn_d11[0] : 
                    ( pn0_deskew == 10'hc && init ) ? pn_d12[0] : 
                    ( pn0_deskew == 10'hd && init ) ? pn_d13[0] : 
                    ( pn0_deskew == 10'he && init ) ? pn_d14[0] : 
                    ( pn0_deskew == 10'hf && init ) ? pn_d15[0] : 
                    ( pn0_deskew == 10'h10 && init ) ? pn_d16[0] : 
                    ( pn0_deskew == 10'h11 && init ) ? pn_d17[0] : 
                    ( pn0_deskew == 10'h12 && init ) ? pn_d18[0] : 
                    ( pn0_deskew == 10'h13 && init ) ? pn_d19[0] : 
                    ( pn0_deskew == 10'h14 && init ) ? pn_d20[0] : 
                    ( pn0_deskew == 10'h15 && init ) ? pn_d21[0] : 
                    ( pn0_deskew == 10'h16 && init ) ? pn_d22[0] : 
                    ( pn0_deskew == 10'h17 && init ) ? pn_d23[0] : 
                    ( pn0_deskew == 10'h18 && init ) ? pn_d24[0] : 
                    ( pn0_deskew == 10'h19 && init ) ? pn_d25[0] : 
                    ( pn0_deskew == 10'h1a && init ) ? pn_d26[0] : 
                    ( pn0_deskew == 10'h1b && init ) ? pn_d27[0] : 
                    ( pn0_deskew == 10'h1c && init ) ? pn_d28[0] : 
                    ( pn0_deskew == 10'h1d && init ) ? pn_d29[0] : 
                    ( pn0_deskew == 10'h1e && init ) ? pn_d30[0] : 
                    ( pn0_deskew == 10'h1f && init ) ? pn_d31[0] : 
                    ( pn0_deskew == 10'h20 && init ) ? pn_d32[0] : 
                    ( pn0_deskew == 10'h21 && init ) ? pn_d33[0] : 
                    ( pn0_deskew == 10'h22 && init ) ? pn_d34[0] : 
                    ( pn0_deskew == 10'h23 && init ) ? pn_d35[0] : 
                    ( pn0_deskew == 10'h24 && init ) ? pn_d36[0] : 
                    ( pn0_deskew == 10'h25 && init ) ? pn_d37[0] : 
                    ( pn0_deskew == 10'h26 && init ) ? pn_d38[0] : 
                    ( pn0_deskew == 10'h27 && init ) ? pn_d39[0] : 
                    ( pn0_deskew == 10'h28 && init ) ? pn_d40[0] : 
                    ( pn0_deskew == 10'h29 && init ) ? pn_d41[0] : 
                    ( pn0_deskew == 10'h2a && init ) ? pn_d42[0] : 
                    ( pn0_deskew == 10'h2b && init ) ? pn_d43[0] : 
                    ( pn0_deskew == 10'h2c && init ) ? pn_d44[0] : 
                    ( pn0_deskew == 10'h2d && init ) ? pn_d45[0] : 
                    ( pn0_deskew == 10'h2e && init ) ? pn_d46[0] : 
                    ( pn0_deskew == 10'h2f && init ) ? pn_d47[0] : 
                    ( pn0_deskew == 10'h30 && init ) ? pn_d48[0] : 
                    ( pn0_deskew == 10'h31 && init ) ? pn_d49[0] : 
                    ( pn0_deskew == 10'h32 && init ) ? pn_d50[0] : 
                    ( pn0_deskew == 10'h33 && init ) ? pn_d51[0] : 
                    ( pn0_deskew == 10'h34 && init ) ? pn_d52[0] : 
                    ( pn0_deskew == 10'h35 && init ) ? pn_d53[0] : 
                    ( pn0_deskew == 10'h36 && init ) ? pn_d54[0] : 
                    ( pn0_deskew == 10'h37 && init ) ? pn_d55[0] : 
                    ( pn0_deskew == 10'h38 && init ) ? pn_d56[0] : 
                    ( pn0_deskew == 10'h39 && init ) ? pn_d57[0] : 
                    ( pn0_deskew == 10'h3a && init ) ? pn_d58[0] : 
                    ( pn0_deskew == 10'h3b && init ) ? pn_d59[0] : 
                    ( pn0_deskew == 10'h3c && init ) ? pn_d60[0] : 
                    ( pn0_deskew == 10'h3d && init ) ? pn_d61[0] : 
                    ( pn0_deskew == 10'h3e && init ) ? pn_d62[0] : 
                    ( pn0_deskew == 10'h3f && init ) ? pn_d63[0] : 
                    ( pn0_deskew == 10'h40 && init ) ? pn_d64[0] : 
                    ( pn0_deskew == 10'h41 && init ) ? pn_d65[0] : 
                    ( pn0_deskew == 10'h42 && init ) ? pn_d66[0] : 
                    ( pn0_deskew == 10'h43 && init ) ? pn_d67[0] : 
                    ( pn0_deskew == 10'h44 && init ) ? pn_d68[0] : 
                    ( pn0_deskew == 10'h45 && init ) ? pn_d69[0] : 
                    ( pn0_deskew == 10'h46 && init ) ? pn_d70[0] : 
                    ( pn0_deskew == 10'h47 && init ) ? pn_d71[0] : 
                    ( pn0_deskew == 10'h48 && init ) ? pn_d72[0] : 
                    ( pn0_deskew == 10'h49 && init ) ? pn_d73[0] : 
                    ( pn0_deskew == 10'h4a && init ) ? pn_d74[0] : 
                    ( pn0_deskew == 10'h4b && init ) ? pn_d75[0] : 
                    ( pn0_deskew == 10'h4c && init ) ? pn_d76[0] : 
                    ( pn0_deskew == 10'h4d && init ) ? pn_d77[0] : 
                    ( pn0_deskew == 10'h4e && init ) ? pn_d78[0] : 
                    ( pn0_deskew == 10'h4f && init ) ? pn_d79[0] : 
                    ( pn0_deskew == 10'h50 && init ) ? pn_d80[0] : 
                    ( pn0_deskew == 10'h51 && init ) ? pn_d81[0] : 
                    ( pn0_deskew == 10'h52 && init ) ? pn_d82[0] : 
                    ( pn0_deskew == 10'h53 && init ) ? pn_d83[0] : 
                    ( pn0_deskew == 10'h54 && init ) ? pn_d84[0] : 
                    ( pn0_deskew == 10'h55 && init ) ? pn_d85[0] : 
                    ( pn0_deskew == 10'h56 && init ) ? pn_d86[0] : 
                    ( pn0_deskew == 10'h57 && init ) ? pn_d87[0] : 
                    ( pn0_deskew == 10'h58 && init ) ? pn_d88[0] : 
                    ( pn0_deskew == 10'h59 && init ) ? pn_d89[0] : 
                    ( pn0_deskew == 10'h5a && init ) ? pn_d90[0] : 
                    ( pn0_deskew == 10'h5b && init ) ? pn_d91[0] : 
                    ( pn0_deskew == 10'h5c && init ) ? pn_d92[0] : 
                    ( pn0_deskew == 10'h5d && init ) ? pn_d93[0] : 
                    ( pn0_deskew == 10'h5e && init ) ? pn_d94[0] : 
                    ( pn0_deskew == 10'h5f && init ) ? pn_d95[0] : 
                    ( pn0_deskew == 10'h60 && init ) ? pn_d96[0] : 
                    ( pn0_deskew == 10'h61 && init ) ? pn_d97[0] : 
                    ( pn0_deskew == 10'h62 && init ) ? pn_d98[0] : 
                    ( pn0_deskew == 10'h63 && init ) ? pn_d99[0] : 
                    ( pn0_deskew == 10'h64 && init ) ? pn_d100[0] : 
                    ( pn0_deskew == 10'h65 && init ) ? pn_d101[0] : 
                    ( pn0_deskew == 10'h66 && init ) ? pn_d102[0] : 
                    ( pn0_deskew == 10'h67 && init ) ? pn_d103[0] : 
                    ( pn0_deskew == 10'h68 && init ) ? pn_d104[0] : 
                    ( pn0_deskew == 10'h69 && init ) ? pn_d105[0] : 
                    ( pn0_deskew == 10'h6a && init ) ? pn_d106[0] : 
                    ( pn0_deskew == 10'h6b && init ) ? pn_d107[0] : 
                    ( pn0_deskew == 10'h6c && init ) ? pn_d108[0] : 
                    ( pn0_deskew == 10'h6d && init ) ? pn_d109[0] : 
                    ( pn0_deskew == 10'h6e && init ) ? pn_d110[0] : 
                    ( pn0_deskew == 10'h6f && init ) ? pn_d111[0] : 
                    ( pn0_deskew == 10'h70 && init ) ? pn_d112[0] : 
                    ( pn0_deskew == 10'h71 && init ) ? pn_d113[0] : 
                    ( pn0_deskew == 10'h72 && init ) ? pn_d114[0] : 
                    ( pn0_deskew == 10'h73 && init ) ? pn_d115[0] : 
                    ( pn0_deskew == 10'h74 && init ) ? pn_d116[0] : 
                    ( pn0_deskew == 10'h75 && init ) ? pn_d117[0] : 
                    ( pn0_deskew == 10'h76 && init ) ? pn_d118[0] : 
                    ( pn0_deskew == 10'h77 && init ) ? pn_d119[0] : 
                    ( pn0_deskew == 10'h78 && init ) ? pn_d120[0] : 
                    ( pn0_deskew == 10'h79 && init ) ? pn_d121[0] : 
                    ( pn0_deskew == 10'h7a && init ) ? pn_d122[0] : 
                    ( pn0_deskew == 10'h7b && init ) ? pn_d123[0] : 
                    ( pn0_deskew == 10'h7c && init ) ? pn_d124[0] : 
                    ( pn0_deskew == 10'h7d && init ) ? pn_d125[0] : 
                    ( pn0_deskew == 10'h7e && init ) ? pn_d126[0] : 
                    ( pn0_deskew == 10'h7f && init ) ? pn_d127[0] : 
                    ( pn0_deskew == 10'h80 && init ) ? pn_d128[0] : 
                    ( pn0_deskew == 10'h81 && init ) ? pn_d129[0] : 
                    ( pn0_deskew == 10'h82 && init ) ? pn_d130[0] : 
                    ( pn0_deskew == 10'h83 && init ) ? pn_d131[0] : 
                    ( pn0_deskew == 10'h84 && init ) ? pn_d132[0] : 
                    ( pn0_deskew == 10'h85 && init ) ? pn_d133[0] : 
                    ( pn0_deskew == 10'h86 && init ) ? pn_d134[0] : 
                    ( pn0_deskew == 10'h87 && init ) ? pn_d135[0] : 
                    ( pn0_deskew == 10'h88 && init ) ? pn_d136[0] : 
                    ( pn0_deskew == 10'h89 && init ) ? pn_d137[0] : 
                    ( pn0_deskew == 10'h8a && init ) ? pn_d138[0] : 
                    ( pn0_deskew == 10'h8b && init ) ? pn_d139[0] : 
                    ( pn0_deskew == 10'h8c && init ) ? pn_d140[0] : 
                    ( pn0_deskew == 10'h8d && init ) ? pn_d141[0] : 
                    ( pn0_deskew == 10'h8e && init ) ? pn_d142[0] : 
                    ( pn0_deskew == 10'h8f && init ) ? pn_d143[0] : 
                    ( pn0_deskew == 10'h90 && init ) ? pn_d144[0] : 
                    ( pn0_deskew == 10'h91 && init ) ? pn_d145[0] : pn_in[0]; 
assign pn_out_local[1] = ( pn1_deskew == 10'h0 && init ) ? pn_in[1] : 
                    ( pn1_deskew == 10'h1 && init ) ? pn_d1[1] : 
                    ( pn1_deskew == 10'h2 && init ) ? pn_d2[1] : 
                    ( pn1_deskew == 10'h3 && init ) ? pn_d3[1] : 
                    ( pn1_deskew == 10'h4 && init ) ? pn_d4[1] : 
                    ( pn1_deskew == 10'h5 && init ) ? pn_d5[1] : 
                    ( pn1_deskew == 10'h6 && init ) ? pn_d6[1] : 
                    ( pn1_deskew == 10'h7 && init ) ? pn_d7[1] : 
                    ( pn1_deskew == 10'h8 && init ) ? pn_d8[1] : 
                    ( pn1_deskew == 10'h9 && init ) ? pn_d9[1] : 
                    ( pn1_deskew == 10'ha && init ) ? pn_d10[1] : 
                    ( pn1_deskew == 10'hb && init ) ? pn_d11[1] : 
                    ( pn1_deskew == 10'hc && init ) ? pn_d12[1] : 
                    ( pn1_deskew == 10'hd && init ) ? pn_d13[1] : 
                    ( pn1_deskew == 10'he && init ) ? pn_d14[1] : 
                    ( pn1_deskew == 10'hf && init ) ? pn_d15[1] : 
                    ( pn1_deskew == 10'h10 && init ) ? pn_d16[1] : 
                    ( pn1_deskew == 10'h11 && init ) ? pn_d17[1] : 
                    ( pn1_deskew == 10'h12 && init ) ? pn_d18[1] : 
                    ( pn1_deskew == 10'h13 && init ) ? pn_d19[1] : 
                    ( pn1_deskew == 10'h14 && init ) ? pn_d20[1] : 
                    ( pn1_deskew == 10'h15 && init ) ? pn_d21[1] : 
                    ( pn1_deskew == 10'h16 && init ) ? pn_d22[1] : 
                    ( pn1_deskew == 10'h17 && init ) ? pn_d23[1] : 
                    ( pn1_deskew == 10'h18 && init ) ? pn_d24[1] : 
                    ( pn1_deskew == 10'h19 && init ) ? pn_d25[1] : 
                    ( pn1_deskew == 10'h1a && init ) ? pn_d26[1] : 
                    ( pn1_deskew == 10'h1b && init ) ? pn_d27[1] : 
                    ( pn1_deskew == 10'h1c && init ) ? pn_d28[1] : 
                    ( pn1_deskew == 10'h1d && init ) ? pn_d29[1] : 
                    ( pn1_deskew == 10'h1e && init ) ? pn_d30[1] : 
                    ( pn1_deskew == 10'h1f && init ) ? pn_d31[1] : 
                    ( pn1_deskew == 10'h20 && init ) ? pn_d32[1] : 
                    ( pn1_deskew == 10'h21 && init ) ? pn_d33[1] : 
                    ( pn1_deskew == 10'h22 && init ) ? pn_d34[1] : 
                    ( pn1_deskew == 10'h23 && init ) ? pn_d35[1] : 
                    ( pn1_deskew == 10'h24 && init ) ? pn_d36[1] : 
                    ( pn1_deskew == 10'h25 && init ) ? pn_d37[1] : 
                    ( pn1_deskew == 10'h26 && init ) ? pn_d38[1] : 
                    ( pn1_deskew == 10'h27 && init ) ? pn_d39[1] : 
                    ( pn1_deskew == 10'h28 && init ) ? pn_d40[1] : 
                    ( pn1_deskew == 10'h29 && init ) ? pn_d41[1] : 
                    ( pn1_deskew == 10'h2a && init ) ? pn_d42[1] : 
                    ( pn1_deskew == 10'h2b && init ) ? pn_d43[1] : 
                    ( pn1_deskew == 10'h2c && init ) ? pn_d44[1] : 
                    ( pn1_deskew == 10'h2d && init ) ? pn_d45[1] : 
                    ( pn1_deskew == 10'h2e && init ) ? pn_d46[1] : 
                    ( pn1_deskew == 10'h2f && init ) ? pn_d47[1] : 
                    ( pn1_deskew == 10'h30 && init ) ? pn_d48[1] : 
                    ( pn1_deskew == 10'h31 && init ) ? pn_d49[1] : 
                    ( pn1_deskew == 10'h32 && init ) ? pn_d50[1] : 
                    ( pn1_deskew == 10'h33 && init ) ? pn_d51[1] : 
                    ( pn1_deskew == 10'h34 && init ) ? pn_d52[1] : 
                    ( pn1_deskew == 10'h35 && init ) ? pn_d53[1] : 
                    ( pn1_deskew == 10'h36 && init ) ? pn_d54[1] : 
                    ( pn1_deskew == 10'h37 && init ) ? pn_d55[1] : 
                    ( pn1_deskew == 10'h38 && init ) ? pn_d56[1] : 
                    ( pn1_deskew == 10'h39 && init ) ? pn_d57[1] : 
                    ( pn1_deskew == 10'h3a && init ) ? pn_d58[1] : 
                    ( pn1_deskew == 10'h3b && init ) ? pn_d59[1] : 
                    ( pn1_deskew == 10'h3c && init ) ? pn_d60[1] : 
                    ( pn1_deskew == 10'h3d && init ) ? pn_d61[1] : 
                    ( pn1_deskew == 10'h3e && init ) ? pn_d62[1] : 
                    ( pn1_deskew == 10'h3f && init ) ? pn_d63[1] : 
                    ( pn1_deskew == 10'h40 && init ) ? pn_d64[1] : 
                    ( pn1_deskew == 10'h41 && init ) ? pn_d65[1] : 
                    ( pn1_deskew == 10'h42 && init ) ? pn_d66[1] : 
                    ( pn1_deskew == 10'h43 && init ) ? pn_d67[1] : 
                    ( pn1_deskew == 10'h44 && init ) ? pn_d68[1] : 
                    ( pn1_deskew == 10'h45 && init ) ? pn_d69[1] : 
                    ( pn1_deskew == 10'h46 && init ) ? pn_d70[1] : 
                    ( pn1_deskew == 10'h47 && init ) ? pn_d71[1] : 
                    ( pn1_deskew == 10'h48 && init ) ? pn_d72[1] : 
                    ( pn1_deskew == 10'h49 && init ) ? pn_d73[1] : 
                    ( pn1_deskew == 10'h4a && init ) ? pn_d74[1] : 
                    ( pn1_deskew == 10'h4b && init ) ? pn_d75[1] : 
                    ( pn1_deskew == 10'h4c && init ) ? pn_d76[1] : 
                    ( pn1_deskew == 10'h4d && init ) ? pn_d77[1] : 
                    ( pn1_deskew == 10'h4e && init ) ? pn_d78[1] : 
                    ( pn1_deskew == 10'h4f && init ) ? pn_d79[1] : 
                    ( pn1_deskew == 10'h50 && init ) ? pn_d80[1] : 
                    ( pn1_deskew == 10'h51 && init ) ? pn_d81[1] : 
                    ( pn1_deskew == 10'h52 && init ) ? pn_d82[1] : 
                    ( pn1_deskew == 10'h53 && init ) ? pn_d83[1] : 
                    ( pn1_deskew == 10'h54 && init ) ? pn_d84[1] : 
                    ( pn1_deskew == 10'h55 && init ) ? pn_d85[1] : 
                    ( pn1_deskew == 10'h56 && init ) ? pn_d86[1] : 
                    ( pn1_deskew == 10'h57 && init ) ? pn_d87[1] : 
                    ( pn1_deskew == 10'h58 && init ) ? pn_d88[1] : 
                    ( pn1_deskew == 10'h59 && init ) ? pn_d89[1] : 
                    ( pn1_deskew == 10'h5a && init ) ? pn_d90[1] : 
                    ( pn1_deskew == 10'h5b && init ) ? pn_d91[1] : 
                    ( pn1_deskew == 10'h5c && init ) ? pn_d92[1] : 
                    ( pn1_deskew == 10'h5d && init ) ? pn_d93[1] : 
                    ( pn1_deskew == 10'h5e && init ) ? pn_d94[1] : 
                    ( pn1_deskew == 10'h5f && init ) ? pn_d95[1] : 
                    ( pn1_deskew == 10'h60 && init ) ? pn_d96[1] : 
                    ( pn1_deskew == 10'h61 && init ) ? pn_d97[1] : 
                    ( pn1_deskew == 10'h62 && init ) ? pn_d98[1] : 
                    ( pn1_deskew == 10'h63 && init ) ? pn_d99[1] : 
                    ( pn1_deskew == 10'h64 && init ) ? pn_d100[1] : 
                    ( pn1_deskew == 10'h65 && init ) ? pn_d101[1] : 
                    ( pn1_deskew == 10'h66 && init ) ? pn_d102[1] : 
                    ( pn1_deskew == 10'h67 && init ) ? pn_d103[1] : 
                    ( pn1_deskew == 10'h68 && init ) ? pn_d104[1] : 
                    ( pn1_deskew == 10'h69 && init ) ? pn_d105[1] : 
                    ( pn1_deskew == 10'h6a && init ) ? pn_d106[1] : 
                    ( pn1_deskew == 10'h6b && init ) ? pn_d107[1] : 
                    ( pn1_deskew == 10'h6c && init ) ? pn_d108[1] : 
                    ( pn1_deskew == 10'h6d && init ) ? pn_d109[1] : 
                    ( pn1_deskew == 10'h6e && init ) ? pn_d110[1] : 
                    ( pn1_deskew == 10'h6f && init ) ? pn_d111[1] : 
                    ( pn1_deskew == 10'h70 && init ) ? pn_d112[1] : 
                    ( pn1_deskew == 10'h71 && init ) ? pn_d113[1] : 
                    ( pn1_deskew == 10'h72 && init ) ? pn_d114[1] : 
                    ( pn1_deskew == 10'h73 && init ) ? pn_d115[1] : 
                    ( pn1_deskew == 10'h74 && init ) ? pn_d116[1] : 
                    ( pn1_deskew == 10'h75 && init ) ? pn_d117[1] : 
                    ( pn1_deskew == 10'h76 && init ) ? pn_d118[1] : 
                    ( pn1_deskew == 10'h77 && init ) ? pn_d119[1] : 
                    ( pn1_deskew == 10'h78 && init ) ? pn_d120[1] : 
                    ( pn1_deskew == 10'h79 && init ) ? pn_d121[1] : 
                    ( pn1_deskew == 10'h7a && init ) ? pn_d122[1] : 
                    ( pn1_deskew == 10'h7b && init ) ? pn_d123[1] : 
                    ( pn1_deskew == 10'h7c && init ) ? pn_d124[1] : 
                    ( pn1_deskew == 10'h7d && init ) ? pn_d125[1] : 
                    ( pn1_deskew == 10'h7e && init ) ? pn_d126[1] : 
                    ( pn1_deskew == 10'h7f && init ) ? pn_d127[1] : 
                    ( pn1_deskew == 10'h80 && init ) ? pn_d128[1] : 
                    ( pn1_deskew == 10'h81 && init ) ? pn_d129[1] : 
                    ( pn1_deskew == 10'h82 && init ) ? pn_d130[1] : 
                    ( pn1_deskew == 10'h83 && init ) ? pn_d131[1] : 
                    ( pn1_deskew == 10'h84 && init ) ? pn_d132[1] : 
                    ( pn1_deskew == 10'h85 && init ) ? pn_d133[1] : 
                    ( pn1_deskew == 10'h86 && init ) ? pn_d134[1] : 
                    ( pn1_deskew == 10'h87 && init ) ? pn_d135[1] : 
                    ( pn1_deskew == 10'h88 && init ) ? pn_d136[1] : 
                    ( pn1_deskew == 10'h89 && init ) ? pn_d137[1] : 
                    ( pn1_deskew == 10'h8a && init ) ? pn_d138[1] : 
                    ( pn1_deskew == 10'h8b && init ) ? pn_d139[1] : 
                    ( pn1_deskew == 10'h8c && init ) ? pn_d140[1] : 
                    ( pn1_deskew == 10'h8d && init ) ? pn_d141[1] : 
                    ( pn1_deskew == 10'h8e && init ) ? pn_d142[1] : 
                    ( pn1_deskew == 10'h8f && init ) ? pn_d143[1] : 
                    ( pn1_deskew == 10'h90 && init ) ? pn_d144[1] : 
                    ( pn1_deskew == 10'h91 && init ) ? pn_d145[1] : pn_in[1]; 
assign pn_out_local[2] = ( pn2_deskew == 10'h0 && init ) ? pn_in[2] : 
                    ( pn2_deskew == 10'h1 && init ) ? pn_d1[2] : 
                    ( pn2_deskew == 10'h2 && init ) ? pn_d2[2] : 
                    ( pn2_deskew == 10'h3 && init ) ? pn_d3[2] : 
                    ( pn2_deskew == 10'h4 && init ) ? pn_d4[2] : 
                    ( pn2_deskew == 10'h5 && init ) ? pn_d5[2] : 
                    ( pn2_deskew == 10'h6 && init ) ? pn_d6[2] : 
                    ( pn2_deskew == 10'h7 && init ) ? pn_d7[2] : 
                    ( pn2_deskew == 10'h8 && init ) ? pn_d8[2] : 
                    ( pn2_deskew == 10'h9 && init ) ? pn_d9[2] : 
                    ( pn2_deskew == 10'ha && init ) ? pn_d10[2] : 
                    ( pn2_deskew == 10'hb && init ) ? pn_d11[2] : 
                    ( pn2_deskew == 10'hc && init ) ? pn_d12[2] : 
                    ( pn2_deskew == 10'hd && init ) ? pn_d13[2] : 
                    ( pn2_deskew == 10'he && init ) ? pn_d14[2] : 
                    ( pn2_deskew == 10'hf && init ) ? pn_d15[2] : 
                    ( pn2_deskew == 10'h10 && init ) ? pn_d16[2] : 
                    ( pn2_deskew == 10'h11 && init ) ? pn_d17[2] : 
                    ( pn2_deskew == 10'h12 && init ) ? pn_d18[2] : 
                    ( pn2_deskew == 10'h13 && init ) ? pn_d19[2] : 
                    ( pn2_deskew == 10'h14 && init ) ? pn_d20[2] : 
                    ( pn2_deskew == 10'h15 && init ) ? pn_d21[2] : 
                    ( pn2_deskew == 10'h16 && init ) ? pn_d22[2] : 
                    ( pn2_deskew == 10'h17 && init ) ? pn_d23[2] : 
                    ( pn2_deskew == 10'h18 && init ) ? pn_d24[2] : 
                    ( pn2_deskew == 10'h19 && init ) ? pn_d25[2] : 
                    ( pn2_deskew == 10'h1a && init ) ? pn_d26[2] : 
                    ( pn2_deskew == 10'h1b && init ) ? pn_d27[2] : 
                    ( pn2_deskew == 10'h1c && init ) ? pn_d28[2] : 
                    ( pn2_deskew == 10'h1d && init ) ? pn_d29[2] : 
                    ( pn2_deskew == 10'h1e && init ) ? pn_d30[2] : 
                    ( pn2_deskew == 10'h1f && init ) ? pn_d31[2] : 
                    ( pn2_deskew == 10'h20 && init ) ? pn_d32[2] : 
                    ( pn2_deskew == 10'h21 && init ) ? pn_d33[2] : 
                    ( pn2_deskew == 10'h22 && init ) ? pn_d34[2] : 
                    ( pn2_deskew == 10'h23 && init ) ? pn_d35[2] : 
                    ( pn2_deskew == 10'h24 && init ) ? pn_d36[2] : 
                    ( pn2_deskew == 10'h25 && init ) ? pn_d37[2] : 
                    ( pn2_deskew == 10'h26 && init ) ? pn_d38[2] : 
                    ( pn2_deskew == 10'h27 && init ) ? pn_d39[2] : 
                    ( pn2_deskew == 10'h28 && init ) ? pn_d40[2] : 
                    ( pn2_deskew == 10'h29 && init ) ? pn_d41[2] : 
                    ( pn2_deskew == 10'h2a && init ) ? pn_d42[2] : 
                    ( pn2_deskew == 10'h2b && init ) ? pn_d43[2] : 
                    ( pn2_deskew == 10'h2c && init ) ? pn_d44[2] : 
                    ( pn2_deskew == 10'h2d && init ) ? pn_d45[2] : 
                    ( pn2_deskew == 10'h2e && init ) ? pn_d46[2] : 
                    ( pn2_deskew == 10'h2f && init ) ? pn_d47[2] : 
                    ( pn2_deskew == 10'h30 && init ) ? pn_d48[2] : 
                    ( pn2_deskew == 10'h31 && init ) ? pn_d49[2] : 
                    ( pn2_deskew == 10'h32 && init ) ? pn_d50[2] : 
                    ( pn2_deskew == 10'h33 && init ) ? pn_d51[2] : 
                    ( pn2_deskew == 10'h34 && init ) ? pn_d52[2] : 
                    ( pn2_deskew == 10'h35 && init ) ? pn_d53[2] : 
                    ( pn2_deskew == 10'h36 && init ) ? pn_d54[2] : 
                    ( pn2_deskew == 10'h37 && init ) ? pn_d55[2] : 
                    ( pn2_deskew == 10'h38 && init ) ? pn_d56[2] : 
                    ( pn2_deskew == 10'h39 && init ) ? pn_d57[2] : 
                    ( pn2_deskew == 10'h3a && init ) ? pn_d58[2] : 
                    ( pn2_deskew == 10'h3b && init ) ? pn_d59[2] : 
                    ( pn2_deskew == 10'h3c && init ) ? pn_d60[2] : 
                    ( pn2_deskew == 10'h3d && init ) ? pn_d61[2] : 
                    ( pn2_deskew == 10'h3e && init ) ? pn_d62[2] : 
                    ( pn2_deskew == 10'h3f && init ) ? pn_d63[2] : 
                    ( pn2_deskew == 10'h40 && init ) ? pn_d64[2] : 
                    ( pn2_deskew == 10'h41 && init ) ? pn_d65[2] : 
                    ( pn2_deskew == 10'h42 && init ) ? pn_d66[2] : 
                    ( pn2_deskew == 10'h43 && init ) ? pn_d67[2] : 
                    ( pn2_deskew == 10'h44 && init ) ? pn_d68[2] : 
                    ( pn2_deskew == 10'h45 && init ) ? pn_d69[2] : 
                    ( pn2_deskew == 10'h46 && init ) ? pn_d70[2] : 
                    ( pn2_deskew == 10'h47 && init ) ? pn_d71[2] : 
                    ( pn2_deskew == 10'h48 && init ) ? pn_d72[2] : 
                    ( pn2_deskew == 10'h49 && init ) ? pn_d73[2] : 
                    ( pn2_deskew == 10'h4a && init ) ? pn_d74[2] : 
                    ( pn2_deskew == 10'h4b && init ) ? pn_d75[2] : 
                    ( pn2_deskew == 10'h4c && init ) ? pn_d76[2] : 
                    ( pn2_deskew == 10'h4d && init ) ? pn_d77[2] : 
                    ( pn2_deskew == 10'h4e && init ) ? pn_d78[2] : 
                    ( pn2_deskew == 10'h4f && init ) ? pn_d79[2] : 
                    ( pn2_deskew == 10'h50 && init ) ? pn_d80[2] : 
                    ( pn2_deskew == 10'h51 && init ) ? pn_d81[2] : 
                    ( pn2_deskew == 10'h52 && init ) ? pn_d82[2] : 
                    ( pn2_deskew == 10'h53 && init ) ? pn_d83[2] : 
                    ( pn2_deskew == 10'h54 && init ) ? pn_d84[2] : 
                    ( pn2_deskew == 10'h55 && init ) ? pn_d85[2] : 
                    ( pn2_deskew == 10'h56 && init ) ? pn_d86[2] : 
                    ( pn2_deskew == 10'h57 && init ) ? pn_d87[2] : 
                    ( pn2_deskew == 10'h58 && init ) ? pn_d88[2] : 
                    ( pn2_deskew == 10'h59 && init ) ? pn_d89[2] : 
                    ( pn2_deskew == 10'h5a && init ) ? pn_d90[2] : 
                    ( pn2_deskew == 10'h5b && init ) ? pn_d91[2] : 
                    ( pn2_deskew == 10'h5c && init ) ? pn_d92[2] : 
                    ( pn2_deskew == 10'h5d && init ) ? pn_d93[2] : 
                    ( pn2_deskew == 10'h5e && init ) ? pn_d94[2] : 
                    ( pn2_deskew == 10'h5f && init ) ? pn_d95[2] : 
                    ( pn2_deskew == 10'h60 && init ) ? pn_d96[2] : 
                    ( pn2_deskew == 10'h61 && init ) ? pn_d97[2] : 
                    ( pn2_deskew == 10'h62 && init ) ? pn_d98[2] : 
                    ( pn2_deskew == 10'h63 && init ) ? pn_d99[2] : 
                    ( pn2_deskew == 10'h64 && init ) ? pn_d100[2] : 
                    ( pn2_deskew == 10'h65 && init ) ? pn_d101[2] : 
                    ( pn2_deskew == 10'h66 && init ) ? pn_d102[2] : 
                    ( pn2_deskew == 10'h67 && init ) ? pn_d103[2] : 
                    ( pn2_deskew == 10'h68 && init ) ? pn_d104[2] : 
                    ( pn2_deskew == 10'h69 && init ) ? pn_d105[2] : 
                    ( pn2_deskew == 10'h6a && init ) ? pn_d106[2] : 
                    ( pn2_deskew == 10'h6b && init ) ? pn_d107[2] : 
                    ( pn2_deskew == 10'h6c && init ) ? pn_d108[2] : 
                    ( pn2_deskew == 10'h6d && init ) ? pn_d109[2] : 
                    ( pn2_deskew == 10'h6e && init ) ? pn_d110[2] : 
                    ( pn2_deskew == 10'h6f && init ) ? pn_d111[2] : 
                    ( pn2_deskew == 10'h70 && init ) ? pn_d112[2] : 
                    ( pn2_deskew == 10'h71 && init ) ? pn_d113[2] : 
                    ( pn2_deskew == 10'h72 && init ) ? pn_d114[2] : 
                    ( pn2_deskew == 10'h73 && init ) ? pn_d115[2] : 
                    ( pn2_deskew == 10'h74 && init ) ? pn_d116[2] : 
                    ( pn2_deskew == 10'h75 && init ) ? pn_d117[2] : 
                    ( pn2_deskew == 10'h76 && init ) ? pn_d118[2] : 
                    ( pn2_deskew == 10'h77 && init ) ? pn_d119[2] : 
                    ( pn2_deskew == 10'h78 && init ) ? pn_d120[2] : 
                    ( pn2_deskew == 10'h79 && init ) ? pn_d121[2] : 
                    ( pn2_deskew == 10'h7a && init ) ? pn_d122[2] : 
                    ( pn2_deskew == 10'h7b && init ) ? pn_d123[2] : 
                    ( pn2_deskew == 10'h7c && init ) ? pn_d124[2] : 
                    ( pn2_deskew == 10'h7d && init ) ? pn_d125[2] : 
                    ( pn2_deskew == 10'h7e && init ) ? pn_d126[2] : 
                    ( pn2_deskew == 10'h7f && init ) ? pn_d127[2] : 
                    ( pn2_deskew == 10'h80 && init ) ? pn_d128[2] : 
                    ( pn2_deskew == 10'h81 && init ) ? pn_d129[2] : 
                    ( pn2_deskew == 10'h82 && init ) ? pn_d130[2] : 
                    ( pn2_deskew == 10'h83 && init ) ? pn_d131[2] : 
                    ( pn2_deskew == 10'h84 && init ) ? pn_d132[2] : 
                    ( pn2_deskew == 10'h85 && init ) ? pn_d133[2] : 
                    ( pn2_deskew == 10'h86 && init ) ? pn_d134[2] : 
                    ( pn2_deskew == 10'h87 && init ) ? pn_d135[2] : 
                    ( pn2_deskew == 10'h88 && init ) ? pn_d136[2] : 
                    ( pn2_deskew == 10'h89 && init ) ? pn_d137[2] : 
                    ( pn2_deskew == 10'h8a && init ) ? pn_d138[2] : 
                    ( pn2_deskew == 10'h8b && init ) ? pn_d139[2] : 
                    ( pn2_deskew == 10'h8c && init ) ? pn_d140[2] : 
                    ( pn2_deskew == 10'h8d && init ) ? pn_d141[2] : 
                    ( pn2_deskew == 10'h8e && init ) ? pn_d142[2] : 
                    ( pn2_deskew == 10'h8f && init ) ? pn_d143[2] : 
                    ( pn2_deskew == 10'h90 && init ) ? pn_d144[2] : 
                    ( pn2_deskew == 10'h91 && init ) ? pn_d145[2] : pn_in[2]; 
assign pn_out_local[3] = ( pn3_deskew == 10'h0 && init ) ? pn_in[3] : 
                    ( pn3_deskew == 10'h1 && init ) ? pn_d1[3] : 
                    ( pn3_deskew == 10'h2 && init ) ? pn_d2[3] : 
                    ( pn3_deskew == 10'h3 && init ) ? pn_d3[3] : 
                    ( pn3_deskew == 10'h4 && init ) ? pn_d4[3] : 
                    ( pn3_deskew == 10'h5 && init ) ? pn_d5[3] : 
                    ( pn3_deskew == 10'h6 && init ) ? pn_d6[3] : 
                    ( pn3_deskew == 10'h7 && init ) ? pn_d7[3] : 
                    ( pn3_deskew == 10'h8 && init ) ? pn_d8[3] : 
                    ( pn3_deskew == 10'h9 && init ) ? pn_d9[3] : 
                    ( pn3_deskew == 10'ha && init ) ? pn_d10[3] : 
                    ( pn3_deskew == 10'hb && init ) ? pn_d11[3] : 
                    ( pn3_deskew == 10'hc && init ) ? pn_d12[3] : 
                    ( pn3_deskew == 10'hd && init ) ? pn_d13[3] : 
                    ( pn3_deskew == 10'he && init ) ? pn_d14[3] : 
                    ( pn3_deskew == 10'hf && init ) ? pn_d15[3] : 
                    ( pn3_deskew == 10'h10 && init ) ? pn_d16[3] : 
                    ( pn3_deskew == 10'h11 && init ) ? pn_d17[3] : 
                    ( pn3_deskew == 10'h12 && init ) ? pn_d18[3] : 
                    ( pn3_deskew == 10'h13 && init ) ? pn_d19[3] : 
                    ( pn3_deskew == 10'h14 && init ) ? pn_d20[3] : 
                    ( pn3_deskew == 10'h15 && init ) ? pn_d21[3] : 
                    ( pn3_deskew == 10'h16 && init ) ? pn_d22[3] : 
                    ( pn3_deskew == 10'h17 && init ) ? pn_d23[3] : 
                    ( pn3_deskew == 10'h18 && init ) ? pn_d24[3] : 
                    ( pn3_deskew == 10'h19 && init ) ? pn_d25[3] : 
                    ( pn3_deskew == 10'h1a && init ) ? pn_d26[3] : 
                    ( pn3_deskew == 10'h1b && init ) ? pn_d27[3] : 
                    ( pn3_deskew == 10'h1c && init ) ? pn_d28[3] : 
                    ( pn3_deskew == 10'h1d && init ) ? pn_d29[3] : 
                    ( pn3_deskew == 10'h1e && init ) ? pn_d30[3] : 
                    ( pn3_deskew == 10'h1f && init ) ? pn_d31[3] : 
                    ( pn3_deskew == 10'h20 && init ) ? pn_d32[3] : 
                    ( pn3_deskew == 10'h21 && init ) ? pn_d33[3] : 
                    ( pn3_deskew == 10'h22 && init ) ? pn_d34[3] : 
                    ( pn3_deskew == 10'h23 && init ) ? pn_d35[3] : 
                    ( pn3_deskew == 10'h24 && init ) ? pn_d36[3] : 
                    ( pn3_deskew == 10'h25 && init ) ? pn_d37[3] : 
                    ( pn3_deskew == 10'h26 && init ) ? pn_d38[3] : 
                    ( pn3_deskew == 10'h27 && init ) ? pn_d39[3] : 
                    ( pn3_deskew == 10'h28 && init ) ? pn_d40[3] : 
                    ( pn3_deskew == 10'h29 && init ) ? pn_d41[3] : 
                    ( pn3_deskew == 10'h2a && init ) ? pn_d42[3] : 
                    ( pn3_deskew == 10'h2b && init ) ? pn_d43[3] : 
                    ( pn3_deskew == 10'h2c && init ) ? pn_d44[3] : 
                    ( pn3_deskew == 10'h2d && init ) ? pn_d45[3] : 
                    ( pn3_deskew == 10'h2e && init ) ? pn_d46[3] : 
                    ( pn3_deskew == 10'h2f && init ) ? pn_d47[3] : 
                    ( pn3_deskew == 10'h30 && init ) ? pn_d48[3] : 
                    ( pn3_deskew == 10'h31 && init ) ? pn_d49[3] : 
                    ( pn3_deskew == 10'h32 && init ) ? pn_d50[3] : 
                    ( pn3_deskew == 10'h33 && init ) ? pn_d51[3] : 
                    ( pn3_deskew == 10'h34 && init ) ? pn_d52[3] : 
                    ( pn3_deskew == 10'h35 && init ) ? pn_d53[3] : 
                    ( pn3_deskew == 10'h36 && init ) ? pn_d54[3] : 
                    ( pn3_deskew == 10'h37 && init ) ? pn_d55[3] : 
                    ( pn3_deskew == 10'h38 && init ) ? pn_d56[3] : 
                    ( pn3_deskew == 10'h39 && init ) ? pn_d57[3] : 
                    ( pn3_deskew == 10'h3a && init ) ? pn_d58[3] : 
                    ( pn3_deskew == 10'h3b && init ) ? pn_d59[3] : 
                    ( pn3_deskew == 10'h3c && init ) ? pn_d60[3] : 
                    ( pn3_deskew == 10'h3d && init ) ? pn_d61[3] : 
                    ( pn3_deskew == 10'h3e && init ) ? pn_d62[3] : 
                    ( pn3_deskew == 10'h3f && init ) ? pn_d63[3] : 
                    ( pn3_deskew == 10'h40 && init ) ? pn_d64[3] : 
                    ( pn3_deskew == 10'h41 && init ) ? pn_d65[3] : 
                    ( pn3_deskew == 10'h42 && init ) ? pn_d66[3] : 
                    ( pn3_deskew == 10'h43 && init ) ? pn_d67[3] : 
                    ( pn3_deskew == 10'h44 && init ) ? pn_d68[3] : 
                    ( pn3_deskew == 10'h45 && init ) ? pn_d69[3] : 
                    ( pn3_deskew == 10'h46 && init ) ? pn_d70[3] : 
                    ( pn3_deskew == 10'h47 && init ) ? pn_d71[3] : 
                    ( pn3_deskew == 10'h48 && init ) ? pn_d72[3] : 
                    ( pn3_deskew == 10'h49 && init ) ? pn_d73[3] : 
                    ( pn3_deskew == 10'h4a && init ) ? pn_d74[3] : 
                    ( pn3_deskew == 10'h4b && init ) ? pn_d75[3] : 
                    ( pn3_deskew == 10'h4c && init ) ? pn_d76[3] : 
                    ( pn3_deskew == 10'h4d && init ) ? pn_d77[3] : 
                    ( pn3_deskew == 10'h4e && init ) ? pn_d78[3] : 
                    ( pn3_deskew == 10'h4f && init ) ? pn_d79[3] : 
                    ( pn3_deskew == 10'h50 && init ) ? pn_d80[3] : 
                    ( pn3_deskew == 10'h51 && init ) ? pn_d81[3] : 
                    ( pn3_deskew == 10'h52 && init ) ? pn_d82[3] : 
                    ( pn3_deskew == 10'h53 && init ) ? pn_d83[3] : 
                    ( pn3_deskew == 10'h54 && init ) ? pn_d84[3] : 
                    ( pn3_deskew == 10'h55 && init ) ? pn_d85[3] : 
                    ( pn3_deskew == 10'h56 && init ) ? pn_d86[3] : 
                    ( pn3_deskew == 10'h57 && init ) ? pn_d87[3] : 
                    ( pn3_deskew == 10'h58 && init ) ? pn_d88[3] : 
                    ( pn3_deskew == 10'h59 && init ) ? pn_d89[3] : 
                    ( pn3_deskew == 10'h5a && init ) ? pn_d90[3] : 
                    ( pn3_deskew == 10'h5b && init ) ? pn_d91[3] : 
                    ( pn3_deskew == 10'h5c && init ) ? pn_d92[3] : 
                    ( pn3_deskew == 10'h5d && init ) ? pn_d93[3] : 
                    ( pn3_deskew == 10'h5e && init ) ? pn_d94[3] : 
                    ( pn3_deskew == 10'h5f && init ) ? pn_d95[3] : 
                    ( pn3_deskew == 10'h60 && init ) ? pn_d96[3] : 
                    ( pn3_deskew == 10'h61 && init ) ? pn_d97[3] : 
                    ( pn3_deskew == 10'h62 && init ) ? pn_d98[3] : 
                    ( pn3_deskew == 10'h63 && init ) ? pn_d99[3] : 
                    ( pn3_deskew == 10'h64 && init ) ? pn_d100[3] : 
                    ( pn3_deskew == 10'h65 && init ) ? pn_d101[3] : 
                    ( pn3_deskew == 10'h66 && init ) ? pn_d102[3] : 
                    ( pn3_deskew == 10'h67 && init ) ? pn_d103[3] : 
                    ( pn3_deskew == 10'h68 && init ) ? pn_d104[3] : 
                    ( pn3_deskew == 10'h69 && init ) ? pn_d105[3] : 
                    ( pn3_deskew == 10'h6a && init ) ? pn_d106[3] : 
                    ( pn3_deskew == 10'h6b && init ) ? pn_d107[3] : 
                    ( pn3_deskew == 10'h6c && init ) ? pn_d108[3] : 
                    ( pn3_deskew == 10'h6d && init ) ? pn_d109[3] : 
                    ( pn3_deskew == 10'h6e && init ) ? pn_d110[3] : 
                    ( pn3_deskew == 10'h6f && init ) ? pn_d111[3] : 
                    ( pn3_deskew == 10'h70 && init ) ? pn_d112[3] : 
                    ( pn3_deskew == 10'h71 && init ) ? pn_d113[3] : 
                    ( pn3_deskew == 10'h72 && init ) ? pn_d114[3] : 
                    ( pn3_deskew == 10'h73 && init ) ? pn_d115[3] : 
                    ( pn3_deskew == 10'h74 && init ) ? pn_d116[3] : 
                    ( pn3_deskew == 10'h75 && init ) ? pn_d117[3] : 
                    ( pn3_deskew == 10'h76 && init ) ? pn_d118[3] : 
                    ( pn3_deskew == 10'h77 && init ) ? pn_d119[3] : 
                    ( pn3_deskew == 10'h78 && init ) ? pn_d120[3] : 
                    ( pn3_deskew == 10'h79 && init ) ? pn_d121[3] : 
                    ( pn3_deskew == 10'h7a && init ) ? pn_d122[3] : 
                    ( pn3_deskew == 10'h7b && init ) ? pn_d123[3] : 
                    ( pn3_deskew == 10'h7c && init ) ? pn_d124[3] : 
                    ( pn3_deskew == 10'h7d && init ) ? pn_d125[3] : 
                    ( pn3_deskew == 10'h7e && init ) ? pn_d126[3] : 
                    ( pn3_deskew == 10'h7f && init ) ? pn_d127[3] : 
                    ( pn3_deskew == 10'h80 && init ) ? pn_d128[3] : 
                    ( pn3_deskew == 10'h81 && init ) ? pn_d129[3] : 
                    ( pn3_deskew == 10'h82 && init ) ? pn_d130[3] : 
                    ( pn3_deskew == 10'h83 && init ) ? pn_d131[3] : 
                    ( pn3_deskew == 10'h84 && init ) ? pn_d132[3] : 
                    ( pn3_deskew == 10'h85 && init ) ? pn_d133[3] : 
                    ( pn3_deskew == 10'h86 && init ) ? pn_d134[3] : 
                    ( pn3_deskew == 10'h87 && init ) ? pn_d135[3] : 
                    ( pn3_deskew == 10'h88 && init ) ? pn_d136[3] : 
                    ( pn3_deskew == 10'h89 && init ) ? pn_d137[3] : 
                    ( pn3_deskew == 10'h8a && init ) ? pn_d138[3] : 
                    ( pn3_deskew == 10'h8b && init ) ? pn_d139[3] : 
                    ( pn3_deskew == 10'h8c && init ) ? pn_d140[3] : 
                    ( pn3_deskew == 10'h8d && init ) ? pn_d141[3] : 
                    ( pn3_deskew == 10'h8e && init ) ? pn_d142[3] : 
                    ( pn3_deskew == 10'h8f && init ) ? pn_d143[3] : 
                    ( pn3_deskew == 10'h90 && init ) ? pn_d144[3] : 
                    ( pn3_deskew == 10'h91 && init ) ? pn_d145[3] : pn_in[3]; 
assign pn_out_local[4] = ( pn4_deskew == 10'h0 && init ) ? pn_in[4] : 
                    ( pn4_deskew == 10'h1 && init ) ? pn_d1[4] : 
                    ( pn4_deskew == 10'h2 && init ) ? pn_d2[4] : 
                    ( pn4_deskew == 10'h3 && init ) ? pn_d3[4] : 
                    ( pn4_deskew == 10'h4 && init ) ? pn_d4[4] : 
                    ( pn4_deskew == 10'h5 && init ) ? pn_d5[4] : 
                    ( pn4_deskew == 10'h6 && init ) ? pn_d6[4] : 
                    ( pn4_deskew == 10'h7 && init ) ? pn_d7[4] : 
                    ( pn4_deskew == 10'h8 && init ) ? pn_d8[4] : 
                    ( pn4_deskew == 10'h9 && init ) ? pn_d9[4] : 
                    ( pn4_deskew == 10'ha && init ) ? pn_d10[4] : 
                    ( pn4_deskew == 10'hb && init ) ? pn_d11[4] : 
                    ( pn4_deskew == 10'hc && init ) ? pn_d12[4] : 
                    ( pn4_deskew == 10'hd && init ) ? pn_d13[4] : 
                    ( pn4_deskew == 10'he && init ) ? pn_d14[4] : 
                    ( pn4_deskew == 10'hf && init ) ? pn_d15[4] : 
                    ( pn4_deskew == 10'h10 && init ) ? pn_d16[4] : 
                    ( pn4_deskew == 10'h11 && init ) ? pn_d17[4] : 
                    ( pn4_deskew == 10'h12 && init ) ? pn_d18[4] : 
                    ( pn4_deskew == 10'h13 && init ) ? pn_d19[4] : 
                    ( pn4_deskew == 10'h14 && init ) ? pn_d20[4] : 
                    ( pn4_deskew == 10'h15 && init ) ? pn_d21[4] : 
                    ( pn4_deskew == 10'h16 && init ) ? pn_d22[4] : 
                    ( pn4_deskew == 10'h17 && init ) ? pn_d23[4] : 
                    ( pn4_deskew == 10'h18 && init ) ? pn_d24[4] : 
                    ( pn4_deskew == 10'h19 && init ) ? pn_d25[4] : 
                    ( pn4_deskew == 10'h1a && init ) ? pn_d26[4] : 
                    ( pn4_deskew == 10'h1b && init ) ? pn_d27[4] : 
                    ( pn4_deskew == 10'h1c && init ) ? pn_d28[4] : 
                    ( pn4_deskew == 10'h1d && init ) ? pn_d29[4] : 
                    ( pn4_deskew == 10'h1e && init ) ? pn_d30[4] : 
                    ( pn4_deskew == 10'h1f && init ) ? pn_d31[4] : 
                    ( pn4_deskew == 10'h20 && init ) ? pn_d32[4] : 
                    ( pn4_deskew == 10'h21 && init ) ? pn_d33[4] : 
                    ( pn4_deskew == 10'h22 && init ) ? pn_d34[4] : 
                    ( pn4_deskew == 10'h23 && init ) ? pn_d35[4] : 
                    ( pn4_deskew == 10'h24 && init ) ? pn_d36[4] : 
                    ( pn4_deskew == 10'h25 && init ) ? pn_d37[4] : 
                    ( pn4_deskew == 10'h26 && init ) ? pn_d38[4] : 
                    ( pn4_deskew == 10'h27 && init ) ? pn_d39[4] : 
                    ( pn4_deskew == 10'h28 && init ) ? pn_d40[4] : 
                    ( pn4_deskew == 10'h29 && init ) ? pn_d41[4] : 
                    ( pn4_deskew == 10'h2a && init ) ? pn_d42[4] : 
                    ( pn4_deskew == 10'h2b && init ) ? pn_d43[4] : 
                    ( pn4_deskew == 10'h2c && init ) ? pn_d44[4] : 
                    ( pn4_deskew == 10'h2d && init ) ? pn_d45[4] : 
                    ( pn4_deskew == 10'h2e && init ) ? pn_d46[4] : 
                    ( pn4_deskew == 10'h2f && init ) ? pn_d47[4] : 
                    ( pn4_deskew == 10'h30 && init ) ? pn_d48[4] : 
                    ( pn4_deskew == 10'h31 && init ) ? pn_d49[4] : 
                    ( pn4_deskew == 10'h32 && init ) ? pn_d50[4] : 
                    ( pn4_deskew == 10'h33 && init ) ? pn_d51[4] : 
                    ( pn4_deskew == 10'h34 && init ) ? pn_d52[4] : 
                    ( pn4_deskew == 10'h35 && init ) ? pn_d53[4] : 
                    ( pn4_deskew == 10'h36 && init ) ? pn_d54[4] : 
                    ( pn4_deskew == 10'h37 && init ) ? pn_d55[4] : 
                    ( pn4_deskew == 10'h38 && init ) ? pn_d56[4] : 
                    ( pn4_deskew == 10'h39 && init ) ? pn_d57[4] : 
                    ( pn4_deskew == 10'h3a && init ) ? pn_d58[4] : 
                    ( pn4_deskew == 10'h3b && init ) ? pn_d59[4] : 
                    ( pn4_deskew == 10'h3c && init ) ? pn_d60[4] : 
                    ( pn4_deskew == 10'h3d && init ) ? pn_d61[4] : 
                    ( pn4_deskew == 10'h3e && init ) ? pn_d62[4] : 
                    ( pn4_deskew == 10'h3f && init ) ? pn_d63[4] : 
                    ( pn4_deskew == 10'h40 && init ) ? pn_d64[4] : 
                    ( pn4_deskew == 10'h41 && init ) ? pn_d65[4] : 
                    ( pn4_deskew == 10'h42 && init ) ? pn_d66[4] : 
                    ( pn4_deskew == 10'h43 && init ) ? pn_d67[4] : 
                    ( pn4_deskew == 10'h44 && init ) ? pn_d68[4] : 
                    ( pn4_deskew == 10'h45 && init ) ? pn_d69[4] : 
                    ( pn4_deskew == 10'h46 && init ) ? pn_d70[4] : 
                    ( pn4_deskew == 10'h47 && init ) ? pn_d71[4] : 
                    ( pn4_deskew == 10'h48 && init ) ? pn_d72[4] : 
                    ( pn4_deskew == 10'h49 && init ) ? pn_d73[4] : 
                    ( pn4_deskew == 10'h4a && init ) ? pn_d74[4] : 
                    ( pn4_deskew == 10'h4b && init ) ? pn_d75[4] : 
                    ( pn4_deskew == 10'h4c && init ) ? pn_d76[4] : 
                    ( pn4_deskew == 10'h4d && init ) ? pn_d77[4] : 
                    ( pn4_deskew == 10'h4e && init ) ? pn_d78[4] : 
                    ( pn4_deskew == 10'h4f && init ) ? pn_d79[4] : 
                    ( pn4_deskew == 10'h50 && init ) ? pn_d80[4] : 
                    ( pn4_deskew == 10'h51 && init ) ? pn_d81[4] : 
                    ( pn4_deskew == 10'h52 && init ) ? pn_d82[4] : 
                    ( pn4_deskew == 10'h53 && init ) ? pn_d83[4] : 
                    ( pn4_deskew == 10'h54 && init ) ? pn_d84[4] : 
                    ( pn4_deskew == 10'h55 && init ) ? pn_d85[4] : 
                    ( pn4_deskew == 10'h56 && init ) ? pn_d86[4] : 
                    ( pn4_deskew == 10'h57 && init ) ? pn_d87[4] : 
                    ( pn4_deskew == 10'h58 && init ) ? pn_d88[4] : 
                    ( pn4_deskew == 10'h59 && init ) ? pn_d89[4] : 
                    ( pn4_deskew == 10'h5a && init ) ? pn_d90[4] : 
                    ( pn4_deskew == 10'h5b && init ) ? pn_d91[4] : 
                    ( pn4_deskew == 10'h5c && init ) ? pn_d92[4] : 
                    ( pn4_deskew == 10'h5d && init ) ? pn_d93[4] : 
                    ( pn4_deskew == 10'h5e && init ) ? pn_d94[4] : 
                    ( pn4_deskew == 10'h5f && init ) ? pn_d95[4] : 
                    ( pn4_deskew == 10'h60 && init ) ? pn_d96[4] : 
                    ( pn4_deskew == 10'h61 && init ) ? pn_d97[4] : 
                    ( pn4_deskew == 10'h62 && init ) ? pn_d98[4] : 
                    ( pn4_deskew == 10'h63 && init ) ? pn_d99[4] : 
                    ( pn4_deskew == 10'h64 && init ) ? pn_d100[4] : 
                    ( pn4_deskew == 10'h65 && init ) ? pn_d101[4] : 
                    ( pn4_deskew == 10'h66 && init ) ? pn_d102[4] : 
                    ( pn4_deskew == 10'h67 && init ) ? pn_d103[4] : 
                    ( pn4_deskew == 10'h68 && init ) ? pn_d104[4] : 
                    ( pn4_deskew == 10'h69 && init ) ? pn_d105[4] : 
                    ( pn4_deskew == 10'h6a && init ) ? pn_d106[4] : 
                    ( pn4_deskew == 10'h6b && init ) ? pn_d107[4] : 
                    ( pn4_deskew == 10'h6c && init ) ? pn_d108[4] : 
                    ( pn4_deskew == 10'h6d && init ) ? pn_d109[4] : 
                    ( pn4_deskew == 10'h6e && init ) ? pn_d110[4] : 
                    ( pn4_deskew == 10'h6f && init ) ? pn_d111[4] : 
                    ( pn4_deskew == 10'h70 && init ) ? pn_d112[4] : 
                    ( pn4_deskew == 10'h71 && init ) ? pn_d113[4] : 
                    ( pn4_deskew == 10'h72 && init ) ? pn_d114[4] : 
                    ( pn4_deskew == 10'h73 && init ) ? pn_d115[4] : 
                    ( pn4_deskew == 10'h74 && init ) ? pn_d116[4] : 
                    ( pn4_deskew == 10'h75 && init ) ? pn_d117[4] : 
                    ( pn4_deskew == 10'h76 && init ) ? pn_d118[4] : 
                    ( pn4_deskew == 10'h77 && init ) ? pn_d119[4] : 
                    ( pn4_deskew == 10'h78 && init ) ? pn_d120[4] : 
                    ( pn4_deskew == 10'h79 && init ) ? pn_d121[4] : 
                    ( pn4_deskew == 10'h7a && init ) ? pn_d122[4] : 
                    ( pn4_deskew == 10'h7b && init ) ? pn_d123[4] : 
                    ( pn4_deskew == 10'h7c && init ) ? pn_d124[4] : 
                    ( pn4_deskew == 10'h7d && init ) ? pn_d125[4] : 
                    ( pn4_deskew == 10'h7e && init ) ? pn_d126[4] : 
                    ( pn4_deskew == 10'h7f && init ) ? pn_d127[4] : 
                    ( pn4_deskew == 10'h80 && init ) ? pn_d128[4] : 
                    ( pn4_deskew == 10'h81 && init ) ? pn_d129[4] : 
                    ( pn4_deskew == 10'h82 && init ) ? pn_d130[4] : 
                    ( pn4_deskew == 10'h83 && init ) ? pn_d131[4] : 
                    ( pn4_deskew == 10'h84 && init ) ? pn_d132[4] : 
                    ( pn4_deskew == 10'h85 && init ) ? pn_d133[4] : 
                    ( pn4_deskew == 10'h86 && init ) ? pn_d134[4] : 
                    ( pn4_deskew == 10'h87 && init ) ? pn_d135[4] : 
                    ( pn4_deskew == 10'h88 && init ) ? pn_d136[4] : 
                    ( pn4_deskew == 10'h89 && init ) ? pn_d137[4] : 
                    ( pn4_deskew == 10'h8a && init ) ? pn_d138[4] : 
                    ( pn4_deskew == 10'h8b && init ) ? pn_d139[4] : 
                    ( pn4_deskew == 10'h8c && init ) ? pn_d140[4] : 
                    ( pn4_deskew == 10'h8d && init ) ? pn_d141[4] : 
                    ( pn4_deskew == 10'h8e && init ) ? pn_d142[4] : 
                    ( pn4_deskew == 10'h8f && init ) ? pn_d143[4] : 
                    ( pn4_deskew == 10'h90 && init ) ? pn_d144[4] : 
                    ( pn4_deskew == 10'h91 && init ) ? pn_d145[4] : pn_in[4]; 
assign pn_out_local[5] = ( pn5_deskew == 10'h0 && init ) ? pn_in[5] : 
                    ( pn5_deskew == 10'h1 && init ) ? pn_d1[5] : 
                    ( pn5_deskew == 10'h2 && init ) ? pn_d2[5] : 
                    ( pn5_deskew == 10'h3 && init ) ? pn_d3[5] : 
                    ( pn5_deskew == 10'h4 && init ) ? pn_d4[5] : 
                    ( pn5_deskew == 10'h5 && init ) ? pn_d5[5] : 
                    ( pn5_deskew == 10'h6 && init ) ? pn_d6[5] : 
                    ( pn5_deskew == 10'h7 && init ) ? pn_d7[5] : 
                    ( pn5_deskew == 10'h8 && init ) ? pn_d8[5] : 
                    ( pn5_deskew == 10'h9 && init ) ? pn_d9[5] : 
                    ( pn5_deskew == 10'ha && init ) ? pn_d10[5] : 
                    ( pn5_deskew == 10'hb && init ) ? pn_d11[5] : 
                    ( pn5_deskew == 10'hc && init ) ? pn_d12[5] : 
                    ( pn5_deskew == 10'hd && init ) ? pn_d13[5] : 
                    ( pn5_deskew == 10'he && init ) ? pn_d14[5] : 
                    ( pn5_deskew == 10'hf && init ) ? pn_d15[5] : 
                    ( pn5_deskew == 10'h10 && init ) ? pn_d16[5] : 
                    ( pn5_deskew == 10'h11 && init ) ? pn_d17[5] : 
                    ( pn5_deskew == 10'h12 && init ) ? pn_d18[5] : 
                    ( pn5_deskew == 10'h13 && init ) ? pn_d19[5] : 
                    ( pn5_deskew == 10'h14 && init ) ? pn_d20[5] : 
                    ( pn5_deskew == 10'h15 && init ) ? pn_d21[5] : 
                    ( pn5_deskew == 10'h16 && init ) ? pn_d22[5] : 
                    ( pn5_deskew == 10'h17 && init ) ? pn_d23[5] : 
                    ( pn5_deskew == 10'h18 && init ) ? pn_d24[5] : 
                    ( pn5_deskew == 10'h19 && init ) ? pn_d25[5] : 
                    ( pn5_deskew == 10'h1a && init ) ? pn_d26[5] : 
                    ( pn5_deskew == 10'h1b && init ) ? pn_d27[5] : 
                    ( pn5_deskew == 10'h1c && init ) ? pn_d28[5] : 
                    ( pn5_deskew == 10'h1d && init ) ? pn_d29[5] : 
                    ( pn5_deskew == 10'h1e && init ) ? pn_d30[5] : 
                    ( pn5_deskew == 10'h1f && init ) ? pn_d31[5] : 
                    ( pn5_deskew == 10'h20 && init ) ? pn_d32[5] : 
                    ( pn5_deskew == 10'h21 && init ) ? pn_d33[5] : 
                    ( pn5_deskew == 10'h22 && init ) ? pn_d34[5] : 
                    ( pn5_deskew == 10'h23 && init ) ? pn_d35[5] : 
                    ( pn5_deskew == 10'h24 && init ) ? pn_d36[5] : 
                    ( pn5_deskew == 10'h25 && init ) ? pn_d37[5] : 
                    ( pn5_deskew == 10'h26 && init ) ? pn_d38[5] : 
                    ( pn5_deskew == 10'h27 && init ) ? pn_d39[5] : 
                    ( pn5_deskew == 10'h28 && init ) ? pn_d40[5] : 
                    ( pn5_deskew == 10'h29 && init ) ? pn_d41[5] : 
                    ( pn5_deskew == 10'h2a && init ) ? pn_d42[5] : 
                    ( pn5_deskew == 10'h2b && init ) ? pn_d43[5] : 
                    ( pn5_deskew == 10'h2c && init ) ? pn_d44[5] : 
                    ( pn5_deskew == 10'h2d && init ) ? pn_d45[5] : 
                    ( pn5_deskew == 10'h2e && init ) ? pn_d46[5] : 
                    ( pn5_deskew == 10'h2f && init ) ? pn_d47[5] : 
                    ( pn5_deskew == 10'h30 && init ) ? pn_d48[5] : 
                    ( pn5_deskew == 10'h31 && init ) ? pn_d49[5] : 
                    ( pn5_deskew == 10'h32 && init ) ? pn_d50[5] : 
                    ( pn5_deskew == 10'h33 && init ) ? pn_d51[5] : 
                    ( pn5_deskew == 10'h34 && init ) ? pn_d52[5] : 
                    ( pn5_deskew == 10'h35 && init ) ? pn_d53[5] : 
                    ( pn5_deskew == 10'h36 && init ) ? pn_d54[5] : 
                    ( pn5_deskew == 10'h37 && init ) ? pn_d55[5] : 
                    ( pn5_deskew == 10'h38 && init ) ? pn_d56[5] : 
                    ( pn5_deskew == 10'h39 && init ) ? pn_d57[5] : 
                    ( pn5_deskew == 10'h3a && init ) ? pn_d58[5] : 
                    ( pn5_deskew == 10'h3b && init ) ? pn_d59[5] : 
                    ( pn5_deskew == 10'h3c && init ) ? pn_d60[5] : 
                    ( pn5_deskew == 10'h3d && init ) ? pn_d61[5] : 
                    ( pn5_deskew == 10'h3e && init ) ? pn_d62[5] : 
                    ( pn5_deskew == 10'h3f && init ) ? pn_d63[5] : 
                    ( pn5_deskew == 10'h40 && init ) ? pn_d64[5] : 
                    ( pn5_deskew == 10'h41 && init ) ? pn_d65[5] : 
                    ( pn5_deskew == 10'h42 && init ) ? pn_d66[5] : 
                    ( pn5_deskew == 10'h43 && init ) ? pn_d67[5] : 
                    ( pn5_deskew == 10'h44 && init ) ? pn_d68[5] : 
                    ( pn5_deskew == 10'h45 && init ) ? pn_d69[5] : 
                    ( pn5_deskew == 10'h46 && init ) ? pn_d70[5] : 
                    ( pn5_deskew == 10'h47 && init ) ? pn_d71[5] : 
                    ( pn5_deskew == 10'h48 && init ) ? pn_d72[5] : 
                    ( pn5_deskew == 10'h49 && init ) ? pn_d73[5] : 
                    ( pn5_deskew == 10'h4a && init ) ? pn_d74[5] : 
                    ( pn5_deskew == 10'h4b && init ) ? pn_d75[5] : 
                    ( pn5_deskew == 10'h4c && init ) ? pn_d76[5] : 
                    ( pn5_deskew == 10'h4d && init ) ? pn_d77[5] : 
                    ( pn5_deskew == 10'h4e && init ) ? pn_d78[5] : 
                    ( pn5_deskew == 10'h4f && init ) ? pn_d79[5] : 
                    ( pn5_deskew == 10'h50 && init ) ? pn_d80[5] : 
                    ( pn5_deskew == 10'h51 && init ) ? pn_d81[5] : 
                    ( pn5_deskew == 10'h52 && init ) ? pn_d82[5] : 
                    ( pn5_deskew == 10'h53 && init ) ? pn_d83[5] : 
                    ( pn5_deskew == 10'h54 && init ) ? pn_d84[5] : 
                    ( pn5_deskew == 10'h55 && init ) ? pn_d85[5] : 
                    ( pn5_deskew == 10'h56 && init ) ? pn_d86[5] : 
                    ( pn5_deskew == 10'h57 && init ) ? pn_d87[5] : 
                    ( pn5_deskew == 10'h58 && init ) ? pn_d88[5] : 
                    ( pn5_deskew == 10'h59 && init ) ? pn_d89[5] : 
                    ( pn5_deskew == 10'h5a && init ) ? pn_d90[5] : 
                    ( pn5_deskew == 10'h5b && init ) ? pn_d91[5] : 
                    ( pn5_deskew == 10'h5c && init ) ? pn_d92[5] : 
                    ( pn5_deskew == 10'h5d && init ) ? pn_d93[5] : 
                    ( pn5_deskew == 10'h5e && init ) ? pn_d94[5] : 
                    ( pn5_deskew == 10'h5f && init ) ? pn_d95[5] : 
                    ( pn5_deskew == 10'h60 && init ) ? pn_d96[5] : 
                    ( pn5_deskew == 10'h61 && init ) ? pn_d97[5] : 
                    ( pn5_deskew == 10'h62 && init ) ? pn_d98[5] : 
                    ( pn5_deskew == 10'h63 && init ) ? pn_d99[5] : 
                    ( pn5_deskew == 10'h64 && init ) ? pn_d100[5] : 
                    ( pn5_deskew == 10'h65 && init ) ? pn_d101[5] : 
                    ( pn5_deskew == 10'h66 && init ) ? pn_d102[5] : 
                    ( pn5_deskew == 10'h67 && init ) ? pn_d103[5] : 
                    ( pn5_deskew == 10'h68 && init ) ? pn_d104[5] : 
                    ( pn5_deskew == 10'h69 && init ) ? pn_d105[5] : 
                    ( pn5_deskew == 10'h6a && init ) ? pn_d106[5] : 
                    ( pn5_deskew == 10'h6b && init ) ? pn_d107[5] : 
                    ( pn5_deskew == 10'h6c && init ) ? pn_d108[5] : 
                    ( pn5_deskew == 10'h6d && init ) ? pn_d109[5] : 
                    ( pn5_deskew == 10'h6e && init ) ? pn_d110[5] : 
                    ( pn5_deskew == 10'h6f && init ) ? pn_d111[5] : 
                    ( pn5_deskew == 10'h70 && init ) ? pn_d112[5] : 
                    ( pn5_deskew == 10'h71 && init ) ? pn_d113[5] : 
                    ( pn5_deskew == 10'h72 && init ) ? pn_d114[5] : 
                    ( pn5_deskew == 10'h73 && init ) ? pn_d115[5] : 
                    ( pn5_deskew == 10'h74 && init ) ? pn_d116[5] : 
                    ( pn5_deskew == 10'h75 && init ) ? pn_d117[5] : 
                    ( pn5_deskew == 10'h76 && init ) ? pn_d118[5] : 
                    ( pn5_deskew == 10'h77 && init ) ? pn_d119[5] : 
                    ( pn5_deskew == 10'h78 && init ) ? pn_d120[5] : 
                    ( pn5_deskew == 10'h79 && init ) ? pn_d121[5] : 
                    ( pn5_deskew == 10'h7a && init ) ? pn_d122[5] : 
                    ( pn5_deskew == 10'h7b && init ) ? pn_d123[5] : 
                    ( pn5_deskew == 10'h7c && init ) ? pn_d124[5] : 
                    ( pn5_deskew == 10'h7d && init ) ? pn_d125[5] : 
                    ( pn5_deskew == 10'h7e && init ) ? pn_d126[5] : 
                    ( pn5_deskew == 10'h7f && init ) ? pn_d127[5] : 
                    ( pn5_deskew == 10'h80 && init ) ? pn_d128[5] : 
                    ( pn5_deskew == 10'h81 && init ) ? pn_d129[5] : 
                    ( pn5_deskew == 10'h82 && init ) ? pn_d130[5] : 
                    ( pn5_deskew == 10'h83 && init ) ? pn_d131[5] : 
                    ( pn5_deskew == 10'h84 && init ) ? pn_d132[5] : 
                    ( pn5_deskew == 10'h85 && init ) ? pn_d133[5] : 
                    ( pn5_deskew == 10'h86 && init ) ? pn_d134[5] : 
                    ( pn5_deskew == 10'h87 && init ) ? pn_d135[5] : 
                    ( pn5_deskew == 10'h88 && init ) ? pn_d136[5] : 
                    ( pn5_deskew == 10'h89 && init ) ? pn_d137[5] : 
                    ( pn5_deskew == 10'h8a && init ) ? pn_d138[5] : 
                    ( pn5_deskew == 10'h8b && init ) ? pn_d139[5] : 
                    ( pn5_deskew == 10'h8c && init ) ? pn_d140[5] : 
                    ( pn5_deskew == 10'h8d && init ) ? pn_d141[5] : 
                    ( pn5_deskew == 10'h8e && init ) ? pn_d142[5] : 
                    ( pn5_deskew == 10'h8f && init ) ? pn_d143[5] : 
                    ( pn5_deskew == 10'h90 && init ) ? pn_d144[5] : 
                    ( pn5_deskew == 10'h91 && init ) ? pn_d145[5] : pn_in[5]; 
assign pn_out_local[6] = ( pn6_deskew == 10'h0 && init ) ? pn_in[6] : 
                    ( pn6_deskew == 10'h1 && init ) ? pn_d1[6] : 
                    ( pn6_deskew == 10'h2 && init ) ? pn_d2[6] : 
                    ( pn6_deskew == 10'h3 && init ) ? pn_d3[6] : 
                    ( pn6_deskew == 10'h4 && init ) ? pn_d4[6] : 
                    ( pn6_deskew == 10'h5 && init ) ? pn_d5[6] : 
                    ( pn6_deskew == 10'h6 && init ) ? pn_d6[6] : 
                    ( pn6_deskew == 10'h7 && init ) ? pn_d7[6] : 
                    ( pn6_deskew == 10'h8 && init ) ? pn_d8[6] : 
                    ( pn6_deskew == 10'h9 && init ) ? pn_d9[6] : 
                    ( pn6_deskew == 10'ha && init ) ? pn_d10[6] : 
                    ( pn6_deskew == 10'hb && init ) ? pn_d11[6] : 
                    ( pn6_deskew == 10'hc && init ) ? pn_d12[6] : 
                    ( pn6_deskew == 10'hd && init ) ? pn_d13[6] : 
                    ( pn6_deskew == 10'he && init ) ? pn_d14[6] : 
                    ( pn6_deskew == 10'hf && init ) ? pn_d15[6] : 
                    ( pn6_deskew == 10'h10 && init ) ? pn_d16[6] : 
                    ( pn6_deskew == 10'h11 && init ) ? pn_d17[6] : 
                    ( pn6_deskew == 10'h12 && init ) ? pn_d18[6] : 
                    ( pn6_deskew == 10'h13 && init ) ? pn_d19[6] : 
                    ( pn6_deskew == 10'h14 && init ) ? pn_d20[6] : 
                    ( pn6_deskew == 10'h15 && init ) ? pn_d21[6] : 
                    ( pn6_deskew == 10'h16 && init ) ? pn_d22[6] : 
                    ( pn6_deskew == 10'h17 && init ) ? pn_d23[6] : 
                    ( pn6_deskew == 10'h18 && init ) ? pn_d24[6] : 
                    ( pn6_deskew == 10'h19 && init ) ? pn_d25[6] : 
                    ( pn6_deskew == 10'h1a && init ) ? pn_d26[6] : 
                    ( pn6_deskew == 10'h1b && init ) ? pn_d27[6] : 
                    ( pn6_deskew == 10'h1c && init ) ? pn_d28[6] : 
                    ( pn6_deskew == 10'h1d && init ) ? pn_d29[6] : 
                    ( pn6_deskew == 10'h1e && init ) ? pn_d30[6] : 
                    ( pn6_deskew == 10'h1f && init ) ? pn_d31[6] : 
                    ( pn6_deskew == 10'h20 && init ) ? pn_d32[6] : 
                    ( pn6_deskew == 10'h21 && init ) ? pn_d33[6] : 
                    ( pn6_deskew == 10'h22 && init ) ? pn_d34[6] : 
                    ( pn6_deskew == 10'h23 && init ) ? pn_d35[6] : 
                    ( pn6_deskew == 10'h24 && init ) ? pn_d36[6] : 
                    ( pn6_deskew == 10'h25 && init ) ? pn_d37[6] : 
                    ( pn6_deskew == 10'h26 && init ) ? pn_d38[6] : 
                    ( pn6_deskew == 10'h27 && init ) ? pn_d39[6] : 
                    ( pn6_deskew == 10'h28 && init ) ? pn_d40[6] : 
                    ( pn6_deskew == 10'h29 && init ) ? pn_d41[6] : 
                    ( pn6_deskew == 10'h2a && init ) ? pn_d42[6] : 
                    ( pn6_deskew == 10'h2b && init ) ? pn_d43[6] : 
                    ( pn6_deskew == 10'h2c && init ) ? pn_d44[6] : 
                    ( pn6_deskew == 10'h2d && init ) ? pn_d45[6] : 
                    ( pn6_deskew == 10'h2e && init ) ? pn_d46[6] : 
                    ( pn6_deskew == 10'h2f && init ) ? pn_d47[6] : 
                    ( pn6_deskew == 10'h30 && init ) ? pn_d48[6] : 
                    ( pn6_deskew == 10'h31 && init ) ? pn_d49[6] : 
                    ( pn6_deskew == 10'h32 && init ) ? pn_d50[6] : 
                    ( pn6_deskew == 10'h33 && init ) ? pn_d51[6] : 
                    ( pn6_deskew == 10'h34 && init ) ? pn_d52[6] : 
                    ( pn6_deskew == 10'h35 && init ) ? pn_d53[6] : 
                    ( pn6_deskew == 10'h36 && init ) ? pn_d54[6] : 
                    ( pn6_deskew == 10'h37 && init ) ? pn_d55[6] : 
                    ( pn6_deskew == 10'h38 && init ) ? pn_d56[6] : 
                    ( pn6_deskew == 10'h39 && init ) ? pn_d57[6] : 
                    ( pn6_deskew == 10'h3a && init ) ? pn_d58[6] : 
                    ( pn6_deskew == 10'h3b && init ) ? pn_d59[6] : 
                    ( pn6_deskew == 10'h3c && init ) ? pn_d60[6] : 
                    ( pn6_deskew == 10'h3d && init ) ? pn_d61[6] : 
                    ( pn6_deskew == 10'h3e && init ) ? pn_d62[6] : 
                    ( pn6_deskew == 10'h3f && init ) ? pn_d63[6] : 
                    ( pn6_deskew == 10'h40 && init ) ? pn_d64[6] : 
                    ( pn6_deskew == 10'h41 && init ) ? pn_d65[6] : 
                    ( pn6_deskew == 10'h42 && init ) ? pn_d66[6] : 
                    ( pn6_deskew == 10'h43 && init ) ? pn_d67[6] : 
                    ( pn6_deskew == 10'h44 && init ) ? pn_d68[6] : 
                    ( pn6_deskew == 10'h45 && init ) ? pn_d69[6] : 
                    ( pn6_deskew == 10'h46 && init ) ? pn_d70[6] : 
                    ( pn6_deskew == 10'h47 && init ) ? pn_d71[6] : 
                    ( pn6_deskew == 10'h48 && init ) ? pn_d72[6] : 
                    ( pn6_deskew == 10'h49 && init ) ? pn_d73[6] : 
                    ( pn6_deskew == 10'h4a && init ) ? pn_d74[6] : 
                    ( pn6_deskew == 10'h4b && init ) ? pn_d75[6] : 
                    ( pn6_deskew == 10'h4c && init ) ? pn_d76[6] : 
                    ( pn6_deskew == 10'h4d && init ) ? pn_d77[6] : 
                    ( pn6_deskew == 10'h4e && init ) ? pn_d78[6] : 
                    ( pn6_deskew == 10'h4f && init ) ? pn_d79[6] : 
                    ( pn6_deskew == 10'h50 && init ) ? pn_d80[6] : 
                    ( pn6_deskew == 10'h51 && init ) ? pn_d81[6] : 
                    ( pn6_deskew == 10'h52 && init ) ? pn_d82[6] : 
                    ( pn6_deskew == 10'h53 && init ) ? pn_d83[6] : 
                    ( pn6_deskew == 10'h54 && init ) ? pn_d84[6] : 
                    ( pn6_deskew == 10'h55 && init ) ? pn_d85[6] : 
                    ( pn6_deskew == 10'h56 && init ) ? pn_d86[6] : 
                    ( pn6_deskew == 10'h57 && init ) ? pn_d87[6] : 
                    ( pn6_deskew == 10'h58 && init ) ? pn_d88[6] : 
                    ( pn6_deskew == 10'h59 && init ) ? pn_d89[6] : 
                    ( pn6_deskew == 10'h5a && init ) ? pn_d90[6] : 
                    ( pn6_deskew == 10'h5b && init ) ? pn_d91[6] : 
                    ( pn6_deskew == 10'h5c && init ) ? pn_d92[6] : 
                    ( pn6_deskew == 10'h5d && init ) ? pn_d93[6] : 
                    ( pn6_deskew == 10'h5e && init ) ? pn_d94[6] : 
                    ( pn6_deskew == 10'h5f && init ) ? pn_d95[6] : 
                    ( pn6_deskew == 10'h60 && init ) ? pn_d96[6] : 
                    ( pn6_deskew == 10'h61 && init ) ? pn_d97[6] : 
                    ( pn6_deskew == 10'h62 && init ) ? pn_d98[6] : 
                    ( pn6_deskew == 10'h63 && init ) ? pn_d99[6] : 
                    ( pn6_deskew == 10'h64 && init ) ? pn_d100[6] : 
                    ( pn6_deskew == 10'h65 && init ) ? pn_d101[6] : 
                    ( pn6_deskew == 10'h66 && init ) ? pn_d102[6] : 
                    ( pn6_deskew == 10'h67 && init ) ? pn_d103[6] : 
                    ( pn6_deskew == 10'h68 && init ) ? pn_d104[6] : 
                    ( pn6_deskew == 10'h69 && init ) ? pn_d105[6] : 
                    ( pn6_deskew == 10'h6a && init ) ? pn_d106[6] : 
                    ( pn6_deskew == 10'h6b && init ) ? pn_d107[6] : 
                    ( pn6_deskew == 10'h6c && init ) ? pn_d108[6] : 
                    ( pn6_deskew == 10'h6d && init ) ? pn_d109[6] : 
                    ( pn6_deskew == 10'h6e && init ) ? pn_d110[6] : 
                    ( pn6_deskew == 10'h6f && init ) ? pn_d111[6] : 
                    ( pn6_deskew == 10'h70 && init ) ? pn_d112[6] : 
                    ( pn6_deskew == 10'h71 && init ) ? pn_d113[6] : 
                    ( pn6_deskew == 10'h72 && init ) ? pn_d114[6] : 
                    ( pn6_deskew == 10'h73 && init ) ? pn_d115[6] : 
                    ( pn6_deskew == 10'h74 && init ) ? pn_d116[6] : 
                    ( pn6_deskew == 10'h75 && init ) ? pn_d117[6] : 
                    ( pn6_deskew == 10'h76 && init ) ? pn_d118[6] : 
                    ( pn6_deskew == 10'h77 && init ) ? pn_d119[6] : 
                    ( pn6_deskew == 10'h78 && init ) ? pn_d120[6] : 
                    ( pn6_deskew == 10'h79 && init ) ? pn_d121[6] : 
                    ( pn6_deskew == 10'h7a && init ) ? pn_d122[6] : 
                    ( pn6_deskew == 10'h7b && init ) ? pn_d123[6] : 
                    ( pn6_deskew == 10'h7c && init ) ? pn_d124[6] : 
                    ( pn6_deskew == 10'h7d && init ) ? pn_d125[6] : 
                    ( pn6_deskew == 10'h7e && init ) ? pn_d126[6] : 
                    ( pn6_deskew == 10'h7f && init ) ? pn_d127[6] : 
                    ( pn6_deskew == 10'h80 && init ) ? pn_d128[6] : 
                    ( pn6_deskew == 10'h81 && init ) ? pn_d129[6] : 
                    ( pn6_deskew == 10'h82 && init ) ? pn_d130[6] : 
                    ( pn6_deskew == 10'h83 && init ) ? pn_d131[6] : 
                    ( pn6_deskew == 10'h84 && init ) ? pn_d132[6] : 
                    ( pn6_deskew == 10'h85 && init ) ? pn_d133[6] : 
                    ( pn6_deskew == 10'h86 && init ) ? pn_d134[6] : 
                    ( pn6_deskew == 10'h87 && init ) ? pn_d135[6] : 
                    ( pn6_deskew == 10'h88 && init ) ? pn_d136[6] : 
                    ( pn6_deskew == 10'h89 && init ) ? pn_d137[6] : 
                    ( pn6_deskew == 10'h8a && init ) ? pn_d138[6] : 
                    ( pn6_deskew == 10'h8b && init ) ? pn_d139[6] : 
                    ( pn6_deskew == 10'h8c && init ) ? pn_d140[6] : 
                    ( pn6_deskew == 10'h8d && init ) ? pn_d141[6] : 
                    ( pn6_deskew == 10'h8e && init ) ? pn_d142[6] : 
                    ( pn6_deskew == 10'h8f && init ) ? pn_d143[6] : 
                    ( pn6_deskew == 10'h90 && init ) ? pn_d144[6] : 
                    ( pn6_deskew == 10'h91 && init ) ? pn_d145[6] : pn_in[6]; 
assign pn_out_local[7] = ( pn7_deskew == 10'h0 && init ) ? pn_in[7] : 
                    ( pn7_deskew == 10'h1 && init ) ? pn_d1[7] : 
                    ( pn7_deskew == 10'h2 && init ) ? pn_d2[7] : 
                    ( pn7_deskew == 10'h3 && init ) ? pn_d3[7] : 
                    ( pn7_deskew == 10'h4 && init ) ? pn_d4[7] : 
                    ( pn7_deskew == 10'h5 && init ) ? pn_d5[7] : 
                    ( pn7_deskew == 10'h6 && init ) ? pn_d6[7] : 
                    ( pn7_deskew == 10'h7 && init ) ? pn_d7[7] : 
                    ( pn7_deskew == 10'h8 && init ) ? pn_d8[7] : 
                    ( pn7_deskew == 10'h9 && init ) ? pn_d9[7] : 
                    ( pn7_deskew == 10'ha && init ) ? pn_d10[7] : 
                    ( pn7_deskew == 10'hb && init ) ? pn_d11[7] : 
                    ( pn7_deskew == 10'hc && init ) ? pn_d12[7] : 
                    ( pn7_deskew == 10'hd && init ) ? pn_d13[7] : 
                    ( pn7_deskew == 10'he && init ) ? pn_d14[7] : 
                    ( pn7_deskew == 10'hf && init ) ? pn_d15[7] : 
                    ( pn7_deskew == 10'h10 && init ) ? pn_d16[7] : 
                    ( pn7_deskew == 10'h11 && init ) ? pn_d17[7] : 
                    ( pn7_deskew == 10'h12 && init ) ? pn_d18[7] : 
                    ( pn7_deskew == 10'h13 && init ) ? pn_d19[7] : 
                    ( pn7_deskew == 10'h14 && init ) ? pn_d20[7] : 
                    ( pn7_deskew == 10'h15 && init ) ? pn_d21[7] : 
                    ( pn7_deskew == 10'h16 && init ) ? pn_d22[7] : 
                    ( pn7_deskew == 10'h17 && init ) ? pn_d23[7] : 
                    ( pn7_deskew == 10'h18 && init ) ? pn_d24[7] : 
                    ( pn7_deskew == 10'h19 && init ) ? pn_d25[7] : 
                    ( pn7_deskew == 10'h1a && init ) ? pn_d26[7] : 
                    ( pn7_deskew == 10'h1b && init ) ? pn_d27[7] : 
                    ( pn7_deskew == 10'h1c && init ) ? pn_d28[7] : 
                    ( pn7_deskew == 10'h1d && init ) ? pn_d29[7] : 
                    ( pn7_deskew == 10'h1e && init ) ? pn_d30[7] : 
                    ( pn7_deskew == 10'h1f && init ) ? pn_d31[7] : 
                    ( pn7_deskew == 10'h20 && init ) ? pn_d32[7] : 
                    ( pn7_deskew == 10'h21 && init ) ? pn_d33[7] : 
                    ( pn7_deskew == 10'h22 && init ) ? pn_d34[7] : 
                    ( pn7_deskew == 10'h23 && init ) ? pn_d35[7] : 
                    ( pn7_deskew == 10'h24 && init ) ? pn_d36[7] : 
                    ( pn7_deskew == 10'h25 && init ) ? pn_d37[7] : 
                    ( pn7_deskew == 10'h26 && init ) ? pn_d38[7] : 
                    ( pn7_deskew == 10'h27 && init ) ? pn_d39[7] : 
                    ( pn7_deskew == 10'h28 && init ) ? pn_d40[7] : 
                    ( pn7_deskew == 10'h29 && init ) ? pn_d41[7] : 
                    ( pn7_deskew == 10'h2a && init ) ? pn_d42[7] : 
                    ( pn7_deskew == 10'h2b && init ) ? pn_d43[7] : 
                    ( pn7_deskew == 10'h2c && init ) ? pn_d44[7] : 
                    ( pn7_deskew == 10'h2d && init ) ? pn_d45[7] : 
                    ( pn7_deskew == 10'h2e && init ) ? pn_d46[7] : 
                    ( pn7_deskew == 10'h2f && init ) ? pn_d47[7] : 
                    ( pn7_deskew == 10'h30 && init ) ? pn_d48[7] : 
                    ( pn7_deskew == 10'h31 && init ) ? pn_d49[7] : 
                    ( pn7_deskew == 10'h32 && init ) ? pn_d50[7] : 
                    ( pn7_deskew == 10'h33 && init ) ? pn_d51[7] : 
                    ( pn7_deskew == 10'h34 && init ) ? pn_d52[7] : 
                    ( pn7_deskew == 10'h35 && init ) ? pn_d53[7] : 
                    ( pn7_deskew == 10'h36 && init ) ? pn_d54[7] : 
                    ( pn7_deskew == 10'h37 && init ) ? pn_d55[7] : 
                    ( pn7_deskew == 10'h38 && init ) ? pn_d56[7] : 
                    ( pn7_deskew == 10'h39 && init ) ? pn_d57[7] : 
                    ( pn7_deskew == 10'h3a && init ) ? pn_d58[7] : 
                    ( pn7_deskew == 10'h3b && init ) ? pn_d59[7] : 
                    ( pn7_deskew == 10'h3c && init ) ? pn_d60[7] : 
                    ( pn7_deskew == 10'h3d && init ) ? pn_d61[7] : 
                    ( pn7_deskew == 10'h3e && init ) ? pn_d62[7] : 
                    ( pn7_deskew == 10'h3f && init ) ? pn_d63[7] : 
                    ( pn7_deskew == 10'h40 && init ) ? pn_d64[7] : 
                    ( pn7_deskew == 10'h41 && init ) ? pn_d65[7] : 
                    ( pn7_deskew == 10'h42 && init ) ? pn_d66[7] : 
                    ( pn7_deskew == 10'h43 && init ) ? pn_d67[7] : 
                    ( pn7_deskew == 10'h44 && init ) ? pn_d68[7] : 
                    ( pn7_deskew == 10'h45 && init ) ? pn_d69[7] : 
                    ( pn7_deskew == 10'h46 && init ) ? pn_d70[7] : 
                    ( pn7_deskew == 10'h47 && init ) ? pn_d71[7] : 
                    ( pn7_deskew == 10'h48 && init ) ? pn_d72[7] : 
                    ( pn7_deskew == 10'h49 && init ) ? pn_d73[7] : 
                    ( pn7_deskew == 10'h4a && init ) ? pn_d74[7] : 
                    ( pn7_deskew == 10'h4b && init ) ? pn_d75[7] : 
                    ( pn7_deskew == 10'h4c && init ) ? pn_d76[7] : 
                    ( pn7_deskew == 10'h4d && init ) ? pn_d77[7] : 
                    ( pn7_deskew == 10'h4e && init ) ? pn_d78[7] : 
                    ( pn7_deskew == 10'h4f && init ) ? pn_d79[7] : 
                    ( pn7_deskew == 10'h50 && init ) ? pn_d80[7] : 
                    ( pn7_deskew == 10'h51 && init ) ? pn_d81[7] : 
                    ( pn7_deskew == 10'h52 && init ) ? pn_d82[7] : 
                    ( pn7_deskew == 10'h53 && init ) ? pn_d83[7] : 
                    ( pn7_deskew == 10'h54 && init ) ? pn_d84[7] : 
                    ( pn7_deskew == 10'h55 && init ) ? pn_d85[7] : 
                    ( pn7_deskew == 10'h56 && init ) ? pn_d86[7] : 
                    ( pn7_deskew == 10'h57 && init ) ? pn_d87[7] : 
                    ( pn7_deskew == 10'h58 && init ) ? pn_d88[7] : 
                    ( pn7_deskew == 10'h59 && init ) ? pn_d89[7] : 
                    ( pn7_deskew == 10'h5a && init ) ? pn_d90[7] : 
                    ( pn7_deskew == 10'h5b && init ) ? pn_d91[7] : 
                    ( pn7_deskew == 10'h5c && init ) ? pn_d92[7] : 
                    ( pn7_deskew == 10'h5d && init ) ? pn_d93[7] : 
                    ( pn7_deskew == 10'h5e && init ) ? pn_d94[7] : 
                    ( pn7_deskew == 10'h5f && init ) ? pn_d95[7] : 
                    ( pn7_deskew == 10'h60 && init ) ? pn_d96[7] : 
                    ( pn7_deskew == 10'h61 && init ) ? pn_d97[7] : 
                    ( pn7_deskew == 10'h62 && init ) ? pn_d98[7] : 
                    ( pn7_deskew == 10'h63 && init ) ? pn_d99[7] : 
                    ( pn7_deskew == 10'h64 && init ) ? pn_d100[7] : 
                    ( pn7_deskew == 10'h65 && init ) ? pn_d101[7] : 
                    ( pn7_deskew == 10'h66 && init ) ? pn_d102[7] : 
                    ( pn7_deskew == 10'h67 && init ) ? pn_d103[7] : 
                    ( pn7_deskew == 10'h68 && init ) ? pn_d104[7] : 
                    ( pn7_deskew == 10'h69 && init ) ? pn_d105[7] : 
                    ( pn7_deskew == 10'h6a && init ) ? pn_d106[7] : 
                    ( pn7_deskew == 10'h6b && init ) ? pn_d107[7] : 
                    ( pn7_deskew == 10'h6c && init ) ? pn_d108[7] : 
                    ( pn7_deskew == 10'h6d && init ) ? pn_d109[7] : 
                    ( pn7_deskew == 10'h6e && init ) ? pn_d110[7] : 
                    ( pn7_deskew == 10'h6f && init ) ? pn_d111[7] : 
                    ( pn7_deskew == 10'h70 && init ) ? pn_d112[7] : 
                    ( pn7_deskew == 10'h71 && init ) ? pn_d113[7] : 
                    ( pn7_deskew == 10'h72 && init ) ? pn_d114[7] : 
                    ( pn7_deskew == 10'h73 && init ) ? pn_d115[7] : 
                    ( pn7_deskew == 10'h74 && init ) ? pn_d116[7] : 
                    ( pn7_deskew == 10'h75 && init ) ? pn_d117[7] : 
                    ( pn7_deskew == 10'h76 && init ) ? pn_d118[7] : 
                    ( pn7_deskew == 10'h77 && init ) ? pn_d119[7] : 
                    ( pn7_deskew == 10'h78 && init ) ? pn_d120[7] : 
                    ( pn7_deskew == 10'h79 && init ) ? pn_d121[7] : 
                    ( pn7_deskew == 10'h7a && init ) ? pn_d122[7] : 
                    ( pn7_deskew == 10'h7b && init ) ? pn_d123[7] : 
                    ( pn7_deskew == 10'h7c && init ) ? pn_d124[7] : 
                    ( pn7_deskew == 10'h7d && init ) ? pn_d125[7] : 
                    ( pn7_deskew == 10'h7e && init ) ? pn_d126[7] : 
                    ( pn7_deskew == 10'h7f && init ) ? pn_d127[7] : 
                    ( pn7_deskew == 10'h80 && init ) ? pn_d128[7] : 
                    ( pn7_deskew == 10'h81 && init ) ? pn_d129[7] : 
                    ( pn7_deskew == 10'h82 && init ) ? pn_d130[7] : 
                    ( pn7_deskew == 10'h83 && init ) ? pn_d131[7] : 
                    ( pn7_deskew == 10'h84 && init ) ? pn_d132[7] : 
                    ( pn7_deskew == 10'h85 && init ) ? pn_d133[7] : 
                    ( pn7_deskew == 10'h86 && init ) ? pn_d134[7] : 
                    ( pn7_deskew == 10'h87 && init ) ? pn_d135[7] : 
                    ( pn7_deskew == 10'h88 && init ) ? pn_d136[7] : 
                    ( pn7_deskew == 10'h89 && init ) ? pn_d137[7] : 
                    ( pn7_deskew == 10'h8a && init ) ? pn_d138[7] : 
                    ( pn7_deskew == 10'h8b && init ) ? pn_d139[7] : 
                    ( pn7_deskew == 10'h8c && init ) ? pn_d140[7] : 
                    ( pn7_deskew == 10'h8d && init ) ? pn_d141[7] : 
                    ( pn7_deskew == 10'h8e && init ) ? pn_d142[7] : 
                    ( pn7_deskew == 10'h8f && init ) ? pn_d143[7] : 
                    ( pn7_deskew == 10'h90 && init ) ? pn_d144[7] : 
                    ( pn7_deskew == 10'h91 && init ) ? pn_d145[7] : pn_in[7]; 
assign pn_out_local[8] = ( pn8_deskew == 10'h0 && init ) ? pn_in[8] : 
                    ( pn8_deskew == 10'h1 && init ) ? pn_d1[8] : 
                    ( pn8_deskew == 10'h2 && init ) ? pn_d2[8] : 
                    ( pn8_deskew == 10'h3 && init ) ? pn_d3[8] : 
                    ( pn8_deskew == 10'h4 && init ) ? pn_d4[8] : 
                    ( pn8_deskew == 10'h5 && init ) ? pn_d5[8] : 
                    ( pn8_deskew == 10'h6 && init ) ? pn_d6[8] : 
                    ( pn8_deskew == 10'h7 && init ) ? pn_d7[8] : 
                    ( pn8_deskew == 10'h8 && init ) ? pn_d8[8] : 
                    ( pn8_deskew == 10'h9 && init ) ? pn_d9[8] : 
                    ( pn8_deskew == 10'ha && init ) ? pn_d10[8] : 
                    ( pn8_deskew == 10'hb && init ) ? pn_d11[8] : 
                    ( pn8_deskew == 10'hc && init ) ? pn_d12[8] : 
                    ( pn8_deskew == 10'hd && init ) ? pn_d13[8] : 
                    ( pn8_deskew == 10'he && init ) ? pn_d14[8] : 
                    ( pn8_deskew == 10'hf && init ) ? pn_d15[8] : 
                    ( pn8_deskew == 10'h10 && init ) ? pn_d16[8] : 
                    ( pn8_deskew == 10'h11 && init ) ? pn_d17[8] : 
                    ( pn8_deskew == 10'h12 && init ) ? pn_d18[8] : 
                    ( pn8_deskew == 10'h13 && init ) ? pn_d19[8] : 
                    ( pn8_deskew == 10'h14 && init ) ? pn_d20[8] : 
                    ( pn8_deskew == 10'h15 && init ) ? pn_d21[8] : 
                    ( pn8_deskew == 10'h16 && init ) ? pn_d22[8] : 
                    ( pn8_deskew == 10'h17 && init ) ? pn_d23[8] : 
                    ( pn8_deskew == 10'h18 && init ) ? pn_d24[8] : 
                    ( pn8_deskew == 10'h19 && init ) ? pn_d25[8] : 
                    ( pn8_deskew == 10'h1a && init ) ? pn_d26[8] : 
                    ( pn8_deskew == 10'h1b && init ) ? pn_d27[8] : 
                    ( pn8_deskew == 10'h1c && init ) ? pn_d28[8] : 
                    ( pn8_deskew == 10'h1d && init ) ? pn_d29[8] : 
                    ( pn8_deskew == 10'h1e && init ) ? pn_d30[8] : 
                    ( pn8_deskew == 10'h1f && init ) ? pn_d31[8] : 
                    ( pn8_deskew == 10'h20 && init ) ? pn_d32[8] : 
                    ( pn8_deskew == 10'h21 && init ) ? pn_d33[8] : 
                    ( pn8_deskew == 10'h22 && init ) ? pn_d34[8] : 
                    ( pn8_deskew == 10'h23 && init ) ? pn_d35[8] : 
                    ( pn8_deskew == 10'h24 && init ) ? pn_d36[8] : 
                    ( pn8_deskew == 10'h25 && init ) ? pn_d37[8] : 
                    ( pn8_deskew == 10'h26 && init ) ? pn_d38[8] : 
                    ( pn8_deskew == 10'h27 && init ) ? pn_d39[8] : 
                    ( pn8_deskew == 10'h28 && init ) ? pn_d40[8] : 
                    ( pn8_deskew == 10'h29 && init ) ? pn_d41[8] : 
                    ( pn8_deskew == 10'h2a && init ) ? pn_d42[8] : 
                    ( pn8_deskew == 10'h2b && init ) ? pn_d43[8] : 
                    ( pn8_deskew == 10'h2c && init ) ? pn_d44[8] : 
                    ( pn8_deskew == 10'h2d && init ) ? pn_d45[8] : 
                    ( pn8_deskew == 10'h2e && init ) ? pn_d46[8] : 
                    ( pn8_deskew == 10'h2f && init ) ? pn_d47[8] : 
                    ( pn8_deskew == 10'h30 && init ) ? pn_d48[8] : 
                    ( pn8_deskew == 10'h31 && init ) ? pn_d49[8] : 
                    ( pn8_deskew == 10'h32 && init ) ? pn_d50[8] : 
                    ( pn8_deskew == 10'h33 && init ) ? pn_d51[8] : 
                    ( pn8_deskew == 10'h34 && init ) ? pn_d52[8] : 
                    ( pn8_deskew == 10'h35 && init ) ? pn_d53[8] : 
                    ( pn8_deskew == 10'h36 && init ) ? pn_d54[8] : 
                    ( pn8_deskew == 10'h37 && init ) ? pn_d55[8] : 
                    ( pn8_deskew == 10'h38 && init ) ? pn_d56[8] : 
                    ( pn8_deskew == 10'h39 && init ) ? pn_d57[8] : 
                    ( pn8_deskew == 10'h3a && init ) ? pn_d58[8] : 
                    ( pn8_deskew == 10'h3b && init ) ? pn_d59[8] : 
                    ( pn8_deskew == 10'h3c && init ) ? pn_d60[8] : 
                    ( pn8_deskew == 10'h3d && init ) ? pn_d61[8] : 
                    ( pn8_deskew == 10'h3e && init ) ? pn_d62[8] : 
                    ( pn8_deskew == 10'h3f && init ) ? pn_d63[8] : 
                    ( pn8_deskew == 10'h40 && init ) ? pn_d64[8] : 
                    ( pn8_deskew == 10'h41 && init ) ? pn_d65[8] : 
                    ( pn8_deskew == 10'h42 && init ) ? pn_d66[8] : 
                    ( pn8_deskew == 10'h43 && init ) ? pn_d67[8] : 
                    ( pn8_deskew == 10'h44 && init ) ? pn_d68[8] : 
                    ( pn8_deskew == 10'h45 && init ) ? pn_d69[8] : 
                    ( pn8_deskew == 10'h46 && init ) ? pn_d70[8] : 
                    ( pn8_deskew == 10'h47 && init ) ? pn_d71[8] : 
                    ( pn8_deskew == 10'h48 && init ) ? pn_d72[8] : 
                    ( pn8_deskew == 10'h49 && init ) ? pn_d73[8] : 
                    ( pn8_deskew == 10'h4a && init ) ? pn_d74[8] : 
                    ( pn8_deskew == 10'h4b && init ) ? pn_d75[8] : 
                    ( pn8_deskew == 10'h4c && init ) ? pn_d76[8] : 
                    ( pn8_deskew == 10'h4d && init ) ? pn_d77[8] : 
                    ( pn8_deskew == 10'h4e && init ) ? pn_d78[8] : 
                    ( pn8_deskew == 10'h4f && init ) ? pn_d79[8] : 
                    ( pn8_deskew == 10'h50 && init ) ? pn_d80[8] : 
                    ( pn8_deskew == 10'h51 && init ) ? pn_d81[8] : 
                    ( pn8_deskew == 10'h52 && init ) ? pn_d82[8] : 
                    ( pn8_deskew == 10'h53 && init ) ? pn_d83[8] : 
                    ( pn8_deskew == 10'h54 && init ) ? pn_d84[8] : 
                    ( pn8_deskew == 10'h55 && init ) ? pn_d85[8] : 
                    ( pn8_deskew == 10'h56 && init ) ? pn_d86[8] : 
                    ( pn8_deskew == 10'h57 && init ) ? pn_d87[8] : 
                    ( pn8_deskew == 10'h58 && init ) ? pn_d88[8] : 
                    ( pn8_deskew == 10'h59 && init ) ? pn_d89[8] : 
                    ( pn8_deskew == 10'h5a && init ) ? pn_d90[8] : 
                    ( pn8_deskew == 10'h5b && init ) ? pn_d91[8] : 
                    ( pn8_deskew == 10'h5c && init ) ? pn_d92[8] : 
                    ( pn8_deskew == 10'h5d && init ) ? pn_d93[8] : 
                    ( pn8_deskew == 10'h5e && init ) ? pn_d94[8] : 
                    ( pn8_deskew == 10'h5f && init ) ? pn_d95[8] : 
                    ( pn8_deskew == 10'h60 && init ) ? pn_d96[8] : 
                    ( pn8_deskew == 10'h61 && init ) ? pn_d97[8] : 
                    ( pn8_deskew == 10'h62 && init ) ? pn_d98[8] : 
                    ( pn8_deskew == 10'h63 && init ) ? pn_d99[8] : 
                    ( pn8_deskew == 10'h64 && init ) ? pn_d100[8] : 
                    ( pn8_deskew == 10'h65 && init ) ? pn_d101[8] : 
                    ( pn8_deskew == 10'h66 && init ) ? pn_d102[8] : 
                    ( pn8_deskew == 10'h67 && init ) ? pn_d103[8] : 
                    ( pn8_deskew == 10'h68 && init ) ? pn_d104[8] : 
                    ( pn8_deskew == 10'h69 && init ) ? pn_d105[8] : 
                    ( pn8_deskew == 10'h6a && init ) ? pn_d106[8] : 
                    ( pn8_deskew == 10'h6b && init ) ? pn_d107[8] : 
                    ( pn8_deskew == 10'h6c && init ) ? pn_d108[8] : 
                    ( pn8_deskew == 10'h6d && init ) ? pn_d109[8] : 
                    ( pn8_deskew == 10'h6e && init ) ? pn_d110[8] : 
                    ( pn8_deskew == 10'h6f && init ) ? pn_d111[8] : 
                    ( pn8_deskew == 10'h70 && init ) ? pn_d112[8] : 
                    ( pn8_deskew == 10'h71 && init ) ? pn_d113[8] : 
                    ( pn8_deskew == 10'h72 && init ) ? pn_d114[8] : 
                    ( pn8_deskew == 10'h73 && init ) ? pn_d115[8] : 
                    ( pn8_deskew == 10'h74 && init ) ? pn_d116[8] : 
                    ( pn8_deskew == 10'h75 && init ) ? pn_d117[8] : 
                    ( pn8_deskew == 10'h76 && init ) ? pn_d118[8] : 
                    ( pn8_deskew == 10'h77 && init ) ? pn_d119[8] : 
                    ( pn8_deskew == 10'h78 && init ) ? pn_d120[8] : 
                    ( pn8_deskew == 10'h79 && init ) ? pn_d121[8] : 
                    ( pn8_deskew == 10'h7a && init ) ? pn_d122[8] : 
                    ( pn8_deskew == 10'h7b && init ) ? pn_d123[8] : 
                    ( pn8_deskew == 10'h7c && init ) ? pn_d124[8] : 
                    ( pn8_deskew == 10'h7d && init ) ? pn_d125[8] : 
                    ( pn8_deskew == 10'h7e && init ) ? pn_d126[8] : 
                    ( pn8_deskew == 10'h7f && init ) ? pn_d127[8] : 
                    ( pn8_deskew == 10'h80 && init ) ? pn_d128[8] : 
                    ( pn8_deskew == 10'h81 && init ) ? pn_d129[8] : 
                    ( pn8_deskew == 10'h82 && init ) ? pn_d130[8] : 
                    ( pn8_deskew == 10'h83 && init ) ? pn_d131[8] : 
                    ( pn8_deskew == 10'h84 && init ) ? pn_d132[8] : 
                    ( pn8_deskew == 10'h85 && init ) ? pn_d133[8] : 
                    ( pn8_deskew == 10'h86 && init ) ? pn_d134[8] : 
                    ( pn8_deskew == 10'h87 && init ) ? pn_d135[8] : 
                    ( pn8_deskew == 10'h88 && init ) ? pn_d136[8] : 
                    ( pn8_deskew == 10'h89 && init ) ? pn_d137[8] : 
                    ( pn8_deskew == 10'h8a && init ) ? pn_d138[8] : 
                    ( pn8_deskew == 10'h8b && init ) ? pn_d139[8] : 
                    ( pn8_deskew == 10'h8c && init ) ? pn_d140[8] : 
                    ( pn8_deskew == 10'h8d && init ) ? pn_d141[8] : 
                    ( pn8_deskew == 10'h8e && init ) ? pn_d142[8] : 
                    ( pn8_deskew == 10'h8f && init ) ? pn_d143[8] : 
                    ( pn8_deskew == 10'h90 && init ) ? pn_d144[8] : 
                    ( pn8_deskew == 10'h91 && init ) ? pn_d145[8] : pn_in[8]; 
assign pn_out_local[9] = ( pn9_deskew == 10'h0 && init ) ? pn_in[9] : 
                    ( pn9_deskew == 10'h1 && init ) ? pn_d1[9] : 
                    ( pn9_deskew == 10'h2 && init ) ? pn_d2[9] : 
                    ( pn9_deskew == 10'h3 && init ) ? pn_d3[9] : 
                    ( pn9_deskew == 10'h4 && init ) ? pn_d4[9] : 
                    ( pn9_deskew == 10'h5 && init ) ? pn_d5[9] : 
                    ( pn9_deskew == 10'h6 && init ) ? pn_d6[9] : 
                    ( pn9_deskew == 10'h7 && init ) ? pn_d7[9] : 
                    ( pn9_deskew == 10'h8 && init ) ? pn_d8[9] : 
                    ( pn9_deskew == 10'h9 && init ) ? pn_d9[9] : 
                    ( pn9_deskew == 10'ha && init ) ? pn_d10[9] : 
                    ( pn9_deskew == 10'hb && init ) ? pn_d11[9] : 
                    ( pn9_deskew == 10'hc && init ) ? pn_d12[9] : 
                    ( pn9_deskew == 10'hd && init ) ? pn_d13[9] : 
                    ( pn9_deskew == 10'he && init ) ? pn_d14[9] : 
                    ( pn9_deskew == 10'hf && init ) ? pn_d15[9] : 
                    ( pn9_deskew == 10'h10 && init ) ? pn_d16[9] : 
                    ( pn9_deskew == 10'h11 && init ) ? pn_d17[9] : 
                    ( pn9_deskew == 10'h12 && init ) ? pn_d18[9] : 
                    ( pn9_deskew == 10'h13 && init ) ? pn_d19[9] : 
                    ( pn9_deskew == 10'h14 && init ) ? pn_d20[9] : 
                    ( pn9_deskew == 10'h15 && init ) ? pn_d21[9] : 
                    ( pn9_deskew == 10'h16 && init ) ? pn_d22[9] : 
                    ( pn9_deskew == 10'h17 && init ) ? pn_d23[9] : 
                    ( pn9_deskew == 10'h18 && init ) ? pn_d24[9] : 
                    ( pn9_deskew == 10'h19 && init ) ? pn_d25[9] : 
                    ( pn9_deskew == 10'h1a && init ) ? pn_d26[9] : 
                    ( pn9_deskew == 10'h1b && init ) ? pn_d27[9] : 
                    ( pn9_deskew == 10'h1c && init ) ? pn_d28[9] : 
                    ( pn9_deskew == 10'h1d && init ) ? pn_d29[9] : 
                    ( pn9_deskew == 10'h1e && init ) ? pn_d30[9] : 
                    ( pn9_deskew == 10'h1f && init ) ? pn_d31[9] : 
                    ( pn9_deskew == 10'h20 && init ) ? pn_d32[9] : 
                    ( pn9_deskew == 10'h21 && init ) ? pn_d33[9] : 
                    ( pn9_deskew == 10'h22 && init ) ? pn_d34[9] : 
                    ( pn9_deskew == 10'h23 && init ) ? pn_d35[9] : 
                    ( pn9_deskew == 10'h24 && init ) ? pn_d36[9] : 
                    ( pn9_deskew == 10'h25 && init ) ? pn_d37[9] : 
                    ( pn9_deskew == 10'h26 && init ) ? pn_d38[9] : 
                    ( pn9_deskew == 10'h27 && init ) ? pn_d39[9] : 
                    ( pn9_deskew == 10'h28 && init ) ? pn_d40[9] : 
                    ( pn9_deskew == 10'h29 && init ) ? pn_d41[9] : 
                    ( pn9_deskew == 10'h2a && init ) ? pn_d42[9] : 
                    ( pn9_deskew == 10'h2b && init ) ? pn_d43[9] : 
                    ( pn9_deskew == 10'h2c && init ) ? pn_d44[9] : 
                    ( pn9_deskew == 10'h2d && init ) ? pn_d45[9] : 
                    ( pn9_deskew == 10'h2e && init ) ? pn_d46[9] : 
                    ( pn9_deskew == 10'h2f && init ) ? pn_d47[9] : 
                    ( pn9_deskew == 10'h30 && init ) ? pn_d48[9] : 
                    ( pn9_deskew == 10'h31 && init ) ? pn_d49[9] : 
                    ( pn9_deskew == 10'h32 && init ) ? pn_d50[9] : 
                    ( pn9_deskew == 10'h33 && init ) ? pn_d51[9] : 
                    ( pn9_deskew == 10'h34 && init ) ? pn_d52[9] : 
                    ( pn9_deskew == 10'h35 && init ) ? pn_d53[9] : 
                    ( pn9_deskew == 10'h36 && init ) ? pn_d54[9] : 
                    ( pn9_deskew == 10'h37 && init ) ? pn_d55[9] : 
                    ( pn9_deskew == 10'h38 && init ) ? pn_d56[9] : 
                    ( pn9_deskew == 10'h39 && init ) ? pn_d57[9] : 
                    ( pn9_deskew == 10'h3a && init ) ? pn_d58[9] : 
                    ( pn9_deskew == 10'h3b && init ) ? pn_d59[9] : 
                    ( pn9_deskew == 10'h3c && init ) ? pn_d60[9] : 
                    ( pn9_deskew == 10'h3d && init ) ? pn_d61[9] : 
                    ( pn9_deskew == 10'h3e && init ) ? pn_d62[9] : 
                    ( pn9_deskew == 10'h3f && init ) ? pn_d63[9] : 
                    ( pn9_deskew == 10'h40 && init ) ? pn_d64[9] : 
                    ( pn9_deskew == 10'h41 && init ) ? pn_d65[9] : 
                    ( pn9_deskew == 10'h42 && init ) ? pn_d66[9] : 
                    ( pn9_deskew == 10'h43 && init ) ? pn_d67[9] : 
                    ( pn9_deskew == 10'h44 && init ) ? pn_d68[9] : 
                    ( pn9_deskew == 10'h45 && init ) ? pn_d69[9] : 
                    ( pn9_deskew == 10'h46 && init ) ? pn_d70[9] : 
                    ( pn9_deskew == 10'h47 && init ) ? pn_d71[9] : 
                    ( pn9_deskew == 10'h48 && init ) ? pn_d72[9] : 
                    ( pn9_deskew == 10'h49 && init ) ? pn_d73[9] : 
                    ( pn9_deskew == 10'h4a && init ) ? pn_d74[9] : 
                    ( pn9_deskew == 10'h4b && init ) ? pn_d75[9] : 
                    ( pn9_deskew == 10'h4c && init ) ? pn_d76[9] : 
                    ( pn9_deskew == 10'h4d && init ) ? pn_d77[9] : 
                    ( pn9_deskew == 10'h4e && init ) ? pn_d78[9] : 
                    ( pn9_deskew == 10'h4f && init ) ? pn_d79[9] : 
                    ( pn9_deskew == 10'h50 && init ) ? pn_d80[9] : 
                    ( pn9_deskew == 10'h51 && init ) ? pn_d81[9] : 
                    ( pn9_deskew == 10'h52 && init ) ? pn_d82[9] : 
                    ( pn9_deskew == 10'h53 && init ) ? pn_d83[9] : 
                    ( pn9_deskew == 10'h54 && init ) ? pn_d84[9] : 
                    ( pn9_deskew == 10'h55 && init ) ? pn_d85[9] : 
                    ( pn9_deskew == 10'h56 && init ) ? pn_d86[9] : 
                    ( pn9_deskew == 10'h57 && init ) ? pn_d87[9] : 
                    ( pn9_deskew == 10'h58 && init ) ? pn_d88[9] : 
                    ( pn9_deskew == 10'h59 && init ) ? pn_d89[9] : 
                    ( pn9_deskew == 10'h5a && init ) ? pn_d90[9] : 
                    ( pn9_deskew == 10'h5b && init ) ? pn_d91[9] : 
                    ( pn9_deskew == 10'h5c && init ) ? pn_d92[9] : 
                    ( pn9_deskew == 10'h5d && init ) ? pn_d93[9] : 
                    ( pn9_deskew == 10'h5e && init ) ? pn_d94[9] : 
                    ( pn9_deskew == 10'h5f && init ) ? pn_d95[9] : 
                    ( pn9_deskew == 10'h60 && init ) ? pn_d96[9] : 
                    ( pn9_deskew == 10'h61 && init ) ? pn_d97[9] : 
                    ( pn9_deskew == 10'h62 && init ) ? pn_d98[9] : 
                    ( pn9_deskew == 10'h63 && init ) ? pn_d99[9] : 
                    ( pn9_deskew == 10'h64 && init ) ? pn_d100[9] : 
                    ( pn9_deskew == 10'h65 && init ) ? pn_d101[9] : 
                    ( pn9_deskew == 10'h66 && init ) ? pn_d102[9] : 
                    ( pn9_deskew == 10'h67 && init ) ? pn_d103[9] : 
                    ( pn9_deskew == 10'h68 && init ) ? pn_d104[9] : 
                    ( pn9_deskew == 10'h69 && init ) ? pn_d105[9] : 
                    ( pn9_deskew == 10'h6a && init ) ? pn_d106[9] : 
                    ( pn9_deskew == 10'h6b && init ) ? pn_d107[9] : 
                    ( pn9_deskew == 10'h6c && init ) ? pn_d108[9] : 
                    ( pn9_deskew == 10'h6d && init ) ? pn_d109[9] : 
                    ( pn9_deskew == 10'h6e && init ) ? pn_d110[9] : 
                    ( pn9_deskew == 10'h6f && init ) ? pn_d111[9] : 
                    ( pn9_deskew == 10'h70 && init ) ? pn_d112[9] : 
                    ( pn9_deskew == 10'h71 && init ) ? pn_d113[9] : 
                    ( pn9_deskew == 10'h72 && init ) ? pn_d114[9] : 
                    ( pn9_deskew == 10'h73 && init ) ? pn_d115[9] : 
                    ( pn9_deskew == 10'h74 && init ) ? pn_d116[9] : 
                    ( pn9_deskew == 10'h75 && init ) ? pn_d117[9] : 
                    ( pn9_deskew == 10'h76 && init ) ? pn_d118[9] : 
                    ( pn9_deskew == 10'h77 && init ) ? pn_d119[9] : 
                    ( pn9_deskew == 10'h78 && init ) ? pn_d120[9] : 
                    ( pn9_deskew == 10'h79 && init ) ? pn_d121[9] : 
                    ( pn9_deskew == 10'h7a && init ) ? pn_d122[9] : 
                    ( pn9_deskew == 10'h7b && init ) ? pn_d123[9] : 
                    ( pn9_deskew == 10'h7c && init ) ? pn_d124[9] : 
                    ( pn9_deskew == 10'h7d && init ) ? pn_d125[9] : 
                    ( pn9_deskew == 10'h7e && init ) ? pn_d126[9] : 
                    ( pn9_deskew == 10'h7f && init ) ? pn_d127[9] : 
                    ( pn9_deskew == 10'h80 && init ) ? pn_d128[9] : 
                    ( pn9_deskew == 10'h81 && init ) ? pn_d129[9] : 
                    ( pn9_deskew == 10'h82 && init ) ? pn_d130[9] : 
                    ( pn9_deskew == 10'h83 && init ) ? pn_d131[9] : 
                    ( pn9_deskew == 10'h84 && init ) ? pn_d132[9] : 
                    ( pn9_deskew == 10'h85 && init ) ? pn_d133[9] : 
                    ( pn9_deskew == 10'h86 && init ) ? pn_d134[9] : 
                    ( pn9_deskew == 10'h87 && init ) ? pn_d135[9] : 
                    ( pn9_deskew == 10'h88 && init ) ? pn_d136[9] : 
                    ( pn9_deskew == 10'h89 && init ) ? pn_d137[9] : 
                    ( pn9_deskew == 10'h8a && init ) ? pn_d138[9] : 
                    ( pn9_deskew == 10'h8b && init ) ? pn_d139[9] : 
                    ( pn9_deskew == 10'h8c && init ) ? pn_d140[9] : 
                    ( pn9_deskew == 10'h8d && init ) ? pn_d141[9] : 
                    ( pn9_deskew == 10'h8e && init ) ? pn_d142[9] : 
                    ( pn9_deskew == 10'h8f && init ) ? pn_d143[9] : 
                    ( pn9_deskew == 10'h90 && init ) ? pn_d144[9] : 
                    ( pn9_deskew == 10'h91 && init ) ? pn_d145[9] : pn_in[9]; 
assign pn_out_local[10] = ( pn10_deskew == 10'h0 && init ) ? pn_in[10] : 
                    ( pn10_deskew == 10'h1 && init ) ? pn_d1[10] : 
                    ( pn10_deskew == 10'h2 && init ) ? pn_d2[10] : 
                    ( pn10_deskew == 10'h3 && init ) ? pn_d3[10] : 
                    ( pn10_deskew == 10'h4 && init ) ? pn_d4[10] : 
                    ( pn10_deskew == 10'h5 && init ) ? pn_d5[10] : 
                    ( pn10_deskew == 10'h6 && init ) ? pn_d6[10] : 
                    ( pn10_deskew == 10'h7 && init ) ? pn_d7[10] : 
                    ( pn10_deskew == 10'h8 && init ) ? pn_d8[10] : 
                    ( pn10_deskew == 10'h9 && init ) ? pn_d9[10] : 
                    ( pn10_deskew == 10'ha && init ) ? pn_d10[10] : 
                    ( pn10_deskew == 10'hb && init ) ? pn_d11[10] : 
                    ( pn10_deskew == 10'hc && init ) ? pn_d12[10] : 
                    ( pn10_deskew == 10'hd && init ) ? pn_d13[10] : 
                    ( pn10_deskew == 10'he && init ) ? pn_d14[10] : 
                    ( pn10_deskew == 10'hf && init ) ? pn_d15[10] : 
                    ( pn10_deskew == 10'h10 && init ) ? pn_d16[10] : 
                    ( pn10_deskew == 10'h11 && init ) ? pn_d17[10] : 
                    ( pn10_deskew == 10'h12 && init ) ? pn_d18[10] : 
                    ( pn10_deskew == 10'h13 && init ) ? pn_d19[10] : 
                    ( pn10_deskew == 10'h14 && init ) ? pn_d20[10] : 
                    ( pn10_deskew == 10'h15 && init ) ? pn_d21[10] : 
                    ( pn10_deskew == 10'h16 && init ) ? pn_d22[10] : 
                    ( pn10_deskew == 10'h17 && init ) ? pn_d23[10] : 
                    ( pn10_deskew == 10'h18 && init ) ? pn_d24[10] : 
                    ( pn10_deskew == 10'h19 && init ) ? pn_d25[10] : 
                    ( pn10_deskew == 10'h1a && init ) ? pn_d26[10] : 
                    ( pn10_deskew == 10'h1b && init ) ? pn_d27[10] : 
                    ( pn10_deskew == 10'h1c && init ) ? pn_d28[10] : 
                    ( pn10_deskew == 10'h1d && init ) ? pn_d29[10] : 
                    ( pn10_deskew == 10'h1e && init ) ? pn_d30[10] : 
                    ( pn10_deskew == 10'h1f && init ) ? pn_d31[10] : 
                    ( pn10_deskew == 10'h20 && init ) ? pn_d32[10] : 
                    ( pn10_deskew == 10'h21 && init ) ? pn_d33[10] : 
                    ( pn10_deskew == 10'h22 && init ) ? pn_d34[10] : 
                    ( pn10_deskew == 10'h23 && init ) ? pn_d35[10] : 
                    ( pn10_deskew == 10'h24 && init ) ? pn_d36[10] : 
                    ( pn10_deskew == 10'h25 && init ) ? pn_d37[10] : 
                    ( pn10_deskew == 10'h26 && init ) ? pn_d38[10] : 
                    ( pn10_deskew == 10'h27 && init ) ? pn_d39[10] : 
                    ( pn10_deskew == 10'h28 && init ) ? pn_d40[10] : 
                    ( pn10_deskew == 10'h29 && init ) ? pn_d41[10] : 
                    ( pn10_deskew == 10'h2a && init ) ? pn_d42[10] : 
                    ( pn10_deskew == 10'h2b && init ) ? pn_d43[10] : 
                    ( pn10_deskew == 10'h2c && init ) ? pn_d44[10] : 
                    ( pn10_deskew == 10'h2d && init ) ? pn_d45[10] : 
                    ( pn10_deskew == 10'h2e && init ) ? pn_d46[10] : 
                    ( pn10_deskew == 10'h2f && init ) ? pn_d47[10] : 
                    ( pn10_deskew == 10'h30 && init ) ? pn_d48[10] : 
                    ( pn10_deskew == 10'h31 && init ) ? pn_d49[10] : 
                    ( pn10_deskew == 10'h32 && init ) ? pn_d50[10] : 
                    ( pn10_deskew == 10'h33 && init ) ? pn_d51[10] : 
                    ( pn10_deskew == 10'h34 && init ) ? pn_d52[10] : 
                    ( pn10_deskew == 10'h35 && init ) ? pn_d53[10] : 
                    ( pn10_deskew == 10'h36 && init ) ? pn_d54[10] : 
                    ( pn10_deskew == 10'h37 && init ) ? pn_d55[10] : 
                    ( pn10_deskew == 10'h38 && init ) ? pn_d56[10] : 
                    ( pn10_deskew == 10'h39 && init ) ? pn_d57[10] : 
                    ( pn10_deskew == 10'h3a && init ) ? pn_d58[10] : 
                    ( pn10_deskew == 10'h3b && init ) ? pn_d59[10] : 
                    ( pn10_deskew == 10'h3c && init ) ? pn_d60[10] : 
                    ( pn10_deskew == 10'h3d && init ) ? pn_d61[10] : 
                    ( pn10_deskew == 10'h3e && init ) ? pn_d62[10] : 
                    ( pn10_deskew == 10'h3f && init ) ? pn_d63[10] : 
                    ( pn10_deskew == 10'h40 && init ) ? pn_d64[10] : 
                    ( pn10_deskew == 10'h41 && init ) ? pn_d65[10] : 
                    ( pn10_deskew == 10'h42 && init ) ? pn_d66[10] : 
                    ( pn10_deskew == 10'h43 && init ) ? pn_d67[10] : 
                    ( pn10_deskew == 10'h44 && init ) ? pn_d68[10] : 
                    ( pn10_deskew == 10'h45 && init ) ? pn_d69[10] : 
                    ( pn10_deskew == 10'h46 && init ) ? pn_d70[10] : 
                    ( pn10_deskew == 10'h47 && init ) ? pn_d71[10] : 
                    ( pn10_deskew == 10'h48 && init ) ? pn_d72[10] : 
                    ( pn10_deskew == 10'h49 && init ) ? pn_d73[10] : 
                    ( pn10_deskew == 10'h4a && init ) ? pn_d74[10] : 
                    ( pn10_deskew == 10'h4b && init ) ? pn_d75[10] : 
                    ( pn10_deskew == 10'h4c && init ) ? pn_d76[10] : 
                    ( pn10_deskew == 10'h4d && init ) ? pn_d77[10] : 
                    ( pn10_deskew == 10'h4e && init ) ? pn_d78[10] : 
                    ( pn10_deskew == 10'h4f && init ) ? pn_d79[10] : 
                    ( pn10_deskew == 10'h50 && init ) ? pn_d80[10] : 
                    ( pn10_deskew == 10'h51 && init ) ? pn_d81[10] : 
                    ( pn10_deskew == 10'h52 && init ) ? pn_d82[10] : 
                    ( pn10_deskew == 10'h53 && init ) ? pn_d83[10] : 
                    ( pn10_deskew == 10'h54 && init ) ? pn_d84[10] : 
                    ( pn10_deskew == 10'h55 && init ) ? pn_d85[10] : 
                    ( pn10_deskew == 10'h56 && init ) ? pn_d86[10] : 
                    ( pn10_deskew == 10'h57 && init ) ? pn_d87[10] : 
                    ( pn10_deskew == 10'h58 && init ) ? pn_d88[10] : 
                    ( pn10_deskew == 10'h59 && init ) ? pn_d89[10] : 
                    ( pn10_deskew == 10'h5a && init ) ? pn_d90[10] : 
                    ( pn10_deskew == 10'h5b && init ) ? pn_d91[10] : 
                    ( pn10_deskew == 10'h5c && init ) ? pn_d92[10] : 
                    ( pn10_deskew == 10'h5d && init ) ? pn_d93[10] : 
                    ( pn10_deskew == 10'h5e && init ) ? pn_d94[10] : 
                    ( pn10_deskew == 10'h5f && init ) ? pn_d95[10] : 
                    ( pn10_deskew == 10'h60 && init ) ? pn_d96[10] : 
                    ( pn10_deskew == 10'h61 && init ) ? pn_d97[10] : 
                    ( pn10_deskew == 10'h62 && init ) ? pn_d98[10] : 
                    ( pn10_deskew == 10'h63 && init ) ? pn_d99[10] : 
                    ( pn10_deskew == 10'h64 && init ) ? pn_d100[10] : 
                    ( pn10_deskew == 10'h65 && init ) ? pn_d101[10] : 
                    ( pn10_deskew == 10'h66 && init ) ? pn_d102[10] : 
                    ( pn10_deskew == 10'h67 && init ) ? pn_d103[10] : 
                    ( pn10_deskew == 10'h68 && init ) ? pn_d104[10] : 
                    ( pn10_deskew == 10'h69 && init ) ? pn_d105[10] : 
                    ( pn10_deskew == 10'h6a && init ) ? pn_d106[10] : 
                    ( pn10_deskew == 10'h6b && init ) ? pn_d107[10] : 
                    ( pn10_deskew == 10'h6c && init ) ? pn_d108[10] : 
                    ( pn10_deskew == 10'h6d && init ) ? pn_d109[10] : 
                    ( pn10_deskew == 10'h6e && init ) ? pn_d110[10] : 
                    ( pn10_deskew == 10'h6f && init ) ? pn_d111[10] : 
                    ( pn10_deskew == 10'h70 && init ) ? pn_d112[10] : 
                    ( pn10_deskew == 10'h71 && init ) ? pn_d113[10] : 
                    ( pn10_deskew == 10'h72 && init ) ? pn_d114[10] : 
                    ( pn10_deskew == 10'h73 && init ) ? pn_d115[10] : 
                    ( pn10_deskew == 10'h74 && init ) ? pn_d116[10] : 
                    ( pn10_deskew == 10'h75 && init ) ? pn_d117[10] : 
                    ( pn10_deskew == 10'h76 && init ) ? pn_d118[10] : 
                    ( pn10_deskew == 10'h77 && init ) ? pn_d119[10] : 
                    ( pn10_deskew == 10'h78 && init ) ? pn_d120[10] : 
                    ( pn10_deskew == 10'h79 && init ) ? pn_d121[10] : 
                    ( pn10_deskew == 10'h7a && init ) ? pn_d122[10] : 
                    ( pn10_deskew == 10'h7b && init ) ? pn_d123[10] : 
                    ( pn10_deskew == 10'h7c && init ) ? pn_d124[10] : 
                    ( pn10_deskew == 10'h7d && init ) ? pn_d125[10] : 
                    ( pn10_deskew == 10'h7e && init ) ? pn_d126[10] : 
                    ( pn10_deskew == 10'h7f && init ) ? pn_d127[10] : 
                    ( pn10_deskew == 10'h80 && init ) ? pn_d128[10] : 
                    ( pn10_deskew == 10'h81 && init ) ? pn_d129[10] : 
                    ( pn10_deskew == 10'h82 && init ) ? pn_d130[10] : 
                    ( pn10_deskew == 10'h83 && init ) ? pn_d131[10] : 
                    ( pn10_deskew == 10'h84 && init ) ? pn_d132[10] : 
                    ( pn10_deskew == 10'h85 && init ) ? pn_d133[10] : 
                    ( pn10_deskew == 10'h86 && init ) ? pn_d134[10] : 
                    ( pn10_deskew == 10'h87 && init ) ? pn_d135[10] : 
                    ( pn10_deskew == 10'h88 && init ) ? pn_d136[10] : 
                    ( pn10_deskew == 10'h89 && init ) ? pn_d137[10] : 
                    ( pn10_deskew == 10'h8a && init ) ? pn_d138[10] : 
                    ( pn10_deskew == 10'h8b && init ) ? pn_d139[10] : 
                    ( pn10_deskew == 10'h8c && init ) ? pn_d140[10] : 
                    ( pn10_deskew == 10'h8d && init ) ? pn_d141[10] : 
                    ( pn10_deskew == 10'h8e && init ) ? pn_d142[10] : 
                    ( pn10_deskew == 10'h8f && init ) ? pn_d143[10] : 
                    ( pn10_deskew == 10'h90 && init ) ? pn_d144[10] : 
                    ( pn10_deskew == 10'h91 && init ) ? pn_d145[10] : pn_in[10]; 
assign pn_out_local[11] = ( pn11_deskew == 10'h0 && init ) ? pn_in[11] : 
                    ( pn11_deskew == 10'h1 && init ) ? pn_d1[11] : 
                    ( pn11_deskew == 10'h2 && init ) ? pn_d2[11] : 
                    ( pn11_deskew == 10'h3 && init ) ? pn_d3[11] : 
                    ( pn11_deskew == 10'h4 && init ) ? pn_d4[11] : 
                    ( pn11_deskew == 10'h5 && init ) ? pn_d5[11] : 
                    ( pn11_deskew == 10'h6 && init ) ? pn_d6[11] : 
                    ( pn11_deskew == 10'h7 && init ) ? pn_d7[11] : 
                    ( pn11_deskew == 10'h8 && init ) ? pn_d8[11] : 
                    ( pn11_deskew == 10'h9 && init ) ? pn_d9[11] : 
                    ( pn11_deskew == 10'ha && init ) ? pn_d10[11] : 
                    ( pn11_deskew == 10'hb && init ) ? pn_d11[11] : 
                    ( pn11_deskew == 10'hc && init ) ? pn_d12[11] : 
                    ( pn11_deskew == 10'hd && init ) ? pn_d13[11] : 
                    ( pn11_deskew == 10'he && init ) ? pn_d14[11] : 
                    ( pn11_deskew == 10'hf && init ) ? pn_d15[11] : 
                    ( pn11_deskew == 10'h10 && init ) ? pn_d16[11] : 
                    ( pn11_deskew == 10'h11 && init ) ? pn_d17[11] : 
                    ( pn11_deskew == 10'h12 && init ) ? pn_d18[11] : 
                    ( pn11_deskew == 10'h13 && init ) ? pn_d19[11] : 
                    ( pn11_deskew == 10'h14 && init ) ? pn_d20[11] : 
                    ( pn11_deskew == 10'h15 && init ) ? pn_d21[11] : 
                    ( pn11_deskew == 10'h16 && init ) ? pn_d22[11] : 
                    ( pn11_deskew == 10'h17 && init ) ? pn_d23[11] : 
                    ( pn11_deskew == 10'h18 && init ) ? pn_d24[11] : 
                    ( pn11_deskew == 10'h19 && init ) ? pn_d25[11] : 
                    ( pn11_deskew == 10'h1a && init ) ? pn_d26[11] : 
                    ( pn11_deskew == 10'h1b && init ) ? pn_d27[11] : 
                    ( pn11_deskew == 10'h1c && init ) ? pn_d28[11] : 
                    ( pn11_deskew == 10'h1d && init ) ? pn_d29[11] : 
                    ( pn11_deskew == 10'h1e && init ) ? pn_d30[11] : 
                    ( pn11_deskew == 10'h1f && init ) ? pn_d31[11] : 
                    ( pn11_deskew == 10'h20 && init ) ? pn_d32[11] : 
                    ( pn11_deskew == 10'h21 && init ) ? pn_d33[11] : 
                    ( pn11_deskew == 10'h22 && init ) ? pn_d34[11] : 
                    ( pn11_deskew == 10'h23 && init ) ? pn_d35[11] : 
                    ( pn11_deskew == 10'h24 && init ) ? pn_d36[11] : 
                    ( pn11_deskew == 10'h25 && init ) ? pn_d37[11] : 
                    ( pn11_deskew == 10'h26 && init ) ? pn_d38[11] : 
                    ( pn11_deskew == 10'h27 && init ) ? pn_d39[11] : 
                    ( pn11_deskew == 10'h28 && init ) ? pn_d40[11] : 
                    ( pn11_deskew == 10'h29 && init ) ? pn_d41[11] : 
                    ( pn11_deskew == 10'h2a && init ) ? pn_d42[11] : 
                    ( pn11_deskew == 10'h2b && init ) ? pn_d43[11] : 
                    ( pn11_deskew == 10'h2c && init ) ? pn_d44[11] : 
                    ( pn11_deskew == 10'h2d && init ) ? pn_d45[11] : 
                    ( pn11_deskew == 10'h2e && init ) ? pn_d46[11] : 
                    ( pn11_deskew == 10'h2f && init ) ? pn_d47[11] : 
                    ( pn11_deskew == 10'h30 && init ) ? pn_d48[11] : 
                    ( pn11_deskew == 10'h31 && init ) ? pn_d49[11] : 
                    ( pn11_deskew == 10'h32 && init ) ? pn_d50[11] : 
                    ( pn11_deskew == 10'h33 && init ) ? pn_d51[11] : 
                    ( pn11_deskew == 10'h34 && init ) ? pn_d52[11] : 
                    ( pn11_deskew == 10'h35 && init ) ? pn_d53[11] : 
                    ( pn11_deskew == 10'h36 && init ) ? pn_d54[11] : 
                    ( pn11_deskew == 10'h37 && init ) ? pn_d55[11] : 
                    ( pn11_deskew == 10'h38 && init ) ? pn_d56[11] : 
                    ( pn11_deskew == 10'h39 && init ) ? pn_d57[11] : 
                    ( pn11_deskew == 10'h3a && init ) ? pn_d58[11] : 
                    ( pn11_deskew == 10'h3b && init ) ? pn_d59[11] : 
                    ( pn11_deskew == 10'h3c && init ) ? pn_d60[11] : 
                    ( pn11_deskew == 10'h3d && init ) ? pn_d61[11] : 
                    ( pn11_deskew == 10'h3e && init ) ? pn_d62[11] : 
                    ( pn11_deskew == 10'h3f && init ) ? pn_d63[11] : 
                    ( pn11_deskew == 10'h40 && init ) ? pn_d64[11] : 
                    ( pn11_deskew == 10'h41 && init ) ? pn_d65[11] : 
                    ( pn11_deskew == 10'h42 && init ) ? pn_d66[11] : 
                    ( pn11_deskew == 10'h43 && init ) ? pn_d67[11] : 
                    ( pn11_deskew == 10'h44 && init ) ? pn_d68[11] : 
                    ( pn11_deskew == 10'h45 && init ) ? pn_d69[11] : 
                    ( pn11_deskew == 10'h46 && init ) ? pn_d70[11] : 
                    ( pn11_deskew == 10'h47 && init ) ? pn_d71[11] : 
                    ( pn11_deskew == 10'h48 && init ) ? pn_d72[11] : 
                    ( pn11_deskew == 10'h49 && init ) ? pn_d73[11] : 
                    ( pn11_deskew == 10'h4a && init ) ? pn_d74[11] : 
                    ( pn11_deskew == 10'h4b && init ) ? pn_d75[11] : 
                    ( pn11_deskew == 10'h4c && init ) ? pn_d76[11] : 
                    ( pn11_deskew == 10'h4d && init ) ? pn_d77[11] : 
                    ( pn11_deskew == 10'h4e && init ) ? pn_d78[11] : 
                    ( pn11_deskew == 10'h4f && init ) ? pn_d79[11] : 
                    ( pn11_deskew == 10'h50 && init ) ? pn_d80[11] : 
                    ( pn11_deskew == 10'h51 && init ) ? pn_d81[11] : 
                    ( pn11_deskew == 10'h52 && init ) ? pn_d82[11] : 
                    ( pn11_deskew == 10'h53 && init ) ? pn_d83[11] : 
                    ( pn11_deskew == 10'h54 && init ) ? pn_d84[11] : 
                    ( pn11_deskew == 10'h55 && init ) ? pn_d85[11] : 
                    ( pn11_deskew == 10'h56 && init ) ? pn_d86[11] : 
                    ( pn11_deskew == 10'h57 && init ) ? pn_d87[11] : 
                    ( pn11_deskew == 10'h58 && init ) ? pn_d88[11] : 
                    ( pn11_deskew == 10'h59 && init ) ? pn_d89[11] : 
                    ( pn11_deskew == 10'h5a && init ) ? pn_d90[11] : 
                    ( pn11_deskew == 10'h5b && init ) ? pn_d91[11] : 
                    ( pn11_deskew == 10'h5c && init ) ? pn_d92[11] : 
                    ( pn11_deskew == 10'h5d && init ) ? pn_d93[11] : 
                    ( pn11_deskew == 10'h5e && init ) ? pn_d94[11] : 
                    ( pn11_deskew == 10'h5f && init ) ? pn_d95[11] : 
                    ( pn11_deskew == 10'h60 && init ) ? pn_d96[11] : 
                    ( pn11_deskew == 10'h61 && init ) ? pn_d97[11] : 
                    ( pn11_deskew == 10'h62 && init ) ? pn_d98[11] : 
                    ( pn11_deskew == 10'h63 && init ) ? pn_d99[11] : 
                    ( pn11_deskew == 10'h64 && init ) ? pn_d100[11] : 
                    ( pn11_deskew == 10'h65 && init ) ? pn_d101[11] : 
                    ( pn11_deskew == 10'h66 && init ) ? pn_d102[11] : 
                    ( pn11_deskew == 10'h67 && init ) ? pn_d103[11] : 
                    ( pn11_deskew == 10'h68 && init ) ? pn_d104[11] : 
                    ( pn11_deskew == 10'h69 && init ) ? pn_d105[11] : 
                    ( pn11_deskew == 10'h6a && init ) ? pn_d106[11] : 
                    ( pn11_deskew == 10'h6b && init ) ? pn_d107[11] : 
                    ( pn11_deskew == 10'h6c && init ) ? pn_d108[11] : 
                    ( pn11_deskew == 10'h6d && init ) ? pn_d109[11] : 
                    ( pn11_deskew == 10'h6e && init ) ? pn_d110[11] : 
                    ( pn11_deskew == 10'h6f && init ) ? pn_d111[11] : 
                    ( pn11_deskew == 10'h70 && init ) ? pn_d112[11] : 
                    ( pn11_deskew == 10'h71 && init ) ? pn_d113[11] : 
                    ( pn11_deskew == 10'h72 && init ) ? pn_d114[11] : 
                    ( pn11_deskew == 10'h73 && init ) ? pn_d115[11] : 
                    ( pn11_deskew == 10'h74 && init ) ? pn_d116[11] : 
                    ( pn11_deskew == 10'h75 && init ) ? pn_d117[11] : 
                    ( pn11_deskew == 10'h76 && init ) ? pn_d118[11] : 
                    ( pn11_deskew == 10'h77 && init ) ? pn_d119[11] : 
                    ( pn11_deskew == 10'h78 && init ) ? pn_d120[11] : 
                    ( pn11_deskew == 10'h79 && init ) ? pn_d121[11] : 
                    ( pn11_deskew == 10'h7a && init ) ? pn_d122[11] : 
                    ( pn11_deskew == 10'h7b && init ) ? pn_d123[11] : 
                    ( pn11_deskew == 10'h7c && init ) ? pn_d124[11] : 
                    ( pn11_deskew == 10'h7d && init ) ? pn_d125[11] : 
                    ( pn11_deskew == 10'h7e && init ) ? pn_d126[11] : 
                    ( pn11_deskew == 10'h7f && init ) ? pn_d127[11] : 
                    ( pn11_deskew == 10'h80 && init ) ? pn_d128[11] : 
                    ( pn11_deskew == 10'h81 && init ) ? pn_d129[11] : 
                    ( pn11_deskew == 10'h82 && init ) ? pn_d130[11] : 
                    ( pn11_deskew == 10'h83 && init ) ? pn_d131[11] : 
                    ( pn11_deskew == 10'h84 && init ) ? pn_d132[11] : 
                    ( pn11_deskew == 10'h85 && init ) ? pn_d133[11] : 
                    ( pn11_deskew == 10'h86 && init ) ? pn_d134[11] : 
                    ( pn11_deskew == 10'h87 && init ) ? pn_d135[11] : 
                    ( pn11_deskew == 10'h88 && init ) ? pn_d136[11] : 
                    ( pn11_deskew == 10'h89 && init ) ? pn_d137[11] : 
                    ( pn11_deskew == 10'h8a && init ) ? pn_d138[11] : 
                    ( pn11_deskew == 10'h8b && init ) ? pn_d139[11] : 
                    ( pn11_deskew == 10'h8c && init ) ? pn_d140[11] : 
                    ( pn11_deskew == 10'h8d && init ) ? pn_d141[11] : 
                    ( pn11_deskew == 10'h8e && init ) ? pn_d142[11] : 
                    ( pn11_deskew == 10'h8f && init ) ? pn_d143[11] : 
                    ( pn11_deskew == 10'h90 && init ) ? pn_d144[11] : 
                    ( pn11_deskew == 10'h91 && init ) ? pn_d145[11] : pn_in[11]; 
assign pn_out_local[12] = ( pn12_deskew == 10'h0 && init ) ? pn_in[12] : 
                    ( pn12_deskew == 10'h1 && init ) ? pn_d1[12] : 
                    ( pn12_deskew == 10'h2 && init ) ? pn_d2[12] : 
                    ( pn12_deskew == 10'h3 && init ) ? pn_d3[12] : 
                    ( pn12_deskew == 10'h4 && init ) ? pn_d4[12] : 
                    ( pn12_deskew == 10'h5 && init ) ? pn_d5[12] : 
                    ( pn12_deskew == 10'h6 && init ) ? pn_d6[12] : 
                    ( pn12_deskew == 10'h7 && init ) ? pn_d7[12] : 
                    ( pn12_deskew == 10'h8 && init ) ? pn_d8[12] : 
                    ( pn12_deskew == 10'h9 && init ) ? pn_d9[12] : 
                    ( pn12_deskew == 10'ha && init ) ? pn_d10[12] : 
                    ( pn12_deskew == 10'hb && init ) ? pn_d11[12] : 
                    ( pn12_deskew == 10'hc && init ) ? pn_d12[12] : 
                    ( pn12_deskew == 10'hd && init ) ? pn_d13[12] : 
                    ( pn12_deskew == 10'he && init ) ? pn_d14[12] : 
                    ( pn12_deskew == 10'hf && init ) ? pn_d15[12] : 
                    ( pn12_deskew == 10'h10 && init ) ? pn_d16[12] : 
                    ( pn12_deskew == 10'h11 && init ) ? pn_d17[12] : 
                    ( pn12_deskew == 10'h12 && init ) ? pn_d18[12] : 
                    ( pn12_deskew == 10'h13 && init ) ? pn_d19[12] : 
                    ( pn12_deskew == 10'h14 && init ) ? pn_d20[12] : 
                    ( pn12_deskew == 10'h15 && init ) ? pn_d21[12] : 
                    ( pn12_deskew == 10'h16 && init ) ? pn_d22[12] : 
                    ( pn12_deskew == 10'h17 && init ) ? pn_d23[12] : 
                    ( pn12_deskew == 10'h18 && init ) ? pn_d24[12] : 
                    ( pn12_deskew == 10'h19 && init ) ? pn_d25[12] : 
                    ( pn12_deskew == 10'h1a && init ) ? pn_d26[12] : 
                    ( pn12_deskew == 10'h1b && init ) ? pn_d27[12] : 
                    ( pn12_deskew == 10'h1c && init ) ? pn_d28[12] : 
                    ( pn12_deskew == 10'h1d && init ) ? pn_d29[12] : 
                    ( pn12_deskew == 10'h1e && init ) ? pn_d30[12] : 
                    ( pn12_deskew == 10'h1f && init ) ? pn_d31[12] : 
                    ( pn12_deskew == 10'h20 && init ) ? pn_d32[12] : 
                    ( pn12_deskew == 10'h21 && init ) ? pn_d33[12] : 
                    ( pn12_deskew == 10'h22 && init ) ? pn_d34[12] : 
                    ( pn12_deskew == 10'h23 && init ) ? pn_d35[12] : 
                    ( pn12_deskew == 10'h24 && init ) ? pn_d36[12] : 
                    ( pn12_deskew == 10'h25 && init ) ? pn_d37[12] : 
                    ( pn12_deskew == 10'h26 && init ) ? pn_d38[12] : 
                    ( pn12_deskew == 10'h27 && init ) ? pn_d39[12] : 
                    ( pn12_deskew == 10'h28 && init ) ? pn_d40[12] : 
                    ( pn12_deskew == 10'h29 && init ) ? pn_d41[12] : 
                    ( pn12_deskew == 10'h2a && init ) ? pn_d42[12] : 
                    ( pn12_deskew == 10'h2b && init ) ? pn_d43[12] : 
                    ( pn12_deskew == 10'h2c && init ) ? pn_d44[12] : 
                    ( pn12_deskew == 10'h2d && init ) ? pn_d45[12] : 
                    ( pn12_deskew == 10'h2e && init ) ? pn_d46[12] : 
                    ( pn12_deskew == 10'h2f && init ) ? pn_d47[12] : 
                    ( pn12_deskew == 10'h30 && init ) ? pn_d48[12] : 
                    ( pn12_deskew == 10'h31 && init ) ? pn_d49[12] : 
                    ( pn12_deskew == 10'h32 && init ) ? pn_d50[12] : 
                    ( pn12_deskew == 10'h33 && init ) ? pn_d51[12] : 
                    ( pn12_deskew == 10'h34 && init ) ? pn_d52[12] : 
                    ( pn12_deskew == 10'h35 && init ) ? pn_d53[12] : 
                    ( pn12_deskew == 10'h36 && init ) ? pn_d54[12] : 
                    ( pn12_deskew == 10'h37 && init ) ? pn_d55[12] : 
                    ( pn12_deskew == 10'h38 && init ) ? pn_d56[12] : 
                    ( pn12_deskew == 10'h39 && init ) ? pn_d57[12] : 
                    ( pn12_deskew == 10'h3a && init ) ? pn_d58[12] : 
                    ( pn12_deskew == 10'h3b && init ) ? pn_d59[12] : 
                    ( pn12_deskew == 10'h3c && init ) ? pn_d60[12] : 
                    ( pn12_deskew == 10'h3d && init ) ? pn_d61[12] : 
                    ( pn12_deskew == 10'h3e && init ) ? pn_d62[12] : 
                    ( pn12_deskew == 10'h3f && init ) ? pn_d63[12] : 
                    ( pn12_deskew == 10'h40 && init ) ? pn_d64[12] : 
                    ( pn12_deskew == 10'h41 && init ) ? pn_d65[12] : 
                    ( pn12_deskew == 10'h42 && init ) ? pn_d66[12] : 
                    ( pn12_deskew == 10'h43 && init ) ? pn_d67[12] : 
                    ( pn12_deskew == 10'h44 && init ) ? pn_d68[12] : 
                    ( pn12_deskew == 10'h45 && init ) ? pn_d69[12] : 
                    ( pn12_deskew == 10'h46 && init ) ? pn_d70[12] : 
                    ( pn12_deskew == 10'h47 && init ) ? pn_d71[12] : 
                    ( pn12_deskew == 10'h48 && init ) ? pn_d72[12] : 
                    ( pn12_deskew == 10'h49 && init ) ? pn_d73[12] : 
                    ( pn12_deskew == 10'h4a && init ) ? pn_d74[12] : 
                    ( pn12_deskew == 10'h4b && init ) ? pn_d75[12] : 
                    ( pn12_deskew == 10'h4c && init ) ? pn_d76[12] : 
                    ( pn12_deskew == 10'h4d && init ) ? pn_d77[12] : 
                    ( pn12_deskew == 10'h4e && init ) ? pn_d78[12] : 
                    ( pn12_deskew == 10'h4f && init ) ? pn_d79[12] : 
                    ( pn12_deskew == 10'h50 && init ) ? pn_d80[12] : 
                    ( pn12_deskew == 10'h51 && init ) ? pn_d81[12] : 
                    ( pn12_deskew == 10'h52 && init ) ? pn_d82[12] : 
                    ( pn12_deskew == 10'h53 && init ) ? pn_d83[12] : 
                    ( pn12_deskew == 10'h54 && init ) ? pn_d84[12] : 
                    ( pn12_deskew == 10'h55 && init ) ? pn_d85[12] : 
                    ( pn12_deskew == 10'h56 && init ) ? pn_d86[12] : 
                    ( pn12_deskew == 10'h57 && init ) ? pn_d87[12] : 
                    ( pn12_deskew == 10'h58 && init ) ? pn_d88[12] : 
                    ( pn12_deskew == 10'h59 && init ) ? pn_d89[12] : 
                    ( pn12_deskew == 10'h5a && init ) ? pn_d90[12] : 
                    ( pn12_deskew == 10'h5b && init ) ? pn_d91[12] : 
                    ( pn12_deskew == 10'h5c && init ) ? pn_d92[12] : 
                    ( pn12_deskew == 10'h5d && init ) ? pn_d93[12] : 
                    ( pn12_deskew == 10'h5e && init ) ? pn_d94[12] : 
                    ( pn12_deskew == 10'h5f && init ) ? pn_d95[12] : 
                    ( pn12_deskew == 10'h60 && init ) ? pn_d96[12] : 
                    ( pn12_deskew == 10'h61 && init ) ? pn_d97[12] : 
                    ( pn12_deskew == 10'h62 && init ) ? pn_d98[12] : 
                    ( pn12_deskew == 10'h63 && init ) ? pn_d99[12] : 
                    ( pn12_deskew == 10'h64 && init ) ? pn_d100[12] : 
                    ( pn12_deskew == 10'h65 && init ) ? pn_d101[12] : 
                    ( pn12_deskew == 10'h66 && init ) ? pn_d102[12] : 
                    ( pn12_deskew == 10'h67 && init ) ? pn_d103[12] : 
                    ( pn12_deskew == 10'h68 && init ) ? pn_d104[12] : 
                    ( pn12_deskew == 10'h69 && init ) ? pn_d105[12] : 
                    ( pn12_deskew == 10'h6a && init ) ? pn_d106[12] : 
                    ( pn12_deskew == 10'h6b && init ) ? pn_d107[12] : 
                    ( pn12_deskew == 10'h6c && init ) ? pn_d108[12] : 
                    ( pn12_deskew == 10'h6d && init ) ? pn_d109[12] : 
                    ( pn12_deskew == 10'h6e && init ) ? pn_d110[12] : 
                    ( pn12_deskew == 10'h6f && init ) ? pn_d111[12] : 
                    ( pn12_deskew == 10'h70 && init ) ? pn_d112[12] : 
                    ( pn12_deskew == 10'h71 && init ) ? pn_d113[12] : 
                    ( pn12_deskew == 10'h72 && init ) ? pn_d114[12] : 
                    ( pn12_deskew == 10'h73 && init ) ? pn_d115[12] : 
                    ( pn12_deskew == 10'h74 && init ) ? pn_d116[12] : 
                    ( pn12_deskew == 10'h75 && init ) ? pn_d117[12] : 
                    ( pn12_deskew == 10'h76 && init ) ? pn_d118[12] : 
                    ( pn12_deskew == 10'h77 && init ) ? pn_d119[12] : 
                    ( pn12_deskew == 10'h78 && init ) ? pn_d120[12] : 
                    ( pn12_deskew == 10'h79 && init ) ? pn_d121[12] : 
                    ( pn12_deskew == 10'h7a && init ) ? pn_d122[12] : 
                    ( pn12_deskew == 10'h7b && init ) ? pn_d123[12] : 
                    ( pn12_deskew == 10'h7c && init ) ? pn_d124[12] : 
                    ( pn12_deskew == 10'h7d && init ) ? pn_d125[12] : 
                    ( pn12_deskew == 10'h7e && init ) ? pn_d126[12] : 
                    ( pn12_deskew == 10'h7f && init ) ? pn_d127[12] : 
                    ( pn12_deskew == 10'h80 && init ) ? pn_d128[12] : 
                    ( pn12_deskew == 10'h81 && init ) ? pn_d129[12] : 
                    ( pn12_deskew == 10'h82 && init ) ? pn_d130[12] : 
                    ( pn12_deskew == 10'h83 && init ) ? pn_d131[12] : 
                    ( pn12_deskew == 10'h84 && init ) ? pn_d132[12] : 
                    ( pn12_deskew == 10'h85 && init ) ? pn_d133[12] : 
                    ( pn12_deskew == 10'h86 && init ) ? pn_d134[12] : 
                    ( pn12_deskew == 10'h87 && init ) ? pn_d135[12] : 
                    ( pn12_deskew == 10'h88 && init ) ? pn_d136[12] : 
                    ( pn12_deskew == 10'h89 && init ) ? pn_d137[12] : 
                    ( pn12_deskew == 10'h8a && init ) ? pn_d138[12] : 
                    ( pn12_deskew == 10'h8b && init ) ? pn_d139[12] : 
                    ( pn12_deskew == 10'h8c && init ) ? pn_d140[12] : 
                    ( pn12_deskew == 10'h8d && init ) ? pn_d141[12] : 
                    ( pn12_deskew == 10'h8e && init ) ? pn_d142[12] : 
                    ( pn12_deskew == 10'h8f && init ) ? pn_d143[12] : 
                    ( pn12_deskew == 10'h90 && init ) ? pn_d144[12] : 
                    ( pn12_deskew == 10'h91 && init ) ? pn_d145[12] : pn_in[12]; 
assign pn_out_local[13] = ( pn13_deskew == 10'h0 && init ) ? pn_in[13] : 
                    ( pn13_deskew == 10'h1 && init ) ? pn_d1[13] : 
                    ( pn13_deskew == 10'h2 && init ) ? pn_d2[13] : 
                    ( pn13_deskew == 10'h3 && init ) ? pn_d3[13] : 
                    ( pn13_deskew == 10'h4 && init ) ? pn_d4[13] : 
                    ( pn13_deskew == 10'h5 && init ) ? pn_d5[13] : 
                    ( pn13_deskew == 10'h6 && init ) ? pn_d6[13] : 
                    ( pn13_deskew == 10'h7 && init ) ? pn_d7[13] : 
                    ( pn13_deskew == 10'h8 && init ) ? pn_d8[13] : 
                    ( pn13_deskew == 10'h9 && init ) ? pn_d9[13] : 
                    ( pn13_deskew == 10'ha && init ) ? pn_d10[13] : 
                    ( pn13_deskew == 10'hb && init ) ? pn_d11[13] : 
                    ( pn13_deskew == 10'hc && init ) ? pn_d12[13] : 
                    ( pn13_deskew == 10'hd && init ) ? pn_d13[13] : 
                    ( pn13_deskew == 10'he && init ) ? pn_d14[13] : 
                    ( pn13_deskew == 10'hf && init ) ? pn_d15[13] : 
                    ( pn13_deskew == 10'h10 && init ) ? pn_d16[13] : 
                    ( pn13_deskew == 10'h11 && init ) ? pn_d17[13] : 
                    ( pn13_deskew == 10'h12 && init ) ? pn_d18[13] : 
                    ( pn13_deskew == 10'h13 && init ) ? pn_d19[13] : 
                    ( pn13_deskew == 10'h14 && init ) ? pn_d20[13] : 
                    ( pn13_deskew == 10'h15 && init ) ? pn_d21[13] : 
                    ( pn13_deskew == 10'h16 && init ) ? pn_d22[13] : 
                    ( pn13_deskew == 10'h17 && init ) ? pn_d23[13] : 
                    ( pn13_deskew == 10'h18 && init ) ? pn_d24[13] : 
                    ( pn13_deskew == 10'h19 && init ) ? pn_d25[13] : 
                    ( pn13_deskew == 10'h1a && init ) ? pn_d26[13] : 
                    ( pn13_deskew == 10'h1b && init ) ? pn_d27[13] : 
                    ( pn13_deskew == 10'h1c && init ) ? pn_d28[13] : 
                    ( pn13_deskew == 10'h1d && init ) ? pn_d29[13] : 
                    ( pn13_deskew == 10'h1e && init ) ? pn_d30[13] : 
                    ( pn13_deskew == 10'h1f && init ) ? pn_d31[13] : 
                    ( pn13_deskew == 10'h20 && init ) ? pn_d32[13] : 
                    ( pn13_deskew == 10'h21 && init ) ? pn_d33[13] : 
                    ( pn13_deskew == 10'h22 && init ) ? pn_d34[13] : 
                    ( pn13_deskew == 10'h23 && init ) ? pn_d35[13] : 
                    ( pn13_deskew == 10'h24 && init ) ? pn_d36[13] : 
                    ( pn13_deskew == 10'h25 && init ) ? pn_d37[13] : 
                    ( pn13_deskew == 10'h26 && init ) ? pn_d38[13] : 
                    ( pn13_deskew == 10'h27 && init ) ? pn_d39[13] : 
                    ( pn13_deskew == 10'h28 && init ) ? pn_d40[13] : 
                    ( pn13_deskew == 10'h29 && init ) ? pn_d41[13] : 
                    ( pn13_deskew == 10'h2a && init ) ? pn_d42[13] : 
                    ( pn13_deskew == 10'h2b && init ) ? pn_d43[13] : 
                    ( pn13_deskew == 10'h2c && init ) ? pn_d44[13] : 
                    ( pn13_deskew == 10'h2d && init ) ? pn_d45[13] : 
                    ( pn13_deskew == 10'h2e && init ) ? pn_d46[13] : 
                    ( pn13_deskew == 10'h2f && init ) ? pn_d47[13] : 
                    ( pn13_deskew == 10'h30 && init ) ? pn_d48[13] : 
                    ( pn13_deskew == 10'h31 && init ) ? pn_d49[13] : 
                    ( pn13_deskew == 10'h32 && init ) ? pn_d50[13] : 
                    ( pn13_deskew == 10'h33 && init ) ? pn_d51[13] : 
                    ( pn13_deskew == 10'h34 && init ) ? pn_d52[13] : 
                    ( pn13_deskew == 10'h35 && init ) ? pn_d53[13] : 
                    ( pn13_deskew == 10'h36 && init ) ? pn_d54[13] : 
                    ( pn13_deskew == 10'h37 && init ) ? pn_d55[13] : 
                    ( pn13_deskew == 10'h38 && init ) ? pn_d56[13] : 
                    ( pn13_deskew == 10'h39 && init ) ? pn_d57[13] : 
                    ( pn13_deskew == 10'h3a && init ) ? pn_d58[13] : 
                    ( pn13_deskew == 10'h3b && init ) ? pn_d59[13] : 
                    ( pn13_deskew == 10'h3c && init ) ? pn_d60[13] : 
                    ( pn13_deskew == 10'h3d && init ) ? pn_d61[13] : 
                    ( pn13_deskew == 10'h3e && init ) ? pn_d62[13] : 
                    ( pn13_deskew == 10'h3f && init ) ? pn_d63[13] : 
                    ( pn13_deskew == 10'h40 && init ) ? pn_d64[13] : 
                    ( pn13_deskew == 10'h41 && init ) ? pn_d65[13] : 
                    ( pn13_deskew == 10'h42 && init ) ? pn_d66[13] : 
                    ( pn13_deskew == 10'h43 && init ) ? pn_d67[13] : 
                    ( pn13_deskew == 10'h44 && init ) ? pn_d68[13] : 
                    ( pn13_deskew == 10'h45 && init ) ? pn_d69[13] : 
                    ( pn13_deskew == 10'h46 && init ) ? pn_d70[13] : 
                    ( pn13_deskew == 10'h47 && init ) ? pn_d71[13] : 
                    ( pn13_deskew == 10'h48 && init ) ? pn_d72[13] : 
                    ( pn13_deskew == 10'h49 && init ) ? pn_d73[13] : 
                    ( pn13_deskew == 10'h4a && init ) ? pn_d74[13] : 
                    ( pn13_deskew == 10'h4b && init ) ? pn_d75[13] : 
                    ( pn13_deskew == 10'h4c && init ) ? pn_d76[13] : 
                    ( pn13_deskew == 10'h4d && init ) ? pn_d77[13] : 
                    ( pn13_deskew == 10'h4e && init ) ? pn_d78[13] : 
                    ( pn13_deskew == 10'h4f && init ) ? pn_d79[13] : 
                    ( pn13_deskew == 10'h50 && init ) ? pn_d80[13] : 
                    ( pn13_deskew == 10'h51 && init ) ? pn_d81[13] : 
                    ( pn13_deskew == 10'h52 && init ) ? pn_d82[13] : 
                    ( pn13_deskew == 10'h53 && init ) ? pn_d83[13] : 
                    ( pn13_deskew == 10'h54 && init ) ? pn_d84[13] : 
                    ( pn13_deskew == 10'h55 && init ) ? pn_d85[13] : 
                    ( pn13_deskew == 10'h56 && init ) ? pn_d86[13] : 
                    ( pn13_deskew == 10'h57 && init ) ? pn_d87[13] : 
                    ( pn13_deskew == 10'h58 && init ) ? pn_d88[13] : 
                    ( pn13_deskew == 10'h59 && init ) ? pn_d89[13] : 
                    ( pn13_deskew == 10'h5a && init ) ? pn_d90[13] : 
                    ( pn13_deskew == 10'h5b && init ) ? pn_d91[13] : 
                    ( pn13_deskew == 10'h5c && init ) ? pn_d92[13] : 
                    ( pn13_deskew == 10'h5d && init ) ? pn_d93[13] : 
                    ( pn13_deskew == 10'h5e && init ) ? pn_d94[13] : 
                    ( pn13_deskew == 10'h5f && init ) ? pn_d95[13] : 
                    ( pn13_deskew == 10'h60 && init ) ? pn_d96[13] : 
                    ( pn13_deskew == 10'h61 && init ) ? pn_d97[13] : 
                    ( pn13_deskew == 10'h62 && init ) ? pn_d98[13] : 
                    ( pn13_deskew == 10'h63 && init ) ? pn_d99[13] : 
                    ( pn13_deskew == 10'h64 && init ) ? pn_d100[13] : 
                    ( pn13_deskew == 10'h65 && init ) ? pn_d101[13] : 
                    ( pn13_deskew == 10'h66 && init ) ? pn_d102[13] : 
                    ( pn13_deskew == 10'h67 && init ) ? pn_d103[13] : 
                    ( pn13_deskew == 10'h68 && init ) ? pn_d104[13] : 
                    ( pn13_deskew == 10'h69 && init ) ? pn_d105[13] : 
                    ( pn13_deskew == 10'h6a && init ) ? pn_d106[13] : 
                    ( pn13_deskew == 10'h6b && init ) ? pn_d107[13] : 
                    ( pn13_deskew == 10'h6c && init ) ? pn_d108[13] : 
                    ( pn13_deskew == 10'h6d && init ) ? pn_d109[13] : 
                    ( pn13_deskew == 10'h6e && init ) ? pn_d110[13] : 
                    ( pn13_deskew == 10'h6f && init ) ? pn_d111[13] : 
                    ( pn13_deskew == 10'h70 && init ) ? pn_d112[13] : 
                    ( pn13_deskew == 10'h71 && init ) ? pn_d113[13] : 
                    ( pn13_deskew == 10'h72 && init ) ? pn_d114[13] : 
                    ( pn13_deskew == 10'h73 && init ) ? pn_d115[13] : 
                    ( pn13_deskew == 10'h74 && init ) ? pn_d116[13] : 
                    ( pn13_deskew == 10'h75 && init ) ? pn_d117[13] : 
                    ( pn13_deskew == 10'h76 && init ) ? pn_d118[13] : 
                    ( pn13_deskew == 10'h77 && init ) ? pn_d119[13] : 
                    ( pn13_deskew == 10'h78 && init ) ? pn_d120[13] : 
                    ( pn13_deskew == 10'h79 && init ) ? pn_d121[13] : 
                    ( pn13_deskew == 10'h7a && init ) ? pn_d122[13] : 
                    ( pn13_deskew == 10'h7b && init ) ? pn_d123[13] : 
                    ( pn13_deskew == 10'h7c && init ) ? pn_d124[13] : 
                    ( pn13_deskew == 10'h7d && init ) ? pn_d125[13] : 
                    ( pn13_deskew == 10'h7e && init ) ? pn_d126[13] : 
                    ( pn13_deskew == 10'h7f && init ) ? pn_d127[13] : 
                    ( pn13_deskew == 10'h80 && init ) ? pn_d128[13] : 
                    ( pn13_deskew == 10'h81 && init ) ? pn_d129[13] : 
                    ( pn13_deskew == 10'h82 && init ) ? pn_d130[13] : 
                    ( pn13_deskew == 10'h83 && init ) ? pn_d131[13] : 
                    ( pn13_deskew == 10'h84 && init ) ? pn_d132[13] : 
                    ( pn13_deskew == 10'h85 && init ) ? pn_d133[13] : 
                    ( pn13_deskew == 10'h86 && init ) ? pn_d134[13] : 
                    ( pn13_deskew == 10'h87 && init ) ? pn_d135[13] : 
                    ( pn13_deskew == 10'h88 && init ) ? pn_d136[13] : 
                    ( pn13_deskew == 10'h89 && init ) ? pn_d137[13] : 
                    ( pn13_deskew == 10'h8a && init ) ? pn_d138[13] : 
                    ( pn13_deskew == 10'h8b && init ) ? pn_d139[13] : 
                    ( pn13_deskew == 10'h8c && init ) ? pn_d140[13] : 
                    ( pn13_deskew == 10'h8d && init ) ? pn_d141[13] : 
                    ( pn13_deskew == 10'h8e && init ) ? pn_d142[13] : 
                    ( pn13_deskew == 10'h8f && init ) ? pn_d143[13] : 
                    ( pn13_deskew == 10'h90 && init ) ? pn_d144[13] : 
                    ( pn13_deskew == 10'h91 && init ) ? pn_d145[13] : pn_in[13];  
 

integer TRACE_DELAY_0, TRACE_DELAY_1, TRACE_DELAY_2, TRACE_DELAY_3, TRACE_DELAY_4, TRACE_DELAY_5, TRACE_DELAY_6, TRACE_DELAY_7, TRACE_DELAY_8, TRACE_DELAY_9, TRACE_DELAY_10, TRACE_DELAY_11, TRACE_DELAY_12, TRACE_DELAY_13;
initial begin // {

if (! $value$plusargs("TRACE_DELAY_0=%d", TRACE_DELAY_0)) begin
    TRACE_DELAY_0 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_1=%d", TRACE_DELAY_1)) begin
    TRACE_DELAY_1 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_2=%d", TRACE_DELAY_2)) begin
    TRACE_DELAY_2 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_3=%d", TRACE_DELAY_3)) begin
    TRACE_DELAY_3 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_4=%d", TRACE_DELAY_4)) begin
    TRACE_DELAY_4 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_5=%d", TRACE_DELAY_5)) begin
    TRACE_DELAY_5 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_6=%d", TRACE_DELAY_6)) begin
    TRACE_DELAY_6 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_7=%d", TRACE_DELAY_7)) begin
    TRACE_DELAY_7 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_8=%d", TRACE_DELAY_8)) begin
    TRACE_DELAY_8 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_9=%d", TRACE_DELAY_9)) begin
    TRACE_DELAY_9 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_10=%d", TRACE_DELAY_10)) begin
    TRACE_DELAY_10 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_11=%d", TRACE_DELAY_11)) begin
    TRACE_DELAY_11 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_12=%d", TRACE_DELAY_12)) begin
    TRACE_DELAY_12 = 0 ;
 end
if (! $value$plusargs("TRACE_DELAY_13=%d", TRACE_DELAY_13)) begin
    TRACE_DELAY_13 = 0 ;
 end

end // }

`ifdef VF
assign #TRACE_DELAY_0 pn_out[0] = pn_out_local[0];
assign #TRACE_DELAY_1 pn_out[1] = pn_out_local[1];
assign #TRACE_DELAY_2 pn_out[2] = pn_out_local[2];
assign #TRACE_DELAY_3 pn_out[3] = pn_out_local[3];
assign #TRACE_DELAY_4 pn_out[4] = pn_out_local[4];
assign #TRACE_DELAY_5 pn_out[5] = pn_out_local[5];
assign #TRACE_DELAY_6 pn_out[6] = pn_out_local[6];
assign #TRACE_DELAY_7 pn_out[7] = pn_out_local[7];
assign #TRACE_DELAY_8 pn_out[8] = pn_out_local[8];
assign #TRACE_DELAY_9 pn_out[9] = pn_out_local[9];
assign #TRACE_DELAY_10 pn_out[10] = pn_out_local[10];
assign #TRACE_DELAY_11 pn_out[11] = pn_out_local[11];
assign #TRACE_DELAY_12 pn_out[12] = pn_out_local[12];
assign #TRACE_DELAY_13 pn_out[13] = pn_out_local[13];
`else

assign  pn_out = pn_out_local ;

`endif

dff_p #(14) ff0( .signal_in   (pn_in),
                   .signal_out  (pn_d1),
                   .clk (sclk));
dff_p #(14) ff1( .signal_in   (pn_d1),
                   .signal_out  (pn_d2),
                   .clk (sclk));
dff_p #(14) ff2( .signal_in   (pn_d2),
                   .signal_out  (pn_d3),
                   .clk (sclk));
dff_p #(14) ff3( .signal_in   (pn_d3),
                   .signal_out  (pn_d4),
                   .clk (sclk));
dff_p #(14) ff4( .signal_in   (pn_d4),
                   .signal_out  (pn_d5),
                   .clk (sclk));
dff_p #(14) ff5( .signal_in   (pn_d5),
                   .signal_out  (pn_d6),
                   .clk (sclk));
dff_p #(14) ff6( .signal_in   (pn_d6),
                   .signal_out  (pn_d7),
                   .clk (sclk));
dff_p #(14) ff7( .signal_in   (pn_d7),
                   .signal_out  (pn_d8),
                   .clk (sclk));
dff_p #(14) ff8( .signal_in   (pn_d8),
                   .signal_out  (pn_d9),
                   .clk (sclk));
dff_p #(14) ff9( .signal_in   (pn_d9),
                   .signal_out  (pn_d10),
                   .clk (sclk));
dff_p #(14) ff10( .signal_in   (pn_d10),
                   .signal_out  (pn_d11),
                   .clk (sclk));
dff_p #(14) ff11( .signal_in   (pn_d11),
                   .signal_out  (pn_d12),
                   .clk (sclk));
dff_p #(14) ff12( .signal_in   (pn_d12),
                   .signal_out  (pn_d13),
                   .clk (sclk));
dff_p #(14) ff13( .signal_in   (pn_d13),
                   .signal_out  (pn_d14),
                   .clk (sclk));
dff_p #(14) ff14( .signal_in   (pn_d14),
                   .signal_out  (pn_d15),
                   .clk (sclk));
dff_p #(14) ff15( .signal_in   (pn_d15),
                   .signal_out  (pn_d16),
                   .clk (sclk));
dff_p #(14) ff16( .signal_in   (pn_d16),
                   .signal_out  (pn_d17),
                   .clk (sclk));
dff_p #(14) ff17( .signal_in   (pn_d17),
                   .signal_out  (pn_d18),
                   .clk (sclk));
dff_p #(14) ff18( .signal_in   (pn_d18),
                   .signal_out  (pn_d19),
                   .clk (sclk));
dff_p #(14) ff19( .signal_in   (pn_d19),
                   .signal_out  (pn_d20),
                   .clk (sclk));
dff_p #(14) ff20( .signal_in   (pn_d20),
                    .signal_out  (pn_d21),
                    .clk (sclk));

dff_p #(14) ff21( .signal_in   (pn_d21),
                    .signal_out  (pn_d22),
                    .clk (sclk));
dff_p #(14) ff22( .signal_in   (pn_d22),
                    .signal_out  (pn_d23),
                    .clk (sclk));
dff_p #(14) ff23( .signal_in   (pn_d23),
                    .signal_out  (pn_d24),
                    .clk (sclk));
dff_p #(14) ff24( .signal_in   (pn_d24),
                    .signal_out  (pn_d25),
                    .clk (sclk));
dff_p #(14) ff25( .signal_in   (pn_d25),
                    .signal_out  (pn_d26),
                    .clk (sclk));
dff_p #(14) ff26( .signal_in   (pn_d26),
                    .signal_out  (pn_d27),
                    .clk (sclk));
dff_p #(14) ff27( .signal_in   (pn_d27),
                    .signal_out  (pn_d28),
                    .clk (sclk));
dff_p #(14) ff28( .signal_in   (pn_d28),
                    .signal_out  (pn_d29),
                    .clk (sclk));
dff_p #(14) ff29( .signal_in   (pn_d29),
                    .signal_out  (pn_d30),
                    .clk (sclk));
dff_p #(14) ff30( .signal_in   (pn_d30),
                    .signal_out  (pn_d31),
                    .clk (sclk));
dff_p #(14) ff31( .signal_in   (pn_d31),
                    .signal_out  (pn_d32),
                    .clk (sclk));
dff_p #(14) ff32( .signal_in   (pn_d32),
                    .signal_out  (pn_d33),
                    .clk (sclk));
dff_p #(14) ff33( .signal_in   (pn_d33),
                    .signal_out  (pn_d34),
                    .clk (sclk));
dff_p #(14) ff34( .signal_in   (pn_d34),
                    .signal_out  (pn_d35),
                    .clk (sclk));
dff_p #(14) ff35( .signal_in   (pn_d35),
                    .signal_out  (pn_d36),
                    .clk (sclk));
dff_p #(14) ff36( .signal_in   (pn_d36),
                    .signal_out  (pn_d37),
                    .clk (sclk));
dff_p #(14) ff37( .signal_in   (pn_d37),
                    .signal_out  (pn_d38),
                    .clk (sclk));
dff_p #(14) ff38( .signal_in   (pn_d38),
                    .signal_out  (pn_d39),
                    .clk (sclk));
dff_p #(14) ff39( .signal_in   (pn_d39),
                    .signal_out  (pn_d40),
                    .clk (sclk));
dff_p #(14) ff40( .signal_in   (pn_d40),
                    .signal_out  (pn_d41),
                    .clk (sclk));
dff_p #(14) ff41( .signal_in   (pn_d41),
                    .signal_out  (pn_d42),
                    .clk (sclk));
dff_p #(14) ff42( .signal_in   (pn_d42),
                    .signal_out  (pn_d43),
                    .clk (sclk));
dff_p #(14) ff43( .signal_in   (pn_d43),
                    .signal_out  (pn_d44),
                    .clk (sclk));
dff_p #(14) ff44( .signal_in   (pn_d44),
                    .signal_out  (pn_d45),
                    .clk (sclk));
dff_p #(14) ff45( .signal_in   (pn_d45),
                    .signal_out  (pn_d46),
                    .clk (sclk));
dff_p #(14) ff46( .signal_in   (pn_d46),
                    .signal_out  (pn_d47),
                    .clk (sclk));
dff_p #(14) ff47( .signal_in   (pn_d47),
                    .signal_out  (pn_d48),
                    .clk (sclk));
dff_p #(14) ff48( .signal_in   (pn_d48),
                    .signal_out  (pn_d49),
                    .clk (sclk));
dff_p #(14) ff49( .signal_in   (pn_d49),
                    .signal_out  (pn_d50),
                    .clk (sclk));

dff_p #(14) ff50( .signal_in   (pn_d50),
                    .signal_out  (pn_d51),
                    .clk (sclk));
dff_p #(14) ff51( .signal_in   (pn_d51),
                    .signal_out  (pn_d52),
                    .clk (sclk));
dff_p #(14) ff52( .signal_in   (pn_d52),
                    .signal_out  (pn_d53),
                    .clk (sclk));
dff_p #(14) ff53( .signal_in   (pn_d53),
                    .signal_out  (pn_d54),
                    .clk (sclk));
dff_p #(14) ff54( .signal_in   (pn_d54),
                    .signal_out  (pn_d55),
                    .clk (sclk));
dff_p #(14) ff55( .signal_in   (pn_d55),
                    .signal_out  (pn_d56),
                    .clk (sclk));
dff_p #(14) ff56( .signal_in   (pn_d56),
                    .signal_out  (pn_d57),
                    .clk (sclk));
dff_p #(14) ff57( .signal_in   (pn_d57),
                    .signal_out  (pn_d58),
                    .clk (sclk));
dff_p #(14) ff58( .signal_in   (pn_d58),
                    .signal_out  (pn_d59),
                    .clk (sclk));
dff_p #(14) ff59( .signal_in   (pn_d59),
                    .signal_out  (pn_d60),
                    .clk (sclk));
dff_p #(14) ff60( .signal_in   (pn_d60),
                    .signal_out  (pn_d61),
                    .clk (sclk));
dff_p #(14) ff61( .signal_in   (pn_d61),
                    .signal_out  (pn_d62),
                    .clk (sclk));
dff_p #(14) ff62( .signal_in   (pn_d62),
                    .signal_out  (pn_d63),
                    .clk (sclk));
dff_p #(14) ff63( .signal_in   (pn_d63),
                    .signal_out  (pn_d64),
                    .clk (sclk));
dff_p #(14) ff64( .signal_in   (pn_d64),
                    .signal_out  (pn_d65),
                    .clk (sclk));
dff_p #(14) ff65( .signal_in   (pn_d65),
                    .signal_out  (pn_d66),
                    .clk (sclk));
dff_p #(14) ff66( .signal_in   (pn_d66),
                    .signal_out  (pn_d67),
                    .clk (sclk));
dff_p #(14) ff67( .signal_in   (pn_d67),
                    .signal_out  (pn_d68),
                    .clk (sclk));
dff_p #(14) ff68( .signal_in   (pn_d68),
                    .signal_out  (pn_d69),
                    .clk (sclk));
dff_p #(14) ff69( .signal_in   (pn_d69),
                    .signal_out  (pn_d70),
                    .clk (sclk));
dff_p #(14) ff70( .signal_in   (pn_d70),
                    .signal_out  (pn_d71),
                    .clk (sclk));
dff_p #(14) ff71( .signal_in   (pn_d71),
                    .signal_out  (pn_d72),
                    .clk (sclk));
dff_p #(14) ff72( .signal_in   (pn_d72),
                    .signal_out  (pn_d73),
                    .clk (sclk));
dff_p #(14) ff73( .signal_in   (pn_d73),
                    .signal_out  (pn_d74),
                    .clk (sclk));
dff_p #(14) ff74( .signal_in   (pn_d74),
                    .signal_out  (pn_d75),
                    .clk (sclk));
dff_p #(14) ff75( .signal_in   (pn_d75),
                    .signal_out  (pn_d76),
                    .clk (sclk));
dff_p #(14) ff76( .signal_in   (pn_d76),
                    .signal_out  (pn_d77),
                    .clk (sclk));
dff_p #(14) ff77( .signal_in   (pn_d77),
                    .signal_out  (pn_d78),
                    .clk (sclk));
dff_p #(14) ff78( .signal_in   (pn_d78),
                    .signal_out  (pn_d79),
                    .clk (sclk));
dff_p #(14) ff79( .signal_in   (pn_d79),
                    .signal_out  (pn_d80),
                    .clk (sclk));
dff_p #(14) ff80( .signal_in   (pn_d80),
                    .signal_out  (pn_d81),
                    .clk (sclk));
dff_p #(14) ff81( .signal_in   (pn_d81),
                    .signal_out  (pn_d82),
                    .clk (sclk));
dff_p #(14) ff82( .signal_in   (pn_d82),
                    .signal_out  (pn_d83),
                    .clk (sclk));
dff_p #(14) ff83( .signal_in   (pn_d83),
                    .signal_out  (pn_d84),
                    .clk (sclk));
dff_p #(14) ff84( .signal_in   (pn_d84),
                    .signal_out  (pn_d85),
                    .clk (sclk));
dff_p #(14) ff85( .signal_in   (pn_d85),
                    .signal_out  (pn_d86),
                    .clk (sclk));
dff_p #(14) ff86( .signal_in   (pn_d86),
                    .signal_out  (pn_d87),
                    .clk (sclk));
dff_p #(14) ff87( .signal_in   (pn_d87),
                    .signal_out  (pn_d88),
                    .clk (sclk));
dff_p #(14) ff88( .signal_in   (pn_d88),
                    .signal_out  (pn_d89),
                    .clk (sclk));
dff_p #(14) ff89( .signal_in   (pn_d89),
                    .signal_out  (pn_d90),
                    .clk (sclk));
dff_p #(14) ff90( .signal_in   (pn_d90),
                    .signal_out  (pn_d91),
                    .clk (sclk));
dff_p #(14) ff91( .signal_in   (pn_d91),
                    .signal_out  (pn_d92),
                    .clk (sclk));
dff_p #(14) ff92( .signal_in   (pn_d92),
                    .signal_out  (pn_d93),
                    .clk (sclk));
dff_p #(14) ff93( .signal_in   (pn_d93),
                    .signal_out  (pn_d94),
                    .clk (sclk));
dff_p #(14) ff94( .signal_in   (pn_d94),
                    .signal_out  (pn_d95),
                    .clk (sclk));
dff_p #(14) ff95( .signal_in   (pn_d95),
                    .signal_out  (pn_d96),
                    .clk (sclk));
dff_p #(14) ff96( .signal_in   (pn_d96),
                    .signal_out  (pn_d97),
                    .clk (sclk));
dff_p #(14) ff97( .signal_in   (pn_d97),
                    .signal_out  (pn_d98),
                    .clk (sclk));

dff_p #(14) ff98( .signal_in   (pn_d98),
                    .signal_out  (pn_d99),
                    .clk (sclk));
dff_p #(14) ff99( .signal_in   (pn_d99),
                    .signal_out  (pn_d100),
                    .clk (sclk));
dff_p #(14) ff100( .signal_in   (pn_d100),
                    .signal_out  (pn_d101),
                    .clk (sclk));
dff_p #(14) ff101( .signal_in   (pn_d101),
                    .signal_out  (pn_d102),
                    .clk (sclk));
dff_p #(14) ff102( .signal_in   (pn_d102),
                    .signal_out  (pn_d103),
                    .clk (sclk));
dff_p #(14) ff103( .signal_in   (pn_d103),
                    .signal_out  (pn_d104),
                    .clk (sclk));
dff_p #(14) ff104( .signal_in   (pn_d104),
                    .signal_out  (pn_d105),
                    .clk (sclk));
dff_p #(14) ff105( .signal_in   (pn_d105),
                    .signal_out  (pn_d106),
                    .clk (sclk));
dff_p #(14) ff106( .signal_in   (pn_d106),
                    .signal_out  (pn_d107),
                    .clk (sclk));
dff_p #(14) ff107( .signal_in   (pn_d107),
                    .signal_out  (pn_d108),
                    .clk (sclk));
dff_p #(14) ff108( .signal_in   (pn_d108),
                    .signal_out  (pn_d109),
                    .clk (sclk));


dff_p #(14) ff109 ( .signal_in   (pn_d109),
                   .signal_out  (pn_d110),
                   .clk (sclk)); 

dff_p #(14) ff110 ( .signal_in   (pn_d110),
                   .signal_out  (pn_d111),
                   .clk (sclk)); 

dff_p #(14) ff111 ( .signal_in   (pn_d111),
                   .signal_out  (pn_d112),
                   .clk (sclk)); 

dff_p #(14) ff112 ( .signal_in   (pn_d112),
                   .signal_out  (pn_d113),
                   .clk (sclk)); 

dff_p #(14) ff113 ( .signal_in   (pn_d113),
                   .signal_out  (pn_d114),
                   .clk (sclk)); 

dff_p #(14) ff114 ( .signal_in   (pn_d114),
                   .signal_out  (pn_d115),
                   .clk (sclk)); 

dff_p #(14) ff115 ( .signal_in   (pn_d115),
                   .signal_out  (pn_d116),
                   .clk (sclk)); 

dff_p #(14) ff116 ( .signal_in   (pn_d116),
                   .signal_out  (pn_d117),
                   .clk (sclk)); 

dff_p #(14) ff117 ( .signal_in   (pn_d117),
                   .signal_out  (pn_d118),
                   .clk (sclk)); 

dff_p #(14) ff118 ( .signal_in   (pn_d118),
                   .signal_out  (pn_d119),
                   .clk (sclk)); 

dff_p #(14) ff119 ( .signal_in   (pn_d119),
                   .signal_out  (pn_d120),
                   .clk (sclk)); 

dff_p #(14) ff120 ( .signal_in   (pn_d120),
                   .signal_out  (pn_d121),
                   .clk (sclk)); 

dff_p #(14) ff121 ( .signal_in   (pn_d121),
                   .signal_out  (pn_d122),
                   .clk (sclk)); 

dff_p #(14) ff122 ( .signal_in   (pn_d122),
                   .signal_out  (pn_d123),
                   .clk (sclk)); 

dff_p #(14) ff123 ( .signal_in   (pn_d123),
                   .signal_out  (pn_d124),
                   .clk (sclk)); 

dff_p #(14) ff124 ( .signal_in   (pn_d124),
                   .signal_out  (pn_d125),
                   .clk (sclk)); 

dff_p #(14) ff125 ( .signal_in   (pn_d125),
                   .signal_out  (pn_d126),
                   .clk (sclk)); 

dff_p #(14) ff126 ( .signal_in   (pn_d126),
                   .signal_out  (pn_d127),
                   .clk (sclk)); 

dff_p #(14) ff127 ( .signal_in   (pn_d127),
                   .signal_out  (pn_d128),
                   .clk (sclk)); 

dff_p #(14) ff128 ( .signal_in   (pn_d128),
                   .signal_out  (pn_d129),
                   .clk (sclk)); 

dff_p #(14) ff129 ( .signal_in   (pn_d129),
                   .signal_out  (pn_d130),
                   .clk (sclk)); 

dff_p #(14) ff130 ( .signal_in   (pn_d130),
                   .signal_out  (pn_d131),
                   .clk (sclk)); 

dff_p #(14) ff131 ( .signal_in   (pn_d131),
                   .signal_out  (pn_d132),
                   .clk (sclk)); 

dff_p #(14) ff132 ( .signal_in   (pn_d132),
                   .signal_out  (pn_d133),
                   .clk (sclk)); 

dff_p #(14) ff133 ( .signal_in   (pn_d133),
                   .signal_out  (pn_d134),
                   .clk (sclk)); 

dff_p #(14) ff134 ( .signal_in   (pn_d134),
                   .signal_out  (pn_d135),
                   .clk (sclk)); 

dff_p #(14) ff135 ( .signal_in   (pn_d135),
                   .signal_out  (pn_d136),
                   .clk (sclk)); 

dff_p #(14) ff136 ( .signal_in   (pn_d136),
                   .signal_out  (pn_d137),
                   .clk (sclk)); 

dff_p #(14) ff137 ( .signal_in   (pn_d137),
                   .signal_out  (pn_d138),
                   .clk (sclk)); 

dff_p #(14) ff138 ( .signal_in   (pn_d138),
                   .signal_out  (pn_d139),
                   .clk (sclk)); 

dff_p #(14) ff139 ( .signal_in   (pn_d139),
                   .signal_out  (pn_d140),
                   .clk (sclk)); 

dff_p #(14) ff140 ( .signal_in   (pn_d140),
                   .signal_out  (pn_d141),
                   .clk (sclk)); 

dff_p #(14) ff141 ( .signal_in   (pn_d141),
                   .signal_out  (pn_d142),
                   .clk (sclk)); 

dff_p #(14) ff142 ( .signal_in   (pn_d142),
                   .signal_out  (pn_d143),
                   .clk (sclk)); 

dff_p #(14) ff143 ( .signal_in   (pn_d143),
                   .signal_out  (pn_d144),
                   .clk (sclk)); 

dff_p #(14) ff144 ( .signal_in   (pn_d144),
                   .signal_out  (pn_d145),
                   .clk (sclk)); 

dff_p #(14) ff145 ( .signal_in   (pn_d145),
                   .signal_out  (pn_d146),
                   .clk (sclk)); 

dff_p #(14) ff146 ( .signal_in   (pn_d146),
                   .signal_out  (pn_d147),
                   .clk (sclk)); 

endmodule

`endif
