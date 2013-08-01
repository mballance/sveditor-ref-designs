// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_mam_mp_160x66_cust.v
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

////////////////////////////////////////////////////////////////////////////////
// $Id: n2_mam_mp_160x66_cust.v,v 1.1.1.1 2007/02/13 22:19:31 drp Exp $
//
//  Copyright (C) 2003 by Sun Microsystems, Inc.
//
//  All rights reserved. No part of this design may be reproduced,
//  stored in a retrieval system, or transmitted, in any form or by
//  any means, electronic, mechanical, photocopying, recording, or
//  otherwise, without prior written permission of Sun Microsystems,
//  Inc.
//
//  Sun Proprietary/Confidential
//
//  Description:        SPU MA MEM
//			  - 160 entry
//			  - 64-bit data + 2-bit parity = 66-bit total
//			  - 2 Read + 1 Write ports
//
//  Primary Contact:    christopher.olson@sun.com
////////////////////////////////////////////////////////////////////////////////


module n2_mam_mp_160x66_cust (
  l2clk, 
  scan_in, 
  pce, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_array_wr_inhibit, 
  tcu_se_scancollar_in, 
  tcu_scan_en, 
  rd0_enable, 
  rd0_enable_ff_clken, 
  r0_addr, 
  r0_byp, 
  rd1_enable, 
  rd1_enable_ff_clken, 
  r1_addr, 
  r1_byp, 
  w_addr, 
  wr_enable, 
  wr_data, 
  scan_out, 
  rd0_data, 
  rd1_data);
wire siclk;
wire soclk;
wire l1clk_wr_data_e;
wire [65:0] i_wr_data_ff_scanin;
wire [65:0] i_wr_data_ff_scanout;
wire [65:0] wr_data_ff;
wire l1clk_rd_data_e;
wire [7:0] r0_addr_ff;
wire [7:0] r0_mux;
wire [7:0] i_r0_addr_ff_scanin;
wire [7:0] i_r0_addr_ff_scanout;
wire l1clk_out;
wire [7:0] r0_addr_lat;
wire [7:0] r0_lat_l_unused;
wire [7:0] r0_dout_l_unused;
wire [7:0] r1_addr_ff;
wire [7:0] r1_mux;
wire [7:0] i_r1_addr_ff_scanin;
wire [7:0] i_r1_addr_ff_scanout;
wire [7:0] r1_addr_lat;
wire [7:0] r1_lat_l_unused;
wire [7:0] r1_dout_l_unused;
wire [7:0] i_w_addr_ff_scanin;
wire [7:0] i_w_addr_ff_scanout;
wire [7:0] w_addr_ff;
wire rd0_enable_ff;
wire rd0_enable_ff_mux;
wire [0:0] i_rd0_enable_ff_scanin;
wire [0:0] i_rd0_enable_ff_scanout;
wire rd0_enable_lat;
wire rd0_enable_ff_unused;
wire rd0_enable_dout_l_unused;
wire rd1_enable_ff;
wire rd1_enable_ff_mux;
wire [0:0] i_rd1_enable_ff_scanin;
wire [0:0] i_rd1_enable_ff_scanout;
wire rd1_enable_lat;
wire rd1_enable_ff_unused;
wire rd1_enable_dout_l_unused;
wire [0:0] i_wr_enable_ff_scanin;
wire [0:0] i_wr_enable_ff_scanout;
wire wr_enable_ff;


input		l2clk;
input		scan_in;
input		pce;
input		tcu_pce_ov;
input		tcu_aclk;
input		tcu_bclk;
input		tcu_array_wr_inhibit;
input		tcu_se_scancollar_in;
input		tcu_scan_en;

input		rd0_enable;
input		rd0_enable_ff_clken;
input   [7:0]	r0_addr;
input		r0_byp;
input		rd1_enable;
input		rd1_enable_ff_clken;
input   [7:0]	r1_addr;
input		r1_byp;
input   [7:0]	w_addr;
input		wr_enable;
input  [65:0]	wr_data;

