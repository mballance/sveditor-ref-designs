// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_rxio_sync_fifo_ptr.v
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
//   Module: xpcs_rxio_sync_fifo_ptr
//     File: xpcs_rxio_sync_fifo_ptr.v
//
//   Description: This block contains a small fifo to allow
//                for clock deskewing.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   8/11/03   Created this module to guarantee pointer
//                      synchronization between hi/lo fifos of 
//                      the same lane.  Lane to lane deskew 
//                      assumes fifos will be read at the same
//                      time.
//
// ****************************************************************

module xpcs_rxio_sync_fifo_ptr (
                w_clk,
                w_rst,

                rx_clk,

                w_ptr,
                r_ptr,
                hold,

                rst,
                flush);


input           w_clk;   // Received Clock With Data
input           w_rst;   // Synchronous Active Low Reset
input           rx_clk; // Link Core Receive Clock (recovered clock from lane 0)
input           rst;     // Synchronous Active Low Reset
input           flush;   // strobed for one clock to flush fifo (sets the r_ptr = synchronized(w_ptr))
input           hold;

output   [2:0]   r_ptr;
output   [2:0]   w_ptr;

wire    [2:0]   w_ptr_sync;

wire            w_ptr_sync_0;
wire            w_ptr_sync_1;
wire            w_ptr_sync_2;
wire            w_ptr_sync_3;
wire            w_ptr_sync_4;
wire            w_ptr_sync_5;
wire            w_ptr_sync_6;
wire            w_ptr_sync_7;

wire    [2:0]   n_w_ptr;
reg     [2:0]   w_ptr;

wire            new_w_ptr_0;
wire            new_w_ptr_1;
wire            new_w_ptr_2;
wire            new_w_ptr_3;
wire            new_w_ptr_4;
wire            new_w_ptr_5;
wire            new_w_ptr_6;
wire            new_w_ptr_7;

wire    [2:0]   n_r_ptr;

reg     [2:0]   r_ptr;


// Write Pointer

// 4 bit gray code incrementer
// 000,001,011,010,110,111,101,100

assign n_w_ptr[2] = (w_ptr[1] & !w_ptr[0]) | (w_ptr[2] & w_ptr[0])  | (w_ptr[2] & w_ptr[1]);

assign n_w_ptr[1] = (w_ptr[1] & !w_ptr[2]) | (w_ptr[1] & !w_ptr[0]) | (w_ptr[0] & !w_ptr[2]);

assign n_w_ptr[0] = ((!w_ptr[2]) & (!w_ptr[1])) | (w_ptr[2] & w_ptr[1]);


// 2 bit gray code incrementer
// 00,01,11,10
// assign n_w_ptr[1] =  w_ptr[0];
// assign n_w_ptr[0] = !w_ptr[1];


always @ (posedge w_clk)
   if (w_rst)
      w_ptr <=  3'b000;
   else
      w_ptr <=  n_w_ptr[2:0];


// Synchronize Write Pointer To rx_clk

assign new_w_ptr_0 = rst ? 1'b0 : w_ptr == 3'b000;
assign new_w_ptr_1 = rst ? 1'b0 : w_ptr == 3'b001;
assign new_w_ptr_2 = rst ? 1'b0 : w_ptr == 3'b010;
assign new_w_ptr_3 = rst ? 1'b0 : w_ptr == 3'b011;
assign new_w_ptr_4 = rst ? 1'b0 : w_ptr == 3'b100;
assign new_w_ptr_5 = rst ? 1'b0 : w_ptr == 3'b101;
assign new_w_ptr_6 = rst ? 1'b0 : w_ptr == 3'b110;
assign new_w_ptr_7 = rst ? 1'b0 : w_ptr == 3'b111;

SYNC_CELL SYNC_W_PTR_0 (.D(new_w_ptr_0), .CP(rx_clk), .Q(w_ptr_sync_0) );
SYNC_CELL SYNC_W_PTR_1 (.D(new_w_ptr_1), .CP(rx_clk), .Q(w_ptr_sync_1) );
SYNC_CELL SYNC_W_PTR_2 (.D(new_w_ptr_2), .CP(rx_clk), .Q(w_ptr_sync_2) );
SYNC_CELL SYNC_W_PTR_3 (.D(new_w_ptr_3), .CP(rx_clk), .Q(w_ptr_sync_3) );
SYNC_CELL SYNC_W_PTR_4 (.D(new_w_ptr_4), .CP(rx_clk), .Q(w_ptr_sync_4) );
SYNC_CELL SYNC_W_PTR_5 (.D(new_w_ptr_5), .CP(rx_clk), .Q(w_ptr_sync_5) );
SYNC_CELL SYNC_W_PTR_6 (.D(new_w_ptr_6), .CP(rx_clk), .Q(w_ptr_sync_6) );
SYNC_CELL SYNC_W_PTR_7 (.D(new_w_ptr_7), .CP(rx_clk), .Q(w_ptr_sync_7) );


