// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_rcr_acc_ctrl.v
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
module niu_rdmc_rcr_acc_ctrl (
			clk,
			reset,
			rx_addr_32b_mode,
			rcr_ack_accept,
			rcr_wrbk_req,
			rcr_wrbk_data_type,
			rcr_wrbk_addr0,
                        rcr_wrbk_addr1,
                        rcr_wrbk_addr2,
                        rcr_wrbk_addr3,
                        rcr_wrbk_addr4,
                        rcr_wrbk_addr5,
                        rcr_wrbk_addr6,
                        rcr_wrbk_addr7,
                        rcr_wrbk_addr8,
                        rcr_wrbk_addr9,
                        rcr_wrbk_addr10,
                        rcr_wrbk_addr11,
                        rcr_wrbk_addr12,
                        rcr_wrbk_addr13,
                        rcr_wrbk_addr14,
                        rcr_wrbk_addr15,
                        rcr_wrbk_numb0,
                        rcr_wrbk_numb1,
                        rcr_wrbk_numb2,
                        rcr_wrbk_numb3,
                        rcr_wrbk_numb4,
                        rcr_wrbk_numb5,
                        rcr_wrbk_numb6,
                        rcr_wrbk_numb7,
                        rcr_wrbk_numb8,
                        rcr_wrbk_numb9,
                        rcr_wrbk_numb10,
                        rcr_wrbk_numb11,
                        rcr_wrbk_numb12,
                        rcr_wrbk_numb13,
                        rcr_wrbk_numb14,
                        rcr_wrbk_numb15,
			dma_func_num0,
                        dma_func_num1,
                        dma_func_num2,
                        dma_func_num3,
                        dma_func_num4,
                        dma_func_num5,
                        dma_func_num6,
                        dma_func_num7,
                        dma_func_num8,
                        dma_func_num9,
                        dma_func_num10,
                        dma_func_num11,
                        dma_func_num12,
                        dma_func_num13,
                        dma_func_num14,
                        dma_func_num15,
			shadw_rd_data,
			mailbox_data0,
                        mailbox_data1,
                        mailbox_data2,
                        mailbox_data3,
                        mailbox_data4,
                        mailbox_data5,
                        mailbox_data6,
                        mailbox_data7,
                        mailbox_data8,
                        mailbox_data9,
                        mailbox_data10,
                        mailbox_data11,
                        mailbox_data12,
                        mailbox_data13,
                        mailbox_data14,
                        mailbox_data15,
			meta0_rdmc_rcr_req_accept,
			meta0_rdmc_rcr_data_req,
			meta0_rdmc_rcr_ack_ready,
			meta0_rdmc_rcr_ack_cmd,
			meta0_rdmc_rcr_ack_cmd_status,
			meta0_rdmc_rcr_ack_client,
			meta0_rdmc_rcr_ack_dma_num,
			muxed_shadw_rd_strobe_r,
//output

			rcr_wrbk_gnt,
			rcr_wrbk_done,
			rcr_wrbk_pkt_num,
			rdmc_rcr_req_accept,
			rdmc_rcr_ack_valid,
			rdmc_rcr_ack_err,
                        rdmc_rcr_ack_dma_num,
			shadw_rd_strobe,
			shadw_rd_data_reg,
			rdmc_meta0_rcr_req,
                        rdmc_meta0_rcr_req_cmd,
                        rdmc_meta0_rcr_req_address,
                        rdmc_meta0_rcr_req_length,
                        rdmc_meta0_rcr_req_port_num,
                        rdmc_meta0_rcr_req_dma_num,
			rdmc_meta0_rcr_req_func_num,

			rdmc_meta0_rcr_data_valid,
                        rdmc_meta0_rcr_data,
                        rdmc_meta0_rcr_req_byteenable,
                        rdmc_meta0_rcr_transfer_comp,
                        rdmc_meta0_rcr_status,
			rdmc_meta0_rcr_ack_accept

			);

