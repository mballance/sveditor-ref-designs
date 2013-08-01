// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_sync.v
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
module xpcs_sync (core_clk, 
                  tx_clk,

                  rbc0_a,

                  sw_reset,
                  pio_core_reset,

                  inc_tx_pkt_count_ref,
                  inc_rx_pkt_count_ref,

                  inc_tx_pkt_count,
                  inc_rx_pkt_count,

                  csr_pulse_deskew_error,

                  csr_transmit_fault_ref,
                  csr_receive_fault_ref,

                  csr_trigger_transmit_fault,
                  csr_trigger_receive_fault,
 
                  inc_deskew_error,

                  reset_rxclk,
                  reset_txclk,
          
                  clr_sw_reset,

                  rx_error_0,
                  rx_error_1,
                  rx_error_2,
                  rx_error_3,

                  trigger_symbol_err_cnt0,
                  trigger_symbol_err_cnt1,
                  trigger_symbol_err_cnt2,
                  trigger_symbol_err_cnt3,

                  hw_reset,

                  reset

                );

 input  core_clk;

 input  tx_clk;          // 312 Mhz TCLK from serdes

 input  rbc0_a;        // 312 Mhz rx clock from serdes

 input  sw_reset;
 input  pio_core_reset;

 input  csr_pulse_deskew_error;

 input  inc_tx_pkt_count_ref;
 input  inc_rx_pkt_count_ref;

 input  csr_transmit_fault_ref;
 input  csr_receive_fault_ref;

 input  rx_error_0;
 input  rx_error_1;
 input  rx_error_2;
 input  rx_error_3;

 output reset_txclk;
 output reset_rxclk;
 output reset;
 output hw_reset;
 output clr_sw_reset;

 output inc_tx_pkt_count;
 output inc_rx_pkt_count;

 output inc_deskew_error;

 output csr_trigger_transmit_fault;
 output csr_trigger_receive_fault;

 output trigger_symbol_err_cnt0;
 output trigger_symbol_err_cnt1;
 output trigger_symbol_err_cnt2;
 output trigger_symbol_err_cnt3;

 reg    trigger_inc_tx_pkt_count_ref;
 reg    inc_tx_pkt_count_ref_d;
 wire   inc_tx_pkt_count;
 wire   clr_trigger_inc_tx_pkt_count_ref;

 reg    trigger_inc_rx_pkt_count_ref;
 reg    inc_rx_pkt_count_ref_d;
 wire   inc_rx_pkt_count;
 wire   inc_rx_pkt_count_ref_coreclk;
 wire   clr_trigger_inc_rx_pkt_count_ref;

 reg    pulse_deskew_error_ref;

 wire   pulse_deskew_error;
 wire   clr_pulse_deskew_error_ref;

 wire   set_receive_fault;
 reg    set_receive_fault_ref;

 wire   set_transmit_fault;
 reg    set_transmit_fault_ref;

 reg    csr_pulse_deskew_error_d;
 reg    csr_transmit_fault_ref_d;
 reg    csr_receive_fault_ref_d;

 wire   clr_set_receive_fault_ref;
 wire   csr_trigger_receive_fault;

 wire   clr_set_transmit_fault_ref;
 wire   csr_trigger_transmit_fault;

 reg    reset;
 reg    hw_reset;

 wire   reset_rxclk;
 wire   reset_txclk;

 wire   clr_sw_reset_int0;
 wire   clr_sw_reset_int1;
 wire   clr_sw_reset;

 reg [3:0] symbol_err_cnt0;
 reg [3:0] symbol_err_cnt1; 
 reg [3:0] symbol_err_cnt2; 
 reg [3:0] symbol_err_cnt3; 

 reg  symbol_err_cnt0_d;
 reg  trigger_symbol_err_cnt0_rx;
 reg  trigger_symbol_err_cnt0_core_d;
 wire trigger_symbol_err_cnt0_core;
 wire clr_trigger_trigger_symbol_err_cnt0_rx;
 wire trigger_symbol_err_cnt0;

 reg  symbol_err_cnt1_d;
 reg  trigger_symbol_err_cnt1_rx;
 reg  trigger_symbol_err_cnt1_core_d;
 wire trigger_symbol_err_cnt1_core;
 wire clr_trigger_trigger_symbol_err_cnt1_rx;
 wire trigger_symbol_err_cnt1;

 reg  symbol_err_cnt2_d;
 reg  trigger_symbol_err_cnt2_rx;
 reg  trigger_symbol_err_cnt2_core_d;
 wire trigger_symbol_err_cnt2_core;
 wire clr_trigger_trigger_symbol_err_cnt2_rx;
 wire trigger_symbol_err_cnt2;

 reg  symbol_err_cnt3_d;
 reg  trigger_symbol_err_cnt3_rx;
 reg  trigger_symbol_err_cnt3_core_d;
 wire trigger_symbol_err_cnt3_core;
 wire clr_trigger_trigger_symbol_err_cnt3_rx;
 wire trigger_symbol_err_cnt3;


