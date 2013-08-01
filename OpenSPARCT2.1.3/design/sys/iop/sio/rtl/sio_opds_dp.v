// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sio_opds_dp.v
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
module sio_opds_dp (
  opds_packet_data, 
  opds_packet_parity, 
  opddqx0_dout, 
  opddqx1_dout, 
  opddqx0_pout, 
  opddqx1_pout, 
  opdhqx_dout, 
  opcs_new_opdhqx1, 
  opcs_new_opdhqx0, 
  ncu_sio_d_pei, 
  opcs_opds_reloadhdr, 
  opcs_opds_selhdr, 
  sio_mb1_opdhq_sel, 
  sio_mb1_opddq0_sel, 
  sio_mb1_opddq1_sel, 
  opds_read_data, 
  sio_mb1_run, 
  opcs_opddq0_rd_en, 
  opcs_opddq1_rd_en, 
  opcs_opdhq_rd_en, 
  mb1_opddq0_rd_en, 
  mb1_opddq1_rd_en, 
  mb1_opdhq_rd_en, 
  opds_opddq0_rd_en, 
  opds_opddq1_rd_en, 
  opds_opdhq_rd_en, 
  opcs_opddq0_rd_addr, 
  opcs_opddq1_rd_addr, 
  opcs_opdhq_rd_addr, 
  mb1_opddq0_rd_addr, 
  mb1_opddq1_rd_addr, 
  mb1_opdhq_rd_addr, 
  opds_opddq0_rd_addr, 
  opds_opddq1_rd_addr, 
  opds_opdhq_rd_addr, 
  parity_result, 
  iol2clk, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_out);
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire [63:0] opdhqx1_dout;
wire [63:0] opdhqx0_dout;
wire [63:0] packet_data0;
wire [63:0] packet_data1;
wire [7:0] packet_parity;
wire ff_packet_data0_h_scanin;
wire ff_packet_data0_h_scanout;
wire [63:0] packet_data0_next;
wire ff_packet_data0_l_scanin;
wire ff_packet_data0_l_scanout;
wire ff_packet_data1_h_scanin;
wire ff_packet_data1_h_scanout;
wire [63:0] packet_data1_next;
wire ff_packet_data1_l_scanin;
wire ff_packet_data1_l_scanout;
wire [7:0] packet_parity_next;
wire [3:0] packet_parity_next_buf;
wire ff_packet_parity_scanin;
wire ff_packet_parity_scanout;
wire [63:0] opds_qx0_data;
wire [63:0] opds_qx1_data;
wire [3:0] opddqx0_pout_inv;
wire [3:0] opddqx1_pout_inv;
wire [3:0] pgenx0_;
wire [3:0] pgenx1_;
wire err_inj_lsb;
wire [63:0] opds_qx0_rewired_data;
wire [63:0] opds_qx1_rewired_data;
wire ff_opdhqxout_scanin;
wire ff_opdhqxout_scanout;
wire [31:0] opdhqx_dout_reg;
wire mbist_read_unused;


   output [127:0]    opds_packet_data ;
   output [7:0]      opds_packet_parity;

   input [63:0] opddqx0_dout;
   input [63:0] opddqx1_dout;
   input [7:0]  opddqx0_pout;
   input [7:0]  opddqx1_pout;
   input [31:0] opdhqx_dout;
   input [63:0] opcs_new_opdhqx1;
   input [63:0] opcs_new_opdhqx0;
   input 	ncu_sio_d_pei;

   input 	opcs_opds_reloadhdr;
   input 	opcs_opds_selhdr;

   // for mb1
   input        sio_mb1_opdhq_sel; 
   input 	sio_mb1_opddq0_sel; 
   input 	sio_mb1_opddq1_sel; 
   output [71:0]      opds_read_data;
  
   // for mb1 - mux between the rd_en, rd_addr
   input 	      sio_mb1_run;
   input 	      opcs_opddq0_rd_en;
   input 	      opcs_opddq1_rd_en;
   input 	      opcs_opdhq_rd_en;
   input 	      mb1_opddq0_rd_en;
   input 	      mb1_opddq1_rd_en;
   input 	      mb1_opdhq_rd_en;
   output 	      opds_opddq0_rd_en;
   output 	      opds_opddq1_rd_en;
   output 	      opds_opdhq_rd_en;   

   input  [5:0]	      opcs_opddq0_rd_addr;
   input  [5:0]	      opcs_opddq1_rd_addr;
   input  [3:0]	      opcs_opdhq_rd_addr;
   input  [5:0]	      mb1_opddq0_rd_addr;
   input  [5:0]	      mb1_opddq1_rd_addr;
   input  [3:0]	      mb1_opdhq_rd_addr;
   output [5:0]	      opds_opddq0_rd_addr;
   output [5:0]	      opds_opddq1_rd_addr;
   output [3:0]	      opds_opdhq_rd_addr;   
   output [7:0]	      parity_result;   

   input 	iol2clk;
   input 	tcu_scan_en;
   input 	scan_in;
   input 	tcu_aclk;
   input 	tcu_bclk; 
   input 	tcu_pce_ov;
   input 	tcu_clk_stop;
   output 	scan_out;

   // scan renames
   assign 	se = tcu_scan_en;
   assign 	siclk = tcu_aclk;
   assign 	soclk = tcu_bclk;
   assign 	pce_ov = tcu_pce_ov;
   assign 	stop = tcu_clk_stop;
   // end scan

   // header format SIO->IO:
   // [127:122] : Command
   //             127=Response bit
   //             126=Posted bit
   //             125=Read bit
   //             124=WriteByteMask Active
   //             123=L2 bit
   //             122=IOB bit
   // [121:84]    Reserved
   // [83:83]     Reserved
   // [82:82]     Reserved
   // [81:81]     Unmapped Address Error -- will never happen
   // [80:80]     Uncorrectable Error
   // [79:64]     ID[15:0]
   // [63:62]     Reserved
   // [61:56]     CtagEcc[5:0]
   // [55: 0]     Reserved
   

   assign opdhqx1_dout[63:0] = opcs_new_opdhqx1[63:0];
   assign opdhqx0_dout[63:0] = opcs_new_opdhqx0[63:0];

   assign 	opds_packet_data[127:0] = {packet_data0[63:0], packet_data1[63:0]};

   assign 	opds_packet_parity[7:0] = {packet_parity[7], packet_parity[6], packet_parity[5], packet_parity[4],
					   packet_parity[3], packet_parity[2], packet_parity[1], packet_parity[0]};   

   sio_opds_dp_msff_macro__stack_32l__width_32 ff_packet_data0_h   (
						     .scan_in(ff_packet_data0_h_scanin),
						     .scan_out(ff_packet_data0_h_scanout),
						     .clk (iol2clk),
						     .din (packet_data0_next[63:32]),
						     .dout (packet_data0[63:32]),
						     .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
						     );

   sio_opds_dp_msff_macro__stack_32l__width_32 ff_packet_data0_l   (
						     .scan_in(ff_packet_data0_l_scanin),
						     .scan_out(ff_packet_data0_l_scanout),
						     .clk (iol2clk),
						     .din (packet_data0_next[31:0]),
						     .dout (packet_data0[31:0]),
						     .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
						     );
   
   
   sio_opds_dp_msff_macro__stack_32l__width_32 ff_packet_data1_h   (
						     .scan_in(ff_packet_data1_h_scanin),
						     .scan_out(ff_packet_data1_h_scanout),
						     .clk (iol2clk),
						     .din (packet_data1_next[63:32]),
						     .dout (packet_data1[63:32]),
						     .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
						     );

   sio_opds_dp_msff_macro__stack_32l__width_32 ff_packet_data1_l   (
						     .scan_in(ff_packet_data1_l_scanin),
						     .scan_out(ff_packet_data1_l_scanout),
						     .clk (iol2clk),
						     .din (packet_data1_next[31:0]),
						     .dout (packet_data1[31:0]),
						     .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
						     );

   sio_opds_dp_buff_macro__minbuff_1__stack_4l__width_4  buf_packet_parity    (
                        .din (packet_parity_next[3:0]),
                        .dout (packet_parity_next_buf[3:0])
                        );
			
   sio_opds_dp_msff_macro__left_32__stack_64c__width_8 ff_packet_parity    (
						       .scan_in(ff_packet_parity_scanin),
						       .scan_out(ff_packet_parity_scanout),
						       .clk (iol2clk),
						       .din ({packet_parity_next[7:4],packet_parity_next_buf[3:0]}),
						       .dout (packet_parity[7:0]),
						       .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
						       );

				       
   assign 	packet_data0_next[63:0] = opds_qx0_data[63:0];
   assign 	packet_data1_next[63:0] = opds_qx1_data[63:0];
   assign 	packet_parity_next[7:0]	= {opddqx0_pout_inv[3:0], opddqx1_pout_inv[3:0]};

   //assign 	packet_parity_next[7:0] = {pgenx0[3], pgenx0[2], pgenx0[1], pgenx0[0],
