// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlb_misc.v
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
`ifdef CORE_0

module tlb_misc_c0();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "tlb_sync.vh"

//---------------------
// Signals for ASI_I/DTLB_TAG_READ followme
wire                 [7:0] select_pc_b;
wire                 [7:0] dtag_read_active;
wire                 [2:0] dtlb_tid;
wire                [63:0] dtlb_va;
wire                [63:0] dtlb_value;

wire                 [2:0] fetch_tid_f;
reg                  [2:0] fetch_tid_c;
reg                  [2:0] fetch_tid;
wire                 [7:0] itag_read_active_bf;
reg                  [7:0] itag_read_active_f;
reg                  [7:0] itag_read_active_c;
reg                  [7:0] itag_read_active;
wire                [63:0] itlb_va_bf;
reg                 [63:0] itlb_va_f;
reg                 [63:0] itlb_va_c;
reg                 [63:0] itlb_va;
wire                [63:0] itlb_value;

//---------------------
// Signals for ASI_I/DTLB_DATA_ACCESS followme
wire                 [7:0] d_data_access_active;

wire                 [7:0] i_data_access_active_bf;
reg                  [7:0] i_data_access_active_f;
reg                  [7:0] i_data_access_active_c;
reg                  [7:0] i_data_access_active;

//---------------------
// Signals for ASI_ITLB_PROBE followme
wire                       probe_active_bf;
reg                        probe_active_f;
reg                        probe_active_c;
reg                        probe_active;
wire                 [7:0] probe_tid_bf;
reg                  [7:0] probe_tid_f;
reg                  [7:0] probe_tid_c;
reg                  [7:0] probe_tid;
wire                [63:0] probe_value;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    i;
integer                    junk;

initial begin // {
  mycid = 0;
end //}

//----------------------------------------------------------
// DUT probes

//---------------------
// Probes for ASI_DTLB_TAG_READ & ASI_DTLB_DATA_ACCESS followme

assign select_pc_b          = `PROBES0.select_pc_b;

