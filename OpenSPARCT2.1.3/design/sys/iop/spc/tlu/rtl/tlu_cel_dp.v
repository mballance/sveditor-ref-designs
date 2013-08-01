// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_cel_dp.v
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
module tlu_cel_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tlu_cerer_tccp, 
  tlu_cerer_tcup, 
  tlu_cerer_tccd, 
  tlu_cerer_tcud, 
  ced_syndrome, 
  tca_ecc, 
  ced_cecc_err, 
  ced_uecc_err, 
  asi_tccup_in, 
  asi_tccud_in, 
  scan_out, 
  cel_syndrome, 
  cel_ecc, 
  cel_crit_ecc, 
  cel_tccp, 
  cel_tcup, 
  cel_tccd, 
  cel_tcud);
wire pce_ov;
wire clk;
wire stop;
wire siclk;
wire soclk;
wire se;
wire en;
wire ecc_lat_scanin;
wire ecc_lat_scanout;
wire tccp_in;
wire tcup_in;
wire tccd_in;
wire tcud_in;
wire [7:0] syndrome_in;
wire [7:0] rd_ecc;
wire tccp;
wire tcup;
wire tccd;
wire tcud;




input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input		tlu_cerer_tccp;		// Correctable precise enable    
input		tlu_cerer_tcup;		// Unorrectable precise enable   
input		tlu_cerer_tccd;		// Correctable disrupting enable 
input		tlu_cerer_tcud;		// Unorrectable disrupting enable

input	[7:0]	ced_syndrome;
input	[7:0]	tca_ecc;

input		ced_cecc_err;
input		ced_uecc_err;

input		asi_tccup_in;
input		asi_tccud_in;


output		scan_out;

output	[7:0]	cel_syndrome;
output	[7:0]	cel_ecc;
output	[7:0]	cel_crit_ecc;

output		cel_tccp;
output		cel_tcup;
output		cel_tccd;
output		cel_tcud;



////////////////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign clk      = l2clk;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;
assign en       = 1'b1;


// Data is flopped, but ECC is not...  so flop here

tlu_cel_dp_msff_macro__minbuff_1__width_28 ecc_lat  (
	.scan_in(ecc_lat_scanin),
	.scan_out(ecc_lat_scanout),
	.din	({tca_ecc		[7:0],
		  tccp_in		       ,
		  tcup_in		       ,
		  tccd_in		       ,
		  tcud_in		       ,
		  ced_syndrome		[7:0],
		  syndrome_in		[7:0]}),
	.dout	({rd_ecc		[7:0],
		  tccp			       ,
		  tcup			       ,
		  tccd			       ,
		  tcud			       ,
		  syndrome_in		[7:0],
		  cel_syndrome		[7:0]}),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign cel_crit_ecc[7:0] =
       rd_ecc[7:0];

tlu_cel_dp_buff_macro__rep_1__width_8 ecc_buf   (
	.din	(rd_ecc			[7:0]	),
	.dout	(cel_ecc		[7:0]	)
);


// Merge error signals
//assign tccp_in = 
//	 cecc_err & tlu_cerer_tccp;
//assign tcup_in = 
//	 uecc_err & tlu_cerer_tcup;
//assign tccd_in = 
//	 cecc_err & tlu_cerer_tccd;
//assign tcud_in = 
//	 uecc_err & tlu_cerer_tcud;
//assign tccp =
//	 cel_tccp & asi_tccup_in;
//assign tcup =
//	 cel_tcup & asi_tccup_in;


tlu_cel_dp_and_macro__ports_3__width_1 tccp_in_and   (
	.din0	(ced_cecc_err			),
	.din1	(tlu_cerer_tccp			),
	.din2	(asi_tccup_in			),
	.dout	(tccp_in			)
);

tlu_cel_dp_and_macro__ports_3__width_1 tcup_in_and   (
	.din0	(ced_uecc_err			),
	.din1	(tlu_cerer_tcup			),
	.din2	(asi_tccup_in			),
	.dout	(tcup_in			)
);

tlu_cel_dp_and_macro__ports_3__width_1 tccd_in_and   (
	.din0	(ced_cecc_err			),
	.din1	(tlu_cerer_tccd			),
	.din2	(asi_tccud_in			),
	.dout	(tccd_in			)
);

tlu_cel_dp_and_macro__ports_3__width_1 tcud_in_and   (
	.din0	(ced_uecc_err			),
	.din1	(tlu_cerer_tcud			),
	.din2	(asi_tccud_in			),
	.dout	(tcud_in			)
);


assign cel_tccp =
       tccp;

assign cel_tcup =
       tcup;

assign cel_tccd =
       tccd;

assign cel_tcud =
       tcud;



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

// fixscan start:
assign ecc_lat_scanin            = scan_in                  ;
assign scan_out                  = ecc_lat_scanout          ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module tlu_cel_dp_msff_macro__minbuff_1__width_28 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [26:0] so;

  input [27:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [27:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);




















endmodule









//
//   buff macro
//
//





module tlu_cel_dp_buff_macro__rep_1__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





//  
//   and macro for ports = 2,3,4
//
//





module tlu_cel_dp_and_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






and3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule




