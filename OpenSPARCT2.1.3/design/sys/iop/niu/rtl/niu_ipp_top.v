// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_top.v
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
/**********************************************************
***********************************************************

    Project         : Niu

    File name       : niu_ipp_top.v

    Module(s) name  : niu_ipp_top
    Original:       : ipp_top.v main.37, label: IPP_RTL_2.3

    Parent modules  : none

    Child modules   : niu_ipp.v, niu_ipp_ffl_arbiter.v.

    Author's name   : George Chu

    Date            : March 10, 2004

    Description     : Top level of combined 4 IPPs.
		      Arbitration logic has been implemented for ipp/fflp.
		      Each xmac/bmac is directly connected to ipp.
		      All ipp's directly connect to Dmc.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_ipp_top (
`ifdef NEPTUNE
`else
                    tcu_mbist_user_mode,
                    tcu_scan_en,
                    tcu_mbist_bisi_en,
                    tcu_rtx_rxc_ipp0_mbist_start,
                    tcu_rtx_rxc_ipp1_mbist_start,
                    rtx_rxc_ipp0_tcu_mbist_fail,
                    rtx_rxc_ipp1_tcu_mbist_fail,
                    rtx_rxc_ipp0_tcu_mbist_done,
                    rtx_rxc_ipp1_tcu_mbist_done,
                    niu_mb3_prebuf_header_scan_in,
                    niu_mb3_prebuf_header_scan_out,
                    niu_mb3_rx_data_fifo_scan_in,
                    niu_mb3_rx_data_fifo_scan_out,
                    rtx_rxc_ipp0_mb3_mbist_scan_in,
                    rtx_rxc_ipp0_mb3_mbist_scan_out,
                    rtx_rxc_ipp0_mb3_dmo_dout,
                    niu_mb4_prebuf_header_scan_in,
                    niu_mb4_prebuf_header_scan_out,
                    niu_mb4_rx_data_fifo_scan_in,
                    niu_mb4_rx_data_fifo_scan_out,
                    rtx_rxc_ipp1_mb3_mbist_scan_in,
                    rtx_rxc_ipp1_mb3_mbist_scan_out,
                    rtx_rxc_ipp1_mb3_dmo_dout,

                    hdr_sram_rvalue_ipp0,
                    hdr_sram_rid_ipp0,
                    hdr_sram_wr_en_ipp0,
                    hdr_sram_red_clr_ipp0,
                    sram_hdr_read_data_ipp0,

                    hdr_sram_rvalue_ipp1,
                    hdr_sram_rid_ipp1,
                    hdr_sram_wr_en_ipp1,
                    hdr_sram_red_clr_ipp1,
                    sram_hdr_read_data_ipp1,

                    tcu_aclk,
                    tcu_bclk,
                    tcu_se_scancollar_in,
                    tcu_se_scancollar_out,
                    tcu_array_wr_inhibit,

                    iol2clk,
                    l2clk_2x,
`endif
                    fflp_ipp_ready,     // input from fflp
                    fflp_ipp_dvalid,
                    fflp_ipp_sum,

                    pio_clients_sel_ipp,// input from cpu
                    pio_clients_addr,
                    pio_clients_rd,
                    pio_clients_wdata,

                    reset_l,
                    clk,

                    ipp_fflp_dvalid,    // output to  fflp
                    ipp_fflp_port,
                    ipp_fflp_data,
                    ipp_fflp_mac_default,

                    ipp_pio_ack,        // output to  cpu
                    ipp_pio_rdata, 
                    ipp_pio_err, 
                    ipp_pio_intr, 
                    ipp_debug_port, 

`ifdef NEPTUNE
// ipp3
                    mac_rxc_req3,       // input from bmac 
                    mac_rxc_tag3,
                    mac_rxc_data3,
                    mac_rxc_ctrl3,
                    mac_rxc_stat3,
                    dmc_ipp_dat_req3,   // input from dmc  

                    rxc_mac_ack3,       // output to bmac 
                    ipp_dmc_dat_ack3,   // output to  dmc
                    ipp_dmc_data3,
                    ipp_dmc_ful_pkt3,
                    ipp_dmc_dat_err3,
// ipp2
                    mac_rxc_req2,       // input from bmac 
                    mac_rxc_tag2,
                    mac_rxc_data2,
                    mac_rxc_ctrl2,
                    mac_rxc_stat2,
                    dmc_ipp_dat_req2,   // input from dmc  

                    rxc_mac_ack2,       // output to bmac 
                    ipp_dmc_dat_ack2,   // output to  dmc
                    ipp_dmc_data2,
                    ipp_dmc_ful_pkt2,
                    ipp_dmc_dat_err2,
`endif

// ipp1
                    mac_rxc_ack1,       // input from xmac 
                    mac_rxc_tag1,
                    mac_rxc_data1,
                    mac_rxc_ctrl1,
                    mac_rxc_stat1,
                    dmc_ipp_dat_req1,   // input from dmc  

                    rxc_mac_req1,       // output to xmac 
                    ipp_dmc_dat_ack1,   // output to  dmc
                    ipp_dmc_data1,
                    ipp_dmc_ful_pkt1,
                    ipp_dmc_dat_err1,
// ipp0
                    mac_rxc_ack0,       // input from xmac
                    mac_rxc_tag0,
                    mac_rxc_data0,
                    mac_rxc_ctrl0,
                    mac_rxc_stat0,
                    dmc_ipp_dat_req0,   // input from dmc  

                    rxc_mac_req0,       // output to xmac 
                    ipp_dmc_dat_ack0,   // output to  dmc
                    ipp_dmc_data0,
                    ipp_dmc_ful_pkt0,
                    ipp_dmc_dat_err0 
                   );                   // end of niu_ipp_top pin definition

`ifdef NEPTUNE
`else
input                          tcu_mbist_user_mode;
input                          tcu_scan_en;
input                          tcu_mbist_bisi_en;
input                          tcu_rtx_rxc_ipp0_mbist_start;
input                          tcu_rtx_rxc_ipp1_mbist_start;
output                         rtx_rxc_ipp0_tcu_mbist_fail;
output                         rtx_rxc_ipp0_tcu_mbist_done;
output                         rtx_rxc_ipp1_tcu_mbist_fail;
output                         rtx_rxc_ipp1_tcu_mbist_done;
input                          niu_mb3_prebuf_header_scan_in;
output                         niu_mb3_prebuf_header_scan_out;
input                          niu_mb3_rx_data_fifo_scan_in;
output                         niu_mb3_rx_data_fifo_scan_out;
input                          rtx_rxc_ipp0_mb3_mbist_scan_in;
output                         rtx_rxc_ipp0_mb3_mbist_scan_out;
output                  [39:0] rtx_rxc_ipp0_mb3_dmo_dout;
input                          niu_mb4_prebuf_header_scan_in;
output                         niu_mb4_prebuf_header_scan_out;
input                          niu_mb4_rx_data_fifo_scan_in;
output                         niu_mb4_rx_data_fifo_scan_out;
input                          rtx_rxc_ipp1_mb3_mbist_scan_in;
output                         rtx_rxc_ipp1_mb3_mbist_scan_out;
output                  [39:0] rtx_rxc_ipp1_mb3_dmo_dout;

input                    [6:0] hdr_sram_rvalue_ipp0;
input                    [2:0] hdr_sram_rid_ipp0;
input                          hdr_sram_wr_en_ipp0;
input                          hdr_sram_red_clr_ipp0;
output                   [6:0] sram_hdr_read_data_ipp0;

input                    [6:0] hdr_sram_rvalue_ipp1;
input                    [2:0] hdr_sram_rid_ipp1;
input                          hdr_sram_wr_en_ipp1;
input                          hdr_sram_red_clr_ipp1;
output                   [6:0] sram_hdr_read_data_ipp1;

input                          tcu_aclk;
input                          tcu_bclk;
input                          tcu_se_scancollar_in;
input                          tcu_se_scancollar_out;
input                          tcu_array_wr_inhibit;

input                          iol2clk;
input                          l2clk_2x;
`endif

// output of fflp
input           fflp_ipp_ready;		// ready to accept data from ipp
`ifdef NEPTUNE
input     [3:0] fflp_ipp_dvalid;	// which port's parsed data is valid
`else
input     [1:0] fflp_ipp_dvalid;	// which port's parsed data is valid
`endif
input    [13:0] fflp_ipp_sum;     	// parsed packet header information

// output of cpu 
input           pio_clients_sel_ipp;    // select ipp's    
input    [19:0] pio_clients_addr;
input           pio_clients_rd;	        // rd_wr
input    [31:0] pio_clients_wdata;

// input from global
input           reset_l;
input           clk;

// output to ffl
output          ipp_fflp_dvalid;        // packet header data is valid
output    [1:0] ipp_fflp_port;          // the data belongs to which mac_port
output 	[127:0] ipp_fflp_data;          // ipp sends a packet's header data
output 	 [11:0] ipp_fflp_mac_default;   // default value of mac addr table

output          ipp_pio_ack;            // output to  cpu
output   [63:0] ipp_pio_rdata;
output          ipp_pio_err;
output          ipp_pio_intr;
output   [31:0] ipp_debug_port;

// input to ipp0
input           mac_rxc_ack0;		// xmac sends the ack to ipp
input           mac_rxc_tag0;		// xmac identifies the last part packet
input    [63:0] mac_rxc_data0;		// xmac writing the data to ipp
input           mac_rxc_ctrl0;		// active high for control information
input    [22:0] mac_rxc_stat0;		// xmac writing the status to ipp
input           dmc_ipp_dat_req0;       // dmc request data from rxc_data_fifo_0

// output of ipp0
output		rxc_mac_req0;		// req(as rdy) from ipp to xmac
output          ipp_dmc_dat_ack0;       // rxc_data_fifo_0 is sending data to dmc
output  [129:0] ipp_dmc_data0;          // rxc_data_fifo_0's data to dmc
output          ipp_dmc_ful_pkt0;       // rxc_data_fifo_0 has at least 1 full packet
output          ipp_dmc_dat_err0;       // rxc_data_fifo_0 data has error

// input to ipp1
input           mac_rxc_ack1;   	// xmac sends the ack to ipp
input           mac_rxc_tag1;   	// bmac identifies the last part packet
input    [63:0] mac_rxc_data1;  	// bmac writing the data to ipp         
input           mac_rxc_ctrl1;		// active high for control information
input    [22:0] mac_rxc_stat1;  	// bmac writing the status to ipp
input           dmc_ipp_dat_req1;       // dmc request data from rxc_data_fifo_1

// output of ipp1
output		rxc_mac_req1;		// ack from ipp to bmac
output          ipp_dmc_dat_ack1;       // rxc_data_fifo_1 is sending data to dmc
output  [129:0] ipp_dmc_data1;          // rxc_data_fifo_1's data to dmc
output          ipp_dmc_ful_pkt1;       // rxc_data_fifo_1 has at least 1 full packet
output          ipp_dmc_dat_err1;       // rxc_data_fifo_1 data has error

`ifdef NEPTUNE
// input to ipp2
input           mac_rxc_req2;   	// bmac sends the request to ipp
input           mac_rxc_tag2;   	// bmac identifies the last part packet
input    [63:0] mac_rxc_data2;  	// bmac writing the data to ipp         
input           mac_rxc_ctrl2;		// active high for control information
input    [22:0] mac_rxc_stat2;  	// bmac writing the status to ipp
input           dmc_ipp_dat_req2;       // dmc request data from rxc_data_fifo_2

// output of ipp2
output		rxc_mac_ack2;		// ack from ipp to bmac
output          ipp_dmc_dat_ack2;       // rxc_data_fifo_2 is sending data to dmc
output  [129:0] ipp_dmc_data2;          // rxc_data_fifo_2's data to dmc
output          ipp_dmc_ful_pkt2;       // rxc_data_fifo_2 has at least 1 full packet
output          ipp_dmc_dat_err2;       // rxc_data_fifo_2 data has error

// input to ipp3
input           mac_rxc_req3;   	// bmac sends the request to ipp
input           mac_rxc_tag3;   	// bmac identifies the last part packet
input    [63:0] mac_rxc_data3;  	// bmac writing the data to ipp         
input           mac_rxc_ctrl3;		// active high for control information
input    [22:0] mac_rxc_stat3; 		// bmac writing the status to ipp
input           dmc_ipp_dat_req3;       // dmc request data from rxc_data_fifo_3

// output of ipp3
output		rxc_mac_ack3;		// ack from ipp to bmac
output          ipp_dmc_dat_ack3;       // rxc_data_fifo_3 is sending data to dmc
output  [129:0] ipp_dmc_data3;          // rxc_data_fifo_3's data to dmc
output          ipp_dmc_ful_pkt3;       // rxc_data_fifo_3 has at least 1 full packet
output          ipp_dmc_dat_err3;       // rxc_data_fifo_3 data has error
`endif

reg             pio_ipp_sel;            // select ipp's
reg      [19:0] pio_addr;
reg             pio_rd;                 // rd_wr
reg      [31:0] pio_wdata;

/*****************************************************************************/
// output to ffl
wire            ipp_fflp_dvalid;
wire   	[1:0]  	ipp_fflp_port;
wire   	[127:0] ipp_fflp_data;
wire   	[11:0]  ipp_fflp_mac_default;

