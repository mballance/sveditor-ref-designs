// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_pio.v
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
//   Design: Vega
//    Block: XPCS 
//   Author: Carlos Castil 
//   
//   Module: xpcs_pio
//     File: xpcs_pio.v
//
//   Description: This block contains all xpcs reg csrs.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   10/17/02  Created
//
// ****************************************************************

module xpcs_pio (

		core_clk,

                // reset signals

                reset,       
                sw_reset,
                clr_sw_reset,
                hw_reset,

		// PIO Interface to HT 

		sel_xpcs,
		pio_rd,
		pio_addr,
		pio_wdata,
		
		rdata_xpcs,
		ack_xpcs,
                pio_err_xpcs,

                xpcs_interrupt,

                csr_xpcs_enable,
                csr_link_status,
                csr_ebuffer_state,
                csr_receive_state,
                csr_bypass_signal_detect,

                csr_lane_sync_status,
 
                csr_loopback,
                csr_low_power,

                csr_vendor_debug_sel,
                csr_vendor_debug_io_test,
		training_vector,
        
                inc_tx_pkt_count,
                inc_rx_pkt_count,

                inc_deskew_error,

                csr_tx_state,

                csr_trigger_transmit_fault,
                csr_trigger_receive_fault,

                csr_tx_test_enable,
                csr_test_pattern_sel,

                csr_enable_tx_buffers,

                csr_lane_sync_state0,
                csr_lane_sync_state1,
                csr_lane_sync_state2,
                csr_lane_sync_state3,
 
                trigger_symbol_err_cnt0,
                trigger_symbol_err_cnt1,
                trigger_symbol_err_cnt2,
                trigger_symbol_err_cnt3
                );


input		core_clk;

input		reset;
input           clr_sw_reset;
input           hw_reset;

output          sw_reset;

input           csr_link_status;
input  [3:0]    csr_lane_sync_status;
input           inc_deskew_error;
input  [3:0]    csr_lane_sync_state0;
input  [3:0]    csr_lane_sync_state1;
input  [3:0]    csr_lane_sync_state2;
input  [3:0]    csr_lane_sync_state3;

input           trigger_symbol_err_cnt0;
input           trigger_symbol_err_cnt1;
input           trigger_symbol_err_cnt2;
input           trigger_symbol_err_cnt3;

input  [3:0]    csr_tx_state;

input  [7:0]    csr_ebuffer_state;
input           csr_receive_state;

input           inc_tx_pkt_count;
input           inc_rx_pkt_count; 

input           csr_trigger_transmit_fault;
input           csr_trigger_receive_fault;

output          xpcs_interrupt;

output          csr_xpcs_enable;
output          csr_loopback;
output          csr_low_power;
output          csr_bypass_signal_detect;
output          csr_enable_tx_buffers;

output          csr_tx_test_enable;
output  [1:0]   csr_test_pattern_sel;

output  [3:0]   csr_vendor_debug_sel;
output          csr_vendor_debug_io_test;

output  [31:0]  training_vector;
   

// PIO Interface With MAC/HT

input		sel_xpcs;
input		pio_rd;
input	[8:0]	pio_addr;
input	[31:0]	pio_wdata;

output	[31:0]	rdata_xpcs;
output		ack_xpcs;
output          pio_err_xpcs;

reg     [8:0]   pio_addr_reg;
reg     [31:0]  pio_wdata_reg;
reg             pio_rd_reg;

reg             sel_xpcs_reg;
reg             sel_xpcs_d;

reg		write_pulse;
reg		read_pulse;

reg             csr_bypass_signal_detect;
reg             csr_xpcs_enable;
reg  [3:0]      csr_vendor_debug_sel;
reg             csr_vendor_debug_io_test;
reg  [31:0]     training_vector;
reg	[8:0]	addr;
reg	[31:0]	wr_data;

reg		ack_xpcs;
reg     [31:0]	rdata_xpcs;

reg     [15:0]  csr_tx_pkt_count;
reg     [15:0]  csr_rx_pkt_count;

reg     [7:0]   deskew_error_count;

reg     [31:0]  rd_data;

reg             csr_link_status_mask;

reg             csr_enable_tx_buffers;

reg             sw_reset;

reg             csr_loopback;
reg             csr_low_power;

reg             csr_tx_test_enable;
reg    [1:0]    csr_test_pattern_sel;

reg             csr_fault_mask;

