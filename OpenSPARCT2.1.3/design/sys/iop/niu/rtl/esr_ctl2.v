// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: esr_ctl2.v
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
 * File Name    : esr_ctl2.v
 * Author Name  : John Lo
 * Description  : ethernet serdes controller.  
 *                This module main function is to produce 
 *                1. serdes_rdy
 *                2. signal_detect
 * 
 *                This module is in sys_clk domain.
 * 
 *                The corresponding data path is in sphy_dpath4.
 *                The corresponding clock path is in phy_clock_2ports.
 *                The muxing on esr_ctl2, sphy_dpath2, and phy_clock_2ports
 *                should be in sync. -> This is very important.
 * 
 * Parent Module: mac_2ports
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


module esr_ctl2 ( 
pio_core_reset,
clk,
blunt_end_loopback,
// pio interface
pio_addr,      // pio global signal
pio_rd,        // pio global signal
pio_wdata,     // pio global signal
sel_esr,
ack_esr,
rdata_esr,
pio_err_esr,
serdes_reset_0,
serdes_reset_1,
// port0 xpcs, pcs signals
esr_mac_lock_0,
esr_mac_los_0,
serdes_rdy0_0,
signal_detect0_0,
xserdes_rdy_0,
xsignal_detect_0,
// port1 xpcs, pcs signals
esr_mac_lock_1,
esr_mac_los_1,
serdes_rdy0_1,
signal_detect0_1,
xserdes_rdy_1,
xsignal_detect_1,
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
esrctl_debug
 );
   
                   // global signals
   input           pio_core_reset;
   input           clk;
   output 	   blunt_end_loopback;
                   // pio interface
   input  [8:0]    pio_addr;      // pio global signal
   input           pio_rd;        // pio global signal
   input  [31:0]   pio_wdata;     // pio global signal
   input           sel_esr;
   output          ack_esr;
   output [31:0]   rdata_esr;
   output          pio_err_esr;
   output 	   serdes_reset_0;
   output 	   serdes_reset_1;
                   // port0 xpcs, pcs signals
   input       	   esr_mac_lock_0;
   input [3:0] 	   esr_mac_los_0;
   output          serdes_rdy0_0;
   output      	   signal_detect0_0;
   output          xserdes_rdy_0;
   output [3:0]	   xsignal_detect_0;
                   // port1 xpcs, pcs signals
   input       	   esr_mac_lock_1;
   input [3:0] 	   esr_mac_los_1;
   output          serdes_rdy0_1;
   output      	   signal_detect0_1;
   output          xserdes_rdy_1;
   output [3:0]	   xsignal_detect_1;
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
   output [31:0]   esrctl_debug;
   
///////////////////////////////////////////////////////////////

                   // serdes0 
   wire       	   esr_mac_lock_0;
   wire [3:0] 	   esr_mac_los_0;
   wire            serdes_rdy0_0;
   wire            serdes_rdy1_0;
   wire            serdes_rdy2_0;
   wire            serdes_rdy3_0;
   wire       	   signal_detect0_0;
   reg             xserdes_rdy_0;
   wire [3:0]	   xsignal_detect_0;
                   // serdes1 
   wire        	   esr_mac_lock_1;
   wire [3:0] 	   esr_mac_los_1;
   wire            serdes_rdy0_1;
   wire            serdes_rdy1_1;
   wire            serdes_rdy2_1;
   wire            serdes_rdy3_1;
   wire       	   signal_detect0_1;
   reg             xserdes_rdy_1;
   wire [3:0]	   xsignal_detect_1;
 
   wire 	   reset;
   wire 	   pio_core_reset;
   wire  [31:0]    rdata_esr;
   wire  [8:0]     reg_offset;
   wire            pio_err_esr;
   reg   [31:0]    rd_data;
   reg 	           ld_debug_sel;
   reg 		   non_qualified_addr_err;
   reg  	   ld_serdes_reset       ;
   reg 		   ld_configa            ;
   wire 	   force_serdes_rdy      ;
   wire 	   blunt_end_loopback    ;
   wire [1:0] 	   serdes_reset          ;
   wire [1:0] 	   configa               ;
   wire 	   wr_en;
   wire 	   addr_err;
   wire 	   lock_0;
   wire 	   lock_1;
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

   wire [31:0] 	   debug_sel;

// **********************************
// global logic
// **********************************

SYNC_CELL lock_0_SYNC_CELL (.D(esr_mac_lock_0),.CP(clk),.Q(lock_0));
SYNC_CELL lock_1_SYNC_CELL (.D(esr_mac_lock_1),.CP(clk),.Q(lock_1));

// **********************************
// serdes0 10G/1G PCS
// **********************************

SYNC_CELL los0_0_SYNC_CELL (.D(esr_mac_los_0[0]),.CP(clk),.Q(los0_0));
SYNC_CELL los1_0_SYNC_CELL (.D(esr_mac_los_0[1]),.CP(clk),.Q(los1_0));
SYNC_CELL los2_0_SYNC_CELL (.D(esr_mac_los_0[2]),.CP(clk),.Q(los2_0));
SYNC_CELL los3_0_SYNC_CELL (.D(esr_mac_los_0[3]),.CP(clk),.Q(los3_0));

   wire 	  set_serdes_rdy0_0 = (lock_0 & ~los0_0) | force_serdes_rdy;
   wire 	  set_serdes_rdy1_0 = (lock_0 & ~los1_0) | force_serdes_rdy;
   wire 	  set_serdes_rdy2_0 = (lock_0 & ~los2_0) | force_serdes_rdy;
   wire 	  set_serdes_rdy3_0 = (lock_0 & ~los3_0) | force_serdes_rdy;

SRFF serdes_rdy0_0_SRFF (.reset(reset),.clk(clk),.iSet(set_serdes_rdy0_0),.iRst(los0_0),.oQ(serdes_rdy0_0));   
SRFF serdes_rdy1_0_SRFF (.reset(reset),.clk(clk),.iSet(set_serdes_rdy1_0),.iRst(los1_0),.oQ(serdes_rdy1_0));   
SRFF serdes_rdy2_0_SRFF (.reset(reset),.clk(clk),.iSet(set_serdes_rdy2_0),.iRst(los2_0),.oQ(serdes_rdy2_0));   
SRFF serdes_rdy3_0_SRFF (.reset(reset),.clk(clk),.iSet(set_serdes_rdy3_0),.iRst(los3_0),.oQ(serdes_rdy3_0));

   assign         signal_detect0_0      = ~los0_0;
   
   always @ (posedge clk)
     xserdes_rdy_0 <= serdes_rdy0_0 &
		      serdes_rdy1_0 &
		      serdes_rdy2_0 &
		      serdes_rdy3_0 ;
   
   assign 	  xsignal_detect_0[3:0] = {~los3_0,~los2_0,~los1_0,~los0_0}; 
   

// **********************************
// serdes1 10G/1G PCS
// **********************************

SYNC_CELL los0_1_SYNC_CELL (.D(esr_mac_los_1[0]),.CP(clk),.Q(los0_1));
SYNC_CELL los1_1_SYNC_CELL (.D(esr_mac_los_1[1]),.CP(clk),.Q(los1_1));
SYNC_CELL los2_1_SYNC_CELL (.D(esr_mac_los_1[2]),.CP(clk),.Q(los2_1));
SYNC_CELL los3_1_SYNC_CELL (.D(esr_mac_los_1[3]),.CP(clk),.Q(los3_1));

   wire 	  set_serdes_rdy0_1 = (lock_1 & ~los0_1) | force_serdes_rdy;
   wire 	  set_serdes_rdy1_1 = (lock_1 & ~los1_1) | force_serdes_rdy;
   wire 	  set_serdes_rdy2_1 = (lock_1 & ~los2_1) | force_serdes_rdy;
   wire 	  set_serdes_rdy3_1 = (lock_1 & ~los3_1) | force_serdes_rdy;

