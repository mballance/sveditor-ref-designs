// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rdmc_wr_dp_sm.v
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
module niu_rdmc_wr_dp_sm (
				clk,
				reset,
				full_hdr_r1,
				ipp_data_req_dly2,
				rdmc_wr_req_accept_hdr,
				rdmc_wr_req_accept_zcp,
				muxed_ipp_data_ack,
				rdmc_cal_eop_r,
				ipp_next_eop,
				ipp_fzcp_eop,
				pkt_req_cnt_done,
				pkt_req_cnt_done_r,
				pkt_req_cnt_done_r1,
				pkt_req_cnt_done_r2,
				jmb_pkt_type,
				zcopy_mode,
				zcp_wr_type,

				offset_reg_en,
				offset_sel,
				wr_idle_state,
				rdmc_wr_data_sel,
				rdmc_wr_data_valid_sm,
				rdmc_wr_data_comp_sm,
				rdmc_wr_last_comp_sm,
				jmb_wr_cycle_sm,
				wr_dp_sm_state
				);

input		clk;
input		reset;
input		full_hdr_r1;
input		ipp_data_req_dly2;
input		rdmc_wr_req_accept_hdr;
input		rdmc_wr_req_accept_zcp;
input		muxed_ipp_data_ack;
input		rdmc_cal_eop_r;
input		ipp_next_eop;
input		ipp_fzcp_eop;
input		pkt_req_cnt_done;
input		pkt_req_cnt_done_r;
input		pkt_req_cnt_done_r1;
input		pkt_req_cnt_done_r2;
input[1:0]	jmb_pkt_type;		//01:use one buf, 10:use two buf, 11:use three buf
input		zcopy_mode;
input[1:0]	zcp_wr_type;		//00:one dmaw, ... 11:four dmaw

output		offset_reg_en;
output[1:0]	offset_sel;
output		wr_idle_state;
output[1:0]	rdmc_wr_data_sel;
output		rdmc_wr_data_valid_sm;
output		rdmc_wr_data_comp_sm;
output		rdmc_wr_last_comp_sm;
output		jmb_wr_cycle_sm;
output[4:0]	wr_dp_sm_state;

reg             offset_reg_en;
reg[1:0]        offset_sel;
reg		wr_idle_state;
reg             ready_cycle;
reg[1:0]        rdmc_wr_data_sel;
reg             rdmc_wr_data_valid_sm;
reg             rdmc_wr_data_comp_sm;
reg		rdmc_wr_last_comp_sm;
reg             inc_zcp_wr_cnt;
reg             jmb_pkt_done_sm;
reg		jmb_wr_cycle_sm;
reg[4:0]        state;
reg[4:0]        next_state;

reg		ready_cycle_reg;
reg		is_rdmc_wr_req_accept;
reg[1:0]	zcp_wr_cnt;
reg		jmb_pkt_done;

wire[4:0]	wr_dp_sm_state = state;
wire		zcp_wr_done;


parameter

IDLE			= 5'd16,
READY			= 5'd0,
FIRST_HDR		= 5'd1,
JMB_WR_DATA		= 5'd2,
WR_DATA			= 5'd3,
WAIT_DATA_LAST		= 5'd4,
WR_DATA_LAST		= 5'd5,
ZCP_WR_HDR		= 5'd6,
WAIT_ZCP_HDR_LAST	= 5'd7,
ZCP_WR_HDR_LAST		= 5'd8,
ZCP_READY		= 5'd9,
ZCP_WR_MID		= 5'd10,
WAIT_ZCP_MID_LAST	= 5'd11,
ZCP_WR_MID_LAST		= 5'd12,
ZCP_WR_DATA		= 5'd13,
WAIT_ZCP_DATA_LAST	= 5'd14,
ZCP_WR_DATA_LAST	= 5'd15; 

always @ (state or full_hdr_r1 or ipp_data_req_dly2 or
	  jmb_pkt_type or jmb_pkt_done or 
	  zcopy_mode or zcp_wr_done or
	  rdmc_wr_req_accept_hdr or rdmc_wr_req_accept_zcp or 
	  is_rdmc_wr_req_accept or muxed_ipp_data_ack or
	  pkt_req_cnt_done or pkt_req_cnt_done_r or
	  pkt_req_cnt_done_r1 or pkt_req_cnt_done_r2 or
	  rdmc_cal_eop_r or ipp_next_eop or ipp_fzcp_eop) 
	 
begin

	offset_reg_en		= 1'b0;
	offset_sel		= 2'b00;
	wr_idle_state		= 1'b0;
	ready_cycle		= 1'b0;
	rdmc_wr_data_sel	= 2'b00;
	rdmc_wr_data_valid_sm	= 1'b0;
	rdmc_wr_data_comp_sm	= 1'b0;
	rdmc_wr_last_comp_sm	= 1'b0;
	inc_zcp_wr_cnt		= 1'b0;
	jmb_pkt_done_sm		= 1'b0;
	jmb_wr_cycle_sm		= 1'b0;
	next_state		= 5'b0;

case (state)	//synopsys parallel_case full_case

IDLE:
begin
	wr_idle_state		= 1'b1;
	if (rdmc_wr_req_accept_hdr)
	begin
		offset_reg_en	= 1'b1;
		offset_sel	= 2'b00;
		next_state	= READY;
	end
	else
		next_state	= state;
end

READY:
begin
	ready_cycle	= 1'b1;
	if (ipp_data_req_dly2 & full_hdr_r1)
	begin
		rdmc_wr_data_sel        = 2'b00;
        	rdmc_wr_data_valid_sm   = 1'b1;
        	next_state              = FIRST_HDR;
	end
	else if (muxed_ipp_data_ack & ipp_data_req_dly2)
	begin
		rdmc_wr_data_sel        = 2'b01;
                rdmc_wr_data_valid_sm   = 1'b1;
		if (zcopy_mode)
			next_state	= ZCP_WR_HDR;
		else if (jmb_pkt_type[1]) 
			next_state	= JMB_WR_DATA;
		else
                	next_state      = WR_DATA;
	end
	else
		next_state		= state;
end


FIRST_HDR:
begin
	rdmc_wr_data_sel	= 2'b01;
	rdmc_wr_data_valid_sm	= 1'b1;
	if (jmb_pkt_type[1])	
		 next_state	= JMB_WR_DATA;
	else
		next_state	= WR_DATA;
end

JMB_WR_DATA:
begin
	jmb_wr_cycle_sm		= 1'b1;
	if (muxed_ipp_data_ack & pkt_req_cnt_done_r2 & rdmc_cal_eop_r)//second buf has only one transfer,
	begin							//no need to read ipp
		rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                rdmc_wr_data_comp_sm    = 1'b1;
                next_state              = WAIT_DATA_LAST;
        end

	else if (muxed_ipp_data_ack & pkt_req_cnt_done_r2 & jmb_pkt_type[0] & !jmb_pkt_done)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                rdmc_wr_data_comp_sm    = 1'b1;
		jmb_pkt_done_sm		= 1'b1;
                next_state              = state;
        end

	else if (muxed_ipp_data_ack & pkt_req_cnt_done_r2)
	begin
		rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                rdmc_wr_data_comp_sm    = 1'b1;
                next_state              = WR_DATA;
        end
	else if (muxed_ipp_data_ack)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = state;
	end
	else
	begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b0;
                next_state              = state;
        end
end

