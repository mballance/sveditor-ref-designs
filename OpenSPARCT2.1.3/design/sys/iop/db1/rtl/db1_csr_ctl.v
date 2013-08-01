// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: db1_csr_ctl.v
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
`define IOB_CREG_DBG_CNFG       40'h86_0000_0000
`define IOB_CREG_IO_QSC         40'h86_0000_0008
`define IOB_CREG_SOC_DECR       40'h86_0000_0010


module db1_csr_ctl (
  mcu0_dbg1_crc21, 
  mcu0_dbg1_rd_req_in_0, 
  mcu0_dbg1_rd_req_in_1, 
  mcu0_dbg1_rd_req_out, 
  mcu0_dbg1_wr_req_in_0, 
  mcu0_dbg1_wr_req_in_1, 
  mcu0_dbg1_wr_req_out, 
  mcu0_dbg1_mecc_err, 
  mcu0_dbg1_secc_err, 
  mcu0_dbg1_fbd_err, 
  mcu0_dbg1_err_mode, 
  mcu0_dbg1_err_event, 
  mcu1_dbg1_crc21, 
  mcu1_dbg1_rd_req_in_0, 
  mcu1_dbg1_rd_req_in_1, 
  mcu1_dbg1_rd_req_out, 
  mcu1_dbg1_wr_req_in_0, 
  mcu1_dbg1_wr_req_in_1, 
  mcu1_dbg1_wr_req_out, 
  mcu1_dbg1_mecc_err, 
  mcu1_dbg1_secc_err, 
  mcu1_dbg1_fbd_err, 
  mcu1_dbg1_err_mode, 
  mcu1_dbg1_err_event, 
  mcu2_dbg1_crc21, 
  mcu2_dbg1_rd_req_in_0, 
  mcu2_dbg1_rd_req_in_1, 
  mcu2_dbg1_rd_req_out, 
  mcu2_dbg1_wr_req_in_0, 
  mcu2_dbg1_wr_req_in_1, 
  mcu2_dbg1_wr_req_out, 
  mcu2_dbg1_mecc_err, 
  mcu2_dbg1_secc_err, 
  mcu2_dbg1_fbd_err, 
  mcu2_dbg1_err_mode, 
  mcu2_dbg1_err_event, 
  mcu3_dbg1_crc21, 
  mcu3_dbg1_rd_req_in_0, 
  mcu3_dbg1_rd_req_in_1, 
  mcu3_dbg1_rd_req_out, 
  mcu3_dbg1_wr_req_in_0, 
  mcu3_dbg1_wr_req_in_1, 
  mcu3_dbg1_wr_req_out, 
  mcu3_dbg1_mecc_err, 
  mcu3_dbg1_secc_err, 
  mcu3_dbg1_fbd_err, 
  mcu3_dbg1_err_mode, 
  mcu3_dbg1_err_event, 
  dbg1_niu_stall, 
  niu_dbg1_stall_ack, 
  dbg1_niu_resume, 
  dbg1_dmu_stall, 
  dmu_dbg1_stall_ack, 
  dbg1_dmu_resume, 
  dmu_dbg1_err_event, 
  ncu_dbg1_error_event, 
  l2t0_pa_match_synced, 
  l2t1_pa_match_synced, 
  l2t2_pa_match_synced, 
  l2t3_pa_match_synced, 
  l2t4_pa_match_synced, 
  l2t5_pa_match_synced, 
  l2t6_pa_match_synced, 
  l2t7_pa_match_synced, 
  l2t_error_event_synced, 
  tcu_mio_jtag_membist_mode, 
  tcu_dbr_gateoff, 
  mio_dbg1_testmode, 
  mio_pll_testmode, 
  dbg1_niu_dbg_sel, 
  dbg1_tcu_soc_hard_stop, 
  dbg1_tcu_soc_asrt_trigout, 
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  aclk_wmr, 
  wmr_protect, 
  rd_req_vld, 
  wr_req_vld, 
  addr_in, 
  data_in, 
  thr_id_in, 
  buf_id_in, 
  ack_busy, 
  rd_ack_vld, 
  rd_nack_vld, 
  req_acpted, 
  data_out, 
  thr_id_out, 
  buf_id_out, 
  mcu_dbg_signals, 
  mcu_dtm_signals, 
  sel_soc_obs_mode, 
  sel_charac_mode, 
  sel_rep_mode, 
  sel_core_soc_debug_mode, 
  sel_train_mode, 
  dbg1_mio_sel_niu_debug_mode, 
  dbg1_mio_sel_pcix_debug_mode, 
  dbg1_mio_sel_soc_obs_mode, 
  dbg1_mio_drv_en_op_only, 
  dbg1_mio_drv_en_muxtest_op, 
  dbg1_mio_drv_en_muxbist_op, 
  dbg1_mio_drv_en_muxtest_inp, 
  dbg1_mio_drv_en_muxtestpll_inp, 
  dbg1_mio_drv_imped);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire dbg_en;
wire ff_mcu_crc21signals_scanin;
wire ff_mcu_crc21signals_scanout;
wire l1clk;
wire ff_mcu_signals_scanin;
wire ff_mcu_signals_scanout;
wire dbg_config_addr;
wire dbg_config_en;
wire ff_dbg_config_scanin;
wire ff_dbg_config_scanout;
wire dbg_train;
wire niu_dbg_en;
wire io_quiesce_addr;
wire io_quiesce_en;
wire ff_io_quiesce_scanin;
wire ff_io_quiesce_scanout;
wire dbg1_dmu_stall_din;
wire ff_dbg1_dmu_stall_scanin;
wire ff_dbg1_dmu_stall_scanout;
wire dbg1_dmu_stall_r;
wire dbg1_niu_stall_din;
wire ff_dbg1_niu_stall_scanin;
wire ff_dbg1_niu_stall_scanout;
wire dbg1_niu_stall_r;
wire dbg1_dmu_resume_din;
wire ff_dbg1_dmu_resume_scanin;
wire ff_dbg1_dmu_resume_scanout;
wire dbg1_dmu_resume_r;
wire dbg1_niu_resume_din;
wire ff_dbg1_niu_resume_scanin;
wire ff_dbg1_niu_resume_scanout;
wire dbg1_niu_resume_r;
wire dmu_stall_done_din;
wire dmu_stall_done;
wire ff_dmu_stall_done_scanin;
wire ff_dmu_stall_done_scanout;
wire niu_stall_done_din;
wire niu_stall_done;
wire ff_niu_stall_done_scanin;
wire ff_niu_stall_done_scanout;
wire soc_decr_addr;
wire soc_decr_en;
wire ff_soc_decr_scanin;
wire ff_soc_decr_scanout;
wire dmu_dbg1_err_event_r;
wire ncu_dbg1_error_event_r;
wire mcu0_dbg1_err_event_r;
wire mcu1_dbg1_err_event_r;
wire mcu2_dbg1_err_event_r;
wire mcu3_dbg1_err_event_r;
wire l2t0_pa_match_synced_r;
wire l2t1_pa_match_synced_r;
wire l2t2_pa_match_synced_r;
wire l2t3_pa_match_synced_r;
wire l2t4_pa_match_synced_r;
wire l2t5_pa_match_synced_r;
wire l2t6_pa_match_synced_r;
wire l2t7_pa_match_synced_r;
wire l2t_error_event_synced_r;
wire ff_soc_error_regs_scanin;
wire ff_soc_error_regs_scanout;
wire dmu_dbg1_err_event_r2;
wire ncu_dbg1_error_event_r2;
wire mcu0_dbg1_err_event_r2;
wire mcu1_dbg1_err_event_r2;
wire mcu2_dbg1_err_event_r2;
wire mcu3_dbg1_err_event_r2;
wire l2t0_pa_match_synced_r2;
wire l2t1_pa_match_synced_r2;
wire l2t2_pa_match_synced_r2;
wire l2t3_pa_match_synced_r2;
wire l2t4_pa_match_synced_r2;
wire l2t5_pa_match_synced_r2;
wire l2t6_pa_match_synced_r2;
wire l2t7_pa_match_synced_r2;
wire l2t_error_event_synced_r2;
wire dbg1_tcu_soc_hard_stop_din;
wire dbg1_tcu_soc_asrt_trigout_din;
wire ff_soc_hard_stop_scanin;
wire ff_soc_hard_stop_scanout;
wire ff_soc_asrt_trigout_scanin;
wire ff_soc_asrt_trigout_scanout;
wire iob_creg_addr;
wire rd_ack_vld_ff_scanin;
wire rd_ack_vld_ff_scanout;
wire rd_nack_vld_ff_scanin;
wire rd_nack_vld_ff_scanout;
wire req_acpted_ff_scanin;
wire req_acpted_ff_scanout;
wire thr_id_ff_scanin;
wire thr_id_ff_scanout;
wire buf_id_ff_scanin;
wire buf_id_ff_scanout;
wire spares_scanin;
wire spares_scanout;


input           mcu0_dbg1_crc21;
input  [3:0]    mcu0_dbg1_rd_req_in_0;
input  [3:0]    mcu0_dbg1_rd_req_in_1;
input  [4:0]    mcu0_dbg1_rd_req_out;
input           mcu0_dbg1_wr_req_in_0;
input           mcu0_dbg1_wr_req_in_1;
input  [1:0]    mcu0_dbg1_wr_req_out;
input           mcu0_dbg1_mecc_err;
input           mcu0_dbg1_secc_err;
input           mcu0_dbg1_fbd_err;
input           mcu0_dbg1_err_mode;
input           mcu0_dbg1_err_event;

input           mcu1_dbg1_crc21;
input  [3:0]    mcu1_dbg1_rd_req_in_0;
input  [3:0]    mcu1_dbg1_rd_req_in_1;
input  [4:0]    mcu1_dbg1_rd_req_out;
input           mcu1_dbg1_wr_req_in_0;
input           mcu1_dbg1_wr_req_in_1;
input  [1:0]    mcu1_dbg1_wr_req_out;
input           mcu1_dbg1_mecc_err;
input           mcu1_dbg1_secc_err;
input           mcu1_dbg1_fbd_err;
input           mcu1_dbg1_err_mode;
input           mcu1_dbg1_err_event;

input           mcu2_dbg1_crc21;
input  [3:0]    mcu2_dbg1_rd_req_in_0;
input  [3:0]    mcu2_dbg1_rd_req_in_1;
input  [4:0]    mcu2_dbg1_rd_req_out;
input           mcu2_dbg1_wr_req_in_0;
input           mcu2_dbg1_wr_req_in_1;
input  [1:0]    mcu2_dbg1_wr_req_out;
input           mcu2_dbg1_mecc_err;
input           mcu2_dbg1_secc_err;
input           mcu2_dbg1_fbd_err;
input           mcu2_dbg1_err_mode;
input           mcu2_dbg1_err_event;

input           mcu3_dbg1_crc21;
input  [3:0]    mcu3_dbg1_rd_req_in_0;
input  [3:0]    mcu3_dbg1_rd_req_in_1;
input  [4:0]    mcu3_dbg1_rd_req_out;
input           mcu3_dbg1_wr_req_in_0;
input           mcu3_dbg1_wr_req_in_1;
input  [1:0]    mcu3_dbg1_wr_req_out;
input           mcu3_dbg1_mecc_err;
input           mcu3_dbg1_secc_err;
input           mcu3_dbg1_fbd_err;
input           mcu3_dbg1_err_mode;
input           mcu3_dbg1_err_event;



output          dbg1_niu_stall;    
input           niu_dbg1_stall_ack;
output          dbg1_niu_resume; 

output          dbg1_dmu_stall; 
input           dmu_dbg1_stall_ack;
output          dbg1_dmu_resume;  

input           dmu_dbg1_err_event;       //An error event occurred in DMU
input           ncu_dbg1_error_event;    //An Error event occurred in NCU.

input          l2t0_pa_match_synced;
input          l2t1_pa_match_synced;
input          l2t2_pa_match_synced;
input          l2t3_pa_match_synced;
input          l2t4_pa_match_synced;
input          l2t5_pa_match_synced;
input          l2t6_pa_match_synced;
input          l2t7_pa_match_synced;
input	       l2t_error_event_synced;

input           tcu_mio_jtag_membist_mode;
input		tcu_dbr_gateoff;
input           mio_dbg1_testmode;
input           mio_pll_testmode;
output  [4:0]   dbg1_niu_dbg_sel;



output          dbg1_tcu_soc_hard_stop;           //Hard Stop request to TCU fron SOC
output          dbg1_tcu_soc_asrt_trigout;       //Assert TRIGOUT request to TCU from SOC

input         iol2clk              ;
input         scan_in              ;
output        scan_out             ;
input         tcu_aclk             ;
input         tcu_bclk             ;
input         tcu_scan_en          ;
input	      tcu_pce_ov	   ;
input	      tcu_clk_stop	   ;
input         aclk_wmr;
input         wmr_protect;

input         rd_req_vld           ;//
input         wr_req_vld           ;//
input  [39:0] addr_in              ;//
input  [63:0] data_in              ;//
input   [5:0] thr_id_in            ;//
input   [1:0] buf_id_in            ;//
input         ack_busy             ;//
                                    // Ack-Nack from DBG1, the local unit
output        rd_ack_vld           ;//
output        rd_nack_vld          ;//
output        req_acpted           ;// Acceptance of CSR write or read command.


output [63:0] data_out             ;// Return data.
output  [5:0] thr_id_out           ;//
output  [1:0] buf_id_out           ;//

output [83:0] mcu_dbg_signals;
output [87:0] mcu_dtm_signals;

output	      sel_soc_obs_mode;
output        sel_charac_mode;
output        sel_rep_mode;
output	      sel_core_soc_debug_mode;
output        sel_train_mode;
output        dbg1_mio_sel_niu_debug_mode;
output        dbg1_mio_sel_pcix_debug_mode;
output	      dbg1_mio_sel_soc_obs_mode;


output          dbg1_mio_drv_en_op_only;  //Drive en to pins configured only as debug port
output          dbg1_mio_drv_en_muxtest_op;      //Drive en to pins configured both as debug port and scan out[31:0] pins
output          dbg1_mio_drv_en_muxbist_op;      //Drive en to pins configured both as debug port and mbist output pins.
output          dbg1_mio_drv_en_muxtest_inp;     //Drive en to pins configured as debug port and testmode input pins
output          dbg1_mio_drv_en_muxtestpll_inp;  // Drive en to pins configured as debug port and pll_testmode input pins

output  [1:0]   dbg1_mio_drv_imped;



// Wire declarations

wire [11:0] dbg_config_reg; 
wire [2:0] dbg_conf_mode;
wire [1:0] io_quiesce_out;
wire [21:0] soc_decr;

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

assign dbg1_mio_drv_en_op_only = dbg_en ;
assign dbg1_mio_drv_en_muxbist_op = dbg_en | tcu_mio_jtag_membist_mode;
assign dbg1_mio_drv_en_muxtest_op = dbg_en | mio_dbg1_testmode;
assign dbg1_mio_drv_en_muxtest_inp = dbg_en & ~mio_dbg1_testmode;
assign dbg1_mio_drv_en_muxtestpll_inp = dbg_en & ~mio_pll_testmode;

// flop MCU signals here before sending to dbg1_dbgprt_dp

wire [3:0]    mcu_crc21_signals;

db1_csr_ctl_msff_ctl_macro__width_4 ff_mcu_crc21signals 
   (.din     ({mcu3_dbg1_crc21,mcu2_dbg1_crc21,
               mcu1_dbg1_crc21,mcu0_dbg1_crc21}),
     .scan_in(ff_mcu_crc21signals_scanin),
     .scan_out(ff_mcu_crc21signals_scanout),
     .l1clk   (l1clk              ),
     .dout    ({mcu_crc21_signals[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
    );

          

db1_csr_ctl_msff_ctl_macro__width_84 ff_mcu_signals 
    (.din     ({mcu0_dbg1_rd_req_in_0[3:0],
                mcu0_dbg1_rd_req_in_1[3:0],
                mcu0_dbg1_rd_req_out[4:0],
                mcu0_dbg1_wr_req_in_0,
                mcu0_dbg1_wr_req_in_1,
                mcu0_dbg1_wr_req_out[1:0],
                mcu0_dbg1_mecc_err,
                mcu0_dbg1_secc_err,
                mcu0_dbg1_fbd_err,
                mcu0_dbg1_err_mode,
                mcu1_dbg1_rd_req_in_0[3:0],
                mcu1_dbg1_rd_req_in_1[3:0],
                mcu1_dbg1_rd_req_out[4:0],
                mcu1_dbg1_wr_req_in_0,
                mcu1_dbg1_wr_req_in_1,
                mcu1_dbg1_wr_req_out[1:0],
                mcu1_dbg1_mecc_err,
                mcu1_dbg1_secc_err,
                mcu1_dbg1_fbd_err,
                mcu1_dbg1_err_mode,
                mcu2_dbg1_rd_req_in_0[3:0],
                mcu2_dbg1_rd_req_in_1[3:0],
                mcu2_dbg1_rd_req_out[4:0],
                mcu2_dbg1_wr_req_in_0,
                mcu2_dbg1_wr_req_in_1,
                mcu2_dbg1_wr_req_out[1:0],
                mcu2_dbg1_mecc_err,
                mcu2_dbg1_secc_err,
                mcu2_dbg1_fbd_err,
                mcu2_dbg1_err_mode,
                mcu3_dbg1_rd_req_in_0[3:0],
                mcu3_dbg1_rd_req_in_1[3:0],
                mcu3_dbg1_rd_req_out[4:0],
                mcu3_dbg1_wr_req_in_0,
                mcu3_dbg1_wr_req_in_1,
                mcu3_dbg1_wr_req_out[1:0],
                mcu3_dbg1_mecc_err,
                mcu3_dbg1_secc_err,
                mcu3_dbg1_fbd_err,
                mcu3_dbg1_err_mode
		}),
     .scan_in(ff_mcu_signals_scanin),
     .scan_out(ff_mcu_signals_scanout),
     .l1clk   (l1clk              ),
     .dout    ({mcu_dbg_signals[83:0]}),
  .siclk(siclk),
  .soclk(soclk)
    );

// MCU DTM signal bus being sent out on the debug port

assign mcu_dtm_signals = { 
                          mcu_crc21_signals[3],mcu_dbg_signals[83:63],
                          mcu_crc21_signals[2],mcu_dbg_signals[62:42],
                          mcu_crc21_signals[1],mcu_dbg_signals[41:21],
                          mcu_crc21_signals[0],mcu_dbg_signals[20:0]};

//_____________________________________________________________________
//
//              Debug Configuration Register, RW , preserved across WMR
//_____________________________________________________________________

assign         dbg_config_addr = (addr_in == `IOB_CREG_DBG_CNFG);
assign	       dbg_config_en = wr_req_vld & dbg_config_addr;

