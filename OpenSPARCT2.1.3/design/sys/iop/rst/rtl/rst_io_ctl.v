// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rst_io_ctl.v
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
`define   ASSERT               1'b0            // For active low signal.
`define DEASSERT               1'b1            // For active low signal.

`define INFO   20
                                               //                     (Origin:)
`define IOB_CREG_RESET_GEN    40'h89_0000_0808 //Adr of RESET_GEN    reg (Fire.)
`define IOB_CREG_RESET_SOURCE 40'h89_0000_0818 //Adr of RESET_SOURCE reg (Fire.)
`define IOB_CREG_SSYSRESET    40'h89_0000_0838 //Adr of SSYS_RESET   reg (N1.)
`define IOB_CREG_RESETSTAT    40'h89_0000_0810 //Adr of RSET_STAT    reg (N1.)
`define IOB_CREG_CCU_TIME     40'h89_0000_0860 //Adr of CCU_TIME     reg (N2.)
`define IOB_CREG_LOCK_TIME    40'h89_0000_0870 //Adr of LOCK_TIME    reg (N2.)
`define IOB_CREG_PROP_TIME    40'h89_0000_0880 //Adr of PROP_TIME    reg (N2.)
`define IOB_CREG_NIU_TIME     40'h89_0000_0890 //Adr of NIU_TIME     reg (N2.)
`define IOB_CREG_RESET_FEE    40'h89_0000_0820 //Adr of RESET_FEE    reg (N2.)
//________________________________________________________________

`define RST_FSM_WIDTH           33
`define RST_INIT_STATE          33'h0_0000_0001
`define POR1_LOCK_TIME          33'h0_0000_0002
`define POR1_ARST_TIME          33'h0_0000_0004
`define POR1_SYNC_STABLE        33'h0_0000_0008
`define POR1_ASICFLUSH_STOP_ACK 33'h0_0000_0010
`define POR1_NIU_TIME           33'h0_0000_0020
`define POR1_FLUSH_STOP_ACK     33'h0_0000_0040
`define POR1_BISX_DONE          33'h0_0000_0080
`define POR2_FLUSH_INIT_ACK     33'h0_0000_0100
`define POR2_LOCK_TIME          33'h0_0000_0200
`define POR2_FLUSH_STOP_ACK     33'h0_0000_0400
`define POR2_EFU_DONE           33'h0_0000_0800
`define POR2_ASSERT_RUN         33'h0_0000_1000
`define POR2_UNPARK_THREAD      33'h0_0000_2000
`define WMR1_WMR_GEN            33'h0_0000_4000
`define WMR1_DEASSERT_RUN       33'h0_0000_8000
`define WMR1_FLUSH_INIT_ACK     33'h0_0001_0000
`define WMR1_PRE_PLL1           33'h0_0002_0000
`define WMR1_PRE_PLL2           33'h0_0004_0000
`define WMR1_CCU_PLL            33'h0_0008_0000
`define WMR1_LOCK_TIME          33'h0_0010_0000
`define WMR1_ARST_TIME          33'h0_0020_0000
`define WMR1_PROP_TIME          33'h0_0040_0000
`define WMR1_SYNC_STABLE        33'h0_0080_0000
`define WMR1_FLUSH_STOP_ACK     33'h0_0100_0000
`define WMR1_BISX_DONE          33'h0_0200_0000
`define WMR2_FLUSH_INIT_ACK     33'h0_0400_0000
`define WMR2_PROP_TIME          33'h0_0800_0000
`define WMR2_FLUSH_STOP_ACK     33'h0_1000_0000
`define WMR2_NIU_TIME           33'h1_0000_0000
`define WMR2_ASSERT_RUN         33'h0_2000_0000
`define WMR2_UNPARK_THREAD      33'h0_4000_0000
`define RST_ARBITER             33'h0_8000_0000

`define XIR_IDLE                 2'h1
`define XIR_DONE                 2'h2