WR_DATA:
begin
	if (muxed_ipp_data_ack & rdmc_cal_eop_r & pkt_req_cnt_done_r1)
	begin
		rdmc_wr_data_sel	= 2'b10;
		rdmc_wr_data_valid_sm	= 1'b1;
		next_state		= WR_DATA_LAST;
	end
	else if (muxed_ipp_data_ack & rdmc_cal_eop_r & pkt_req_cnt_done_r2)
	begin
		rdmc_wr_data_sel	= 2'b10;
		rdmc_wr_data_valid_sm	= 1'b1;
		rdmc_wr_data_comp_sm	= 1'b1;
		rdmc_wr_last_comp_sm	= 1'b1;
		if (rdmc_wr_req_accept_hdr | is_rdmc_wr_req_accept)
			next_state	= READY;
		else
			next_state	= IDLE;
	end
	else if (muxed_ipp_data_ack & rdmc_cal_eop_r)
	begin
		rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = WAIT_DATA_LAST;
	end
	else if (muxed_ipp_data_ack)
	begin
		rdmc_wr_data_sel	= 2'b10;
		rdmc_wr_data_valid_sm	= 1'b1;
		next_state		= state;
	end
	else
	begin
		rdmc_wr_data_sel	= 2'b10;
		rdmc_wr_data_valid_sm	= 1'b0;
		next_state		= state;
	end
end

WAIT_DATA_LAST:
begin
	if (pkt_req_cnt_done_r | pkt_req_cnt_done_r1 | pkt_req_cnt_done)
		next_state	= WR_DATA_LAST;
	else
		next_state	= state; 
end

WR_DATA_LAST:
begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                rdmc_wr_data_comp_sm    = 1'b1;
		rdmc_wr_last_comp_sm	= 1'b1;
                if (rdmc_wr_req_accept_hdr | is_rdmc_wr_req_accept)
                        next_state      = READY;
                else
                        next_state      = IDLE;
end

ZCP_WR_HDR:
begin
	if (muxed_ipp_data_ack & ipp_fzcp_eop & pkt_req_cnt_done_r1)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = ZCP_WR_HDR_LAST;
        end
        else if (muxed_ipp_data_ack & ipp_fzcp_eop & pkt_req_cnt_done_r2)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                rdmc_wr_data_comp_sm    = 1'b1;
		offset_reg_en		= 1'b1;
		offset_sel		= 2'b01;
                next_state      	= ZCP_READY;
        end
        else if (muxed_ipp_data_ack & ipp_fzcp_eop)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = WAIT_ZCP_HDR_LAST;
        end
        else if (muxed_ipp_data_ack)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = state;
        end
        else
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b0;
                next_state              = state;
        end
end

WAIT_ZCP_HDR_LAST:
begin
        if (pkt_req_cnt_done_r | pkt_req_cnt_done_r1 | pkt_req_cnt_done)
                next_state      = ZCP_WR_HDR_LAST;
        else
                next_state      = state;
end

ZCP_WR_HDR_LAST:
begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                rdmc_wr_data_comp_sm    = 1'b1;
		offset_reg_en           = 1'b1;
                offset_sel              = 2'b01;
                next_state      	= ZCP_READY;
end

ZCP_READY:
begin
	if (rdmc_wr_req_accept_zcp & zcp_wr_done & ipp_next_eop) 
		next_state	= WAIT_ZCP_DATA_LAST;
	else if (rdmc_wr_req_accept_zcp & zcp_wr_done)
		next_state	= ZCP_WR_DATA;
	else if (rdmc_wr_req_accept_zcp & ipp_next_eop)
	begin
		inc_zcp_wr_cnt	= 1'b1;
		next_state	= WAIT_ZCP_MID_LAST;
	end
	else if (rdmc_wr_req_accept_zcp)
	begin
		inc_zcp_wr_cnt	= 1'b1;
		next_state	= ZCP_WR_MID;
	end
	else
		next_state	= state;
end

ZCP_WR_MID:
begin
	if (muxed_ipp_data_ack & ipp_fzcp_eop & pkt_req_cnt_done_r1)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = ZCP_WR_MID_LAST;
        end
        else if (muxed_ipp_data_ack & ipp_fzcp_eop & pkt_req_cnt_done_r2)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                rdmc_wr_data_comp_sm    = 1'b1;
		offset_reg_en   	= 1'b1;
                offset_sel      	= 2'b10;
                next_state              = ZCP_READY;
        end
        else if (muxed_ipp_data_ack & ipp_fzcp_eop)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = WAIT_ZCP_MID_LAST;
        end
        else if (muxed_ipp_data_ack)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = state;
        end
        else
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b0;
                next_state              = state;
        end