assign dtlb_tid             = `SPC0.lsu.dcc.tid_b;
assign dtlb_va              = `SPC0.lsu_mmu_va_b;
assign dtlb_value           = `SPC0.lsu.tgd.ldxa_asi_data_b;

assign dtag_read_active     = {
                               ({4{`SPC0.lsu.dcc.dcc_tlb_tag_read_b &
                                  dtlb_tid[2] &
                               !`SPC0.lsu.lsu_illegal_inst_b & 
                               !`SPC0.tlu.fls1.dae_invalid_asi_w_in &
                               (!`SPC0.tlu_flush_lsu_b |`SPC0.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                               ({4{`SPC0.lsu.dcc.dcc_tlb_tag_read_b &
                                  !dtlb_tid[2] &
                                !`SPC0.lsu.lsu_illegal_inst_b & 
                                !`SPC0.tlu.fls0.dae_invalid_asi_w_in &                         
                                (!`SPC0.tlu_flush_lsu_b |`SPC0.tlu.fls0.va_watchpoint_w_in)}} &
                                (select_pc_b[3:0]))
                               };


assign d_data_access_active = {
                              ({4{`SPC0.lsu.dcc.dcc_tlb_data_read_b &
                                dtlb_tid[2] &
                               !`SPC0.lsu.lsu_illegal_inst_b & 
                               (!`SPC0.tlu_flush_lsu_b |`SPC0.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                              ({4{`SPC0.lsu.dcc.dcc_tlb_data_read_b &
                                 !dtlb_tid[2] &
                               !`SPC0.lsu.lsu_illegal_inst_b & 
                               (!`SPC0.tlu_flush_lsu_b |`SPC0.tlu.fls0.va_watchpoint_w_in)}} &
                               (select_pc_b[3:0]))
                              };

//---------------------
// Probes for ASI_ITLB_TAG_READ & ASI_ITLB_DATA_ACCESS followme

assign fetch_tid_f             = `SPC0.ifu_ftu.ftu_asi_ctl.indet_tid_f;

assign itag_read_active_bf     = `SPC0.ifu_ftu.ftu_ftp_ctl.ftp_itt_rd_req_bf;
assign i_data_access_active_bf = `SPC0.ifu_ftu.ftu_ftp_ctl.ftp_itd_rd_req_bf;

assign itlb_va_bf              = {24'b0,`SPC0.ifu_ftu.asi_addr_bf[39:3],3'b0};
assign itlb_value              = `SPC0.ifu_ftu.it_rd_data;  // [63:0]

//---------------------
// Probes for ASI_ITLB_PROBE followme

assign probe_active_bf  = `SPC0.ifu_ftu.ftp_ith_det_req_bf;
assign probe_tid_bf     = `SPC0.ifu_ftu.ftu_ftp_ctl.ith_det_thr_id;
assign probe_value      = `SPC0.ifu_ftu.it_rd_data;

//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC0.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //---------------------------------
  // Pipeline signals
  // Have to pipline these past where the TLB was accessed
  // to get the parity bits for follow me
  // Then we need to subtract 2 from the timestamp so get back 
  // get the correct time the tlb was accessed.

  itag_read_active_f     <= itag_read_active_bf;
  itag_read_active_c     <= itag_read_active_f;
  itag_read_active       <= itag_read_active_c;

  itlb_va_f              <= itlb_va_bf;
  itlb_va_c              <= itlb_va_f;
  itlb_va                <= itlb_va_c;

  fetch_tid_c            <= fetch_tid_f;
  fetch_tid              <= fetch_tid_c;
  i_data_access_active_f <= i_data_access_active_bf;
  i_data_access_active_c <= i_data_access_active_f;
  i_data_access_active   <= i_data_access_active_c;

  probe_active_f         <= probe_active_bf;
  probe_active_c         <= probe_active_f;
  probe_active           <= probe_active_c;
  probe_tid_f            <= probe_tid_bf;
  probe_tid_c            <= probe_tid_f;
  probe_tid              <= probe_tid_c;


  //---------------------------------
  //---------------------------------

  //---------------------------------
  // DTLB_TAG_READ_REG followme & sync
  if (dtag_read_active) begin // {
    myasi = 8'h5e;
    // Determine which thread is active

    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                           mytnum, myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum, tstamp - 1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // DTLB_DATA_ACCESS_REG followme & sync
  if (d_data_access_active) begin // {
    myasi = 8'h5d;
    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                          mytnum,myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}
  end // }

  //---------------------------------
  // ITLB_TAG_READ_REG followme & sync
  if (itag_read_active) begin // {
    myasi = 8'h56;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                          mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_DATA_ACCESS_REG followme & sync
  if (i_data_access_active) begin // {
    myasi = 8'h55;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_PROBE -  followme & sync
  if (probe_active) begin // {
    myasi = 8'h53;

    for (i=0; i<=7; i=i+1) begin // {
      if (probe_tid[i]==1'b1) begin // {
        mytid = i;
        mytnum = (mycid * 8) + mytid;
      end // }
    end // }

    // followme
   `PR_INFO ("pli_int", `INFO, 
               "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
               mycid,mytid,mytnum,myasi, itlb_va, probe_value, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, probe_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

end // always } 



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_1

module tlb_misc_c1();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "tlb_sync.vh"

//---------------------
// Signals for ASI_I/DTLB_TAG_READ followme
wire                 [7:0] select_pc_b;
wire                 [7:0] dtag_read_active;
wire                 [2:0] dtlb_tid;
wire                [63:0] dtlb_va;
wire                [63:0] dtlb_value;

wire                 [2:0] fetch_tid_f;
reg                  [2:0] fetch_tid_c;
reg                  [2:0] fetch_tid;
wire                 [7:0] itag_read_active_bf;
reg                  [7:0] itag_read_active_f;
reg                  [7:0] itag_read_active_c;
reg                  [7:0] itag_read_active;
wire                [63:0] itlb_va_bf;
reg                 [63:0] itlb_va_f;
reg                 [63:0] itlb_va_c;
reg                 [63:0] itlb_va;
wire                [63:0] itlb_value;

//---------------------
// Signals for ASI_I/DTLB_DATA_ACCESS followme
wire                 [7:0] d_data_access_active;

wire                 [7:0] i_data_access_active_bf;
reg                  [7:0] i_data_access_active_f;
reg                  [7:0] i_data_access_active_c;
reg                  [7:0] i_data_access_active;

//---------------------
// Signals for ASI_ITLB_PROBE followme
wire                       probe_active_bf;
reg                        probe_active_f;
reg                        probe_active_c;
reg                        probe_active;
wire                 [7:0] probe_tid_bf;
reg                  [7:0] probe_tid_f;
reg                  [7:0] probe_tid_c;
reg                  [7:0] probe_tid;
wire                [63:0] probe_value;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    i;
integer                    junk;

initial begin // {
  mycid = 1;
end //}

//----------------------------------------------------------
// DUT probes

//---------------------
// Probes for ASI_DTLB_TAG_READ & ASI_DTLB_DATA_ACCESS followme

assign select_pc_b          = `PROBES1.select_pc_b;

assign dtlb_tid             = `SPC1.lsu.dcc.tid_b;
assign dtlb_va              = `SPC1.lsu_mmu_va_b;
assign dtlb_value           = `SPC1.lsu.tgd.ldxa_asi_data_b;

assign dtag_read_active     = {
                               ({4{`SPC1.lsu.dcc.dcc_tlb_tag_read_b &
                                  dtlb_tid[2] &
                               !`SPC1.lsu.lsu_illegal_inst_b & 
                               !`SPC1.tlu.fls1.dae_invalid_asi_w_in &
                               (!`SPC1.tlu_flush_lsu_b |`SPC1.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                               ({4{`SPC1.lsu.dcc.dcc_tlb_tag_read_b &
                                  !dtlb_tid[2] &
                                !`SPC1.lsu.lsu_illegal_inst_b & 
                                !`SPC1.tlu.fls0.dae_invalid_asi_w_in &                         
                                (!`SPC1.tlu_flush_lsu_b |`SPC1.tlu.fls0.va_watchpoint_w_in)}} &
                                (select_pc_b[3:0]))
                               };


assign d_data_access_active = {
                              ({4{`SPC1.lsu.dcc.dcc_tlb_data_read_b &
                                dtlb_tid[2] &
                               !`SPC1.lsu.lsu_illegal_inst_b & 
                               (!`SPC1.tlu_flush_lsu_b |`SPC1.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                              ({4{`SPC1.lsu.dcc.dcc_tlb_data_read_b &
                                 !dtlb_tid[2] &
                               !`SPC1.lsu.lsu_illegal_inst_b & 
                               (!`SPC1.tlu_flush_lsu_b |`SPC1.tlu.fls0.va_watchpoint_w_in)}} &
                               (select_pc_b[3:0]))
                              };

//---------------------
// Probes for ASI_ITLB_TAG_READ & ASI_ITLB_DATA_ACCESS followme

assign fetch_tid_f             = `SPC1.ifu_ftu.ftu_asi_ctl.indet_tid_f;

assign itag_read_active_bf     = `SPC1.ifu_ftu.ftu_ftp_ctl.ftp_itt_rd_req_bf;
assign i_data_access_active_bf = `SPC1.ifu_ftu.ftu_ftp_ctl.ftp_itd_rd_req_bf;

assign itlb_va_bf              = {24'b0,`SPC1.ifu_ftu.asi_addr_bf[39:3],3'b0};
assign itlb_value              = `SPC1.ifu_ftu.it_rd_data;  // [63:0]

//---------------------
// Probes for ASI_ITLB_PROBE followme

assign probe_active_bf  = `SPC1.ifu_ftu.ftp_ith_det_req_bf;
assign probe_tid_bf     = `SPC1.ifu_ftu.ftu_ftp_ctl.ith_det_thr_id;
assign probe_value      = `SPC1.ifu_ftu.it_rd_data;

//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC1.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //---------------------------------
  // Pipeline signals
  // Have to pipline these past where the TLB was accessed
  // to get the parity bits for follow me
  // Then we need to subtract 2 from the timestamp so get back 
  // get the correct time the tlb was accessed.

  itag_read_active_f     <= itag_read_active_bf;
  itag_read_active_c     <= itag_read_active_f;
  itag_read_active       <= itag_read_active_c;

  itlb_va_f              <= itlb_va_bf;
  itlb_va_c              <= itlb_va_f;
  itlb_va                <= itlb_va_c;

  fetch_tid_c            <= fetch_tid_f;
  fetch_tid              <= fetch_tid_c;
  i_data_access_active_f <= i_data_access_active_bf;
  i_data_access_active_c <= i_data_access_active_f;
  i_data_access_active   <= i_data_access_active_c;

  probe_active_f         <= probe_active_bf;
  probe_active_c         <= probe_active_f;
  probe_active           <= probe_active_c;
  probe_tid_f            <= probe_tid_bf;
  probe_tid_c            <= probe_tid_f;
  probe_tid              <= probe_tid_c;


  //---------------------------------
  //---------------------------------

  //---------------------------------
  // DTLB_TAG_READ_REG followme & sync
  if (dtag_read_active) begin // {
    myasi = 8'h5e;
    // Determine which thread is active

    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                           mytnum, myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum, tstamp - 1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // DTLB_DATA_ACCESS_REG followme & sync
  if (d_data_access_active) begin // {
    myasi = 8'h5d;
    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                          mytnum,myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}
  end // }

  //---------------------------------
  // ITLB_TAG_READ_REG followme & sync
  if (itag_read_active) begin // {
    myasi = 8'h56;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                          mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_DATA_ACCESS_REG followme & sync
  if (i_data_access_active) begin // {
    myasi = 8'h55;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_PROBE -  followme & sync
  if (probe_active) begin // {
    myasi = 8'h53;

    for (i=0; i<=7; i=i+1) begin // {
      if (probe_tid[i]==1'b1) begin // {
        mytid = i;
        mytnum = (mycid * 8) + mytid;
      end // }
    end // }

    // followme
   `PR_INFO ("pli_int", `INFO, 
               "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
               mycid,mytid,mytnum,myasi, itlb_va, probe_value, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, probe_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

end // always } 



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_2

module tlb_misc_c2();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "tlb_sync.vh"

//---------------------
// Signals for ASI_I/DTLB_TAG_READ followme
wire                 [7:0] select_pc_b;
wire                 [7:0] dtag_read_active;
wire                 [2:0] dtlb_tid;
wire                [63:0] dtlb_va;
wire                [63:0] dtlb_value;

wire                 [2:0] fetch_tid_f;
reg                  [2:0] fetch_tid_c;
reg                  [2:0] fetch_tid;
wire                 [7:0] itag_read_active_bf;
reg                  [7:0] itag_read_active_f;
reg                  [7:0] itag_read_active_c;
reg                  [7:0] itag_read_active;
wire                [63:0] itlb_va_bf;
reg                 [63:0] itlb_va_f;
reg                 [63:0] itlb_va_c;
reg                 [63:0] itlb_va;
wire                [63:0] itlb_value;

//---------------------
// Signals for ASI_I/DTLB_DATA_ACCESS followme
wire                 [7:0] d_data_access_active;

wire                 [7:0] i_data_access_active_bf;
reg                  [7:0] i_data_access_active_f;
reg                  [7:0] i_data_access_active_c;
reg                  [7:0] i_data_access_active;

//---------------------
// Signals for ASI_ITLB_PROBE followme
wire                       probe_active_bf;
reg                        probe_active_f;
reg                        probe_active_c;
reg                        probe_active;
wire                 [7:0] probe_tid_bf;
reg                  [7:0] probe_tid_f;
reg                  [7:0] probe_tid_c;
reg                  [7:0] probe_tid;
wire                [63:0] probe_value;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    i;
integer                    junk;

initial begin // {
  mycid = 2;
end //}

//----------------------------------------------------------
// DUT probes

//---------------------
// Probes for ASI_DTLB_TAG_READ & ASI_DTLB_DATA_ACCESS followme

assign select_pc_b          = `PROBES2.select_pc_b;

assign dtlb_tid             = `SPC2.lsu.dcc.tid_b;
assign dtlb_va              = `SPC2.lsu_mmu_va_b;
assign dtlb_value           = `SPC2.lsu.tgd.ldxa_asi_data_b;

assign dtag_read_active     = {
                               ({4{`SPC2.lsu.dcc.dcc_tlb_tag_read_b &
                                  dtlb_tid[2] &
                               !`SPC2.lsu.lsu_illegal_inst_b & 
                               !`SPC2.tlu.fls1.dae_invalid_asi_w_in &
                               (!`SPC2.tlu_flush_lsu_b |`SPC2.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                               ({4{`SPC2.lsu.dcc.dcc_tlb_tag_read_b &
                                  !dtlb_tid[2] &
                                !`SPC2.lsu.lsu_illegal_inst_b & 
                                !`SPC2.tlu.fls0.dae_invalid_asi_w_in &                         
                                (!`SPC2.tlu_flush_lsu_b |`SPC2.tlu.fls0.va_watchpoint_w_in)}} &
                                (select_pc_b[3:0]))
                               };


assign d_data_access_active = {
                              ({4{`SPC2.lsu.dcc.dcc_tlb_data_read_b &
                                dtlb_tid[2] &
                               !`SPC2.lsu.lsu_illegal_inst_b & 
                               (!`SPC2.tlu_flush_lsu_b |`SPC2.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                              ({4{`SPC2.lsu.dcc.dcc_tlb_data_read_b &
                                 !dtlb_tid[2] &
                               !`SPC2.lsu.lsu_illegal_inst_b & 
                               (!`SPC2.tlu_flush_lsu_b |`SPC2.tlu.fls0.va_watchpoint_w_in)}} &
                               (select_pc_b[3:0]))
                              };

//---------------------
// Probes for ASI_ITLB_TAG_READ & ASI_ITLB_DATA_ACCESS followme

assign fetch_tid_f             = `SPC2.ifu_ftu.ftu_asi_ctl.indet_tid_f;

assign itag_read_active_bf     = `SPC2.ifu_ftu.ftu_ftp_ctl.ftp_itt_rd_req_bf;
assign i_data_access_active_bf = `SPC2.ifu_ftu.ftu_ftp_ctl.ftp_itd_rd_req_bf;

assign itlb_va_bf              = {24'b0,`SPC2.ifu_ftu.asi_addr_bf[39:3],3'b0};
assign itlb_value              = `SPC2.ifu_ftu.it_rd_data;  // [63:0]

//---------------------
// Probes for ASI_ITLB_PROBE followme

assign probe_active_bf  = `SPC2.ifu_ftu.ftp_ith_det_req_bf;
assign probe_tid_bf     = `SPC2.ifu_ftu.ftu_ftp_ctl.ith_det_thr_id;
assign probe_value      = `SPC2.ifu_ftu.it_rd_data;

//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC2.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //---------------------------------
  // Pipeline signals
  // Have to pipline these past where the TLB was accessed
  // to get the parity bits for follow me
  // Then we need to subtract 2 from the timestamp so get back 
  // get the correct time the tlb was accessed.

  itag_read_active_f     <= itag_read_active_bf;
  itag_read_active_c     <= itag_read_active_f;
  itag_read_active       <= itag_read_active_c;

  itlb_va_f              <= itlb_va_bf;
  itlb_va_c              <= itlb_va_f;
  itlb_va                <= itlb_va_c;

  fetch_tid_c            <= fetch_tid_f;
  fetch_tid              <= fetch_tid_c;
  i_data_access_active_f <= i_data_access_active_bf;
  i_data_access_active_c <= i_data_access_active_f;
  i_data_access_active   <= i_data_access_active_c;

  probe_active_f         <= probe_active_bf;
  probe_active_c         <= probe_active_f;
  probe_active           <= probe_active_c;
  probe_tid_f            <= probe_tid_bf;
  probe_tid_c            <= probe_tid_f;
  probe_tid              <= probe_tid_c;


  //---------------------------------
  //---------------------------------

  //---------------------------------
  // DTLB_TAG_READ_REG followme & sync
  if (dtag_read_active) begin // {
    myasi = 8'h5e;
    // Determine which thread is active

    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                           mytnum, myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum, tstamp - 1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // DTLB_DATA_ACCESS_REG followme & sync
  if (d_data_access_active) begin // {
    myasi = 8'h5d;
    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                          mytnum,myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}
  end // }

  //---------------------------------
  // ITLB_TAG_READ_REG followme & sync
  if (itag_read_active) begin // {
    myasi = 8'h56;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                          mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_DATA_ACCESS_REG followme & sync
  if (i_data_access_active) begin // {
    myasi = 8'h55;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_PROBE -  followme & sync
  if (probe_active) begin // {
    myasi = 8'h53;

    for (i=0; i<=7; i=i+1) begin // {
      if (probe_tid[i]==1'b1) begin // {
        mytid = i;
        mytnum = (mycid * 8) + mytid;
      end // }
    end // }

    // followme
   `PR_INFO ("pli_int", `INFO, 
               "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
               mycid,mytid,mytnum,myasi, itlb_va, probe_value, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, probe_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

end // always } 



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_3

module tlb_misc_c3();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "tlb_sync.vh"

//---------------------
// Signals for ASI_I/DTLB_TAG_READ followme
wire                 [7:0] select_pc_b;
wire                 [7:0] dtag_read_active;
wire                 [2:0] dtlb_tid;
wire                [63:0] dtlb_va;
wire                [63:0] dtlb_value;

wire                 [2:0] fetch_tid_f;
reg                  [2:0] fetch_tid_c;
reg                  [2:0] fetch_tid;
wire                 [7:0] itag_read_active_bf;
reg                  [7:0] itag_read_active_f;
reg                  [7:0] itag_read_active_c;
reg                  [7:0] itag_read_active;
wire                [63:0] itlb_va_bf;
reg                 [63:0] itlb_va_f;
reg                 [63:0] itlb_va_c;
reg                 [63:0] itlb_va;
wire                [63:0] itlb_value;

//---------------------
// Signals for ASI_I/DTLB_DATA_ACCESS followme
wire                 [7:0] d_data_access_active;

wire                 [7:0] i_data_access_active_bf;
reg                  [7:0] i_data_access_active_f;
reg                  [7:0] i_data_access_active_c;
reg                  [7:0] i_data_access_active;

//---------------------
// Signals for ASI_ITLB_PROBE followme
wire                       probe_active_bf;
reg                        probe_active_f;
reg                        probe_active_c;
reg                        probe_active;
wire                 [7:0] probe_tid_bf;
reg                  [7:0] probe_tid_f;
reg                  [7:0] probe_tid_c;
reg                  [7:0] probe_tid;
wire                [63:0] probe_value;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    i;
integer                    junk;

initial begin // {
  mycid = 3;
end //}

//----------------------------------------------------------
// DUT probes

//---------------------
// Probes for ASI_DTLB_TAG_READ & ASI_DTLB_DATA_ACCESS followme

assign select_pc_b          = `PROBES3.select_pc_b;

assign dtlb_tid             = `SPC3.lsu.dcc.tid_b;
assign dtlb_va              = `SPC3.lsu_mmu_va_b;
assign dtlb_value           = `SPC3.lsu.tgd.ldxa_asi_data_b;

assign dtag_read_active     = {
                               ({4{`SPC3.lsu.dcc.dcc_tlb_tag_read_b &
                                  dtlb_tid[2] &
                               !`SPC3.lsu.lsu_illegal_inst_b & 
                               !`SPC3.tlu.fls1.dae_invalid_asi_w_in &
                               (!`SPC3.tlu_flush_lsu_b |`SPC3.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                               ({4{`SPC3.lsu.dcc.dcc_tlb_tag_read_b &
                                  !dtlb_tid[2] &
                                !`SPC3.lsu.lsu_illegal_inst_b & 
                                !`SPC3.tlu.fls0.dae_invalid_asi_w_in &                         
                                (!`SPC3.tlu_flush_lsu_b |`SPC3.tlu.fls0.va_watchpoint_w_in)}} &
                                (select_pc_b[3:0]))
                               };


assign d_data_access_active = {
                              ({4{`SPC3.lsu.dcc.dcc_tlb_data_read_b &
                                dtlb_tid[2] &
                               !`SPC3.lsu.lsu_illegal_inst_b & 
                               (!`SPC3.tlu_flush_lsu_b |`SPC3.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                              ({4{`SPC3.lsu.dcc.dcc_tlb_data_read_b &
                                 !dtlb_tid[2] &
                               !`SPC3.lsu.lsu_illegal_inst_b & 
                               (!`SPC3.tlu_flush_lsu_b |`SPC3.tlu.fls0.va_watchpoint_w_in)}} &
                               (select_pc_b[3:0]))
                              };

//---------------------
// Probes for ASI_ITLB_TAG_READ & ASI_ITLB_DATA_ACCESS followme

assign fetch_tid_f             = `SPC3.ifu_ftu.ftu_asi_ctl.indet_tid_f;

assign itag_read_active_bf     = `SPC3.ifu_ftu.ftu_ftp_ctl.ftp_itt_rd_req_bf;
assign i_data_access_active_bf = `SPC3.ifu_ftu.ftu_ftp_ctl.ftp_itd_rd_req_bf;

assign itlb_va_bf              = {24'b0,`SPC3.ifu_ftu.asi_addr_bf[39:3],3'b0};
assign itlb_value              = `SPC3.ifu_ftu.it_rd_data;  // [63:0]

//---------------------
// Probes for ASI_ITLB_PROBE followme

assign probe_active_bf  = `SPC3.ifu_ftu.ftp_ith_det_req_bf;
assign probe_tid_bf     = `SPC3.ifu_ftu.ftu_ftp_ctl.ith_det_thr_id;
assign probe_value      = `SPC3.ifu_ftu.it_rd_data;

//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC3.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //---------------------------------
  // Pipeline signals
  // Have to pipline these past where the TLB was accessed
  // to get the parity bits for follow me
  // Then we need to subtract 2 from the timestamp so get back 
  // get the correct time the tlb was accessed.

  itag_read_active_f     <= itag_read_active_bf;
  itag_read_active_c     <= itag_read_active_f;
  itag_read_active       <= itag_read_active_c;

  itlb_va_f              <= itlb_va_bf;
  itlb_va_c              <= itlb_va_f;
  itlb_va                <= itlb_va_c;

  fetch_tid_c            <= fetch_tid_f;
  fetch_tid              <= fetch_tid_c;
  i_data_access_active_f <= i_data_access_active_bf;
  i_data_access_active_c <= i_data_access_active_f;
  i_data_access_active   <= i_data_access_active_c;

  probe_active_f         <= probe_active_bf;
  probe_active_c         <= probe_active_f;
  probe_active           <= probe_active_c;
  probe_tid_f            <= probe_tid_bf;
  probe_tid_c            <= probe_tid_f;
  probe_tid              <= probe_tid_c;


  //---------------------------------
  //---------------------------------

  //---------------------------------
  // DTLB_TAG_READ_REG followme & sync
  if (dtag_read_active) begin // {
    myasi = 8'h5e;
    // Determine which thread is active

    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                           mytnum, myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum, tstamp - 1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // DTLB_DATA_ACCESS_REG followme & sync
  if (d_data_access_active) begin // {
    myasi = 8'h5d;
    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                          mytnum,myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}
  end // }

  //---------------------------------
  // ITLB_TAG_READ_REG followme & sync
  if (itag_read_active) begin // {
    myasi = 8'h56;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                          mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_DATA_ACCESS_REG followme & sync
  if (i_data_access_active) begin // {
    myasi = 8'h55;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_PROBE -  followme & sync
  if (probe_active) begin // {
    myasi = 8'h53;

    for (i=0; i<=7; i=i+1) begin // {
      if (probe_tid[i]==1'b1) begin // {
        mytid = i;
        mytnum = (mycid * 8) + mytid;
      end // }
    end // }

    // followme
   `PR_INFO ("pli_int", `INFO, 
               "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
               mycid,mytid,mytnum,myasi, itlb_va, probe_value, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, probe_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

end // always } 



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_4

module tlb_misc_c4();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "tlb_sync.vh"

//---------------------
// Signals for ASI_I/DTLB_TAG_READ followme
wire                 [7:0] select_pc_b;
wire                 [7:0] dtag_read_active;
wire                 [2:0] dtlb_tid;
wire                [63:0] dtlb_va;
wire                [63:0] dtlb_value;

wire                 [2:0] fetch_tid_f;
reg                  [2:0] fetch_tid_c;
reg                  [2:0] fetch_tid;
wire                 [7:0] itag_read_active_bf;
reg                  [7:0] itag_read_active_f;
reg                  [7:0] itag_read_active_c;
reg                  [7:0] itag_read_active;
wire                [63:0] itlb_va_bf;
reg                 [63:0] itlb_va_f;
reg                 [63:0] itlb_va_c;
reg                 [63:0] itlb_va;
wire                [63:0] itlb_value;

//---------------------
// Signals for ASI_I/DTLB_DATA_ACCESS followme
wire                 [7:0] d_data_access_active;

wire                 [7:0] i_data_access_active_bf;
reg                  [7:0] i_data_access_active_f;
reg                  [7:0] i_data_access_active_c;
reg                  [7:0] i_data_access_active;

//---------------------
// Signals for ASI_ITLB_PROBE followme
wire                       probe_active_bf;
reg                        probe_active_f;
reg                        probe_active_c;
reg                        probe_active;
wire                 [7:0] probe_tid_bf;
reg                  [7:0] probe_tid_f;
reg                  [7:0] probe_tid_c;
reg                  [7:0] probe_tid;
wire                [63:0] probe_value;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    i;
integer                    junk;

initial begin // {
  mycid = 4;
end //}

//----------------------------------------------------------
// DUT probes

//---------------------
// Probes for ASI_DTLB_TAG_READ & ASI_DTLB_DATA_ACCESS followme

assign select_pc_b          = `PROBES4.select_pc_b;

assign dtlb_tid             = `SPC4.lsu.dcc.tid_b;
assign dtlb_va              = `SPC4.lsu_mmu_va_b;
assign dtlb_value           = `SPC4.lsu.tgd.ldxa_asi_data_b;

assign dtag_read_active     = {
                               ({4{`SPC4.lsu.dcc.dcc_tlb_tag_read_b &
                                  dtlb_tid[2] &
                               !`SPC4.lsu.lsu_illegal_inst_b & 
                               !`SPC4.tlu.fls1.dae_invalid_asi_w_in &
                               (!`SPC4.tlu_flush_lsu_b |`SPC4.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                               ({4{`SPC4.lsu.dcc.dcc_tlb_tag_read_b &
                                  !dtlb_tid[2] &
                                !`SPC4.lsu.lsu_illegal_inst_b & 
                                !`SPC4.tlu.fls0.dae_invalid_asi_w_in &                         
                                (!`SPC4.tlu_flush_lsu_b |`SPC4.tlu.fls0.va_watchpoint_w_in)}} &
                                (select_pc_b[3:0]))
                               };


assign d_data_access_active = {
                              ({4{`SPC4.lsu.dcc.dcc_tlb_data_read_b &
                                dtlb_tid[2] &
                               !`SPC4.lsu.lsu_illegal_inst_b & 
                               (!`SPC4.tlu_flush_lsu_b |`SPC4.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                              ({4{`SPC4.lsu.dcc.dcc_tlb_data_read_b &
                                 !dtlb_tid[2] &
                               !`SPC4.lsu.lsu_illegal_inst_b & 
                               (!`SPC4.tlu_flush_lsu_b |`SPC4.tlu.fls0.va_watchpoint_w_in)}} &
                               (select_pc_b[3:0]))
                              };

//---------------------
// Probes for ASI_ITLB_TAG_READ & ASI_ITLB_DATA_ACCESS followme

assign fetch_tid_f             = `SPC4.ifu_ftu.ftu_asi_ctl.indet_tid_f;

assign itag_read_active_bf     = `SPC4.ifu_ftu.ftu_ftp_ctl.ftp_itt_rd_req_bf;
assign i_data_access_active_bf = `SPC4.ifu_ftu.ftu_ftp_ctl.ftp_itd_rd_req_bf;

assign itlb_va_bf              = {24'b0,`SPC4.ifu_ftu.asi_addr_bf[39:3],3'b0};
assign itlb_value              = `SPC4.ifu_ftu.it_rd_data;  // [63:0]

//---------------------
// Probes for ASI_ITLB_PROBE followme

assign probe_active_bf  = `SPC4.ifu_ftu.ftp_ith_det_req_bf;
assign probe_tid_bf     = `SPC4.ifu_ftu.ftu_ftp_ctl.ith_det_thr_id;
assign probe_value      = `SPC4.ifu_ftu.it_rd_data;

//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC4.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //---------------------------------
  // Pipeline signals
  // Have to pipline these past where the TLB was accessed
  // to get the parity bits for follow me
  // Then we need to subtract 2 from the timestamp so get back 
  // get the correct time the tlb was accessed.

  itag_read_active_f     <= itag_read_active_bf;
  itag_read_active_c     <= itag_read_active_f;
  itag_read_active       <= itag_read_active_c;

  itlb_va_f              <= itlb_va_bf;
  itlb_va_c              <= itlb_va_f;
  itlb_va                <= itlb_va_c;

  fetch_tid_c            <= fetch_tid_f;
  fetch_tid              <= fetch_tid_c;
  i_data_access_active_f <= i_data_access_active_bf;
  i_data_access_active_c <= i_data_access_active_f;
  i_data_access_active   <= i_data_access_active_c;

  probe_active_f         <= probe_active_bf;
  probe_active_c         <= probe_active_f;
  probe_active           <= probe_active_c;
  probe_tid_f            <= probe_tid_bf;
  probe_tid_c            <= probe_tid_f;
  probe_tid              <= probe_tid_c;


  //---------------------------------
  //---------------------------------

  //---------------------------------
  // DTLB_TAG_READ_REG followme & sync
  if (dtag_read_active) begin // {
    myasi = 8'h5e;
    // Determine which thread is active

    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                           mytnum, myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum, tstamp - 1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // DTLB_DATA_ACCESS_REG followme & sync
  if (d_data_access_active) begin // {
    myasi = 8'h5d;
    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                          mytnum,myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}
  end // }

  //---------------------------------
  // ITLB_TAG_READ_REG followme & sync
  if (itag_read_active) begin // {
    myasi = 8'h56;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                          mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_DATA_ACCESS_REG followme & sync
  if (i_data_access_active) begin // {
    myasi = 8'h55;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_PROBE -  followme & sync
  if (probe_active) begin // {
    myasi = 8'h53;

    for (i=0; i<=7; i=i+1) begin // {
      if (probe_tid[i]==1'b1) begin // {
        mytid = i;
        mytnum = (mycid * 8) + mytid;
      end // }
    end // }

    // followme
   `PR_INFO ("pli_int", `INFO, 
               "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
               mycid,mytid,mytnum,myasi, itlb_va, probe_value, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, probe_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

end // always } 



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_5

module tlb_misc_c5();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "tlb_sync.vh"

//---------------------
// Signals for ASI_I/DTLB_TAG_READ followme
wire                 [7:0] select_pc_b;
wire                 [7:0] dtag_read_active;
wire                 [2:0] dtlb_tid;
wire                [63:0] dtlb_va;
wire                [63:0] dtlb_value;

wire                 [2:0] fetch_tid_f;
reg                  [2:0] fetch_tid_c;
reg                  [2:0] fetch_tid;
wire                 [7:0] itag_read_active_bf;
reg                  [7:0] itag_read_active_f;
reg                  [7:0] itag_read_active_c;
reg                  [7:0] itag_read_active;
wire                [63:0] itlb_va_bf;
reg                 [63:0] itlb_va_f;
reg                 [63:0] itlb_va_c;
reg                 [63:0] itlb_va;
wire                [63:0] itlb_value;

//---------------------
// Signals for ASI_I/DTLB_DATA_ACCESS followme
wire                 [7:0] d_data_access_active;

wire                 [7:0] i_data_access_active_bf;
reg                  [7:0] i_data_access_active_f;
reg                  [7:0] i_data_access_active_c;
reg                  [7:0] i_data_access_active;

//---------------------
// Signals for ASI_ITLB_PROBE followme
wire                       probe_active_bf;
reg                        probe_active_f;
reg                        probe_active_c;
reg                        probe_active;
wire                 [7:0] probe_tid_bf;
reg                  [7:0] probe_tid_f;
reg                  [7:0] probe_tid_c;
reg                  [7:0] probe_tid;
wire                [63:0] probe_value;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    i;
integer                    junk;

initial begin // {
  mycid = 5;
end //}

//----------------------------------------------------------
// DUT probes

//---------------------
// Probes for ASI_DTLB_TAG_READ & ASI_DTLB_DATA_ACCESS followme

assign select_pc_b          = `PROBES5.select_pc_b;

assign dtlb_tid             = `SPC5.lsu.dcc.tid_b;
assign dtlb_va              = `SPC5.lsu_mmu_va_b;
assign dtlb_value           = `SPC5.lsu.tgd.ldxa_asi_data_b;

assign dtag_read_active     = {
                               ({4{`SPC5.lsu.dcc.dcc_tlb_tag_read_b &
                                  dtlb_tid[2] &
                               !`SPC5.lsu.lsu_illegal_inst_b & 
                               !`SPC5.tlu.fls1.dae_invalid_asi_w_in &
                               (!`SPC5.tlu_flush_lsu_b |`SPC5.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                               ({4{`SPC5.lsu.dcc.dcc_tlb_tag_read_b &
                                  !dtlb_tid[2] &
                                !`SPC5.lsu.lsu_illegal_inst_b & 
                                !`SPC5.tlu.fls0.dae_invalid_asi_w_in &                         
                                (!`SPC5.tlu_flush_lsu_b |`SPC5.tlu.fls0.va_watchpoint_w_in)}} &
                                (select_pc_b[3:0]))
                               };


assign d_data_access_active = {
                              ({4{`SPC5.lsu.dcc.dcc_tlb_data_read_b &
                                dtlb_tid[2] &
                               !`SPC5.lsu.lsu_illegal_inst_b & 
                               (!`SPC5.tlu_flush_lsu_b |`SPC5.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                              ({4{`SPC5.lsu.dcc.dcc_tlb_data_read_b &
                                 !dtlb_tid[2] &
                               !`SPC5.lsu.lsu_illegal_inst_b & 
                               (!`SPC5.tlu_flush_lsu_b |`SPC5.tlu.fls0.va_watchpoint_w_in)}} &
                               (select_pc_b[3:0]))
                              };

//---------------------
// Probes for ASI_ITLB_TAG_READ & ASI_ITLB_DATA_ACCESS followme

assign fetch_tid_f             = `SPC5.ifu_ftu.ftu_asi_ctl.indet_tid_f;

assign itag_read_active_bf     = `SPC5.ifu_ftu.ftu_ftp_ctl.ftp_itt_rd_req_bf;
assign i_data_access_active_bf = `SPC5.ifu_ftu.ftu_ftp_ctl.ftp_itd_rd_req_bf;

assign itlb_va_bf              = {24'b0,`SPC5.ifu_ftu.asi_addr_bf[39:3],3'b0};
assign itlb_value              = `SPC5.ifu_ftu.it_rd_data;  // [63:0]

//---------------------
// Probes for ASI_ITLB_PROBE followme

assign probe_active_bf  = `SPC5.ifu_ftu.ftp_ith_det_req_bf;
assign probe_tid_bf     = `SPC5.ifu_ftu.ftu_ftp_ctl.ith_det_thr_id;
assign probe_value      = `SPC5.ifu_ftu.it_rd_data;

//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC5.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //---------------------------------
  // Pipeline signals
  // Have to pipline these past where the TLB was accessed
  // to get the parity bits for follow me
  // Then we need to subtract 2 from the timestamp so get back 
  // get the correct time the tlb was accessed.

  itag_read_active_f     <= itag_read_active_bf;
  itag_read_active_c     <= itag_read_active_f;
  itag_read_active       <= itag_read_active_c;

  itlb_va_f              <= itlb_va_bf;
  itlb_va_c              <= itlb_va_f;
  itlb_va                <= itlb_va_c;

  fetch_tid_c            <= fetch_tid_f;
  fetch_tid              <= fetch_tid_c;
  i_data_access_active_f <= i_data_access_active_bf;
  i_data_access_active_c <= i_data_access_active_f;
  i_data_access_active   <= i_data_access_active_c;

  probe_active_f         <= probe_active_bf;
  probe_active_c         <= probe_active_f;
  probe_active           <= probe_active_c;
  probe_tid_f            <= probe_tid_bf;
  probe_tid_c            <= probe_tid_f;
  probe_tid              <= probe_tid_c;


  //---------------------------------
  //---------------------------------

  //---------------------------------
  // DTLB_TAG_READ_REG followme & sync
  if (dtag_read_active) begin // {
    myasi = 8'h5e;
    // Determine which thread is active

    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                           mytnum, myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum, tstamp - 1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // DTLB_DATA_ACCESS_REG followme & sync
  if (d_data_access_active) begin // {
    myasi = 8'h5d;
    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                          mytnum,myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}
  end // }

  //---------------------------------
  // ITLB_TAG_READ_REG followme & sync
  if (itag_read_active) begin // {
    myasi = 8'h56;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                          mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_DATA_ACCESS_REG followme & sync
  if (i_data_access_active) begin // {
    myasi = 8'h55;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_PROBE -  followme & sync
  if (probe_active) begin // {
    myasi = 8'h53;

    for (i=0; i<=7; i=i+1) begin // {
      if (probe_tid[i]==1'b1) begin // {
        mytid = i;
        mytnum = (mycid * 8) + mytid;
      end // }
    end // }

    // followme
   `PR_INFO ("pli_int", `INFO, 
               "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
               mycid,mytid,mytnum,myasi, itlb_va, probe_value, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, probe_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

end // always } 



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_6

module tlb_misc_c6();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "tlb_sync.vh"

//---------------------
// Signals for ASI_I/DTLB_TAG_READ followme
wire                 [7:0] select_pc_b;
wire                 [7:0] dtag_read_active;
wire                 [2:0] dtlb_tid;
wire                [63:0] dtlb_va;
wire                [63:0] dtlb_value;

wire                 [2:0] fetch_tid_f;
reg                  [2:0] fetch_tid_c;
reg                  [2:0] fetch_tid;
wire                 [7:0] itag_read_active_bf;
reg                  [7:0] itag_read_active_f;
reg                  [7:0] itag_read_active_c;
reg                  [7:0] itag_read_active;
wire                [63:0] itlb_va_bf;
reg                 [63:0] itlb_va_f;
reg                 [63:0] itlb_va_c;
reg                 [63:0] itlb_va;
wire                [63:0] itlb_value;

//---------------------
// Signals for ASI_I/DTLB_DATA_ACCESS followme
wire                 [7:0] d_data_access_active;

wire                 [7:0] i_data_access_active_bf;
reg                  [7:0] i_data_access_active_f;
reg                  [7:0] i_data_access_active_c;
reg                  [7:0] i_data_access_active;

//---------------------
// Signals for ASI_ITLB_PROBE followme
wire                       probe_active_bf;
reg                        probe_active_f;
reg                        probe_active_c;
reg                        probe_active;
wire                 [7:0] probe_tid_bf;
reg                  [7:0] probe_tid_f;
reg                  [7:0] probe_tid_c;
reg                  [7:0] probe_tid;
wire                [63:0] probe_value;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    i;
integer                    junk;

initial begin // {
  mycid = 6;
end //}

//----------------------------------------------------------
// DUT probes

//---------------------
// Probes for ASI_DTLB_TAG_READ & ASI_DTLB_DATA_ACCESS followme

assign select_pc_b          = `PROBES6.select_pc_b;

assign dtlb_tid             = `SPC6.lsu.dcc.tid_b;
assign dtlb_va              = `SPC6.lsu_mmu_va_b;
assign dtlb_value           = `SPC6.lsu.tgd.ldxa_asi_data_b;

assign dtag_read_active     = {
                               ({4{`SPC6.lsu.dcc.dcc_tlb_tag_read_b &
                                  dtlb_tid[2] &
                               !`SPC6.lsu.lsu_illegal_inst_b & 
                               !`SPC6.tlu.fls1.dae_invalid_asi_w_in &
                               (!`SPC6.tlu_flush_lsu_b |`SPC6.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                               ({4{`SPC6.lsu.dcc.dcc_tlb_tag_read_b &
                                  !dtlb_tid[2] &
                                !`SPC6.lsu.lsu_illegal_inst_b & 
                                !`SPC6.tlu.fls0.dae_invalid_asi_w_in &                         
                                (!`SPC6.tlu_flush_lsu_b |`SPC6.tlu.fls0.va_watchpoint_w_in)}} &
                                (select_pc_b[3:0]))
                               };


assign d_data_access_active = {
                              ({4{`SPC6.lsu.dcc.dcc_tlb_data_read_b &
                                dtlb_tid[2] &
                               !`SPC6.lsu.lsu_illegal_inst_b & 
                               (!`SPC6.tlu_flush_lsu_b |`SPC6.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                              ({4{`SPC6.lsu.dcc.dcc_tlb_data_read_b &
                                 !dtlb_tid[2] &
                               !`SPC6.lsu.lsu_illegal_inst_b & 
                               (!`SPC6.tlu_flush_lsu_b |`SPC6.tlu.fls0.va_watchpoint_w_in)}} &
                               (select_pc_b[3:0]))
                              };

//---------------------
// Probes for ASI_ITLB_TAG_READ & ASI_ITLB_DATA_ACCESS followme

assign fetch_tid_f             = `SPC6.ifu_ftu.ftu_asi_ctl.indet_tid_f;

assign itag_read_active_bf     = `SPC6.ifu_ftu.ftu_ftp_ctl.ftp_itt_rd_req_bf;
assign i_data_access_active_bf = `SPC6.ifu_ftu.ftu_ftp_ctl.ftp_itd_rd_req_bf;

assign itlb_va_bf              = {24'b0,`SPC6.ifu_ftu.asi_addr_bf[39:3],3'b0};
assign itlb_value              = `SPC6.ifu_ftu.it_rd_data;  // [63:0]

//---------------------
// Probes for ASI_ITLB_PROBE followme

assign probe_active_bf  = `SPC6.ifu_ftu.ftp_ith_det_req_bf;
assign probe_tid_bf     = `SPC6.ifu_ftu.ftu_ftp_ctl.ith_det_thr_id;
assign probe_value      = `SPC6.ifu_ftu.it_rd_data;

//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC6.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //---------------------------------
  // Pipeline signals
  // Have to pipline these past where the TLB was accessed
  // to get the parity bits for follow me
  // Then we need to subtract 2 from the timestamp so get back 
  // get the correct time the tlb was accessed.

  itag_read_active_f     <= itag_read_active_bf;
  itag_read_active_c     <= itag_read_active_f;
  itag_read_active       <= itag_read_active_c;

  itlb_va_f              <= itlb_va_bf;
  itlb_va_c              <= itlb_va_f;
  itlb_va                <= itlb_va_c;

  fetch_tid_c            <= fetch_tid_f;
  fetch_tid              <= fetch_tid_c;
  i_data_access_active_f <= i_data_access_active_bf;
  i_data_access_active_c <= i_data_access_active_f;
  i_data_access_active   <= i_data_access_active_c;

  probe_active_f         <= probe_active_bf;
  probe_active_c         <= probe_active_f;
  probe_active           <= probe_active_c;
  probe_tid_f            <= probe_tid_bf;
  probe_tid_c            <= probe_tid_f;
  probe_tid              <= probe_tid_c;


  //---------------------------------
  //---------------------------------

  //---------------------------------
  // DTLB_TAG_READ_REG followme & sync
  if (dtag_read_active) begin // {
    myasi = 8'h5e;
    // Determine which thread is active

    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                           mytnum, myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum, tstamp - 1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // DTLB_DATA_ACCESS_REG followme & sync
  if (d_data_access_active) begin // {
    myasi = 8'h5d;
    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                          mytnum,myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}
  end // }

  //---------------------------------
  // ITLB_TAG_READ_REG followme & sync
  if (itag_read_active) begin // {
    myasi = 8'h56;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                          mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_DATA_ACCESS_REG followme & sync
  if (i_data_access_active) begin // {
    myasi = 8'h55;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_PROBE -  followme & sync
  if (probe_active) begin // {
    myasi = 8'h53;

    for (i=0; i<=7; i=i+1) begin // {
      if (probe_tid[i]==1'b1) begin // {
        mytid = i;
        mytnum = (mycid * 8) + mytid;
      end // }
    end // }

    // followme
   `PR_INFO ("pli_int", `INFO, 
               "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
               mycid,mytid,mytnum,myasi, itlb_va, probe_value, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, probe_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

end // always } 



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_7

module tlb_misc_c7();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "tlb_sync.vh"

//---------------------
// Signals for ASI_I/DTLB_TAG_READ followme
wire                 [7:0] select_pc_b;
wire                 [7:0] dtag_read_active;
wire                 [2:0] dtlb_tid;
wire                [63:0] dtlb_va;
wire                [63:0] dtlb_value;

wire                 [2:0] fetch_tid_f;
reg                  [2:0] fetch_tid_c;
reg                  [2:0] fetch_tid;
wire                 [7:0] itag_read_active_bf;
reg                  [7:0] itag_read_active_f;
reg                  [7:0] itag_read_active_c;
reg                  [7:0] itag_read_active;
wire                [63:0] itlb_va_bf;
reg                 [63:0] itlb_va_f;
reg                 [63:0] itlb_va_c;
reg                 [63:0] itlb_va;
wire                [63:0] itlb_value;

//---------------------
// Signals for ASI_I/DTLB_DATA_ACCESS followme
wire                 [7:0] d_data_access_active;

wire                 [7:0] i_data_access_active_bf;
reg                  [7:0] i_data_access_active_f;
reg                  [7:0] i_data_access_active_c;
reg                  [7:0] i_data_access_active;

//---------------------
// Signals for ASI_ITLB_PROBE followme
wire                       probe_active_bf;
reg                        probe_active_f;
reg                        probe_active_c;
reg                        probe_active;
wire                 [7:0] probe_tid_bf;
reg                  [7:0] probe_tid_f;
reg                  [7:0] probe_tid_c;
reg                  [7:0] probe_tid;
wire                [63:0] probe_value;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    i;
integer                    junk;

initial begin // {
  mycid = 7;
end //}

//----------------------------------------------------------
// DUT probes

//---------------------
// Probes for ASI_DTLB_TAG_READ & ASI_DTLB_DATA_ACCESS followme

assign select_pc_b          = `PROBES7.select_pc_b;

assign dtlb_tid             = `SPC7.lsu.dcc.tid_b;
assign dtlb_va              = `SPC7.lsu_mmu_va_b;
assign dtlb_value           = `SPC7.lsu.tgd.ldxa_asi_data_b;

assign dtag_read_active     = {
                               ({4{`SPC7.lsu.dcc.dcc_tlb_tag_read_b &
                                  dtlb_tid[2] &
                               !`SPC7.lsu.lsu_illegal_inst_b & 
                               !`SPC7.tlu.fls1.dae_invalid_asi_w_in &
                               (!`SPC7.tlu_flush_lsu_b |`SPC7.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                               ({4{`SPC7.lsu.dcc.dcc_tlb_tag_read_b &
                                  !dtlb_tid[2] &
                                !`SPC7.lsu.lsu_illegal_inst_b & 
                                !`SPC7.tlu.fls0.dae_invalid_asi_w_in &                         
                                (!`SPC7.tlu_flush_lsu_b |`SPC7.tlu.fls0.va_watchpoint_w_in)}} &
                                (select_pc_b[3:0]))
                               };


assign d_data_access_active = {
                              ({4{`SPC7.lsu.dcc.dcc_tlb_data_read_b &
                                dtlb_tid[2] &
                               !`SPC7.lsu.lsu_illegal_inst_b & 
                               (!`SPC7.tlu_flush_lsu_b |`SPC7.tlu.fls1.va_watchpoint_w_in)}} &
                               (select_pc_b[7:4])),
                              ({4{`SPC7.lsu.dcc.dcc_tlb_data_read_b &
                                 !dtlb_tid[2] &
                               !`SPC7.lsu.lsu_illegal_inst_b & 
                               (!`SPC7.tlu_flush_lsu_b |`SPC7.tlu.fls0.va_watchpoint_w_in)}} &
                               (select_pc_b[3:0]))
                              };

//---------------------
// Probes for ASI_ITLB_TAG_READ & ASI_ITLB_DATA_ACCESS followme

assign fetch_tid_f             = `SPC7.ifu_ftu.ftu_asi_ctl.indet_tid_f;

assign itag_read_active_bf     = `SPC7.ifu_ftu.ftu_ftp_ctl.ftp_itt_rd_req_bf;
assign i_data_access_active_bf = `SPC7.ifu_ftu.ftu_ftp_ctl.ftp_itd_rd_req_bf;

assign itlb_va_bf              = {24'b0,`SPC7.ifu_ftu.asi_addr_bf[39:3],3'b0};
assign itlb_value              = `SPC7.ifu_ftu.it_rd_data;  // [63:0]

//---------------------
// Probes for ASI_ITLB_PROBE followme

assign probe_active_bf  = `SPC7.ifu_ftu.ftp_ith_det_req_bf;
assign probe_tid_bf     = `SPC7.ifu_ftu.ftu_ftp_ctl.ith_det_thr_id;
assign probe_value      = `SPC7.ifu_ftu.it_rd_data;

//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC7.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //---------------------------------
  // Pipeline signals
  // Have to pipline these past where the TLB was accessed
  // to get the parity bits for follow me
  // Then we need to subtract 2 from the timestamp so get back 
  // get the correct time the tlb was accessed.

  itag_read_active_f     <= itag_read_active_bf;
  itag_read_active_c     <= itag_read_active_f;
  itag_read_active       <= itag_read_active_c;

  itlb_va_f              <= itlb_va_bf;
  itlb_va_c              <= itlb_va_f;
  itlb_va                <= itlb_va_c;

  fetch_tid_c            <= fetch_tid_f;
  fetch_tid              <= fetch_tid_c;
  i_data_access_active_f <= i_data_access_active_bf;
  i_data_access_active_c <= i_data_access_active_f;
  i_data_access_active   <= i_data_access_active_c;

  probe_active_f         <= probe_active_bf;
  probe_active_c         <= probe_active_f;
  probe_active           <= probe_active_c;
  probe_tid_f            <= probe_tid_bf;
  probe_tid_c            <= probe_tid_f;
  probe_tid              <= probe_tid_c;


  //---------------------------------
  //---------------------------------

  //---------------------------------
  // DTLB_TAG_READ_REG followme & sync
  if (dtag_read_active) begin // {
    myasi = 8'h5e;
    // Determine which thread is active

    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                           mytnum, myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum, tstamp - 1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // DTLB_DATA_ACCESS_REG followme & sync
  if (d_data_access_active) begin // {
    myasi = 8'h5d;
    mytid = dtlb_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, dtlb_va, dtlb_value, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
        junk = $sim_send(`PLI_ASI_READ,
                          mytnum,myasi, dtlb_va, dtlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-1);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-1, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: DTLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-1)*`TOP.core_period);
    end //}
  end // }

  //---------------------------------
  // ITLB_TAG_READ_REG followme & sync
  if (itag_read_active) begin // {
    myasi = 8'h56;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                          mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_DATA_ACCESS_REG followme & sync
  if (i_data_access_active) begin // {
    myasi = 8'h55;
    mytid = fetch_tid;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi, itlb_va, itlb_value, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, itlb_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp - 2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp - 2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

  //---------------------------------
  // ITLB_PROBE -  followme & sync
  if (probe_active) begin // {
    myasi = 8'h53;

    for (i=0; i<=7; i=i+1) begin // {
      if (probe_tid[i]==1'b1) begin // {
        mytid = i;
        mytnum = (mycid * 8) + mytid;
      end // }
    end // }

    // followme
   `PR_INFO ("pli_int", `INFO, 
               "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
               mycid,mytid,mytnum,myasi, itlb_va, probe_value, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, itlb_va, probe_value);
    end // }

    // tlb_sync
    `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_TLBLOOKUP tid=%d asi=%h ts=%0d",
                 mycid, mytid, mytnum, myasi, tstamp-2);
    if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
      junk = $sim_send(`PLI_TLBLOOKUP, mytnum,tstamp-2, myasi);
    end //}

    //--------------------
    if (`PARGS.show_tlb_on) begin // {
      $display ("SHOW_TLB: ITLB_LOOK  C%0d T%0d              asi=%h                                            ts=%0d",
                  mycid,mytid,myasi,(tstamp-2)*`TOP.core_period);
    end //}

  end // }

end // always } 



//----------------------------------------------------------
`endif
endmodule

`endif

//----------------------------------------------------------
//----------------------------------------------------------