//					   pgenx1[3], pgenx1[2], pgenx1[1], pgenx1[0]};

   sio_opds_dp_xor_macro__ports_2__stack_8r__width_8 xor_compare    (
        .din0 ({opddqx0_pout[3:0],opddqx1_pout[3:0]}),
        .din1 ({pgenx0_[3:0], pgenx1_[3:0]}),
	.dout (parity_result[7:0])
        );


   sio_opds_dp_mux_macro__mux_aope__ports_2__stack_64c__width_64  mx21_opds_qx0_data     (
	.dout (opds_qx0_data[63:0]),
	.din0 ({opdhqx0_dout[63:0]}),
	.din1 ({opddqx0_dout[63:0]}),
	.sel0 (opcs_opds_selhdr)
	);

   sio_opds_dp_mux_macro__mux_aope__ports_2__stack_64c__width_64  mx21_opds_qx1_data     (
	.dout (opds_qx1_data[63:0]),
	.din0 ({opdhqx1_dout[63:0]}),
	.din1 ({opddqx1_dout[63:1],err_inj_lsb}),
	.sel0 (opcs_opds_selhdr)
	);

   sio_opds_dp_xor_macro__left_1__stack_4r__width_1  xor2_err_inj_lsb    (
        .din0  (opddqx1_dout[0]),
        .din1  (ncu_sio_d_pei),
        .dout  (err_inj_lsb)
        );