reg             pio_err_xpcs;

reg             csr_fault;
reg             csr_fault_d;

wire            control1_wr_en;
wire            test_control_wr_en;
wire            conf_wr_en;
wire            ld_training_vector;
wire            mask1_wr_en;
wire            pkt_counter_wr_en;
wire            deskew_err_wr_en;

wire            sel_pls;

wire            csr_trigger_transmit_fault;
wire            csr_trigger_receive_fault;

wire            set_xpcs_interrupt;

reg             xpcs_interrupt;

reg             csr_link_status_d;
reg             set_link_status_low;
reg             link_status_latch_low;

reg             clear_status1;
reg             clear_status2;

reg             csr_trigger_transmit_fault_d;
reg             set_transmit_fault_high;
reg             transmit_fault_latch_high;

reg             csr_trigger_receive_fault_d;
reg             set_receive_fault_high;
reg             receive_fault_latch_high;

reg             inc_rx_pkt_count_d;
reg             inc_tx_pkt_count_d;

reg             inc_deskew_error_d;


reg [15:0] symbol_err_cnt0;
wire       clear_symbol_err_cnt0;

reg [15:0] symbol_err_cnt1;
wire       clear_symbol_err_cnt1;

reg [15:0] symbol_err_cnt2;
wire       clear_symbol_err_cnt2;

reg [15:0] symbol_err_cnt3;
wire       clear_symbol_err_cnt3;


// **********************************
// PIO Control Logic
// **********************************

always @ (posedge core_clk)
    begin
     sel_xpcs_reg    <=  sel_xpcs;
     sel_xpcs_d      <=  sel_xpcs_reg;
     pio_rd_reg      <=  pio_rd;
     pio_addr_reg    <=  pio_addr;
     pio_wdata_reg   <=  pio_wdata;
    end


// sel_pls is the select pulse

assign sel_pls = (sel_xpcs_reg & ~sel_xpcs_d);


// Generate PIO registered ack and read data

