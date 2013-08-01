// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cmu_ctx_clstreg_array.v
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
module dmu_cmu_ctx_clstreg_array (
		clk, 	
		rst_l,
		addr,
		data_in, 
		rw,
		data_out
		);
     
//************************************************
//				PARAMETERS
//************************************************

  parameter WIDTH 	 = 8,
			DEPTH 	 = 8,
			ADDR_WDTH = 3;

//************************************************
//				PORTS
//************************************************

  input clk;                             // input clock
  input rst_l;                           // synopsys sync_set_reset "rst_l"
  
  input [ADDR_WDTH -1 :0] addr;
  input [WIDTH -1 :0] data_in;          // input data
  input rw;                             // syncronous write strobe
  output [WIDTH - 1:0] data_out;        // output data 


// Flop Array    

  reg [WIDTH -1 :0] reg_array[0 :DEPTH -1];    	// The fifo storge arrary

   integer i;
   
   
//************************************************
//				SIGNALS
//************************************************

  
//************************************************
// Zero In checkers
//************************************************ 

// *************** Procedures *************************************/
    // Write access, put the data on the input bus into
    // the location referenced by the write pointer.
    // Write contention is guaranteed not to happen
    // because accessing agents never access same address

always @(posedge clk) begin
	if(~rst_l) begin : reg_reset
		integer j;
		for(j=0; j < DEPTH; j=j+1)
		begin
		  reg_array[j] <= {WIDTH{1'b0}};
		end
	end
      else begin
	 if (rw) begin           //rw = 1 to write
		reg_array[addr] <=  data_in;
	         end
	 else begin
		for(i=0; i < DEPTH; i=i+1)
		  reg_array[i] <= reg_array[i];
	      end
	   end
  end // always @ (posedge clk)   

// ***********************Assignments *****************************/


//***********************************************
// A read returns data referenced by the read pointer
//************************************************

assign data_out = reg_array[addr];
	 
endmodule // dmu_cmu_ctx_clstreg_array



