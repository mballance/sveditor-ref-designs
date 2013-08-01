// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_pio_ucb_out32.v
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
//  Copyright (C) 2003 by Sun Microsystems, Inc.
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
//  Description:        This interface is modified based on Niagra ucb_bus_in.
//                      Instaniated by UCB modules and NCU to receive
//                      packets on the UCB bus. This module supports 32 bit
//                      data bus in.
//            
//  Revision: 1. March 08, 2004 - John Lo
//               Changed modules name from 
//               ucb_bus_out32_niu.v to niu_pio_ucb_out32
//
//               Changed enl2clk to clk.
//
//                      
////////////////////////////////////////////////////////////////////////////////


module niu_pio_ucb_out32 (
                      // Global //
                      clk, 
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
input            clk;
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
wire             stall_d1;
wire  [3:0]      outdata_vec;
wire  [3:0]      outdata_vec_next;
wire  [127:0]    outdata_buf;
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

dffr #(1) stall_d1_ff (.d(stall),
                           .clk(clk),
                           .reset(reset),
                           .q(stall_d1) );


/************************************************************
* Outbound Data
************************************************************/
// accept new data only if there is none being processed
assign        load_outdata = outdata_buf_wr & ~outdata_buf_busy;

assign        outdata_buf_busy = outdata_vec[0] | stall_d1;

assign        shift_outdata = outdata_vec[0] & ~stall_d1;

assign        outdata_vec_next[3:0] = load_outdata  ? outdata_vec_in[3:0]:
                                      shift_outdata ? (outdata_vec[3:0] >> 1) : 
				                      outdata_vec[3:0];

dffr #(4) outdata_vec_ff (.d(outdata_vec_next[3:0]),
                              .clk(clk),
                              .reset(reset),
                              .q(outdata_vec[3:0]) );

assign        outdata_buf_next[127:0] = load_outdata  ? outdata_buf_in[127:0]:
                                        shift_outdata ? (outdata_buf[127:0] >> 32):  
                                                        outdata_buf[127:0];
df1 #(96) outdata_buf_msw_ff (.d(outdata_buf_next[127:32]),
                              .clk(clk),
                              .q(outdata_buf[127:32]) );

dffr #(32) outdata_buf_lsw_ff (.d(outdata_buf_next[31:0]),
                              .clk(clk),
			      .reset(reset),
                              .q(outdata_buf[31:0]) );


endmodule // niu_pio_ucb_out32







