// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_ucb_ctl.v
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
`define CNT_ADDR_HI 14
`define CNT_ADDR_LO 12
`define IAB_ADDR_HI 11
`define IAB_ADDR_LO 9
`define DAB_ADDR_HI 8
`define DAB_ADDR_LO 6
`define EXT_ADDR_HI 5
`define EXT_ADDR_LO 3
`define AE_ADDR_HI 2
`define AE_ADDR_LO 0

//debug event codes
`define WATCH_POINT 2'b00  
`define HARD_STOP 2'b01
`define SOFT_STOP 2'b10
`define START_COUNT 2'b11

//debug event status bit location
`define CNT 4
`define IAB 3
`define DAB 2
`define EXT 1
`define AE 0

// UCB defines, copied from Niagara iop/include/sys.h or iop.h
`define UCB_BUF_HI            11        // (2) buffer ID
`define UCB_BUF_LO            10
`define UCB_THR_HI             9        // (6) cpu/thread ID
`define UCB_THR_LO             4
`define UCB_DATA_HI          127        // (64) data
`define UCB_DATA_LO           64
`define UCB_PKT_HI             3        // (4) packet type
`define UCB_PKT_LO             0
`define UCB_READ_ACK         4'b0001
`define UCB_READ_REQ         4'b0100    // req types
`define UCB_WRITE_ACK        4'b0010
`define UCB_WRITE_REQ        4'b0101
`define UCB_SIZE_HI           14        // (3) request size
`define UCB_SIZE_LO           12
`define UCB_BID_TAP          2'b01
`define UCB_ADDR_HI           54        // (40) bit address
`define UCB_ADDR_LO           15
`define PCX_SZ_8B    3'b011  // encoding for 8B access

// MBIST Defines
`define NUM_TOTAL_MBIST_M1			47
`define NUM_TOTAL_MBIST				48

`define NUM_TOTAL_LBIST				8
`define NUM_TOTAL_LBIST_M1			7

`define MBIST_IDLE       4'd0
`define POR_CLR_DF       4'd1
`define POR_START        4'd2
`define POR_CLR_START    4'd3
`define POR_END_WAIT     4'd4
`define WMR_DUMMY        4'd5
`define WMR_CLR_DF       4'd6
`define WMR_START        4'd7
`define WMR_CLR_START    4'd8
`define WMR_END_WAIT     4'd9
`define BISX_CLR_DF      4'd10
`define BISX_START       4'd11
`define BISX_CLR_START   4'd12


  
module tcu_ucb_ctl (
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_int_aclk, 
  tcu_int_bclk, 
  tcu_int_se, 
  tcu_int_ce_ucb, 
  tcu_pce_ov, 
  tcu_tp_sync_2io, 
  ac_test_mode, 
  tcu_test_protect, 
  jtag_creg_addr, 
  jtag_creg_data, 
  jtag_creg_rd_en, 
  jtag_creg_wr_en, 
  jtag_creg_addr_en, 
  jtag_creg_data_en, 
  ucb_data_out, 
  ucb_jtag_data_rdy, 
  jtag_ucb_data_ack, 
  csr_ucb_data, 
  ucb_csr_wr, 
  ucb_csr_addr, 
  dbg_creg_access, 
  dbg_creg_addr, 
  dbg_creg_data, 
  dbg_creg_wr_en, 
  dbg_creg_addr_en, 
  dbg_creg_data_en, 
  tcu_ncu_stall, 
  ncu_tcu_vld, 
  ncu_tcu_data, 
  tcu_ncu_vld, 
  tcu_ncu_data, 
  ncu_tcu_stall);
wire tcu_int_ce;
wire l1en;
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire jtag_creg_addr_en_sync;
wire [39:0] creg_addr;
wire creg_addr_reg_scanin;
wire creg_addr_reg_scanout;
wire jtag_creg_data_en_sync;
wire [63:0] creg_data;
wire creg_data_reg_scanin;
wire creg_data_reg_scanout;
wire ucbbusout8_ctl_scanin;
wire ucbbusout8_ctl_scanout;
wire [127:0] ucbout_buf;
wire [15:0] ucbout_vec;
wire ucbout_outdata_wr;
wire ncu_tcu_stall_mission;
wire ucbout_outdata_busy;
wire jtag_rd_en_sync_d1_reg_scanin;
wire jtag_rd_en_sync_d1_reg_scanout;
wire jtag_rd_en_sync;
wire jtag_rd_en_sync_d1;
wire jtag_rd_req_din;
wire req_acpt;
wire jtag_rd_req;
wire jtag_rd_req_reg_scanin;
wire jtag_rd_req_reg_scanout;
wire wr_en_sync_d1_din;
wire jtag_creg_wr_en_sync;
wire wr_en_sync_d1_reg_scanin;
wire wr_en_sync_d1_reg_scanout;
wire wr_en_sync_d1;
wire wr_req_din;
wire wr_req;
wire wr_req_reg_scanin;
wire wr_req_reg_scanout;
wire jtag_rd_pend_din;
wire ncu_rd_ack;
wire jtag_rd_pend;
wire jtag_rd_pend_reg_scanin;
wire jtag_rd_pend_reg_scanout;
wire ucbout_rd_pulse;
wire csr_ack_req;
wire ucbout_wr_pulse;
wire ucbout_ack_pulse;
wire ack_acpt;
wire ncu_rd_req_d2;
wire [3:0] ucbout_packet_type;
wire [63:0] ucbout_data;
wire [39:0] ucbout_addr;
wire [2:0] ucbout_size;
wire [1:0] ucbout_buf_id;
wire [1:0] csr_buf_id;
wire [5:0] ucbout_thr_id;
wire [5:0] csr_thr_id;
wire ncu_tcu_vld_mission;
wire test_protect_reg_scanin;
wire test_protect_reg_scanout;
wire tcu_tp_io;
wire ucbbusin8_ctl_scanin;
wire ucbbusin8_ctl_scanout;
wire ucbin_buf_vld;
wire [127:0] ucbin_buf;
wire [3:0] ucbin_request;
wire [39:0] ucbin_address;
wire [63:0] ucbin_data;
wire ucbin_sel_tcu;
wire ncu_wr_req;
wire ncu_rd_req;
wire ucb_csr_wr_reg_scanin;
wire ucb_csr_wr_reg_scanout;
wire ucb_csr_addr_reg_scanin;
wire ucb_csr_addr_reg_scanout;
wire ucb_jtag_data_rdy_din;
wire jtag_ucb_data_ack_sync;
wire ucb_jtag_data_rdy_reg_scanin;
wire ucb_jtag_data_rdy_reg_scanout;
wire ucb_data_out_en;
wire [63:0] ucb_data_out_din;
wire ucb_data_out_reg_scanin;
wire ucb_data_out_reg_scanout;
wire ncu_rd_req_d_reg_scanin;
wire ncu_rd_req_d_reg_scanout;
wire ncu_rd_req_d;
wire ncu_rd_req_d2_reg_scanin;
wire ncu_rd_req_d2_reg_scanout;
wire csr_thr_id_en;
wire [5:0] csr_thr_id_din;
wire csr_thr_id_reg_scanin;
wire csr_thr_id_reg_scanout;
wire csr_buf_id_en;
wire [1:0] csr_buf_id_din;
wire csr_buf_id_reg_scanin;
wire csr_buf_id_reg_scanout;
wire csr_ack_req_din;
wire csr_ack_req_reg_scanin;
wire csr_ack_req_reg_scanout;
wire jtag_rd_req_sync_reg_scanin;
wire jtag_rd_req_sync_reg_scanout;
wire jtag_creg_wr_en_sync_reg_scanin;
wire jtag_creg_wr_en_sync_reg_scanout;
wire jtag_creg_addr_en_sync_reg_scanin;
wire jtag_creg_addr_en_sync_reg_scanout;
wire jtag_creg_data_en_sync_reg_scanin;
wire jtag_creg_data_en_sync_reg_scanout;
wire jtag_ucb_data_ack_sync_reg_scanin;
wire jtag_ucb_data_ack_sync_reg_scanout;
wire spare_scanin;
wire spare_scanout;


//global
input         iol2clk;
input         scan_in;
output        scan_out;
input         tcu_int_aclk;
input         tcu_int_bclk;
input         tcu_int_se;
input         tcu_int_ce_ucb; // ECO A
input         tcu_pce_ov;