always @ (posedge core_clk)
    begin
      ack_xpcs     <=  (read_pulse | write_pulse);
      rdata_xpcs   <=  rd_data;
      pio_err_xpcs <=  (read_pulse | write_pulse ) & (rd_data == 32'hBADCAFEE);
    end


// Register write PIO data on sel_pls 

always @ (posedge core_clk)
    begin
      read_pulse  <=  sel_pls &  pio_rd_reg ;
      write_pulse <=  sel_pls & ~pio_rd_reg ;
      addr        <=  pio_addr_reg;
      wr_data     <=  pio_wdata_reg;
    end


assign control1_wr_en = write_pulse & addr[8:0]==9'h000;

assign test_control_wr_en = write_pulse & addr[8:0]==9'h009;

assign conf_wr_en = write_pulse & addr[8:0]==9'h00a;

assign ld_training_vector = write_pulse & addr[8:0]==9'h012;
       
assign mask1_wr_en = write_pulse & addr[8:0]==9'h00c;

assign pkt_counter_wr_en = write_pulse & addr[8:0]==9'h00d;

assign deskew_err_wr_en = write_pulse & addr[8:0]==9'h00f; 


// Read Mux

always @ (/*AUTOSENSE*/addr or csr_bypass_signal_detect
	  or csr_ebuffer_state or csr_enable_tx_buffers or csr_fault
	  or csr_fault_mask or csr_lane_sync_state0
	  or csr_lane_sync_state1 or csr_lane_sync_state2
	  or csr_lane_sync_state3 or csr_lane_sync_status
	  or csr_link_status or csr_link_status_mask or csr_loopback
	  or csr_low_power or csr_receive_state or csr_rx_pkt_count
	  or csr_test_pattern_sel or csr_tx_pkt_count or csr_tx_state
	  or csr_tx_test_enable or csr_vendor_debug_io_test
	  or csr_vendor_debug_sel or csr_xpcs_enable
	  or deskew_error_count or link_status_latch_low
	  or receive_fault_latch_high or sw_reset
	  or transmit_fault_latch_high or symbol_err_cnt0 
          or symbol_err_cnt1 or symbol_err_cnt2 or symbol_err_cnt3 
          or training_vector)

begin	  
  case (addr[7:0]) // synopsys parallel_case full_case
  
    // Port Info
  
    8'h00    : rd_data = {16'h0000,sw_reset,csr_loopback,2'b10,csr_low_power,11'b00001000000}; // control1
    8'h01    : rd_data = {24'h000000,csr_fault,4'b0000,link_status_latch_low,2'b00};  // status1
    8'h02    : rd_data = {32'h00000000};                    // device id
    8'h03    : rd_data = {31'h00000000,1'b1};               // speed ability
    8'h04    : rd_data = {4'hC,20'h00000,8'h08};     // devices in package
    8'h05    : rd_data = {30'h00000000,2'b01};              // control2
    8'h06    : rd_data = {20'h00000,transmit_fault_latch_high,receive_fault_latch_high,8'h00,2'b10}; // status2
    8'h07    : rd_data = {32'h00000000};                    // package id 
    8'h08    : rd_data = {19'h00000, csr_link_status, 8'h80, csr_lane_sync_status};
    8'h09    : rd_data = {29'h00000000,csr_tx_test_enable,csr_test_pattern_sel}; // test control
    8'h0A    : rd_data = {24'h000000,csr_vendor_debug_io_test,
                                     csr_vendor_debug_sel,
                                     csr_bypass_signal_detect,
                                     csr_enable_tx_buffers,
                                     csr_xpcs_enable}; // configuration
    8'h0B    : rd_data = {7'h00, csr_lane_sync_state3,  // 4 bits 
                                 csr_lane_sync_state2,  // 4 bits
                                 csr_lane_sync_state1,  // 4 bits
                                 csr_lane_sync_state0,  // 4 bits
                                 csr_ebuffer_state,     // 8 bits 
                                 csr_receive_state};    // 1 bits  rx diagnostic
    8'h0C    : rd_data = {24'h000000,csr_fault_mask,4'h0,csr_link_status_mask,2'b00};  // mask1
    8'h0D    : rd_data = {csr_tx_pkt_count,csr_rx_pkt_count};   // packet counter
    8'h0E    : rd_data = {28'h0000000, csr_tx_state};        // 4 bits  tx diagnostic
    8'h0F    : rd_data = {24'h000000, deskew_error_count};
    8'h10    : rd_data = {symbol_err_cnt1,symbol_err_cnt0};
    8'h11    : rd_data = {symbol_err_cnt3,symbol_err_cnt2};
    8'h12    : rd_data = training_vector[31:0];

    default  : rd_data = {32'hBADCAFEE};
    
  endcase        
end // always @ (...
   
   

always @ (posedge core_clk)
  if (reset)
   begin
    csr_loopback  <=  1'b0;
    csr_low_power <=  1'b0;
   end
  else
   begin
    csr_loopback  <=  (control1_wr_en) ? wr_data[14] : csr_loopback;
    csr_low_power <=  (control1_wr_en) ? wr_data[11] : csr_low_power;
   end

always @ (posedge core_clk)
  if (hw_reset)
    sw_reset  <= 1'b0;
  else 
    sw_reset  <=  (control1_wr_en) ? wr_data[15] : (clr_sw_reset) ? 1'b0 : sw_reset;


always @ (posedge core_clk)
  if (reset)
   begin
    csr_tx_test_enable   <=  1'b0;
    csr_test_pattern_sel <=  2'b00;
   end
  else
   begin
    csr_tx_test_enable   <=  (test_control_wr_en) ? wr_data[2] : csr_tx_test_enable;
    csr_test_pattern_sel <=  (test_control_wr_en) ? wr_data[1:0] : csr_test_pattern_sel;
   end

always @ (posedge core_clk)
  if (reset)
   begin
    csr_vendor_debug_io_test <= 1'b0;
    csr_vendor_debug_sel     <= 4'h0;
    csr_bypass_signal_detect <= 1'b0;
    csr_enable_tx_buffers    <= 1'b1;
    csr_xpcs_enable          <= 1'b1;
   end
  else
   begin
    csr_vendor_debug_io_test <=  (conf_wr_en) ? wr_data[7]   : csr_vendor_debug_io_test;
    csr_vendor_debug_sel     <=  (conf_wr_en) ? wr_data[6:3] : csr_vendor_debug_sel;
    csr_bypass_signal_detect <=  (conf_wr_en) ? wr_data[2]   : csr_bypass_signal_detect;
    csr_enable_tx_buffers    <=  (conf_wr_en) ? wr_data[1]   : csr_enable_tx_buffers;
    csr_xpcs_enable          <=  (conf_wr_en) ? wr_data[0]   : csr_xpcs_enable;
   end


always @ (posedge core_clk)
  if (reset)
   begin
    csr_fault_mask       <=  1'b1;
    csr_link_status_mask <=  1'b1;
   end
  else
   begin
    csr_fault_mask       <=  (mask1_wr_en) ? wr_data[7] : csr_fault_mask;
    csr_link_status_mask <=  (mask1_wr_en) ? wr_data[2] : csr_link_status_mask;
   end

/****************************************************************************/
// Logic for packet counts 
/****************************************************************************/

always @ (posedge core_clk)
  if (reset)
   begin
    inc_tx_pkt_count_d <=  1'b0;
    inc_rx_pkt_count_d <=  1'b0;
   end
  else
   begin
    inc_tx_pkt_count_d <= inc_tx_pkt_count;
    inc_rx_pkt_count_d <= inc_rx_pkt_count;
   end

always @ (posedge core_clk)
  if (reset)
   begin
    csr_tx_pkt_count <=  16'b0;
    csr_rx_pkt_count <=  16'b0;
   end
  else
   begin
    csr_tx_pkt_count <=  (pkt_counter_wr_en) ? wr_data[31:16] : 
                         (csr_link_status & inc_tx_pkt_count & !inc_tx_pkt_count_d)  ? csr_tx_pkt_count + 16'h0001 :
                          csr_tx_pkt_count;

    csr_rx_pkt_count <=  (pkt_counter_wr_en) ? wr_data[15:0]  : 
                         (csr_link_status & inc_rx_pkt_count & !inc_rx_pkt_count_d)  ? csr_rx_pkt_count + 16'h0001 :
                          csr_rx_pkt_count;
   end

/****************************************************************************/
// Logic for deskew error count
/****************************************************************************/

always @ (posedge core_clk)
  inc_deskew_error_d <= inc_deskew_error; 

always @ (posedge core_clk)
  if (reset)
     deskew_error_count <=  8'b0;
  else if (deskew_err_wr_en)
    deskew_error_count <=  wr_data[7:0];
  else if (inc_deskew_error & !inc_deskew_error_d & (deskew_error_count != 8'hFF))
    deskew_error_count <=  deskew_error_count + 8'h01;
  else
    deskew_error_count <=  deskew_error_count;

/****************************************************************************/
// Logic for transmit/receive fault status
/****************************************************************************/

always @ (posedge core_clk)
  if (reset | !csr_xpcs_enable) 
   begin
    csr_fault   <= 1'b0;
    csr_fault_d <= 1'b0;
   end
  else
   begin
    csr_fault   <= transmit_fault_latch_high | receive_fault_latch_high;
    csr_fault_d <= csr_fault;
   end

// transmit fault

always @ (posedge core_clk)
  if (reset)
    csr_trigger_transmit_fault_d <= 1'b0;
  else
    csr_trigger_transmit_fault_d <= csr_trigger_transmit_fault;

always @ (posedge core_clk)
  if (reset)
    set_transmit_fault_high <= 1'b0;
  else if (csr_trigger_transmit_fault & !csr_trigger_transmit_fault_d)
    set_transmit_fault_high <= 1'b1;
  else if (clear_status2)
    set_transmit_fault_high <= 1'b0;
  else
    set_transmit_fault_high <= set_transmit_fault_high;

always @ (posedge core_clk)
  if (reset)
    transmit_fault_latch_high <= 1'b0;
  else
    transmit_fault_latch_high <= set_transmit_fault_high ? 1'b1 : csr_trigger_transmit_fault;

// receive fault

always @ (posedge core_clk)
  if (reset)
    csr_trigger_receive_fault_d <= 1'b0;
  else
    csr_trigger_receive_fault_d <= csr_trigger_receive_fault;

always @ (posedge core_clk)
  if (reset)
    set_receive_fault_high <= 1'b0;
  else if (csr_trigger_receive_fault & !csr_trigger_receive_fault_d)
    set_receive_fault_high <= 1'b1;
  else if (clear_status2)
    set_receive_fault_high <= 1'b0;
  else
    set_receive_fault_high <= set_receive_fault_high;

always @ (posedge core_clk)
  if (reset)
    receive_fault_latch_high <= 1'b0;
  else
    receive_fault_latch_high <= set_receive_fault_high ? 1'b1 : csr_trigger_receive_fault;


/****************************************************************************/
// Logic for link up/down status
/****************************************************************************/

always @ (posedge core_clk)
  if (reset)
    csr_link_status_d <= 1'b0; 
  else
    csr_link_status_d <= csr_link_status;

always @ (posedge core_clk)
  if (reset)
    set_link_status_low <= 1'b0;
  else if (!csr_link_status & csr_link_status_d)
    set_link_status_low <= 1'b1;
  else if (clear_status2)
    set_link_status_low <= 1'b0;
  else
    set_link_status_low <= set_link_status_low;

always @ (posedge core_clk)
  if (reset)
    link_status_latch_low <= 1'b0;
  else
    link_status_latch_low <= set_link_status_low ? 1'b0 : csr_link_status;


// ************************************
// Interrupt logic
// ************************************


// Register interrupt

assign set_xpcs_interrupt  =  ((csr_link_status_d ^ csr_link_status) & (!csr_link_status_mask)) |
                                     ( (csr_fault & !csr_fault_d)    & (!csr_fault_mask));

always @ (posedge core_clk)
  if (reset)
    xpcs_interrupt <=  1'b0;
  else if (set_xpcs_interrupt)
    xpcs_interrupt <=  1'b1;
  else if (clear_status1)
    xpcs_interrupt <=  1'b0;
  else 
    xpcs_interrupt <= xpcs_interrupt;


// Clear on read signals

always @ (posedge core_clk)
  if (reset)
      clear_status1 <=  1'b0;
  else
      clear_status1 <=  (read_pulse & addr[7:0]==8'h01);


always @ (posedge core_clk)
  if (reset)
      clear_status2 <=  1'b0;
  else
      clear_status2 <=  (read_pulse & addr[7:0]==8'h06);


// ************************************
// Symbol error counters  
// ************************************


assign clear_symbol_err_cnt0 = read_pulse & (addr == 9'h010);

always @ (posedge core_clk)
  if (reset | clear_symbol_err_cnt0 )
    symbol_err_cnt0 <=  16'h0000;
  else if (trigger_symbol_err_cnt0 & (symbol_err_cnt0 != 16'hFFFF) & csr_xpcs_enable)
    symbol_err_cnt0 <= symbol_err_cnt0 + 16'h0001;
  else                                           // else maintain error cnt
    symbol_err_cnt0 <=  symbol_err_cnt0;



assign clear_symbol_err_cnt1 = read_pulse & (addr == 9'h010);

always @ (posedge core_clk)
  if (reset | clear_symbol_err_cnt1 )
    symbol_err_cnt1 <=  16'h0000;
  else if (trigger_symbol_err_cnt1 & (symbol_err_cnt1 != 16'hFFFF) & csr_xpcs_enable)
    symbol_err_cnt1 <= symbol_err_cnt1 + 16'h0001;
  else                                           // else maintain error cnt
    symbol_err_cnt1 <=  symbol_err_cnt1;


assign clear_symbol_err_cnt2 = read_pulse & (addr == 9'h011);

always @ (posedge core_clk)
  if (reset | clear_symbol_err_cnt2 )
    symbol_err_cnt2 <=  16'h0000;
  else if (trigger_symbol_err_cnt2 & (symbol_err_cnt2 != 16'hFFFF) & csr_xpcs_enable)
    symbol_err_cnt2 <= symbol_err_cnt2 + 16'h0001;
  else                                           // else maintain error cnt
    symbol_err_cnt2 <=  symbol_err_cnt2;


assign clear_symbol_err_cnt3 = read_pulse & (addr == 9'h011);

always @ (posedge core_clk)
  if (reset | clear_symbol_err_cnt3 )
    symbol_err_cnt3 <=  16'h0000;
  else if (trigger_symbol_err_cnt3 & (symbol_err_cnt3 != 16'hFFFF) & csr_xpcs_enable)
    symbol_err_cnt3 <= symbol_err_cnt3 + 16'h0001;
  else                                           // else maintain error cnt
    symbol_err_cnt3 <=  symbol_err_cnt3;

// ************************************
// training vector  
// ************************************



always @ (posedge core_clk)
  begin
    if (reset)
	 training_vector <= 0;
    else if (ld_training_vector)
	 training_vector <= wr_data[31:0];
    else if (csr_vendor_debug_sel[3:0] == `SEL_xpcs_training_vector)
	 training_vector <= ~training_vector;
    else training_vector <=  training_vector;
  end

 


endmodule // xpcs_pio
