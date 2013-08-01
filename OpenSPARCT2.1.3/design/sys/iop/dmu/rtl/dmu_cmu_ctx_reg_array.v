// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cmu_ctx_reg_array.v
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
module dmu_cmu_ctx_reg_array (
                clk,
                rst_l,
                addr0,
                data0_in,
                rw0,
                data0_out,
                addr1,
                data1_in,
                rw1,
                data1_out
                );

//************************************************
//                              PARAMETERS
//************************************************

  parameter WIDTH    = 5,
            DEPTH    = 8,
           ADDR_WDTH = 3;

//************************************************
//                              PORTS
//************************************************

  input clk;                             // input clock
  input rst_l;                           // synopsys sync_set_reset "rst_l"
   
  input [ADDR_WDTH -1 :0] addr0;
  input [WIDTH -1 :0] data0_in;          // input data
  input rw0;                             // syncronous write strobe
  output [WIDTH - 1:0] data0_out;        // output data

  input [ADDR_WDTH -1 :0] addr1;
  input [WIDTH -1 :0] data1_in;          // input data
  input rw1;                             // syncronous write strobe
  output [WIDTH -1 :0] data1_out;        // output data


// Flop Array

  reg [WIDTH -1 :0] reg_array[0 :DEPTH -1];     // The fifo storge arrary

   integer i;


//************************************************
//                              SIGNALS
//************************************************


//************************************************
// Zero In checkers
//************************************************

// *************** Procedures *************************************/
    // Write access, put the data on the input bus into
    // the location referenced by the write pointer.
    // Write contention is guaranteed not to happen
    // because accessing agents never access same address

always @(posedge clk)
	if(~rst_l) begin : reg_array_rst
		integer j;
		 for(j=0; j < DEPTH; j=j+1)
		begin
		  reg_array[j] <= {WIDTH{1'b0}};
		end
	end
  else begin
	 case({rw0,rw1}) // synopsys parallel_case
      2'b00 : begin
		 for(i=0; i < DEPTH; i=i+1)
		  reg_array[i] <= reg_array[i];
	  end
	  2'b10 : reg_array[addr0] <=  data0_in;
	  2'b01 : reg_array[addr1] <=  data1_in;
	  2'b11 : begin
		 reg_array[addr0] <=  data0_in;
		 reg_array[addr1] <=  data1_in;
	  end	   
	 endcase // case({rw0,rw1})
  end // always @ (posedge clk)   

// ***********************Assignments *****************************/


//***********************************************
// A read returns data referenced by the read pointer
//************************************************

assign data0_out = reg_array[addr0];
assign data1_out = reg_array[addr1];

endmodule // dmu_cmu_ctx_reg_array
