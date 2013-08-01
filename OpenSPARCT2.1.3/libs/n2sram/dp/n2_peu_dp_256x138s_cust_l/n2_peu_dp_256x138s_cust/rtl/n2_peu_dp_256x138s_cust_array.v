// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_peu_dp_256x138s_cust_array.v
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
module n2_peu_dp_256x138s_cust_array	(

   wr_addr_array,
   wr_en_array,
   din_array, 

   clk,
   rd_addr_array,
   rd_en_array, 
   dout_array    

);


input	  [7:0]	wr_addr_array;			// write port address in
input		wr_en_array;			// write port enable
input	[137:0] din_array;			// data in

input 		clk;				// clk 
input	  [7:0]	rd_addr_array;			// read port address in
input		rd_en_array;			// read port enable
output	[137:0] dout_array;			// data out


// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------
// checker to verify on accesses's that no bits are x
// 0in kndr -var rd_addr_array
// 0in kndr -var wr_addr_array
// 0in kndr -var rd_en_array
// 0in kndr -var wr_en_array


reg	[137:0]	array_ram      [0:255];
reg	[137:0]	dout_array;

// Initialize the array
`ifndef NOINITMEM
integer i;

initial begin
  for (i=0; i<256; i=i+1) begin
    array_ram[i] = 138'b0;
  end
end
`endif

// ----------------------------------------------------------------------------
// Read the array
// ----------------------------------------------------------------------------
always @(clk or rd_en_array or rd_addr_array or wr_en_array or wr_addr_array ) begin
   if (clk) begin
      if (rd_en_array) begin
	 if (wr_en_array & (rd_addr_array == wr_addr_array))  // 0in < fire -severity 1 -message "Detected rd/wr collision in PEU RBUF RAM, dout driven as X's" -group mbist_mode
	    dout_array[137:0] <= {138{1'bx}} ;	
	 else
	    dout_array[137:0] <=  array_ram[rd_addr_array[7:0]];
      end
      else begin
	 dout_array[137:0] <= 138'b0 ;
      end
   end
end



// ----------------------------------------------------------------------------
// Write the array, note: it is written when the clock is low
// ----------------------------------------------------------------------------
always @(clk or wr_en_array or wr_addr_array or din_array ) begin
   if (~clk) begin
      if(wr_en_array ) begin
	  array_ram[wr_addr_array[7:0]] <= din_array[137:0];
      end
   end
end


endmodule	// n2_peu_dp_256x138s_cust_array


