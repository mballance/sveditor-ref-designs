// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tx_mii_gmii.v
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
 * File Name    : tx_mii_gmii
 * Author Name  : John Lo
 * Description  : txmac gmii interface logic
 * Parent Module: xmac
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 9/19/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes by loj: tx_clk belongs to xgmii clock domain.  It is
 *                         used as DDR selection of txd_image to gtfifo_din.
 *                         tx_clk is a clock path which merge with txd_image
 *                         which is a data path.  Make usre timing is ok.
 * 
 *************************************************************************/

`include  "xmac.h"

module tx_mii_gmii ( 
   tx_nbclk,
   tx_reset_nbclk,
   hw_reset_txnbclk,
   tx_output_en_nbclk,
   mii_mode,
   gmii_mode,
   mii_or_gmii_mode,
   txd_image,
   txc_image,
   tx_err_image,
   ipg_value1,
// outputs
   tx_heart_beat_timer,
   tx_heart_beat_timer_reg,
   // gmii outputs // mii pins have been mux with gmii pins.
   gmii_txd,
   gmii_tx_en,
   gmii_tx_err,
   // loopback path
   mgmii_txd,
   mgmii_tx_en,
   mgmii_tx_err,
   // internal signals		     
   tx_hb_byte0_time,
   tx_hb_byte1_time,
   tx_hb_byte2_time,
   tx_hb_byte3_time,
   tx_hb_byte4_time,
   tx_hb_byte5_time,
   tx_hb_byte6_time,
   tx_hb_byte7_time
   );
   
   input          tx_nbclk;
   input 	  tx_reset_nbclk;
   input 	  hw_reset_txnbclk;
   input 	  tx_output_en_nbclk;
   input 	  mii_mode;
   input 	  gmii_mode;
   input 	  mii_or_gmii_mode;
   input [63:0]   txd_image;
   input [7:0]    txc_image;
   input 	  tx_err_image;
   input [`BYTE]  ipg_value1;
// outputs
   output [3:0]   tx_heart_beat_timer; // to clock mux
   output [3:0]   tx_heart_beat_timer_reg;// to xmac_slv
   // gmii outputs // mii pins have been mux with gmii pins.
   output [`BYTE] gmii_txd;
   output         gmii_tx_en;
   output 	  gmii_tx_err;
   // loopback path
   output [`BYTE] mgmii_txd;
   output         mgmii_tx_en;
   output 	  mgmii_tx_err;
   // internal signals		     
   output	  tx_hb_byte0_time;
   output  	  tx_hb_byte1_time;
   output 	  tx_hb_byte2_time;
   output 	  tx_hb_byte3_time;
   output 	  tx_hb_byte4_time;
   output 	  tx_hb_byte5_time;
   output 	  tx_hb_byte6_time;
   output 	  tx_hb_byte7_time;
   

   reg [3:0] 	  mgtfifo_wr_ptr;
   reg [3:0] 	  mgtfifo_rd_ptr;
   reg [`BYTE] 	  txd_ilane7;
   reg [`BYTE]    txd_ilane6;
   reg [`BYTE]    txd_ilane5;
   reg [`BYTE]    txd_ilane4;
   reg [`BYTE] 	  txd_ilane3;
   reg [`BYTE]    txd_ilane2;
   reg [`BYTE]    txd_ilane1;
   reg [`BYTE]    txd_ilane0;
   
   reg            txc_ilane7;
   reg            txc_ilane6;
   reg            txc_ilane5;
   reg            txc_ilane4;
   reg            txc_ilane3;
   reg            txc_ilane2;
   reg            txc_ilane1;
   reg            txc_ilane0;
   reg            txc_ilane7a;
   reg            txc_ilane6a;
   reg            txc_ilane5a;
   reg            txc_ilane4a;
   reg            txc_ilane3a;
   reg            txc_ilane2a;
   reg            txc_ilane1a;
   reg            txc_ilane0a;
   

   wire  tx_hb_byte0_time;
   wire  tx_hb_byte1_time;
   wire  tx_hb_byte2_time;
   wire  tx_hb_byte3_time;
   wire  tx_hb_byte4_time;
   wire  tx_hb_byte5_time;
   wire  tx_hb_byte6_time;
   wire  tx_hb_byte7_time;
   wire [63:0] txd_reg1;
   wire [7:0]  txc_reg1;
   wire [72:0] 	  mgtfifo_din;
   wire [72:0] 	  mgtfifo_dout;
   wire [7:0] 	  mgtfifo_dout_txc = mgtfifo_dout[71:64];
   wire 	  tx_det_S; // ipg_done and tx_det_S are level signals.
   wire 	  mgtfifo_wr_en;
   wire 	  mgtfifo_rd_en;
   wire           ipg_timer_ce;
   wire           ipg_done;         // level signal
   wire 	  mgtfifo_full_txnbclk;
   wire 	  mgtfifo_empty_txnbclk;
   wire 	  mgtfifo_unload_heart_beat;
   wire 	  adjust_mgtfifo_unload_heart_beat;
   wire [`BYTE]   gmii_txd;
   wire           gmii_tx_en;
   wire           gmii_tx_err;
   wire [`BYTE]   mgmii_txd;
   wire           mgmii_tx_en;
   wire           mgmii_tx_err;
   wire           tx_err_reg1,tx_on_hold,d_hw_reset_txnbclk,ipg_done_lead,
		  tx_en_trail,tx_err_ilane;
   
