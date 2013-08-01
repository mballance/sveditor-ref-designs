// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_pio_if.v
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
module niu_rdmc_pio_if (
			clk,
			reset,
			pio_rdmc_sel,
			pio_rdmc_rd,
			pio_rdmc_addr,
			pio_rdmc_wdata,
			pio_client_32b,
			stage1_en_r,
			port_gnt,
			port_err_event,
			ipp_dat_req0_data,
			ipp_dat_req1_data,
			ipp_dat_req2_data,
			ipp_dat_req3_data,
			wr_debug_data,
			wr_transfer_comp_int,
			pio_rd_gnt,
                        chnl_pio_rd_data0,
                        chnl_pio_rd_data1,
                        chnl_pio_rd_data2,
                        chnl_pio_rd_data3,
                        chnl_pio_rd_data4,
                        chnl_pio_rd_data5,
                        chnl_pio_rd_data6,
                        chnl_pio_rd_data7,
                        chnl_pio_rd_data8,
                        chnl_pio_rd_data9,
                        chnl_pio_rd_data10,
                        chnl_pio_rd_data11,
                        chnl_pio_rd_data12,
                        chnl_pio_rd_data13,
                        chnl_pio_rd_data14,
                        chnl_pio_rd_data15,
			cache_rd_strobe,
			cache_wr_strobe,
			cache_rd_addr,
			cache_wr_addr,
			cache_wr_data,
			cache_rd_data_reg,
			shadw_rd_strobe,
			shadw_wr_strobe,
			shadw_rd_addr,
			shadw_wr_addr,
			shadw_wr_data,
			shadw_rd_data_reg,	//reged shadw_rd_data
			pkt_buf_gnt,

			pio_32b_mode,
			pio_wen,
			pio_addr,
			pio_wen_a,
                        pio_addr_a,
                        pio_wen_b,
                        pio_addr_b,
			pio_wen_c,
                        pio_addr_c,
			pio_wdata,
			rx_addr_32b_mode,
			wred_enable,
			random_num,
			clk_div_value,
			port_err_status,
			muxed_port_rdc_num,
			pt_drr_wt0_reg,
			pt_drr_wt1_reg,
			pt_drr_wt2_reg,
			pt_drr_wt3_reg,
			muxed_cache_rd_strobe,
			muxed_cache_wr_strobe,
			muxed_cache_rd_addr,
			muxed_cache_wr_addr,
			muxed_cache_wr_data,
			muxed_shadw_rd_strobe,
			muxed_shadw_wr_strobe,
			muxed_shadw_rd_addr,
			muxed_shadw_wr_addr,
			muxed_shadw_wr_data,
			muxed_cache_rd_strobe_r,
			muxed_shadw_rd_strobe_r,
			cache_parity_err,
			shadw_parity_err,
			rdmc_debug_port,
			rdmc_pio_port_int,
			rdmc_pio_ack,
			rdmc_pio_err,
			rdmc_pio_rdata

			);

input		clk;
input		reset;
input		pio_rdmc_sel;
input		pio_rdmc_rd;
input[19:0]	pio_rdmc_addr;
input[63:0]	pio_rdmc_wdata;
input		pio_client_32b;
input		stage1_en_r;
input[3:0]	port_gnt;
input[8:0]	port_err_event;
input		ipp_dat_req0_data;
input		ipp_dat_req1_data;
input		ipp_dat_req2_data;
input		ipp_dat_req3_data;
input		wr_transfer_comp_int;
input[31:0]	wr_debug_data;
input[15:0]	pio_rd_gnt;
input[63:0]     chnl_pio_rd_data0;
input[63:0]     chnl_pio_rd_data1;
input[63:0]     chnl_pio_rd_data2;
input[63:0]     chnl_pio_rd_data3;
input[63:0]     chnl_pio_rd_data4;
input[63:0]     chnl_pio_rd_data5;
input[63:0]     chnl_pio_rd_data6;
input[63:0]     chnl_pio_rd_data7;
input[63:0]     chnl_pio_rd_data8;
input[63:0]     chnl_pio_rd_data9;
input[63:0]     chnl_pio_rd_data10;
input[63:0]     chnl_pio_rd_data11;
input[63:0]     chnl_pio_rd_data12;
input[63:0]     chnl_pio_rd_data13;
input[63:0]     chnl_pio_rd_data14;
input[63:0]     chnl_pio_rd_data15;
input		cache_rd_strobe;
input		cache_wr_strobe;
input[7:0]	cache_rd_addr;
input[7:0]	cache_wr_addr;
input[147:0]	cache_wr_data;
input[147:0]    cache_rd_data_reg;
input           shadw_rd_strobe;
input           shadw_wr_strobe;
input[7:0]      shadw_rd_addr;
input[7:0]      shadw_wr_addr;
input[147:0]    shadw_wr_data;
input[147:0]    shadw_rd_data_reg;
input[15:0]	pkt_buf_gnt;

output		pio_32b_mode;
output		pio_wen;
output[19:0]	pio_addr;
output		pio_wen_a;
output[19:0]	pio_addr_a;
output          pio_wen_b;
output[19:0]    pio_addr_b;
output          pio_wen_c;
output[19:0]    pio_addr_c;
output[63:0]	pio_wdata;
output		rx_addr_32b_mode;
output		wred_enable;
output[15:0]	random_num;
output[3:0]	port_err_status;
output[15:0]	clk_div_value;
output[4:0]	muxed_port_rdc_num;
output[15:0]	pt_drr_wt0_reg;
output[15:0]	pt_drr_wt1_reg;
output[15:0]	pt_drr_wt2_reg;
output[15:0]	pt_drr_wt3_reg;
output		muxed_cache_rd_strobe;
output		muxed_cache_wr_strobe;
output[7:0]	muxed_cache_rd_addr;
output[7:0]	muxed_cache_wr_addr;
output[147:0]	muxed_cache_wr_data;
output          muxed_shadw_rd_strobe;
output          muxed_shadw_wr_strobe;
output[7:0]     muxed_shadw_rd_addr;
output[7:0]     muxed_shadw_wr_addr;
output[147:0]   muxed_shadw_wr_data;
output		muxed_cache_rd_strobe_r;
output		muxed_shadw_rd_strobe_r;
output		cache_parity_err;
output		shadw_parity_err;
output[31:0]	rdmc_debug_port;
output		rdmc_pio_port_int;
output		rdmc_pio_ack;
output		rdmc_pio_err;
output[63:0]	rdmc_pio_rdata;

reg		pio_32b_mode;
reg		pio_sel;
reg		pio_rd;
reg[19:0]	pio_addr;
reg             pio_sel_a;
reg             pio_rd_a;
reg[19:0]       pio_addr_a;
reg             pio_sel_b;
reg             pio_rd_b;
reg[19:0]       pio_addr_b;
reg             pio_sel_c;
reg             pio_rd_c;
reg[19:0]       pio_addr_c;

