// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2b_siu_dp.v
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
module l2b_siu_dp (
  sii_l2t_req, 
  sii_l2b_ecc, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_in, 
  l2clk, 
  scan_out, 
  evict_l2b_rdma_array_din);
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire stop;
wire ff_sii_l2t_req_ecc_s3_scanin;
wire ff_sii_l2t_req_ecc_s3_scanout;
wire [38:0] sii_l2t_req_ecc_s3;
wire ff_sii_l2t_req_ecc_s3a_scanin;
wire ff_sii_l2t_req_ecc_s3a_scanout;
wire [38:0] sii_l2t_req_ecc_s4;


input   [31:0]   sii_l2t_req ;
input   [6:0]    sii_l2b_ecc ;

input           tcu_aclk;
input           tcu_bclk;
 input           tcu_scan_en;
input           tcu_pce_ov;
input		tcu_clk_stop;
input           scan_in;
input		l2clk;


output          scan_out;
output  [623:0]  evict_l2b_rdma_array_din ;

assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign stop = tcu_clk_stop;

wire	[623:0]	evict_l2b_rdma_array_din;
wire	[38:0]	sii_l2t_req_ecc_s2;

////////////////////////////////////////////////////////////////////////////////
// Data arriving from jbus is flopped and fanned out to 624 bits here.
////////////////////////////////////////////////////////////////////////////////


l2b_siu_dp_buff_macro__stack_40r__width_39 sii_l2t_req_ecc_s2_slice   
        (
        .din    ({sii_l2t_req[31:0], sii_l2b_ecc[6:0]}),
        .dout   (sii_l2t_req_ecc_s2)
        );


l2b_siu_dp_msff_macro__stack_40r__width_39   ff_sii_l2t_req_ecc_s3    
                (
                .scan_in(ff_sii_l2t_req_ecc_s3_scanin),
                .scan_out(ff_sii_l2t_req_ecc_s3_scanout),
                .din    (sii_l2t_req_ecc_s2[38:0]), 
                .clk    (l2clk),
                .dout   (sii_l2t_req_ecc_s3[38:0]), 
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
                );



// 
//  Phase 2 : SIU inteface and packet format change 2/7/04
//  Data is delayed by one clock.
//


l2b_siu_dp_msff_macro__stack_40r__width_39   ff_sii_l2t_req_ecc_s3a   
                (
                .scan_in(ff_sii_l2t_req_ecc_s3a_scanin),
                .scan_out(ff_sii_l2t_req_ecc_s3a_scanout),
                .din    (sii_l2t_req_ecc_s3[38:0]),
                .clk    (l2clk),
                .dout   (sii_l2t_req_ecc_s4[38:0]),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );


//assign  evict_l2b_rdma_array_din = {16{sii_l2t_req_ecc_s4[38:0]}} ;


l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_1  
	(
	.dout		(evict_l2b_rdma_array_din[38:0]),
	.din		(sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_2  
	(
	.dout		(evict_l2b_rdma_array_din[77:39]),
        .din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_3  
	(
	.dout		(evict_l2b_rdma_array_din[116:78]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_4  
	(
	.dout		(evict_l2b_rdma_array_din[155:117]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_5  
	(
	.dout		(evict_l2b_rdma_array_din[194:156]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_6  
	(
	.dout		(evict_l2b_rdma_array_din[233:195]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_7  
	(
	.dout		(evict_l2b_rdma_array_din[272:234]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_8  
	(
	.dout		(evict_l2b_rdma_array_din[311:273]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_9  
	(
	.dout		(evict_l2b_rdma_array_din[350:312]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_10  
	(
	.dout		(evict_l2b_rdma_array_din[389:351]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_11  
	(
	.dout		(evict_l2b_rdma_array_din[428:390]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_12  
	(
	.dout		(evict_l2b_rdma_array_din[467:429]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_13  
	(
	.dout		(evict_l2b_rdma_array_din[506:468]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_14  
	(
	.dout		(evict_l2b_rdma_array_din[545:507]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_15  
	(
	.dout		(evict_l2b_rdma_array_din[584:546]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);

l2b_siu_dp_buff_macro__stack_40r__width_39	buff_ff_sii_l2t_req_ecc_s3a_16  
	(
	.dout		(evict_l2b_rdma_array_din[623:585]),
	.din            (sii_l2t_req_ecc_s4[38:0])
	);


// fixscan start:
assign ff_sii_l2t_req_ecc_s3_scanin = scan_in                  ;
assign ff_sii_l2t_req_ecc_s3a_scanin = ff_sii_l2t_req_ecc_s3_scanout;
assign scan_out                  = ff_sii_l2t_req_ecc_s3a_scanout;
// fixscan end:
endmodule


//
//   buff macro
//
//





module l2b_siu_dp_buff_macro__stack_40r__width_39 (
  din, 
  dout);
  input [38:0] din;
  output [38:0] dout;






buff #(39)  d0_0 (
.in(din[38:0]),
.out(dout[38:0])
);








endmodule









// any PARAMS parms go into naming of macro

module l2b_siu_dp_msff_macro__stack_40r__width_39 (
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
wire [37:0] so;

  input [38:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [38:0] dout;


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
dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);




















endmodule








