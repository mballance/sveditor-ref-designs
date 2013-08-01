// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fifo.v
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
module fifo ();

parameter ENTRY_BITS = 5;
parameter DEPTH      = 9;
parameter PTR_BITS   = 4;

reg   [(ENTRY_BITS-1):0] fifo [0:(DEPTH-1)];
reg     [(PTR_BITS-1):0] push_ptr;
reg     [(PTR_BITS-1):0] pop_ptr;

integer                  i;

`ifdef DEBUG_FIFO
  wire [(ENTRY_BITS-1):0] fifo0 = fifo[0];
  wire [(ENTRY_BITS-1):0] fifo1 = fifo[1];
  wire [(ENTRY_BITS-1):0] fifo2 = fifo[2];
  wire [(ENTRY_BITS-1):0] fifo3 = fifo[3];
  wire [(ENTRY_BITS-1):0] fifo4 = fifo[4];
  wire [(ENTRY_BITS-1):0] fifo5 = fifo[5];
  wire [(ENTRY_BITS-1):0] fifo6 = fifo[6];
  wire [(ENTRY_BITS-1):0] fifo7 = fifo[7];
`endif

//----------------------------------------------------------
initial  begin // {
`ifdef PALLADIUM
`else
  #1;
`endif
  push_ptr = 3'b0;
  pop_ptr = 3'b0;
  for (i=0; i<=(DEPTH-1); i=i+1) begin
    fifo[i] = 0;
  end  
end // }

//----------------------------------------------------------
task push_fifo;
input [(ENTRY_BITS-1):0] entry;

  begin
     fifo[push_ptr] <= entry;
     if (push_ptr == (DEPTH-1)) begin // {
        push_ptr <= 3'b0;
        // Check for Overflow
        if (pop_ptr == 3'b0)  begin // {
          `PR_ERROR ("fifo", `ERROR, "FIFO Overflow.");
        end // }
     end // }
     else begin // {
        push_ptr <= push_ptr + 1;
        // Check for Overflow
        if (pop_ptr == push_ptr+1)  begin // {
          `PR_ERROR ("fifo", `ERROR, "FIFO Overflow.");
        end // }
     end // }

  end
endtask

//----------------------------------------------------------
task pop_fifo;
output [(ENTRY_BITS-1):0] entry;

  begin
     // Check for Underflow
     if (pop_ptr == push_ptr) begin
      `PR_ERROR ("fifo", `ERROR, "FIFO Underflow.");
     end

     entry = fifo[pop_ptr];
     fifo[pop_ptr] <= 0;  // clear entry that was popped
     if (pop_ptr == (DEPTH-1)) begin // {
        pop_ptr <= 3'b0;
     end // }
     else begin // {
        pop_ptr <= pop_ptr + 1;
     end // }
  end
endtask

endmodule

//----------------------------------------------------------
//----------------------------------------------------------
