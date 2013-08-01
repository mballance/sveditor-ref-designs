// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_niu_sp_4096x9s_cust.v
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
module n2_niu_sp_4096x9s_cust (
  reset, 
  tcu_aclk, 
  tcu_bclk, 
  pce, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_array_wr_inhibit, 
  scan_in, 
  scan_out, 
  hdr_sram_rvalue, 
  hdr_sram_rid, 
  hdr_sram_wr_en, 
  hdr_sram_red_clr, 
  sram_hdr_read_data, 
  rw_adr, 
  wr_en, 
  rd_en, 
  din, 
  dout, 
  l2clk);
wire repair_scanout;
    
       
input                   reset;
input                   tcu_aclk;
input                   tcu_bclk;
input                   pce;
input                   tcu_pce_ov;
input                   tcu_scan_en;
input                   tcu_se_scancollar_in;
input                   tcu_se_scancollar_out;
input                   tcu_array_wr_inhibit;
input                   scan_in;
output                  scan_out;

input             [5:0] hdr_sram_rvalue;
input                   hdr_sram_rid;
input                   hdr_sram_wr_en;
input                   hdr_sram_red_clr;
output            [5:0] sram_hdr_read_data;

input            [11:0] rw_adr;
input                   wr_en;
input                   rd_en;
input             [8:0] din;
output            [8:0] dout;
input                   l2clk;

// 0in set_clock l2clk
// 0in bits_on -var {rd_en,wr_en} -max 1 -message "niu_sp_4096x9: Attempt to read AND write on same cycle" -group mbist_mode
 
wire    [5:0]   hdr_sram_rvalue;
wire    [5:0]   sram_hdr_read_data;
wire    [11:0]  rw_adr;
wire    [8:0]   din;
wire    [8:0]   dout;
wire    [1:0]   repair_en_bk;
wire    [4:0]   red_value_b0, red_value_b1;

n2_niu_sp_4096x9s_bank niu_sp_4096x9s_bank (
                                .reset                  (reset),
                                .tcu_aclk               (tcu_aclk),
                                .tcu_bclk               (tcu_bclk),
                                .pce                    (pce),
                                .tcu_pce_ov             (tcu_pce_ov),
                                .tcu_scan_en            (tcu_scan_en),
                                .tcu_se_scancollar_in   (tcu_se_scancollar_in),
                                .tcu_array_wr_inhibit   (tcu_array_wr_inhibit),
                                .l2clk                  (l2clk),
                                .wr_en                  (wr_en),
                                .rw_adr                 (rw_adr),
                                .rd_en                  (rd_en),
                                .din                    (din),
                                .scan_in                (repair_scanout),
                                .scan_out               (scan_out),
                                .red_value_b0           (red_value_b0),
                                .red_value_b1           (red_value_b1),
                                .repair_en_bk           (repair_en_bk),
                                .dout                   (dout));

n2_niu_sp_4096x9s_repair repair (
                                .tcu_aclk               (tcu_aclk),
                                .tcu_bclk               (tcu_bclk),
                                .pce                    (pce),
                                .tcu_pce_ov             (tcu_pce_ov),
                                .tcu_scan_en            (tcu_scan_en),
                                .tcu_se_scancollar_in   (tcu_se_scancollar_in),
                                .tcu_se_scancollar_out  (tcu_se_scancollar_out),
                                .tcu_array_wr_inhibit   (tcu_array_wr_inhibit),
                                .scan_in                (scan_in),
                                .hdr_sram_rvalue        (hdr_sram_rvalue),
                                .hdr_sram_rid           (hdr_sram_rid),
                                .hdr_sram_wr_en         (hdr_sram_wr_en),
                                .hdr_sram_red_clr       (hdr_sram_red_clr),
                                .l2clk                  (l2clk),
                                .sram_hdr_read_data     (sram_hdr_read_data),
                                .red_value_b0           (red_value_b0),
                                .red_value_b1           (red_value_b1),
                                .repair_en_bk           (repair_en_bk),
                                .scan_out               (repair_scanout));

endmodule

 



module n2_niu_sp_4096x9s_bank (
  reset, 
  din, 
  rw_adr, 
  rd_en, 
  wr_en, 
  tcu_aclk, 
  tcu_bclk, 
  pce, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_se_scancollar_in, 
  tcu_array_wr_inhibit, 
  l2clk, 
  scan_in, 
  red_value_b0, 
  red_value_b1, 
  repair_en_bk, 
  dout, 
  scan_out);
wire l1clk_in_en;
wire l1clk_in;
wire l1clk_andclk_in_en;
wire andclk;
wire dff_rd_en_m_scanin;
wire dff_rd_en_m_scanout;
wire rd_en_m_noinhi;
wire dff_wr_en_m_scanin;
wire dff_wr_en_m_scanout;
wire wr_en_m_noinhi;
wire [3:0] spare_f;
wire [3:0] spare_scanin;
wire [3:0] spare_scanout;
 


input                   reset;
input             [8:0] din;
input            [11:0] rw_adr;
input                   rd_en;
input                   wr_en;
input                   tcu_aclk;
input                   tcu_bclk;
input                   pce;
input                   tcu_pce_ov;
input                   tcu_scan_en;
input                   tcu_se_scancollar_in;
input                   tcu_array_wr_inhibit;
input                   l2clk;
input                   scan_in;

input             [4:0] red_value_b0;      // to subbank
input             [4:0] red_value_b1;
input             [1:0] repair_en_bk;

output            [8:0] dout;
output                  scan_out;

wire              [8:0] din;
wire             [11:0] rw_adr;
wire              [4:0] red_value_b0;      // to subbank
wire              [4:0] red_value_b1;
wire              [1:0] repair_en_bk;
wire              [8:0] dout;

wire             [11:0] rw_adr_f;
wire             [11:0] dff_rw_adr_f_scanin;
wire             [11:0] dff_rw_adr_f_scanout;
wire              [8:0] din_f;
wire              [8:0] din_scanin;
wire              [8:0] din_scanout;
wire              [8:0] dout_up, dout_dn;
wire 			siclk;
wire			soclk;

assign siclk=tcu_aclk;
assign soclk=tcu_bclk;

//cl_sc1_l1hdr_8x l1ch_in (
//                                .l2clk  (l2clk),
//                                .pce    (pce),
//                                .l1clk  (l1clk_in),
//                                .se     (tcu_se_scancollar_in),
//                                .pce_ov (tcu_pce_ov),
//                                .stop   (1'b0) );

//cl_sc1_l1hdr_8x andclk_in (	.l2clk	(l2clk),
//				.pce	(pce),
//				.l1clk	(andclk),
//				.se	(tcu_scan_en),
//				.pce_ov	(tcu_pce_ov),
//				.stop	(1'b0) );

///////////////////////////////////
// decomposed l1hdr for l1clk_in
///////////////////////////////////

cl_mc1_l1enable_12x l1ch_in_l1en (
                                .l2clk          (l2clk),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1en           (l1clk_in_en)
                        );

cl_mc1_l1driver_12x l1ch_in_l1drvr (
                                .se             (tcu_se_scancollar_in),
                                .l1en           (l1clk_in_en),
                                .l1clk          (l1clk_in),
  .l2clk(l2clk)
                        );

///////////////////////////////////
// decomposed l1hdr for andclk_in
///////////////////////////////////

cl_mc1_l1enable_12x andclk_in_l1en (
                                .l2clk          (l2clk),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1en           (l1clk_andclk_in_en)
                        );

cl_mc1_l1driver_12x andclk_in_l1drvr (
                                .se             (tcu_scan_en),
                                .l1en           (l1clk_andclk_in_en),
                                .l1clk          (andclk),
  .l2clk(l2clk)
                        );


wire   reset_l = ~reset;