SRFF serdes_rdy0_1_SRFF (.reset(reset),.clk(clk),.iSet(set_serdes_rdy0_1),.iRst(los0_1),.oQ(serdes_rdy0_1));   
SRFF serdes_rdy1_1_SRFF (.reset(reset),.clk(clk),.iSet(set_serdes_rdy1_1),.iRst(los1_1),.oQ(serdes_rdy1_1));   
SRFF serdes_rdy2_1_SRFF (.reset(reset),.clk(clk),.iSet(set_serdes_rdy2_1),.iRst(los2_1),.oQ(serdes_rdy2_1));   
SRFF serdes_rdy3_1_SRFF (.reset(reset),.clk(clk),.iSet(set_serdes_rdy3_1),.iRst(los3_1),.oQ(serdes_rdy3_1));   

   assign         signal_detect0_1      = ~los0_1;

   always @ (posedge clk)
     xserdes_rdy_1 <= serdes_rdy0_1 &
	              serdes_rdy1_1 &
		      serdes_rdy2_1 &
		      serdes_rdy3_1 ;
   
   assign 	  xsignal_detect_1[3:0] = {~los3_1,~los2_1,~los1_1,~los0_1}; 
   

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

   
/* ----------- Read and Write Address Decoder -------------------------- */
always @ (/*AUTOSENSE*/configa or debug_sel or lock_0 or lock_1
	  or los0_0 or los0_1 or los1_0 or los1_1 or los2_0 or los2_1
	  or los3_0 or los3_1 or reg_offset or serdes_rdy0_0
	  or serdes_rdy0_1 or serdes_reset or signal_detect0_0
	  or signal_detect0_1 or wr_en or xserdes_rdy_0
	  or xserdes_rdy_1 or xsignal_detect_0 or xsignal_detect_1)
  begin
                ld_serdes_reset       = 0;
                ld_configa            = 0; // serdes_0
                ld_debug_sel          = 0;
                non_qualified_addr_err= 0;
    case (reg_offset[8:0]) // synopsys parallel_case full_case infer_mux
     9'h0_00:begin
                ld_serdes_reset       = wr_en;
                rd_data               = {30'b0,serdes_reset[1:0]};
             end
     9'h0_01:begin
                ld_configa            = wr_en;
                rd_data               = {30'b0,configa};
             end
     9'h1_00:begin
                rd_data               = {lock_0,lock_1,
                                      serdes_rdy0_0,signal_detect0_0,
                                      serdes_rdy0_1,signal_detect0_1,
                                      xserdes_rdy_0,xsignal_detect_0[3:0],
                                      xserdes_rdy_1,xsignal_detect_1[3:0],
                                      8'b0,
                                      los3_1,los2_1,los1_1,los0_1,
                                      los3_0,los2_0,los1_0,los0_0};
             end  
      
     9'h1_01:begin
                ld_debug_sel          = wr_en;
                rd_data               = debug_sel;
              end

     default:begin 
                rd_data               = 32'hdead_beef;
                non_qualified_addr_err= 1;
             end
    endcase // case(reg_offset[8:0])
  end

/* -------------------- serdes -------------------- */
xREG2 #(6) debug_sel_xREG2 (.clk(clk), 
                      .reset(reset),
                      .reset_value(6'b0),    
                      .load(ld_debug_sel), 
                      .din(wr_data[5:0]),      // Bits[2:0] are ignored.
                      .qout(debug_sel[5:0]));

   assign debug_sel[31:6] = 0;
   
   reg [31:0] 	 esrctl_debug;

   always @ (/*AUTOSENSE*/debug_sel or esr_mac_rxd0_0
	     or esr_mac_rxd0_1 or esr_mac_rxd1_0 or esr_mac_rxd1_1
	     or esr_mac_rxd2_0 or esr_mac_rxd2_1 or esr_mac_rxd3_0
	     or esr_mac_rxd3_1 or mac_esr_txd0_0 or mac_esr_txd0_1
	     or mac_esr_txd1_0 or mac_esr_txd1_1 or mac_esr_txd2_0
	     or mac_esr_txd2_1 or mac_esr_txd3_0 or mac_esr_txd3_1
	     or rx_code_group0 or rx_code_group1 or tx_code_group0
	     or tx_code_group1 or xrx_code_group0 or xrx_code_group1
	     or xtx_code_group0 or xtx_code_group1)
     begin
     case (debug_sel[3:0]) // synopsys parallel_case full_case 
       4'h0   : esrctl_debug = xtx_code_group0[31:0];
       4'h1   : esrctl_debug = {4'b0,mac_esr_txd0_0[9:0],tx_code_group0[9:0],xtx_code_group0[39:32]};
       4'h2   : esrctl_debug = {2'b0,mac_esr_txd3_0[9:0],mac_esr_txd2_0[9:0],mac_esr_txd1_0[9:0]};
       4'h3   : esrctl_debug = xrx_code_group0[31:0];
       4'h4   : esrctl_debug = {4'b0,esr_mac_rxd0_0[9:0],rx_code_group0[9:0],xrx_code_group0[39:32]};
       4'h5   : esrctl_debug = {2'b0,esr_mac_rxd3_0[9:0],esr_mac_rxd2_0[9:0],esr_mac_rxd1_0[9:0]};

       4'h6   : esrctl_debug = xtx_code_group1[31:0];
       4'h7   : esrctl_debug = {4'b0,mac_esr_txd0_1[9:0],tx_code_group1[9:0],xtx_code_group1[39:32]};
       4'h8   : esrctl_debug = {2'b0,mac_esr_txd3_1[9:0],mac_esr_txd2_1[9:0],mac_esr_txd1_1[9:0]};
       4'h9   : esrctl_debug = xrx_code_group1[31:0];
       4'ha   : esrctl_debug = {4'b0,esr_mac_rxd0_1[9:0],rx_code_group1[9:0],xrx_code_group1[39:32]};
       4'hb   : esrctl_debug = {2'b0,esr_mac_rxd3_1[9:0],esr_mac_rxd2_1[9:0],esr_mac_rxd1_1[9:0]};
       default: esrctl_debug = xtx_code_group0[31:0];
     endcase
     end  // always @ (...
   
/***************************************************************
 * register instantiation secton
 ***************************************************************/
 /* ------------------------- serdes_reset ------------------------------- */
 xREG #(2) serdes_reset_xREG(.clk(clk),.reset(reset),.en(ld_serdes_reset),.din(wr_data[1:0]),.qout(serdes_reset[1:0]));
   wire  serdes_reset_0 = serdes_reset[0];
   wire  serdes_reset_1 = serdes_reset[1];
   
 /* ------------------------------------------------------------------------- */

 /* ------------------------- configa ------------------------------ */
   // For some reason synopsys does not like "config" as signal name.
 xREG #(2) configa_xREG(.clk(clk),.reset(reset),.en(ld_configa),.din(wr_data[1:0]),.qout(configa[1:0]));
   assign  force_serdes_rdy   = configa[0];
   assign  blunt_end_loopback = configa[1];
   
 /* ------------------------------------------------------------------------- */

   
endmodule // esr_ctl2

