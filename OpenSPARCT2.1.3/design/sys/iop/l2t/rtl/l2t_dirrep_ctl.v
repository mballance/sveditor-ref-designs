// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_dirrep_ctl.v
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
module l2t_dirrep_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  dirrep_dir_wr_par_c4, 
  dirrep_dir_vld_c4_l, 
  dirrep_dc_rd_en_c4, 
  dirrep_dc_wr_en_c4, 
  dirrep_inval_mask_dcd_c4, 
  dirrep_dc_rdwr_row_en_c4, 
  dirrep_dc_rdwr_panel_dec_c4, 
  dirrep_dc_lkup_row_dec_c4, 
  dirrep_dc_lkup_panel_dec_c4, 
  dirrep_wr_dc_dir_entry_c4, 
  dirrep_dc_dir_clear_c4, 
  dirrep_ic_rd_en_c4, 
  dirrep_ic_wr_en_c4, 
  dirrep_inval_mask_icd_c4, 
  dirrep_ic_rdwr_row_en_c4, 
  dirrep_ic_rdwr_panel_dec_c4, 
  dirrep_ic_lkup_row_dec_c4, 
  dirrep_ic_lkup_panel_dec_c4, 
  dirrep_wr_ic_dir_entry_c4, 
  dirrep_ic_dir_clear_c4, 
  dirrep_dir_error_c8, 
  scan_out, 
  ic_parity_out, 
  dc_parity_out, 
  arbadr_arbdp_addr5to4_c3, 
  arbadr_arbdp_addr4_c4, 
  arbadr_arbdp_dc_addr4_c4, 
  arbadr_arbdp_ic_addr4_c4, 
  arbadr_arbdp_index_ic_addr4_c4, 
  arbadr_arbdp_index_dc_addr4_c4, 
  arb_inval_inst_vld_c3, 
  arb_dc_ic_rd_bit_4, 
  arbadr_arbdp_dir_wr_par_c3, 
  arb_dir_vld_c3_l, 
  arb_ic_rd_en_c3, 
  arb_dc_rd_en_c3, 
  arb_ic_wr_en_c3, 
  arb_dc_wr_en_c3, 
  arb_dir_panel_dcd_c3, 
  arb_dir_panel_icd_c3, 
  arb_lkup_bank_ena_dcd_c3, 
  arb_lkup_bank_ena_icd_c3, 
  arb_inval_mask_dcd_c3, 
  arb_inval_mask_icd_c3, 
  arb_wr_dc_dir_entry_c3, 
  arb_wr_ic_dir_entry_c3, 
  tagd_lkup_row_addr_dcd_c3, 
  tagd_lkup_row_addr_icd_c3, 
  arb_ic_inval_vld_c7, 
  csr_oneshot_dir_clear_c3, 
  por_l, 
  l2t_mb0_run, 
  l2clk, 
  scan_in);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire ff_dir_error_c8_scanin;
