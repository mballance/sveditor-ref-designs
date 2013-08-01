// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_ffrpt_dp.v
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
module l2t_ffrpt_dp (
  data_in, 
  tcu_clk_stop, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  l2clk, 
  scan_in, 
  scan_out, 
  data_out) ;
wire bank0_scanin;
wire bank0_scanout;
wire bank1_scanin;
wire bank1_scanout;
wire bank2_scanin;
wire bank2_scanout;
wire bank3_scanin;
wire bank3_scanout;
wire bank4_scanin;
wire bank4_scanout;
wire bank5_scanin;
wire bank5_scanout;
wire bank6_scanin;
wire bank6_scanout;
wire bank7_scanin;
wire bank7_scanout;
wire bank8_scanin;
wire bank8_scanout;
wire bank9_scanin;
wire bank9_scanout;
wire bank10_scanin;
wire bank10_scanout;
wire bank11_scanin;
wire bank11_scanout;



input	[191:0]	data_in;
input		tcu_clk_stop;
input		tcu_pce_ov;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;
input		l2clk;
input		scan_in;

output		scan_out;
output	[191:0]	data_out;


n2_flop_bank_cust	bank0
	(
	.scan_in(bank0_scanin),
	.scan_out(bank0_scanout),
	.l2clk		(l2clk),
	.tcu_aclk	(tcu_aclk),
	.tcu_bclk	(tcu_bclk),
	.tcu_scan_en	(tcu_scan_en),
	.tcu_pce_ov	(tcu_pce_ov),
	.local_stop	(tcu_clk_stop),
	.data_out	(data_out[15:0]),
	.data_in	(data_in[15:0])
	);

n2_flop_bank_cust       bank1
        (
        .scan_in(bank1_scanin),
        .scan_out(bank1_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[31:16]),
        .data_in        (data_in[31:16])
        );

n2_flop_bank_cust       bank2
        (
        .scan_in(bank2_scanin),
        .scan_out(bank2_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[47:32]),
        .data_in        (data_in[47:32])
        );

n2_flop_bank_cust       bank3
        (
        .scan_in(bank3_scanin),
        .scan_out(bank3_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[63:48]),
        .data_in        (data_in[63:48])
        );


n2_flop_bank_cust       bank4
        (
        .scan_in(bank4_scanin),
        .scan_out(bank4_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[79:64]),
        .data_in        (data_in[79:64])
        );


n2_flop_bank_cust       bank5
        (
        .scan_in(bank5_scanin),
        .scan_out(bank5_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[95:80]),
        .data_in        (data_in[95:80])
        );



n2_flop_bank_cust       bank6
        (
        .scan_in(bank6_scanin),
        .scan_out(bank6_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[111:96]),
        .data_in        (data_in[111:96])
        );


n2_flop_bank_cust       bank7
        (
        .scan_in(bank7_scanin),
        .scan_out(bank7_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[127:112]),
        .data_in        (data_in[127:112])
        );

n2_flop_bank_cust       bank8
        (
        .scan_in(bank8_scanin),
        .scan_out(bank8_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[143:128]),
        .data_in        (data_in[143:128])
        );

n2_flop_bank_cust       bank9
        (
        .scan_in(bank9_scanin),
        .scan_out(bank9_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[159:144]),
        .data_in        (data_in[159:144])
        );

n2_flop_bank_cust       bank10
        (
        .scan_in(bank10_scanin),
        .scan_out(bank10_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[175:160]),
        .data_in        (data_in[175:160])
        );

n2_flop_bank_cust       bank11
        (
        .scan_in(bank11_scanin),
        .scan_out(bank11_scanout),
        .l2clk          (l2clk),
        .tcu_aclk       (tcu_aclk),
        .tcu_bclk       (tcu_bclk),
        .tcu_scan_en    (tcu_scan_en),
        .tcu_pce_ov     (tcu_pce_ov),
        .local_stop     (tcu_clk_stop),
        .data_out       (data_out[191:176]),
        .data_in        (data_in[191:176])
        );














// fixscan start:
assign bank0_scanin              = scan_in                  ;
assign bank1_scanin              = bank0_scanout            ;
assign bank2_scanin              = bank1_scanout            ;
assign bank3_scanin              = bank2_scanout            ;
assign bank4_scanin              = bank3_scanout            ;
assign bank5_scanin              = bank4_scanout            ;
assign bank6_scanin              = bank5_scanout            ;
assign bank7_scanin              = bank6_scanout            ;
assign bank8_scanin              = bank7_scanout            ;
assign bank9_scanin              = bank8_scanout            ;
assign bank10_scanin             = bank9_scanout            ;
assign bank11_scanin             = bank10_scanout           ;
assign scan_out                  = bank11_scanout           ;
// fixscan end:
endmodule

