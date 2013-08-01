// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rx_mii_gmii.v
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
 * File Name    : rx_mii_gmii
 * Author Name  : John Lo
 * Description  : txmac gmii interface logic
 * Parent Module: xmac
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 9/22/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes by loj: from hold_rxc -> g2x_rxc, hold_rxd -> g2x_rxd
 *                         are signal changing clk domain. They are
 *                         placed here to be able to close to each 
 *                         other to meet timing when synthesis/layout
 *                         time comes.
 * 
 *************************************************************************/

`include  "xmac.h"

module rx_mii_gmii ( 
   rx_nbclk,
   rx_reset_nbclk,
   hw_reset_rxnbclk,
   rxfifo_full_nbclk,
   rx_enable_nbclk,
   // mgmii loopback signals
   mgmii_txd,
   mgmii_tx_en,
   mgmii_tx_err,
   mii_mode,
   gmii_mode,
   mii_or_gmii_mode,
   loopback,
   // rx gmii signals
   gmii_rxd,
   gmii_rx_dv,
   gmii_rx_err,
// outputs
   inc_align_err_count_nbclk,
   rx_heart_beat_timer,
   rx_heart_beat_timer_reg,
   hold_rxd,
   hold_rx_dv,
   hold_rx_err,
   mgrlm_state
   );

   input          rx_nbclk;
   input 	  rx_reset_nbclk;
   input 	  hw_reset_rxnbclk;
   input 	  rxfifo_full_nbclk;
   input 	  rx_enable_nbclk;
   // mgmii loopback signals
   input [`BYTE]  mgmii_txd;
   input          mgmii_tx_en;
   input          mgmii_tx_err;
   input 	  mii_mode;
   input 	  gmii_mode;
   input 	  mii_or_gmii_mode;
   input 	  loopback;
   // gmii signals
   input [`BYTE]  gmii_rxd;
   input          gmii_rx_dv;
   input 	  gmii_rx_err;
// outputs
   output 	  inc_align_err_count_nbclk;
   output [3:0]   rx_heart_beat_timer; // to clock mux
   output [3:0]   rx_heart_beat_timer_reg;
   output [63:0]  hold_rxd;
   output [7:0]   hold_rx_dv;
   output 	  hold_rx_err;
   output 	  mgrlm_state;

   reg [`BYTE] 	  rxd_ilane7;  // internal lane
   reg [`BYTE] 	  rxd_ilane6;  // internal lane
   reg [`BYTE] 	  rxd_ilane5;  // internal lane
   reg [`BYTE] 	  rxd_ilane4;  // internal lane
   reg [`BYTE] 	  rxd_ilane3;  // internal lane
   reg [`BYTE]    rxd_ilane2;  // internal lane
   reg [`BYTE]    rxd_ilane1;  // internal lane
   reg [`BYTE]    rxd_ilane0;  // internal lane
   reg [`NIB]     rxd_ilaneX;  // internal lane
   reg            rx_dv_ilane7;
   reg            rx_dv_ilane6;
   reg            rx_dv_ilane5;
   reg            rx_dv_ilane4;
   reg            rx_dv_ilane3;
   reg            rx_dv_ilane2;
   reg            rx_dv_ilane1;
   reg            rx_dv_ilane0;
   reg            rx_dv_ilane7a;
   reg            rx_dv_ilane6a;
   reg            rx_dv_ilane5a;
   reg            rx_dv_ilane4a;
   reg            rx_dv_ilane3a;
   reg            rx_dv_ilane2a;
   reg            rx_dv_ilane1a;
   reg            rx_dv_ilane0a;
   reg            rx_dv_ilaneX;
   reg            rx_err_ilane7;
   reg            rx_err_ilane6;
   reg            rx_err_ilane5;
   reg            rx_err_ilane4;
   reg            rx_err_ilane3;
   reg            rx_err_ilane2;
   reg            rx_err_ilane1;
   reg            rx_err_ilane0;
   reg            rx_err_ilane7a;
   reg            rx_err_ilane6a;
   reg            rx_err_ilane5a;
   reg            rx_err_ilane4a;
   reg            rx_err_ilane3a;
   reg            rx_err_ilane2a;
   reg            rx_err_ilane1a;
   reg            rx_err_ilane0a;
   wire 	  load_ok_state;
   
