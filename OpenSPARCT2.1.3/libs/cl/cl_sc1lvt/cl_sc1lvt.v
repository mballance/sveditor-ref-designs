// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cl_sc1lvt.v
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
module cl_sc1lvt_aomux2_12x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_sc1lvt_aomux2_16x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_sc1lvt_aomux2_1x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_sc1lvt_aomux2_2x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_sc1lvt_aomux2_4x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_sc1lvt_aomux2_6x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_sc1lvt_aomux2_8x (
in0,
in1,
sel0,
sel1,
out
);
input 	in0;
input 	in1;
input 	sel0;
input 	sel1;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1));
`endif


endmodule
module cl_sc1lvt_aomux3_12x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_sc1lvt_aomux3_16x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_sc1lvt_aomux3_1x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_sc1lvt_aomux3_2x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_sc1lvt_aomux3_4x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_sc1lvt_aomux3_6x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_sc1lvt_aomux3_8x (
in0,
in1,
in2,
sel0,
sel1,
sel2,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	sel0;
input 	sel1;
input 	sel2;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2));
`endif

endmodule
module cl_sc1lvt_aomux4_12x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_sc1lvt_aomux4_16x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_sc1lvt_aomux4_1x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_sc1lvt_aomux4_2x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_sc1lvt_aomux4_4x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_sc1lvt_aomux4_6x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_sc1lvt_aomux4_8x (
in0,
in1,
in2,
in3,
sel0,
sel1,
sel2,
sel3,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3));
`endif

endmodule
module cl_sc1lvt_aomux5_12x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_sc1lvt_aomux5_16x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_sc1lvt_aomux5_1x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_sc1lvt_aomux5_2x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_sc1lvt_aomux5_4x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_sc1lvt_aomux5_6x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_sc1lvt_aomux5_8x (
in0,
in1,
in2,
in3,
in4,
sel0,
sel1,
sel2,
sel3,
sel4,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4));
`endif

endmodule
module cl_sc1lvt_aomux6_12x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_sc1lvt_aomux6_16x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_sc1lvt_aomux6_1x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_sc1lvt_aomux6_2x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_sc1lvt_aomux6_4x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_sc1lvt_aomux6_6x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_sc1lvt_aomux6_8x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_sc1lvt_aomux7_12x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_sc1lvt_aomux7_16x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_sc1lvt_aomux7_1x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_sc1lvt_aomux7_2x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_sc1lvt_aomux7_4x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_sc1lvt_aomux7_6x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_sc1lvt_aomux7_8x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_sc1lvt_aomux8_12x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_sc1lvt_aomux8_16x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_sc1lvt_aomux8_1x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_sc1lvt_aomux8_2x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_sc1lvt_aomux8_4x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_sc1lvt_aomux8_6x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_sc1lvt_aomux8_8x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_sc1lvt_aomux8_by2_2x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_sc1lvt_aomux8_by2_1x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
in7,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
sel7,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	in7;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
input 	sel7;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6) |
	      (sel7 & in7));
`endif
		

endmodule
module cl_sc1lvt_aomux7_by2_2x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_sc1lvt_aomux7_by2_1x (
in0,
in1,
in2,
in3,
in4,
in5,
in6,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
sel6,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	in6;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
input 	sel6;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5) |
	      (sel6 & in6));
`endif

endmodule
module cl_sc1lvt_aomux6_by2_2x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
module cl_sc1lvt_aomux6_by2_1x (
in0,
in1,
in2,
in3,
in4,
in5,
sel0,
sel1,
sel2,
sel3,
sel4,
sel5,
out
);
input 	in0;
input 	in1;
input 	in2;
input 	in3;
input 	in4;
input 	in5;
input 	sel0;
input 	sel1;
input 	sel2;
input 	sel3;
input 	sel4;
input 	sel5;
output  out;

`ifdef LIB
assign out = ((sel0 & in0) |
	      (sel1 & in1) |
	      (sel2 & in2) |
	      (sel3 & in3) |
	      (sel4 & in4) |
	      (sel5 & in5));
`endif

endmodule
