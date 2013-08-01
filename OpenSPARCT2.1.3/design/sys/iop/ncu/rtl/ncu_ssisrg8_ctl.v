// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_ssisrg8_ctl.v
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
module ncu_ssisrg8_ctl (
  iol2clk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  scan_in, 
  scan_out, 
  s_in, 
  p_in, 
  shift_n, 
  load_n, 
  p_out) ;
wire p_out_ff_scanin;
wire p_out_ff_scanout;
wire l1clk;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;


input  iol2clk;
input  tcu_pce_ov;
input  tcu_clk_stop;
input  tcu_scan_en;
input  tcu_aclk;
input  tcu_bclk;
input  scan_in;
output scan_out;
input  s_in;
input  [7:0] p_in;
input  shift_n;
input  load_n;
output [7:0] p_out;  

reg  [7:0]  p_out_n;

always@(p_in or s_in or load_n or shift_n or p_out) begin
    case({load_n,shift_n})
    2'b01   : p_out_n[7:0] =  p_in[7:0] ;
    2'b10   : p_out_n[7:0] = {p_out[6:0],s_in} ;
    default : p_out_n[7:0] =  p_out[7:0] ;
    endcase
end

ncu_ssisrg8_ctl_msff_ctl_macro__width_8 p_out_ff 
				(
				.scan_in(p_out_ff_scanin),
				.scan_out(p_out_ff_scanout),
				.dout		(p_out[7:0]),
				.l1clk		(l1clk),
				.din		(p_out_n[7:0]),
  .siclk(siclk),
  .soclk(soclk)
				);



/**** adding clock header ****/
ncu_ssisrg8_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk = tcu_aclk;
assign	soclk = tcu_bclk;
assign	   se = tcu_scan_en;
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;

// fixscan start:
assign p_out_ff_scanin           = scan_in                  ;
assign scan_out                  = p_out_ff_scanout         ;
// fixscan end:
endmodule








// any PARAMS parms go into naming of macro

module ncu_ssisrg8_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ssisrg8_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule








