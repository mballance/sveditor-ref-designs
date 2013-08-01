// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_fetch_desp_sm.v
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
module niu_rdmc_fetch_desp_sm (
			clk,
			reset,
			dma_chnl_grp_id,
			dma_reset,
			dma_fatal_err,
			fetch_desp_trig,
			fetch_desp_num,
			desp_init_valid,
			fetch_desp_gnt,
			rdmc_resp_rdy_valid,
			rdmc_req_err,
			rdmc_resp_cmd,
			rdmc_resp_cmd_status,
			rdmc_resp_data_status,
			rdmc_resp_dma_num,
			rdmc_resp_data_valid,
			rdmc_resp_byteenable,
			rdmc_resp_comp,
			rdmc_resp_trans_comp,
			resp_data_in_process,

			fetch_desp_req,
			rdmc_resp_accept_sm,	//use rdmc_resp_accept if timing
			fetch_desp_resp_vld,
			fetch_desp_req_sm,
			fetch_desp_pre_done,
			fetch_desp_done,
			resp_bus_err,
			resp_bus_err_type,
			rbr_idle_cycle 

			);


input		clk;
input		reset;
input[4:0]      dma_chnl_grp_id;
input		dma_reset;
input		dma_fatal_err;
input		fetch_desp_trig;
input[4:0]	fetch_desp_num;
input		desp_init_valid;
input		fetch_desp_gnt;
input		rdmc_resp_rdy_valid;
input		rdmc_req_err;
input[4:0]	rdmc_resp_cmd;
input[3:0]	rdmc_resp_cmd_status;
input[3:0]	rdmc_resp_data_status;
input[4:0]	rdmc_resp_dma_num;
input		rdmc_resp_data_valid;
input[15:0]	rdmc_resp_byteenable;
input		rdmc_resp_comp;
input		rdmc_resp_trans_comp;
input		resp_data_in_process;

output		fetch_desp_req;
output		rdmc_resp_accept_sm;
output		fetch_desp_resp_vld;
output          fetch_desp_req_sm;
output		fetch_desp_pre_done;
output		fetch_desp_done;
output		resp_bus_err;
output[3:0]	resp_bus_err_type;
output		rbr_idle_cycle;

reg		rbr_idle_cycle;
reg		fetch_desp_req_sm;
reg		rdmc_resp_accept_sm;
reg		fetch_desp_resp_valid_sm;
reg		resp_cmd_err;
reg		fetch_desp_pre_done;
reg		fetch_desp_done;
reg[2:0]	next_state;
reg[2:0]	state;
reg		fetch_desp_req;
//reg		rdmc_resp_accept;
reg		fetch_desp_resp_vld;

reg[2:0]	valid_addr_cnt;
reg[4:0]	resp_data_cnt;
reg		valid_bit_err;
reg		valid_bit_err_r;
reg		resp_data_err;

wire		vaild_bit0;
wire		vaild_bit1;
wire		vaild_bit2;
wire		vaild_bit3;
wire[3:0]	vaild_bit_array;

wire		valid_bit_err0;
wire		valid_bit_err1;
wire		valid_bit_err2;
wire		valid_bit_err3;
wire		valid_bit_err_tmp;
wire		resp_data_cnt_err;
wire		resp_bus_err;
wire[3:0]	resp_bus_err_type;

wire	resp_id_match	  = (dma_chnl_grp_id == rdmc_resp_dma_num);

wire	rdmc_resp_cmd_err = (rdmc_resp_cmd_status == 4'b1111) | !(rdmc_resp_cmd[4:0] == 5'b00101); 

parameter

IDLE		= 3'b000,
DESP_REQ	= 3'b001,
DESP_RESP1	= 3'b010,
DESP_RESP_DATA1 = 3'b011,
DESP_RESP2	= 3'b100,
DESP_RESP_DATA2 = 3'b101,
DESP_RESP_DONE  = 3'b110,
RESP_ERR	= 3'b111;


always @ (state or 
	  desp_init_valid or fetch_desp_trig or 
	  fetch_desp_gnt or rdmc_resp_rdy_valid or 
	  rdmc_resp_comp or rdmc_resp_trans_comp or
	  resp_data_in_process or resp_id_match or 
	  dma_fatal_err or rdmc_req_err or rdmc_resp_cmd_err)
