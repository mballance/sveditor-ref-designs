// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dtlb_rd.v
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

module dtlb_rd_c0 (

  mytg
);

`include "tlb_sync.vh"

input                      mytg;
`ifndef GATESIM

wire                       rd_vld;
wire                       rd_vld_b;
reg                        rd_vld_w;
reg                        rd_vld_w2;
reg                        rd_vld_w3;
reg      [(`TS_WIDTH-1):0] tstamp;

wire                 [3:0] select_pc_b;
reg                  [3:0] select_pc_w;
reg                  [3:0] select_pc_w2;
reg                  [3:0] select_pc_w3;
wire                [47:0] pc_b;
reg                 [47:0] pc_w;
reg                 [47:0] pc_w2;
reg                 [47:0] pc_w3;

wire                       irf_error_m;
wire                       irf_error_b;
reg                        irf_error_b_pre;

reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                        ready;

reg                  [2:0] bsktid;
reg                  [5:0] bsktnum;

integer                    i;
integer                    junk;
wire                       lsuErrorInB;

reg                 [7:0] dtlbReadActive;
wire                [7:0] blockStoreKill;

wire                [2:0] myLateErrTid = `SPC0.lsu_dcerr_tid_g[2:0];
wire                [5:0] myLateErrTnum = (mycid * 8) + myLateErrTid;

initial begin // {
    ready = 0;
    dtlbReadActive = 8'h0;

    @(posedge `SPC0.l2clk) ;
    @(posedge `SPC0.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 0;
end //}

//----------------------------------------------------------
// DUT probes


// I use this signal to get several standard errors in LSU that can happen
// that will cause a DTLB_READ, and use them to make sure they are not
// happening with perfom trap in the rd_vld_b signal
wire lsuErrorB;
assign lsuErrorB = (`SPC0.lsu.dcc.lsu_align_b           |
                    `SPC0.lsu.dcc.lsu_lddf_align_b      |
                    `SPC0.lsu.dcc.lsu_stdf_align_b      |
                    `SPC0.lsu.dcc.lsu_dae_invalid_asi_b |
                    `SPC0.lsu.dcc.lsu_dae_nc_page_b     |
                    `SPC0.lsu.dcc.lsu_dae_nfo_page_b    |
                    `SPC0.lsu.dcc.lsu_dae_priv_viol_b   |
                    `SPC0.lsu.dcc.lsu_dae_so_page       |
                    `SPC0.lsu.dcc.lsu_priv_action_b     |
                    `SPC0.lsu.dcc.lsu_va_watchpoint_b   |
                    `SPC0.lsu.dcc.lsu_pa_watchpoint_b   |
                    `SPC0.lsu.dcc.lsu_daccess_prot_b    |
                    `SPC0.lsu.dcc.lsu_dttp_err_b        |
                    `SPC0.lsu.dcc.lsu_dtdp_err_b        |
                    `SPC0.lsu.dcc.lsu_dtmh_err_b);


// Per tlb_sync spec, high priority (0-9) exceptions should not send DTLBREAD.
// tlu_flush_lsu_b - suppress DTLBREAD for high priority (0-9) exceptions.
// However, VA_watchpoint (TT=0x62, priority 11) also causes tlu_flush_lsu_b to be asserted.
// va_watchpoint_w_in was added to allow DTLBREAD to be sent even though tlu_flush_lsu_b fires.
// fgu_error_b - suppress DTLBREAD on FRF errors.
// irf_error_b - suppress DTLBREAD on IRF errors.

assign   select_pc_b = mytg ? `PROBES0.select_pc_b[7:4] : `PROBES0.select_pc_b[3:0];
assign   rd_vld_b = mytg ? 

               (`PROBES0.tlb_rd_vld_b && 
                !`PROBES0.tlb_bypass_b &&
                !`SPC0.lsu.lsu_illegal_inst_b &&
                !`SPC0.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC0.lsu_perfmon_trap_b & `SPC0.tlu.fls1.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC0.lsu.dcc.pipe_flush_b &&
                (!`SPC0.tlu_flush_lsu_b | `SPC0.tlu.fls1.va_watchpoint_w_in) &&
               `SPC0.tlu.fls1.lsu_inst_b && 
               (|select_pc_b)) :

               (`PROBES0.tlb_rd_vld_b && 
                !`PROBES0.tlb_bypass_b &&
                !`SPC0.lsu.lsu_illegal_inst_b && 
                !`SPC0.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC0.lsu_perfmon_trap_b & `SPC0.tlu.fls0.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC0.lsu.dcc.pipe_flush_b &&
                (!`SPC0.tlu_flush_lsu_b | `SPC0.tlu.fls0.va_watchpoint_w_in) &&
               `SPC0.tlu.fls0.lsu_inst_b && 
               (|select_pc_b));


assign   blockStoreKill = {`SPC0.lsu.sbs7.bst_kill,
                           `SPC0.lsu.sbs6.bst_kill,
                           `SPC0.lsu.sbs5.bst_kill,
                           `SPC0.lsu.sbs4.bst_kill,
                           `SPC0.lsu.sbs3.bst_kill,
                           `SPC0.lsu.sbs2.bst_kill,
                           `SPC0.lsu.sbs1.bst_kill,
                           `SPC0.lsu.sbs0.bst_kill};
                           





// suppress DTLBREAD on STB errors.
assign   rd_vld = rd_vld_w3 && 
                  !(`SPC0.lsu.lmc.sbdlc_err | `SPC0.lsu.lmc.sbdlu_err);

// suppress DTLBREAD on IRF errors
assign irf_error_m = (`SPC0.lsu.dcc.tid_m[2] ? `SPC0.exu_ecc_m[1] : `SPC0.exu_ecc_m[0]);
assign irf_error_b = irf_error_b_pre | 
                     ((`SPC0.lsu.dcc.tid_b[2] ? `SPC0.lsu.dcc.exu_ecc_m[1] : 
                                                      `SPC0.lsu.dcc.exu_ecc_m[0]) & 
                       `SPC0.lsu.dcc.twocycle_b &

        ~(`SPC0.lsu.dcc.lsu_align_b           |
          `SPC0.lsu.dcc.lsu_lddf_align_b      |
          `SPC0.lsu.dcc.lsu_stdf_align_b      |
          `SPC0.lsu.dcc.lsu_dae_invalid_asi_b |
          `SPC0.lsu.dcc.lsu_dae_nc_page_b     |
          `SPC0.lsu.dcc.lsu_dae_nfo_page_b    |
          `SPC0.lsu.dcc.lsu_dae_priv_viol_b   |
          `SPC0.lsu.dcc.lsu_dae_so_page       |
          `SPC0.lsu.dcc.lsu_priv_action_b     |
          `SPC0.lsu.dcc.lsu_va_watchpoint_b   |
          `SPC0.lsu.dcc.lsu_pa_watchpoint_b   |
          ~`SPC0.lsu.dcc.lsu_tlb_miss_b_      |
          `SPC0.lsu.dcc.lsu_daccess_prot_b    |
          `SPC0.lsu.dcc.lsu_dttp_err_b        |
          `SPC0.lsu.dcc.lsu_dtdp_err_b        |
          `SPC0.lsu.dcc.lsu_dtmh_err_b));



assign pc_b   = mytg ? `PROBES0.pc_1_b :
                       `PROBES0.pc_0_b;

//----------------------------------------------------------
//  Send Command to NAS

always @ (posedge `SPC0.l2clk & ready) begin // {   

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    irf_error_b_pre <= 0;

    rd_vld_w     <= 0;
    rd_vld_w2    <= 0;
    rd_vld_w3    <= 0;

    select_pc_w  <= 0;
    select_pc_w2 <= 0;
    select_pc_w3 <= 0;

    pc_w         <= 0;
    pc_w2        <= 0;
    pc_w3        <= 0;

  end // }
  else begin // {

    tstamp         = `TOP.core_cycle_cnt;

    irf_error_b_pre <= irf_error_m;

    rd_vld_w     <= rd_vld_b;
    rd_vld_w2    <= rd_vld_w;
    rd_vld_w3    <= rd_vld_w2;

    select_pc_w  <= select_pc_b;
    select_pc_w2 <= select_pc_w;
    select_pc_w3 <= select_pc_w2;

    pc_w         <= pc_b;
    pc_w2        <= pc_w;
    pc_w3        <= pc_w2;

    //---------------------------------
    if (rd_vld) begin // {

      // Determine which thread is active
      for (i=0; i<=3; i=i+1) begin // {
        if (select_pc_w3[i]==1'b1) begin // {
          mytid = i + (mytg*4);
          mytnum = (mycid * 8) + mytid;
        end // }
      end // }


      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD  tid=%d pc=%h ts=%0d",
                             mycid,mytid,mytnum,pc_w3,tstamp-5);
        junk = $sim_send(`PLI_DTLBREAD, mytnum, tstamp-5);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                      mycid,mytid,pc_w3,(tstamp-5)*`TOP.core_period);
        end //}

      end //}

    end // }
  end // in_reset}

end // always }


//---------------------------------------------------------
// DTLB POP state machine
 
always @ (posedge `SPC0.l2clk & ready) begin // { 

  // if POR|WMR, then no TLBread
  if (!`TOP.in_reset_core) begin // {

    //Set read active when there is a valid lookup
    if (rd_vld_b) begin // { 
      dtlbReadActive[`SPC0.lsu.dcc.tid_b[2:0]] <= 1'h1;
    end //}

    //Clear it when there is a bypass
    if ((`SPC0.lsu.dcc.ld_inst_vld_b | 
         `SPC0.lsu.dcc.st_inst_vld_b) &
         `SPC0.lsu.dcc.tlb_bypass_b & 
        ~`SPC0.lsu.dcc.flush_all_b) begin // { 
      dtlbReadActive[`SPC0.lsu.dcc.tid_b[2:0]] <= 1'h0;
    end //}

    //Do a pop if we are active and then see a Perf Mon
    if ((`SPC0.lsu_perfmon_trap_g |
         `SPC0.lsu_dcl2u_err_g |
         `SPC0.lsu_dcl2nd_err_g) &
        dtlbReadActive[`SPC0.lsu_dcerr_tid_g[2:0]]) begin // { 
      dtlbReadActive[`SPC0.lsu_dcerr_tid_g[2:0]] = 1'h0;

      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                             mycid,myLateErrTid,myLateErrTnum,tstamp);
        junk = $sim_send(`PLI_DTLBREAD_POP, myLateErrTnum, tstamp);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                      mycid,mytid,tstamp*`TOP.core_period);
        end //}  
      end //}
    end //}

    // Determine which thread is active
    for (i=0; i<=3; i=i+1) begin // {
      bsktid = i + (mytg*4);
      bsktnum = (mycid * 8) + bsktid;

      //Do a pop if we see a block storke kill
      if (blockStoreKill[bsktid] &
          dtlbReadActive[bsktid]) begin // {
        dtlbReadActive[bsktid] = 1'h0;

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                              mycid,bsktid,bsktnum,tstamp);
          junk = $sim_send(`PLI_DTLBREAD_POP, bsktnum, tstamp);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                        mycid,bsktid,tstamp*`TOP.core_period);
          end //}  
        end // }
      end // }

    end // for }

  end // in_reset}
end // always}



//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_1

module dtlb_rd_c1 (

  mytg
);

`include "tlb_sync.vh"

input                      mytg;
`ifndef GATESIM

wire                       rd_vld;
wire                       rd_vld_b;
reg                        rd_vld_w;
reg                        rd_vld_w2;
reg                        rd_vld_w3;
reg      [(`TS_WIDTH-1):0] tstamp;

wire                 [3:0] select_pc_b;
reg                  [3:0] select_pc_w;
reg                  [3:0] select_pc_w2;
reg                  [3:0] select_pc_w3;
wire                [47:0] pc_b;
reg                 [47:0] pc_w;
reg                 [47:0] pc_w2;
reg                 [47:0] pc_w3;

wire                       irf_error_m;
wire                       irf_error_b;
reg                        irf_error_b_pre;

reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                        ready;

reg                  [2:0] bsktid;
reg                  [5:0] bsktnum;

integer                    i;
integer                    junk;
wire                       lsuErrorInB;

reg                 [7:0] dtlbReadActive;
wire                [7:0] blockStoreKill;

wire                [2:0] myLateErrTid = `SPC1.lsu_dcerr_tid_g[2:0];
wire                [5:0] myLateErrTnum = (mycid * 8) + myLateErrTid;

initial begin // {
    ready = 0;
    dtlbReadActive = 8'h0;

    @(posedge `SPC1.l2clk) ;
    @(posedge `SPC1.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 1;
end //}

//----------------------------------------------------------
// DUT probes


// I use this signal to get several standard errors in LSU that can happen
// that will cause a DTLB_READ, and use them to make sure they are not
// happening with perfom trap in the rd_vld_b signal
assign lsuErrorB = (`SPC1.lsu.dcc.lsu_align_b           |
                    `SPC1.lsu.dcc.lsu_lddf_align_b      |
                    `SPC1.lsu.dcc.lsu_stdf_align_b      |
                    `SPC1.lsu.dcc.lsu_dae_invalid_asi_b |
                    `SPC1.lsu.dcc.lsu_dae_nc_page_b     |
                    `SPC1.lsu.dcc.lsu_dae_nfo_page_b    |
                    `SPC1.lsu.dcc.lsu_dae_priv_viol_b   |
                    `SPC1.lsu.dcc.lsu_dae_so_page       |
                    `SPC1.lsu.dcc.lsu_priv_action_b     |
                    `SPC1.lsu.dcc.lsu_va_watchpoint_b   |
                    `SPC1.lsu.dcc.lsu_pa_watchpoint_b   |
                    `SPC1.lsu.dcc.lsu_daccess_prot_b    |
                    `SPC1.lsu.dcc.lsu_dttp_err_b        |
                    `SPC1.lsu.dcc.lsu_dtdp_err_b        |
                    `SPC1.lsu.dcc.lsu_dtmh_err_b);


// Per tlb_sync spec, high priority (0-9) exceptions should not send DTLBREAD.
// tlu_flush_lsu_b - suppress DTLBREAD for high priority (0-9) exceptions.
// However, VA_watchpoint (TT=0x62, priority 11) also causes tlu_flush_lsu_b to be asserted.
// va_watchpoint_w_in was added to allow DTLBREAD to be sent even though tlu_flush_lsu_b fires.
// fgu_error_b - suppress DTLBREAD on FRF errors.
// irf_error_b - suppress DTLBREAD on IRF errors.

assign   select_pc_b = mytg ? `PROBES1.select_pc_b[7:4] : `PROBES1.select_pc_b[3:0];
assign   rd_vld_b = mytg ? 

               (`PROBES1.tlb_rd_vld_b && 
                !`PROBES1.tlb_bypass_b &&
                !`SPC1.lsu.lsu_illegal_inst_b &&
                !`SPC1.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC1.lsu_perfmon_trap_b & `SPC1.tlu.fls1.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC1.lsu.dcc.pipe_flush_b &&
                (!`SPC1.tlu_flush_lsu_b | `SPC1.tlu.fls1.va_watchpoint_w_in) &&
               `SPC1.tlu.fls1.lsu_inst_b && 
               (|select_pc_b)) :

               (`PROBES1.tlb_rd_vld_b && 
                !`PROBES1.tlb_bypass_b &&
                !`SPC1.lsu.lsu_illegal_inst_b && 
                !`SPC1.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC1.lsu_perfmon_trap_b & `SPC1.tlu.fls0.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC1.lsu.dcc.pipe_flush_b &&
                (!`SPC1.tlu_flush_lsu_b | `SPC1.tlu.fls0.va_watchpoint_w_in) &&
               `SPC1.tlu.fls0.lsu_inst_b && 
               (|select_pc_b));


assign   blockStoreKill = {`SPC1.lsu.sbs7.bst_kill,
                           `SPC1.lsu.sbs6.bst_kill,
                           `SPC1.lsu.sbs5.bst_kill,
                           `SPC1.lsu.sbs4.bst_kill,
                           `SPC1.lsu.sbs3.bst_kill,
                           `SPC1.lsu.sbs2.bst_kill,
                           `SPC1.lsu.sbs1.bst_kill,
                           `SPC1.lsu.sbs0.bst_kill};
                           





// suppress DTLBREAD on STB errors.
assign   rd_vld = rd_vld_w3 && 
                  !(`SPC1.lsu.lmc.sbdlc_err | `SPC1.lsu.lmc.sbdlu_err);

// suppress DTLBREAD on IRF errors
assign irf_error_m = (`SPC1.lsu.dcc.tid_m[2] ? `SPC1.exu_ecc_m[1] : `SPC1.exu_ecc_m[0]);
assign irf_error_b = irf_error_b_pre | 
                     ((`SPC1.lsu.dcc.tid_b[2] ? `SPC1.lsu.dcc.exu_ecc_m[1] : 
                                                      `SPC1.lsu.dcc.exu_ecc_m[0]) & 
                       `SPC1.lsu.dcc.twocycle_b &

        ~(`SPC1.lsu.dcc.lsu_align_b           |
          `SPC1.lsu.dcc.lsu_lddf_align_b      |
          `SPC1.lsu.dcc.lsu_stdf_align_b      |
          `SPC1.lsu.dcc.lsu_dae_invalid_asi_b |
          `SPC1.lsu.dcc.lsu_dae_nc_page_b     |
          `SPC1.lsu.dcc.lsu_dae_nfo_page_b    |
          `SPC1.lsu.dcc.lsu_dae_priv_viol_b   |
          `SPC1.lsu.dcc.lsu_dae_so_page       |
          `SPC1.lsu.dcc.lsu_priv_action_b     |
          `SPC1.lsu.dcc.lsu_va_watchpoint_b   |
          `SPC1.lsu.dcc.lsu_pa_watchpoint_b   |
          ~`SPC1.lsu.dcc.lsu_tlb_miss_b_      |
          `SPC1.lsu.dcc.lsu_daccess_prot_b    |
          `SPC1.lsu.dcc.lsu_dttp_err_b        |
          `SPC1.lsu.dcc.lsu_dtdp_err_b        |
          `SPC1.lsu.dcc.lsu_dtmh_err_b));



assign pc_b   = mytg ? `PROBES1.pc_1_b :
                       `PROBES1.pc_0_b;

//----------------------------------------------------------
//  Send Command to NAS

always @ (posedge `SPC1.l2clk & ready) begin // {   

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    irf_error_b_pre <= 0;

    rd_vld_w     <= 0;
    rd_vld_w2    <= 0;
    rd_vld_w3    <= 0;

    select_pc_w  <= 0;
    select_pc_w2 <= 0;
    select_pc_w3 <= 0;

    pc_w         <= 0;
    pc_w2        <= 0;
    pc_w3        <= 0;

  end // }
  else begin // {

    tstamp         = `TOP.core_cycle_cnt;

    irf_error_b_pre <= irf_error_m;

    rd_vld_w     <= rd_vld_b;
    rd_vld_w2    <= rd_vld_w;
    rd_vld_w3    <= rd_vld_w2;

    select_pc_w  <= select_pc_b;
    select_pc_w2 <= select_pc_w;
    select_pc_w3 <= select_pc_w2;

    pc_w         <= pc_b;
    pc_w2        <= pc_w;
    pc_w3        <= pc_w2;

    //---------------------------------
    if (rd_vld) begin // {

      // Determine which thread is active
      for (i=0; i<=3; i=i+1) begin // {
        if (select_pc_w3[i]==1'b1) begin // {
          mytid = i + (mytg*4);
          mytnum = (mycid * 8) + mytid;
        end // }
      end // }


      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD  tid=%d pc=%h ts=%0d",
                             mycid,mytid,mytnum,pc_w3,tstamp-5);
        junk = $sim_send(`PLI_DTLBREAD, mytnum, tstamp-5);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                      mycid,mytid,pc_w3,(tstamp-5)*`TOP.core_period);
        end //}

      end //}

    end // }
  end // in_reset}

end // always }


//---------------------------------------------------------
// DTLB POP state machine
 
always @ (posedge `SPC1.l2clk & ready) begin // { 

  // if POR|WMR, then no TLBread
  if (!`TOP.in_reset_core) begin // {

    //Set read active when there is a valid lookup
    if (rd_vld_b) begin // { 
      dtlbReadActive[`SPC1.lsu.dcc.tid_b[2:0]] <= 1'h1;
    end //}

    //Clear it when there is a bypass
    if ((`SPC1.lsu.dcc.ld_inst_vld_b | 
         `SPC1.lsu.dcc.st_inst_vld_b) &
         `SPC1.lsu.dcc.tlb_bypass_b & 
        ~`SPC1.lsu.dcc.flush_all_b) begin // { 
      dtlbReadActive[`SPC1.lsu.dcc.tid_b[2:0]] <= 1'h0;
    end //}

    //Do a pop if we are active and then see a Perf Mon
    if ((`SPC1.lsu_perfmon_trap_g |
         `SPC1.lsu_dcl2u_err_g |
         `SPC1.lsu_dcl2nd_err_g) &
        dtlbReadActive[`SPC1.lsu_dcerr_tid_g[2:0]]) begin // { 
      dtlbReadActive[`SPC1.lsu_dcerr_tid_g[2:0]] = 1'h0;

      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                             mycid,myLateErrTid,myLateErrTnum,tstamp);
        junk = $sim_send(`PLI_DTLBREAD_POP, myLateErrTnum, tstamp);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                      mycid,mytid,tstamp*`TOP.core_period);
        end //}  
      end //}
    end //}

    // Determine which thread is active
    for (i=0; i<=3; i=i+1) begin // {
      bsktid = i + (mytg*4);
      bsktnum = (mycid * 8) + bsktid;

      //Do a pop if we see a block storke kill
      if (blockStoreKill[bsktid] &
          dtlbReadActive[bsktid]) begin // {
        dtlbReadActive[bsktid] = 1'h0;

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                              mycid,bsktid,bsktnum,tstamp);
          junk = $sim_send(`PLI_DTLBREAD_POP, bsktnum, tstamp);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                        mycid,bsktid,tstamp*`TOP.core_period);
          end //}  
        end // }
      end // }

    end // for }

  end // in_reset}
