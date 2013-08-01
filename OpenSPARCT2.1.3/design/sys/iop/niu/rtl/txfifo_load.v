// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: txfifo_load.v
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
 * File Name    : txfifo_load.v
 * Author Name  : John Lo
 * Description  : It contains txmac write pointer management logic and 
 *                associated control logic and txfifo memory itself.
 * Parent Module: tx_xmac
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification : Added opp_txmac_data,
 *                      opp_txmac_ack,
 *                      opp_txmac_tag,
 *                      opp_txmac_stat,
 *                      opp_txmac_abort registration. 
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module txfifo_load ( 
   clk,
   tx_reset_clk,
   opp_txmac_data,
   opp_txmac_ack,
   opp_txmac_tag,
   opp_txmac_stat,
   opp_txmac_abort,
   txfifo_g_rd_ptr_sync,
   txfifo_rd_ptr_txclk,
   stfifo_g_rd_ptr_sync,
   stfifo_rd_ptr_txclk,
// outputs
   txmac_opp_req,
   txfifo_full_clk_reg,
   txfifo_empty_clk_reg,
   txfifo_overrun_clk,
   txfifo_g_wr_ptr_clk,
   txfifo_wr_ptr_clk,
   txfifo_rd_ptr_clk,
   stfifo_full_clk,
   stfifo_empty_clk,
   stfifo_overrun_clk,
   stfifo_g_wr_ptr_clk,   
   no_crc,
   last_byte_position,
   txfifo_dout		    
   );
   
   input           clk;
   input           tx_reset_clk;
   input [63:0]    opp_txmac_data;
   input 	   opp_txmac_ack;
   input 	   opp_txmac_tag;
   input [3:0] 	   opp_txmac_stat;
   input 	   opp_txmac_abort;
   input [4:0] 	   txfifo_g_rd_ptr_sync;
   input [3:0] 	   txfifo_rd_ptr_txclk;
   input [4:0] 	   stfifo_g_rd_ptr_sync;
   input [3:0] 	   stfifo_rd_ptr_txclk;
// outputs   
   output 	   txmac_opp_req;
   output 	   txfifo_full_clk_reg;
   output 	   txfifo_empty_clk_reg;
   output 	   txfifo_overrun_clk;
   output [4:0]	   txfifo_g_wr_ptr_clk;
   output [4:0]    txfifo_wr_ptr_clk;
   output [4:0]    txfifo_rd_ptr_clk;
   output 	   stfifo_full_clk;
   output 	   stfifo_empty_clk;
   output 	   stfifo_overrun_clk;
   output [4:0]    stfifo_g_wr_ptr_clk;
   output 	   no_crc;
   output [2:0]    last_byte_position;
   output [65:0]   txfifo_dout;
   
   wire            filtered_tag_in;
   // 10-29-2001, loj replaced opp_txma_sa_repl with opp_txmac_abort.
   wire [65:0] 	   txfifo_din;
   wire [65:0] 	   txfifo_dout;
   // txfifo
   wire [4:0] 	   txfifo_g_rd_ptr_sync;
   wire [4:0] 	   txfifo_rd_ptr_clk;
   wire [4:0] 	   txfifo_g_wr_ptr_clk;
   wire [4:0] 	   txfifo_wr_ptr_clk;
   wire   	   txfifo_full_clk_reg;
   wire   	   txfifo_empty_clk_reg;
   wire   	   txfifo_full_clk;
   wire   	   txfifo_empty_clk;
   // stfifo
   wire [4:0] 	   stfifo_rd_ptr_clk;
   wire [3:0] 	   stfifo_rd_ptr_txclk;
   wire [4:0] 	   stfifo_g_wr_ptr_clk;
   wire [4:0] 	   stfifo_wr_ptr_clk;
   // internal signals
   wire 	   txfifo_load_rdy;
   wire 	   txfifo_wr_en;
   wire [63:0] 	   txmac_data;
   wire [3:0] 	   txmac_stat;
   wire 	   txmac_ack;
   wire 	   txmac_tag;
   wire 	   txmac_abort;
// register all the opp to txmac signals
  RegDff #(64) txmac_data_RegDff   (.clk(clk),                     .din(opp_txmac_data), .qout(txmac_data));
  RegRst #(1)  txmac_ack_RegRst    (.clk(clk),.reset(tx_reset_clk),.din(opp_txmac_ack),  .qout(txmac_ack));
  RegRst #(1)  txmac_tag_RegRst    (.clk(clk),.reset(tx_reset_clk),.din(opp_txmac_tag),  .qout(txmac_tag));
  RegDff #(4)  txmac_stat_RegDff   (.clk(clk),                     .din(opp_txmac_stat), .qout(txmac_stat));
  RegRst #(1)  txmac_abort_RegRst  (.clk(clk),.reset(tx_reset_clk),.din(opp_txmac_abort),.qout(txmac_abort));
// register output signals
  RegRst #(1)  txmac_opp_req_RegRst(.clk(clk),.reset(tx_reset_clk),.din(txfifo_load_rdy),.qout(txmac_opp_req));

// start regular logic
   
   assign    filtered_tag_in  = txmac_ack & txmac_tag;
   // 10-29-2001, loj replaced opp_txma_sa_repl with txmac_abort.
   assign    txfifo_din[65:0] = {txmac_abort, // opp_txma_sa_repl,
                             filtered_tag_in,txmac_data[63:0]};

/* --------------- start txfifo pointer Management ------------------ */

// txfifo_overrun should never happen. Since txmac_opp_req control
// such that it will never happen.   
   assign    txfifo_wr_en   = txmac_ack & ~txfifo_full_clk;
   
// txfifo read Pointer, rd_ptr from txclk   
g2b_5bit txfifo_g_rd_ptr_g2b_5bit(.g_cnt(txfifo_g_rd_ptr_sync),
                                  .b_cnt(txfifo_rd_ptr_clk));

// txfifo G write Pointer, g_wr_ptr  
g_cntr_5bit txfifo_g_wr_ptr_clk_g_cntr_5bit
                        (.reset(tx_reset_clk),
                         .clk(clk),
                         .ce(txfifo_wr_en),
                         .g_cnt(txfifo_g_wr_ptr_clk));

// Txfifo write Pointer
counter_X5 txfifo_wr_ptr_clk_counter_X5(.clk(clk),.clr(tx_reset_clk),.enable(txfifo_wr_en),.count(txfifo_wr_ptr_clk));
// txfifo write Pointer
//g2b_5bit txfifo_g2b_5bit(.g_cnt(txfifo_g_wr_ptr_clk),
//                         .b_cnt(txfifo_wr_ptr_clk));

   wire [4:0] txfifo_empty_space_clk =
                         (txfifo_wr_ptr_clk[4] == txfifo_rd_ptr_clk[4]) ?
                    16 - ({1'b0,txfifo_wr_ptr_clk[3:0]} - {1'b0,txfifo_rd_ptr_clk[3:0]}):
                         ({1'b0,txfifo_rd_ptr_clk[3:0]} - {1'b0,txfifo_wr_ptr_clk[3:0]});

   assign  txfifo_full_clk=(txfifo_wr_ptr_clk[4]==(!txfifo_rd_ptr_clk[4])) &&
                           (txfifo_wr_ptr_clk[3:0]==txfifo_rd_ptr_clk[3:0]);

   FD1     txfifo_full_clk_reg_FD1 (.D(txfifo_full_clk), .CP(clk),.Q(txfifo_full_clk_reg));

   assign  txfifo_empty_clk=(txfifo_wr_ptr_clk[4:0]==txfifo_rd_ptr_clk[4:0]);

   FD1     txfifo_empty_clk_reg_FD1(.D(txfifo_empty_clk),.CP(clk),.Q(txfifo_empty_clk_reg));
   
   wire    txfifo_overrun_clk = txfifo_full_clk & txmac_ack;
   
/* --------------- end of txfifo pointer Management ----------------- */

//*********************************
//***** stfifo declaration *****
//*********************************
 
  // txmac_stat[14]: no_crc
  // txmac_stat[13:11]: last_byte_position

// stfifo read Pointer, rd_ptr from txclk
g2b_5bit stfifo_g_rd_ptr_clk_g2b_5bit(.g_cnt(stfifo_g_rd_ptr_sync),
                                  .b_cnt(stfifo_rd_ptr_clk));

// stfifo G Write Pointer, g_wr_ptr to sysclk   
g_cntr_5bit stfifo_g_wr_ptr_clk_g_cntr_5bit( 
                                  .reset(tx_reset_clk),
                                  .clk(clk),
                                  .ce(filtered_tag_in),
                                  .g_cnt(stfifo_g_wr_ptr_clk));

