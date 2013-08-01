// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_cache_acc_ctrl.v
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
module niu_rdmc_cache_acc_ctrl (
			clk,
			reset,
			cache_rd_req,
			cache_rd_ptr0,
			cache_rd_ptr1,
			cache_rd_ptr2,
			cache_rd_ptr3,
			cache_rd_ptr4,
			cache_rd_ptr5,
                        cache_rd_ptr6,
                        cache_rd_ptr7,
                        cache_rd_ptr8,
                        cache_rd_ptr9,
			cache_rd_ptr10,
                        cache_rd_ptr11,
                        cache_rd_ptr12,
                        cache_rd_ptr13,
                        cache_rd_ptr14,
                        cache_rd_ptr15,
			muxed_cache_rd_strobe_r,
			cache_rd_data,
			cache_wr_ptr0,
                        cache_wr_ptr1,
                        cache_wr_ptr2,
                        cache_wr_ptr3,
                        cache_wr_ptr4,
                        cache_wr_ptr5,
                        cache_wr_ptr6,
                        cache_wr_ptr7,
                        cache_wr_ptr8,
                        cache_wr_ptr9,
                        cache_wr_ptr10,
                        cache_wr_ptr11,
                        cache_wr_ptr12,
                        cache_wr_ptr13,
                        cache_wr_ptr14,
                        cache_wr_ptr15,
			fetch_desp_resp_valid_array,
			rdmc_resp_data_valid,


			cache_wr_strobe,
                        cache_wr_addr,
			cache_rd_strobe,
			cache_rd_addr,
			cache_buf_rd_gnt,
			cache_rd_data_reg
			);

input		clk;
input		reset;
input[15:0]	cache_rd_req;
input[7:0]	cache_rd_ptr0;
input[7:0]	cache_rd_ptr1;
input[7:0]      cache_rd_ptr2;
input[7:0]      cache_rd_ptr3;
input[7:0]      cache_rd_ptr4;
input[7:0]      cache_rd_ptr5;
input[7:0]      cache_rd_ptr6;
input[7:0]      cache_rd_ptr7;
input[7:0]      cache_rd_ptr8;
input[7:0]      cache_rd_ptr9;
input[7:0]      cache_rd_ptr10;
input[7:0]      cache_rd_ptr11;
input[7:0]      cache_rd_ptr12;
input[7:0]      cache_rd_ptr13;
input[7:0]      cache_rd_ptr14;
input[7:0]      cache_rd_ptr15;
input		muxed_cache_rd_strobe_r;
input[147:0]	cache_rd_data;
input[7:0]      cache_wr_ptr0;
input[7:0]      cache_wr_ptr1;
input[7:0]      cache_wr_ptr2;
input[7:0]      cache_wr_ptr3;
input[7:0]      cache_wr_ptr4;
input[7:0]      cache_wr_ptr5;
input[7:0]      cache_wr_ptr6;
input[7:0]      cache_wr_ptr7;
input[7:0]      cache_wr_ptr8;
input[7:0]      cache_wr_ptr9;
input[7:0]      cache_wr_ptr10;
input[7:0]      cache_wr_ptr11;
input[7:0]      cache_wr_ptr12;
input[7:0]      cache_wr_ptr13;
input[7:0]      cache_wr_ptr14;
input[7:0]      cache_wr_ptr15;
input[15:0]	fetch_desp_resp_valid_array;
input		rdmc_resp_data_valid;

output          cache_wr_strobe;
output[7:0]     cache_wr_addr;
output          cache_rd_strobe;
output[7:0]     cache_rd_addr;
output[15:0]	cache_buf_rd_gnt;
output[147:0]	cache_rd_data_reg;

reg		cycle0;
reg		cycle1;
reg		state;
reg		next_state;

reg[15:0]	token;
reg[15:0]	cache_buf_rd_gnt;
reg		cache_rd_strobe;
reg[7:0]	cache_rd_addr;
reg[147:0]	cache_rd_data_reg;

reg		cache_wr_strobe;
reg[7:0]	cache_wr_addr;

wire[15:0]	start_mask	= 16'h1111;
wire[3:0]	start_slide_num;
wire[15:0]	start_mask_slide;
wire		is_req		= |cache_rd_req;
wire[15:0]	right_req;
wire[15:0]	left_req;
wire		sel_left;
wire[15:0]	req_tmp;
wire[15:0]	pre_cache_rd_gnt;


parameter
C0	= 1'b0,
C1	= 1'b1;

always @ (state or is_req)
begin
	cycle0	= 1'b0;
	cycle1	= 1'b0;

case (state)	//synopsys parallel_case full_case

C0:
begin
	if (is_req)
	begin
		cycle0 		= 1'b1;
		next_state	= C1;
	end
	else
		next_state	= state;
end

C1:
begin
	cycle1		= 1'b1;
	next_state	= C0;
end

default:
	next_state	= C0;

endcase

end

always @ (posedge clk)
if (reset)
	state <= 1'b0;
else
	state <= next_state;


/**********************/
//Arbiter
/**********************/
niu_rdmc_encode_32	encode_32_inst_a (
					.din	(token), 
					.dout	(start_slide_num)
					);