db1_csr_ctl_msff_ctl_macro__en_1__width_12 ff_dbg_config 
    (.din     ({data_in[63:62],data_in[9:0]}),
     .scan_in(ff_dbg_config_scanin),
     .scan_out(ff_dbg_config_scanout),
     .siclk   (aclk_wmr),
     .l1clk   (l1clk              ),
     .en      (dbg_config_en),
     .dout    (dbg_config_reg[11:0]),
  .soclk(soclk));
 
assign dbg_train = dbg_config_reg[4];  // DBG Training bit for modes 000,001,010
assign dbg_conf_mode = dbg_config_reg[3:1]; // DBG Port Configuration Mode
assign dbg1_mio_drv_imped = dbg_config_reg[11:10];

assign sel_soc_obs_mode = ((dbg_conf_mode == 3'b000) & ~dbg_train);
assign sel_charac_mode = ((dbg_conf_mode == 3'b001) & ~dbg_train);
assign sel_rep_mode = ((dbg_conf_mode == 3'b010) & ~dbg_train);
assign sel_core_soc_debug_mode = ((dbg_conf_mode == 3'b011) & ~dbg_train);
assign sel_train_mode = (((dbg_conf_mode == 3'b000) | (dbg_conf_mode == 3'b001)
                         | (dbg_conf_mode == 3'b010)
                         | (dbg_conf_mode == 3'b011)) & dbg_train);

assign dbg1_mio_sel_niu_debug_mode = (dbg_conf_mode == 3'b100);
assign dbg1_mio_sel_pcix_debug_mode = (dbg_conf_mode == 3'b101);
assign dbg1_mio_sel_soc_obs_mode = sel_soc_obs_mode;

assign dbg_en =  dbg_config_reg[0];   // DBG Port Enable

assign niu_dbg_en = dbg1_mio_sel_niu_debug_mode & dbg_en; 

assign dbg1_niu_dbg_sel = dbg_config_reg[9:5] & {5{niu_dbg_en & ~tcu_dbr_gateoff}};


//_____________________________________________________________________
//
//              N2 I/O Quiece Control Register, bits 1:0 - R/W,preserved across WMR
//                                              bits 3:2 - RO
//_____________________________________________________________________

assign         io_quiesce_addr = (addr_in == `IOB_CREG_IO_QSC);
assign         io_quiesce_en = wr_req_vld & io_quiesce_addr;

db1_csr_ctl_msff_ctl_macro__en_1__width_2 ff_io_quiesce 
    (.din     (data_in[1:0]),
     .scan_in(ff_io_quiesce_scanin),
     .scan_out(ff_io_quiesce_scanout),
     .siclk   (aclk_wmr),
     .l1clk   (l1clk              ),
     .en      (io_quiesce_en),
     .dout    (io_quiesce_out[1:0]),
  .soclk(soclk));

assign dbg1_dmu_stall_din = ~io_quiesce_out[0] & data_in[0] & io_quiesce_en;
                     // dmu_stall bit is a 0 but will be written to 1 in the
                     // next iol2clk by SW		

db1_csr_ctl_msff_ctl_macro__width_1 ff_dbg1_dmu_stall 
    (.din     (dbg1_dmu_stall_din),
     .scan_in(ff_dbg1_dmu_stall_scanin),
     .scan_out(ff_dbg1_dmu_stall_scanout),
     .l1clk   (l1clk              ),
     .dout    (dbg1_dmu_stall_r),
  .siclk(siclk),
  .soclk(soclk));

assign dbg1_dmu_stall = ~tcu_dbr_gateoff & dbg1_dmu_stall_r;

assign dbg1_niu_stall_din = ~io_quiesce_out[1] & data_in[1] & io_quiesce_en;   
                     // niu_stall bit is a 0 but will be written to 1 in the  
                     // next iol2clk by SW     

db1_csr_ctl_msff_ctl_macro__width_1 ff_dbg1_niu_stall 
    (.din     (dbg1_niu_stall_din),
     .scan_in(ff_dbg1_niu_stall_scanin),
     .scan_out(ff_dbg1_niu_stall_scanout),
     .l1clk   (l1clk              ),
     .dout    (dbg1_niu_stall_r),
  .siclk(siclk),
  .soclk(soclk));

assign dbg1_niu_stall = ~tcu_dbr_gateoff & dbg1_niu_stall_r;

// both of dbg1_dmu_stall and dbg1_niu_stall are one cycle wide pulses
// valid for one iol2clk

assign dbg1_dmu_resume_din = io_quiesce_out[0] & ~data_in[0] & io_quiesce_en;   
                     // dmu_stall bit is a 1 but will be written to 0 in the  
                     // next iol2clk by SW     

db1_csr_ctl_msff_ctl_macro__width_1 ff_dbg1_dmu_resume 
    (.din     (dbg1_dmu_resume_din),
     .scan_in(ff_dbg1_dmu_resume_scanin),
     .scan_out(ff_dbg1_dmu_resume_scanout),
     .l1clk   (l1clk              ),
     .dout    (dbg1_dmu_resume_r),
  .siclk(siclk),
  .soclk(soclk));

assign dbg1_dmu_resume = ~tcu_dbr_gateoff & dbg1_dmu_resume_r;

assign dbg1_niu_resume_din = io_quiesce_out[1] & ~data_in[1] & io_quiesce_en;   
                     // niu_stall bit is a 1 but will be written to 0 in the  
                     // next iol2clk by SW     

db1_csr_ctl_msff_ctl_macro__width_1 ff_dbg1_niu_resume 
    (.din     (dbg1_niu_resume_din),
     .scan_in(ff_dbg1_niu_resume_scanin),
     .scan_out(ff_dbg1_niu_resume_scanout),
     .l1clk   (l1clk              ),
     .dout    (dbg1_niu_resume_r),
  .siclk(siclk),
  .soclk(soclk));

assign dbg1_niu_resume = ~tcu_dbr_gateoff & dbg1_niu_resume_r;

// both of dbg1_dmu_resume and dbg1_niu_resume are one cycle wide pulses
// valid for one iol2clk

// NIU_STALL_DONE and DMU_STALL_DONE bits

assign dmu_stall_done_din = dmu_dbg1_stall_ack  | dmu_stall_done; // set to 1
                       // when dmu sends the ack , preserved at 1 by the
                       // dmu_stall_done itself  

db1_csr_ctl_msff_ctl_macro__clr__1__width_1 ff_dmu_stall_done 
    (.din     (dmu_stall_done_din),
     .scan_in(ff_dmu_stall_done_scanin),
     .scan_out(ff_dmu_stall_done_scanout),
     .l1clk   (l1clk              ),
     .clr_    (~dbg1_dmu_resume_din), // cleared when DMU_STALL bit cleared to 0 by SW
     .dout    (dmu_stall_done),
  .siclk(siclk),
  .soclk(soclk)); // Should preserve value across WMR,DBR

assign niu_stall_done_din = niu_dbg1_stall_ack  | niu_stall_done; // set to 1 
                       // when niu sends the ack , preserved at 1 by the
                       // niu_stall_done itself

db1_csr_ctl_msff_ctl_macro__clr__1__width_1 ff_niu_stall_done 
    (.din     (niu_stall_done_din),
     .scan_in(ff_niu_stall_done_scanin),
     .scan_out(ff_niu_stall_done_scanout),
     .l1clk   (l1clk              ),
     .clr_    (~dbg1_niu_resume_din), // cleared when NIU_STALL bit cleared to 0 by SW
     .dout    (niu_stall_done),
  .siclk(siclk),
  .soclk(soclk)); // Should preserve value across WMR,DBR


//_____________________________________________________________________
//
//           SOC DECR Register : R/W   
//             
//_____________________________________________________________________

assign         soc_decr_addr = (addr_in == `IOB_CREG_SOC_DECR);
assign         soc_decr_en = wr_req_vld & soc_decr_addr; 

db1_csr_ctl_msff_ctl_macro__en_1__width_22 ff_soc_decr 
    (.din     (data_in[21:0]),
     .scan_in(ff_soc_decr_scanin),
     .scan_out(ff_soc_decr_scanout),
     .l1clk   (l1clk              ),
     .en      (soc_decr_en),
     .dout    (soc_decr[21:0]),
  .siclk(siclk),
  .soclk(soclk));

// FLop mcu,ncu,dmu error events twice

db1_csr_ctl_msff_ctl_macro__width_30 ff_soc_error_regs 
    (.din     ({dmu_dbg1_err_event,ncu_dbg1_error_event,
                mcu0_dbg1_err_event,mcu1_dbg1_err_event,
                mcu2_dbg1_err_event,mcu3_dbg1_err_event,
                dmu_dbg1_err_event_r,ncu_dbg1_error_event_r,
                mcu0_dbg1_err_event_r,mcu1_dbg1_err_event_r,
                mcu2_dbg1_err_event_r,mcu3_dbg1_err_event_r,
                l2t0_pa_match_synced,l2t1_pa_match_synced,
                l2t2_pa_match_synced,l2t3_pa_match_synced,
                l2t4_pa_match_synced,l2t5_pa_match_synced,
                l2t6_pa_match_synced,l2t7_pa_match_synced,
                l2t0_pa_match_synced_r,l2t1_pa_match_synced_r,
                l2t2_pa_match_synced_r,l2t3_pa_match_synced_r,
                l2t4_pa_match_synced_r,l2t5_pa_match_synced_r,
                l2t6_pa_match_synced_r,l2t7_pa_match_synced_r,
                l2t_error_event_synced,l2t_error_event_synced_r}),
     .scan_in(ff_soc_error_regs_scanin),
     .scan_out(ff_soc_error_regs_scanout),
     .l1clk   (l1clk              ),
     .dout    ({dmu_dbg1_err_event_r,ncu_dbg1_error_event_r,
                mcu0_dbg1_err_event_r,mcu1_dbg1_err_event_r,
                mcu2_dbg1_err_event_r,mcu3_dbg1_err_event_r,
                dmu_dbg1_err_event_r2,ncu_dbg1_error_event_r2,
                mcu0_dbg1_err_event_r2,mcu1_dbg1_err_event_r2,
                mcu2_dbg1_err_event_r2,mcu3_dbg1_err_event_r2,
                l2t0_pa_match_synced_r,l2t1_pa_match_synced_r,
                l2t2_pa_match_synced_r,l2t3_pa_match_synced_r,
                l2t4_pa_match_synced_r,l2t5_pa_match_synced_r,
                l2t6_pa_match_synced_r,l2t7_pa_match_synced_r,
                l2t0_pa_match_synced_r2,l2t1_pa_match_synced_r2,
                l2t2_pa_match_synced_r2,l2t3_pa_match_synced_r2,
                l2t4_pa_match_synced_r2,l2t5_pa_match_synced_r2,
                l2t6_pa_match_synced_r2,l2t7_pa_match_synced_r2,
                l2t_error_event_synced_r,l2t_error_event_synced_r2}),
  .siclk(siclk),
  .soclk(soclk)
     );

// dbg1_tcu_soc_hard_stop & dbg1_tcu_soc_asrt_trigout are pulses


assign dbg1_tcu_soc_hard_stop_din =  ((soc_decr[21:20] == 2'b10) & 
                                     ((dmu_dbg1_err_event_r & ~dmu_dbg1_err_event_r2)
                                      | (ncu_dbg1_error_event_r & ~ncu_dbg1_error_event_r2)
                                     )) 
                                     |
                                     ((soc_decr[19:18] == 2'b10) &
                                     ((mcu0_dbg1_err_event_r & ~mcu0_dbg1_err_event_r2) | 
                                      (mcu1_dbg1_err_event_r & ~mcu1_dbg1_err_event_r2) |
                                      (mcu2_dbg1_err_event_r & ~mcu2_dbg1_err_event_r2) | 
                                      (mcu3_dbg1_err_event_r & ~mcu3_dbg1_err_event_r2)
                                     ))
                                     |
                                     ((soc_decr[17:16] == 2'b10) &
                                     (l2t_error_event_synced_r & ~l2t_error_event_synced_r2))
                                     |
                                     ((soc_decr[15:14] == 2'b10) &
                                     (l2t7_pa_match_synced_r & ~l2t7_pa_match_synced_r2))
                                     |
                                     ((soc_decr[13:12] == 2'b10) &
                                     (l2t6_pa_match_synced_r & ~l2t6_pa_match_synced_r2))
                                     |
                                     ((soc_decr[11:10] == 2'b10) &
                                     (l2t5_pa_match_synced_r & ~l2t5_pa_match_synced_r2))
                                     |
                                     ((soc_decr[9:8] == 2'b10) &
                                     (l2t4_pa_match_synced_r & ~l2t4_pa_match_synced_r2))
                                     |
                                     ((soc_decr[7:6] == 2'b10) &
                                     (l2t3_pa_match_synced_r & ~l2t3_pa_match_synced_r2))
                                     |
                                     ((soc_decr[5:4] == 2'b10) &
                                     (l2t2_pa_match_synced_r & ~l2t2_pa_match_synced_r2))
                                     |
                                     ((soc_decr[3:2] == 2'b10) &
                                     (l2t1_pa_match_synced_r & ~l2t1_pa_match_synced_r2))
                                     |
                                     ((soc_decr[1:0] == 2'b10) &
                                     (l2t0_pa_match_synced_r & ~l2t0_pa_match_synced_r2))
                                    ;

assign dbg1_tcu_soc_asrt_trigout_din = ((soc_decr[21:20] == 2'b11) &
                                     ((dmu_dbg1_err_event_r & ~dmu_dbg1_err_event_r2)
                                      | (ncu_dbg1_error_event_r & ~ncu_dbg1_error_event_r2)
                                     ))
                                     |
                                     ((soc_decr[19:18] == 2'b11) &
                                     ((mcu0_dbg1_err_event_r & ~mcu0_dbg1_err_event_r2) | 
                                      (mcu1_dbg1_err_event_r & ~mcu1_dbg1_err_event_r2) |
                                      (mcu2_dbg1_err_event_r & ~mcu2_dbg1_err_event_r2) | 
                                      (mcu3_dbg1_err_event_r & ~mcu3_dbg1_err_event_r2)
                                     )) 
                                     |
                                     ((soc_decr[17:16] == 2'b11) &
                                     (l2t_error_event_synced_r & ~l2t_error_event_synced_r2))
                                     |
                                     ((soc_decr[15:14] == 2'b11) &
                                     (l2t7_pa_match_synced_r & ~l2t7_pa_match_synced_r2))
                                     |
                                     ((soc_decr[13:12] == 2'b11) &
                                     (l2t6_pa_match_synced_r & ~l2t6_pa_match_synced_r2))
                                     |
                                     ((soc_decr[11:10] == 2'b11) &
                                     (l2t5_pa_match_synced_r & ~l2t5_pa_match_synced_r2))
                                     |
                                     ((soc_decr[9:8] == 2'b11) &
                                     (l2t4_pa_match_synced_r & ~l2t4_pa_match_synced_r2))
                                     |
                                     ((soc_decr[7:6] == 2'b11) &
                                     (l2t3_pa_match_synced_r & ~l2t3_pa_match_synced_r2))
                                     |
                                     ((soc_decr[5:4] == 2'b11) &
                                     (l2t2_pa_match_synced_r & ~l2t2_pa_match_synced_r2))
                                     |
                                     ((soc_decr[3:2] == 2'b11) &
                                     (l2t1_pa_match_synced_r & ~l2t1_pa_match_synced_r2))
                                     |
                                     ((soc_decr[1:0] == 2'b11) &
                                     (l2t0_pa_match_synced_r & ~l2t0_pa_match_synced_r2))
                                    ;



db1_csr_ctl_msff_ctl_macro__width_1 ff_soc_hard_stop 
    (.din     (dbg1_tcu_soc_hard_stop_din),
     .scan_in(ff_soc_hard_stop_scanin),
     .scan_out(ff_soc_hard_stop_scanout),
     .l1clk   (l1clk              ),
     .dout    (dbg1_tcu_soc_hard_stop),
  .siclk(siclk),
  .soclk(soclk));


db1_csr_ctl_msff_ctl_macro__width_1 ff_soc_asrt_trigout 
    (.din     (dbg1_tcu_soc_asrt_trigout_din),
     .scan_in(ff_soc_asrt_trigout_scanin),
     .scan_out(ff_soc_asrt_trigout_scanout),
     .l1clk   (l1clk              ),
     .dout    (dbg1_tcu_soc_asrt_trigout),
  .siclk(siclk),
  .soclk(soclk));



//________________________________________________________________
//
//               Output mux
//________________________________________________________________

assign data_out[63:0] =
	dbg_config_addr ? {dbg_config_reg[11:10],52'b0,dbg_config_reg[9:0]} : // Debug Config Reg
        io_quiesce_addr ? {60'b0,niu_stall_done,dmu_stall_done,
    				io_quiesce_out[1:0]} : // IO Quiesce Control reg
	soc_decr_addr ?   {42'b0,soc_decr[21:0]}     :  // SOC DECR reg
                          64'b0;			// Default

assign iob_creg_addr    =
  (
	dbg_config_addr | io_quiesce_addr | soc_decr_addr
  );

// In the case of ack_busy signal is asserted, CSR Register
// Block should not assert rd_ack_vld or rd_nack_vld until
// ack_busy signal is de-asserted.  UCB Interface, Jan 6 '04.

wire   rd_ack_vld_din  =   rd_req_vld &  iob_creg_addr &
                          ~ack_busy                    &
                          ~rd_ack_vld;

wire   rd_nack_vld_din =   rd_req_vld & ~iob_creg_addr &
                          ~ack_busy                    &
                          ~rd_nack_vld;

wire   req_acpted_din  = ( wr_req_vld &
                          ~req_acpted
                         )              |
                         rd_ack_vld_din |
                         rd_nack_vld_din;

db1_csr_ctl_msff_ctl_macro__en_0__width_1 rd_ack_vld_ff 
    (.din     (rd_ack_vld_din       ),
     .scan_in(rd_ack_vld_ff_scanin),
     .scan_out(rd_ack_vld_ff_scanout),
     .l1clk   (l1clk                ),
     .dout    (rd_ack_vld           ),
  .siclk(siclk),
  .soclk(soclk));

db1_csr_ctl_msff_ctl_macro__en_0__width_1 rd_nack_vld_ff 
    (.din     (rd_nack_vld_din       ),
     .scan_in(rd_nack_vld_ff_scanin),
     .scan_out(rd_nack_vld_ff_scanout),
     .l1clk   (l1clk                 ),
     .dout    (rd_nack_vld           ),
  .siclk(siclk),
  .soclk(soclk));

db1_csr_ctl_msff_ctl_macro__en_0__width_1 req_acpted_ff 
    (.din     (req_acpted_din       ),
     .scan_in(req_acpted_ff_scanin),
     .scan_out(req_acpted_ff_scanout),
     .l1clk   (l1clk                ),
     .dout    (req_acpted           ),
  .siclk(siclk),
  .soclk(soclk));

wire   thr_buf_id_en   = req_acpted_din |
                         rd_nack_vld_din;

db1_csr_ctl_msff_ctl_macro__en_1__width_6 thr_id_ff 
    (.din     (thr_id_in[5:0]       ),
     .scan_in(thr_id_ff_scanin),
     .scan_out(thr_id_ff_scanout),
     .l1clk   (l1clk                ),
     .en      (thr_buf_id_en        ),
     .dout    (thr_id_out[5:0]      ),
  .siclk(siclk),
  .soclk(soclk));

db1_csr_ctl_msff_ctl_macro__en_1__width_2 buf_id_ff 
    (.din     (buf_id_in[1:0]       ),
     .scan_in(buf_id_ff_scanin),
     .scan_out(buf_id_ff_scanout),
     .l1clk   (l1clk                ),
     .en      (thr_buf_id_en        ),
     .dout    (buf_id_out[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

// Spare gates

db1_csr_ctl_spare_ctl_macro__num_6 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


/**** adding clock header ****/
db1_csr_ctl_l1clkhdr_ctl_macro clkgen (
                                .l2clk  (iol2clk),
                                .l1en   (1'b1),
                                .l1clk  (l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
                                );
// fixscan start:
assign ff_mcu_crc21signals_scanin = scan_in                  ;
assign ff_mcu_signals_scanin     = ff_mcu_crc21signals_scanout;
assign ff_dbg_config_scanin      = ff_mcu_signals_scanout   ;
assign ff_io_quiesce_scanin      = ff_dbg_config_scanout    ;
assign ff_dbg1_dmu_stall_scanin  =  ~(~ff_io_quiesce_scanout | wmr_protect);
assign ff_dbg1_niu_stall_scanin  = ff_dbg1_dmu_stall_scanout;
assign ff_dbg1_dmu_resume_scanin = ff_dbg1_niu_stall_scanout;
assign ff_dbg1_niu_resume_scanin = ff_dbg1_dmu_resume_scanout;
assign ff_dmu_stall_done_scanin  = ff_dbg1_niu_resume_scanout;
assign ff_niu_stall_done_scanin  = ff_dmu_stall_done_scanout;
assign ff_soc_decr_scanin        = ff_niu_stall_done_scanout;
assign ff_soc_error_regs_scanin  = ff_soc_decr_scanout      ;
assign ff_soc_hard_stop_scanin   = ff_soc_error_regs_scanout;
assign ff_soc_asrt_trigout_scanin = ff_soc_hard_stop_scanout ;
assign rd_ack_vld_ff_scanin      = ff_soc_asrt_trigout_scanout;
assign rd_nack_vld_ff_scanin     = rd_ack_vld_ff_scanout    ;
assign req_acpted_ff_scanin      = rd_nack_vld_ff_scanout   ;
assign thr_id_ff_scanin          = req_acpted_ff_scanout    ;
assign buf_id_ff_scanin          = thr_id_ff_scanout        ;
assign spares_scanin             = buf_id_ff_scanout        ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module db1_csr_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module db1_csr_ctl_msff_ctl_macro__width_84 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [83:0] fdin;
wire [82:0] so;

  input [83:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [83:0] dout;
  output scan_out;
assign fdin[83:0] = din[83:0];






dff #(84)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[83:0]),
.si({scan_in,so[82:0]}),
.so({so[82:0],scan_out}),
.q(dout[83:0])
);












endmodule













// any PARAMS parms go into naming of macro

module db1_csr_ctl_msff_ctl_macro__en_1__width_12 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = (din[11:0] & {12{en}}) | (dout[11:0] & ~{12{en}});






dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);












endmodule













// any PARAMS parms go into naming of macro

module db1_csr_ctl_msff_ctl_macro__en_1__width_2 (
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













// any PARAMS parms go into naming of macro

module db1_csr_ctl_msff_ctl_macro__width_1 (
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

module db1_csr_ctl_msff_ctl_macro__clr__1__width_1 (
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

module db1_csr_ctl_msff_ctl_macro__en_1__width_22 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [20:0] so;

  input [21:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [21:0] dout;
  output scan_out;
assign fdin[21:0] = (din[21:0] & {22{en}}) | (dout[21:0] & ~{22{en}});






dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);












endmodule













// any PARAMS parms go into naming of macro

module db1_csr_ctl_msff_ctl_macro__width_30 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [29:0] fdin;
wire [28:0] so;

  input [29:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [29:0] dout;
  output scan_out;
assign fdin[29:0] = din[29:0];






dff #(30)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[29:0]),
.si({scan_in,so[28:0]}),
.so({so[28:0],scan_out}),
.q(dout[29:0])
);












endmodule













// any PARAMS parms go into naming of macro

module db1_csr_ctl_msff_ctl_macro__en_0__width_1 (
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

module db1_csr_ctl_msff_ctl_macro__en_1__width_6 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module db1_csr_ctl_spare_ctl_macro__num_6 (
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






// any PARAMS parms go into naming of macro

module db1_csr_ctl_l1clkhdr_ctl_macro (
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