// output to cpu
reg             ipp_pio_ack;
reg      [63:0] ipp_pio_rdata;
reg             ipp_pio_err;
reg             ipp_pio_intr;
reg      [31:0] ipp_debug_port;

// output of ipp0
wire  		rxc_mac_req0;
wire            ipp_dmc_dat_ack0;
wire    [129:0] ipp_dmc_data0;
wire            ipp_dmc_ful_pkt0;
wire            ipp_dmc_dat_err0;

// output of ipp1
wire  		rxc_mac_req1;
wire            ipp_dmc_dat_ack1;
wire    [129:0] ipp_dmc_data1;
wire            ipp_dmc_ful_pkt1;
wire            ipp_dmc_dat_err1;

`ifdef NEPTUNE
// output of ipp2
wire  		rxc_mac_ack2;
wire            ipp_dmc_dat_ack2;
wire    [129:0] ipp_dmc_data2;
wire            ipp_dmc_ful_pkt2;
wire            ipp_dmc_dat_err2;

// output of ipp3
wire  		rxc_mac_ack3;
wire            ipp_dmc_dat_ack3;
wire    [129:0] ipp_dmc_data3;
wire            ipp_dmc_ful_pkt3;
wire            ipp_dmc_dat_err3;
`endif

/*****************************************************************************/
// output of ipp0
wire  		ipp_ack0;
wire  	[31:0]	ipp_rdata0;
wire  		ipp_pio_err0;
wire  		ipp_intr0;
wire  	[31:0]	ipp_debug0;
wire            debug_out_ena0;

