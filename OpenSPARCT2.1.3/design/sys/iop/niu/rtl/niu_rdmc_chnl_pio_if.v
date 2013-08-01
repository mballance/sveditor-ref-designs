// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_chnl_pio_if.v
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
module niu_rdmc_chnl_pio_if (
			clk,
                        reset,
                        dma_chnl_grp_id,
			pio_32b_mode,
                        pio_wen,
                        pio_addr,
                        pio_wdata,
			reset_rcr_flush,
			m_bit_en,
			rcr_ctl_stat_word,
			desp_curr_addr,
			desp_curr_cnt,
			desp_addr_not_valid,
                        buf_addr_not_valid,
                        rbr_addr_overflow,
                        desp_curr_cnt_overflow,
			rbr_empty,
			muxed_drop_pkt_r,
			wred_drop_pkt,
			rcr_drop_pkt,
			rbr_drop_pkt,
			chnl_sel_buf_en,
			rcr_curr_addr,
			rcr_status_a,
			rcr_addr_not_valid,
                        mbox_addr_not_valid,
                        rcr_addr_overflow,
                        rcr_curr_cnt_overflow,
                        rcr_curr_cnt_underflow,
                        rcr_pkt_cnt_underflow,
			rcr_idle_cycle,
			chnl_has_pkt,
			chnl_shadw_parity_err,
			rbr_idle_cycle,
			chnl_cache_parity_err,
			resp_bus_err,
			resp_bus_err_type,
			rcr_ack_err,
			data_err_event,
			rdmc_wr_data_dma_num,

			dma_reset,
			dma_en,
			dma_data_offset,
			full_header,
			page_valid0,
			addr_mask0,
			comp_value0,
			relo_value0,
			page_valid1,
                        addr_mask1,
                        comp_value1,
                        relo_value1,
			dma_fatal_err,
			rx_log_page_hdl_reg,
			dma_func_num,
			rdc_red_param_reg,
			rbr_cfig_a_reg,
			rbr_cfig_b_reg,
			rbr_kick_reg,
			rcr_cfig_a_reg,
			rcr_cfig_b_reg,
			rx_dma_ctl_stat_reg_s,
			rx_dma_ctl_stat_reg_bit47,
			rcr_flush_reg,
			mbox_addr,
			mailbox_data,
			ldf_a,
                        ldf_b,
			rbr_cfig_a_reg_wenu,
			rbr_cfig_a_reg_wenl,
                        rbr_kick_reg_wen,
			rcr_cfig_a_reg_wenu,
			rcr_cfig_a_reg_wenl,
			rx_dma_ctl_stat_reg_wenu,
			rx_dma_ctl_stat_reg_wenl,
			pio_rd_gnt,
			chnl_pio_rd_data

			);
input		clk;
input		reset;
input[4:0]	dma_chnl_grp_id;
input		pio_32b_mode;
input		pio_wen;
input[19:0]	pio_addr;
input[63:0]	pio_wdata;
input		reset_rcr_flush;
input		m_bit_en;
input[2:0]	rcr_ctl_stat_word;
input[15:0]	desp_curr_addr;
input[16:0]	desp_curr_cnt;
input		desp_addr_not_valid;
input		buf_addr_not_valid;
input		rbr_addr_overflow;
input		desp_curr_cnt_overflow;
input		rbr_empty;
input		muxed_drop_pkt_r;
input		wred_drop_pkt;
input		rcr_drop_pkt;
input		rbr_drop_pkt;
input		chnl_sel_buf_en;
input[15:0]	rcr_curr_addr;
input[15:0]	rcr_status_a;
input		rcr_addr_not_valid;
input		mbox_addr_not_valid;
input		rcr_addr_overflow;
input		rcr_curr_cnt_overflow;
input		rcr_curr_cnt_underflow;
input		rcr_pkt_cnt_underflow;
input		rcr_idle_cycle;
input		rbr_idle_cycle;
input		chnl_has_pkt;
input		chnl_shadw_parity_err;
input		chnl_cache_parity_err;
input		resp_bus_err;
input[3:0]	resp_bus_err_type;
input		rcr_ack_err;
input		data_err_event;
input[4:0]	rdmc_wr_data_dma_num;

output		dma_reset;
output		dma_en;
output[1:0]	dma_data_offset;
output		full_header;
output		page_valid0;
output[31:0]    addr_mask0;
output[31:0]    comp_value0;
output[31:0]    relo_value0;
output          page_valid1;
output[31:0]    addr_mask1;
output[31:0]    comp_value1;
output[31:0]    relo_value1;
output		dma_fatal_err;
output[19:0]    rx_log_page_hdl_reg;
output[1:0]	dma_func_num;
output[31:0]	rdc_red_param_reg;
output[53:0]    rbr_cfig_a_reg;
output[10:0]    rbr_cfig_b_reg;
output[15:0]    rbr_kick_reg;
output[53:0]    rcr_cfig_a_reg;
output[22:0]    rcr_cfig_b_reg;
output[31:0]	rx_dma_ctl_stat_reg_s;
output		rx_dma_ctl_stat_reg_bit47;
output    	rcr_flush_reg;
output[43:0]	mbox_addr;
output[168:0]	mailbox_data;
output		ldf_a;
output		ldf_b;
output		rbr_cfig_a_reg_wenu;
output		rbr_cfig_a_reg_wenl;
output		rbr_kick_reg_wen;
output		rcr_cfig_a_reg_wenu;
output		rcr_cfig_a_reg_wenl;
output		rx_dma_ctl_stat_reg_wenu;
output		rx_dma_ctl_stat_reg_wenl;
output		pio_rd_gnt;
output[63:0]	chnl_pio_rd_data;

reg		dma_reset;
reg[1:0]	dma_reset_cnt;

reg[3:0]        rx_log_page_vld_reg;
reg[31:0]       rx_log_mask1_reg;
reg[31:0]       rx_log_val1_reg;
reg[31:0]       rx_log_mask2_reg;
reg[31:0]       rx_log_val2_reg;
reg[31:0]       rx_log_page_relo1_reg;
reg[31:0]       rx_log_page_relo2_reg;
reg[19:0]       rx_log_page_hdl_reg;
reg[31:0]	rdc_red_param_reg;

reg[14:0]       rxdma_cfig1_reg;
reg[28:0]       rxdma_cfig2_reg;
reg[53:0]       rbr_cfig_a_reg;
reg[10:0]       rbr_cfig_b_reg;
reg[15:0]       rbr_kick_reg;
reg[53:0]       rcr_cfig_a_reg;
reg[22:0]       rcr_cfig_b_reg;
reg[20:0]       rx_dma_ent_mask_reg;
reg[53:0]       rx_dma_ctl_stat_reg;
reg       	rcr_flush_reg;
reg[16:0]	rx_dma_pkt_drop_cnt_reg;
reg[16:0]	rx_dma_wred_drop_cnt_reg;
reg[10:0]	fatal_err_reg;
reg		fatal_err_all_d;
reg		pio_disable_dma;

reg		fzc_pio_rd_err_tmp;
reg[63:0]	fzc_pio_rd_data_tmp;
reg		pio_rd_err_tmp;
reg[63:0]	pio_rd_data_tmp;
reg		pio_rd_err_tmp_32b;
reg[63:0]	pio_rd_data_tmp_32b;

