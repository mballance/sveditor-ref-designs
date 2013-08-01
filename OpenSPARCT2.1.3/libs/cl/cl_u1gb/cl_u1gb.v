// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cl_u1gb.v
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
module cl_u1gb_aoi12_12x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi12_16x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Nov 29,2001 at 11:51:25 AM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi12_16x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi12_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Dec  6,2001 at 02:09:00 PM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi12_1x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi12_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Nov 29,2001 at 11:51:25 AM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi12_2x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi12_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Nov 29,2001 at 11:51:25 AM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi12_4x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi12_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Nov 29,2001 at 11:51:25 AM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi12_8x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi21_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi21_12x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi21_16x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi21_16x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi21_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi21_1x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi21_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi21_2x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi21_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi21_4x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi21_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:15 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi21_8x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi22_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:16 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi22_12x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 & in01 ));
`endif

endmodule

// --------------------------------------------------
// File: cl_u1gb_aoi22_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:32 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi22_1x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi22_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:16 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi22_2x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi22_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:16 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi22_4x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 & in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi22_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:16 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi22_8x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 & in11 ) | ( in00 & in01 ));
`endif

endmodule


// --------------------------------------------------
// File: cl_u1gb_aoi33_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Thursday Dec  6,2001 at 02:09:02 PM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi33_1x (
    out,
    in10,
    in11,
    in12,
    in00,
    in01,
    in02 );

    output out;
    input  in10;
    input  in11;
    input  in12;
    input  in00;
    input  in01;
    input  in02;

`ifdef LIB
    assign out = ~(( in10 & in11 & in12 ) | ( in00 & in01 & in02 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi33_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:18 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi33_2x (
    out,
    in10,
    in11,
    in12,
    in00,
    in01,
    in02 );

    output out;
    input  in10;
    input  in11;
    input  in12;
    input  in00;
    input  in01;
    input  in02;

`ifdef LIB
    assign out = ~(( in10 & in11 & in12 ) | ( in00 & in01 & in02 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi33_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:18 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi33_4x (
    out,
    in10,
    in11,
    in12,
    in00,
    in01,
    in02 );

    output out;
    input  in10;
    input  in11;
    input  in12;
    input  in00;
    input  in01;
    input  in02;

`ifdef LIB
    assign out = ~(( in10 & in11 & in12 ) | ( in00 & in01 & in02 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_aoi33_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:18 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_aoi33_8x (
    out,
    in10,
    in11,
    in12,
    in00,
    in01,
    in02 );

    output out;
    input  in10;
    input  in11;
    input  in12;
    input  in00;
    input  in01;
    input  in02;

`ifdef LIB
    assign out = ~(( in10 & in11 & in12 ) | ( in00 & in01 & in02 ));
`endif

endmodule


module cl_u1gb_buf_12x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_1x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_20x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_24x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_28x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_2x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_36x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_40x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_44x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_4x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_56x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_64x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_6x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_buf_8x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule


module cl_u1gb_inv_12x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_1x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_20x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_24x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_28x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_2x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_36x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_40x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_44x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_4x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_56x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_64x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_6x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_inv_8x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = ~in;
not (out, in);
`endif

endmodule
module cl_u1gb_nand2_12x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand2_16x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand2_1x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand2_20x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand2_24x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand2_28x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand2_2x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand2_32x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand2_4x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand2_6x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand2_8x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 & in1);
`endif

endmodule
module cl_u1gb_nand3_12x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_u1gb_nand3_16x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_u1gb_nand3_1x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_u1gb_nand3_20x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_u1gb_nand3_24x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule

module cl_u1gb_nand3_2x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule

module cl_u1gb_nand3_4x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_u1gb_nand3_6x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_u1gb_nand3_8x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2);
`endif

endmodule
module cl_u1gb_nand4_12x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule
module cl_u1gb_nand4_16x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule
module cl_u1gb_nand4_1x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule


module cl_u1gb_nand4_2x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule

module cl_u1gb_nand4_4x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule
module cl_u1gb_nand4_6x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule
module cl_u1gb_nand4_8x (
in0,
in1,
in2,
in3,
out
);
input	in0;
input	in1;
input	in2;
input	in3;
output	out;

`ifdef LIB
assign out = ~(in0 & in1 & in2 & in3);
`endif

endmodule
module cl_u1gb_nor2_12x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_u1gb_nor2_16x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_u1gb_nor2_1x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_u1gb_nor2_2x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_u1gb_nor2_4x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_u1gb_nor2_6x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_u1gb_nor2_8x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 | in1);
`endif

endmodule
module cl_u1gb_nor3_1x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 | in1 | in2);
`endif