output		scan_out;
output [65:0]	rd0_data;
output [65:0]	rd1_data;


// scan renames
assign siclk	= tcu_aclk;
assign soclk	= tcu_bclk;
// end scan

n2_mam_mp_160x66_cust_l1clkhdr_ctl_macro wr_en_clkgen (
        .l2clk  (l2clk          	),
        .l1en   (wr_enable		),
	.pce_ov (tcu_pce_ov		),
	.stop	(1'b0			),
	.se	(tcu_se_scancollar_in	),
        .l1clk  (l1clk_wr_data_e	)
);

n2_mam_mp_160x66_cust_msff_ctl_macro__fs_1__scanreverse_1__width_66	i_wr_data_ff		 (
     .scan_in(i_wr_data_ff_scanin[65:0]),
     .scan_out(i_wr_data_ff_scanout[65:0]),
  .l1clk  ( l1clk_wr_data_e				),
  .din  ( wr_data[65:0]					),
  .dout ( wr_data_ff[65:0]				),
  .siclk(siclk),
  .soclk(soclk));

// Change clk enables for read port addr/enables to be mux holds per Tai's request
n2_mam_mp_160x66_cust_l1clkhdr_ctl_macro rd_en_clkgen (
        .l2clk  (l2clk          	),
        .l1en   (pce			),
	.pce_ov (tcu_pce_ov		),
	.stop	(1'b0			),
	.se	(tcu_se_scancollar_in	),
        .l1clk  (l1clk_rd_data_e	)
);

n2_mam_mp_160x66_cust_mux_macro__mux_aope__ports_2__width_8 i_r0_mux			   (
  .din0	(r0_addr[7:0]					),
  .din1	(r0_addr_ff[7:0]				),
  .sel0	(rd0_enable_ff_clken				),
  .dout (r0_mux[7:0]					));

n2_mam_mp_160x66_cust_sram_msff_mo_macro__fs_1__width_8 i_r0_addr_ff			  	(
  .scan_in(i_r0_addr_ff_scanin[7:0]),
  .scan_out(i_r0_addr_ff_scanout[7:0]),
  .l1clk (l1clk_rd_data_e				),
  .and_clk (l1clk_out					),
  .siclk(siclk						),
  .soclk(soclk						),
  .d  ( r0_mux[7:0]					),
  .mq (r0_addr_lat[7:0]					),
  .mq_l(r0_lat_l_unused[7:0]				),
  .q_l(r0_dout_l_unused[7:0]				),
  .q    ( r0_addr_ff[7:0]				));

//msff_ctl_macro	i_r0_addr_ff		(fs=1,width=8) 	(
//     .scan_in(i_r0_addr_ff_scanin[7:0]),
//     .scan_out(i_r0_addr_ff_scanout[7:0]),
//  .l1clk (l1clk_rd_data_e				),
//  .din  ( r0_mux[7:0]					),
//  .dout ( r0_addr_ff[7:0]				));

n2_mam_mp_160x66_cust_mux_macro__mux_aope__ports_2__width_8 i_r1_mux			   (
  .din0	(r1_addr[7:0]					),
  .din1	(r1_addr_ff[7:0]				),
  .sel0	(rd1_enable_ff_clken				),
  .dout (r1_mux[7:0]					));

//msff_ctl_macro	i_r1_addr_ff		(fs=1,width=8) 	(
//     .scan_in(i_r1_addr_ff_scanin[7:0]),
//     .scan_out(i_r1_addr_ff_scanout[7:0]),
//  .l1clk  ( l1clk_rd_data_e				),
//  .din  ( r1_mux[7:0] 					),
//  .dout ( r1_addr_ff[7:0]				));

n2_mam_mp_160x66_cust_sram_msff_mo_macro__fs_1__width_8 i_r1_addr_ff			  	(
  .scan_in(i_r1_addr_ff_scanin[7:0]),
  .scan_out(i_r1_addr_ff_scanout[7:0]),
  .l1clk (l1clk_rd_data_e				),
  .and_clk (l1clk_out					),
  .siclk(siclk						),
  .soclk(soclk						),
  .d  ( r1_mux[7:0]					),
  .mq (r1_addr_lat[7:0]					),
  .mq_l(r1_lat_l_unused[7:0]				),
  .q_l(r1_dout_l_unused[7:0]				),
  .q    ( r1_addr_ff[7:0]				));

n2_mam_mp_160x66_cust_msff_ctl_macro__fs_1__width_8	i_w_addr_ff    			(
     .scan_in(i_w_addr_ff_scanin[7:0]),
     .scan_out(i_w_addr_ff_scanout[7:0]),
  .l1clk (l1clk_wr_data_e   				),
  .din  ( w_addr[7:0]      				),
  .dout ( w_addr_ff[7:0] 				),
  .siclk(siclk),
  .soclk(soclk));

n2_mam_mp_160x66_cust_mux_macro__mux_aope__ports_2__width_1 i_r0_enable_mux		   (
  .din0	(rd0_enable  					),
  .din1	(rd0_enable_ff 					),
  .sel0	(rd0_enable_ff_clken				),
  .dout (rd0_enable_ff_mux				));

//msff_ctl_macro	i_rd0_enable_ff		(fs=1,width=1)	(
//     .scan_in(i_rd0_enable_ff_scanin[0:0]),
//     .scan_out(i_rd0_enable_ff_scanout[0:0]),
//  .l1clk (l1clk_rd_data_e				),
//  .din  ( rd0_enable_ff_mux				),
//  .dout ( rd0_enable_ff  				));

n2_mam_mp_160x66_cust_sram_msff_mo_macro__fs_1__width_1	i_rd0_enable_ff		 	(
  .scan_in(i_rd0_enable_ff_scanin[0:0]),
  .scan_out(i_rd0_enable_ff_scanout[0:0]),
  .l1clk (l1clk_rd_data_e				),
  .and_clk (l1clk_out					),
  .siclk(siclk),
  .soclk(soclk),
  .d  ( rd0_enable_ff_mux				),
  .mq(	rd0_enable_lat					),
  .mq_l(rd0_enable_ff_unused				),
  .q_l(rd0_enable_dout_l_unused				),
  .q ( rd0_enable_ff  					));

n2_mam_mp_160x66_cust_mux_macro__mux_aope__ports_2__width_1 i_r1_enable_mux		   (
  .din0	(rd1_enable  					),
  .din1	(rd1_enable_ff 					),
  .sel0	(rd1_enable_ff_clken				),
  .dout (rd1_enable_ff_mux				));

//msff_ctl_macro	i_rd1_enable_ff		(fs=1,width=1)	(
//   .scan_in(i_rd1_enable_ff_scanin[0:0]),
//   .scan_out(i_rd1_enable_ff_scanout[0:0]),
//  .l1clk (l1clk_rd_data_e				),
//  .din  ( rd1_enable_ff_mux				),
//  .dout ( rd1_enable_ff  				));

n2_mam_mp_160x66_cust_sram_msff_mo_macro__fs_1__width_1	i_rd1_enable_ff		 	(
  .scan_in(i_rd1_enable_ff_scanin[0:0]			),
  .scan_out(i_rd1_enable_ff_scanout[0:0]		),
  .l1clk (l1clk_rd_data_e				),
  .and_clk (l1clk_out					),
  .siclk(siclk						),
  .soclk(soclk						),
  .d  ( rd1_enable_ff_mux				),
  .mq(	rd1_enable_lat					),
  .mq_l(rd1_enable_ff_unused				),
  .q_l(rd1_enable_dout_l_unused				),
  .q ( rd1_enable_ff  					));

n2_mam_mp_160x66_cust_msff_ctl_macro__fs_1__width_1	i_wr_enable_ff		 (
     .scan_in(i_wr_enable_ff_scanin[0:0]),
     .scan_out(i_wr_enable_ff_scanout[0:0]),
  .l1clk (l1clk_rd_data_e				),
  .din  ( wr_enable					),
  .dout ( wr_enable_ff					),
  .siclk(siclk),
  .soclk(soclk));

// L2 clock "free-running" clock
n2_mam_mp_160x66_cust_l1clkhdr_ctl_macro l2_clkgen (
        .l2clk  (l2clk          	),
        .l1en   (pce			),
	.pce_ov (tcu_pce_ov		),
	.stop	(1'b0			),
	.se	(tcu_scan_en 		),
        .l1clk  (l1clk_out      	)
);

// 0in custom -fire (rd0_enable_ff & ~tcu_array_wr_inhibit & wr_enable_ff & (w_addr_ff == r0_addr_ff) & ~r0_byp) -message "Attempt to read and write port0 of MAMEM w/o bypass" -group core_array
// 0in custom -fire (rd1_enable_ff & ~tcu_array_wr_inhibit & wr_enable_ff & (w_addr_ff == r1_addr_ff) & ~r1_byp) -message "Attempt to read and write port1 of MAMEM w/o bypass" -group core_array

lib_160x66b_2r_1w_array	mamem_array (
  .clk		( l1clk_out  				),
  .rd0_en	( rd0_enable_lat			),
  .r0_addr	( r0_addr_lat[7:0]			),
  .rd1_en	( rd1_enable_lat			),
  .r1_addr	( r1_addr_lat[7:0]			),
  .w_addr	( w_addr_ff[7:0]			),
  .wr_en	( wr_enable_ff				),
  .tcu_array_wr_inhibit (tcu_array_wr_inhibit		),
  .din		( wr_data_ff[65:0]			),
  .r0_byp       ( r0_byp				),
  .r1_byp       ( r1_byp				),
  .dout0	( rd0_data[65:0]			),
  .dout1	( rd1_data[65:0]			));

supply0 vss;
supply1 vdd;


// scanorder start
//      i_wr_data_ff_scanin[0:65]
//      i_r0_addr_ff_scanin[7:0]
//      i_rd0_enable_ff_scanin[0]
//      i_r1_addr_ff_scanin[7:0]
//      i_rd1_enable_ff_scanin[0]
//      i_w_addr_ff_scanin[7:0]
//      i_wr_enable_ff_scanin[0]
// scanorder end
// fixscan start
assign i_wr_data_ff_scanin[0]=scan_in;
assign i_wr_data_ff_scanin[1]=i_wr_data_ff_scanout[0];
assign i_wr_data_ff_scanin[2]=i_wr_data_ff_scanout[1];
assign i_wr_data_ff_scanin[3]=i_wr_data_ff_scanout[2];
assign i_wr_data_ff_scanin[4]=i_wr_data_ff_scanout[3];
assign i_wr_data_ff_scanin[5]=i_wr_data_ff_scanout[4];
assign i_wr_data_ff_scanin[6]=i_wr_data_ff_scanout[5];
assign i_wr_data_ff_scanin[7]=i_wr_data_ff_scanout[6];
assign i_wr_data_ff_scanin[8]=i_wr_data_ff_scanout[7];
assign i_wr_data_ff_scanin[9]=i_wr_data_ff_scanout[8];
assign i_wr_data_ff_scanin[10]=i_wr_data_ff_scanout[9];
assign i_wr_data_ff_scanin[11]=i_wr_data_ff_scanout[10];
assign i_wr_data_ff_scanin[12]=i_wr_data_ff_scanout[11];
assign i_wr_data_ff_scanin[13]=i_wr_data_ff_scanout[12];
assign i_wr_data_ff_scanin[14]=i_wr_data_ff_scanout[13];
assign i_wr_data_ff_scanin[15]=i_wr_data_ff_scanout[14];
assign i_wr_data_ff_scanin[16]=i_wr_data_ff_scanout[15];
assign i_wr_data_ff_scanin[17]=i_wr_data_ff_scanout[16];
assign i_wr_data_ff_scanin[18]=i_wr_data_ff_scanout[17];
assign i_wr_data_ff_scanin[19]=i_wr_data_ff_scanout[18];
assign i_wr_data_ff_scanin[20]=i_wr_data_ff_scanout[19];
assign i_wr_data_ff_scanin[21]=i_wr_data_ff_scanout[20];
assign i_wr_data_ff_scanin[22]=i_wr_data_ff_scanout[21];
assign i_wr_data_ff_scanin[23]=i_wr_data_ff_scanout[22];
assign i_wr_data_ff_scanin[24]=i_wr_data_ff_scanout[23];
assign i_wr_data_ff_scanin[25]=i_wr_data_ff_scanout[24];
assign i_wr_data_ff_scanin[26]=i_wr_data_ff_scanout[25];
assign i_wr_data_ff_scanin[27]=i_wr_data_ff_scanout[26];
assign i_wr_data_ff_scanin[28]=i_wr_data_ff_scanout[27];
assign i_wr_data_ff_scanin[29]=i_wr_data_ff_scanout[28];
assign i_wr_data_ff_scanin[30]=i_wr_data_ff_scanout[29];
assign i_wr_data_ff_scanin[31]=i_wr_data_ff_scanout[30];
assign i_wr_data_ff_scanin[32]=i_wr_data_ff_scanout[31];
assign i_wr_data_ff_scanin[33]=i_wr_data_ff_scanout[32];
assign i_wr_data_ff_scanin[34]=i_wr_data_ff_scanout[33];
assign i_wr_data_ff_scanin[35]=i_wr_data_ff_scanout[34];
assign i_wr_data_ff_scanin[36]=i_wr_data_ff_scanout[35];
assign i_wr_data_ff_scanin[37]=i_wr_data_ff_scanout[36];
assign i_wr_data_ff_scanin[38]=i_wr_data_ff_scanout[37];
assign i_wr_data_ff_scanin[39]=i_wr_data_ff_scanout[38];
assign i_wr_data_ff_scanin[40]=i_wr_data_ff_scanout[39];
assign i_wr_data_ff_scanin[41]=i_wr_data_ff_scanout[40];
assign i_wr_data_ff_scanin[42]=i_wr_data_ff_scanout[41];
assign i_wr_data_ff_scanin[43]=i_wr_data_ff_scanout[42];
assign i_wr_data_ff_scanin[44]=i_wr_data_ff_scanout[43];
assign i_wr_data_ff_scanin[45]=i_wr_data_ff_scanout[44];
assign i_wr_data_ff_scanin[46]=i_wr_data_ff_scanout[45];
assign i_wr_data_ff_scanin[47]=i_wr_data_ff_scanout[46];
assign i_wr_data_ff_scanin[48]=i_wr_data_ff_scanout[47];
assign i_wr_data_ff_scanin[49]=i_wr_data_ff_scanout[48];
assign i_wr_data_ff_scanin[50]=i_wr_data_ff_scanout[49];
assign i_wr_data_ff_scanin[51]=i_wr_data_ff_scanout[50];
assign i_wr_data_ff_scanin[52]=i_wr_data_ff_scanout[51];
assign i_wr_data_ff_scanin[53]=i_wr_data_ff_scanout[52];
assign i_wr_data_ff_scanin[54]=i_wr_data_ff_scanout[53];
assign i_wr_data_ff_scanin[55]=i_wr_data_ff_scanout[54];
assign i_wr_data_ff_scanin[56]=i_wr_data_ff_scanout[55];
assign i_wr_data_ff_scanin[57]=i_wr_data_ff_scanout[56];
assign i_wr_data_ff_scanin[58]=i_wr_data_ff_scanout[57];
assign i_wr_data_ff_scanin[59]=i_wr_data_ff_scanout[58];
assign i_wr_data_ff_scanin[60]=i_wr_data_ff_scanout[59];
assign i_wr_data_ff_scanin[61]=i_wr_data_ff_scanout[60];
assign i_wr_data_ff_scanin[62]=i_wr_data_ff_scanout[61];
assign i_wr_data_ff_scanin[63]=i_wr_data_ff_scanout[62];
assign i_wr_data_ff_scanin[64]=i_wr_data_ff_scanout[63];
assign i_wr_data_ff_scanin[65]=i_wr_data_ff_scanout[64];
assign i_r0_addr_ff_scanin[7]=i_wr_data_ff_scanout[65];
assign i_r0_addr_ff_scanin[6]=i_r0_addr_ff_scanout[7];
assign i_r0_addr_ff_scanin[5]=i_r0_addr_ff_scanout[6];
assign i_r0_addr_ff_scanin[4]=i_r0_addr_ff_scanout[5];
assign i_r0_addr_ff_scanin[3]=i_r0_addr_ff_scanout[4];
assign i_r0_addr_ff_scanin[2]=i_r0_addr_ff_scanout[3];
assign i_r0_addr_ff_scanin[1]=i_r0_addr_ff_scanout[2];
assign i_r0_addr_ff_scanin[0]=i_r0_addr_ff_scanout[1];
assign i_rd0_enable_ff_scanin[0]=i_r0_addr_ff_scanout[0];
assign i_r1_addr_ff_scanin[7]=i_rd0_enable_ff_scanout[0];
assign i_r1_addr_ff_scanin[6]=i_r1_addr_ff_scanout[7];
assign i_r1_addr_ff_scanin[5]=i_r1_addr_ff_scanout[6];
assign i_r1_addr_ff_scanin[4]=i_r1_addr_ff_scanout[5];
assign i_r1_addr_ff_scanin[3]=i_r1_addr_ff_scanout[4];
assign i_r1_addr_ff_scanin[2]=i_r1_addr_ff_scanout[3];
assign i_r1_addr_ff_scanin[1]=i_r1_addr_ff_scanout[2];
assign i_r1_addr_ff_scanin[0]=i_r1_addr_ff_scanout[1];
assign i_rd1_enable_ff_scanin[0]=i_r1_addr_ff_scanout[0];
assign i_w_addr_ff_scanin[7]=i_rd1_enable_ff_scanout[0];
assign i_w_addr_ff_scanin[6]=i_w_addr_ff_scanout[7];
assign i_w_addr_ff_scanin[5]=i_w_addr_ff_scanout[6];
assign i_w_addr_ff_scanin[4]=i_w_addr_ff_scanout[5];
assign i_w_addr_ff_scanin[3]=i_w_addr_ff_scanout[4];
assign i_w_addr_ff_scanin[2]=i_w_addr_ff_scanout[3];
assign i_w_addr_ff_scanin[1]=i_w_addr_ff_scanout[2];
assign i_w_addr_ff_scanin[0]=i_w_addr_ff_scanout[1];
assign i_wr_enable_ff_scanin[0]=i_w_addr_ff_scanout[0];
assign scan_out=i_wr_enable_ff_scanout[0];
// fixscan end
endmodule







// any PARAMS parms go into naming of macro

module n2_mam_mp_160x66_cust_l1clkhdr_ctl_macro (
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













// any PARAMS parms go into naming of macro

module n2_mam_mp_160x66_cust_msff_ctl_macro__fs_1__scanreverse_1__width_66 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [65:0] fdin;

  input [65:0] din;
  input l1clk;
  input [65:0] scan_in;


  input siclk;
  input soclk;

  output [65:0] dout;
  output [65:0] scan_out;
assign fdin[65:0] = din[65:0];






dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[65:0]),
.si(scan_in[65:0]),
.so(scan_out[65:0]),
.q(dout[65:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_mam_mp_160x66_cust_mux_macro__mux_aope__ports_2__width_8 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [7:0] din0;
  input [7:0] din1;
  input sel0;
  output [7:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(8)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule


//
//   macro for cl_mc1_sram_msff_mo_{16,8,4}x flops
//
//





module n2_mam_mp_160x66_cust_sram_msff_mo_macro__fs_1__width_8 (
  d, 
  scan_in, 
  l1clk, 
  and_clk, 
  siclk, 
  soclk, 
  mq, 
  mq_l, 
  scan_out, 
  q, 
  q_l);
input [7:0] d;
  input [7:0] scan_in;
input l1clk;
input and_clk;
input siclk;
input soclk;
output [7:0] mq;
output [7:0] mq_l;
  output [7:0] scan_out;
output [7:0] q;
output [7:0] q_l;






new_dlata #(8)  d0_0 (
.d(d[7:0]),
.si(scan_in[7:0]),
.so(scan_out[7:0]),
.l1clk(l1clk),
.and_clk(and_clk),
.siclk(siclk),
.soclk(soclk),
.q(q[7:0]),
.q_l(q_l[7:0]),
.mq(mq[7:0]),
.mq_l(mq_l[7:0])
);










//place::generic_place($width,$stack,$left);

endmodule









// any PARAMS parms go into naming of macro

module n2_mam_mp_160x66_cust_msff_ctl_macro__fs_1__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;

  input [7:0] din;
  input l1clk;
  input [7:0] scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output [7:0] scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si(scan_in[7:0]),
.so(scan_out[7:0]),
.q(dout[7:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_mam_mp_160x66_cust_mux_macro__mux_aope__ports_2__width_1 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [0:0] din0;
  input [0:0] din1;
  input sel0;
  output [0:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(1)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule


//
//   macro for cl_mc1_sram_msff_mo_{16,8,4}x flops
//
//





module n2_mam_mp_160x66_cust_sram_msff_mo_macro__fs_1__width_1 (
  d, 
  scan_in, 
  l1clk, 
  and_clk, 
  siclk, 
  soclk, 
  mq, 
  mq_l, 
  scan_out, 
  q, 
  q_l);
input [0:0] d;
  input [0:0] scan_in;
input l1clk;
input and_clk;
input siclk;
input soclk;
output [0:0] mq;
output [0:0] mq_l;
  output [0:0] scan_out;
output [0:0] q;
output [0:0] q_l;






new_dlata #(1)  d0_0 (
.d(d[0:0]),
.si(scan_in[0:0]),
.so(scan_out[0:0]),
.l1clk(l1clk),
.and_clk(and_clk),
.siclk(siclk),
.soclk(soclk),
.q(q[0:0]),
.q_l(q_l[0:0]),
.mq(mq[0:0]),
.mq_l(mq_l[0:0])
);










//place::generic_place($width,$stack,$left);

endmodule









// any PARAMS parms go into naming of macro

module n2_mam_mp_160x66_cust_msff_ctl_macro__fs_1__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input [0:0] scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output [0:0] scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in[0:0]),
.so(scan_out[0:0]),
.q(dout[0:0])
);












endmodule









////////////////////////////////////////////////////////////////////////////////
// $Id: n2_mam_mp_160x66_cust.v,v 1.1.1.1 2007/02/13 22:19:31 drp Exp $
//
//  Copyright (C) 2003 by Sun Microsystems, Inc.
//
//  All rights reserved. No part of this design may be reproduced,
//  stored in a retrieval system, or transmitted, in any form or by
//  any means, electronic, mechanical, photocopying, recording, or
//  otherwise, without prior written permission of Sun Microsystems,
//  Inc.
//
//  Sun Proprietary/Confidential
//
//  Description:        160 x 66 dual-port array
//			Bypass write data to read port on read/write collision
//		
//			To produce a debussy dump of memory contents, 
//			add -vcs_run_args=+DUMPMEM_160x66 to sims command line
//
//  Primary Contact:    Mark Luttrell
////////////////////////////////////////////////////////////////////////////////

module lib_160x66b_2r_1w_array (
  clk, 
  rd0_en, 
  rd1_en, 
  wr_en, 
  tcu_array_wr_inhibit, 
  r0_addr, 
  r1_addr, 
  w_addr, 
  din, 
  r0_byp, 
  r1_byp, 
  dout0, 
  dout1);	

`define	WIDTH 66
`define ENTRIES 160
`define ADDRBITS 8

input			clk;
input	     		rd0_en;
input	     		rd1_en;
input	     		wr_en;
input			tcu_array_wr_inhibit;
input	[`ADDRBITS-1:0]	r0_addr;
input	[`ADDRBITS-1:0]	r1_addr;
input	[`ADDRBITS-1:0]	w_addr;

input	[`WIDTH-1:0]	din;
input			r0_byp;
input			r1_byp;
output	[`WIDTH-1:0]	dout0;
output	[`WIDTH-1:0]	dout1;








reg	[`WIDTH-1:0]	mem[`ENTRIES-1:0];
reg	[`WIDTH-1:0]	local_dout0;
reg	[`WIDTH-1:0]	local_dout1;
reg	[`WIDTH-1:0]	dout0;
reg	[`WIDTH-1:0]	dout1;

// Emulate reset
`ifndef NOINITMEM
integer i;
initial begin
  for (i=0; i<`ENTRIES; i=i+1) begin
    mem[i] = {`WIDTH{1'b0}}; 
  end
  local_dout0 = {`WIDTH{1'b0}};
  local_dout1 = {`WIDTH{1'b0}};
end
`endif

//////////////////////
// Read/write array
//////////////////////
always @ (clk or rd0_en or wr_en or tcu_array_wr_inhibit or w_addr or r0_addr) begin
  if (clk) begin
    if (rd0_en & ~tcu_array_wr_inhibit) begin
      if (r0_addr <= 8'b10011111) begin // 159
        if (wr_en & (w_addr == r0_addr)) 
          local_dout0[`WIDTH-1:0] = {`WIDTH {1'bx}};
        else
          local_dout0[`WIDTH-1:0] = mem[r0_addr];
      end
      else
        local_dout0[`WIDTH-1:0] = {`WIDTH {1'b0}};	// return 0's for out-of-bounds read address
    end
    else local_dout0[`WIDTH-1:0] = {`WIDTH {1'b0}};	// precharge
  end	// clk
end

always @ (clk or rd1_en or wr_en or tcu_array_wr_inhibit or w_addr or r1_addr) begin
  if (clk) begin
    if (rd1_en & ~tcu_array_wr_inhibit) begin
      if (r1_addr <= 8'b10011111) begin // 159
        if (wr_en & (w_addr == r1_addr)) 
          local_dout1[`WIDTH-1:0] = {`WIDTH {1'bx}};
        else
        local_dout1[`WIDTH-1:0] = mem[r1_addr];
      end
      else
        local_dout1[`WIDTH-1:0] = {`WIDTH {1'b0}};	// return 0's for out-of-bounds read address
    end
    else local_dout1[`WIDTH-1:0] = {`WIDTH {1'b0}};	// precharge
  end	// clk
end

always @ (negedge clk) begin
    if (wr_en & ~tcu_array_wr_inhibit) begin
      if (w_addr <= 8'b10011111) // make sure write address is valid
        mem[w_addr] <= din;




    end

end


always @(r0_byp or local_dout0 or din) begin
  if (r0_byp) dout0[`WIDTH-1:0] <= din[`WIDTH-1:0];
  else        dout0[`WIDTH-1:0] <= local_dout0[`WIDTH-1:0];
end

always @(r1_byp or local_dout1 or din) begin
  if (r1_byp) dout1[`WIDTH-1:0] <= din[`WIDTH-1:0];
  else        dout1[`WIDTH-1:0] <= local_dout1[`WIDTH-1:0];
end

supply0 vss;
supply1 vdd;



endmodule