input                   clk;
input                   reset;
input			rx_addr_32b_mode;
input[15:0]		rcr_ack_accept;
input[15:0]             rcr_wrbk_req;
input[15:0]		rcr_wrbk_data_type;
input[63:0]             rcr_wrbk_addr0;
input[63:0]             rcr_wrbk_addr1;
input[63:0]             rcr_wrbk_addr2;
input[63:0]             rcr_wrbk_addr3;
input[63:0]             rcr_wrbk_addr4;
input[63:0]             rcr_wrbk_addr5;
input[63:0]             rcr_wrbk_addr6;
input[63:0]             rcr_wrbk_addr7;
input[63:0]             rcr_wrbk_addr8;
input[63:0]             rcr_wrbk_addr9;
input[63:0]             rcr_wrbk_addr10;
input[63:0]             rcr_wrbk_addr11;
input[63:0]             rcr_wrbk_addr12;
input[63:0]             rcr_wrbk_addr13;
input[63:0]             rcr_wrbk_addr14;
input[63:0]             rcr_wrbk_addr15;
input[3:0]              rcr_wrbk_numb0;
input[3:0]              rcr_wrbk_numb1;
input[3:0]              rcr_wrbk_numb2;
input[3:0]              rcr_wrbk_numb3;
input[3:0]              rcr_wrbk_numb4;
input[3:0]              rcr_wrbk_numb5;
input[3:0]              rcr_wrbk_numb6;
input[3:0]              rcr_wrbk_numb7;
input[3:0]              rcr_wrbk_numb8;
input[3:0]              rcr_wrbk_numb9;
input[3:0]              rcr_wrbk_numb10;
input[3:0]              rcr_wrbk_numb11;
input[3:0]              rcr_wrbk_numb12;
input[3:0]              rcr_wrbk_numb13;
input[3:0]              rcr_wrbk_numb14;
input[3:0]              rcr_wrbk_numb15;
input[1:0]      	dma_func_num0;
input[1:0]      	dma_func_num1;
input[1:0]      	dma_func_num2;
input[1:0]      	dma_func_num3;
input[1:0]      	dma_func_num4;
input[1:0]      	dma_func_num5;
input[1:0]      	dma_func_num6;
input[1:0]      	dma_func_num7;
input[1:0]      	dma_func_num8;
input[1:0]      	dma_func_num9;
input[1:0]      	dma_func_num10;
input[1:0]      	dma_func_num11;
input[1:0]      	dma_func_num12;
input[1:0]      	dma_func_num13;
input[1:0]      	dma_func_num14;
input[1:0]      	dma_func_num15;
input[147:0]		shadw_rd_data;
input[168:0]            mailbox_data0;
input[168:0]            mailbox_data1;
input[168:0]            mailbox_data2;
input[168:0]            mailbox_data3;
input[168:0]            mailbox_data4;
input[168:0]            mailbox_data5;
input[168:0]            mailbox_data6;
input[168:0]            mailbox_data7;
input[168:0]            mailbox_data8;
input[168:0]            mailbox_data9;
input[168:0]            mailbox_data10;
input[168:0]            mailbox_data11;
input[168:0]            mailbox_data12;
input[168:0]            mailbox_data13;
input[168:0]            mailbox_data14;
input[168:0]            mailbox_data15;
input           	meta0_rdmc_rcr_req_accept;
input           	meta0_rdmc_rcr_data_req;
input			meta0_rdmc_rcr_ack_ready;
input[7:0]		meta0_rdmc_rcr_ack_cmd;
input[3:0]		meta0_rdmc_rcr_ack_cmd_status;
input			meta0_rdmc_rcr_ack_client;
input[4:0]		meta0_rdmc_rcr_ack_dma_num;
input			muxed_shadw_rd_strobe_r;

output[15:0]		rcr_wrbk_gnt;
output			rcr_wrbk_done;
output[3:0]		rcr_wrbk_pkt_num;
output			rdmc_rcr_req_accept;
output			rdmc_rcr_ack_valid;
output			rdmc_rcr_ack_err;
output[4:0]		rdmc_rcr_ack_dma_num;
output			shadw_rd_strobe;
output[147:0]		shadw_rd_data_reg;
output          	rdmc_meta0_rcr_req;
output[7:0]     	rdmc_meta0_rcr_req_cmd;
output[63:0]    	rdmc_meta0_rcr_req_address;
output[13:0]    	rdmc_meta0_rcr_req_length;
output[1:0]     	rdmc_meta0_rcr_req_port_num;
output[4:0]     	rdmc_meta0_rcr_req_dma_num;
output[1:0]		rdmc_meta0_rcr_req_func_num;