wire            sel_ipp0;

// output of ipp1
wire            ipp_ack1;
wire    [31:0]  ipp_rdata1;
wire            ipp_pio_err1;
wire            ipp_intr1;
wire  	[31:0]	ipp_debug1;
wire            debug_out_ena1;

wire            sel_ipp1;
wire /*geo*/    clk1       = clk;

`ifdef NEPTUNE
// output of ipp2
wire            ipp_ack2;
wire    [31:0]  ipp_rdata2;
wire            ipp_pio_err2;
wire            ipp_intr2;
wire  	[31:0]	ipp_debug2;
wire            debug_out_ena2;

wire            sel_ipp2;
wire /*geo*/    clk2       = clk;

// output of ipp3
wire            ipp_ack3;
wire    [31:0]  ipp_rdata3;
wire            ipp_pio_err3;
wire            ipp_intr3;
wire  	[31:0]	ipp_debug3;
wire            debug_out_ena3;

wire            sel_ipp3;
wire /*geo*/    clk3       = clk;
`endif

/*****************************************************************************/

/*****************************************************************************/
// for ffl_arbiter
wire            ipp_ffl_req0;
wire    [127:0] ipp_ffl_data0;
wire     [11:0] ipp_ffl_mac_default0;
wire            ipp_ffl_dvalid0;
wire            ffl_arb_ack0;

wire            ipp_ffl_req1;
wire    [127:0]	ipp_ffl_data1;
wire     [11:0] ipp_ffl_mac_default1;
wire            ipp_ffl_dvalid1;
wire            ffl_arb_ack1;

`ifdef NEPTUNE
wire            ipp_ffl_req2;
wire    [127:0]	ipp_ffl_data2;
wire     [11:0] ipp_ffl_mac_default2;
wire            ipp_ffl_dvalid2;
wire            ffl_arb_ack2;

wire            ipp_ffl_req3;
wire    [127:0]	ipp_ffl_data3;
wire     [11:0] ipp_ffl_mac_default3;
wire            ipp_ffl_dvalid3;
wire            ffl_arb_ack3;
`endif

wire            ipp_ack;
wire     [31:0] ipp_rdata_32; 
wire     [63:0] ipp_rdata;
wire            ipp_err;
wire            ipp_intr;
wire     [31:0] ipp_debug;

/******************************* local reset *********************************/
wire            reset_ipp;

  niu_ipp_reset_blk ipp_reset_blk (.reset_l(reset_l), .clk(clk), .reset(reset_ipp));

