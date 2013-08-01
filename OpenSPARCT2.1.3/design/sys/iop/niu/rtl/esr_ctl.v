// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: esr_ctl.v
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
 * File Name    : esr_ctrl.v
 * Author Name  : John Lo
 * Description  :   
 * Parent Module:  
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 3/23/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/


module esr_ctl ( 
pio_core_reset,
clk,
// pio interface
pio_addr,      // pio global signal
pio_rd,        // pio global signal
pio_wdata,     // pio global signal
sel_esr,
ack_esr,
rdata_esr,
pio_err_esr,
esr_interrupt,
// port0 xpcs, pcs signals
esr_mac_sync_0,
esr_mac_los_0,
serdes_rdy0,
xserdes_rdy0,
signal_detect0,
// port1 xpcs, pcs signals
esr_mac_sync_1,
esr_mac_los_1,
serdes_rdy1,
xserdes_rdy1,
signal_detect1,
/* ----- debug data ----- */		 
// ---- port 0 serdes 0
// tx side signals
xtx_code_group0,
tx_code_group0,
mac_esr_txd0_0,
mac_esr_txd1_0,
mac_esr_txd2_0,
mac_esr_txd3_0,
// rx side signals
esr_mac_rxd0_0,
esr_mac_rxd1_0,
esr_mac_rxd2_0,
esr_mac_rxd3_0,
xrx_code_group0,
rx_code_group0,
// ----  port 1 serdes 1
// tx side signals
xtx_code_group1,
tx_code_group1,
mac_esr_txd0_1,
mac_esr_txd1_1,
mac_esr_txd2_1,
mac_esr_txd3_1,
// rx side signals
esr_mac_rxd0_1,
esr_mac_rxd1_1,
esr_mac_rxd2_1,
esr_mac_rxd3_1,
xrx_code_group1,
rx_code_group1,
serdes_debug
 );
   
                   // global signals
   input           pio_core_reset;
   input           clk;
                   // pio interface
   input  [8:0]    pio_addr;      // pio global signal
   input           pio_rd;        // pio global signal
   input  [31:0]   pio_wdata;     // pio global signal
   input           sel_esr;
   output          ack_esr;
   output [31:0]   rdata_esr;
   output          pio_err_esr;
   output          esr_interrupt;
                   // port0 xpcs, pcs signals
   input [3:0] 	   esr_mac_sync_0;
   input [3:0] 	   esr_mac_los_0;
   output [3:0]    serdes_rdy0;
   output          xserdes_rdy0;
   output [3:0]	   signal_detect0;
                   // port1 xpcs, pcs signals
   input [3:0] 	   esr_mac_sync_1;
   input [3:0] 	   esr_mac_los_1;
   output [3:0]    serdes_rdy1;
   output          xserdes_rdy1;
   output [3:0]	   signal_detect1;
                   /* ----- debug data ----- */		 
                   // ----- port 0 serdes 0
                   // tx side signals
   input  [39:0]   xtx_code_group0;
   input  [9:0]    tx_code_group0;
   input  [9:0]    mac_esr_txd0_0;
   input  [9:0]    mac_esr_txd1_0;
   input  [9:0]    mac_esr_txd2_0;
   input  [9:0]    mac_esr_txd3_0;
                   // rx side signals
   input  [9:0]    esr_mac_rxd0_0;
   input  [9:0]    esr_mac_rxd1_0;
   input  [9:0]    esr_mac_rxd2_0;
   input  [9:0]    esr_mac_rxd3_0;
   input  [39:0]   xrx_code_group0;
   input  [9:0]    rx_code_group0;
                   // ----- port 1 serdes 1
                   // tx side signals
   input  [39:0]   xtx_code_group1;
   input  [9:0]    tx_code_group1;
   input  [9:0]    mac_esr_txd0_1;
   input  [9:0]    mac_esr_txd1_1;
   input  [9:0]    mac_esr_txd2_1;
   input  [9:0]    mac_esr_txd3_1;
                   // rx side signals
   input  [9:0]    esr_mac_rxd0_1;
   input  [9:0]    esr_mac_rxd1_1;
   input  [9:0]    esr_mac_rxd2_1;
   input  [9:0]    esr_mac_rxd3_1;
   input  [39:0]   xrx_code_group1;
   input  [9:0]    rx_code_group1;
   output [31:0]   serdes_debug;
   
  // esr_ctrl
   wire [3:0] 	   esr_mac_sync_0;
   wire [3:0] 	   esr_mac_los_0;
   wire [3:0]      serdes_rdy0;
   wire            xserdes_rdy0;
   wire [3:0]	   signal_detect0;
                   // port1 xpcs, pcs signals
   wire [3:0] 	   esr_mac_sync_1;
   wire [3:0] 	   esr_mac_los_1;
   wire [3:0]      serdes_rdy1;
   wire            xserdes_rdy1;
   wire [3:0]	   signal_detect1;

   wire 	   reset;
   wire 	   pio_core_reset;
   wire  [31:0]    rdata_esr;
   wire  [8:0]     reg_offset;
   wire            pio_err_esr;
   reg   [31:0]    rd_data;
   reg 		   non_qualified_addr_err;
   wire 	   wr_en;
   wire 	   addr_err;
   wire            esr_interrupt = 0;
   wire 	   sync0_0;
   wire 	   sync1_0;
   wire 	   sync2_0;
   wire 	   sync3_0;
   wire 	   sync0_1;
   wire 	   sync1_1;
   wire 	   sync2_1;
   wire 	   sync3_1;
   wire 	   los0_0;
   wire 	   los1_0;
   wire 	   los2_0;
   wire 	   los3_0;
   wire 	   los0_1;
   wire 	   los1_1;
   wire 	   los2_1;
   wire 	   los3_1;
   wire 	   rd_wr;
   wire 	   core_sel;
   wire 	   core_sel_lead;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire  [31:0]    wr_data;
   wire 	   rd_en;
   wire 	   rac_pls;
   wire 	   core_sel_trail;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on

