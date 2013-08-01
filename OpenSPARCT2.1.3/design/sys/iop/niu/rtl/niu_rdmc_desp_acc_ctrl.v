// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_desp_acc_ctrl.v
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
module niu_rdmc_desp_acc_ctrl (
			clk,
			reset,
			rx_addr_32b_mode,
			desp_rd_req,
			fetch_desp_addr0,
			fetch_desp_addr1,
			fetch_desp_addr2,
			fetch_desp_addr3,
			fetch_desp_addr4,
                        fetch_desp_addr5,
                        fetch_desp_addr6,
                        fetch_desp_addr7,
			fetch_desp_addr8,
                        fetch_desp_addr9,
			fetch_desp_addr10,
                        fetch_desp_addr11,
                        fetch_desp_addr12,
                        fetch_desp_addr13,
                        fetch_desp_addr14,
                        fetch_desp_addr15,
			fetch_desp_numb0,
                        fetch_desp_numb1,
                        fetch_desp_numb2,
                        fetch_desp_numb3,
                        fetch_desp_numb4,
                        fetch_desp_numb5,
                        fetch_desp_numb6,
                        fetch_desp_numb7,
                        fetch_desp_numb8,
                        fetch_desp_numb9,
                        fetch_desp_numb10,
                        fetch_desp_numb11,
                        fetch_desp_numb12,
                        fetch_desp_numb13,
                        fetch_desp_numb14,
                        fetch_desp_numb15,
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
			rdmc_resp_accept_array,
			fetch_desp_resp_valid_array,
			meta1_rdmc_rbr_req_accept,
			meta1_rdmc_rbr_req_error,
			meta1_rdmc_rbr_resp_ready,
			meta1_rdmc_rbr_resp_cmd,
			meta1_rdmc_rbr_resp_cmd_status,
			meta1_rdmc_rbr_resp_dma_num,
			meta1_rdmc_rbr_resp_client,
			meta1_rdmc_rbr_resp_comp,
			meta1_rdmc_rbr_resp_trans_comp,
			meta1_rdmc_rbr_resp_data_valid,
			meta1_rdmc_rbr_resp_data,
			meta1_rdmc_rbr_resp_byteenable,
			meta1_rdmc_rbr_resp_data_status,

			rdmc_meta1_rbr_req,
			rdmc_meta1_rbr_req_cmd,
			rdmc_meta1_rbr_req_address,
			rdmc_meta1_rbr_req_length,
			rdmc_meta1_rbr_req_dma_num,
			rdmc_meta1_rbr_req_port_num,
			rdmc_meta1_rbr_req_func_num,
			rdmc_meta1_rbr_resp_accept,
			fetch_desp_gnt,
			resp_data_in_process,
			rdmc_resp_rdy_valid,
			rdmc_req_err,
			rdmc_resp_cmd,
			rdmc_resp_cmd_status,
			rdmc_resp_dma_num,
			rdmc_resp_data_valid,
			rdmc_resp_byteenable,
			rdmc_resp_comp,
			rdmc_resp_trans_comp,
			rdmc_resp_data_status,
			cache_wr_data
			);