/*****************************************************************************/

`ifdef NEPTUNE
`else
/******************************* N2 mode memory scan and mbist staff *********/
wire                     [9:0] niu_mb3_addr;
wire                     [7:0] niu_mb3_wdata;
wire                           niu_mb3_run;

wire                     [9:0] niu_mb4_addr;
wire                     [7:0] niu_mb4_wdata;
wire                           niu_mb4_run;

wire                     [7:0] niu_mb3_prebuf_header_wdata      = niu_mb3_wdata;
wire                     [5:0] niu_mb3_prebuf_header_rd_addr    = niu_mb3_addr[5:0];
wire                     [5:0] niu_mb3_prebuf_header_wr_addr    = niu_mb3_addr[5:0];
wire                           niu_mb3_prebuf_header_wr_en;
wire                           niu_mb3_prebuf_header_rd_en;
wire                           niu_mb3_prebuf_header_run        = niu_mb3_run;
wire                           niu_mb3_prebuf_header_scan_out;
wire                   [145:0] niu_mb3_prebuf_header_data_out;

wire                     [7:0] niu_mb3_rx_data_fifo_wdata       = niu_mb3_wdata;
wire                     [9:0] niu_mb3_rx_data_fifo_rd_addr     = niu_mb3_addr[9:0];
wire                     [9:0] niu_mb3_rx_data_fifo_wr_addr     = niu_mb3_addr[9:0];
wire                           niu_mb3_rx_data_fifo_wr_en;
wire                           niu_mb3_rx_data_fifo_rd_en;
wire                           niu_mb3_rx_data_fifo_run         = niu_mb3_run;
wire                           niu_mb3_rx_data_fifo_scan_out;
wire                   [145:0] niu_mb3_rx_data_fifo_data_out;

wire                           rtx_rxc_ipp0_tcu_mbist_fail;
wire                           rtx_rxc_ipp0_tcu_mbist_done;
wire                           rtx_rxc_ipp0_mb3_mbist_scan_out;
wire                    [39:0] rtx_rxc_ipp0_mb3_dmo_dout;

wire                     [7:0] niu_mb4_prebuf_header_wdata      = niu_mb4_wdata;
wire                     [5:0] niu_mb4_prebuf_header_rd_addr    = niu_mb4_addr[5:0];
wire                     [5:0] niu_mb4_prebuf_header_wr_addr    = niu_mb4_addr[5:0];
wire                           niu_mb4_prebuf_header_wr_en;
wire                           niu_mb4_prebuf_header_rd_en;
wire                           niu_mb4_prebuf_header_run        = niu_mb4_run;
wire                           niu_mb4_prebuf_header_scan_in;
wire                           niu_mb4_prebuf_header_scan_out;
wire                   [145:0] niu_mb4_prebuf_header_data_out;

wire                     [7:0] niu_mb4_rx_data_fifo_wdata       = niu_mb4_wdata;
wire                     [9:0] niu_mb4_rx_data_fifo_rd_addr     = niu_mb4_addr[9:0];
wire                     [9:0] niu_mb4_rx_data_fifo_wr_addr     = niu_mb4_addr[9:0];
wire                           niu_mb4_rx_data_fifo_wr_en;
wire                           niu_mb4_rx_data_fifo_rd_en;
wire                           niu_mb4_rx_data_fifo_run         = niu_mb4_run;
wire                           niu_mb4_rx_data_fifo_scan_out;
wire                   [145:0] niu_mb4_rx_data_fifo_data_out;

wire                           rtx_rxc_ipp1_tcu_mbist_fail;
wire                           rtx_rxc_ipp1_tcu_mbist_done;
wire                           rtx_rxc_ipp1_mb3_mbist_scan_out;
wire                    [39:0] rtx_rxc_ipp1_mb3_dmo_dout;

 niu_mb3 niu_mb3_ipp0 (
                       .rst                             (reset_ipp),
                       .niu_mb3_rx_data_fifo_rd_en      (niu_mb3_rx_data_fifo_rd_en),
                       .niu_mb3_rx_data_fifo_wr_en      (niu_mb3_rx_data_fifo_wr_en),
                       .niu_mb3_prebuf_header_rd_en     (niu_mb3_prebuf_header_rd_en),
                       .niu_mb3_prebuf_header_wr_en     (niu_mb3_prebuf_header_wr_en),
                       .niu_mb3_addr                    (niu_mb3_addr[9:0]),
                       .niu_mb3_wdata                   (niu_mb3_wdata),
                       .niu_mb3_run                     (niu_mb3_run),
                       .niu_mb3_rx_data_fifo_data_out   (niu_mb3_rx_data_fifo_data_out),
                       .niu_mb3_prebuf_header_data_out  (niu_mb3_prebuf_header_data_out),
                       .tcu_mbist_bisi_en               (tcu_mbist_bisi_en),
                       .tcu_niu_mbist_start_3           (tcu_rtx_rxc_ipp0_mbist_start),
                       .niu_tcu_mbist_fail_3            (rtx_rxc_ipp0_tcu_mbist_fail),
                       .niu_tcu_mbist_done_3            (rtx_rxc_ipp0_tcu_mbist_done),
                       .l1clk                           (clk),
                       .mb3_scan_out                    (rtx_rxc_ipp0_mb3_mbist_scan_out),
                       .mb3_dmo_dout                    (rtx_rxc_ipp0_mb3_dmo_dout),
                       .mb3_scan_in                     (rtx_rxc_ipp0_mb3_mbist_scan_in),
                       .tcu_aclk                        (tcu_aclk),
                       .tcu_bclk                        (tcu_bclk),
                       .tcu_mbist_user_mode             (tcu_mbist_user_mode)
                      );

 niu_mb3 niu_mb3_ipp1 (
                       .rst                             (reset_ipp),
                       .niu_mb3_rx_data_fifo_rd_en      (niu_mb4_rx_data_fifo_rd_en),
                       .niu_mb3_rx_data_fifo_wr_en      (niu_mb4_rx_data_fifo_wr_en),
                       .niu_mb3_prebuf_header_rd_en     (niu_mb4_prebuf_header_rd_en),
                       .niu_mb3_prebuf_header_wr_en     (niu_mb4_prebuf_header_wr_en),
                       .niu_mb3_addr                    (niu_mb4_addr[9:0]),
                       .niu_mb3_wdata                   (niu_mb4_wdata),
                       .niu_mb3_run                     (niu_mb4_run),
                       .niu_mb3_rx_data_fifo_data_out   (niu_mb4_rx_data_fifo_data_out),
                       .niu_mb3_prebuf_header_data_out  (niu_mb4_prebuf_header_data_out),
                       .tcu_mbist_bisi_en               (tcu_mbist_bisi_en),
                       .tcu_niu_mbist_start_3           (tcu_rtx_rxc_ipp1_mbist_start),
                       .niu_tcu_mbist_fail_3            (rtx_rxc_ipp1_tcu_mbist_fail),
                       .niu_tcu_mbist_done_3            (rtx_rxc_ipp1_tcu_mbist_done),
                       .l1clk                           (clk),
                       .mb3_scan_out                    (rtx_rxc_ipp1_mb3_mbist_scan_out),
                       .mb3_dmo_dout                    (rtx_rxc_ipp1_mb3_dmo_dout),
                       .mb3_scan_in                     (rtx_rxc_ipp1_mb3_mbist_scan_in),
                       .tcu_aclk                        (tcu_aclk),
                       .tcu_bclk                        (tcu_bclk),
                       .tcu_mbist_user_mode             (tcu_mbist_user_mode)
                      );