output          	rdmc_meta0_rcr_data_valid;
output[127:0]   	rdmc_meta0_rcr_data;
output[15:0]    	rdmc_meta0_rcr_req_byteenable;
output          	rdmc_meta0_rcr_transfer_comp;
output[3:0]     	rdmc_meta0_rcr_status;
output			rdmc_meta0_rcr_ack_accept;


reg             rdmc_meta0_rcr_req;
reg[7:0]        rdmc_meta0_rcr_req_cmd;
reg[63:0]       rdmc_meta0_rcr_req_address;
reg[3:0]        rdmc_meta0_rcr_req_dma_num_i;
reg[1:0]	rdmc_meta0_rcr_req_func_num;

reg             rdmc_meta0_rcr_data_valid;
reg[127:0]      rdmc_meta0_rcr_data;
reg             rdmc_meta0_rcr_transfer_comp;

reg             rdmc_rcr_req_accept;
reg             rdmc_rcr_data_req;
reg		rdmc_rcr_ack_ready;
reg[7:0]	rdmc_rcr_ack_cmd;
reg[3:0]	rdmc_rcr_ack_cmd_status;
reg		rdmc_rcr_ack_client;
reg[4:0]	rdmc_rcr_ack_dma_num;
reg		rdmc_meta0_rcr_ack_accept;

reg		stage0_en;
reg		stage1_en;
reg		data_valid_sm;
reg		rcr_wrbk_done_sm;
reg		data_cycle0_sm;
reg             data_cycle1_sm;
reg             data_cycle2_sm;
reg		stage0_en_r;
reg		stage1_en_r;
reg		data_valid_sm_r;
reg		rcr_wrbk_done;
reg             data_cycle0;
reg             data_cycle1;
reg             data_cycle2;
reg[2:0]        state;
reg[2:0]        next_state;

reg[15:0]       token;
reg[15:0]	start_mask_slide_r;
reg[15:0]       rcr_wrbk_gnt;
reg[15:0]	rcr_wrbk_gnt_r;

reg[3:0]	wrbk_addr_cnt;
reg[3:0]	rcr_wrbk_pkt_num;

reg		rcr_wrbk_type;
reg[168:0]	mailbox_data_tmp_r;

reg[147:0]      shadw_rd_data_reg;

reg[3:0]	rcr_wrbk_numb_tmp_r;
reg[3:0]	rcr_wrbk_numb_sub;
reg[3:0]	data_valid_cnt;
reg		data_valid_cnt_done_r;
reg		shadw_rd_strobe_r;


wire[15:0]      start_mask      = 16'h1111;
wire[3:0]       start_slide_num;
wire[15:0]      start_mask_slide;
wire            is_req          = |rcr_wrbk_req;
wire[15:0]      right_req;
wire[15:0]      left_req;
wire            sel_left;
wire[15:0]      req_tmp;
wire[15:0]      pre_rcr_wrbk_gnt;
wire[3:0]	rcr_wrbk_gnt_dec;

wire		inc_wrbk_pkt_num2;
wire		inc_wrbk_pkt_num1;
wire[3:0]	wrbk_pkt_num_tmp2;
wire[3:0]	wrbk_pkt_num_tmp1;

parameter

RCR_ARB		= 3'd0,
RCR_GNT		= 3'd1,
RCR_REQ		= 3'd2,
RCR_WR_DATA_RDY	= 3'd3,
RCR_WR_DATA1	= 3'd4,
RCR_WR_DATA2	= 3'd5,
RCR_WR_DATA3	= 3'd6,
RCR_DATA_COMP	= 3'd7;

always @ (state or is_req or rdmc_rcr_req_accept or rdmc_rcr_data_req)
begin
	stage0_en	= 1'b0;
	stage1_en	= 1'b0;
	data_valid_sm	= 1'b0;
	rcr_wrbk_done_sm= 1'b0;
	data_cycle0_sm	= 1'b0;
	data_cycle1_sm	= 1'b0;
	data_cycle2_sm  = 1'b0;


case (state)    //synopsys parallel_case full_case

RCR_ARB:
begin
	if (is_req)
	begin
		stage0_en	= 1'b1;
		next_state	= RCR_GNT;
	end
	else
		next_state	= state;
end

RCR_GNT:
begin
	stage1_en	= 1'b1;
	next_state	= RCR_REQ;
end

RCR_REQ:
begin
	if (rdmc_rcr_req_accept)
		next_state	= RCR_WR_DATA_RDY;
	else
		next_state	= state;
