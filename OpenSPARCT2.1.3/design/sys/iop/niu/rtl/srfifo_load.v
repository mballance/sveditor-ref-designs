// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: srfifo_load.v
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
 * File Name    : srfifo_load
 * Author Name  : John Lo
 * Description  : 
 * Parent Module: rx_xmac
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 5/9/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "xmac.h"

module srfifo_load (
                   rx_clk,
                   rx_reset,
         	   srfifo_wr_en,  // .srfifo_wr_en(eop) in rx_xmac.v
               	   srfifo_rd_ptr_clk,
                   srfifo_din,  
	 // outputs
                   srfifo_dout,
                   srfifo_g_wr_ptr_rxclk
                   );

   
   input           rx_clk;
   input           rx_reset;
   input 	   srfifo_wr_en; // .srfifo_wr_en(eop) in rx_xmac.v
   // vlint flag_input_port_not_connected off
   input [4:0] 	   srfifo_rd_ptr_clk;
   // vlint flag_input_port_not_connected on
   input [`TBITS]  srfifo_din;  // 24 bits wide
   output [`TBITS] srfifo_dout; 
   output [4:0]    srfifo_g_wr_ptr_rxclk;

   wire [4:0] 	   srfifo_g_wr_ptr_rxclk;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   // vlint flag_input_port_not_connected off
   wire [4:0] 	   srfifo_wr_ptr_rxclk;
   wire [4:0] 	   srfifo_rd_ptr_clk;
   // vlint flag_input_port_not_connected on
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   
/* --------------- start srfifo pointer Management ------------------ */
  
// srfifo G Write Pointer, g_wr_ptr to sysclk   
g_cntr_5bit srfifo_g_wr_ptr_rxclk_g_cntr_5bit( 
                                  .reset(rx_reset),
                                  .clk(rx_clk),
                                  .ce(srfifo_wr_en),
                                  .g_cnt(srfifo_g_wr_ptr_rxclk));

// srfifo Write Pointer
g2b_5bit srfifo_g2b_5bit(.g_cnt(srfifo_g_wr_ptr_rxclk),
                         .b_cnt(srfifo_wr_ptr_rxclk));
/* --------------- end of srfifo pointer Management ----------------- */

//***********************************************
//***** srfifo and associated control logic *****
//***********************************************
srfifo_TBITS_memory_model srfifo_TBITS_memory_model(
                     .rx_clk(rx_clk),
		     .reset(rx_reset),
                     .wp(srfifo_wr_ptr_rxclk[3:0]),
                     .rp(srfifo_rd_ptr_clk[3:0]),
                     .we(srfifo_wr_en),
                     .din(srfifo_din[`TBITS]),
                     .dout(srfifo_dout[`TBITS])); 

endmodule // srfifo_load


module srfifo_TBITS_memory_model (rx_clk,reset,wp,rp,we,din,dout);
   input         rx_clk,reset;
   input [3:0]   wp,rp;
   input         we;
   input [`TBITS]  din;
   output [`TBITS] dout;
   
   
reg  [`TBITS] srfifo_mem [0:15];  // 24 bit wide 16 deep

always @ (posedge rx_clk)
  begin
    if (reset)
      begin
      srfifo_mem[0]  <= 0;
      srfifo_mem[1]  <= 0;
      srfifo_mem[2]  <= 0;
      srfifo_mem[3]  <= 0;
      srfifo_mem[4]  <= 0;
      srfifo_mem[5]  <= 0;
      srfifo_mem[6]  <= 0;
      srfifo_mem[7]  <= 0;
      srfifo_mem[8]  <= 0;
      srfifo_mem[9]  <= 0;
      srfifo_mem[10] <= 0;
      srfifo_mem[11] <= 0;
      srfifo_mem[12] <= 0;
      srfifo_mem[13] <= 0;
      srfifo_mem[14] <= 0;
      srfifo_mem[15] <= 0;
      end
    else
      begin
        case (we) // synopsys parallel_case full_case infer_mux
          1'b1: srfifo_mem[wp] <= din;
          1'b0: srfifo_mem[wp] <= srfifo_mem[wp];
        endcase // case(we)
      end
  end // always @ (posedge rx_clk)
   
   assign     dout =  srfifo_mem[rp];
   
endmodule // srfifo_TBITS_memory_model