end

WAIT_ZCP_MID_LAST:
begin
        if (pkt_req_cnt_done_r | pkt_req_cnt_done_r1 | pkt_req_cnt_done)
                next_state      = ZCP_WR_MID_LAST;
        else
                next_state      = state;
end

ZCP_WR_MID_LAST:
begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                rdmc_wr_data_comp_sm    = 1'b1;
		offset_reg_en           = 1'b1;
                offset_sel              = 2'b10;
                next_state              = ZCP_READY;
end

ZCP_WR_DATA:
begin
        if (muxed_ipp_data_ack & ipp_fzcp_eop & pkt_req_cnt_done_r1)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = ZCP_WR_DATA_LAST;
        end
        else if (muxed_ipp_data_ack & ipp_fzcp_eop & pkt_req_cnt_done_r2)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                rdmc_wr_data_comp_sm    = 1'b1;
		rdmc_wr_last_comp_sm	= 1'b1;
		offset_reg_en           = 1'b1;
                offset_sel              = 2'b00;

		if (rdmc_wr_req_accept_hdr | is_rdmc_wr_req_accept)
			next_state	= READY;
		else
                	next_state      = IDLE;
        end
        else if (muxed_ipp_data_ack & ipp_fzcp_eop)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = WAIT_ZCP_DATA_LAST;
        end
        else if (muxed_ipp_data_ack)
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                next_state              = state;
        end
        else
        begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b0;
                next_state              = state;
        end
end

WAIT_ZCP_DATA_LAST:
begin
        if (pkt_req_cnt_done_r | pkt_req_cnt_done_r1 | pkt_req_cnt_done)
                next_state      = ZCP_WR_DATA_LAST;
        else
                next_state      = state;
end

ZCP_WR_DATA_LAST:
begin
                rdmc_wr_data_sel        = 2'b10;
                rdmc_wr_data_valid_sm   = 1'b1;
                rdmc_wr_data_comp_sm    = 1'b1;
		rdmc_wr_last_comp_sm	= 1'b1;
		offset_reg_en           = 1'b1;
                offset_sel              = 2'b00;

		if (rdmc_wr_req_accept_hdr | is_rdmc_wr_req_accept)
                        next_state      = READY;
                else
                        next_state      = IDLE;
end


default:
		next_state	= IDLE;

endcase
end


always @ (posedge clk)
if (reset)
        state <= IDLE;
else
        state <= next_state;

always @ (posedge clk)
if (reset)
	ready_cycle_reg <= 1'b0;
else 
	ready_cycle_reg <= ready_cycle;

wire	ready_cycle_p = ready_cycle & !ready_cycle_reg;

always @ (posedge clk)
if (reset)
	is_rdmc_wr_req_accept <= 1'b0;
else if (rdmc_wr_req_accept_hdr)
	is_rdmc_wr_req_accept <= 1'b1;
else if (ready_cycle_p)
	is_rdmc_wr_req_accept <= 1'b0;
else
	is_rdmc_wr_req_accept <= is_rdmc_wr_req_accept;

always @ (posedge clk)
if (reset)
	zcp_wr_cnt <= 2'b0;
else if (ready_cycle)
	zcp_wr_cnt <= 2'b0;
else if (inc_zcp_wr_cnt)
	zcp_wr_cnt <= zcp_wr_cnt + 2'd1;
else
	zcp_wr_cnt <= zcp_wr_cnt;
	
assign zcp_wr_done = (zcp_wr_cnt == zcp_wr_type);

always @ (posedge clk)
if (reset)
        jmb_pkt_done <= 1'b0;
else if (ready_cycle)
        jmb_pkt_done <= 1'b0;
else if (jmb_pkt_done_sm)
        jmb_pkt_done <= 1'b1;
else
        jmb_pkt_done <= jmb_pkt_done;



endmodule