/******************************* N2 mode repairable SRAM headers *************/
wire                     [6:0] sram_hdr_read_data_ipp0;
wire                     [6:0] sram_hdr_read_data_ipp1;
`endif

/******************************* pio access **********************************/
`ifdef NEPTUNE
  assign sel_ipp3     = pio_ipp_sel && (pio_addr[19:14] == `NIU_IPP_PIO_SPACE_IPP3_NEP);
  assign sel_ipp2     = pio_ipp_sel && (pio_addr[19:14] == `NIU_IPP_PIO_SPACE_IPP2_NEP);
  assign sel_ipp1     = pio_ipp_sel && (pio_addr[19:14] == `NIU_IPP_PIO_SPACE_IPP1_NEP);
  assign sel_ipp0     = pio_ipp_sel && (pio_addr[19:14] == `NIU_IPP_PIO_SPACE_IPP0_NEP);
`else
  assign sel_ipp1     = pio_ipp_sel && (pio_addr[19:15] == `NIU_IPP_PIO_SPACE_IPP1_N2);
  assign sel_ipp0     = pio_ipp_sel && (pio_addr[19:15] == `NIU_IPP_PIO_SPACE_IPP0_N2);
`endif

  assign ipp_ack      = `ifdef NEPTUNE sel_ipp3 && ipp_ack3 || sel_ipp2 && ipp_ack2 || `endif 
                                       sel_ipp1 && ipp_ack1 || sel_ipp0 && ipp_ack0;

  assign ipp_rdata_32 = `ifdef NEPTUNE {32{sel_ipp3}} & ipp_rdata3[31:0] |
                                       {32{sel_ipp2}} & ipp_rdata2[31:0] | `endif
                                       {32{sel_ipp1}} & ipp_rdata1[31:0] |
                                       {32{sel_ipp0}} & ipp_rdata0[31:0];

  assign ipp_rdata    = {32'h0,ipp_rdata_32[31:0]};
  
  assign ipp_err      = `ifdef NEPTUNE             ipp_pio_err3 ||             ipp_pio_err2 || `endif
                                                   ipp_pio_err1 ||             ipp_pio_err0;
  
  assign ipp_intr     = `ifdef NEPTUNE             ipp_intr3 ||             ipp_intr2 || `endif
                                                   ipp_intr1 ||             ipp_intr0;

  assign ipp_debug    = `ifdef NEPTUNE {32{debug_out_ena3}} & ipp_debug3[31:0] | {32{debug_out_ena2}} & ipp_debug2[31:0] | `endif
                                       {32{debug_out_ena1}} & ipp_debug1[31:0] | {32{debug_out_ena0}} & ipp_debug0[31:0];
 
/******************************* Instantiation *******************************/

// ipp_ffl arbiter
niu_ipp_ffl_arbiter ffl_arbiter(
// input signals
		.ipp_ffl_req0          (ipp_ffl_req0),
		.ipp_fflp_data0        (ipp_ffl_data0[127:0]),
		.ipp_fflp_mac_default0 (ipp_ffl_mac_default0[11:0]),
                .ipp_fflp_dvalid0      (ipp_ffl_dvalid0),
		.ipp_ffl_req1          (ipp_ffl_req1),
		.ipp_fflp_data1        (ipp_ffl_data1[127:0]),
		.ipp_fflp_mac_default1 (ipp_ffl_mac_default1[11:0]),
                .ipp_fflp_dvalid1      (ipp_ffl_dvalid1),
`ifdef NEPTUNE
		.ipp_ffl_req2          (ipp_ffl_req2),
		.ipp_fflp_data2        (ipp_ffl_data2[127:0]),
		.ipp_fflp_mac_default2 (ipp_ffl_mac_default2[11:0]),
                .ipp_fflp_dvalid2      (ipp_ffl_dvalid2),
		.ipp_ffl_req3          (ipp_ffl_req3),
		.ipp_fflp_data3        (ipp_ffl_data3[127:0]),
		.ipp_fflp_mac_default3 (ipp_ffl_mac_default3[11:0]),
                .ipp_fflp_dvalid3      (ipp_ffl_dvalid3),
`endif
		.reset                 (reset_ipp),
		.clk(clk),
// output signals
		.ffl_arb_ack0          (ffl_arb_ack0),
		.ffl_arb_ack1          (ffl_arb_ack1),
`ifdef NEPTUNE
		.ffl_arb_ack2          (ffl_arb_ack2),
		.ffl_arb_ack3          (ffl_arb_ack3),
`endif
		.ipp_fflp_dvalid       (ipp_fflp_dvalid),
		.ipp_fflp_data         (ipp_fflp_data[127:0]),
		.ipp_fflp_port         (ipp_fflp_port[1:0]),
		.ipp_fflp_mac_default  (ipp_fflp_mac_default[11:0])
		);		// end of ffl_arbiter

// ipp0 module (connected to xmac)
`ifdef NEPTUNE niu_ipp_2ke ipp0(
		.ipp_pio_addr          (pio_addr[13:0]),
`else          niu_ipp_1ke ipp0(
		.ipp_pio_addr          (pio_addr[14:0]),
                        .tcu_aclk                     (tcu_aclk),
                        .tcu_bclk                     (tcu_bclk),
                        .tcu_scan_en                  (tcu_scan_en),
                        .tcu_se_scancollar_in         (tcu_se_scancollar_in),
                        .tcu_se_scancollar_out        (tcu_se_scancollar_out),
                        .tcu_array_wr_inhibit         (tcu_array_wr_inhibit),

                        .hdr_sram_rvalue              (hdr_sram_rvalue_ipp0[6:0]),
                        .hdr_sram_rid                 (hdr_sram_rid_ipp0[2:0]),
                        .hdr_sram_wr_en               (hdr_sram_wr_en_ipp0),
                        .hdr_sram_red_clr             (hdr_sram_red_clr_ipp0),
                        .sram_hdr_read_data           (sram_hdr_read_data_ipp0[6:0]),

                        .iol2clk                      (iol2clk),
                        .l2clk_2x                     (l2clk_2x),

                        .mbi_prebuf_header_wdata      (niu_mb3_prebuf_header_wdata),
                        .mbi_prebuf_header_rd_addr    (niu_mb3_prebuf_header_rd_addr),
                        .mbi_prebuf_header_wr_addr    (niu_mb3_prebuf_header_wr_addr),
                        .mbi_prebuf_header_wr_en      (niu_mb3_prebuf_header_wr_en),
                        .mbi_prebuf_header_rd_en      (niu_mb3_prebuf_header_rd_en),
                        .mbi_prebuf_header_run        (niu_mb3_prebuf_header_run),
                        .mbi_prebuf_header_scan_in    (niu_mb3_prebuf_header_scan_in),
                        .mbi_prebuf_header_scan_out   (niu_mb3_prebuf_header_scan_out),
                        .mbi_prebuf_header_data_out   (niu_mb3_prebuf_header_data_out),

                        .mbi_rx_data_fifo_wdata       (niu_mb3_rx_data_fifo_wdata),
                        .mbi_rx_data_fifo_rd_addr     (niu_mb3_rx_data_fifo_rd_addr),
                        .mbi_rx_data_fifo_wr_addr     (niu_mb3_rx_data_fifo_wr_addr),
                        .mbi_rx_data_fifo_wr_en       (niu_mb3_rx_data_fifo_wr_en),
                        .mbi_rx_data_fifo_rd_en       (niu_mb3_rx_data_fifo_rd_en),
                        .mbi_rx_data_fifo_run         (niu_mb3_rx_data_fifo_run),
                        .mbi_rx_data_fifo_scan_in     (niu_mb3_rx_data_fifo_scan_in),
                        .mbi_rx_data_fifo_scan_out    (niu_mb3_rx_data_fifo_scan_out),
                        .mbi_rx_data_fifo_data_out    (niu_mb3_rx_data_fifo_data_out),
`endif
// xmac interface
		.mac_ipp_req           (1'b0),
		.xmac_ipp_ack          (mac_rxc_ack0),
		.mac_ipp_tag           (mac_rxc_tag0),
		.mac_ipp_data          (mac_rxc_data0),
		.mac_ipp_ctrl          (mac_rxc_ctrl0),
		.mac_ipp_stat          (mac_rxc_stat0),
		.ipp_mac_ack           (),
		.ipp_xmac_req          (rxc_mac_req0),
// ffl interface
		.ffl_ipp_dvalid        (fflp_ipp_dvalid[0]),	
		.ffl_ipp_data          (fflp_ipp_sum[13:0]),
                .ffl_ipp_ready         (fflp_ipp_ready),
                .ipp_ffl_dvalid        (ipp_ffl_dvalid0),
                .ipp_ffl_data          (ipp_ffl_data0),
                .ipp_ffl_mac_default   (ipp_ffl_mac_default0[11:0]),
// dmc interface
		.dmc_ipp_dat_req       (dmc_ipp_dat_req0),
		.ipp_dmc_dat_ack       (ipp_dmc_dat_ack0),
		.ipp_dmc_data          (ipp_dmc_data0[129:0]),
		.ipp_dmc_ful_pkt       (ipp_dmc_ful_pkt0),
		.ipp_dmc_dat_err       (ipp_dmc_dat_err0),
// ffl_arb interface
		.ipp_ffl_req           (ipp_ffl_req0),
		.ffl_arb_ack           (ffl_arb_ack0),
// cpu interface
             	.ipp_pio_sel           (sel_ipp0),
		.ipp_pio_rd            (pio_rd),
		.ipp_pio_wdata         (pio_wdata[31:0]),
		.ipp_pio_ack           (ipp_ack0),
		.ipp_pio_rdata         (ipp_rdata0[31:0]),
		.ipp_pio_err           (ipp_pio_err0),
		.ipp_pio_intr          (ipp_intr0),
		.ipp_debug             (ipp_debug0[31:0]),
		.debug_out_ena         (debug_out_ena0),
// global
		.xmac_mode             (1'b1),
		.port_id               (2'b00),
		.clk                   (clk),
		.reset                 (reset_ipp)
		);			// end of ipp0

// ipp1 module (connected to xmac)
`ifdef NEPTUNE niu_ipp_2ke ipp1(
                .ipp_pio_addr          (pio_addr[13:0]),
`else          niu_ipp_1ke ipp1(
                .ipp_pio_addr          (pio_addr[14:0]),
                        .tcu_aclk                     (tcu_aclk),
                        .tcu_bclk                     (tcu_bclk),
                        .tcu_scan_en                  (tcu_scan_en),
                        .tcu_se_scancollar_in         (tcu_se_scancollar_in),
                        .tcu_se_scancollar_out        (tcu_se_scancollar_out),
                        .tcu_array_wr_inhibit         (tcu_array_wr_inhibit),

                        .hdr_sram_rvalue              (hdr_sram_rvalue_ipp1[6:0]),
                        .hdr_sram_rid                 (hdr_sram_rid_ipp1[2:0]),
                        .hdr_sram_wr_en               (hdr_sram_wr_en_ipp1),
                        .hdr_sram_red_clr             (hdr_sram_red_clr_ipp1),
                        .sram_hdr_read_data           (sram_hdr_read_data_ipp1[6:0]),

                        .iol2clk                      (iol2clk),
                        .l2clk_2x                     (l2clk_2x),

                        .mbi_prebuf_header_wdata      (niu_mb4_prebuf_header_wdata),
                        .mbi_prebuf_header_rd_addr    (niu_mb4_prebuf_header_rd_addr),
                        .mbi_prebuf_header_wr_addr    (niu_mb4_prebuf_header_wr_addr),
                        .mbi_prebuf_header_wr_en      (niu_mb4_prebuf_header_wr_en),
                        .mbi_prebuf_header_rd_en      (niu_mb4_prebuf_header_rd_en),
                        .mbi_prebuf_header_run        (niu_mb4_prebuf_header_run),
                        .mbi_prebuf_header_scan_in    (niu_mb4_prebuf_header_scan_in),
                        .mbi_prebuf_header_scan_out   (niu_mb4_prebuf_header_scan_out),
                        .mbi_prebuf_header_data_out   (niu_mb4_prebuf_header_data_out),

                        .mbi_rx_data_fifo_wdata       (niu_mb4_rx_data_fifo_wdata),
                        .mbi_rx_data_fifo_rd_addr     (niu_mb4_rx_data_fifo_rd_addr),
                        .mbi_rx_data_fifo_wr_addr     (niu_mb4_rx_data_fifo_wr_addr),
                        .mbi_rx_data_fifo_wr_en       (niu_mb4_rx_data_fifo_wr_en),
                        .mbi_rx_data_fifo_rd_en       (niu_mb4_rx_data_fifo_rd_en),
                        .mbi_rx_data_fifo_run         (niu_mb4_rx_data_fifo_run),
                        .mbi_rx_data_fifo_scan_in     (niu_mb4_rx_data_fifo_scan_in),
                        .mbi_rx_data_fifo_scan_out    (niu_mb4_rx_data_fifo_scan_out),
                        .mbi_rx_data_fifo_data_out    (niu_mb4_rx_data_fifo_data_out),
`endif
// xmac interface
                .mac_ipp_req           (1'b0),
                .xmac_ipp_ack          (mac_rxc_ack1),
		.mac_ipp_tag           (mac_rxc_tag1),
                .mac_ipp_data          (mac_rxc_data1),
                .mac_ipp_ctrl          (mac_rxc_ctrl1),
                .mac_ipp_stat          (mac_rxc_stat1),
		.ipp_mac_ack           (),
		.ipp_xmac_req          (rxc_mac_req1),
// ffl interface
		.ffl_ipp_dvalid        (fflp_ipp_dvalid[1]),	
		.ffl_ipp_data          (fflp_ipp_sum[13:0]),
		.ffl_ipp_ready         (fflp_ipp_ready),
		.ipp_ffl_dvalid        (ipp_ffl_dvalid1),
		.ipp_ffl_data          (ipp_ffl_data1),
		.ipp_ffl_mac_default   (ipp_ffl_mac_default1[11:0]),
// dmc interface
                .dmc_ipp_dat_req       (dmc_ipp_dat_req1),
                .ipp_dmc_dat_ack       (ipp_dmc_dat_ack1),
                .ipp_dmc_data          (ipp_dmc_data1[129:0]),
                .ipp_dmc_ful_pkt       (ipp_dmc_ful_pkt1),
                .ipp_dmc_dat_err       (ipp_dmc_dat_err1),
// ffl_arb interface
                .ipp_ffl_req           (ipp_ffl_req1),
                .ffl_arb_ack           (ffl_arb_ack1),
// cpu interface
                .ipp_pio_sel           (sel_ipp1),
                .ipp_pio_rd            (pio_rd),
                .ipp_pio_wdata         (pio_wdata[31:0]),
                .ipp_pio_ack           (ipp_ack1),
                .ipp_pio_rdata         (ipp_rdata1[31:0]),
                .ipp_pio_err           (ipp_pio_err1),
                .ipp_pio_intr          (ipp_intr1),
		.ipp_debug             (ipp_debug1[31:0]),
		.debug_out_ena         (debug_out_ena1),
// global
		.xmac_mode             (1'b1),
                .port_id               (2'b01),
                .clk                   (clk1),
                .reset                 (reset_ipp)
		);			// end of ipp1

`ifdef NEPTUNE
// ipp2 module (connected to mac)
niu_ipp_1ke ipp2(
// mac interface
                .mac_ipp_req           (mac_rxc_req2),
                .xmac_ipp_ack          (1'b0),
                .mac_ipp_tag           (mac_rxc_tag2),
                .mac_ipp_data          (mac_rxc_data2),
                .mac_ipp_ctrl          (mac_rxc_ctrl2),
                .mac_ipp_stat          (mac_rxc_stat2),
                .ipp_mac_ack           (rxc_mac_ack2),
                .ipp_xmac_req          (),
// ffl interface
		.ffl_ipp_dvalid        (fflp_ipp_dvalid[2]),	
		.ffl_ipp_data          (fflp_ipp_sum[13:0]),
                .ffl_ipp_ready         (fflp_ipp_ready),
                .ipp_ffl_dvalid        (ipp_ffl_dvalid2),
                .ipp_ffl_data          (ipp_ffl_data2),
                .ipp_ffl_mac_default   (ipp_ffl_mac_default2[11:0]),
// dmc interface
                .dmc_ipp_dat_req       (dmc_ipp_dat_req2),
                .ipp_dmc_dat_ack       (ipp_dmc_dat_ack2),
                .ipp_dmc_data          (ipp_dmc_data2[129:0]),
                .ipp_dmc_ful_pkt       (ipp_dmc_ful_pkt2),
                .ipp_dmc_dat_err       (ipp_dmc_dat_err2),
// ffl_arb interface
                .ipp_ffl_req           (ipp_ffl_req2),
                .ffl_arb_ack           (ffl_arb_ack2),
// cpu interface
                .ipp_pio_sel           (sel_ipp2),
                .ipp_pio_addr          (pio_addr[13:0]),
                .ipp_pio_rd            (pio_rd),
                .ipp_pio_wdata         (pio_wdata[31:0]),
                .ipp_pio_ack           (ipp_ack2),
                .ipp_pio_rdata         (ipp_rdata2[31:0]),
                .ipp_pio_err           (ipp_pio_err2),
                .ipp_pio_intr          (ipp_intr2),
		.ipp_debug             (ipp_debug2[31:0]),
		.debug_out_ena         (debug_out_ena2),
// global
		.xmac_mode             (1'b0),
                .port_id               (2'b10),
                .clk                   (clk2),
                .reset                 (reset_ipp)
		);			// end of ipp2

// ipp3 module (connected to mac)
niu_ipp_1ke ipp3(
// mac interface
                .mac_ipp_req           (mac_rxc_req3),
                .xmac_ipp_ack          (1'b0),
                .mac_ipp_tag           (mac_rxc_tag3),
                .mac_ipp_data          (mac_rxc_data3),
                .mac_ipp_ctrl          (mac_rxc_ctrl3),
                .mac_ipp_stat          (mac_rxc_stat3),
                .ipp_mac_ack           (rxc_mac_ack3),
                .ipp_xmac_req          (),
// ffl interface
		.ffl_ipp_dvalid        (fflp_ipp_dvalid[3]),	
		.ffl_ipp_data          (fflp_ipp_sum[13:0]),
                .ffl_ipp_ready         (fflp_ipp_ready),
                .ipp_ffl_dvalid        (ipp_ffl_dvalid3),
                .ipp_ffl_data          (ipp_ffl_data3),
                .ipp_ffl_mac_default   (ipp_ffl_mac_default3[11:0]),
// dmc interface
                .dmc_ipp_dat_req       (dmc_ipp_dat_req3),
                .ipp_dmc_dat_ack       (ipp_dmc_dat_ack3),
                .ipp_dmc_data          (ipp_dmc_data3[129:0]),
                .ipp_dmc_ful_pkt       (ipp_dmc_ful_pkt3),
                .ipp_dmc_dat_err       (ipp_dmc_dat_err3),
// ffl_arb interface
                .ipp_ffl_req           (ipp_ffl_req3),
                .ffl_arb_ack           (ffl_arb_ack3),
// cpu interface
                .ipp_pio_sel           (sel_ipp3),
                .ipp_pio_addr          (pio_addr[13:0]),
                .ipp_pio_rd            (pio_rd),
                .ipp_pio_wdata         (pio_wdata[31:0]),
                .ipp_pio_ack           (ipp_ack3),
                .ipp_pio_rdata         (ipp_rdata3[31:0]),
                .ipp_pio_err           (ipp_pio_err3),
                .ipp_pio_intr          (ipp_intr3),
		.ipp_debug             (ipp_debug3[31:0]),
		.debug_out_ena         (debug_out_ena3),
// global
		.xmac_mode             (1'b0),
                .port_id               (2'b11),
                .clk                   (clk3),
                .reset                 (reset_ipp)
		);			// end of ipp3
`endif

/****** glue logic ******/
always @ (posedge clk)
  if (reset_ipp) begin
    pio_ipp_sel    <=  1'h0;
    pio_addr       <= 20'h0;
    pio_rd         <=  1'h0;
    pio_wdata      <= 32'h0;
    ipp_pio_ack    <=  1'h0;
    ipp_pio_rdata  <= 64'h0;
    ipp_pio_err    <=  1'h0;
    ipp_pio_intr   <=  1'h0;
    ipp_debug_port <= 32'h0;
  end
  else begin
    pio_ipp_sel    <= pio_clients_sel_ipp;            // select ipp's
    pio_addr       <= pio_clients_addr[19:0];
    pio_rd         <= pio_clients_rd;                 // rd_wr
    pio_wdata      <= pio_clients_wdata[31:0];
    ipp_pio_ack    <= ipp_ack;
    ipp_pio_rdata  <= ipp_rdata[63:0];
    ipp_pio_err    <= ipp_err;
    ipp_pio_intr   <= ipp_intr;
    ipp_debug_port <= ipp_debug[31:0];
  end

endmodule
