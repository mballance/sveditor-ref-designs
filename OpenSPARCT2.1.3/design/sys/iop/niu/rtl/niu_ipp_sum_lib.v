// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_sum_lib.v
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

`timescale 1ns/10ps

/**********************************************************
***********************************************************

    Project         : Niu

    File name       : niu_ipp_sum_lib.v

    Module(s) name  :          

    Parent modules  : niu_ipp_sum.v

    Child modules   : 
		      

    Author's name   : George Chu

    Date            : March. 2004

    Description     : Library cells of the ipp checksum.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module ipp_sum_reg_r_1 (di, rs, ck, qo);
input           di;
input           rs;
input           ck;
output          qo;

reg             qo;

  always @(posedge ck)
    qo <= #1 (!rs & di);

endmodule


module ipp_sum_reg_r_2 (di, rs, ck, qo);
input     [1:0] di;
input           rs;
input           ck;
output    [1:0] qo;

reg       [1:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 2'h0;
      else
        qo <= #1 di[1:0];
    end

endmodule


module ipp_sum_reg_r_4 (di, rs, ck, qo);
input     [3:0] di;
input           rs;
input           ck;
output    [3:0] qo;

reg       [3:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 4'h0;
      else
        qo <= #1 di[3:0];
    end

endmodule


module ipp_sum_reg_r_8 (di, rs, ck, qo);
input     [7:0] di;
input           rs;
input           ck;
output    [7:0] qo;

reg       [7:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 8'h0;
      else
        qo <= #1 di[7:0];
    end

endmodule


module ipp_sum_reg_r_9_s0 (di, rs, ck, qo);
input     [8:0] di;
input           rs;
input           ck;
output    [8:0] qo;

reg       [8:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 9'h1;
      else
        qo <= #1 di[8:0];
    end

endmodule


module ipp_sum_reg_r_16 (di, rs, ck, qo);
input    [15:0] di;
input           rs;
input           ck;
output   [15:0] qo;

reg      [15:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 16'h0;
      else
        qo <= #1 di[15:0];
    end

endmodule


module ipp_sum_reg_r_128 (di, rs, ck, qo);
input   [127:0] di;
input           rs;
input           ck;
output  [127:0] qo;

reg     [127:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 128'h0;
      else
        qo <= #1 di[127:0];
    end

endmodule


module ipp_sum_reg_w_r_1 (di, wr, rs, ck, qo);
input           di;
input           wr;
input           rs;
input           ck;
output          qo;

reg             n_qo;
reg             qo;

  always @(di or wr or rs or qo)
    case ({rs,wr})               // synopsys parallel_case
      (2'h1):  n_qo = di;
      (2'h2):  n_qo = 1'b0;
      (2'h3):  n_qo = 1'b0;
      default: n_qo = qo;
    endcase

  always @(posedge ck)
    begin
        qo <= #1 n_qo;
    end

endmodule


module ipp_sum_reg_w_r_2 (di, wr, rs, ck, qo);
input     [1:0] di;
input           wr;
input           rs;
input           ck;
output    [1:0] qo;

reg       [1:0] n_qo;
reg       [1:0] qo;

  always @(di or wr or rs or qo)
    case ({rs,wr})               // synopsys parallel_case
      (2'h1):  n_qo = di[1:0];
      (2'h2):  n_qo = 2'b0;
      (2'h3):  n_qo = 2'b0;
      default: n_qo = qo[1:0];
    endcase

  always @(posedge ck)
    begin
        qo <= #1 n_qo[1:0];
    end

endmodule


module ipp_sum_reg_w_r_4 (di, wr, rs, ck, qo);
input     [3:0] di;
input           wr;
input           rs;
input           ck;
output    [3:0] qo;

reg       [3:0] n_qo;
reg       [3:0] qo;

  always @(di or wr or rs or qo)
    case ({rs,wr})               // synopsys parallel_case
      (2'h1):  n_qo = di[3:0];
      (2'h2):  n_qo = 4'b0;
      (2'h3):  n_qo = 4'b0;
      default: n_qo = qo[3:0];
    endcase

  always @(posedge ck)
    begin
        qo <= #1 n_qo[3:0];
    end

endmodule


module ipp_sum_reg_w_r_13 (di, wr, rs, ck, qo);
input    [12:0] di;
input           wr;
input           rs;
input           ck;
output   [12:0] qo;

reg      [12:0] n_qo;
reg      [12:0] qo;

  always @(di or wr or rs or qo)
    case ({rs,wr})               // synopsys parallel_case
      (2'h1):  n_qo = di[12:0];
      (2'h2):  n_qo = 13'b0;
      (2'h3):  n_qo = 13'b0;
      default: n_qo = qo[12:0];
    endcase

  always @(posedge ck)
    begin
        qo <= #1 n_qo[12:0];
    end

endmodule


module ipp_sum_reg_w_r_16 (di, wr, rs, ck, qo);
input    [15:0] di;
input           wr;
input           rs;
input           ck;
output   [15:0] qo;

reg      [15:0] n_qo;
reg      [15:0] qo;

  always @(di or wr or rs or qo)
    case ({rs,wr})               // synopsys parallel_case
      (2'h1):  n_qo = di[15:0];
      (2'h2):  n_qo = 16'b0;
      (2'h3):  n_qo = 16'b0;
      default: n_qo = qo[15:0];
    endcase

  always @(posedge ck)
    begin
        qo <= #1 n_qo[15:0];
    end

endmodule


module ipp_sum_reg_w_r_17 (di, wr, rs, ck, qo);
input    [16:0] di;
input           wr;
input           rs;
input           ck;
output   [16:0] qo;

reg      [16:0] n_qo;
reg      [16:0] qo;

  always @(di or wr or rs or qo)
    case ({rs,wr})               // synopsys parallel_case
      (2'h1):  n_qo = di[16:0];
      (2'h2):  n_qo = 17'b0;
      (2'h3):  n_qo = 17'b0;
      default: n_qo = qo[16:0];
    endcase

  always @(posedge ck)
    begin
        qo <= #1 n_qo[16:0];
    end

endmodule


module ipp_sum_reg_w_r_23 (di, wr, rs, ck, qo);
input    [22:0] di;
input           wr;
input           rs;
input           ck;
output   [22:0] qo;

reg      [22:0] n_qo;
reg      [22:0] qo;

  always @(di or wr or rs or qo)
    case ({rs,wr})               // synopsys parallel_case
      (2'h1):  n_qo = di[22:0];
      (2'h2):  n_qo = 23'b0;
      (2'h3):  n_qo = 23'b0;
      default: n_qo = qo[22:0];
    endcase

  always @(posedge ck)
    begin
        qo <= #1 n_qo[22:0];
    end

endmodule


module ipp_sum_cnt_i_r_8 (      incr, rs, ck, qo);
input           incr;
input           rs;
input           ck;
output    [7:0] qo;

reg       [7:0] qo;

  always @(posedge ck)
    begin
      if (rs)
        qo <= #1 8'h0;
      else if (incr)
        qo <= #1 (qo[7:0] + 8'h1);
      else
        qo <= #1 qo[7:0];
    end

endmodule


module ipp_sum_dev_00_00(in1, in2, out);
input    [15:0] in1;
input    [15:0] in2;
output   [16:0] out;

wire     [16:0] out;

  assign out = {1'b0,in1[15:0]} + {1'b0,in2[15:0]};

endmodule


module ipp_sum_dev_00_01(in1, in2, out);
input    [15:0] in1;
input    [15:0] in2;
output   [15:0] out;

wire     [15:0] out;

  assign out = in1[15:0] + in2[15:0] + 16'h1;

endmodule


module ipp_sum_dev_01_0q (inp_wd3, inp_wd2, inp_wd1, inp_wrd, 
                     byt_ena, sel_awd, sel_add,
                     clr,     clk,
                     prt_cksum, cksum_fail);
input    [15:0] inp_wd3;
input    [15:0] inp_wd2;
input    [15:0] inp_wd1;
input    [15:0] inp_wrd;
input     [1:0] byt_ena;
input     [1:0] sel_awd;
input           sel_add;
input           clr;
input           clk;
output   [15:0] prt_cksum;
output          cksum_fail;

reg      [15:0] sum_wrd;
wire     [15:0] prt_cksum = ~sum_wrd[15:0];

wire     [15:0] out1 = {{8{byt_ena[1]}}&inp_wrd[15:8],{8{byt_ena[0]}}&inp_wrd[7:0]};
reg      [15:0] out2;
wire     [16:0] out3a;
wire     [15:0] out3b;
wire     [15:0] out4;
wire     [15:0] out5;

wire            cksum_fail = |(~out5[15:0]);

  always @(sel_awd  or
           out1     or inp_wd1 or inp_wd2 or inp_wd3)
    case (sel_awd)               // synopsys parallel_case
      (2'h0):  out2 = out1[15:0];
      (2'h1):  out2 = inp_wd1[15:0];
      (2'h2):  out2 = inp_wd2[15:0];
      (2'h3):  out2 = inp_wd3[15:0];
      default: out2 = out1[15:0];
    endcase

  ipp_sum_dev_00_00 dev_00_00_a (.in1(out2[15:0]), .in2(sum_wrd[15:0]), .out(out3a[16:0]));
  ipp_sum_dev_00_01 dev_00_01_b (.in1(out2[15:0]), .in2(sum_wrd[15:0]), .out(out3b[15:0]));

  assign out4 = out3a[16] ? out3b[15:0] : out3a[15:0];
  assign out5 = sel_add   ? out4[15:0]  : sum_wrd[15:0];

  always @(posedge clk) begin
    sum_wrd <= #1 ({16{!clr}} & out5[15:0]);
  end

endmodule


module ipp_sum_dev_01_0r (         inp_wd2, inp_wd1, inp_wrd, hdr_off, 
                     byt_ena, sel_awd, sel_bwd, sel_add,
                     clr,     clk,
                     sum_wrd);
input    [15:0] inp_wd2;
input    [15:0] inp_wd1;
input    [15:0] inp_wrd;
input     [3:0] hdr_off;
input     [1:0] byt_ena;
input     [1:0] sel_awd;
input           sel_bwd;
input           sel_add;
input           clr;
input           clk;
output   [15:0] sum_wrd;

reg      [15:0] sum_wrd;

wire     [15:0] out1 = {{8{byt_ena[1]}}&inp_wrd[15:8],{8{byt_ena[0]}}&inp_wrd[7:0]};
reg      [15:0] out2;
reg      [15:0] out1b;
wire     [16:0] out3a;
wire     [15:0] out3b;
wire     [15:0] out4;
wire     [15:0] out5;

  always @(sel_awd  or
           out1     or inp_wd1 or inp_wd2)
    case (sel_awd)               // synopsys parallel_case
      (2'h0):  out2 = out1[15:0];
      (2'h1):  out2 = inp_wd1[15:0];
      (2'h2):  out2 = inp_wd2[15:0];
      (2'h3):  out2 = inp_wd2[15:0];
      default: out2 = out1[15:0];
    endcase

  always @(sel_bwd  or hdr_off or
           sum_wrd)
    case (sel_bwd)               // synopsys parallel_case
      (1'h0):  out1b = sum_wrd[15:0];
      (1'h1):  out1b = {10'h3ff,hdr_off[3:0],2'h0};
      default: out1b = sum_wrd[15:0];
    endcase

  ipp_sum_dev_00_00 dev_00_00_a (.in1(out2[15:0]), .in2(out1b[15:0]), .out(out3a[16:0]));
  ipp_sum_dev_00_01 dev_00_01_b (.in1(out2[15:0]), .in2(out1b[15:0]), .out(out3b[15:0]));

  assign out4 = out3a[16] && !sel_bwd ? out3b[15:0] : out3a[15:0];
  assign out5 = sel_add   ? out4[15:0]  : sum_wrd[15:0];

  always @(posedge clk) begin
    sum_wrd <= #1 ({16{!clr}} & out5[15:0]);
  end

endmodule


module ipp_sum_dev_01_0s (                  inp_wd1, inp_wrd, 
                     byt_ena, sel_awd, sel_asw, sel_add,
                     clr,     clk,
                     sum_wrd);
input    [15:0] inp_wd1;
input    [15:0] inp_wrd;
input     [1:0] byt_ena;
input           sel_awd;
input           sel_asw;
input           sel_add;
input           clr;
input           clk;
output   [15:0] sum_wrd;

reg      [15:0] sum_wrd;

wire     [15:0] out1 = {{8{byt_ena[1]}}&inp_wrd[15:8],{8{byt_ena[0]}}&inp_wrd[7:0]};
wire     [15:0] out1a= sel_asw ? {out1[7:0],out1[15:8]} : out1[15:0];
reg      [15:0] out2;
wire     [16:0] out3a;
wire     [15:0] out3b;
wire     [15:0] out4;
wire     [15:0] out5;

  always @(sel_awd  or
           out1a    or inp_wd1)
    case (sel_awd)               // synopsys parallel_case
      (1'h0):  out2 = out1a[15:0];
      (1'h1):  out2 = inp_wd1[15:0];
      default: out2 = out1a[15:0];
    endcase

  ipp_sum_dev_00_00 dev_00_00_a (.in1(out2[15:0]), .in2(sum_wrd[15:0]), .out(out3a[16:0]));
  ipp_sum_dev_00_01 dev_00_01_b (.in1(out2[15:0]), .in2(sum_wrd[15:0]), .out(out3b[15:0]));

  assign out4 = out3a[16] ? out3b[15:0] : out3a[15:0];
  assign out5 = sel_add   ? out4[15:0]  : sum_wrd[15:0];

  always @(posedge clk) begin
    sum_wrd <= #1 ({16{!clr}} & out5[15:0]);
  end

endmodule


module ipp_sum_dev_01_0t (                           inp_wrd, hdr_off, 
                     byt_ena, sel_asw, sel_bwd, sel_add,
                     clr,     clk,
                     sum_wrd);
input    [15:0] inp_wrd;
input     [3:0] hdr_off;
input     [1:0] byt_ena;
input           sel_asw;
input           sel_bwd;
input           sel_add;
input           clr;
input           clk;
output   [15:0] sum_wrd;

reg      [15:0] sum_wrd;

wire     [15:0] out1 = {{8{byt_ena[1]}}&inp_wrd[15:8],{8{byt_ena[0]}}&inp_wrd[7:0]};
wire     [15:0] out2 = sel_asw ? {out1[7:0],out1[15:8]} : out1[15:0];
reg      [15:0] out1b;
wire     [16:0] out3a;
wire     [15:0] out3b;
wire     [15:0] out4;
wire     [15:0] out5;

  always @(sel_bwd  or hdr_off or
           sum_wrd)
    case (sel_bwd)               // synopsys parallel_case
      (1'h0):  out1b = sum_wrd[15:0];
      (1'h1):  out1b = {10'h3ff,hdr_off[3:0],2'h0};
      default: out1b = sum_wrd[15:0];
    endcase

  ipp_sum_dev_00_00 dev_00_00_a (.in1(out2[15:0]), .in2(out1b[15:0]), .out(out3a[16:0]));
  ipp_sum_dev_00_01 dev_00_01_b (.in1(out2[15:0]), .in2(out1b[15:0]), .out(out3b[15:0]));

  assign out4 = out3a[16] && !sel_bwd ? out3b[15:0] : out3a[15:0];
  assign out5 = sel_add   ? out4[15:0]  : sum_wrd[15:0];

  always @(posedge clk) begin
    sum_wrd <= #1 ({16{!clr}} & out5[15:0]);
  end

endmodule


module ipp_sum_dev_01_ut (inp_uln,                   inp_wrd, hdr_off, 
                     byt_ena, sel_asw, sel_bwd, sel_add, get_uln,
                     clr,     clk,
                     sum_wrd);
input    [15:0] inp_uln;
input    [15:0] inp_wrd;
input     [3:0] hdr_off;
input     [1:0] byt_ena;
input           sel_asw;
input           sel_bwd;
input           sel_add;
input           get_uln;
input           clr;
input           clk;
output   [15:0] sum_wrd;

reg      [15:0] sum_wrd;

wire     [15:0] out1 = {{8{byt_ena[1]}}&inp_wrd[15:8],{8{byt_ena[0]}}&inp_wrd[7:0]};
wire     [15:0] out2 = sel_asw ? {out1[7:0],out1[15:8]} : out1[15:0];
reg      [15:0] out2a;
reg      [15:0] out1b;
wire     [16:0] out3a;
wire     [15:0] out3b;
wire     [15:0] out4;
wire     [15:0] out5;

  always @(get_uln  or
           out2     or inp_uln)
    case (get_uln)               // synopsys parallel_case
      (1'h0):  out2a = out2[15:0];
      (1'h1):  out2a = inp_uln[15:0];
      default: out2a = out2[15:0];
    endcase

  always @(sel_bwd  or hdr_off or get_uln or 
           sum_wrd)
    case ({get_uln,sel_bwd})               // synopsys parallel_case
      (2'h0):  out1b = sum_wrd[15:0];
      (2'h1):  out1b = {10'h3ff,hdr_off[3:0],2'h0};
      (2'h2):  out1b = 16'h0;
      (2'h3):  out1b = 16'h0;
      default: out1b = sum_wrd[15:0];
    endcase

  ipp_sum_dev_00_00 dev_00_00_a (.in1(out2a[15:0]), .in2(out1b[15:0]), .out(out3a[16:0]));
  ipp_sum_dev_00_01 dev_00_01_b (.in1(out2a[15:0]), .in2(out1b[15:0]), .out(out3b[15:0]));

  assign out4 = out3a[16] && !sel_bwd ? out3b[15:0] : out3a[15:0];
  assign out5 = (sel_add || get_uln)  ? out4[15:0]  : sum_wrd[15:0];

  always @(posedge clk) begin
    sum_wrd <= #1 ({16{!clr}} & out5[15:0]);
  end

endmodule