end // always}



//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_2

module dtlb_rd_c2 (

  mytg
);

`include "tlb_sync.vh"

input                      mytg;
`ifndef GATESIM

wire                       rd_vld;
wire                       rd_vld_b;
reg                        rd_vld_w;
reg                        rd_vld_w2;
reg                        rd_vld_w3;
reg      [(`TS_WIDTH-1):0] tstamp;

wire                 [3:0] select_pc_b;
reg                  [3:0] select_pc_w;
reg                  [3:0] select_pc_w2;
reg                  [3:0] select_pc_w3;
wire                [47:0] pc_b;
reg                 [47:0] pc_w;
reg                 [47:0] pc_w2;
reg                 [47:0] pc_w3;

wire                       irf_error_m;
wire                       irf_error_b;
reg                        irf_error_b_pre;

reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                        ready;

reg                  [2:0] bsktid;
reg                  [5:0] bsktnum;

integer                    i;
integer                    junk;
wire                       lsuErrorInB;

reg                 [7:0] dtlbReadActive;
wire                [7:0] blockStoreKill;

wire                [2:0] myLateErrTid = `SPC2.lsu_dcerr_tid_g[2:0];
wire                [5:0] myLateErrTnum = (mycid * 8) + myLateErrTid;

initial begin // {
    ready = 0;
    dtlbReadActive = 8'h0;

    @(posedge `SPC2.l2clk) ;
    @(posedge `SPC2.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 2;
end //}

//----------------------------------------------------------
// DUT probes


// I use this signal to get several standard errors in LSU that can happen
// that will cause a DTLB_READ, and use them to make sure they are not
// happening with perfom trap in the rd_vld_b signal
assign lsuErrorB = (`SPC2.lsu.dcc.lsu_align_b           |
                    `SPC2.lsu.dcc.lsu_lddf_align_b      |
                    `SPC2.lsu.dcc.lsu_stdf_align_b      |
                    `SPC2.lsu.dcc.lsu_dae_invalid_asi_b |
                    `SPC2.lsu.dcc.lsu_dae_nc_page_b     |
                    `SPC2.lsu.dcc.lsu_dae_nfo_page_b    |
                    `SPC2.lsu.dcc.lsu_dae_priv_viol_b   |
                    `SPC2.lsu.dcc.lsu_dae_so_page       |
                    `SPC2.lsu.dcc.lsu_priv_action_b     |
                    `SPC2.lsu.dcc.lsu_va_watchpoint_b   |
                    `SPC2.lsu.dcc.lsu_pa_watchpoint_b   |
                    `SPC2.lsu.dcc.lsu_daccess_prot_b    |
                    `SPC2.lsu.dcc.lsu_dttp_err_b        |
                    `SPC2.lsu.dcc.lsu_dtdp_err_b        |
                    `SPC2.lsu.dcc.lsu_dtmh_err_b);


// Per tlb_sync spec, high priority (0-9) exceptions should not send DTLBREAD.
// tlu_flush_lsu_b - suppress DTLBREAD for high priority (0-9) exceptions.
// However, VA_watchpoint (TT=0x62, priority 11) also causes tlu_flush_lsu_b to be asserted.
// va_watchpoint_w_in was added to allow DTLBREAD to be sent even though tlu_flush_lsu_b fires.
// fgu_error_b - suppress DTLBREAD on FRF errors.
// irf_error_b - suppress DTLBREAD on IRF errors.

assign   select_pc_b = mytg ? `PROBES2.select_pc_b[7:4] : `PROBES2.select_pc_b[3:0];
assign   rd_vld_b = mytg ? 

               (`PROBES2.tlb_rd_vld_b && 
                !`PROBES2.tlb_bypass_b &&
                !`SPC2.lsu.lsu_illegal_inst_b &&
                !`SPC2.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC2.lsu_perfmon_trap_b & `SPC2.tlu.fls1.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC2.lsu.dcc.pipe_flush_b &&
                (!`SPC2.tlu_flush_lsu_b | `SPC2.tlu.fls1.va_watchpoint_w_in) &&
               `SPC2.tlu.fls1.lsu_inst_b && 
               (|select_pc_b)) :

               (`PROBES2.tlb_rd_vld_b && 
                !`PROBES2.tlb_bypass_b &&
                !`SPC2.lsu.lsu_illegal_inst_b && 
                !`SPC2.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC2.lsu_perfmon_trap_b & `SPC2.tlu.fls0.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC2.lsu.dcc.pipe_flush_b &&
                (!`SPC2.tlu_flush_lsu_b | `SPC2.tlu.fls0.va_watchpoint_w_in) &&
               `SPC2.tlu.fls0.lsu_inst_b && 
               (|select_pc_b));


assign   blockStoreKill = {`SPC2.lsu.sbs7.bst_kill,
                           `SPC2.lsu.sbs6.bst_kill,
                           `SPC2.lsu.sbs5.bst_kill,
                           `SPC2.lsu.sbs4.bst_kill,
                           `SPC2.lsu.sbs3.bst_kill,
                           `SPC2.lsu.sbs2.bst_kill,
                           `SPC2.lsu.sbs1.bst_kill,
                           `SPC2.lsu.sbs0.bst_kill};
                           





// suppress DTLBREAD on STB errors.
assign   rd_vld = rd_vld_w3 && 
                  !(`SPC2.lsu.lmc.sbdlc_err | `SPC2.lsu.lmc.sbdlu_err);

// suppress DTLBREAD on IRF errors
assign irf_error_m = (`SPC2.lsu.dcc.tid_m[2] ? `SPC2.exu_ecc_m[1] : `SPC2.exu_ecc_m[0]);
assign irf_error_b = irf_error_b_pre | 
                     ((`SPC2.lsu.dcc.tid_b[2] ? `SPC2.lsu.dcc.exu_ecc_m[1] : 
                                                      `SPC2.lsu.dcc.exu_ecc_m[0]) & 
                       `SPC2.lsu.dcc.twocycle_b &

        ~(`SPC2.lsu.dcc.lsu_align_b           |
          `SPC2.lsu.dcc.lsu_lddf_align_b      |
          `SPC2.lsu.dcc.lsu_stdf_align_b      |
          `SPC2.lsu.dcc.lsu_dae_invalid_asi_b |
          `SPC2.lsu.dcc.lsu_dae_nc_page_b     |
          `SPC2.lsu.dcc.lsu_dae_nfo_page_b    |
          `SPC2.lsu.dcc.lsu_dae_priv_viol_b   |
          `SPC2.lsu.dcc.lsu_dae_so_page       |
          `SPC2.lsu.dcc.lsu_priv_action_b     |
          `SPC2.lsu.dcc.lsu_va_watchpoint_b   |
          `SPC2.lsu.dcc.lsu_pa_watchpoint_b   |
          ~`SPC2.lsu.dcc.lsu_tlb_miss_b_      |
          `SPC2.lsu.dcc.lsu_daccess_prot_b    |
          `SPC2.lsu.dcc.lsu_dttp_err_b        |
          `SPC2.lsu.dcc.lsu_dtdp_err_b        |
          `SPC2.lsu.dcc.lsu_dtmh_err_b));



assign pc_b   = mytg ? `PROBES2.pc_1_b :
                       `PROBES2.pc_0_b;

//----------------------------------------------------------
//  Send Command to NAS

always @ (posedge `SPC2.l2clk & ready) begin // {   

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    irf_error_b_pre <= 0;

    rd_vld_w     <= 0;
    rd_vld_w2    <= 0;
    rd_vld_w3    <= 0;

    select_pc_w  <= 0;
    select_pc_w2 <= 0;
    select_pc_w3 <= 0;

    pc_w         <= 0;
    pc_w2        <= 0;
    pc_w3        <= 0;

  end // }
  else begin // {

    tstamp         = `TOP.core_cycle_cnt;

    irf_error_b_pre <= irf_error_m;

    rd_vld_w     <= rd_vld_b;
    rd_vld_w2    <= rd_vld_w;
    rd_vld_w3    <= rd_vld_w2;

    select_pc_w  <= select_pc_b;
    select_pc_w2 <= select_pc_w;
    select_pc_w3 <= select_pc_w2;

    pc_w         <= pc_b;
    pc_w2        <= pc_w;
    pc_w3        <= pc_w2;

    //---------------------------------
    if (rd_vld) begin // {

      // Determine which thread is active
      for (i=0; i<=3; i=i+1) begin // {
        if (select_pc_w3[i]==1'b1) begin // {
          mytid = i + (mytg*4);
          mytnum = (mycid * 8) + mytid;
        end // }
      end // }


      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD  tid=%d pc=%h ts=%0d",
                             mycid,mytid,mytnum,pc_w3,tstamp-5);
        junk = $sim_send(`PLI_DTLBREAD, mytnum, tstamp-5);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                      mycid,mytid,pc_w3,(tstamp-5)*`TOP.core_period);
        end //}

      end //}

    end // }
  end // in_reset}

end // always }


//---------------------------------------------------------
// DTLB POP state machine
 
always @ (posedge `SPC2.l2clk & ready) begin // { 

  // if POR|WMR, then no TLBread
  if (!`TOP.in_reset_core) begin // {

    //Set read active when there is a valid lookup
    if (rd_vld_b) begin // { 
      dtlbReadActive[`SPC2.lsu.dcc.tid_b[2:0]] <= 1'h1;
    end //}

    //Clear it when there is a bypass
    if ((`SPC2.lsu.dcc.ld_inst_vld_b | 
         `SPC2.lsu.dcc.st_inst_vld_b) &
         `SPC2.lsu.dcc.tlb_bypass_b & 
        ~`SPC2.lsu.dcc.flush_all_b) begin // { 
      dtlbReadActive[`SPC2.lsu.dcc.tid_b[2:0]] <= 1'h0;
    end //}

    //Do a pop if we are active and then see a Perf Mon
    if ((`SPC2.lsu_perfmon_trap_g |
         `SPC2.lsu_dcl2u_err_g |
         `SPC2.lsu_dcl2nd_err_g) &
        dtlbReadActive[`SPC2.lsu_dcerr_tid_g[2:0]]) begin // { 
      dtlbReadActive[`SPC2.lsu_dcerr_tid_g[2:0]] = 1'h0;

      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                             mycid,myLateErrTid,myLateErrTnum,tstamp);
        junk = $sim_send(`PLI_DTLBREAD_POP, myLateErrTnum, tstamp);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                      mycid,mytid,tstamp*`TOP.core_period);
        end //}  
      end //}
    end //}

    // Determine which thread is active
    for (i=0; i<=3; i=i+1) begin // {
      bsktid = i + (mytg*4);
      bsktnum = (mycid * 8) + bsktid;

      //Do a pop if we see a block storke kill
      if (blockStoreKill[bsktid] &
          dtlbReadActive[bsktid]) begin // {
        dtlbReadActive[bsktid] = 1'h0;

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                              mycid,bsktid,bsktnum,tstamp);
          junk = $sim_send(`PLI_DTLBREAD_POP, bsktnum, tstamp);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                        mycid,bsktid,tstamp*`TOP.core_period);
          end //}  
        end // }
      end // }

    end // for }

  end // in_reset}
end // always}



//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_3

module dtlb_rd_c3 (

  mytg
);

`include "tlb_sync.vh"

input                      mytg;
`ifndef GATESIM

wire                       rd_vld;
wire                       rd_vld_b;
reg                        rd_vld_w;
reg                        rd_vld_w2;
reg                        rd_vld_w3;
reg      [(`TS_WIDTH-1):0] tstamp;

wire                 [3:0] select_pc_b;
reg                  [3:0] select_pc_w;
reg                  [3:0] select_pc_w2;
reg                  [3:0] select_pc_w3;
wire                [47:0] pc_b;
reg                 [47:0] pc_w;
reg                 [47:0] pc_w2;
reg                 [47:0] pc_w3;

wire                       irf_error_m;
wire                       irf_error_b;
reg                        irf_error_b_pre;

reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                        ready;

reg                  [2:0] bsktid;
reg                  [5:0] bsktnum;

integer                    i;
integer                    junk;
wire                       lsuErrorInB;

reg                 [7:0] dtlbReadActive;
wire                [7:0] blockStoreKill;

wire                [2:0] myLateErrTid = `SPC3.lsu_dcerr_tid_g[2:0];
wire                [5:0] myLateErrTnum = (mycid * 8) + myLateErrTid;

initial begin // {
    ready = 0;
    dtlbReadActive = 8'h0;

    @(posedge `SPC3.l2clk) ;
    @(posedge `SPC3.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 3;
end //}

//----------------------------------------------------------
// DUT probes


// I use this signal to get several standard errors in LSU that can happen
// that will cause a DTLB_READ, and use them to make sure they are not
// happening with perfom trap in the rd_vld_b signal
assign lsuErrorB = (`SPC3.lsu.dcc.lsu_align_b           |
                    `SPC3.lsu.dcc.lsu_lddf_align_b      |
                    `SPC3.lsu.dcc.lsu_stdf_align_b      |
                    `SPC3.lsu.dcc.lsu_dae_invalid_asi_b |
                    `SPC3.lsu.dcc.lsu_dae_nc_page_b     |
                    `SPC3.lsu.dcc.lsu_dae_nfo_page_b    |
                    `SPC3.lsu.dcc.lsu_dae_priv_viol_b   |
                    `SPC3.lsu.dcc.lsu_dae_so_page       |
                    `SPC3.lsu.dcc.lsu_priv_action_b     |
                    `SPC3.lsu.dcc.lsu_va_watchpoint_b   |
                    `SPC3.lsu.dcc.lsu_pa_watchpoint_b   |
                    `SPC3.lsu.dcc.lsu_daccess_prot_b    |
                    `SPC3.lsu.dcc.lsu_dttp_err_b        |
                    `SPC3.lsu.dcc.lsu_dtdp_err_b        |
                    `SPC3.lsu.dcc.lsu_dtmh_err_b);


// Per tlb_sync spec, high priority (0-9) exceptions should not send DTLBREAD.
// tlu_flush_lsu_b - suppress DTLBREAD for high priority (0-9) exceptions.
// However, VA_watchpoint (TT=0x62, priority 11) also causes tlu_flush_lsu_b to be asserted.
// va_watchpoint_w_in was added to allow DTLBREAD to be sent even though tlu_flush_lsu_b fires.
// fgu_error_b - suppress DTLBREAD on FRF errors.
// irf_error_b - suppress DTLBREAD on IRF errors.

assign   select_pc_b = mytg ? `PROBES3.select_pc_b[7:4] : `PROBES3.select_pc_b[3:0];
assign   rd_vld_b = mytg ? 

               (`PROBES3.tlb_rd_vld_b && 
                !`PROBES3.tlb_bypass_b &&
                !`SPC3.lsu.lsu_illegal_inst_b &&
                !`SPC3.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC3.lsu_perfmon_trap_b & `SPC3.tlu.fls1.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC3.lsu.dcc.pipe_flush_b &&
                (!`SPC3.tlu_flush_lsu_b | `SPC3.tlu.fls1.va_watchpoint_w_in) &&
               `SPC3.tlu.fls1.lsu_inst_b && 
               (|select_pc_b)) :

               (`PROBES3.tlb_rd_vld_b && 
                !`PROBES3.tlb_bypass_b &&
                !`SPC3.lsu.lsu_illegal_inst_b && 
                !`SPC3.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC3.lsu_perfmon_trap_b & `SPC3.tlu.fls0.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC3.lsu.dcc.pipe_flush_b &&
                (!`SPC3.tlu_flush_lsu_b | `SPC3.tlu.fls0.va_watchpoint_w_in) &&
               `SPC3.tlu.fls0.lsu_inst_b && 
               (|select_pc_b));


assign   blockStoreKill = {`SPC3.lsu.sbs7.bst_kill,
                           `SPC3.lsu.sbs6.bst_kill,
                           `SPC3.lsu.sbs5.bst_kill,
                           `SPC3.lsu.sbs4.bst_kill,
                           `SPC3.lsu.sbs3.bst_kill,
                           `SPC3.lsu.sbs2.bst_kill,
                           `SPC3.lsu.sbs1.bst_kill,
                           `SPC3.lsu.sbs0.bst_kill};
                           





// suppress DTLBREAD on STB errors.
assign   rd_vld = rd_vld_w3 && 
                  !(`SPC3.lsu.lmc.sbdlc_err | `SPC3.lsu.lmc.sbdlu_err);

// suppress DTLBREAD on IRF errors
assign irf_error_m = (`SPC3.lsu.dcc.tid_m[2] ? `SPC3.exu_ecc_m[1] : `SPC3.exu_ecc_m[0]);
assign irf_error_b = irf_error_b_pre | 
                     ((`SPC3.lsu.dcc.tid_b[2] ? `SPC3.lsu.dcc.exu_ecc_m[1] : 
                                                      `SPC3.lsu.dcc.exu_ecc_m[0]) & 
                       `SPC3.lsu.dcc.twocycle_b &

        ~(`SPC3.lsu.dcc.lsu_align_b           |
          `SPC3.lsu.dcc.lsu_lddf_align_b      |
          `SPC3.lsu.dcc.lsu_stdf_align_b      |
          `SPC3.lsu.dcc.lsu_dae_invalid_asi_b |
          `SPC3.lsu.dcc.lsu_dae_nc_page_b     |
          `SPC3.lsu.dcc.lsu_dae_nfo_page_b    |
          `SPC3.lsu.dcc.lsu_dae_priv_viol_b   |
          `SPC3.lsu.dcc.lsu_dae_so_page       |
          `SPC3.lsu.dcc.lsu_priv_action_b     |
          `SPC3.lsu.dcc.lsu_va_watchpoint_b   |
          `SPC3.lsu.dcc.lsu_pa_watchpoint_b   |
          ~`SPC3.lsu.dcc.lsu_tlb_miss_b_      |
          `SPC3.lsu.dcc.lsu_daccess_prot_b    |
          `SPC3.lsu.dcc.lsu_dttp_err_b        |
          `SPC3.lsu.dcc.lsu_dtdp_err_b        |
          `SPC3.lsu.dcc.lsu_dtmh_err_b));



assign pc_b   = mytg ? `PROBES3.pc_1_b :
                       `PROBES3.pc_0_b;

//----------------------------------------------------------
//  Send Command to NAS

always @ (posedge `SPC3.l2clk & ready) begin // {   

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    irf_error_b_pre <= 0;

    rd_vld_w     <= 0;
    rd_vld_w2    <= 0;
    rd_vld_w3    <= 0;

    select_pc_w  <= 0;
    select_pc_w2 <= 0;
    select_pc_w3 <= 0;

    pc_w         <= 0;
    pc_w2        <= 0;
    pc_w3        <= 0;

  end // }
  else begin // {

    tstamp         = `TOP.core_cycle_cnt;

    irf_error_b_pre <= irf_error_m;

    rd_vld_w     <= rd_vld_b;
    rd_vld_w2    <= rd_vld_w;
    rd_vld_w3    <= rd_vld_w2;

    select_pc_w  <= select_pc_b;
    select_pc_w2 <= select_pc_w;
    select_pc_w3 <= select_pc_w2;

    pc_w         <= pc_b;
    pc_w2        <= pc_w;
    pc_w3        <= pc_w2;

    //---------------------------------
    if (rd_vld) begin // {

      // Determine which thread is active
      for (i=0; i<=3; i=i+1) begin // {
        if (select_pc_w3[i]==1'b1) begin // {
          mytid = i + (mytg*4);
          mytnum = (mycid * 8) + mytid;
        end // }
      end // }


      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD  tid=%d pc=%h ts=%0d",
                             mycid,mytid,mytnum,pc_w3,tstamp-5);
        junk = $sim_send(`PLI_DTLBREAD, mytnum, tstamp-5);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                      mycid,mytid,pc_w3,(tstamp-5)*`TOP.core_period);
        end //}

      end //}

    end // }
  end // in_reset}

end // always }


//---------------------------------------------------------
// DTLB POP state machine
 
always @ (posedge `SPC3.l2clk & ready) begin // { 

  // if POR|WMR, then no TLBread
  if (!`TOP.in_reset_core) begin // {

    //Set read active when there is a valid lookup
    if (rd_vld_b) begin // { 
      dtlbReadActive[`SPC3.lsu.dcc.tid_b[2:0]] <= 1'h1;
    end //}

    //Clear it when there is a bypass
    if ((`SPC3.lsu.dcc.ld_inst_vld_b | 
         `SPC3.lsu.dcc.st_inst_vld_b) &
         `SPC3.lsu.dcc.tlb_bypass_b & 
        ~`SPC3.lsu.dcc.flush_all_b) begin // { 
      dtlbReadActive[`SPC3.lsu.dcc.tid_b[2:0]] <= 1'h0;
    end //}

    //Do a pop if we are active and then see a Perf Mon
    if ((`SPC3.lsu_perfmon_trap_g |
         `SPC3.lsu_dcl2u_err_g |
         `SPC3.lsu_dcl2nd_err_g) &
        dtlbReadActive[`SPC3.lsu_dcerr_tid_g[2:0]]) begin // { 
      dtlbReadActive[`SPC3.lsu_dcerr_tid_g[2:0]] = 1'h0;

      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                             mycid,myLateErrTid,myLateErrTnum,tstamp);
        junk = $sim_send(`PLI_DTLBREAD_POP, myLateErrTnum, tstamp);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                      mycid,mytid,tstamp*`TOP.core_period);
        end //}  
      end //}
    end //}

    // Determine which thread is active
    for (i=0; i<=3; i=i+1) begin // {
      bsktid = i + (mytg*4);
      bsktnum = (mycid * 8) + bsktid;

      //Do a pop if we see a block storke kill
      if (blockStoreKill[bsktid] &
          dtlbReadActive[bsktid]) begin // {
        dtlbReadActive[bsktid] = 1'h0;

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                              mycid,bsktid,bsktnum,tstamp);
          junk = $sim_send(`PLI_DTLBREAD_POP, bsktnum, tstamp);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                        mycid,bsktid,tstamp*`TOP.core_period);
          end //}  
        end // }
      end // }

    end // for }

  end // in_reset}