input			clk;
input			reset;
input			rx_addr_32b_mode;
input[15:0]		desp_rd_req;
input[63:0]		fetch_desp_addr0;
input[63:0]		fetch_desp_addr1;
input[63:0]		fetch_desp_addr2;
input[63:0]		fetch_desp_addr3;
input[63:0]		fetch_desp_addr4;
input[63:0]		fetch_desp_addr5;
input[63:0]		fetch_desp_addr6;
input[63:0]		fetch_desp_addr7;
input[63:0]		fetch_desp_addr8;
input[63:0]		fetch_desp_addr9;
input[63:0]		fetch_desp_addr10;
input[63:0]		fetch_desp_addr11;
input[63:0]		fetch_desp_addr12;
input[63:0]		fetch_desp_addr13;
input[63:0]		fetch_desp_addr14;
input[63:0]		fetch_desp_addr15;
input[4:0]		fetch_desp_numb0;
input[4:0]		fetch_desp_numb1;
input[4:0]		fetch_desp_numb2;
input[4:0]		fetch_desp_numb3;
input[4:0]		fetch_desp_numb4;
input[4:0]		fetch_desp_numb5;
input[4:0]		fetch_desp_numb6;
input[4:0]		fetch_desp_numb7;
input[4:0]		fetch_desp_numb8;
input[4:0]		fetch_desp_numb9;
input[4:0]		fetch_desp_numb10;
input[4:0]		fetch_desp_numb11;
input[4:0]		fetch_desp_numb12;
input[4:0]		fetch_desp_numb13;
input[4:0]		fetch_desp_numb14;
input[4:0]		fetch_desp_numb15;
input[1:0]              dma_func_num0;
input[1:0]              dma_func_num1;
input[1:0]              dma_func_num2;
input[1:0]              dma_func_num3;
input[1:0]              dma_func_num4;
input[1:0]              dma_func_num5;
input[1:0]              dma_func_num6;
input[1:0]              dma_func_num7;
input[1:0]              dma_func_num8;
input[1:0]              dma_func_num9;
input[1:0]              dma_func_num10;
input[1:0]              dma_func_num11;
input[1:0]              dma_func_num12;
input[1:0]              dma_func_num13;
input[1:0]              dma_func_num14;
input[1:0]              dma_func_num15;
input[15:0]		rdmc_resp_accept_array;
input[15:0]		fetch_desp_resp_valid_array;
input			meta1_rdmc_rbr_req_accept;
input			meta1_rdmc_rbr_req_error;
input			meta1_rdmc_rbr_resp_ready;
input[7:0]		meta1_rdmc_rbr_resp_cmd;
input[3:0]		meta1_rdmc_rbr_resp_cmd_status;
input[4:0]		meta1_rdmc_rbr_resp_dma_num;
input			meta1_rdmc_rbr_resp_client;
input			meta1_rdmc_rbr_resp_comp;
input			meta1_rdmc_rbr_resp_trans_comp;
input			meta1_rdmc_rbr_resp_data_valid;
input[127:0]		meta1_rdmc_rbr_resp_data;
input[15:0]		meta1_rdmc_rbr_resp_byteenable;
input[3:0]		meta1_rdmc_rbr_resp_data_status;

output			rdmc_meta1_rbr_req;
output[7:0]		rdmc_meta1_rbr_req_cmd;
output[63:0]		rdmc_meta1_rbr_req_address;
output[13:0]		rdmc_meta1_rbr_req_length;
output[4:0]		rdmc_meta1_rbr_req_dma_num;
output[1:0]		rdmc_meta1_rbr_req_port_num;
output[1:0]             rdmc_meta1_rbr_req_func_num;
output			rdmc_meta1_rbr_resp_accept;
output[15:0]		fetch_desp_gnt;
output			resp_data_in_process;
output			rdmc_resp_rdy_valid;
output			rdmc_req_err;
output[4:0]		rdmc_resp_cmd;
output[3:0]		rdmc_resp_cmd_status;
output[4:0]		rdmc_resp_dma_num;
output			rdmc_resp_data_valid;
output[15:0]		rdmc_resp_byteenable;
output			rdmc_resp_comp;
output			rdmc_resp_trans_comp;
output[3:0]		rdmc_resp_data_status;
output[147:0]		cache_wr_data;


reg           	rdmc_meta1_rbr_req;
reg[7:0]      	rdmc_meta1_rbr_req_cmd;
reg[63:0]     	rdmc_meta1_rbr_req_address;
reg[4:0]      	rdmc_meta1_rbr_req_num;
reg[3:0]      	rdmc_meta1_rbr_req_dma_num_i;
reg[1:0]	rdmc_meta1_rbr_req_func_num;
reg           	rdmc_meta1_rbr_resp_accept;

