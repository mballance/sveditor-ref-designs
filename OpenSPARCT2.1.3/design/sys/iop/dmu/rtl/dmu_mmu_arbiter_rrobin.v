// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mmu_arbiter_rrobin.v
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
module dmu_mmu_arbiter_rrobin (
      next_grant,
      csr_done,
//      csreq_pending,
//      lkupreq_pending,
      clk,
      rst_l,
      csrequest
);


output next_grant;
//output lkupreq_pending, csreq_pending;
output csr_done;
input csrequest;
input clk, rst_l;


reg  curr_grant;
reg  curr_grant_d1;
reg  ram_done;
reg ram_done_d1;

// assign lkup_deque = ram_done & next_grant;
// assign lkup_deque = next_grant;
assign csr_done   = ram_done_d1 & ~curr_grant_d1;

always @(posedge clk) begin
    if (!rst_l) begin
       curr_grant <= 1'b0;
       curr_grant_d1 <= 1'b0;
    end
    else begin
       curr_grant <= next_grant;
       curr_grant_d1 <= curr_grant;
    end
  end


// wire lkup_mux_out = lkupreq ? ~next_grant : 1'b0;
// wire csr_mux_out = csrequest ? next_grant : 1'b0;

assign next_grant = csrequest ? 1'b0 : 1'b1;


// always @(posedge clk) begin
//     if (!rst_l) 
//        lkupreq_pending <= 1'b0;
//     else 
//        lkupreq_pending <= lkup_mux_out;
//   end

// always @(posedge clk) begin
//     if (!rst_l) 
//        csreq_pending <= 1'b0;
//     else 
//        csreq_pending <= csr_mux_out;
//   end

always @(posedge clk) begin
    if (!rst_l) begin
       ram_done_d1 <= 1'b0;
       ram_done <= 1'b0;
    end
    else  begin
//        ram_done_d1 <= ram_done & ~next_grant;
       ram_done <= ~next_grant;
       ram_done_d1 <= ram_done;
    end
  end

// always @(curr_grant or lkupreq or
//          csrequest or lkupreq_pending or
//          csreq_pending ) begin

//     next_grant = curr_grant;
//     ram_done = 1'b0;
        
//        casex ({lkupreq_pending,csreq_pending,lkupreq,csrequest})
//          4'b10xx : begin
//                    next_grant = 1'b1;
//                    ram_done = 1'b1;
//                    end
//          4'b01xx : begin
//                    next_grant = 1'b0;
//                    ram_done = 1'b1;
//                    end
//          4'b11xx : begin
//                    next_grant = 1'b0;
//                    ram_done = 1'b1;
//                    end
//          4'b0010 : begin
//                    next_grant = 1'b1;
//                    ram_done = 1'b1;
//                    end
//          4'b0001 : begin
//                    next_grant = 1'b0;
//                    ram_done = 1'b1;
//                    end
//          4'b0011 : begin
//                    next_grant = 1'b0;
//                    ram_done = 1'b1;
//                    end
//          4'b0000 : begin
//                    next_grant = curr_grant;
//                    ram_done = 1'b0;
//                    end
//          default : next_grant = 1'bx;
//          endcase
//    end
endmodule