reg		pio_rd_gnt;
reg[63:0]	chnl_pio_rd_data;

reg		rbr_empty_r;

reg		ldf_a;
reg		ldf_b;

wire		fatal_err_all_p;
wire		dma_fatal_err;

wire            addr_match1                     = (pio_addr[10:6] == dma_chnl_grp_id);
wire[19:0]      pio_addr1                       = {pio_addr[19:11], 5'b0, pio_addr[5:0]};

wire            rx_log_page_vld_reg_wen         = pio_wen & (pio_addr1 == 20'ha0000) & addr_match1;
wire            rx_log_mask1_reg_wen            = pio_wen & (pio_addr1 == 20'ha0008) & addr_match1;
wire            rx_log_val1_reg_wen             = pio_wen & (pio_addr1 == 20'ha0010) & addr_match1;
wire            rx_log_mask2_reg_wen            = pio_wen & (pio_addr1 == 20'ha0018) & addr_match1;
wire            rx_log_val2_reg_wen             = pio_wen & (pio_addr1 == 20'ha0020) & addr_match1;
wire            rx_log_page_relo1_reg_wen       = pio_wen & (pio_addr1 == 20'ha0028) & addr_match1;
wire            rx_log_page_relo2_reg_wen       = pio_wen & (pio_addr1 == 20'ha0030) & addr_match1;
wire            rx_log_page_hdl_reg_wen         = pio_wen & (pio_addr1 == 20'ha0038) & addr_match1;
wire		rdc_red_param_reg_wen		= pio_wen & (pio_addr1 == 20'hb0000) & addr_match1;
wire		rx_dma_wred_drop_cnt_reg_wen	= pio_wen & (pio_addr1 == 20'hb0008) & addr_match1;

wire            addr_match2                     = (pio_addr[13:9] == dma_chnl_grp_id);
wire[19:0]      pio_addr2                       = {pio_addr[19:14], 5'b0, pio_addr[8:0]};

wire            rxdma_cfig1_reg_wen             = pio_wen & (pio_addr2 == 20'h00000) & addr_match2;
wire            rxdma_cfig2_reg_wen             = pio_wen & (pio_addr2 == 20'h00008) & addr_match2;
wire            rbr_cfig_a_reg_wen              = pio_wen & (pio_addr2 == 20'h00010) & addr_match2;
wire		rbr_cfig_a_reg_wen_32b		= pio_wen & (pio_addr2 == 20'h00014) & addr_match2;

wire            rbr_cfig_b_reg_wen              = pio_wen & (pio_addr2 == 20'h00018) & addr_match2;
wire            rbr_kick_reg_wen                = pio_wen & (pio_addr2 == 20'h00020) & addr_match2;
//wire            rbr_stat_reg_wen                = pio_wen & (pio_addr2 == 20'h00028) & addr_match2;RO reg
//wire            rbr_head_h_reg_wen              = pio_wen & (pio_addr2 == 20'h00030) & addr_match2;RO reg
//wire            rbr_head_l_reg_wen              = pio_wen & (pio_addr2 == 20'h00038) & addr_match2;RO reg

wire            rcr_cfig_a_reg_wen      	= pio_wen & (pio_addr2 == 20'h00040) & addr_match2;
wire		rcr_cfig_a_reg_wen_32b		= pio_wen & (pio_addr2 == 20'h00044) & addr_match2;

wire            rcr_cfig_b_reg_wen      	= pio_wen & (pio_addr2 == 20'h00048) & addr_match2;

wire            rx_dma_ent_mask_reg_wen 	= pio_wen & (pio_addr2 == 20'h00068) & addr_match2;
wire            rx_dma_ctl_stat_reg_wen 	= pio_wen & (pio_addr2 == 20'h00070) & addr_match2;
wire		rx_dma_ctl_stat_reg_wen_32b	= pio_wen & (pio_addr2 == 20'h00074) & addr_match2;

wire            rcr_flush_reg_wen       	= pio_wen & (pio_addr2 == 20'h00078) & addr_match2;
wire		rx_dma_pkt_drop_cnt_reg_wen	= pio_wen & (pio_addr2 == 20'h00090) & addr_match2;

wire		rx_dma_ctl_stat_reg_wr		= pio_wen & (pio_addr2 == 20'h00098) & addr_match2;
wire		rx_dma_ctl_stat_reg_wr_32b	= pio_wen & (pio_addr2 == 20'h0009c) & addr_match2;

wire		dma_en		= rxdma_cfig1_reg[14];
wire		pio_dma_rst	= rxdma_cfig1_reg[13];
//wire		dma_idle_cycle	= rxdma_cfig1_reg[12];
wire		full_header	= rxdma_cfig2_reg[0];
wire[1:0]	dma_data_offset	= rxdma_cfig2_reg[2:1];
wire[43:0]	mbox_addr	= {rxdma_cfig1_reg[11:0], rxdma_cfig2_reg[28:3], 6'b0};

wire[31:0]      addr_mask0	= rx_log_mask1_reg[31:0];
wire[31:0]      addr_mask1      = rx_log_mask2_reg[31:0];
wire[31:0]      comp_value0     = rx_log_val1_reg[31:0];
wire[31:0]      comp_value1     = rx_log_val2_reg[31:0];
wire[31:0]      relo_value0     = rx_log_page_relo1_reg[31:0];
wire[31:0]      relo_value1     = rx_log_page_relo2_reg[31:0];

wire       	page_valid0     = rx_log_page_vld_reg[0] & dma_en;
wire       	page_valid1    	= rx_log_page_vld_reg[1] & dma_en;
wire[1:0]	dma_func_num	= rx_log_page_vld_reg[3:2];
wire		page_not_valid	= !(page_valid0 | page_valid1) & dma_en;

wire		idle_cycle;

wire		rx_dma_ctl_stat_reg_wenl	= rx_dma_ctl_stat_reg_wen;
wire		rx_dma_ctl_stat_reg_wenu	= rx_dma_ctl_stat_reg_wen & !pio_32b_mode | rx_dma_ctl_stat_reg_wen_32b & pio_32b_mode; 

wire            rbr_cfig_a_reg_wenl             = rbr_cfig_a_reg_wen;
wire            rbr_cfig_a_reg_wenu             = rbr_cfig_a_reg_wen & !pio_32b_mode | rbr_cfig_a_reg_wen_32b & pio_32b_mode;

wire            rcr_cfig_a_reg_wenl             = rcr_cfig_a_reg_wen;
wire            rcr_cfig_a_reg_wenu             = rcr_cfig_a_reg_wen & !pio_32b_mode | rcr_cfig_a_reg_wen_32b & pio_32b_mode;

/*************************/
//Status from RBR, RCR
/*************************/
wire[25:0]      rbr_base_addr   = rbr_cfig_a_reg[37:12];
wire[41:0]	desp_full_addr	= {rbr_base_addr[25:0], desp_curr_addr[15:0]};

wire[24:0]      rcr_base_addr   = rcr_cfig_a_reg[37:13];
wire[40:0]      rcr_full_addr   = {rcr_base_addr[24:0], rcr_curr_addr[15:0]};

wire[168:0]	mailbox_data	= {rcr_status_a[15:0], 
				   rcr_full_addr[40:0],
				   desp_full_addr[41:0],
				   desp_curr_cnt[15:0], 
				   rx_dma_ctl_stat_reg[53:0]};
				   
always @ (posedge clk)
if (reset)
        rx_log_page_vld_reg     <= 4'b0;
else if (dma_reset)
	rx_log_page_vld_reg	<= 4'b0;
else if (rx_log_page_vld_reg_wen)
        rx_log_page_vld_reg     <= pio_wdata[3:0];
else
        rx_log_page_vld_reg     <= rx_log_page_vld_reg;

always @ (posedge clk)
if (reset)
        rx_log_mask1_reg        <= 32'b0;
else if (dma_reset)
	rx_log_mask1_reg	<= 32'b0;
else if (rx_log_mask1_reg_wen)
        rx_log_mask1_reg        <= pio_wdata[31:0];
else
        rx_log_mask1_reg        <= rx_log_mask1_reg;

always @ (posedge clk)
if (reset)
	rx_log_val1_reg         <= 32'b0;
else if (dma_reset)
	rx_log_val1_reg         <= 32'b0;
else if (rx_log_val1_reg_wen)
        rx_log_val1_reg         <= pio_wdata[31:0];
else
        rx_log_val1_reg         <= rx_log_val1_reg;

always @ (posedge clk)
if (reset)
        rx_log_mask2_reg        <= 32'b0;
else if (dma_reset)
	rx_log_mask2_reg        <= 32'b0;
else if (rx_log_mask2_reg_wen)
        rx_log_mask2_reg        <= pio_wdata[31:0];
else
        rx_log_mask2_reg        <= rx_log_mask2_reg;

always @ (posedge clk)
if (reset)
        rx_log_val2_reg         <= 32'b0;
else if (dma_reset)
	rx_log_val2_reg         <= 32'b0;
else if (rx_log_val2_reg_wen)
        rx_log_val2_reg         <= pio_wdata[31:0];
else
        rx_log_val2_reg         <= rx_log_val2_reg;

always @ (posedge clk)
if (reset)
        rx_log_page_relo1_reg   <= 32'b0;
else if (dma_reset)
	rx_log_page_relo1_reg   <= 32'b0;
else if (rx_log_page_relo1_reg_wen)
        rx_log_page_relo1_reg   <= pio_wdata[31:0];
else
        rx_log_page_relo1_reg   <= rx_log_page_relo1_reg;


always @ (posedge clk)
if (reset)
        rx_log_page_relo2_reg   <= 32'b0;
else if (dma_reset)
	rx_log_page_relo2_reg   <= 32'b0;
else if (rx_log_page_relo2_reg_wen)
        rx_log_page_relo2_reg   <= pio_wdata[31:0];
else
        rx_log_page_relo2_reg   <= rx_log_page_relo2_reg;


always @ (posedge clk)
if (reset)
        rx_log_page_hdl_reg     <= 20'b0;
else if (dma_reset)
	rx_log_page_hdl_reg     <= 20'b0;
else if (rx_log_page_hdl_reg_wen)
        rx_log_page_hdl_reg     <= pio_wdata[19:0];
else
        rx_log_page_hdl_reg     <= rx_log_page_hdl_reg;

always @ (posedge clk)
if (reset)
        rdc_red_param_reg	<= 32'b0;
else if (dma_reset)
	rdc_red_param_reg       <= 32'b0;
else if (rdc_red_param_reg_wen)
        rdc_red_param_reg	<= pio_wdata[31:0];
else
        rdc_red_param_reg	<= rdc_red_param_reg;

wire disable_dma_ture   = dma_en & !pio_wdata[31];
wire dam_en_bit		= disable_dma_ture ? 1'b1 : pio_wdata[31];

always @ (posedge clk)
if (reset)
        rxdma_cfig1_reg         <= 15'b0;
else if (dma_reset)
	rxdma_cfig1_reg         <= 15'b0;
else if (rxdma_cfig1_reg_wen)
        rxdma_cfig1_reg         <= {dam_en_bit, pio_wdata[30:29], pio_wdata[11:0]};
else if (fatal_err_all_p | idle_cycle & pio_disable_dma)
        rxdma_cfig1_reg         <= {1'b0, rxdma_cfig1_reg[13:0]};
else
	rxdma_cfig1_reg		<= {rxdma_cfig1_reg[14:13], idle_cycle, rxdma_cfig1_reg[11:0]};

always @ (posedge clk)
if (reset)
        rxdma_cfig2_reg         <= 29'b0;
else if (dma_reset)
	rxdma_cfig2_reg         <= 29'b0;
else if (rxdma_cfig2_reg_wen)
        rxdma_cfig2_reg         <= {pio_wdata[31:6], pio_wdata[2:0]};
else
        rxdma_cfig2_reg         <= rxdma_cfig2_reg;


always @ (posedge clk)
if (reset)
        rbr_cfig_a_reg          <= 54'b0;
else if (dma_reset)
	rbr_cfig_a_reg          <= 54'b0;
else if (pio_32b_mode & rbr_cfig_a_reg_wen)
	rbr_cfig_a_reg		<= {rbr_cfig_a_reg[53:26], pio_wdata[31:6]};
else if (pio_32b_mode & rbr_cfig_a_reg_wen_32b)
	rbr_cfig_a_reg		<= {pio_wdata[31:16], pio_wdata[11:0], rbr_cfig_a_reg[25:0]};
else if (rbr_cfig_a_reg_wen)
        rbr_cfig_a_reg          <= {pio_wdata[63:48], pio_wdata[43:6]};
else
        rbr_cfig_a_reg          <= rbr_cfig_a_reg;


always @ (posedge clk)
if (reset)
        rbr_cfig_b_reg          <= 11'b0;
else if (dma_reset)
	rbr_cfig_b_reg          <= 11'b0;
else if (rbr_cfig_b_reg_wen)
        rbr_cfig_b_reg          <= {pio_wdata[25:24], 
				    pio_wdata[23], pio_wdata[17:16], 
				    pio_wdata[15], pio_wdata[9:8], 
				    pio_wdata[7], pio_wdata[1:0]};
else
        rbr_cfig_b_reg          <= rbr_cfig_b_reg;

always @ (posedge clk)
if (reset)
        rbr_kick_reg            <= 16'b0;
else if (dma_reset)
	rbr_kick_reg            <= 16'b0;
else if (rbr_kick_reg_wen)
        rbr_kick_reg            <= pio_wdata[15:0];
else
        rbr_kick_reg            <= rbr_kick_reg;


always @ (posedge clk)
if (reset)
        rcr_cfig_a_reg <= 54'b0;
else if (dma_reset)
	rcr_cfig_a_reg <= 54'b0;
else if (pio_32b_mode & rcr_cfig_a_reg_wen)
        rcr_cfig_a_reg <= {rcr_cfig_a_reg[53:26], pio_wdata[31:6]};
else if (pio_32b_mode & rcr_cfig_a_reg_wen_32b)
        rcr_cfig_a_reg <= {pio_wdata[31:16], pio_wdata[11:0], rcr_cfig_a_reg[25:0]};
else if (rcr_cfig_a_reg_wen)
        rcr_cfig_a_reg <= {pio_wdata[63:48], pio_wdata[43:6]};
else
        rcr_cfig_a_reg <= rcr_cfig_a_reg;


always @ (posedge clk)
if (reset)
        rcr_cfig_b_reg <= 23'b0;
else if (dma_reset)
	rcr_cfig_b_reg <= 23'b0;
else if (rcr_cfig_b_reg_wen)
        rcr_cfig_b_reg <= {pio_wdata[31:16], pio_wdata[15], pio_wdata[5:0]};
else
        rcr_cfig_b_reg <= rcr_cfig_b_reg;

always @ (posedge clk)
if (reset)
        rx_dma_ent_mask_reg <= 21'h1f_ffff;
else if (dma_reset)
	rx_dma_ent_mask_reg <= 21'h1f_ffff;
else if (rx_dma_ent_mask_reg_wen)
        rx_dma_ent_mask_reg <= {pio_wdata[21:16], pio_wdata[14:0]};
else
        rx_dma_ent_mask_reg <= rx_dma_ent_mask_reg;


always @ (posedge clk)
if (reset)
        rcr_flush_reg <= 1'b0;
else if (dma_reset)
	rcr_flush_reg <= 1'b0;
else if (rcr_flush_reg_wen)
        rcr_flush_reg <= pio_wdata[0];
else if (reset_rcr_flush & rcr_flush_reg)
        rcr_flush_reg <= 1'b0;
else
        rcr_flush_reg <= rcr_flush_reg;


/**********************************/
//Status Reg and Interrupt
/**********************************/
wire[31:0]	rx_dma_ctl_stat_reg_s 		= rx_dma_ctl_stat_reg[31:0];
wire		rx_dma_ctl_stat_reg_bit47	= rx_dma_ctl_stat_reg[47];

wire		rbr_empty_p = rbr_empty & !rbr_empty_r;
wire[20:0]      rx_dma_ctl_stat_reg_tmp = {rx_dma_ctl_stat_reg[53:48], rx_dma_ctl_stat_reg[46:32]};
wire[20:0]      intr_trig = (~rx_dma_ent_mask_reg) & rx_dma_ctl_stat_reg_tmp;
wire            ldf_a_tmp = (|intr_trig[14:13]);
wire            ldf_b_tmp = ((|intr_trig[12:0]) | (|intr_trig[20:15]));


wire is_port_drop_pkt	= chnl_sel_buf_en & muxed_drop_pkt_r;
wire is_wred_drop_pkt	= chnl_sel_buf_en & wred_drop_pkt;
wire is_rbr_drop_pkt	= chnl_sel_buf_en & rbr_drop_pkt;
wire is_rcr_drop_pkt	= chnl_sel_buf_en & rcr_drop_pkt;
wire is_drop_pkt	= (muxed_drop_pkt_r | rbr_drop_pkt | rcr_drop_pkt) & chnl_sel_buf_en;
wire chnl_data_err_event= data_err_event & (rdmc_wr_data_dma_num == dma_chnl_grp_id);

//wire[16:0] pio_wdata_h= pio_32b_mode    ? pio_wdata[16:0] : pio_wdata[48:32];

wire pio_wdata_h_16	= pio_32b_mode    ? pio_wdata[16] : pio_wdata[48];
wire pio_wdata_h_15	= pio_32b_mode    ? pio_wdata[15] : pio_wdata[47];
wire pio_wdata_h_14     = pio_32b_mode    ? pio_wdata[14] : pio_wdata[46];
wire pio_wdata_h_13	= pio_32b_mode	  ? pio_wdata[13] : pio_wdata[45];
wire pio_wdata_h_3	= pio_32b_mode    ? pio_wdata[3]  : pio_wdata[35]; 
wire pio_wdata_h_10	= pio_32b_mode    ? pio_wdata[10] : pio_wdata[42];
wire pio_wdata_h_9	= pio_32b_mode    ? pio_wdata[9]  : pio_wdata[41];
wire pio_wdata_h_8	= pio_32b_mode    ? pio_wdata[8]  : pio_wdata[40];
wire pio_wdata_h_7      = pio_32b_mode    ? pio_wdata[7]  : pio_wdata[39];

wire pio_data_err_bit	= pio_wdata_h_16  ? 1'b0 : rx_dma_ctl_stat_reg[48];
wire pio_thresh_bit	= pio_wdata_h_14  ? 1'b0 : rx_dma_ctl_stat_reg[46];
wire pio_rcrto_bit 	= pio_wdata_h_13  ? 1'b0 : rx_dma_ctl_stat_reg[45];
wire pio_rbr_empty_bit	= pio_wdata_h_3   ? 1'b0 : rx_dma_ctl_stat_reg[35];

wire pio_port_drop_bit	= pio_wdata_h_10  ? 1'b0 : rx_dma_ctl_stat_reg[42];
wire pio_wred_drop_bit  = pio_wdata_h_9   ? 1'b0 : rx_dma_ctl_stat_reg[41];
wire pio_rbr_drop_bit   = pio_wdata_h_8   ? 1'b0 : rx_dma_ctl_stat_reg[40];
wire pio_rcr_drop_bit   = pio_wdata_h_7   ? 1'b0 : rx_dma_ctl_stat_reg[39];


wire[53:0] pio_rx_dma_ctl_stat_word     = {rx_dma_ctl_stat_reg[53:49], pio_data_err_bit,
					   pio_wdata_h_15, pio_thresh_bit, pio_rcrto_bit, rx_dma_ctl_stat_reg[44:43],
					   pio_port_drop_bit, pio_wred_drop_bit, pio_rbr_drop_bit, pio_rcr_drop_bit, 
					   rx_dma_ctl_stat_reg[38:36], pio_rbr_empty_bit, rx_dma_ctl_stat_reg[34:32], 
					   pio_wdata[31:0]};

wire	   config_not_valid	 = (page_not_valid | desp_addr_not_valid | rcr_addr_not_valid | mbox_addr_not_valid);
wire	   rbr_rcr_addr_overflow = (rbr_addr_overflow | rcr_addr_overflow); 
wire	   rcr_cnt_underflow	 = (rcr_curr_cnt_underflow | rcr_pkt_cnt_underflow);

assign	   idle_cycle		 = rcr_idle_cycle & rbr_idle_cycle & !chnl_has_pkt;
wire[3:0]  resp_err		 = {4{resp_bus_err}} & resp_bus_err_type;
wire[4:0]  meta_bus_err		 = {resp_err, rcr_ack_err};
wire[10:0] fatal_err_event	 = {meta_bus_err, chnl_shadw_parity_err, chnl_cache_parity_err,
				    rcr_cnt_underflow, rcr_curr_cnt_overflow, desp_curr_cnt_overflow, buf_addr_not_valid};
wire[10:0] fatal_err_bit_in	 = {11{idle_cycle}} & fatal_err_reg;

wire[53:0] rx_dma_ctl_stat_word	 = {fatal_err_bit_in[10:6], chnl_data_err_event,
				    rx_dma_ctl_stat_reg[47:45], fatal_err_bit_in[5], fatal_err_bit_in[4], 
				   is_port_drop_pkt, is_wred_drop_pkt, is_rbr_drop_pkt, is_rcr_drop_pkt,
				   rbr_rcr_addr_overflow, fatal_err_bit_in[3], fatal_err_bit_in[2],
				   rbr_empty_p, fatal_err_bit_in[1], fatal_err_bit_in[0], config_not_valid, 
				   rx_dma_ctl_stat_reg[31:0]};

wire[12:0] fatal_err		 = {rx_dma_ctl_stat_reg[53:49],
				    rx_dma_ctl_stat_reg[44:43], rx_dma_ctl_stat_reg[38:36], rx_dma_ctl_stat_reg[34:32]};
wire	   fatal_err_all	 = |fatal_err;
assign	   fatal_err_all_p	 = fatal_err_all & !fatal_err_all_d;
assign	   dma_fatal_err	 = |fatal_err_reg | pio_disable_dma;

always @ (posedge clk)
if (reset)
begin
	ldf_a <= 1'b0;
	ldf_b <= 1'b0;
end
else
begin
	ldf_a <= ldf_a_tmp;
	ldf_b <= ldf_b_tmp;
end


always @ (posedge clk)
if (reset)
	rbr_empty_r <= 1'b0;
else if (dma_reset)
	rbr_empty_r <= 1'b0;
else
	rbr_empty_r <= rbr_empty;


always @ (posedge clk)
if (reset)
	fatal_err_reg <= 11'b0;
else if (dma_reset)
	fatal_err_reg <= 11'b0;
else
	fatal_err_reg <= fatal_err_event | fatal_err_reg;


wire[53:0]      rx_dma_ctl_stat_reg_mex = {(rx_dma_ctl_stat_reg[53:48] | rx_dma_ctl_stat_word[53:48]), rcr_ctl_stat_word[2:0],
                                           (rx_dma_ctl_stat_reg[44:0] | rx_dma_ctl_stat_word[44:0])};

always @ (posedge clk)
if (reset)
        rx_dma_ctl_stat_reg <= 54'b0;
else if (dma_reset)
	rx_dma_ctl_stat_reg <= 54'b0;
else if (pio_32b_mode & rx_dma_ctl_stat_reg_wen)
        rx_dma_ctl_stat_reg <= {rx_dma_ctl_stat_reg[53:32], pio_rx_dma_ctl_stat_word[31:0]};
else if (pio_32b_mode & rx_dma_ctl_stat_reg_wen_32b)
	rx_dma_ctl_stat_reg <= {pio_rx_dma_ctl_stat_word[53:32], rx_dma_ctl_stat_reg[31:0]};
else if (rx_dma_ctl_stat_reg_wen)
	rx_dma_ctl_stat_reg <= pio_rx_dma_ctl_stat_word[53:0];
else if (pio_32b_mode & rx_dma_ctl_stat_reg_wr)
	rx_dma_ctl_stat_reg <= {rx_dma_ctl_stat_reg[53:32], pio_wdata[31:0]};
else if (pio_32b_mode & rx_dma_ctl_stat_reg_wr_32b)
	rx_dma_ctl_stat_reg <= {pio_wdata[21:0], rx_dma_ctl_stat_reg[31:0]};
else if (rx_dma_ctl_stat_reg_wr)
	rx_dma_ctl_stat_reg <= pio_wdata[53:0];
else if (m_bit_en & !rcr_ctl_stat_word[2])
	rx_dma_ctl_stat_reg <= rx_dma_ctl_stat_reg_mex;
else
        rx_dma_ctl_stat_reg <= rx_dma_ctl_stat_reg | rx_dma_ctl_stat_word;

always @ (posedge clk)
if (reset)
	fatal_err_all_d <= 1'b0;
else
	fatal_err_all_d <= fatal_err_all;

wire[15:0] rx_dma_pkt_drop_cnt	= rx_dma_pkt_drop_cnt_reg[15:0] + 16'd1;
wire	   drop_cnt_overflow	= (rx_dma_pkt_drop_cnt_reg[15:0] == 16'hffff);

always @ (posedge clk)
if (reset)
	rx_dma_pkt_drop_cnt_reg <= 17'b0;
else if (dma_reset)
	rx_dma_pkt_drop_cnt_reg <= 17'b0;
else if (rx_dma_pkt_drop_cnt_reg_wen)
	rx_dma_pkt_drop_cnt_reg <= pio_wdata[16:0];
else if (is_drop_pkt & drop_cnt_overflow)
	rx_dma_pkt_drop_cnt_reg <= {1'b1, rx_dma_pkt_drop_cnt_reg[15:0]};
else if (is_drop_pkt)
	rx_dma_pkt_drop_cnt_reg <= {1'b0, rx_dma_pkt_drop_cnt[15:0]};
else
	rx_dma_pkt_drop_cnt_reg <= rx_dma_pkt_drop_cnt_reg;

wire[15:0] rx_dma_wred_drop_cnt  	= rx_dma_wred_drop_cnt_reg[15:0] + 16'd1;
wire       wred_drop_cnt_overflow	= (rx_dma_wred_drop_cnt_reg[15:0] == 16'hffff);

always @ (posedge clk)
if (reset)
        rx_dma_wred_drop_cnt_reg <= 17'b0;
else if (dma_reset)
        rx_dma_wred_drop_cnt_reg <= 17'b0;
else if (rx_dma_wred_drop_cnt_reg_wen)
        rx_dma_wred_drop_cnt_reg <= pio_wdata[16:0];
else if (is_wred_drop_pkt & wred_drop_cnt_overflow)
        rx_dma_wred_drop_cnt_reg <= {1'b1, rx_dma_wred_drop_cnt_reg[15:0]};
else if (is_wred_drop_pkt)
        rx_dma_wred_drop_cnt_reg <= {1'b0, rx_dma_wred_drop_cnt[15:0]};
else
        rx_dma_wred_drop_cnt_reg <= rx_dma_wred_drop_cnt_reg;


always @ (posedge clk)
if (reset)
	pio_disable_dma <= 1'b0;
else if (rxdma_cfig1_reg_wen)
	pio_disable_dma <= disable_dma_ture;
else if (idle_cycle)
	pio_disable_dma <= 1'b0;
else
	pio_disable_dma <= pio_disable_dma;


/***************/
//PIO Read
/***************/
/*
always @ (pio_addr1 or 
	rx_log_page_vld_reg or rx_log_mask1_reg or
	rx_log_val1_reg or rx_log_mask2_reg or
	rx_log_val2_reg or rx_log_page_relo1_reg or
	rx_log_page_relo2_reg or rx_log_page_hdl_reg or
	rdc_red_param_reg or rx_dma_wred_drop_cnt_reg)
begin

fzc_pio_rd_err_tmp	= 1'b0;
case (pio_addr1)         //synopsys parallel_case full_case

20'ha0000:	fzc_pio_rd_data_tmp = {60'b0, rx_log_page_vld_reg[3:0]};
20'ha0008:	fzc_pio_rd_data_tmp = {32'b0, rx_log_mask1_reg};
20'ha0010:	fzc_pio_rd_data_tmp = {32'b0, rx_log_val1_reg};
20'ha0018:	fzc_pio_rd_data_tmp = {32'b0, rx_log_mask2_reg};
20'ha0020:	fzc_pio_rd_data_tmp = {32'b0, rx_log_val2_reg};
20'ha0028:	fzc_pio_rd_data_tmp = {32'b0, rx_log_page_relo1_reg};
20'ha0030:	fzc_pio_rd_data_tmp = {32'b0, rx_log_page_relo2_reg};
20'ha0038:	fzc_pio_rd_data_tmp = {44'b0, rx_log_page_hdl_reg[19:0]};	 
20'hb0000:	fzc_pio_rd_data_tmp = {32'b0, rdc_red_param_reg};
20'hb0008:      fzc_pio_rd_data_tmp = {47'b0, rx_dma_wred_drop_cnt_reg[16:0]};
default:	begin
		fzc_pio_rd_err_tmp  = 1'b1;
		fzc_pio_rd_data_tmp = 64'b0;
		end

endcase
end
*/

always @ (pio_addr1 or
        rx_log_page_vld_reg or rx_log_mask1_reg or
        rx_log_val1_reg or rx_log_mask2_reg or
        rx_log_val2_reg or rx_log_page_relo1_reg or
        rx_log_page_relo2_reg or rx_log_page_hdl_reg or
        rdc_red_param_reg or rx_dma_wred_drop_cnt_reg)
begin

fzc_pio_rd_err_tmp      = 1'b0;
case (pio_addr1[19:2])         //synopsys parallel_case full_case

18'h28000:      fzc_pio_rd_data_tmp = {60'b0, rx_log_page_vld_reg[3:0]};
18'h28001:	fzc_pio_rd_data_tmp = 64'b0;
18'h28002:      fzc_pio_rd_data_tmp = {32'b0, rx_log_mask1_reg};
18'h28003:      fzc_pio_rd_data_tmp = 64'b0;
18'h28004:      fzc_pio_rd_data_tmp = {32'b0, rx_log_val1_reg};
18'h28005:      fzc_pio_rd_data_tmp = 64'b0;
18'h28006:      fzc_pio_rd_data_tmp = {32'b0, rx_log_mask2_reg};
18'h28007:      fzc_pio_rd_data_tmp = 64'b0;
18'h28008:      fzc_pio_rd_data_tmp = {32'b0, rx_log_val2_reg};
18'h28009:      fzc_pio_rd_data_tmp = 64'b0;
18'h2800a:      fzc_pio_rd_data_tmp = {32'b0, rx_log_page_relo1_reg};
18'h2800b:      fzc_pio_rd_data_tmp = 64'b0;
18'h2800c:      fzc_pio_rd_data_tmp = {32'b0, rx_log_page_relo2_reg};
18'h2800d:      fzc_pio_rd_data_tmp = 64'b0;
18'h2800e:      fzc_pio_rd_data_tmp = {44'b0, rx_log_page_hdl_reg[19:0]};
18'h2800f:      fzc_pio_rd_data_tmp = 64'b0;
18'h2c000:      fzc_pio_rd_data_tmp = {32'b0, rdc_red_param_reg};
18'h2c001:      fzc_pio_rd_data_tmp = 64'b0;
18'h2c002:      fzc_pio_rd_data_tmp = {47'b0, rx_dma_wred_drop_cnt_reg[16:0]};
18'h2c003:      fzc_pio_rd_data_tmp = 64'b0;
default:        begin
                fzc_pio_rd_err_tmp  = 1'b1;
                fzc_pio_rd_data_tmp = 64'hdeadbeefdeadbeef;
                end

endcase
end


/*
always @ (pio_addr2 or
        rxdma_cfig1_reg or rxdma_cfig2_reg or
        rbr_cfig_a_reg or rbr_cfig_b_reg or
        rbr_kick_reg or desp_curr_cnt or
        desp_full_addr or 
	rcr_cfig_a_reg or rcr_cfig_b_reg or
	rcr_status_a or rcr_full_addr or
	rx_dma_ent_mask_reg or rx_dma_ctl_stat_reg or
	rcr_flush_reg or rx_dma_pkt_drop_cnt_reg)
begin

pio_rd_err_tmp      = 1'b0;
case (pio_addr2)         //synopsys parallel_case full_case

20'h00000:      pio_rd_data_tmp = {32'b0, rxdma_cfig1_reg[14:12], 17'b0, rxdma_cfig1_reg[11:0]};
20'h00008:      pio_rd_data_tmp = {32'b0, rxdma_cfig2_reg[28:3], 3'b0, rxdma_cfig2_reg[2:0]};
20'h00010:      pio_rd_data_tmp = {rbr_cfig_a_reg[53:38], 4'b0, rbr_cfig_a_reg[37:0], 6'b0};
20'h00018:      pio_rd_data_tmp = {38'b0, rbr_cfig_b_reg[10:8], 5'b0, rbr_cfig_b_reg[7:5], 5'b0, rbr_cfig_b_reg[4:2], 5'b0, rbr_cfig_b_reg[1:0]};
20'h00020:      pio_rd_data_tmp = {48'b0, rbr_kick_reg[15:0]};
20'h00028:      pio_rd_data_tmp = {48'b0, desp_curr_cnt[15:0]};
20'h00030:      pio_rd_data_tmp = {52'b0, desp_full_addr[41:30]};
20'h00038:      pio_rd_data_tmp = {32'b0, desp_full_addr[29:0], 2'b0};      
20'h00040:	pio_rd_data_tmp = {rcr_cfig_a_reg[53:38], 4'b0, rcr_cfig_a_reg[37:0], 6'b0};
20'h00048:	pio_rd_data_tmp = {32'b0, rcr_cfig_b_reg[22:6], 9'b0, rcr_cfig_b_reg[5:0]};
20'h00050:	pio_rd_data_tmp = {48'b0, rcr_status_a[15:0]};
20'h00058:	pio_rd_data_tmp = {52'b0, rcr_full_addr[40:29]};	
20'h00060:      pio_rd_data_tmp = {32'b0, rcr_full_addr[28:0], 3'b0};
20'h00068:	pio_rd_data_tmp = {42'b0, rx_dma_ent_mask_reg[20:15], 1'b0, rx_dma_ent_mask_reg[14:0]};    
20'h00070:      pio_rd_data_tmp = {10'b0, rx_dma_ctl_stat_reg[53:0]};
20'h00078:	pio_rd_data_tmp = {63'b0, rcr_flush_reg};
20'h00090:	pio_rd_data_tmp = {47'b0, rx_dma_pkt_drop_cnt_reg[16:0]};
20'h00098:	pio_rd_data_tmp = {10'b0, rx_dma_ctl_stat_reg[53:0]};
default:        begin
                pio_rd_err_tmp  = 1'b1;
                pio_rd_data_tmp = 64'b0;
                end

endcase
end
*/

always @ (pio_addr2 or
        rxdma_cfig1_reg or rxdma_cfig2_reg or
        rbr_cfig_a_reg or rbr_cfig_b_reg or
        rbr_kick_reg or desp_curr_cnt or
        desp_full_addr or
        rcr_cfig_a_reg or rcr_cfig_b_reg or
        rcr_status_a or rcr_full_addr or
        rx_dma_ent_mask_reg or rx_dma_ctl_stat_reg or
        rcr_flush_reg or rx_dma_pkt_drop_cnt_reg)
begin

pio_rd_err_tmp      = 1'b0;
case (pio_addr2[19:2])         //synopsys parallel_case full_case

18'h00000:      pio_rd_data_tmp = {32'b0, rxdma_cfig1_reg[14:12], 17'b0, rxdma_cfig1_reg[11:0]};
18'h00001:	pio_rd_data_tmp = 64'b0;
18'h00002:      pio_rd_data_tmp = {32'b0, rxdma_cfig2_reg[28:3], 3'b0, rxdma_cfig2_reg[2:0]};
18'h00003:      pio_rd_data_tmp = 64'b0;
18'h00004:      pio_rd_data_tmp = {rbr_cfig_a_reg[53:38], 4'b0, rbr_cfig_a_reg[37:0], 6'b0};
18'h00005:      pio_rd_data_tmp = 64'b0;
18'h00006:      pio_rd_data_tmp = {38'b0, rbr_cfig_b_reg[10:8], 5'b0, rbr_cfig_b_reg[7:5], 5'b0, rbr_cfig_b_reg[4:2], 5'b0, rbr_cfig_b_reg[1:0]};
18'h00007:      pio_rd_data_tmp = 64'b0;
18'h00008:      pio_rd_data_tmp = {48'b0, rbr_kick_reg[15:0]};
18'h00009:      pio_rd_data_tmp = 64'b0;
18'h0000a:      pio_rd_data_tmp = {48'b0, desp_curr_cnt[15:0]};
18'h0000b:      pio_rd_data_tmp = 64'b0;
18'h0000c:      pio_rd_data_tmp = {52'b0, desp_full_addr[41:30]};
18'h0000d:      pio_rd_data_tmp = 64'b0;
18'h0000e:      pio_rd_data_tmp = {32'b0, desp_full_addr[29:0], 2'b0};
18'h0000f:      pio_rd_data_tmp = 64'b0;
18'h00010:      pio_rd_data_tmp = {rcr_cfig_a_reg[53:38], 4'b0, rcr_cfig_a_reg[37:0], 6'b0};
18'h00011:      pio_rd_data_tmp = 64'b0;
18'h00012:      pio_rd_data_tmp = {32'b0, rcr_cfig_b_reg[22:6], 9'b0, rcr_cfig_b_reg[5:0]};
18'h00013:      pio_rd_data_tmp = 64'b0;
18'h00014:      pio_rd_data_tmp = {48'b0, rcr_status_a[15:0]};
18'h00015:      pio_rd_data_tmp = 64'b0;
18'h00016:      pio_rd_data_tmp = {52'b0, rcr_full_addr[40:29]};
18'h00017:      pio_rd_data_tmp = 64'b0;
18'h00018:      pio_rd_data_tmp = {32'b0, rcr_full_addr[28:0], 3'b0};
18'h00019:      pio_rd_data_tmp = 64'b0;
18'h0001a:      pio_rd_data_tmp = {42'b0, rx_dma_ent_mask_reg[20:15], 1'b0, rx_dma_ent_mask_reg[14:0]};
18'h0001b:      pio_rd_data_tmp = 64'b0;
18'h0001c:      pio_rd_data_tmp = {10'b0, rx_dma_ctl_stat_reg[53:0]};
18'h0001d:      pio_rd_data_tmp = 64'b0;
18'h0001e:      pio_rd_data_tmp = {63'b0, rcr_flush_reg};
18'h0001f:      pio_rd_data_tmp = 64'b0;
18'h00024:      pio_rd_data_tmp = {47'b0, rx_dma_pkt_drop_cnt_reg[16:0]};
18'h00025:      pio_rd_data_tmp = 64'b0;
18'h00026:      pio_rd_data_tmp = {10'b0, rx_dma_ctl_stat_reg[53:0]};
18'h00027:      pio_rd_data_tmp = 64'b0;
default:        begin
                pio_rd_err_tmp  = 1'b1;
                pio_rd_data_tmp = 64'hdeadbeefdeadbeef;
                end

endcase
end



/*
always @ (pio_addr2 or
        rxdma_cfig1_reg or rxdma_cfig2_reg or
        rbr_cfig_a_reg or rbr_cfig_b_reg or
        rbr_kick_reg or desp_curr_cnt or
        desp_full_addr or
        rcr_cfig_a_reg or rcr_cfig_b_reg or
        rcr_status_a or rcr_full_addr or
        rx_dma_ent_mask_reg or rx_dma_ctl_stat_reg or
        rcr_flush_reg or rx_dma_pkt_drop_cnt_reg)
begin

pio_rd_err_tmp_32b	= 1'b0;
case (pio_addr2)         //synopsys parallel_case full_case

20'h00000:      pio_rd_data_tmp_32b = {32'b0, rxdma_cfig1_reg[14:12], 17'b0, rxdma_cfig1_reg[11:0]};
20'h00008:      pio_rd_data_tmp_32b = {32'b0, rxdma_cfig2_reg[28:3], 3'b0, rxdma_cfig2_reg[2:0]};
20'h00010:      pio_rd_data_tmp_32b = {32'b0, rbr_cfig_a_reg[25:0], 6'b0};
20'h00014:	pio_rd_data_tmp_32b = {32'b0, rbr_cfig_a_reg[53:38], 4'b0, rbr_cfig_a_reg[37:26]};
20'h00018:      pio_rd_data_tmp_32b = {38'b0, rbr_cfig_b_reg[10:8], 5'b0, rbr_cfig_b_reg[7:5], 5'b0, rbr_cfig_b_reg[4:2], 5'b0, rbr_cfig_b_reg[1:0]};
20'h00020:      pio_rd_data_tmp_32b = {48'b0, rbr_kick_reg[15:0]};
20'h00028:      pio_rd_data_tmp_32b = {48'b0, desp_curr_cnt[15:0]};
20'h00030:      pio_rd_data_tmp_32b = {52'b0, desp_full_addr[41:30]};
20'h00038:      pio_rd_data_tmp_32b = {32'b0, desp_full_addr[29:0], 2'b0};
20'h00040:      pio_rd_data_tmp_32b = {32'b0, rcr_cfig_a_reg[25:0], 6'b0};
20'h00044:	pio_rd_data_tmp_32b = {32'b0, rcr_cfig_a_reg[53:38], 4'b0, rcr_cfig_a_reg[37:26]};
20'h00048:      pio_rd_data_tmp_32b = {32'b0, rcr_cfig_b_reg[22:6], 9'b0, rcr_cfig_b_reg[5:0]};
20'h00050:      pio_rd_data_tmp_32b = {48'b0, rcr_status_a[15:0]};
20'h00058:      pio_rd_data_tmp_32b = {52'b0, rcr_full_addr[40:29]};
20'h00060:      pio_rd_data_tmp_32b = {32'b0, rcr_full_addr[28:0], 3'b0};
20'h00068:      pio_rd_data_tmp_32b = {42'b0, rx_dma_ent_mask_reg[20:15], 1'b0, rx_dma_ent_mask_reg[14:0]};
20'h00070:      pio_rd_data_tmp_32b = {32'b0, rx_dma_ctl_stat_reg[31:0]};
20'h00074:      pio_rd_data_tmp_32b = {32'b0, 10'b0, rx_dma_ctl_stat_reg[53:32]};
20'h00078:      pio_rd_data_tmp_32b = {63'b0, rcr_flush_reg};
20'h00090:      pio_rd_data_tmp_32b = {47'b0, rx_dma_pkt_drop_cnt_reg[16:0]};
20'h00098:      pio_rd_data_tmp_32b = {32'b0, rx_dma_ctl_stat_reg[31:0]};
20'h0009c:      pio_rd_data_tmp_32b = {32'b0, 10'b0, rx_dma_ctl_stat_reg[53:32]};
default:        begin
                pio_rd_err_tmp_32b  = 1'b1;
                pio_rd_data_tmp_32b = 64'b0;
                end

endcase
end
*/

always @ (pio_addr2 or
        rxdma_cfig1_reg or rxdma_cfig2_reg or
        rbr_cfig_a_reg or rbr_cfig_b_reg or
        rbr_kick_reg or desp_curr_cnt or
        desp_full_addr or
        rcr_cfig_a_reg or rcr_cfig_b_reg or
        rcr_status_a or rcr_full_addr or
        rx_dma_ent_mask_reg or rx_dma_ctl_stat_reg or
        rcr_flush_reg or rx_dma_pkt_drop_cnt_reg)
begin

pio_rd_err_tmp_32b      = 1'b0;
case (pio_addr2[19:2])         //synopsys parallel_case full_case

18'h00000:      pio_rd_data_tmp_32b = {32'b0, rxdma_cfig1_reg[14:12], 17'b0, rxdma_cfig1_reg[11:0]};
18'h00001:      pio_rd_data_tmp_32b = 64'b0;
18'h00002:      pio_rd_data_tmp_32b = {32'b0, rxdma_cfig2_reg[28:3], 3'b0, rxdma_cfig2_reg[2:0]};
18'h00003:	pio_rd_data_tmp_32b = 64'b0;
18'h00004:      pio_rd_data_tmp_32b = {32'b0, rbr_cfig_a_reg[25:0], 6'b0};
18'h00005:      pio_rd_data_tmp_32b = {32'b0, rbr_cfig_a_reg[53:38], 4'b0, rbr_cfig_a_reg[37:26]};
18'h00006:      pio_rd_data_tmp_32b = {38'b0, rbr_cfig_b_reg[10:8], 5'b0, rbr_cfig_b_reg[7:5], 5'b0, rbr_cfig_b_reg[4:2], 5'b0, rbr_cfig_b_reg[1:0]};
18'h00007:	pio_rd_data_tmp_32b = 64'b0;
18'h00008:      pio_rd_data_tmp_32b = {48'b0, rbr_kick_reg[15:0]};
18'h00009:      pio_rd_data_tmp_32b = 64'b0;
18'h0000a:      pio_rd_data_tmp_32b = {48'b0, desp_curr_cnt[15:0]};
18'h0000b:      pio_rd_data_tmp_32b = 64'b0;
18'h0000c:      pio_rd_data_tmp_32b = {52'b0, desp_full_addr[41:30]};
18'h0000d:      pio_rd_data_tmp_32b = 64'b0;
18'h0000e:      pio_rd_data_tmp_32b = {32'b0, desp_full_addr[29:0], 2'b0};
18'h0000f:      pio_rd_data_tmp_32b = 64'b0;
18'h00010:      pio_rd_data_tmp_32b = {32'b0, rcr_cfig_a_reg[25:0], 6'b0};
18'h00011:      pio_rd_data_tmp_32b = {32'b0, rcr_cfig_a_reg[53:38], 4'b0, rcr_cfig_a_reg[37:26]};
18'h00012:      pio_rd_data_tmp_32b = {32'b0, rcr_cfig_b_reg[22:6], 9'b0, rcr_cfig_b_reg[5:0]};
18'h00013:      pio_rd_data_tmp_32b = 64'b0;
18'h00014:      pio_rd_data_tmp_32b = {48'b0, rcr_status_a[15:0]};
18'h00015:      pio_rd_data_tmp_32b = 64'b0;
18'h00016:      pio_rd_data_tmp_32b = {52'b0, rcr_full_addr[40:29]};
18'h00017:      pio_rd_data_tmp_32b = 64'b0;
18'h00018:      pio_rd_data_tmp_32b = {32'b0, rcr_full_addr[28:0], 3'b0};
18'h00019:      pio_rd_data_tmp_32b = 64'b0;
18'h0001a:      pio_rd_data_tmp_32b = {42'b0, rx_dma_ent_mask_reg[20:15], 1'b0, rx_dma_ent_mask_reg[14:0]};
18'h0001b:      pio_rd_data_tmp_32b = 64'b0;
18'h0001c:      pio_rd_data_tmp_32b = {32'b0, rx_dma_ctl_stat_reg[31:0]};
18'h0001d:      pio_rd_data_tmp_32b = {32'b0, 10'b0, rx_dma_ctl_stat_reg[53:32]};
18'h0001e:      pio_rd_data_tmp_32b = {63'b0, rcr_flush_reg};
18'h0001f:      pio_rd_data_tmp_32b = 64'b0;
18'h00024:      pio_rd_data_tmp_32b = {47'b0, rx_dma_pkt_drop_cnt_reg[16:0]};
18'h00025:      pio_rd_data_tmp_32b = 64'b0;
18'h00026:      pio_rd_data_tmp_32b = {32'b0, rx_dma_ctl_stat_reg[31:0]};
18'h00027:      pio_rd_data_tmp_32b = {32'b0, 10'b0, rx_dma_ctl_stat_reg[53:32]};
default:        begin
                pio_rd_err_tmp_32b  = 1'b1;
                pio_rd_data_tmp_32b = 64'hdeadbeefdeadbeef;
                end

endcase
end


wire		fzc_pio_rd_sel		= addr_match1 & ((pio_addr[19:16] == 4'ha) | (pio_addr[19:16] == 4'hb));
wire		nom_pio_rd_sel		= addr_match2 & (pio_addr[19:16] == 4'h0);
wire[63:0]	chnl_pio_rd_data_tmp	= fzc_pio_rd_sel ? fzc_pio_rd_data_tmp : 
					  pio_32b_mode	 ? pio_rd_data_tmp_32b :
							   pio_rd_data_tmp;

wire		pio_rd_gnt_tmp		= fzc_pio_rd_sel & !fzc_pio_rd_err_tmp | 
					  nom_pio_rd_sel & pio_32b_mode & !pio_rd_err_tmp_32b |
					  nom_pio_rd_sel & !pio_32b_mode & !pio_rd_err_tmp;

always @ (posedge clk)
if (reset)
	pio_rd_gnt	<= 1'b0;
else
	pio_rd_gnt	<= pio_rd_gnt_tmp;

always @ (posedge clk)
if (reset)
	chnl_pio_rd_data <= 64'b0;
else
	chnl_pio_rd_data <= chnl_pio_rd_data_tmp;


/*********Reset Logic ************/
/*********************************/
always @(posedge clk)
if (reset)
        dma_reset <= 1'b0;
else if (dma_reset_cnt == 2'b11)
        dma_reset <= 1'b0;
else if (pio_dma_rst & idle_cycle)
        dma_reset <= 1'b1;
else
        dma_reset <= dma_reset;

always @(posedge clk)
if (reset)
        dma_reset_cnt <= 2'b0;
else if (dma_reset)
        dma_reset_cnt <= dma_reset_cnt + 2'd1;
else
        dma_reset_cnt <= 2'b0;



endmodule