// Protection during various test modes
input         tcu_tp_sync_2io;
input         ac_test_mode; 
output        tcu_test_protect;

//JTAG interface
input [39:0]  jtag_creg_addr;
input [63:0]  jtag_creg_data;
input         jtag_creg_rd_en;
input         jtag_creg_wr_en;
input         jtag_creg_addr_en;
input         jtag_creg_data_en;
output [63:0] ucb_data_out;
output        ucb_jtag_data_rdy;
input         jtag_ucb_data_ack;

// mbist_ctl Interface
input [63:0]  csr_ucb_data;
output        ucb_csr_wr;
output [5:0]  ucb_csr_addr;

// Debug Soft Stop Interface
input         dbg_creg_access;
input [39:0]  dbg_creg_addr;
input [63:0]  dbg_creg_data; // for Parking Cores
input         dbg_creg_wr_en;
input         dbg_creg_addr_en;
input         dbg_creg_data_en;

//NCU interface
output        tcu_ncu_stall;
input         ncu_tcu_vld;
input [7:0]   ncu_tcu_data;

output        tcu_ncu_vld;
output [7:0]  tcu_ncu_data;
input         ncu_tcu_stall;

// Scan reassigns
assign tcu_int_ce = tcu_int_ce_ucb; // ECO A
assign l1en   = tcu_int_ce; //1'b1; // this is "ce" or "pce"   
assign pce_ov = tcu_pce_ov; //1'b1;
assign stop   = 1'b0;
assign se     = tcu_int_se;
assign siclk  = tcu_int_aclk;
assign soclk  = tcu_int_bclk;

