// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2b.v
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
module l2b (
  l2t_l2b_fbrd_en_c3, 
  l2t_l2b_fbrd_wl_c3, 
  l2t_l2b_fbwr_wen_r2, 
  l2t_l2b_fbwr_wl_r2, 
  l2t_l2b_fbd_stdatasel_c3, 
  l2t_l2b_stdecc_c2, 
  l2t_l2b_evict_en_r0, 
  l2t_l2b_wbwr_wen_c6, 
  l2t_l2b_wbwr_wl_c6, 
  l2t_l2b_wbrd_en_r0, 
  l2t_l2b_wbrd_wl_r0, 
  l2t_l2b_ev_dword_r0, 
  l2t_l2b_rdma_wren_s2, 
  l2t_l2b_rdma_wrwl_s2, 
  l2t_l2b_rdma_rden_r0, 
  l2t_l2b_rdma_rdwl_r0, 
  l2t_l2b_ctag_en_c7, 
  l2t_l2b_ctag_c7, 
  l2t_l2b_req_en_c7, 
  l2t_l2b_word_c7, 
  l2t_l2b_word_vld_c7, 
  sii_l2t_req, 
  sii_l2b_ecc, 
  l2b_sio_ctag_vld, 
  l2b_sio_data, 
  l2b_sio_ue_err, 
  l2b_l2t_rdma_uerr_c10, 
  l2b_l2t_rdma_cerr_c10, 
  l2b_l2t_rdma_notdata_c10, 
  l2b_l2t_ev_uerr_r5, 
  l2b_l2t_ev_cerr_r5, 
  l2b_sio_parity, 
  l2d_l2b_decc_out_c7, 
  l2b_l2d_fbdecc_c4, 
  mcu_l2b_data_r2, 
  mcu_l2b_ecc_r2, 
  select_delay_mcu, 
  l2b_evict_l2b_mcu_data_mecc_r5, 
  evict_l2b_mcu_wr_data_r5, 
  evict_l2b_mcu_data_vld_r5, 
  gclk, 
  rst_por_, 
  rst_wmr_, 
  rst_wmr_protect, 
  scan_in, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_muxtest, 
  tcu_dectest, 
  ccu_slow_cmp_sync_en, 
  ccu_cmp_slow_sync_en, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_array_wr_inhibit, 
  tcu_atpg_mode, 
  tcu_array_bypass, 
  scan_out, 
  cluster_arst_l, 
  tcu_mbist_bisi_en, 
  tcu_l2b_mbist_start, 
  l2b_tcu_mbist_done, 
  l2b_tcu_mbist_fail, 
  tcu_l2b_mbist_scan_in, 
  tcu_mbist_user_mode, 
  l2b_tcu_mbist_scan_out, 
  l2b_dbg_sio_ctag_vld, 
  l2b_dbg_sio_ack_type, 
  l2b_dbg_sio_ack_dest, 
  l2b_l2d_rvalue, 
  l2b_l2d_rid, 
  l2b_l2d_wr_en, 
  l2b_l2d_fuse_clr, 
  l2d_l2b_fuse_read_data, 
  efu_l2b_fuse_data, 
  efu_l2b_fuse_xfer_en, 
  efu_l2b_fuse_clr, 
  l2b_efu_fuse_xfer_en, 
  l2b_efu_fuse_data);
wire tcu_se_scancollar_out_unused;
wire tcu_array_bypass_unused;
wire [3:1] l2t_l2b_wbwr_wen_c6_unused;
wire array_wr_inhibit;
wire aclk;
wire bclk;
wire clock_header_scanout;
wire pce_ov;
wire wmr_protect_unused;
wire wmr_l;
wire por_l_unused;
wire cmp_io_sync_en;
wire io_cmp_sync_en;
wire unused;
wire clock_header_scanin;
wire mbist_run;
wire [2:0] mbist_addr;
wire mbist_wb_array_wr_en;
wire mbist_wb_array_rd_en;
wire mbist_rdma_array_wr_en;
wire mbist_rdma_array_rd_en;
wire mbist_fb_array_wr_en;
wire mbist_fb_array_rd_en;
wire mbist_sel_wb_arrays;
wire [4:0] mbist_evict_muxsel;
wire [15:0] fbuf_mux_sel;
wire [2:0] mbist_compare_read_sel_unused;
wire rdma_mbist_enable;
wire [7:0] rdma_mbist_data_in;
wire fb_mbist_enable;
wire [7:0] fb_mbist_data_in;
wire wb_mbist_enable;
wire [7:0] wb_mbist_data_in;
wire wb_or_rdma_rw_fail;
wire fb_rw_fail;
wire fbd_scanin;
wire fbd_scanout;
wire [159:0] fb_array4_dout;
wire [159:0] fb_array3_dout;
wire [159:0] fb_array2_dout;
wire [159:0] fb_array1_dout;
wire fillbf_l2t_l2b_fbwr_wren_r3_v4;
wire fillbf_l2t_l2b_fbwr_wren_r3_v3;
wire fillbf_l2t_l2b_fbwr_wren_r3_v2;
wire fillbf_l2t_l2b_fbwr_wren_r3_v1;
wire [159:0] fb_array4_din;
wire fb_array4_scanin;
wire fb_array4_scanout;
wire [159:0] fb_array3_din;
wire fb_array3_scanin;
wire fb_array3_scanout;
wire [159:0] fb_array2_din;
wire fb_array2_scanin;
wire fb_array2_scanout;
wire [159:0] fb_array1_din;
wire fb_array1_scanin;
wire fb_array1_scanout;
wire rdmard_scanin;
wire rdmard_scanout;
wire [159:0] wb_array4_dout;
wire [159:0] wb_array4_din;
wire evict_l2t_l2b_wbrd_en_r1_v4;
wire wb_array4_scanin;
wire wb_array4_scanout;
wire [159:0] wb_array3_dout;
wire [159:0] wb_array3_din;
wire evict_l2t_l2b_wbrd_en_r1_v3;
wire wb_array3_scanin;
wire wb_array3_scanout;
wire [159:0] wb_array2_dout;
wire [159:0] wb_array2_din;
wire evict_l2t_l2b_wbrd_en_r1_v2;
wire wb_array2_scanin;
wire wb_array2_scanout;
wire [159:0] wb_array1_dout;
wire [159:0] wb_array1_din;
wire evict_l2t_l2b_wbrd_en_r1_v1;
wire wb_array1_scanin;
wire wb_array1_scanout;
wire evict_l2t_l2b_rdma_rden_r1_v1;
wire evict_l2t_l2b_rdma_rden_r1_v2;
wire evict_l2t_l2b_rdma_rden_r1_v3;
wire evict_l2t_l2b_rdma_rden_r1_v4;
wire evict_l2t_l2b_rdma_wren_s3_v4;
wire evict_l2t_l2b_rdma_wren_s3_v3;
wire evict_l2t_l2b_rdma_wren_s3_v2;
wire evict_l2t_l2b_rdma_wren_s3_v1;
wire evict_scanin;
wire evict_scanout;
wire siu_interface_scanin;
wire siu_interface_scanout;
wire [159:0] rdma_array4_dout;
wire [159:0] rdma_array4_din;
wire rdma_array4_scanin;
wire rdma_array4_scanout;
wire [159:0] rdma_array3_dout;
wire [159:0] rdma_array3_din;
wire rdma_array3_scanin;
wire rdma_array3_scanout;
wire [159:0] rdma_array2_dout;
wire [159:0] rdma_array2_din;
wire rdma_array2_scanin;
wire rdma_array2_scanout;
wire [159:0] rdma_array1_dout;
wire [159:0] rdma_array1_din;
wire rdma_array1_scanin;
wire rdma_array1_scanout;
wire l2d_sram_hdr_scanin;
wire l2d_sram_hdr_scanout;


//////////////////////////////////////////////////////////////////////////////
// Interface with l2t
//////////////////////////////////////////////////////////////////////////////

input           l2t_l2b_fbrd_en_c3;   	// PINDEF:RIGHT // rd en for a fill operation or fb bypass
input   [2:0]   l2t_l2b_fbrd_wl_c3 ;  	// PINDEF:RIGHT // read entry
input   [15:0]  l2t_l2b_fbwr_wen_r2 ; 	// PINDEF:RIGHT // mcu Fill or store in OFF mode.
input   [2:0]   l2t_l2b_fbwr_wl_r2 ;  	// PINDEF:RIGHT // mcu Fill entry.
input           l2t_l2b_fbd_stdatasel_c3; // PINDEF:RIGHT 	// select store data in OFF mode
input   [77:0]  l2t_l2b_stdecc_c2;    	// PINDEF:BOT // store data goes to l2b and l2d
input           l2t_l2b_evict_en_r0;	// PINDEF:RIGHT
input   [3:0]   l2t_l2b_wbwr_wen_c6;  	// PINDEF:RIGHT // write en
input   [2:0]   l2t_l2b_wbwr_wl_c6;   	// PINDEF:RIGHT // from wbctl
input           l2t_l2b_wbrd_en_r0;   	// PINDEF:RIGHT // triggerred by a wr_ack from mcu
input   [2:0]   l2t_l2b_wbrd_wl_r0;	// PINDEF:RIGHT
input   [2:0]   l2t_l2b_ev_dword_r0;	// PINDEF:RIGHT
input   [15:0]  l2t_l2b_rdma_wren_s2;	// PINDEF:RIGHT
input   [ 1:0]  l2t_l2b_rdma_wrwl_s2;	// PINDEF:RIGHT
input           l2t_l2b_rdma_rden_r0;	// PINDEF:RIGHT
input   [ 1:0]  l2t_l2b_rdma_rdwl_r0;	// PINDEF:RIGHT
input           l2t_l2b_ctag_en_c7;	// PINDEF:RIGHT
input   [31:0]  l2t_l2b_ctag_c7;	// PINDEF:BOT	//Ctag<23:0>= {Ordered,PES bits,read bit, tag[15:0]} Phase 2 : SIU inteface and packet format change 2/7/04
input           l2t_l2b_req_en_c7;	// PINDEF:RIGHT
input   [ 3:0]  l2t_l2b_word_c7;	// PINDEF:RIGHT
input           l2t_l2b_word_vld_c7;	// PINDEF:RIGHT

input   [31:0]  sii_l2t_req;		// PINDEF:BOT
input   [ 6:0]  sii_l2b_ecc;		// PINDEF:BOT

output          l2b_sio_ctag_vld;	// PINDEF:RIGHT
output  [31:0]  l2b_sio_data;		// PINDEF:BOT
output          l2b_sio_ue_err;		// PINDEF:RIGHT
output          l2b_l2t_rdma_uerr_c10;	// PINDEF:RIGHT
output          l2b_l2t_rdma_cerr_c10;	// PINDEF:RIGHT
output		l2b_l2t_rdma_notdata_c10; // PINDEF:RIGHT
output          l2b_l2t_ev_uerr_r5;	// PINDEF:RIGHT
output          l2b_l2t_ev_cerr_r5;	// PINDEF:RIGHT

//  Phase 2 : SIU interface changes : 2/5/04 
output	[1:0]	l2b_sio_parity;		// PINDEF:RIGHT 

//////////////////////////////////////////////////////////////////////////////
// Interface with l2d
//////////////////////////////////////////////////////////////////////////////
input   [623:0]  l2d_l2b_decc_out_c7;  // PINDEF:TOP
output  [623:0]  l2b_l2d_fbdecc_c4;	// PINDEF:TOP 
//////////////////////////////////////////////////////////////////////////////
// Interface with the DRAM
//////////////////////////////////////////////////////////////////////////////

input   [127:0]  mcu_l2b_data_r2;	// PINDEF:BOT
input   [27:0]   mcu_l2b_ecc_r2;	// PINDEF:BOT
input		select_delay_mcu;

output           l2b_evict_l2b_mcu_data_mecc_r5;	// PINDEF:BOT
output  [63:0]   evict_l2b_mcu_wr_data_r5;	// PINDEF:BOT
output           evict_l2b_mcu_data_vld_r5;	// PINDEF:BOT
//////////////////////////////////////////////////////////////////////////////
// Global Signals
//////////////////////////////////////////////////////////////////////////////

input		 gclk;
input            rst_por_;	
input            rst_wmr_;	
input            rst_wmr_protect;	
input		 scan_in;	
input		 tcu_pce_ov;
input		 tcu_clk_stop;
input		 tcu_aclk;
input		 tcu_bclk;
input		 tcu_scan_en;
input		 tcu_muxtest;
input		 tcu_dectest;
input           ccu_slow_cmp_sync_en;
input           ccu_cmp_slow_sync_en;


input            tcu_se_scancollar_in;
input            tcu_se_scancollar_out;
input            tcu_array_wr_inhibit;
input            tcu_atpg_mode;
input            tcu_array_bypass;

output           scan_out;		
input		 cluster_arst_l;

// Mbist pins
input 		tcu_mbist_bisi_en;
input 		tcu_l2b_mbist_start;
output		l2b_tcu_mbist_done;
output		l2b_tcu_mbist_fail;
input 		tcu_l2b_mbist_scan_in;
input 		tcu_mbist_user_mode;
output		l2b_tcu_mbist_scan_out;

// Debug ports
output		l2b_dbg_sio_ctag_vld;
output		l2b_dbg_sio_ack_type;
output		l2b_dbg_sio_ack_dest;
//////////////////////////////////////////////////////////////////////////////
// Efuse related ports
//////////////////////////////////////////////////////////////////////////////
// to l2d fuse related ports
output	[9:0]	l2b_l2d_rvalue;
output	[6:0]	l2b_l2d_rid;
output		l2b_l2d_wr_en;
output		l2b_l2d_fuse_clr;

// from l2d fuse related ports
input	[9:0]	l2d_l2b_fuse_read_data;

// efu to l2b
input		efu_l2b_fuse_data;
input		efu_l2b_fuse_xfer_en;
input		efu_l2b_fuse_clr;


// l2b to efu
output		l2b_efu_fuse_xfer_en;
output		l2b_efu_fuse_data;

//////////////////////////////////////////////////////////////////////////////

wire	         l2clk;

wire             fillbf_l2t_l2b_fbrd_en_c3_v1;
wire             fillbf_l2t_l2b_fbrd_en_c3_v2;
wire             fillbf_l2t_l2b_fbrd_en_c3_v3;
wire             fillbf_l2t_l2b_fbrd_en_c3_v4;
wire   [  2:0]   fillbf_l2t_l2b_fbrd_wl_c3_v1;
wire   [  2:0]   fillbf_l2t_l2b_fbrd_wl_c3_v2;
wire   [  2:0]   fillbf_l2t_l2b_fbrd_wl_c3_v3;
wire   [  2:0]   fillbf_l2t_l2b_fbrd_wl_c3_v4;
wire   [ 15:0]   fillbf_l2t_l2b_fbwr_wen_r3;
wire   [  2:0]   fillbf_l2t_l2b_fbwr_wl_r3_v1;
wire   [  2:0]   fillbf_l2t_l2b_fbwr_wl_r3_v2;
wire   [  2:0]   fillbf_l2t_l2b_fbwr_wl_r3_v3;
wire   [  2:0]   fillbf_l2t_l2b_fbwr_wl_r3_v4;
wire   [623:0]   fillbf_fb_array_din;
//wire   [623:0]   l2b_l2d_fbdecc_c4;

wire   [  2:0]   evict_l2t_l2b_wbrd_wl_r1_v1;
wire   [  2:0]   evict_l2t_l2b_wbrd_wl_r1_v2;
wire   [  2:0]   evict_l2t_l2b_wbrd_wl_r1_v3;
wire   [  2:0]   evict_l2t_l2b_wbrd_wl_r1_v4;
wire             evict_l2t_l2b_wbwr_wen_c8_v1;
wire             evict_l2t_l2b_wbwr_wen_c8_v2;
wire             evict_l2t_l2b_wbwr_wen_c8_v3;
wire             evict_l2t_l2b_wbwr_wen_c8_v4;
wire   [  2:0]   evict_l2t_l2b_wbwr_wl_c8_v1;
wire   [  2:0]   evict_l2t_l2b_wbwr_wl_c8_v2;
wire   [  2:0]   evict_l2t_l2b_wbwr_wl_c8_v3;
wire   [  2:0]   evict_l2t_l2b_wbwr_wl_c8_v4;
//wire   [623:0]   l2d_l2b_decc_out_c7;
wire   [623:0]   wb_array_dout;

wire   [ 15:0]   evict_l2t_l2b_rdma_wren_s3;
wire   [  1:0]   evict_l2t_l2b_rdma_wrwl_s3_v1;
wire   [  1:0]   evict_l2t_l2b_rdma_wrwl_s3_v2;
wire   [  1:0]   evict_l2t_l2b_rdma_wrwl_s3_v3;
wire   [  1:0]   evict_l2t_l2b_rdma_wrwl_s3_v4;
wire   [  1:0]   evict_l2t_l2b_rdma_rdwl_r1_v1;
wire   [  1:0]   evict_l2t_l2b_rdma_rdwl_r1_v2;
wire   [  1:0]   evict_l2t_l2b_rdma_rdwl_r1_v3;
wire   [  1:0]   evict_l2t_l2b_rdma_rdwl_r1_v4;
wire   [623:0]   evict_rdma_array_din;
wire   [623:0]   rdma_array_dout;


wire   [15:0]    l2b_l2d_fbdecc_c4_unused ;
wire   [15:0]    wb_array_dout_unused ;
wire   [15:0]    rdma_array_dout_unused ;

wire [6:0]              mb0_dcache_index_unused;
wire [1:0]              mb0_dcache_way_unused;
wire [7:0]              mb0_icache_index_unused;
wire [1:0]              mb0_icache_way_unused;
wire [7:0]              mb0_write_data_unused;


// vlint cleanup effort
assign tcu_se_scancollar_out_unused = tcu_se_scancollar_out;
assign tcu_array_bypass_unused = tcu_array_bypass;
assign l2t_l2b_wbwr_wen_c6_unused[3:1] = l2t_l2b_wbwr_wen_c6[3:1];


////////////////////////////////////////////////////////////////////////////////


clkgen_l2b_cmp clock_header 
	( 
	.tcu_wr_inhibit		(tcu_array_wr_inhibit	),
	.tcu_atpg_mode		(tcu_atpg_mode	),
	.array_wr_inhibit	(array_wr_inhibit	),
        .l2clk			(l2clk			),
        .aclk			(aclk			),
        .bclk			(bclk			),
        .scan_out		(clock_header_scanout	),
        .pce_ov			(pce_ov			),
        .wmr_protect		(wmr_protect_unused	),
        .wmr_			(wmr_l			),
        .por_			(por_l_unused		),
        .cmp_slow_sync_en	(cmp_io_sync_en		),
        .slow_cmp_sync_en	(io_cmp_sync_en		),
	.cluster_arst_l		(cluster_arst_l		),
	.aclk_wmr		(unused			),
        .tcu_clk_stop		(tcu_clk_stop		),
        .tcu_pce_ov		(tcu_pce_ov		),
        .rst_wmr_protect	(rst_wmr_protect	),
        .rst_wmr_		(rst_wmr_		),
        .rst_por_		(rst_por_		),
        .ccu_cmp_slow_sync_en	(ccu_cmp_slow_sync_en	),
        .ccu_slow_cmp_sync_en	(ccu_slow_cmp_sync_en	),
        .tcu_div_bypass		(1'b0			),
        .ccu_div_ph		(1'b1			),
        .cluster_div_en		(1'b0			),
        .clk_ext		(1'b0			),
        .ccu_serdes_dtm		(1'b0			),
        .gclk			(gclk			),
        .tcu_aclk		(tcu_aclk		),
        .tcu_bclk		(tcu_bclk		),
        .scan_en		(tcu_scan_en		),
        .scan_in                (clock_header_scanin	)
	);


l2b_mb0_ctl mb0 (
        .mbist_run                              (mbist_run), 
        .mbist_addr                             (mbist_addr[2:0]),
        .mbist_wb_array_wr_en                   (mbist_wb_array_wr_en),
        .mbist_wb_array_rd_en                   (mbist_wb_array_rd_en),
        .mbist_rdma_array_wr_en                 (mbist_rdma_array_wr_en),
        .mbist_rdma_array_rd_en                 (mbist_rdma_array_rd_en),
        .mbist_fb_array_wr_en                   (mbist_fb_array_wr_en),
        .mbist_fb_array_rd_en                   (mbist_fb_array_rd_en),
        .mbist_sel_wb_arrays                    (mbist_sel_wb_arrays),
        .mbist_cmpsel                           (mbist_evict_muxsel[4:0]),
        .fb_mux_sel				(fbuf_mux_sel[15:0]),
        .mbist_done                             (l2b_tcu_mbist_done),
        .mbist_fail                             (l2b_tcu_mbist_fail),
   	.mbist_compare_read_sel                 (mbist_compare_read_sel_unused[2:0]),
        .scan_in(tcu_l2b_mbist_scan_in),
        .scan_out(l2b_tcu_mbist_scan_out),
        .l2clk                                  (l2clk),
        .tcu_pce_ov                             (tcu_pce_ov),
        .tcu_clk_stop                           (1'b0),
        .tcu_aclk                               (tcu_aclk),
        .tcu_bclk                               (tcu_bclk),
        .tcu_scan_en                            (tcu_scan_en),
        .mbist_start                            (tcu_l2b_mbist_start),
        .mbist_user_mode                        (tcu_mbist_user_mode),
        .mbist_bisi_mode                        (tcu_mbist_bisi_en),
  	.rdma_mbist_enable 			(rdma_mbist_enable),
  	.rdma_mbist_data_in   			(rdma_mbist_data_in[7:0]),
  	.fb_mbist_enable 			(fb_mbist_enable),
  	.fb_mbist_data_in   			(fb_mbist_data_in[7:0]),
  	.wb_mbist_enable 			(wb_mbist_enable),
  	.wb_mbist_data_in   			(wb_mbist_data_in[7:0]),
        .wb_or_rdma_rw_fail                     (wb_or_rdma_rw_fail),
        .fb_rw_fail                             (fb_rw_fail)
	);




l2b_fillbf_dp fbd
 (//Inputs
  .scan_in(fbd_scanin),
  .scan_out(fbd_scanout),
  .l2clk                         (l2clk),
  .tcu_aclk		    (aclk),
  .tcu_bclk		    (bclk),
  .tcu_scan_en		    (tcu_scan_en),
  .tcu_pce_ov		    (tcu_pce_ov	),
  .select_delay_mcu		    (select_delay_mcu	),
  .tcu_clk_stop		    (1'b0),
  .l2t_l2b_fbrd_en_c3       (l2t_l2b_fbrd_en_c3),
  .l2t_l2b_fbrd_wl_c3       (l2t_l2b_fbrd_wl_c3[2:0]),
  .l2t_l2b_fbwr_wen_r2      (l2t_l2b_fbwr_wen_r2[15:0]),
  .l2t_l2b_fbwr_wl_r2       (l2t_l2b_fbwr_wl_r2[2:0]),
  .l2t_l2b_fbd_stdatasel_c3 (l2t_l2b_fbd_stdatasel_c3),
  .l2t_l2b_stdecc_c2        (l2t_l2b_stdecc_c2[77:0]),
  .mcu_l2b_data_r2           (mcu_l2b_data_r2[127:0]),
  .mcu_l2b_ecc_r2            (mcu_l2b_ecc_r2[27:0]),
  .mbist_addr		     (mbist_addr[2:0]   ),
  .mbist_run                 (mbist_run                ),               
  .mbist_fb_array_rd_en      (mbist_fb_array_rd_en),
  .fbuf_mux_sel	(fbuf_mux_sel[15:0]),
  // Outputs
   .l2b_l2d_fbdecc_c4	({fb_array4_dout[155:0],fb_array3_dout[155:0],
			  fb_array2_dout[155:0],fb_array1_dout[155:0]}),
  .fb_mbist_data		(fb_mbist_data_in[7:0]),
  .fillbf_l2t_l2b_fbrd_en_c3_v1    (fillbf_l2t_l2b_fbrd_en_c3_v1),
  .fillbf_l2t_l2b_fbrd_en_c3_v2    (fillbf_l2t_l2b_fbrd_en_c3_v2),
  .fillbf_l2t_l2b_fbrd_en_c3_v3    (fillbf_l2t_l2b_fbrd_en_c3_v3),
  .fillbf_l2t_l2b_fbrd_en_c3_v4    (fillbf_l2t_l2b_fbrd_en_c3_v4),
  .fillbf_l2t_l2b_fbrd_wl_c3_v1    (fillbf_l2t_l2b_fbrd_wl_c3_v1[2:0]),
  .fillbf_l2t_l2b_fbrd_wl_c3_v2    (fillbf_l2t_l2b_fbrd_wl_c3_v2[2:0]),
  .fillbf_l2t_l2b_fbrd_wl_c3_v3    (fillbf_l2t_l2b_fbrd_wl_c3_v3[2:0]),
  .fillbf_l2t_l2b_fbrd_wl_c3_v4    (fillbf_l2t_l2b_fbrd_wl_c3_v4[2:0]),
  .fillbf_l2t_l2b_fbwr_wen_r3      (fillbf_l2t_l2b_fbwr_wen_r3[15:0]),
  .fillbf_l2t_l2b_fbwr_wren_r3_v4  (fillbf_l2t_l2b_fbwr_wren_r3_v4),
  .fillbf_l2t_l2b_fbwr_wren_r3_v3  (fillbf_l2t_l2b_fbwr_wren_r3_v3),
  .fillbf_l2t_l2b_fbwr_wren_r3_v2  (fillbf_l2t_l2b_fbwr_wren_r3_v2),
  .fillbf_l2t_l2b_fbwr_wren_r3_v1  (fillbf_l2t_l2b_fbwr_wren_r3_v1),
  .fillbf_l2t_l2b_fbwr_wl_r3_v1    (fillbf_l2t_l2b_fbwr_wl_r3_v1[2:0]),
  .fillbf_l2t_l2b_fbwr_wl_r3_v2    (fillbf_l2t_l2b_fbwr_wl_r3_v2[2:0]),
  .fillbf_l2t_l2b_fbwr_wl_r3_v3    (fillbf_l2t_l2b_fbwr_wl_r3_v3[2:0]),
  .fillbf_l2t_l2b_fbwr_wl_r3_v4    (fillbf_l2t_l2b_fbwr_wl_r3_v4[2:0]),
  .fillbf_fb_array_din      (fillbf_fb_array_din[623:0]),
  .fb_rw_fail(fb_rw_fail),
  .mbist_fb_array_wr_en(mbist_fb_array_wr_en)
 );



assign {l2b_l2d_fbdecc_c4_unused[15:12],
    l2b_l2d_fbdecc_c4[351], l2b_l2d_fbdecc_c4[429], l2b_l2d_fbdecc_c4[507], l2b_l2d_fbdecc_c4[585],
    l2b_l2d_fbdecc_c4[352], l2b_l2d_fbdecc_c4[430], l2b_l2d_fbdecc_c4[508], l2b_l2d_fbdecc_c4[586],
    l2b_l2d_fbdecc_c4[353], l2b_l2d_fbdecc_c4[431], l2b_l2d_fbdecc_c4[509], l2b_l2d_fbdecc_c4[587],
    l2b_l2d_fbdecc_c4[354], l2b_l2d_fbdecc_c4[432], l2b_l2d_fbdecc_c4[510], l2b_l2d_fbdecc_c4[588],
    l2b_l2d_fbdecc_c4[355], l2b_l2d_fbdecc_c4[433], l2b_l2d_fbdecc_c4[511], l2b_l2d_fbdecc_c4[589],
    l2b_l2d_fbdecc_c4[356], l2b_l2d_fbdecc_c4[434], l2b_l2d_fbdecc_c4[512], l2b_l2d_fbdecc_c4[590],
    l2b_l2d_fbdecc_c4[357], l2b_l2d_fbdecc_c4[435], l2b_l2d_fbdecc_c4[513], l2b_l2d_fbdecc_c4[591],
    l2b_l2d_fbdecc_c4[358], l2b_l2d_fbdecc_c4[436], l2b_l2d_fbdecc_c4[514], l2b_l2d_fbdecc_c4[592],
    l2b_l2d_fbdecc_c4[359], l2b_l2d_fbdecc_c4[437], l2b_l2d_fbdecc_c4[515], l2b_l2d_fbdecc_c4[593]} = fb_array4_dout[159:120];

    assign {l2b_l2d_fbdecc_c4[360], l2b_l2d_fbdecc_c4[438], l2b_l2d_fbdecc_c4[516], l2b_l2d_fbdecc_c4[594],
    l2b_l2d_fbdecc_c4[361], l2b_l2d_fbdecc_c4[439], l2b_l2d_fbdecc_c4[517], l2b_l2d_fbdecc_c4[595],
    l2b_l2d_fbdecc_c4[362], l2b_l2d_fbdecc_c4[440], l2b_l2d_fbdecc_c4[518], l2b_l2d_fbdecc_c4[596],
    l2b_l2d_fbdecc_c4[363], l2b_l2d_fbdecc_c4[441], l2b_l2d_fbdecc_c4[519], l2b_l2d_fbdecc_c4[597],
    l2b_l2d_fbdecc_c4[364], l2b_l2d_fbdecc_c4[442], l2b_l2d_fbdecc_c4[520], l2b_l2d_fbdecc_c4[598],
    l2b_l2d_fbdecc_c4[365], l2b_l2d_fbdecc_c4[443], l2b_l2d_fbdecc_c4[521], l2b_l2d_fbdecc_c4[599],
    l2b_l2d_fbdecc_c4[366], l2b_l2d_fbdecc_c4[444], l2b_l2d_fbdecc_c4[522], l2b_l2d_fbdecc_c4[600],
    l2b_l2d_fbdecc_c4[367], l2b_l2d_fbdecc_c4[445], l2b_l2d_fbdecc_c4[523], l2b_l2d_fbdecc_c4[601],
    l2b_l2d_fbdecc_c4[368], l2b_l2d_fbdecc_c4[446], l2b_l2d_fbdecc_c4[524], l2b_l2d_fbdecc_c4[602],
    l2b_l2d_fbdecc_c4[369], l2b_l2d_fbdecc_c4[447], l2b_l2d_fbdecc_c4[525], l2b_l2d_fbdecc_c4[603]} = fb_array4_dout[119:80];

    assign {l2b_l2d_fbdecc_c4[370], l2b_l2d_fbdecc_c4[448], l2b_l2d_fbdecc_c4[526], l2b_l2d_fbdecc_c4[604],
    l2b_l2d_fbdecc_c4[371], l2b_l2d_fbdecc_c4[449], l2b_l2d_fbdecc_c4[527], l2b_l2d_fbdecc_c4[605],
    l2b_l2d_fbdecc_c4[372], l2b_l2d_fbdecc_c4[450], l2b_l2d_fbdecc_c4[528], l2b_l2d_fbdecc_c4[606],
    l2b_l2d_fbdecc_c4[373], l2b_l2d_fbdecc_c4[451], l2b_l2d_fbdecc_c4[529], l2b_l2d_fbdecc_c4[607],
    l2b_l2d_fbdecc_c4[374], l2b_l2d_fbdecc_c4[452], l2b_l2d_fbdecc_c4[530], l2b_l2d_fbdecc_c4[608],
    l2b_l2d_fbdecc_c4[375], l2b_l2d_fbdecc_c4[453], l2b_l2d_fbdecc_c4[531], l2b_l2d_fbdecc_c4[609],
    l2b_l2d_fbdecc_c4[376], l2b_l2d_fbdecc_c4[454], l2b_l2d_fbdecc_c4[532], l2b_l2d_fbdecc_c4[610],
    l2b_l2d_fbdecc_c4[377], l2b_l2d_fbdecc_c4[455], l2b_l2d_fbdecc_c4[533], l2b_l2d_fbdecc_c4[611],
    l2b_l2d_fbdecc_c4[378], l2b_l2d_fbdecc_c4[456], l2b_l2d_fbdecc_c4[534], l2b_l2d_fbdecc_c4[612],
    l2b_l2d_fbdecc_c4[379], l2b_l2d_fbdecc_c4[457], l2b_l2d_fbdecc_c4[535], l2b_l2d_fbdecc_c4[613] } = fb_array4_dout[79:40];

    assign {l2b_l2d_fbdecc_c4[380], l2b_l2d_fbdecc_c4[458], l2b_l2d_fbdecc_c4[536], l2b_l2d_fbdecc_c4[614],
    l2b_l2d_fbdecc_c4[381], l2b_l2d_fbdecc_c4[459], l2b_l2d_fbdecc_c4[537], l2b_l2d_fbdecc_c4[615],
    l2b_l2d_fbdecc_c4[382], l2b_l2d_fbdecc_c4[460], l2b_l2d_fbdecc_c4[538], l2b_l2d_fbdecc_c4[616],
    l2b_l2d_fbdecc_c4[383], l2b_l2d_fbdecc_c4[461], l2b_l2d_fbdecc_c4[539], l2b_l2d_fbdecc_c4[617],
    l2b_l2d_fbdecc_c4[384], l2b_l2d_fbdecc_c4[462], l2b_l2d_fbdecc_c4[540], l2b_l2d_fbdecc_c4[618],
    l2b_l2d_fbdecc_c4[385], l2b_l2d_fbdecc_c4[463], l2b_l2d_fbdecc_c4[541], l2b_l2d_fbdecc_c4[619],
    l2b_l2d_fbdecc_c4[386], l2b_l2d_fbdecc_c4[464], l2b_l2d_fbdecc_c4[542], l2b_l2d_fbdecc_c4[620],
    l2b_l2d_fbdecc_c4[387], l2b_l2d_fbdecc_c4[465], l2b_l2d_fbdecc_c4[543], l2b_l2d_fbdecc_c4[621],
    l2b_l2d_fbdecc_c4[388], l2b_l2d_fbdecc_c4[466], l2b_l2d_fbdecc_c4[544], l2b_l2d_fbdecc_c4[622],
    l2b_l2d_fbdecc_c4[389], l2b_l2d_fbdecc_c4[467], l2b_l2d_fbdecc_c4[545], l2b_l2d_fbdecc_c4[623]} = fb_array4_dout[39:0];

assign fb_array4_din[159:120] = {1'b0, 1'b0, 1'b0, 1'b0,
	     fillbf_fb_array_din[351], fillbf_fb_array_din[429], fillbf_fb_array_din[507], fillbf_fb_array_din[585],
             fillbf_fb_array_din[352], fillbf_fb_array_din[430], fillbf_fb_array_din[508], fillbf_fb_array_din[586],
             fillbf_fb_array_din[353], fillbf_fb_array_din[431], fillbf_fb_array_din[509], fillbf_fb_array_din[587],
             fillbf_fb_array_din[354], fillbf_fb_array_din[432], fillbf_fb_array_din[510], fillbf_fb_array_din[588],
             fillbf_fb_array_din[355], fillbf_fb_array_din[433], fillbf_fb_array_din[511], fillbf_fb_array_din[589],
             fillbf_fb_array_din[356], fillbf_fb_array_din[434], fillbf_fb_array_din[512], fillbf_fb_array_din[590],
             fillbf_fb_array_din[357], fillbf_fb_array_din[435], fillbf_fb_array_din[513], fillbf_fb_array_din[591],
             fillbf_fb_array_din[358], fillbf_fb_array_din[436], fillbf_fb_array_din[514], fillbf_fb_array_din[592],
             fillbf_fb_array_din[359], fillbf_fb_array_din[437], fillbf_fb_array_din[515], fillbf_fb_array_din[593]};

assign fb_array4_din[119:80] = 
	    {fillbf_fb_array_din[360], fillbf_fb_array_din[438], fillbf_fb_array_din[516], fillbf_fb_array_din[594],
             fillbf_fb_array_din[361], fillbf_fb_array_din[439], fillbf_fb_array_din[517], fillbf_fb_array_din[595],
             fillbf_fb_array_din[362], fillbf_fb_array_din[440], fillbf_fb_array_din[518], fillbf_fb_array_din[596],
             fillbf_fb_array_din[363], fillbf_fb_array_din[441], fillbf_fb_array_din[519], fillbf_fb_array_din[597],
             fillbf_fb_array_din[364], fillbf_fb_array_din[442], fillbf_fb_array_din[520], fillbf_fb_array_din[598],
             fillbf_fb_array_din[365], fillbf_fb_array_din[443], fillbf_fb_array_din[521], fillbf_fb_array_din[599],
             fillbf_fb_array_din[366], fillbf_fb_array_din[444], fillbf_fb_array_din[522], fillbf_fb_array_din[600],
             fillbf_fb_array_din[367], fillbf_fb_array_din[445], fillbf_fb_array_din[523], fillbf_fb_array_din[601],
             fillbf_fb_array_din[368], fillbf_fb_array_din[446], fillbf_fb_array_din[524], fillbf_fb_array_din[602],
             fillbf_fb_array_din[369], fillbf_fb_array_din[447], fillbf_fb_array_din[525], fillbf_fb_array_din[603]};

assign fb_array4_din[79:40] = {fillbf_fb_array_din[370], fillbf_fb_array_din[448], fillbf_fb_array_din[526], fillbf_fb_array_din[604],
             fillbf_fb_array_din[371], fillbf_fb_array_din[449], fillbf_fb_array_din[527], fillbf_fb_array_din[605],
             fillbf_fb_array_din[372], fillbf_fb_array_din[450], fillbf_fb_array_din[528], fillbf_fb_array_din[606],
             fillbf_fb_array_din[373], fillbf_fb_array_din[451], fillbf_fb_array_din[529], fillbf_fb_array_din[607],
             fillbf_fb_array_din[374], fillbf_fb_array_din[452], fillbf_fb_array_din[530], fillbf_fb_array_din[608],
             fillbf_fb_array_din[375], fillbf_fb_array_din[453], fillbf_fb_array_din[531], fillbf_fb_array_din[609],
             fillbf_fb_array_din[376], fillbf_fb_array_din[454], fillbf_fb_array_din[532], fillbf_fb_array_din[610],
             fillbf_fb_array_din[377], fillbf_fb_array_din[455], fillbf_fb_array_din[533], fillbf_fb_array_din[611],
             fillbf_fb_array_din[378], fillbf_fb_array_din[456], fillbf_fb_array_din[534], fillbf_fb_array_din[612],
             fillbf_fb_array_din[379], fillbf_fb_array_din[457], fillbf_fb_array_din[535], fillbf_fb_array_din[613]};

assign fb_array4_din[39:0] = {fillbf_fb_array_din[380], fillbf_fb_array_din[458], fillbf_fb_array_din[536], fillbf_fb_array_din[614],
             fillbf_fb_array_din[381], fillbf_fb_array_din[459], fillbf_fb_array_din[537], fillbf_fb_array_din[615],
             fillbf_fb_array_din[382], fillbf_fb_array_din[460], fillbf_fb_array_din[538], fillbf_fb_array_din[616],
             fillbf_fb_array_din[383], fillbf_fb_array_din[461], fillbf_fb_array_din[539], fillbf_fb_array_din[617],
             fillbf_fb_array_din[384], fillbf_fb_array_din[462], fillbf_fb_array_din[540], fillbf_fb_array_din[618],
             fillbf_fb_array_din[385], fillbf_fb_array_din[463], fillbf_fb_array_din[541], fillbf_fb_array_din[619],
             fillbf_fb_array_din[386], fillbf_fb_array_din[464], fillbf_fb_array_din[542], fillbf_fb_array_din[620],
             fillbf_fb_array_din[387], fillbf_fb_array_din[465], fillbf_fb_array_din[543], fillbf_fb_array_din[621],
             fillbf_fb_array_din[388], fillbf_fb_array_din[466], fillbf_fb_array_din[544], fillbf_fb_array_din[622],
             fillbf_fb_array_din[389], fillbf_fb_array_din[467], fillbf_fb_array_din[545], fillbf_fb_array_din[623]};


n2_l2t_dp_16x160_cust  fb_array4
  (.dout   ( fb_array4_dout),
   .din    ( fb_array4_din ),
   .rd_adr   ({1'b0, fillbf_l2t_l2b_fbrd_wl_c3_v4[2:0]}),
   .wr_adr   ({1'b0, fillbf_l2t_l2b_fbwr_wl_r3_v4[2:0]}),
   .read_en  (fillbf_l2t_l2b_fbrd_en_c3_v4),
   .wr_en    (fillbf_l2t_l2b_fbwr_wren_r3_v4),
   .word_wen ({fillbf_l2t_l2b_fbwr_wen_r3[6], fillbf_l2t_l2b_fbwr_wen_r3[4],
               fillbf_l2t_l2b_fbwr_wen_r3[2], fillbf_l2t_l2b_fbwr_wen_r3[0]}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(fb_array4_scanin),
   .scan_out(fb_array4_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
   .tcu_scan_en(tcu_scan_en),
   .mbist_run	(fb_mbist_enable),
   .mbist_wdata	(fb_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit (array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));

assign {l2b_l2d_fbdecc_c4_unused[11:8],
             l2b_l2d_fbdecc_c4[312], l2b_l2d_fbdecc_c4[390], l2b_l2d_fbdecc_c4[468], l2b_l2d_fbdecc_c4[546],
             l2b_l2d_fbdecc_c4[313], l2b_l2d_fbdecc_c4[391], l2b_l2d_fbdecc_c4[469], l2b_l2d_fbdecc_c4[547],
             l2b_l2d_fbdecc_c4[314], l2b_l2d_fbdecc_c4[392], l2b_l2d_fbdecc_c4[470], l2b_l2d_fbdecc_c4[548],
             l2b_l2d_fbdecc_c4[315], l2b_l2d_fbdecc_c4[393], l2b_l2d_fbdecc_c4[471], l2b_l2d_fbdecc_c4[549],
             l2b_l2d_fbdecc_c4[316], l2b_l2d_fbdecc_c4[394], l2b_l2d_fbdecc_c4[472], l2b_l2d_fbdecc_c4[550],
             l2b_l2d_fbdecc_c4[317], l2b_l2d_fbdecc_c4[395], l2b_l2d_fbdecc_c4[473], l2b_l2d_fbdecc_c4[551],
             l2b_l2d_fbdecc_c4[318], l2b_l2d_fbdecc_c4[396], l2b_l2d_fbdecc_c4[474], l2b_l2d_fbdecc_c4[552],
             l2b_l2d_fbdecc_c4[319], l2b_l2d_fbdecc_c4[397], l2b_l2d_fbdecc_c4[475], l2b_l2d_fbdecc_c4[553],
             l2b_l2d_fbdecc_c4[320], l2b_l2d_fbdecc_c4[398], l2b_l2d_fbdecc_c4[476], l2b_l2d_fbdecc_c4[554],
             l2b_l2d_fbdecc_c4[321], l2b_l2d_fbdecc_c4[399], l2b_l2d_fbdecc_c4[477], l2b_l2d_fbdecc_c4[555],
             l2b_l2d_fbdecc_c4[322], l2b_l2d_fbdecc_c4[400], l2b_l2d_fbdecc_c4[478], l2b_l2d_fbdecc_c4[556],
             l2b_l2d_fbdecc_c4[323], l2b_l2d_fbdecc_c4[401], l2b_l2d_fbdecc_c4[479], l2b_l2d_fbdecc_c4[557],
             l2b_l2d_fbdecc_c4[324], l2b_l2d_fbdecc_c4[402], l2b_l2d_fbdecc_c4[480], l2b_l2d_fbdecc_c4[558],
             l2b_l2d_fbdecc_c4[325], l2b_l2d_fbdecc_c4[403], l2b_l2d_fbdecc_c4[481], l2b_l2d_fbdecc_c4[559],
             l2b_l2d_fbdecc_c4[326], l2b_l2d_fbdecc_c4[404], l2b_l2d_fbdecc_c4[482], l2b_l2d_fbdecc_c4[560],
             l2b_l2d_fbdecc_c4[327], l2b_l2d_fbdecc_c4[405], l2b_l2d_fbdecc_c4[483], l2b_l2d_fbdecc_c4[561],
             l2b_l2d_fbdecc_c4[328], l2b_l2d_fbdecc_c4[406], l2b_l2d_fbdecc_c4[484], l2b_l2d_fbdecc_c4[562],
             l2b_l2d_fbdecc_c4[329], l2b_l2d_fbdecc_c4[407], l2b_l2d_fbdecc_c4[485], l2b_l2d_fbdecc_c4[563],
             l2b_l2d_fbdecc_c4[330], l2b_l2d_fbdecc_c4[408], l2b_l2d_fbdecc_c4[486], l2b_l2d_fbdecc_c4[564],
             l2b_l2d_fbdecc_c4[331], l2b_l2d_fbdecc_c4[409], l2b_l2d_fbdecc_c4[487], l2b_l2d_fbdecc_c4[565],
             l2b_l2d_fbdecc_c4[332], l2b_l2d_fbdecc_c4[410], l2b_l2d_fbdecc_c4[488], l2b_l2d_fbdecc_c4[566],
             l2b_l2d_fbdecc_c4[333], l2b_l2d_fbdecc_c4[411], l2b_l2d_fbdecc_c4[489], l2b_l2d_fbdecc_c4[567],
             l2b_l2d_fbdecc_c4[334], l2b_l2d_fbdecc_c4[412], l2b_l2d_fbdecc_c4[490], l2b_l2d_fbdecc_c4[568],
             l2b_l2d_fbdecc_c4[335], l2b_l2d_fbdecc_c4[413], l2b_l2d_fbdecc_c4[491], l2b_l2d_fbdecc_c4[569],
             l2b_l2d_fbdecc_c4[336], l2b_l2d_fbdecc_c4[414], l2b_l2d_fbdecc_c4[492], l2b_l2d_fbdecc_c4[570],
             l2b_l2d_fbdecc_c4[337], l2b_l2d_fbdecc_c4[415], l2b_l2d_fbdecc_c4[493], l2b_l2d_fbdecc_c4[571],
             l2b_l2d_fbdecc_c4[338], l2b_l2d_fbdecc_c4[416], l2b_l2d_fbdecc_c4[494], l2b_l2d_fbdecc_c4[572],
             l2b_l2d_fbdecc_c4[339], l2b_l2d_fbdecc_c4[417], l2b_l2d_fbdecc_c4[495], l2b_l2d_fbdecc_c4[573],
             l2b_l2d_fbdecc_c4[340], l2b_l2d_fbdecc_c4[418], l2b_l2d_fbdecc_c4[496], l2b_l2d_fbdecc_c4[574],
             l2b_l2d_fbdecc_c4[341], l2b_l2d_fbdecc_c4[419], l2b_l2d_fbdecc_c4[497], l2b_l2d_fbdecc_c4[575],
             l2b_l2d_fbdecc_c4[342], l2b_l2d_fbdecc_c4[420], l2b_l2d_fbdecc_c4[498], l2b_l2d_fbdecc_c4[576],
             l2b_l2d_fbdecc_c4[343], l2b_l2d_fbdecc_c4[421], l2b_l2d_fbdecc_c4[499], l2b_l2d_fbdecc_c4[577],
             l2b_l2d_fbdecc_c4[344], l2b_l2d_fbdecc_c4[422], l2b_l2d_fbdecc_c4[500], l2b_l2d_fbdecc_c4[578],
             l2b_l2d_fbdecc_c4[345], l2b_l2d_fbdecc_c4[423], l2b_l2d_fbdecc_c4[501], l2b_l2d_fbdecc_c4[579],
             l2b_l2d_fbdecc_c4[346], l2b_l2d_fbdecc_c4[424], l2b_l2d_fbdecc_c4[502], l2b_l2d_fbdecc_c4[580],
             l2b_l2d_fbdecc_c4[347], l2b_l2d_fbdecc_c4[425], l2b_l2d_fbdecc_c4[503], l2b_l2d_fbdecc_c4[581],
             l2b_l2d_fbdecc_c4[348], l2b_l2d_fbdecc_c4[426], l2b_l2d_fbdecc_c4[504], l2b_l2d_fbdecc_c4[582],
             l2b_l2d_fbdecc_c4[349], l2b_l2d_fbdecc_c4[427], l2b_l2d_fbdecc_c4[505], l2b_l2d_fbdecc_c4[583],
l2b_l2d_fbdecc_c4[350], l2b_l2d_fbdecc_c4[428], l2b_l2d_fbdecc_c4[506], l2b_l2d_fbdecc_c4[584]} = fb_array3_dout[159:0];

assign fb_array3_din[159:120] = {1'b0, 1'b0, 1'b0, 1'b0,
             fillbf_fb_array_din[312], fillbf_fb_array_din[390], fillbf_fb_array_din[468], fillbf_fb_array_din[546],
             fillbf_fb_array_din[313], fillbf_fb_array_din[391], fillbf_fb_array_din[469], fillbf_fb_array_din[547],
             fillbf_fb_array_din[314], fillbf_fb_array_din[392], fillbf_fb_array_din[470], fillbf_fb_array_din[548],
             fillbf_fb_array_din[315], fillbf_fb_array_din[393], fillbf_fb_array_din[471], fillbf_fb_array_din[549],
             fillbf_fb_array_din[316], fillbf_fb_array_din[394], fillbf_fb_array_din[472], fillbf_fb_array_din[550],
             fillbf_fb_array_din[317], fillbf_fb_array_din[395], fillbf_fb_array_din[473], fillbf_fb_array_din[551],
             fillbf_fb_array_din[318], fillbf_fb_array_din[396], fillbf_fb_array_din[474], fillbf_fb_array_din[552],
             fillbf_fb_array_din[319], fillbf_fb_array_din[397], fillbf_fb_array_din[475], fillbf_fb_array_din[553],
             fillbf_fb_array_din[320], fillbf_fb_array_din[398], fillbf_fb_array_din[476], fillbf_fb_array_din[554]};

assign fb_array3_din[119:80] = 
             {fillbf_fb_array_din[321], fillbf_fb_array_din[399], fillbf_fb_array_din[477], fillbf_fb_array_din[555],
             fillbf_fb_array_din[322], fillbf_fb_array_din[400], fillbf_fb_array_din[478], fillbf_fb_array_din[556],
             fillbf_fb_array_din[323], fillbf_fb_array_din[401], fillbf_fb_array_din[479], fillbf_fb_array_din[557],
             fillbf_fb_array_din[324], fillbf_fb_array_din[402], fillbf_fb_array_din[480], fillbf_fb_array_din[558],
             fillbf_fb_array_din[325], fillbf_fb_array_din[403], fillbf_fb_array_din[481], fillbf_fb_array_din[559],
             fillbf_fb_array_din[326], fillbf_fb_array_din[404], fillbf_fb_array_din[482], fillbf_fb_array_din[560],
             fillbf_fb_array_din[327], fillbf_fb_array_din[405], fillbf_fb_array_din[483], fillbf_fb_array_din[561],
             fillbf_fb_array_din[328], fillbf_fb_array_din[406], fillbf_fb_array_din[484], fillbf_fb_array_din[562],
             fillbf_fb_array_din[329], fillbf_fb_array_din[407], fillbf_fb_array_din[485], fillbf_fb_array_din[563],
             fillbf_fb_array_din[330], fillbf_fb_array_din[408], fillbf_fb_array_din[486], fillbf_fb_array_din[564]};

assign fb_array3_din[79:40] =
            {fillbf_fb_array_din[331], fillbf_fb_array_din[409], fillbf_fb_array_din[487], fillbf_fb_array_din[565],
             fillbf_fb_array_din[332], fillbf_fb_array_din[410], fillbf_fb_array_din[488], fillbf_fb_array_din[566],
             fillbf_fb_array_din[333], fillbf_fb_array_din[411], fillbf_fb_array_din[489], fillbf_fb_array_din[567],
             fillbf_fb_array_din[334], fillbf_fb_array_din[412], fillbf_fb_array_din[490], fillbf_fb_array_din[568],
             fillbf_fb_array_din[335], fillbf_fb_array_din[413], fillbf_fb_array_din[491], fillbf_fb_array_din[569],
             fillbf_fb_array_din[336], fillbf_fb_array_din[414], fillbf_fb_array_din[492], fillbf_fb_array_din[570],
             fillbf_fb_array_din[337], fillbf_fb_array_din[415], fillbf_fb_array_din[493], fillbf_fb_array_din[571],
             fillbf_fb_array_din[338], fillbf_fb_array_din[416], fillbf_fb_array_din[494], fillbf_fb_array_din[572],
             fillbf_fb_array_din[339], fillbf_fb_array_din[417], fillbf_fb_array_din[495], fillbf_fb_array_din[573],
             fillbf_fb_array_din[340], fillbf_fb_array_din[418], fillbf_fb_array_din[496], fillbf_fb_array_din[574]};

assign fb_array3_din[39:0] =
            {fillbf_fb_array_din[341], fillbf_fb_array_din[419], fillbf_fb_array_din[497], fillbf_fb_array_din[575],
             fillbf_fb_array_din[342], fillbf_fb_array_din[420], fillbf_fb_array_din[498], fillbf_fb_array_din[576],
             fillbf_fb_array_din[343], fillbf_fb_array_din[421], fillbf_fb_array_din[499], fillbf_fb_array_din[577],
             fillbf_fb_array_din[344], fillbf_fb_array_din[422], fillbf_fb_array_din[500], fillbf_fb_array_din[578],
             fillbf_fb_array_din[345], fillbf_fb_array_din[423], fillbf_fb_array_din[501], fillbf_fb_array_din[579],
             fillbf_fb_array_din[346], fillbf_fb_array_din[424], fillbf_fb_array_din[502], fillbf_fb_array_din[580],
             fillbf_fb_array_din[347], fillbf_fb_array_din[425], fillbf_fb_array_din[503], fillbf_fb_array_din[581],
             fillbf_fb_array_din[348], fillbf_fb_array_din[426], fillbf_fb_array_din[504], fillbf_fb_array_din[582],
             fillbf_fb_array_din[349], fillbf_fb_array_din[427], fillbf_fb_array_din[505], fillbf_fb_array_din[583],
             fillbf_fb_array_din[350], fillbf_fb_array_din[428], fillbf_fb_array_din[506], fillbf_fb_array_din[584]};

n2_l2t_dp_16x160_cust  fb_array3
  (.dout   (fb_array3_dout ),
   .din    (fb_array3_din ),
   .rd_adr   ({1'b0, fillbf_l2t_l2b_fbrd_wl_c3_v3[2:0]}),
   .wr_adr   ({1'b0, fillbf_l2t_l2b_fbwr_wl_r3_v3[2:0]}),
   .read_en  (fillbf_l2t_l2b_fbrd_en_c3_v3),
   .wr_en    (fillbf_l2t_l2b_fbwr_wren_r3_v3),
   .word_wen ({fillbf_l2t_l2b_fbwr_wen_r3[7], fillbf_l2t_l2b_fbwr_wen_r3[5],
               fillbf_l2t_l2b_fbwr_wen_r3[3], fillbf_l2t_l2b_fbwr_wen_r3[1]}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(fb_array3_scanin),
   .scan_out(fb_array3_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
   .tcu_scan_en(tcu_scan_en),
   .mbist_run (fb_mbist_enable),
   .mbist_wdata   (fb_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));

assign {l2b_l2d_fbdecc_c4_unused[7:4],
             l2b_l2d_fbdecc_c4[39], l2b_l2d_fbdecc_c4[117], l2b_l2d_fbdecc_c4[195], l2b_l2d_fbdecc_c4[273],
             l2b_l2d_fbdecc_c4[40], l2b_l2d_fbdecc_c4[118], l2b_l2d_fbdecc_c4[196], l2b_l2d_fbdecc_c4[274],
             l2b_l2d_fbdecc_c4[41], l2b_l2d_fbdecc_c4[119], l2b_l2d_fbdecc_c4[197], l2b_l2d_fbdecc_c4[275],
             l2b_l2d_fbdecc_c4[42], l2b_l2d_fbdecc_c4[120], l2b_l2d_fbdecc_c4[198], l2b_l2d_fbdecc_c4[276],
             l2b_l2d_fbdecc_c4[43], l2b_l2d_fbdecc_c4[121], l2b_l2d_fbdecc_c4[199], l2b_l2d_fbdecc_c4[277],
             l2b_l2d_fbdecc_c4[44], l2b_l2d_fbdecc_c4[122], l2b_l2d_fbdecc_c4[200], l2b_l2d_fbdecc_c4[278],
             l2b_l2d_fbdecc_c4[45], l2b_l2d_fbdecc_c4[123], l2b_l2d_fbdecc_c4[201], l2b_l2d_fbdecc_c4[279],
             l2b_l2d_fbdecc_c4[46], l2b_l2d_fbdecc_c4[124], l2b_l2d_fbdecc_c4[202], l2b_l2d_fbdecc_c4[280],
             l2b_l2d_fbdecc_c4[47], l2b_l2d_fbdecc_c4[125], l2b_l2d_fbdecc_c4[203], l2b_l2d_fbdecc_c4[281],
             l2b_l2d_fbdecc_c4[48], l2b_l2d_fbdecc_c4[126], l2b_l2d_fbdecc_c4[204], l2b_l2d_fbdecc_c4[282],
             l2b_l2d_fbdecc_c4[49], l2b_l2d_fbdecc_c4[127], l2b_l2d_fbdecc_c4[205], l2b_l2d_fbdecc_c4[283],
             l2b_l2d_fbdecc_c4[50], l2b_l2d_fbdecc_c4[128], l2b_l2d_fbdecc_c4[206], l2b_l2d_fbdecc_c4[284],
             l2b_l2d_fbdecc_c4[51], l2b_l2d_fbdecc_c4[129], l2b_l2d_fbdecc_c4[207], l2b_l2d_fbdecc_c4[285],
             l2b_l2d_fbdecc_c4[52], l2b_l2d_fbdecc_c4[130], l2b_l2d_fbdecc_c4[208], l2b_l2d_fbdecc_c4[286],
             l2b_l2d_fbdecc_c4[53], l2b_l2d_fbdecc_c4[131], l2b_l2d_fbdecc_c4[209], l2b_l2d_fbdecc_c4[287],
             l2b_l2d_fbdecc_c4[54], l2b_l2d_fbdecc_c4[132], l2b_l2d_fbdecc_c4[210], l2b_l2d_fbdecc_c4[288],
             l2b_l2d_fbdecc_c4[55], l2b_l2d_fbdecc_c4[133], l2b_l2d_fbdecc_c4[211], l2b_l2d_fbdecc_c4[289],
             l2b_l2d_fbdecc_c4[56], l2b_l2d_fbdecc_c4[134], l2b_l2d_fbdecc_c4[212], l2b_l2d_fbdecc_c4[290],
             l2b_l2d_fbdecc_c4[57], l2b_l2d_fbdecc_c4[135], l2b_l2d_fbdecc_c4[213], l2b_l2d_fbdecc_c4[291],
             l2b_l2d_fbdecc_c4[58], l2b_l2d_fbdecc_c4[136], l2b_l2d_fbdecc_c4[214], l2b_l2d_fbdecc_c4[292],
             l2b_l2d_fbdecc_c4[59], l2b_l2d_fbdecc_c4[137], l2b_l2d_fbdecc_c4[215], l2b_l2d_fbdecc_c4[293],
             l2b_l2d_fbdecc_c4[60], l2b_l2d_fbdecc_c4[138], l2b_l2d_fbdecc_c4[216], l2b_l2d_fbdecc_c4[294],
             l2b_l2d_fbdecc_c4[61], l2b_l2d_fbdecc_c4[139], l2b_l2d_fbdecc_c4[217], l2b_l2d_fbdecc_c4[295],
             l2b_l2d_fbdecc_c4[62], l2b_l2d_fbdecc_c4[140], l2b_l2d_fbdecc_c4[218], l2b_l2d_fbdecc_c4[296],
             l2b_l2d_fbdecc_c4[63], l2b_l2d_fbdecc_c4[141], l2b_l2d_fbdecc_c4[219], l2b_l2d_fbdecc_c4[297],
             l2b_l2d_fbdecc_c4[64], l2b_l2d_fbdecc_c4[142], l2b_l2d_fbdecc_c4[220], l2b_l2d_fbdecc_c4[298],
             l2b_l2d_fbdecc_c4[65], l2b_l2d_fbdecc_c4[143], l2b_l2d_fbdecc_c4[221], l2b_l2d_fbdecc_c4[299],
             l2b_l2d_fbdecc_c4[66], l2b_l2d_fbdecc_c4[144], l2b_l2d_fbdecc_c4[222], l2b_l2d_fbdecc_c4[300],
             l2b_l2d_fbdecc_c4[67], l2b_l2d_fbdecc_c4[145], l2b_l2d_fbdecc_c4[223], l2b_l2d_fbdecc_c4[301],
             l2b_l2d_fbdecc_c4[68], l2b_l2d_fbdecc_c4[146], l2b_l2d_fbdecc_c4[224], l2b_l2d_fbdecc_c4[302],
             l2b_l2d_fbdecc_c4[69], l2b_l2d_fbdecc_c4[147], l2b_l2d_fbdecc_c4[225], l2b_l2d_fbdecc_c4[303],
             l2b_l2d_fbdecc_c4[70], l2b_l2d_fbdecc_c4[148], l2b_l2d_fbdecc_c4[226], l2b_l2d_fbdecc_c4[304],
             l2b_l2d_fbdecc_c4[71], l2b_l2d_fbdecc_c4[149], l2b_l2d_fbdecc_c4[227], l2b_l2d_fbdecc_c4[305],
             l2b_l2d_fbdecc_c4[72], l2b_l2d_fbdecc_c4[150], l2b_l2d_fbdecc_c4[228], l2b_l2d_fbdecc_c4[306],
             l2b_l2d_fbdecc_c4[73], l2b_l2d_fbdecc_c4[151], l2b_l2d_fbdecc_c4[229], l2b_l2d_fbdecc_c4[307],
             l2b_l2d_fbdecc_c4[74], l2b_l2d_fbdecc_c4[152], l2b_l2d_fbdecc_c4[230], l2b_l2d_fbdecc_c4[308],
             l2b_l2d_fbdecc_c4[75], l2b_l2d_fbdecc_c4[153], l2b_l2d_fbdecc_c4[231], l2b_l2d_fbdecc_c4[309],
             l2b_l2d_fbdecc_c4[76], l2b_l2d_fbdecc_c4[154], l2b_l2d_fbdecc_c4[232], l2b_l2d_fbdecc_c4[310],
             l2b_l2d_fbdecc_c4[77], l2b_l2d_fbdecc_c4[155], l2b_l2d_fbdecc_c4[233], l2b_l2d_fbdecc_c4[311]} = fb_array2_dout[159:0];

assign fb_array2_din[159:0] = ({1'b0, 1'b0, 1'b0, 1'b0,
             fillbf_fb_array_din[39], fillbf_fb_array_din[117], fillbf_fb_array_din[195], fillbf_fb_array_din[273],
             fillbf_fb_array_din[40], fillbf_fb_array_din[118], fillbf_fb_array_din[196], fillbf_fb_array_din[274],
             fillbf_fb_array_din[41], fillbf_fb_array_din[119], fillbf_fb_array_din[197], fillbf_fb_array_din[275],
             fillbf_fb_array_din[42], fillbf_fb_array_din[120], fillbf_fb_array_din[198], fillbf_fb_array_din[276],
             fillbf_fb_array_din[43], fillbf_fb_array_din[121], fillbf_fb_array_din[199], fillbf_fb_array_din[277],
             fillbf_fb_array_din[44], fillbf_fb_array_din[122], fillbf_fb_array_din[200], fillbf_fb_array_din[278],
             fillbf_fb_array_din[45], fillbf_fb_array_din[123], fillbf_fb_array_din[201], fillbf_fb_array_din[279],
             fillbf_fb_array_din[46], fillbf_fb_array_din[124], fillbf_fb_array_din[202], fillbf_fb_array_din[280],
             fillbf_fb_array_din[47], fillbf_fb_array_din[125], fillbf_fb_array_din[203], fillbf_fb_array_din[281],
             fillbf_fb_array_din[48], fillbf_fb_array_din[126], fillbf_fb_array_din[204], fillbf_fb_array_din[282],
             fillbf_fb_array_din[49], fillbf_fb_array_din[127], fillbf_fb_array_din[205], fillbf_fb_array_din[283],
             fillbf_fb_array_din[50], fillbf_fb_array_din[128], fillbf_fb_array_din[206], fillbf_fb_array_din[284],
             fillbf_fb_array_din[51], fillbf_fb_array_din[129], fillbf_fb_array_din[207], fillbf_fb_array_din[285],
             fillbf_fb_array_din[52], fillbf_fb_array_din[130], fillbf_fb_array_din[208], fillbf_fb_array_din[286],
             fillbf_fb_array_din[53], fillbf_fb_array_din[131], fillbf_fb_array_din[209], fillbf_fb_array_din[287],
             fillbf_fb_array_din[54], fillbf_fb_array_din[132], fillbf_fb_array_din[210], fillbf_fb_array_din[288],
             fillbf_fb_array_din[55], fillbf_fb_array_din[133], fillbf_fb_array_din[211], fillbf_fb_array_din[289],
             fillbf_fb_array_din[56], fillbf_fb_array_din[134], fillbf_fb_array_din[212], fillbf_fb_array_din[290],
             fillbf_fb_array_din[57], fillbf_fb_array_din[135], fillbf_fb_array_din[213], fillbf_fb_array_din[291],
             fillbf_fb_array_din[58], fillbf_fb_array_din[136], fillbf_fb_array_din[214], fillbf_fb_array_din[292],
             fillbf_fb_array_din[59], fillbf_fb_array_din[137], fillbf_fb_array_din[215], fillbf_fb_array_din[293],
             fillbf_fb_array_din[60], fillbf_fb_array_din[138], fillbf_fb_array_din[216], fillbf_fb_array_din[294],
             fillbf_fb_array_din[61], fillbf_fb_array_din[139], fillbf_fb_array_din[217], fillbf_fb_array_din[295],
             fillbf_fb_array_din[62], fillbf_fb_array_din[140], fillbf_fb_array_din[218], fillbf_fb_array_din[296],
             fillbf_fb_array_din[63], fillbf_fb_array_din[141], fillbf_fb_array_din[219], fillbf_fb_array_din[297],
             fillbf_fb_array_din[64], fillbf_fb_array_din[142], fillbf_fb_array_din[220], fillbf_fb_array_din[298],
             fillbf_fb_array_din[65], fillbf_fb_array_din[143], fillbf_fb_array_din[221], fillbf_fb_array_din[299],
             fillbf_fb_array_din[66], fillbf_fb_array_din[144], fillbf_fb_array_din[222], fillbf_fb_array_din[300],
             fillbf_fb_array_din[67], fillbf_fb_array_din[145], fillbf_fb_array_din[223], fillbf_fb_array_din[301],
             fillbf_fb_array_din[68], fillbf_fb_array_din[146], fillbf_fb_array_din[224], fillbf_fb_array_din[302],
             fillbf_fb_array_din[69], fillbf_fb_array_din[147], fillbf_fb_array_din[225], fillbf_fb_array_din[303],
             fillbf_fb_array_din[70], fillbf_fb_array_din[148], fillbf_fb_array_din[226], fillbf_fb_array_din[304],
             fillbf_fb_array_din[71], fillbf_fb_array_din[149], fillbf_fb_array_din[227], fillbf_fb_array_din[305],
             fillbf_fb_array_din[72], fillbf_fb_array_din[150], fillbf_fb_array_din[228], fillbf_fb_array_din[306],
             fillbf_fb_array_din[73], fillbf_fb_array_din[151], fillbf_fb_array_din[229], fillbf_fb_array_din[307],
             fillbf_fb_array_din[74], fillbf_fb_array_din[152], fillbf_fb_array_din[230], fillbf_fb_array_din[308],
             fillbf_fb_array_din[75], fillbf_fb_array_din[153], fillbf_fb_array_din[231], fillbf_fb_array_din[309],
             fillbf_fb_array_din[76], fillbf_fb_array_din[154], fillbf_fb_array_din[232], fillbf_fb_array_din[310],
             fillbf_fb_array_din[77], fillbf_fb_array_din[155], fillbf_fb_array_din[233], fillbf_fb_array_din[311]});

n2_l2t_dp_16x160_cust  fb_array2
  (.dout   ( fb_array2_dout ),
   .din    ( fb_array2_din ),
   .rd_adr   ({1'b0, fillbf_l2t_l2b_fbrd_wl_c3_v2[2:0]}),
   .wr_adr   ({1'b0, fillbf_l2t_l2b_fbwr_wl_r3_v2[2:0]}),
   .read_en  (fillbf_l2t_l2b_fbrd_en_c3_v2),
   .wr_en    (fillbf_l2t_l2b_fbwr_wren_r3_v2),
   .word_wen ({fillbf_l2t_l2b_fbwr_wen_r3[14], fillbf_l2t_l2b_fbwr_wen_r3[12],
               fillbf_l2t_l2b_fbwr_wen_r3[10], fillbf_l2t_l2b_fbwr_wen_r3[8]}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(fb_array2_scanin),
   .scan_out(fb_array2_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
    .tcu_scan_en(tcu_scan_en),
    .mbist_run (fb_mbist_enable),
    .mbist_wdata   (fb_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));


assign {l2b_l2d_fbdecc_c4_unused[3:0],
             l2b_l2d_fbdecc_c4[0], l2b_l2d_fbdecc_c4[78], l2b_l2d_fbdecc_c4[156], l2b_l2d_fbdecc_c4[234],
             l2b_l2d_fbdecc_c4[1], l2b_l2d_fbdecc_c4[79], l2b_l2d_fbdecc_c4[157], l2b_l2d_fbdecc_c4[235],
             l2b_l2d_fbdecc_c4[2], l2b_l2d_fbdecc_c4[80], l2b_l2d_fbdecc_c4[158], l2b_l2d_fbdecc_c4[236],
             l2b_l2d_fbdecc_c4[3], l2b_l2d_fbdecc_c4[81], l2b_l2d_fbdecc_c4[159], l2b_l2d_fbdecc_c4[237],
             l2b_l2d_fbdecc_c4[4], l2b_l2d_fbdecc_c4[82], l2b_l2d_fbdecc_c4[160], l2b_l2d_fbdecc_c4[238],
             l2b_l2d_fbdecc_c4[5], l2b_l2d_fbdecc_c4[83], l2b_l2d_fbdecc_c4[161], l2b_l2d_fbdecc_c4[239],
             l2b_l2d_fbdecc_c4[6], l2b_l2d_fbdecc_c4[84], l2b_l2d_fbdecc_c4[162], l2b_l2d_fbdecc_c4[240],
             l2b_l2d_fbdecc_c4[7], l2b_l2d_fbdecc_c4[85], l2b_l2d_fbdecc_c4[163], l2b_l2d_fbdecc_c4[241],
             l2b_l2d_fbdecc_c4[8], l2b_l2d_fbdecc_c4[86], l2b_l2d_fbdecc_c4[164], l2b_l2d_fbdecc_c4[242],
             l2b_l2d_fbdecc_c4[9], l2b_l2d_fbdecc_c4[87], l2b_l2d_fbdecc_c4[165], l2b_l2d_fbdecc_c4[243],
             l2b_l2d_fbdecc_c4[10], l2b_l2d_fbdecc_c4[88], l2b_l2d_fbdecc_c4[166], l2b_l2d_fbdecc_c4[244],
             l2b_l2d_fbdecc_c4[11], l2b_l2d_fbdecc_c4[89], l2b_l2d_fbdecc_c4[167], l2b_l2d_fbdecc_c4[245],
             l2b_l2d_fbdecc_c4[12], l2b_l2d_fbdecc_c4[90], l2b_l2d_fbdecc_c4[168], l2b_l2d_fbdecc_c4[246],
             l2b_l2d_fbdecc_c4[13], l2b_l2d_fbdecc_c4[91], l2b_l2d_fbdecc_c4[169], l2b_l2d_fbdecc_c4[247],
             l2b_l2d_fbdecc_c4[14], l2b_l2d_fbdecc_c4[92], l2b_l2d_fbdecc_c4[170], l2b_l2d_fbdecc_c4[248],
             l2b_l2d_fbdecc_c4[15], l2b_l2d_fbdecc_c4[93], l2b_l2d_fbdecc_c4[171], l2b_l2d_fbdecc_c4[249],
             l2b_l2d_fbdecc_c4[16], l2b_l2d_fbdecc_c4[94], l2b_l2d_fbdecc_c4[172], l2b_l2d_fbdecc_c4[250],
             l2b_l2d_fbdecc_c4[17], l2b_l2d_fbdecc_c4[95], l2b_l2d_fbdecc_c4[173], l2b_l2d_fbdecc_c4[251],
             l2b_l2d_fbdecc_c4[18], l2b_l2d_fbdecc_c4[96], l2b_l2d_fbdecc_c4[174], l2b_l2d_fbdecc_c4[252],
             l2b_l2d_fbdecc_c4[19], l2b_l2d_fbdecc_c4[97], l2b_l2d_fbdecc_c4[175], l2b_l2d_fbdecc_c4[253],
             l2b_l2d_fbdecc_c4[20], l2b_l2d_fbdecc_c4[98], l2b_l2d_fbdecc_c4[176], l2b_l2d_fbdecc_c4[254],
             l2b_l2d_fbdecc_c4[21], l2b_l2d_fbdecc_c4[99], l2b_l2d_fbdecc_c4[177], l2b_l2d_fbdecc_c4[255],
             l2b_l2d_fbdecc_c4[22], l2b_l2d_fbdecc_c4[100], l2b_l2d_fbdecc_c4[178], l2b_l2d_fbdecc_c4[256],
             l2b_l2d_fbdecc_c4[23], l2b_l2d_fbdecc_c4[101], l2b_l2d_fbdecc_c4[179], l2b_l2d_fbdecc_c4[257],
             l2b_l2d_fbdecc_c4[24], l2b_l2d_fbdecc_c4[102], l2b_l2d_fbdecc_c4[180], l2b_l2d_fbdecc_c4[258],
             l2b_l2d_fbdecc_c4[25], l2b_l2d_fbdecc_c4[103], l2b_l2d_fbdecc_c4[181], l2b_l2d_fbdecc_c4[259],
             l2b_l2d_fbdecc_c4[26], l2b_l2d_fbdecc_c4[104], l2b_l2d_fbdecc_c4[182], l2b_l2d_fbdecc_c4[260],
             l2b_l2d_fbdecc_c4[27], l2b_l2d_fbdecc_c4[105], l2b_l2d_fbdecc_c4[183], l2b_l2d_fbdecc_c4[261],
             l2b_l2d_fbdecc_c4[28], l2b_l2d_fbdecc_c4[106], l2b_l2d_fbdecc_c4[184], l2b_l2d_fbdecc_c4[262],
             l2b_l2d_fbdecc_c4[29], l2b_l2d_fbdecc_c4[107], l2b_l2d_fbdecc_c4[185], l2b_l2d_fbdecc_c4[263],
             l2b_l2d_fbdecc_c4[30], l2b_l2d_fbdecc_c4[108], l2b_l2d_fbdecc_c4[186], l2b_l2d_fbdecc_c4[264],
             l2b_l2d_fbdecc_c4[31], l2b_l2d_fbdecc_c4[109], l2b_l2d_fbdecc_c4[187], l2b_l2d_fbdecc_c4[265],
             l2b_l2d_fbdecc_c4[32], l2b_l2d_fbdecc_c4[110], l2b_l2d_fbdecc_c4[188], l2b_l2d_fbdecc_c4[266],
             l2b_l2d_fbdecc_c4[33], l2b_l2d_fbdecc_c4[111], l2b_l2d_fbdecc_c4[189], l2b_l2d_fbdecc_c4[267],
             l2b_l2d_fbdecc_c4[34], l2b_l2d_fbdecc_c4[112], l2b_l2d_fbdecc_c4[190], l2b_l2d_fbdecc_c4[268],
             l2b_l2d_fbdecc_c4[35], l2b_l2d_fbdecc_c4[113], l2b_l2d_fbdecc_c4[191], l2b_l2d_fbdecc_c4[269],
             l2b_l2d_fbdecc_c4[36], l2b_l2d_fbdecc_c4[114], l2b_l2d_fbdecc_c4[192], l2b_l2d_fbdecc_c4[270],
             l2b_l2d_fbdecc_c4[37], l2b_l2d_fbdecc_c4[115], l2b_l2d_fbdecc_c4[193], l2b_l2d_fbdecc_c4[271],
             l2b_l2d_fbdecc_c4[38], l2b_l2d_fbdecc_c4[116], l2b_l2d_fbdecc_c4[194], l2b_l2d_fbdecc_c4[272]} = fb_array1_dout[159:0];

assign fb_array1_din[159:0] = ({1'b0, 1'b0, 1'b0, 1'b0,
             fillbf_fb_array_din[0], fillbf_fb_array_din[78], fillbf_fb_array_din[156], fillbf_fb_array_din[234],
             fillbf_fb_array_din[1], fillbf_fb_array_din[79], fillbf_fb_array_din[157], fillbf_fb_array_din[235],
             fillbf_fb_array_din[2], fillbf_fb_array_din[80], fillbf_fb_array_din[158], fillbf_fb_array_din[236],
             fillbf_fb_array_din[3], fillbf_fb_array_din[81], fillbf_fb_array_din[159], fillbf_fb_array_din[237],
             fillbf_fb_array_din[4], fillbf_fb_array_din[82], fillbf_fb_array_din[160], fillbf_fb_array_din[238],
             fillbf_fb_array_din[5], fillbf_fb_array_din[83], fillbf_fb_array_din[161], fillbf_fb_array_din[239],
             fillbf_fb_array_din[6], fillbf_fb_array_din[84], fillbf_fb_array_din[162], fillbf_fb_array_din[240],
             fillbf_fb_array_din[7], fillbf_fb_array_din[85], fillbf_fb_array_din[163], fillbf_fb_array_din[241],
             fillbf_fb_array_din[8], fillbf_fb_array_din[86], fillbf_fb_array_din[164], fillbf_fb_array_din[242],
             fillbf_fb_array_din[9], fillbf_fb_array_din[87], fillbf_fb_array_din[165], fillbf_fb_array_din[243],
             fillbf_fb_array_din[10], fillbf_fb_array_din[88], fillbf_fb_array_din[166], fillbf_fb_array_din[244],
             fillbf_fb_array_din[11], fillbf_fb_array_din[89], fillbf_fb_array_din[167], fillbf_fb_array_din[245],
             fillbf_fb_array_din[12], fillbf_fb_array_din[90], fillbf_fb_array_din[168], fillbf_fb_array_din[246],
             fillbf_fb_array_din[13], fillbf_fb_array_din[91], fillbf_fb_array_din[169], fillbf_fb_array_din[247],
             fillbf_fb_array_din[14], fillbf_fb_array_din[92], fillbf_fb_array_din[170], fillbf_fb_array_din[248],
             fillbf_fb_array_din[15], fillbf_fb_array_din[93], fillbf_fb_array_din[171], fillbf_fb_array_din[249],
             fillbf_fb_array_din[16], fillbf_fb_array_din[94], fillbf_fb_array_din[172], fillbf_fb_array_din[250],
             fillbf_fb_array_din[17], fillbf_fb_array_din[95], fillbf_fb_array_din[173], fillbf_fb_array_din[251],
             fillbf_fb_array_din[18], fillbf_fb_array_din[96], fillbf_fb_array_din[174], fillbf_fb_array_din[252],
             fillbf_fb_array_din[19], fillbf_fb_array_din[97], fillbf_fb_array_din[175], fillbf_fb_array_din[253],
             fillbf_fb_array_din[20], fillbf_fb_array_din[98], fillbf_fb_array_din[176], fillbf_fb_array_din[254],
             fillbf_fb_array_din[21], fillbf_fb_array_din[99], fillbf_fb_array_din[177], fillbf_fb_array_din[255],
             fillbf_fb_array_din[22], fillbf_fb_array_din[100], fillbf_fb_array_din[178], fillbf_fb_array_din[256],
             fillbf_fb_array_din[23], fillbf_fb_array_din[101], fillbf_fb_array_din[179], fillbf_fb_array_din[257],
             fillbf_fb_array_din[24], fillbf_fb_array_din[102], fillbf_fb_array_din[180], fillbf_fb_array_din[258],
             fillbf_fb_array_din[25], fillbf_fb_array_din[103], fillbf_fb_array_din[181], fillbf_fb_array_din[259],
             fillbf_fb_array_din[26], fillbf_fb_array_din[104], fillbf_fb_array_din[182], fillbf_fb_array_din[260],
             fillbf_fb_array_din[27], fillbf_fb_array_din[105], fillbf_fb_array_din[183], fillbf_fb_array_din[261],
             fillbf_fb_array_din[28], fillbf_fb_array_din[106], fillbf_fb_array_din[184], fillbf_fb_array_din[262],
             fillbf_fb_array_din[29], fillbf_fb_array_din[107], fillbf_fb_array_din[185], fillbf_fb_array_din[263],
             fillbf_fb_array_din[30], fillbf_fb_array_din[108], fillbf_fb_array_din[186], fillbf_fb_array_din[264],
             fillbf_fb_array_din[31], fillbf_fb_array_din[109], fillbf_fb_array_din[187], fillbf_fb_array_din[265],
             fillbf_fb_array_din[32], fillbf_fb_array_din[110], fillbf_fb_array_din[188], fillbf_fb_array_din[266],
             fillbf_fb_array_din[33], fillbf_fb_array_din[111], fillbf_fb_array_din[189], fillbf_fb_array_din[267],
             fillbf_fb_array_din[34], fillbf_fb_array_din[112], fillbf_fb_array_din[190], fillbf_fb_array_din[268],
             fillbf_fb_array_din[35], fillbf_fb_array_din[113], fillbf_fb_array_din[191], fillbf_fb_array_din[269],
             fillbf_fb_array_din[36], fillbf_fb_array_din[114], fillbf_fb_array_din[192], fillbf_fb_array_din[270],
             fillbf_fb_array_din[37], fillbf_fb_array_din[115], fillbf_fb_array_din[193], fillbf_fb_array_din[271],
             fillbf_fb_array_din[38], fillbf_fb_array_din[116], fillbf_fb_array_din[194], fillbf_fb_array_din[272]});

n2_l2t_dp_16x160_cust  fb_array1
  (.dout   ( fb_array1_dout ),
   .rd_adr   ({1'b0, fillbf_l2t_l2b_fbrd_wl_c3_v1[2:0]}),
   .din    ( fb_array1_din ),
   .wr_adr   ({1'b0, fillbf_l2t_l2b_fbwr_wl_r3_v1[2:0]}),
   .read_en  (fillbf_l2t_l2b_fbrd_en_c3_v1),
   .wr_en    (fillbf_l2t_l2b_fbwr_wren_r3_v1),
   .word_wen ({fillbf_l2t_l2b_fbwr_wen_r3[15], fillbf_l2t_l2b_fbwr_wen_r3[13],
               fillbf_l2t_l2b_fbwr_wen_r3[11], fillbf_l2t_l2b_fbwr_wen_r3[9]}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(fb_array1_scanin),
   .scan_out(fb_array1_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
   .tcu_scan_en(tcu_scan_en),
  .mbist_run (fb_mbist_enable),
  .mbist_wdata   (fb_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));


////////////////////////////////////////////////////////////////////////////////

l2b_rdmard_dp rdmard
  (
   // Outputs
   .rdmard_l2b_sio_ctag_vld           (l2b_sio_ctag_vld),
   .rdmard_l2b_sio_data               (l2b_sio_data[31:0]),
   .rdmard_l2b_sio_ue_err             (l2b_sio_ue_err),
   .rdmard_l2b_l2t_rdma_uerr_c10      (l2b_l2t_rdma_uerr_c10),
   .rdmard_l2b_l2t_rdma_cerr_c10      (l2b_l2t_rdma_cerr_c10),
   .rdmard_l2b_l2t_rdma_notdata_c10   (l2b_l2t_rdma_notdata_c10),
   .rdmard_l2b_sio_parity      	      (l2b_sio_parity[1:0]),//Phase 2 :SIU interface changes 2/5/04 
   .l2b_dbg_sio_ctag_vld 		(l2b_dbg_sio_ctag_vld),
   .l2b_dbg_sio_ack_type 		(l2b_dbg_sio_ack_type),
   .l2b_dbg_sio_ack_dest 		(l2b_dbg_sio_ack_dest),

   // Inputs
  .tcu_aclk		    (aclk),
  .tcu_bclk		    (bclk),
  .tcu_scan_en              (tcu_scan_en),
  .tcu_pce_ov		    (tcu_pce_ov),
  .tcu_clk_stop             (1'b0),
   .scan_in(rdmard_scanin),
   .scan_out(rdmard_scanout),
   .l2clk                              (l2clk),
   .l2t_l2b_ctag_en_c7                (l2t_l2b_ctag_en_c7),
   .l2t_l2b_ctag_c7                   (l2t_l2b_ctag_c7[31:0]),// Phase 2 : SIU inteface and packet format change 2/7/04
   .l2t_l2b_req_en_c7                 (l2t_l2b_req_en_c7),
   .l2d_l2b_decc_out_c7               (l2d_l2b_decc_out_c7[623:0]),
   .l2t_l2b_word_c7                   (l2t_l2b_word_c7[3:0]),
   .l2t_l2b_word_vld_c7               (l2t_l2b_word_vld_c7)); 


////////////////////////////////////////////////////////////////////////////////

assign {wb_array_dout_unused[15:12],
             wb_array_dout[351], wb_array_dout[429], wb_array_dout[507], wb_array_dout[585],
             wb_array_dout[352], wb_array_dout[430], wb_array_dout[508], wb_array_dout[586],
             wb_array_dout[353], wb_array_dout[431], wb_array_dout[509], wb_array_dout[587],
             wb_array_dout[354], wb_array_dout[432], wb_array_dout[510], wb_array_dout[588],
             wb_array_dout[355], wb_array_dout[433], wb_array_dout[511], wb_array_dout[589],
             wb_array_dout[356], wb_array_dout[434], wb_array_dout[512], wb_array_dout[590],
             wb_array_dout[357], wb_array_dout[435], wb_array_dout[513], wb_array_dout[591],
             wb_array_dout[358], wb_array_dout[436], wb_array_dout[514], wb_array_dout[592],
             wb_array_dout[359], wb_array_dout[437], wb_array_dout[515], wb_array_dout[593],
             wb_array_dout[360], wb_array_dout[438], wb_array_dout[516], wb_array_dout[594],
             wb_array_dout[361], wb_array_dout[439], wb_array_dout[517], wb_array_dout[595],
             wb_array_dout[362], wb_array_dout[440], wb_array_dout[518], wb_array_dout[596],
             wb_array_dout[363], wb_array_dout[441], wb_array_dout[519], wb_array_dout[597],
             wb_array_dout[364], wb_array_dout[442], wb_array_dout[520], wb_array_dout[598],
             wb_array_dout[365], wb_array_dout[443], wb_array_dout[521], wb_array_dout[599],
             wb_array_dout[366], wb_array_dout[444], wb_array_dout[522], wb_array_dout[600],
             wb_array_dout[367], wb_array_dout[445], wb_array_dout[523], wb_array_dout[601],
             wb_array_dout[368], wb_array_dout[446], wb_array_dout[524], wb_array_dout[602],
             wb_array_dout[369], wb_array_dout[447], wb_array_dout[525], wb_array_dout[603],
             wb_array_dout[370], wb_array_dout[448], wb_array_dout[526], wb_array_dout[604],
             wb_array_dout[371], wb_array_dout[449], wb_array_dout[527], wb_array_dout[605],
             wb_array_dout[372], wb_array_dout[450], wb_array_dout[528], wb_array_dout[606],
             wb_array_dout[373], wb_array_dout[451], wb_array_dout[529], wb_array_dout[607],
             wb_array_dout[374], wb_array_dout[452], wb_array_dout[530], wb_array_dout[608],
             wb_array_dout[375], wb_array_dout[453], wb_array_dout[531], wb_array_dout[609],
             wb_array_dout[376], wb_array_dout[454], wb_array_dout[532], wb_array_dout[610],
             wb_array_dout[377], wb_array_dout[455], wb_array_dout[533], wb_array_dout[611],
             wb_array_dout[378], wb_array_dout[456], wb_array_dout[534], wb_array_dout[612],
             wb_array_dout[379], wb_array_dout[457], wb_array_dout[535], wb_array_dout[613],
             wb_array_dout[380], wb_array_dout[458], wb_array_dout[536], wb_array_dout[614],
             wb_array_dout[381], wb_array_dout[459], wb_array_dout[537], wb_array_dout[615],
             wb_array_dout[382], wb_array_dout[460], wb_array_dout[538], wb_array_dout[616],
             wb_array_dout[383], wb_array_dout[461], wb_array_dout[539], wb_array_dout[617],
             wb_array_dout[384], wb_array_dout[462], wb_array_dout[540], wb_array_dout[618],
             wb_array_dout[385], wb_array_dout[463], wb_array_dout[541], wb_array_dout[619],
             wb_array_dout[386], wb_array_dout[464], wb_array_dout[542], wb_array_dout[620],
             wb_array_dout[387], wb_array_dout[465], wb_array_dout[543], wb_array_dout[621],
             wb_array_dout[388], wb_array_dout[466], wb_array_dout[544], wb_array_dout[622],
             wb_array_dout[389], wb_array_dout[467], wb_array_dout[545], wb_array_dout[623]} = wb_array4_dout[159:0];

assign wb_array4_din[159:120] = {1'b0, 1'b0, 1'b0, 1'b0,
             l2d_l2b_decc_out_c7[351], l2d_l2b_decc_out_c7[429], l2d_l2b_decc_out_c7[507], l2d_l2b_decc_out_c7[585],
             l2d_l2b_decc_out_c7[352], l2d_l2b_decc_out_c7[430], l2d_l2b_decc_out_c7[508], l2d_l2b_decc_out_c7[586],
             l2d_l2b_decc_out_c7[353], l2d_l2b_decc_out_c7[431], l2d_l2b_decc_out_c7[509], l2d_l2b_decc_out_c7[587],
             l2d_l2b_decc_out_c7[354], l2d_l2b_decc_out_c7[432], l2d_l2b_decc_out_c7[510], l2d_l2b_decc_out_c7[588],
             l2d_l2b_decc_out_c7[355], l2d_l2b_decc_out_c7[433], l2d_l2b_decc_out_c7[511], l2d_l2b_decc_out_c7[589],
             l2d_l2b_decc_out_c7[356], l2d_l2b_decc_out_c7[434], l2d_l2b_decc_out_c7[512], l2d_l2b_decc_out_c7[590],
             l2d_l2b_decc_out_c7[357], l2d_l2b_decc_out_c7[435], l2d_l2b_decc_out_c7[513], l2d_l2b_decc_out_c7[591],
             l2d_l2b_decc_out_c7[358], l2d_l2b_decc_out_c7[436], l2d_l2b_decc_out_c7[514], l2d_l2b_decc_out_c7[592],
             l2d_l2b_decc_out_c7[359], l2d_l2b_decc_out_c7[437], l2d_l2b_decc_out_c7[515], l2d_l2b_decc_out_c7[593]};
assign wb_array4_din[119:80] =
            {l2d_l2b_decc_out_c7[360], l2d_l2b_decc_out_c7[438], l2d_l2b_decc_out_c7[516], l2d_l2b_decc_out_c7[594],
             l2d_l2b_decc_out_c7[361], l2d_l2b_decc_out_c7[439], l2d_l2b_decc_out_c7[517], l2d_l2b_decc_out_c7[595],
             l2d_l2b_decc_out_c7[362], l2d_l2b_decc_out_c7[440], l2d_l2b_decc_out_c7[518], l2d_l2b_decc_out_c7[596],
             l2d_l2b_decc_out_c7[363], l2d_l2b_decc_out_c7[441], l2d_l2b_decc_out_c7[519], l2d_l2b_decc_out_c7[597],
             l2d_l2b_decc_out_c7[364], l2d_l2b_decc_out_c7[442], l2d_l2b_decc_out_c7[520], l2d_l2b_decc_out_c7[598],
             l2d_l2b_decc_out_c7[365], l2d_l2b_decc_out_c7[443], l2d_l2b_decc_out_c7[521], l2d_l2b_decc_out_c7[599],
             l2d_l2b_decc_out_c7[366], l2d_l2b_decc_out_c7[444], l2d_l2b_decc_out_c7[522], l2d_l2b_decc_out_c7[600],
             l2d_l2b_decc_out_c7[367], l2d_l2b_decc_out_c7[445], l2d_l2b_decc_out_c7[523], l2d_l2b_decc_out_c7[601],
             l2d_l2b_decc_out_c7[368], l2d_l2b_decc_out_c7[446], l2d_l2b_decc_out_c7[524], l2d_l2b_decc_out_c7[602],
             l2d_l2b_decc_out_c7[369], l2d_l2b_decc_out_c7[447], l2d_l2b_decc_out_c7[525], l2d_l2b_decc_out_c7[603]};
assign wb_array4_din[79:40] =
            {l2d_l2b_decc_out_c7[370], l2d_l2b_decc_out_c7[448], l2d_l2b_decc_out_c7[526], l2d_l2b_decc_out_c7[604],
             l2d_l2b_decc_out_c7[371], l2d_l2b_decc_out_c7[449], l2d_l2b_decc_out_c7[527], l2d_l2b_decc_out_c7[605],
             l2d_l2b_decc_out_c7[372], l2d_l2b_decc_out_c7[450], l2d_l2b_decc_out_c7[528], l2d_l2b_decc_out_c7[606],
             l2d_l2b_decc_out_c7[373], l2d_l2b_decc_out_c7[451], l2d_l2b_decc_out_c7[529], l2d_l2b_decc_out_c7[607],
             l2d_l2b_decc_out_c7[374], l2d_l2b_decc_out_c7[452], l2d_l2b_decc_out_c7[530], l2d_l2b_decc_out_c7[608],
             l2d_l2b_decc_out_c7[375], l2d_l2b_decc_out_c7[453], l2d_l2b_decc_out_c7[531], l2d_l2b_decc_out_c7[609],
             l2d_l2b_decc_out_c7[376], l2d_l2b_decc_out_c7[454], l2d_l2b_decc_out_c7[532], l2d_l2b_decc_out_c7[610],
             l2d_l2b_decc_out_c7[377], l2d_l2b_decc_out_c7[455], l2d_l2b_decc_out_c7[533], l2d_l2b_decc_out_c7[611],
             l2d_l2b_decc_out_c7[378], l2d_l2b_decc_out_c7[456], l2d_l2b_decc_out_c7[534], l2d_l2b_decc_out_c7[612],
             l2d_l2b_decc_out_c7[379], l2d_l2b_decc_out_c7[457], l2d_l2b_decc_out_c7[535], l2d_l2b_decc_out_c7[613]};
assign wb_array4_din[39:0] =
            {l2d_l2b_decc_out_c7[380], l2d_l2b_decc_out_c7[458], l2d_l2b_decc_out_c7[536], l2d_l2b_decc_out_c7[614],
             l2d_l2b_decc_out_c7[381], l2d_l2b_decc_out_c7[459], l2d_l2b_decc_out_c7[537], l2d_l2b_decc_out_c7[615],
             l2d_l2b_decc_out_c7[382], l2d_l2b_decc_out_c7[460], l2d_l2b_decc_out_c7[538], l2d_l2b_decc_out_c7[616],
             l2d_l2b_decc_out_c7[383], l2d_l2b_decc_out_c7[461], l2d_l2b_decc_out_c7[539], l2d_l2b_decc_out_c7[617],
             l2d_l2b_decc_out_c7[384], l2d_l2b_decc_out_c7[462], l2d_l2b_decc_out_c7[540], l2d_l2b_decc_out_c7[618],
             l2d_l2b_decc_out_c7[385], l2d_l2b_decc_out_c7[463], l2d_l2b_decc_out_c7[541], l2d_l2b_decc_out_c7[619],
             l2d_l2b_decc_out_c7[386], l2d_l2b_decc_out_c7[464], l2d_l2b_decc_out_c7[542], l2d_l2b_decc_out_c7[620],
             l2d_l2b_decc_out_c7[387], l2d_l2b_decc_out_c7[465], l2d_l2b_decc_out_c7[543], l2d_l2b_decc_out_c7[621],
             l2d_l2b_decc_out_c7[388], l2d_l2b_decc_out_c7[466], l2d_l2b_decc_out_c7[544], l2d_l2b_decc_out_c7[622],
             l2d_l2b_decc_out_c7[389], l2d_l2b_decc_out_c7[467], l2d_l2b_decc_out_c7[545], l2d_l2b_decc_out_c7[623]};





n2_l2t_dp_16x160_cust  wb_array4
  (.dout   ( wb_array4_dout ),
   .din    ( wb_array4_din ),
   .rd_adr   ({1'b0, evict_l2t_l2b_wbrd_wl_r1_v4[2:0]}),
   .wr_adr   ({1'b0, evict_l2t_l2b_wbwr_wl_c8_v4[2:0]}),
   .read_en  (evict_l2t_l2b_wbrd_en_r1_v4),
   .wr_en    (evict_l2t_l2b_wbwr_wen_c8_v4),
   .word_wen ({4{evict_l2t_l2b_wbwr_wen_c8_v4}}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(wb_array4_scanin),
   .scan_out(wb_array4_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
    .tcu_scan_en(tcu_scan_en),
  .mbist_run (wb_mbist_enable),
  .mbist_wdata   (wb_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));

assign {wb_array_dout_unused[11:8],
             wb_array_dout[312], wb_array_dout[390], wb_array_dout[468], wb_array_dout[546],
             wb_array_dout[313], wb_array_dout[391], wb_array_dout[469], wb_array_dout[547],
             wb_array_dout[314], wb_array_dout[392], wb_array_dout[470], wb_array_dout[548],
             wb_array_dout[315], wb_array_dout[393], wb_array_dout[471], wb_array_dout[549],
             wb_array_dout[316], wb_array_dout[394], wb_array_dout[472], wb_array_dout[550],
             wb_array_dout[317], wb_array_dout[395], wb_array_dout[473], wb_array_dout[551],
             wb_array_dout[318], wb_array_dout[396], wb_array_dout[474], wb_array_dout[552],
             wb_array_dout[319], wb_array_dout[397], wb_array_dout[475], wb_array_dout[553],
             wb_array_dout[320], wb_array_dout[398], wb_array_dout[476], wb_array_dout[554],
             wb_array_dout[321], wb_array_dout[399], wb_array_dout[477], wb_array_dout[555],
             wb_array_dout[322], wb_array_dout[400], wb_array_dout[478], wb_array_dout[556],
             wb_array_dout[323], wb_array_dout[401], wb_array_dout[479], wb_array_dout[557],
             wb_array_dout[324], wb_array_dout[402], wb_array_dout[480], wb_array_dout[558],
             wb_array_dout[325], wb_array_dout[403], wb_array_dout[481], wb_array_dout[559],
             wb_array_dout[326], wb_array_dout[404], wb_array_dout[482], wb_array_dout[560],
             wb_array_dout[327], wb_array_dout[405], wb_array_dout[483], wb_array_dout[561],
             wb_array_dout[328], wb_array_dout[406], wb_array_dout[484], wb_array_dout[562],
             wb_array_dout[329], wb_array_dout[407], wb_array_dout[485], wb_array_dout[563],
             wb_array_dout[330], wb_array_dout[408], wb_array_dout[486], wb_array_dout[564],
             wb_array_dout[331], wb_array_dout[409], wb_array_dout[487], wb_array_dout[565],
             wb_array_dout[332], wb_array_dout[410], wb_array_dout[488], wb_array_dout[566],
             wb_array_dout[333], wb_array_dout[411], wb_array_dout[489], wb_array_dout[567],
             wb_array_dout[334], wb_array_dout[412], wb_array_dout[490], wb_array_dout[568],
             wb_array_dout[335], wb_array_dout[413], wb_array_dout[491], wb_array_dout[569],
             wb_array_dout[336], wb_array_dout[414], wb_array_dout[492], wb_array_dout[570],
             wb_array_dout[337], wb_array_dout[415], wb_array_dout[493], wb_array_dout[571],
             wb_array_dout[338], wb_array_dout[416], wb_array_dout[494], wb_array_dout[572],
             wb_array_dout[339], wb_array_dout[417], wb_array_dout[495], wb_array_dout[573],
             wb_array_dout[340], wb_array_dout[418], wb_array_dout[496], wb_array_dout[574],
             wb_array_dout[341], wb_array_dout[419], wb_array_dout[497], wb_array_dout[575],
             wb_array_dout[342], wb_array_dout[420], wb_array_dout[498], wb_array_dout[576],
             wb_array_dout[343], wb_array_dout[421], wb_array_dout[499], wb_array_dout[577],
             wb_array_dout[344], wb_array_dout[422], wb_array_dout[500], wb_array_dout[578],
             wb_array_dout[345], wb_array_dout[423], wb_array_dout[501], wb_array_dout[579],
             wb_array_dout[346], wb_array_dout[424], wb_array_dout[502], wb_array_dout[580],
             wb_array_dout[347], wb_array_dout[425], wb_array_dout[503], wb_array_dout[581],
             wb_array_dout[348], wb_array_dout[426], wb_array_dout[504], wb_array_dout[582],
             wb_array_dout[349], wb_array_dout[427], wb_array_dout[505], wb_array_dout[583],
             wb_array_dout[350], wb_array_dout[428], wb_array_dout[506], wb_array_dout[584]} = wb_array3_dout[159:0];

assign wb_array3_din[159:120] = {1'b0, 1'b0, 1'b0, 1'b0,
             l2d_l2b_decc_out_c7[312], l2d_l2b_decc_out_c7[390], l2d_l2b_decc_out_c7[468], l2d_l2b_decc_out_c7[546],
             l2d_l2b_decc_out_c7[313], l2d_l2b_decc_out_c7[391], l2d_l2b_decc_out_c7[469], l2d_l2b_decc_out_c7[547],
             l2d_l2b_decc_out_c7[314], l2d_l2b_decc_out_c7[392], l2d_l2b_decc_out_c7[470], l2d_l2b_decc_out_c7[548],
             l2d_l2b_decc_out_c7[315], l2d_l2b_decc_out_c7[393], l2d_l2b_decc_out_c7[471], l2d_l2b_decc_out_c7[549],
             l2d_l2b_decc_out_c7[316], l2d_l2b_decc_out_c7[394], l2d_l2b_decc_out_c7[472], l2d_l2b_decc_out_c7[550],
             l2d_l2b_decc_out_c7[317], l2d_l2b_decc_out_c7[395], l2d_l2b_decc_out_c7[473], l2d_l2b_decc_out_c7[551],
             l2d_l2b_decc_out_c7[318], l2d_l2b_decc_out_c7[396], l2d_l2b_decc_out_c7[474], l2d_l2b_decc_out_c7[552],
             l2d_l2b_decc_out_c7[319], l2d_l2b_decc_out_c7[397], l2d_l2b_decc_out_c7[475], l2d_l2b_decc_out_c7[553],
             l2d_l2b_decc_out_c7[320], l2d_l2b_decc_out_c7[398], l2d_l2b_decc_out_c7[476], l2d_l2b_decc_out_c7[554]};
assign wb_array3_din[119:80] =
            {l2d_l2b_decc_out_c7[321], l2d_l2b_decc_out_c7[399], l2d_l2b_decc_out_c7[477], l2d_l2b_decc_out_c7[555],
             l2d_l2b_decc_out_c7[322], l2d_l2b_decc_out_c7[400], l2d_l2b_decc_out_c7[478], l2d_l2b_decc_out_c7[556],
             l2d_l2b_decc_out_c7[323], l2d_l2b_decc_out_c7[401], l2d_l2b_decc_out_c7[479], l2d_l2b_decc_out_c7[557],
             l2d_l2b_decc_out_c7[324], l2d_l2b_decc_out_c7[402], l2d_l2b_decc_out_c7[480], l2d_l2b_decc_out_c7[558],
             l2d_l2b_decc_out_c7[325], l2d_l2b_decc_out_c7[403], l2d_l2b_decc_out_c7[481], l2d_l2b_decc_out_c7[559],
             l2d_l2b_decc_out_c7[326], l2d_l2b_decc_out_c7[404], l2d_l2b_decc_out_c7[482], l2d_l2b_decc_out_c7[560],
             l2d_l2b_decc_out_c7[327], l2d_l2b_decc_out_c7[405], l2d_l2b_decc_out_c7[483], l2d_l2b_decc_out_c7[561],
             l2d_l2b_decc_out_c7[328], l2d_l2b_decc_out_c7[406], l2d_l2b_decc_out_c7[484], l2d_l2b_decc_out_c7[562],
             l2d_l2b_decc_out_c7[329], l2d_l2b_decc_out_c7[407], l2d_l2b_decc_out_c7[485], l2d_l2b_decc_out_c7[563],
             l2d_l2b_decc_out_c7[330], l2d_l2b_decc_out_c7[408], l2d_l2b_decc_out_c7[486], l2d_l2b_decc_out_c7[564]};
assign wb_array3_din[79:40] =
            {l2d_l2b_decc_out_c7[331], l2d_l2b_decc_out_c7[409], l2d_l2b_decc_out_c7[487], l2d_l2b_decc_out_c7[565],
             l2d_l2b_decc_out_c7[332], l2d_l2b_decc_out_c7[410], l2d_l2b_decc_out_c7[488], l2d_l2b_decc_out_c7[566],
             l2d_l2b_decc_out_c7[333], l2d_l2b_decc_out_c7[411], l2d_l2b_decc_out_c7[489], l2d_l2b_decc_out_c7[567],
             l2d_l2b_decc_out_c7[334], l2d_l2b_decc_out_c7[412], l2d_l2b_decc_out_c7[490], l2d_l2b_decc_out_c7[568],
             l2d_l2b_decc_out_c7[335], l2d_l2b_decc_out_c7[413], l2d_l2b_decc_out_c7[491], l2d_l2b_decc_out_c7[569],
             l2d_l2b_decc_out_c7[336], l2d_l2b_decc_out_c7[414], l2d_l2b_decc_out_c7[492], l2d_l2b_decc_out_c7[570],
             l2d_l2b_decc_out_c7[337], l2d_l2b_decc_out_c7[415], l2d_l2b_decc_out_c7[493], l2d_l2b_decc_out_c7[571],
             l2d_l2b_decc_out_c7[338], l2d_l2b_decc_out_c7[416], l2d_l2b_decc_out_c7[494], l2d_l2b_decc_out_c7[572],
             l2d_l2b_decc_out_c7[339], l2d_l2b_decc_out_c7[417], l2d_l2b_decc_out_c7[495], l2d_l2b_decc_out_c7[573],
             l2d_l2b_decc_out_c7[340], l2d_l2b_decc_out_c7[418], l2d_l2b_decc_out_c7[496], l2d_l2b_decc_out_c7[574]};
assign wb_array3_din[39:0] =
            {l2d_l2b_decc_out_c7[341], l2d_l2b_decc_out_c7[419], l2d_l2b_decc_out_c7[497], l2d_l2b_decc_out_c7[575],
             l2d_l2b_decc_out_c7[342], l2d_l2b_decc_out_c7[420], l2d_l2b_decc_out_c7[498], l2d_l2b_decc_out_c7[576],
             l2d_l2b_decc_out_c7[343], l2d_l2b_decc_out_c7[421], l2d_l2b_decc_out_c7[499], l2d_l2b_decc_out_c7[577],
             l2d_l2b_decc_out_c7[344], l2d_l2b_decc_out_c7[422], l2d_l2b_decc_out_c7[500], l2d_l2b_decc_out_c7[578],
             l2d_l2b_decc_out_c7[345], l2d_l2b_decc_out_c7[423], l2d_l2b_decc_out_c7[501], l2d_l2b_decc_out_c7[579],
             l2d_l2b_decc_out_c7[346], l2d_l2b_decc_out_c7[424], l2d_l2b_decc_out_c7[502], l2d_l2b_decc_out_c7[580],
             l2d_l2b_decc_out_c7[347], l2d_l2b_decc_out_c7[425], l2d_l2b_decc_out_c7[503], l2d_l2b_decc_out_c7[581],
             l2d_l2b_decc_out_c7[348], l2d_l2b_decc_out_c7[426], l2d_l2b_decc_out_c7[504], l2d_l2b_decc_out_c7[582],
             l2d_l2b_decc_out_c7[349], l2d_l2b_decc_out_c7[427], l2d_l2b_decc_out_c7[505], l2d_l2b_decc_out_c7[583],
             l2d_l2b_decc_out_c7[350], l2d_l2b_decc_out_c7[428], l2d_l2b_decc_out_c7[506], l2d_l2b_decc_out_c7[584]};


n2_l2t_dp_16x160_cust  wb_array3
  (.dout   (wb_array3_dout ),
   .din    (wb_array3_din ),
   .rd_adr   ({1'b0, evict_l2t_l2b_wbrd_wl_r1_v3[2:0]}),
   .wr_adr   ({1'b0, evict_l2t_l2b_wbwr_wl_c8_v3[2:0]}),
   .read_en  (evict_l2t_l2b_wbrd_en_r1_v3),
   .wr_en    (evict_l2t_l2b_wbwr_wen_c8_v3),
   .word_wen ({4{evict_l2t_l2b_wbwr_wen_c8_v3}}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(wb_array3_scanin),
   .scan_out(wb_array3_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
    .tcu_scan_en(tcu_scan_en),
  .mbist_run (wb_mbist_enable),
  .mbist_wdata   (wb_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));

assign {wb_array_dout_unused[7:4],
             wb_array_dout[39], wb_array_dout[117], wb_array_dout[195], wb_array_dout[273],
             wb_array_dout[40], wb_array_dout[118], wb_array_dout[196], wb_array_dout[274],
             wb_array_dout[41], wb_array_dout[119], wb_array_dout[197], wb_array_dout[275],
             wb_array_dout[42], wb_array_dout[120], wb_array_dout[198], wb_array_dout[276],
             wb_array_dout[43], wb_array_dout[121], wb_array_dout[199], wb_array_dout[277],
             wb_array_dout[44], wb_array_dout[122], wb_array_dout[200], wb_array_dout[278],
             wb_array_dout[45], wb_array_dout[123], wb_array_dout[201], wb_array_dout[279],
             wb_array_dout[46], wb_array_dout[124], wb_array_dout[202], wb_array_dout[280],
             wb_array_dout[47], wb_array_dout[125], wb_array_dout[203], wb_array_dout[281],
             wb_array_dout[48], wb_array_dout[126], wb_array_dout[204], wb_array_dout[282],
             wb_array_dout[49], wb_array_dout[127], wb_array_dout[205], wb_array_dout[283],
             wb_array_dout[50], wb_array_dout[128], wb_array_dout[206], wb_array_dout[284],
             wb_array_dout[51], wb_array_dout[129], wb_array_dout[207], wb_array_dout[285],
             wb_array_dout[52], wb_array_dout[130], wb_array_dout[208], wb_array_dout[286],
             wb_array_dout[53], wb_array_dout[131], wb_array_dout[209], wb_array_dout[287],
             wb_array_dout[54], wb_array_dout[132], wb_array_dout[210], wb_array_dout[288],
             wb_array_dout[55], wb_array_dout[133], wb_array_dout[211], wb_array_dout[289],
             wb_array_dout[56], wb_array_dout[134], wb_array_dout[212], wb_array_dout[290],
             wb_array_dout[57], wb_array_dout[135], wb_array_dout[213], wb_array_dout[291],
             wb_array_dout[58], wb_array_dout[136], wb_array_dout[214], wb_array_dout[292],
             wb_array_dout[59], wb_array_dout[137], wb_array_dout[215], wb_array_dout[293],
             wb_array_dout[60], wb_array_dout[138], wb_array_dout[216], wb_array_dout[294],
             wb_array_dout[61], wb_array_dout[139], wb_array_dout[217], wb_array_dout[295],
             wb_array_dout[62], wb_array_dout[140], wb_array_dout[218], wb_array_dout[296],
             wb_array_dout[63], wb_array_dout[141], wb_array_dout[219], wb_array_dout[297],
             wb_array_dout[64], wb_array_dout[142], wb_array_dout[220], wb_array_dout[298],
             wb_array_dout[65], wb_array_dout[143], wb_array_dout[221], wb_array_dout[299],
             wb_array_dout[66], wb_array_dout[144], wb_array_dout[222], wb_array_dout[300],
             wb_array_dout[67], wb_array_dout[145], wb_array_dout[223], wb_array_dout[301],
             wb_array_dout[68], wb_array_dout[146], wb_array_dout[224], wb_array_dout[302],
             wb_array_dout[69], wb_array_dout[147], wb_array_dout[225], wb_array_dout[303],
             wb_array_dout[70], wb_array_dout[148], wb_array_dout[226], wb_array_dout[304],
             wb_array_dout[71], wb_array_dout[149], wb_array_dout[227], wb_array_dout[305],
             wb_array_dout[72], wb_array_dout[150], wb_array_dout[228], wb_array_dout[306],
             wb_array_dout[73], wb_array_dout[151], wb_array_dout[229], wb_array_dout[307],
             wb_array_dout[74], wb_array_dout[152], wb_array_dout[230], wb_array_dout[308],
             wb_array_dout[75], wb_array_dout[153], wb_array_dout[231], wb_array_dout[309],
             wb_array_dout[76], wb_array_dout[154], wb_array_dout[232], wb_array_dout[310],
             wb_array_dout[77], wb_array_dout[155], wb_array_dout[233], wb_array_dout[311]} = wb_array2_dout[159:0];

assign wb_array2_din[159:120] =  {1'b0, 1'b0, 1'b0, 1'b0,
             l2d_l2b_decc_out_c7[39], l2d_l2b_decc_out_c7[117], l2d_l2b_decc_out_c7[195], l2d_l2b_decc_out_c7[273],
             l2d_l2b_decc_out_c7[40], l2d_l2b_decc_out_c7[118], l2d_l2b_decc_out_c7[196], l2d_l2b_decc_out_c7[274],
             l2d_l2b_decc_out_c7[41], l2d_l2b_decc_out_c7[119], l2d_l2b_decc_out_c7[197], l2d_l2b_decc_out_c7[275],
             l2d_l2b_decc_out_c7[42], l2d_l2b_decc_out_c7[120], l2d_l2b_decc_out_c7[198], l2d_l2b_decc_out_c7[276],
             l2d_l2b_decc_out_c7[43], l2d_l2b_decc_out_c7[121], l2d_l2b_decc_out_c7[199], l2d_l2b_decc_out_c7[277],
             l2d_l2b_decc_out_c7[44], l2d_l2b_decc_out_c7[122], l2d_l2b_decc_out_c7[200], l2d_l2b_decc_out_c7[278],
             l2d_l2b_decc_out_c7[45], l2d_l2b_decc_out_c7[123], l2d_l2b_decc_out_c7[201], l2d_l2b_decc_out_c7[279],
             l2d_l2b_decc_out_c7[46], l2d_l2b_decc_out_c7[124], l2d_l2b_decc_out_c7[202], l2d_l2b_decc_out_c7[280],
             l2d_l2b_decc_out_c7[47], l2d_l2b_decc_out_c7[125], l2d_l2b_decc_out_c7[203], l2d_l2b_decc_out_c7[281]};
assign wb_array2_din[119:80] =  
            {l2d_l2b_decc_out_c7[48], l2d_l2b_decc_out_c7[126], l2d_l2b_decc_out_c7[204], l2d_l2b_decc_out_c7[282],
             l2d_l2b_decc_out_c7[49], l2d_l2b_decc_out_c7[127], l2d_l2b_decc_out_c7[205], l2d_l2b_decc_out_c7[283],
             l2d_l2b_decc_out_c7[50], l2d_l2b_decc_out_c7[128], l2d_l2b_decc_out_c7[206], l2d_l2b_decc_out_c7[284],
             l2d_l2b_decc_out_c7[51], l2d_l2b_decc_out_c7[129], l2d_l2b_decc_out_c7[207], l2d_l2b_decc_out_c7[285],
             l2d_l2b_decc_out_c7[52], l2d_l2b_decc_out_c7[130], l2d_l2b_decc_out_c7[208], l2d_l2b_decc_out_c7[286],
             l2d_l2b_decc_out_c7[53], l2d_l2b_decc_out_c7[131], l2d_l2b_decc_out_c7[209], l2d_l2b_decc_out_c7[287],
             l2d_l2b_decc_out_c7[54], l2d_l2b_decc_out_c7[132], l2d_l2b_decc_out_c7[210], l2d_l2b_decc_out_c7[288],
             l2d_l2b_decc_out_c7[55], l2d_l2b_decc_out_c7[133], l2d_l2b_decc_out_c7[211], l2d_l2b_decc_out_c7[289],
             l2d_l2b_decc_out_c7[56], l2d_l2b_decc_out_c7[134], l2d_l2b_decc_out_c7[212], l2d_l2b_decc_out_c7[290],
             l2d_l2b_decc_out_c7[57], l2d_l2b_decc_out_c7[135], l2d_l2b_decc_out_c7[213], l2d_l2b_decc_out_c7[291]};
assign wb_array2_din[79:40] = 
            {l2d_l2b_decc_out_c7[58], l2d_l2b_decc_out_c7[136], l2d_l2b_decc_out_c7[214], l2d_l2b_decc_out_c7[292],
             l2d_l2b_decc_out_c7[59], l2d_l2b_decc_out_c7[137], l2d_l2b_decc_out_c7[215], l2d_l2b_decc_out_c7[293],
             l2d_l2b_decc_out_c7[60], l2d_l2b_decc_out_c7[138], l2d_l2b_decc_out_c7[216], l2d_l2b_decc_out_c7[294],
             l2d_l2b_decc_out_c7[61], l2d_l2b_decc_out_c7[139], l2d_l2b_decc_out_c7[217], l2d_l2b_decc_out_c7[295],
             l2d_l2b_decc_out_c7[62], l2d_l2b_decc_out_c7[140], l2d_l2b_decc_out_c7[218], l2d_l2b_decc_out_c7[296],
             l2d_l2b_decc_out_c7[63], l2d_l2b_decc_out_c7[141], l2d_l2b_decc_out_c7[219], l2d_l2b_decc_out_c7[297],
             l2d_l2b_decc_out_c7[64], l2d_l2b_decc_out_c7[142], l2d_l2b_decc_out_c7[220], l2d_l2b_decc_out_c7[298],
             l2d_l2b_decc_out_c7[65], l2d_l2b_decc_out_c7[143], l2d_l2b_decc_out_c7[221], l2d_l2b_decc_out_c7[299],
             l2d_l2b_decc_out_c7[66], l2d_l2b_decc_out_c7[144], l2d_l2b_decc_out_c7[222], l2d_l2b_decc_out_c7[300],
             l2d_l2b_decc_out_c7[67], l2d_l2b_decc_out_c7[145], l2d_l2b_decc_out_c7[223], l2d_l2b_decc_out_c7[301]};

assign wb_array2_din[39:0] = 
            {l2d_l2b_decc_out_c7[68], l2d_l2b_decc_out_c7[146], l2d_l2b_decc_out_c7[224], l2d_l2b_decc_out_c7[302],
             l2d_l2b_decc_out_c7[69], l2d_l2b_decc_out_c7[147], l2d_l2b_decc_out_c7[225], l2d_l2b_decc_out_c7[303],
             l2d_l2b_decc_out_c7[70], l2d_l2b_decc_out_c7[148], l2d_l2b_decc_out_c7[226], l2d_l2b_decc_out_c7[304],
             l2d_l2b_decc_out_c7[71], l2d_l2b_decc_out_c7[149], l2d_l2b_decc_out_c7[227], l2d_l2b_decc_out_c7[305],
             l2d_l2b_decc_out_c7[72], l2d_l2b_decc_out_c7[150], l2d_l2b_decc_out_c7[228], l2d_l2b_decc_out_c7[306],
             l2d_l2b_decc_out_c7[73], l2d_l2b_decc_out_c7[151], l2d_l2b_decc_out_c7[229], l2d_l2b_decc_out_c7[307],
             l2d_l2b_decc_out_c7[74], l2d_l2b_decc_out_c7[152], l2d_l2b_decc_out_c7[230], l2d_l2b_decc_out_c7[308],
             l2d_l2b_decc_out_c7[75], l2d_l2b_decc_out_c7[153], l2d_l2b_decc_out_c7[231], l2d_l2b_decc_out_c7[309],
             l2d_l2b_decc_out_c7[76], l2d_l2b_decc_out_c7[154], l2d_l2b_decc_out_c7[232], l2d_l2b_decc_out_c7[310],
             l2d_l2b_decc_out_c7[77], l2d_l2b_decc_out_c7[155], l2d_l2b_decc_out_c7[233], l2d_l2b_decc_out_c7[311]};


n2_l2t_dp_16x160_cust  wb_array2
  (.dout   (wb_array2_dout ),
   .din    (wb_array2_din ),
   .rd_adr   ({1'b0, evict_l2t_l2b_wbrd_wl_r1_v2[2:0]}),
   .wr_adr   ({1'b0, evict_l2t_l2b_wbwr_wl_c8_v2[2:0]}),
   .read_en  (evict_l2t_l2b_wbrd_en_r1_v2),
   .wr_en    (evict_l2t_l2b_wbwr_wen_c8_v2),
   .word_wen ({4{evict_l2t_l2b_wbwr_wen_c8_v2}}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(wb_array2_scanin),
   .scan_out(wb_array2_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
    .tcu_scan_en(tcu_scan_en),
  .mbist_run (wb_mbist_enable),
  .mbist_wdata   (wb_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));

assign {wb_array_dout_unused[3:0],
             wb_array_dout[0], wb_array_dout[78], wb_array_dout[156], wb_array_dout[234],
             wb_array_dout[1], wb_array_dout[79], wb_array_dout[157], wb_array_dout[235],
             wb_array_dout[2], wb_array_dout[80], wb_array_dout[158], wb_array_dout[236],
             wb_array_dout[3], wb_array_dout[81], wb_array_dout[159], wb_array_dout[237],
             wb_array_dout[4], wb_array_dout[82], wb_array_dout[160], wb_array_dout[238],
             wb_array_dout[5], wb_array_dout[83], wb_array_dout[161], wb_array_dout[239],
             wb_array_dout[6], wb_array_dout[84], wb_array_dout[162], wb_array_dout[240],
             wb_array_dout[7], wb_array_dout[85], wb_array_dout[163], wb_array_dout[241],
             wb_array_dout[8], wb_array_dout[86], wb_array_dout[164], wb_array_dout[242],
             wb_array_dout[9], wb_array_dout[87], wb_array_dout[165], wb_array_dout[243],
             wb_array_dout[10], wb_array_dout[88], wb_array_dout[166], wb_array_dout[244],
             wb_array_dout[11], wb_array_dout[89], wb_array_dout[167], wb_array_dout[245],
             wb_array_dout[12], wb_array_dout[90], wb_array_dout[168], wb_array_dout[246],
             wb_array_dout[13], wb_array_dout[91], wb_array_dout[169], wb_array_dout[247],
             wb_array_dout[14], wb_array_dout[92], wb_array_dout[170], wb_array_dout[248],
             wb_array_dout[15], wb_array_dout[93], wb_array_dout[171], wb_array_dout[249],
             wb_array_dout[16], wb_array_dout[94], wb_array_dout[172], wb_array_dout[250],
             wb_array_dout[17], wb_array_dout[95], wb_array_dout[173], wb_array_dout[251],
             wb_array_dout[18], wb_array_dout[96], wb_array_dout[174], wb_array_dout[252],
             wb_array_dout[19], wb_array_dout[97], wb_array_dout[175], wb_array_dout[253],
             wb_array_dout[20], wb_array_dout[98], wb_array_dout[176], wb_array_dout[254],
             wb_array_dout[21], wb_array_dout[99], wb_array_dout[177], wb_array_dout[255],
             wb_array_dout[22], wb_array_dout[100], wb_array_dout[178], wb_array_dout[256],
             wb_array_dout[23], wb_array_dout[101], wb_array_dout[179], wb_array_dout[257],
             wb_array_dout[24], wb_array_dout[102], wb_array_dout[180], wb_array_dout[258],
             wb_array_dout[25], wb_array_dout[103], wb_array_dout[181], wb_array_dout[259],
             wb_array_dout[26], wb_array_dout[104], wb_array_dout[182], wb_array_dout[260],
             wb_array_dout[27], wb_array_dout[105], wb_array_dout[183], wb_array_dout[261],
             wb_array_dout[28], wb_array_dout[106], wb_array_dout[184], wb_array_dout[262],
             wb_array_dout[29], wb_array_dout[107], wb_array_dout[185], wb_array_dout[263],
             wb_array_dout[30], wb_array_dout[108], wb_array_dout[186], wb_array_dout[264],
             wb_array_dout[31], wb_array_dout[109], wb_array_dout[187], wb_array_dout[265],
             wb_array_dout[32], wb_array_dout[110], wb_array_dout[188], wb_array_dout[266],
             wb_array_dout[33], wb_array_dout[111], wb_array_dout[189], wb_array_dout[267],
             wb_array_dout[34], wb_array_dout[112], wb_array_dout[190], wb_array_dout[268],
             wb_array_dout[35], wb_array_dout[113], wb_array_dout[191], wb_array_dout[269],
             wb_array_dout[36], wb_array_dout[114], wb_array_dout[192], wb_array_dout[270],
             wb_array_dout[37], wb_array_dout[115], wb_array_dout[193], wb_array_dout[271],
             wb_array_dout[38], wb_array_dout[116], wb_array_dout[194], wb_array_dout[272]} = wb_array1_dout[159:0];

assign wb_array1_din[159:120] = {1'b0, 1'b0, 1'b0, 1'b0,
             l2d_l2b_decc_out_c7[0], l2d_l2b_decc_out_c7[78], l2d_l2b_decc_out_c7[156], l2d_l2b_decc_out_c7[234],
             l2d_l2b_decc_out_c7[1], l2d_l2b_decc_out_c7[79], l2d_l2b_decc_out_c7[157], l2d_l2b_decc_out_c7[235],
             l2d_l2b_decc_out_c7[2], l2d_l2b_decc_out_c7[80], l2d_l2b_decc_out_c7[158], l2d_l2b_decc_out_c7[236],
             l2d_l2b_decc_out_c7[3], l2d_l2b_decc_out_c7[81], l2d_l2b_decc_out_c7[159], l2d_l2b_decc_out_c7[237],
             l2d_l2b_decc_out_c7[4], l2d_l2b_decc_out_c7[82], l2d_l2b_decc_out_c7[160], l2d_l2b_decc_out_c7[238],
             l2d_l2b_decc_out_c7[5], l2d_l2b_decc_out_c7[83], l2d_l2b_decc_out_c7[161], l2d_l2b_decc_out_c7[239],
             l2d_l2b_decc_out_c7[6], l2d_l2b_decc_out_c7[84], l2d_l2b_decc_out_c7[162], l2d_l2b_decc_out_c7[240],
             l2d_l2b_decc_out_c7[7], l2d_l2b_decc_out_c7[85], l2d_l2b_decc_out_c7[163], l2d_l2b_decc_out_c7[241],
             l2d_l2b_decc_out_c7[8], l2d_l2b_decc_out_c7[86], l2d_l2b_decc_out_c7[164], l2d_l2b_decc_out_c7[242]};
assign wb_array1_din[119:80] = 
            {l2d_l2b_decc_out_c7[9], l2d_l2b_decc_out_c7[87], l2d_l2b_decc_out_c7[165], l2d_l2b_decc_out_c7[243],
             l2d_l2b_decc_out_c7[10], l2d_l2b_decc_out_c7[88], l2d_l2b_decc_out_c7[166], l2d_l2b_decc_out_c7[244],
             l2d_l2b_decc_out_c7[11], l2d_l2b_decc_out_c7[89], l2d_l2b_decc_out_c7[167], l2d_l2b_decc_out_c7[245],
             l2d_l2b_decc_out_c7[12], l2d_l2b_decc_out_c7[90], l2d_l2b_decc_out_c7[168], l2d_l2b_decc_out_c7[246],
             l2d_l2b_decc_out_c7[13], l2d_l2b_decc_out_c7[91], l2d_l2b_decc_out_c7[169], l2d_l2b_decc_out_c7[247],
             l2d_l2b_decc_out_c7[14], l2d_l2b_decc_out_c7[92], l2d_l2b_decc_out_c7[170], l2d_l2b_decc_out_c7[248],
             l2d_l2b_decc_out_c7[15], l2d_l2b_decc_out_c7[93], l2d_l2b_decc_out_c7[171], l2d_l2b_decc_out_c7[249],
             l2d_l2b_decc_out_c7[16], l2d_l2b_decc_out_c7[94], l2d_l2b_decc_out_c7[172], l2d_l2b_decc_out_c7[250],
             l2d_l2b_decc_out_c7[17], l2d_l2b_decc_out_c7[95], l2d_l2b_decc_out_c7[173], l2d_l2b_decc_out_c7[251],
             l2d_l2b_decc_out_c7[18], l2d_l2b_decc_out_c7[96], l2d_l2b_decc_out_c7[174], l2d_l2b_decc_out_c7[252]};
assign wb_array1_din[79:40] = 
            {l2d_l2b_decc_out_c7[19], l2d_l2b_decc_out_c7[97], l2d_l2b_decc_out_c7[175], l2d_l2b_decc_out_c7[253],
             l2d_l2b_decc_out_c7[20], l2d_l2b_decc_out_c7[98], l2d_l2b_decc_out_c7[176], l2d_l2b_decc_out_c7[254],
             l2d_l2b_decc_out_c7[21], l2d_l2b_decc_out_c7[99], l2d_l2b_decc_out_c7[177], l2d_l2b_decc_out_c7[255],
             l2d_l2b_decc_out_c7[22], l2d_l2b_decc_out_c7[100], l2d_l2b_decc_out_c7[178], l2d_l2b_decc_out_c7[256],
             l2d_l2b_decc_out_c7[23], l2d_l2b_decc_out_c7[101], l2d_l2b_decc_out_c7[179], l2d_l2b_decc_out_c7[257],
             l2d_l2b_decc_out_c7[24], l2d_l2b_decc_out_c7[102], l2d_l2b_decc_out_c7[180], l2d_l2b_decc_out_c7[258],
             l2d_l2b_decc_out_c7[25], l2d_l2b_decc_out_c7[103], l2d_l2b_decc_out_c7[181], l2d_l2b_decc_out_c7[259],
             l2d_l2b_decc_out_c7[26], l2d_l2b_decc_out_c7[104], l2d_l2b_decc_out_c7[182], l2d_l2b_decc_out_c7[260],
             l2d_l2b_decc_out_c7[27], l2d_l2b_decc_out_c7[105], l2d_l2b_decc_out_c7[183], l2d_l2b_decc_out_c7[261],
             l2d_l2b_decc_out_c7[28], l2d_l2b_decc_out_c7[106], l2d_l2b_decc_out_c7[184], l2d_l2b_decc_out_c7[262]};
assign wb_array1_din[39:0] = 
            {l2d_l2b_decc_out_c7[29], l2d_l2b_decc_out_c7[107], l2d_l2b_decc_out_c7[185], l2d_l2b_decc_out_c7[263],
             l2d_l2b_decc_out_c7[30], l2d_l2b_decc_out_c7[108], l2d_l2b_decc_out_c7[186], l2d_l2b_decc_out_c7[264],
             l2d_l2b_decc_out_c7[31], l2d_l2b_decc_out_c7[109], l2d_l2b_decc_out_c7[187], l2d_l2b_decc_out_c7[265],
             l2d_l2b_decc_out_c7[32], l2d_l2b_decc_out_c7[110], l2d_l2b_decc_out_c7[188], l2d_l2b_decc_out_c7[266],
             l2d_l2b_decc_out_c7[33], l2d_l2b_decc_out_c7[111], l2d_l2b_decc_out_c7[189], l2d_l2b_decc_out_c7[267],
             l2d_l2b_decc_out_c7[34], l2d_l2b_decc_out_c7[112], l2d_l2b_decc_out_c7[190], l2d_l2b_decc_out_c7[268],
             l2d_l2b_decc_out_c7[35], l2d_l2b_decc_out_c7[113], l2d_l2b_decc_out_c7[191], l2d_l2b_decc_out_c7[269],
             l2d_l2b_decc_out_c7[36], l2d_l2b_decc_out_c7[114], l2d_l2b_decc_out_c7[192], l2d_l2b_decc_out_c7[270],
             l2d_l2b_decc_out_c7[37], l2d_l2b_decc_out_c7[115], l2d_l2b_decc_out_c7[193], l2d_l2b_decc_out_c7[271],
             l2d_l2b_decc_out_c7[38], l2d_l2b_decc_out_c7[116], l2d_l2b_decc_out_c7[194], l2d_l2b_decc_out_c7[272]};


n2_l2t_dp_16x160_cust  wb_array1
  (.dout   ( wb_array1_dout ),
   .din    ( wb_array1_din ),
   .rd_adr   ({1'b0, evict_l2t_l2b_wbrd_wl_r1_v1[2:0]}),
   .wr_adr   ({1'b0, evict_l2t_l2b_wbwr_wl_c8_v1[2:0]}),
   .read_en  (evict_l2t_l2b_wbrd_en_r1_v1),
   .wr_en    (evict_l2t_l2b_wbwr_wen_c8_v1),
   .word_wen ({4{evict_l2t_l2b_wbwr_wen_c8_v1}}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(wb_array1_scanin),
   .scan_out(wb_array1_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
    .tcu_scan_en(tcu_scan_en),
  .mbist_run (wb_mbist_enable),
  .mbist_wdata   (wb_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));


////////////////////////////////////////////////////////////////////////////////

l2b_evict_dp evict
 (
  // Outputs
  .evict_l2b_mcu_wr_data_r5               (evict_l2b_mcu_wr_data_r5[63:0]),
  .evict_l2b_mcu_data_vld_r5              (evict_l2b_mcu_data_vld_r5),
  .evict_l2b_mcu_data_mecc_r5             (l2b_evict_l2b_mcu_data_mecc_r5),
  .evict_l2b_l2t_ev_uerr_r5               (l2b_l2t_ev_uerr_r5),
  .evict_l2b_l2t_ev_cerr_r5               (l2b_l2t_ev_cerr_r5),
  .evict_l2t_l2b_wbrd_en_r1_v1            (evict_l2t_l2b_wbrd_en_r1_v1),
  .evict_l2t_l2b_wbrd_en_r1_v2            (evict_l2t_l2b_wbrd_en_r1_v2),
  .evict_l2t_l2b_wbrd_en_r1_v3            (evict_l2t_l2b_wbrd_en_r1_v3),
  .evict_l2t_l2b_wbrd_en_r1_v4            (evict_l2t_l2b_wbrd_en_r1_v4),
  .evict_l2t_l2b_wbrd_wl_r1_v1            (evict_l2t_l2b_wbrd_wl_r1_v1[2:0]),
  .evict_l2t_l2b_wbrd_wl_r1_v2            (evict_l2t_l2b_wbrd_wl_r1_v2[2:0]),
  .evict_l2t_l2b_wbrd_wl_r1_v3            (evict_l2t_l2b_wbrd_wl_r1_v3[2:0]),
  .evict_l2t_l2b_wbrd_wl_r1_v4            (evict_l2t_l2b_wbrd_wl_r1_v4[2:0]),
  .evict_l2t_l2b_wbwr_wen_c8_v1           (evict_l2t_l2b_wbwr_wen_c8_v1),
  .evict_l2t_l2b_wbwr_wen_c8_v2           (evict_l2t_l2b_wbwr_wen_c8_v2),
  .evict_l2t_l2b_wbwr_wen_c8_v3           (evict_l2t_l2b_wbwr_wen_c8_v3),
  .evict_l2t_l2b_wbwr_wen_c8_v4           (evict_l2t_l2b_wbwr_wen_c8_v4),
  .evict_l2t_l2b_wbwr_wl_c8_v1            (evict_l2t_l2b_wbwr_wl_c8_v1[2:0]),
  .evict_l2t_l2b_wbwr_wl_c8_v2            (evict_l2t_l2b_wbwr_wl_c8_v2[2:0]),
  .evict_l2t_l2b_wbwr_wl_c8_v3            (evict_l2t_l2b_wbwr_wl_c8_v3[2:0]),
  .evict_l2t_l2b_wbwr_wl_c8_v4            (evict_l2t_l2b_wbwr_wl_c8_v4[2:0]),
  .evict_l2t_l2b_rdma_rden_r1_v1          (evict_l2t_l2b_rdma_rden_r1_v1),
  .evict_l2t_l2b_rdma_rden_r1_v2          (evict_l2t_l2b_rdma_rden_r1_v2),
  .evict_l2t_l2b_rdma_rden_r1_v3          (evict_l2t_l2b_rdma_rden_r1_v3),
  .evict_l2t_l2b_rdma_rden_r1_v4          (evict_l2t_l2b_rdma_rden_r1_v4),
  .evict_l2t_l2b_rdma_rdwl_r1_v1          (evict_l2t_l2b_rdma_rdwl_r1_v1[1:0]),
  .evict_l2t_l2b_rdma_rdwl_r1_v2          (evict_l2t_l2b_rdma_rdwl_r1_v2[1:0]),
  .evict_l2t_l2b_rdma_rdwl_r1_v3          (evict_l2t_l2b_rdma_rdwl_r1_v3[1:0]),
  .evict_l2t_l2b_rdma_rdwl_r1_v4          (evict_l2t_l2b_rdma_rdwl_r1_v4[1:0]),
  .evict_l2t_l2b_rdma_wren_s3             (evict_l2t_l2b_rdma_wren_s3[15:0]),
  .evict_l2t_l2b_rdma_wren_s3_v4          (evict_l2t_l2b_rdma_wren_s3_v4),
  .evict_l2t_l2b_rdma_wren_s3_v3          (evict_l2t_l2b_rdma_wren_s3_v3),
  .evict_l2t_l2b_rdma_wren_s3_v2          (evict_l2t_l2b_rdma_wren_s3_v2),
  .evict_l2t_l2b_rdma_wren_s3_v1          (evict_l2t_l2b_rdma_wren_s3_v1),
  .evict_l2t_l2b_rdma_wrwl_s3_v1          (evict_l2t_l2b_rdma_wrwl_s3_v1[1:0]),
  .evict_l2t_l2b_rdma_wrwl_s3_v2          (evict_l2t_l2b_rdma_wrwl_s3_v2[1:0]),
  .evict_l2t_l2b_rdma_wrwl_s3_v3          (evict_l2t_l2b_rdma_wrwl_s3_v3[1:0]),
  .evict_l2t_l2b_rdma_wrwl_s3_v4          (evict_l2t_l2b_rdma_wrwl_s3_v4[1:0]),
  // Inputs
  .scan_in(evict_scanin),
  .scan_out(evict_scanout),
  .l2clk                                 (l2clk),
  .wmr_l                               (wmr_l),
  .mbist_addr(mbist_addr[2:0]),
 // .mbist_compare_read_sel                 (mbist_compare_read_sel[2:0]),
  .select_delay_mcu                 (select_delay_mcu),
  .wb_mbist_data_in(wb_mbist_data_in[7:0]),
  .mbist_wb_array_wr_en(mbist_wb_array_wr_en),
  .mbist_wb_array_rd_en(mbist_wb_array_rd_en),
  .mbist_rdma_array_wr_en(mbist_rdma_array_wr_en),
  .mbist_rdma_array_rd_en(mbist_rdma_array_rd_en),
  .mbist_sel_wb_arrays(mbist_sel_wb_arrays),
  .mbist_evict_muxsel(mbist_evict_muxsel[4:0]),
  .mbist_run(mbist_run),
  .tcu_aclk		    (aclk),
  .tcu_bclk		    (bclk),
  .tcu_scan_en              (tcu_scan_en),
  .tcu_pce_ov		    (tcu_pce_ov),
  .tcu_clk_stop             (1'b0),
  .tcu_muxtest		    (tcu_muxtest),
  .l2t_l2b_wbrd_en_r0               (l2t_l2b_wbrd_en_r0),
  .wb_array_dout                        (wb_array_dout[623:0]),
  .l2t_l2b_evict_en_r0              (l2t_l2b_evict_en_r0),
  .l2t_l2b_ev_dword_r0              (l2t_l2b_ev_dword_r0[2:0]),
  .l2t_l2b_rdma_rden_r0             (l2t_l2b_rdma_rden_r0),
  .rdma_array_dout                      (rdma_array_dout[623:0]),
  .l2t_l2b_wbrd_wl_r0               (l2t_l2b_wbrd_wl_r0[2:0]),
  .l2t_l2b_wbwr_wen_c6              (l2t_l2b_wbwr_wen_c6[0]),
  .l2t_l2b_wbwr_wl_c6               (l2t_l2b_wbwr_wl_c6[2:0]),
  .l2t_l2b_rdma_rdwl_r0             (l2t_l2b_rdma_rdwl_r0[1:0]),
  .l2t_l2b_rdma_wren_s2             (l2t_l2b_rdma_wren_s2[15:0]),
  .l2t_l2b_rdma_wrwl_s2             (l2t_l2b_rdma_wrwl_s2[1:0]),
  .tcu_dectest(tcu_dectest),
  .wb_or_rdma_rw_fail(wb_or_rdma_rw_fail)
	); 



l2b_siu_dp	siu_interface (
 .sii_l2t_req                 (sii_l2t_req[31:0]),
 .sii_l2b_ecc                 (sii_l2b_ecc[6:0]),
 .tcu_aclk                (tcu_aclk),
 .tcu_bclk                (tcu_bclk),
 .tcu_scan_en              (tcu_scan_en),
 .tcu_pce_ov                  (tcu_pce_ov),
 .tcu_clk_stop             (1'b0),
 .scan_in(siu_interface_scanin),
 .scan_out(siu_interface_scanout),
 .l2clk                       (l2clk),
 .evict_l2b_rdma_array_din    (evict_rdma_array_din[623:0])
	);







////////////////////////////////////////////////////////////////////////////////

assign {rdma_array_dout_unused[15:12],
             rdma_array_dout[351], rdma_array_dout[429], rdma_array_dout[507], rdma_array_dout[585],
             rdma_array_dout[352], rdma_array_dout[430], rdma_array_dout[508], rdma_array_dout[586],
             rdma_array_dout[353], rdma_array_dout[431], rdma_array_dout[509], rdma_array_dout[587],
             rdma_array_dout[354], rdma_array_dout[432], rdma_array_dout[510], rdma_array_dout[588],
             rdma_array_dout[355], rdma_array_dout[433], rdma_array_dout[511], rdma_array_dout[589],
             rdma_array_dout[356], rdma_array_dout[434], rdma_array_dout[512], rdma_array_dout[590],
             rdma_array_dout[357], rdma_array_dout[435], rdma_array_dout[513], rdma_array_dout[591],
             rdma_array_dout[358], rdma_array_dout[436], rdma_array_dout[514], rdma_array_dout[592],
             rdma_array_dout[359], rdma_array_dout[437], rdma_array_dout[515], rdma_array_dout[593],
             rdma_array_dout[360], rdma_array_dout[438], rdma_array_dout[516], rdma_array_dout[594],
             rdma_array_dout[361], rdma_array_dout[439], rdma_array_dout[517], rdma_array_dout[595],
             rdma_array_dout[362], rdma_array_dout[440], rdma_array_dout[518], rdma_array_dout[596],
             rdma_array_dout[363], rdma_array_dout[441], rdma_array_dout[519], rdma_array_dout[597],
             rdma_array_dout[364], rdma_array_dout[442], rdma_array_dout[520], rdma_array_dout[598],
             rdma_array_dout[365], rdma_array_dout[443], rdma_array_dout[521], rdma_array_dout[599],
             rdma_array_dout[366], rdma_array_dout[444], rdma_array_dout[522], rdma_array_dout[600],
             rdma_array_dout[367], rdma_array_dout[445], rdma_array_dout[523], rdma_array_dout[601],
             rdma_array_dout[368], rdma_array_dout[446], rdma_array_dout[524], rdma_array_dout[602],
             rdma_array_dout[369], rdma_array_dout[447], rdma_array_dout[525], rdma_array_dout[603],
             rdma_array_dout[370], rdma_array_dout[448], rdma_array_dout[526], rdma_array_dout[604],
             rdma_array_dout[371], rdma_array_dout[449], rdma_array_dout[527], rdma_array_dout[605],
             rdma_array_dout[372], rdma_array_dout[450], rdma_array_dout[528], rdma_array_dout[606],
             rdma_array_dout[373], rdma_array_dout[451], rdma_array_dout[529], rdma_array_dout[607],
             rdma_array_dout[374], rdma_array_dout[452], rdma_array_dout[530], rdma_array_dout[608],
             rdma_array_dout[375], rdma_array_dout[453], rdma_array_dout[531], rdma_array_dout[609],
             rdma_array_dout[376], rdma_array_dout[454], rdma_array_dout[532], rdma_array_dout[610],
             rdma_array_dout[377], rdma_array_dout[455], rdma_array_dout[533], rdma_array_dout[611],
             rdma_array_dout[378], rdma_array_dout[456], rdma_array_dout[534], rdma_array_dout[612],
             rdma_array_dout[379], rdma_array_dout[457], rdma_array_dout[535], rdma_array_dout[613],
             rdma_array_dout[380], rdma_array_dout[458], rdma_array_dout[536], rdma_array_dout[614],
             rdma_array_dout[381], rdma_array_dout[459], rdma_array_dout[537], rdma_array_dout[615],
             rdma_array_dout[382], rdma_array_dout[460], rdma_array_dout[538], rdma_array_dout[616],
             rdma_array_dout[383], rdma_array_dout[461], rdma_array_dout[539], rdma_array_dout[617],
             rdma_array_dout[384], rdma_array_dout[462], rdma_array_dout[540], rdma_array_dout[618],
             rdma_array_dout[385], rdma_array_dout[463], rdma_array_dout[541], rdma_array_dout[619],
             rdma_array_dout[386], rdma_array_dout[464], rdma_array_dout[542], rdma_array_dout[620],
             rdma_array_dout[387], rdma_array_dout[465], rdma_array_dout[543], rdma_array_dout[621],
             rdma_array_dout[388], rdma_array_dout[466], rdma_array_dout[544], rdma_array_dout[622],
             rdma_array_dout[389], rdma_array_dout[467], rdma_array_dout[545], rdma_array_dout[623]} = rdma_array4_dout[159:0];



assign rdma_array4_din[159:120] = {1'b0, 1'b0, 1'b0, 1'b0,
             evict_rdma_array_din[351], evict_rdma_array_din[429], evict_rdma_array_din[507], evict_rdma_array_din[585],
             evict_rdma_array_din[352], evict_rdma_array_din[430], evict_rdma_array_din[508], evict_rdma_array_din[586],
             evict_rdma_array_din[353], evict_rdma_array_din[431], evict_rdma_array_din[509], evict_rdma_array_din[587],
             evict_rdma_array_din[354], evict_rdma_array_din[432], evict_rdma_array_din[510], evict_rdma_array_din[588],
             evict_rdma_array_din[355], evict_rdma_array_din[433], evict_rdma_array_din[511], evict_rdma_array_din[589],
             evict_rdma_array_din[356], evict_rdma_array_din[434], evict_rdma_array_din[512], evict_rdma_array_din[590],
             evict_rdma_array_din[357], evict_rdma_array_din[435], evict_rdma_array_din[513], evict_rdma_array_din[591],
             evict_rdma_array_din[358], evict_rdma_array_din[436], evict_rdma_array_din[514], evict_rdma_array_din[592],
             evict_rdma_array_din[359], evict_rdma_array_din[437], evict_rdma_array_din[515], evict_rdma_array_din[593]};
assign rdma_array4_din[119:80] =
            {evict_rdma_array_din[360], evict_rdma_array_din[438], evict_rdma_array_din[516], evict_rdma_array_din[594],
             evict_rdma_array_din[361], evict_rdma_array_din[439], evict_rdma_array_din[517], evict_rdma_array_din[595],
             evict_rdma_array_din[362], evict_rdma_array_din[440], evict_rdma_array_din[518], evict_rdma_array_din[596],
             evict_rdma_array_din[363], evict_rdma_array_din[441], evict_rdma_array_din[519], evict_rdma_array_din[597],
             evict_rdma_array_din[364], evict_rdma_array_din[442], evict_rdma_array_din[520], evict_rdma_array_din[598],
             evict_rdma_array_din[365], evict_rdma_array_din[443], evict_rdma_array_din[521], evict_rdma_array_din[599],
             evict_rdma_array_din[366], evict_rdma_array_din[444], evict_rdma_array_din[522], evict_rdma_array_din[600],
             evict_rdma_array_din[367], evict_rdma_array_din[445], evict_rdma_array_din[523], evict_rdma_array_din[601],
             evict_rdma_array_din[368], evict_rdma_array_din[446], evict_rdma_array_din[524], evict_rdma_array_din[602],
             evict_rdma_array_din[369], evict_rdma_array_din[447], evict_rdma_array_din[525], evict_rdma_array_din[603]};
assign rdma_array4_din[79:40] =
            {evict_rdma_array_din[370], evict_rdma_array_din[448], evict_rdma_array_din[526], evict_rdma_array_din[604],
             evict_rdma_array_din[371], evict_rdma_array_din[449], evict_rdma_array_din[527], evict_rdma_array_din[605],
             evict_rdma_array_din[372], evict_rdma_array_din[450], evict_rdma_array_din[528], evict_rdma_array_din[606],
             evict_rdma_array_din[373], evict_rdma_array_din[451], evict_rdma_array_din[529], evict_rdma_array_din[607],
             evict_rdma_array_din[374], evict_rdma_array_din[452], evict_rdma_array_din[530], evict_rdma_array_din[608],
             evict_rdma_array_din[375], evict_rdma_array_din[453], evict_rdma_array_din[531], evict_rdma_array_din[609],
             evict_rdma_array_din[376], evict_rdma_array_din[454], evict_rdma_array_din[532], evict_rdma_array_din[610],
             evict_rdma_array_din[377], evict_rdma_array_din[455], evict_rdma_array_din[533], evict_rdma_array_din[611],
             evict_rdma_array_din[378], evict_rdma_array_din[456], evict_rdma_array_din[534], evict_rdma_array_din[612],
             evict_rdma_array_din[379], evict_rdma_array_din[457], evict_rdma_array_din[535], evict_rdma_array_din[613]};
assign rdma_array4_din[39:0] =
            {evict_rdma_array_din[380], evict_rdma_array_din[458], evict_rdma_array_din[536], evict_rdma_array_din[614],
             evict_rdma_array_din[381], evict_rdma_array_din[459], evict_rdma_array_din[537], evict_rdma_array_din[615],
             evict_rdma_array_din[382], evict_rdma_array_din[460], evict_rdma_array_din[538], evict_rdma_array_din[616],
             evict_rdma_array_din[383], evict_rdma_array_din[461], evict_rdma_array_din[539], evict_rdma_array_din[617],
             evict_rdma_array_din[384], evict_rdma_array_din[462], evict_rdma_array_din[540], evict_rdma_array_din[618],
             evict_rdma_array_din[385], evict_rdma_array_din[463], evict_rdma_array_din[541], evict_rdma_array_din[619],
             evict_rdma_array_din[386], evict_rdma_array_din[464], evict_rdma_array_din[542], evict_rdma_array_din[620],
             evict_rdma_array_din[387], evict_rdma_array_din[465], evict_rdma_array_din[543], evict_rdma_array_din[621],
             evict_rdma_array_din[388], evict_rdma_array_din[466], evict_rdma_array_din[544], evict_rdma_array_din[622],
             evict_rdma_array_din[389], evict_rdma_array_din[467], evict_rdma_array_din[545], evict_rdma_array_din[623]};



n2_l2t_dp_16x160_cust  rdma_array4
  (.dout   ( rdma_array4_dout),
   .din    ( rdma_array4_din ),
   .rd_adr   ({1'b0, 1'b0, evict_l2t_l2b_rdma_rdwl_r1_v4[1:0]}),
   .wr_adr   ({1'b0, 1'b0, evict_l2t_l2b_rdma_wrwl_s3_v4[1:0]}),
   .read_en  (evict_l2t_l2b_rdma_rden_r1_v4),
   .wr_en    (evict_l2t_l2b_rdma_wren_s3_v4),
   .word_wen ({evict_l2t_l2b_rdma_wren_s3[6], evict_l2t_l2b_rdma_wren_s3[4],
               evict_l2t_l2b_rdma_wren_s3[2], evict_l2t_l2b_rdma_wren_s3[0]}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(rdma_array4_scanin),
   .scan_out(rdma_array4_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
    .tcu_scan_en(tcu_scan_en),
  .mbist_run (rdma_mbist_enable),
  .mbist_wdata   (rdma_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));

assign {rdma_array_dout_unused[11:8],
             rdma_array_dout[312], rdma_array_dout[390], rdma_array_dout[468], rdma_array_dout[546],
             rdma_array_dout[313], rdma_array_dout[391], rdma_array_dout[469], rdma_array_dout[547],
             rdma_array_dout[314], rdma_array_dout[392], rdma_array_dout[470], rdma_array_dout[548],
             rdma_array_dout[315], rdma_array_dout[393], rdma_array_dout[471], rdma_array_dout[549],
             rdma_array_dout[316], rdma_array_dout[394], rdma_array_dout[472], rdma_array_dout[550],
             rdma_array_dout[317], rdma_array_dout[395], rdma_array_dout[473], rdma_array_dout[551],
             rdma_array_dout[318], rdma_array_dout[396], rdma_array_dout[474], rdma_array_dout[552],
             rdma_array_dout[319], rdma_array_dout[397], rdma_array_dout[475], rdma_array_dout[553],
             rdma_array_dout[320], rdma_array_dout[398], rdma_array_dout[476], rdma_array_dout[554],
             rdma_array_dout[321], rdma_array_dout[399], rdma_array_dout[477], rdma_array_dout[555],
             rdma_array_dout[322], rdma_array_dout[400], rdma_array_dout[478], rdma_array_dout[556],
             rdma_array_dout[323], rdma_array_dout[401], rdma_array_dout[479], rdma_array_dout[557],
             rdma_array_dout[324], rdma_array_dout[402], rdma_array_dout[480], rdma_array_dout[558],
             rdma_array_dout[325], rdma_array_dout[403], rdma_array_dout[481], rdma_array_dout[559],
             rdma_array_dout[326], rdma_array_dout[404], rdma_array_dout[482], rdma_array_dout[560],
             rdma_array_dout[327], rdma_array_dout[405], rdma_array_dout[483], rdma_array_dout[561],
             rdma_array_dout[328], rdma_array_dout[406], rdma_array_dout[484], rdma_array_dout[562],
             rdma_array_dout[329], rdma_array_dout[407], rdma_array_dout[485], rdma_array_dout[563],
             rdma_array_dout[330], rdma_array_dout[408], rdma_array_dout[486], rdma_array_dout[564],
             rdma_array_dout[331], rdma_array_dout[409], rdma_array_dout[487], rdma_array_dout[565],
             rdma_array_dout[332], rdma_array_dout[410], rdma_array_dout[488], rdma_array_dout[566],
             rdma_array_dout[333], rdma_array_dout[411], rdma_array_dout[489], rdma_array_dout[567],
             rdma_array_dout[334], rdma_array_dout[412], rdma_array_dout[490], rdma_array_dout[568],
             rdma_array_dout[335], rdma_array_dout[413], rdma_array_dout[491], rdma_array_dout[569],
             rdma_array_dout[336], rdma_array_dout[414], rdma_array_dout[492], rdma_array_dout[570],
             rdma_array_dout[337], rdma_array_dout[415], rdma_array_dout[493], rdma_array_dout[571],
             rdma_array_dout[338], rdma_array_dout[416], rdma_array_dout[494], rdma_array_dout[572],
             rdma_array_dout[339], rdma_array_dout[417], rdma_array_dout[495], rdma_array_dout[573],
             rdma_array_dout[340], rdma_array_dout[418], rdma_array_dout[496], rdma_array_dout[574],
             rdma_array_dout[341], rdma_array_dout[419], rdma_array_dout[497], rdma_array_dout[575],
             rdma_array_dout[342], rdma_array_dout[420], rdma_array_dout[498], rdma_array_dout[576],
             rdma_array_dout[343], rdma_array_dout[421], rdma_array_dout[499], rdma_array_dout[577],
             rdma_array_dout[344], rdma_array_dout[422], rdma_array_dout[500], rdma_array_dout[578],
             rdma_array_dout[345], rdma_array_dout[423], rdma_array_dout[501], rdma_array_dout[579],
             rdma_array_dout[346], rdma_array_dout[424], rdma_array_dout[502], rdma_array_dout[580],
             rdma_array_dout[347], rdma_array_dout[425], rdma_array_dout[503], rdma_array_dout[581],
             rdma_array_dout[348], rdma_array_dout[426], rdma_array_dout[504], rdma_array_dout[582],
             rdma_array_dout[349], rdma_array_dout[427], rdma_array_dout[505], rdma_array_dout[583],
             rdma_array_dout[350], rdma_array_dout[428], rdma_array_dout[506], rdma_array_dout[584]} = rdma_array3_dout[159:0];


assign rdma_array3_din[159:120] = {1'b0, 1'b0, 1'b0, 1'b0,
             evict_rdma_array_din[312], evict_rdma_array_din[390], evict_rdma_array_din[468], evict_rdma_array_din[546],
             evict_rdma_array_din[313], evict_rdma_array_din[391], evict_rdma_array_din[469], evict_rdma_array_din[547],
             evict_rdma_array_din[314], evict_rdma_array_din[392], evict_rdma_array_din[470], evict_rdma_array_din[548],
             evict_rdma_array_din[315], evict_rdma_array_din[393], evict_rdma_array_din[471], evict_rdma_array_din[549],
             evict_rdma_array_din[316], evict_rdma_array_din[394], evict_rdma_array_din[472], evict_rdma_array_din[550],
             evict_rdma_array_din[317], evict_rdma_array_din[395], evict_rdma_array_din[473], evict_rdma_array_din[551],
             evict_rdma_array_din[318], evict_rdma_array_din[396], evict_rdma_array_din[474], evict_rdma_array_din[552],
             evict_rdma_array_din[319], evict_rdma_array_din[397], evict_rdma_array_din[475], evict_rdma_array_din[553],
             evict_rdma_array_din[320], evict_rdma_array_din[398], evict_rdma_array_din[476], evict_rdma_array_din[554]};
assign rdma_array3_din[119:80] =
            {evict_rdma_array_din[321], evict_rdma_array_din[399], evict_rdma_array_din[477], evict_rdma_array_din[555],
             evict_rdma_array_din[322], evict_rdma_array_din[400], evict_rdma_array_din[478], evict_rdma_array_din[556],
             evict_rdma_array_din[323], evict_rdma_array_din[401], evict_rdma_array_din[479], evict_rdma_array_din[557],
             evict_rdma_array_din[324], evict_rdma_array_din[402], evict_rdma_array_din[480], evict_rdma_array_din[558],
             evict_rdma_array_din[325], evict_rdma_array_din[403], evict_rdma_array_din[481], evict_rdma_array_din[559],
             evict_rdma_array_din[326], evict_rdma_array_din[404], evict_rdma_array_din[482], evict_rdma_array_din[560],
             evict_rdma_array_din[327], evict_rdma_array_din[405], evict_rdma_array_din[483], evict_rdma_array_din[561],
             evict_rdma_array_din[328], evict_rdma_array_din[406], evict_rdma_array_din[484], evict_rdma_array_din[562],
             evict_rdma_array_din[329], evict_rdma_array_din[407], evict_rdma_array_din[485], evict_rdma_array_din[563],
             evict_rdma_array_din[330], evict_rdma_array_din[408], evict_rdma_array_din[486], evict_rdma_array_din[564]};
assign rdma_array3_din[79:40] =
            {evict_rdma_array_din[331], evict_rdma_array_din[409], evict_rdma_array_din[487], evict_rdma_array_din[565],
             evict_rdma_array_din[332], evict_rdma_array_din[410], evict_rdma_array_din[488], evict_rdma_array_din[566],
             evict_rdma_array_din[333], evict_rdma_array_din[411], evict_rdma_array_din[489], evict_rdma_array_din[567],
             evict_rdma_array_din[334], evict_rdma_array_din[412], evict_rdma_array_din[490], evict_rdma_array_din[568],
             evict_rdma_array_din[335], evict_rdma_array_din[413], evict_rdma_array_din[491], evict_rdma_array_din[569],
             evict_rdma_array_din[336], evict_rdma_array_din[414], evict_rdma_array_din[492], evict_rdma_array_din[570],
             evict_rdma_array_din[337], evict_rdma_array_din[415], evict_rdma_array_din[493], evict_rdma_array_din[571],
             evict_rdma_array_din[338], evict_rdma_array_din[416], evict_rdma_array_din[494], evict_rdma_array_din[572],
             evict_rdma_array_din[339], evict_rdma_array_din[417], evict_rdma_array_din[495], evict_rdma_array_din[573],
             evict_rdma_array_din[340], evict_rdma_array_din[418], evict_rdma_array_din[496], evict_rdma_array_din[574]};
assign rdma_array3_din[39:0] = 
            {evict_rdma_array_din[341], evict_rdma_array_din[419], evict_rdma_array_din[497], evict_rdma_array_din[575],
             evict_rdma_array_din[342], evict_rdma_array_din[420], evict_rdma_array_din[498], evict_rdma_array_din[576],
             evict_rdma_array_din[343], evict_rdma_array_din[421], evict_rdma_array_din[499], evict_rdma_array_din[577],
             evict_rdma_array_din[344], evict_rdma_array_din[422], evict_rdma_array_din[500], evict_rdma_array_din[578],
             evict_rdma_array_din[345], evict_rdma_array_din[423], evict_rdma_array_din[501], evict_rdma_array_din[579],
             evict_rdma_array_din[346], evict_rdma_array_din[424], evict_rdma_array_din[502], evict_rdma_array_din[580],
             evict_rdma_array_din[347], evict_rdma_array_din[425], evict_rdma_array_din[503], evict_rdma_array_din[581],
             evict_rdma_array_din[348], evict_rdma_array_din[426], evict_rdma_array_din[504], evict_rdma_array_din[582],
             evict_rdma_array_din[349], evict_rdma_array_din[427], evict_rdma_array_din[505], evict_rdma_array_din[583],
             evict_rdma_array_din[350], evict_rdma_array_din[428], evict_rdma_array_din[506], evict_rdma_array_din[584]};



n2_l2t_dp_16x160_cust  rdma_array3
  (.dout   ( rdma_array3_dout ),
   .din    ( rdma_array3_din ),
   .rd_adr   ({1'b0, 1'b0, evict_l2t_l2b_rdma_rdwl_r1_v3[1:0]}),
   .wr_adr   ({1'b0, 1'b0, evict_l2t_l2b_rdma_wrwl_s3_v3[1:0]}),
   .read_en  (evict_l2t_l2b_rdma_rden_r1_v3),
   .wr_en    (evict_l2t_l2b_rdma_wren_s3_v3),
   .word_wen ({evict_l2t_l2b_rdma_wren_s3[7], evict_l2t_l2b_rdma_wren_s3[5],
               evict_l2t_l2b_rdma_wren_s3[3], evict_l2t_l2b_rdma_wren_s3[1]}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(rdma_array3_scanin),
   .scan_out(rdma_array3_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
    .tcu_scan_en(tcu_scan_en),
  .mbist_run (rdma_mbist_enable),
  .mbist_wdata   (rdma_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));

assign {rdma_array_dout_unused[7:4],
             rdma_array_dout[39], rdma_array_dout[117], rdma_array_dout[195], rdma_array_dout[273],
             rdma_array_dout[40], rdma_array_dout[118], rdma_array_dout[196], rdma_array_dout[274],
             rdma_array_dout[41], rdma_array_dout[119], rdma_array_dout[197], rdma_array_dout[275],
             rdma_array_dout[42], rdma_array_dout[120], rdma_array_dout[198], rdma_array_dout[276],
             rdma_array_dout[43], rdma_array_dout[121], rdma_array_dout[199], rdma_array_dout[277],
             rdma_array_dout[44], rdma_array_dout[122], rdma_array_dout[200], rdma_array_dout[278],
             rdma_array_dout[45], rdma_array_dout[123], rdma_array_dout[201], rdma_array_dout[279],
             rdma_array_dout[46], rdma_array_dout[124], rdma_array_dout[202], rdma_array_dout[280],
             rdma_array_dout[47], rdma_array_dout[125], rdma_array_dout[203], rdma_array_dout[281],
             rdma_array_dout[48], rdma_array_dout[126], rdma_array_dout[204], rdma_array_dout[282],
             rdma_array_dout[49], rdma_array_dout[127], rdma_array_dout[205], rdma_array_dout[283],
             rdma_array_dout[50], rdma_array_dout[128], rdma_array_dout[206], rdma_array_dout[284],
             rdma_array_dout[51], rdma_array_dout[129], rdma_array_dout[207], rdma_array_dout[285],
             rdma_array_dout[52], rdma_array_dout[130], rdma_array_dout[208], rdma_array_dout[286],
             rdma_array_dout[53], rdma_array_dout[131], rdma_array_dout[209], rdma_array_dout[287],
             rdma_array_dout[54], rdma_array_dout[132], rdma_array_dout[210], rdma_array_dout[288],
             rdma_array_dout[55], rdma_array_dout[133], rdma_array_dout[211], rdma_array_dout[289],
             rdma_array_dout[56], rdma_array_dout[134], rdma_array_dout[212], rdma_array_dout[290],
             rdma_array_dout[57], rdma_array_dout[135], rdma_array_dout[213], rdma_array_dout[291],
             rdma_array_dout[58], rdma_array_dout[136], rdma_array_dout[214], rdma_array_dout[292],
             rdma_array_dout[59], rdma_array_dout[137], rdma_array_dout[215], rdma_array_dout[293],
             rdma_array_dout[60], rdma_array_dout[138], rdma_array_dout[216], rdma_array_dout[294],
             rdma_array_dout[61], rdma_array_dout[139], rdma_array_dout[217], rdma_array_dout[295],
             rdma_array_dout[62], rdma_array_dout[140], rdma_array_dout[218], rdma_array_dout[296],
             rdma_array_dout[63], rdma_array_dout[141], rdma_array_dout[219], rdma_array_dout[297],
             rdma_array_dout[64], rdma_array_dout[142], rdma_array_dout[220], rdma_array_dout[298],
             rdma_array_dout[65], rdma_array_dout[143], rdma_array_dout[221], rdma_array_dout[299],
             rdma_array_dout[66], rdma_array_dout[144], rdma_array_dout[222], rdma_array_dout[300],
             rdma_array_dout[67], rdma_array_dout[145], rdma_array_dout[223], rdma_array_dout[301],
             rdma_array_dout[68], rdma_array_dout[146], rdma_array_dout[224], rdma_array_dout[302],
             rdma_array_dout[69], rdma_array_dout[147], rdma_array_dout[225], rdma_array_dout[303],
             rdma_array_dout[70], rdma_array_dout[148], rdma_array_dout[226], rdma_array_dout[304],
             rdma_array_dout[71], rdma_array_dout[149], rdma_array_dout[227], rdma_array_dout[305],
             rdma_array_dout[72], rdma_array_dout[150], rdma_array_dout[228], rdma_array_dout[306],
             rdma_array_dout[73], rdma_array_dout[151], rdma_array_dout[229], rdma_array_dout[307],
             rdma_array_dout[74], rdma_array_dout[152], rdma_array_dout[230], rdma_array_dout[308],
             rdma_array_dout[75], rdma_array_dout[153], rdma_array_dout[231], rdma_array_dout[309],
             rdma_array_dout[76], rdma_array_dout[154], rdma_array_dout[232], rdma_array_dout[310],
             rdma_array_dout[77], rdma_array_dout[155], rdma_array_dout[233], rdma_array_dout[311]} = rdma_array2_dout[159:0];


assign rdma_array2_din[159:120] = {1'b0, 1'b0, 1'b0, 1'b0,
             evict_rdma_array_din[39], evict_rdma_array_din[117], evict_rdma_array_din[195], evict_rdma_array_din[273],
             evict_rdma_array_din[40], evict_rdma_array_din[118], evict_rdma_array_din[196], evict_rdma_array_din[274],
             evict_rdma_array_din[41], evict_rdma_array_din[119], evict_rdma_array_din[197], evict_rdma_array_din[275],
             evict_rdma_array_din[42], evict_rdma_array_din[120], evict_rdma_array_din[198], evict_rdma_array_din[276],
             evict_rdma_array_din[43], evict_rdma_array_din[121], evict_rdma_array_din[199], evict_rdma_array_din[277],
             evict_rdma_array_din[44], evict_rdma_array_din[122], evict_rdma_array_din[200], evict_rdma_array_din[278],
             evict_rdma_array_din[45], evict_rdma_array_din[123], evict_rdma_array_din[201], evict_rdma_array_din[279],
             evict_rdma_array_din[46], evict_rdma_array_din[124], evict_rdma_array_din[202], evict_rdma_array_din[280],
             evict_rdma_array_din[47], evict_rdma_array_din[125], evict_rdma_array_din[203], evict_rdma_array_din[281]};
assign rdma_array2_din[119:80] =
            {evict_rdma_array_din[48], evict_rdma_array_din[126], evict_rdma_array_din[204], evict_rdma_array_din[282],
             evict_rdma_array_din[49], evict_rdma_array_din[127], evict_rdma_array_din[205], evict_rdma_array_din[283],
             evict_rdma_array_din[50], evict_rdma_array_din[128], evict_rdma_array_din[206], evict_rdma_array_din[284],
             evict_rdma_array_din[51], evict_rdma_array_din[129], evict_rdma_array_din[207], evict_rdma_array_din[285],
             evict_rdma_array_din[52], evict_rdma_array_din[130], evict_rdma_array_din[208], evict_rdma_array_din[286],
             evict_rdma_array_din[53], evict_rdma_array_din[131], evict_rdma_array_din[209], evict_rdma_array_din[287],
             evict_rdma_array_din[54], evict_rdma_array_din[132], evict_rdma_array_din[210], evict_rdma_array_din[288],
             evict_rdma_array_din[55], evict_rdma_array_din[133], evict_rdma_array_din[211], evict_rdma_array_din[289],
             evict_rdma_array_din[56], evict_rdma_array_din[134], evict_rdma_array_din[212], evict_rdma_array_din[290],
             evict_rdma_array_din[57], evict_rdma_array_din[135], evict_rdma_array_din[213], evict_rdma_array_din[291]};
assign rdma_array2_din[79:40] = 
            {evict_rdma_array_din[58], evict_rdma_array_din[136], evict_rdma_array_din[214], evict_rdma_array_din[292],
             evict_rdma_array_din[59], evict_rdma_array_din[137], evict_rdma_array_din[215], evict_rdma_array_din[293],
             evict_rdma_array_din[60], evict_rdma_array_din[138], evict_rdma_array_din[216], evict_rdma_array_din[294],
             evict_rdma_array_din[61], evict_rdma_array_din[139], evict_rdma_array_din[217], evict_rdma_array_din[295],
             evict_rdma_array_din[62], evict_rdma_array_din[140], evict_rdma_array_din[218], evict_rdma_array_din[296],
             evict_rdma_array_din[63], evict_rdma_array_din[141], evict_rdma_array_din[219], evict_rdma_array_din[297],
             evict_rdma_array_din[64], evict_rdma_array_din[142], evict_rdma_array_din[220], evict_rdma_array_din[298],
             evict_rdma_array_din[65], evict_rdma_array_din[143], evict_rdma_array_din[221], evict_rdma_array_din[299],
             evict_rdma_array_din[66], evict_rdma_array_din[144], evict_rdma_array_din[222], evict_rdma_array_din[300],
             evict_rdma_array_din[67], evict_rdma_array_din[145], evict_rdma_array_din[223], evict_rdma_array_din[301]};
assign rdma_array2_din[39:0] = 
            {evict_rdma_array_din[68], evict_rdma_array_din[146], evict_rdma_array_din[224], evict_rdma_array_din[302],
             evict_rdma_array_din[69], evict_rdma_array_din[147], evict_rdma_array_din[225], evict_rdma_array_din[303],
             evict_rdma_array_din[70], evict_rdma_array_din[148], evict_rdma_array_din[226], evict_rdma_array_din[304],
             evict_rdma_array_din[71], evict_rdma_array_din[149], evict_rdma_array_din[227], evict_rdma_array_din[305],
             evict_rdma_array_din[72], evict_rdma_array_din[150], evict_rdma_array_din[228], evict_rdma_array_din[306],
             evict_rdma_array_din[73], evict_rdma_array_din[151], evict_rdma_array_din[229], evict_rdma_array_din[307],
             evict_rdma_array_din[74], evict_rdma_array_din[152], evict_rdma_array_din[230], evict_rdma_array_din[308],
             evict_rdma_array_din[75], evict_rdma_array_din[153], evict_rdma_array_din[231], evict_rdma_array_din[309],
             evict_rdma_array_din[76], evict_rdma_array_din[154], evict_rdma_array_din[232], evict_rdma_array_din[310],
             evict_rdma_array_din[77], evict_rdma_array_din[155], evict_rdma_array_din[233], evict_rdma_array_din[311]};



n2_l2t_dp_16x160_cust  rdma_array2
  (.dout   (rdma_array2_dout ),
   .din    (rdma_array2_din ),
   .rd_adr   ({1'b0, 1'b0, evict_l2t_l2b_rdma_rdwl_r1_v2[1:0]}),
   .wr_adr   ({1'b0, 1'b0, evict_l2t_l2b_rdma_wrwl_s3_v2[1:0]}),
   .read_en  (evict_l2t_l2b_rdma_rden_r1_v2),
   .wr_en    (evict_l2t_l2b_rdma_wren_s3_v2),
   .word_wen ({evict_l2t_l2b_rdma_wren_s3[14], evict_l2t_l2b_rdma_wren_s3[12],
               evict_l2t_l2b_rdma_wren_s3[10], evict_l2t_l2b_rdma_wren_s3[8]}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(rdma_array2_scanin),
   .scan_out(rdma_array2_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
    .tcu_scan_en(tcu_scan_en),
  .mbist_run (rdma_mbist_enable),
  .mbist_wdata   (rdma_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));

assign {rdma_array_dout_unused[3:0],
             rdma_array_dout[0], rdma_array_dout[78], rdma_array_dout[156], rdma_array_dout[234],
             rdma_array_dout[1], rdma_array_dout[79], rdma_array_dout[157], rdma_array_dout[235],
             rdma_array_dout[2], rdma_array_dout[80], rdma_array_dout[158], rdma_array_dout[236],
             rdma_array_dout[3], rdma_array_dout[81], rdma_array_dout[159], rdma_array_dout[237],
             rdma_array_dout[4], rdma_array_dout[82], rdma_array_dout[160], rdma_array_dout[238],
             rdma_array_dout[5], rdma_array_dout[83], rdma_array_dout[161], rdma_array_dout[239],
             rdma_array_dout[6], rdma_array_dout[84], rdma_array_dout[162], rdma_array_dout[240],
             rdma_array_dout[7], rdma_array_dout[85], rdma_array_dout[163], rdma_array_dout[241],
             rdma_array_dout[8], rdma_array_dout[86], rdma_array_dout[164], rdma_array_dout[242],
             rdma_array_dout[9], rdma_array_dout[87], rdma_array_dout[165], rdma_array_dout[243],
             rdma_array_dout[10], rdma_array_dout[88], rdma_array_dout[166], rdma_array_dout[244],
             rdma_array_dout[11], rdma_array_dout[89], rdma_array_dout[167], rdma_array_dout[245],
             rdma_array_dout[12], rdma_array_dout[90], rdma_array_dout[168], rdma_array_dout[246],
             rdma_array_dout[13], rdma_array_dout[91], rdma_array_dout[169], rdma_array_dout[247],
             rdma_array_dout[14], rdma_array_dout[92], rdma_array_dout[170], rdma_array_dout[248],
             rdma_array_dout[15], rdma_array_dout[93], rdma_array_dout[171], rdma_array_dout[249],
             rdma_array_dout[16], rdma_array_dout[94], rdma_array_dout[172], rdma_array_dout[250],
             rdma_array_dout[17], rdma_array_dout[95], rdma_array_dout[173], rdma_array_dout[251],
             rdma_array_dout[18], rdma_array_dout[96], rdma_array_dout[174], rdma_array_dout[252],
             rdma_array_dout[19], rdma_array_dout[97], rdma_array_dout[175], rdma_array_dout[253],
             rdma_array_dout[20], rdma_array_dout[98], rdma_array_dout[176], rdma_array_dout[254],
             rdma_array_dout[21], rdma_array_dout[99], rdma_array_dout[177], rdma_array_dout[255],
             rdma_array_dout[22], rdma_array_dout[100], rdma_array_dout[178], rdma_array_dout[256],
             rdma_array_dout[23], rdma_array_dout[101], rdma_array_dout[179], rdma_array_dout[257],
             rdma_array_dout[24], rdma_array_dout[102], rdma_array_dout[180], rdma_array_dout[258],
             rdma_array_dout[25], rdma_array_dout[103], rdma_array_dout[181], rdma_array_dout[259],
             rdma_array_dout[26], rdma_array_dout[104], rdma_array_dout[182], rdma_array_dout[260],
             rdma_array_dout[27], rdma_array_dout[105], rdma_array_dout[183], rdma_array_dout[261],
             rdma_array_dout[28], rdma_array_dout[106], rdma_array_dout[184], rdma_array_dout[262],
             rdma_array_dout[29], rdma_array_dout[107], rdma_array_dout[185], rdma_array_dout[263],
             rdma_array_dout[30], rdma_array_dout[108], rdma_array_dout[186], rdma_array_dout[264],
             rdma_array_dout[31], rdma_array_dout[109], rdma_array_dout[187], rdma_array_dout[265],
             rdma_array_dout[32], rdma_array_dout[110], rdma_array_dout[188], rdma_array_dout[266],
             rdma_array_dout[33], rdma_array_dout[111], rdma_array_dout[189], rdma_array_dout[267],
             rdma_array_dout[34], rdma_array_dout[112], rdma_array_dout[190], rdma_array_dout[268],
             rdma_array_dout[35], rdma_array_dout[113], rdma_array_dout[191], rdma_array_dout[269],
             rdma_array_dout[36], rdma_array_dout[114], rdma_array_dout[192], rdma_array_dout[270],
             rdma_array_dout[37], rdma_array_dout[115], rdma_array_dout[193], rdma_array_dout[271],
             rdma_array_dout[38], rdma_array_dout[116], rdma_array_dout[194], rdma_array_dout[272]} = rdma_array1_dout[159:0];


assign rdma_array1_din[159:120] = {1'b0, 1'b0, 1'b0, 1'b0,
             evict_rdma_array_din[0], evict_rdma_array_din[78], evict_rdma_array_din[156], evict_rdma_array_din[234],
             evict_rdma_array_din[1], evict_rdma_array_din[79], evict_rdma_array_din[157], evict_rdma_array_din[235],
             evict_rdma_array_din[2], evict_rdma_array_din[80], evict_rdma_array_din[158], evict_rdma_array_din[236],
             evict_rdma_array_din[3], evict_rdma_array_din[81], evict_rdma_array_din[159], evict_rdma_array_din[237],
             evict_rdma_array_din[4], evict_rdma_array_din[82], evict_rdma_array_din[160], evict_rdma_array_din[238],
             evict_rdma_array_din[5], evict_rdma_array_din[83], evict_rdma_array_din[161], evict_rdma_array_din[239],
             evict_rdma_array_din[6], evict_rdma_array_din[84], evict_rdma_array_din[162], evict_rdma_array_din[240],
             evict_rdma_array_din[7], evict_rdma_array_din[85], evict_rdma_array_din[163], evict_rdma_array_din[241],
             evict_rdma_array_din[8], evict_rdma_array_din[86], evict_rdma_array_din[164], evict_rdma_array_din[242]};
assign rdma_array1_din[119:80] = 
            {evict_rdma_array_din[9], evict_rdma_array_din[87], evict_rdma_array_din[165], evict_rdma_array_din[243],
             evict_rdma_array_din[10], evict_rdma_array_din[88], evict_rdma_array_din[166], evict_rdma_array_din[244],
             evict_rdma_array_din[11], evict_rdma_array_din[89], evict_rdma_array_din[167], evict_rdma_array_din[245],
             evict_rdma_array_din[12], evict_rdma_array_din[90], evict_rdma_array_din[168], evict_rdma_array_din[246],
             evict_rdma_array_din[13], evict_rdma_array_din[91], evict_rdma_array_din[169], evict_rdma_array_din[247],
             evict_rdma_array_din[14], evict_rdma_array_din[92], evict_rdma_array_din[170], evict_rdma_array_din[248],
             evict_rdma_array_din[15], evict_rdma_array_din[93], evict_rdma_array_din[171], evict_rdma_array_din[249],
             evict_rdma_array_din[16], evict_rdma_array_din[94], evict_rdma_array_din[172], evict_rdma_array_din[250],
             evict_rdma_array_din[17], evict_rdma_array_din[95], evict_rdma_array_din[173], evict_rdma_array_din[251],
             evict_rdma_array_din[18], evict_rdma_array_din[96], evict_rdma_array_din[174], evict_rdma_array_din[252]};
assign rdma_array1_din[79:40] = 
            {evict_rdma_array_din[19], evict_rdma_array_din[97], evict_rdma_array_din[175], evict_rdma_array_din[253],
             evict_rdma_array_din[20], evict_rdma_array_din[98], evict_rdma_array_din[176], evict_rdma_array_din[254],
             evict_rdma_array_din[21], evict_rdma_array_din[99], evict_rdma_array_din[177], evict_rdma_array_din[255],
             evict_rdma_array_din[22], evict_rdma_array_din[100], evict_rdma_array_din[178], evict_rdma_array_din[256],
             evict_rdma_array_din[23], evict_rdma_array_din[101], evict_rdma_array_din[179], evict_rdma_array_din[257],
             evict_rdma_array_din[24], evict_rdma_array_din[102], evict_rdma_array_din[180], evict_rdma_array_din[258],
             evict_rdma_array_din[25], evict_rdma_array_din[103], evict_rdma_array_din[181], evict_rdma_array_din[259],
             evict_rdma_array_din[26], evict_rdma_array_din[104], evict_rdma_array_din[182], evict_rdma_array_din[260],
             evict_rdma_array_din[27], evict_rdma_array_din[105], evict_rdma_array_din[183], evict_rdma_array_din[261],
             evict_rdma_array_din[28], evict_rdma_array_din[106], evict_rdma_array_din[184], evict_rdma_array_din[262]};
assign rdma_array1_din[39:0] = 
            {evict_rdma_array_din[29], evict_rdma_array_din[107], evict_rdma_array_din[185], evict_rdma_array_din[263],
             evict_rdma_array_din[30], evict_rdma_array_din[108], evict_rdma_array_din[186], evict_rdma_array_din[264],
             evict_rdma_array_din[31], evict_rdma_array_din[109], evict_rdma_array_din[187], evict_rdma_array_din[265],
             evict_rdma_array_din[32], evict_rdma_array_din[110], evict_rdma_array_din[188], evict_rdma_array_din[266],
             evict_rdma_array_din[33], evict_rdma_array_din[111], evict_rdma_array_din[189], evict_rdma_array_din[267],
             evict_rdma_array_din[34], evict_rdma_array_din[112], evict_rdma_array_din[190], evict_rdma_array_din[268],
             evict_rdma_array_din[35], evict_rdma_array_din[113], evict_rdma_array_din[191], evict_rdma_array_din[269],
             evict_rdma_array_din[36], evict_rdma_array_din[114], evict_rdma_array_din[192], evict_rdma_array_din[270],
             evict_rdma_array_din[37], evict_rdma_array_din[115], evict_rdma_array_din[193], evict_rdma_array_din[271],
             evict_rdma_array_din[38], evict_rdma_array_din[116], evict_rdma_array_din[194], evict_rdma_array_din[272]};


n2_l2t_dp_16x160_cust  rdma_array1
  (.dout   ( rdma_array1_dout ),
   .rd_adr   ({1'b0, 1'b0, evict_l2t_l2b_rdma_rdwl_r1_v1[1:0]}),
   .din    (rdma_array1_din ),
   .wr_adr   ({1'b0, 1'b0, evict_l2t_l2b_rdma_wrwl_s3_v1[1:0]}),
   .read_en  (evict_l2t_l2b_rdma_rden_r1_v1),
   .wr_en    (evict_l2t_l2b_rdma_wren_s3_v1),
   .word_wen ({evict_l2t_l2b_rdma_wren_s3[15], evict_l2t_l2b_rdma_wren_s3[13],
               evict_l2t_l2b_rdma_wren_s3[11], evict_l2t_l2b_rdma_wren_s3[9]}),
   .byte_wen ({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1,
               1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}),
   .scan_in(rdma_array1_scanin),
   .scan_out(rdma_array1_scanout),
   .l2clk    (l2clk),
   .tcu_pce_ov(pce_ov),
   .pce(1'b1),
   .tcu_aclk(aclk),
   .tcu_bclk(bclk),
    .tcu_scan_en(tcu_scan_en),
  .mbist_run (rdma_mbist_enable),
  .mbist_wdata   (rdma_mbist_data_in[7:0]),
   .tcu_array_wr_inhibit(array_wr_inhibit),
   .tcu_se_scancollar_in	(tcu_se_scancollar_in));


////////////////////////////////////////////////////////////////////////////////
//  EFU SRAM Header for L2data
////////////////////////////////////////////////////////////////////////////////

l2b_l2defu_ctl l2d_sram_hdr
	(
	.efu_hdr_write_data	   (efu_l2b_fuse_data),     
	.efu_hdr_xfer_en   	   (efu_l2b_fuse_xfer_en),   
	.efu_hdr_clr       	   (efu_l2b_fuse_clr), 
	.sram_hdr_read_data	   (l2d_l2b_fuse_read_data[9:0]),
	.scan_in(l2d_sram_hdr_scanin),
	.scan_out(l2d_sram_hdr_scanout),
	.l2clk             	   (l2clk), 
	.tcu_pce_ov        	   (tcu_pce_ov),
	.tcu_aclk          	   (tcu_aclk),
	.tcu_bclk          	   (tcu_bclk),
	.tcu_scan_en       	   (tcu_scan_en),
	.io_cmp_sync_en		   (io_cmp_sync_en),
	.cmp_io_sync_en		   (cmp_io_sync_en),
	.tcu_clk_stop      	   (1'b0),
	.hdr_efu_read_data 	   (l2b_efu_fuse_data),
	.hdr_efu_xfer_en   	   (l2b_efu_fuse_xfer_en),
	.hdr_sram_rvalue   	   (l2b_l2d_rvalue[9:0]),
	.hdr_sram_rid      	   (l2b_l2d_rid[6:0]),
	.hdr_sram_wr_en    	   (l2b_l2d_wr_en),
	.hdr_sram_red_clr  	   (l2b_l2d_fuse_clr)
	);


////////////////////////////////////////////////////////////////////////////////


// fixscan start:
assign clock_header_scanin       =scan_in;
assign fbd_scanin                = clock_header_scanout     ;
assign fb_array4_scanin          = fbd_scanout              ;
assign fb_array3_scanin          = fb_array4_scanout        ;
assign fb_array2_scanin          = fb_array3_scanout        ;
assign fb_array1_scanin          = fb_array2_scanout        ;
assign rdmard_scanin             = fb_array1_scanout        ;
assign wb_array4_scanin          = rdmard_scanout           ;
assign wb_array3_scanin          = wb_array4_scanout        ;
assign wb_array2_scanin          = wb_array3_scanout        ;
assign wb_array1_scanin          = wb_array2_scanout        ;
assign evict_scanin              = wb_array1_scanout        ;
assign siu_interface_scanin      = evict_scanout            ;
assign rdma_array4_scanin        = siu_interface_scanout    ;
assign rdma_array3_scanin        = rdma_array4_scanout      ;
assign rdma_array2_scanin        = rdma_array3_scanout      ;
assign rdma_array1_scanin        = rdma_array2_scanout      ;
assign l2d_sram_hdr_scanin       = rdma_array1_scanout      ;
assign scan_out                  = l2d_sram_hdr_scanout     ;
// fixscan end:
endmodule