`define DMU_IDLE                 3'h1
`define DMU_TIME1                3'h2
`define DMU_TIME2                3'h4

`define NIU_IDLE                 2'h1
`define NIU_TIME                 2'h2
//________________________________________________________________

// Already taken addresses, in address order:
// sort -t "'" -k 2 /home/jl148824/project/NCU/include/iop.h:

//`define IOB_CREG_INTMAN            32'h00000000
//`define IOB_CREG_INTSTAT           32'h00000000
//`define IOB_CREG_INTCTL            32'h00000400
//`define IOB_CREG_MDATA0            32'h00000400
//`define IOB_CREG_MDATA1            32'h00000500
//`define IOB_CREG_MDATA0_ALIAS      32'h00000600
//`define IOB_CREG_MDATA1_ALIAS      32'h00000700
//`define IOB_CREG_INTVECDISP        32'h00000800
//                                   32'h00000808 // Adr of RESET_GEN    reg.
// Bill Bryg removed the CHIP_RESET reg from the Niagara 1 spec Feb 4 '03.
//`define IOB_CREG_RESETSTAT         32'h00000810 // Adr of RSET_STAT    reg.
//`define IOB_CREG_SERNUM            32'h00000820
//`define IOB_CREG_TMSTATCTRL        32'h00000828
//`define IOB_CREG_COREAVAIL         32'h00000830
//`define IOB_CREG_SSYSRESET         32'h00000838 // Adr of SSYS_RESET   reg.
//`define IOB_CREG_FUSESTAT          32'h00000840
//`define IOB_CREG_MARGIN            32'h00000850
//`define IOB_CREG_MBUSY             32'h00000900
//`define IOB_CREG_JINTV             32'h00000a00
//`define IOB_CREG_MBUSY_ALIAS       32'h00000b00
//`define IOB_CREG_DBG_IOBVIS_CTRL   32'h00001000
//`define IOB_CREG_DBG_L2VIS_CTRL    32'h00001800 
//`define IOB_CREG_DBG_L2VIS_MASKA   32'h00001820 
//`define IOB_CREG_DBG_L2VIS_MASKB   32'h00001828 
//`define IOB_CREG_DBG_L2VIS_CMPA    32'h00001830
//`define IOB_CREG_DBG_L2VIS_CMPB    32'h00001838
//`define IOB_CREG_DBG_L2VIS_TRIG    32'h00001840
//`define IOB_CREG_DBG_ENET_CTRL     32'h00002000
//`define IOB_CREG_DBG_ENET_IDLEVAL  32'h00002008
//`define IOB_CREG_DBG_JBUS_CTRL     32'h00002100
//`define IOB_CREG_DBG_JBUS_LO_MASK0 32'h00002140
//`define IOB_CREG_DBG_JBUS_LO_CMP0  32'h00002148
//`define IOB_CREG_DBG_JBUS_LO_CNT0  32'h00002150
//`define IOB_CREG_DBG_JBUS_LO_MASK1 32'h00002160
//`define IOB_CREG_DBG_JBUS_LO_CMP1  32'h00002168
//`define IOB_CREG_DBG_JBUS_LO_CNT1  32'h00002170
//`define IOB_CREG_DBG_JBUS_HI_MASK0 32'h00002180
//`define IOB_CREG_DBG_JBUS_HI_CMP0  32'h00002188
//`define IOB_CREG_DBG_JBUS_HI_CNT0  32'h00002190
//`define IOB_CREG_DBG_JBUS_HI_MASK1 32'h000021a0
//`define IOB_CREG_DBG_JBUS_HI_CMP1  32'h000021a8
//`define IOB_CREG_DBG_JBUS_HI_CNT1  32'h000021b0
//________________________________________________________________

// Verilog define statements for:
//   rst_ucbbusin4_ctl.sv    and:
//   rst_ucbbusout4_ctl.sv:

`define UCB_BUS_WIDTH     4
`define UCB_BUS_WIDTH_M1  3
`define CYC_NUM          32
`define CYC_NUM_M1       31

`define RST_UCB_DATA_WIDTH 16
// Width of:
//   data_in_io            ;// Convert    from io  to cmp to sys.
//   data_in_sys           ;// Convert    from io  to cmp to sys.
//   data_out_sys2         ;// Convert    from sys to cmp.
//   data_out_cmp2         ;// Convert    from sys to cmp to io.
// The following stay 64 bits wide:
//   data_in               ;// Convert    from io  to cmp to sys.
//   data_out              ;// Converted  from        cmp to io.
// If you modify RST_UCB_DATA_WIDTH, adjust the width of x'b0 in
// the following two concatenations:
//   assign         data_out     [                   63:0] =
//   assign data_out_sys[`RST_UCB_DATA_WIDTH-1:0] =

`define RST_TIME_WIDTH 16
// Width of:
//   lock_time_addr    ? {32'b0, lock_time_q   [31:0] }:// LOCK_TIME
//   prop_time_addr    ? {32'b0, prop_time_q   [31:0] }:// PROP_TIME
//   niu_time_addr     ? {32'b0, niu_time_q    [31:0] }:// NIU_TIME
//   msff_ctl_macro lock_time_ff         (width=32,en=1,clr_=1)
//   msff_ctl_macro lock_count_ff        (width=32,en=0,clr_=1)
//   msff_ctl_macro prop_time_ff         (width=32,en=1,clr_=1)
//   msff_ctl_macro prop_count_ff        (width=32,en=0,clr_=1)
//   msff_ctl_macro niu_time_ff          (width=32,en=1,clr_=1)
//   msff_ctl_macro niu_count_ff         (width=32,en=0,clr_=1)
//   msff_ctl_macro dmu_time_ff          (width=32,en=1,clr_=1)
//   msff_ctl_macro dmu_count_ff         (width=32,en=0,clr_=1)



module rst_io_ctl (
  iol2clk, 
  scan_in, 
  scan_out, 
  rst_aclk, 
  rst_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  rst_clk_stop, 
  tcu_rst_scan_mode, 
  rst_rst_por_io0_, 
  rst_rst_wmr_io0_, 
  rd_req_vld, 
  wr_req_vld, 
  req_acpted_cmp2, 
  rd_ack_vld_cmp2, 
  rd_nack_vld_cmp2, 
  addr_in, 
  data_in, 
  thr_id_in, 
  buf_id_in, 
  ack_busy, 
  data_out_cmp2, 
  thr_id_out_cmp2, 
  buf_id_out_cmp2, 
  rst_ncu_unpark_thread_cmp2, 
  rst_ncu_xir_cmp2_, 
  ncu_rst_xir_done, 
  ccu_rst_change, 
  l2t0_rst_fatal_error, 
  l2t1_rst_fatal_error, 
  l2t2_rst_fatal_error, 
  l2t3_rst_fatal_error, 
  l2t4_rst_fatal_error, 
  l2t5_rst_fatal_error, 
  l2t6_rst_fatal_error, 
  l2t7_rst_fatal_error, 
  ncu_rst_fatal_error, 
  tcu_test_protect, 
  rst_mcu_selfrsh_cmp2, 
  rst_rst_pwron_rst_l_io0_, 
  rd_req_vld_io, 
  wr_req_vld_io, 
  req_acpted, 
  rd_ack_vld, 
  rd_nack_vld, 
  addr_in_io, 
  data_in_io, 
  thr_id_in_io, 
  buf_id_in_io, 
  ack_busy_io, 
  data_out, 
  thr_id_out, 
  buf_id_out, 
  rst_ncu_unpark_thread, 
  rst_ncu_xir_, 
  ncu_rst_xir_done_io, 
  ccu_rst_change_io, 
  l2ta_rst_fatal_error_io, 
  ncu_rst_fatal_error_io, 
  tcu_test_protect_io, 
  rst_rst_wmr_io_, 
  rst_mcu_selfrsh);
wire int_aclk;
wire int_bclk;
wire int_scan_en;
wire int_clk_stop;
wire siclk;
wire soclk;
wire rd_req_vld_io_din;
wire rd_req_vld_io_ff_scanin;
wire rd_req_vld_io_ff_scanout;
wire l1clk;
wire wr_req_vld_io_din;
wire wr_req_vld_io_ff_scanin;
wire wr_req_vld_io_ff_scanout;
wire req_acpted_io_ff_scanin;
wire req_acpted_io_ff_scanout;
wire req_acpted_io2_ff_scanin;
wire req_acpted_io2_ff_scanout;
wire rd_ack_vld_io;
wire rd_ack_vld_ff_scanin;
wire rd_ack_vld_ff_scanout;
wire rd_ack_vld_io2_ff_scanin;
wire rd_ack_vld_io2_ff_scanout;
wire rd_nack_vld_io;
wire rd_nack_vld_ff_scanin;
wire rd_nack_vld_ff_scanout;
wire rd_nack_vld_io2_ff_scanin;
wire rd_nack_vld_io2_ff_scanout;
wire addr_in_io_ff_scanin;
wire addr_in_io_ff_scanout;
wire data_in_io_ff_scanin;
wire data_in_io_ff_scanout;
wire thr_id_in_io_ff_scanin;
wire thr_id_in_io_ff_scanout;
wire buf_id_in_io_ff_scanin;
wire buf_id_in_io_ff_scanout;
wire ack_busy_io_ff_scanin;
wire ack_busy_io_ff_scanout;
wire data_out_ff_scanin;
wire data_out_ff_scanout;
wire [15:0] data_out_used;
wire thr_id_out_ff_scanin;
wire thr_id_out_ff_scanout;
wire buf_id_out_ff_scanin;
wire buf_id_out_ff_scanout;
wire rst_rst_pwron_rst_l_io_ff_scanin;
wire rst_rst_pwron_rst_l_io_ff_scanout;
wire rst_rst_pwron_rst_l_io1_;
wire rst_rst_pwron_rst_l_io_;
wire rst_ncu_unpark_thread_io_ff_scanin;
wire rst_ncu_unpark_thread_io_ff_scanout;
wire rst_ncu_unpark_thread_io;
wire rst_ncu_unpark_thread_ff_scanin;
wire rst_ncu_unpark_thread_ff_scanout;
wire rst_ncu_unpark_thread_io2;
wire rst_ncu_unpark_thread_edge;
wire rst_ncu_xir_dout;
wire rst_ncu_xir_io_ff_scanin;
wire rst_ncu_xir_io_ff_scanout;
wire ccu_rst_change_io_ff_scanin;
wire ccu_rst_change_io_ff_scanout;
wire [7:0] l2ta_rst_fatal_error;
wire l2ta_rst_fatal_error_io_ff_scanin;
wire l2ta_rst_fatal_error_io_ff_scanout;
wire ncu_rst_fatal_error_io_ff_scanin;
wire ncu_rst_fatal_error_io_ff_scanout;
wire ncu_rst_xir_done_io_ff_scanin;
wire ncu_rst_xir_done_io_ff_scanout;
wire tcu_test_protect_io_ff_scanin;
wire tcu_test_protect_io_ff_scanout;
wire rst_rst_wmr_io_ff_scanin;
wire rst_rst_wmr_io_ff_scanout;
wire rst_rst_por_io_ff_scanin;
wire rst_rst_por_io_ff_scanout;
wire rst_mcu_selfrsh_io_ff_scanin;
wire rst_mcu_selfrsh_io_ff_scanout;
wire spares_scanin;
wire spares_scanout;

input         iol2clk              ;// From clkgen_rst_cmp.
input         scan_in              ;// rst_fsm_ctl_scanin? rst_cmp_ctl_scanin?
output        scan_out             ;// 
//output        rst_fsm_ctl_scanout  ;
input         rst_aclk             ;// Called rst_ here.
input         rst_bclk             ;// to allow assign stmt.
//put         rst_scan_en          ;// Assign.
input         tcu_scan_en          ;// Don't protect rst_io_ctl from flush,
                                    // so pass tcu_scan_en.
input         tcu_pce_ov           ;// (No assign needed.)
input         rst_clk_stop         ;// Assign.
input         tcu_rst_scan_mode    ;// Indicates scan is active.
//put         mio_rst_pwron_rst_l  ;
input         rst_rst_por_io0_     ;
input         rst_rst_wmr_io0_     ;

input         rd_req_vld            ;// Convert from io  to cmp.
input         wr_req_vld            ;// Convert from io  to cmp.
input         req_acpted_cmp2       ;// Convert from cmp to io.
input         rd_ack_vld_cmp2       ;// Convert from cmp to io.
input         rd_nack_vld_cmp2      ;// Convert from cmp to io.
input[39:0]   addr_in               ;// Convert from io  to cmp to sys.
input[63:0]   data_in               ;// Convert from io  to cmp to sys.
input[ 5:0]   thr_id_in             ;// Convert from io  to cmp to sys.
input[ 1:0]   buf_id_in             ;// Convert from io  to cmp to sys.
input         ack_busy              ;// Convert from io  to cmp to sys.
input[`RST_UCB_DATA_WIDTH-1:0]
              data_out_cmp2         ;// Convert from cmp to io.