//============================================================
// L1 header for main UCB function
//============================================================
tcu_ucb_ctl_l1clkhdr_ctl_macro ucb_io_clkgen (
   .l2clk ( iol2clk ),
   .l1clk ( l1clk   ),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//============================================================
// CREG Address Register
//============================================================
// jbus_clk (assume tck period always longer than jbus_clk - no handshake needed)
// Only addr_en is synchronized, and the addr bus will be stable by then
reg [39:0] creg_addr_din;

always @(dbg_creg_access or dbg_creg_addr_en or dbg_creg_addr[39:0] or
         jtag_creg_addr_en_sync or jtag_creg_addr[39:0] or creg_addr[39:0])
begin
   if (dbg_creg_access)
      if (dbg_creg_addr_en)
         creg_addr_din[39:0] = dbg_creg_addr[39:0];
      else
         creg_addr_din[39:0] = creg_addr[39:0];
   else
      if (jtag_creg_addr_en_sync)
         creg_addr_din[39:0] = jtag_creg_addr[39:0];
      else
         creg_addr_din[39:0] = creg_addr[39:0];
end

tcu_ucb_ctl_msff_ctl_macro__width_40 creg_addr_reg  (
   .scan_in  ( creg_addr_reg_scanin  ),
   .scan_out ( creg_addr_reg_scanout ),
   .l1clk    ( l1clk                 ),
   .din      ( creg_addr_din[39:0]   ),
   .dout     ( creg_addr[39:0]       ),
  .siclk(siclk),
  .soclk(soclk));

//============================================================
// CREG Data Register
//============================================================
// jbus_clk (assume tck period always longer than jbus_clk - no handshake needed)
// Only data_en is synchronized, and the data bus will be stable by then
reg [63:0] creg_data_din;

always @(dbg_creg_access or dbg_creg_data_en or dbg_creg_data[63:0] or
         jtag_creg_data_en_sync or jtag_creg_data[63:0] or creg_data[63:0])
begin
   if (dbg_creg_access)
      if (dbg_creg_data_en)
         creg_data_din[63:0] = dbg_creg_data[63:0];
      else
         creg_data_din[63:0] = creg_data[63:0];
   else
      if (jtag_creg_data_en_sync)
         creg_data_din[63:0] = jtag_creg_data[63:0];
      else
         creg_data_din[63:0] = creg_data[63:0];
end

tcu_ucb_ctl_msff_ctl_macro__width_64 creg_data_reg  (
   .scan_in  ( creg_data_reg_scanin  ),
   .scan_out ( creg_data_reg_scanout ),
   .l1clk    ( l1clk                 ),
   .din      ( creg_data_din[63:0]   ),
   .dout     ( creg_data[63:0]       ),
  .siclk(siclk),
  .soclk(soclk));


//============================================================
// Outbound UCB - Going From TCU to NCU
//============================================================
tcu_ucbbusout8_ctl ucbbusout8_ctl (
   // scan, clocks
   .scan_in          ( ucbbusout8_ctl_scanin  ),
   .scan_out         ( ucbbusout8_ctl_scanout ),
   .iol2clk          ( iol2clk                ),
   .tcu_pce_ov       ( pce_ov                 ),
   .tcu_clk_stop     ( stop                   ),
   .tcu_siclk_in     ( tcu_int_aclk           ),
   .tcu_soclk_in     ( tcu_int_bclk           ),
   .tcu_scan_en      ( se                     ),
   // inputs 
   .outdata_buf_in   ( ucbout_buf[127:0]      ),
   .outdata_vec_in   ( ucbout_vec[15:0]       ),
   .outdata_buf_wr   ( ucbout_outdata_wr      ),
   .stall            ( ncu_tcu_stall_mission  ),
   //outputs
   .vld              ( tcu_ncu_vld            ),
   .data             ( tcu_ncu_data           ),
   .outdata_buf_busy ( ucbout_outdata_busy    ),
  .tcu_int_ce(tcu_int_ce));

//********************************************************************
// jtag request
//********************************************************************

// CREG Read Enable
// jtag_creg_rd_en input is synchronized then used
tcu_ucb_ctl_msff_ctl_macro__width_1 jtag_rd_en_sync_d1_reg  (
   .scan_in  ( jtag_rd_en_sync_d1_reg_scanin  ),
   .scan_out ( jtag_rd_en_sync_d1_reg_scanout ),
   .l1clk    ( l1clk                       ),
   .din      ( jtag_rd_en_sync        ),
   .dout     ( jtag_rd_en_sync_d1     ),
  .siclk(siclk),
  .soclk(soclk)); 

assign jtag_rd_req_din = (jtag_rd_en_sync && !jtag_rd_en_sync_d1) ? 1'b1 :
                         req_acpt                                 ? 1'b0 :
                                                                    jtag_rd_req;

tcu_ucb_ctl_msff_ctl_macro__width_1 jtag_rd_req_reg  (
   .scan_in  ( jtag_rd_req_reg_scanin   ),
   .scan_out ( jtag_rd_req_reg_scanout  ),
   .l1clk    ( l1clk                    ),
   .din      ( jtag_rd_req_din          ),
   .dout     ( jtag_rd_req              ),
  .siclk(siclk),
  .soclk(soclk));

// CREG Write Enable
// jtag_creg_wr_en input is synchronized then used
assign wr_en_sync_d1_din = dbg_creg_access ? dbg_creg_wr_en : jtag_creg_wr_en_sync;

tcu_ucb_ctl_msff_ctl_macro__width_1 wr_en_sync_d1_reg  (
   .scan_in  ( wr_en_sync_d1_reg_scanin  ),
   .scan_out ( wr_en_sync_d1_reg_scanout ),
   .l1clk    ( l1clk                     ),
   .din      ( wr_en_sync_d1_din         ),
   .dout     ( wr_en_sync_d1             ),
  .siclk(siclk),
  .soclk(soclk)); 

assign wr_req_din = (wr_en_sync_d1_din && !wr_en_sync_d1) ? 1'b1 :
                    req_acpt                              ? 1'b0 :
                                                            wr_req;

tcu_ucb_ctl_msff_ctl_macro__width_1 wr_req_reg  (
   .scan_in  ( wr_req_reg_scanin  ),
   .scan_out ( wr_req_reg_scanout ),
   .l1clk    ( l1clk              ),
   .din      ( wr_req_din         ),
   .dout     ( wr_req             ),
  .siclk(siclk),
  .soclk(soclk));

// CREG Read Pending
assign jtag_rd_pend_din = (jtag_rd_req && req_acpt) ? 1'b1 :
                          ncu_rd_ack                ? 1'b0 :
                          jtag_rd_pend;

tcu_ucb_ctl_msff_ctl_macro__width_1 jtag_rd_pend_reg 
(
   .scan_in  ( jtag_rd_pend_reg_scanin  ),
   .scan_out ( jtag_rd_pend_reg_scanout ),
   .l1clk    ( l1clk                    ),
   .din      ( jtag_rd_pend_din         ),
   .dout     ( jtag_rd_pend             ),
  .siclk(siclk),
  .soclk(soclk));

// generate read or write valid pulse if busy signal unasserted and not servicing iob read request

assign ucbout_rd_pulse  = ~ucbout_outdata_busy &
                            ~csr_ack_req &
                            jtag_rd_req;

assign ucbout_wr_pulse = ~ucbout_outdata_busy &
                            ~csr_ack_req &
                            wr_req;

assign ucbout_ack_pulse = ~ucbout_outdata_busy & csr_ack_req;

// accept request - assume never running jtag and ramtest mode concurrently
assign req_acpt = ucbout_rd_pulse | ucbout_wr_pulse;
assign ack_acpt = ucbout_ack_pulse;

// issue request
assign ucbout_outdata_wr = ucbout_rd_pulse || ucbout_wr_pulse || ncu_rd_req_d2;

assign ucbout_vec[15:0] = ucbout_outdata_wr ? 16'hffff : 16'h00ff;

assign ucbout_packet_type[3:0] = ncu_rd_req_d2 ?
                                     `UCB_READ_ACK :
                                      ucbout_wr_pulse ?
                                         `UCB_WRITE_REQ :
                                         `UCB_READ_REQ;

assign ucbout_data[63:0]  = ncu_rd_req_d2  ? csr_ucb_data    : creg_data;
assign ucbout_addr[39:0]  = creg_addr;
assign ucbout_size[2:0]   = `PCX_SZ_8B; 
assign ucbout_buf_id[1:0] = ncu_rd_req_d2 ? csr_buf_id[1:0] : `UCB_BID_TAP;
assign ucbout_thr_id[5:0] = ncu_rd_req_d2 ? csr_thr_id[5:0] : 6'b000000;

assign ucbout_buf[127:0] = {
                            ucbout_data[63:0], 
                            //9'h0, 
                            5'h0,
                            ucbout_packet_type[0],
                            ucbout_packet_type[0],
                            1'b1,
                            ucbout_packet_type[0],
                            ucbout_addr[39:0],
                            ucbout_size[2:0],
                            ucbout_buf_id[1:0],
                            ucbout_thr_id[5:0],
                            ucbout_packet_type[3:0]};

assign   ncu_tcu_vld_mission = ncu_tcu_vld & ~tcu_tp_sync_2io; // protected during mbist, etc.
assign   ncu_tcu_stall_mission = ncu_tcu_stall & ~tcu_tp_sync_2io; // protected during mbist, etc.
// if test_protect is set via jtag; intended to block ucb activity if scanning SOC causes
// ucb requests to TCU
tcu_ucb_ctl_msff_ctl_macro__width_1 test_protect_reg 
(
   .scan_in  ( test_protect_reg_scanin  ),
   .scan_out ( test_protect_reg_scanout ),
   .l1clk    ( l1clk                    ),
   .din      ( tcu_tp_sync_2io          ),
   .dout     ( tcu_tp_io                ),
  .siclk(siclk),
  .soclk(soclk));

assign   tcu_test_protect     = ac_test_mode  |  tcu_tp_io;   // protected during mbist, etc.
// Note: even though ac_test_mode comes from cmp domain, it changes only when we enter Transition
//       Test (TT), and so before entering TT we will set test_protect via JTAG so no transition
//       occurs on tcu_test_protect due to ac_test_mode going high

//============================================================
// Inbound UCB - Coming From NCU to TCU
//============================================================
tcu_ucbbusin8_ctl ucbbusin8_ctl
  (
   // scan, clocks
   .scan_in        ( ucbbusin8_ctl_scanin  ),
   .scan_out       ( ucbbusin8_ctl_scanout ),
   .iol2clk        ( iol2clk               ),
   .tcu_pce_ov     ( pce_ov                ),
   .tcu_clk_stop   ( stop                  ),
   .tcu_siclk_in   ( tcu_int_aclk          ),
   .tcu_soclk_in   ( tcu_int_bclk          ),
   .tcu_scan_en    ( se                    ),
   // inputs
   .vld            ( ncu_tcu_vld_mission   ),
   .data           ( ncu_tcu_data          ),
   .stall_a1       ( csr_ack_req           ),
   // outputs
   .stall          ( tcu_ncu_stall         ),
   .indata_buf_vld ( ucbin_buf_vld         ),
   .indata_buf     ( ucbin_buf[127:0]      ),
  .tcu_int_ce(tcu_int_ce));


//========================================
// Incoming Request Decoding
//========================================
assign ucbin_request[3:0]  = ucbin_buf[`UCB_PKT_HI:`UCB_PKT_LO];
assign ucbin_address[39:0] = ucbin_buf[`UCB_ADDR_HI:`UCB_ADDR_LO];
assign ucbin_data          = ucbin_buf[`UCB_DATA_HI:`UCB_DATA_LO];
assign ucbin_sel_tcu       = (ucbin_address[39:32] == 8'h85);

assign ncu_rd_ack  = jtag_rd_pend && ucbin_buf_vld && (ucbin_request == `UCB_READ_ACK);
assign ncu_wr_req  = ucbin_sel_tcu && ucbin_buf_vld && (ucbin_request == `UCB_WRITE_REQ);
assign ncu_rd_req  = ucbin_sel_tcu && ucbin_buf_vld && (ucbin_request == `UCB_READ_REQ);

