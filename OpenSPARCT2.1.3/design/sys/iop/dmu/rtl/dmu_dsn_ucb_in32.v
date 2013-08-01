// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dsn_ucb_in32.v
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
module dmu_dsn_ucb_in32 (
                     // Global //
                     reset, 
                     enl2clk, 
                     // UCB bus //
                     vld, 
                     data, 
                     stall, 
                     // local unit //
                     indata_buf_vld, 
                     indata_buf, 
                     stall_a1 );

// Global interface
input          reset;
input          enl2clk;


// UCB bus interface
input          vld;
input  [31:0]  data;
output         stall;


// Local interface
output         indata_buf_vld;
output [127:0] indata_buf;
input          stall_a1;

// Internal signals
reg           vld_d1;
reg           stall;
reg           stall_d1;
reg  [31:0]   data_d1;
wire           skid_buf0_en;
reg           vld_buf0;
reg  [31:0]   data_buf0;
reg           skid_buf1_en;
reg           vld_buf1;
reg  [31:0]   data_buf1;
wire           skid_buf0_sel;
reg           skid_buf1_sel;
wire           vld_mux;
wire  [31:0]   data_mux;
wire  [3:0]    indata_vec_next;
reg  [3:0]    indata_vec;
wire  [127:0]  indata_buf_next;
reg           indata_vec0_d1;
wire           stall_a1_inv;
reg [127:0]   indata_buf;


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
 * UCB bus interface flops
 * This is to make signals going between NCU and UCB flop-to-flop
 * to improve timing.
 ************************************************************/
/*
dffre #(1) vld_d1_ff (.d(vld),
                          .reset(reset),
                          .en(~stall_d1),
                          .clk(enl2clk),
                          .q(vld_d1) );

dffe #(32) data_d1_ff (.d(data[31:0]),
                          .en(~stall_d1),
                          .clk(enl2clk),
                          .q(data_d1[31:0]) );

dffr #(1) stall_ff   (.d(stall_a1),
                          .clk(enl2clk),
                          .reset(reset),
                          .q(stall) );

dffr #(1) stall_d1_ff (.d(stall),
                           .clk(enl2clk),
                           .reset(reset),
                           .q(stall_d1) );
*/
  always @(posedge enl2clk ) begin
	if (reset) begin
		vld_d1 	<=	1'b0;
		stall	<=	1'b0;
		stall_d1<=	1'b0;
	end
	else begin
    if (~stall_d1)      vld_d1 		<= vld;
    		 	stall 		<= stall_a1;
    			stall_d1 	<= stall;
  	end
  end

  always @(posedge enl2clk ) 
	if (reset) begin
    			data_d1[31:0] 	<= 32'b0;
	end
    else begin
	if (~stall_d1)	data_d1[31:0] 	<= data[31:0];
 	end 

/************************************************************
 * Skid buffer
 * We need a two deep skid buffer to handle stalling.
 ************************************************************/
// Assertion: stall has to be deasserted for more than 1 cycle
//            ie time between two separate stalls has to be
//            at least two cycles.  Otherwise, contents from
//            skid buffer will be lost.