input[ 5:0]   thr_id_out_cmp2       ;// Convert from cmp to io.
input[ 1:0]   buf_id_out_cmp2       ;// Convert from cmp to io.
input         rst_ncu_unpark_thread_cmp2
                                    ;// Convert from cmp to io.
input         rst_ncu_xir_cmp2_     ;// Convert from cmp to io.
input         ncu_rst_xir_done      ;// Convert from io  to cmp.
input         ccu_rst_change        ;// Convert from io  to cmp.
input         l2t0_rst_fatal_error  ;// Convert from io  to cmp.
input         l2t1_rst_fatal_error  ;// Convert from io  to cmp.
input         l2t2_rst_fatal_error  ;// Convert from io  to cmp.
input         l2t3_rst_fatal_error  ;// Convert from io  to cmp.
input         l2t4_rst_fatal_error  ;// Convert from io  to cmp.
input         l2t5_rst_fatal_error  ;// Convert from io  to cmp.
input         l2t6_rst_fatal_error  ;// Convert from io  to cmp.
input         l2t7_rst_fatal_error  ;// Convert from io  to cmp.
input         ncu_rst_fatal_error   ;// Convert from io  to cmp.
input         tcu_test_protect      ;// Convert from io  to cmp.
input         rst_mcu_selfrsh_cmp2  ;// Convert from cmp to io.
input         rst_rst_pwron_rst_l_io0_; // Gate outputs before sync reset.

