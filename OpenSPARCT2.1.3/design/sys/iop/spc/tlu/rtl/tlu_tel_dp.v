// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_tel_dp.v
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
module tlu_tel_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  trl_tel_en, 
  asi_mbist_tel_en, 
  ted_syndrome, 
  tsa_ecc, 
  ted0_cecc_err, 
  ted0_uecc_err, 
  ted0_uecc_err_, 
  ted1_cecc_err, 
  ted1_uecc_err, 
  ted1_uecc_err_, 
  trl_tsacu_en_in, 
  scan_out, 
  tel_syndrome, 
  tel_ecc, 
  tel_crit_ecc, 
  tel_tsac, 
  tel_tsau, 
  tel_tsacu_exc, 
  tel_tsac_exc, 
  tel_tsau_exc);
wire pce_ov;
wire clk;
wire stop;
wire siclk;
wire soclk;
wire se;
wire en;
wire [15:0] tsa_ecc_minbuf;
wire [3:0] trl_tsacu_en_in_minbuf;
wire ecc_lat_scanin;
wire ecc_lat_scanout;
wire tsac_in;
wire tsau_in;
wire [15:0] rd_ecc;
wire [3:0] tsacu_en;
wire tsac;
wire tsau;
wire cecc_or_;
wire [3:0] tsac_exc_;
wire [3:0] tsau_exc_;




input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input		trl_tel_en;
input		asi_mbist_tel_en;

input	[15:0]	ted_syndrome;
input	[15:0]	tsa_ecc;

input		ted0_cecc_err;
input		ted0_uecc_err;
input		ted0_uecc_err_;
input		ted1_cecc_err;
input		ted1_uecc_err;
input		ted1_uecc_err_;

input	[3:0] trl_tsacu_en_in;


output		scan_out;

output	[15:0]	tel_syndrome;
output	[15:0]	tel_ecc;
output	[15:0]	tel_crit_ecc;

output		tel_tsac;
output		tel_tsau;

output	[3:0]	tel_tsacu_exc;
output	[3:0]	tel_tsac_exc;
output	[3:0]	tel_tsau_exc;



////////////////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign clk      = l2clk;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;



////////////////////////////////////////////////////////////////////////////////
// Clock enable

tlu_tel_dp_or_macro__ports_2__width_1 en_or   (
	.din0	(trl_tel_en		),
	.din1	(asi_mbist_tel_en	),
	.dout	(en			)
);

// Data is flopped, but ECC is not,  so flop here

tlu_tel_dp_buff_macro__minbuff_1__width_20 ecc_lat_minbuff  (
	.din	({tsa_ecc		[15:0],
		  trl_tsacu_en_in	[3:0]}),
	.dout	({tsa_ecc_minbuf	[15:0],
		  trl_tsacu_en_in_minbuf[3:0]}));


tlu_tel_dp_msff_macro__width_38 ecc_lat  (
	.scan_in(ecc_lat_scanin),
	.scan_out(ecc_lat_scanout),
	.din	({tsa_ecc_minbuf	[15:0],
		  trl_tsacu_en_in_minbuf[3:0],
		  tsac_in		       ,
		  tsau_in		       ,
		  ted_syndrome		[15:0]}),
	.dout	({rd_ecc		[15:0],
		  tsacu_en		[3:0],
		  tsac			       ,
		  tsau			       ,
		  tel_syndrome		[15:0]}),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign tel_crit_ecc[15:0] =
       rd_ecc[15:0];

tlu_tel_dp_buff_macro__rep_1__width_16 ecc_buf   (
	.din	(rd_ecc			[15:0]	),
	.dout	(tel_ecc		[15:0]	)
);



tlu_tel_dp_nand_macro__ports_2__width_1 tsau_in_nand   (
	.din0	(ted0_uecc_err_			),
	.din1	(ted1_uecc_err_			),
	.dout	(tsau_in			)
);

tlu_tel_dp_nor_macro__ports_2__width_1 cecc_or_inv_nor   (
	.din0	(ted0_cecc_err			),
	.din1	(ted1_cecc_err			),
	.dout	(cecc_or_			)
);

tlu_tel_dp_nor_macro__ports_3__width_1 tsac_in_nor   (
	.din0	(cecc_or_			),
	.din1	(ted0_uecc_err			),
	.din2	(ted1_uecc_err			),
	.dout	(tsac_in			)
);

tlu_tel_dp_buff_macro__rep_1__width_1 tsac_buf   (
	.din	(tsac				),
	.dout	(tel_tsac			)
);

tlu_tel_dp_buff_macro__rep_1__width_1 tsau_buf   (
	.din	(tsau				),
	.dout	(tel_tsau			)
);


tlu_tel_dp_nand_macro__ports_2__width_4 tsac_exc_b_nand   (
	.din0	({4 {tsac}}			),
	.din1	(tsacu_en		[3:0]	),
	.dout	(tsac_exc_		[3:0]	)
);

tlu_tel_dp_nand_macro__ports_2__width_4 tsau_exc_b_nand   (
	.din0	({4 {tsau}}			),
	.din1	(tsacu_en		[3:0]	),
	.dout	(tsau_exc_		[3:0]	)
);

tlu_tel_dp_inv_macro__width_4 tsac_exc_inv  (
	.din	(tsac_exc_		[3:0]	),
	.dout	(tel_tsac_exc		[3:0]	)
);

tlu_tel_dp_inv_macro__width_4 tsau_exc_inv  (
	.din	(tsau_exc_		[3:0]	),
	.dout	(tel_tsau_exc		[3:0]	)
);

tlu_tel_dp_nand_macro__ports_2__width_4 tsacu_exc_nand   (
	.din0	(tsac_exc_		[3:0]	),
	.din1	(tsau_exc_		[3:0]	),
	.dout	(tel_tsacu_exc		[3:0]	)
);






supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

// fixscan start:
assign ecc_lat_scanin            = scan_in                  ;
assign scan_out                  = ecc_lat_scanout          ;
// fixscan end:
endmodule



//  
//   or macro for ports = 2,3
//
//





module tlu_tel_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   buff macro
//
//





module tlu_tel_dp_buff_macro__minbuff_1__width_20 (
  din, 
  dout);
  input [19:0] din;
  output [19:0] dout;






buff #(20)  d0_0 (
.in(din[19:0]),
.out(dout[19:0])
);








endmodule









// any PARAMS parms go into naming of macro

module tlu_tel_dp_msff_macro__width_38 (
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
wire [36:0] so;

  input [37:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [37:0] dout;


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
dff #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q(dout[37:0])
);




















endmodule









//
//   buff macro
//
//





module tlu_tel_dp_buff_macro__rep_1__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






buff #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module tlu_tel_dp_nand_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module tlu_tel_dp_nor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   nor macro for ports = 2,3
//
//





module tlu_tel_dp_nor_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);







endmodule





//
//   buff macro
//
//





module tlu_tel_dp_buff_macro__rep_1__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module tlu_tel_dp_nand_macro__ports_2__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






nand2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//
//   invert macro
//
//





module tlu_tel_dp_inv_macro__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule




