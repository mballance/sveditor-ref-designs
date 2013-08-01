// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rxfifo_load.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : rxfifo_load
 * Author Name  : John Lo
 * Description  : It contains physical rxmac fifo and associated control
 *                logic (read/write pointers).
 * Parent Module: rx_xmac
 * Child  Module: rxfifo_memory_model
 * Interface Mod: many.
 * Date Created : 5/9/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Design Notes:  Since 802.3ae says that RxMac should be able to handle
 *                min IPG == 4 byte times, it is a good idea to have a
 *                larger rxfifo to combat this temporary phenominum.
 * 
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module rxfifo_load (
                   rx_clk,
                   rx_reset,
                   rxfifo_wen, // for rxfifo to generate wr_en
               	   rxfifo_g_rd_ptr_sync,
		   rxfifo_rd_ptr_clk, 
                   rxfifo_din,  
 // outputs
                   rxfifo_dout, // {mac_own_da,tag,64bit data}
                   rxfifo_g_wr_ptr_rxclk, // to xmac_sync.v
          	   rxfifo_full_rxclk,
          	   rxfifo_afull_rxclk,
                   // for signal observation 
                   rxfifo_wr_ptr_rxclk, 
          	   rxfifo_empty_rxclk,
          	   rxfifo_overrun_rxclk);

   
   input           rx_clk;
   input           rx_reset;
   input 	   rxfifo_wen; // for rxfifo to generate wr_en
   input [4:0] 	   rxfifo_g_rd_ptr_sync;
   input [3:0] 	   rxfifo_rd_ptr_clk;
   input [65:0]    rxfifo_din; 
// outputs
   output [65:0]   rxfifo_dout; // {mac_own_da,tag,64bit data}
   output [4:0]    rxfifo_g_wr_ptr_rxclk; // to xmac_sync.v
   output 	   rxfifo_full_rxclk;
   output 	   rxfifo_afull_rxclk;
   // for signal observation 
   output [4:0]    rxfifo_wr_ptr_rxclk; 
   output 	   rxfifo_empty_rxclk;
   output 	   rxfifo_overrun_rxclk;
 
// rxfifo signals   
   wire [4:0] 	   rxfifo_wr_ptr_rxclk;
// wire [4:0] 	   rxfifo_wr_ptr_plus1_rxclk;
   wire [4:0] 	   rxfifo_g_wr_ptr_rxclk;
   wire [4:0] 	   rxfifo_rd_ptr_rxclk;
   wire 	   rxfifo_wen;
   wire 	   rxfifo_wr_en = rxfifo_wen & (~rxfifo_full_rxclk);
   
   // Before the rxfifo overflow bug was found (9/26/00), the signal: 
   // rxfifo_full_rxclk can not be used to stop rxfifo_wr_en.
   // Because it is necessary to let eop and status tag be written
   // so that IPP can discard this pkt.
   // But now the rxfifo effective depth is reduced to 15 and the
   // rxfifo_afull_rxclk is used to generate eop and write to
   // rxfifo (one last data entry left), so it is ok to use
   // rxfifo_full to block rxfifo_wr_en. -loj (9/27/00)
   //
   // In Feb. 10th, 2004, the rxfifo overflow bug shows up again.
   // It is caused by adding one more layer of pipeline register
   // to add the strip_crc function.
   // For this reason, the rxfifo_afull signal has to be extended 1 more.
   
/* --------------- start rxfifo pointer Management ------------------ */
// Rxfifo read Pointer, rd_ptr from sysclk   
g2b_5bit rxfifo_g_rd_ptr_g2b_5bit(.g_cnt(rxfifo_g_rd_ptr_sync),
                                  .b_cnt(rxfifo_rd_ptr_rxclk));

// Rxfifo G Write Pointer, g_wr_ptr to sysclk   
g_cntr_5bit rxfifo_g_wr_ptr_rxclk_g_cntr_5bit( .reset(rx_reset),
                                         .clk(rx_clk),
                                         .ce(rxfifo_wr_en),
                                         .g_cnt(rxfifo_g_wr_ptr_rxclk));

// Rxfifo Write Pointer
g2b_5bit rxfifo_g2b_5bit(.g_cnt(rxfifo_g_wr_ptr_rxclk),
                         .b_cnt(rxfifo_wr_ptr_rxclk));