// S = 8'hFB, T = 8'hFD, E = 8'hFE, I = 8'h07
// in 802.3z pp-36A.2 shows PA => FB 55 55 55 55 55 55 D5 (big endian format)
//                                                      ^
// detect SFD logic
// sfd is send out by rising edge clk.

   wire 	  rx_det_sfd;
   wire 	  rx_det_eop_lv;
   wire 	  adjust_rx_heart_beat; // should be a pulse
   wire 	  rx_heart_beat;
   wire 	  hw_reset_rxnbclk_lead;
   wire 	  d_hw_reset_rxnbclk;
   wire [`BYTE]   g_rxd;
   wire 	  g_rx_err;
   wire 	  g_rx_err_lv;
   wire 	  mg_rx_dv_trail;
   wire [`BYTE]   mg_rxd;
   wire 	  mg_rx_dv;
   wire           mg_rx_err;
   wire [`BYTE]   mg_rxd_mux;
   wire 	  mg_rx_dv_mux;
   wire           mg_rx_err_mux;
   wire 	  rx_dv_ilane0_lead,rx_dv_ilaneX_lead,sfd_win;

   
   // vlint flag_net_has_no_load            off
   // vlint flag_dangling_net_within_module off
   wire 	  rx_dv_ilane0_trail;
   wire 	  rx_dv_ilaneX_trail;
   wire 	  mg_rx_dv_lead;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load            on
   
/* ------------ sfd qulification logic -------------------------- */

PlsGen2 rx_dv_ilane0_PlsGen2(.sig_in(rx_dv_ilane0),.clk(rx_nbclk),
                             .lead  (rx_dv_ilane0_lead),
                             .trail (rx_dv_ilane0_trail));

PlsGen2 rx_dv_ilaneX_PlsGen2(.sig_in(rx_dv_ilaneX),.clk(rx_nbclk),
                             .lead  (rx_dv_ilaneX_lead),
                             .trail (rx_dv_ilaneX_trail));

   wire 	  set_sfd_win = gmii_mode ? rx_dv_ilane0_lead : 
                                            rx_dv_ilaneX_lead ;
   

SRFF sfd_win_SRFF(.reset(rx_reset_nbclk),.clk(rx_nbclk),
                 .iSet(set_sfd_win),
                 .iRst(rx_det_sfd),
                 .oQ(sfd_win));

/* ---------- Data path ----------------------------------------- */


RegDff #(8) g_rxd_RegDff    (.din(gmii_rxd),   .clk(rx_nbclk),.qout(g_rxd));
RegDff #(1) mg_rx_dv_RegDff (.din(gmii_rx_dv), .clk(rx_nbclk),.qout(mg_rx_dv));
RegDff #(1) mg_rx_err_RegDff(.din(gmii_rx_err),.clk(rx_nbclk),.qout(g_rx_err));

// Mainly to take care of the rx_err happend in pa time 
RS_FF   g_rx_err_lv_RS_FF (.set(g_rx_err),
                           .rst(mg_rx_dv_trail),
                           .clk(rx_nbclk),
                           .reset(rx_reset_nbclk),
                           .qout(g_rx_err_lv));

PlsGen2 mg_rx_dv_trail_PlsGen2(.sig_in(mg_rx_dv),
                               .clk(rx_nbclk),
                               .lead(mg_rx_dv_lead),
                               .trail(mg_rx_dv_trail));

   assign  mg_rx_err = mg_rx_dv & (g_rx_err | g_rx_err_lv);
   assign  mg_rxd       = gmii_mode? g_rxd        : {4'h0,g_rxd[`NIB]};
   assign  mg_rxd_mux   = loopback ? mgmii_txd    : mg_rxd;
   assign  mg_rx_dv_mux = loopback ? mgmii_tx_en  : mg_rx_dv;
   assign  mg_rx_err_mux= loopback ? mgmii_tx_err : mg_rx_err;
   

/* ---------- 1st stage: serial to paralle shifter --------------- */
// rxd serial shifter
// rxd shifting is achieved by using `NIB0 to `NIB1.
// It is different from rx_dv which requires rx_dv_ilane?a.
  