wire ff_dir_error_c8_scanout;
wire ff_wr_par_c4_scanin;
wire ff_wr_par_c4_scanout;
wire ff_dir_vld_dcd_c4_l_scanin;
wire ff_dir_vld_dcd_c4_l_scanout;
wire ff_dc_rd_en_c4_scanin;
wire ff_dc_rd_en_c4_scanout;
wire ff_ic_rd_en_c4_scanin;
wire ff_ic_rd_en_c4_scanout;
wire ff_dc_wr_en_c4_scanin;
wire ff_dc_wr_en_c4_scanout;
wire ff_ic_wr_en_c4_scanin;
wire ff_ic_wr_en_c4_scanout;
wire ff_inval_mask_dcd_c4_scanin;
wire ff_inval_mask_dcd_c4_scanout;
wire ff_inval_mask_icd_c4_scanin;
wire ff_inval_mask_icd_c4_scanout;
wire [1:0] arbadr_arbdp_addr5to4_c4;
wire ff_dir_panel_dcd_c4_scanin;
wire ff_dir_panel_dcd_c4_scanout;
wire ff_inval_addrbit4_c4_scanin;
wire ff_inval_addrbit4_c4_scanout;
wire inval_inst_vld_c4;
wire inval_inst_vld_c5;
wire inval_inst_vld_c52;
wire inval_inst_vld_c6;
wire [1:0] arbadr_arbdp_addr5to4_c5;
wire [1:0] arbadr_arbdp_addr5to4_c52;
wire [1:0] arbadr_arbdp_addr5to4_c6;
wire arb_dc_ic_rd_bit_4_c4;
wire def_inval_entry;
wire arbadr_arbdp_dc_addr4_c4_fnl;
wire ff_dir_panel_icd_c4_scanin;
wire ff_dir_panel_icd_c4_scanout;
wire ff_inval_vld_c78910_scanin;
wire ff_inval_vld_c78910_scanout;
wire ic_inval_vld_c8;
wire ic_inval_vld_c9;
wire ic_inval_vld_c10;
wire ic_invalidation_bit4_flip;
wire arbadr_arbdp_ic_addr4_c4_fnl;
wire ff_lkup_row_addr_dcd_c4_scanin;
wire ff_lkup_row_addr_dcd_c4_scanout;
wire ff_lkup_bank_ena_dcd_c4_scanin;
wire ff_lkup_bank_ena_dcd_c4_scanout;
wire ff_lkup_row_addr_icd_c4_scanin;
wire ff_lkup_row_addr_icd_c4_scanout;
wire ff_lkup_bank_ena_icd_c4_scanin;
wire ff_lkup_bank_ena_icd_c4_scanout;
wire ff_wr_dc_dir_entry_c4_scanin;
wire ff_wr_dc_dir_entry_c4_scanout;
wire ff_wr_ic_dir_entry_c4_scanin;
wire ff_wr_ic_dir_entry_c4_scanout;
wire ff_ic_dir_clear_c4_scanin;
wire ff_ic_dir_clear_c4_scanout;
wire reset_dir_cams_c3;
wire ff_dc_dir_clear_c4_scanin;
wire ff_dc_dir_clear_c4_scanout;
wire fnl_csr_oneshot_dir_clear_c3;
wire l2t_mb0_run_r1;
wire ff_l2t_mb0_run_scanin;
wire ff_l2t_mb0_run_scanout;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
 
output  	dirrep_dir_wr_par_c4; 
output		dirrep_dir_vld_c4_l; 
 
 
// D$ directory	( Left Bottom ) 
output		dirrep_dc_rd_en_c4; 
output          dirrep_dc_wr_en_c4;
output [7:0]   	dirrep_inval_mask_dcd_c4; 
// Read and write addresses require a rd_en/wr_en qualification 
output [3:0]	dirrep_dc_rdwr_row_en_c4; // bits 4,3 of panel decode (i.e. address 10:9 ) 
output [3:0]	dirrep_dc_rdwr_panel_dec_c4; // dec bits 1:0 of the panel address (i.e. address 5,4 ); 
// Lkup addresses do not require a qualification as the  
// _lkup_row_dec_c4 is actually a qualified vector. 
output [3:0]	dirrep_dc_lkup_row_dec_c4 ;  
output [3:0]   	dirrep_dc_lkup_panel_dec_c4 ;// use lkup_row_addr_dcd[2:1] dec 
output [4:0]   	dirrep_wr_dc_dir_entry_c4 ; // lsb is arb_dir_panel_dcd[2] , BS and SR 11/18/03 Reverse Directory change 
output	dirrep_dc_dir_clear_c4; // Bottom left 
					// ie bit 8 of the address. 
 
// I$ directory	( Left TOp ) 
output		dirrep_ic_rd_en_c4; 
output          dirrep_ic_wr_en_c4;
output [7:0]	dirrep_inval_mask_icd_c4; 
// Read and write addresses require a rd_en/wr_en qualification 
output [3:0]	dirrep_ic_rdwr_row_en_c4; // bits 4,3 of panel decode (i.e. address 10:9 ) 
output [3:0]	dirrep_ic_rdwr_panel_dec_c4; // dec bits 1:0 of the panel address (i.e. address 5,4 ); 
// Lkup addresses do not require a qualification as the  
// _lkup_row_dec_c4 is actually a qualified vector. 
output [3:0]	dirrep_ic_lkup_row_dec_c4 ; // use lkup_row_addr_dcd[2:1] dec 
output [3:0]   	dirrep_ic_lkup_panel_dec_c4 ; 
output [4:0]   	dirrep_wr_ic_dir_entry_c4 ; // lsb is arb_dir_panel_icd[2], BS and SR 11/18/03 Reverse Directory change  
					// ie bit 8 of the address. 
