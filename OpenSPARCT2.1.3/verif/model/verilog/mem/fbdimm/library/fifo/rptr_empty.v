// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rptr_empty.v
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
module rptr_empty (rempty,raddr,rptr,rwptr2,rinc,rclk,rrst_n);
parameter ADDRSIZE=6;

output                rempty;
output [ADDRSIZE-1:0] raddr;
output [ADDRSIZE:0]   rptr;
input  [ADDRSIZE:0]   rwptr2;
input                 rinc,rclk,rrst_n;
reg   [ADDRSIZE:0]    rptr,rbin,rgnext,rbnext;
reg                     rempty,raddrmsb;

// Gray style pointer

always @(posedge rclk or negedge rrst_n)
 if ( !rrst_n) begin
    rptr <=0;
    raddrmsb <= 0;
  end
 else begin
   rptr <= rgnext;
   raddrmsb <= rgnext[ADDRSIZE]^rgnext[ADDRSIZE-1];
 end

always @(rptr or rinc or rempty ) begin: Gray_inc
  integer i;
  for (i=0; i <= ADDRSIZE; i=i+1)
    rbin[i] = ^(rptr>>i);
  if (!rempty ) rbnext = rbin + rinc;
   else  rbnext = rbin;
  rgnext = (rbnext >> 1) ^ rbnext;
end

// memory read address pointer
assign raddr = { raddrmsb,rptr[ADDRSIZE-2:0]};

// fifo empty on reset or when next rptr == synced wptr

always @(posedge rclk or negedge rrst_n)
  if (!rrst_n ) rempty <= 1'b1;
  else          rempty <= (rgnext == rwptr2);
endmodule
 