reg[63:0]	pio_wdata;
reg		pio_sel_dly;
reg             pio_sel_dly_a;
reg             pio_sel_dly_b;
reg		pio_sel_dly_c;
reg		pio_sel_cycle1;
reg		pio_sel_cycle2;
reg		rdmc_pio_ack;
reg		rdmc_pio_err;
reg[63:0]	rdmc_pio_rdata;
reg		port_pio_gnt;
reg		port_pio_rd_err;
reg[63:0]	port_pio_rd_data_tmp;
reg[63:0]	port_pio_rd_data;
reg		rdmc_pio_port_int;

reg[15:0]	clk_div_value;
reg[4:0]	def_port0_rdc_reg;
reg[4:0]	def_port1_rdc_reg;
reg[4:0]	def_port2_rdc_reg;
reg[4:0]	def_port3_rdc_reg;

reg[15:0]	pt_drr_wt0_reg;
reg[15:0]       pt_drr_wt1_reg;
reg[15:0]       pt_drr_wt2_reg;
reg[15:0]       pt_drr_wt3_reg;
reg[19:0]	pt_use0_reg;
reg[19:0]	pt_use1_reg;
reg[19:0]	pt_use2_reg;
reg[19:0]	pt_use3_reg;

reg[16:0]	red_ran_init_reg;
reg[15:0]	red_ran_curr_reg;
reg[3:0]	rx_addr_mode_reg;
reg[9:0]	cache_parity_log_reg;
reg[9:0]	shadw_parity_log_reg;

reg[8:0]	pio_mem_addr_reg;
reg[31:0]	pio_mem_data_reg0;
reg[31:0]	pio_mem_data_reg1;
reg[31:0]	pio_mem_data_reg2;
reg[31:0]	pio_mem_data_reg3;

reg		pio_mem_data_reg4_wen_dly;
reg		pio_cache_rd;
reg		pio_shadw_rd;
reg		pio_cache_wr;
reg		pio_shadw_wr;
reg		pio_acc_dly0;
reg		pio_acc_dly1;
reg		pio_acc_dly2;

reg             cache_rd_strobe_r;
reg             cache_rd_strobe_r1;
reg             shadw_rd_strobe_r;
reg             shadw_rd_strobe_r1;
reg		muxed_cache_rd_strobe_r;
reg		muxed_cache_rd_strobe_r1;
reg		muxed_shadw_rd_strobe_r;
reg		muxed_shadw_rd_strobe_r1;
reg[7:0]	muxed_cache_rd_addr_r;
reg[7:0]	muxed_shadw_rd_addr_d;
reg[7:0]	muxed_shadw_rd_addr_r;
reg[8:0]	port_err_status_reg;
reg[8:0]	port_err_mask_reg;

reg[31:0]	debug_training_vector;
reg[31:0]	rdmc_debug_port;

reg[3:0]	pkt_id_err_reg;

wire		pio_mem_rd;
wire		muxed_cache_rd_strobe;
wire		muxed_cache_wr_strobe;
wire[7:0]	muxed_cache_rd_addr;
wire[7:0]	muxed_cache_wr_addr;
wire[147:0]	muxed_cache_wr_data;
wire            muxed_shadw_rd_strobe;
wire            muxed_shadw_wr_strobe;
wire[7:0]       muxed_shadw_rd_addr;
wire[7:0]       muxed_shadw_wr_addr;
wire[147:0]     muxed_shadw_wr_data;
wire[147:0]	muxed_mem_rd_data;
wire[147:0]	pio_mem_wr_data;

wire[32:0]	cache_rd_data0;
wire[32:0]	cache_rd_data1;
wire[32:0]	cache_rd_data2;
wire[32:0]	cache_rd_data3;
wire[15:0]	cache_orig_parity_bits;
wire[15:0]	cache_data_parity_bits;
wire		cache_parity_err;
wire		acc_cache_parity_err;
wire[31:0]      shadw_rd_data0;
wire[31:0]      shadw_rd_data1;
wire[31:0]      shadw_rd_data2;
wire[31:0]      shadw_rd_data3;
wire[15:0]      shadw_orig_parity_bits;
wire[15:0]      shadw_data_parity_bits;
wire            shadw_parity_err;
wire		acc_shadw_parity_err;


wire		pio_sel_cycle0;
wire		pio_wen;
wire		pio_ren;

wire            pio_sel_cycle0_a;
wire            pio_wen_a;

wire            pio_sel_cycle0_b;
wire            pio_wen_b;

wire            pio_sel_cycle0_c;
wire            pio_wen_c;

wire		pio_err;
wire[63:0]	pio_rd_data;
wire[63:0]	chnl_pio_rd_data;

wire		clk_div_pio_wen;
wire		def_port0_rdc_pio_wen;
wire		def_port1_rdc_pio_wen;
wire		def_port2_rdc_pio_wen;
wire		def_port3_rdc_pio_wen;
wire		pt_drr_wt0_pio_wen;
wire		pt_drr_wt1_pio_wen;
wire		pt_drr_wt2_pio_wen;
wire		pt_drr_wt3_pio_wen;
wire		pt_use0_pio_ren;
wire		pt_use1_pio_ren;
wire		pt_use2_pio_ren;
wire		pt_use3_pio_ren;
wire		red_ran_init_pio_wen;
wire		rx_addr_mode_pio_wen;
wire		cache_parity_log_pio_wen;
wire		shadw_parity_log_pio_wen;
wire		pio_mem_addr_reg_wen;
wire		pio_mem_data_reg0_wen;
wire		pio_mem_data_reg1_wen;
wire		pio_mem_data_reg2_wen;
wire		pio_mem_data_reg3_wen;
wire		pio_mem_data_reg4_wen;
wire		pio_mem_data_reg4_ren;
wire		port_err_status_reg_wen;
wire		port_err_mask_reg_wen;
wire		debug_training_vector_pio_wen;
wire		port_err_status_reg_wr;

wire		pt_use0_reg_overflow;
wire		pt_use1_reg_overflow;
wire		pt_use2_reg_overflow;
wire		pt_use3_reg_overflow;

wire[4:0]	muxed_port_rdc_num;
wire		shift_in;
wire		wred_enable;
wire[15:0]	random_num	= red_ran_curr_reg;

wire		chnl_pio_gnt_all= |pio_rd_gnt;

wire		rx_addr_32b_mode 	= rx_addr_mode_reg[0];
wire		debug_mode	 	= rx_addr_mode_reg[1];
wire[1:0]	debug_port_mux_sel 	= rx_addr_mode_reg[3:2];