niu_rdmc_barrel_shl_32	barrel_shl_32_inst_a	(
					.din	(start_mask),
					.shift	(start_slide_num),
					.dout	(start_mask_slide)
					);

assign right_req	= cache_rd_req & ~start_mask_slide;
assign left_req		= cache_rd_req & start_mask_slide;

assign sel_left		= !(left_req == 16'b0);
assign req_tmp		= sel_left ? left_req : right_req;

niu_rdmc_pri_encode_32	pri_encode_32_inst_a	(
					.din	(req_tmp),
					.dout	(pre_cache_rd_gnt)
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
        cache_buf_rd_gnt <= 16'h0;
else if (cycle0)	
	cache_buf_rd_gnt <= pre_cache_rd_gnt;
else
	cache_buf_rd_gnt <= 16'h0;

always @ (posedge clk)
if (reset)
	cache_rd_strobe	<= 1'b0;
else if (cycle1)
	cache_rd_strobe <= 1'b1;
else
	cache_rd_strobe <= 1'b0;

wire[7:0]	cache_rd_addr_tmp = {8{cache_buf_rd_gnt[0]}} & cache_rd_ptr0 |
				    {8{cache_buf_rd_gnt[1]}} & cache_rd_ptr1 |
				    {8{cache_buf_rd_gnt[2]}} & cache_rd_ptr2 |
				    {8{cache_buf_rd_gnt[3]}} & cache_rd_ptr3 |
                                    {8{cache_buf_rd_gnt[4]}} & cache_rd_ptr4 |
				    {8{cache_buf_rd_gnt[5]}} & cache_rd_ptr5 |
                                    {8{cache_buf_rd_gnt[6]}} & cache_rd_ptr6 |
				    {8{cache_buf_rd_gnt[7]}} & cache_rd_ptr7 |
                                    {8{cache_buf_rd_gnt[8]}} & cache_rd_ptr8 |
				    {8{cache_buf_rd_gnt[9]}} & cache_rd_ptr9 |
				    {8{cache_buf_rd_gnt[10]}} & cache_rd_ptr10 |
                                    {8{cache_buf_rd_gnt[11]}} & cache_rd_ptr11 |
                                    {8{cache_buf_rd_gnt[12]}} & cache_rd_ptr12 |
                                    {8{cache_buf_rd_gnt[13]}} & cache_rd_ptr13 |
                                    {8{cache_buf_rd_gnt[14]}} & cache_rd_ptr14 |
                                    {8{cache_buf_rd_gnt[15]}} & cache_rd_ptr15;

always @ (posedge clk)
if (reset)
	cache_rd_addr <= 8'b0;
else if (cycle1)
	cache_rd_addr <= cache_rd_addr_tmp;
else
	cache_rd_addr <= cache_rd_addr;


always @ (posedge clk)
if (reset)
	cache_rd_data_reg <= 148'b0;
else if (muxed_cache_rd_strobe_r)
	cache_rd_data_reg <= cache_rd_data;
else
	cache_rd_data_reg <= cache_rd_data_reg;


/********************/
//Write addr gen
/********************/

wire[7:0]       cache_wr_addr_tmp = {8{fetch_desp_resp_valid_array[0]}} & cache_wr_ptr0 |
                                    {8{fetch_desp_resp_valid_array[1]}} & cache_wr_ptr1 |
                                    {8{fetch_desp_resp_valid_array[2]}} & cache_wr_ptr2 |
                                    {8{fetch_desp_resp_valid_array[3]}} & cache_wr_ptr3 |
                                    {8{fetch_desp_resp_valid_array[4]}} & cache_wr_ptr4 |
                                    {8{fetch_desp_resp_valid_array[5]}} & cache_wr_ptr5 |
                                    {8{fetch_desp_resp_valid_array[6]}} & cache_wr_ptr6 |
                                    {8{fetch_desp_resp_valid_array[7]}} & cache_wr_ptr7 |
                                    {8{fetch_desp_resp_valid_array[8]}} & cache_wr_ptr8 |
                                    {8{fetch_desp_resp_valid_array[9]}} & cache_wr_ptr9 |
                                    {8{fetch_desp_resp_valid_array[10]}} & cache_wr_ptr10 |
                                    {8{fetch_desp_resp_valid_array[11]}} & cache_wr_ptr11 |
                                    {8{fetch_desp_resp_valid_array[12]}} & cache_wr_ptr12 |
                                    {8{fetch_desp_resp_valid_array[13]}} & cache_wr_ptr13 |
                                    {8{fetch_desp_resp_valid_array[14]}} & cache_wr_ptr14 |
                                    {8{fetch_desp_resp_valid_array[15]}} & cache_wr_ptr15;

always @ (posedge clk)
if (reset)
        cache_wr_addr <= 8'b0;
else if (rdmc_resp_data_valid)
        cache_wr_addr <= cache_wr_addr_tmp;
else
        cache_wr_addr <= cache_wr_addr;

always @ (posedge clk)
if (reset)
        cache_wr_strobe <= 1'b0;
else
        cache_wr_strobe <= rdmc_resp_data_valid;


endmodule

					