output        rd_req_vld_io         ;// Converting from io  to cmp.
output        wr_req_vld_io         ;// Converting from io  to cmp.
output        req_acpted            ;// Converted  from cmp to io.
output        rd_ack_vld            ;// Converted  from cmp to io.
output        rd_nack_vld           ;// Converted  from cmp to io.
output[39:0]  addr_in_io            ;// Convert    from io  to cmp to sys.
output[`RST_UCB_DATA_WIDTH-1:0]
              data_in_io            ;// Convert    from io  to cmp to sys.
output[ 5:0]  thr_id_in_io          ;// Convert    from io  to cmp to sys.
output[ 1:0]  buf_id_in_io          ;// Convert    from io  to cmp to sys.
output        ack_busy_io           ;// Convert    from io  to cmp to sys.
output[63:0]  data_out              ;// Converted  from cmp to io.
output[ 5:0]  thr_id_out            ;// Converted  from cmp to io.
output[ 1:0]  buf_id_out            ;// Converted  from cmp to io.
output        rst_ncu_unpark_thread ;// Converted  from cmp to io.
output        rst_ncu_xir_          ;// Converted  from cmp to io.
output        ncu_rst_xir_done_io   ;// Convert    from io  to cmp.
output        ccu_rst_change_io     ;// Convert    from io  to cmp.
output[ 7:0]  l2ta_rst_fatal_error_io; // Convert  from io  to cmp.
output        ncu_rst_fatal_error_io;// Convert    from io  to cmp.
output        tcu_test_protect_io   ;// Convert from io  to cmp.
output        rst_rst_wmr_io_       ;// Converted  from cmp to io.
output        rst_mcu_selfrsh       ;// Convert    from cmp to io.
//________________________________________________________________

// Shield rst_io_ctl from flush reset.  We wish control signals
// to maintain their values across reset.  To initially reset
// this block, we reset the blocks that drive its inputs, and
// allow the input values to shift in.

//sign   rst_fsm_ctl_scanout
//                    = (~mio_rst_pwron_rst_l) ? scan_out     : 1'b0;
assign   int_aclk     = (tcu_rst_scan_mode) ? rst_aclk     : 1'b0;
assign   int_bclk     = (tcu_rst_scan_mode) ? rst_bclk     : 1'b0;
assign   int_scan_en  = (tcu_rst_scan_mode) ? tcu_scan_en  : 1'b0;
assign   int_clk_stop = (tcu_rst_scan_mode) ? rst_clk_stop : 1'b0;

assign siclk = int_aclk; // When say wire instead of assign, siclk = z.
                         // Described to Anurag Bhatnagar Feb 23 '05.
assign soclk = int_bclk;
//________________________________________________________________

wire           req_acpted_io              ;//req_acpted_cmp2 retimed to io_clk.

assign         rd_req_vld_io_din     =
               rd_req_vld & ~req_acpted_io;
                                 // Force a rising edge for back-to-back reads.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 rd_req_vld_io_ff         
    (.din     (rd_req_vld_io_din       ),
     .scan_in (rd_req_vld_io_ff_scanin ),
     .scan_out(rd_req_vld_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_         ),
     .l1clk   (l1clk                   ),
     .dout    (rd_req_vld_io           ),
  .siclk(siclk),
  .soclk(soclk));// Cross from io_clk to cmp_clk.

assign         wr_req_vld_io_din     =
               wr_req_vld & ~req_acpted_io;
                                 // Force a rising edge for back-to-back writes.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 wr_req_vld_io_ff         
    (.din     (wr_req_vld_io_din       ),
     .scan_in (wr_req_vld_io_ff_scanin ),
     .scan_out(wr_req_vld_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_         ),
     .l1clk   (l1clk                   ),
     .dout    (wr_req_vld_io           ),
  .siclk(siclk),
  .soclk(soclk));// Cross from io_clk to cmp_clk.
//________________________________________________________________

wire           req_acpted_io2             ;//req_acpted_io delayed one cycle.
assign         req_acpted = req_acpted_io &
                           ~req_acpted_io2;// Rising edge.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 req_acpted_io_ff         
    (.din     (req_acpted_cmp2         ),
     .scan_in (req_acpted_io_ff_scanin ),
     .scan_out(req_acpted_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_         ),
     .l1clk   (l1clk                   ),
     .dout    (req_acpted_io           ),
  .siclk(siclk),
  .soclk(soclk));

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 req_acpted_io2_ff         
    (.din     (req_acpted_io            ),
     .scan_in (req_acpted_io2_ff_scanin ),
     .scan_out(req_acpted_io2_ff_scanout),
     .clr_    (rst_rst_wmr_io_          ),
     .l1clk   (l1clk                    ),
     .dout    (req_acpted_io2           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           rd_ack_vld_io2             ;//rd_ack_vld_io delayed one cycle.
assign         rd_ack_vld = rd_ack_vld_io &
                           ~rd_ack_vld_io2;// Rising edge.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 rd_ack_vld_ff         
    (.din     (rd_ack_vld_cmp2      ),
     .scan_in (rd_ack_vld_ff_scanin ),
     .scan_out(rd_ack_vld_ff_scanout),
     .clr_    (rst_rst_wmr_io_      ),
     .l1clk   (l1clk                ),
     .dout    (rd_ack_vld_io        ),
  .siclk(siclk),
  .soclk(soclk));

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 rd_ack_vld_io2_ff         
    (.din     (rd_ack_vld_io            ),
     .scan_in (rd_ack_vld_io2_ff_scanin ),
     .scan_out(rd_ack_vld_io2_ff_scanout),
     .clr_    (rst_rst_wmr_io_          ),
     .l1clk   (l1clk                    ),
     .dout    (rd_ack_vld_io2           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

wire           rd_nack_vld_io2              ;//rd_nack_vld_io delayed one cycle.
assign         rd_nack_vld = rd_nack_vld_io &
                            ~rd_nack_vld_io2;// Rising edge.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 rd_nack_vld_ff         
    (.din     (rd_nack_vld_cmp2      ),
     .scan_in (rd_nack_vld_ff_scanin ),
     .scan_out(rd_nack_vld_ff_scanout),
     .clr_    (rst_rst_wmr_io_       ),
     .l1clk   (l1clk                 ),
     .dout    (rd_nack_vld_io        ),
  .siclk(siclk),
  .soclk(soclk));

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 rd_nack_vld_io2_ff         
    (.din     (rd_nack_vld_io            ),
     .scan_in (rd_nack_vld_io2_ff_scanin ),
     .scan_out(rd_nack_vld_io2_ff_scanout),
     .clr_    (rst_rst_wmr_io_           ),
     .l1clk   (l1clk                     ),
     .dout    (rd_nack_vld_io2           ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_40 addr_in_io_ff         
    (.din     (addr_in[39:0]        ),
     .scan_in (addr_in_io_ff_scanin ),
     .scan_out(addr_in_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_      ),
     .l1clk   (l1clk                ),
     .dout    (addr_in_io[39:0]     ),
  .siclk(siclk),
  .soclk(soclk));// Get ready to cross from io to cmp.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_16 data_in_io_ff
                   
            // data_in[63:`RST_UCB_DATA_WIDTH] not connected.
    (.din     (data_in   [`RST_UCB_DATA_WIDTH-1:0]),
     .scan_in (data_in_io_ff_scanin ),
     .scan_out(data_in_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_                    ),
     .l1clk   (l1clk                              ),
     .dout    (data_in_io[`RST_UCB_DATA_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));// Get ready to go io-cmp.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_6 thr_id_in_io_ff         
    (.din     (thr_id_in[5:0]         ),
     .scan_in (thr_id_in_io_ff_scanin ),
     .scan_out(thr_id_in_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_        ),
     .l1clk   (l1clk                  ),
     .dout    (thr_id_in_io[5:0]      ),
  .siclk(siclk),
  .soclk(soclk));// Get ready to cross from io to cmp.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_2 buf_id_in_io_ff         
    (.din     (buf_id_in[1:0]         ),
     .scan_in (buf_id_in_io_ff_scanin ),
     .scan_out(buf_id_in_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_        ),
     .l1clk   (l1clk                  ),
     .dout    (buf_id_in_io[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));// Get ready to cross from io to cmp.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 ack_busy_io_ff         
    (.din     (ack_busy              ),
     .scan_in (ack_busy_io_ff_scanin ),
     .scan_out(ack_busy_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_       ),
     .l1clk   (l1clk                 ),
     .dout    (ack_busy_io           ),
  .siclk(siclk),
  .soclk(soclk));// Get ready to cross from io to cmp.
//________________________________________________________________

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_16 data_out_ff
                      
    (.din     (data_out_cmp2[`RST_UCB_DATA_WIDTH-1:0]),
     .scan_in (data_out_ff_scanin ),
     .scan_out(data_out_ff_scanout),
     .clr_    (rst_rst_wmr_io_                       ),
     .l1clk   (l1clk                                 ),
     .dout    (data_out_used[`RST_UCB_DATA_WIDTH-1:0]),
  .siclk(siclk),
  .soclk(soclk));
assign         data_out     [                   63:0] =
              {48'b0,
               data_out_used[`RST_UCB_DATA_WIDTH-1:0]};

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_6 thr_id_out_ff         
    (.din     (thr_id_out_cmp2[ 5:0]),
     .scan_in (thr_id_out_ff_scanin ),
     .scan_out(thr_id_out_ff_scanout),
     .clr_    (rst_rst_wmr_io_      ),
     .l1clk   (l1clk                ),
     .dout    (thr_id_out[ 5:0]     ),
  .siclk(siclk),
  .soclk(soclk));

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_2 buf_id_out_ff         
    (.din     (buf_id_out_cmp2[ 1:0]),
     .scan_in (buf_id_out_ff_scanin ),
     .scan_out(buf_id_out_ff_scanout),
     .clr_    (rst_rst_wmr_io_      ),
     .l1clk   (l1clk                ),
     .dout    (buf_id_out[ 1:0]     ),
  .siclk(siclk),
  .soclk(soclk));
//________________________________________________________________

rst_io_ctl_msff_ctl_macro__clr__0__en_0__width_1 rst_rst_pwron_rst_l_io_ff         
    (.din     (rst_rst_pwron_rst_l_io0_         ),
//   .clr_    (rst_rst_wmr_io_                  ),// Must be able to come out.
     .scan_in (rst_rst_pwron_rst_l_io_ff_scanin ),
     .scan_out(rst_rst_pwron_rst_l_io_ff_scanout),
     .l1clk   (l1clk                            ),
     .dout    (rst_rst_pwron_rst_l_io1_         ),
  .siclk(siclk),
  .soclk(soclk));//Crossed from cmp to io.

assign         rst_rst_pwron_rst_l_io_  =
               rst_rst_pwron_rst_l_io0_ & // 
               rst_rst_pwron_rst_l_io1_ ; // Async assert, io-sync deassert.
//________________________________________________________________

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_ncu_unpark_thread_io_ff         
    (.din     (rst_ncu_unpark_thread_cmp2         ),
     .scan_in (rst_ncu_unpark_thread_io_ff_scanin ),
     .scan_out(rst_ncu_unpark_thread_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_                    ),
     .l1clk   (l1clk                              ),
     .dout    (rst_ncu_unpark_thread_io           ),
  .siclk(siclk),
  .soclk(soclk));//Crossed from cmp to io.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_ncu_unpark_thread_ff         
    (.din     (rst_ncu_unpark_thread_io        ),
     .scan_in (rst_ncu_unpark_thread_ff_scanin ),
     .scan_out(rst_ncu_unpark_thread_ff_scanout),
     .clr_    (rst_rst_wmr_io_                 ),
     .l1clk   (l1clk                           ),
     .dout    (rst_ncu_unpark_thread_io2       ),
  .siclk(siclk),
  .soclk(soclk));//Crossed from cmp to io.

assign         rst_ncu_unpark_thread_edge = rst_ncu_unpark_thread_io &
                                           ~rst_ncu_unpark_thread_io2;
                                           // Rising edge.

               // Flops in this block will be unknown until iol2clk starts,
               // so need to gate this output to ncu.
assign         rst_ncu_unpark_thread =
               rst_ncu_unpark_thread_edge & rst_rst_pwron_rst_l_io_;
//________________________________________________________________

wire           rst_ncu_xir_din   = ~rst_ncu_xir_cmp2_;
wire           rst_ncu_xir_safe  =  rst_ncu_xir_dout       &
                                    rst_rst_pwron_rst_l_io_;
assign         rst_ncu_xir_      = ~rst_ncu_xir_safe;
                                              // Store as active low, so
                                              // resets to deasserted value.
rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_ncu_xir_io_ff         
    (.din     (rst_ncu_xir_din          ),
     .scan_in (rst_ncu_xir_io_ff_scanin ),
     .scan_out(rst_ncu_xir_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_          ),
     .l1clk   (l1clk                    ),
     .dout    (rst_ncu_xir_dout         ),
  .siclk(siclk),
  .soclk(soclk));//Crossed from cmp to io.
//________________________________________________________________

rst_io_ctl_msff_ctl_macro__clr__0__en_0__width_1 ccu_rst_change_io_ff         
    (.din     (ccu_rst_change              ),
//   .clr_    (rst_rst_wmr_io_             ), Review Dec 15 '05.
     .scan_in (ccu_rst_change_io_ff_scanin ),
     .scan_out(ccu_rst_change_io_ff_scanout),
     .l1clk   (l1clk                       ),
     .dout    (ccu_rst_change_io           ),
  .siclk(siclk),
  .soclk(soclk));//Cross from io to cmp.
//________________________________________________________________

assign         l2ta_rst_fatal_error[7:0]          = // l2t all in one array.
              {l2t7_rst_fatal_error               ,
               l2t6_rst_fatal_error               ,
               l2t5_rst_fatal_error               ,
               l2t4_rst_fatal_error               ,
               l2t3_rst_fatal_error               ,
               l2t2_rst_fatal_error               ,
               l2t1_rst_fatal_error               ,
               l2t0_rst_fatal_error               };

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_8 l2ta_rst_fatal_error_io_ff         
    (.din     (l2ta_rst_fatal_error[7:0]         ),
     .scan_in (l2ta_rst_fatal_error_io_ff_scanin ),
     .scan_out(l2ta_rst_fatal_error_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_                   ),
     .l1clk   (l1clk                             ),
     .dout    (l2ta_rst_fatal_error_io[7:0]      ),
  .siclk(siclk),
  .soclk(soclk));//Crossing io->cmp.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 ncu_rst_fatal_error_io_ff         
    (.din     (ncu_rst_fatal_error              ),
     .scan_in (ncu_rst_fatal_error_io_ff_scanin ),
     .scan_out(ncu_rst_fatal_error_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_                  ),
     .l1clk   (l1clk                            ),
     .dout    (ncu_rst_fatal_error_io           ),
  .siclk(siclk),
  .soclk(soclk));//Crossing io->cmp.
//________________________________________________________________

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 ncu_rst_xir_done_io_ff         
    (.din     (ncu_rst_xir_done              ),
     .scan_in (ncu_rst_xir_done_io_ff_scanin ),
     .scan_out(ncu_rst_xir_done_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_               ),
     .l1clk   (l1clk                         ),
     .dout    (ncu_rst_xir_done_io           ),
  .siclk(siclk),
  .soclk(soclk));//Crossing cmp->io.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 tcu_test_protect_io_ff         
    (.din     (tcu_test_protect              ),
     .scan_in (tcu_test_protect_io_ff_scanin ),
     .scan_out(tcu_test_protect_io_ff_scanout),
     .clr_    (rst_rst_wmr_io_               ),
     .l1clk   (l1clk                         ),
     .dout    (tcu_test_protect_io           ),
  .siclk(siclk),
  .soclk(soclk));//Crossing cmp->io.
//________________________________________________________________

rst_io_ctl_msff_ctl_macro__clr__0__en_0__width_1 rst_rst_wmr_io_ff         
    (.din     (rst_rst_wmr_io0_         ),
//   .clr_    (rst_rst_wmr_io_          ), Review Oct 16 '05.
     .scan_in (rst_rst_wmr_io_ff_scanin ),
     .scan_out(rst_rst_wmr_io_ff_scanout),
     .l1clk   (l1clk                    ),
     .dout    (rst_rst_wmr_io_          ),
  .siclk(siclk),
  .soclk(soclk));//Crossed from cmp to io.

wire           rst_rst_por_io_;
rst_io_ctl_msff_ctl_macro__clr__0__en_0__width_1 rst_rst_por_io_ff         
    (.din     (rst_rst_por_io0_         ),
//   .clr_    (rst_rst_por_io_          ), Review Oct 16 '05.
     .scan_in (rst_rst_por_io_ff_scanin ),
     .scan_out(rst_rst_por_io_ff_scanout),
     .l1clk   (l1clk                    ),
     .dout    (rst_rst_por_io_          ),
  .siclk(siclk),
  .soclk(soclk));//Crossed from cmp to io.

rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 rst_mcu_selfrsh_io_ff         
    (.din     (rst_mcu_selfrsh_cmp2         ),
     .scan_in (rst_mcu_selfrsh_io_ff_scanin ),
     .scan_out(rst_mcu_selfrsh_io_ff_scanout),
     .clr_    (rst_rst_por_io_              ),
     .l1clk   (l1clk                        ),
     .dout    (rst_mcu_selfrsh              ),
  .siclk(siclk),
  .soclk(soclk));//Crossed from cmp to io.
//________________________________________________________________

rst_io_ctl_l1clkhdr_ctl_macro clkgen (
   .l2clk  (iol2clk     ),
   .l1en   (1'b1        ),
   .pce_ov (tcu_pce_ov  ), // (No assign needed.)
   .stop   (int_clk_stop), // Qualified by assign stmt.
   .se     (int_scan_en ), // Qualified by assign stmt.
   .l1clk  (l1clk       ));

// grep "Number of cells:" rst_*_l/*/scf/dc/rpt/syn_area.rpt
//                               Number of cells/450 = spare gate macros
// rst_io_l/rst_io_ctl/scf/dc/rpt/syn_area.rpt:          Num:  21 /450=1

rst_io_ctl_spare_ctl_macro__num_1 spares    (
        .scan_in (spares_scanin ),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)         );
//________________________________________________________________

// fixscan start:
assign rd_req_vld_io_ff_scanin   = scan_in                  ;
assign wr_req_vld_io_ff_scanin   = rd_req_vld_io_ff_scanout ;
assign req_acpted_io_ff_scanin   = wr_req_vld_io_ff_scanout ;
assign req_acpted_io2_ff_scanin  = req_acpted_io_ff_scanout ;
assign rd_ack_vld_ff_scanin      = req_acpted_io2_ff_scanout;
assign rd_ack_vld_io2_ff_scanin  = rd_ack_vld_ff_scanout    ;
assign rd_nack_vld_ff_scanin     = rd_ack_vld_io2_ff_scanout;
assign rd_nack_vld_io2_ff_scanin = rd_nack_vld_ff_scanout   ;
assign addr_in_io_ff_scanin      = rd_nack_vld_io2_ff_scanout;
assign data_in_io_ff_scanin      = addr_in_io_ff_scanout    ;
assign thr_id_in_io_ff_scanin    = data_in_io_ff_scanout    ;
assign buf_id_in_io_ff_scanin    = thr_id_in_io_ff_scanout  ;
assign ack_busy_io_ff_scanin     = buf_id_in_io_ff_scanout  ;
assign data_out_ff_scanin        = ack_busy_io_ff_scanout   ;
assign thr_id_out_ff_scanin      = data_out_ff_scanout      ;
assign buf_id_out_ff_scanin      = thr_id_out_ff_scanout    ;
assign rst_rst_pwron_rst_l_io_ff_scanin = buf_id_out_ff_scanout    ;
assign rst_ncu_unpark_thread_io_ff_scanin = rst_rst_pwron_rst_l_io_ff_scanout;
assign rst_ncu_unpark_thread_ff_scanin = rst_ncu_unpark_thread_io_ff_scanout;
assign rst_ncu_xir_io_ff_scanin  = rst_ncu_unpark_thread_ff_scanout;
assign ccu_rst_change_io_ff_scanin = rst_ncu_xir_io_ff_scanout;
assign l2ta_rst_fatal_error_io_ff_scanin = ccu_rst_change_io_ff_scanout;
assign ncu_rst_fatal_error_io_ff_scanin = l2ta_rst_fatal_error_io_ff_scanout;
assign ncu_rst_xir_done_io_ff_scanin = ncu_rst_fatal_error_io_ff_scanout;
assign tcu_test_protect_io_ff_scanin = ncu_rst_xir_done_io_ff_scanout;
assign rst_rst_wmr_io_ff_scanin  = tcu_test_protect_io_ff_scanout;
assign rst_rst_por_io_ff_scanin  = rst_rst_wmr_io_ff_scanout;
assign rst_mcu_selfrsh_io_ff_scanin = rst_rst_por_io_ff_scanout;
assign spares_scanin             = rst_mcu_selfrsh_io_ff_scanout;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule // rst_io_ctl






// any PARAMS parms go into naming of macro

module rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_1 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{(~clr_)}};






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

module rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_40 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [39:0] fdin;
wire [38:0] so;

  input [39:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = din[39:0] & ~{40{(~clr_)}};






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

module rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_16 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0] & ~{16{(~clr_)}};






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

module rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_6 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0] & ~{6{(~clr_)}};






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

module rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_2 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0] & ~{2{(~clr_)}};






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













// any PARAMS parms go into naming of macro

module rst_io_ctl_msff_ctl_macro__clr__0__en_0__width_1 (
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

module rst_io_ctl_msff_ctl_macro__clr__1__en_0__width_8 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0] & ~{8{(~clr_)}};






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

module rst_io_ctl_l1clkhdr_ctl_macro (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module rst_io_ctl_spare_ctl_macro__num_1 (
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
assign scan_out = so_0;



endmodule

