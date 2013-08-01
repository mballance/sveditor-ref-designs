// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dsn_ucb_flow.v
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
module dmu_dsn_ucb_flow (
                     // Globals //
                     enl2clk, 
                     reset, 
                     // Downstream Path from NCU //
                     ncu_dmu_vld, 
                     ncu_dmu_data, 
                     dmu_ncu_stall, 
                     // Upstream Path to NCU //
                     dmu_ncu_vld, 
                     dmu_ncu_data, 
                     ncu_dmu_stall,
                     // Local CSR RW cmds //
                     rd_req_vld, 
                     wr_req_vld,
                     thr_id_in, 
                     buf_id_in, 
                     addr_in, 
                     data_in, 
                     req_acpted, 
                     // Local CSR Read Retruns //
                     ack_busy, 
                     rd_ack_vld, 
                     rd_nack_vld, 
                     thr_id_out, 
                     buf_id_out, 
                     data_out,
                     ucb2ctl_dbg_grp_a_1
                     );


// Globals
input            enl2clk;
input            reset;

// Downstream from NCU
input            ncu_dmu_vld;
input  [31:0]    ncu_dmu_data;
output           dmu_ncu_stall;

// Upstream to NCU
output           dmu_ncu_vld;
output [31:0]    dmu_ncu_data;
input            ncu_dmu_stall;

// CMDs to local unit
output           rd_req_vld;
output           wr_req_vld;
output [5:0]     thr_id_in;
output [1:0]     buf_id_in;
output [26:0]    addr_in;
output [63:0]    data_in;
input            req_acpted;

// Ack/Nack from local unit
input            rd_ack_vld;
input            rd_nack_vld;
input  [5:0]     thr_id_out;
input  [1:0]     buf_id_out;
input  [63:0]    data_out;
output           ack_busy;