//================================================================================
// Write from NCU is sent to BOTH mbist_ctl and jtag_ctl
// It will write into specified registers in both modules
//================================================================================
tcu_ucb_ctl_msff_ctl_macro__width_1 ucb_csr_wr_reg  (
   .scan_in  ( ucb_csr_wr_reg_scanin  ),
   .scan_out ( ucb_csr_wr_reg_scanout ),
   .l1clk    ( l1clk                  ),
   .din      ( ncu_wr_req             ),
   .dout     ( ucb_csr_wr             ),
  .siclk(siclk),
  .soclk(soclk));

//================================================================================
// Read/Write Index
// Sent to BOTH mbist_ctl and jtag_ctl
//================================================================================
tcu_ucb_ctl_msff_ctl_macro__en_1__width_6 ucb_csr_addr_reg   ( // replace with SYNCHRONIZER
   .scan_in  ( ucb_csr_addr_reg_scanin  ),
   .scan_out ( ucb_csr_addr_reg_scanout ),
   .l1clk    ( l1clk                    ),
   .en       ( ucbin_buf_vld            ),
   .din      ( ucbin_address[8:3]       ),
   .dout     ( ucb_csr_addr[5:0]        ),
  .siclk(siclk),
  .soclk(soclk));

// following need to have ce inputs synchronized before sending data to TCK domain;
// the output flops need to be clocked with TCK