// **********************************
// serdes0 10G/1G PCS
// **********************************

SYNC_CELL sync0_0_SYNC_CELL (.D(esr_mac_sync_0[0]),.CP(clk),.Q(sync0_0));
SYNC_CELL sync1_0_SYNC_CELL (.D(esr_mac_sync_0[1]),.CP(clk),.Q(sync1_0));
SYNC_CELL sync2_0_SYNC_CELL (.D(esr_mac_sync_0[2]),.CP(clk),.Q(sync2_0));
SYNC_CELL sync3_0_SYNC_CELL (.D(esr_mac_sync_0[3]),.CP(clk),.Q(sync3_0));

SYNC_CELL los0_0_SYNC_CELL (.D(esr_mac_los_0[0]),.CP(clk),.Q(los0_0));
SYNC_CELL los1_0_SYNC_CELL (.D(esr_mac_los_0[1]),.CP(clk),.Q(los1_0));
SYNC_CELL los2_0_SYNC_CELL (.D(esr_mac_los_0[2]),.CP(clk),.Q(los2_0));
SYNC_CELL los3_0_SYNC_CELL (.D(esr_mac_los_0[3]),.CP(clk),.Q(los3_0));

SRFF serdes_rdy00_SRFF (.reset(reset),.clk(clk),.iSet(sync0_0),.iRst(los0_0),.oQ(serdes_rdy0[0]));   
SRFF serdes_rdy10_SRFF (.reset(reset),.clk(clk),.iSet(sync1_0),.iRst(los1_0),.oQ(serdes_rdy0[1]));   
SRFF serdes_rdy20_SRFF (.reset(reset),.clk(clk),.iSet(sync2_0),.iRst(los2_0),.oQ(serdes_rdy0[2]));   
SRFF serdes_rdy30_SRFF (.reset(reset),.clk(clk),.iSet(sync3_0),.iRst(los3_0),.oQ(serdes_rdy0[3]));   

   assign 	  xserdes_rdy0        = &serdes_rdy0[3:0]; 
   assign 	  signal_detect0[3:0] = {~los3_0,~los2_0,~los1_0,~los0_0}; 
   

// **********************************
// serdes1 10G/1G PCS
// **********************************