output	dirrep_ic_dir_clear_c4; // Top left 
 
output	dirrep_dir_error_c8; // Right 
 
output scan_out; 
 
input	[3:0]	ic_parity_out; // LeftTop ( C7 signal.) 
input	[3:0]	dc_parity_out; // LeftBottom ( C7 signal.) 

//
// Directory restructure 
//
 
input	[1:0]	arbadr_arbdp_addr5to4_c3;
output		arbadr_arbdp_addr4_c4;
output		arbadr_arbdp_dc_addr4_c4;
output		arbadr_arbdp_ic_addr4_c4;
output		arbadr_arbdp_index_ic_addr4_c4;
output		arbadr_arbdp_index_dc_addr4_c4;

input		arb_inval_inst_vld_c3;
input		arb_dc_ic_rd_bit_4;

// Use same pin positions as before. 
input   	arbadr_arbdp_dir_wr_par_c3; 
input		arb_dir_vld_c3_l; 
input		arb_ic_rd_en_c3;
input           arb_dc_rd_en_c3;
input		arb_ic_wr_en_c3;
input           arb_dc_wr_en_c3;
input [4:0]   	arb_dir_panel_dcd_c3;
input [4:0]     arb_dir_panel_icd_c3;
input [3:0]   	arb_lkup_bank_ena_dcd_c3; // translates to a row_en 
input [3:0]     arb_lkup_bank_ena_icd_c3;
input [7:0]   	arb_inval_mask_dcd_c3;
input [7:0]     arb_inval_mask_icd_c3;
input [4:0]   	arb_wr_dc_dir_entry_c3;
input [4:0]      arb_wr_ic_dir_entry_c3;
input [2:0]	tagd_lkup_row_addr_dcd_c3; // translates to a panel enable. 
input [2:0]     tagd_lkup_row_addr_icd_c3 ;
							     // comes from tagd 
 
input		arb_ic_inval_vld_c7; 
input		csr_oneshot_dir_clear_c3; 
input		por_l;

input		l2t_mb0_run;
 
input		l2clk; 
input scan_in;

 // BS 2/1/04 : Brought out IC inval signal to separate from IC fill
 // because IC fill will load only one panel in 1 row (only one 1 cache waY) while IC inval will write
 // to two panels in two rows (2 icache ways) every cycle. This IC dir write enable logic is in
 // l2t_dir_ctl.sv.

// input arb_ic_inval_wr_en_c3; // from l2t_arb_ctl 
// output dirrep_ic_inval_wr_en_c4; // to l2t_dir_ctl modules

 