//assign     rxfifo_wr_ptr_plus1_rxclk = rxfifo_wr_ptr_rxclk + 1;
   

wire [4:0] rxfifo_empty_space = (rxfifo_wr_ptr_rxclk[4] == rxfifo_rd_ptr_rxclk[4]) ?
                    16 - ({1'b0,rxfifo_wr_ptr_rxclk[3:0]} - {1'b0,rxfifo_rd_ptr_rxclk[3:0]}):
                         ({1'b0,rxfifo_rd_ptr_rxclk[3:0]} - {1'b0,rxfifo_wr_ptr_rxclk[3:0]});

//wire [4:0] rxfifo_full_space = (rxfifo_wr_ptr_rxclk[4] == rxfifo_rd_ptr_rxclk[4]) ?
//                         ({1'b0,rxfifo_wr_ptr_rxclk[3:0]} - {1'b0,rxfifo_rd_ptr_rxclk[3:0]}):
//                    16 - ({1'b0,rxfifo_rd_ptr_rxclk[3:0]} - {1'b0,rxfifo_wr_ptr_rxclk[3:0]});

wire       rxfifo_full_rxclk  = (rxfifo_wr_ptr_rxclk[4]   == (!rxfifo_rd_ptr_rxclk[4])) &&
                                (rxfifo_wr_ptr_rxclk[3:0] == rxfifo_rd_ptr_rxclk[3:0]);

// almost full   
//wire       rxfifo_afull_rxclk  = (rxfifo_wr_ptr_plus1_rxclk[4]   == (!rxfifo_rd_ptr_rxclk[4])) &&
//                                 (rxfifo_wr_ptr_plus1_rxclk[3:0] == rxfifo_rd_ptr_rxclk[3:0]);

wire       rxfifo_afull_rxclk = rxfifo_empty_space < 3; // 2 empty space left
	   
wire       rxfifo_empty_rxclk = (rxfifo_wr_ptr_rxclk[4:0] ==  rxfifo_rd_ptr_rxclk[4:0]);

wire       rxfifo_overrun_rxclk = rxfifo_afull_rxclk & rxfifo_wr_en;
/* --------------- end of rxfifo pointer Management ----------------- */

//***********************************************
//***** Rxfifo and associated control logic *****
//***********************************************

rxfifo_memory_model rxfifo_memory_model(
                     .rx_clk(rx_clk),
		     .reset(rx_reset),
                     .wp(rxfifo_wr_ptr_rxclk[3:0]),
                     .rp(rxfifo_rd_ptr_clk[3:0]),
                     .we(rxfifo_wr_en),
                     .din(rxfifo_din[65:0]),
                     .dout(rxfifo_dout[65:0])); 


endmodule // rxfifo_load



module rxfifo_memory_model (rx_clk,reset,wp,rp,we,din,dout);
   input rx_clk,reset;
   input [3:0] wp,rp;
   input       we;
   input [65:0] din;
   output [65:0] dout;
   
   
reg  [65:0]  rxfifo_mem      [0:15];  // 65 bit wide 16 deep

always @ (posedge rx_clk)
  begin
    if (reset)
      begin
      rxfifo_mem[0]  <= 0;
      rxfifo_mem[1]  <= 0;
      rxfifo_mem[2]  <= 0;
      rxfifo_mem[3]  <= 0;
      rxfifo_mem[4]  <= 0;
      rxfifo_mem[5]  <= 0;
      rxfifo_mem[6]  <= 0;
      rxfifo_mem[7]  <= 0;
      rxfifo_mem[8]  <= 0;
      rxfifo_mem[9]  <= 0;
      rxfifo_mem[10] <= 0;
      rxfifo_mem[11] <= 0;
      rxfifo_mem[12] <= 0;
      rxfifo_mem[13] <= 0;
      rxfifo_mem[14] <= 0;
      rxfifo_mem[15] <= 0;
      end
    else
      begin
        case (we) // synopsys parallel_case full_case infer_mux
          1'b1: rxfifo_mem[wp] <= din;
          1'b0: rxfifo_mem[wp] <= rxfifo_mem[wp];
        endcase // case(we)
      end
  end // always @ (posedge rx_clk)
   
   assign     dout =  rxfifo_mem[rp];
   
endmodule // rxfifo_memory_model


 