// ******************
// xpcs reset logic
// ******************

 always @ (posedge core_clk)
    hw_reset <= pio_core_reset;

 always @ (posedge core_clk)
     reset <= (hw_reset | sw_reset);

 SYNC_CELL XPCS_CLR_SW_RESET_INT0 (.D(sw_reset),          .CP(tx_clk),  .Q(clr_sw_reset_int0));
 SYNC_CELL XPCS_CLR_SW_RESET_INT1 (.D(clr_sw_reset_int0), .CP(rbc0_a),  .Q(clr_sw_reset_int1));
 SYNC_CELL XPCS_CLR_SW_RESET      (.D(clr_sw_reset_int1), .CP(core_clk),.Q(clr_sw_reset));

 SYNC_CELL reset_txclk_CLK  (.D(reset), .CP(tx_clk), .Q(reset_txclk));
 SYNC_CELL reset_rxclk_CLK  (.D(reset), .CP(rbc0_a), .Q(reset_rxclk));


// ********************************
// Rx packet Counter trigger
// ********************************
 
 always @ (posedge rbc0_a)
    inc_rx_pkt_count_ref_d <= inc_rx_pkt_count_ref;

 always @ (posedge rbc0_a)
    trigger_inc_rx_pkt_count_ref <= (reset_rxclk | clr_trigger_inc_rx_pkt_count_ref) ? 1'b0 :
                                    (inc_rx_pkt_count_ref & !inc_rx_pkt_count_ref_d)   ? 1'b1 :
                                     trigger_inc_rx_pkt_count_ref;

 SYNC_CELL XPCS_INC_RX_PKT_SYNC (.D(trigger_inc_rx_pkt_count_ref),
                                .CP(core_clk),
                                .Q(inc_rx_pkt_count_ref_coreclk));

 assign inc_rx_pkt_count = inc_rx_pkt_count_ref_coreclk;

 SYNC_CELL XPCS_CLR_RX_PKT_SYNC (.D(inc_rx_pkt_count),
                                .CP(rbc0_a),
                                .Q(clr_trigger_inc_rx_pkt_count_ref));

// ********************************
// Tx packet Counter trigger
// ********************************

 always @ (posedge tx_clk)
    inc_tx_pkt_count_ref_d <= inc_tx_pkt_count_ref;

 always @ (posedge tx_clk)
     trigger_inc_tx_pkt_count_ref <= (reset_txclk | clr_trigger_inc_tx_pkt_count_ref) ? 1'b0 :
                                     (inc_tx_pkt_count_ref & !inc_tx_pkt_count_ref_d)  ? 1'b1 :
                                      trigger_inc_tx_pkt_count_ref;

 SYNC_CELL XPCS_INC_TX_PKT_SYNC (.D(trigger_inc_tx_pkt_count_ref),
                                .CP(core_clk),
                                .Q(inc_tx_pkt_count));

 SYNC_CELL XPCS_CLR_TX_PKT_SYNC (.D(inc_tx_pkt_count),
                                .CP(tx_clk),
                                .Q(clr_trigger_inc_tx_pkt_count_ref));


// ********************************
// Deskew Error Counter trigger
// ********************************

 always @ (posedge tx_clk)
    csr_pulse_deskew_error_d <= csr_pulse_deskew_error;

 always @ (posedge tx_clk)
     pulse_deskew_error_ref <= (reset_txclk | clr_pulse_deskew_error_ref) ? 1'b0 :
                               (csr_pulse_deskew_error & !csr_pulse_deskew_error_d) ? 1'b1 :
                                pulse_deskew_error_ref;

 SYNC_CELL XPCS_INC_DESKEW_ERR_SYNC (.D(pulse_deskew_error_ref),
                                     .CP(core_clk),
                                     .Q(pulse_deskew_error));

 assign inc_deskew_error = pulse_deskew_error;

 SYNC_CELL XPCS_CLR_DESKEW_ERR_SYNC (.D(inc_deskew_error),
                                     .CP(tx_clk),
                                     .Q(clr_pulse_deskew_error_ref));