end

RCR_WR_DATA_RDY:
begin
	if (rdmc_rcr_data_req)
	begin
		data_valid_sm	= 1'b1;
		data_cycle0_sm	= 1'b1;
		next_state	= RCR_WR_DATA1;
	end
	else
		next_state	= state;
end

RCR_WR_DATA1:
begin
	if (rdmc_rcr_data_req)
	begin
		data_valid_sm   = 1'b1;
		data_cycle1_sm  = 1'b1;
	 	next_state	= RCR_WR_DATA2;
	end
	else
		next_state	= state;
end

RCR_WR_DATA2:
begin
        if (rdmc_rcr_data_req)
        begin
                data_valid_sm   = 1'b1;
		data_cycle2_sm  = 1'b1;
                next_state      = RCR_WR_DATA3;
        end
        else    
                next_state      = state;
end

RCR_WR_DATA3:
begin
        if (rdmc_rcr_data_req)
        begin
                data_valid_sm   = 1'b1;
		rcr_wrbk_done_sm= 1'b1;		
                next_state      = RCR_DATA_COMP;
        end
        else    
                next_state      = state;
end

RCR_DATA_COMP:
		next_state	= RCR_ARB;

default:	next_state      = RCR_ARB;

endcase
end

always @ (posedge clk)
if (reset)
        state <= 3'b0;
else
        state <= next_state;



/**********************/
//Arbiter
/**********************/
niu_rdmc_encode_32      encode_32_inst_a (
                                        .din    (token),
                                        .dout   (start_slide_num)
                                        );

niu_rdmc_barrel_shl_32  barrel_shl_32_inst_a (
                                        .din    (start_mask),
                                        .shift  (start_slide_num),
                                        .dout   (start_mask_slide)
                                        );

assign right_req        = rcr_wrbk_req & ~start_mask_slide_r;
assign left_req         = rcr_wrbk_req & start_mask_slide_r;