//============================================================
// Handshake Protocol for jbus_clk -> tck domain
// ---------------------------------------------
//   Since the write enable in jbus_clk will go away before the logic at tck
//   is able to flop it and do anything with it. Therefore, at jbus_clk, we execute 
//   a handshake protocol:
//        - writing the rdrtrn_reg register sets the valid bit (jbus_clk)
//          which is cleared when jtag has finished reading it (tck)
//        - similar thing is done for scratch_reg
//============================================================
//============================================================
// Data from UCB to JTAG
// This bus is used by both write request and read ack data
//============================================================
assign ucb_jtag_data_rdy_din = jtag_ucb_data_ack_sync ? 1'b0 :
                               ncu_rd_ack             ? 1'b1 :
                                                        ucb_jtag_data_rdy;

tcu_ucb_ctl_msff_ctl_macro__width_1 ucb_jtag_data_rdy_reg  (
   .scan_in  ( ucb_jtag_data_rdy_reg_scanin  ),
   .scan_out ( ucb_jtag_data_rdy_reg_scanout ),
   .l1clk    ( l1clk                         ),
   .din      ( ucb_jtag_data_rdy_din         ),
   .dout     ( ucb_jtag_data_rdy             ),
  .siclk(siclk),
  .soclk(soclk));


assign ucb_data_out_en = ncu_rd_ack || ncu_wr_req;
assign ucb_data_out_din[63:0] = ucb_data_out_en ? ucbin_data[63:0] : ucb_data_out[63:0];

