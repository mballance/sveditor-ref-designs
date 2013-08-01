// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_common_simple_fifo.v
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
module dmu_common_simple_fifo (
		clk, 	
		rst_l,
		
		data_in, 
		write,
		
		data_out,
		read, 
		
		fifo_full,
		fifo_almost_full,
		fifo_empty
		
     );
     
     
//############################################################################
//				PARAMETERS
//############################################################################ 
parameter FIFO_WIDTH 		= 131;
parameter FIFO_DEPTH 		= 4'd8;
parameter FIFO_PTR_WDTH 	= 3;
parameter FIFO_DEPTH_MINUS_ONE 	= 3'd7;


//############################################################################
//				PORT DECLARATIONS
//############################################################################

  input clk;                             // The input clock
  input rst_l;                           // The fifo rst_l

  input [FIFO_WIDTH - 1:0] data_in;      // The input data
  input write;                           // The syncronous write strobe
 
  output [FIFO_WIDTH - 1:0] data_out;    // The output data 
  input read;                            // The syncronous read strobe

  output fifo_full;                      // The fifo full flag
  output fifo_almost_full;               // The fifo almost full flag (full -1) 
  output fifo_empty;                     // The fifo empty flag
 

//############################################################################
//				SIGNAL DECLARATIONS
//############################################################################
 
  //**************************************************
  // Registers that Are Flops 
  //**************************************************
  reg [FIFO_WIDTH - 1:0] fifo_ram[0:FIFO_DEPTH -1];    	// The fifo storge arrary
  reg [FIFO_PTR_WDTH - 1:0] wr_ptr, rd_ptr;	       	// Read and write pointers 
  reg [FIFO_PTR_WDTH:0] fifo_count;		  	// Number of entries in fifo
  reg over_flow_err, under_flow_err; 			// Under flow and over flow errors 
  
  
  //**************************************************
  // Registers that Are NOT Flops 
  //**************************************************
  reg [FIFO_PTR_WDTH:0] n_fifo_count;		  	// Next Number of entries in fifo
  reg n_over_flow_err, n_under_flow_err; 		// Next Under flow and over flow errors 
  
  //**************************************************
  // Wires 
  //**************************************************
  wire [FIFO_PTR_WDTH - 1:0] n_wr_ptr, n_rd_ptr;	// Next Read and write pointers 
  wire fifo_full, fifo_empty;				// Full and empty signals

  wire [FIFO_WIDTH - 1:0] data_out;
  
//############################################################################
//                              ZERO IN CHECKERS  
//############################################################################    

// A fifo checker for this fifo 

//0in fifo -enq write -deq read -depth FIFO_DEPTH -enq_data data_in -deq_data data_out
  
// ***********************************************
// If this is a write access, put the data on the
// input bus into the location pointed to by the
// fifo write pointer
//************************************************
always @ (posedge clk)
        if(~rst_l) begin : fifo_rst
        integer j;
    for (j = 0; j < FIFO_DEPTH; j = j + 1) begin
      fifo_ram[j] <= {FIFO_WIDTH{1'b0}};
    end
   end
else begin 
  if (write) begin 
    fifo_ram[wr_ptr] <= data_in;
  end
end

//***********************************************
// If this is a read get the data that is in
// the location pointed to by the read pointer
// and put it onto the output bus
//************************************************

assign data_out = fifo_ram[rd_ptr];


//************************************************
// Increment the write pointer on every write and 
// the read pointer on every read
//************************************************/
always @ (posedge clk)
   if (!rst_l)
     begin
     	wr_ptr <= 0;
	rd_ptr <= 0;
     end
   else
     begin
     	wr_ptr <= n_wr_ptr;
      	rd_ptr <= n_rd_ptr;
     end

assign	n_wr_ptr = write ? ((wr_ptr == FIFO_DEPTH_MINUS_ONE) ? 0 : (wr_ptr + 1)) : wr_ptr; 
assign	n_rd_ptr = read ?  ((rd_ptr == FIFO_DEPTH_MINUS_ONE) ? 0 : (rd_ptr + 1)) : rd_ptr; 



//*********************************************
// The fifo counter increment on every write and 
// decrement on every read 
//**********************************************/

always @ (posedge clk)
    if (!rst_l)
      begin	
	fifo_count <= 0;
	over_flow_err <= 1'b0;
	under_flow_err <= 1'b0;
      end
    else
      begin
	fifo_count <= n_fifo_count;
	over_flow_err <= n_over_flow_err;
	under_flow_err <= n_under_flow_err;
      end


assign fifo_empty       = (fifo_count == 0);

assign fifo_full        = (fifo_count == FIFO_DEPTH);

assign fifo_almost_full = (fifo_count == FIFO_DEPTH - 1) | 
	 		  (fifo_count == FIFO_DEPTH);


always @ (write or read or over_flow_err or under_flow_err or fifo_count)
    begin
    	case ({write, read})
	    2'b00:
		begin
		    n_fifo_count = fifo_count; 					// No transaction
		    n_over_flow_err = over_flow_err;
		    n_under_flow_err = under_flow_err;
		 end

	    2'b01:
		begin
		    n_fifo_count = (fifo_count == 0) ? 0  :  fifo_count - 1;
		    n_over_flow_err = 1'b0;
		    n_under_flow_err =  (fifo_count == 0) ? 1'b1  : 1'b0;  	// Under flow case should not happen
		end

	    2'b10:
	 	begin
		    n_fifo_count = (fifo_count == FIFO_DEPTH) ?  FIFO_DEPTH :  fifo_count + 1;
		    n_over_flow_err = (fifo_count == FIFO_DEPTH) ? 1'b1  :  1'b0; // Over flow case shuld not happen
		    n_under_flow_err = 1'b0;
		end

	    2'b11:
		begin
		    n_fifo_count = fifo_count;                                  // both  transaction
		    n_over_flow_err =  1'b0; 					// Over flow case shuld not happen
	       	    n_under_flow_err = 1'b0; 
	     	end  
       
    endcase
  end

endmodule 