assign w_ptr_sync = w_ptr_sync_0 ? 3'b000 :
                    w_ptr_sync_1 ? 3'b001 :
                    w_ptr_sync_2 ? 3'b010 :
                    w_ptr_sync_3 ? 3'b011 :
                    w_ptr_sync_4 ? 3'b100 :
                    w_ptr_sync_5 ? 3'b101 :
                    w_ptr_sync_6 ? 3'b110 :
                    w_ptr_sync_7 ? 3'b111 :
                    3'b000;

// Read Pointer

// 2 bit gray code incrementer
// 00,01,11,10
// assign n_r_ptr[1] =  r_ptr[0];
// assign n_r_ptr[0] = !r_ptr[1];

assign n_r_ptr[2] = (r_ptr[1] & !r_ptr[0]) | (r_ptr[2] & r_ptr[0])  | (r_ptr[2] & r_ptr[1]);

assign n_r_ptr[1] = (r_ptr[1] & !r_ptr[2]) | (r_ptr[1] & !r_ptr[0]) | (r_ptr[0] & !r_ptr[2]);

assign n_r_ptr[0] = ((!r_ptr[2]) & (!r_ptr[1])) | (r_ptr[2] & r_ptr[1]);


always @ (posedge rx_clk)
    begin
      r_ptr <=  rst ? 3'b000          :
              flush ? w_ptr_sync[2:0] :
              hold  ? r_ptr[2:0]      :
              n_r_ptr[2:0];
    end


//***********************************************
// Zero In Added Error Checks
//***********************************************

// synopsys translate_off

// START OF GREY CODE LOGIC CHECK FOR 0-in

// 000,001,011,010,110,111,101,100

reg             test_w_ptr_grey_code_inc;

always @ (w_ptr or n_w_ptr)
  case (w_ptr)
    3'b000 : test_w_ptr_grey_code_inc = (n_w_ptr != 3'b001);    // 0 -> 1
    3'b001 : test_w_ptr_grey_code_inc = (n_w_ptr != 3'b011);    // 1 -> 3
    3'b011 : test_w_ptr_grey_code_inc = (n_w_ptr != 3'b010);    // 3 -> 2
    3'b010 : test_w_ptr_grey_code_inc = (n_w_ptr != 3'b110);    // 2 -> 6
    3'b110 : test_w_ptr_grey_code_inc = (n_w_ptr != 3'b111);    // 6 -> 7
    3'b111 : test_w_ptr_grey_code_inc = (n_w_ptr != 3'b101);    // 7 -> 5
    3'b101 : test_w_ptr_grey_code_inc = (n_w_ptr != 3'b100);    // 5 -> 4
    3'b100 : test_w_ptr_grey_code_inc = (n_w_ptr != 3'b000);    // 4 -> 0
  endcase

// 0in custom -fire test_w_ptr_grey_code_inc -message "Deskew Fifo Grey Code Increment Failure On Write Pointer"

reg             test_r_ptr_grey_code_inc;

always @ (r_ptr or n_r_ptr)
  case (r_ptr)
    3'b000 : test_r_ptr_grey_code_inc = (n_r_ptr != 3'b001);    // 0 -> 1
    3'b001 : test_r_ptr_grey_code_inc = (n_r_ptr != 3'b011);    // 1 -> 3
    3'b011 : test_r_ptr_grey_code_inc = (n_r_ptr != 3'b010);    // 3 -> 2
    3'b010 : test_r_ptr_grey_code_inc = (n_r_ptr != 3'b110);    // 2 -> 6
    3'b110 : test_r_ptr_grey_code_inc = (n_r_ptr != 3'b111);    // 6 -> 7
    3'b111 : test_r_ptr_grey_code_inc = (n_r_ptr != 3'b101);    // 7 -> 5
    3'b101 : test_r_ptr_grey_code_inc = (n_r_ptr != 3'b100);    // 5 -> 4
    3'b100 : test_r_ptr_grey_code_inc = (n_r_ptr != 3'b000);    // 4 -> 0
  endcase

// 0in custom -fire test_r_ptr_grey_code_inc -message "Deskew Fifo Grey Code Increment Failure On Read Pointer"

// END OF GREY CODE LOGIC CHECK FOR 0-in

// synopsys translate_on



endmodule