always @ (posedge rx_nbclk)
  if (gmii_mode)
    begin
          rxd_ilane7 <= mg_rxd_mux[`BYTE]; 
          rxd_ilane6 <= rxd_ilane7; 
          rxd_ilane5 <= rxd_ilane6; 
          rxd_ilane4 <= rxd_ilane5; 
          rxd_ilane3 <= rxd_ilane4; 
          rxd_ilane2 <= rxd_ilane3; 
          rxd_ilane1 <= rxd_ilane2; 
          rxd_ilane0 <= rxd_ilane1; 
          rxd_ilaneX <= 0;
    end 
  else // 10/100M mode; mii_mode
    begin // rxd nibble shifting is achieved by using `NIB0 to `NIB1.
          rxd_ilane7[`NIB0] <= mg_rxd_mux[`NIB];
          rxd_ilane7[`NIB1] <= rxd_ilane7[`NIB0];
          rxd_ilane6[`NIB0] <= rxd_ilane7[`NIB1];
          rxd_ilane6[`NIB1] <= rxd_ilane6[`NIB0];
          rxd_ilane5[`NIB0] <= rxd_ilane6[`NIB1];
          rxd_ilane5[`NIB1] <= rxd_ilane5[`NIB0];
          rxd_ilane4[`NIB0] <= rxd_ilane5[`NIB1];
          rxd_ilane4[`NIB1] <= rxd_ilane4[`NIB0];
          rxd_ilane3[`NIB0] <= rxd_ilane4[`NIB1];
          rxd_ilane3[`NIB1] <= rxd_ilane3[`NIB0];
          rxd_ilane2[`NIB0] <= rxd_ilane3[`NIB1];
          rxd_ilane2[`NIB1] <= rxd_ilane2[`NIB0];
          rxd_ilane1[`NIB0] <= rxd_ilane2[`NIB1];
          rxd_ilane1[`NIB1] <= rxd_ilane1[`NIB0];
          rxd_ilane0[`NIB0] <= rxd_ilane1[`NIB1];
          rxd_ilane0[`NIB1] <= rxd_ilane0[`NIB0];
          rxd_ilaneX[`NIB]  <= rxd_ilane0[`NIB1];
    end

// rx_dv serial shifter
always @ (posedge rx_nbclk)
  if (gmii_mode)
    begin
          rx_dv_ilane7  <= mg_rx_dv_mux;
          rx_dv_ilane6  <= rx_dv_ilane7; 
          rx_dv_ilane5  <= rx_dv_ilane6; 
          rx_dv_ilane4  <= rx_dv_ilane5; 
          rx_dv_ilane3  <= rx_dv_ilane4; 
          rx_dv_ilane2  <= rx_dv_ilane3; 
          rx_dv_ilane1  <= rx_dv_ilane2; 
          rx_dv_ilane0  <= rx_dv_ilane1;
          //
          rx_dv_ilane7a <= 0;
          rx_dv_ilane6a <= 0; 
          rx_dv_ilane5a <= 0; 
          rx_dv_ilane4a <= 0; 
          rx_dv_ilane3a <= 0; 
          rx_dv_ilane2a <= 0; 
          rx_dv_ilane1a <= 0; 
          rx_dv_ilane0a <= 0;
          rx_dv_ilaneX  <= 0;             // laneX
    end 
  else // mii_mode; 10/100Mhz mode
    begin
          rx_dv_ilane7a <= mg_rx_dv_mux ;
          rx_dv_ilane7  <= rx_dv_ilane7a; 
          rx_dv_ilane6a <= rx_dv_ilane7 ; 
          rx_dv_ilane6  <= rx_dv_ilane6a; 
          rx_dv_ilane5a <= rx_dv_ilane6 ; 
          rx_dv_ilane5  <= rx_dv_ilane5a; 
          rx_dv_ilane4a <= rx_dv_ilane5 ; 
          rx_dv_ilane4  <= rx_dv_ilane4a; 
          rx_dv_ilane3a <= rx_dv_ilane4 ; 
          rx_dv_ilane3  <= rx_dv_ilane3a; 
          rx_dv_ilane2a <= rx_dv_ilane3 ; 
          rx_dv_ilane2  <= rx_dv_ilane2a; 
          rx_dv_ilane1a <= rx_dv_ilane2 ; 
          rx_dv_ilane1  <= rx_dv_ilane1a; 
          rx_dv_ilane0a <= rx_dv_ilane1 ; 
          rx_dv_ilane0  <= rx_dv_ilane0a;
          rx_dv_ilaneX  <= rx_dv_ilane0 ; // laneX
    end 

// rx_err serial shifter   
always @ (posedge rx_nbclk)
  if (gmii_mode)
    begin // gmii_mode
          rx_err_ilane7  <= mg_rx_err_mux;
          rx_err_ilane6  <= rx_err_ilane7; 
          rx_err_ilane5  <= rx_err_ilane6; 
          rx_err_ilane4  <= rx_err_ilane5; 
          rx_err_ilane3  <= rx_err_ilane4; 
          rx_err_ilane2  <= rx_err_ilane3; 
          rx_err_ilane1  <= rx_err_ilane2; 
          rx_err_ilane0  <= rx_err_ilane1;
          //
          rx_err_ilane7a <= 0;
          rx_err_ilane6a <= 0; 
          rx_err_ilane5a <= 0; 
          rx_err_ilane4a <= 0; 
          rx_err_ilane3a <= 0; 
          rx_err_ilane2a <= 0; 
          rx_err_ilane1a <= 0; 
          rx_err_ilane0a <= 0;
    end 
 else
    begin // mii_mode
          rx_err_ilane7a <= mg_rx_err_mux ;
          rx_err_ilane7  <= rx_err_ilane7a; 
          rx_err_ilane6a <= rx_err_ilane7 ; 
          rx_err_ilane6  <= rx_err_ilane6a; 
          rx_err_ilane5a <= rx_err_ilane6 ; 
          rx_err_ilane5  <= rx_err_ilane5a; 
          rx_err_ilane4a <= rx_err_ilane5 ; 
          rx_err_ilane4  <= rx_err_ilane4a; 
          rx_err_ilane3a <= rx_err_ilane4 ; 
          rx_err_ilane3  <= rx_err_ilane3a; 
          rx_err_ilane2a <= rx_err_ilane3 ; 
          rx_err_ilane2  <= rx_err_ilane2a; 
          rx_err_ilane1a <= rx_err_ilane2 ; 
          rx_err_ilane1  <= rx_err_ilane1a; 
          rx_err_ilane0a <= rx_err_ilane1 ; 
          rx_err_ilane0  <= rx_err_ilane0a; 
    end 
 
/* --- end of 1st stage: serial to paralle shifter --------------- */

   wire [63:0] parallel_rxd = gmii_mode ?
			     (
                               load_ok_state ?
                                  {rxd_ilane7,
                                   rxd_ilane6,
                                   rxd_ilane5,
                                   rxd_ilane4,
                                   rxd_ilane3,
                                   rxd_ilane2,
                                   rxd_ilane1,
                                   rxd_ilane0} : 0
			     )      :
			     (
                               load_ok_state ?
                                  {rxd_ilane7[`NIB0], // nibble swap
                                   rxd_ilane7[`NIB1], // nibble swap
                                   rxd_ilane6[`NIB0], // nibble swap
                                   rxd_ilane6[`NIB1], // nibble swap
                                   rxd_ilane5[`NIB0], // nibble swap
                                   rxd_ilane5[`NIB1], // nibble swap
                                   rxd_ilane4[`NIB0], // nibble swap
                                   rxd_ilane4[`NIB1], // nibble swap
                                   rxd_ilane3[`NIB0], // nibble swap
                                   rxd_ilane3[`NIB1], // nibble swap
                                   rxd_ilane2[`NIB0], // nibble swap
                                   rxd_ilane2[`NIB1], // nibble swap
                                   rxd_ilane1[`NIB0], // nibble swap
                                   rxd_ilane1[`NIB1], // nibble swap
                                   rxd_ilane0[`NIB0], // nibble swap
                                   rxd_ilane0[`NIB1]} : 0
			     );

   wire [`BYTE] parallel_rx_dv  = load_ok_state ?
                                  {rx_dv_ilane7,
                                   rx_dv_ilane6,
                                   rx_dv_ilane5,
                                   rx_dv_ilane4,
                                   rx_dv_ilane3,
                                   rx_dv_ilane2,
                                   rx_dv_ilane1,
                                   rx_dv_ilane0} : 0;

   wire  parallel_rx_err  = load_ok_state ?
                           (rx_err_ilane7 |
                            rx_err_ilane6 |
                            rx_err_ilane5 |
                            rx_err_ilane4 |
                            rx_err_ilane3 |
                            rx_err_ilane2 |
                            rx_err_ilane1 |
                            rx_err_ilane0 ) : 0;
   
   wire  inc_align_err_count_nbclk = load_ok_state & rx_heart_beat & mii_mode ?
	                     ((rx_dv_ilane7 != rx_dv_ilane7a) |
	                      (rx_dv_ilane6 != rx_dv_ilane6a) |
	                      (rx_dv_ilane5 != rx_dv_ilane5a) |
	                      (rx_dv_ilane4 != rx_dv_ilane4a) |
	                      (rx_dv_ilane3 != rx_dv_ilane3a) |
	                      (rx_dv_ilane2 != rx_dv_ilane2a) |
	                      (rx_dv_ilane1 != rx_dv_ilane1a) |
	                      (rx_dv_ilane0 != rx_dv_ilane0a) ) : 0;