// stfifo Write Pointer
g2b_5bit stfifo_g2b_5bit(.g_cnt(stfifo_g_wr_ptr_clk),
                         .b_cnt(stfifo_wr_ptr_clk));

   wire    stfifo_full_clk=(stfifo_wr_ptr_clk[4]==(!stfifo_rd_ptr_clk[4])) &&
                           (stfifo_wr_ptr_clk[3:0]==stfifo_rd_ptr_clk[3:0]);

   wire    stfifo_empty_clk=(stfifo_wr_ptr_clk[4:0]==stfifo_rd_ptr_clk[4:0]);

   wire    stfifo_overrun_clk = stfifo_full_clk & filtered_tag_in;
  
   wire [3:0]  stfifo_dout;
   wire [2:0]  last_byte_position;
   wire        no_crc;
   
   assign no_crc             = stfifo_dout[3];
   assign last_byte_position = stfifo_dout[2:0];
/* --------------- end of stfifo pointer Management --------------- */

   
/* ----------------------- Tx Burst I/F ----------------------------- */

   assign txfifo_load_rdy =  txfifo_empty_space_clk > 4;


/* --------------- txfifo memory instantiation ---------------------- */
txfifo_memory_model  txfifo_memory_model(
                     .clk(clk),
		     .reset(tx_reset_clk),
                     .wp(txfifo_wr_ptr_clk[3:0]),
                     .rp(txfifo_rd_ptr_txclk[3:0]),
                     .we(txfifo_wr_en),
                     .din(txfifo_din),
                     .dout(txfifo_dout)); 

/* --------------- stfifo memory instantiation ---------------------- */
stfifo_memory_model  stfifo_memory_model(
                     .clk(clk),
                     .reset(tx_reset_clk),
                     .wp(stfifo_wr_ptr_clk[3:0]),
                     .rp(stfifo_rd_ptr_txclk[3:0]),
                     .we(filtered_tag_in),
                     .din(txmac_stat[3:0]),
                     .dout(stfifo_dout[3:0]));

endmodule // txfifo_load

   
module txfifo_memory_model (clk,reset,wp,rp,we,din,dout);
   input clk,reset;
   input [3:0] wp,rp;
   input       we;
   input [65:0] din;
   output [65:0] dout;
   
   
reg  [65:0]  txfifo_mem      [0:15];  // 66 bit wide 16 deep

always @ (posedge clk)
  begin
    if (reset)
      begin
        txfifo_mem[0]  <= 0;
        txfifo_mem[1]  <= 0;
        txfifo_mem[2]  <= 0;
        txfifo_mem[3]  <= 0;
        txfifo_mem[4]  <= 0;
        txfifo_mem[5]  <= 0;
        txfifo_mem[6]  <= 0;
        txfifo_mem[7]  <= 0;
        txfifo_mem[8]  <= 0;
        txfifo_mem[9]  <= 0;
        txfifo_mem[10] <= 0;
        txfifo_mem[11] <= 0;
        txfifo_mem[12] <= 0;
        txfifo_mem[13] <= 0;
        txfifo_mem[14] <= 0;
        txfifo_mem[15] <= 0;
      end
    else
      begin
        case (we)  // synopsys parallel_case full_case infer_mux
          1'b1: txfifo_mem[wp] <= din;
          1'b0: txfifo_mem[wp] <= txfifo_mem[wp];
        endcase // case(we)
      end // else: !if(reset)
  end // always @ (posedge clk)
   
   
   assign     dout =  txfifo_mem[rp];
   
endmodule // txfifo_memory_model

  
module stfifo_memory_model (clk,reset,wp,rp,we,din,dout);
   input        clk;
   input        reset;
   input [3:0]  wp,rp;
   input        we;
   input [3:0]  din;
   output [3:0] dout;
   
   
reg  [3:0]  stfifo_mem   [0:15];  // 4 bit wide 16 deep

always @ (posedge clk)
  begin
    if (reset)
      begin
        stfifo_mem[0]  <= 0;
        stfifo_mem[1]  <= 0;
        stfifo_mem[2]  <= 0;
        stfifo_mem[3]  <= 0;
        stfifo_mem[4]  <= 0;
        stfifo_mem[5]  <= 0;
        stfifo_mem[6]  <= 0;
        stfifo_mem[7]  <= 0;
        stfifo_mem[8]  <= 0;
        stfifo_mem[9]  <= 0;
        stfifo_mem[10] <= 0;
        stfifo_mem[11] <= 0;
        stfifo_mem[12] <= 0;
        stfifo_mem[13] <= 0;
        stfifo_mem[14] <= 0;
        stfifo_mem[15] <= 0;
      end
    else 
      begin
        case (we)  // synopsys parallel_case full_case infer_mux
          1'b1: stfifo_mem[wp] <= din;
          1'b0: stfifo_mem[wp] <= stfifo_mem[wp];
        endcase // case(we)
      end
  end // always @ (posedge clk)
   
   
   
   assign     dout =  stfifo_mem[rp];
   
endmodule // stfifo_memory_model