tcu_ucb_ctl_msff_ctl_macro__width_64 ucb_data_out_reg  (
   .scan_in  ( ucb_data_out_reg_scanin  ),
   .scan_out ( ucb_data_out_reg_scanout ),
   .l1clk    ( l1clk                    ),
   .din      ( ucb_data_out_din[63:0]   ),
   .dout     ( ucb_data_out[63:0]       ),
  .siclk(siclk),
  .soclk(soclk));

//============================================================
// Logic for read return to iob
//============================================================
tcu_ucb_ctl_msff_ctl_macro__width_1 ncu_rd_req_d_reg  (
   .scan_in  ( ncu_rd_req_d_reg_scanin  ),
   .scan_out ( ncu_rd_req_d_reg_scanout ),
   .l1clk    ( l1clk                    ),
   .din      ( ncu_rd_req               ),
   .dout     ( ncu_rd_req_d             ),
  .siclk(siclk),
  .soclk(soclk));

tcu_ucb_ctl_msff_ctl_macro__width_1 ncu_rd_req_d2_reg  (
   .scan_in  ( ncu_rd_req_d2_reg_scanin  ),
   .scan_out ( ncu_rd_req_d2_reg_scanout ),
   .l1clk    ( l1clk                    ),
   .din      ( ncu_rd_req_d             ),
   .dout     ( ncu_rd_req_d2            ),
  .siclk(siclk),
  .soclk(soclk));

assign csr_thr_id_en       = ncu_rd_req;
assign csr_thr_id_din[5:0] = ucbin_buf[`UCB_THR_HI:`UCB_THR_LO];

tcu_ucb_ctl_msff_ctl_macro__en_1__width_6 csr_thr_id_reg   (
   .scan_in  ( csr_thr_id_reg_scanin  ),
   .scan_out ( csr_thr_id_reg_scanout ),
   .l1clk    ( l1clk                  ),
   .en       ( csr_thr_id_en          ),
   .din      ( csr_thr_id_din[5:0]    ),
   .dout     ( csr_thr_id[5:0]        ),
  .siclk(siclk),
  .soclk(soclk));

assign csr_buf_id_en       = ncu_rd_req;
assign csr_buf_id_din[1:0] = ucbin_buf[`UCB_BUF_HI:`UCB_BUF_LO];

tcu_ucb_ctl_msff_ctl_macro__en_1__width_2 csr_buf_id_reg   (
   .scan_in  ( csr_buf_id_reg_scanin  ),
   .scan_out ( csr_buf_id_reg_scanout ),
   .l1clk    ( l1clk                  ),
   .en       ( csr_buf_id_en          ),
   .din      ( csr_buf_id_din[1:0]    ),
   .dout     ( csr_buf_id[1:0]        ),
  .siclk(siclk),
  .soclk(soclk));

assign csr_ack_req_din = ncu_rd_req || (csr_ack_req && !ack_acpt);

tcu_ucb_ctl_msff_ctl_macro__width_1 csr_ack_req_reg  (
   .scan_in  ( csr_ack_req_reg_scanin  ),
   .scan_out ( csr_ack_req_reg_scanout ),
   .l1clk    ( l1clk                   ),
   .din      ( csr_ack_req_din         ),
   .dout     ( csr_ack_req             ),
  .siclk(siclk),
  .soclk(soclk));

