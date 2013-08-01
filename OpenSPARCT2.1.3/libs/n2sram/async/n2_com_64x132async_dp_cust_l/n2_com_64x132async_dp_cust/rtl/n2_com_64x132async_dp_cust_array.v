// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_com_64x132async_dp_cust_array.v
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
module n2_com_64x132async_dp_cust_array	(

   wr_clk,
   wr_addr_array,
   wr_en_array,
   din_array, 

   rd_clk,
   rd_addr_array,
   rd_en_array, 
   dout_array    

);


input		wr_clk;				// write clk 
input	  [5:0]	wr_addr_array;			// write port address in
input		wr_en_array;			// write port enable
input	[131:0] din_array;			// data in

input 		rd_clk;				// read clk 
input	  [5:0]	rd_addr_array;			// read port address in
input		rd_en_array;			// read port enable
output	[131:0] dout_array;			// data out


// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------
// checker to verify on accesses's that no bits are x
// 0in kndr -var rd_addr_array
// 0in kndr -var wr_addr_array
// 0in kndr -var rd_en_array
// 0in kndr -var wr_en_array


reg	[131:0]	array_ram      [0:63];
reg	[131:0]	dout_array;

// Initialize the array
`ifndef NOINITMEM
integer i;

initial begin
  for (i=0; i<64; i=i+1) begin
    array_ram[i] = 132'b0;
  end
  dout_array[131:0] = 132'b0;                   // N2+ Bug 103693
end
`endif

// ----------------------------------------------------------------------------
// Read the array
// ----------------------------------------------------------------------------
/* AT: 
always @(rd_clk or rd_en_array or  rd_addr_array ) begin
   if (rd_clk) begin
      if (rd_en_array) begin
	 dout_array[131:0] <= array_ram[rd_addr_array[5:0]];
      end
   end
end
*/

always @(rd_clk or rd_en_array or  rd_addr_array or wr_en_array or
	 wr_addr_array) begin
   if (rd_clk) begin
      if (rd_en_array) begin
	if (wr_en_array & (rd_addr_array == wr_addr_array))  // 0in < fire -severity 1 -message "Detected rd/wr collision in PEU I/EHB RAM, dout driven as X's" -group mbist_mode
            dout_array[131:0] <= {132{1'bx}} ;
         else

	 dout_array[131:0] <= array_ram[rd_addr_array[5:0]];
      end
   end
end



// ----------------------------------------------------------------------------
// Write the array, note: it is written when the clock is low
// ----------------------------------------------------------------------------
always @(wr_en_array or wr_addr_array or wr_clk or din_array ) begin
   if (~wr_clk) begin
      if(wr_en_array ) begin
	  array_ram[wr_addr_array[5:0]] <= din_array[131:0];
      end
   end
end


endmodule	// n2_com_64x132async_dp_cust_array