always @ (posedge clk)
if (reset)
begin
	pio_32b_mode    <= 1'b0;
        pio_sel         <= 1'b0;
        pio_rd          <= 1'b0;
        pio_addr        <= 20'b0;
        pio_wdata       <= 64'b0;
end
else
begin
	pio_32b_mode	<= pio_client_32b;
	pio_sel		<= pio_rdmc_sel;
	pio_rd		<= pio_rdmc_rd;
	pio_addr	<= pio_rdmc_addr;
	pio_wdata	<= pio_rdmc_wdata;
end

always @ (posedge clk)
if (reset)
begin
        pio_sel_a       <= 1'b0;
        pio_rd_a        <= 1'b0;
        pio_addr_a      <= 20'b0;
end
else
begin
        pio_sel_a	<= pio_rdmc_sel;
        pio_rd_a	<= pio_rdmc_rd;
        pio_addr_a	<= pio_rdmc_addr;
end

always @ (posedge clk)
if (reset)
begin
        pio_sel_b       <= 1'b0;
        pio_rd_b        <= 1'b0;
        pio_addr_b      <= 20'b0;
end
else
begin
        pio_sel_b       <= pio_rdmc_sel;
        pio_rd_b        <= pio_rdmc_rd;
        pio_addr_b      <= pio_rdmc_addr;
end

always @ (posedge clk)
if (reset)
begin
        pio_sel_c       <= 1'b0;
        pio_rd_c        <= 1'b0;
        pio_addr_c      <= 20'b0;
end
else
begin
        pio_sel_c       <= pio_rdmc_sel;
        pio_rd_c        <= pio_rdmc_rd;
        pio_addr_c      <= pio_rdmc_addr;
end

always @ (posedge clk)
if (reset)
	pio_sel_dly <= 1'b0;
else
	pio_sel_dly <= pio_sel;

always @ (posedge clk)
if (reset)
        pio_sel_dly_a <= 1'b0;
else
        pio_sel_dly_a <= pio_sel_a;

always @ (posedge clk)
if (reset)
        pio_sel_dly_b <= 1'b0;
else
        pio_sel_dly_b <= pio_sel_b;

always @ (posedge clk)
if (reset)
        pio_sel_dly_c <= 1'b0;
else
        pio_sel_dly_c <= pio_sel_c;

assign pio_sel_cycle0	= pio_sel & !pio_sel_dly;
assign pio_wen 		= pio_sel_cycle0 & !pio_rd;
assign pio_ren 		= pio_sel_cycle2 & pio_rd;

assign pio_sel_cycle0_a	= pio_sel_a & !pio_sel_dly_a;
assign pio_wen_a        = pio_sel_cycle0_a & !pio_rd_a;

assign pio_sel_cycle0_b = pio_sel_b & !pio_sel_dly_b;
assign pio_wen_b        = pio_sel_cycle0_b & !pio_rd_b;

assign pio_sel_cycle0_c = pio_sel_c & !pio_sel_dly_c;
assign pio_wen_c        = pio_sel_cycle0_c & !pio_rd_c;

assign pio_err		= !(chnl_pio_gnt_all | port_pio_gnt) & pio_sel_cycle2 & pio_rd;
assign pio_rd_data	= chnl_pio_gnt_all ? chnl_pio_rd_data : port_pio_rd_data; 
			   

always @ (posedge clk)
if (reset)
begin
        pio_sel_cycle1 <= 1'b0;
	pio_sel_cycle2 <= 1'b0;
end
else
begin
        pio_sel_cycle1 <= pio_sel_cycle0;
	pio_sel_cycle2 <= pio_sel_cycle1;
end


always @ (posedge clk)
if (reset)
	rdmc_pio_ack <= 1'b0;
else if (pio_sel_cycle2 & !pio_mem_data_reg4_ren | pio_acc_dly2)
	rdmc_pio_ack <= 1'b1;
else
	rdmc_pio_ack <= 1'b0;

always @ (posedge clk)
if (reset)
	rdmc_pio_err <= 1'b0;
else 
	rdmc_pio_err <= pio_err;

always @ (posedge clk)
if (reset)
	rdmc_pio_rdata <= 64'b0;
else if (pio_sel_cycle2 & !pio_mem_data_reg4_ren | pio_acc_dly2)
	rdmc_pio_rdata <= pio_rd_data;
else
	rdmc_pio_rdata <= rdmc_pio_rdata;


