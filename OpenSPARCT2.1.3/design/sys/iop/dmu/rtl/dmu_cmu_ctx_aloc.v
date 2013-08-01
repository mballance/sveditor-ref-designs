// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cmu_ctx_aloc.v
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
module dmu_cmu_ctx_aloc (
		clk, 	
		rst_l,
        enq,
		data_in,
        deq, 
		data_out,
        valid
     );
     
//************************************************
//				PARAMETERS
//************************************************
   parameter WIDTH = 5;     // max width supported
   parameter DEPTH = 32;    // max depth supported

  integer 	 n;
   
//************************************************
//				PORTS
//************************************************

  input clk;                        // The input clock
  input rst_l;                      // synopsys sync_set_reset "rst_l"

  input enq;                        // enqueue into fifo
  input [WIDTH - 1:0] data_in;      // data to put in

  input deq;                        // dequeue outof fifo
  output [WIDTH - 1:0] data_out;    // data taken out

  output valid;                      // full flag

//************************************************
//				SIGNALS
//************************************************
 
  reg [DEPTH - 1:0] vld;                   // current location has valid data

  reg [WIDTH - 1:0] count;	  	      // # valid contents in fifo   


//*********************************************
// list counter, updates on deq asserted
//*********************************************

always @ (posedge clk)
begin
  if (!rst_l) begin
       count <= 0;
    end
 else begin 
  case (deq)
   1'b0: count <= count;
   1'b1: count <= count + 1'b1;
  endcase
 end
end
//*********************************************
// valid contents, updates when enq asserted
//*********************************************

always @ (posedge clk)
begin
  if (!rst_l) begin
	 for ( n = 0; n < DEPTH ; n = n+1) 
	   vld[n] <= 1'b1;	 
  end
  else begin
     case ({enq, deq}) 	// synopsys parallel_case
       2'b01 : vld[count]   <= 1'b0;
       2'b10 : vld[data_in] <= 1'b1;
       2'b11 : begin
		  vld[data_in] <= 1'b1;
//bug 1908
		  vld[count]   <= 1'b0;
//		  
	   end	   		  
       default : begin
		  for ( n = 0; n < DEPTH ; n = n+1)
			 vld[n] <= vld[n];
	   end
	 endcase // case({enq, deq})	 
  end // else: !if(!rst_l)
end // always @ (posedge clk)
   
//************************************************
// Outputs
//************************************************

  assign data_out = count[WIDTH -1 :0];
  assign valid = vld[count];   

endmodule 