// ********************************
// Transmit fault trigger
// ********************************

 always @ (posedge tx_clk)
    csr_transmit_fault_ref_d <= csr_transmit_fault_ref;

 always @ (posedge tx_clk)
    set_transmit_fault_ref <= (reset_txclk | clr_set_transmit_fault_ref) ? 1'b0 :
                              (csr_transmit_fault_ref & !csr_transmit_fault_ref_d) ? 1'b1 :
                               set_transmit_fault_ref;

 SYNC_CELL XPCS_INC_TX_FAULT_SYNC (.D(set_transmit_fault_ref),
                                   .CP(core_clk),
                                   .Q(set_transmit_fault));

 assign csr_trigger_transmit_fault = set_transmit_fault;

 SYNC_CELL XPCS_CLR_TX_FAULT_SYNC (.D(csr_trigger_transmit_fault),
                                   .CP(tx_clk),
                                   .Q(clr_set_transmit_fault_ref));


 
// ********************************
// Receive fault trigger
// ********************************

 always @ (posedge rbc0_a)
    csr_receive_fault_ref_d <= csr_receive_fault_ref;

 always @ (posedge rbc0_a)
       set_receive_fault_ref <= (reset_rxclk | clr_set_receive_fault_ref) ? 1'b0 :
                                (csr_receive_fault_ref & !csr_receive_fault_ref_d) ? 1'b1 :
                                 set_receive_fault_ref;

 SYNC_CELL XPCS_INC_RX_FAULT_SYNC (.D(set_receive_fault_ref),
                                   .CP(core_clk),
                                   .Q(set_receive_fault));

 assign csr_trigger_receive_fault = set_receive_fault;

 SYNC_CELL XPCS_CLR_RX_FAULT_SYNC (.D(csr_trigger_receive_fault),
                                   .CP(rbc0_a),
                                   .Q(clr_set_receive_fault_ref));
   

// ********************************
// Symbol error counter logic 0
// ********************************

always @ (posedge rbc0_a)
    if (reset_rxclk)   
         symbol_err_cnt0 <= 4'b0;
    else if (rx_error_0) 
         symbol_err_cnt0 <= symbol_err_cnt0 + 4'h1;  
    else
         symbol_err_cnt0 <= symbol_err_cnt0;

 always @ (posedge rbc0_a)
    symbol_err_cnt0_d <= symbol_err_cnt0[3];

 always @ (posedge rbc0_a)
  if (reset_rxclk)
     trigger_symbol_err_cnt0_rx <= 1'b0;
  else
     trigger_symbol_err_cnt0_rx <= (symbol_err_cnt0[3] & !symbol_err_cnt0_d) ? 1'b1 :
			        	(clr_trigger_trigger_symbol_err_cnt0_rx) ? 1'b0 :
                                          trigger_symbol_err_cnt0_rx;

 SYNC_CELL SYMBOL_ERR0_SYNC (.D(trigger_symbol_err_cnt0_rx),
                                 .CP(core_clk),
                                 .Q(trigger_symbol_err_cnt0_core));

 SYNC_CELL CLR_SYMBOL_ERR0_SYNC (.D(trigger_symbol_err_cnt0_core),
                                     .CP(rbc0_a),
                                     .Q(clr_trigger_trigger_symbol_err_cnt0_rx));

 always @ (posedge core_clk)
    trigger_symbol_err_cnt0_core_d <= trigger_symbol_err_cnt0_core;

 assign trigger_symbol_err_cnt0 = trigger_symbol_err_cnt0_core & !trigger_symbol_err_cnt0_core_d;



// ********************************
// Symbol error counter logic 1
// ********************************



