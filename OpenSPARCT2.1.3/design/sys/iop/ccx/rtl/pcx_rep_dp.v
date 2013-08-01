// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcx_rep_dp.v
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
`ifndef FPGA
module pcx_rep_dp (
  mac0_rep_out, 
  mac1_rep_out, 
  mac2_rep_out, 
  mac3_rep_out, 
  mac4_rep_out, 
  mac5_rep_out, 
  mac6_rep_out, 
  scan_rep_out, 
  mac0_rep_in, 
  mac1_rep_in, 
  mac2_rep_in, 
  mac3_rep_in, 
  mac4_rep_in, 
  mac5_rep_in, 
  mac6_rep_in, 
  scan_rep_in);
wire [4:0] mac2_rep_0;
wire [4:0] mac3_rep_0;
wire [4:0] mac4_rep_0;
wire scan_rep7_out;
wire scan_rep5_out;
wire scan_rep3_out;


output [4:0]              mac0_rep_out;
output [4:0]              mac1_rep_out;
output [4:0]              mac2_rep_out;
output [4:0]              mac3_rep_out;
output [4:0]              mac4_rep_out;
output [4:0]              mac5_rep_out;
output [4:0]              mac6_rep_out;
output                    scan_rep_out;


input [4:0]              mac0_rep_in;
input [4:0]              mac1_rep_in;
input [4:0]              mac2_rep_in;
input [4:0]              mac3_rep_in;
input [4:0]              mac4_rep_in;
input [4:0]              mac5_rep_in;
input [4:0]              mac6_rep_in;
input                    scan_rep_in;



//   sparc0 sparc2 sparc1 sparc3  sparc5  sparc7  sparc4  sparc6
//     |      |      |      |       |       |        |      |
//     v      v      v      v       v       v        v      v
//   mac0 -  mac1 - mac2 - mac3  - mac4  - mac5  - mac6  - mac7 


// mac0 input go through 1 buffer
pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 buf_mac0    (
	.din	({mac0_rep_in[4:0]}),
   .dout	({mac0_rep_out[4:0]})
);

// mac1 input go through 1 buffer
pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 buf_mac1    (
	.din	({mac1_rep_in[4:0]}),
   .dout	({mac1_rep_out[4:0]})
);


// mac2 input go through 2 buffers
pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 buf_mac2_0    (
	.din	({mac2_rep_in[4:0]}),
   .dout	({mac2_rep_0[4:0]})
);

pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 buf_mac2_1    (
	.din	({mac2_rep_0[4:0]}),
   .dout	({mac2_rep_out[4:0]})
);

// mac3 input go through 2 buffers
pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 buf_mac3_0    (
	.din	({mac3_rep_in[4:0]}),
   .dout	({mac3_rep_0[4:0]})
);

pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 buf_mac3_1    (
	.din	({mac3_rep_0[4:0]}),
   .dout	({mac3_rep_out[4:0]})
);

// mac4 input go through 2 buffers
pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 buf_mac4_0    (
	.din	({mac4_rep_in[4:0]}),
   .dout	({mac4_rep_0[4:0]})
);

pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 buf_mac4_1    (
	.din	({mac4_rep_0[4:0]}),
   .dout	({mac4_rep_out[4:0]})
);

// mac5 input go through 1 buffer
pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 buf_mac5    (
	.din	({mac5_rep_in[4:0]}),
   .dout	({mac5_rep_out[4:0]})
);

// mac6 input go through 1 buffer
pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 buf_mac6    (
	.din	({mac6_rep_in[4:0]}),
   .dout	({mac6_rep_out[4:0]})
);


// repeat the scan chain

// buffer on top of mac7
pcx_rep_dp_buff_macro__dbuff_32x__stack_none__width_1 buf_scan7    (
	.din	(scan_rep_in),
   .dout	(scan_rep7_out)
);

// buffer on top of mac5
pcx_rep_dp_buff_macro__dbuff_32x__stack_none__width_1 buf_scan5    (
	.din	(scan_rep7_out),
   .dout	(scan_rep5_out)
);

// buffer on top of mac3
pcx_rep_dp_buff_macro__dbuff_32x__stack_none__width_1 buf_scan3    (
	.din	(scan_rep5_out),
   .dout	(scan_rep3_out)
);

// buffer on top of mac1
pcx_rep_dp_buff_macro__dbuff_32x__stack_none__width_1 buf_scan1    (
	.din	(scan_rep3_out),
   .dout	(scan_rep_out)
);

endmodule


//
//   buff macro
//
//





module pcx_rep_dp_buff_macro__dbuff_32x__stack_6l__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule





//
//   buff macro
//
//





module pcx_rep_dp_buff_macro__dbuff_32x__stack_none__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule


`endif // `ifndef FPGA