/* ---------- 2nd stage to hold the data: change clock domain --- */
   wire [63:0] 	  hold_rxd;
   wire [7:0] 	  hold_rx_dv;
   wire 	  hold_rx_err;
   
xREG3 #(64) hold_rxd_xREG3(.din(parallel_rxd[63:0]),
                       .clk(rx_nbclk),
                       .en(rx_heart_beat),
                       .reset(rx_reset_nbclk),
		       .rst(rxfifo_full_nbclk),
                       .qout(hold_rxd[63:0]));
   
xREG3 #(8)  hold_rx_dv_xREG3(.din(parallel_rx_dv),
                       .clk(rx_nbclk),
                       .en(rx_heart_beat),
                       .reset(rx_reset_nbclk),
		       .rst(rxfifo_full_nbclk),
                       .qout(hold_rx_dv[7:0]));

xREG3 #(1)  hold_rx_err_xREG3(.din(parallel_rx_err),
                       .clk(rx_nbclk),
                       .en(rx_heart_beat),
                       .reset(rx_reset_nbclk),
		       .rst(rxfifo_full_nbclk),
                       .qout(hold_rx_err));


/* ---------- control logic ------------------------------------- */
   
// sfd detection: maybe a pulse assign      
// load_ok_state = (grlm_state == PAYLOAD)

   assign  rx_det_sfd =  gmii_mode ? // a pulse
	                 ((rxd_ilane0[`BYTE0] == `SFD_GMII) & // SFD_GMII == 'hD5
                           sfd_win) : // mii_mode
                         (({rxd_ilaneX[`NIB],rxd_ilane0[`NIB1]} == `SFD_MII) & // SFD_MII == 'h5D
                           sfd_win) ; // grlm_state NOT in PAYLOAD state

// eop detection: it is a level
   
   assign  rx_det_eop_lv = ~(rx_dv_ilane0 &
                          rx_dv_ilane1 &
                          rx_dv_ilane2 &
                          rx_dv_ilane3 &
                          rx_dv_ilane4 &
                          rx_dv_ilane5 &
                          rx_dv_ilane6 &
                          rx_dv_ilane7);


//PlsGen rx_det_eop_lead_PlsGen(.reset(rx_reset_nbclk),
//                         .clk(rx_nbclk),
//                         .iSigIn(rx_det_eop_lv),
//                         .oPlsOut(rx_det_eop_lead));

   
/* --------------- rx_heart_beat timer -------------------- */
FD1 d_hw_reset_rxnbclk_FD1(.D(hw_reset_rxnbclk),
                          .CP(rx_nbclk),
                          .Q(d_hw_reset_rxnbclk));
   
   assign  hw_reset_rxnbclk_lead = hw_reset_rxnbclk & ~d_hw_reset_rxnbclk;
   
   reg [3:0]      rx_heart_beat_timer;

always @ (posedge rx_nbclk)
  if   (hw_reset_rxnbclk_lead)
           rx_heart_beat_timer <= 0;
  else if (adjust_rx_heart_beat | (~mii_or_gmii_mode))
           rx_heart_beat_timer <= 0;
  else     rx_heart_beat_timer <= rx_heart_beat_timer + 1;

   reg [3:0] rx_heart_beat_timer_reg;
always  @ (posedge rx_nbclk)
  rx_heart_beat_timer_reg <= rx_heart_beat_timer;


   assign  rx_heart_beat = mii_mode ?
                      (rx_heart_beat_timer[3:0] == 4'b0) :
                      (rx_heart_beat_timer[2:0] == 3'b0) ;// load time


/* --------------- instantiation -------------------------- */
mgrlm_sm  mgrlm_sm(
   .rx_nbclk(rx_nbclk),
   .rx_reset_nbclk(rx_reset_nbclk),
   .rx_enable_nbclk(rx_enable_nbclk),
   .rx_det_sfd(rx_det_sfd),         // ipg_done and rx_det_S are level signals.
   .rx_det_eop_lv(rx_det_eop_lv),         // rx_det_sfd is level signals.
   .rx_heart_beat(rx_heart_beat),
   .rxfifo_full_nbclk(rxfifo_full_nbclk),
   // outputs
   .load_ok_state(load_ok_state),
   .adjust_rx_heart_beat(adjust_rx_heart_beat),	 // should be a pulse
   .mgrlm_state(mgrlm_state)
              );
 
endmodule // rx_mii_gmii
