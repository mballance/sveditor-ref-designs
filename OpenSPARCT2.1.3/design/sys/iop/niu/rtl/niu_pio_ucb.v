// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_ucb.v
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
////////////////////////////////////////////////////////////////////////////////
// 
//
//  Copyright (C) 2020 by Sun Microsystems, Inc.
//
//  All rights reserved. No part of this design may be reproduced,
//  stored in a retrieval system, or transmitted, in any form or by
//  any means, electronic, mechanical, photocopying, recording, or
//  otherwise, without prior written permission of Sun Microsystems,
//  Inc.
//
//  Sun Proprietary/Confidential
//
//
//  Primary Contact:    Jimmy.Lau@sun.com x48745 
//  Description:        Unit Control Block for NIU interface to NCU, 
//                      basing on Niagra design's ucb_flow_jbi module.
//                      This module is customized for N2's NIU block.
//
//                      - provides 1+2 deep buffer for incoming requests
//                        from NCU
//                      - provides single buffer for returns going back to
//                        NCU
//                      - Downstream data bus width : 32' + 2' control
//                      - Upstream data bus widht : 32' + 2' control
//
//  Revision: 1. March 08, 2004 - John Lo
//               Changed modules name from 
//               ucb_bus_in32_niu.v  to niu_pio_ucb_in32
//               ucb_bus_out32_niu.v to niu_pio_ucb_out32
//               ucb_flow_niu.v      to niu_pio_ucb
//
//               Changed enl2clk to clk.
//
//
//  Revision: 2. September 01, 2004 - Jimmy Lau
//               Changed addr_in from [39:0] to [25:0].
//
//                      
////////////////////////////////////////////////////////////////////////////////




module niu_pio_ucb  (
                     // Globals //
                     niu_clk, 
                     niu_reset_l, 
                     // Downstream Path from NCU //
                     ncu_niu_vld, 
                     ncu_niu_data, 
                     niu_ncu_stall, 
                     // Upstream Path to NCU //
                     niu_ncu_vld, 
                     niu_ncu_data, 
                     ncu_niu_stall,
                     // Local CSR RW cmds //
                     rd_req_vld, 
                     wr_req_vld,
                     thr_id_in, 
                     buf_id_in, 
                     addr_in, 
                     data_in, 
                     req_accepted, 
                     // Local CSR Read Retruns //
                     rack_busy, 
                     rd_ack_vld, 
                     rd_nack_vld, 
                     thr_id_out, 
                     buf_id_out, 
                     data_out, 
                     // Local INT //
                     int_busy, 
                     int_vld, 
                     dev_id 
                     );


// Globals
input            niu_clk;
input            niu_reset_l;

// Downstream from NCU
input            ncu_niu_vld;
input  [31:0]    ncu_niu_data;
output           niu_ncu_stall;

// Upstream to NCU
output           niu_ncu_vld;
output [31:0]    niu_ncu_data;
input            ncu_niu_stall;

// CMDs to local unit
output           rd_req_vld;
output           wr_req_vld;
output [5:0]     thr_id_in;
output [1:0]     buf_id_in;
output [26:0]    addr_in;
output [63:0]    data_in;
input            req_accepted;

// Ack/Nack from local unit
input            rd_ack_vld;
input            rd_nack_vld;
input  [5:0]     thr_id_out;
input  [1:0]     buf_id_out;
input  [63:0]    data_out;
output           rack_busy;

// Interrupt from local unit
input            int_vld;
input  [6:0]     dev_id;       // interrupt device ID
output           int_busy;
  



// Local signals
wire  [2:0]    unconnected_size_in;   
wire  [12:0]   unconnected_addr_39_27;
wire  [8:0]    unconnected_rsvd;
wire           indata_buf_vld;
wire  [127:0]  indata_buf;
wire           niu_ncu_stall_a1;

wire           read_pending;
wire           write_pending;

wire           rd_buf;
wire  [1:0]    buf_head_next;
wire  [1:0]    buf_head;
wire           wr_buf;
wire  [1:0]    buf_tail_next;
wire  [1:0]    buf_tail;
wire           buf_full_next;
wire           buf_full;
wire           buf_empty_next;
wire           buf_empty;
wire  [103:0]  req_in;
wire           buf0_en;
wire  [103:0]  buf0;
wire           buf1_en;
wire  [103:0]  buf1;
wire  [103:0]  req_out;
wire           rd_req_vld_nq;
wire           wr_req_vld_nq;

wire           ack_buf_rd;
wire           ack_buf_wr;
wire           ack_buf_vld;
wire           ack_buf_vld_next;
wire           ack_buf_is_nack;
wire  [3:0]    ack_typ_out;
wire  [75:0]   ack_buf_in;
wire  [75:0]   ack_buf;
wire  [3:0]    ack_buf_vec;