// Buffer 0
assign         skid_buf0_en = stall_a1 & ~stall;
/*
dffre #(1) vld_buf0_ff (.d(vld_d1),
                            .reset(reset),
                            .en(skid_buf0_en),
                            .clk(enl2clk),
                            .q(vld_buf0) );

dffe #(32) data_buf0_ff (.d(data_d1[31:0]),
                            .en(skid_buf0_en),
                            .clk(enl2clk),
                            .q(data_buf0[31:0]) );

// Buffer 1
dffr #(1) skid_buf1_en_ff (.d(skid_buf0_en),
                               .clk(enl2clk),
                               .reset(reset),
                               .q(skid_buf1_en) );

dffre #(1) vld_buf1_ff (.d(vld_d1),
                            .reset(reset),
                            .en(skid_buf1_en),
                            .clk(enl2clk),
                            .q(vld_buf1) );

dffe #(32) data_buf1_ff (.d(data_d1[31:0]),
                            .en(skid_buf1_en),
                            .clk(enl2clk),
                            .q(data_buf1[31:0]) );
*/

  always @(posedge enl2clk ) begin
        if (reset) begin
                vld_buf0  		<=      1'b0;
                skid_buf1_en   		<=      1'b0;
                vld_buf1		<=      1'b0;
        end
        else begin
    if (skid_buf0_en)   vld_buf0        <= vld_d1;
                        skid_buf1_en   <= skid_buf0_en;
    if (skid_buf1_en)   vld_buf1       <= vld_d1;
        end
  end

  always @(posedge enl2clk ) 
        if (reset) begin
       			data_buf0[31:0]<= 32'b0;
    			data_buf1[31:0]<= 32'b0;
  end
    else begin
    if (skid_buf0_en)   data_buf0[31:0]<= data_d1[31:0];
    if (skid_buf1_en)   data_buf1[31:0]<= data_d1[31:0];
	end

/************************************************************
 * Mux between skid buffer and interface flop
 ************************************************************/
// Assertion: stall has to be deasserted for more than 1 cycle
//            ie time between two separate stalls has to be
//            at least two cycles.  Otherwise, contents from
//            skid buffer will be lost.

assign        skid_buf0_sel = ~stall_a1 & stall;
/*
dffr #(1) skid_buf1_sel_ff (.d(skid_buf0_sel),
                                .clk(enl2clk),
                                .reset(reset),
                                .q(skid_buf1_sel) );
*/
  always @(posedge enl2clk ) begin
        if (reset) begin
                skid_buf1_sel           <=      1'b0;
        end
        else begin
                        skid_buf1_sel   <= skid_buf0_sel;
        end
  end

assign        vld_mux = skid_buf0_sel ? vld_buf0 :
                        skid_buf1_sel ? vld_buf1 : vld_d1;

assign        data_mux[31:0] = skid_buf0_sel ? data_buf0[31:0] :
                               skid_buf1_sel ? data_buf1[31:0] : data_d1[31:0];


/************************************************************
 * Assemble inbound data
 ************************************************************/
// valid vector
assign         indata_vec_next[3:0] = {vld_mux,indata_vec[3:1]};
assign         stall_a1_inv = ~stall_a1 ;
/*
dffre #(4) indata_vec_ff (.d(indata_vec_next[3:0]),
                              .en(stall_a1_inv),
                              .reset(reset),
                              .clk(enl2clk),
                              .q(indata_vec[3:0]) );
*/
// data buffer
assign  indata_buf_next[127:0] = {data_mux[31:0],indata_buf[127:32]};
/*
dffe #(128) indata_buf_ff (.d(indata_buf_next[127:0]),
                              .en(stall_a1_inv),
                              .clk(enl2clk),
                              .q(indata_buf[127:0]) );
*/
// detect a new packet  
/*
dffre #(1) indata_vec0_d1_ff (.d(indata_vec[0]),
                                  .reset(reset),
                                  .en(stall_a1_inv),
                                  .clk(enl2clk),
                                  .q(indata_vec0_d1) );
*/
  always @(posedge enl2clk ) 
        if (reset) begin
                indata_vec[3:0]         <=      4'b0;
                indata_vec0_d1          <=      1'b0;
        end
        else begin
    if (stall_a1_inv)   indata_vec[3:0] <= indata_vec_next[3:0];
    if (stall_a1_inv)   indata_vec0_d1       <= indata_vec[0];
        end

  always @(posedge enl2clk ) 
        if (reset) begin
   			indata_buf[127:0]<= 128'b0;
	end
	else begin
   if (stall_a1_inv)    indata_buf[127:0]<= indata_buf_next[127:0];
  end


assign        indata_buf_vld = indata_vec[0] & ~indata_vec0_d1;


endmodule // dmu_dsn_ucb_in32