begin
	rbr_idle_cycle		= 1'b0;
	fetch_desp_req_sm	= 1'b0;
	rdmc_resp_accept_sm	= 1'b0;
	fetch_desp_resp_valid_sm= 1'b0;
	resp_cmd_err		= 1'b0;
	fetch_desp_pre_done	= 1'b0;
	fetch_desp_done		= 1'b0;
	next_state		= 3'b0;


case (state)	//synopsys parallel_case full_case

IDLE:
begin
	rbr_idle_cycle	= 1'b1;
	if (desp_init_valid & !dma_fatal_err) 
	begin
		if (fetch_desp_trig)
		begin
			fetch_desp_req_sm	= 1'b1;
			next_state		= DESP_REQ;
		end
		else
			next_state		= state;
	end
	else
		next_state	= state;
end

DESP_REQ:
begin
	if (fetch_desp_gnt)			
		next_state			= DESP_RESP1;
	else
		next_state			= state;
end

DESP_RESP1:
begin
	if (resp_data_in_process)
	begin
		rdmc_resp_accept_sm             = 1'b0;
                fetch_desp_resp_valid_sm        = 1'b0;
                next_state                      = state;
        end
	else if (rdmc_req_err)
	begin
		rdmc_resp_accept_sm             = 1'b0;
                fetch_desp_resp_valid_sm        = 1'b0;
                next_state                      = RESP_ERR;
	end
	else if (rdmc_resp_rdy_valid & resp_id_match & rdmc_resp_cmd_err)
        begin
                rdmc_resp_accept_sm             = 1'b1;
                fetch_desp_resp_valid_sm        = 1'b0;
                next_state                      = RESP_ERR;
        end
	else if (rdmc_resp_rdy_valid & resp_id_match)
	begin
		rdmc_resp_accept_sm		= 1'b1;
		fetch_desp_resp_valid_sm	= 1'b1;
		next_state			= DESP_RESP_DATA1;
	end
	else
		next_state			= state;
end

DESP_RESP_DATA1:
begin
	if (rdmc_resp_comp & rdmc_resp_trans_comp)
	begin
		fetch_desp_pre_done	= 1'b1;
		next_state		= DESP_RESP_DONE;
	end
	else if (rdmc_resp_comp)
		next_state		= DESP_RESP2;		
	else
		next_state		= state;
end

DESP_RESP2:
begin
	if (resp_data_in_process)
        begin
                rdmc_resp_accept_sm             = 1'b0;
                fetch_desp_resp_valid_sm        = 1'b0;
                next_state                      = state;
        end
	else if (rdmc_resp_rdy_valid & resp_id_match & rdmc_resp_cmd_err)
        begin
                rdmc_resp_accept_sm             = 1'b1;
                fetch_desp_resp_valid_sm        = 1'b0;
                next_state                      = RESP_ERR;
        end
        else if (rdmc_resp_rdy_valid & resp_id_match)
        begin   
                rdmc_resp_accept_sm             = 1'b1;
                fetch_desp_resp_valid_sm        = 1'b1;
                next_state                      = DESP_RESP_DATA2;
        end
        else
                next_state                      = state;
end

DESP_RESP_DATA2:
begin
        if (rdmc_resp_comp & rdmc_resp_trans_comp)
        begin   
                fetch_desp_pre_done     = 1'b1;
                next_state              = DESP_RESP_DONE;
        end
        else if (rdmc_resp_comp)
                next_state              = RESP_ERR;           
        else
                next_state              = state;
end

DESP_RESP_DONE:
begin
		fetch_desp_done		= 1'b1;
		next_state		= IDLE;
end

RESP_ERR:
begin
		fetch_desp_done	= 1'b1;
		resp_cmd_err	= 1'b1;
		next_state	= IDLE;
end

default:
		next_state	= IDLE;
endcase
end


always @ (posedge clk)
if (reset)
        state <= 3'b0;
else if (dma_reset)
	state <= 3'b0;
else
        state <= next_state;

always @ (posedge clk)
if (reset)
        fetch_desp_req <= 1'b0;
else if (dma_reset)
	fetch_desp_req <= 1'b0;
else if (fetch_desp_req_sm)
        fetch_desp_req <= 1'b1;
else if (fetch_desp_gnt)
        fetch_desp_req <= 1'b0;
else
        fetch_desp_req <= fetch_desp_req;

