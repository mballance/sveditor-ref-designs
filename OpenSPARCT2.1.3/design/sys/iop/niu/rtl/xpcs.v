// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs.v
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
/*************************************************************************
 * File Name    : xpcs
 * Author Name  : Carlos Castil
 * Description  : This module performs 802.3ae 10Gbps pcs function
 *                Refer to 802.3ae Clause 36, 46, and 48 
 * Parent Module: xmac_2pcs_core 
 * Date Created : 9/19/02
 *
 * Copyright (c) 2003, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/


module	xpcs (


clk,        // System input clock

tx_clk,     // MAC TX input Clk 312 MHz (tx_clk div 2)

rbc0_a,     // chan a input clock from Serdes 312 Mhz rx clock <===== NEW CLOCK
rbc0_b,     // chan b input clock form Serdes 312 Mhz rx clock
rbc0_c,     // chan c input clock form Serdes 312 Mhz rx clock
rbc0_d,     // chan d input clock form Serdes 312 Mhz rx clock

xpcs_loopback,

xrx_code_group,  // Serdes to xpcs receive symbols
xtx_code_group,  // xpcs to Serdes transmit symbols 

xlink_up_tx,     // signal to on-board LED, low pulse elongated
xsignal_detect,  // input from optics which indicates light ok. Inputs from Sequence Detect.
xserdes_rdy,     // input from serdes to indicate that the serdes pll is locked

xpcs_rxd,	 // XGMII data going onto xGMII
xpcs_rxc,	 // XGMII receive data valid, GMII interface

xpcs_txd,	 // XGMII byte from MAC over GMII
xpcs_txc,        // XGMII transmit enable from Mac

xpcs_debug,

pio_core_reset,  // pio signals
sel_xpcs,
ack_xpcs,
pio_addr,
pio_rd,
pio_wdata,
pio_err_xpcs,
rdata_xpcs,
xpcs_interrupt  );

   input          tx_clk;        // 312 Mhz reference from serdes
 
   input          clk;           // core clock
 
   input          rbc0_a;        // 312 Mhz rx clock from serdes
   input	  rbc0_b;  	 // 312 Mhz rx clock from serdes
   input	  rbc0_c;  	 // 312 Mhz rx clock from serdes
   input	  rbc0_d;  	 // 312 Mhz rx clock from serdes

   input  [79:0]  xrx_code_group; // symbol to send over link
   output [79:0]  xtx_code_group; // symbol to send over link

   input  [3:0]   xsignal_detect; // Input from optics which indicates light ok. 
   input          xserdes_rdy;    // Input from Serdes to indicate pll lock

   output         xlink_up_tx;   // signal to on-board LED, low pulse elongated

   output [63:0]  xpcs_rxd;      // data going onto xGMII
   output [7:0]   xpcs_rxc;      // receive data valid, xGMII interface

   output [31:0]  xpcs_debug;


   input  [63:0]  xpcs_txd;      // 4 bytes from MAC over xGMII
   input  [7:0]   xpcs_txc;      // xGMII transmit enable from Mac

   output         xpcs_loopback;


   input          pio_core_reset;  // hw_reset
   input          sel_xpcs;
   output         ack_xpcs;
   output         pio_err_xpcs;
   input  [8:0]   pio_addr;
   input          pio_rd;
   input  [31:0]  pio_wdata;
   output [31:0]  rdata_xpcs;
   output         xpcs_interrupt;

wire        reset;

wire [8:0]   pio_addr;
wire [31:0]  pio_wdata;
wire [31:0]  rdata_xpcs;

wire        csr_xpcs_enable;
wire        csr_link_status;
wire        csr_pulse_deskew_error;
wire [7:0]  csr_ebuffer_state;
wire        csr_receive_state;
wire        csr_bypass_signal_detect;

wire  [3:0] csr_lane_sync_status;

wire [79:0] xrx_code_group; // symbol to send over link
wire [79:0] xtx_code_group; // symbol to send over link

wire [39:0] xtx_code_group_mux;
wire [39:0] xrx_code_group_muxout;

wire  [3:0] csr_lane_sync_state0;
wire  [3:0] csr_lane_sync_state1;
wire  [3:0] csr_lane_sync_state2;
wire  [3:0] csr_lane_sync_state3;

wire        csr_loopback;
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire        csr_low_power;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on

wire        tx_clk;
wire [63:0] xpcs_txd;
wire [7:0]  xpcs_txc;

wire        inc_tx_pkt_count;
wire        inc_rx_pkt_count;

wire        inc_tx_pkt_count_ref;
wire        inc_rx_pkt_count_ref;

wire        csr_enable_tx_buffers;

wire        csr_trigger_transmit_fault;
wire        csr_trigger_receive_fault;

wire        csr_tx_test_enable;
wire  [1:0] csr_test_pattern_sel;


wire        xpcs_loopback;

wire  [7:0] rx_byte_0;
wire  [7:0] rx_byte_1;
wire  [7:0] rx_byte_2;
wire  [7:0] rx_byte_3;

wire          rx_special_0;
wire          rx_special_1;
wire          rx_special_2;
wire          rx_special_3;

wire          rx_error_0;
wire          rx_error_1;
wire          rx_error_2;
wire          rx_error_3;

wire [7:0] tx_byte_0_enc;
wire [7:0] tx_byte_1_enc;
wire [7:0] tx_byte_2_enc;
wire [7:0] tx_byte_3_enc;

wire       tx_special_0_enc;
wire       tx_special_1_enc;
wire       tx_special_2_enc;
wire       tx_special_3_enc;

wire [7:0] tx_xgmii_byte_0;
wire [7:0] tx_xgmii_byte_1;
wire [7:0] tx_xgmii_byte_2;
wire [7:0] tx_xgmii_byte_3;

wire       tx_xgmii_special_0;
wire       tx_xgmii_special_1;
wire       tx_xgmii_special_2;
wire       tx_xgmii_special_3;

wire [7:0] rx_xgmii_byte_0;
wire [7:0] rx_xgmii_byte_1;
wire [7:0] rx_xgmii_byte_2;
wire [7:0] rx_xgmii_byte_3;

wire       rx_xgmii_special_0;
wire       rx_xgmii_special_1;
wire       rx_xgmii_special_2;
wire       rx_xgmii_special_3;

wire [3:0]  csr_tx_state;

wire        sw_reset;

wire        reset_rxclk;
wire        reset_txclk;

wire        inc_deskew_error;

wire        csr_transmit_fault_ref;
wire        csr_receive_fault_ref;

wire        hw_reset;

wire        clr_sw_reset;

wire [3:0]  csr_vendor_debug_sel;
wire        csr_vendor_debug_io_test;
wire [31:0] training_vector;
   
wire [31:0] xpcs_debug;

wire [31:0] rx0_debug;
wire [31:0] rx1_debug;
wire [31:0] rx2_debug;
wire [31:0] rx3_debug;

wire [31:0] tx0_debug;
wire [31:0] tx1_debug;
wire [31:0] tx2_debug;
wire [31:0] tx3_debug;

wire        rx_symbols_dft_dummy;

wire        debug_io_test_0;
wire        debug_io_test_1;

wire csr_link_status_rx;

wire trigger_symbol_err_cnt0;
wire trigger_symbol_err_cnt1;
wire trigger_symbol_err_cnt2;
wire trigger_symbol_err_cnt3;

assign xpcs_loopback = csr_loopback;
assign xlink_up_tx   = csr_link_status;

xpcs_pio xpcs_pio (

                .core_clk(clk),

                .reset(reset), 
                .clr_sw_reset(clr_sw_reset),
                .sw_reset(sw_reset),
                .hw_reset(hw_reset),

                .sel_xpcs(sel_xpcs),
                .pio_rd(pio_rd),
                .pio_addr(pio_addr),
                .pio_wdata(pio_wdata),

                .rdata_xpcs(rdata_xpcs),
                .ack_xpcs(ack_xpcs),
                .pio_err_xpcs(pio_err_xpcs),

                .xpcs_interrupt(xpcs_interrupt),

                .csr_vendor_debug_sel (csr_vendor_debug_sel),
                .csr_vendor_debug_io_test(csr_vendor_debug_io_test),
                .training_vector      (training_vector),

                .csr_xpcs_enable(csr_xpcs_enable),
                .csr_link_status(csr_link_status),
                .csr_ebuffer_state(csr_ebuffer_state),
                .csr_receive_state(csr_receive_state),
                .csr_bypass_signal_detect(csr_bypass_signal_detect),

                .csr_tx_test_enable(csr_tx_test_enable),
                .csr_test_pattern_sel(csr_test_pattern_sel),

                .inc_deskew_error(inc_deskew_error),
                .inc_tx_pkt_count(inc_tx_pkt_count),
                .inc_rx_pkt_count(inc_rx_pkt_count),

                .csr_trigger_transmit_fault(csr_trigger_transmit_fault),
                .csr_trigger_receive_fault(csr_trigger_receive_fault),

                .csr_lane_sync_status(csr_lane_sync_status),
 
                .csr_loopback(csr_loopback),
                .csr_low_power(csr_low_power),
                .csr_enable_tx_buffers(csr_enable_tx_buffers),

                .csr_tx_state(csr_tx_state),

                .csr_lane_sync_state0(csr_lane_sync_state0),
                .csr_lane_sync_state1(csr_lane_sync_state1),
                .csr_lane_sync_state2(csr_lane_sync_state2),
                .csr_lane_sync_state3(csr_lane_sync_state3),

                .trigger_symbol_err_cnt0(trigger_symbol_err_cnt0),
                .trigger_symbol_err_cnt1(trigger_symbol_err_cnt1),
                .trigger_symbol_err_cnt2(trigger_symbol_err_cnt2),
                .trigger_symbol_err_cnt3(trigger_symbol_err_cnt3) 
                );

xpcs_rxio xpcs_rxio (

                .reset_rxclk(reset_rxclk),

                .core_clk(clk),

                .rx_signal_detect(xsignal_detect),

                .rx_byte_0(rx_byte_0),
                .rx_byte_1(rx_byte_1),
                .rx_byte_2(rx_byte_2),
                .rx_byte_3(rx_byte_3),

                .rx_special_0(rx_special_0),
                .rx_special_1(rx_special_1),
                .rx_special_2(rx_special_2),
                .rx_special_3(rx_special_3),

                .rx_error_0(rx_error_0),
                .rx_error_1(rx_error_1),
                .rx_error_2(rx_error_2),
                .rx_error_3(rx_error_3),

                .rx_wclk_a(rbc0_a),
                .rx_symbol_a(xrx_code_group_muxout[9:0]),

                .rx_wclk_b(rbc0_b),
                .rx_symbol_b(xrx_code_group_muxout[19:10]),

                .rx_wclk_c(rbc0_c),
                .rx_symbol_c(xrx_code_group_muxout[29:20]),

                .rx_wclk_d(rbc0_d),
                .rx_symbol_d(xrx_code_group_muxout[39:30]),

                .csr_lane_sync_status(csr_lane_sync_status),

                .csr_lane_sync_state0(csr_lane_sync_state0),
                .csr_lane_sync_state1(csr_lane_sync_state1),
                .csr_lane_sync_state2(csr_lane_sync_state2),
                .csr_lane_sync_state3(csr_lane_sync_state3),

                .csr_link_status(csr_link_status),
                .csr_link_status_rx(csr_link_status_rx),
                .csr_pulse_deskew_error(csr_pulse_deskew_error),
                .csr_ebuffer_state(csr_ebuffer_state) );



xpcs_rx xpcs_rx (

                .rx_clk(rbc0_a),
                .reset_rxclk(reset_rxclk),

                .state(csr_receive_state),
                .csr_xpcs_enable(csr_xpcs_enable),
                .csr_link_status_rx(csr_link_status_rx),
                .csr_tx_test_enable(csr_tx_test_enable),
                .csr_receive_fault_ref(csr_receive_fault_ref),

                .inc_rx_pkt_count_ref(inc_rx_pkt_count_ref),

                .xserdes_rdy(xserdes_rdy),

                .rx_xgmii_byte_0(rx_xgmii_byte_0),
                .rx_xgmii_byte_1(rx_xgmii_byte_1),
                .rx_xgmii_byte_2(rx_xgmii_byte_2),
                .rx_xgmii_byte_3(rx_xgmii_byte_3),

                .rx_xgmii_special_0(rx_xgmii_special_0),
                .rx_xgmii_special_1(rx_xgmii_special_1),
                .rx_xgmii_special_2(rx_xgmii_special_2),
                .rx_xgmii_special_3(rx_xgmii_special_3),

                .rx_byte_0(rx_byte_0),
                .rx_byte_1(rx_byte_1),
                .rx_byte_2(rx_byte_2),
                .rx_byte_3(rx_byte_3),

                .rx_special_0(rx_special_0),
                .rx_special_1(rx_special_1),
                .rx_special_2(rx_special_2),
                .rx_special_3(rx_special_3),

                .rx_error_0(rx_error_0),
                .rx_error_1(rx_error_1),
                .rx_error_2(rx_error_2),
                .rx_error_3(rx_error_3)

                  );

xpcs_xgmii_dpath xpcs_xgmii_dpath (

                                 .reset_txclk (reset_txclk),
                                 .reset_rxclk  (reset_rxclk),

                                 .tx_clk    (tx_clk),      // 312 mhz tx clk
                                  
                                 .rbc0_a  (rbc0_a),    // 312 mhz rx clk

                                 .xpcs_rxd(xpcs_rxd),  // outputs to XMAC receive
                                 .xpcs_rxc(xpcs_rxc),

                                 .xpcs_txd(xpcs_txd),  // inputs from XMAC transmit
                                 .xpcs_txc(xpcs_txc),

                                 // inputs from XPCS receive

                                 .rx_xgmii_byte_0(rx_xgmii_byte_0),
                                 .rx_xgmii_byte_1(rx_xgmii_byte_1),
                                 .rx_xgmii_byte_2(rx_xgmii_byte_2),
                                 .rx_xgmii_byte_3(rx_xgmii_byte_3),

                                 .rx_xgmii_special_0(rx_xgmii_special_0),
                                 .rx_xgmii_special_1(rx_xgmii_special_1),
                                 .rx_xgmii_special_2(rx_xgmii_special_2),
                                 .rx_xgmii_special_3(rx_xgmii_special_3),

                                 // outputs to XPCS transmit

                                 .tx_xgmii_byte_0(tx_xgmii_byte_0),
                                 .tx_xgmii_byte_1(tx_xgmii_byte_1),
                                 .tx_xgmii_byte_2(tx_xgmii_byte_2),
                                 .tx_xgmii_byte_3(tx_xgmii_byte_3),

                                 .tx_xgmii_special_0(tx_xgmii_special_0),
                                 .tx_xgmii_special_1(tx_xgmii_special_1),
                                 .tx_xgmii_special_2(tx_xgmii_special_2),
                                 .tx_xgmii_special_3(tx_xgmii_special_3) 

                                          );

xpcs_dpath xpcs_dpath ( 
                       .tx_clk(tx_clk),

                       .rx_clk(rbc0_a),
                       .rbc0_b(rbc0_b),
                       .rbc0_c(rbc0_c),
                       .rbc0_d(rbc0_d), 

                       .csr_loopback(csr_loopback),
                       .csr_enable_tx_buffers(csr_enable_tx_buffers),

                       .rx_symbols_dft_dummy (rx_symbols_dft_dummy),

                       .tx_symbols_mux(xtx_code_group_mux),                

                       .rx_symbols_mux({xrx_code_group[69:60],  // receive in from serdes
                                        xrx_code_group[49:40],
                                        xrx_code_group[29:20],
                                          xrx_code_group[9:0]}),

                       .rx_symbols_dft({xrx_code_group[79:70],  // receive in from serdes
                                        xrx_code_group[59:50],
                                        xrx_code_group[39:30],
                                        xrx_code_group[19:10]}),

                       .tx_symbols_dft({xtx_code_group[79:70],
                                        xtx_code_group[59:50],
                                        xtx_code_group[39:30],
                                        xtx_code_group[19:10]}),

                       .xrx_code_group_muxout(xrx_code_group_muxout),

                       .xtx_code_group({xtx_code_group[69:60],  // transmit out to serdes
                                        xtx_code_group[49:40],
                                        xtx_code_group[29:20],
                                          xtx_code_group[9:0]})
                      );


xpcs_tx xpcs_tx (.tx_clk(tx_clk), 
                 .reset(reset_txclk), 

                 .csr_link_status(csr_link_status),
                 .csr_tx_test_enable(csr_tx_test_enable),
                 .csr_test_pattern_sel(csr_test_pattern_sel),

                 .csr_transmit_fault_ref(csr_transmit_fault_ref),

                 .inc_tx_pkt_count_ref(inc_tx_pkt_count_ref),

                 .tx_byte_0(tx_xgmii_byte_0),
                 .tx_byte_1(tx_xgmii_byte_1),
                 .tx_byte_2(tx_xgmii_byte_2),
                 .tx_byte_3(tx_xgmii_byte_3),

                 .tx_special_0(tx_xgmii_special_0),
                 .tx_special_1(tx_xgmii_special_1),
                 .tx_special_2(tx_xgmii_special_2),
                 .tx_special_3(tx_xgmii_special_3),

                 .tx_byte_0_enc(tx_byte_0_enc),
                 .tx_byte_1_enc(tx_byte_1_enc),
                 .tx_byte_2_enc(tx_byte_2_enc),
                 .tx_byte_3_enc(tx_byte_3_enc),

                 .tx_special_0_enc(tx_special_0_enc),
                 .tx_special_1_enc(tx_special_1_enc),
                 .tx_special_2_enc(tx_special_2_enc),
                 .tx_special_3_enc(tx_special_3_enc),

                 .state(csr_tx_state)       );


xpcs_txio xpcs_txio (
           .reset(reset_txclk),
           .tx_clk(tx_clk),

           .tx_byte_0(tx_byte_0_enc),
           .tx_byte_1(tx_byte_1_enc),
           .tx_byte_2(tx_byte_2_enc),
           .tx_byte_3(tx_byte_3_enc),

           .tx_special_0(tx_special_0_enc),
           .tx_special_1(tx_special_1_enc),
           .tx_special_2(tx_special_2_enc),
           .tx_special_3(tx_special_3_enc),

           .tx_symbol_0(xtx_code_group_mux[9:0]),
           .tx_symbol_1(xtx_code_group_mux[19:10]),
           .tx_symbol_2(xtx_code_group_mux[29:20]),
           .tx_symbol_3(xtx_code_group_mux[39:30])

                  );

xpcs_sync xpcs_sync (
                     .core_clk(clk), 
                     .tx_clk(tx_clk),     // 312 Mhz reference from serdes

                     .rbc0_a(rbc0_a),

                     .csr_transmit_fault_ref(csr_transmit_fault_ref),
                     .csr_receive_fault_ref(csr_receive_fault_ref),
             
                     .csr_trigger_transmit_fault(csr_trigger_transmit_fault),
                     .csr_trigger_receive_fault(csr_trigger_receive_fault),

                     .inc_tx_pkt_count_ref(inc_tx_pkt_count_ref),
                     .inc_rx_pkt_count_ref(inc_rx_pkt_count_ref),

                     .inc_tx_pkt_count(inc_tx_pkt_count),
                     .inc_rx_pkt_count(inc_rx_pkt_count),

                     .csr_pulse_deskew_error(csr_pulse_deskew_error),
                     .inc_deskew_error(inc_deskew_error),

                     .sw_reset(sw_reset),
                     .pio_core_reset(pio_core_reset),
                 
                     .reset_txclk(reset_txclk),
                     .reset_rxclk(reset_rxclk),
          
                     .clr_sw_reset(clr_sw_reset),

		     .rx_error_0(rx_error_0),
		     .rx_error_1(rx_error_1),
		     .rx_error_2(rx_error_2),
		     .rx_error_3(rx_error_3),

                     .trigger_symbol_err_cnt0(trigger_symbol_err_cnt0),
                     .trigger_symbol_err_cnt1(trigger_symbol_err_cnt1),
                     .trigger_symbol_err_cnt2(trigger_symbol_err_cnt2),
                     .trigger_symbol_err_cnt3(trigger_symbol_err_cnt3),
                 
                     .hw_reset(hw_reset),
                     .reset(reset) );


// *****************************************************
//                 Debug MUX
// *****************************************************

assign debug_io_test_0 = csr_bypass_signal_detect;
assign debug_io_test_1 = csr_enable_tx_buffers;

reg [39:0] xrx_code_group_muxout_dbg;
always @ (posedge rbc0_a)  xrx_code_group_muxout_dbg[9:0]   <= xrx_code_group_muxout[9:0];
always @ (posedge rbc0_b)  xrx_code_group_muxout_dbg[19:10] <= xrx_code_group_muxout[19:10];
always @ (posedge rbc0_c)  xrx_code_group_muxout_dbg[29:20] <= xrx_code_group_muxout[29:20];
always @ (posedge rbc0_d)  xrx_code_group_muxout_dbg[39:30] <= xrx_code_group_muxout[39:30];


assign rx0_debug = csr_vendor_debug_io_test ? 
                    {debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1,
                     debug_io_test_0, debug_io_test_1}
                  : {rx_symbols_dft_dummy,
                     2'b0,
                     rx_xgmii_byte_0,
                     rx_xgmii_special_0,
                     rx_byte_0,
                     rx_special_0,
                     rx_error_0,
                     xrx_code_group_muxout_dbg[9:0]};

assign rx1_debug = {3'b000,
                    rx_xgmii_byte_1,
                    rx_xgmii_special_1,
                    rx_byte_1,
                    rx_special_1,
                    rx_error_1,
                    xrx_code_group_muxout_dbg[19:10]};

assign rx2_debug = {3'b000,
                    rx_xgmii_byte_2,
                    rx_xgmii_special_2,
                    rx_byte_2,
                    rx_special_2,
                    rx_error_2,
                    xrx_code_group_muxout_dbg[29:20]};

assign rx3_debug = {3'b000,
                    rx_xgmii_byte_3,
                    rx_xgmii_special_3,
                    rx_byte_3,
                    rx_special_3,
                    rx_error_3,
                    xrx_code_group_muxout_dbg[39:30]};

assign tx0_debug = {4'b0000,
                    tx_xgmii_byte_0,
                    tx_xgmii_special_0,
                    tx_byte_0_enc,
                    tx_special_0_enc,
                    xtx_code_group_mux[9:0]};

assign tx1_debug = {4'b0000,
                    tx_xgmii_byte_1,
                    tx_xgmii_special_1,
                    tx_byte_1_enc,
                    tx_special_1_enc,
                    xtx_code_group_mux[19:10]};

assign tx2_debug = {4'b0000,
                    tx_xgmii_byte_2,
                    tx_xgmii_special_2,
                    tx_byte_2_enc,
                    tx_special_2_enc,
                    xtx_code_group_mux[29:20]};

assign tx3_debug = {4'b0000,
                    tx_xgmii_byte_3,
                    tx_xgmii_special_3,
                    tx_byte_3_enc,
                    tx_special_3_enc,
                    xtx_code_group_mux[39:30]};


xpcs_dbg xpcs_dbg (.csr_vendor_debug_sel (csr_vendor_debug_sel),
		   .training_vector  (training_vector),
                   .rx0_debug (rx0_debug),
                   .rx1_debug (rx1_debug),
                   .rx2_debug (rx2_debug),
                   .rx3_debug (rx3_debug),

                   .tx0_debug (tx0_debug),
                   .tx1_debug (tx1_debug),
                   .tx2_debug (tx2_debug),
                   .tx3_debug (tx3_debug),
                   .xpcs_debug (xpcs_debug) ); 


endmodule // xpcs