// INTERLEAVED PARITY CODE
//
// pgenx

   assign opds_qx0_rewired_data[63:0] = {
					 opds_qx0_data[63], opds_qx0_data[61], opds_qx0_data[59], opds_qx0_data[57],
					 opds_qx0_data[55], opds_qx0_data[53], opds_qx0_data[51], opds_qx0_data[49],
					 opds_qx0_data[47], opds_qx0_data[45], opds_qx0_data[43], opds_qx0_data[41],
					 opds_qx0_data[39], opds_qx0_data[37], opds_qx0_data[35], opds_qx0_data[33],

					 opds_qx0_data[62], opds_qx0_data[60], opds_qx0_data[58], opds_qx0_data[56],
					 opds_qx0_data[54], opds_qx0_data[52], opds_qx0_data[50], opds_qx0_data[48],
					 opds_qx0_data[46], opds_qx0_data[44], opds_qx0_data[42], opds_qx0_data[40],
					 opds_qx0_data[38], opds_qx0_data[36], opds_qx0_data[34], opds_qx0_data[32],

					 opds_qx0_data[31], opds_qx0_data[29], opds_qx0_data[27], opds_qx0_data[25],
					 opds_qx0_data[23], opds_qx0_data[21], opds_qx0_data[19], opds_qx0_data[17],
					 opds_qx0_data[15], opds_qx0_data[13], opds_qx0_data[11], opds_qx0_data[ 9],
					 opds_qx0_data[ 7], opds_qx0_data[ 5], opds_qx0_data[ 3], opds_qx0_data[ 1],

					 opds_qx0_data[30], opds_qx0_data[28], opds_qx0_data[26], opds_qx0_data[24],
					 opds_qx0_data[22], opds_qx0_data[20], opds_qx0_data[18], opds_qx0_data[16],
					 opds_qx0_data[14], opds_qx0_data[12], opds_qx0_data[10], opds_qx0_data[ 8],
					 opds_qx0_data[ 6], opds_qx0_data[ 4], opds_qx0_data[ 2], opds_qx0_data[ 0]
					 };
   

   assign opds_qx1_rewired_data[63:0] = {
					 opds_qx1_data[63], opds_qx1_data[61], opds_qx1_data[59], opds_qx1_data[57],
					 opds_qx1_data[55], opds_qx1_data[53], opds_qx1_data[51], opds_qx1_data[49],
					 opds_qx1_data[47], opds_qx1_data[45], opds_qx1_data[43], opds_qx1_data[41],
					 opds_qx1_data[39], opds_qx1_data[37], opds_qx1_data[35], opds_qx1_data[33],

					 opds_qx1_data[62], opds_qx1_data[60], opds_qx1_data[58], opds_qx1_data[56],
					 opds_qx1_data[54], opds_qx1_data[52], opds_qx1_data[50], opds_qx1_data[48],
					 opds_qx1_data[46], opds_qx1_data[44], opds_qx1_data[42], opds_qx1_data[40],
					 opds_qx1_data[38], opds_qx1_data[36], opds_qx1_data[34], opds_qx1_data[32],

					 opds_qx1_data[31], opds_qx1_data[29], opds_qx1_data[27], opds_qx1_data[25],
					 opds_qx1_data[23], opds_qx1_data[21], opds_qx1_data[19], opds_qx1_data[17],
					 opds_qx1_data[15], opds_qx1_data[13], opds_qx1_data[11], opds_qx1_data[ 9],
					 opds_qx1_data[ 7], opds_qx1_data[ 5], opds_qx1_data[ 3], opds_qx1_data[ 1],

					 opds_qx1_data[30], opds_qx1_data[28], opds_qx1_data[26], opds_qx1_data[24],
					 opds_qx1_data[22], opds_qx1_data[20], opds_qx1_data[18], opds_qx1_data[16],
					 opds_qx1_data[14], opds_qx1_data[12], opds_qx1_data[10], opds_qx1_data[ 8],
					 opds_qx1_data[ 6], opds_qx1_data[ 4], opds_qx1_data[ 2], opds_qx1_data[ 0]
					 };
   


   sio_opds_dp_prty_macro__width_16 prty_pgenx03  (
	.din  (opds_qx0_rewired_data[63:48]),
	.dout (pgenx0_[3])
        );
					     
   sio_opds_dp_prty_macro__width_16 prty_pgenx02  (
	.din  (opds_qx0_rewired_data[47:32]),
	.dout (pgenx0_[2])
        );

   sio_opds_dp_prty_macro__width_16 prty_pgenx01  (
	.din  (opds_qx0_rewired_data[31:16]),
	.dout (pgenx0_[1])
        );
					     
   sio_opds_dp_prty_macro__width_16 prty_pgenx00  (
	.din  (opds_qx0_rewired_data[15:0]),
	.dout (pgenx0_[0])
        );

					     
   sio_opds_dp_prty_macro__width_16 prty_pgenx13  (
	.din  (opds_qx1_rewired_data[63:48]),
	.dout (pgenx1_[3])
        );

   sio_opds_dp_prty_macro__width_16 prty_pgenx12  (
	.din  (opds_qx1_rewired_data[47:32]),
	.dout (pgenx1_[2])
        );

   sio_opds_dp_prty_macro__width_16 prty_pgenx11  (
	.din  (opds_qx1_rewired_data[31:16]),
	.dout (pgenx1_[1])
        );

   sio_opds_dp_prty_macro__width_16 prty_pgenx10  (
	.din  (opds_qx1_rewired_data[15:0]),
	.dout (pgenx1_[0])
        );

   sio_opds_dp_inv_macro__left_0__stack_8l__width_8 inv_prty_pgenxyz     (
     .din ({opddqx0_pout[3:0], opddqx1_pout[3:0]}),
     .dout ({opddqx0_pout_inv[3:0], opddqx1_pout_inv[3:0]})
       );

   // for mb1 -- 3:1 mux of {opddqx0_pout[7:0], opddqx0_dout[63:0]} or
   //                       {opddqx1_pout[7:0], opddqx1_dout[63:0]} or
   //                       {8'd0, 32'd0 , opdhqx_dout}

   sio_opds_dp_msff_macro__stack_64c__width_32 ff_opdhqxout   (
						     .scan_in(ff_opdhqxout_scanin),
						     .scan_out(ff_opdhqxout_scanout),
						     .clk (iol2clk),
						     .din (opdhqx_dout[31:0]),
						     .dout (opdhqx_dout_reg[31:0]),
						     .en  (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
						     );
   
   sio_opds_dp_mux_macro__mux_aonpe__ports_3__stack_72c__width_72  mx31_mbist_read_data     (
	.dout (opds_read_data[71:0]),
	.din0 ({opddqx0_pout[7:0], opddqx0_dout[63:0]}),
	.din1 ({opddqx1_pout[7:0], opddqx1_dout[63:0]}),
	.din2 ({8'h00, {32{1'b0}} , opdhqx_dout_reg[31:0]}),				       
	.sel0 (sio_mb1_opddq0_sel),
	.sel1 (sio_mb1_opddq1_sel),
	.sel2 (sio_mb1_opdhq_sel)
	);

   // for mb1 -- 2:1 mux of opcs_x or mb1_x -> opds_x
   // width = 19 = 3 (rd_ens) + 12 (dqx_rd_addr) + 4 (hq_rd_addr)
   // 
   sio_opds_dp_mux_macro__mux_aope__ports_2__stack_20c__width_20  mx21_mbist_read_controls     (
	.dout ({mbist_read_unused, opds_opddq0_rd_addr[5:0], opds_opddq1_rd_addr[5:0], opds_opdhq_rd_addr[3:0],
		opds_opddq0_rd_en, opds_opddq1_rd_en, opds_opdhq_rd_en}),

	.din0 ({1'b0, mb1_opddq0_rd_addr[5:0], mb1_opddq1_rd_addr[5:0], mb1_opdhq_rd_addr[3:0],
		mb1_opddq0_rd_en, mb1_opddq1_rd_en, mb1_opdhq_rd_en}),

	.din1 ({1'b0, opcs_opddq0_rd_addr[5:0], opcs_opddq1_rd_addr[5:0], opcs_opdhq_rd_addr[3:0],
		opcs_opddq0_rd_en, opcs_opddq1_rd_en, opcs_opdhq_rd_en}),
										  
	.sel0 (sio_mb1_run)
	);

   
   
   