endmodule
module cl_u1gb_nor3_2x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 | in1 | in2);
`endif

endmodule
module cl_u1gb_nor3_4x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 | in1 | in2);
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai12_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai12_12x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai12_16x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai12_16x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai12_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai12_1x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai12_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai12_2x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai12_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai12_4x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai12_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:34 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai12_8x (
    out,
    in10,
    in00,
    in01 );

    output out;
    input  in10;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai21_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:35 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai21_12x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai21_16x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:35 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai21_16x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai21_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Friday Mar 15,2002 at 02:53:58 PM PST
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai21_1x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai21_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:23 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai21_2x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai21_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:23 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai21_4x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai21_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:23 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai21_8x (
    out,
    in10,
    in11,
    in00 );

    output out;
    input  in10;
    input  in11;
    input  in00;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai22_12x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:35 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai22_12x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai22_16x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:35 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai22_16x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai22_1x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Wednesday May 29,2002 at 04:04:35 PM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai22_1x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai22_2x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:24 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai22_2x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai22_4x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:24 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai22_4x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
// --------------------------------------------------
// File: cl_u1gb_oai22_8x.behV
// Auto generated verilog module by HnBCellAuto
//
// Created: Monday Oct  8,2001 at 11:32:24 AM PDT
// By: balmiki
// --------------------------------------------------
// 
module cl_u1gb_oai22_8x (
    out,
    in10,
    in11,
    in00,
    in01 );

    output out;
    input  in10;
    input  in11;
    input  in00;
    input  in01;

`ifdef LIB
    assign out = ~(( in10 | in11 ) & ( in00 | in01 ));
`endif

endmodule
module cl_u1gb_xnor2_16x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule

module cl_u1gb_xnor2_1x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule
module cl_u1gb_xnor2_2x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule
module cl_u1gb_xnor2_4x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule
module cl_u1gb_xnor2_6x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule
module cl_u1gb_xnor2_8x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1);
`endif

endmodule

module cl_u1gb_xnor3_16x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_u1gb_xnor3_1x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_u1gb_xnor3_2x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_u1gb_xnor3_4x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_u1gb_xnor3_6x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_u1gb_xnor3_8x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = ~(in0 ^ in1 ^ in2);
`endif



endmodule
module cl_u1gb_xor2_16x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule

module cl_u1gb_xor2_1x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule
module cl_u1gb_xor2_2x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule
module cl_u1gb_xor2_4x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule
module cl_u1gb_xor2_6x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule
module cl_u1gb_xor2_8x (
in0,
in1,
out
);
input	in0;
input	in1;
output	out;

`ifdef LIB
assign out = in0 ^ in1;
`endif

endmodule
module cl_u1gb_xor3_16x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule

module cl_u1gb_xor3_1x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule
module cl_u1gb_xor3_2x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule
module cl_u1gb_xor3_4x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule
module cl_u1gb_xor3_6x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule
module cl_u1gb_xor3_8x (
in0,
in1,
in2,
out
);
input	in0;
input	in1;
input	in2;
output	out;

`ifdef LIB
assign out = in0 ^ in1 ^ in2;
`endif


endmodule

module cl_u1gb_rep_32x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_rep_40x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_rep_24x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_rep_16x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_rep_8x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule
module cl_u1gb_rep_48x (
in,
out
);
input	in;
output	out;

`ifdef LIB
//assign out = in;
buf (out, in);
`endif

endmodule