SYNC_CELL sync0_1_SYNC_CELL (.D(esr_mac_sync_1[0]),.CP(clk),.Q(sync0_1));
SYNC_CELL sync1_1_SYNC_CELL (.D(esr_mac_sync_1[1]),.CP(clk),.Q(sync1_1));
SYNC_CELL sync2_1_SYNC_CELL (.D(esr_mac_sync_1[2]),.CP(clk),.Q(sync2_1));
SYNC_CELL sync3_1_SYNC_CELL (.D(esr_mac_sync_1[3]),.CP(clk),.Q(sync3_1));

SYNC_CELL los0_1_SYNC_CELL (.D(esr_mac_los_1[0]),.CP(clk),.Q(los0_1));
SYNC_CELL los1_1_SYNC_CELL (.D(esr_mac_los_1[1]),.CP(clk),.Q(los1_1));
SYNC_CELL los2_1_SYNC_CELL (.D(esr_mac_los_1[2]),.CP(clk),.Q(los2_1));
SYNC_CELL los3_1_SYNC_CELL (.D(esr_mac_los_1[3]),.CP(clk),.Q(los3_1));

SRFF serdes_rdy01_SRFF (.reset(reset),.clk(clk),.iSet(sync0_1),.iRst(los0_1),.oQ(serdes_rdy1[0]));   
SRFF serdes_rdy11_SRFF (.reset(reset),.clk(clk),.iSet(sync1_1),.iRst(los1_1),.oQ(serdes_rdy1[1]));   
SRFF serdes_rdy21_SRFF (.reset(reset),.clk(clk),.iSet(sync2_1),.iRst(los2_1),.oQ(serdes_rdy1[2]));   
SRFF serdes_rdy31_SRFF (.reset(reset),.clk(clk),.iSet(sync3_1),.iRst(los3_1),.oQ(serdes_rdy1[3]));   

   assign 	  xserdes_rdy1        = &serdes_rdy1[3:0]; 
   assign 	  signal_detect1[3:0] = {~los3_1,~los2_1,~los1_1,~los0_1}; 
    

// **********************************
// PIO Control Logic
// **********************************

//***** Register the bif interface signals *********************
// To reduce gate count -> take register away
// If there is a timing problem then register them again here. 
//**************************************************************


   FD1 core_reset_FD1 (.D(pio_core_reset),.CP(clk),.Q(reset));
   FD1 rd_wr_FD1      (.D(pio_rd),        .CP(clk),.Q(rd_wr));
   FD1 core_sel_FD1   (.D(sel_esr),       .CP(clk),.Q(core_sel));

   RegDff #(9) reg_offset_RegDff(.din(pio_addr[8:0]),
                                 .clk(clk),   
                                 .qout(reg_offset[8:0]));

   RegDff #(32) wr_data_RegDff  (.din(pio_wdata[31:0]),
                                 .clk(clk),   
                                 .qout(wr_data[31:0]));

   PlsGen2 core_sel_PlsGen2(.sig_in(core_sel),.clk(clk),
                            .lead(core_sel_lead),
                            .trail(core_sel_trail));

   assign    rd_en   = core_sel       &   rd_wr;
   wire      rac_ok  = core_sel_lead  &   rd_wr;
   assign    wr_en   = core_sel_lead  & (~rd_wr);

   RegDff #(32) pio_rd_data_RegDff (.din(rd_data),.clk(clk),
                                    .qout(rdata_esr[31:0]));
   
   FD1 pio_ack_FD1 (.D(core_sel_lead),.CP(clk),.Q(ack_esr));
   FD1 rac_pls_FD1 (.D(rac_ok),.CP(clk),.Q(rac_pls));
   assign    addr_err = non_qualified_addr_err & core_sel_lead;
   FD1 pio_err_FD1 (.D(addr_err),.CP(clk),.Q(pio_err_esr));

   wire [31:0] 	serdes_ctl;
   
   reg 	        ld_serdes_ctl;
   