wire           int_buf_rd;
wire           int_buf_wr;
wire           int_buf_vld;
wire           int_buf_vld_next;
//wire  [56:0]   int_buf_in;
//wire  [56:0]   int_buf;
wire  [6:0]    int_buf_in;
wire  [6:0]    int_buf;
wire  [3:0]    int_buf_vec;

wire           int_last_rd;
wire           outdata_buf_busy;
wire           outdata_buf_wr;
wire  [127:0]  outdata_buf_in;
wire  [3:0]    outdata_vec_in;
   
   
////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
 * Inbound Data
 ************************************************************/
niu_pio_ucb_in32 niu_pio_ucb_in32 (.reset(niu_reset_l),
                                   .clk(niu_clk),
                                   .vld(ncu_niu_vld),
                                   .data(ncu_niu_data[31:0]),
                                   .stall(niu_ncu_stall),
                                   .indata_buf_vld(indata_buf_vld),
                                   .indata_buf(indata_buf[127:0]),
                                   .stall_a1(niu_ncu_stall_a1));

/************************************************************
 * Decode inbound packet type
 ************************************************************/
assign     read_pending = (indata_buf[3:0] == 4'b0100) & indata_buf_vld;

assign     write_pending = (indata_buf[3:0] == 4'b0101) & indata_buf_vld;

assign     niu_ncu_stall_a1 = (read_pending | write_pending) & buf_full;

/************************************************************
 * Inbound buffer
 ************************************************************/
// Head pointer
assign     rd_buf = req_accepted;
assign     buf_head_next[1:0] = niu_reset_l ? 2'b01 :
                                rd_buf ? {buf_head[0],buf_head[1]} : buf_head[1:0];

df1 #(2) buf_head_ff (.d(buf_head_next[1:0]),
                         .clk(niu_clk),
                         .q(buf_head[1:0]));

// Tail pointer
assign     wr_buf = (read_pending | write_pending) & ~buf_full;

assign     buf_tail_next[1:0] = niu_reset_l ? 2'b01 :
                                wr_buf ? {buf_tail[0], buf_tail[1]} : buf_tail[1:0];

df1 #(2) buf_tail_ff (.d(buf_tail_next[1:0]),
                         .clk(niu_clk),
                         .q(buf_tail[1:0]) );

// Buffer full
assign     buf_full_next = (buf_head_next[1:0] == buf_tail_next[1:0]) & wr_buf;
dffre #(1) buf_full_ff (.d(buf_full_next),
                            .reset(niu_reset_l),
                            .en(rd_buf|wr_buf),
                            .clk(niu_clk),
                            .q(buf_full) );

// Buffer empty
assign     buf_empty_next = ((buf_head_next[1:0] == buf_tail_next[1:0]) & rd_buf) | niu_reset_l;
dffe #(1) buf_empty_ff (.d(buf_empty_next),
                           .en(rd_buf|wr_buf|niu_reset_l), 
                           .clk(niu_clk),
                           .q(buf_empty) );

assign     unconnected_addr_39_27[12:0] = indata_buf[54:42];
assign     unconnected_rsvd[8:0] = indata_buf[63:55];
assign     req_in[103:0] = {indata_buf[127:64],
                            indata_buf[41:15],
                            indata_buf[14:12],
                            indata_buf[11:10],
                            indata_buf[9:4],
                            write_pending,
                            read_pending};
          
// Buffer 0
assign     buf0_en = buf_tail[0] & wr_buf;
dffre #(104) buf0_ff (.d(req_in[103:0]),
		        .reset(niu_reset_l),
                        .en(buf0_en),
                        .clk(niu_clk),
                        .q(buf0[103:0]));
// Buffer 1
assign buf1_en = buf_tail[1] & wr_buf;
dffre #(104) buf1_ff (.d(req_in[103:0]),
		        .reset(niu_reset_l),
                        .en(buf1_en),
                        .clk(niu_clk),
                        .q(buf1[103:0]));

assign     req_out[103:0] = buf_head[0] ? buf0[103:0] :
                            buf_head[1] ? buf1[103:0] : 104'b0;

   
/************************************************************
* Inbound interface to local unit
************************************************************/
assign     {data_in[7:0],
            data_in[15:8],
            data_in[23:16],
            data_in[31:24],
            data_in[39:32],
            data_in[47:40],
            data_in[55:48],
            data_in[63:56],
            addr_in[26:0],
            unconnected_size_in[2:0],
            buf_id_in[1:0],
            thr_id_in[5:0],
            wr_req_vld_nq,
            rd_req_vld_nq} = req_out[103:0];

assign            rd_req_vld = rd_req_vld_nq & ~buf_empty;
assign            wr_req_vld = wr_req_vld_nq & ~buf_empty;
 
 
/************************************************************
 * Outbound Ack/Nack
 ************************************************************/
assign     ack_buf_wr = rd_ack_vld | rd_nack_vld;