assign sel_left         = !(left_req == 16'b0);
assign req_tmp          = sel_left ? left_req : right_req;

niu_rdmc_pri_encode_32   pri_encode_32_inst_a (
                                        .din    (req_tmp),
                                        .dout   (pre_rcr_wrbk_gnt)
                                        );

always @ (posedge clk)
if (reset)
        token <= 16'h0001;
else if (stage0_en)
        token <= {token[14:0], token[15]};
else
        token <= token;

always @ (posedge clk)
if (reset)
	start_mask_slide_r <= 16'b0;
else
	start_mask_slide_r <= start_mask_slide;

always @ (posedge clk)
if (reset)
        rcr_wrbk_gnt <= 16'h0;
else if (stage0_en)
        rcr_wrbk_gnt <= pre_rcr_wrbk_gnt;
else if (rdmc_rcr_req_accept)
	rcr_wrbk_gnt <= 16'h0;
else
	rcr_wrbk_gnt <= rcr_wrbk_gnt;

always @ (posedge clk)
if (reset)
	rcr_wrbk_gnt_r <= 16'b0;
else
	rcr_wrbk_gnt_r <= rcr_wrbk_gnt;


wire[63:0]      rcr_wrbk_addr_tmp =     {64{rcr_wrbk_gnt[0]}} & rcr_wrbk_addr0 |
                                        {64{rcr_wrbk_gnt[1]}} & rcr_wrbk_addr1 |
                                        {64{rcr_wrbk_gnt[2]}} & rcr_wrbk_addr2 |
                                        {64{rcr_wrbk_gnt[3]}} & rcr_wrbk_addr3 |
                                        {64{rcr_wrbk_gnt[4]}} & rcr_wrbk_addr4 |
                                        {64{rcr_wrbk_gnt[5]}} & rcr_wrbk_addr5 |
                                        {64{rcr_wrbk_gnt[6]}} & rcr_wrbk_addr6 |
                                        {64{rcr_wrbk_gnt[7]}} & rcr_wrbk_addr7 |
                                        {64{rcr_wrbk_gnt[8]}} & rcr_wrbk_addr8 |
                                        {64{rcr_wrbk_gnt[9]}} & rcr_wrbk_addr9 |
                                        {64{rcr_wrbk_gnt[10]}} & rcr_wrbk_addr10 |
                                        {64{rcr_wrbk_gnt[11]}} & rcr_wrbk_addr11 |
                                        {64{rcr_wrbk_gnt[12]}} & rcr_wrbk_addr12 |
                                        {64{rcr_wrbk_gnt[13]}} & rcr_wrbk_addr13 |
                                        {64{rcr_wrbk_gnt[14]}} & rcr_wrbk_addr14 |
                                        {64{rcr_wrbk_gnt[15]}} & rcr_wrbk_addr15; 

wire[3:0]      rcr_wrbk_numb_tmp =      {4{rcr_wrbk_gnt[0]}} & rcr_wrbk_numb0 |
                                        {4{rcr_wrbk_gnt[1]}} & rcr_wrbk_numb1 |
                                        {4{rcr_wrbk_gnt[2]}} & rcr_wrbk_numb2 |
                                        {4{rcr_wrbk_gnt[3]}} & rcr_wrbk_numb3 |
                                        {4{rcr_wrbk_gnt[4]}} & rcr_wrbk_numb4 |
                                        {4{rcr_wrbk_gnt[5]}} & rcr_wrbk_numb5 |
                                        {4{rcr_wrbk_gnt[6]}} & rcr_wrbk_numb6 |
                                        {4{rcr_wrbk_gnt[7]}} & rcr_wrbk_numb7 |
                                        {4{rcr_wrbk_gnt[8]}} & rcr_wrbk_numb8 |
                                        {4{rcr_wrbk_gnt[9]}} & rcr_wrbk_numb9 |
                                        {4{rcr_wrbk_gnt[10]}} & rcr_wrbk_numb10 |
                                        {4{rcr_wrbk_gnt[11]}} & rcr_wrbk_numb11 |
                                        {4{rcr_wrbk_gnt[12]}} & rcr_wrbk_numb12 |
                                        {4{rcr_wrbk_gnt[13]}} & rcr_wrbk_numb13 |
                                        {4{rcr_wrbk_gnt[14]}} & rcr_wrbk_numb14 |
                                        {4{rcr_wrbk_gnt[15]}} & rcr_wrbk_numb15; 

wire[1:0]      dma_func_num_tmp =       {2{rcr_wrbk_gnt[0]}} & dma_func_num0 |
                                        {2{rcr_wrbk_gnt[1]}} & dma_func_num1 |
                                        {2{rcr_wrbk_gnt[2]}} & dma_func_num2 |
                                        {2{rcr_wrbk_gnt[3]}} & dma_func_num3 |
                                        {2{rcr_wrbk_gnt[4]}} & dma_func_num4 |
                                        {2{rcr_wrbk_gnt[5]}} & dma_func_num5 |
                                        {2{rcr_wrbk_gnt[6]}} & dma_func_num6 |
                                        {2{rcr_wrbk_gnt[7]}} & dma_func_num7 |
                                        {2{rcr_wrbk_gnt[8]}} & dma_func_num8 |
                                        {2{rcr_wrbk_gnt[9]}} & dma_func_num9 |
                                        {2{rcr_wrbk_gnt[10]}} & dma_func_num10 |
                                        {2{rcr_wrbk_gnt[11]}} & dma_func_num11 |
                                        {2{rcr_wrbk_gnt[12]}} & dma_func_num12 |
                                        {2{rcr_wrbk_gnt[13]}} & dma_func_num13 |
                                        {2{rcr_wrbk_gnt[14]}} & dma_func_num14 |
                                        {2{rcr_wrbk_gnt[15]}} & dma_func_num15; 

wire[168:0]      mailbox_data_tmp =     {169{rcr_wrbk_gnt_r[0]}} & mailbox_data0 |
                                        {169{rcr_wrbk_gnt_r[1]}} & mailbox_data1 |
                                        {169{rcr_wrbk_gnt_r[2]}} & mailbox_data2 |
                                        {169{rcr_wrbk_gnt_r[3]}} & mailbox_data3 |
                                        {169{rcr_wrbk_gnt_r[4]}} & mailbox_data4 |
                                        {169{rcr_wrbk_gnt_r[5]}} & mailbox_data5 |
                                        {169{rcr_wrbk_gnt_r[6]}} & mailbox_data6 |
                                        {169{rcr_wrbk_gnt_r[7]}} & mailbox_data7 |
                                        {169{rcr_wrbk_gnt_r[8]}} & mailbox_data8 |
                                        {169{rcr_wrbk_gnt_r[9]}} & mailbox_data9 |
                                        {169{rcr_wrbk_gnt_r[10]}} & mailbox_data10 |
                                        {169{rcr_wrbk_gnt_r[11]}} & mailbox_data11 |
                                        {169{rcr_wrbk_gnt_r[12]}} & mailbox_data12 |
                                        {169{rcr_wrbk_gnt_r[13]}} & mailbox_data13 |
                                        {169{rcr_wrbk_gnt_r[14]}} & mailbox_data14 |
                                        {169{rcr_wrbk_gnt_r[15]}} & mailbox_data15; 

wire	rcr_wrbk_type_tmp = |(rcr_wrbk_gnt & rcr_wrbk_data_type);

niu_rdmc_encode_32      encode_32_inst_b (
                                        .din    (rcr_wrbk_gnt),
                                        .dout   (rcr_wrbk_gnt_dec)
                                        );

always @ (posedge clk)
if (reset)
	rcr_wrbk_type <= 1'b0;
else if (stage1_en)
	rcr_wrbk_type <= rcr_wrbk_type_tmp;
else
	rcr_wrbk_type <= rcr_wrbk_type;

always @ (posedge clk)
if (reset)
	mailbox_data_tmp_r <= 169'b0;
else if (stage1_en_r)
	mailbox_data_tmp_r <= mailbox_data_tmp;
else
	mailbox_data_tmp_r <= mailbox_data_tmp_r;

always @ (posedge clk)
if (reset)
	shadw_rd_data_reg <= 148'b0;
else if (muxed_shadw_rd_strobe_r)
	shadw_rd_data_reg <= shadw_rd_data;
else
	shadw_rd_data_reg <= shadw_rd_data_reg;

wire[511:0] mailbox_data_tmp_r1 = {128'b0,
				   48'b0, mailbox_data_tmp_r[168:153],
				   20'b0, mailbox_data_tmp_r[152:112], 3'b0,
				   64'b0,
				   20'b0, mailbox_data_tmp_r[111:70], 2'b0,
				   48'b0, mailbox_data_tmp_r[69:54],
				   10'b0, mailbox_data_tmp_r[53:0]};

wire[127:0] mailbox_data_out =  (data_cycle0) ? mailbox_data_tmp_r1[127:0]   :
				(data_cycle1) ? mailbox_data_tmp_r1[255:128] :
				(data_cycle2) ? mailbox_data_tmp_r1[383:256] :
						mailbox_data_tmp_r1[511:384];

wire[127:0] rdmc_meta0_rcr_data_tmp = rcr_wrbk_type & shadw_rd_strobe_r ? shadw_rd_data[127:0] : 
				      rcr_wrbk_type			? 128'b0	       : 
									  mailbox_data_out;

wire	shadw_rd_strobe = rcr_wrbk_type & rdmc_rcr_data_req & !data_valid_cnt_done_r;


/**********************************************/
//Write Request Interface
/**********************************************/
wire[4:0]	rdmc_meta0_rcr_req_dma_num  = {1'b0, rdmc_meta0_rcr_req_dma_num_i};
wire[1:0]	rdmc_meta0_rcr_req_port_num = 2'b00;
wire[13:0]	rdmc_meta0_rcr_req_length   = 14'd64;

always @ (posedge clk)
if (reset)
        rdmc_meta0_rcr_req <= 1'b0;
else if (meta0_rdmc_rcr_req_accept)
        rdmc_meta0_rcr_req <= 1'b0;
else if (stage1_en)
        rdmc_meta0_rcr_req <= 1'b1;
else
        rdmc_meta0_rcr_req <= rdmc_meta0_rcr_req;

always @ (posedge clk)
if (reset)
        rdmc_meta0_rcr_req_cmd <= 8'b0;
else if (stage1_en & rx_addr_32b_mode)
        rdmc_meta0_rcr_req_cmd <= 8'b0001_0001;
else if (stage1_en)
        rdmc_meta0_rcr_req_cmd <= 8'b0001_1001; // hardwired to 64 bit addressing
else if (rdmc_rcr_req_accept)
        rdmc_meta0_rcr_req_cmd <= 8'b0;
else
        rdmc_meta0_rcr_req_cmd <= rdmc_meta0_rcr_req_cmd;

always @ (posedge clk)
if (reset)
        rdmc_meta0_rcr_req_address <= 64'b0;
else if (stage0_en_r & rx_addr_32b_mode)
	rdmc_meta0_rcr_req_address <= {32'b0, rcr_wrbk_addr_tmp[31:0]};
else if (stage0_en_r)
	rdmc_meta0_rcr_req_address <= rcr_wrbk_addr_tmp[63:0];
else
        rdmc_meta0_rcr_req_address <= rdmc_meta0_rcr_req_address;

always @ (posedge clk)
if (reset)
        rdmc_meta0_rcr_req_dma_num_i <= 4'b0;
else if (stage1_en)
        rdmc_meta0_rcr_req_dma_num_i <= rcr_wrbk_gnt_dec;
else
        rdmc_meta0_rcr_req_dma_num_i <= rdmc_meta0_rcr_req_dma_num_i;

always @ (posedge clk)
if (reset)
        rdmc_meta0_rcr_req_func_num <= 2'b0;
else if (stage1_en)
        rdmc_meta0_rcr_req_func_num <= dma_func_num_tmp[1:0];
else
        rdmc_meta0_rcr_req_func_num <= rdmc_meta0_rcr_req_func_num;


wire[15:0] rdmc_meta0_rcr_req_byteenable = 16'hffff;
wire[3:0]  rdmc_meta0_rcr_status	 = 4'b0;

always @ (posedge clk)
if (reset)
	rdmc_meta0_rcr_data_valid <= 1'b0;
else
	rdmc_meta0_rcr_data_valid <= data_valid_sm_r;


always @ (posedge clk)
if (reset)
	rdmc_meta0_rcr_data <= 128'b0;
else if (data_valid_sm_r)
	rdmc_meta0_rcr_data <= rdmc_meta0_rcr_data_tmp;
else
	rdmc_meta0_rcr_data <= rdmc_meta0_rcr_data;

always @ (posedge clk)
if (reset)
	rdmc_meta0_rcr_transfer_comp <= 1'b0;
else
	rdmc_meta0_rcr_transfer_comp <= rcr_wrbk_done;

always @ (posedge clk)
if (reset)
	rdmc_meta0_rcr_ack_accept <= 1'b0;
else
	rdmc_meta0_rcr_ack_accept <= |rcr_ack_accept;

//Input registers
always @ (posedge clk)
if (reset)
begin
	rdmc_rcr_req_accept     <= 1'b0;
        rdmc_rcr_data_req       <= 1'b0;
        rdmc_rcr_ack_ready      <= 1'b0;
        rdmc_rcr_ack_cmd        <= 8'b0;
        rdmc_rcr_ack_cmd_status <= 4'b0;
        rdmc_rcr_ack_client     <= 1'b0;
        rdmc_rcr_ack_dma_num    <= 5'b0;
end
else
begin
        rdmc_rcr_req_accept 	<= meta0_rdmc_rcr_req_accept;
        rdmc_rcr_data_req   	<= meta0_rdmc_rcr_data_req;    
	rdmc_rcr_ack_ready	<= meta0_rdmc_rcr_ack_ready;
	rdmc_rcr_ack_cmd	<= meta0_rdmc_rcr_ack_cmd;
	rdmc_rcr_ack_cmd_status <= meta0_rdmc_rcr_ack_cmd_status;
	rdmc_rcr_ack_client	<= meta0_rdmc_rcr_ack_client;
	rdmc_rcr_ack_dma_num	<= meta0_rdmc_rcr_ack_dma_num;
end

wire rdmc_rcr_ack_valid = rdmc_rcr_ack_ready & rdmc_rcr_ack_client;
wire rdmc_rcr_ack_err	= !(rdmc_rcr_ack_cmd[4:0] == 5'b00110) | (rdmc_rcr_ack_cmd_status == 4'b1111);

always @ (posedge clk)
if (reset)
	stage0_en_r <= 1'b0;
else
	stage0_en_r <= stage0_en;

always @ (posedge clk)
if (reset)
        stage1_en_r <= 1'b0;
else
        stage1_en_r <= stage1_en;

always @ (posedge clk)
if (reset)
begin
        data_cycle0 <= 1'b0;
	data_cycle1 <= 1'b0;
	data_cycle2 <= 1'b0;
end
else
begin
        data_cycle0 <= data_cycle0_sm;
	data_cycle1 <= data_cycle1_sm;
	data_cycle2 <= data_cycle2_sm;
end

always @ (posedge clk)
if (reset)
        data_valid_sm_r <= 1'b0;
else
        data_valid_sm_r <= data_valid_sm;

always @ (posedge clk)
if (reset)
        rcr_wrbk_done <= 1'b0;
else
        rcr_wrbk_done <= rcr_wrbk_done_sm;


assign inc_wrbk_pkt_num2 = (|wrbk_addr_cnt[3:1]) & (!rdmc_meta0_rcr_data[127] & !rdmc_meta0_rcr_data[63]);
assign inc_wrbk_pkt_num1 = (|wrbk_addr_cnt[3:1]) & (!rdmc_meta0_rcr_data[127] | !rdmc_meta0_rcr_data[63]) |
                           (wrbk_addr_cnt[0] & !rdmc_meta0_rcr_data[63]);
assign wrbk_pkt_num_tmp2 = rcr_wrbk_pkt_num + 4'd2;
assign wrbk_pkt_num_tmp1 = rcr_wrbk_pkt_num + 4'd1;

always @ (posedge clk)
if (reset)
        wrbk_addr_cnt <= 4'b0;
else if (stage1_en)
        wrbk_addr_cnt <= rcr_wrbk_numb_tmp;
else if (rdmc_meta0_rcr_data_valid & (wrbk_addr_cnt[3:1] == 3'd0))
        wrbk_addr_cnt <= 4'b0;
else if (rdmc_meta0_rcr_data_valid)
        wrbk_addr_cnt <= wrbk_addr_cnt - 4'd2;
else
        wrbk_addr_cnt <= wrbk_addr_cnt;

always @ (posedge clk)
if (reset)
        rcr_wrbk_pkt_num <= 4'b0;
else if (rdmc_meta0_rcr_data_valid & inc_wrbk_pkt_num2)
        rcr_wrbk_pkt_num <= wrbk_pkt_num_tmp2;
else if (rdmc_meta0_rcr_data_valid & inc_wrbk_pkt_num1)
        rcr_wrbk_pkt_num <= wrbk_pkt_num_tmp1;
else if (rdmc_rcr_req_accept)
        rcr_wrbk_pkt_num <= 4'b0;
else
        rcr_wrbk_pkt_num <= rcr_wrbk_pkt_num;


always @ (posedge clk)
if (reset)
	rcr_wrbk_numb_tmp_r <= 4'b0;
else if (stage1_en)
	rcr_wrbk_numb_tmp_r <= rcr_wrbk_numb_tmp;
else if (rcr_wrbk_done)
	rcr_wrbk_numb_tmp_r <= 4'b0;
else
	rcr_wrbk_numb_tmp_r <= rcr_wrbk_numb_tmp_r;

wire[3:0]	rcr_wrbk_numb_sub_tmp   = (rcr_wrbk_numb_tmp_r > 4'd2) ? (rcr_wrbk_numb_tmp_r - 4'd2) : 4'b0;
wire		data_valid_cnt_done	= (data_valid_cnt >= rcr_wrbk_numb_sub);

always @ (posedge clk)
if (reset)
        rcr_wrbk_numb_sub <= 4'b0;
else if (rdmc_rcr_req_accept)
        rcr_wrbk_numb_sub <= rcr_wrbk_numb_sub_tmp;
else if (rcr_wrbk_done)
        rcr_wrbk_numb_sub <= 4'b0;
else
        rcr_wrbk_numb_sub <= rcr_wrbk_numb_sub;


always @ (posedge clk)
if (reset)
	data_valid_cnt <= 4'b0;
else if (rdmc_rcr_data_req & !data_valid_cnt_done)
	data_valid_cnt <= data_valid_cnt + 4'd2;
else if (rcr_wrbk_done)
	data_valid_cnt <= 4'b0;
else
	data_valid_cnt <= data_valid_cnt;

always @ (posedge clk)
if (reset)
	data_valid_cnt_done_r <= 1'b0;
else if (data_valid_cnt_done & rdmc_rcr_data_req)
	data_valid_cnt_done_r <= 1'b1;
else if (rcr_wrbk_done)
	data_valid_cnt_done_r <= 1'b0;
else
	data_valid_cnt_done_r <= data_valid_cnt_done_r;

always @ (posedge clk)
if (reset)
	shadw_rd_strobe_r <= 1'b0;
else
	shadw_rd_strobe_r <= shadw_rd_strobe;
	


endmodule



			