output [`FIRE_DEBUG_WDTH-1:0]          ucb2ctl_dbg_grp_a_1;


// Local signals
wire  [2:0]    unconnected_size_in;   
wire           indata_buf_vld;
wire  [127:0]  indata_buf;
wire           dmu_ncu_stall_a1;

wire           read_pending;
wire           write_pending;

wire           rd_buf;
wire  [1:0]    buf_head_next;
reg  [1:0]    buf_head;
wire           wr_buf;
wire  [1:0]    buf_tail_next;
reg  [1:0]    buf_tail;
wire           buf_full_next;
reg           buf_full;
wire           buf_empty_next;
reg           buf_empty;
wire  [116:0]  req_in;
wire           buf0_en;
reg  [116:0]  buf0;
wire           buf1_en;
reg  [116:0]  buf1;
wire  [116:0]  req_out;
wire           rd_req_vld_nq;
wire           wr_req_vld_nq;

wire           ack_buf_rd;
wire           ack_buf_wr;
reg           ack_buf_vld;
wire           ack_buf_vld_next;
reg           ack_buf_is_nack;
wire  [3:0]    ack_typ_out;
wire  [75:0]   ack_buf_in;
reg  [75:0]   ack_buf;
wire  [3:0]    ack_buf_vec;

wire           outdata_buf_busy;
wire           outdata_buf_wr;
wire  [127:0]  outdata_buf_in;
wire  [3:0]    outdata_vec_in;
   
wire  [12:0]  addr_in_spare;
   
////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
 * Inbound Data
 ************************************************************/
dmu_dsn_ucb_in32 dmu_dsn_ucb_in32 (.reset(reset),
                                   .enl2clk(enl2clk),
                                   .vld(ncu_dmu_vld),
                                   .data(ncu_dmu_data[31:0]),
                                   .stall(dmu_ncu_stall),
                                   .indata_buf_vld(indata_buf_vld),
                                   .indata_buf(indata_buf[127:0]),
                                   .stall_a1(dmu_ncu_stall_a1));

/************************************************************
 * Decode inbound packet type
 ************************************************************/
assign     read_pending = (indata_buf[3:0] == 4'b0100) & indata_buf_vld;

assign     write_pending = (indata_buf[3:0] == 4'b0101) & indata_buf_vld;

assign     dmu_ncu_stall_a1 = (read_pending | write_pending) & buf_full;

/************************************************************
 * Inbound buffer
 ************************************************************/
// Head pointer
assign     rd_buf = req_acpted;
assign     buf_head_next[1:0] = reset ? 2'b01 :
                                rd_buf ? {buf_head[0],buf_head[1]} : buf_head[1:0];
/*
dff #(2) buf_head_ff (.d(buf_head_next[1:0]),
                         .clk(enl2clk),
                         .q(buf_head[1:0]));
*/
  always @(posedge enl2clk ) 
	begin
  	       buf_head[1:0]   <= buf_head_next[1:0];
  end

// Tail pointer
assign     wr_buf = (read_pending | write_pending) & ~buf_full;

assign     buf_tail_next[1:0] = reset ? 2'b01 :
                                wr_buf ? {buf_tail[0], buf_tail[1]} : buf_tail[1:0];
/*
dff #(2) buf_tail_ff (.d(buf_tail_next[1:0]),
                         .clk(enl2clk),
                         .q(buf_tail[1:0]) );
*/
  always @(posedge enl2clk ) 
	begin
               buf_tail[1:0]   <= buf_tail_next[1:0];
        end

// Buffer full
assign     buf_full_next = (buf_head_next[1:0] == buf_tail_next[1:0]) & wr_buf;
/*
dffre #(1) buf_full_ff (.d(buf_full_next),
                            .reset(reset),
                            .en(rd_buf|wr_buf),
                            .clk(enl2clk),
                            .q(buf_full) );
*/
  always @(posedge enl2clk ) begin
        if (reset) begin
                buf_full                 <=      1'b0;
        end
        else begin
    if (rd_buf|wr_buf)   buf_full        <= buf_full_next;
        end
  end

// Buffer empty
assign     buf_empty_next = ((buf_head_next[1:0] == buf_tail_next[1:0]) & rd_buf) | reset;
/*
dffe #(1) buf_empty_ff (.d(buf_empty_next),
                           .en(rd_buf|wr_buf|reset), 
                           .clk(enl2clk),
                           .q(buf_empty) );
*/
  always @(posedge enl2clk ) 
   begin
    if (rd_buf|wr_buf|reset)   	buf_empty        <= buf_empty_next;
  end

assign     req_in[116:0] = {indata_buf[127:64],
                            indata_buf[54:15],
                            indata_buf[14:12],
                            indata_buf[11:10],
                            indata_buf[9:4],
                            write_pending,
                            read_pending};
          
// Buffer 0
assign     buf0_en = buf_tail[0] & wr_buf;
/*
dffe #(117) buf0_ff (.d(req_in[116:0]),
                        .en(buf0_en),
                        .clk(enl2clk),
                        .q(buf0[116:0]));
*/
  always @(posedge enl2clk ) 
	if (reset) begin
    		        buf0[116:0]    <= 117'b0;
	end
	else begin
    if (buf0_en)        buf0[116:0]    <= req_in[116:0];
  end

// Buffer 1
assign buf1_en = buf_tail[1] & wr_buf;
/*
dffe #(117) buf1_ff (.d(req_in[116:0]),
                        .en(buf1_en),
                        .clk(enl2clk),
                        .q(buf1[116:0]));
*/
  always @(posedge enl2clk ) 
	if(reset) begin
    		  buf1[116:0]        <= 117'b0;
	end
	else begin
    if (buf1_en)   buf1[116:0]        <= req_in[116:0];
  end

assign     req_out[116:0] = buf_head[0] ? buf0[116:0] :
                            buf_head[1] ? buf1[116:0] : 117'b0;

   
/************************************************************
* Inbound interface to local unit
************************************************************/
assign     {data_in[63:0],
            addr_in_spare[12:0],addr_in[26:0],
            unconnected_size_in[2:0],
            buf_id_in[1:0],
            thr_id_in[5:0],
            wr_req_vld_nq,
            rd_req_vld_nq} = req_out[116:0];

assign            rd_req_vld = rd_req_vld_nq & ~buf_empty;
assign            wr_req_vld = wr_req_vld_nq & ~buf_empty;
 
 
/************************************************************
 * Outbound Ack/Nack
 ************************************************************/
assign     ack_buf_wr = rd_ack_vld | rd_nack_vld;

assign     ack_buf_vld_next = ack_buf_wr ? 1'b1 :
                              ack_buf_rd ? 1'b0 : ack_buf_vld;
/*
dffr #(1) ack_buf_vld_ff (.d(ack_buf_vld_next),
                              .clk(enl2clk),
                              .reset(reset),
                              .q(ack_buf_vld) );

dffe #(1) ack_buf_is_nack_ff (.d(rd_nack_vld),
                                 .en(ack_buf_wr),
                                 .clk(enl2clk),
                                 .q(ack_buf_is_nack) );
*/
  always @(posedge enl2clk ) begin
        if (reset) begin
                  ack_buf_vld               <=      1'b0;
        end
        else begin
                        ack_buf_vld         <= ack_buf_vld_next;
        end
  end
  always @(posedge enl2clk ) 
	if (reset) begin
    		      ack_buf_is_nack       <= 1'b0;
	end
	else begin
    if (ack_buf_wr)   ack_buf_is_nack       <= rd_nack_vld;
  end


assign     ack_typ_out[3:0] = rd_ack_vld ? 4'b0001: //UCB_READ_ACK
                                           4'b0000; //UCB_READ_NACK
   
assign     ack_buf_in[75:0] = {data_out[63:0],
                               buf_id_out[1:0],
                               thr_id_out[5:0],
                               ack_typ_out[3:0] };
/*   
dffe #(76) ack_buf_ff (.d(ack_buf_in[75:0]),
                          .en(ack_buf_wr),
                          .clk(enl2clk),
                          .q(ack_buf[75:0]) );
*/
  always @(posedge enl2clk ) 
	if (reset) begin
    		       ack_buf[75:0]        <= 76'b0;
	end
	else begin
    if (ack_buf_wr)     ack_buf[75:0]        <= ack_buf_in[75:0];
  end

assign     ack_buf_vec[3:0] = ack_buf_is_nack  ? {2'b00,2'b11} : {4'b1111} ;
   
assign     ack_busy = ack_buf_vld;
   
assign     ack_buf_rd = ~outdata_buf_busy & ack_buf_vld ;

assign     outdata_buf_wr = ack_buf_rd ;

assign     outdata_buf_in[127:0] = {ack_buf[75:12],      //payload 64bit
                                    9'b0,                //reserved [63:55]
                                    40'h00_0000_0000,    //40bit addr [54:15]
                                    3'b000,              //size [14:12]
                                    ack_buf[11:10],      //buf_id 2bit
                                    ack_buf[9:4],        //thr_id 6bit
                                    ack_buf[3:0]};       //type 4bit
   
assign     outdata_vec_in[3:0] = ack_buf_vec[3:0] ;
   
dmu_dsn_ucb_out32 dmu_dsn_ucb_out32 (.reset(reset),
                                     .enl2clk(enl2clk),
                                     .vld(dmu_ncu_vld),
                                     .data(dmu_ncu_data[31:0]),
                                     .stall(ncu_dmu_stall),
                                     .outdata_buf_busy(outdata_buf_busy),
                                     .outdata_buf_wr(outdata_buf_wr),
                                     .outdata_buf_in(outdata_buf_in[127:0]),
                                     .outdata_vec_in(outdata_vec_in[3:0]) );
   
/************************************************************
 * debug--  dbg signals for a sub_sel 1
 ************************************************************/
assign ucb2ctl_dbg_grp_a_1[`FIRE_DEBUG_WDTH-1:0] = {ncu_dmu_vld,dmu_ncu_stall,read_pending,write_pending,
			dmu_ncu_stall_a1,rd_nack_vld,dmu_ncu_vld,ncu_dmu_stall};
          
endmodule // dmu_dsn_ucb_flow