always @ (posedge rbc0_a)
    if (reset_rxclk)
         symbol_err_cnt1 <= 4'b0;
    else if (rx_error_1)
	 symbol_err_cnt1 <= symbol_err_cnt1 + 4'h1;
    else
         symbol_err_cnt1 <= symbol_err_cnt1;


 always @ (posedge rbc0_a)
    symbol_err_cnt1_d <= symbol_err_cnt1[3];

 always @ (posedge rbc0_a)
  if (reset_rxclk)
		trigger_symbol_err_cnt1_rx <= 1'b0;
  else
      	trigger_symbol_err_cnt1_rx <= (symbol_err_cnt1[3] & !symbol_err_cnt1_d) ? 1'b1 :
 	(clr_trigger_trigger_symbol_err_cnt1_rx) ? 1'b0 :
                                          trigger_symbol_err_cnt1_rx;

 SYNC_CELL SYMBOL_ERR1_SYNC (.D(trigger_symbol_err_cnt1_rx),
                                 .CP(core_clk),
	.Q(trigger_symbol_err_cnt1_core));

 SYNC_CELL CLR_SYMBOL_ERR1_SYNC (.D(trigger_symbol_err_cnt1_core),
                                     .CP(rbc0_a),
                                     .Q(clr_trigger_trigger_symbol_err_cnt1_rx));

 always @ (posedge core_clk)
    trigger_symbol_err_cnt1_core_d <= trigger_symbol_err_cnt1_core;

 assign trigger_symbol_err_cnt1 = trigger_symbol_err_cnt1_core & !trigger_symbol_err_cnt1_core_d;



// ********************************
// Symbol error counter logic 2
// ********************************


always @ (posedge rbc0_a)
    if (reset_rxclk)
         symbol_err_cnt2 <= 4'b0;
    else if (rx_error_2)
	 symbol_err_cnt2 <= symbol_err_cnt2 + 4'h1;
    else
         symbol_err_cnt2 <= symbol_err_cnt2;


 always @ (posedge rbc0_a)
    symbol_err_cnt2_d <= symbol_err_cnt2[3];

 always @ (posedge rbc0_a)
  if (reset_rxclk)
		trigger_symbol_err_cnt2_rx <= 1'b0;
  else
      	trigger_symbol_err_cnt2_rx <= (symbol_err_cnt2[3] & !symbol_err_cnt2_d) ? 1'b1 :
 	(clr_trigger_trigger_symbol_err_cnt2_rx) ? 1'b0 :
                                          trigger_symbol_err_cnt2_rx;

 SYNC_CELL SYMBOL_ERR2_SYNC (.D(trigger_symbol_err_cnt2_rx),
                                 .CP(core_clk),
	.Q(trigger_symbol_err_cnt2_core));

 SYNC_CELL CLR_SYMBOL_ERR2_SYNC (.D(trigger_symbol_err_cnt2_core),
                                     .CP(rbc0_a),
                                     .Q(clr_trigger_trigger_symbol_err_cnt2_rx));

 always @ (posedge core_clk)
    trigger_symbol_err_cnt2_core_d <= trigger_symbol_err_cnt2_core;

 assign trigger_symbol_err_cnt2 = trigger_symbol_err_cnt2_core & !trigger_symbol_err_cnt2_core_d;


// ********************************
// Symbol error counter logic 3
// ********************************


always @ (posedge rbc0_a)
    if (reset_rxclk)
         symbol_err_cnt3 <= 4'b0;
    else if (rx_error_3)
	 symbol_err_cnt3 <= symbol_err_cnt3 + 4'h1;
    else
         symbol_err_cnt3 <= symbol_err_cnt3;


 always @ (posedge rbc0_a)
    symbol_err_cnt3_d <= symbol_err_cnt3[3];

 always @ (posedge rbc0_a)
  if (reset_rxclk)
		trigger_symbol_err_cnt3_rx <= 1'b0;
  else
      	trigger_symbol_err_cnt3_rx <= (symbol_err_cnt3[3] & !symbol_err_cnt3_d) ? 1'b1 :
 	(clr_trigger_trigger_symbol_err_cnt3_rx) ? 1'b0 :
                                          trigger_symbol_err_cnt3_rx;

 SYNC_CELL SYMBOL_ERR3_SYNC (.D(trigger_symbol_err_cnt3_rx),
                                 .CP(core_clk),
	.Q(trigger_symbol_err_cnt3_core));

 SYNC_CELL CLR_SYMBOL_ERR3_SYNC (.D(trigger_symbol_err_cnt3_core),
                                     .CP(rbc0_a),
                                     .Q(clr_trigger_trigger_symbol_err_cnt3_rx));

 always @ (posedge core_clk)
    trigger_symbol_err_cnt3_core_d <= trigger_symbol_err_cnt3_core;

 assign trigger_symbol_err_cnt3 = trigger_symbol_err_cnt3_core & !trigger_symbol_err_cnt3_core_d;





endmodule