`ifdef FPGA
`timescale 1 ns / 100 ps
module pcx_rep_dp(mac0_rep_out, mac1_rep_out, mac2_rep_out, mac3_rep_out, 
	mac4_rep_out, mac5_rep_out, mac6_rep_out, scan_rep_out, mac0_rep_in, 
	mac1_rep_in, mac2_rep_in, mac3_rep_in, mac4_rep_in, mac5_rep_in, 
	mac6_rep_in, scan_rep_in);

	output	[4:0]		mac0_rep_out;
	output	[4:0]		mac1_rep_out;
	output	[4:0]		mac2_rep_out;
	output	[4:0]		mac3_rep_out;
	output	[4:0]		mac4_rep_out;
	output	[4:0]		mac5_rep_out;
	output	[4:0]		mac6_rep_out;
	output			scan_rep_out;
	input	[4:0]		mac0_rep_in;
	input	[4:0]		mac1_rep_in;
	input	[4:0]		mac2_rep_in;
	input	[4:0]		mac3_rep_in;
	input	[4:0]		mac4_rep_in;
	input	[4:0]		mac5_rep_in;
	input	[4:0]		mac6_rep_in;
	input			scan_rep_in;

	wire	[4:0]		mac2_rep_0;
	wire	[4:0]		mac3_rep_0;
	wire	[4:0]		mac4_rep_0;
	wire			scan_rep7_out;
	wire			scan_rep5_out;
	wire			scan_rep3_out;

	buff_macro__dbuff_32x__stack_6l__width_5 buf_mac0(
		.din				({mac0_rep_in[4:0]}), 
		.dout				({mac0_rep_out[4:0]}));
	buff_macro__dbuff_32x__stack_6l__width_5 buf_mac1(
		.din				({mac1_rep_in[4:0]}), 
		.dout				({mac1_rep_out[4:0]}));
	buff_macro__dbuff_32x__stack_6l__width_5 buf_mac2_0(
		.din				({mac2_rep_in[4:0]}), 
		.dout				({mac2_rep_0[4:0]}));
	buff_macro__dbuff_32x__stack_6l__width_5 buf_mac2_1(
		.din				({mac2_rep_0[4:0]}), 
		.dout				({mac2_rep_out[4:0]}));
	buff_macro__dbuff_32x__stack_6l__width_5 buf_mac3_0(
		.din				({mac3_rep_in[4:0]}), 
		.dout				({mac3_rep_0[4:0]}));
	buff_macro__dbuff_32x__stack_6l__width_5 buf_mac3_1(
		.din				({mac3_rep_0[4:0]}), 
		.dout				({mac3_rep_out[4:0]}));
	buff_macro__dbuff_32x__stack_6l__width_5 buf_mac4_0(
		.din				({mac4_rep_in[4:0]}), 
		.dout				({mac4_rep_0[4:0]}));
	buff_macro__dbuff_32x__stack_6l__width_5 buf_mac4_1(
		.din				({mac4_rep_0[4:0]}), 
		.dout				({mac4_rep_out[4:0]}));
	buff_macro__dbuff_32x__stack_6l__width_5 buf_mac5(
		.din				({mac5_rep_in[4:0]}), 
		.dout				({mac5_rep_out[4:0]}));
	buff_macro__dbuff_32x__stack_6l__width_5 buf_mac6(
		.din				({mac6_rep_in[4:0]}), 
		.dout				({mac6_rep_out[4:0]}));
	buff_macro__dbuff_32x__stack_none__width_1 buf_scan7(
		.din				(scan_rep_in), 
		.dout				(scan_rep7_out));
	buff_macro__dbuff_32x__stack_none__width_1 buf_scan5(
		.din				(scan_rep7_out), 
		.dout				(scan_rep5_out));
	buff_macro__dbuff_32x__stack_none__width_1 buf_scan3(
		.din				(scan_rep5_out), 
		.dout				(scan_rep3_out));
	buff_macro__dbuff_32x__stack_none__width_1 buf_scan1(
		.din				(scan_rep3_out), 
		.dout				(scan_rep_out));
endmodule


`endif // `ifdef FPGA