assign clk_div_pio_wen			= pio_wen & (pio_addr == 20'h80000);
assign def_port0_rdc_pio_wen		= pio_wen & (pio_addr == 20'h80008);
assign def_port1_rdc_pio_wen		= pio_wen & (pio_addr == 20'h80010);
assign def_port2_rdc_pio_wen		= pio_wen & (pio_addr == 20'h80018);
assign def_port3_rdc_pio_wen		= pio_wen & (pio_addr == 20'h80020);

assign pt_drr_wt0_pio_wen		= pio_wen & (pio_addr == 20'h80028);
assign pt_drr_wt1_pio_wen		= pio_wen & (pio_addr == 20'h80030);
assign pt_drr_wt2_pio_wen		= pio_wen & (pio_addr == 20'h80038);
assign pt_drr_wt3_pio_wen		= pio_wen & (pio_addr == 20'h80040);

assign pt_use0_pio_ren			= pio_ren & (pio_addr == 20'h80048);
assign pt_use1_pio_ren			= pio_ren & (pio_addr == 20'h80050);
assign pt_use2_pio_ren			= pio_ren & (pio_addr == 20'h80058);
assign pt_use3_pio_ren			= pio_ren & (pio_addr == 20'h80060);

assign red_ran_init_pio_wen		= pio_wen & (pio_addr == 20'h80068);
assign rx_addr_mode_pio_wen		= pio_wen & (pio_addr == 20'h80070);

assign cache_parity_log_pio_wen		= pio_wen & (pio_addr == 20'h80078);
assign shadw_parity_log_pio_wen         = pio_wen & (pio_addr == 20'h80080);

assign pio_mem_addr_reg_wen		= pio_wen & (pio_addr == 20'h80088);
assign pio_mem_data_reg0_wen		= pio_wen & (pio_addr == 20'h80090);
assign pio_mem_data_reg1_wen		= pio_wen & (pio_addr == 20'h80098);
assign pio_mem_data_reg2_wen		= pio_wen & (pio_addr == 20'h800a0);
assign pio_mem_data_reg3_wen		= pio_wen & (pio_addr == 20'h800a8);
assign pio_mem_data_reg4_wen		= pio_wen & (pio_addr == 20'h800b0);
assign pio_mem_data_reg4_ren		= pio_ren & (pio_addr == 20'h800b0);
assign port_err_status_reg_wen		= pio_wen & (pio_addr == 20'h800b8);
assign port_err_mask_reg_wen		= pio_wen & (pio_addr == 20'h800c0);

assign debug_training_vector_pio_wen	= pio_wen & (pio_addr == 20'h800c8);

assign port_err_status_reg_wr		= pio_wen & (pio_addr == 20'h800d0);

/***********************/
//Program Registers
/***********************/
always @ (posedge clk)
if (reset)
        rx_addr_mode_reg <= 4'b0;
else if (rx_addr_mode_pio_wen)
        rx_addr_mode_reg <= pio_wdata[3:0];
else
        rx_addr_mode_reg <= rx_addr_mode_reg;

always @ (posedge clk)
if (reset)
        clk_div_value <= 16'b0;
else if (clk_div_pio_wen)
        clk_div_value <= pio_wdata[15:0]; 
else
        clk_div_value <= clk_div_value;

always @ (posedge clk)
if (reset)
	def_port0_rdc_reg <= 5'b0;
else if (def_port0_rdc_pio_wen)
	def_port0_rdc_reg <= pio_wdata[4:0];
else
	def_port0_rdc_reg <= def_port0_rdc_reg;

always @ (posedge clk)
if (reset)
        def_port1_rdc_reg <= 5'b0;
else if (def_port1_rdc_pio_wen)
        def_port1_rdc_reg <= pio_wdata[4:0];
else
        def_port1_rdc_reg <= def_port1_rdc_reg;

always @ (posedge clk)
if (reset)
        def_port2_rdc_reg <= 5'b0;
else if (def_port2_rdc_pio_wen)
        def_port2_rdc_reg <= pio_wdata[4:0];
else
        def_port2_rdc_reg <= def_port2_rdc_reg;

always @ (posedge clk)
if (reset)
        def_port3_rdc_reg <= 5'b0;
else if (def_port3_rdc_pio_wen)
        def_port3_rdc_reg <= pio_wdata[4:0];
else
        def_port3_rdc_reg <= def_port3_rdc_reg;

assign muxed_port_rdc_num = {5{port_gnt[0]}} & def_port0_rdc_reg |
                            {5{port_gnt[1]}} & def_port1_rdc_reg |
                            {5{port_gnt[2]}} & def_port2_rdc_reg |
                            {5{port_gnt[3]}} & def_port3_rdc_reg ;

always @ (posedge clk)
if (reset)
        pt_drr_wt0_reg <= 16'h0400;
else if (pt_drr_wt0_pio_wen)
        pt_drr_wt0_reg <= pio_wdata[15:0];
else
        pt_drr_wt0_reg <= pt_drr_wt0_reg;

always @ (posedge clk)
if (reset)
        pt_drr_wt1_reg <= 16'h0400;
else if (pt_drr_wt1_pio_wen)
        pt_drr_wt1_reg <= pio_wdata[15:0];
else
        pt_drr_wt1_reg <= pt_drr_wt1_reg;

always @ (posedge clk)
if (reset)
        pt_drr_wt2_reg <= 16'h0066;
else if (pt_drr_wt2_pio_wen)
        pt_drr_wt2_reg <= pio_wdata[15:0];
else
        pt_drr_wt2_reg <= pt_drr_wt2_reg;

always @ (posedge clk)
if (reset)
        pt_drr_wt3_reg <= 16'h0066;
else if (pt_drr_wt3_pio_wen)
        pt_drr_wt3_reg <= pio_wdata[15:0];
else
        pt_drr_wt3_reg <= pt_drr_wt3_reg;


assign pt_use0_reg_overflow = (pt_use0_reg == 20'hfffff);
assign pt_use1_reg_overflow = (pt_use1_reg == 20'hfffff);
assign pt_use2_reg_overflow = (pt_use2_reg == 20'hfffff);
assign pt_use3_reg_overflow = (pt_use3_reg == 20'hfffff);

always @ (posedge clk)
if (reset)
        pt_use0_reg <= 20'b0;
else if (pt_use0_pio_ren)
        pt_use0_reg <= 20'b0;
else if (pt_use0_reg_overflow)
        pt_use0_reg <= pt_use0_reg;
else if (ipp_dat_req0_data)
        pt_use0_reg <= pt_use0_reg + 20'd1;
else
        pt_use0_reg <= pt_use0_reg;

always @ (posedge clk)
if (reset)
        pt_use1_reg <= 20'b0;
else if (pt_use1_pio_ren)
        pt_use1_reg <= 20'b0;
else if (pt_use1_reg_overflow)
        pt_use1_reg <= pt_use1_reg;
else if (ipp_dat_req1_data)
        pt_use1_reg <= pt_use1_reg + 20'd1;
else
        pt_use1_reg <= pt_use1_reg;

always @ (posedge clk)
if (reset)
        pt_use2_reg <= 20'b0;
else if (pt_use2_pio_ren)
        pt_use2_reg <= 20'b0;
else if (pt_use2_reg_overflow)
	pt_use2_reg <= pt_use2_reg;
else if (ipp_dat_req2_data)
	pt_use2_reg <= pt_use2_reg + 20'd1;
else
        pt_use2_reg <= pt_use2_reg;

always @ (posedge clk)
if (reset)
        pt_use3_reg <= 20'b0;
else if (pt_use3_pio_ren)
        pt_use3_reg <= 20'b0;
else if (pt_use3_reg_overflow)
        pt_use3_reg <= pt_use3_reg;
else if (ipp_dat_req3_data)
        pt_use3_reg <= pt_use3_reg + 20'd1;
else
        pt_use3_reg <= pt_use3_reg;

always @ (posedge clk)
if (reset)
	port_err_mask_reg <= 9'b1_1111_1111;
else if (port_err_mask_reg_wen)
	port_err_mask_reg <= pio_wdata[8:0];
else
	port_err_mask_reg <= port_err_mask_reg;


wire[7:0] port_err_status_reg_tmp = (~pio_wdata[7:0]) & port_err_status_reg[7:0] | port_err_event[7:0];

always @ (posedge clk)
if (reset)
	port_err_status_reg <= 9'b0;
else if (port_err_status_reg_wen)
	port_err_status_reg <= {pio_wdata[8], port_err_status_reg_tmp[7:0]}; 
else if (port_err_status_reg_wr)
	port_err_status_reg <= pio_wdata[8:0];
else
	port_err_status_reg <= port_err_event[8:0] | port_err_status_reg[8:0];

wire pkt_id_err0 = port_err_status_reg[8] | port_err_status_reg[4];
wire pkt_id_err1 = port_err_status_reg[8] | port_err_status_reg[5];
wire pkt_id_err2 = port_err_status_reg[8] | port_err_status_reg[6];
wire pkt_id_err3 = port_err_status_reg[8] | port_err_status_reg[7];

always @ (posedge clk)
if (reset)
	pkt_id_err_reg <= 4'b0;
else 
	pkt_id_err_reg <= {pkt_id_err3, pkt_id_err2, pkt_id_err1, pkt_id_err0};


wire port0_err = pkt_id_err_reg[0] | port_err_status_reg[0];
wire port1_err = pkt_id_err_reg[1] | port_err_status_reg[1];
wire port2_err = pkt_id_err_reg[2] | port_err_status_reg[2];
wire port3_err = pkt_id_err_reg[3] | port_err_status_reg[3];

wire[3:0] port_err_status = {port3_err, port2_err, port1_err, port0_err};
wire	  port_int_tmp	  = |(port_err_status_reg & (~port_err_mask_reg));

always @ (posedge clk)
if (reset)
	rdmc_pio_port_int <= 1'b0;
else
	rdmc_pio_port_int <= port_int_tmp;

/*************************/
//Random Number Gen
/*************************/
assign	shift_in 	= red_ran_curr_reg[15] ^ red_ran_curr_reg[4] ^ red_ran_curr_reg[2] ^ red_ran_curr_reg[1];
assign	wred_enable	= red_ran_init_reg[16];

always @ (posedge clk)
if (reset)
	red_ran_init_reg <= 17'b0;
else if (red_ran_init_pio_wen)
	red_ran_init_reg <= pio_wdata[16:0];
else
	red_ran_init_reg <= red_ran_init_reg;


always @ (posedge clk)
if (reset)
        red_ran_curr_reg <= 16'b0;
else if (red_ran_init_pio_wen)
        red_ran_curr_reg <= pio_wdata[15:0];
else if (stage1_en_r)
	red_ran_curr_reg <= {shift_in, red_ran_curr_reg[15:1]};
else
	red_ran_curr_reg <= red_ran_curr_reg;


/*************************/
//Memory Access
/*************************/
always @ (posedge clk)
if (reset)
	pio_mem_addr_reg <= 9'b0;
else if (pio_mem_addr_reg_wen)
	pio_mem_addr_reg <= pio_wdata[8:0];
else
	pio_mem_addr_reg <= pio_mem_addr_reg;

always @ (posedge clk)
if (reset)
	pio_mem_data_reg0 <= 32'b0;
else if (pio_mem_data_reg0_wen)
	pio_mem_data_reg0 <= pio_wdata[31:0];
else if (pio_acc_dly1 & pio_rd)
	pio_mem_data_reg0 <= muxed_mem_rd_data[31:0];
else
	pio_mem_data_reg0 <= pio_mem_data_reg0;

always @ (posedge clk)
if (reset)
        pio_mem_data_reg1 <= 32'b0;
else if (pio_mem_data_reg1_wen)
        pio_mem_data_reg1 <= pio_wdata[31:0];
else if (pio_acc_dly1 & pio_rd)
	pio_mem_data_reg1 <= muxed_mem_rd_data[63:32];
else
        pio_mem_data_reg1 <= pio_mem_data_reg1;


always @ (posedge clk)
if (reset)
        pio_mem_data_reg2 <= 32'b0;
else if (pio_mem_data_reg2_wen)
        pio_mem_data_reg2 <= pio_wdata[31:0];
else if (pio_acc_dly1 & pio_rd)
        pio_mem_data_reg2 <= muxed_mem_rd_data[95:64];
else
        pio_mem_data_reg2 <= pio_mem_data_reg2;

always @ (posedge clk)
if (reset)
        pio_mem_data_reg3 <= 32'b0;
else if (pio_mem_data_reg3_wen)
        pio_mem_data_reg3 <= pio_wdata[31:0];
else if (pio_acc_dly1 & pio_rd)
        pio_mem_data_reg3 <= muxed_mem_rd_data[127:96];
else
        pio_mem_data_reg3 <= pio_mem_data_reg3;

assign pio_mem_wr_data	= {pio_wdata[19:0],
			   pio_mem_data_reg3, pio_mem_data_reg2,
			   pio_mem_data_reg1, pio_mem_data_reg0};

always @ (posedge clk)
if (reset)
	pio_cache_rd <= 1'b0;
else if (pio_mem_data_reg4_ren & !pio_mem_addr_reg[8])
	pio_cache_rd <= 1'b1;
else
	pio_cache_rd <= 1'b0; 

always @ (posedge clk)
if (reset)
	pio_shadw_rd <= 1'b0; 
else if (pio_mem_data_reg4_ren & pio_mem_addr_reg[8])
        pio_shadw_rd <= 1'b1;
else
        pio_shadw_rd <= 1'b0;

always @ (posedge clk)
if (reset)
        pio_cache_wr <= 1'b0; 
else if (pio_mem_data_reg4_wen & !pio_mem_addr_reg[8])
        pio_cache_wr <= 1'b1;
else
        pio_cache_wr <= 1'b0;


always @ (posedge clk)
if (reset)
        pio_mem_data_reg4_wen_dly <= 1'b0;
else if (pio_mem_data_reg4_wen & wr_transfer_comp_int)
        pio_mem_data_reg4_wen_dly <= 1'b1;
else
        pio_mem_data_reg4_wen_dly <= 1'b0;

wire	pio_shadw_wr_en = (pio_mem_data_reg4_wen & !wr_transfer_comp_int | pio_mem_data_reg4_wen_dly);

always @ (posedge clk)
if (reset)
        pio_shadw_wr <= 1'b0; 
else if (pio_shadw_wr_en & pio_mem_addr_reg[8])
        pio_shadw_wr <= 1'b1;
else
        pio_shadw_wr <= 1'b0;

always @ (posedge clk)
if (reset)
begin
	pio_acc_dly0 <= 1'b0;
        pio_acc_dly1 <= 1'b0;
        pio_acc_dly2 <= 1'b0;
end
else
begin
	pio_acc_dly0 <= pio_mem_rd;
	pio_acc_dly1 <= pio_acc_dly0;
	pio_acc_dly2 <= pio_acc_dly1;
end

assign pio_mem_rd 		= pio_cache_rd | pio_shadw_rd;
assign muxed_cache_rd_strobe	= debug_mode ? pio_cache_rd : cache_rd_strobe;
assign muxed_cache_wr_strobe	= debug_mode ? pio_cache_wr : cache_wr_strobe;

assign muxed_cache_rd_addr	= debug_mode ? pio_mem_addr_reg[7:0] : cache_rd_addr;
assign muxed_cache_wr_addr	= debug_mode ? pio_mem_addr_reg[7:0] : cache_wr_addr;

assign muxed_cache_wr_data	= debug_mode ? pio_mem_wr_data : cache_wr_data;

assign muxed_shadw_rd_strobe    = debug_mode ? pio_shadw_rd : shadw_rd_strobe;
assign muxed_shadw_rd_addr	= debug_mode ? pio_mem_addr_reg[7:0] : shadw_rd_addr;
assign muxed_mem_rd_data	= pio_mem_addr_reg[8] ? shadw_rd_data_reg : cache_rd_data_reg;

//assign muxed_shadw_wr_strobe  = debug_mode ? pio_shadw_wr : shadw_wr_strobe;
//assign muxed_shadw_wr_addr	= debug_mode ? pio_mem_addr_reg[7:0] : shadw_wr_addr;
//assign muxed_shadw_wr_data	= debug_mode ? pio_mem_wr_data : shadw_wr_data;

assign muxed_shadw_wr_strobe	= pio_shadw_wr | shadw_wr_strobe;
assign muxed_shadw_wr_addr	= pio_shadw_wr ? pio_mem_addr_reg[7:0] : shadw_wr_addr;
assign muxed_shadw_wr_data	= pio_shadw_wr ? pio_mem_wr_data : shadw_wr_data;


/**********************/
//Parity Check
/**********************/
always @ (posedge clk)
if (reset)
begin
	muxed_cache_rd_strobe_r  <= 1'b0;
        muxed_cache_rd_strobe_r1 <= 1'b0;
        muxed_shadw_rd_strobe_r  <= 1'b0;
        muxed_shadw_rd_strobe_r1 <= 1'b0;
        cache_rd_strobe_r        <= 1'b0;
        cache_rd_strobe_r1       <= 1'b0;
        shadw_rd_strobe_r        <= 1'b0;
        shadw_rd_strobe_r1       <= 1'b0;
        muxed_cache_rd_addr_r    <= 8'b0;
        muxed_shadw_rd_addr_d    <= 8'b0;
        muxed_shadw_rd_addr_r    <= 8'b0;
end
else
begin
        muxed_cache_rd_strobe_r  <= muxed_cache_rd_strobe;
        muxed_cache_rd_strobe_r1 <= muxed_cache_rd_strobe_r;
	muxed_shadw_rd_strobe_r  <= muxed_shadw_rd_strobe;
        muxed_shadw_rd_strobe_r1 <= muxed_shadw_rd_strobe_r;
	cache_rd_strobe_r  	 <= cache_rd_strobe;
        cache_rd_strobe_r1 	 <= cache_rd_strobe_r;
        shadw_rd_strobe_r  	 <= shadw_rd_strobe;
        shadw_rd_strobe_r1 	 <= shadw_rd_strobe_r;
	muxed_cache_rd_addr_r	 <= muxed_cache_rd_addr;
	muxed_shadw_rd_addr_d	 <= muxed_shadw_rd_addr;
	muxed_shadw_rd_addr_r    <= muxed_shadw_rd_addr_d;
end

assign  cache_rd_data0  = {cache_rd_data_reg[128], cache_rd_data_reg[31:0]};
assign  cache_rd_data1  = {cache_rd_data_reg[129], cache_rd_data_reg[63:32]};
assign  cache_rd_data2  = {cache_rd_data_reg[130], cache_rd_data_reg[95:64]};
assign  cache_rd_data3  = {cache_rd_data_reg[131], cache_rd_data_reg[127:96]};

assign  cache_orig_parity_bits = cache_rd_data_reg[147:132];
assign  cache_data_parity_bits = {^cache_rd_data3[32:24],
                                  ^cache_rd_data3[23:16],
                                  ^cache_rd_data3[15:8],
                                  ^cache_rd_data3[7:0],
                                  ^cache_rd_data2[32:24],
                                  ^cache_rd_data2[23:16],
                                  ^cache_rd_data2[15:8],
                                  ^cache_rd_data2[7:0],
                                  ^cache_rd_data1[32:24],
                                  ^cache_rd_data1[23:16],
                                  ^cache_rd_data1[15:8],
                                  ^cache_rd_data1[7:0],
                                  ^cache_rd_data0[32:24],
                                  ^cache_rd_data0[23:16],
                                  ^cache_rd_data0[15:8],
                                  ^cache_rd_data0[7:0]};

assign  acc_cache_parity_err  	= !(cache_orig_parity_bits == cache_data_parity_bits) & muxed_cache_rd_strobe_r1;
assign	cache_parity_err	= !(cache_orig_parity_bits == cache_data_parity_bits) & cache_rd_strobe_r1;

assign	shadw_rd_data0  = shadw_rd_data_reg[31:0];
assign	shadw_rd_data1  = shadw_rd_data_reg[63:32];
assign	shadw_rd_data2	= shadw_rd_data_reg[95:64];
assign	shadw_rd_data3	= shadw_rd_data_reg[127:96];

assign	shadw_orig_parity_bits = shadw_rd_data_reg[147:132];
assign	shadw_data_parity_bits = {^shadw_rd_data3[31:24],
                            	  ^shadw_rd_data3[23:16],
                            	  ^shadw_rd_data3[15:8],
                            	  ^shadw_rd_data3[7:0],
                            	  ^shadw_rd_data2[31:24],
                            	  ^shadw_rd_data2[23:16],
                            	  ^shadw_rd_data2[15:8],
                            	  ^shadw_rd_data2[7:0],
                            	  ^shadw_rd_data1[31:24],
                            	  ^shadw_rd_data1[23:16],
                            	  ^shadw_rd_data1[15:8],
                            	  ^shadw_rd_data1[7:0],
                            	  ^shadw_rd_data0[31:24],
                            	  ^shadw_rd_data0[23:16],
                            	  ^shadw_rd_data0[15:8],
                            	  ^shadw_rd_data0[7:0]};

assign	acc_shadw_parity_err	= !(shadw_orig_parity_bits == shadw_data_parity_bits) & muxed_shadw_rd_strobe_r1;
assign	shadw_parity_err	= !(shadw_orig_parity_bits == shadw_data_parity_bits) & shadw_rd_strobe_r1;

always @ (posedge clk)
if (reset)
        cache_parity_log_reg <= 10'b0;
else if (cache_parity_log_pio_wen)
        cache_parity_log_reg <= {pio_wdata[15:14], pio_wdata[7:0]};
else if (acc_cache_parity_err & cache_parity_log_reg[8])
        cache_parity_log_reg <= {2'b11, cache_parity_log_reg[7:0]};
else if (acc_cache_parity_err)
        cache_parity_log_reg <= {2'b10, muxed_cache_rd_addr_r[7:0]};
else
        cache_parity_log_reg <= cache_parity_log_reg;


always @ (posedge clk)
if (reset)
        shadw_parity_log_reg <= 10'b0;
else if (shadw_parity_log_pio_wen)
        shadw_parity_log_reg <= {pio_wdata[15:14], pio_wdata[7:0]};
else if (acc_shadw_parity_err & shadw_parity_log_reg[8])
        shadw_parity_log_reg <= {2'b11, shadw_parity_log_reg[7:0]};
else if (acc_shadw_parity_err)
        shadw_parity_log_reg <= {2'b10, muxed_shadw_rd_addr_r[7:0]};
else
        shadw_parity_log_reg <= shadw_parity_log_reg;


/*****************/
//Debug port
/*****************/

always @ (posedge clk)
if (reset)
	debug_training_vector <= 32'b0;
else if (debug_training_vector_pio_wen)
	debug_training_vector <= pio_wdata[31:0];
else
	debug_training_vector <= debug_training_vector;


wire[31:0]	debug_default_data 	= debug_port_mux_sel[0] ? wr_debug_data[31:0] : {16'b0, pkt_buf_gnt[15:0]};
wire[31:0]	debug_port_data		= (debug_port_mux_sel == 2'b10) ? debug_training_vector[31:0] :
				  	  (debug_port_mux_sel == 2'b11) ? ~rdmc_debug_port :
								 	 debug_default_data;

always @ (posedge clk)
if (reset)
	rdmc_debug_port <= 32'b0;
else
	rdmc_debug_port <= debug_port_data;


/***************/
//PIO Read
/***************/
assign	chnl_pio_rd_data =		{64{pio_rd_gnt[0]}} & chnl_pio_rd_data0 |
                                        {64{pio_rd_gnt[1]}} & chnl_pio_rd_data1 |
                                        {64{pio_rd_gnt[2]}} & chnl_pio_rd_data2 |
                                        {64{pio_rd_gnt[3]}} & chnl_pio_rd_data3 |
                                        {64{pio_rd_gnt[4]}} & chnl_pio_rd_data4 |
                                        {64{pio_rd_gnt[5]}} & chnl_pio_rd_data5 |
                                        {64{pio_rd_gnt[6]}} & chnl_pio_rd_data6 |
                                        {64{pio_rd_gnt[7]}} & chnl_pio_rd_data7 |
                                        {64{pio_rd_gnt[8]}} & chnl_pio_rd_data8 |
                                        {64{pio_rd_gnt[9]}} & chnl_pio_rd_data9 |
                                        {64{pio_rd_gnt[10]}} & chnl_pio_rd_data10 |
                                        {64{pio_rd_gnt[11]}} & chnl_pio_rd_data11 |
                                        {64{pio_rd_gnt[12]}} & chnl_pio_rd_data12 |
                                        {64{pio_rd_gnt[13]}} & chnl_pio_rd_data13 |
                                        {64{pio_rd_gnt[14]}} & chnl_pio_rd_data14 |
                                        {64{pio_rd_gnt[15]}} & chnl_pio_rd_data15;


/*
always @ (pio_addr or clk_div_value or
        def_port0_rdc_reg or def_port1_rdc_reg or
        def_port2_rdc_reg or def_port3_rdc_reg or
        pt_drr_wt0_reg or pt_drr_wt1_reg or
        pt_drr_wt2_reg or pt_drr_wt3_reg or
	pt_use0_reg or pt_use1_reg or
	pt_use2_reg or pt_use3_reg or
	red_ran_init_reg or rx_addr_mode_reg or
	cache_parity_log_reg or shadw_parity_log_reg or
	pio_mem_addr_reg or pio_mem_data_reg0 or
	pio_mem_data_reg1 or pio_mem_data_reg2 or
	pio_mem_data_reg3 or muxed_mem_rd_data or
	port_err_status_reg or port_err_mask_reg or
	debug_training_vector)
begin

port_pio_rd_err	= 1'b0;
case (pio_addr)         //synopsys parallel_case full_case

20'h80000:      port_pio_rd_data_tmp = {48'b0, clk_div_value[15:0]};
20'h80008:      port_pio_rd_data_tmp = {59'b0, def_port0_rdc_reg[4:0]};
20'h80010:      port_pio_rd_data_tmp = {59'b0, def_port1_rdc_reg[4:0]};
20'h80018:      port_pio_rd_data_tmp = {59'b0, def_port2_rdc_reg[4:0]};
20'h80020:      port_pio_rd_data_tmp = {59'b0, def_port3_rdc_reg[4:0]};
20'h80028:      port_pio_rd_data_tmp = {48'b0, pt_drr_wt0_reg[15:0]};
20'h80030:      port_pio_rd_data_tmp = {48'b0, pt_drr_wt1_reg[15:0]};
20'h80038:      port_pio_rd_data_tmp = {48'b0, pt_drr_wt2_reg[15:0]};
20'h80040:      port_pio_rd_data_tmp = {48'b0, pt_drr_wt3_reg[15:0]};
20'h80048:      port_pio_rd_data_tmp = {44'b0, pt_use0_reg[19:0]};
20'h80050:      port_pio_rd_data_tmp = {44'b0, pt_use1_reg[19:0]};
20'h80058:      port_pio_rd_data_tmp = {44'b0, pt_use2_reg[19:0]};
20'h80060:      port_pio_rd_data_tmp = {44'b0, pt_use3_reg[19:0]};
20'h80068:      port_pio_rd_data_tmp = {47'b0, red_ran_init_reg[16:0]};
20'h80070:	port_pio_rd_data_tmp = {60'b0, rx_addr_mode_reg[3:0]};
20'h80078:	port_pio_rd_data_tmp = {48'b0, cache_parity_log_reg[9:8], 6'b0, cache_parity_log_reg[7:0]};
20'h80080:	port_pio_rd_data_tmp = {48'b0, shadw_parity_log_reg[9:8], 6'b0, shadw_parity_log_reg[7:0]};
20'h80088:	port_pio_rd_data_tmp = {55'b0, pio_mem_addr_reg[8:0]};
20'h80090:	port_pio_rd_data_tmp = {32'b0, pio_mem_data_reg0[31:0]};
20'h80098:      port_pio_rd_data_tmp = {32'b0, pio_mem_data_reg1[31:0]};
20'h800a0:      port_pio_rd_data_tmp = {32'b0, pio_mem_data_reg2[31:0]};
20'h800a8:      port_pio_rd_data_tmp = {32'b0, pio_mem_data_reg3[31:0]};
20'h800b0:      port_pio_rd_data_tmp = {44'b0, muxed_mem_rd_data[147:128]};
20'h800b8:	port_pio_rd_data_tmp = {55'b0, port_err_status_reg[8:0]};
20'h800c0:	port_pio_rd_data_tmp = {55'b0, port_err_mask_reg[8:0]};
20'h800c8:	port_pio_rd_data_tmp = {32'b0, debug_training_vector[31:0]};
20'h800d0:	port_pio_rd_data_tmp = {55'b0, port_err_status_reg[8:0]};
default:        begin
                port_pio_rd_err  = 1'b1;
                port_pio_rd_data_tmp = 64'b0;
                end

endcase
end
*/

always @ (pio_addr or clk_div_value or
        def_port0_rdc_reg or def_port1_rdc_reg or
        def_port2_rdc_reg or def_port3_rdc_reg or
        pt_drr_wt0_reg or pt_drr_wt1_reg or
        pt_drr_wt2_reg or pt_drr_wt3_reg or
        pt_use0_reg or pt_use1_reg or
        pt_use2_reg or pt_use3_reg or
        red_ran_init_reg or rx_addr_mode_reg or
        cache_parity_log_reg or shadw_parity_log_reg or
        pio_mem_addr_reg or pio_mem_data_reg0 or
        pio_mem_data_reg1 or pio_mem_data_reg2 or
        pio_mem_data_reg3 or muxed_mem_rd_data or
        port_err_status_reg or port_err_mask_reg or
        debug_training_vector)
begin

port_pio_rd_err = 1'b0;
case (pio_addr[19:2])         //synopsys parallel_case full_case

18'h20000:      port_pio_rd_data_tmp = {48'b0, clk_div_value[15:0]};
18'h20001:	port_pio_rd_data_tmp = 64'b0;
18'h20002:      port_pio_rd_data_tmp = {59'b0, def_port0_rdc_reg[4:0]};
18'h20003:      port_pio_rd_data_tmp = 64'b0;
18'h20004:      port_pio_rd_data_tmp = {59'b0, def_port1_rdc_reg[4:0]};
18'h20005:      port_pio_rd_data_tmp = 64'b0;
18'h20006:      port_pio_rd_data_tmp = {59'b0, def_port2_rdc_reg[4:0]};
18'h20007:      port_pio_rd_data_tmp = 64'b0;
18'h20008:      port_pio_rd_data_tmp = {59'b0, def_port3_rdc_reg[4:0]};
18'h20009:      port_pio_rd_data_tmp = 64'b0;
18'h2000a:      port_pio_rd_data_tmp = {48'b0, pt_drr_wt0_reg[15:0]};
18'h2000b:      port_pio_rd_data_tmp = 64'b0;
18'h2000c:      port_pio_rd_data_tmp = {48'b0, pt_drr_wt1_reg[15:0]};
18'h2000d:      port_pio_rd_data_tmp = 64'b0;
18'h2000e:      port_pio_rd_data_tmp = {48'b0, pt_drr_wt2_reg[15:0]};
18'h2000f:      port_pio_rd_data_tmp = 64'b0;
18'h20010:      port_pio_rd_data_tmp = {48'b0, pt_drr_wt3_reg[15:0]};
18'h20011:      port_pio_rd_data_tmp = 64'b0;
18'h20012:      port_pio_rd_data_tmp = {44'b0, pt_use0_reg[19:0]};
18'h20013:      port_pio_rd_data_tmp = 64'b0;
18'h20014:      port_pio_rd_data_tmp = {44'b0, pt_use1_reg[19:0]};
18'h20015:      port_pio_rd_data_tmp = 64'b0;
18'h20016:      port_pio_rd_data_tmp = {44'b0, pt_use2_reg[19:0]};
18'h20017:      port_pio_rd_data_tmp = 64'b0;
18'h20018:      port_pio_rd_data_tmp = {44'b0, pt_use3_reg[19:0]};
18'h20019:      port_pio_rd_data_tmp = 64'b0;
18'h2001a:      port_pio_rd_data_tmp = {47'b0, red_ran_init_reg[16:0]};
18'h2001b:      port_pio_rd_data_tmp = 64'b0;
18'h2001c:      port_pio_rd_data_tmp = {60'b0, rx_addr_mode_reg[3:0]};
18'h2001d:      port_pio_rd_data_tmp = 64'b0;
18'h2001e:      port_pio_rd_data_tmp = {48'b0, cache_parity_log_reg[9:8], 6'b0, cache_parity_log_reg[7:0]};
18'h2001f:      port_pio_rd_data_tmp = 64'b0;
18'h20020:      port_pio_rd_data_tmp = {48'b0, shadw_parity_log_reg[9:8], 6'b0, shadw_parity_log_reg[7:0]};
18'h20021:      port_pio_rd_data_tmp = 64'b0;
18'h20022:      port_pio_rd_data_tmp = {55'b0, pio_mem_addr_reg[8:0]};
18'h20023:      port_pio_rd_data_tmp = 64'b0;
18'h20024:      port_pio_rd_data_tmp = {32'b0, pio_mem_data_reg0[31:0]};
18'h20025:      port_pio_rd_data_tmp = 64'b0;
18'h20026:      port_pio_rd_data_tmp = {32'b0, pio_mem_data_reg1[31:0]};
18'h20027:      port_pio_rd_data_tmp = 64'b0;
18'h20028:      port_pio_rd_data_tmp = {32'b0, pio_mem_data_reg2[31:0]};
18'h20029:      port_pio_rd_data_tmp = 64'b0;
18'h2002a:      port_pio_rd_data_tmp = {32'b0, pio_mem_data_reg3[31:0]};
18'h2002b:      port_pio_rd_data_tmp = 64'b0;
18'h2002c:      port_pio_rd_data_tmp = {44'b0, muxed_mem_rd_data[147:128]};
18'h2002d:      port_pio_rd_data_tmp = 64'b0;
18'h2002e:      port_pio_rd_data_tmp = {55'b0, port_err_status_reg[8:0]};
18'h2002f:      port_pio_rd_data_tmp = 64'b0;
18'h20030:      port_pio_rd_data_tmp = {55'b0, port_err_mask_reg[8:0]};
18'h20031:      port_pio_rd_data_tmp = 64'b0;
18'h20032:      port_pio_rd_data_tmp = {32'b0, debug_training_vector[31:0]};
18'h20033:      port_pio_rd_data_tmp = 64'b0;
18'h20034:      port_pio_rd_data_tmp = {55'b0, port_err_status_reg[8:0]};
18'h20035:      port_pio_rd_data_tmp = 64'b0;
default:        begin
                port_pio_rd_err  = 1'b1;
                port_pio_rd_data_tmp = 64'hdeadbeefdeadbeef;
                end

endcase
end


always @ (posedge clk)
if (reset)
	port_pio_gnt <= 1'b0;
else
	port_pio_gnt <= !port_pio_rd_err;

always @ (posedge clk)
if (reset)
        port_pio_rd_data <= 64'b0;
else
        port_pio_rd_data <= port_pio_rd_data_tmp;




endmodule 

	

	