reg		rdmc_req_accept;
reg		rdmc_req_err;
reg[7:0]	rdmc_resp_cmd_f;
reg[3:0]	rdmc_resp_cmd_status;
reg[4:0]      	rdmc_resp_dma_num;
reg		rdmc_resp_client;
reg		rdmc_resp_ready;
reg           	rdmc_resp_comp;
reg		rdmc_resp_trans_comp;
reg		rdmc_resp_data_valid;
reg[127:0]	rdmc_resp_data;
reg[15:0]	rdmc_resp_byteenable;
reg[3:0]	rdmc_resp_data_status;
reg[147:0]    	cache_wr_data;

reg[1:0]	state;
reg[1:0]	next_state;
reg		cycle0;
reg		cycle1;
reg[15:0]	token;
reg[15:0]	desp_rd_gnt;

wire[4:0]       rdmc_resp_cmd = rdmc_resp_cmd_f[4:0];

wire[3:0]	desp_rd_gnt_enc;
wire[15:0]	fetch_desp_gnt;
wire		resp_data_in_process;
wire		rdmc_resp_rdy_valid;
wire		vaild_bit0;
wire		vaild_bit1;
wire		vaild_bit2;
wire		vaild_bit3;
wire[3:0]	vaild_bits	= {vaild_bit3, vaild_bit2, vaild_bit1, vaild_bit0};

wire[15:0]      start_mask      = 16'h1111;
wire[3:0]       start_slide_num;
wire[15:0]      start_mask_slide;
wire            is_req          = |desp_rd_req;
wire[15:0]      right_req;
wire[15:0]      left_req;
wire            sel_left;
wire[15:0]      req_tmp;
wire[15:0]      pre_desp_rd_gnt;


parameter
C0      = 2'b00,
C1      = 2'b01,
C2	= 2'b10;

always @ (state or is_req or rdmc_req_accept)
begin
        cycle0  = 1'b0;
        cycle1  = 1'b0;

case (state)    //synopsys parallel_case full_case

C0:
begin
        if (is_req)
        begin
                cycle0          = 1'b1;
                next_state      = C1;
        end
        else
                next_state      = state;
end

C1:
begin
                cycle1          = 1'b1;
                next_state      = C2;
end

C2:
begin
	if (rdmc_req_accept)
        	next_state      = C0;
	else
		next_state	= state;
end

default:
        next_state      = C0;

endcase
end

always @ (posedge clk)
if (reset)
        state <= 2'b0;
else
        state <= next_state;


/**********************/
//Arbiter
/**********************/
niu_rdmc_encode_32	encode_32_inst_a (
                                	.din    (token),
                                	.dout   (start_slide_num)
                                	);

niu_rdmc_barrel_shl_32  barrel_shl_32_inst_a (
                                        .din    (start_mask),
                                        .shift  (start_slide_num),
                                        .dout   (start_mask_slide)
                                        );

assign right_req        = desp_rd_req & ~start_mask_slide;
assign left_req         = desp_rd_req & start_mask_slide;

