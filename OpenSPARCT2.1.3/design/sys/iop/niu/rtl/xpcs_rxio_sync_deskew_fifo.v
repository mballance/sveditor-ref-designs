// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_rxio_sync_deskew_fifo.v
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
// ****************************************************************
//
//   Sun Proprietary/Confidential: Internal Use Only
//
// ****************************************************************
//   Design: IB Phy Interface
//    Block: IB RX Phy Interface Controller
//   Author: Carlos Castil 
//   
//   Module: xpcs_rxio_sync_deskew_fifo
//     File: xpcs_rxio_sync_deskew_fifo.v
//
//   Description: This block contains a small fifo to allow
//		  for clock deskewing.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//	1.0   10/13/02	Fifo size is 16 symbols to accomidate
//			IB spec. which allows for 24ns of
//			skew....for ieee 802.3ae we need ~14ns
//
// ****************************************************************



module xpcs_rxio_sync_deskew_fifo (
		w_clk,
		w_rst,
		w_byte,
		w_special,
		w_error,

                w_ptr,
                r_ptr,

		byte,
		special,
		error);

		
input		w_clk;		// Received Clock With Data
input		w_rst;	        // Synchronous Active Low Reset 
input	[7:0]	w_byte;		// Decode Data
input		w_special;	// Decode Control
input		w_error;	// Decode error

input   [2:0]   r_ptr;
input   [2:0]   w_ptr;

output	[7:0]	byte;		// output data
output		special;	// output control
output		error;	        // output error

reg     [9:0]	mem_0;
reg     [9:0]	mem_1;
reg     [9:0]	mem_2;
reg     [9:0]	mem_3;
reg     [9:0]   mem_4;
reg     [9:0]   mem_5;
reg     [9:0]   mem_6;
reg     [9:0]   mem_7;

reg	[7:0]	byte;
reg		special;
reg		error;
  
// Memory Registers    
    
always @ (posedge w_clk)
  if (w_rst)
    begin
      mem_0 <= 10'b0000000000;
      mem_1 <= 10'b0000000000;
      mem_2 <= 10'b0000000000;
      mem_3 <= 10'b0000000000;
      mem_4 <= 10'b0000000000;
      mem_5 <= 10'b0000000000;
      mem_6 <= 10'b0000000000;
      mem_7 <= 10'b0000000000;
    end
  else
    begin
      mem_0 <= (w_ptr==3'b000) ? {w_error,w_special,w_byte} : mem_0;
      mem_1 <= (w_ptr==3'b001) ? {w_error,w_special,w_byte} : mem_1;
      mem_2 <= (w_ptr==3'b010) ? {w_error,w_special,w_byte} : mem_2;
      mem_3 <= (w_ptr==3'b011) ? {w_error,w_special,w_byte} : mem_3;
      mem_4 <= (w_ptr==3'b100) ? {w_error,w_special,w_byte} : mem_4;
      mem_5 <= (w_ptr==3'b101) ? {w_error,w_special,w_byte} : mem_5;
      mem_6 <= (w_ptr==3'b110) ? {w_error,w_special,w_byte} : mem_6;
      mem_7 <= (w_ptr==3'b111) ? {w_error,w_special,w_byte} : mem_7;
   end



// Read Data Mux  
  
always @ (r_ptr or mem_0 or mem_1 or mem_2 or mem_3 or 
                   mem_4 or mem_5 or mem_6 or mem_7 ) 
  case (r_ptr[2:0]) // synopsys parallel_case full_case infer_mux
    3'b000 : {error,special,byte} = mem_0;
    3'b001 : {error,special,byte} = mem_1;
    3'b010 : {error,special,byte} = mem_2;
    3'b011 : {error,special,byte} = mem_3;
    3'b100 : {error,special,byte} = mem_4;
    3'b101 : {error,special,byte} = mem_5;
    3'b110 : {error,special,byte} = mem_6;
    3'b111 : {error,special,byte} = mem_7;
  endcase


endmodule
