// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dsn_ucb_out32.v
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
module dmu_dsn_ucb_out32 (
                      // Global //
                      enl2clk, 
                      reset, 
                      // UCB bus //
                      vld, 
                      data, 
                      stall, 
                      // Local unit //
                      outdata_buf_busy, 
                      outdata_buf_wr,
                      outdata_buf_in, 
                      outdata_vec_in );


// Globals
input            enl2clk;
input            reset;

// UCB bus interface
output           vld;
output [31:0]    data;
input            stall;

// Local interface
output           outdata_buf_busy;
input            outdata_buf_wr;
input  [127:0]   outdata_buf_in;
input  [3:0]     outdata_vec_in;



// Local signals
reg             stall_d1;
reg  [3:0]      outdata_vec;
wire  [3:0]      outdata_vec_next;
reg  [127:0]    outdata_buf;
wire  [127:0]    outdata_buf_next;
wire             load_outdata;
wire             shift_outdata;


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
* UCB bus interface flops
************************************************************/
assign        vld = outdata_vec[0];
assign        data[31:0] = outdata_buf[31:0];
/*
dffr #(1) stall_d1_ff (.d(stall),
                           .clk(enl2clk),
                           .reset(reset),
                           .q(stall_d1) );
*/
  always @(posedge enl2clk ) begin
        if (reset) begin
                stall_d1                <=      1'b0;
        end
        else begin
                        stall_d1   <= stall;
        end
  end


/************************************************************
* Outbound Data
************************************************************/
// BP 7-26-05 dbg needs reads to be at least 8 cycles apart, verify here
//	with 0in checker
// 0in assert_window -start load_outdata -start_count 1 -stop_count 9 -not_in load_outdata 
// accept new data only if there is none being processed
assign        load_outdata = outdata_buf_wr & ~outdata_buf_busy;

assign        outdata_buf_busy = outdata_vec[0] | stall_d1;

assign        shift_outdata = outdata_vec[0] & ~stall_d1;

assign        outdata_vec_next[3:0] = load_outdata  ? outdata_vec_in[3:0]:
                                      shift_outdata ? (outdata_vec[3:0] >> 1) : 
				                      outdata_vec[3:0];
/*
dffr #(4) outdata_vec_ff (.d(outdata_vec_next[3:0]),
                              .clk(enl2clk),
                              .reset(reset),
                              .q(outdata_vec[3:0]) );
*/
assign        outdata_buf_next[127:0] = load_outdata  ? outdata_buf_in[127:0]:
                                        shift_outdata ? (outdata_buf[127:0] >> 32):  
                                                        outdata_buf[127:0];
/*
dff #(128) outdata_buf_ff (.d(outdata_buf_next[127:0]),
                              .clk(enl2clk),
                              .q(outdata_buf[127:0]) );
*/
  always @(posedge enl2clk ) begin
        if (reset) begin
                outdata_vec[3:0]        <=      4'b0;
        end
        else begin
                        outdata_vec[3:0]   <= outdata_vec_next[3:0];
        end
  end

  always @(posedge enl2clk ) 
        if (reset) begin
                        outdata_buf[127:0] <= 128'b0;
	end
	else begin
                        outdata_buf[127:0] <= outdata_buf_next[127:0];
  end


endmodule // dmu_dsn_ucb_out32