assign sel_left         = !(left_req == 16'b0);
assign req_tmp          = sel_left ? left_req : right_req;

niu_rdmc_pri_encode_32   pri_encode_32_inst_a (
                                        .din    (req_tmp),
                                        .dout   (pre_desp_rd_gnt)
                                        );

always @ (posedge clk)
if (reset)
        token <= 16'h0001;
else if (cycle0)
        token <= {token[14:0], token[15]};
else
        token <= token;

always @ (posedge clk)
if (reset)
        desp_rd_gnt <= 16'h0;
else if (cycle0)
        desp_rd_gnt <= pre_desp_rd_gnt;
else if (rdmc_req_accept)
        desp_rd_gnt <= 16'h0;
else
	desp_rd_gnt <= desp_rd_gnt;

assign fetch_desp_gnt = {16{rdmc_req_accept}} & desp_rd_gnt[15:0];


/****************************/
//Read Request Interface
/****************************/
wire[63:0]	fetch_desp_addr_tmp = 	{64{desp_rd_gnt[0]}} & fetch_desp_addr0 |
					{64{desp_rd_gnt[1]}} & fetch_desp_addr1 |
                                    	{64{desp_rd_gnt[2]}} & fetch_desp_addr2 |
                                    	{64{desp_rd_gnt[3]}} & fetch_desp_addr3 |
                                    	{64{desp_rd_gnt[4]}} & fetch_desp_addr4 |
                                    	{64{desp_rd_gnt[5]}} & fetch_desp_addr5 |
                                    	{64{desp_rd_gnt[6]}} & fetch_desp_addr6 |
                                    	{64{desp_rd_gnt[7]}} & fetch_desp_addr7 |
                                    	{64{desp_rd_gnt[8]}} & fetch_desp_addr8 |
                                    	{64{desp_rd_gnt[9]}} & fetch_desp_addr9 |
                                    	{64{desp_rd_gnt[10]}} & fetch_desp_addr10 |
                                    	{64{desp_rd_gnt[11]}} & fetch_desp_addr11 |
                                    	{64{desp_rd_gnt[12]}} & fetch_desp_addr12 |
                                    	{64{desp_rd_gnt[13]}} & fetch_desp_addr13 |
                                    	{64{desp_rd_gnt[14]}} & fetch_desp_addr14 |
                                    	{64{desp_rd_gnt[15]}} & fetch_desp_addr15;

wire[4:0]      fetch_desp_numb_tmp =    {5{desp_rd_gnt[0]}} & fetch_desp_numb0 |
                                        {5{desp_rd_gnt[1]}} & fetch_desp_numb1 |
                                        {5{desp_rd_gnt[2]}} & fetch_desp_numb2 |
                                        {5{desp_rd_gnt[3]}} & fetch_desp_numb3 |
                                        {5{desp_rd_gnt[4]}} & fetch_desp_numb4 |
                                        {5{desp_rd_gnt[5]}} & fetch_desp_numb5 |
                                        {5{desp_rd_gnt[6]}} & fetch_desp_numb6 |
                                        {5{desp_rd_gnt[7]}} & fetch_desp_numb7 |
                                        {5{desp_rd_gnt[8]}} & fetch_desp_numb8 |
                                        {5{desp_rd_gnt[9]}} & fetch_desp_numb9 |
                                        {5{desp_rd_gnt[10]}} & fetch_desp_numb10 |
                                        {5{desp_rd_gnt[11]}} & fetch_desp_numb11 |
                                        {5{desp_rd_gnt[12]}} & fetch_desp_numb12 |
                                        {5{desp_rd_gnt[13]}} & fetch_desp_numb13 |
                                        {5{desp_rd_gnt[14]}} & fetch_desp_numb14 |
                                        {5{desp_rd_gnt[15]}} & fetch_desp_numb15;

wire[1:0]      dma_func_num_tmp =       {2{desp_rd_gnt[0]}} & dma_func_num0 |
                                        {2{desp_rd_gnt[1]}} & dma_func_num1 |
                                        {2{desp_rd_gnt[2]}} & dma_func_num2 |
                                        {2{desp_rd_gnt[3]}} & dma_func_num3 |
                                        {2{desp_rd_gnt[4]}} & dma_func_num4 |
                                        {2{desp_rd_gnt[5]}} & dma_func_num5 |
                                        {2{desp_rd_gnt[6]}} & dma_func_num6 |
                                        {2{desp_rd_gnt[7]}} & dma_func_num7 |
                                        {2{desp_rd_gnt[8]}} & dma_func_num8 |
                                        {2{desp_rd_gnt[9]}} & dma_func_num9 |
                                        {2{desp_rd_gnt[10]}} & dma_func_num10 |
                                        {2{desp_rd_gnt[11]}} & dma_func_num11 |
                                        {2{desp_rd_gnt[12]}} & dma_func_num12 |
                                        {2{desp_rd_gnt[13]}} & dma_func_num13 |
                                        {2{desp_rd_gnt[14]}} & dma_func_num14 |
                                        {2{desp_rd_gnt[15]}} & dma_func_num15;


niu_rdmc_encode_32	encode_32_inst_b (	
					.din    (desp_rd_gnt),
                                	.dout   (desp_rd_gnt_enc)
                                	);


wire[4:0]  rdmc_meta1_rbr_req_dma_num	= {1'b0, rdmc_meta1_rbr_req_dma_num_i};
wire[13:0] rdmc_meta1_rbr_req_length 	= {7'b0, rdmc_meta1_rbr_req_num[4:0], 2'b0};
wire[1:0]  rdmc_meta1_rbr_req_port_num	= 2'b0;

always @ (posedge clk)
if (reset)
	rdmc_meta1_rbr_req <= 1'b0;
else if (cycle1)
	rdmc_meta1_rbr_req <= 1'b1;
else if (meta1_rdmc_rbr_req_accept | meta1_rdmc_rbr_req_error)
	rdmc_meta1_rbr_req <= 1'b0;
else
	rdmc_meta1_rbr_req <= rdmc_meta1_rbr_req;

always @ (posedge clk)
if (reset)
        rdmc_meta1_rbr_req_cmd <= 8'b0;
else if (cycle1 & rx_addr_32b_mode)
	rdmc_meta1_rbr_req_cmd <= 8'b0000_0000; // 32 bit address
else if (cycle1)
        rdmc_meta1_rbr_req_cmd <= 8'b0000_1000;	// hardwired to 64 bit addressing
else if (rdmc_req_accept)
        rdmc_meta1_rbr_req_cmd <= 8'b0;
else
        rdmc_meta1_rbr_req_cmd <= rdmc_meta1_rbr_req_cmd;

always @ (posedge clk)
if (reset)
	rdmc_meta1_rbr_req_address <= 64'b0;
else if (cycle1 & rx_addr_32b_mode)
	rdmc_meta1_rbr_req_address <= {32'b0, fetch_desp_addr_tmp[31:0]};
else if (cycle1)
	rdmc_meta1_rbr_req_address <= fetch_desp_addr_tmp[63:0];
else
	rdmc_meta1_rbr_req_address <= rdmc_meta1_rbr_req_address;

always @ (posedge clk)
if (reset)
        rdmc_meta1_rbr_req_num <= 5'b0;
else if (cycle1)
        rdmc_meta1_rbr_req_num <= fetch_desp_numb_tmp;
else
        rdmc_meta1_rbr_req_num <= rdmc_meta1_rbr_req_num;

always @ (posedge clk)
if (reset)
        rdmc_meta1_rbr_req_func_num <= 2'b0;
else if (cycle1)
        rdmc_meta1_rbr_req_func_num <= dma_func_num_tmp;
else
        rdmc_meta1_rbr_req_func_num <= rdmc_meta1_rbr_req_func_num;


always @ (posedge clk)
if (reset)
	rdmc_meta1_rbr_req_dma_num_i <= 4'b0;
else if (cycle1)
	rdmc_meta1_rbr_req_dma_num_i <= desp_rd_gnt_enc;
else
	rdmc_meta1_rbr_req_dma_num_i <= rdmc_meta1_rbr_req_dma_num_i;

//Input registers
always @ (posedge clk)
if (reset)
begin
	rdmc_req_accept		<= 1'b0;
	rdmc_req_err		<= 1'b0;
end
else
begin
	rdmc_req_accept 	<= meta1_rdmc_rbr_req_accept;
	rdmc_req_err		<= meta1_rdmc_rbr_req_error;	
end

/****************************/
//Read Response Interface
/****************************/
//Input registers

always @ (posedge clk)
if (reset)
begin
	rdmc_resp_cmd_f         <= 8'b0;
        rdmc_resp_cmd_status    <= 4'b0;
        rdmc_resp_dma_num       <= 5'b0;
        rdmc_resp_client        <= 1'b0;
        rdmc_resp_ready         <= 1'b0;
        rdmc_resp_comp          <= 1'b0;
        rdmc_resp_trans_comp    <= 1'b0;

        rdmc_resp_data_valid    <= 1'b0;
        rdmc_resp_data          <= 128'b0;
        rdmc_resp_byteenable    <= 16'b0;
        rdmc_resp_data_status   <= 4'b0; 
end
else
begin
	rdmc_resp_cmd_f		<= meta1_rdmc_rbr_resp_cmd;	
	rdmc_resp_cmd_status	<= meta1_rdmc_rbr_resp_cmd_status;
	rdmc_resp_dma_num	<= meta1_rdmc_rbr_resp_dma_num;
	rdmc_resp_client	<= meta1_rdmc_rbr_resp_client;
	rdmc_resp_ready		<= meta1_rdmc_rbr_resp_ready;
	rdmc_resp_comp		<= meta1_rdmc_rbr_resp_comp;
	rdmc_resp_trans_comp	<= meta1_rdmc_rbr_resp_trans_comp;

	rdmc_resp_data_valid	<= meta1_rdmc_rbr_resp_data_valid;
	rdmc_resp_data		<= meta1_rdmc_rbr_resp_data;
	rdmc_resp_byteenable	<= meta1_rdmc_rbr_resp_byteenable;
	rdmc_resp_data_status	<= meta1_rdmc_rbr_resp_data_status; //not used for now
end

always @ (posedge clk)
if (reset)
	rdmc_meta1_rbr_resp_accept	<= 1'b0;
else
	rdmc_meta1_rbr_resp_accept	<= |rdmc_resp_accept_array;


assign rdmc_resp_rdy_valid	= rdmc_resp_ready & rdmc_resp_client;
assign resp_data_in_process	= |fetch_desp_resp_valid_array;

assign vaild_bit0       	= &rdmc_resp_byteenable[3:0];
assign vaild_bit1       	= &rdmc_resp_byteenable[7:4];
assign vaild_bit2       	= &rdmc_resp_byteenable[11:8];
assign vaild_bit3       	= &rdmc_resp_byteenable[15:12];

wire[32:0]	rdmc_resp_data0	= {vaild_bits[0], rdmc_resp_data[31:0]};
wire[32:0]      rdmc_resp_data1 = {vaild_bits[1], rdmc_resp_data[63:32]};
wire[32:0]      rdmc_resp_data2 = {vaild_bits[2], rdmc_resp_data[95:64]};
wire[32:0]      rdmc_resp_data3 = {vaild_bits[3], rdmc_resp_data[127:96]};

wire[15:0]	cache_data_parity = {^rdmc_resp_data3[32:24],
				     ^rdmc_resp_data3[23:16],
				     ^rdmc_resp_data3[15:8],
				     ^rdmc_resp_data3[7:0],
				     ^rdmc_resp_data2[32:24],
                                     ^rdmc_resp_data2[23:16],
                                     ^rdmc_resp_data2[15:8],
                                     ^rdmc_resp_data2[7:0],
				     ^rdmc_resp_data1[32:24],
                                     ^rdmc_resp_data1[23:16],
                                     ^rdmc_resp_data1[15:8],
                                     ^rdmc_resp_data1[7:0],
				     ^rdmc_resp_data0[32:24],
                                     ^rdmc_resp_data0[23:16],
                                     ^rdmc_resp_data0[15:8],
                                     ^rdmc_resp_data0[7:0]};

always @ (posedge clk)
if (reset)
	cache_wr_data <= 148'b0;
else
	cache_wr_data <= {cache_data_parity, vaild_bits[3:0], rdmc_resp_data[127:0]};


endmodule

	