//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_dirrep_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(l2clk),
        .l1en(1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//////////////////////////////////////////////////

//////////////////////////////////////////
// Spare gate insertion
//////////////////////////////////////////
l2t_dirrep_ctl_spare_ctl_macro__num_5 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////


wire		dir_error_c7; 
wire	[4:0]	dir_panel_dcd_c4, dir_panel_icd_c4 ; 
wire	[2:0]	lkup_row_addr_dcd_c4, lkup_row_addr_icd_c4; 
 
assign	dir_error_c7 = (|(ic_parity_out)) | (|(dc_parity_out)) ; 
 
l2t_dirrep_ctl_msff_ctl_macro__width_1 ff_dir_error_c8 
              (.dout   (dirrep_dir_error_c8), 
               .scan_in(ff_dir_error_c8_scanin),
               .scan_out(ff_dir_error_c8_scanout),
               .din (dir_error_c7), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_dirrep_ctl_msff_ctl_macro__width_1 ff_wr_par_c4 
              (.dout   (dirrep_dir_wr_par_c4), 
               .scan_in(ff_wr_par_c4_scanin),
               .scan_out(ff_wr_par_c4_scanout),
               .din (arbadr_arbdp_dir_wr_par_c3), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_dirrep_ctl_msff_ctl_macro__width_1 ff_dir_vld_dcd_c4_l 
              (.dout   (dirrep_dir_vld_c4_l), 
               .scan_in(ff_dir_vld_dcd_c4_l_scanin),
               .scan_out(ff_dir_vld_dcd_c4_l_scanout),
               .din (arb_dir_vld_c3_l), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
l2t_dirrep_ctl_msff_ctl_macro__width_1 ff_dc_rd_en_c4 
              (.dout   (dirrep_dc_rd_en_c4), 
               .scan_in(ff_dc_rd_en_c4_scanin),
               .scan_out(ff_dc_rd_en_c4_scanout),
               .din (arb_dc_rd_en_c3), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_dirrep_ctl_msff_ctl_macro__width_1 ff_ic_rd_en_c4 
              (.dout   (dirrep_ic_rd_en_c4), 
               .scan_in(ff_ic_rd_en_c4_scanin),
               .scan_out(ff_ic_rd_en_c4_scanout),
               .din (arb_ic_rd_en_c3), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_dirrep_ctl_msff_ctl_macro__width_1 ff_dc_wr_en_c4 
              (.dout   (dirrep_dc_wr_en_c4), 
               .scan_in(ff_dc_wr_en_c4_scanin),
               .scan_out(ff_dc_wr_en_c4_scanout),
               .din (arb_dc_wr_en_c3), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_dirrep_ctl_msff_ctl_macro__width_1 ff_ic_wr_en_c4 
              (.dout   (dirrep_ic_wr_en_c4), 
               .scan_in(ff_ic_wr_en_c4_scanin),
               .scan_out(ff_ic_wr_en_c4_scanout),
               .din (arb_ic_wr_en_c3), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 

//// BS 2/1/04 : Flop arb_ic_inval_wr_en_c3 to generate a C4 signal 
//msff_ctl_macro ff_ic_inval_wr_en_c4 (width=1)
//              (.dout   (dirrep_ic_inval_wr_en_c4),
//               .scan_in(ff_ic_inval_wr_en_c4_scanin),
//               .scan_out(ff_ic_inval_wr_en_c4_scanout),
//               .din (arb_ic_inval_wr_en_c3),
//               .l1clk (l1clk),
//                
//
//              ) ;

 
 
l2t_dirrep_ctl_msff_ctl_macro__width_8 ff_inval_mask_dcd_c4 
              (.dout   (dirrep_inval_mask_dcd_c4[7:0]), 
               .scan_in(ff_inval_mask_dcd_c4_scanin),
               .scan_out(ff_inval_mask_dcd_c4_scanout),
               .din (arb_inval_mask_dcd_c3[7:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_dirrep_ctl_msff_ctl_macro__width_8 ff_inval_mask_icd_c4 
              (.dout   (dirrep_inval_mask_icd_c4[7:0]), 
               .scan_in(ff_inval_mask_icd_c4_scanin),
               .scan_out(ff_inval_mask_icd_c4_scanout),
               .din (arb_inval_mask_icd_c3[7:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
/////////////////////////////////////////////////////////// 
// RD Write row and panel enables. 
// Row is dtermined by the lower order bits of the  
// address. 
// ie bits 5,4 for the I$ 
// ie bits 5,11 for the D$. 
// Panel is determined by address bits 10,9 
/////////////////////////////////////////////////////////// 
 
l2t_dirrep_ctl_msff_ctl_macro__width_6 ff_dir_panel_dcd_c4 
              (.dout   ({arbadr_arbdp_addr5to4_c4[1:0],dir_panel_dcd_c4[4:3], dir_panel_dcd_c4[1:0]}), 
               .scan_in(ff_dir_panel_dcd_c4_scanin),
               .scan_out(ff_dir_panel_dcd_c4_scanout),
               .din ({arbadr_arbdp_addr5to4_c3[1:0],arb_dir_panel_dcd_c3[4:3],arb_dir_panel_dcd_c3[1:0]}), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 


// Directory restructuring


l2t_dirrep_ctl_msff_ctl_macro__width_11 ff_inval_addrbit4_c4 
	(
	.scan_in(ff_inval_addrbit4_c4_scanin),
	.scan_out(ff_inval_addrbit4_c4_scanout),
	.dout   ({inval_inst_vld_c4,inval_inst_vld_c5,inval_inst_vld_c52,inval_inst_vld_c6,
		  arbadr_arbdp_addr5to4_c5[1:0],arbadr_arbdp_addr5to4_c52[1:0],
		arbadr_arbdp_addr5to4_c6[1:0],arb_dc_ic_rd_bit_4_c4}),
	.din ({arb_inval_inst_vld_c3,inval_inst_vld_c4,inval_inst_vld_c5,inval_inst_vld_c52,
		arbadr_arbdp_addr5to4_c4[1:0],arbadr_arbdp_addr5to4_c5[1:0],
		arbadr_arbdp_addr5to4_c52[1:0],arb_dc_ic_rd_bit_4}),
	.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
	) ;


assign def_inval_entry = ~( inval_inst_vld_c5 | inval_inst_vld_c52 | inval_inst_vld_c6 ) ; 

l2t_dirrep_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_1 mux_inval_dc_panel_c3 
	(
	.dout (arbadr_arbdp_dc_addr4_c4_fnl), 
	.din0(arbadr_arbdp_addr5to4_c4[0]), .din1(arbadr_arbdp_addr5to4_c5[0]), 
	.din2(arbadr_arbdp_addr5to4_c52[0]), .din3(arbadr_arbdp_addr5to4_c6[0]), 
	.sel0(def_inval_entry), .sel1(inval_inst_vld_c5), 
	.sel2(inval_inst_vld_c52), .sel3(inval_inst_vld_c6)); 


//assign arbadr_arbdp_dc_addr4_c4 = dirrep_dc_rd_en_c4 ? arb_dc_ic_rd_bit_4 : arbadr_arbdp_dc_addr4_c4_fnl ;


assign arbadr_arbdp_dc_addr4_c4 = arbadr_arbdp_dc_addr4_c4_fnl ;

assign arbadr_arbdp_index_dc_addr4_c4 = arb_dc_ic_rd_bit_4_c4;

assign arbadr_arbdp_addr4_c4 = arbadr_arbdp_addr5to4_c4[0];




//assign	dirrep_dc_rdwr_panel_dec_c4[0] = ( dir_panel_dcd_c4[4:3] == 2'd0 ); 
//assign	dirrep_dc_rdwr_panel_dec_c4[1] = ( dir_panel_dcd_c4[4:3] == 2'd1 ); 
//assign	dirrep_dc_rdwr_panel_dec_c4[2] = ( dir_panel_dcd_c4[4:3] == 2'd2 ); 
//assign	dirrep_dc_rdwr_panel_dec_c4[3] = ( dir_panel_dcd_c4[4:3] == 2'd3 ); 
 
assign  dirrep_dc_rdwr_panel_dec_c4[0] = ~dir_panel_dcd_c4[4] & ~dir_panel_dcd_c4[3] ; 
assign  dirrep_dc_rdwr_panel_dec_c4[1] = ~dir_panel_dcd_c4[4] & dir_panel_dcd_c4[3] ; 
assign  dirrep_dc_rdwr_panel_dec_c4[2] = dir_panel_dcd_c4[4] & ~dir_panel_dcd_c4[3] ; 
assign  dirrep_dc_rdwr_panel_dec_c4[3] = dir_panel_dcd_c4[4] & dir_panel_dcd_c4[3] ; 
 
assign	dirrep_dc_rdwr_row_en_c4[0] = (dir_panel_dcd_c4[1:0] == 2'd0 ); 
assign	dirrep_dc_rdwr_row_en_c4[1] = (dir_panel_dcd_c4[1:0] == 2'd1 ); 
assign	dirrep_dc_rdwr_row_en_c4[2] = (dir_panel_dcd_c4[1:0] == 2'd2 ); 
assign	dirrep_dc_rdwr_row_en_c4[3] = (dir_panel_dcd_c4[1:0] == 2'd3 ); 
 
l2t_dirrep_ctl_msff_ctl_macro__width_4 ff_dir_panel_icd_c4 
              (.dout   ({dir_panel_icd_c4[4:3],dir_panel_icd_c4[1:0]}), 
               .scan_in(ff_dir_panel_icd_c4_scanin),
               .scan_out(ff_dir_panel_icd_c4_scanout),
               .din ({arb_dir_panel_icd_c3[4:3],arb_dir_panel_icd_c3[1:0]}), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
assign	dirrep_ic_rdwr_panel_dec_c4[0] = ( dir_panel_icd_c4[4:3] == 2'd0 ); 
assign	dirrep_ic_rdwr_panel_dec_c4[1] = ( dir_panel_icd_c4[4:3] == 2'd1 ); 
assign	dirrep_ic_rdwr_panel_dec_c4[2] = ( dir_panel_icd_c4[4:3] == 2'd2 ); 
assign	dirrep_ic_rdwr_panel_dec_c4[3] = ( dir_panel_icd_c4[4:3] == 2'd3 ); 
 
assign	dirrep_ic_rdwr_row_en_c4[0] = (dir_panel_icd_c4[1:0] == 2'd0 ); 
assign	dirrep_ic_rdwr_row_en_c4[1] = (dir_panel_icd_c4[1:0] == 2'd1 ); 
assign	dirrep_ic_rdwr_row_en_c4[2] = (dir_panel_icd_c4[1:0] == 2'd2 ); 
assign	dirrep_ic_rdwr_row_en_c4[3] = (dir_panel_icd_c4[1:0] == 2'd3 ); 
 
// Dir changes  Bit 4 computation for inval case is different



l2t_dirrep_ctl_msff_ctl_macro__width_3 ff_inval_vld_c78910 
        (
        .scan_in(ff_inval_vld_c78910_scanin),
        .scan_out(ff_inval_vld_c78910_scanout),
        .din   ({arb_ic_inval_vld_c7,ic_inval_vld_c8,ic_inval_vld_c9}),
        .dout ({ic_inval_vld_c8,ic_inval_vld_c9,ic_inval_vld_c10}),
        .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        ) ;


assign ic_invalidation_bit4_flip = arb_ic_inval_vld_c7 | ic_inval_vld_c8 | ic_inval_vld_c9 | ic_inval_vld_c10;

// OLD :: assign arbadr_arbdp_ic_addr4_c4 = dir_panel_icd_c4[0];

assign arbadr_arbdp_ic_addr4_c4_fnl = ic_invalidation_bit4_flip ? ~dir_panel_icd_c4[0] : dir_panel_icd_c4[0] ;

//assign arbadr_arbdp_ic_addr4_c4 = dirrep_ic_rd_en_c4 ? arb_dc_ic_rd_bit_4 : arbadr_arbdp_ic_addr4_c4_fnl ;

assign arbadr_arbdp_ic_addr4_c4 = arbadr_arbdp_ic_addr4_c4_fnl ;
assign arbadr_arbdp_index_ic_addr4_c4 = arb_dc_ic_rd_bit_4_c4 ;



/////////////////////////////////////////////////////////// 
// lkup  row and panel enables. 
// Lkup row coming from tagd corresponds to 
// address bits <10:8> of the lkup address. 
// The bits <10:9> actually go into determining 
// the panel id within the directory.  
/////////////////////////////////////////////////////////// 
 
l2t_dirrep_ctl_msff_ctl_macro__width_3 ff_lkup_row_addr_dcd_c4 
              (.dout   (lkup_row_addr_dcd_c4[2:0]), 
               .scan_in(ff_lkup_row_addr_dcd_c4_scanin),
               .scan_out(ff_lkup_row_addr_dcd_c4_scanout),
               .din (tagd_lkup_row_addr_dcd_c3[2:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign	dirrep_dc_lkup_panel_dec_c4[0] = ( lkup_row_addr_dcd_c4[1:0] == 2'd0 ); 
assign	dirrep_dc_lkup_panel_dec_c4[1] = ( lkup_row_addr_dcd_c4[1:0] == 2'd1 ); 
assign	dirrep_dc_lkup_panel_dec_c4[2] = ( lkup_row_addr_dcd_c4[1:0] == 2'd2 ); 
assign	dirrep_dc_lkup_panel_dec_c4[3] = ( lkup_row_addr_dcd_c4[1:0] == 2'd3 ); 
 
 
l2t_dirrep_ctl_msff_ctl_macro__width_4 ff_lkup_bank_ena_dcd_c4 
              (.dout   (dirrep_dc_lkup_row_dec_c4[3:0]), 
               .scan_in(ff_lkup_bank_ena_dcd_c4_scanin),
               .scan_out(ff_lkup_bank_ena_dcd_c4_scanout),
               .din (arb_lkup_bank_ena_dcd_c3[3:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
l2t_dirrep_ctl_msff_ctl_macro__width_3 ff_lkup_row_addr_icd_c4 
              (.dout   (lkup_row_addr_icd_c4[2:0]), 
               .scan_in(ff_lkup_row_addr_icd_c4_scanin),
               .scan_out(ff_lkup_row_addr_icd_c4_scanout),
               .din (tagd_lkup_row_addr_icd_c3[2:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
assign	dirrep_ic_lkup_panel_dec_c4[0] = ( lkup_row_addr_icd_c4[1:0] == 2'd0 ); 
assign	dirrep_ic_lkup_panel_dec_c4[1] = ( lkup_row_addr_icd_c4[1:0] == 2'd1 ); 
assign	dirrep_ic_lkup_panel_dec_c4[2] = ( lkup_row_addr_icd_c4[1:0] == 2'd2 ); 
assign	dirrep_ic_lkup_panel_dec_c4[3] = ( lkup_row_addr_icd_c4[1:0] == 2'd3 ); 
 
l2t_dirrep_ctl_msff_ctl_macro__width_4 ff_lkup_bank_ena_icd_c4 
              (.dout   (dirrep_ic_lkup_row_dec_c4[3:0]), 
               .scan_in(ff_lkup_bank_ena_icd_c4_scanin),
               .scan_out(ff_lkup_bank_ena_icd_c4_scanout),
               .din (arb_lkup_bank_ena_icd_c3[3:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
l2t_dirrep_ctl_msff_ctl_macro__width_5 ff_wr_dc_dir_entry_c4  // BS and SR 11/18/03 Reverse Directory change
              (.dout   (dirrep_wr_dc_dir_entry_c4[4:0]), 
               .scan_in(ff_wr_dc_dir_entry_c4_scanin),
               .scan_out(ff_wr_dc_dir_entry_c4_scanout),
               .din (arb_wr_dc_dir_entry_c3[4:0]),  // BS and SR 11/18/03 Reverse Directory change
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
l2t_dirrep_ctl_msff_ctl_macro__width_5 ff_wr_ic_dir_entry_c4  // BS and SR 11/18/03 Reverse Directory change
              (.dout   (dirrep_wr_ic_dir_entry_c4[4:0]), 
               .scan_in(ff_wr_ic_dir_entry_c4_scanin),
               .scan_out(ff_wr_ic_dir_entry_c4_scanout),
               .din (arb_wr_ic_dir_entry_c3[4:0]), // BS and SR 11/18/03 Reverse Directory change 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
/////////////////////////////////////////////////////////// 
// Dir clear bits. 
/////////////////////////////////////////////////////////// 
 
l2t_dirrep_ctl_msff_ctl_macro__width_1 ff_ic_dir_clear_c4 
              (.dout   (dirrep_ic_dir_clear_c4), 
               .scan_in(ff_ic_dir_clear_c4_scanin),
               .scan_out(ff_ic_dir_clear_c4_scanout),
               .din (reset_dir_cams_c3), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 
 
 
l2t_dirrep_ctl_msff_ctl_macro__width_1 ff_dc_dir_clear_c4 
              (.dout   (dirrep_dc_dir_clear_c4), 
               .scan_in(ff_dc_dir_clear_c4_scanin),
               .scan_out(ff_dc_dir_clear_c4_scanout),
               .din (reset_dir_cams_c3), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 

assign fnl_csr_oneshot_dir_clear_c3 =  l2t_mb0_run_r1 ? 1'b0 : csr_oneshot_dir_clear_c3;

assign reset_dir_cams_c3 = fnl_csr_oneshot_dir_clear_c3 | ~por_l;
 

l2t_dirrep_ctl_msff_ctl_macro__width_1 ff_l2t_mb0_run 
              (.dout   (l2t_mb0_run_r1),
               .scan_in(ff_l2t_mb0_run_scanin),
               .scan_out(ff_l2t_mb0_run_scanout),
               .din (l2t_mb0_run),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
              ) ;





 
 
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign ff_dir_error_c8_scanin    = spares_scanout           ;
assign ff_wr_par_c4_scanin       = ff_dir_error_c8_scanout  ;
assign ff_dir_vld_dcd_c4_l_scanin = ff_wr_par_c4_scanout     ;
assign ff_dc_rd_en_c4_scanin     = ff_dir_vld_dcd_c4_l_scanout;
assign ff_ic_rd_en_c4_scanin     = ff_dc_rd_en_c4_scanout   ;
assign ff_dc_wr_en_c4_scanin     = ff_ic_rd_en_c4_scanout   ;
assign ff_ic_wr_en_c4_scanin     = ff_dc_wr_en_c4_scanout   ;
assign ff_inval_mask_dcd_c4_scanin = ff_ic_wr_en_c4_scanout   ;
assign ff_inval_mask_icd_c4_scanin = ff_inval_mask_dcd_c4_scanout;
assign ff_dir_panel_dcd_c4_scanin = ff_inval_mask_icd_c4_scanout;
assign ff_inval_addrbit4_c4_scanin = ff_dir_panel_dcd_c4_scanout;
assign ff_dir_panel_icd_c4_scanin = ff_inval_addrbit4_c4_scanout;
assign ff_inval_vld_c78910_scanin = ff_dir_panel_icd_c4_scanout;
assign ff_lkup_row_addr_dcd_c4_scanin = ff_inval_vld_c78910_scanout;
assign ff_lkup_bank_ena_dcd_c4_scanin = ff_lkup_row_addr_dcd_c4_scanout;
assign ff_lkup_row_addr_icd_c4_scanin = ff_lkup_bank_ena_dcd_c4_scanout;
assign ff_lkup_bank_ena_icd_c4_scanin = ff_lkup_row_addr_icd_c4_scanout;
assign ff_wr_dc_dir_entry_c4_scanin = ff_lkup_bank_ena_icd_c4_scanout;
assign ff_wr_ic_dir_entry_c4_scanin = ff_wr_dc_dir_entry_c4_scanout;
assign ff_ic_dir_clear_c4_scanin = ff_wr_ic_dir_entry_c4_scanout;
assign ff_dc_dir_clear_c4_scanin = ff_ic_dir_clear_c4_scanout;
assign ff_l2t_mb0_run_scanin     = ff_dc_dir_clear_c4_scanout;
assign scan_out                  = ff_l2t_mb0_run_scanout   ;
// fixscan end:
endmodule 







// any PARAMS parms go into naming of macro

module l2t_dirrep_ctl_l1clkhdr_ctl_macro (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module l2t_dirrep_ctl_spare_ctl_macro__num_5 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));
assign scan_out = so_4;



endmodule






// any PARAMS parms go into naming of macro

module l2t_dirrep_ctl_msff_ctl_macro__width_1 (
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
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_dirrep_ctl_msff_ctl_macro__width_8 (
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

module l2t_dirrep_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_dirrep_ctl_msff_ctl_macro__width_11 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [10:0] fdin;
wire [9:0] so;

  input [10:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [10:0] dout;
  output scan_out;
assign fdin[10:0] = din[10:0];






dff #(11)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10:0]),
.si({scan_in,so[9:0]}),
.so({so[9:0],scan_out}),
.q(dout[10:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_dirrep_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  input [0:0] din2;
  input sel2;
  input [0:0] din3;
  input sel3;
  output [0:0] dout;





assign dout[0:0] = ( {1{sel0}} & din0[0:0] ) |
                       ( {1{sel1}} & din1[0:0]) |
                       ( {1{sel2}} & din2[0:0]) |
                       ( {1{sel3}} & din3[0:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_dirrep_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_dirrep_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_dirrep_ctl_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule








