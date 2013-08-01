// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: efu_fct_ctl.v
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
`define       	RD_CNT_START		 9'd20
`define		ASHIFT_CNT_START	 {(7'd09),2'b11}
`define		DSHIFT_CNT_START	 {(7'd12),2'b11}
`define		RSLTSHIFT_CNT_START	 {(7'd63),2'b11}
`define		RECOVER_CNT_START	 9'd10

`define 	MSEQ_IDLE        4'b0000  // 4'h0
`define 	MSEQ_DUMP        4'b1001  // 4'h9
`define 	MSEQ_RSLTSHFT    4'b1011  // 4'ha
`define 	MSEQ_SGLRD       4'b1010  // 4'hb
`define 	MSEQ_BYPASS      4'b1100  // 4'hc
`define 	MSEQ_DEST_SMPL   4'b1101  // 4'hd
`define 	MSEQ_L2RR_SMPL   4'b1110  // 4'he
`define 	MSEQ_SHIFT       4'b1111  // 4'hf
`define 	MRD_IDLE         3'b000	  // 3'b0
`define 	MRD_RD_ARRAY     3'b100	  // 3'b4
//`define 	MRD_ASHIFT       3'b001	  // 3'b1
`define 	MRD_XFER       3'b001	  // 3'b1
`define 	MRD_DSHIFT       3'b011	  // 3'b3
`define 	MRD_RECOVER      3'b010	  // 3'b2



module efu_fct_ctl (
  tcu_efu_updatedr, 
  tcu_efu_read_en, 
  tcu_efu_read_start, 
  tcu_efu_fuse_bypass, 
  tcu_efu_dest_sample, 
  tcu_efu_coladdr, 
  tcu_efu_read_mode, 
  tcu_efu_rowaddr, 
  tcu_efu_capturedr, 
  tcu_efu_data_in, 
  tcu_efu_shiftdr, 
  efa_sbc_data, 
  tck, 
  cmp_io_sync_en, 
  sbc_efa_power_down, 
  efu_tcu_data_out, 
  sync1_rowaddress, 
  sbc_efa_bit_addr, 
  sbc_efa_sup_det_rd, 
  sbc_efa_margin0_rd, 
  sbc_efa_margin1_rd, 
  sbc_efa_read_en, 
  sbc_efa_word_addr, 
  shift_data_ff_out, 
  load_l2_read_data, 
  read_data_ff, 
  read_data_ff_vld, 
  update_dr_jbus, 
  local_read_en, 
  local_efu_read_start, 
  local_fuse_bypass, 
  local_dest_sample, 
  cmp_mrd_cnt_done, 
  decode_enable_vld, 
  iol2clk, 
  l2clk, 
  jbus_arst_l, 
  por_l, 
  snc1_rowaddr, 
  efu_ncu_fuse_data, 
  efu_ncu_srlnum0_xfer_en, 
  efu_ncu_srlnum1_xfer_en, 
  efu_ncu_srlnum2_xfer_en, 
  efu_ncu_fusestat_xfer_en, 
  efu_ncu_coreavl_xfer_en, 
  efu_ncu_bankavl_xfer_en, 
  niu_read_data_shift, 
  load_niu_read_data, 
  pwr_ok, 
  por_n, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  scan_in, 
  scan_out);
wire pce_ov;
wire siclk;
wire soclk;
wire stop;
wire se;
wire read_data_ff_vld_d;
wire seq_state_bypass;
wire mrd_state_xfer;
wire read_data_ff_vld_r1;
wire l1clk;
wire l1clk_cmp;
wire tckl1clk;
wire ff_pulse_read_data_ff_vld_scanin;
wire ff_pulse_read_data_ff_vld_scanout;
wire enable_efa_por_reg_scanin;
wire enable_efa_por_reg_scanout;
wire efa_array_power_down_reg_scanin;
wire efa_array_power_down_reg_scanout;
wire seq_state_reg_scanin;
wire seq_state_reg_scanout;
wire [6:0] addr_cnt_ff;
wire addr_cnt_reg_scanin;
wire addr_cnt_reg_scanout;
wire mrd_state_ashift;
wire mrd_state_dshift;
wire mrd_state_shift;
wire mrd_state_reg_scanin;
wire mrd_state_reg_scanout;
wire mrd_cnt_dec1_true_value;
wire serdes;
wire mrd_cnt_63;
wire ff_mrd_zero_scanin;
wire ff_mrd_zero_scanout;
wire mrd_63_to_0_ff_scanin;
wire mrd_63_to_0_ff_scanout;
wire mrd_63_to_0;
wire mrd_cnt_reg_scanin;
wire mrd_cnt_reg_scanout;
wire [31:0] efa_out_data;
wire [31:0] tck_shft_data_ff;
wire read_data_reg_scanin;
wire read_data_reg_scanout;
wire l2rd_id_reg_scanin;
wire l2rd_id_reg_scanout;
wire rslt_status_reg_scanin;
wire rslt_status_reg_scanout;
wire local_fuse_data_reg_scanin;
wire local_fuse_data_reg_scanout;
wire ncu_bankavail_dec;
wire l2d_fuse_dec;
wire ncu_coreavail_dshift_reg_scanin;
wire ncu_coreavail_dshift_reg_scanout;
wire ncu_bankavail_dshift_reg_scanin;
wire ncu_bankavail_dshift_reg_scanout;
wire ncu_sernum0_dshift_reg_scanin;
wire ncu_sernum0_dshift_reg_scanout;
wire ncu_sernum1_dshift_reg_scanin;
wire ncu_sernum1_dshift_reg_scanout;
wire ncu_sernum2_dshift_reg_scanin;
wire ncu_sernum2_dshift_reg_scanout;
wire ncu_fusestat_dshift_reg_scanin;
wire ncu_fusestat_dshift_reg_scanout;
wire ff_updtdr_slice_scanin;
wire ff_updtdr_slice_scanout;
wire updtdr_sync1;
wire ff_updtdr_slice1_scanin;
wire ff_updtdr_slice1_scanout;
wire updtdr_sync2;
wire ff_updtdr_slice2_scanin;
wire ff_updtdr_slice2_scanout;
wire ff_read_en_slice_scanin;
wire ff_read_en_slice_scanout;
wire read_en_sync1;
wire ff_read_en_slice1_scanin;
wire ff_read_en_slice1_scanout;
wire read_en_sync2;
wire ff_read_en_slice2_scanin;
wire ff_read_en_slice2_scanout;
wire read_en_hist_ff;
wire ff_read_start_0_slice_scanin;
wire ff_read_start_0_slice_scanout;
wire read_start_hist_ff;
wire read_start_sync2;
wire ff_read_start_1_slice_scanin;
wire ff_read_start_1_slice_scanout;
wire cmp_io_sync_en_r1;
wire ff_cmp_io_sync_en_scanin;
wire ff_cmp_io_sync_en_scanout;
wire ff_fuse_bypass_slice_scanin;
wire ff_fuse_bypass_slice_scanout;
wire fuse_bypass_sync1;
wire ff_fuse_bypass_slice_1_scanin;
wire ff_fuse_bypass_slice_1_scanout;
wire fuse_bypass_sync2;
wire ff_fuse_bypass_slice_2_scanin;
wire ff_fuse_bypass_slice_2_scanout;
wire fuse_bypass_hist_ff;
wire ff_dest_sample_slice_scanin;
wire ff_dest_sample_slice_scanout;
wire dest_sample_sync1;
wire ff_dest_sample_slice_1_scanin;
wire ff_dest_sample_slice_1_scanout;
wire dest_sample_sync2;
wire ff_dest_sample_slice_2_scanin;
wire ff_dest_sample_slice_2_scanout;
wire dest_sample_hist_ff;
wire [31:0] w_mux_shift_retain;
wire ff_tck_shift_data_nxt_scanin;
wire ff_tck_shift_data_nxt_scanout;
wire ff_sync1_rowaddr_6_1_scanin;
wire ff_sync1_rowaddr_6_1_scanout;
wire sync_tcu_efu_rowaddr6;
wire tcu_efu_rowaddr6_1;
wire ff_sync1_rowaddr_5_1_scanin;
wire ff_sync1_rowaddr_5_1_scanout;
wire sync_tcu_efu_rowaddr5;
wire tcu_efu_rowaddr5_1;
wire ff_sync1_rowaddr_4_1_scanin;
wire ff_sync1_rowaddr_4_1_scanout;
wire sync_tcu_efu_rowaddr4;
wire tcu_efu_rowaddr4_1;
wire ff_sync1_rowaddr_3_1_scanin;
wire ff_sync1_rowaddr_3_1_scanout;
wire sync_tcu_efu_rowaddr3;
wire tcu_efu_rowaddr3_1;
wire ff_sync1_rowaddr_2_1_scanin;
wire ff_sync1_rowaddr_2_1_scanout;
wire sync_tcu_efu_rowaddr2;
wire tcu_efu_rowaddr2_1;
wire ff_sync1_rowaddr_1_1_scanin;
wire ff_sync1_rowaddr_1_1_scanout;
wire sync_tcu_efu_rowaddr1;
wire tcu_efu_rowaddr1_1;
wire ff_sync1_rowaddr_0_1_scanin;
wire ff_sync1_rowaddr_0_1_scanout;
wire sync_tcu_efu_rowaddr0;
wire tcu_efu_rowaddr0_1;
wire ff_sync1_rowaddr_6_scanin;
wire ff_sync1_rowaddr_6_scanout;
wire ff_sync1_rowaddr_5_scanin;
wire ff_sync1_rowaddr_5_scanout;
wire ff_sync1_rowaddr_4_scanin;
wire ff_sync1_rowaddr_4_scanout;
wire ff_sync1_rowaddr_3_scanin;
wire ff_sync1_rowaddr_3_scanout;
wire ff_sync1_rowaddr_2_scanin;
wire ff_sync1_rowaddr_2_scanout;
wire ff_sync1_rowaddr_1_scanin;
wire ff_sync1_rowaddr_1_scanout;
wire ff_sync1_rowaddr_scanin;
wire ff_sync1_rowaddr_scanout;
wire ff_sync1_coladdr_4_1_scanin;
wire ff_sync1_coladdr_4_1_scanout;
wire sync_tcu_efu_coladdr4;
wire tcu_efu_coladdr4_1;
wire ff_sync1_coladdr_3_1_scanin;
wire ff_sync1_coladdr_3_1_scanout;
wire sync_tcu_efu_coladdr3;
wire tcu_efu_coladdr3_1;
wire ff_sync1_coladdr_2_1_scanin;
wire ff_sync1_coladdr_2_1_scanout;
wire sync_tcu_efu_coladdr2;
wire tcu_efu_coladdr2_1;
wire ff_sync1_coladdr_1_1_scanin;
wire ff_sync1_coladdr_1_1_scanout;
wire sync_tcu_efu_coladdr1;
wire tcu_efu_coladdr1_1;
wire ff_sync1_coladdr_0_1_scanin;
wire ff_sync1_coladdr_0_1_scanout;
wire sync_tcu_efu_coladdr0;
wire tcu_efu_coladdr0_1;
wire ff_sync1_coladdr_4_scanin;
wire ff_sync1_coladdr_4_scanout;
wire ff_sync1_coladdr_3_scanin;
wire ff_sync1_coladdr_3_scanout;
wire ff_sync1_coladdr_2_scanin;
wire ff_sync1_coladdr_2_scanout;
wire ff_sync1_coladdr_1_scanin;
wire ff_sync1_coladdr_1_scanout;
wire ff_sync1_coladdr_scanin;
wire ff_sync1_coladdr_scanout;
wire [4:0] sync_tcu_efu_coladdr;
wire ff_tcu_efu_read_mode_bit1_scanin;
wire ff_tcu_efu_read_mode_bit1_scanout;
wire tcu_efu_read_mode1_1;
wire ff_tcu_efu_read_mode_bit1_1_scanin;
wire ff_tcu_efu_read_mode_bit1_1_scanout;
wire sync_tcu_efu_read_mode1;
wire ff_tcu_efu_read_mode_bit0_scanin;
wire ff_tcu_efu_read_mode_bit0_scanout;
wire tcu_efu_read_mode0_1;
wire ff_tcu_efu_read_mode_bit0_1_scanin;
wire ff_tcu_efu_read_mode_bit0_1_scanout;
wire sync_tcu_efu_read_mode0;
wire [1:0] sync_tcu_efu_read_mode;
wire ff_power_down_sync_slice_scanin;
wire ff_power_down_sync_slice_scanout;
wire inhibit_power_down_sync_l;
wire ff_power_down_sync_slice_1_scanin;
wire ff_power_down_sync_slice_1_scanout;
wire spares_scanin;
wire spares_scanout;


//-----------------------------------------------------------------------------
//  I/O declarations
//-----------------------------------------------------------------------------

input   	tcu_efu_updatedr;
input		tcu_efu_read_en;
input		tcu_efu_read_start;
input		tcu_efu_fuse_bypass;
input		tcu_efu_dest_sample;
input	[4:0]	tcu_efu_coladdr;
input	[2:0]	tcu_efu_read_mode;
input	[6:0]	tcu_efu_rowaddr;
input		tcu_efu_capturedr;
input		tcu_efu_data_in;
input		tcu_efu_shiftdr;
input   [31:0]	efa_sbc_data;
input		tck;
input		cmp_io_sync_en;
output		sbc_efa_power_down;
output		efu_tcu_data_out;
output  [6:0]	sync1_rowaddress;
output  [4:0]	sbc_efa_bit_addr;
output		sbc_efa_sup_det_rd;
output		sbc_efa_margin0_rd;
output		sbc_efa_margin1_rd;
output		sbc_efa_read_en;
output	[5:0]	sbc_efa_word_addr;

// l2 and spc read data
input   [31:0]  shift_data_ff_out;
input		load_l2_read_data;

//output		mrd_state_rd_array;
output	[31:0]	read_data_ff;
output		read_data_ff_vld;
//output	[6:0]	addr_cnt_ff;
//output		efa_array_power_down_ff;

output  		update_dr_jbus;
output  		local_read_en;
output  		local_efu_read_start;
output  		local_fuse_bypass;
output  		local_dest_sample;
input		cmp_mrd_cnt_done;

output		decode_enable_vld;
// Chip Primary Inputs/Globals

input   	iol2clk;
input   	l2clk;
input		jbus_arst_l;		// JBus clock domain async reset.
input	        por_l;
//input		testmode_l;

// CTU/JTAG Interface

input [6:0]   	snc1_rowaddr;
//input		inhibit_power_down_l;

// Destination Register Interface

// Interface with NCU for data array repair 
output 		efu_ncu_fuse_data;
output 		efu_ncu_srlnum0_xfer_en;
output 		efu_ncu_srlnum1_xfer_en;
output 		efu_ncu_srlnum2_xfer_en;
output 		efu_ncu_fusestat_xfer_en;
output 		efu_ncu_coreavl_xfer_en;
output 		efu_ncu_bankavl_xfer_en;

// with niu 
input	[31:0]	niu_read_data_shift;
input		load_niu_read_data;
        	
// EFA interface 

//input	[31:0]	efa_out_data;
output		pwr_ok;
output		por_n;
input 		tcu_pce_ov;
input 		tcu_aclk;
input 		tcu_bclk;
input		tcu_scan_en;
input		scan_in;
output 		scan_out;


 
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign stop = 1'b0;
assign se = tcu_scan_en;



//-----------------------------------------------------------------------------
//  Wire/reg declarations
//-----------------------------------------------------------------------------

wire		efu_ncu_fuse_clk1;
wire		efu_ncu_fuse_data;

wire		efu_ncu_sernum0_dshift;
wire		efu_ncu_sernum1_dshift;
wire		efu_ncu_sernum2_dshift;
wire		efu_ncu_fusestat_dshift;
wire		efu_ncu_coreavail_dshift;

wire		local_efu_read_start;
wire [6:0]	addr_cnt_nxt;
wire		addr_cnt_en;
//wire [6:0]	addr_cnt_ff;
wire [5:0]	addr_cnt_inc1;
wire		addr_cnt_max;
wire		shift_done;
wire		mrd_cnt_done;
wire		rd_array_done;
wire		recover_done;
wire		local_fuse_bypass; //tcu_efu_fuse_bypass 
wire		local_dest_sample; //tcu_efu_fuse_bypass 
wire		local_read_en; //tcu_efu_fuse_bypass 
wire		read_data_en;
wire  [31:0]	read_data_nxt;
wire  [31:0]    read_data_ff;
reg  [3:0]	seq_state_nxt;
reg		enter_rsltshft;
wire [3:0]	seq_state_ff;
wire		seq_state_idle;
wire		seq_state_dump;
wire		seq_state_sglrd;
//wire		seq_state_bypass;
wire		seq_state_dest_smpl;
wire		seq_state_l2rr_smpl;
wire		seq_state_rsltshft;
wire		ncu_coreavail_dec;
wire		ncu_sernum0_dec;
wire		ncu_sernum1_dec;
wire		ncu_sernum2_dec;
wire		ncu_fusestat_dec;

wire		inhibit_power_down_snc_l;
wire		inhibit_power_down_l;
wire		efa_read_en_lt;
wire		enable_efa_por_nxt_l;
wire		enable_efa_por_ff_l;
wire		efa_array_power_down_ff;
wire		efa_array_power_down_nxt;

reg		valid;
reg		val_err;

//-----------------------------------------------------------------------------
//  Misc signals
//-----------------------------------------------------------------------------
assign pwr_ok = jbus_arst_l;
assign por_n  = jbus_arst_l & por_l;
assign read_data_ff_vld_d = seq_state_rsltshft | seq_state_bypass | seq_state_dump & mrd_state_xfer ;
assign read_data_ff_vld = read_data_ff_vld_d & ~read_data_ff_vld_r1;
assign decode_enable_vld=1'b0;

//-----------------------------------------------------------------------------
//  Power down control
//-----------------------------------------------------------------------------

efu_fct_ctl_l1clkhdr_ctl_macro ioclkgen (
        .l2clk(iol2clk),
        .l1en (1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

efu_fct_ctl_l1clkhdr_ctl_macro l2clkgen (
        .l2clk(l2clk),
        .l1en (1'b1 ),
        .l1clk(l1clk_cmp),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

efu_fct_ctl_l1clkhdr_ctl_macro tckclkgen (
        .l2clk(tck),
        .l1en (1'b1 ),
        .l1clk(tckl1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

assign enable_efa_por_nxt_l = seq_state_rsltshft | enable_efa_por_ff_l;

efu_fct_ctl_msff_ctl_macro__width_1  ff_pulse_read_data_ff_vld      
        (
        .scan_in(ff_pulse_read_data_ff_vld_scanin),
        .scan_out(ff_pulse_read_data_ff_vld_scanout),
        .dout   (read_data_ff_vld_r1),
        .din    (read_data_ff_vld_d),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_fct_ctl_msff_ctl_macro__width_1  enable_efa_por_reg      
        (
        .scan_in(enable_efa_por_reg_scanin),
        .scan_out(enable_efa_por_reg_scanout),
        .dout   (enable_efa_por_ff_l),
        .din    (enable_efa_por_nxt_l),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


assign efa_array_power_down_nxt 
	= seq_state_idle & !(local_efu_read_start | local_fuse_bypass
		      | local_read_en | local_dest_sample)
	  & enable_efa_por_ff_l & inhibit_power_down_l;

efu_fct_ctl_msff_ctl_macro__width_1  efa_array_power_down_reg        
        (
        .scan_in(efa_array_power_down_reg_scanin),
        .scan_out(efa_array_power_down_reg_scanout),
        .dout   (efa_array_power_down_ff),
        .din    (efa_array_power_down_nxt),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


//-----------------------------------------------------------------------------
//  Read whole array sequencer
//-----------------------------------------------------------------------------
// Note| State encodings are chosen so the outputs are equal to signle
//         state bits.  Changing state encodings will change outputs! 
// Bit[3] is used to indicate idle/not idle.  
//

always @(addr_cnt_max or local_dest_sample or local_efu_read_start or local_fuse_bypass or local_read_en or mrd_cnt_done or recover_done or seq_state_ff or shift_done)
  begin
    enter_rsltshft = 1'b0;
    case (seq_state_ff) //synopsys parallel_case full_case
      `MSEQ_IDLE:
	if (local_efu_read_start)
	    seq_state_nxt = `MSEQ_DUMP;
	else if (local_read_en)
	    seq_state_nxt = `MSEQ_SGLRD;
	else if (local_fuse_bypass | local_dest_sample)
	    seq_state_nxt = `MSEQ_SHIFT;
        else
            seq_state_nxt = `MSEQ_IDLE;
      `MSEQ_DUMP:
	if (addr_cnt_max && shift_done)
	  begin
	    seq_state_nxt = `MSEQ_RSLTSHFT;
	    enter_rsltshft = 1'b1;
	  end
	else
	    seq_state_nxt = `MSEQ_DUMP;
      `MSEQ_RSLTSHFT:
	if (mrd_cnt_done)
	    seq_state_nxt = `MSEQ_IDLE;
	else
	    seq_state_nxt = `MSEQ_RSLTSHFT;
      `MSEQ_SGLRD:
	if (recover_done)
	  seq_state_nxt = `MSEQ_IDLE;
	else
	  seq_state_nxt = `MSEQ_SGLRD;
      `MSEQ_SHIFT:
	if (shift_done)
	  seq_state_nxt = `MSEQ_IDLE;
	else
	  seq_state_nxt = `MSEQ_SHIFT;
      `MSEQ_DEST_SMPL:
	if (shift_done)
	  seq_state_nxt = `MSEQ_IDLE;
	else
	  seq_state_nxt = `MSEQ_DEST_SMPL;
      `MSEQ_L2RR_SMPL:
	if (shift_done)
	  seq_state_nxt = `MSEQ_IDLE;
	else
	  seq_state_nxt = `MSEQ_L2RR_SMPL;
      `MSEQ_BYPASS:
	if (shift_done)
	  seq_state_nxt = `MSEQ_IDLE;
	else
	  seq_state_nxt = `MSEQ_BYPASS;
      default:
	  seq_state_nxt = `MSEQ_IDLE;
    endcase
  end
assign seq_state_idle     = (!seq_state_ff[3]);
assign seq_state_dump     = (seq_state_ff == `MSEQ_DUMP);
assign seq_state_sglrd    = (seq_state_ff == `MSEQ_SGLRD);
//assign seq_state_bypass   = (seq_state_ff == `MSEQ_BYPASS);
assign seq_state_bypass   = (seq_state_ff == `MSEQ_SHIFT);
assign seq_state_rsltshft = (seq_state_ff == `MSEQ_RSLTSHFT);
assign seq_state_dest_smpl = (seq_state_ff == `MSEQ_DEST_SMPL);
assign seq_state_l2rr_smpl = (seq_state_ff == `MSEQ_L2RR_SMPL);

efu_fct_ctl_msff_ctl_macro__width_4  seq_state_reg   
        (
        .scan_in(seq_state_reg_scanin),
        .scan_out(seq_state_reg_scanout),
        .dout   (seq_state_ff[3:0]),
        .din    (seq_state_nxt[3:0]),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

//-----------------------------------------------------------------------------
//  Address Counter
//-----------------------------------------------------------------------------
assign addr_cnt_inc1[5:0] = addr_cnt_ff[5:0] + 6'b000001;

assign addr_cnt_nxt [6:0] = local_efu_read_start ? 7'b0000000
			      : !seq_state_dump ? snc1_rowaddr[6:0]
			      : {1'b0,addr_cnt_inc1};

assign addr_cnt_max       = &addr_cnt_ff[5:0];

assign addr_cnt_en = local_efu_read_start 
	      | shift_done & !addr_cnt_max & seq_state_dump
              | !seq_state_dump;

efu_fct_ctl_msff_ctl_macro__en_1__width_7  addr_cnt_reg    
        (
        .scan_in(addr_cnt_reg_scanin),
        .scan_out(addr_cnt_reg_scanout),
        .dout   (addr_cnt_ff[6:0]),
        .din    (addr_cnt_nxt[6:0]),
        .en     (addr_cnt_en),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );




//-----------------------------------------------------------------------------
// Read and process one entry sequencer
//-----------------------------------------------------------------------------
// Note!! MRD_RD_ARRAY encoding was chosen so that mrd_state_ff[2] uniquely
//  defines being in that state.  (like one hot, but only for that state)

reg  [2:0]	mrd_state_nxt;
reg		enter_rd_array;
reg		enter_xfer;
//wire		enter_ashift;
//wire		enter_dshift;
reg		enter_recover;
wire [2:0]	mrd_state_ff;
wire		mrd_state_rd_array;
//wire		mrd_state_ashift;
//wire		mrd_state_dshift;
//wire		mrd_state_shift;
wire		mrd_state_recover;

always @(local_dest_sample or local_fuse_bypass or mrd_cnt_done or mrd_state_ff or seq_state_dump or seq_state_sglrd)
  begin
    enter_rd_array  = 1'b0;
//    enter_ashift    = 1'b0;
    enter_xfer    = 1'b0;
    enter_recover   = 1'b0;
 //   enter_dshift    = 1'b0;
    case (mrd_state_ff) //synopsys parallel_case full_case
      `MRD_IDLE:
	if (seq_state_sglrd || seq_state_dump)
	  begin
	    mrd_state_nxt = `MRD_RD_ARRAY;
	    enter_rd_array = 1'b1;
	  end
	else if (local_fuse_bypass || local_dest_sample)
	  begin
//	    mrd_state_nxt = `MRD_ASHIFT;
	    mrd_state_nxt = `MRD_XFER;
	    //enter_ashift    = 1'b1;
		enter_xfer = 1'b1;
	  end
	else
	  mrd_state_nxt = `MRD_IDLE;
////////////////////////////////////////////
      `MRD_RD_ARRAY:
	if (mrd_cnt_done && seq_state_dump)
	  begin
	    mrd_state_nxt = `MRD_XFER;
		enter_xfer = 1'b1;
	  end
	else if (mrd_cnt_done)
	  begin
	    mrd_state_nxt = `MRD_RECOVER;
	    enter_recover   = 1'b1;
	  end
	else
	  mrd_state_nxt = `MRD_RD_ARRAY;
////////////////////////////////////////////
	`MRD_XFER : 
	 
	 if( mrd_cnt_done)
	   mrd_state_nxt = `MRD_IDLE;
	 else
    	   mrd_state_nxt = `MRD_XFER;

////////////////////////////////////////////

      `MRD_RECOVER:
	if (mrd_cnt_done)
	  mrd_state_nxt = `MRD_IDLE;
	else
	  mrd_state_nxt = `MRD_RECOVER;
      default:
	  mrd_state_nxt = `MRD_IDLE;
    endcase
  end

//assign mrd_state_idle     = (mrd_state_ff == `MRD_IDLE);
assign mrd_state_rd_array  = mrd_state_ff[2];
//assign mrd_state_ashift    = (mrd_state_ff == `MRD_ASHIFT);
//assign mrd_state_dshift    = (mrd_state_ff == `MRD_DSHIFT);

assign mrd_state_xfer	   = (mrd_state_ff == `MRD_XFER);
//assign mrd_state_shift     = mrd_state_ashift | mrd_state_dshift;
assign mrd_state_recover   = (mrd_state_ff == `MRD_RECOVER);
assign shift_done 	   = mrd_state_xfer & mrd_cnt_done;
assign rd_array_done 	   = mrd_state_rd_array & mrd_cnt_done;
assign recover_done 	   = mrd_state_recover  & mrd_cnt_done;

assign mrd_state_ashift = mrd_state_xfer;
assign mrd_state_dshift = mrd_state_xfer;
assign mrd_state_shift = mrd_state_xfer;

efu_fct_ctl_msff_ctl_macro__width_3  mrd_state_reg    
        (
        .scan_in(mrd_state_reg_scanin),
        .scan_out(mrd_state_reg_scanout),
        .dout   (mrd_state_ff[2:0]),
        .din    (mrd_state_nxt[2:0]),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );



//-----------------------------------------------------------------------------
//  General purpose timing counter
//-----------------------------------------------------------------------------

wire [8:0]	mrd_cnt_ff;
wire [8:0]	mrd_cnt_nxt;
wire [8:0]	mrd_cnt_dec1;
wire [5:0]	l2rr_read_cnt;
wire [8:0] 	mrd_cnt_dec1_true_value_9;
wire [8:0] 	enter_recover_false_value;

assign l2rr_read_cnt = read_data_ff[17:12];

// General purpose CNTer used for timing reads from array and shifting
// to destination registers.  Note that CNTdown stops at 0 and won't wrap.

assign mrd_cnt_dec1[8:0] = mrd_cnt_ff[8:0] - 9'b0_0000_0001;
assign mrd_cnt_dec1_true_value = !mrd_cnt_done;
assign mrd_cnt_dec1_true_value_9 = {9{mrd_cnt_dec1_true_value}};

assign enter_recover_false_value = (mrd_cnt_dec1 & mrd_cnt_dec1_true_value_9);


//assign mrd_cnt_nxt [8:0] = enter_rd_array ? 9'd20
//       : enter_ashift  ? {(7'd09),2'b11}
//       : (enter_dshift & seq_state_l2rr_smpl) ? ({1'b0,l2rr_read_cnt,2'b11})
//       : enter_dshift ? {(7'd12),2'b11}
//       : enter_rsltshft ? {(7'd63),2'b11}
//       : enter_recover ? 9'd10 : enter_recover_false_value;


// ### CPS 3/29/2005
// need to load d21 so that bit 21-0 get shifted out
// : enter_xfer ? 9'd22
//	: enter_recover ? 9'd10 : enter_recover_false_value;
//	: enter_rsltshft ? {(7'd63),2'b11}
//need to change 20 to 40
assign mrd_cnt_nxt [8:0] = enter_rd_array     ? 9'd42
                         : enter_xfer ? (serdes ? 9'd91 : 9'd21)
	                 : enter_rsltshft     ? 9'd63 
	                 : enter_recover      ? 9'd10 
			 : mrd_cnt_ff == 9'd0 ? 9'd0
                         : mrd_cnt_dec1[8:0];


//assign mrd_cnt_done = ~|mrd_cnt_ff;
assign mrd_cnt_63   = mrd_cnt_nxt == 9'd63;

efu_fct_ctl_msff_ctl_macro__width_1  ff_mrd_zero     
        (
        .scan_in(ff_mrd_zero_scanin),
        .scan_out(ff_mrd_zero_scanout),
        .dout   (mrd_cnt_done),
        .din    (mrd_cnt_ff == 9'd1),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_fct_ctl_msff_ctl_macro__width_1  mrd_63_to_0_ff     
        (
        .scan_in(mrd_63_to_0_ff_scanin),
        .scan_out(mrd_63_to_0_ff_scanout),
        .dout   (mrd_63_to_0),
        .din    ((~mrd_cnt_done & mrd_63_to_0) | mrd_cnt_63),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_fct_ctl_msff_ctl_macro__width_9  mrd_cnt_reg     
        (
        .scan_in(mrd_cnt_reg_scanin),
        .scan_out(mrd_cnt_reg_scanout),
        .dout   (mrd_cnt_ff[8:0]),
        .din    (mrd_cnt_nxt[8:0]),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


//-----------------------------------------------------------------------------
//  Read array data register
//-----------------------------------------------------------------------------
wire  [2:0]	valid_bits;
//wire		parity_bit;
wire  [5:0]	block_id;
//wire  [21:0]	payload_data;
wire		computed_parity;
wire		good_parity;
wire		valid_row;
wire		row_error;
wire [31:0]	read_data_shift;
wire [31:0]	read_data_l2shift;
wire		read_data_shift_en;
wire		shift_in;
wire [2:0]	l2rd_id_ff;
wire      	l2rd_id_en;

assign serdes = enter_xfer & ((efa_out_data[27:22] == 6'b101010) | (efa_out_data[27:22] == 6'b101001)
		  | (efa_out_data[27:22] == 6'b101011));

assign shift_in = 1'b0;

assign read_data_shift_en = (seq_state_dest_smpl 
                             | seq_state_l2rr_smpl & mrd_state_xfer)
			    & (mrd_cnt_ff[1:0]==2'b00);
assign read_data_en = rd_array_done | update_dr_jbus | read_data_shift_en | load_l2_read_data | load_niu_read_data;
assign read_data_shift   = {read_data_ff[31:12], read_data_ff[10:0], shift_in};
assign read_data_l2shift = {read_data_ff[30:0], shift_in};
assign read_data_nxt = update_dr_jbus ? tck_shft_data_ff 
	             : seq_state_dest_smpl ? read_data_shift 
	             : seq_state_l2rr_smpl ? read_data_l2shift
                     : load_l2_read_data   ? shift_data_ff_out
                     : load_niu_read_data  ? niu_read_data_shift
	             : efa_out_data;

//assign l2rd_id_en = enter_ashift;
assign l2rd_id_en = enter_xfer;

efu_fct_ctl_msff_ctl_macro__en_1__width_32  read_data_reg   
        (
        .scan_in(read_data_reg_scanin),
        .scan_out(read_data_reg_scanout),
        .din    (read_data_nxt),
        .dout   (read_data_ff),
        .en     (read_data_en),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_fct_ctl_msff_ctl_macro__en_1__width_3  l2rd_id_reg     
        (
        .scan_in(l2rd_id_reg_scanin),
        .scan_out(l2rd_id_reg_scanout),
        .din    (block_id[2:0]),
        .dout   (l2rd_id_ff[2:0]),
        .en     (l2rd_id_en),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


//assign parity_bit = read_data_ff[28];
//assign payload_data = read_data_ff[21:0];

assign valid_bits = read_data_ff[31:29];
assign block_id = read_data_ff[27:22];
assign computed_parity = ^read_data_ff[28:0];

assign good_parity = !computed_parity;
//### CPS
//assign good_parity = computed_parity;

always @(valid_bits)
  case (valid_bits) //synopsys parallel_case full_case
    3'b000: {valid, val_err} = 2'b00;
    3'b001: {valid, val_err} = 2'b01;
    3'b010: {valid, val_err} = 2'b01;
    3'b100: {valid, val_err} = 2'b01;
    3'b011: {valid, val_err} = 2'b10;
    3'b101: {valid, val_err} = 2'b10;
    3'b110: {valid, val_err} = 2'b10;
    3'b111: {valid, val_err} = 2'b10;
  endcase

assign valid_row = good_parity & valid;

wire [63:0]		rslt_status_nxt;
wire [63:0]		rslt_status_ff;
wire			rslt_status_en;
wire [63:0]		rslt_status_set;
wire [63:0]		rslt_status_clr;
wire [63:0]		rslt_status_vect;

//###CPS parity is 1 == row error       ??????
//       parity is 0 == no row error    ??????
// assign row_error 	= val_err | (valid & ~good_parity);

//assign invalid_blk_id	= (block_id[5] == 1'b1 & block_id[4] == 1'b1) | (block_id == 6'b101101) | (block_id == 6'b101110) | (block_id == 6'b101111);
//assign row_error	= (val_err | (valid & ~good_parity)) & ~invalid_blk_id;
assign row_error	= val_err | (valid & ~good_parity);

assign rslt_status_en 	= seq_state_dump & shift_done;
assign rslt_status_vect = ({{63{1'b0}},rslt_status_en} << addr_cnt_ff[5:0]);
assign rslt_status_set  = rslt_status_vect & {64{row_error}};
assign rslt_status_clr  = rslt_status_vect & {64{!row_error}};
assign rslt_status_nxt 	= rslt_status_set | ~rslt_status_clr & rslt_status_ff;


efu_fct_ctl_msff_ctl_macro__width_64  rslt_status_reg 
        (
        .scan_in(rslt_status_reg_scanin),
        .scan_out(rslt_status_reg_scanout),
        .dout   (rslt_status_ff[63:0]),
        .din    (rslt_status_nxt[63:0]),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );





//-----------------------------------------------------------------------------
// Shift control
//-----------------------------------------------------------------------------
wire		mrd_cnt_ge_12;
wire		mrd_cnt_ge_2;
wire		mrd_cnt_ge_1;
//wire		local_fuse_clk1_nxt;
wire		local_fuse_ashift_nxt;
wire		local_fuse_dshift_nxt;
wire		fuse_data_bit_mux;
wire		fuse_rid_bit_mux;
wire		rslt_data_bit_mux;
wire		local_fuse_data_nxt;
wire		decode_enable;
//wire		decode_enable_l2rr;
//wire		local_fuse_clk1_ff;
//wire		local_fuse_clk1_dly_ff;
//wire		local_fuse_clk2_ff;
wire		local_fuse_data_ff;
wire [15:0]	rid_data;
wire [31:0]	write_dest_data;
wire		write_en;
wire		dest_ncu;

assign dest_ncu = ncu_coreavail_dec | ncu_sernum0_dec 
		       | ncu_sernum1_dec | ncu_sernum2_dec;
assign rid_data =        dest_ncu 
                         ? {{6{1'b0}},
			    read_data_ff[21:12]}
                         : {{5{1'b0}},
			    read_data_ff[21:12], write_en};
assign write_en = !(seq_state_dest_smpl | seq_state_l2rr_smpl);
assign write_dest_data = {{8{1'b0}},
                          read_data_ff[21:12], write_en, 
			  read_data_ff[11:0],
			  1'b0};

//
// assign local_fuse_clk1_nxt = 
// 	(mrd_state_shift | seq_state_rsltshft) & (mrd_cnt_ff[1:0]==2'b10) & efu_rst_l;
//

//assign local_fuse_clk1_nxt = 
// 	(mrd_state_shift | seq_state_rsltshft) & (mrd_cnt_ff[1:0]==2'b10);

assign mrd_cnt_ge_12 = (mrd_cnt_ff[6:0] >= {5'd12,2'b00});
assign mrd_cnt_ge_2  = (mrd_cnt_ff[6:0] >= { 5'd2,2'b00});
assign mrd_cnt_ge_1  = (mrd_cnt_ff[8:0] >= { 7'd1,2'b00});

//assign local_fuse_ashift_nxt = mrd_state_ashift & efu_rst_l;

assign local_fuse_ashift_nxt = mrd_state_ashift;

//
//assign local_fuse_dshift_nxt = efu_rst_l & (seq_state_rsltshft 
//       | (mrd_state_dshift & (seq_state_dest_smpl  ? (!mrd_cnt_ge_12 & mrd_cnt_ge_1)
//	: seq_state_l2rr_smpl ? (mrd_cnt_ge_1)
//	: mrd_cnt_ge_2 | dest_ncu & mrd_cnt_ge_1)) );
//


assign local_fuse_dshift_nxt = (seq_state_rsltshft & mrd_63_to_0 
       | (mrd_state_dshift & (seq_state_dest_smpl  ? (!mrd_cnt_ge_12 & mrd_cnt_ge_1)
	: seq_state_l2rr_smpl ? (mrd_cnt_ge_1)
	: mrd_cnt_ge_2 | dest_ncu & mrd_cnt_ge_1)) );

assign fuse_data_bit_mux = write_dest_data[mrd_cnt_ff[6:2]];
assign fuse_rid_bit_mux  = rid_data[mrd_cnt_ff[5:2]];
//assign rslt_data_bit_mux = rslt_status_ff[mrd_cnt_ff[7:2]];
assign rslt_data_bit_mux = rslt_status_ff[mrd_cnt_ff[5:0]];

//##### change back if necessary CPS
//      need to include the rsltshft terms
//      need to find something to inhibit the read_data_ff term
//assign local_fuse_data_nxt = (mrd_state_ashift & fuse_rid_bit_mux)
//			      | (mrd_state_dshift & fuse_data_bit_mux)
//			      | (seq_state_rsltshft & rslt_data_bit_mux);
// added mrd_state_shift to qualify the shift out data
assign local_fuse_data_nxt = (mrd_state_shift & read_data_ff[mrd_cnt_ff]) | (seq_state_rsltshft & rslt_data_bit_mux);

efu_fct_ctl_msff_ctl_macro__width_1  local_fuse_data_reg     
        (
        .scan_in(local_fuse_data_reg_scanin),
        .scan_out(local_fuse_data_reg_scanout),
        .dout   (local_fuse_data_ff),
        .din    (local_fuse_data_nxt),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

// ### CPS
//assign decode_enable = mrd_state_shift & (valid_row | seq_state_dest_smpl | seq_state_bypass);
assign decode_enable = mrd_state_shift & (valid_row & (seq_state_dump | seq_state_dest_smpl | seq_state_bypass));
//assign decode_enable_l2rr = mrd_state_shift & seq_state_l2rr_smpl;

//-----------------------------------------------------------------------------
//  destination decoder
//-----------------------------------------------------------------------------

assign ncu_coreavail_dec= (block_id[5:0] == 6'b100000) & decode_enable;
assign ncu_bankavail_dec= (block_id[5:0] == 6'b100001) & decode_enable;
assign ncu_sernum0_dec 	= (block_id[5:0] == 6'b100010) & decode_enable;
assign ncu_sernum1_dec 	= (block_id[5:0] == 6'b100011) & decode_enable;
assign ncu_sernum2_dec 	= (block_id[5:0] == 6'b100100) & decode_enable;
assign ncu_fusestat_dec = seq_state_rsltshft;

assign l2d_fuse_dec 	= (block_id[5:3] == 3'b011);
//assign l2d0_read_dec 	= (l2rd_id_ff[2:0] == 3'b000) & decode_enable_l2rr; 
//assign l2d1_read_dec 	= (l2rd_id_ff[2:0] == 3'b001) & decode_enable_l2rr; 
//assign l2d2_read_dec 	= (l2rd_id_ff[2:0] == 3'b010) & decode_enable_l2rr; 
//assign l2d3_read_dec 	= (l2rd_id_ff[2:0] == 3'b011) & decode_enable_l2rr; 
//assign l2d4_read_dec 	= (l2rd_id_ff[2:0] == 3'b100) & decode_enable_l2rr; 
//assign l2d5_read_dec 	= (l2rd_id_ff[2:0] == 3'b101) & decode_enable_l2rr; 
//assign l2d6_read_dec 	= (l2rd_id_ff[2:0] == 3'b110) & decode_enable_l2rr; 
//assign l2d7_read_dec 	= (l2rd_id_ff[2:0] == 3'b111) & decode_enable_l2rr; 

//-----------------------------------------------------------------------------
//  destination demux
//-----------------------------------------------------------------------------

assign efu_ncu_fuse_data 	= local_fuse_data_ff;


//-----------------------------------------------------------------------------
//  Shift Control Output flops
//-----------------------------------------------------------------------------
efu_fct_ctl_msff_ctl_macro__width_1  ncu_coreavail_dshift_reg  
        (
        .scan_in(ncu_coreavail_dshift_reg_scanin),
        .scan_out(ncu_coreavail_dshift_reg_scanout),
        .din    (ncu_coreavail_dec & (local_fuse_ashift_nxt | local_fuse_dshift_nxt)),
        .dout   (efu_ncu_coreavl_xfer_en),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


efu_fct_ctl_msff_ctl_macro__width_1  ncu_bankavail_dshift_reg  
        (
        .scan_in(ncu_bankavail_dshift_reg_scanin),
        .scan_out(ncu_bankavail_dshift_reg_scanout),
        .din    (ncu_bankavail_dec & (local_fuse_ashift_nxt | local_fuse_dshift_nxt)),
        .dout   (efu_ncu_bankavl_xfer_en),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


efu_fct_ctl_msff_ctl_macro__width_1  ncu_sernum0_dshift_reg  
        (
        .scan_in(ncu_sernum0_dshift_reg_scanin),
        .scan_out(ncu_sernum0_dshift_reg_scanout),
        .din    (ncu_sernum0_dec & (local_fuse_ashift_nxt | local_fuse_dshift_nxt)),
        .dout   (efu_ncu_srlnum0_xfer_en),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );
efu_fct_ctl_msff_ctl_macro__width_1  ncu_sernum1_dshift_reg  
        (
        .scan_in(ncu_sernum1_dshift_reg_scanin),
        .scan_out(ncu_sernum1_dshift_reg_scanout),
        .din    (ncu_sernum1_dec & (local_fuse_ashift_nxt | local_fuse_dshift_nxt)),
        .dout   (efu_ncu_srlnum1_xfer_en),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );
efu_fct_ctl_msff_ctl_macro__width_1  ncu_sernum2_dshift_reg  
        (
        .scan_in(ncu_sernum2_dshift_reg_scanin),
        .scan_out(ncu_sernum2_dshift_reg_scanout),
        .din    (ncu_sernum2_dec & (local_fuse_ashift_nxt | local_fuse_dshift_nxt)),
        .dout   (efu_ncu_srlnum2_xfer_en),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

efu_fct_ctl_msff_ctl_macro__width_1  ncu_fusestat_dshift_reg  
        (
        .scan_in(ncu_fusestat_dshift_reg_scanin),
        .scan_out(ncu_fusestat_dshift_reg_scanout),
        .din    (ncu_fusestat_dec & (local_fuse_ashift_nxt | local_fuse_dshift_nxt)),
        .dout   (efu_ncu_fusestat_xfer_en),
        .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );


// efu_tcu_dp merge
wire	[31:0]	tck_shft_data_nxt;
wire		updtdr_snc1_ff,updtdr_snc2_ff,updtdr_hist_ff;

cl_sc1_clksyncff_4x ff_updtdr_slice
        (
	.si(ff_updtdr_slice_scanin),
	.so(ff_updtdr_slice_scanout),
	.q		(updtdr_sync1),
	.d		(tcu_efu_updatedr),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_updtdr_slice1
        (
	.si(ff_updtdr_slice1_scanin),
	.so(ff_updtdr_slice1_scanout),
	.q		(updtdr_sync2),
	.d		(updtdr_sync1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_updtdr_slice2
        (
	.si(ff_updtdr_slice2_scanin),
	.so(ff_updtdr_slice2_scanout),
	.q		(updtdr_hist_ff),
	.d		(updtdr_sync2),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

//cl_sc1_clksyncff_4x ff_updtdr_slice (width=3)
//        (
//	.si(ff_updtdr_slice_scanin),
//	.so(ff_updtdr_slice_scanout),
//	.q		({updtdr_sync1,updtdr_sync2,updtdr_hist_ff}),
//	.d		({tcu_efu_updatedr,updtdr_sync1,updtdr_sync2}),
//	.l1clk		(l1clk),
//       );

assign update_dr_jbus = updtdr_sync2 & ~updtdr_hist_ff ;

///////////////////////////////////////////////////////////////////

cl_sc1_clksyncff_4x ff_read_en_slice 
   (
   .si    ( ff_read_en_slice_scanin  ),
   .so    ( ff_read_en_slice_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( tcu_efu_read_en                  ),
   .q     ( read_en_sync1             ),
  .siclk(siclk),
  .soclk(soclk)
   );

cl_sc1_clksyncff_4x ff_read_en_slice1 
   (
   .si    ( ff_read_en_slice1_scanin  ),
   .so    ( ff_read_en_slice1_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( read_en_sync1                  ),
   .q     ( read_en_sync2             ),
  .siclk(siclk),
  .soclk(soclk)
   );

cl_sc1_clksyncff_4x ff_read_en_slice2 
   (
   .si    ( ff_read_en_slice2_scanin  ),
   .so    ( ff_read_en_slice2_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( read_en_sync2                  ),
   .q     ( read_en_hist_ff             ),
  .siclk(siclk),
  .soclk(soclk)
   );

//msff_ctl_macro ff_read_en_slice (width=3)
//	(
//	.scan_in(ff_read_en_slice_scanin),
//	.scan_out(ff_read_en_slice_scanout),
//	.dout	        ({read_en_sync1,read_en_sync2,read_en_hist_ff}),
//	.din	        ({tcu_efu_read_en,read_en_sync1,read_en_sync2}),
//	.l1clk	        (l1clk),
//	);

assign local_read_en = read_en_sync2 & ~read_en_hist_ff ;

///////////////////////////////////////////////////////////////////

//msff_ctl_macro ff_read_start_slice (width=3)
//	(
//	.scan_in(ff_read_start_slice_scanin),
//	.scan_out(ff_read_start_slice_scanout),
//	.dout		({read_start_sync1,read_start_sync2,read_start_hist_ff}),
//	.din		({tcu_efu_read_start,read_start_sync1,read_start_sync2}),
// 	.l1clk		(l1clk),
//	);

//msff_ctl_macro ff_read_start_2_slice (width=1)
//	(
//	.scan_in(ff_read_start_2_slice_scanin),
//	.scan_out(ff_read_start_2_slice_scanout),
//	.dout		(read_start_sync1),
//	.din		(tcu_efu_read_start),
 //	.l1clk		(l1clk),
//	);

efu_fct_ctl_msff_ctl_macro__width_1 ff_read_start_0_slice 
	(
	.scan_in(ff_read_start_0_slice_scanin),
	.scan_out(ff_read_start_0_slice_scanout),
	.dout		(read_start_hist_ff),
	.din		(read_start_sync2),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_fct_ctl_msff_ctl_macro__en_1__width_1 ff_read_start_1_slice  
	(
	.scan_in(ff_read_start_1_slice_scanin),
	.scan_out(ff_read_start_1_slice_scanout),
	.dout		(read_start_sync2),
//	.din		(read_start_sync1),
	.din		(tcu_efu_read_start),
//        .en             (cmp_io_sync_en_r2),
        .en             (cmp_io_sync_en_r1),
	.l1clk		(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

efu_fct_ctl_msff_ctl_macro__width_1 ff_cmp_io_sync_en 
	(
	.scan_in(ff_cmp_io_sync_en_scanin),
	.scan_out(ff_cmp_io_sync_en_scanout),
	.dout		(cmp_io_sync_en_r1),
	.din		(cmp_io_sync_en),
	.l1clk		(l1clk_cmp),
  .siclk(siclk),
  .soclk(soclk)
	);

//msff_ctl_macro ff_cmp_io_sync_en_r1 (width=1)
//	(
//	.scan_in(ff_cmp_io_sync_en_r1_scanin),
//	.scan_out(ff_cmp_io_sync_en_r1_scanout),
//	.dout		(cmp_io_sync_en_r2),
//	.din		(cmp_io_sync_en_r1),
//	.l1clk		(l1clk_cmp),
//	);


assign local_efu_read_start = read_start_sync2 & ~read_start_hist_ff ;

///////////////////////////////////////////////////////////////////

cl_sc1_clksyncff_4x ff_fuse_bypass_slice 
  (
   .si    ( ff_fuse_bypass_slice_scanin  ),
   .so    ( ff_fuse_bypass_slice_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( tcu_efu_fuse_bypass          ),
   .q     ( fuse_bypass_sync1            ),
  .siclk(siclk),
  .soclk(soclk)
   );

cl_sc1_clksyncff_4x ff_fuse_bypass_slice1 
  (
   .si    ( ff_fuse_bypass_slice_1_scanin  ),
   .so    ( ff_fuse_bypass_slice_1_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( fuse_bypass_sync1            ),
   .q     ( fuse_bypass_sync2            ),
  .siclk(siclk),
  .soclk(soclk)
   );

cl_sc1_clksyncff_4x ff_fuse_bypass_slice2 
  (
   .si    ( ff_fuse_bypass_slice_2_scanin  ),
   .so    ( ff_fuse_bypass_slice_2_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( fuse_bypass_sync2          ),
   .q     ( fuse_bypass_hist_ff            ),
  .siclk(siclk),
  .soclk(soclk)
   );




//msff_ctl_macro ff_fuse_bypass_slice (width=3)
//	(
//	.scan_in(ff_fuse_bypass_slice_scanin),
//	.scan_out(ff_fuse_bypass_slice_scanout),
//	.dout		({fuse_bypass_sync1,fuse_bypass_sync2,fuse_bypass_hist_ff}),
//	.din		({tcu_efu_fuse_bypass,fuse_bypass_sync1,fuse_bypass_sync2}),
//	.l1clk		(l1clk),
//	);

assign local_fuse_bypass = fuse_bypass_sync2 & ~fuse_bypass_hist_ff ;

///////////////////////////////////////////////////////////////////

cl_sc1_clksyncff_4x ff_dest_sample_slice 
  (
   .si    ( ff_dest_sample_slice_scanin  ),
   .so    ( ff_dest_sample_slice_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( tcu_efu_dest_sample          ),
   .q     ( dest_sample_sync1            ),
  .siclk(siclk),
  .soclk(soclk)
   );

cl_sc1_clksyncff_4x ff_dest_sample_slice1 
  (
   .si    ( ff_dest_sample_slice_1_scanin  ),
   .so    ( ff_dest_sample_slice_1_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( dest_sample_sync1            ),
   .q     ( dest_sample_sync2            ),
  .siclk(siclk),
  .soclk(soclk)
   );

cl_sc1_clksyncff_4x ff_dest_sample_slice2 
  (
   .si    ( ff_dest_sample_slice_2_scanin  ),
   .so    ( ff_dest_sample_slice_2_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( dest_sample_sync2          ),
   .q     ( dest_sample_hist_ff            ),
  .siclk(siclk),
  .soclk(soclk)
   );


//msff_ctl_macro ff_dest_sample_slice (width=3)
//	(
//	.scan_in(ff_dest_sample_slice_scanin),
//	.scan_out(ff_dest_sample_slice_scanout),
//	.dout		({dest_sample_sync1,dest_sample_sync2,dest_sample_hist_ff}),
//	.din		({tcu_efu_dest_sample,dest_sample_sync1,dest_sample_sync2}),
//	.l1clk		(l1clk),
//	);

assign local_dest_sample = dest_sample_sync2 & ~dest_sample_hist_ff ;

///////////////////////////////////////////////////////////////////

assign w_mux_shift_retain[31:0] = tcu_efu_shiftdr ? {tck_shft_data_ff[30:0], tcu_efu_data_in} : tck_shft_data_ff[31:0] ;

assign tck_shft_data_nxt[31:0] = tcu_efu_capturedr ? read_data_ff[31:0] : w_mux_shift_retain[31:0] ;

efu_fct_ctl_msff_ctl_macro__width_32 ff_tck_shift_data_nxt	
		(
		.scan_in(ff_tck_shift_data_nxt_scanin),
		.scan_out(ff_tck_shift_data_nxt_scanout),
		.dout	(tck_shft_data_ff[31:0]),
		.din	(tck_shft_data_nxt[31:0]),
		.l1clk	(tckl1clk),
  .siclk(siclk),
  .soclk(soclk)
		);

assign efu_tcu_data_out = tck_shft_data_ff[31] ;

///////////////////////////////////////////////////////////////////

cl_sc1_clksyncff_4x ff_sync1_rowaddr6_1
        (
	.si(ff_sync1_rowaddr_6_1_scanin),
	.so(ff_sync1_rowaddr_6_1_scanout),
	.q		(sync_tcu_efu_rowaddr6),
	.d		(tcu_efu_rowaddr6_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr5_1
        (
	.si(ff_sync1_rowaddr_5_1_scanin),
	.so(ff_sync1_rowaddr_5_1_scanout),
	.q		(sync_tcu_efu_rowaddr5),
	.d		(tcu_efu_rowaddr5_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr4_1
        (
	.si(ff_sync1_rowaddr_4_1_scanin),
	.so(ff_sync1_rowaddr_4_1_scanout),
	.q		(sync_tcu_efu_rowaddr4),
	.d		(tcu_efu_rowaddr4_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr3_1
        (
	.si(ff_sync1_rowaddr_3_1_scanin),
	.so(ff_sync1_rowaddr_3_1_scanout),
	.q		(sync_tcu_efu_rowaddr3),
	.d		(tcu_efu_rowaddr3_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr2_1
        (
	.si(ff_sync1_rowaddr_2_1_scanin),
	.so(ff_sync1_rowaddr_2_1_scanout),
	.q		(sync_tcu_efu_rowaddr2),
	.d		(tcu_efu_rowaddr2_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr1_1
        (
	.si(ff_sync1_rowaddr_1_1_scanin),
	.so(ff_sync1_rowaddr_1_1_scanout),
	.q		(sync_tcu_efu_rowaddr1),
	.d		(tcu_efu_rowaddr1_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr_1
        (
	.si(ff_sync1_rowaddr_0_1_scanin),
	.so(ff_sync1_rowaddr_0_1_scanout),
	.q		(sync_tcu_efu_rowaddr0),
	.d		(tcu_efu_rowaddr0_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr6
        (
	.si(ff_sync1_rowaddr_6_scanin),
	.so(ff_sync1_rowaddr_6_scanout),
	.q		(tcu_efu_rowaddr6_1),
	.d		(tcu_efu_rowaddr[6]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr5
        (
	.si(ff_sync1_rowaddr_5_scanin),
	.so(ff_sync1_rowaddr_5_scanout),
	.q		(tcu_efu_rowaddr5_1),
	.d		(tcu_efu_rowaddr[5]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr4
        (
	.si(ff_sync1_rowaddr_4_scanin),
	.so(ff_sync1_rowaddr_4_scanout),
	.q		(tcu_efu_rowaddr4_1),
	.d		(tcu_efu_rowaddr[4]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr3
        (
	.si(ff_sync1_rowaddr_3_scanin),
	.so(ff_sync1_rowaddr_3_scanout),
	.q		(tcu_efu_rowaddr3_1),
	.d		(tcu_efu_rowaddr[3]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr2
        (
	.si(ff_sync1_rowaddr_2_scanin),
	.so(ff_sync1_rowaddr_2_scanout),
	.q		(tcu_efu_rowaddr2_1),
	.d		(tcu_efu_rowaddr[2]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr1
        (
	.si(ff_sync1_rowaddr_1_scanin),
	.so(ff_sync1_rowaddr_1_scanout),
	.q		(tcu_efu_rowaddr1_1),
	.d		(tcu_efu_rowaddr[1]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_rowaddr
        (
	.si(ff_sync1_rowaddr_scanin),
	.so(ff_sync1_rowaddr_scanout),
	.q		(tcu_efu_rowaddr0_1),
	.d		(tcu_efu_rowaddr[0]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

//msff_ctl_macro ff_sync1_rowaddr	(width=7)
//		(
//		.scan_in(ff_sync1_rowaddr_scanin),
//		.scan_out(ff_sync1_rowaddr_scanout),
//		.dout		(sync1_rowaddress[6:0]),
//		.din		(tcu_efu_rowaddr[6:0]),
//		.l1clk		(l1clk),
//		);
assign sync1_rowaddress[6:0] = {sync_tcu_efu_rowaddr6, sync_tcu_efu_rowaddr5, sync_tcu_efu_rowaddr4, sync_tcu_efu_rowaddr3, sync_tcu_efu_rowaddr2, sync_tcu_efu_rowaddr1, sync_tcu_efu_rowaddr0};

///////////////////////////////////////////////////////////////////

cl_sc1_clksyncff_4x ff_sync1_coladdr4_1
        (
	.si(ff_sync1_coladdr_4_1_scanin),
	.so(ff_sync1_coladdr_4_1_scanout),
	.q		(sync_tcu_efu_coladdr4),
	.d		(tcu_efu_coladdr4_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_coladdr3_1
        (
	.si(ff_sync1_coladdr_3_1_scanin),
	.so(ff_sync1_coladdr_3_1_scanout),
	.q		(sync_tcu_efu_coladdr3),
	.d		(tcu_efu_coladdr3_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_coladdr2_1
        (
	.si(ff_sync1_coladdr_2_1_scanin),
	.so(ff_sync1_coladdr_2_1_scanout),
	.q		(sync_tcu_efu_coladdr2),
	.d		(tcu_efu_coladdr2_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_coladdr1_1
        (
	.si(ff_sync1_coladdr_1_1_scanin),
	.so(ff_sync1_coladdr_1_1_scanout),
	.q		(sync_tcu_efu_coladdr1),
	.d		(tcu_efu_coladdr1_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_coladdr_1
        (
	.si(ff_sync1_coladdr_0_1_scanin),
	.so(ff_sync1_coladdr_0_1_scanout),
	.q		(sync_tcu_efu_coladdr0),
	.d		(tcu_efu_coladdr0_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_coladdr4
        (
	.si(ff_sync1_coladdr_4_scanin),
	.so(ff_sync1_coladdr_4_scanout),
	.q		(tcu_efu_coladdr4_1),
	.d		(tcu_efu_coladdr[4]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_coladdr3
        (
	.si(ff_sync1_coladdr_3_scanin),
	.so(ff_sync1_coladdr_3_scanout),
	.q		(tcu_efu_coladdr3_1),
	.d		(tcu_efu_coladdr[3]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_coladdr2
        (
	.si(ff_sync1_coladdr_2_scanin),
	.so(ff_sync1_coladdr_2_scanout),
	.q		(tcu_efu_coladdr2_1),
	.d		(tcu_efu_coladdr[2]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_coladdr1
        (
	.si(ff_sync1_coladdr_1_scanin),
	.so(ff_sync1_coladdr_1_scanout),
	.q		(tcu_efu_coladdr1_1),
	.d		(tcu_efu_coladdr[1]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_sync1_coladdr
        (
	.si(ff_sync1_coladdr_scanin),
	.so(ff_sync1_coladdr_scanout),
	.q		(tcu_efu_coladdr0_1),
	.d		(tcu_efu_coladdr[0]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

assign sync_tcu_efu_coladdr[4:0] = {sync_tcu_efu_coladdr4, sync_tcu_efu_coladdr3, sync_tcu_efu_coladdr2, sync_tcu_efu_coladdr1, sync_tcu_efu_coladdr0};




///////////////////////////////////////////////////////////////////

cl_sc1_clksyncff_4x ff_tcu_efu_read_mode_bit1
        (
	.si(ff_tcu_efu_read_mode_bit1_scanin),
	.so(ff_tcu_efu_read_mode_bit1_scanout),
	.q		(tcu_efu_read_mode1_1),
	.d		(tcu_efu_read_mode[1]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_tcu_efu_read_mode_bit1_1
        (
	.si(ff_tcu_efu_read_mode_bit1_1_scanin),
	.so(ff_tcu_efu_read_mode_bit1_1_scanout),
	.q		(sync_tcu_efu_read_mode1),
	.d		(tcu_efu_read_mode1_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_tcu_efu_read_mode_bit0
        (
	.si(ff_tcu_efu_read_mode_bit0_scanin),
	.so(ff_tcu_efu_read_mode_bit0_scanout),
	.q		(tcu_efu_read_mode0_1),
	.d		(tcu_efu_read_mode[0]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_tcu_efu_read_mode_bit0_1
        (
	.si(ff_tcu_efu_read_mode_bit0_1_scanin),
	.so(ff_tcu_efu_read_mode_bit0_1_scanout),
	.q		(sync_tcu_efu_read_mode0),
	.d		(tcu_efu_read_mode0_1),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

assign sync_tcu_efu_read_mode[1:0] = {sync_tcu_efu_read_mode1, sync_tcu_efu_read_mode0};

///////////////////////////////////////////////////////////////////

cl_sc1_clksyncff_4x ff_power_down_sync_slice
        (
	.si(ff_power_down_sync_slice_scanin),
	.so(ff_power_down_sync_slice_scanout),
	.q		(inhibit_power_down_sync_l),
	.d		(tcu_efu_read_mode[2]),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

cl_sc1_clksyncff_4x ff_power_down_sync_slice1
        (
	.si(ff_power_down_sync_slice_1_scanin),
	.so(ff_power_down_sync_slice_1_scanout),
	.q		(inhibit_power_down_l),
	.d		(inhibit_power_down_sync_l),
	.l1clk		(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );

//msff_ctl_macro ff_power_down_sync_slice   (width=2)
//		(
//		.scan_in(ff_power_down_sync_slice_scanin),
//		.scan_out(ff_power_down_sync_slice_scanout),
//		.dout		({inhibit_power_down_sync_l,inhibit_power_down_l}),
//		.din		({tcu_efu_read_mode[2],inhibit_power_down_sync_l}),
//		.l1clk		(l1clk),
//		);

///////////////////////////////////////////////////////////////////

efu_fct_ctl_spare_ctl_macro__num_4 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// ioclk
assign {sbc_efa_margin1_rd, sbc_efa_margin0_rd} = sync_tcu_efu_read_mode[1:0];
// ioclk
assign sbc_efa_sup_det_rd = addr_cnt_ff[6];
// ioclk
assign sbc_efa_word_addr[5:0] = addr_cnt_ff[5:0];
// ioclk
assign sbc_efa_bit_addr[4:0] = sync_tcu_efu_coladdr[4:0];
// ioclk
assign sbc_efa_power_down = efa_array_power_down_ff;
// ioclk
assign efa_out_data[31:0] = efa_sbc_data[31:0];
// ioclk
assign sbc_efa_read_en = mrd_state_rd_array; // & testmode_l;

assign ff_pulse_read_data_ff_vld_scanin = scan_in;
assign mrd_63_to_0_ff_scanin = ff_pulse_read_data_ff_vld_scanout;
assign ff_mrd_zero_scanin = mrd_63_to_0_ff_scanout;
assign enable_efa_por_reg_scanin = ff_mrd_zero_scanout		   ;
assign efa_array_power_down_reg_scanin = enable_efa_por_reg_scanout;
assign seq_state_reg_scanin	 = efa_array_power_down_reg_scanout;
assign addr_cnt_reg_scanin	 = seq_state_reg_scanout    ;
assign mrd_state_reg_scanin	 = addr_cnt_reg_scanout	    ;
assign mrd_cnt_reg_scanin	 = mrd_state_reg_scanout    ;
assign read_data_reg_scanin	 = mrd_cnt_reg_scanout	    ;
assign l2rd_id_reg_scanin	 = read_data_reg_scanout    ;
assign rslt_status_reg_scanin	 = l2rd_id_reg_scanout	    ;
assign local_fuse_data_reg_scanin = rslt_status_reg_scanout  ;
assign ncu_coreavail_dshift_reg_scanin = local_fuse_data_reg_scanout;
assign ncu_bankavail_dshift_reg_scanin = ncu_coreavail_dshift_reg_scanout;
assign ncu_sernum0_dshift_reg_scanin = ncu_bankavail_dshift_reg_scanout;
assign ncu_sernum1_dshift_reg_scanin = ncu_sernum0_dshift_reg_scanout;
assign ncu_sernum2_dshift_reg_scanin = ncu_sernum1_dshift_reg_scanout;
assign ncu_fusestat_dshift_reg_scanin = ncu_sernum2_dshift_reg_scanout;
assign ff_updtdr_slice_scanin  = ncu_fusestat_dshift_reg_scanout;
assign ff_updtdr_slice1_scanin = ff_updtdr_slice_scanout;
assign ff_updtdr_slice2_scanin = ff_updtdr_slice1_scanout;
assign ff_read_en_slice_scanin = ff_updtdr_slice2_scanout;
assign ff_read_en_slice1_scanin = ff_read_en_slice_scanout;
assign ff_read_en_slice2_scanin = ff_read_en_slice1_scanout;

//assign ff_fuse_bypass_slice_scanin = ff_read_start_slice_scanout ;
//assign ff_read_start_2_slice_scanin = ff_read_en_slice_scanout;

assign ff_read_start_1_slice_scanin = ff_read_en_slice2_scanout;
assign ff_read_start_0_slice_scanin = ff_read_start_1_slice_scanout;

assign ff_fuse_bypass_slice_scanin = ff_read_start_0_slice_scanout ;
assign ff_fuse_bypass_slice_1_scanin = ff_fuse_bypass_slice_scanout;
assign ff_fuse_bypass_slice_2_scanin = ff_fuse_bypass_slice_1_scanout;
assign ff_dest_sample_slice_scanin = ff_fuse_bypass_slice_2_scanout;
assign ff_dest_sample_slice_1_scanin = ff_dest_sample_slice_scanout;
assign ff_dest_sample_slice_2_scanin = ff_dest_sample_slice_1_scanout;
assign ff_tck_shift_data_nxt_scanin = ff_dest_sample_slice_2_scanout;
assign ff_sync1_coladdr_4_1_scanin = ff_tck_shift_data_nxt_scanout;
assign ff_sync1_coladdr_3_1_scanin = ff_sync1_coladdr_4_1_scanout;
assign ff_sync1_coladdr_2_1_scanin = ff_sync1_coladdr_3_1_scanout;
assign ff_sync1_coladdr_1_1_scanin = ff_sync1_coladdr_2_1_scanout;
assign ff_sync1_coladdr_0_1_scanin = ff_sync1_coladdr_1_1_scanout;
assign ff_sync1_coladdr_4_scanin = ff_sync1_coladdr_0_1_scanout;
assign ff_sync1_coladdr_3_scanin = ff_sync1_coladdr_4_scanout;
assign ff_sync1_coladdr_2_scanin = ff_sync1_coladdr_3_scanout;
assign ff_sync1_coladdr_1_scanin = ff_sync1_coladdr_2_scanout;
assign ff_sync1_coladdr_scanin = ff_sync1_coladdr_1_scanout;
assign ff_sync1_rowaddr_scanin = ff_sync1_coladdr_scanout;
assign ff_sync1_rowaddr_6_scanin = ff_sync1_rowaddr_scanout;
assign ff_sync1_rowaddr_5_scanin = ff_sync1_rowaddr_6_scanout;
assign ff_sync1_rowaddr_4_scanin = ff_sync1_rowaddr_5_scanout;
assign ff_sync1_rowaddr_3_scanin = ff_sync1_rowaddr_4_scanout;
assign ff_sync1_rowaddr_2_scanin = ff_sync1_rowaddr_3_scanout;
assign ff_sync1_rowaddr_1_scanin = ff_sync1_rowaddr_2_scanout;
assign ff_sync1_rowaddr_6_1_scanin = ff_sync1_rowaddr_1_scanout;
assign ff_sync1_rowaddr_5_1_scanin = ff_sync1_rowaddr_6_1_scanout;
assign ff_sync1_rowaddr_4_1_scanin = ff_sync1_rowaddr_5_1_scanout;
assign ff_sync1_rowaddr_3_1_scanin = ff_sync1_rowaddr_4_1_scanout;
assign ff_sync1_rowaddr_2_1_scanin = ff_sync1_rowaddr_3_1_scanout;
assign ff_sync1_rowaddr_1_1_scanin = ff_sync1_rowaddr_2_1_scanout;
assign ff_sync1_rowaddr_0_1_scanin = ff_sync1_rowaddr_1_1_scanout;
assign ff_power_down_sync_slice_scanin = ff_sync1_rowaddr_0_1_scanout;
assign ff_power_down_sync_slice_1_scanin = ff_power_down_sync_slice_scanout;
assign ff_cmp_io_sync_en_scanin = ff_power_down_sync_slice_1_scanout;
assign ff_tcu_efu_read_mode_bit1_scanin = ff_cmp_io_sync_en_scanout;
assign ff_tcu_efu_read_mode_bit1_1_scanin = ff_tcu_efu_read_mode_bit1_scanout;
assign ff_tcu_efu_read_mode_bit0_scanin = ff_tcu_efu_read_mode_bit1_1_scanout;
assign ff_tcu_efu_read_mode_bit0_1_scanin = ff_tcu_efu_read_mode_bit0_scanout;
assign spares_scanin = ff_tcu_efu_read_mode_bit0_1_scanout;

//assign ff_cmp_io_sync_en_r1_scanin = ff_cmp_io_sync_en_scanout;
//assign spares_scanin = ff_cmp_io_sync_en_r1_scanout;

assign scan_out			 = spares_scanout;
endmodule






// any PARAMS parms go into naming of macro

module efu_fct_ctl_l1clkhdr_ctl_macro (
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

module efu_fct_ctl_msff_ctl_macro__width_1 (
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

module efu_fct_ctl_msff_ctl_macro__width_4 (
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

module efu_fct_ctl_msff_ctl_macro__en_1__width_7 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = (din[6:0] & {7{en}}) | (dout[6:0] & ~{7{en}});






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_fct_ctl_msff_ctl_macro__width_3 (
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

module efu_fct_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_fct_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_fct_ctl_msff_ctl_macro__en_1__width_3 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






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

module efu_fct_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module efu_fct_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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

module efu_fct_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module efu_fct_ctl_spare_ctl_macro__num_4 (
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
assign scan_out = so_3;



endmodule