cl_sc1_msff_syrst_4x rw_adr_m00 (.d(rw_adr[0 ]),.si(dff_rw_adr_f_scanin[0 ]),.q(rw_adr_f[0 ]),.so(dff_rw_adr_f_scanout[0]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m01 (.d(rw_adr[1 ]),.si(dff_rw_adr_f_scanin[1 ]),.q(rw_adr_f[1 ]),.so(dff_rw_adr_f_scanout[1]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m02 (.d(rw_adr[2 ]),.si(dff_rw_adr_f_scanin[2 ]),.q(rw_adr_f[2 ]),.so(dff_rw_adr_f_scanout[2]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m03 (.d(rw_adr[3 ]),.si(dff_rw_adr_f_scanin[3 ]),.q(rw_adr_f[3 ]),.so(dff_rw_adr_f_scanout[3]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m04 (.d(rw_adr[4 ]),.si(dff_rw_adr_f_scanin[4 ]),.q(rw_adr_f[4 ]),.so(dff_rw_adr_f_scanout[4]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m05 (.d(rw_adr[5 ]),.si(dff_rw_adr_f_scanin[5 ]),.q(rw_adr_f[5 ]),.so(dff_rw_adr_f_scanout[5]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m06 (.d(rw_adr[6 ]),.si(dff_rw_adr_f_scanin[6 ]),.q(rw_adr_f[6 ]),.so(dff_rw_adr_f_scanout[6]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m07 (.d(rw_adr[7 ]),.si(dff_rw_adr_f_scanin[7 ]),.q(rw_adr_f[7 ]),.so(dff_rw_adr_f_scanout[7]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m08 (.d(rw_adr[8 ]),.si(dff_rw_adr_f_scanin[8 ]),.q(rw_adr_f[8 ]),.so(dff_rw_adr_f_scanout[8]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m09 (.d(rw_adr[9 ]),.si(dff_rw_adr_f_scanin[9 ]),.q(rw_adr_f[9 ]),.so(dff_rw_adr_f_scanout[9]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m10 (.d(rw_adr[10]),.si(dff_rw_adr_f_scanin[10]),.q(rw_adr_f[10]),.so(dff_rw_adr_f_scanout[10]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x rw_adr_m11 (.d(rw_adr[11]),.si(dff_rw_adr_f_scanin[11]),.q(rw_adr_f[11]),.so(dff_rw_adr_f_scanout[11]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));

cl_mc1_sram_msff_mo_8x rd_en_m0 (.d(rd_en & reset_l),.si(dff_rd_en_m_scanin),.q(),.so(dff_rd_en_m_scanout),.and_clk(andclk),.q_l(),.mq(rd_en_m_noinhi),.mq_l(),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk) ); 
cl_mc1_sram_msff_mo_8x wr_en_m0 (.d(wr_en & reset_l),.si(dff_wr_en_m_scanin),.q(),.so(dff_wr_en_m_scanout),.and_clk(andclk),.q_l(),.mq(wr_en_m_noinhi),.mq_l(),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk) );

//cl_sc1_msff_syrst_4x rd_en_m0 (.d(rd_en),.si(dff_rd_en_m_scanin),.q(rd_en_m_noinhi),.so(dff_rd_en_m_scanout),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
//cl_sc1_msff_syrst_4x wr_en_m0 (.d(wr_en),.si(dff_wr_en_m_scanin),.q(wr_en_m_noinhi),.so(dff_wr_en_m_scanout),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));

cl_sc1_msff_syrst_4x spare_0 (.d(spare_f[0] ),.si(spare_scanin[0]),.q(spare_f[0]),.so(spare_scanout[0]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x spare_1 (.d(spare_f[1] ),.si(spare_scanin[1]),.q(spare_f[1]),.so(spare_scanout[1]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x spare_2 (.d(spare_f[2] ),.si(spare_scanin[2]),.q(spare_f[2]),.so(spare_scanout[2]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x spare_3 (.d(spare_f[3] ),.si(spare_scanin[3]),.q(spare_f[3]),.so(spare_scanout[3]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));

cl_sc1_msff_syrst_4x din_0 (.d(din[0]),.si(din_scanin[0]),.q(din_f[0]),.so(din_scanout[0]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x din_1 (.d(din[1]),.si(din_scanin[1]),.q(din_f[1]),.so(din_scanout[1]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x din_2 (.d(din[2]),.si(din_scanin[2]),.q(din_f[2]),.so(din_scanout[2]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x din_3 (.d(din[3]),.si(din_scanin[3]),.q(din_f[3]),.so(din_scanout[3]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x din_4 (.d(din[4]),.si(din_scanin[4]),.q(din_f[4]),.so(din_scanout[4]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x din_5 (.d(din[5]),.si(din_scanin[5]),.q(din_f[5]),.so(din_scanout[5]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x din_6 (.d(din[6]),.si(din_scanin[6]),.q(din_f[6]),.so(din_scanout[6]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x din_7 (.d(din[7]),.si(din_scanin[7]),.q(din_f[7]),.so(din_scanout[7]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));
cl_sc1_msff_syrst_4x din_8 (.d(din[8]),.si(din_scanin[8]),.q(din_f[8]),.so(din_scanout[8]),.reset(reset_l),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk));


wire rd_en_m = rd_en_m_noinhi && ~tcu_array_wr_inhibit;
wire wr_en_m = wr_en_m_noinhi && ~tcu_array_wr_inhibit;

wire wr_en_m_0 = wr_en_m && ~rw_adr_f[11];
wire wr_en_m_1 = wr_en_m && rw_adr_f[11];
                                         
n2_niu_sp_4096x9s_array   array_dn (     
				.l1clk          (l2clk),
                                .dout           (dout_dn),
                                .din            (din_f),
                                .addr           (rw_adr_f[10:0]),
                                .rd_en          (rd_en_m && ~rw_adr_f[11]),
                                .wr_en          (wr_en_m_0),
                                .red_value_b    (red_value_b1),
				.repair_en_bk 	(repair_en_bk[1]) );

n2_niu_sp_4096x9s_array   array_up (
                                .l1clk          (l2clk),
                                .dout           (dout_up),
                                .din            (din_f),
                                .addr           (rw_adr_f[10:0]),
                                .rd_en          (rd_en_m && rw_adr_f[11]),
                                .wr_en          (wr_en_m_1),
                                .red_value_b    (red_value_b0),
                                .repair_en_bk   (repair_en_bk[0]) );

// Final mux stage

        assign dout[0] = rw_adr_f[11] && dout_up[0] || ~rw_adr_f[11] && dout_dn[0];
        assign dout[1] = rw_adr_f[11] && dout_up[1] || ~rw_adr_f[11] && dout_dn[1];
        assign dout[2] = rw_adr_f[11] && dout_up[2] || ~rw_adr_f[11] && dout_dn[2];
        assign dout[3] = rw_adr_f[11] && dout_up[3] || ~rw_adr_f[11] && dout_dn[3];
        assign dout[4] = rw_adr_f[11] && dout_up[4] || ~rw_adr_f[11] && dout_dn[4];
        assign dout[5] = rw_adr_f[11] && dout_up[5] || ~rw_adr_f[11] && dout_dn[5];
        assign dout[6] = rw_adr_f[11] && dout_up[6] || ~rw_adr_f[11] && dout_dn[6];
        assign dout[7] = rw_adr_f[11] && dout_up[7] || ~rw_adr_f[11] && dout_dn[7];
        assign dout[8] = rw_adr_f[11] && dout_up[8] || ~rw_adr_f[11] && dout_dn[8];

// scanfix start

assign din_scanin[8]=           scan_in;
assign din_scanin[7]=           din_scanout[8] ;
assign din_scanin[6]=           din_scanout[7] ;
assign din_scanin[5]=           din_scanout[6] ;
assign din_scanin[4]=           din_scanout[5] ;
assign din_scanin[3]=           din_scanout[4] ;
assign din_scanin[2]=           din_scanout[3] ;
assign din_scanin[1]=           din_scanout[2] ;
assign din_scanin[0]=           din_scanout[1] ;
assign dff_rw_adr_f_scanin[11]= din_scanout[0];
assign dff_rw_adr_f_scanin[10]= dff_rw_adr_f_scanout[11];
assign dff_rw_adr_f_scanin[9 ]= dff_rw_adr_f_scanout[10];
assign dff_rw_adr_f_scanin[8 ]= dff_rw_adr_f_scanout[9 ];
assign dff_rw_adr_f_scanin[7 ]= dff_rw_adr_f_scanout[8 ];
assign dff_rw_adr_f_scanin[6 ]= dff_rw_adr_f_scanout[7 ];
assign dff_rw_adr_f_scanin[5 ]= dff_rw_adr_f_scanout[6 ];
assign dff_rw_adr_f_scanin[4 ]= dff_rw_adr_f_scanout[5 ];
assign dff_rw_adr_f_scanin[3 ]= dff_rw_adr_f_scanout[4 ];
assign dff_rw_adr_f_scanin[2 ]= dff_rw_adr_f_scanout[3 ];
assign dff_rw_adr_f_scanin[1 ]= dff_rw_adr_f_scanout[2 ];
assign dff_rw_adr_f_scanin[0 ]= dff_rw_adr_f_scanout[1 ];
assign dff_rd_en_m_scanin=      dff_rw_adr_f_scanout[0 ];
assign dff_wr_en_m_scanin=	dff_rd_en_m_scanout;
assign spare_scanin[0] =	dff_wr_en_m_scanout;
assign spare_scanin[1] =        spare_scanout[0];
assign spare_scanin[2] =        spare_scanout[1];
assign spare_scanin[3] =        spare_scanout[2];
assign scan_out=		spare_scanout[3];

// scanfix end

endmodule



module n2_niu_sp_4096x9s_array (
  l1clk, 
  din, 
  dout, 
  addr, 
  rd_en, 
  wr_en, 
  red_value_b, 
  repair_en_bk); 


input 		l1clk;
input	[8:0]	din;
output	[8:0]	dout;
input	[10:0]	addr;
input		rd_en;
input		wr_en;
input	[4:0]	red_value_b;
input		repair_en_bk;

wire    [18:0]  dout_arr;
wire    [18:0]  dout_repwrdmux;
wire    [18:0]  wr_en_bit;
wire    [17:0]  doutrdmux;
wire    [17:0]  repair_out_chain;

n2_niu_sp_4096x9s_128x152_mem array_2k   (   l1clk,
                                             dout_repwrdmux,
                                             dout_arr,
                                             addr[9:0],
                                             {18{rd_en}},
                                             wr_en_bit);

repwrmux wrmux  (       din,
                        dout_repwrdmux,
                        repair_out_chain[17:0]);

repwrselmux wrselmux (  .wr_en          (wr_en),
                        .wrseldout      (wr_en_bit),
                        .addr10         (addr[10]),
                        .repsel         (repair_out_chain[17:0]) );

reprdmux rdselmux (     dout_arr,
                        doutrdmux,
                        repair_out_chain[17:0]);

repdec_5_32 rep_dec (   red_value_b,
                        repair_en_bk,
                        repair_out_chain);

assign  dout[0] = addr[10] && doutrdmux[1 ] || ~addr[10] && doutrdmux[0 ];
assign  dout[1] = addr[10] && doutrdmux[3 ] || ~addr[10] && doutrdmux[2 ];
assign  dout[2] = addr[10] && doutrdmux[5 ] || ~addr[10] && doutrdmux[4 ];
assign  dout[3] = addr[10] && doutrdmux[7 ] || ~addr[10] && doutrdmux[6 ];
assign  dout[4] = addr[10] && doutrdmux[9 ] || ~addr[10] && doutrdmux[8 ];
assign  dout[5] = addr[10] && doutrdmux[11] || ~addr[10] && doutrdmux[10];
assign  dout[6] = addr[10] && doutrdmux[13] || ~addr[10] && doutrdmux[12];
assign  dout[7] = addr[10] && doutrdmux[15] || ~addr[10] && doutrdmux[14];
assign  dout[8] = addr[10] && doutrdmux[17] || ~addr[10] && doutrdmux[16];

endmodule




module n2_niu_sp_4096x9s_128x152_mem (
        l1clk,
        din,
        dout,
        addr,
        rd_en,
        wr_en
);
        input           l1clk;
        input   [18:0]  din;
        output  [18:0]  dout;
        input   [9:0]   addr;
        input   [17:0]  rd_en;
        input   [18:0]  wr_en;

n2_niu_sp_4096x9s_128x8_halfbit b0      (l1clk,din[0 ],dout[0 ],addr,rd_en[0 ],wr_en[0 ]);
n2_niu_sp_4096x9s_128x8_halfbit b1      (l1clk,din[1 ],dout[1 ],addr,rd_en[1 ],wr_en[1 ]);
n2_niu_sp_4096x9s_128x8_halfbit b2      (l1clk,din[2 ],dout[2 ],addr,rd_en[2 ],wr_en[2 ]);
n2_niu_sp_4096x9s_128x8_halfbit b3      (l1clk,din[3 ],dout[3 ],addr,rd_en[3 ],wr_en[3 ]);
n2_niu_sp_4096x9s_128x8_halfbit b4      (l1clk,din[4 ],dout[4 ],addr,rd_en[4 ],wr_en[4 ]);
n2_niu_sp_4096x9s_128x8_halfbit b5      (l1clk,din[5 ],dout[5 ],addr,rd_en[5 ],wr_en[5 ]);
n2_niu_sp_4096x9s_128x8_halfbit b6      (l1clk,din[6 ],dout[6 ],addr,rd_en[6 ],wr_en[6 ]);
n2_niu_sp_4096x9s_128x8_halfbit b7      (l1clk,din[7 ],dout[7 ],addr,rd_en[7 ],wr_en[7 ]);
n2_niu_sp_4096x9s_128x8_halfbit b8      (l1clk,din[8 ],dout[8 ],addr,rd_en[8 ],wr_en[8 ]);
n2_niu_sp_4096x9s_128x8_halfbit b9      (l1clk,din[9 ],dout[9 ],addr,rd_en[9 ],wr_en[9 ]);
n2_niu_sp_4096x9s_128x8_halfbit b10     (l1clk,din[10],dout[10],addr,rd_en[10],wr_en[10]);
n2_niu_sp_4096x9s_128x8_halfbit b11     (l1clk,din[11],dout[11],addr,rd_en[11],wr_en[11]);
n2_niu_sp_4096x9s_128x8_halfbit b12     (l1clk,din[12],dout[12],addr,rd_en[12],wr_en[12]);
n2_niu_sp_4096x9s_128x8_halfbit b13     (l1clk,din[13],dout[13],addr,rd_en[13],wr_en[13]);
n2_niu_sp_4096x9s_128x8_halfbit b14     (l1clk,din[14],dout[14],addr,rd_en[14],wr_en[14]);
n2_niu_sp_4096x9s_128x8_halfbit b15     (l1clk,din[15],dout[15],addr,rd_en[15],wr_en[15]);
n2_niu_sp_4096x9s_128x8_halfbit b16     (l1clk,din[16],dout[16],addr,rd_en[16],wr_en[16]);
n2_niu_sp_4096x9s_128x8_halfbit b17     (l1clk,din[17],dout[17],addr,rd_en[17],wr_en[17]);
n2_niu_sp_4096x9s_128x8_halfbit rep     (l1clk,din[18],dout[18],addr,rd_en[17],wr_en[18]);

endmodule



module n2_niu_sp_4096x9s_128x8_halfbit (
	l1clk,
	din,
	dout,
	addr,
	rd_en,
	wr_en);

input		l1clk;
input		din;
output		dout;
input	[9:0]	addr;
input		rd_en;
input		wr_en;

reg		dout;
reg		dout1;
reg	[7:0]	din_mem;
reg 	[7:0]	rd_en_col;
reg 	[7:0]	wr_en_col;
wire		din;
wire	[7:0]	dout_mem;

n2_niu_sp_4096x9s_128x8_memory	mem (	.l1clk	(l1clk),
					.din	(din_mem),
					.dout	(dout_mem),
					.rw_addr(addr[6:0]),
					.rd_en	(rd_en_col),
					.wr_en	(wr_en_col));
always @ (addr[9:7] or rd_en)
        begin
           if(!rd_en)
                         rd_en_col=8'b00000000;
           else if(rd_en)
                case(addr[9:7])
                   3'h0: rd_en_col=8'b00000001;
                   3'h1: rd_en_col=8'b00000010;
                   3'h2: rd_en_col=8'b00000100;
                   3'h3: rd_en_col=8'b00001000;
                   3'h4: rd_en_col=8'b00010000;
                   3'h5: rd_en_col=8'b00100000;
                   3'h6: rd_en_col=8'b01000000;
                   3'h7: rd_en_col=8'b10000000;
                endcase

        end

always @ (addr[9:7] or wr_en)
        begin
           if(!wr_en)
                         wr_en_col=8'b00000000;
           else if(wr_en)
                case(addr[9:7])
                   3'h0: wr_en_col=8'b00000001;
                   3'h1: wr_en_col=8'b00000010;
                   3'h2: wr_en_col=8'b00000100;
                   3'h3: wr_en_col=8'b00001000;
                   3'h4: wr_en_col=8'b00010000;
                   3'h5: wr_en_col=8'b00100000;
                   3'h6: wr_en_col=8'b01000000;
                   3'h7: wr_en_col=8'b10000000;
                endcase

        end


always @ (addr or dout_mem)
	begin
		case (addr[9:7]) 
		    3'h0: dout1=dout_mem[0];
		    3'h1: dout1=dout_mem[1];
		    3'h2: dout1=dout_mem[2];
		    3'h3: dout1=dout_mem[3];
		    3'h4: dout1=dout_mem[4];
		    3'h5: dout1=dout_mem[5];
		    3'h6: dout1=dout_mem[6];
		    3'h7: dout1=dout_mem[7];
		endcase
	end

always @ (addr or din)
        begin
                case (addr[9:7]) 
                    3'h0: din_mem=8'b00000001 & {8{din}};
                    3'h1: din_mem=8'b00000010 & {8{din}};
                    3'h2: din_mem=8'b00000100 & {8{din}};
                    3'h3: din_mem=8'b00001000 & {8{din}};
                    3'h4: din_mem=8'b00010000 & {8{din}};
                    3'h5: din_mem=8'b00100000 & {8{din}};
                    3'h6: din_mem=8'b01000000 & {8{din}};
                    3'h7: din_mem=8'b10000000 & {8{din}};
		endcase
	end
// sa and latch
always @(rd_en or addr or l1clk or dout1) begin
  if(rd_en & l1clk)
        dout = dout1;
end

// Initialize latches

`ifndef NOINITMEM
initial begin
  dout=1'b0;
end
`endif // NOINITMEM

endmodule


module n2_niu_sp_4096x9s_128x8_memory (
        l1clk,
        din,
        dout,
        rw_addr,
        rd_en,
        wr_en
);
input           l1clk;
input   [7:0]   din;
input   [6:0]   rw_addr;
input   [7:0]   rd_en;
input   [7:0]   wr_en;
output  [7:0]   dout;

n2_niu_sp_4096x9s_128x1_memory b0 (l1clk,din[0],dout[0],rw_addr,rd_en[0],wr_en[0]);
n2_niu_sp_4096x9s_128x1_memory b1 (l1clk,din[1],dout[1],rw_addr,rd_en[1],wr_en[1]);
n2_niu_sp_4096x9s_128x1_memory b2 (l1clk,din[2],dout[2],rw_addr,rd_en[2],wr_en[2]);
n2_niu_sp_4096x9s_128x1_memory b3 (l1clk,din[3],dout[3],rw_addr,rd_en[3],wr_en[3]);
n2_niu_sp_4096x9s_128x1_memory b4 (l1clk,din[4],dout[4],rw_addr,rd_en[4],wr_en[4]);
n2_niu_sp_4096x9s_128x1_memory b5 (l1clk,din[5],dout[5],rw_addr,rd_en[5],wr_en[5]);
n2_niu_sp_4096x9s_128x1_memory b6 (l1clk,din[6],dout[6],rw_addr,rd_en[6],wr_en[6]);
n2_niu_sp_4096x9s_128x1_memory b7 (l1clk,din[7],dout[7],rw_addr,rd_en[7],wr_en[7]);

endmodule





module n2_niu_sp_4096x9s_128x1_memory (
	l1clk,
	din,
	dout,
	rw_addr,
	rd_en,
	wr_en
);

input		l1clk;
input		din;
input 	[6:0]	rw_addr;
input 		rd_en;
input 		wr_en;
output		dout;


wire [6:0] rw_addr;

`ifdef AXIS_SMEM_BAD

// internal variable
integer          k, l;
reg 		dout;

reg              write_mask;

wire             axis_dout ;
wire             axis_din = din ;
wire    [6:0]    axis_waddr = rw_addr ;
wire    [6:0]    axis_raddr = rw_addr ;
wire             axis_wen = wr_en ;
wire             axis_ren = rd_en ;
wire             axis_clk = ~l1clk ;

axis_smem #(7, 1, 2, 1'b0) mem            // addr_width,data_width,num_ports,init_value
( {axis_dout             , {1'bz}        },        // Output Port  (1,2)
  {{1'bz}                , axis_din      },        // Input Port   (1,2)
  {axis_raddr            , axis_waddr    },        // Address Port (1,2)
  {1'b0                  , axis_wen      },        // Write Enable (1,2)
  {1'b1                  , 1'b1          },        // Chip Enable  (1,2)
  {axis_clk              , axis_clk      },        // Port Clocks  (1,2)
  {{1'bz}                , {1'bz}}       );         // Write Mask   (1,2)


always @(axis_dout or axis_ren or axis_wen or l1clk) begin
                if (axis_ren & ~l1clk) begin
                        if (axis_wen)
                     dout   <= 1'bx;
                       else
                     dout   <= axis_dout;
                end
end

`else

reg  		dout;
reg		mem[127:0];

always @(wr_en or rd_en or din or rw_addr or l1clk)
`ifndef AXIS_SMEM
   #1.01
`else
`endif
   if(l1clk & wr_en)
      if (rd_en) 
         mem[rw_addr] = 1'bx; 
      else
         mem[rw_addr[6:0]] = din;

always @(rd_en or rw_addr or l1clk)
`ifndef AXIS_SMEM
   #1.01
`else
`endif
   if(rd_en & l1clk)
      if(wr_en) 
	dout = 1'bx; 
      else
	dout= rd_en & mem[rw_addr[6:0]];
		
// Initialize the arrays.
`ifndef NOINITMEM
integer j;
initial begin
  for (j=0;j<128;j=j+1) begin
     mem[j] =  1'd0;
  end
  dout=1'b0;
end
`endif // NOINITMEM

`endif // AXIS_SMEM



endmodule


module repwrmux (
        din,
        dout,
        sel
);
        input   [8:0]   din;
        output  [18:0]  dout;
        input   [17:0]  sel;
        wire    [17:0]  din_replicate;

        assign din_replicate={  {2{din[8]}},{2{din[7]}},{2{din[6]}},{2{din[5]}},
                                {2{din[4]}},{2{din[3]}},{2{din[2]}},{2{din[1]}},{2{din[0]}}};

        assign dout[0 ]=~sel[0 ]&&din_replicate[0 ] || sel[0 ]&&din_replicate[0 ];
        assign dout[1 ]=~sel[1 ]&&din_replicate[1 ] || sel[1 ]&&din_replicate[0 ];
        assign dout[2 ]=~sel[2 ]&&din_replicate[2 ] || sel[2 ]&&din_replicate[1 ];
        assign dout[3 ]=~sel[3 ]&&din_replicate[3 ] || sel[3 ]&&din_replicate[2 ];
        assign dout[4 ]=~sel[4 ]&&din_replicate[4 ] || sel[4 ]&&din_replicate[3 ];
        assign dout[5 ]=~sel[5 ]&&din_replicate[5 ] || sel[5 ]&&din_replicate[4 ];
        assign dout[6 ]=~sel[6 ]&&din_replicate[6 ] || sel[6 ]&&din_replicate[5 ];
        assign dout[7 ]=~sel[7 ]&&din_replicate[7 ] || sel[7 ]&&din_replicate[6 ];
        assign dout[8 ]=~sel[8 ]&&din_replicate[8 ] || sel[8 ]&&din_replicate[7 ];
        assign dout[9 ]=~sel[9 ]&&din_replicate[9 ] || sel[9 ]&&din_replicate[8 ];
        assign dout[10]=~sel[10]&&din_replicate[10] || sel[10]&&din_replicate[9 ];
        assign dout[11]=~sel[11]&&din_replicate[11] || sel[11]&&din_replicate[10];
        assign dout[12]=~sel[12]&&din_replicate[12] || sel[12]&&din_replicate[11];
        assign dout[13]=~sel[13]&&din_replicate[13] || sel[13]&&din_replicate[12];
        assign dout[14]=~sel[14]&&din_replicate[14] || sel[14]&&din_replicate[13];
        assign dout[15]=~sel[15]&&din_replicate[15] || sel[15]&&din_replicate[14];
        assign dout[16]=~sel[16]&&din_replicate[16] || sel[16]&&din_replicate[15];
        assign dout[17]=~sel[17]&&din_replicate[17] || sel[17]&&din_replicate[16];
        assign dout[18]=          din_replicate[17];

endmodule




module repwrselmux      (
        wr_en,
        wrseldout,
        addr10,
        repsel
);
        input           wr_en;
        output  [18:0]  wrseldout;
        input           addr10;
        input   [17:0]  repsel;
        assign wrseldout[0 ]= wr_en && (~addr10 && ~repsel[0 ]|| addr10 && repsel[0 ]);
        assign wrseldout[1 ]= wr_en && ( addr10 && ~repsel[1 ]||~addr10 && repsel[1 ]);
        assign wrseldout[2 ]= wr_en && (~addr10 && ~repsel[2 ]|| addr10 && repsel[2 ]);
        assign wrseldout[3 ]= wr_en && ( addr10 && ~repsel[3 ]||~addr10 && repsel[3 ]);
        assign wrseldout[4 ]= wr_en && (~addr10 && ~repsel[4 ]|| addr10 && repsel[4 ]);
        assign wrseldout[5 ]= wr_en && ( addr10 && ~repsel[5 ]||~addr10 && repsel[5 ]);
        assign wrseldout[6 ]= wr_en && (~addr10 && ~repsel[6 ]|| addr10 && repsel[6 ]);
        assign wrseldout[7 ]= wr_en && ( addr10 && ~repsel[7 ]||~addr10 && repsel[7 ]);
        assign wrseldout[8 ]= wr_en && (~addr10 && ~repsel[8 ]|| addr10 && repsel[8 ]);
        assign wrseldout[9 ]= wr_en && ( addr10 && ~repsel[9 ]||~addr10 && repsel[9 ]);
        assign wrseldout[10]= wr_en && (~addr10 && ~repsel[10]|| addr10 && repsel[10]);
        assign wrseldout[11]= wr_en && ( addr10 && ~repsel[11]||~addr10 && repsel[11]);
        assign wrseldout[12]= wr_en && (~addr10 && ~repsel[12]|| addr10 && repsel[12]);
        assign wrseldout[13]= wr_en && ( addr10 && ~repsel[13]||~addr10 && repsel[13]);
        assign wrseldout[14]= wr_en && (~addr10 && ~repsel[14]|| addr10 && repsel[14]);
        assign wrseldout[15]= wr_en && ( addr10 && ~repsel[15]||~addr10 && repsel[15]);
        assign wrseldout[16]= wr_en && (~addr10 && ~repsel[16]|| addr10 && repsel[16]);
        assign wrseldout[17]= wr_en && ( addr10 && ~repsel[17]||~addr10 && repsel[17]);
        assign wrseldout[18]= wr_en && addr10 ;

endmodule



module reprdmux (
        din,
        dout,
        sel
);
        input   [18:0]  din;
        output  [17:0]  dout;
        input   [17:0]  sel;
        assign dout[0 ]=~sel[0 ]&&din[0 ] || sel[0 ]&&din[1 ];
        assign dout[1 ]=~sel[1 ]&&din[1 ] || sel[1 ]&&din[2 ];
        assign dout[2 ]=~sel[2 ]&&din[2 ] || sel[2 ]&&din[3 ];
        assign dout[3 ]=~sel[3 ]&&din[3 ] || sel[3 ]&&din[4 ];
        assign dout[4 ]=~sel[4 ]&&din[4 ] || sel[4 ]&&din[5 ];
        assign dout[5 ]=~sel[5 ]&&din[5 ] || sel[5 ]&&din[6 ];
        assign dout[6 ]=~sel[6 ]&&din[6 ] || sel[6 ]&&din[7 ];
        assign dout[7 ]=~sel[7 ]&&din[7 ] || sel[7 ]&&din[8 ];
        assign dout[8 ]=~sel[8 ]&&din[8 ] || sel[8 ]&&din[9 ];
        assign dout[9 ]=~sel[9 ]&&din[9 ] || sel[9 ]&&din[10];
        assign dout[10]=~sel[10]&&din[10] || sel[10]&&din[11];
        assign dout[11]=~sel[11]&&din[11] || sel[11]&&din[12];
        assign dout[12]=~sel[12]&&din[12] || sel[12]&&din[13];
        assign dout[13]=~sel[13]&&din[13] || sel[13]&&din[14];
        assign dout[14]=~sel[14]&&din[14] || sel[14]&&din[15];
        assign dout[15]=~sel[15]&&din[15] || sel[15]&&din[16];
        assign dout[16]=~sel[16]&&din[16] || sel[16]&&din[17];
        assign dout[17]=~sel[17]&&din[17] || sel[17]&&din[18];
endmodule




module repdec_5_32 (
        addr,
        en,
        dout_chain
);
        input   [4:0]   addr;
        input           en;
        output  [17:0]  dout_chain;

wire    [17:0]   dout_chain;
wire    [31:0]   dout;

coldec_3_8 ad34_00      (addr[2:0],en & ~addr[4] & ~addr[3],dout[7:0]);
coldec_3_8 ad34_01      (addr[2:0],en & ~addr[4] & addr[3],dout[15:8]);
coldec_3_8 ad34_10      (addr[2:0],en & addr[4] & ~addr[3],dout[23:16]);
coldec_3_8 ad34_11      (addr[2:0],en & addr[4] & addr[3],dout[31:24]);

assign dout_chain = {   |dout[17:0],|dout[16:0],
                        |dout[15:0],|dout[14:0], |dout[13:0],|dout[12:0],
                        |dout[11:0],|dout[10:0], |dout[9:0],|dout[8:0],
                        |dout[7:0],|dout[6:0], |dout[5:0],|dout[4:0],
                        |dout[3:0],|dout[2:0],|dout[1:0],|dout[0]};


endmodule




module coldec_3_8 (
        addr,
        en,
        dout
);
        input   [2:0]   addr;
        input           en;
        output  [7:0]   dout;

        reg     [7:0]   dout;
        wire    [2:0]   addr;

always @ (addr or en)
        begin
           if(!en)
                         dout=8'b00000000;
           if(en)
                case(addr)
                   3'h0: dout=8'b00000001;
                   3'h1: dout=8'b00000010;
                   3'h2: dout=8'b00000100;
                   3'h3: dout=8'b00001000;
                   3'h4: dout=8'b00010000;
                   3'h5: dout=8'b00100000;
                   3'h6: dout=8'b01000000;
                   3'h7: dout=8'b10000000;
                endcase

        end
endmodule





module n2_niu_sp_4096x9s_repair (
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  pce, 
  tcu_scan_en, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_array_wr_inhibit, 
  scan_in, 
  hdr_sram_rvalue, 
  hdr_sram_rid, 
  hdr_sram_wr_en, 
  hdr_sram_red_clr, 
  l2clk, 
  sram_hdr_read_data, 
  red_value_b0, 
  red_value_b1, 
  repair_en_bk, 
  scan_out);
wire l1clk_in_en;
wire l1clk_out_en;
wire l1clk_gate_en;
wire hdr_sram_rid_reg_scanout;
wire hdr_sram_wr_en_reg_scanout;
wire hdr_sram_red_clr_reg_scanout;
 

input                   tcu_aclk;
input                   tcu_bclk;
input                   tcu_pce_ov;
input                   pce;
input                   tcu_scan_en;
input                   tcu_se_scancollar_in;
input                   tcu_se_scancollar_out;
input                   tcu_array_wr_inhibit;         // direct input, not flopped
input                   scan_in;
input             [5:0] hdr_sram_rvalue;
input                   hdr_sram_rid;
input                   hdr_sram_wr_en;
input                   hdr_sram_red_clr;

input                   l2clk;

output            [5:0] sram_hdr_read_data;

output            [4:0] red_value_b0;      // to subbank
output            [4:0] red_value_b1;
output            [1:0] repair_en_bk;  

output                  scan_out;

wire              [5:0] sram_hdr_read_data;

wire              [4:0] red_value_b0;      // to subbank
wire              [4:0] red_value_b1;
wire              [1:0] repair_en_bk;      // to subbank

wire                    scan_out;

// scan renames
wire   siclk    = tcu_aclk;
wire   soclk    = tcu_bclk;
// end scan

wire              [1:0] red_id;
wire              [1:0] red_reg_clk_p;
wire              [4:0] fuse_red_data;
wire                    fuse_red_enable;

wire              [4:0] red_data_reg_b0;
wire              [4:0] red_data_reg_b1;
wire              [1:0] red_en_reg_bk; 

wire              [1:0] scan_input_bk;
wire              [1:0] scan_output_bk;

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
//================================================
// l2 clock Domain: Clock headers
//================================================
wire                    l1clk_in;
wire                    l1clk_gate;
wire                    l1clk_out;

//cl_sc1_l1hdr_8x l1ch_in (
//                                .l2clk          (l2clk),
//                                .pce            (pce),
//                                .l1clk          (l1clk_in),
//                                .se             (tcu_se_scancollar_in),
//                                .pce_ov         (tcu_pce_ov),
//                                .stop           (1'b0)
//                        );


//cl_sc1_l1hdr_8x l1ch_out (
//                                .l2clk          (l2clk),
//                                .pce            (pce),
//                                .l1clk          (l1clk_out),
//                                .se             (tcu_se_scancollar_out),
//                                .pce_ov         (tcu_pce_ov),
//                                .stop           (1'b0)
//                          );

//cl_sc1_l1hdr_8x l1ch_gate (
//                                .l2clk          (l2clk),
//                                .pce            (pce),
//                                .l1clk          (l1clk_gate),
//                                .se             (tcu_scan_en),
//                                .pce_ov         (tcu_pce_ov),
//                                .stop           (1'b0)
//                          );

///////////////////////////////////
// decomposed l1hdr for l1clk_in
///////////////////////////////////

cl_mc1_l1enable_12x l1ch_in_l1en (
                                .l2clk          (l2clk),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1en           (l1clk_in_en)
                        );

cl_mc1_l1driver_12x l1ch_in_l1drvr (
                                .se             (tcu_se_scancollar_in),
                                .l1en           (l1clk_in_en),
                                .l1clk          (l1clk_in),
  .l2clk(l2clk)
                        );

///////////////////////////////////
// decomposed l1hdr for l1clk_out
///////////////////////////////////

cl_mc1_l1enable_12x l1ch_out_l1en (
                                .l2clk          (l2clk),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1en           (l1clk_out_en)
                        );

cl_mc1_l1driver_12x l1ch_out_l1drvr (
                                .se             (tcu_se_scancollar_out),
                                .l1en           (l1clk_out_en),
                                .l1clk          (l1clk_out),
  .l2clk(l2clk)
                        );

///////////////////////////////////
// decomposed l1hdr for l1clk_gate
///////////////////////////////////

cl_mc1_l1enable_12x l1ch_gate_l1en (
                                .l2clk          (l2clk),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1en           (l1clk_gate_en)
                        );

cl_mc1_l1driver_12x l1ch_gate_l1drvr (
                                .se             (tcu_scan_en),
                                .l1en           (l1clk_gate_en),
                                .l1clk          (l1clk_gate),
  .l2clk(l2clk)
                        );



//================================================
//  l2 clock Domain: Input flops
//================================================

/****************************************************/
wire              [4:0] fuse_niu_repair_value;
wire                    fuse_niu_repair_en;
wire                    fuse_niu_rid;
wire                    fuse_niu_wen;
wire                    fuse_red_reset;

wire                    sr10;
wire                    hdr_wr_en;
wire                    hdr_red_clr;
wire 			hdr_sram_rid_reg_scanin;
wire 			hdr_sram_wr_en_reg_scanin;
wire 			hdr_sram_red_clr_reg_scanin;

wire [5:0] hdr_rvalue_reg_scanin;
wire [5:0] hdr_rvalue_reg_scanout;
wire [5:0] sram_read_data_reg_scanin;
wire [5:0] sram_read_data_reg_scanout;

//  msff_ctl_macro srhdr_rvalue (width=6) (
//    .scan_in    (dff_rvalue_m_scanin),
//    .scan_out   (dff_rvalue_m_scanout),
//    .l1clk      (l1clk_in),
//    .din        (hdr_sram_rvalue[5:0]),
//    .dout       ({fuse_niu_repair_value[4:0],fuse_niu_repair_en}) );

//  msff_ctl_macro srhdr_rid (width=1) (
//    .scan_in    (dff_rid_m_scanin),
//    .scan_out   (dff_rid_m_scanout),
//    .l1clk      (l1clk_in),
//    .din        (hdr_sram_rid),
//    .dout       (fuse_niu_rid) );

//  msff_ctl_macro srhdr_wr_en (width=1) (
//    .scan_in    (dff_wr_en_m_scanin),
//    .scan_out   (dff_wr_en_m_scanout),
//    .l1clk      (l1clk_in),
//    .din        (hdr_sram_wr_en),
//    .dout       (hdr_wr_en) );

//  msff_ctl_macro srhdr_red_clr (width=1) (
//    .scan_in    (dff_red_clr_m_scanin),
//    .scan_out   (dff_red_clr_m_scanout),
//    .l1clk      (l1clk_in),
//    .din        (hdr_sram_red_clr),
//    .dout       (hdr_red_clr) );


cl_sc1_msff_4x srhdr_rvalue_reg_0 (.d(hdr_sram_rvalue[0]),.si(hdr_rvalue_reg_scanin[0]),.q(fuse_niu_repair_en),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk),.so(hdr_rvalue_reg_scanout[0]));
cl_sc1_msff_4x srhdr_rvalue_reg_1 (.d(hdr_sram_rvalue[1]),.si(hdr_rvalue_reg_scanin[1]),.q(fuse_niu_repair_value[0]),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk),.so(hdr_rvalue_reg_scanout[1]));
cl_sc1_msff_4x srhdr_rvalue_reg_2 (.d(hdr_sram_rvalue[2]),.si(hdr_rvalue_reg_scanin[2]),.q(fuse_niu_repair_value[1]),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk),.so(hdr_rvalue_reg_scanout[2]));
cl_sc1_msff_4x srhdr_rvalue_reg_3 (.d(hdr_sram_rvalue[3]),.si(hdr_rvalue_reg_scanin[3]),.q(fuse_niu_repair_value[2]),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk),.so(hdr_rvalue_reg_scanout[3]));
cl_sc1_msff_4x srhdr_rvalue_reg_4 (.d(hdr_sram_rvalue[4]),.si(hdr_rvalue_reg_scanin[4]),.q(fuse_niu_repair_value[3]),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk),.so(hdr_rvalue_reg_scanout[4]));
cl_sc1_msff_4x srhdr_rvalue_reg_5 (.d(hdr_sram_rvalue[5]),.si(hdr_rvalue_reg_scanin[5]),.q(fuse_niu_repair_value[4]),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk),.so(hdr_rvalue_reg_scanout[5]));

cl_sc1_msff_4x hdr_sram_rid_reg_0 (.d(hdr_sram_rid),.si(hdr_sram_rid_reg_scanin),.q(fuse_niu_rid),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk),.so(hdr_sram_rid_reg_scanout));

cl_sc1_msff_4x hdr_sram_wr_en_reg (.d(hdr_sram_wr_en),.si(hdr_sram_wr_en_reg_scanin),.q(hdr_wr_en),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk),.so(hdr_sram_wr_en_reg_scanout));

cl_sc1_msff_4x hdr_sram_red_clr_reg (.d(hdr_sram_red_clr),.si(hdr_sram_red_clr_reg_scanin),.q(hdr_red_clr),.l1clk(l1clk_in),.siclk(siclk),.soclk(soclk),.so(hdr_sram_red_clr_reg_scanout));

//  assign fuse_niu_wen   = hdr_wr_en   && !tcu_array_wr_inhibit;
//  assign fuse_red_reset = hdr_red_clr && !tcu_array_wr_inhibit;

  niu4k_inv_macro__width_1 r1  (.dout(sr10),           .din(tcu_array_wr_inhibit) );
  niu4k_and_macro__width_1 r2  (.dout(fuse_niu_wen),   .din0(hdr_wr_en),   .din1(sr10) );
  niu4k_and_macro__width_1 r3  (.dout(fuse_red_reset), .din0(hdr_red_clr), .din1(sr10) );

//================================================
//  l2 clock Domain: output flops
//================================================

// ------------ repair_ph.a register ----------------
wire              [4:0] niu_fuse_repair_value;
wire                    niu_fuse_repair_en;




//  msff_ctl_macro sram_read_data (width=6) (
//    .scan_in    (dff_read_data_m_scanin),
//    .scan_out   (dff_read_data_m_scanout),
//    .l1clk      (l1clk_out),
//    .din        ({niu_fuse_repair_value[4:0],niu_fuse_repair_en}),
//    .dout       (sram_hdr_read_data[5:0]) );

cl_sc1_msff_4x sram_read_data_reg_0 (.d(niu_fuse_repair_en),.si(sram_read_data_reg_scanin[0]),.q(sram_hdr_read_data[0]),.l1clk(l1clk_out),.siclk(siclk),.soclk(soclk),.so(sram_read_data_reg_scanout[0]));
cl_sc1_msff_4x sram_read_data_reg_1 (.d(niu_fuse_repair_value[0]),.si(sram_read_data_reg_scanin[1]),.q(sram_hdr_read_data[1]),.l1clk(l1clk_out),.siclk(siclk),.soclk(soclk),.so(sram_read_data_reg_scanout[1]));
cl_sc1_msff_4x sram_read_data_reg_2 (.d(niu_fuse_repair_value[1]),.si(sram_read_data_reg_scanin[2]),.q(sram_hdr_read_data[2]),.l1clk(l1clk_out),.siclk(siclk),.soclk(soclk),.so(sram_read_data_reg_scanout[2]));
cl_sc1_msff_4x sram_read_data_reg_3 (.d(niu_fuse_repair_value[2]),.si(sram_read_data_reg_scanin[3]),.q(sram_hdr_read_data[3]),.l1clk(l1clk_out),.siclk(siclk),.soclk(soclk),.so(sram_read_data_reg_scanout[3]));
cl_sc1_msff_4x sram_read_data_reg_4 (.d(niu_fuse_repair_value[3]),.si(sram_read_data_reg_scanin[4]),.q(sram_hdr_read_data[4]),.l1clk(l1clk_out),.siclk(siclk),.soclk(soclk),.so(sram_read_data_reg_scanout[4]));
cl_sc1_msff_4x sram_read_data_reg_5 (.d(niu_fuse_repair_value[4]),.si(sram_read_data_reg_scanin[5]),.q(sram_hdr_read_data[5]),.l1clk(l1clk_out),.siclk(siclk),.soclk(soclk),.so(sram_read_data_reg_scanout[5]));

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
//////////////////////////////
// Redundancy Register      //
//////////////////////////////
  assign red_id[0] =                                         !fuse_niu_rid;
  assign red_id[1] =                                          fuse_niu_rid;

  assign red_reg_clk_p[0] = (!l1clk_gate && (red_id[0] && fuse_niu_wen || fuse_red_reset));
  assign red_reg_clk_p[1] = (!l1clk_gate && (red_id[1] && fuse_niu_wen || fuse_red_reset));

  assign fuse_red_data    = fuse_niu_repair_value & {5{!fuse_red_reset}};
  assign fuse_red_enable  = fuse_niu_repair_en    &&   !fuse_red_reset;

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
    n2_niu_sp_4096x9s_redreg redreg_0 (
                                         .fuse_red_data        (fuse_red_data),
                                         .fuse_red_enable      (fuse_red_enable),
                                         .red_reg_clk_p        (red_reg_clk_p[0]),
                                         .red_data_reg         (red_data_reg_b0),
                                         .red_en_reg           (red_en_reg_bk[0]),
                                         .red_value            (red_value_b0),
                                         .repair_en            (repair_en_bk[0])
                                        );

    n2_niu_sp_4096x9s_redreg redreg_1 (
                                         .fuse_red_data        (fuse_red_data),
                                         .fuse_red_enable      (fuse_red_enable),
                                         .red_reg_clk_p        (red_reg_clk_p[1]),
                                         .red_data_reg         (red_data_reg_b1),
                                         .red_en_reg           (red_en_reg_bk[1]),
                                         .red_value            (red_value_b1),
                                         .repair_en            (repair_en_bk[1])
                                        );

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
wire              [4:0] niu_fuse_repair_value_b0;
wire              [4:0] niu_fuse_repair_value_b1;

  // assign niu_fuse_repair_value = (red_data_reg_b0 & {5{red_id[0]}}) |
  //                                (red_data_reg_b1 & {5{red_id[1]}});

  niu4k_and_macro__width_5 ava0  (.dout(niu_fuse_repair_value_b0), .din0(red_data_reg_b0), .din1({5{red_id[0]}}));
  niu4k_and_macro__width_5 ava1  (.dout(niu_fuse_repair_value_b1), .din0(red_data_reg_b1), .din1({5{red_id[1]}}));

   niu4k_or_macro__width_5 ova0  (.dout(niu_fuse_repair_value), .din0(niu_fuse_repair_value_b0), .din1(niu_fuse_repair_value_b1));

wire              [1:0] niu_fuse_repair_en_bk;

  // assign niu_fuse_repair_en    = (red_en_reg_bk[0] && red_id[0])  ||
  //                                (red_en_reg_bk[1] && red_id[1]);

  niu4k_and_macro__width_2 aen0  (.dout(niu_fuse_repair_en_bk), .din0(red_en_reg_bk[1:0]),       .din1(red_id[1:0]) );

   niu4k_or_macro__width_1 oen0  (.dout(niu_fuse_repair_en),.din0(niu_fuse_repair_en_bk[0]),.din1(niu_fuse_repair_en_bk[1]));

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
// fixscan start:


assign hdr_rvalue_reg_scanin[5]     = scan_in;
assign sram_read_data_reg_scanin[5] = hdr_rvalue_reg_scanout[5];
assign hdr_rvalue_reg_scanin[4]     = sram_read_data_reg_scanout[5];
assign sram_read_data_reg_scanin[4] = hdr_rvalue_reg_scanout[4];
assign hdr_rvalue_reg_scanin[3]     = sram_read_data_reg_scanout[4];
assign sram_read_data_reg_scanin[3] = hdr_rvalue_reg_scanout[3];
assign hdr_rvalue_reg_scanin[2]     = sram_read_data_reg_scanout[3];
assign sram_read_data_reg_scanin[2] = hdr_rvalue_reg_scanout[2];
assign hdr_rvalue_reg_scanin[1]     = sram_read_data_reg_scanout[2];
assign sram_read_data_reg_scanin[1] = hdr_rvalue_reg_scanout[1];
assign hdr_rvalue_reg_scanin[0]     = sram_read_data_reg_scanout[1];
assign sram_read_data_reg_scanin[0] = hdr_rvalue_reg_scanout[0];
assign hdr_sram_rid_reg_scanin      = sram_read_data_reg_scanout[0];
assign hdr_sram_wr_en_reg_scanin    = hdr_sram_rid_reg_scanout;
assign hdr_sram_red_clr_reg_scanin  = hdr_sram_wr_en_reg_scanout;
assign scan_out                     = hdr_sram_red_clr_reg_scanout;


// fixscan end

endmodule



//
//   invert macro
//
//





module niu4k_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;









cl_u1_inv_1x d0_0 (
.in(din[0]),
.out(dout[0])
);





endmodule





//  
//   and macro for ports = 2,3,4
//
//





module niu4k_and_macro__width_1 (
  din0, 
  din1, 
  dout);
wire [0:0] nandout;

  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;









cl_u1_nand2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(nandout[0])
);

cl_u1_inv_1x d1_0 (
.in(nandout[0]),
.out(dout[0])
);




endmodule






module n2_niu_sp_4096x9s_redreg (
  fuse_red_data, 
  fuse_red_enable, 
  red_reg_clk_p, 
  red_data_reg, 
  red_en_reg, 
  red_value, 
  repair_en); 

input             [4:0] fuse_red_data;
input                   fuse_red_enable;
input                   red_reg_clk_p;

output            [4:0] red_data_reg;    // to repair output
output                  red_en_reg;
output            [4:0] red_value;       // to subbank
output                  repair_en;

wire              [4:0] red_value;
wire                    repair_en;

wire              [4:0] red_data_reg;
wire                    red_en_reg;

wire                    red_en_reg1;


//////////////////////////////
// Redundancy Register      //
//////////////////////////////

// `ifdef NOINITMEM
// `else
//   // Initialize the arrays.
//   initial begin
//     red_data_reg = {5{1'h0}};
//     red_en_reg   = 1'h0;
//   end
// `endif

//  always @(posedge red_reg_clk_p) begin
//    red_data_reg  <= fuse_red_data;
//    red_en_reg    <= fuse_red_enable;
//  end

cl_sc1_msff_4x e_r0 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_enable), .q(red_en_reg));
cl_sc1_msff_4x e_r1 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_enable), .q(red_en_reg1));

cl_sc1_msff_4x d_r0 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[0]),.q(red_data_reg[0]));
cl_sc1_msff_4x d_r1 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[1]),.q(red_data_reg[1]));
cl_sc1_msff_4x d_r2 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[2]),.q(red_data_reg[2]));
cl_sc1_msff_4x d_r3 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[3]),.q(red_data_reg[3]));
cl_sc1_msff_4x d_r4 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[4]),.q(red_data_reg[4]));

//  assign repair_en = red_en_reg;
//  assign red_value = red_data_reg[4:0] & {5{repair_en}};

  niu4k_and_macro__width_1 a0  (.dout(repair_en), .din0(red_en_reg),        .din1(red_en_reg1));
  niu4k_and_macro__width_5 a1  (.dout(red_value), .din0(red_data_reg[4:0]), .din1({5{repair_en}}));


endmodule



//  
//   and macro for ports = 2,3,4
//
//





module niu4k_and_macro__width_5 (
  din0, 
  din1, 
  dout);
wire [4:0] nandout;

  input [4:0] din0;
  input [4:0] din1;
  output [4:0] dout;









cl_u1_nand2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(nandout[0])
);

cl_u1_nand2_1x d0_1 (
.in0(din0[1]),
.in1(din1[1]),
.out(nandout[1])
);

cl_u1_nand2_1x d0_2 (
.in0(din0[2]),
.in1(din1[2]),
.out(nandout[2])
);

cl_u1_nand2_1x d0_3 (
.in0(din0[3]),
.in1(din1[3]),
.out(nandout[3])
);

cl_u1_nand2_1x d0_4 (
.in0(din0[4]),
.in1(din1[4]),
.out(nandout[4])
);

cl_u1_inv_1x d1_0 (
.in(nandout[0]),
.out(dout[0])
);
cl_u1_inv_1x d1_1 (
.in(nandout[1]),
.out(dout[1])
);
cl_u1_inv_1x d1_2 (
.in(nandout[2]),
.out(dout[2])
);
cl_u1_inv_1x d1_3 (
.in(nandout[3]),
.out(dout[3])
);
cl_u1_inv_1x d1_4 (
.in(nandout[4]),
.out(dout[4])
);




endmodule





//  
//   or macro for ports = 2,3
//
//





module niu4k_or_macro__width_5 (
  din0, 
  din1, 
  dout);
wire [4:0] norout;

  input [4:0] din0;
  input [4:0] din1;
  output [4:0] dout;









cl_u1_nor2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(norout[0])
);

cl_u1_nor2_1x d0_1 (
.in0(din0[1]),
.in1(din1[1]),
.out(norout[1])
);

cl_u1_nor2_1x d0_2 (
.in0(din0[2]),
.in1(din1[2]),
.out(norout[2])
);

cl_u1_nor2_1x d0_3 (
.in0(din0[3]),
.in1(din1[3]),
.out(norout[3])
);

cl_u1_nor2_1x d0_4 (
.in0(din0[4]),
.in1(din1[4]),
.out(norout[4])
);

cl_u1_inv_1x d1_0 (
.in(norout[0]),
.out(dout[0])
);
cl_u1_inv_1x d1_1 (
.in(norout[1]),
.out(dout[1])
);
cl_u1_inv_1x d1_2 (
.in(norout[2]),
.out(dout[2])
);
cl_u1_inv_1x d1_3 (
.in(norout[3]),
.out(dout[3])
);
cl_u1_inv_1x d1_4 (
.in(norout[4]),
.out(dout[4])
);




endmodule





//  
//   and macro for ports = 2,3,4
//
//





module niu4k_and_macro__width_2 (
  din0, 
  din1, 
  dout);
wire [1:0] nandout;

  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;









cl_u1_nand2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(nandout[0])
);

cl_u1_nand2_1x d0_1 (
.in0(din0[1]),
.in1(din1[1]),
.out(nandout[1])
);

cl_u1_inv_1x d1_0 (
.in(nandout[0]),
.out(dout[0])
);
cl_u1_inv_1x d1_1 (
.in(nandout[1]),
.out(dout[1])
);




endmodule





//  
//   or macro for ports = 2,3
//
//





module niu4k_or_macro__width_1 (
  din0, 
  din1, 
  dout);
wire [0:0] norout;

  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;









cl_u1_nor2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(norout[0])
);

cl_u1_inv_1x d1_0 (
.in(norout[0]),
.out(dout[0])
);




endmodule