end // always}



//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_4

module dtlb_rd_c4 (

  mytg
);

`include "tlb_sync.vh"

input                      mytg;
`ifndef GATESIM

wire                       rd_vld;
wire                       rd_vld_b;
reg                        rd_vld_w;
reg                        rd_vld_w2;
reg                        rd_vld_w3;
reg      [(`TS_WIDTH-1):0] tstamp;

wire                 [3:0] select_pc_b;
reg                  [3:0] select_pc_w;
reg                  [3:0] select_pc_w2;
reg                  [3:0] select_pc_w3;
wire                [47:0] pc_b;
reg                 [47:0] pc_w;
reg                 [47:0] pc_w2;
reg                 [47:0] pc_w3;

wire                       irf_error_m;
wire                       irf_error_b;
reg                        irf_error_b_pre;

reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                        ready;

reg                  [2:0] bsktid;
reg                  [5:0] bsktnum;

integer                    i;
integer                    junk;
wire                       lsuErrorInB;

reg                 [7:0] dtlbReadActive;
wire                [7:0] blockStoreKill;

wire                [2:0] myLateErrTid = `SPC4.lsu_dcerr_tid_g[2:0];
wire                [5:0] myLateErrTnum = (mycid * 8) + myLateErrTid;

initial begin // {
    ready = 0;
    dtlbReadActive = 8'h0;

    @(posedge `SPC4.l2clk) ;
    @(posedge `SPC4.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 4;
end //}

//----------------------------------------------------------
// DUT probes


// I use this signal to get several standard errors in LSU that can happen
// that will cause a DTLB_READ, and use them to make sure they are not
// happening with perfom trap in the rd_vld_b signal
assign lsuErrorB = (`SPC4.lsu.dcc.lsu_align_b           |
                    `SPC4.lsu.dcc.lsu_lddf_align_b      |
                    `SPC4.lsu.dcc.lsu_stdf_align_b      |
                    `SPC4.lsu.dcc.lsu_dae_invalid_asi_b |
                    `SPC4.lsu.dcc.lsu_dae_nc_page_b     |
                    `SPC4.lsu.dcc.lsu_dae_nfo_page_b    |
                    `SPC4.lsu.dcc.lsu_dae_priv_viol_b   |
                    `SPC4.lsu.dcc.lsu_dae_so_page       |
                    `SPC4.lsu.dcc.lsu_priv_action_b     |
                    `SPC4.lsu.dcc.lsu_va_watchpoint_b   |
                    `SPC4.lsu.dcc.lsu_pa_watchpoint_b   |
                    `SPC4.lsu.dcc.lsu_daccess_prot_b    |
                    `SPC4.lsu.dcc.lsu_dttp_err_b        |
                    `SPC4.lsu.dcc.lsu_dtdp_err_b        |
                    `SPC4.lsu.dcc.lsu_dtmh_err_b);


// Per tlb_sync spec, high priority (0-9) exceptions should not send DTLBREAD.
// tlu_flush_lsu_b - suppress DTLBREAD for high priority (0-9) exceptions.
// However, VA_watchpoint (TT=0x62, priority 11) also causes tlu_flush_lsu_b to be asserted.
// va_watchpoint_w_in was added to allow DTLBREAD to be sent even though tlu_flush_lsu_b fires.
// fgu_error_b - suppress DTLBREAD on FRF errors.
// irf_error_b - suppress DTLBREAD on IRF errors.

assign   select_pc_b = mytg ? `PROBES4.select_pc_b[7:4] : `PROBES4.select_pc_b[3:0];
assign   rd_vld_b = mytg ? 

               (`PROBES4.tlb_rd_vld_b && 
                !`PROBES4.tlb_bypass_b &&
                !`SPC4.lsu.lsu_illegal_inst_b &&
                !`SPC4.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC4.lsu_perfmon_trap_b & `SPC4.tlu.fls1.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC4.lsu.dcc.pipe_flush_b &&
                (!`SPC4.tlu_flush_lsu_b | `SPC4.tlu.fls1.va_watchpoint_w_in) &&
               `SPC4.tlu.fls1.lsu_inst_b && 
               (|select_pc_b)) :

               (`PROBES4.tlb_rd_vld_b && 
                !`PROBES4.tlb_bypass_b &&
                !`SPC4.lsu.lsu_illegal_inst_b && 
                !`SPC4.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC4.lsu_perfmon_trap_b & `SPC4.tlu.fls0.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC4.lsu.dcc.pipe_flush_b &&
                (!`SPC4.tlu_flush_lsu_b | `SPC4.tlu.fls0.va_watchpoint_w_in) &&
               `SPC4.tlu.fls0.lsu_inst_b && 
               (|select_pc_b));


assign   blockStoreKill = {`SPC4.lsu.sbs7.bst_kill,
                           `SPC4.lsu.sbs6.bst_kill,
                           `SPC4.lsu.sbs5.bst_kill,
                           `SPC4.lsu.sbs4.bst_kill,
                           `SPC4.lsu.sbs3.bst_kill,
                           `SPC4.lsu.sbs2.bst_kill,
                           `SPC4.lsu.sbs1.bst_kill,
                           `SPC4.lsu.sbs0.bst_kill};
                           





// suppress DTLBREAD on STB errors.
assign   rd_vld = rd_vld_w3 && 
                  !(`SPC4.lsu.lmc.sbdlc_err | `SPC4.lsu.lmc.sbdlu_err);

// suppress DTLBREAD on IRF errors
assign irf_error_m = (`SPC4.lsu.dcc.tid_m[2] ? `SPC4.exu_ecc_m[1] : `SPC4.exu_ecc_m[0]);
assign irf_error_b = irf_error_b_pre | 
                     ((`SPC4.lsu.dcc.tid_b[2] ? `SPC4.lsu.dcc.exu_ecc_m[1] : 
                                                      `SPC4.lsu.dcc.exu_ecc_m[0]) & 
                       `SPC4.lsu.dcc.twocycle_b &

        ~(`SPC4.lsu.dcc.lsu_align_b           |
          `SPC4.lsu.dcc.lsu_lddf_align_b      |
          `SPC4.lsu.dcc.lsu_stdf_align_b      |
          `SPC4.lsu.dcc.lsu_dae_invalid_asi_b |
          `SPC4.lsu.dcc.lsu_dae_nc_page_b     |
          `SPC4.lsu.dcc.lsu_dae_nfo_page_b    |
          `SPC4.lsu.dcc.lsu_dae_priv_viol_b   |
          `SPC4.lsu.dcc.lsu_dae_so_page       |
          `SPC4.lsu.dcc.lsu_priv_action_b     |
          `SPC4.lsu.dcc.lsu_va_watchpoint_b   |
          `SPC4.lsu.dcc.lsu_pa_watchpoint_b   |
          ~`SPC4.lsu.dcc.lsu_tlb_miss_b_      |
          `SPC4.lsu.dcc.lsu_daccess_prot_b    |
          `SPC4.lsu.dcc.lsu_dttp_err_b        |
          `SPC4.lsu.dcc.lsu_dtdp_err_b        |
          `SPC4.lsu.dcc.lsu_dtmh_err_b));



assign pc_b   = mytg ? `PROBES4.pc_1_b :
                       `PROBES4.pc_0_b;

//----------------------------------------------------------
//  Send Command to NAS

always @ (posedge `SPC4.l2clk & ready) begin // {   

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    irf_error_b_pre <= 0;

    rd_vld_w     <= 0;
    rd_vld_w2    <= 0;
    rd_vld_w3    <= 0;

    select_pc_w  <= 0;
    select_pc_w2 <= 0;
    select_pc_w3 <= 0;

    pc_w         <= 0;
    pc_w2        <= 0;
    pc_w3        <= 0;

  end // }
  else begin // {

    tstamp         = `TOP.core_cycle_cnt;

    irf_error_b_pre <= irf_error_m;

    rd_vld_w     <= rd_vld_b;
    rd_vld_w2    <= rd_vld_w;
    rd_vld_w3    <= rd_vld_w2;

    select_pc_w  <= select_pc_b;
    select_pc_w2 <= select_pc_w;
    select_pc_w3 <= select_pc_w2;

    pc_w         <= pc_b;
    pc_w2        <= pc_w;
    pc_w3        <= pc_w2;

    //---------------------------------
    if (rd_vld) begin // {

      // Determine which thread is active
      for (i=0; i<=3; i=i+1) begin // {
        if (select_pc_w3[i]==1'b1) begin // {
          mytid = i + (mytg*4);
          mytnum = (mycid * 8) + mytid;
        end // }
      end // }


      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD  tid=%d pc=%h ts=%0d",
                             mycid,mytid,mytnum,pc_w3,tstamp-5);
        junk = $sim_send(`PLI_DTLBREAD, mytnum, tstamp-5);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                      mycid,mytid,pc_w3,(tstamp-5)*`TOP.core_period);
        end //}

      end //}

    end // }
  end // in_reset}

end // always }


//---------------------------------------------------------
// DTLB POP state machine
 
always @ (posedge `SPC4.l2clk & ready) begin // { 

  // if POR|WMR, then no TLBread
  if (!`TOP.in_reset_core) begin // {

    //Set read active when there is a valid lookup
    if (rd_vld_b) begin // { 
      dtlbReadActive[`SPC4.lsu.dcc.tid_b[2:0]] <= 1'h1;
    end //}

    //Clear it when there is a bypass
    if ((`SPC4.lsu.dcc.ld_inst_vld_b | 
         `SPC4.lsu.dcc.st_inst_vld_b) &
         `SPC4.lsu.dcc.tlb_bypass_b & 
        ~`SPC4.lsu.dcc.flush_all_b) begin // { 
      dtlbReadActive[`SPC4.lsu.dcc.tid_b[2:0]] <= 1'h0;
    end //}

    //Do a pop if we are active and then see a Perf Mon
    if ((`SPC4.lsu_perfmon_trap_g |
         `SPC4.lsu_dcl2u_err_g |
         `SPC4.lsu_dcl2nd_err_g) &
        dtlbReadActive[`SPC4.lsu_dcerr_tid_g[2:0]]) begin // { 
      dtlbReadActive[`SPC4.lsu_dcerr_tid_g[2:0]] = 1'h0;

      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                             mycid,myLateErrTid,myLateErrTnum,tstamp);
        junk = $sim_send(`PLI_DTLBREAD_POP, myLateErrTnum, tstamp);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                      mycid,mytid,tstamp*`TOP.core_period);
        end //}  
      end //}
    end //}

    // Determine which thread is active
    for (i=0; i<=3; i=i+1) begin // {
      bsktid = i + (mytg*4);
      bsktnum = (mycid * 8) + bsktid;

      //Do a pop if we see a block storke kill
      if (blockStoreKill[bsktid] &
          dtlbReadActive[bsktid]) begin // {
        dtlbReadActive[bsktid] = 1'h0;

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                              mycid,bsktid,bsktnum,tstamp);
          junk = $sim_send(`PLI_DTLBREAD_POP, bsktnum, tstamp);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                        mycid,bsktid,tstamp*`TOP.core_period);
          end //}  
        end // }
      end // }

    end // for }

  end // in_reset}
end // always}



//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_5

module dtlb_rd_c5 (

  mytg
);

`include "tlb_sync.vh"

input                      mytg;
`ifndef GATESIM

wire                       rd_vld;
wire                       rd_vld_b;
reg                        rd_vld_w;
reg                        rd_vld_w2;
reg                        rd_vld_w3;
reg      [(`TS_WIDTH-1):0] tstamp;

wire                 [3:0] select_pc_b;
reg                  [3:0] select_pc_w;
reg                  [3:0] select_pc_w2;
reg                  [3:0] select_pc_w3;
wire                [47:0] pc_b;
reg                 [47:0] pc_w;
reg                 [47:0] pc_w2;
reg                 [47:0] pc_w3;

wire                       irf_error_m;
wire                       irf_error_b;
reg                        irf_error_b_pre;

reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                        ready;

reg                  [2:0] bsktid;
reg                  [5:0] bsktnum;

integer                    i;
integer                    junk;
wire                       lsuErrorInB;

reg                 [7:0] dtlbReadActive;
wire                [7:0] blockStoreKill;

wire                [2:0] myLateErrTid = `SPC5.lsu_dcerr_tid_g[2:0];
wire                [5:0] myLateErrTnum = (mycid * 8) + myLateErrTid;

initial begin // {
    ready = 0;
    dtlbReadActive = 8'h0;

    @(posedge `SPC5.l2clk) ;
    @(posedge `SPC5.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 5;
end //}

//----------------------------------------------------------
// DUT probes


// I use this signal to get several standard errors in LSU that can happen
// that will cause a DTLB_READ, and use them to make sure they are not
// happening with perfom trap in the rd_vld_b signal
assign lsuErrorB = (`SPC5.lsu.dcc.lsu_align_b           |
                    `SPC5.lsu.dcc.lsu_lddf_align_b      |
                    `SPC5.lsu.dcc.lsu_stdf_align_b      |
                    `SPC5.lsu.dcc.lsu_dae_invalid_asi_b |
                    `SPC5.lsu.dcc.lsu_dae_nc_page_b     |
                    `SPC5.lsu.dcc.lsu_dae_nfo_page_b    |
                    `SPC5.lsu.dcc.lsu_dae_priv_viol_b   |
                    `SPC5.lsu.dcc.lsu_dae_so_page       |
                    `SPC5.lsu.dcc.lsu_priv_action_b     |
                    `SPC5.lsu.dcc.lsu_va_watchpoint_b   |
                    `SPC5.lsu.dcc.lsu_pa_watchpoint_b   |
                    `SPC5.lsu.dcc.lsu_daccess_prot_b    |
                    `SPC5.lsu.dcc.lsu_dttp_err_b        |
                    `SPC5.lsu.dcc.lsu_dtdp_err_b        |
                    `SPC5.lsu.dcc.lsu_dtmh_err_b);


// Per tlb_sync spec, high priority (0-9) exceptions should not send DTLBREAD.
// tlu_flush_lsu_b - suppress DTLBREAD for high priority (0-9) exceptions.
// However, VA_watchpoint (TT=0x62, priority 11) also causes tlu_flush_lsu_b to be asserted.
// va_watchpoint_w_in was added to allow DTLBREAD to be sent even though tlu_flush_lsu_b fires.
// fgu_error_b - suppress DTLBREAD on FRF errors.
// irf_error_b - suppress DTLBREAD on IRF errors.

assign   select_pc_b = mytg ? `PROBES5.select_pc_b[7:4] : `PROBES5.select_pc_b[3:0];
assign   rd_vld_b = mytg ? 

               (`PROBES5.tlb_rd_vld_b && 
                !`PROBES5.tlb_bypass_b &&
                !`SPC5.lsu.lsu_illegal_inst_b &&
                !`SPC5.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC5.lsu_perfmon_trap_b & `SPC5.tlu.fls1.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC5.lsu.dcc.pipe_flush_b &&
                (!`SPC5.tlu_flush_lsu_b | `SPC5.tlu.fls1.va_watchpoint_w_in) &&
               `SPC5.tlu.fls1.lsu_inst_b && 
               (|select_pc_b)) :

               (`PROBES5.tlb_rd_vld_b && 
                !`PROBES5.tlb_bypass_b &&
                !`SPC5.lsu.lsu_illegal_inst_b && 
                !`SPC5.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC5.lsu_perfmon_trap_b & `SPC5.tlu.fls0.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC5.lsu.dcc.pipe_flush_b &&
                (!`SPC5.tlu_flush_lsu_b | `SPC5.tlu.fls0.va_watchpoint_w_in) &&
               `SPC5.tlu.fls0.lsu_inst_b && 
               (|select_pc_b));


assign   blockStoreKill = {`SPC5.lsu.sbs7.bst_kill,
                           `SPC5.lsu.sbs6.bst_kill,
                           `SPC5.lsu.sbs5.bst_kill,
                           `SPC5.lsu.sbs4.bst_kill,
                           `SPC5.lsu.sbs3.bst_kill,
                           `SPC5.lsu.sbs2.bst_kill,
                           `SPC5.lsu.sbs1.bst_kill,
                           `SPC5.lsu.sbs0.bst_kill};
                           





// suppress DTLBREAD on STB errors.
assign   rd_vld = rd_vld_w3 && 
                  !(`SPC5.lsu.lmc.sbdlc_err | `SPC5.lsu.lmc.sbdlu_err);

// suppress DTLBREAD on IRF errors
assign irf_error_m = (`SPC5.lsu.dcc.tid_m[2] ? `SPC5.exu_ecc_m[1] : `SPC5.exu_ecc_m[0]);
assign irf_error_b = irf_error_b_pre | 
                     ((`SPC5.lsu.dcc.tid_b[2] ? `SPC5.lsu.dcc.exu_ecc_m[1] : 
                                                      `SPC5.lsu.dcc.exu_ecc_m[0]) & 
                       `SPC5.lsu.dcc.twocycle_b &

        ~(`SPC5.lsu.dcc.lsu_align_b           |
          `SPC5.lsu.dcc.lsu_lddf_align_b      |
          `SPC5.lsu.dcc.lsu_stdf_align_b      |
          `SPC5.lsu.dcc.lsu_dae_invalid_asi_b |
          `SPC5.lsu.dcc.lsu_dae_nc_page_b     |
          `SPC5.lsu.dcc.lsu_dae_nfo_page_b    |
          `SPC5.lsu.dcc.lsu_dae_priv_viol_b   |
          `SPC5.lsu.dcc.lsu_dae_so_page       |
          `SPC5.lsu.dcc.lsu_priv_action_b     |
          `SPC5.lsu.dcc.lsu_va_watchpoint_b   |
          `SPC5.lsu.dcc.lsu_pa_watchpoint_b   |
          ~`SPC5.lsu.dcc.lsu_tlb_miss_b_      |
          `SPC5.lsu.dcc.lsu_daccess_prot_b    |
          `SPC5.lsu.dcc.lsu_dttp_err_b        |
          `SPC5.lsu.dcc.lsu_dtdp_err_b        |
          `SPC5.lsu.dcc.lsu_dtmh_err_b));



assign pc_b   = mytg ? `PROBES5.pc_1_b :
                       `PROBES5.pc_0_b;

//----------------------------------------------------------
//  Send Command to NAS

always @ (posedge `SPC5.l2clk & ready) begin // {   

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    irf_error_b_pre <= 0;

    rd_vld_w     <= 0;
    rd_vld_w2    <= 0;
    rd_vld_w3    <= 0;

    select_pc_w  <= 0;
    select_pc_w2 <= 0;
    select_pc_w3 <= 0;

    pc_w         <= 0;
    pc_w2        <= 0;
    pc_w3        <= 0;

  end // }
  else begin // {

    tstamp         = `TOP.core_cycle_cnt;

    irf_error_b_pre <= irf_error_m;

    rd_vld_w     <= rd_vld_b;
    rd_vld_w2    <= rd_vld_w;
    rd_vld_w3    <= rd_vld_w2;

    select_pc_w  <= select_pc_b;
    select_pc_w2 <= select_pc_w;
    select_pc_w3 <= select_pc_w2;

    pc_w         <= pc_b;
    pc_w2        <= pc_w;
    pc_w3        <= pc_w2;

    //---------------------------------
    if (rd_vld) begin // {

      // Determine which thread is active
      for (i=0; i<=3; i=i+1) begin // {
        if (select_pc_w3[i]==1'b1) begin // {
          mytid = i + (mytg*4);
          mytnum = (mycid * 8) + mytid;
        end // }
      end // }


      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD  tid=%d pc=%h ts=%0d",
                             mycid,mytid,mytnum,pc_w3,tstamp-5);
        junk = $sim_send(`PLI_DTLBREAD, mytnum, tstamp-5);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                      mycid,mytid,pc_w3,(tstamp-5)*`TOP.core_period);
        end //}

      end //}

    end // }
  end // in_reset}

end // always }


//---------------------------------------------------------
// DTLB POP state machine
 
always @ (posedge `SPC5.l2clk & ready) begin // { 

  // if POR|WMR, then no TLBread
  if (!`TOP.in_reset_core) begin // {

    //Set read active when there is a valid lookup
    if (rd_vld_b) begin // { 
      dtlbReadActive[`SPC5.lsu.dcc.tid_b[2:0]] <= 1'h1;
    end //}

    //Clear it when there is a bypass
    if ((`SPC5.lsu.dcc.ld_inst_vld_b | 
         `SPC5.lsu.dcc.st_inst_vld_b) &
         `SPC5.lsu.dcc.tlb_bypass_b & 
        ~`SPC5.lsu.dcc.flush_all_b) begin // { 
      dtlbReadActive[`SPC5.lsu.dcc.tid_b[2:0]] <= 1'h0;
    end //}

    //Do a pop if we are active and then see a Perf Mon
    if ((`SPC5.lsu_perfmon_trap_g |
         `SPC5.lsu_dcl2u_err_g |
         `SPC5.lsu_dcl2nd_err_g) &
        dtlbReadActive[`SPC5.lsu_dcerr_tid_g[2:0]]) begin // { 
      dtlbReadActive[`SPC5.lsu_dcerr_tid_g[2:0]] = 1'h0;

      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                             mycid,myLateErrTid,myLateErrTnum,tstamp);
        junk = $sim_send(`PLI_DTLBREAD_POP, myLateErrTnum, tstamp);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                      mycid,mytid,tstamp*`TOP.core_period);
        end //}  
      end //}
    end //}

    // Determine which thread is active
    for (i=0; i<=3; i=i+1) begin // {
      bsktid = i + (mytg*4);
      bsktnum = (mycid * 8) + bsktid;

      //Do a pop if we see a block storke kill
      if (blockStoreKill[bsktid] &
          dtlbReadActive[bsktid]) begin // {
        dtlbReadActive[bsktid] = 1'h0;

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                              mycid,bsktid,bsktnum,tstamp);
          junk = $sim_send(`PLI_DTLBREAD_POP, bsktnum, tstamp);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                        mycid,bsktid,tstamp*`TOP.core_period);
          end //}  
        end // }
      end // }

    end // for }

  end // in_reset}