/* ----------- Read and Write Address Decoder -------------------------- */
always @ (/*AUTOSENSE*/los0_0 or los0_1 or los1_0 or los1_1 or los2_0
	  or los2_1 or los3_0 or los3_1 or reg_offset or serdes_ctl
	  or sync0_0 or sync0_1 or sync1_0 or sync1_1 or sync2_0
	  or sync2_1 or sync3_0 or sync3_1 or wr_en or xserdes_rdy0
	  or xserdes_rdy1)
  begin
             ld_serdes_ctl         = 0;
             non_qualified_addr_err= 0;
    case (reg_offset[8:0]) //synopsys parallel_case full_case
     9'h0:begin
             rd_data               = {14'h0,xserdes_rdy1,xserdes_rdy0,
                                      sync3_1,sync2_1,sync1_1,sync0_1,los3_1,los2_1,los1_1,los0_1,
                                      sync3_0,sync2_0,sync1_0,sync0_0,los3_0,los2_0,los1_0,los0_0};
          end  
     
    9'h1:begin
            ld_serdes_ctl          = wr_en;
            rd_data                = serdes_ctl;
         end

    default:begin 
             rd_data               = 32'hdead_beef;
             non_qualified_addr_err= 1;
             end
    endcase
  end

/* -------------------- serdes -------------------- */
xREG2 #(6) serdes_ctl_xREG2 (.clk(clk), 
                      .reset(reset),
                      .reset_value(6'b0),    
                      .load(ld_serdes_ctl), 
                      .din(wr_data[5:0]),      // Bits[2:0] are ignored.
                      .qout(serdes_ctl[5:0]));

   assign serdes_ctl[31:6] = 0;
   
   reg [31:0] 	 serdes_debug;

   always @ (/*AUTOSENSE*/esr_mac_rxd0_0 or esr_mac_rxd0_1
	     or esr_mac_rxd1_0 or esr_mac_rxd1_1 or esr_mac_rxd2_0
	     or esr_mac_rxd2_1 or esr_mac_rxd3_0 or esr_mac_rxd3_1
	     or mac_esr_txd0_0 or mac_esr_txd0_1 or mac_esr_txd1_0
	     or mac_esr_txd1_1 or mac_esr_txd2_0 or mac_esr_txd2_1
	     or mac_esr_txd3_0 or mac_esr_txd3_1 or rx_code_group0
	     or rx_code_group1 or serdes_ctl or tx_code_group0
	     or tx_code_group1 or xrx_code_group0 or xrx_code_group1
	     or xtx_code_group0 or xtx_code_group1)
     begin
     case (serdes_ctl[3:0]) // synopsys parallel_case full_case 
       4'h0   : serdes_debug = xtx_code_group0[31:0];
       4'h1   : serdes_debug = {4'b0,mac_esr_txd0_0[9:0],tx_code_group0[9:0],xtx_code_group0[39:32]};
       4'h2   : serdes_debug = {2'b0,mac_esr_txd3_0[9:0],mac_esr_txd2_0[9:0],mac_esr_txd1_0[9:0]};
       4'h3   : serdes_debug = xrx_code_group0[31:0];
       4'h4   : serdes_debug = {4'b0,esr_mac_rxd0_0[9:0],rx_code_group0[9:0],xrx_code_group0[39:32]};
       4'h5   : serdes_debug = {2'b0,esr_mac_rxd3_0[9:0],esr_mac_rxd2_0[9:0],esr_mac_rxd1_0[9:0]};

       4'h6   : serdes_debug = xtx_code_group1[31:0];
       4'h7   : serdes_debug = {4'b0,mac_esr_txd0_1[9:0],tx_code_group1[9:0],xtx_code_group1[39:32]};
       4'h8   : serdes_debug = {2'b0,mac_esr_txd3_1[9:0],mac_esr_txd2_1[9:0],mac_esr_txd1_1[9:0]};
       4'h9   : serdes_debug = xrx_code_group1[31:0];
       4'ha   : serdes_debug = {4'b0,esr_mac_rxd0_1[9:0],rx_code_group1[9:0],xrx_code_group1[39:32]};
       4'hb   : serdes_debug = {2'b0,esr_mac_rxd3_1[9:0],esr_mac_rxd2_1[9:0],esr_mac_rxd1_1[9:0]};
       default: serdes_debug = xtx_code_group0[31:0];
     endcase
     end  // always @ (...
   

   
endmodule // esr_ctrl