assign     ack_buf_vld_next = ack_buf_wr ? 1'b1 :
                              ack_buf_rd ? 1'b0 : ack_buf_vld;

dffr #(1) ack_buf_vld_ff (.d(ack_buf_vld_next),
                              .clk(niu_clk),
                              .reset(niu_reset_l),
                              .q(ack_buf_vld) );

dffre #(1) ack_buf_is_nack_ff (.d(rd_nack_vld),
		                 .reset(niu_reset_l),
                                 .en(ack_buf_wr),
                                 .clk(niu_clk),
                                 .q(ack_buf_is_nack) );

assign     ack_typ_out[3:0] = rd_ack_vld ? 4'b0001: //UCB_READ_ACK
                                           4'b0000; //UCB_READ_NACK
   
assign     ack_buf_in[75:0] = {data_out[7:0],
                               data_out[15:8],
                               data_out[23:16],
                               data_out[31:24],
                               data_out[39:32],
                               data_out[47:40],
                               data_out[55:48],
                               data_out[63:56],
                               buf_id_out[1:0],
                               thr_id_out[5:0],
                               ack_typ_out[3:0] };
   
dffre #(76) ack_buf_ff (.d(ack_buf_in[75:0]),
		        .reset(niu_reset_l),
                          .en(ack_buf_wr),
                          .clk(niu_clk),
                          .q(ack_buf[75:0]) );

assign     ack_buf_vec[3:0] = ack_buf_is_nack  ? {2'b00,2'b11} : {4'b1111} ;
   
assign     rack_busy = ack_buf_vld;
   

/************************************************************
 * Outbound Interrupt
 ************************************************************/
assign     int_buf_wr = int_vld;
   
assign     int_buf_vld_next = int_buf_wr ? 1'b1 :
                                    int_buf_rd ? 1'b0 : int_buf_vld;
   
dffr #(1) int_buf_vld_ff (.d(int_buf_vld_next),
                              .clk(niu_clk),
                              .reset(niu_reset_l),
                              .q(int_buf_vld));

/*
assign     int_buf_in[56:0] = {int_vec[5:0],    
                               int_stat[31:0],   
                               dev_id[8:0],
                               int_thr_id[5:0],    
                               int_typ};  
*/

assign     int_buf_in[6:0] = dev_id[6:0] ;

dffre #(7) int_buf_ff (.d(int_buf_in[6:0]),
                         .reset(niu_reset_l),
                         .en(int_buf_wr),
                         .clk(niu_clk),
                         .q(int_buf[6:0]));

assign     int_buf_vec = {2'b00,2'b11};

assign     int_busy = int_buf_vld;


/************************************************************
 * Outbound ack/interrupt Arbitration
 ************************************************************/
dffre #(1) int_last_rd_ff (.d(int_buf_rd),
                               .en(ack_buf_rd|int_buf_rd),
                               .reset(niu_reset_l),
                               .clk(niu_clk),
                               .q(int_last_rd));
                           
assign     ack_buf_rd = ~outdata_buf_busy & ack_buf_vld &
                          (~int_buf_vld | int_last_rd);

assign     int_buf_rd = ~outdata_buf_busy & int_buf_vld &
                          (~ack_buf_vld | ~int_last_rd);

assign     outdata_buf_wr = ack_buf_rd | int_buf_rd;

assign     outdata_buf_in[127:0] = ack_buf_rd ? {ack_buf[75:12],      //payload 64bit
                                                 9'b0,                //reserved [63:55]
                                                 40'h00_0000_0000,    //40bit addr [54:15]
                                                 3'b000,              //size [14:12]
                                                 ack_buf[11:10],      //buf_id 2bit
                                                 ack_buf[9:4],        //thr_id 6bit
                                                 ack_buf[3:0]}:       //type 4bit
                                                {64'h0000_0000_0000_0000,
                                                 7'b000_0000,         // reserved[63:57]
                                                 6'b0,                //int_vec 6bit
                                                 32'b0,               //int_stat 32bit
                                                 {2'b0,int_buf[6:0]}, //dev_id 9bit
                                                 6'b0,                //thr_id 6bit
                                                 4'b1000};     //pkt_typ 4bit,plain int
   
assign     outdata_vec_in[3:0] = ack_buf_rd ? ack_buf_vec[3:0] : int_buf_vec[3:0] ;
   
niu_pio_ucb_out32 niu_pio_ucb_out32 (.reset(niu_reset_l),
                                     .clk(niu_clk),
                                     .vld(niu_ncu_vld),
                                     .data(niu_ncu_data[31:0]),
                                     .stall(ncu_niu_stall),
                                     .outdata_buf_busy(outdata_buf_busy),
                                     .outdata_buf_wr(outdata_buf_wr),
                                     .outdata_buf_in(outdata_buf_in[127:0]),
                                     .outdata_vec_in(outdata_vec_in[3:0]) );
   
          
endmodule 