end // always}



//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_6

module dtlb_rd_c6 (

  mytg
);

`include "tlb_sync.vh"

input                      mytg;
`ifndef GATESIM

wire                       rd_vld;
wire                       rd_vld_b;
reg                        rd_vld_w;
reg                        rd_vld_w2;
reg                        rd_vld_w3;
reg      [(`TS_WIDTH-1):0] tstamp;

wire                 [3:0] select_pc_b;
reg                  [3:0] select_pc_w;
reg                  [3:0] select_pc_w2;
reg                  [3:0] select_pc_w3;
wire                [47:0] pc_b;
reg                 [47:0] pc_w;
reg                 [47:0] pc_w2;
reg                 [47:0] pc_w3;

wire                       irf_error_m;
wire                       irf_error_b;
reg                        irf_error_b_pre;

reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                        ready;

reg                  [2:0] bsktid;
reg                  [5:0] bsktnum;

integer                    i;
integer                    junk;
wire                       lsuErrorInB;

reg                 [7:0] dtlbReadActive;
wire                [7:0] blockStoreKill;

wire                [2:0] myLateErrTid = `SPC6.lsu_dcerr_tid_g[2:0];
wire                [5:0] myLateErrTnum = (mycid * 8) + myLateErrTid;

initial begin // {
    ready = 0;
    dtlbReadActive = 8'h0;

    @(posedge `SPC6.l2clk) ;
    @(posedge `SPC6.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 6;
end //}

//----------------------------------------------------------
// DUT probes


// I use this signal to get several standard errors in LSU that can happen
// that will cause a DTLB_READ, and use them to make sure they are not
// happening with perfom trap in the rd_vld_b signal
assign lsuErrorB = (`SPC6.lsu.dcc.lsu_align_b           |
                    `SPC6.lsu.dcc.lsu_lddf_align_b      |
                    `SPC6.lsu.dcc.lsu_stdf_align_b      |
                    `SPC6.lsu.dcc.lsu_dae_invalid_asi_b |
                    `SPC6.lsu.dcc.lsu_dae_nc_page_b     |
                    `SPC6.lsu.dcc.lsu_dae_nfo_page_b    |
                    `SPC6.lsu.dcc.lsu_dae_priv_viol_b   |
                    `SPC6.lsu.dcc.lsu_dae_so_page       |
                    `SPC6.lsu.dcc.lsu_priv_action_b     |
                    `SPC6.lsu.dcc.lsu_va_watchpoint_b   |
                    `SPC6.lsu.dcc.lsu_pa_watchpoint_b   |
                    `SPC6.lsu.dcc.lsu_daccess_prot_b    |
                    `SPC6.lsu.dcc.lsu_dttp_err_b        |
                    `SPC6.lsu.dcc.lsu_dtdp_err_b        |
                    `SPC6.lsu.dcc.lsu_dtmh_err_b);


// Per tlb_sync spec, high priority (0-9) exceptions should not send DTLBREAD.
// tlu_flush_lsu_b - suppress DTLBREAD for high priority (0-9) exceptions.
// However, VA_watchpoint (TT=0x62, priority 11) also causes tlu_flush_lsu_b to be asserted.
// va_watchpoint_w_in was added to allow DTLBREAD to be sent even though tlu_flush_lsu_b fires.
// fgu_error_b - suppress DTLBREAD on FRF errors.
// irf_error_b - suppress DTLBREAD on IRF errors.

assign   select_pc_b = mytg ? `PROBES6.select_pc_b[7:4] : `PROBES6.select_pc_b[3:0];
assign   rd_vld_b = mytg ? 

               (`PROBES6.tlb_rd_vld_b && 
                !`PROBES6.tlb_bypass_b &&
                !`SPC6.lsu.lsu_illegal_inst_b &&
                !`SPC6.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC6.lsu_perfmon_trap_b & `SPC6.tlu.fls1.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC6.lsu.dcc.pipe_flush_b &&
                (!`SPC6.tlu_flush_lsu_b | `SPC6.tlu.fls1.va_watchpoint_w_in) &&
               `SPC6.tlu.fls1.lsu_inst_b && 
               (|select_pc_b)) :

               (`PROBES6.tlb_rd_vld_b && 
                !`PROBES6.tlb_bypass_b &&
                !`SPC6.lsu.lsu_illegal_inst_b && 
                !`SPC6.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC6.lsu_perfmon_trap_b & `SPC6.tlu.fls0.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC6.lsu.dcc.pipe_flush_b &&
                (!`SPC6.tlu_flush_lsu_b | `SPC6.tlu.fls0.va_watchpoint_w_in) &&
               `SPC6.tlu.fls0.lsu_inst_b && 
               (|select_pc_b));


assign   blockStoreKill = {`SPC6.lsu.sbs7.bst_kill,
                           `SPC6.lsu.sbs6.bst_kill,
                           `SPC6.lsu.sbs5.bst_kill,
                           `SPC6.lsu.sbs4.bst_kill,
                           `SPC6.lsu.sbs3.bst_kill,
                           `SPC6.lsu.sbs2.bst_kill,
                           `SPC6.lsu.sbs1.bst_kill,
                           `SPC6.lsu.sbs0.bst_kill};
                           





// suppress DTLBREAD on STB errors.
assign   rd_vld = rd_vld_w3 && 
                  !(`SPC6.lsu.lmc.sbdlc_err | `SPC6.lsu.lmc.sbdlu_err);

// suppress DTLBREAD on IRF errors
assign irf_error_m = (`SPC6.lsu.dcc.tid_m[2] ? `SPC6.exu_ecc_m[1] : `SPC6.exu_ecc_m[0]);
assign irf_error_b = irf_error_b_pre | 
                     ((`SPC6.lsu.dcc.tid_b[2] ? `SPC6.lsu.dcc.exu_ecc_m[1] : 
                                                      `SPC6.lsu.dcc.exu_ecc_m[0]) & 
                       `SPC6.lsu.dcc.twocycle_b &

        ~(`SPC6.lsu.dcc.lsu_align_b           |
          `SPC6.lsu.dcc.lsu_lddf_align_b      |
          `SPC6.lsu.dcc.lsu_stdf_align_b      |
          `SPC6.lsu.dcc.lsu_dae_invalid_asi_b |
          `SPC6.lsu.dcc.lsu_dae_nc_page_b     |
          `SPC6.lsu.dcc.lsu_dae_nfo_page_b    |
          `SPC6.lsu.dcc.lsu_dae_priv_viol_b   |
          `SPC6.lsu.dcc.lsu_dae_so_page       |
          `SPC6.lsu.dcc.lsu_priv_action_b     |
          `SPC6.lsu.dcc.lsu_va_watchpoint_b   |
          `SPC6.lsu.dcc.lsu_pa_watchpoint_b   |
          ~`SPC6.lsu.dcc.lsu_tlb_miss_b_      |
          `SPC6.lsu.dcc.lsu_daccess_prot_b    |
          `SPC6.lsu.dcc.lsu_dttp_err_b        |
          `SPC6.lsu.dcc.lsu_dtdp_err_b        |
          `SPC6.lsu.dcc.lsu_dtmh_err_b));



assign pc_b   = mytg ? `PROBES6.pc_1_b :
                       `PROBES6.pc_0_b;

//----------------------------------------------------------
//  Send Command to NAS

always @ (posedge `SPC6.l2clk & ready) begin // {   

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    irf_error_b_pre <= 0;

    rd_vld_w     <= 0;
    rd_vld_w2    <= 0;
    rd_vld_w3    <= 0;

    select_pc_w  <= 0;
    select_pc_w2 <= 0;
    select_pc_w3 <= 0;

    pc_w         <= 0;
    pc_w2        <= 0;
    pc_w3        <= 0;

  end // }
  else begin // {

    tstamp         = `TOP.core_cycle_cnt;

    irf_error_b_pre <= irf_error_m;

    rd_vld_w     <= rd_vld_b;
    rd_vld_w2    <= rd_vld_w;
    rd_vld_w3    <= rd_vld_w2;

    select_pc_w  <= select_pc_b;
    select_pc_w2 <= select_pc_w;
    select_pc_w3 <= select_pc_w2;

    pc_w         <= pc_b;
    pc_w2        <= pc_w;
    pc_w3        <= pc_w2;

    //---------------------------------
    if (rd_vld) begin // {

      // Determine which thread is active
      for (i=0; i<=3; i=i+1) begin // {
        if (select_pc_w3[i]==1'b1) begin // {
          mytid = i + (mytg*4);
          mytnum = (mycid * 8) + mytid;
        end // }
      end // }


      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD  tid=%d pc=%h ts=%0d",
                             mycid,mytid,mytnum,pc_w3,tstamp-5);
        junk = $sim_send(`PLI_DTLBREAD, mytnum, tstamp-5);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                      mycid,mytid,pc_w3,(tstamp-5)*`TOP.core_period);
        end //}

      end //}

    end // }
  end // in_reset}

end // always }


//---------------------------------------------------------
// DTLB POP state machine
 
always @ (posedge `SPC6.l2clk & ready) begin // { 

  // if POR|WMR, then no TLBread
  if (!`TOP.in_reset_core) begin // {

    //Set read active when there is a valid lookup
    if (rd_vld_b) begin // { 
      dtlbReadActive[`SPC6.lsu.dcc.tid_b[2:0]] <= 1'h1;
    end //}

    //Clear it when there is a bypass
    if ((`SPC6.lsu.dcc.ld_inst_vld_b | 
         `SPC6.lsu.dcc.st_inst_vld_b) &
         `SPC6.lsu.dcc.tlb_bypass_b & 
        ~`SPC6.lsu.dcc.flush_all_b) begin // { 
      dtlbReadActive[`SPC6.lsu.dcc.tid_b[2:0]] <= 1'h0;
    end //}

    //Do a pop if we are active and then see a Perf Mon
    if ((`SPC6.lsu_perfmon_trap_g |
         `SPC6.lsu_dcl2u_err_g |
         `SPC6.lsu_dcl2nd_err_g) &
        dtlbReadActive[`SPC6.lsu_dcerr_tid_g[2:0]]) begin // { 
      dtlbReadActive[`SPC6.lsu_dcerr_tid_g[2:0]] = 1'h0;

      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                             mycid,myLateErrTid,myLateErrTnum,tstamp);
        junk = $sim_send(`PLI_DTLBREAD_POP, myLateErrTnum, tstamp);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                      mycid,mytid,tstamp*`TOP.core_period);
        end //}  
      end //}
    end //}

    // Determine which thread is active
    for (i=0; i<=3; i=i+1) begin // {
      bsktid = i + (mytg*4);
      bsktnum = (mycid * 8) + bsktid;

      //Do a pop if we see a block storke kill
      if (blockStoreKill[bsktid] &
          dtlbReadActive[bsktid]) begin // {
        dtlbReadActive[bsktid] = 1'h0;

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                              mycid,bsktid,bsktnum,tstamp);
          junk = $sim_send(`PLI_DTLBREAD_POP, bsktnum, tstamp);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                        mycid,bsktid,tstamp*`TOP.core_period);
          end //}  
        end // }
      end // }

    end // for }

  end // in_reset}
end // always}



//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_7

module dtlb_rd_c7 (

  mytg
);

`include "tlb_sync.vh"

input                      mytg;
`ifndef GATESIM

wire                       rd_vld;
wire                       rd_vld_b;
reg                        rd_vld_w;
reg                        rd_vld_w2;
reg                        rd_vld_w3;
reg      [(`TS_WIDTH-1):0] tstamp;

wire                 [3:0] select_pc_b;
reg                  [3:0] select_pc_w;
reg                  [3:0] select_pc_w2;
reg                  [3:0] select_pc_w3;
wire                [47:0] pc_b;
reg                 [47:0] pc_w;
reg                 [47:0] pc_w2;
reg                 [47:0] pc_w3;

wire                       irf_error_m;
wire                       irf_error_b;
reg                        irf_error_b_pre;

reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                        ready;

reg                  [2:0] bsktid;
reg                  [5:0] bsktnum;

integer                    i;
integer                    junk;
wire                       lsuErrorInB;

reg                 [7:0] dtlbReadActive;
wire                [7:0] blockStoreKill;

wire                [2:0] myLateErrTid = `SPC7.lsu_dcerr_tid_g[2:0];
wire                [5:0] myLateErrTnum = (mycid * 8) + myLateErrTid;

initial begin // {
    ready = 0;
    dtlbReadActive = 8'h0;

    @(posedge `SPC7.l2clk) ;
    @(posedge `SPC7.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 7;
end //}

//----------------------------------------------------------
// DUT probes


// I use this signal to get several standard errors in LSU that can happen
// that will cause a DTLB_READ, and use them to make sure they are not
// happening with perfom trap in the rd_vld_b signal
assign lsuErrorB = (`SPC7.lsu.dcc.lsu_align_b           |
                    `SPC7.lsu.dcc.lsu_lddf_align_b      |
                    `SPC7.lsu.dcc.lsu_stdf_align_b      |
                    `SPC7.lsu.dcc.lsu_dae_invalid_asi_b |
                    `SPC7.lsu.dcc.lsu_dae_nc_page_b     |
                    `SPC7.lsu.dcc.lsu_dae_nfo_page_b    |
                    `SPC7.lsu.dcc.lsu_dae_priv_viol_b   |
                    `SPC7.lsu.dcc.lsu_dae_so_page       |
                    `SPC7.lsu.dcc.lsu_priv_action_b     |
                    `SPC7.lsu.dcc.lsu_va_watchpoint_b   |
                    `SPC7.lsu.dcc.lsu_pa_watchpoint_b   |
                    `SPC7.lsu.dcc.lsu_daccess_prot_b    |
                    `SPC7.lsu.dcc.lsu_dttp_err_b        |
                    `SPC7.lsu.dcc.lsu_dtdp_err_b        |
                    `SPC7.lsu.dcc.lsu_dtmh_err_b);


// Per tlb_sync spec, high priority (0-9) exceptions should not send DTLBREAD.
// tlu_flush_lsu_b - suppress DTLBREAD for high priority (0-9) exceptions.
// However, VA_watchpoint (TT=0x62, priority 11) also causes tlu_flush_lsu_b to be asserted.
// va_watchpoint_w_in was added to allow DTLBREAD to be sent even though tlu_flush_lsu_b fires.
// fgu_error_b - suppress DTLBREAD on FRF errors.
// irf_error_b - suppress DTLBREAD on IRF errors.

assign   select_pc_b = mytg ? `PROBES7.select_pc_b[7:4] : `PROBES7.select_pc_b[3:0];
assign   rd_vld_b = mytg ? 

               (`PROBES7.tlb_rd_vld_b && 
                !`PROBES7.tlb_bypass_b &&
                !`SPC7.lsu.lsu_illegal_inst_b &&
                !`SPC7.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC7.lsu_perfmon_trap_b & `SPC7.tlu.fls1.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC7.lsu.dcc.pipe_flush_b &&
                (!`SPC7.tlu_flush_lsu_b | `SPC7.tlu.fls1.va_watchpoint_w_in) &&
               `SPC7.tlu.fls1.lsu_inst_b && 
               (|select_pc_b)) :

               (`PROBES7.tlb_rd_vld_b && 
                !`PROBES7.tlb_bypass_b &&
                !`SPC7.lsu.lsu_illegal_inst_b && 
                !`SPC7.lsu.dcc.fgu_error_b &&
                !irf_error_b &&
                !(`SPC7.lsu_perfmon_trap_b & `SPC7.tlu.fls0.pil_mask_15_b & ~lsuErrorB) &&
                !`SPC7.lsu.dcc.pipe_flush_b &&
                (!`SPC7.tlu_flush_lsu_b | `SPC7.tlu.fls0.va_watchpoint_w_in) &&
               `SPC7.tlu.fls0.lsu_inst_b && 
               (|select_pc_b));


assign   blockStoreKill = {`SPC7.lsu.sbs7.bst_kill,
                           `SPC7.lsu.sbs6.bst_kill,
                           `SPC7.lsu.sbs5.bst_kill,
                           `SPC7.lsu.sbs4.bst_kill,
                           `SPC7.lsu.sbs3.bst_kill,
                           `SPC7.lsu.sbs2.bst_kill,
                           `SPC7.lsu.sbs1.bst_kill,
                           `SPC7.lsu.sbs0.bst_kill};
                           





// suppress DTLBREAD on STB errors.
assign   rd_vld = rd_vld_w3 && 
                  !(`SPC7.lsu.lmc.sbdlc_err | `SPC7.lsu.lmc.sbdlu_err);

// suppress DTLBREAD on IRF errors
assign irf_error_m = (`SPC7.lsu.dcc.tid_m[2] ? `SPC7.exu_ecc_m[1] : `SPC7.exu_ecc_m[0]);
assign irf_error_b = irf_error_b_pre | 
                     ((`SPC7.lsu.dcc.tid_b[2] ? `SPC7.lsu.dcc.exu_ecc_m[1] : 
                                                      `SPC7.lsu.dcc.exu_ecc_m[0]) & 
                       `SPC7.lsu.dcc.twocycle_b &

        ~(`SPC7.lsu.dcc.lsu_align_b           |
          `SPC7.lsu.dcc.lsu_lddf_align_b      |
          `SPC7.lsu.dcc.lsu_stdf_align_b      |
          `SPC7.lsu.dcc.lsu_dae_invalid_asi_b |
          `SPC7.lsu.dcc.lsu_dae_nc_page_b     |
          `SPC7.lsu.dcc.lsu_dae_nfo_page_b    |
          `SPC7.lsu.dcc.lsu_dae_priv_viol_b   |
          `SPC7.lsu.dcc.lsu_dae_so_page       |
          `SPC7.lsu.dcc.lsu_priv_action_b     |
          `SPC7.lsu.dcc.lsu_va_watchpoint_b   |
          `SPC7.lsu.dcc.lsu_pa_watchpoint_b   |
          ~`SPC7.lsu.dcc.lsu_tlb_miss_b_      |
          `SPC7.lsu.dcc.lsu_daccess_prot_b    |
          `SPC7.lsu.dcc.lsu_dttp_err_b        |
          `SPC7.lsu.dcc.lsu_dtdp_err_b        |
          `SPC7.lsu.dcc.lsu_dtmh_err_b));



assign pc_b   = mytg ? `PROBES7.pc_1_b :
                       `PROBES7.pc_0_b;

//----------------------------------------------------------
//  Send Command to NAS

always @ (posedge `SPC7.l2clk & ready) begin // {   

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    irf_error_b_pre <= 0;

    rd_vld_w     <= 0;
    rd_vld_w2    <= 0;
    rd_vld_w3    <= 0;

    select_pc_w  <= 0;
    select_pc_w2 <= 0;
    select_pc_w3 <= 0;

    pc_w         <= 0;
    pc_w2        <= 0;
    pc_w3        <= 0;

  end // }
  else begin // {

    tstamp         = `TOP.core_cycle_cnt;

    irf_error_b_pre <= irf_error_m;

    rd_vld_w     <= rd_vld_b;
    rd_vld_w2    <= rd_vld_w;
    rd_vld_w3    <= rd_vld_w2;

    select_pc_w  <= select_pc_b;
    select_pc_w2 <= select_pc_w;
    select_pc_w3 <= select_pc_w2;

    pc_w         <= pc_b;
    pc_w2        <= pc_w;
    pc_w3        <= pc_w2;

    //---------------------------------
    if (rd_vld) begin // {

      // Determine which thread is active
      for (i=0; i<=3; i=i+1) begin // {
        if (select_pc_w3[i]==1'b1) begin // {
          mytid = i + (mytg*4);
          mytnum = (mycid * 8) + mytid;
        end // }
      end // }


      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD  tid=%d pc=%h ts=%0d",
                             mycid,mytid,mytnum,pc_w3,tstamp-5);
        junk = $sim_send(`PLI_DTLBREAD, mytnum, tstamp-5);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                      mycid,mytid,pc_w3,(tstamp-5)*`TOP.core_period);
        end //}

      end //}

    end // }
  end // in_reset}

end // always }


//---------------------------------------------------------
// DTLB POP state machine
 
always @ (posedge `SPC7.l2clk & ready) begin // { 

  // if POR|WMR, then no TLBread
  if (!`TOP.in_reset_core) begin // {

    //Set read active when there is a valid lookup
    if (rd_vld_b) begin // { 
      dtlbReadActive[`SPC7.lsu.dcc.tid_b[2:0]] <= 1'h1;
    end //}

    //Clear it when there is a bypass
    if ((`SPC7.lsu.dcc.ld_inst_vld_b | 
         `SPC7.lsu.dcc.st_inst_vld_b) &
         `SPC7.lsu.dcc.tlb_bypass_b & 
        ~`SPC7.lsu.dcc.flush_all_b) begin // { 
      dtlbReadActive[`SPC7.lsu.dcc.tid_b[2:0]] <= 1'h0;
    end //}

    //Do a pop if we are active and then see a Perf Mon
    if ((`SPC7.lsu_perfmon_trap_g |
         `SPC7.lsu_dcl2u_err_g |
         `SPC7.lsu_dcl2nd_err_g) &
        dtlbReadActive[`SPC7.lsu_dcerr_tid_g[2:0]]) begin // { 
      dtlbReadActive[`SPC7.lsu_dcerr_tid_g[2:0]] = 1'h0;

      if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
        `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                             mycid,myLateErrTid,myLateErrTnum,tstamp);
        junk = $sim_send(`PLI_DTLBREAD_POP, myLateErrTnum, tstamp);

        //--------------------
        if (`PARGS.show_tlb_on) begin // {
          $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                      mycid,mytid,tstamp*`TOP.core_period);
        end //}  
      end //}
    end //}

    // Determine which thread is active
    for (i=0; i<=3; i=i+1) begin // {
      bsktid = i + (mytg*4);
      bsktnum = (mycid * 8) + bsktid;

      //Do a pop if we see a block storke kill
      if (blockStoreKill[bsktid] &
          dtlbReadActive[bsktid]) begin // {
        dtlbReadActive[bsktid] = 1'h0;

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_DTLBREAD_POP  tid=%d ts=%0d",
                              mycid,bsktid,bsktnum,tstamp);
          junk = $sim_send(`PLI_DTLBREAD_POP, bsktnum, tstamp);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: DTLB_READ_POP  C%0d T%0d ts=%0d",
                        mycid,bsktid,tstamp*`TOP.core_period);
          end //}  
        end // }
      end // }

    end // for }

  end // in_reset}
end // always}



//----------------------------------------------------------
`endif
endmodule

`endif
//----------------------------------------------------------
//----------------------------------------------------------