/*
always @ (posedge clk)
if (reset)
	rdmc_resp_accept <= 1'b0;
else
	rdmc_resp_accept <= rdmc_resp_accept_sm;
*/

always @ (posedge clk)
if (reset)
	fetch_desp_resp_vld <= 1'b0;
else if (dma_reset)
	fetch_desp_resp_vld <= 1'b0;
else if (fetch_desp_resp_valid_sm)
	fetch_desp_resp_vld <= 1'b1;
else if (rdmc_resp_comp)
	fetch_desp_resp_vld <= 1'b0;
else
	fetch_desp_resp_vld <= fetch_desp_resp_vld;


assign vaild_bit0 	= &rdmc_resp_byteenable[3:0];
assign vaild_bit1 	= &rdmc_resp_byteenable[7:4];
assign vaild_bit2 	= &rdmc_resp_byteenable[11:8];
assign vaild_bit3 	= &rdmc_resp_byteenable[15:12];
assign vaild_bit_array	= {vaild_bit3, vaild_bit2, vaild_bit1, vaild_bit0};

assign valid_bit_err0	= |rdmc_resp_byteenable[3:0] & !vaild_bit0;
assign valid_bit_err1	= |rdmc_resp_byteenable[7:4] & !vaild_bit1;
assign valid_bit_err2  	= |rdmc_resp_byteenable[11:8] & !vaild_bit2;
assign valid_bit_err3  	= |rdmc_resp_byteenable[15:12] & !vaild_bit3;

assign valid_bit_err_tmp = valid_bit_err0 | valid_bit_err1 |
			   valid_bit_err2 | valid_bit_err3 | valid_bit_err;

assign resp_data_cnt_err = !(resp_data_cnt == fetch_desp_num);

always @ (vaild_bit_array)
begin

case (vaild_bit_array)		//synopsys parallel_case full_case

4'b0001, 4'b0010, 4'b0100, 4'b1000:
	begin
	valid_addr_cnt 	= 3'b001;
	valid_bit_err	= 1'b0;
	end
4'b0011, 4'b0110, 4'b1100:
	begin
	valid_addr_cnt 	= 3'b010;
	valid_bit_err	= 1'b0;
	end
4'b0111, 4'b1110:
	begin
	valid_addr_cnt 	= 3'b011;
	valid_bit_err	= 1'b0;
	end
4'b1111:
	begin
	valid_addr_cnt 	= 3'b100;
	valid_bit_err	= 1'b0;
	end
default:
	begin
	valid_addr_cnt 	= 3'b000;
	valid_bit_err   = 1'b1;
	end
endcase
end


always @ (posedge clk)
if (reset)
	resp_data_cnt <= 5'b0;
else if (dma_reset)
	resp_data_cnt <= 5'b0;
else if (fetch_desp_gnt)
	resp_data_cnt <= 5'b0;
else if (fetch_desp_resp_vld & rdmc_resp_data_valid)
	resp_data_cnt <= resp_data_cnt + {2'b0, valid_addr_cnt};
else 
	resp_data_cnt <= resp_data_cnt;

always @ (posedge clk)
if (reset)
	valid_bit_err_r <= 1'b0;
else if (dma_reset)
	valid_bit_err_r <= 1'b0;
else if (fetch_desp_gnt)
	valid_bit_err_r <= 1'b0;
else if (fetch_desp_resp_vld & rdmc_resp_data_valid)
	valid_bit_err_r <= valid_bit_err_tmp | valid_bit_err_r;
else
	valid_bit_err_r <= valid_bit_err_r;

always @ (posedge clk)
if (reset)
	resp_data_err <= 1'b0;
else if (dma_reset)
	resp_data_err <= 1'b0;
else if (fetch_desp_gnt)
	resp_data_err <= 1'b0;
else if (fetch_desp_resp_vld & rdmc_resp_data_valid & (rdmc_resp_data_status != 4'b0))
	resp_data_err <= 1'b1;
else
	resp_data_err <= resp_data_err;

assign resp_bus_err	 = (resp_cmd_err | resp_data_cnt_err | valid_bit_err_r | resp_data_err) & fetch_desp_done;
assign resp_bus_err_type = {resp_cmd_err, resp_data_cnt_err, valid_bit_err_r, resp_data_err};

endmodule





	
	