// fixscan start:
assign ff_packet_data0_h_scanin  = scan_in                  ;
assign ff_packet_data0_l_scanin  = ff_packet_data0_h_scanout;
assign ff_packet_data1_h_scanin  = ff_packet_data0_l_scanout;
assign ff_packet_data1_l_scanin  = ff_packet_data1_h_scanout;
assign ff_packet_parity_scanin   = ff_packet_data1_l_scanout;
assign ff_opdhqxout_scanin       = ff_packet_parity_scanout ;
assign scan_out                  = ff_opdhqxout_scanout     ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module sio_opds_dp_msff_macro__stack_32l__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









//
//   buff macro
//
//





module sio_opds_dp_buff_macro__minbuff_1__stack_4l__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule









// any PARAMS parms go into naming of macro

module sio_opds_dp_msff_macro__left_32__stack_64c__width_8 (
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
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


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
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule









//
//   xor macro for ports = 2,3
//
//





module sio_opds_dp_xor_macro__ports_2__stack_8r__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;





xor2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_opds_dp_mux_macro__mux_aope__ports_2__stack_64c__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   xor macro for ports = 2,3
//
//





module sio_opds_dp_xor_macro__left_1__stack_4r__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   parity macro (even parity)
//
//





module sio_opds_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





//
//   invert macro
//
//





module sio_opds_dp_inv_macro__left_0__stack_8l__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






inv #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);









endmodule









// any PARAMS parms go into naming of macro

module sio_opds_dp_msff_macro__stack_64c__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_opds_dp_mux_macro__mux_aonpe__ports_3__stack_72c__width_72 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [71:0] din0;
  input sel0;
  input [71:0] din1;
  input sel1;
  input [71:0] din2;
  input sel2;
  output [71:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(72)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
  .in2(din2[71:0]),
.dout(dout[71:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_opds_dp_mux_macro__mux_aope__ports_2__stack_20c__width_20 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [19:0] din0;
  input [19:0] din1;
  input sel0;
  output [19:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(20)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[19:0]),
  .in1(din1[19:0]),
.dout(dout[19:0])
);









  



endmodule