/**************************************************************************
 * Pay special attention to this synthesis result. It is timing critical.
 **************************************************************************/

/* -------------- 1st stage reg: change clock domain --------------- */

xREG3 #(64) txd_reg1_xREG3(.din(txd_image[63:0]),
                 .clk(tx_nbclk),
                 .en(tx_hb_byte1_time),
                 .reset(tx_reset_nbclk),
                 .rst(~mii_or_gmii_mode),
                 .qout(txd_reg1[63:0]));

xREG3 #(8)  txc_reg1_xREG3(.din(txc_image[7:0]),
                 .clk(tx_nbclk),
                 .en(tx_hb_byte1_time),
                 .reset(tx_reset_nbclk),
                 .rst(~mii_or_gmii_mode),
                 .qout(txc_reg1[7:0]));

xREG3 #(1)  tx_err_reg1_xREG3(.din(tx_err_image),
                 .clk(tx_nbclk),
                 .en(tx_hb_byte1_time),
                 .reset(tx_reset_nbclk),
                 .rst(~mii_or_gmii_mode),
                 .qout(tx_err_reg1));

   assign  tx_det_S = txc_reg1[0] & (txd_reg1[`BYTE0] == `S); //txc_reg1[0] == '1' is control
   assign  mgtfifo_din[`BYTE0] = tx_det_S ? 8'h55 : txd_reg1[`BYTE0];
   assign  mgtfifo_din[63:8]   = txd_reg1[63:8];
   assign  mgtfifo_din[64]     = tx_det_S ? 0     : txc_reg1[0]; // lane 0 for SOP
   assign  mgtfifo_din[71:65]  = txc_reg1[7:1];
   assign  mgtfifo_din[72]     = tx_err_reg1;
   
// set needs to have higher priority
   wire    reset_tx_on_hold = &txc_reg1;
   
SR_FF tx_on_mgmii_SR_FF(.set(tx_det_S),
                        .rst(reset_tx_on_hold),
                        .clk(tx_nbclk),
                        .reset(tx_reset_nbclk | (~mii_or_gmii_mode)),
                        .qout(tx_on_hold));   
   
   wire tx_on = (tx_on_hold | tx_det_S) & ~reset_tx_on_hold;

/* --------------- start of txfifo pointer Management --------------- */

   assign  mgtfifo_wr_en = (~mgtfifo_full_txnbclk) & tx_hb_byte2_time & tx_on ;

   assign  mgtfifo_rd_en = (~mgtfifo_empty_txnbclk) & ipg_done & 
          (mgtfifo_unload_heart_beat | adjust_mgtfifo_unload_heart_beat);

   assign  mgtfifo_full_txnbclk = (mgtfifo_wr_ptr[2] == (!mgtfifo_rd_ptr[2])) &&
                          (mgtfifo_wr_ptr[1:0] == mgtfifo_rd_ptr[1:0]);

   assign  mgtfifo_empty_txnbclk = (mgtfifo_wr_ptr[2:0] == mgtfifo_rd_ptr[2:0]);

   // read pointer
   always @ (posedge tx_nbclk)
     if (tx_reset_nbclk)
       mgtfifo_rd_ptr <= 0;
     else if (mgtfifo_rd_en)
       mgtfifo_rd_ptr <= mgtfifo_rd_ptr + 1;
     else 
       mgtfifo_rd_ptr <= mgtfifo_rd_ptr;

   // write pointer
   always @ (posedge tx_nbclk)
     if (tx_reset_nbclk)
       mgtfifo_wr_ptr <= 0;
     else if (mgtfifo_wr_en)
       mgtfifo_wr_ptr <= mgtfifo_wr_ptr + 1;
     else 
       mgtfifo_wr_ptr <= mgtfifo_wr_ptr;
   
/* --------------- end of mgtfifo pointer Management ---------------- */


/* --------------- tx_heart_beat_timer -------------------- */
FD1 d_hw_reset_txnbclk_FD1(.D(hw_reset_txnbclk),
                          .CP(tx_nbclk),
                          .Q(d_hw_reset_txnbclk));
   
   wire  hw_reset_txnbclk_lead = hw_reset_txnbclk & ~d_hw_reset_txnbclk;
   
   reg [3:0] tx_heart_beat_timer;

always @ (posedge tx_nbclk)
  if   (hw_reset_txnbclk_lead)
           tx_heart_beat_timer <= 0;
  else if (~mii_or_gmii_mode)
           tx_heart_beat_timer <= 0;
  else     tx_heart_beat_timer <= tx_heart_beat_timer + 1;


   reg [3:0] tx_heart_beat_timer_reg;
always  @ (posedge tx_nbclk)
  tx_heart_beat_timer_reg <= tx_heart_beat_timer;

   
   assign  tx_hb_byte0_time = gmii_mode ? (tx_heart_beat_timer[2:0] == 3'h0):
                                          (tx_heart_beat_timer[3:0] == 4'h0);
   assign  tx_hb_byte1_time = gmii_mode ? (tx_heart_beat_timer[2:0] == 3'h1):
                                          (tx_heart_beat_timer[3:0] == 4'h1);
   assign  tx_hb_byte2_time = gmii_mode ? (tx_heart_beat_timer[2:0] == 3'h2):
                                          (tx_heart_beat_timer[3:0] == 4'h2);
   assign  tx_hb_byte3_time = gmii_mode ? (tx_heart_beat_timer[2:0] == 3'h3):
                                          (tx_heart_beat_timer[3:0] == 4'h3);
   assign  tx_hb_byte4_time = gmii_mode ? (tx_heart_beat_timer[2:0] == 3'h4):
                                          (tx_heart_beat_timer[3:0] == 4'h4);
   assign  tx_hb_byte5_time = gmii_mode ? (tx_heart_beat_timer[2:0] == 3'h5):
                                          (tx_heart_beat_timer[3:0] == 4'h5);
   assign  tx_hb_byte6_time = gmii_mode ? (tx_heart_beat_timer[2:0] == 3'h6):
                                          (tx_heart_beat_timer[3:0] == 4'h6);
   assign  tx_hb_byte7_time = gmii_mode ? (tx_heart_beat_timer[2:0] == 3'h7):
                                          (tx_heart_beat_timer[3:0] == 4'h7);


// vlint flag_net_has_no_load            off
// vlint flag_dangling_net_within_module off
   wire    ipg_done_trail;
   wire    tx_en_lead;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load            on
   
/* --------------- mgtfifo_unload_timer ------------------- */
 PlsGen2 ipg_done_lead_PlsGen2 (.sig_in(ipg_done),.clk(tx_nbclk),
                   .lead(ipg_done_lead),.trail(ipg_done_trail));
   
   assign  adjust_mgtfifo_unload_heart_beat = ipg_done_lead;

   reg [3:0] mgtfifo_unload_timer;

always @ (posedge tx_nbclk)
  if (hw_reset_txnbclk_lead)
         mgtfifo_unload_timer <= 0;
  else if (adjust_mgtfifo_unload_heart_beat | (~mii_or_gmii_mode))
         mgtfifo_unload_timer <= 0;
  else   mgtfifo_unload_timer <= mgtfifo_unload_timer + 1;

assign mgtfifo_unload_heart_beat = mii_mode ? 
            (mgtfifo_unload_timer[3:0] == 4'b1111) :
            (mgtfifo_unload_timer[2:0] == 3'b111)  ;
   
/* --------------- ipg timer ------------------------------ */
 PlsGen2 tx_en_trail_PlsGen2 (.sig_in(mgmii_tx_en),.clk(tx_nbclk),
                        .lead(tx_en_lead),.trail(tx_en_trail));

  // ipg_timer
   reg [7 :0] ipg_timer;

always @ (posedge tx_nbclk)
if   (tx_reset_nbclk)
         ipg_timer <= 0;
else if (tx_en_trail) // load 12 by ipg value
         ipg_timer <= (mii_mode ? {ipg_value1[6:0],1'b0} : // 24 tx_nbclk = 12 bytes ipg
                                   ipg_value1[7:0]) ; 
else if (ipg_timer_ce)
         ipg_timer <= ipg_timer - 1;
else  // hold
         ipg_timer <= ipg_timer;

   assign  ipg_timer_ce = |ipg_timer; // level
   assign  ipg_done =  ~ipg_timer_ce; // level

   
/* --------------- txd parallel to serial shifter --------- */
always @ (posedge tx_nbclk)
  if (tx_reset_nbclk)
    begin
               txd_ilane7 <= 8'h55; // pa pattern, see 802.3z pp-35.8
               txd_ilane6 <= 8'h55; // pa pattern, see 802.3z pp-35.8
               txd_ilane5 <= 8'h55; // pa pattern, see 802.3z pp-35.8
               txd_ilane4 <= 8'h55; // pa pattern, see 802.3z pp-35.8
               txd_ilane3 <= 8'h55; // pa pattern, see 802.3z pp-35.8
               txd_ilane2 <= 8'h55; // pa pattern, see 802.3z pp-35.8
               txd_ilane1 <= 8'h55; // pa pattern, see 802.3z pp-35.8
               txd_ilane0 <= 8'h55; // pa pattern, see 802.3z pp-35.8
    end 
  else if (mgtfifo_rd_en)  // parallel load txd to shifter
    begin
               txd_ilane7 <= mgtfifo_dout[`BYTE7];
               txd_ilane6 <= mgtfifo_dout[`BYTE6];
               txd_ilane5 <= mgtfifo_dout[`BYTE5];
               txd_ilane4 <= mgtfifo_dout[`BYTE4];
               txd_ilane3 <= mgtfifo_dout[`BYTE3];
               txd_ilane2 <= mgtfifo_dout[`BYTE2];
               txd_ilane1 <= mgtfifo_dout[`BYTE1];
               txd_ilane0 <= mgtfifo_dout[`BYTE0];
    end 
  else     // shifting all the time
    begin
       if (gmii_mode)
	 begin
               txd_ilane7 <= 8'h55; // pa pattern, see 802.3z pp-35.8
               txd_ilane6 <= txd_ilane7;
               txd_ilane5 <= txd_ilane6;
               txd_ilane4 <= txd_ilane5;
               txd_ilane3 <= txd_ilane4;
               txd_ilane2 <= txd_ilane3;
               txd_ilane1 <= txd_ilane2;
               txd_ilane0 <= txd_ilane1;
          end
       else // mii_mode
	 begin
               txd_ilane7[`NIB1]  <= 4'h5; // pa pattern, see 802.3z pp-35.8
               txd_ilane6[`NIB1]  <= txd_ilane7[`NIB0];
               txd_ilane5[`NIB1]  <= txd_ilane6[`NIB0];
               txd_ilane4[`NIB1]  <= txd_ilane5[`NIB0];
               txd_ilane3[`NIB1]  <= txd_ilane4[`NIB0];
               txd_ilane2[`NIB1]  <= txd_ilane3[`NIB0];
               txd_ilane1[`NIB1]  <= txd_ilane2[`NIB0];
               txd_ilane0[`NIB1]  <= txd_ilane1[`NIB0];
	       //
               txd_ilane7[`NIB0]  <= txd_ilane7[`NIB1];
               txd_ilane6[`NIB0]  <= txd_ilane6[`NIB1];
               txd_ilane5[`NIB0]  <= txd_ilane5[`NIB1];
               txd_ilane4[`NIB0]  <= txd_ilane4[`NIB1];
               txd_ilane3[`NIB0]  <= txd_ilane3[`NIB1];
               txd_ilane2[`NIB0]  <= txd_ilane2[`NIB1];
               txd_ilane1[`NIB0]  <= txd_ilane1[`NIB1];
               txd_ilane0[`NIB0]  <= txd_ilane0[`NIB1];
         end
    end 

/* --------------- tx_en parallel to serial shifter ------- */
always @ (posedge tx_nbclk)
  if (tx_reset_nbclk)
    begin
               txc_ilane7  <= 0;
               txc_ilane6  <= 0;
               txc_ilane5  <= 0;
               txc_ilane4  <= 0;
               txc_ilane3  <= 0;
               txc_ilane2  <= 0;
               txc_ilane1  <= 0;
               txc_ilane0  <= 0;
               txc_ilane7a <= 0;
               txc_ilane6a <= 0;
               txc_ilane5a <= 0;
               txc_ilane4a <= 0;
               txc_ilane3a <= 0;
               txc_ilane2a <= 0;
               txc_ilane1a <= 0;
               txc_ilane0a <= 0;
    end 
 else if (mgtfifo_rd_en)    // load txc to shifter
    begin
               txc_ilane7  <= mgtfifo_dout_txc[7];
               txc_ilane6  <= mgtfifo_dout_txc[6];
               txc_ilane5  <= mgtfifo_dout_txc[5];
               txc_ilane4  <= mgtfifo_dout_txc[4];
               txc_ilane3  <= mgtfifo_dout_txc[3];
               txc_ilane2  <= mgtfifo_dout_txc[2];
               txc_ilane1  <= mgtfifo_dout_txc[1];
               txc_ilane0  <= mgtfifo_dout_txc[0];
               //
               txc_ilane7a <= mgtfifo_dout_txc[7];
               txc_ilane6a <= mgtfifo_dout_txc[6];
               txc_ilane5a <= mgtfifo_dout_txc[5];
               txc_ilane4a <= mgtfifo_dout_txc[4];
               txc_ilane3a <= mgtfifo_dout_txc[3];
               txc_ilane2a <= mgtfifo_dout_txc[2];
               txc_ilane1a <= mgtfifo_dout_txc[1];
               txc_ilane0a <= mgtfifo_dout_txc[0];
    end 
  else     // shifting all the time
    begin
          if (gmii_mode)
	    begin
               txc_ilane7  <= 1; // '1' is control signal
               txc_ilane6  <= txc_ilane7;
               txc_ilane5  <= txc_ilane6;
               txc_ilane4  <= txc_ilane5;
               txc_ilane3  <= txc_ilane4;
               txc_ilane2  <= txc_ilane3;
               txc_ilane1  <= txc_ilane2;
               txc_ilane0  <= txc_ilane1;
            end
          else // mii_mode
	    begin
               txc_ilane7a <= 1; // '1' is control signal
               txc_ilane7  <= txc_ilane7a;
               txc_ilane6a <= txc_ilane7;
               txc_ilane6  <= txc_ilane6a;
               txc_ilane5a <= txc_ilane6;
               txc_ilane5  <= txc_ilane5a;
               txc_ilane4a <= txc_ilane5;
               txc_ilane4  <= txc_ilane4a;
               txc_ilane3a <= txc_ilane4;
               txc_ilane3  <= txc_ilane3a;
               txc_ilane2a <= txc_ilane3;
               txc_ilane2  <= txc_ilane2a;
               txc_ilane1a <= txc_ilane2;
               txc_ilane1  <= txc_ilane1a;
               txc_ilane0a <= txc_ilane1;
               txc_ilane0  <= txc_ilane0a;
            end 
    end 

/* ------- register the mgtfifo output for tx_err --------- */

xREG3 #(1)  tx_err_ilane_xREG3(.din(mgtfifo_dout[72]),
                 .clk(tx_nbclk),
                 .en(mgtfifo_rd_en),
                 .reset(tx_reset_nbclk),
                 .rst(~mii_or_gmii_mode),
                 .qout(tx_err_ilane));

/* ------- register the output ---------------------------- */
   // gmii_txd, gmii_tx_en, and gmii_tx_err are all sharable
   // between gmii mode and mii mode of operation.
   // For mii_mode, just use the gmii_txd[3:0] bit will be fine
   assign  mgmii_txd    = txd_ilane0;
   assign  mgmii_tx_en  = ~txc_ilane0;
   assign  mgmii_tx_err = tx_err_ilane & mgmii_tx_en;
   
   wire    reset_gmii_regs = tx_reset_nbclk | (~mii_or_gmii_mode);
   
   // mii pins have been mux with gmii pins.
   wire  [`BYTE]  gmii_txd_shared = tx_output_en_nbclk ? (gmii_mode ? mgmii_txd[`BYTE] :
		  {mgmii_txd[`NIB0],mgmii_txd[`NIB0]}) :
                                                 8'h55 ;
   
RegRst2  #(8) gmii_txd_RegRst2(
.clk(tx_nbclk),
.reset(reset_gmii_regs),
.reset_value(8'h55),
.din(gmii_txd_shared),     // shared between gmii and mii 
.qout(gmii_txd[`BYTE])) ;
   
RegRst #(1) gmii_tx_en_RegRst(
.clk(tx_nbclk),
.reset(reset_gmii_regs),
.din(mgmii_tx_en & tx_output_en_nbclk),         // shared between gmii and mii 
.qout(gmii_tx_en));
   
RegDff #(1) mgmii_tx_err_RegDFF(
.din(mgmii_tx_err & tx_output_en_nbclk),        // shared between gmii and mii 
.clk(tx_nbclk),
.qout(gmii_tx_err));
   
 /* --------------- instantiation ------------------------------------ */

mgtfifo_memory_model mgtfifo_memory_model(
   .clk(tx_nbclk),
   .wp(mgtfifo_wr_ptr[1:0]),
   .rp(mgtfifo_rd_ptr[1:0]),
   .we(mgtfifo_wr_en),
   .din(mgtfifo_din[72:0]),
   .dout(mgtfifo_dout[72:0]));

endmodule // tx_mii_gmii


   
module mgtfifo_memory_model (clk,wp,rp,we,din,dout);
   input clk;
   input [1:0] wp,rp;
   input       we;
   input [72:0] din;
   output [72:0] dout;
/************************************************************************
 * It is important to have a 8 deep FIFO so that longer ipg can be used.   
 ************************************************************************/
reg  [72:0] mgtfifo_mem [0:3]; 

always @ (posedge clk)
  if (we)
    mgtfifo_mem[wp] <= din;
  else   // hold it
    mgtfifo_mem[wp] <= mgtfifo_mem[wp];
   
   assign     dout =  mgtfifo_mem[rp];
   
endmodule 