//============================================================
// Synchronizers: TCK Domain ==> l1clk (jbus_clk) Domain
//============================================================
cl_sc1_clksyncff_4x jtag_rd_req_sync_reg (
   .si    ( jtag_rd_req_sync_reg_scanin  ),
   .so    ( jtag_rd_req_sync_reg_scanout ),
   .l1clk ( l1clk                        ),
   .d     ( jtag_creg_rd_en              ),
   .q     ( jtag_rd_en_sync              ),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x jtag_creg_wr_en_sync_reg (
   .si    ( jtag_creg_wr_en_sync_reg_scanin  ),
   .so    ( jtag_creg_wr_en_sync_reg_scanout ),
   .l1clk ( l1clk                            ),
   .d     ( jtag_creg_wr_en                  ),
   .q     ( jtag_creg_wr_en_sync             ),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x jtag_creg_addr_en_sync_reg (
   .si    ( jtag_creg_addr_en_sync_reg_scanin  ),
   .so    ( jtag_creg_addr_en_sync_reg_scanout ),
   .l1clk ( l1clk                              ),
   .d     ( jtag_creg_addr_en                  ),
   .q     ( jtag_creg_addr_en_sync             ),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x jtag_creg_data_en_reg (
   .si    ( jtag_creg_data_en_sync_reg_scanin  ),
   .so    ( jtag_creg_data_en_sync_reg_scanout ),
   .l1clk ( l1clk                              ),
   .d     ( jtag_creg_data_en                  ),
   .q     ( jtag_creg_data_en_sync             ),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x jtag_ucb_data_ack_sync_reg (
   .si    ( jtag_ucb_data_ack_sync_reg_scanin   ),
   .so    ( jtag_ucb_data_ack_sync_reg_scanout  ),
   .l1clk ( l1clk                               ),
   .d     ( jtag_ucb_data_ack                   ),
   .q     ( jtag_ucb_data_ack_sync              ),
  .siclk(siclk),
  .soclk(soclk));


tcu_ucb_ctl_spare_ctl_macro__num_6 spare  (
   .l1clk    ( l1clk         ),
   .scan_in  ( spare_scanin  ),
   .scan_out ( spare_scanout ),
  .siclk(siclk),
  .soclk(soclk));


// fixscan start:
assign creg_addr_reg_scanin                   = scan_in;
assign creg_data_reg_scanin                   = creg_addr_reg_scanout;
assign ucbbusout8_ctl_scanin                  = creg_data_reg_scanout;
assign jtag_rd_en_sync_d1_reg_scanin          = ucbbusout8_ctl_scanout;
assign jtag_rd_req_reg_scanin                 = jtag_rd_en_sync_d1_reg_scanout;
assign wr_en_sync_d1_reg_scanin               = jtag_rd_req_reg_scanout;
assign wr_req_reg_scanin                      = wr_en_sync_d1_reg_scanout;
assign jtag_rd_pend_reg_scanin                = wr_req_reg_scanout;
assign test_protect_reg_scanin                = jtag_rd_pend_reg_scanout;
assign ucbbusin8_ctl_scanin                   = test_protect_reg_scanout;
assign ucb_csr_wr_reg_scanin                  = ucbbusin8_ctl_scanout;
assign ucb_csr_addr_reg_scanin                = ucb_csr_wr_reg_scanout;
assign ucb_jtag_data_rdy_reg_scanin           = ucb_csr_addr_reg_scanout;
assign ucb_data_out_reg_scanin                = ucb_jtag_data_rdy_reg_scanout;
assign ncu_rd_req_d_reg_scanin                = ucb_data_out_reg_scanout;
assign ncu_rd_req_d2_reg_scanin               = ncu_rd_req_d_reg_scanout;
assign csr_thr_id_reg_scanin                  = ncu_rd_req_d2_reg_scanout;
assign csr_buf_id_reg_scanin                  = csr_thr_id_reg_scanout;
assign csr_ack_req_reg_scanin                 = csr_buf_id_reg_scanout;
assign jtag_rd_req_sync_reg_scanin            = csr_ack_req_reg_scanout;
assign jtag_creg_wr_en_sync_reg_scanin        = jtag_rd_req_sync_reg_scanout;
assign jtag_creg_addr_en_sync_reg_scanin      = jtag_creg_wr_en_sync_reg_scanout;
assign jtag_creg_data_en_sync_reg_scanin      = jtag_creg_addr_en_sync_reg_scanout;
assign jtag_ucb_data_ack_sync_reg_scanin      = jtag_creg_data_en_sync_reg_scanout;
assign spare_scanin                           = jtag_ucb_data_ack_sync_reg_scanout;
assign scan_out                               = spare_scanout;
// fixscan end:

endmodule






// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule













// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__width_40 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [39:0] fdin;
wire [38:0] so;

  input [39:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = din[39:0];






dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule







// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__width_128 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule






// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__en_1__width_8 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}}) | (dout[7:0] & ~{8{en}});






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__en_1__width_16 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = (din[15:0] & {16{en}}) | (dout[15:0] & ~{16{en}});






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__en_1__width_128 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}}) | (dout[127:0] & ~{128{en}});






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_ucb_ctl_msff_ctl_macro__en_1__width_2 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}}) | (dout[1:0] & ~{2{en}});






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module tcu_ucb_ctl_spare_ctl_macro__num_6 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));
assign scan_out = so_5;



endmodule

