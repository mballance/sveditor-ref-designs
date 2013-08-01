// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ldst_lsu.v
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

module ldst_lsu_c0 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "nas.vh"
// PCX/CPX packet defines (see :/verif/env/common/vera/include)
`include "ccx.vri"
`include "cmp.vri"

//---------------------
// Load Signals
wire                       load_w;

wire                       ldi_suppress;
wire                 [2:0] ldi_tid_w;
wire                 [5:0] ldi_tnum_w;
wire                [39:0] ldi_pa_b;
reg                 [39:0] ldi_pa_w;
wire                 [1:0] ldi_size_b;
reg                  [1:0] ldi_size_w;
wire                       ldi_bld_b;
wire                       ldi_qld_b;
wire                       ldi_ldbl_b;
wire                       ldi_ldd_b;
wire                       ldi_atomic_b;
wire                       ldi_pf_b;
reg                        ldi_pf_w;
reg                  [7:0] ldi_itype_w;
reg                  [7:0] dsrc;

wire                       ld_miss_b;
reg                        ld_miss_w;
reg                        stb_hit_w;
wire                       fraw_w;
wire                       hit_w;
wire                       miss_w;
wire                       load_data_hit;

wire                       load_fill_e;
reg                        load_fill_m;
reg                        load_fill_b;
reg                        load_fill_w;
wire                 [2:0] ldf_tid_e;
reg                  [2:0] ldf_tid_m;
reg                  [2:0] ldf_tid_b;
reg                  [2:0] ldf_tid_w;
reg                  [5:0] ldf_tnum_w;
wire                [39:0] ldf_pa_e;
reg                 [39:0] ldf_pa_m;
reg                 [39:0] ldf_pa_b;
reg                 [39:0] ldf_pa_w;

//---------------------
// Store Signals
wire                       unflushed_store_w;
wire                       store_w;
wire                       sti_suppress;
wire                 [2:0] sti_tid_b;
reg                  [2:0] sti_tid_w;
wire                 [5:0] sti_tnum_w;
wire                [39:0] sti_pa_b;
reg                 [39:0] sti_pa_w;
wire                [63:0] sti_data_w;
wire                 [7:0] sti_size_m;
reg                  [7:0] sti_size_b;
reg                  [7:0] sti_size_w;
wire                 [7:0] sti_itype_w;
reg                  [7:0] itype_w;
wire                [63:0] sbd_st_data_b;
reg                 [63:0] sbd_st_data_w;
wire                       flip_size_b;

wire                       atomic_b;
wire                       rmo_st_b;
wire                       blk_inst_b;
reg                        blk_inst_w;

wire                       bst_in_prog_b;
reg                        bst_in_prog_w;
wire                [39:0] bst_pa_b;
reg                 [39:0] bst_pa_w;
wire                 [2:0] bst_tid_b;
reg                  [2:0] bst_tid_w;
wire                [39:0] st_pa_b;
reg                 [39:0] st_pa_w;
wire                 [2:0] st_tid_b;
reg                  [2:0] st_tid_w;

wire                       store_inv_e;
reg                        store_inv_m;
reg                        store_inv_b;
reg                        store_inv_w;
wire                 [5:0] stinv_tnum_e;
reg                  [5:0] stinv_tnum_m;
reg                  [5:0] stinv_tnum_b;
reg                  [5:0] stinv_tnum_w;

wire                       store_update_e;
reg                        store_update_m;
reg                        store_update_b;
reg                        store_update_w;
wire                 [2:0] stu_tid_e;
reg                  [2:0] stu_tid_m;
reg                  [2:0] stu_tid_b;
reg                  [2:0] stu_tid_w;
wire                 [5:0] stu_tnum_e;
reg                  [5:0] stu_tnum_m;
reg                  [5:0] stu_tnum_b;
reg                  [5:0] stu_tnum_w;

wire                 [7:0] asi_st_dequeue;
wire                 [7:0] st_ack_no_asi_e;
reg                  [7:0] st_ack_no_asi_m;
reg                  [7:0] st_ack_no_asi_b;
wire                 [7:0] store_ack_b;
reg                  [7:0] store_ack_w;
wire                 [7:0] st_ack_rmo_b;
reg                  [7:0] st_ack_rmo_w;
reg                        sta_rmo;
reg                  [2:0] sta_tid;
reg                  [5:0] sta_tnum;
reg                        sta_suppress [0:7];  // 1 per thread
wire                       st_io_asi;
wire                 [2:0] st_io_tid;
wire                 [7:0] st_data_access_e;
reg                  [7:0] st_data_access_m;
reg                  [7:0] st_data_access_b;
reg                  [7:0] st_data_access_w;
reg                  [2:0] tmp_tid;
reg                  [5:0] tmp_tnum;

reg                 [39:0] store_pa_m;
reg                 [39:0] store_pa_b;
reg                 [39:0] store_pa_w;

wire                 [1:0] l1_way_select;
wire                 [6:0] l1_index;
wire                [27:0] my_way;
wire                [27:0] way0;
wire                [27:0] way1;
wire                [27:0] way2;
wire                [27:0] way3;

wire                 [3:0] evict_inv_e;
reg                  [3:0] evict_inv_m;
reg                  [3:0] evict_inv_b;
reg                  [3:0] evict_inv_w;
wire                 [2:0] evict_srcid_e;
reg                  [2:0] evict_srcid_m;
reg                  [2:0] evict_srcid_b;
reg                  [2:0] evict_srcid_w;

wire                 [8:0] pcx_req;
reg                  [8:0] pcx_req_1;
wire               [129:0] pcx_data;

wire                       perfmon;
wire                       perfmon_g;
reg                        perfmon_m;
reg                        perfmon_b;
reg                        perfmon_w;
wire                 [2:0] perfmon_tid;
wire                 [2:0] perfmon_tid_g;
reg                  [2:0] perfmon_tid_m;
reg                  [2:0] perfmon_tid_b;
reg                  [2:0] perfmon_tid_w;
wire                 [5:0] perfmon_tnum;
wire                 [7:0] perfmon_mask;
wire                 [7:0] perfmon_mask_g;
reg                  [7:0] perfmon_mask_m;
reg                  [7:0] perfmon_mask_b;
reg                  [7:0] perfmon_mask_w;

wire                 [7:0] bst_kill;
reg                  [2:0] bst_kill_tid;
reg                  [5:0] bst_kill_tnum;

wire                 [7:0] stb_state0_m;
wire                 [7:0] stb_state1_m;
wire                 [7:0] stb_state2_m;
wire                 [7:0] stb_state3_m;
wire                 [7:0] stb_state4_m;
wire                 [7:0] stb_state5_m;
wire                 [7:0] stb_state6_m;
wire                 [7:0] stb_state7_m;
reg                  [7:0] stb_state0_b;
reg                  [7:0] stb_state1_b;
reg                  [7:0] stb_state2_b;
reg                  [7:0] stb_state3_b;
reg                  [7:0] stb_state4_b;
reg                  [7:0] stb_state5_b;
reg                  [7:0] stb_state6_b;
reg                  [7:0] stb_state7_b;
reg                  [7:0] stb_state0_w;
reg                  [7:0] stb_state1_w;
reg                  [7:0] stb_state2_w;
reg                  [7:0] stb_state3_w;
reg                  [7:0] stb_state4_w;
reg                  [7:0] stb_state5_w;
reg                  [7:0] stb_state6_w;
reg                  [7:0] stb_state7_w;
reg                  [7:0] stb_state;
reg                        stb_last;

// Copy of dtag
reg [27:0] dta_way0 [127:0];
reg [27:0] dta_way1 [127:0];
reg [27:0] dta_way2 [127:0];
reg [27:0] dta_way3 [127:0];

//---------------------
// Misc Signals
wire                 [2:0] mycid;
integer                    tstamp;
integer                    junk;
integer                    i;

initial begin // {
  ldf_tnum_w = 6'b0;
  dsrc = 2'b0;
  sta_tid    = 3'b0;
  sta_tnum   = 6'b0;
  for (i=0; i<=7; i=i+1) begin
    sta_suppress[i] = 1'b0;
  end

end // }

// for debug only - allows display in Debussy
wire    sta_suppress0;
wire    sta_suppress1;
wire    sta_suppress2;
wire    sta_suppress3;
wire    sta_suppress4;
wire    sta_suppress5;
wire    sta_suppress6;
wire    sta_suppress7;

  assign   sta_suppress0 = sta_suppress[0];
  assign   sta_suppress1 = sta_suppress[1];
  assign   sta_suppress2 = sta_suppress[2];
  assign   sta_suppress3 = sta_suppress[3];
  assign   sta_suppress4 = sta_suppress[4];
  assign   sta_suppress5 = sta_suppress[5];
  assign   sta_suppress6 = sta_suppress[6];
  assign   sta_suppress7 = sta_suppress[7];

//----------------------------------------------------------
//----------------------------------------------------------
// DUT probes

  assign   mycid = 0;

//---------------------
// Load Issue

  // If Load to IO ASIs, load issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress load_w.

  assign load_w      = `SPC0.lsu.dcc.ld_inst_vld_w & 
                        ~`PROBES0.asi_internal_w &
                        ~`SPC0.lsu.dcc.flush_w &
                        ~ldi_pf_w;

  // ldxa to IO ASI are already suppressed since load_w will not assert.
  // ldi_suppress is required to also suppress normal ld to IO ASI address range.
  assign ldi_suppress = (ldi_pa_w[39:32] == `IO_ASI_ADDR);

  assign ldi_tid_w    = `SPC0.lsu.dcc.tid_w;
  assign ldi_tnum_w   = {mycid,ldi_tid_w};
  assign ldi_size_b   = `SPC0.lsu.dcc.ldst_sz_b;  // 2 bits
  assign ldi_atomic_b = `SPC0.lsu.dcc.atomic_b;
  assign ldi_qld_b    = `SPC0.lsu.dcc.quad_ldd_b;
  assign ldi_ldbl_b   = `SPC0.lsu.dcc_ldbl_b;
  assign ldi_ldd_b    = ldi_ldbl_b & !ldi_qld_b;
  assign ldi_bld_b    = `SPC0.lsu.dcc.dcc_blk_inst_b;
  assign ldi_pf_b     = `SPC0.lsu.dcc.pref_inst_b;

  // pa, tid are same for LoadIssue and StoreIssue
  assign ldi_pa_b = {`SPC0.lsu.tlb_pgnum[39:13],
                    `SPC0.lsu.lmd.lsu_va_b[12:0]};

//---------------------
// Load Fill

  assign load_fill_e = `SPC0.lsu.dcc.ld_fill_e;
  assign ldf_tid_e   = `SPC0.lsu.cid.cid_tid;
  assign ldf_pa_e    = {`SPC0.lsu.lmd.lmd_fill_addr_e[39:3],3'b0};

//---------------------
// Store Issue

  // blk_inst_w will suppress store_w for 1st of 9 cycles on block store.

  // If Store to IO ASIs, store issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress store_w.

  assign unflushed_store_w = `SPC0.lsu.sbc.unflushed_store_w;

  assign store_w      =   unflushed_store_w &
                          (~(`PROBES0.asi_internal_w | blk_inst_w) |
                            bst_in_prog_w);

  assign atomic_b      = `SPC0.lsu.dcc.atomic_b;
  assign rmo_st_b      = `SPC0.lsu.sbc_rmo_st_b;
  assign blk_inst_b    = `SPC0.lsu.dcc.dcc_blk_inst_b;

  assign sti_tnum_w   = {mycid,sti_tid_w};
  assign sti_size_m   = `SPC0.lsu.dcc_ldst_bmask;

  // flip_size will assert if endian swap for partial store is needed
  assign flip_size_b  = `SPC0.lsu.dcc.pst_asi_b & `SPC0.lsu.dcc.tlb_tte_ie_b & `SPC0.lsu.dcc.tlb_tte_vld_b & `SPC0.lsu.dcc.st_inst_vld_b;

  // Change itype only when control signals are valid
  assign sti_itype_w  = unflushed_store_w ? itype_w : sti_itype_w;

  // It is correct to mix W & B stage signals for this.
  // STD is a 2 cycle instruction.
  // inst valid in W, data in B (1 cycle behind)
  assign sti_data_w    = `SPC0.lsu.sbc.std_inst_w ?
                          sbd_st_data_b :
                          sbd_st_data_w;
  assign sbd_st_data_b = `SPC0.lsu.sbd_st_data_b;

  // Use different pa,tid if block store
  assign sti_pa_b     = bst_in_prog_b ? bst_pa_b  : st_pa_b;
  assign sti_tid_b    = bst_in_prog_b ? bst_tid_b : st_tid_b;

  // stxa to IO ASI are already suppressed since store_w will not assert.
  // sti_suppress is required to also suppress normal st to IO ASI address range.
  assign sti_suppress = (sti_pa_w[39:32] == `IO_ASI_ADDR);

  // Normal Store
  assign st_pa_b      = {`SPC0.lsu.tlb_pgnum[39:13],
                         `SPC0.lsu.lmd.lsu_va_b[12:0]};
  assign st_tid_b     = `SPC0.lsu.dcc.tid_b;

  // Block Store
  assign bst_in_prog_b = `SPC0.lsu.sbc.bst_in_prog_b;
  assign bst_pa_b      = {`SPC0.lsu.sbd.st_addr_b[39:3],3'b0};
  assign bst_tid_b     = `SPC0.lsu.sbc.bst_tid;

//---------------------
// Store Ack

assign asi_st_dequeue[7:0] = `SPC0.lsu.dcc_asi_rtn_vld[7:0] &
                             {8{~`SPC0.lsu.dcc_asi_rtn_rd}};

  assign st_ack_no_asi_e = `SPC0.lsu.cic.cic_st_dequeue[7:0] & 
                           ~asi_st_dequeue[7:0] & 
                           ~`SPC0.lsu.cic.sbc_bst_sel[7:0];

  assign st_ack_rmo_b  = {`SPC0.lsu.sbs7.rmo_st_commit_p4,
                          `SPC0.lsu.sbs6.rmo_st_commit_p4,
                          `SPC0.lsu.sbs5.rmo_st_commit_p4,
                          `SPC0.lsu.sbs4.rmo_st_commit_p4,
                          `SPC0.lsu.sbs3.rmo_st_commit_p4,
                          `SPC0.lsu.sbs2.rmo_st_commit_p4,
                          `SPC0.lsu.sbs1.rmo_st_commit_p4,
                          `SPC0.lsu.sbs0.rmo_st_commit_p4
                         };

  // It is possible to see 2 threads store_ack in same cycle
  // (1 st_ack_no_asi & 1 st_ack_rmo)

  assign store_ack_b   = st_ack_no_asi_b | st_ack_rmo_b;

  // cic_st_atm_cmplt is atomic store completing (same time as store ack)
  // (lsu.lmc.dcl2u_err | dcl2nd_err) indicate a data_access_error condition
  assign st_data_access_e = {8{(`SPC0.lsu.cic.cic_st_atm_cmplt & 
                             (`SPC0.lsu.lmc.dcl2u_err | `SPC0.lsu.lmc.dcl2nd_err))}} &
                            `SPC0.lsu.cic.cic_st_dequeue[7:0];
//---------------------
// Store Inv

  // Same as evict_inv_e but with cpq_evict deasserted
  assign store_inv_e  =  `SPC0.lsu.cic_invalidate_e &
                         (`SPC0.lsu.cic_inv_wen_e!=0)&
                        ~`SPC0.lsu.cic.cpq_evict & 
                        ~`SPC0.lsu.cic.cid_set_inval & 
                        ~`SPC0.lsu.cic.cic_xinval_e &
			~(`SPC0.lsu.cic.cid_pkt_type[4:0] == 5'b10110);
  assign stinv_tnum_e = 
         {`SPC0.lsu.cid.cpq_data_out[`CPX_VACK_CID],
          `SPC0.lsu.cid.cid_tid};

//---------------------
// Store Update

  assign store_update_e = `SPC0.lsu.cic_st_update_e;
  assign stu_tid_e      = `SPC0.lsu.cid.cid_tid;
  assign stu_tnum_e     = {mycid,stu_tid_e};

  assign l1_index = {`SPC0.lsu.cid.cpq_data_out[116],
                     `SPC0.lsu.cid.cpq_data_out[115],
                     `SPC0.lsu.cid.cpq_data_out[114],
                     `SPC0.lsu.cid.cpq_data_out[113],
                     `SPC0.lsu.cid.cpq_data_out[112],
                     `SPC0.lsu.cid.cpq_data_out[122],
                     `SPC0.lsu.cid.cpq_data_out[121]
                    };
  assign l1_way_select = `SPC0.lsu.cid_inv_vec[17:16];

//---------------------
// EvictInv

  // Same as store_inv_e but with cpq_evict asserted
  // LSU can invalidate 1-4 Dcache lines
  assign evict_inv_e[3:0]  =  {4{`SPC0.lsu.cic_invalidate_e &          // enable for 4 bit wen below
                                (`SPC0.lsu.cic_inv_wen_e!=0)&
                               `SPC0.lsu.cic.cpq_evict &
                               ~`SPC0.lsu.cic.cid_set_inval &
                               ~`SPC0.lsu.cic.cic_xinval_e}} &

                              {|(`SPC0.lsu.cic.evict_inv_wen[15:12]),   // 4 bit field - 1 hot.  Send evinv when any one set.
                               |(`SPC0.lsu.cic.evict_inv_wen[11:8]),
                               |(`SPC0.lsu.cic.evict_inv_wen[7:4]),
                               |(`SPC0.lsu.cic.evict_inv_wen[3:0])
                              };

  assign evict_srcid_e  = `SPC0.lsu.cid.cpq_data_out[114:112];


//---------------------
// Detect Store to IO ASI in PCX crossbar packet.
// This causes next Store Ack to be suppressed.

// Normal Store only since atomics are always to cacheable space

// Trigger on Store to crossbar.
// If Store request is retried on crossbar (due to no grant),
// then, st_io_asi will fire multiple times for the same request.
// This is OK because it just causes sta_suppress to be set multiple times.

  assign pcx_req    = `SPC0.spc_pcx_req_pq;
  assign pcx_data   = `SPC0.spc_pcx_data_pa;

  assign st_io_asi  = (pcx_req_1 != 9'b0) & 
                      (pcx_data [`PCX_VALID]==1'b1) & 
                      (pcx_data [`PCX_RQTYP]==`CCX_REQ_ST) & 
                      (pcx_data [103:96]==`IO_ASI_ADDR);  // Upper byte of 40 bit addr

  assign st_io_tid  = pcx_data [`PCX_TID];

  assign stb_state0_m = `SPC0.lsu.sbs0.stb_state_vld[7:0];
  assign stb_state1_m = `SPC0.lsu.sbs1.stb_state_vld[7:0];
  assign stb_state2_m = `SPC0.lsu.sbs2.stb_state_vld[7:0];
  assign stb_state3_m = `SPC0.lsu.sbs3.stb_state_vld[7:0];
  assign stb_state4_m = `SPC0.lsu.sbs4.stb_state_vld[7:0];
  assign stb_state5_m = `SPC0.lsu.sbs5.stb_state_vld[7:0];
  assign stb_state6_m = `SPC0.lsu.sbs6.stb_state_vld[7:0];
  assign stb_state7_m = `SPC0.lsu.sbs7.stb_state_vld[7:0];

//---------------------
// Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  assign load_data_hit = load_w && (hit_w | fraw_w);
  assign ld_miss_b = `SPC0.lsu.dcc.dcc_ld_miss_b;
  assign fraw_w    = `SPC0.lsu.lmc.ld_raw_bypass_w;
  assign hit_w     = ~ld_miss_w & ~stb_hit_w;
  assign miss_w    = ~fraw_w & (ld_miss_w | stb_hit_w);

//---------------------
// Load Pop

  assign perfmon_g      = `SPC0.lsu.lsu_perfmon_trap_g;
  assign perfmon_tid_g  = `SPC0.lsu.lsu_dcerr_tid_g;
  // perfmon_mask will not fire if trap is not enabled or higher priority trap is taken.
  assign perfmon_mask_g = {`SPC0.tlu.fls1.pil_mask_15[3:0], `SPC0.tlu.fls0.pil_mask_15[3:0]} &
                           ~{8 {`SPC0.lsu_dcl2u_err_g | `SPC0.lsu_dcl2nd_err_g}};

  assign perfmon      = perfmon_w;
  assign perfmon_tid  = perfmon_tid_w;
  assign perfmon_tnum = {mycid,perfmon_tid_w};
  assign perfmon_mask = perfmon_mask_w;



//---------------------
// Store Pop

  assign bst_kill      = {`SPC0.lsu.sbs7.bst_kill,
                          `SPC0.lsu.sbs6.bst_kill,
                          `SPC0.lsu.sbs5.bst_kill,
                          `SPC0.lsu.sbs4.bst_kill,
                          `SPC0.lsu.sbs3.bst_kill,
                          `SPC0.lsu.sbs2.bst_kill,
                          `SPC0.lsu.sbs1.bst_kill,
                          `SPC0.lsu.sbs0.bst_kill};
  
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC0.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline from B to W

  ldi_pa_w    <= ldi_pa_b;
  ld_miss_w   <= ld_miss_b;
  stb_hit_w   <= `SPC0.lsu.stb_cam_hit;
  ldi_pf_w    <= ldi_pf_b;
  ldi_size_w  <= ldi_size_b;
  load_fill_m <= load_fill_e;
  load_fill_b <= load_fill_m;
  load_fill_w <= load_fill_b;
  ldf_tid_m   <= ldf_tid_e;
  ldf_tid_b   <= ldf_tid_m;
  ldf_tid_w   <= ldf_tid_b;
  ldf_pa_m    <= ldf_pa_e;
  ldf_pa_b    <= ldf_pa_m;
  ldf_pa_w    <= ldf_pa_b;

  sti_size_b     <= sti_size_m;
  sti_size_w     <= (flip_size_b) ? {sti_size_b[0],sti_size_b[1],sti_size_b[2],sti_size_b[3],
                                     sti_size_b[4],sti_size_b[5],sti_size_b[6],sti_size_b[7]} 
                                  : sti_size_b;
  sti_pa_w       <= sti_pa_b;
  sti_tid_w      <= sti_tid_b;
  st_ack_no_asi_m  <= st_ack_no_asi_e;
  st_ack_no_asi_b  <= st_ack_no_asi_m;
  st_data_access_m <= st_data_access_e;
  st_data_access_b <= st_data_access_m;
  st_data_access_w <= st_data_access_b;
  store_ack_w    <= store_ack_b;
  store_update_m <= store_update_e;
  store_update_b <= store_update_m;
  store_update_w <= store_update_b;
  store_inv_m    <= store_inv_e;
  store_inv_b    <= store_inv_m;
  store_inv_w    <= store_inv_b;
  stinv_tnum_m   <= stinv_tnum_e;
  stinv_tnum_b   <= stinv_tnum_m;
  stinv_tnum_w   <= stinv_tnum_b;
  st_ack_rmo_w   <= st_ack_rmo_b;
  stu_tid_m      <= stu_tid_e;
  stu_tid_b      <= stu_tid_m;
  stu_tid_w      <= stu_tid_b;
  stu_tnum_m     <= stu_tnum_e;
  stu_tnum_b     <= stu_tnum_m;
  stu_tnum_w     <= stu_tnum_b;
  store_pa_b     <= store_pa_m;
  store_pa_w     <= store_pa_b;
  bst_in_prog_w  <= bst_in_prog_b;
  blk_inst_w     <= blk_inst_b;
  sbd_st_data_w  <=  sbd_st_data_b;
  evict_inv_m    <= evict_inv_e;
  evict_inv_b    <= evict_inv_m;
  evict_inv_w    <= evict_inv_b;
  evict_srcid_m  <= evict_srcid_e;
  evict_srcid_b  <= evict_srcid_m;
  evict_srcid_w  <= evict_srcid_b;
  pcx_req_1      <= pcx_req;
  stb_state0_b   <= stb_state0_m;
  stb_state1_b   <= stb_state1_m;
  stb_state2_b   <= stb_state2_m;
  stb_state3_b   <= stb_state3_m;
  stb_state4_b   <= stb_state4_m;
  stb_state5_b   <= stb_state5_m;
  stb_state6_b   <= stb_state6_m;
  stb_state7_b   <= stb_state7_m;
  stb_state0_w   <= stb_state0_b;
  stb_state1_w   <= stb_state1_b;
  stb_state2_w   <= stb_state2_b;
  stb_state3_w   <= stb_state3_b;
  stb_state4_w   <= stb_state4_b;
  stb_state5_w   <= stb_state5_b;
  stb_state6_w   <= stb_state6_b;
  stb_state7_w   <= stb_state7_b;

  perfmon_m      <= perfmon_g;
  perfmon_b      <= perfmon_m;
  perfmon_w      <= perfmon_b;
  perfmon_tid_m  <= perfmon_tid_g;
  perfmon_tid_b  <= perfmon_tid_m;
  perfmon_tid_w  <= perfmon_tid_b;
  perfmon_mask_m <= perfmon_mask_g;
  perfmon_mask_b <= perfmon_mask_m;
  perfmon_mask_w <= perfmon_mask_b;

  //----------------------------------------------------------
  // Calculate pa for STUPDATE and STINV
  // Moved this into the always block to avoid the constant
  // probing of the dtag memory structure.

  if (store_inv_e | store_update_e) begin // {
    store_pa_m[2:0]    <= 3'b000;
    store_pa_m[10:3]   <= {`SPC0.lsu.cid.cpq_data_out[116],
                           `SPC0.lsu.cid.cpq_data_out[115],
                           `SPC0.lsu.cid.cpq_data_out[114],
                           `SPC0.lsu.cid.cpq_data_out[113],
                           `SPC0.lsu.cid.cpq_data_out[112],
                           `SPC0.lsu.cid.cpq_data_out[122],
                           `SPC0.lsu.cid.cpq_data_out[121],
                           `SPC0.lsu.cid.cpq_data_out[104]
                          };
    store_pa_m[38:11] <= (l1_way_select==2'h0) ? dta_way0[l1_index] :
                         (l1_way_select==2'h1) ? dta_way1[l1_index] :
                         (l1_way_select==2'h2) ? dta_way2[l1_index] : dta_way3[l1_index];
    store_pa_m[39]    <= 1'b0;		// Only memory stores get inv/update
  end // }


  // After Store to IO ASI is detected at StI time, suppress the next Store Ack
  // There is only 1 store to IO ASI active at one time per thread because
  //   that is all the LSU allows.
  if (st_io_asi) begin
    sta_suppress [st_io_tid] <= 1'b1;
  end 

  case ({ldi_atomic_b,ldi_bld_b,ldi_ldd_b,ldi_qld_b,ldi_pf_b})
    5'b00000: ldi_itype_w <= `ITYPE_LOAD;
    5'b00001: ldi_itype_w <= `ITYPE_PREFETCH;
    5'b00010: ldi_itype_w <= `ITYPE_QUAD_LOAD;
    5'b00100: ldi_itype_w <= `ITYPE_DOUBLE_LOAD;
    5'b01000: ldi_itype_w <= `ITYPE_BLOCK_LOAD;
    5'b10000: ldi_itype_w <= `ITYPE_ATOMIC;
    default: ldi_itype_w <= `ITYPE_NO; // Illegal
  endcase

  case ({atomic_b,rmo_st_b,bst_in_prog_b})
    3'b000: itype_w <= `ITYPE_STORE;
    3'b010: itype_w <= `ITYPE_BLK_INIT_ST;
    3'b011: itype_w <= `ITYPE_BLOCK_STORE;
    3'b100: itype_w <= `ITYPE_ATOMIC;
    3'b001,
    3'b101,
    3'b110,
    3'b111: itype_w <= `ITYPE_NO; // Illegal
  endcase

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Issue

  //  Load Issue must be before Store Issue for atomic

  if (load_w) begin // {

    if (ldi_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h size=%h  typ=%0h                     ts=%0d",
                            mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_LD_ISSUE,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
      end // }
    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h  Suppress for IO ASI",mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_LOAD  tid=%d pa=%h  ts=%0d  (LSU - W stage)",
                     mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  if (load_data_hit) begin // {

    dsrc = hit_w ? `DSRC_L1 : `DSRC_STB;

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
                         mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
      junk = $sim_send(`PLI_MEM_LD_DATA,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Ack
  //
  // Store Ack cmd must be sent before Store Inv, Store Update for NAS
  // Store Ack & Store Update will be in the same timestamp

  if (store_ack_w != 8'b0) begin // {

    for (i=0; i<=7; i=i+1) begin // {
      if (store_ack_w[i]) begin // {
        sta_tid = i[2:0];
        sta_tnum = {mycid,sta_tid};
        sta_rmo = st_ack_rmo_w[i];

        if (sta_suppress[sta_tid]==1'b0)  begin // {
          if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
            junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
          end // }
        end // }

        else begin // {

          // It is possible for 2 Stores it be in flight because of the delay from CPQ push & pop.
          // So, make sure Bench is suppressing the correct Store.
          case (sta_tid)
            3'h0: stb_state=stb_state0_w;
            3'h1: stb_state=stb_state1_w;
            3'h2: stb_state=stb_state2_w;
            3'h3: stb_state=stb_state3_w;
            3'h4: stb_state=stb_state4_w;
            3'h5: stb_state=stb_state5_w;
            3'h6: stb_state=stb_state6_w;
            3'h7: stb_state=stb_state7_w;
            default: 
              `PR_ERROR ("pli_ldst", `ERROR, 
              "C%0d T%0d PLI_MEM_XXX Bench Error.  Should never execute case default",mycid,sta_tid);
          endcase

          // If stb_state has only 1 bit asserted, then suppress the STACK.  Otherwise, send the STACK.
          case (stb_state) // {
            8'b0000_0000: begin
                `PR_ERROR ("pli_ldst", `ERROR, 
                "C%0d T%0d PLI_MEM_XXX Bench Error.  stb_state should not be 8'b0",
                 mycid,sta_tid);
              end
            8'b0000_0001,
            8'b0000_0010,
            8'b0000_0100,
            8'b0000_1000,
            8'b0001_0000,
            8'b0010_0000,
            8'b0100_0000,
            8'b1000_0000: stb_last = 1'b1;
            default:      stb_last = 1'b0;
          endcase // }

          if (stb_last==1'b0) begin // {
            if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
              `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                  mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
              junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
            end // }
          end // }
          else begin // {
            sta_suppress[sta_tid] <= 1'b0;
            `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d                Suppress for IO ASI",mycid,sta_tid,sta_tnum);
          end // }
        end // }

      end //  if (store_ack_w[i]) }
    end // for }

  end // if (store_ack_w) }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Inv

  if (store_inv_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stinv_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d    PLI_MEM_STINV  tid=%d pa=%h cid=%h                             ts=%0d",
                                  mycid,stinv_tnum_w,store_pa_w,mycid,tstamp);
      junk = $sim_send(`PLI_MEM_ST_INV,mycid,stinv_tnum_w,store_pa_w,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Update

  if (store_update_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stu_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STUP   tid=%d pa=%h                                   ts=%0d",
                           mycid,stu_tid_w,stu_tnum_w,store_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_ST_UPDATE,stu_tnum_w,store_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Fill

  if (load_fill_w) begin // {

    ldf_tnum_w = {mycid,ldf_tid_w};

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldf_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDFILL tid=%d pa=%h                                   ts=%0d",
                         mycid,ldf_tid_w,ldf_tnum_w,ldf_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_LD_FILL,ldf_tnum_w,ldf_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Issue

  if (store_w) begin // {

    if (sti_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sti_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h data=%h sz=%h typ=%0h ts=%0d",
                          mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_ST_ISSUE,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
      end // }

    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h  Suppress for IO ASI",mycid,sti_tid_w,sti_tnum_w,sti_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_STORE tid=%d pa=%h  data=%h sz=%h ts=%0d  (LSU - W stage)",
                     mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // EvictInv
  // Send 1-4 EvictInv messages per cycle - based on how many Dcache lines were invalidated.

  for (i=0; i<=3; i=i+1) begin // {
    if (evict_inv_w[i]) begin // {

      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d    PLI_MEM_EVINV                      cid=%d  srcid=%0d                    ts=%0d",
                                       mycid,mycid,evict_srcid_w,tstamp);
        junk = $sim_send(`PLI_MEM_EVICT_INV,mycid,evict_srcid_w,tstamp);
      end // }

    end // }
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Load Pop - special case

  // This is required in case of a performance monitor trap due to L2 miss.
  // In this case, the trap is not indicated until after the Load pkt returns to the LSU.
  // ldst_sync has already sent LDISSUE and LDDATA to Riesling.  But, the Load is not executed.
  // Load Pop tells Riesling to pop the LDISSUE,LDDATA off of its queues.

  if (perfmon & perfmon_mask[perfmon_tid]) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[perfmon_tnum]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDPOP  tid=%d                                                 ts=%0d",
                           mycid,perfmon_tid,perfmon_tnum,tstamp);
      junk = $sim_send(`PLI_MEM_LD_POP,perfmon_tnum);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Pop - special cases

  // This is required in case of a FRF error trap (internal_proc_error) on a Block Store.
  // In this case, the trap is not indicated until after the 8 STISSUE has been sent to Riesling.
  // But, the Store is not executed.
  // Store Pop tells Riesling to pop the 8 STISSUE off of its queues.

  if (bst_kill!==8'b0) begin // {

    for (i=0;i<=7;i=i+1) begin
      if (bst_kill[i]==1'b1) begin
        bst_kill_tid = i;
        bst_kill_tnum = {mycid,bst_kill_tid};

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[bst_kill_tnum]) begin // {
          `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
                               mycid,bst_kill_tid,bst_kill_tnum,tstamp);
          junk = $sim_send(`PLI_MEM_ST_POP,bst_kill_tnum);
        end // }
      end
    end

  end // }

  //--------------------
  // This is required for data_access_error on atomic.  In this case, Riesling only cleans up the Load,
  // but doesn't know it is an atomic so Riesling doesn't clean up the store in its buffers.
  // The STPOP tells Riesling to clear the newest Store from the buffers.
  // It is possible to have older Stores in-flight but not newer Stores in-flight.

//  if (st_data_access_w != 8'b0) begin // {
//
//    for (i=0; i<=7; i=i+1) begin // {
//      if (st_data_access_w[i]) begin // {
//        tmp_tid = i[2:0];
//        tmp_tnum = {mycid,tmp_tid};
//
//        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[tmp_tnum]) begin // {
//           `PR_INFO ("pli_ldst", `INFO, 
//               "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
//                               mycid,tmp_tid,tmp_tnum,tstamp);
//           junk = $sim_send(`PLI_MEM_ST_POP,tmp_tnum);
//        end // }
//      end // } if st_data_access[i]
//    end // } for
//  end // } if st_data_access

end // always }

//----------------------------------------------------------
// Need to model the D arrays to get PA's for store updates and invalidates

always @ (negedge `SPC0.l2clk) begin // {
  if (`SPC0.lsu.dta.wr_way[0])
    dta_way0[`SPC0.lsu.dta.index_y[6:0]] <= `SPC0.lsu.dta.wrtag_y[27:0];
  if (`SPC0.lsu.dta.wr_way[1])
    dta_way1[`SPC0.lsu.dta.index_y[6:0]] <= `SPC0.lsu.dta.wrtag_y[27:0];
  if (`SPC0.lsu.dta.wr_way[2])
    dta_way2[`SPC0.lsu.dta.index_y[6:0]] <= `SPC0.lsu.dta.wrtag_y[27:0];
  if (`SPC0.lsu.dta.wr_way[3])
    dta_way3[`SPC0.lsu.dta.index_y[6:0]] <= `SPC0.lsu.dta.wrtag_y[27:0];
end // always }

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_1

module ldst_lsu_c1 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "nas.vh"
// PCX/CPX packet defines (see :/verif/env/common/vera/include)
`include "ccx.vri"
`include "cmp.vri"

//---------------------
// Load Signals
wire                       load_w;

wire                       ldi_suppress;
wire                 [2:0] ldi_tid_w;
wire                 [5:0] ldi_tnum_w;
wire                [39:0] ldi_pa_b;
reg                 [39:0] ldi_pa_w;
wire                 [1:0] ldi_size_b;
reg                  [1:0] ldi_size_w;
wire                       ldi_bld_b;
wire                       ldi_qld_b;
wire                       ldi_ldbl_b;
wire                       ldi_ldd_b;
wire                       ldi_atomic_b;
wire                       ldi_pf_b;
reg                        ldi_pf_w;
reg                  [7:0] ldi_itype_w;
reg                  [7:0] dsrc;

wire                       ld_miss_b;
reg                        ld_miss_w;
reg                        stb_hit_w;
wire                       fraw_w;
wire                       hit_w;
wire                       miss_w;
wire                       load_data_hit;

wire                       load_fill_e;
reg                        load_fill_m;
reg                        load_fill_b;
reg                        load_fill_w;
wire                 [2:0] ldf_tid_e;
reg                  [2:0] ldf_tid_m;
reg                  [2:0] ldf_tid_b;
reg                  [2:0] ldf_tid_w;
reg                  [5:0] ldf_tnum_w;
wire                [39:0] ldf_pa_e;
reg                 [39:0] ldf_pa_m;
reg                 [39:0] ldf_pa_b;
reg                 [39:0] ldf_pa_w;

//---------------------
// Store Signals
wire                       unflushed_store_w;
wire                       store_w;
wire                       sti_suppress;
wire                 [2:0] sti_tid_b;
reg                  [2:0] sti_tid_w;
wire                 [5:0] sti_tnum_w;
wire                [39:0] sti_pa_b;
reg                 [39:0] sti_pa_w;
wire                [63:0] sti_data_w;
wire                 [7:0] sti_size_m;
reg                  [7:0] sti_size_b;
reg                  [7:0] sti_size_w;
wire                 [7:0] sti_itype_w;
reg                  [7:0] itype_w;
wire                [63:0] sbd_st_data_b;
reg                 [63:0] sbd_st_data_w;
wire                       flip_size_b;

wire                       atomic_b;
wire                       rmo_st_b;
wire                       blk_inst_b;
reg                        blk_inst_w;

wire                       bst_in_prog_b;
reg                        bst_in_prog_w;
wire                [39:0] bst_pa_b;
reg                 [39:0] bst_pa_w;
wire                 [2:0] bst_tid_b;
reg                  [2:0] bst_tid_w;
wire                [39:0] st_pa_b;
reg                 [39:0] st_pa_w;
wire                 [2:0] st_tid_b;
reg                  [2:0] st_tid_w;

wire                       store_inv_e;
reg                        store_inv_m;
reg                        store_inv_b;
reg                        store_inv_w;
wire                 [5:0] stinv_tnum_e;
reg                  [5:0] stinv_tnum_m;
reg                  [5:0] stinv_tnum_b;
reg                  [5:0] stinv_tnum_w;

wire                       store_update_e;
reg                        store_update_m;
reg                        store_update_b;
reg                        store_update_w;
wire                 [2:0] stu_tid_e;
reg                  [2:0] stu_tid_m;
reg                  [2:0] stu_tid_b;
reg                  [2:0] stu_tid_w;
wire                 [5:0] stu_tnum_e;
reg                  [5:0] stu_tnum_m;
reg                  [5:0] stu_tnum_b;
reg                  [5:0] stu_tnum_w;

wire                 [7:0] asi_st_dequeue;
wire                 [7:0] st_ack_no_asi_e;
reg                  [7:0] st_ack_no_asi_m;
reg                  [7:0] st_ack_no_asi_b;
wire                 [7:0] store_ack_b;
reg                  [7:0] store_ack_w;
wire                 [7:0] st_ack_rmo_b;
reg                  [7:0] st_ack_rmo_w;
reg                        sta_rmo;
reg                  [2:0] sta_tid;
reg                  [5:0] sta_tnum;
reg                        sta_suppress [0:7];  // 1 per thread
wire                       st_io_asi;
wire                 [2:0] st_io_tid;
wire                 [7:0] st_data_access_e;
reg                  [7:0] st_data_access_m;
reg                  [7:0] st_data_access_b;
reg                  [7:0] st_data_access_w;
reg                  [2:0] tmp_tid;
reg                  [5:0] tmp_tnum;

reg                 [39:0] store_pa_m;
reg                 [39:0] store_pa_b;
reg                 [39:0] store_pa_w;

wire                 [1:0] l1_way_select;
wire                 [6:0] l1_index;
wire                [27:0] my_way;
wire                [27:0] way0;
wire                [27:0] way1;
wire                [27:0] way2;
wire                [27:0] way3;

wire                 [3:0] evict_inv_e;
reg                  [3:0] evict_inv_m;
reg                  [3:0] evict_inv_b;
reg                  [3:0] evict_inv_w;
wire                 [2:0] evict_srcid_e;
reg                  [2:0] evict_srcid_m;
reg                  [2:0] evict_srcid_b;
reg                  [2:0] evict_srcid_w;

wire                 [8:0] pcx_req;
reg                  [8:0] pcx_req_1;
wire               [129:0] pcx_data;

wire                       perfmon;
wire                       perfmon_g;
reg                        perfmon_m;
reg                        perfmon_b;
reg                        perfmon_w;
wire                 [2:0] perfmon_tid;
wire                 [2:0] perfmon_tid_g;
reg                  [2:0] perfmon_tid_m;
reg                  [2:0] perfmon_tid_b;
reg                  [2:0] perfmon_tid_w;
wire                 [5:0] perfmon_tnum;
wire                 [7:0] perfmon_mask;
wire                 [7:0] perfmon_mask_g;
reg                  [7:0] perfmon_mask_m;
reg                  [7:0] perfmon_mask_b;
reg                  [7:0] perfmon_mask_w;

wire                 [7:0] bst_kill;
reg                  [2:0] bst_kill_tid;
reg                  [5:0] bst_kill_tnum;

wire                 [7:0] stb_state0_m;
wire                 [7:0] stb_state1_m;
wire                 [7:0] stb_state2_m;
wire                 [7:0] stb_state3_m;
wire                 [7:0] stb_state4_m;
wire                 [7:0] stb_state5_m;
wire                 [7:0] stb_state6_m;
wire                 [7:0] stb_state7_m;
reg                  [7:0] stb_state0_b;
reg                  [7:0] stb_state1_b;
reg                  [7:0] stb_state2_b;
reg                  [7:0] stb_state3_b;
reg                  [7:0] stb_state4_b;
reg                  [7:0] stb_state5_b;
reg                  [7:0] stb_state6_b;
reg                  [7:0] stb_state7_b;
reg                  [7:0] stb_state0_w;
reg                  [7:0] stb_state1_w;
reg                  [7:0] stb_state2_w;
reg                  [7:0] stb_state3_w;
reg                  [7:0] stb_state4_w;
reg                  [7:0] stb_state5_w;
reg                  [7:0] stb_state6_w;
reg                  [7:0] stb_state7_w;
reg                  [7:0] stb_state;
reg                        stb_last;

// Copy of dtag
reg [27:0] dta_way0 [127:0];
reg [27:0] dta_way1 [127:0];
reg [27:0] dta_way2 [127:0];
reg [27:0] dta_way3 [127:0];

//---------------------
// Misc Signals
wire                 [2:0] mycid;
integer                    tstamp;
integer                    junk;
integer                    i;

initial begin // {
  ldf_tnum_w = 6'b0;
  dsrc = 2'b0;
  sta_tid    = 3'b0;
  sta_tnum   = 6'b0;
  for (i=0; i<=7; i=i+1) begin
    sta_suppress[i] = 1'b0;
  end

end // }

// for debug only - allows display in Debussy
wire    sta_suppress0;
wire    sta_suppress1;
wire    sta_suppress2;
wire    sta_suppress3;
wire    sta_suppress4;
wire    sta_suppress5;
wire    sta_suppress6;
wire    sta_suppress7;

  assign   sta_suppress0 = sta_suppress[0];
  assign   sta_suppress1 = sta_suppress[1];
  assign   sta_suppress2 = sta_suppress[2];
  assign   sta_suppress3 = sta_suppress[3];
  assign   sta_suppress4 = sta_suppress[4];
  assign   sta_suppress5 = sta_suppress[5];
  assign   sta_suppress6 = sta_suppress[6];
  assign   sta_suppress7 = sta_suppress[7];

//----------------------------------------------------------
//----------------------------------------------------------
// DUT probes

  assign   mycid = 1;

//---------------------
// Load Issue

  // If Load to IO ASIs, load issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress load_w.

  assign load_w      = `SPC1.lsu.dcc.ld_inst_vld_w & 
                        ~`PROBES1.asi_internal_w &
                        ~`SPC1.lsu.dcc.flush_w &
                        ~ldi_pf_w;

  // ldxa to IO ASI are already suppressed since load_w will not assert.
  // ldi_suppress is required to also suppress normal ld to IO ASI address range.
  assign ldi_suppress = (ldi_pa_w[39:32] == `IO_ASI_ADDR);

  assign ldi_tid_w    = `SPC1.lsu.dcc.tid_w;
  assign ldi_tnum_w   = {mycid,ldi_tid_w};
  assign ldi_size_b   = `SPC1.lsu.dcc.ldst_sz_b;  // 2 bits
  assign ldi_atomic_b = `SPC1.lsu.dcc.atomic_b;
  assign ldi_qld_b    = `SPC1.lsu.dcc.quad_ldd_b;
  assign ldi_ldbl_b   = `SPC1.lsu.dcc_ldbl_b;
  assign ldi_ldd_b    = ldi_ldbl_b & !ldi_qld_b;
  assign ldi_bld_b    = `SPC1.lsu.dcc.dcc_blk_inst_b;
  assign ldi_pf_b     = `SPC1.lsu.dcc.pref_inst_b;

  // pa, tid are same for LoadIssue and StoreIssue
  assign ldi_pa_b = {`SPC1.lsu.tlb_pgnum[39:13],
                    `SPC1.lsu.lmd.lsu_va_b[12:0]};

//---------------------
// Load Fill

  assign load_fill_e = `SPC1.lsu.dcc.ld_fill_e;
  assign ldf_tid_e   = `SPC1.lsu.cid.cid_tid;
  assign ldf_pa_e    = {`SPC1.lsu.lmd.lmd_fill_addr_e[39:3],3'b0};

//---------------------
// Store Issue

  // blk_inst_w will suppress store_w for 1st of 9 cycles on block store.

  // If Store to IO ASIs, store issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress store_w.

  assign unflushed_store_w = `SPC1.lsu.sbc.unflushed_store_w;

  assign store_w      =   unflushed_store_w &
                          (~(`PROBES1.asi_internal_w | blk_inst_w) |
                            bst_in_prog_w);

  assign atomic_b      = `SPC1.lsu.dcc.atomic_b;
  assign rmo_st_b      = `SPC1.lsu.sbc_rmo_st_b;
  assign blk_inst_b    = `SPC1.lsu.dcc.dcc_blk_inst_b;

  assign sti_tnum_w   = {mycid,sti_tid_w};
  assign sti_size_m   = `SPC1.lsu.dcc_ldst_bmask;

  // flip_size will assert if endian swap for partial store is needed
  assign flip_size_b  = `SPC1.lsu.dcc.pst_asi_b & `SPC1.lsu.dcc.tlb_tte_ie_b & `SPC1.lsu.dcc.tlb_tte_vld_b & `SPC1.lsu.dcc.st_inst_vld_b;

  // Change itype only when control signals are valid
  assign sti_itype_w  = unflushed_store_w ? itype_w : sti_itype_w;

  // It is correct to mix W & B stage signals for this.
  // STD is a 2 cycle instruction.
  // inst valid in W, data in B (1 cycle behind)
  assign sti_data_w    = `SPC1.lsu.sbc.std_inst_w ?
                          sbd_st_data_b :
                          sbd_st_data_w;
  assign sbd_st_data_b = `SPC1.lsu.sbd_st_data_b;

  // Use different pa,tid if block store
  assign sti_pa_b     = bst_in_prog_b ? bst_pa_b  : st_pa_b;
  assign sti_tid_b    = bst_in_prog_b ? bst_tid_b : st_tid_b;

  // stxa to IO ASI are already suppressed since store_w will not assert.
  // sti_suppress is required to also suppress normal st to IO ASI address range.
  assign sti_suppress = (sti_pa_w[39:32] == `IO_ASI_ADDR);

  // Normal Store
  assign st_pa_b      = {`SPC1.lsu.tlb_pgnum[39:13],
                         `SPC1.lsu.lmd.lsu_va_b[12:0]};
  assign st_tid_b     = `SPC1.lsu.dcc.tid_b;

  // Block Store
  assign bst_in_prog_b = `SPC1.lsu.sbc.bst_in_prog_b;
  assign bst_pa_b      = {`SPC1.lsu.sbd.st_addr_b[39:3],3'b0};
  assign bst_tid_b     = `SPC1.lsu.sbc.bst_tid;

//---------------------
// Store Ack

assign asi_st_dequeue[7:0] = `SPC1.lsu.dcc_asi_rtn_vld[7:0] &
                             {8{~`SPC1.lsu.dcc_asi_rtn_rd}};

  assign st_ack_no_asi_e = `SPC1.lsu.cic.cic_st_dequeue[7:0] & 
                           ~asi_st_dequeue[7:0] & 
                           ~`SPC1.lsu.cic.sbc_bst_sel[7:0];

  assign st_ack_rmo_b  = {`SPC1.lsu.sbs7.rmo_st_commit_p4,
                          `SPC1.lsu.sbs6.rmo_st_commit_p4,
                          `SPC1.lsu.sbs5.rmo_st_commit_p4,
                          `SPC1.lsu.sbs4.rmo_st_commit_p4,
                          `SPC1.lsu.sbs3.rmo_st_commit_p4,
                          `SPC1.lsu.sbs2.rmo_st_commit_p4,
                          `SPC1.lsu.sbs1.rmo_st_commit_p4,
                          `SPC1.lsu.sbs0.rmo_st_commit_p4
                         };

  // It is possible to see 2 threads store_ack in same cycle
  // (1 st_ack_no_asi & 1 st_ack_rmo)

  assign store_ack_b   = st_ack_no_asi_b | st_ack_rmo_b;

  // cic_st_atm_cmplt is atomic store completing (same time as store ack)
  // (lsu.lmc.dcl2u_err | dcl2nd_err) indicate a data_access_error condition
  assign st_data_access_e = {8{(`SPC1.lsu.cic.cic_st_atm_cmplt & 
                             (`SPC1.lsu.lmc.dcl2u_err | `SPC1.lsu.lmc.dcl2nd_err))}} &
                            `SPC1.lsu.cic.cic_st_dequeue[7:0];
//---------------------
// Store Inv

  // Same as evict_inv_e but with cpq_evict deasserted
  assign store_inv_e  =  `SPC1.lsu.cic_invalidate_e &
                         (`SPC1.lsu.cic_inv_wen_e!=0)&
                        ~`SPC1.lsu.cic.cpq_evict & 
                        ~`SPC1.lsu.cic.cid_set_inval & 
                        ~`SPC1.lsu.cic.cic_xinval_e &
			~(`SPC1.lsu.cic.cid_pkt_type[4:0] == 5'b10110);
  assign stinv_tnum_e = 
         {`SPC1.lsu.cid.cpq_data_out[`CPX_VACK_CID],
          `SPC1.lsu.cid.cid_tid};

//---------------------
// Store Update

  assign store_update_e = `SPC1.lsu.cic_st_update_e;
  assign stu_tid_e      = `SPC1.lsu.cid.cid_tid;
  assign stu_tnum_e     = {mycid,stu_tid_e};

  assign l1_index = {`SPC1.lsu.cid.cpq_data_out[116],
                     `SPC1.lsu.cid.cpq_data_out[115],
                     `SPC1.lsu.cid.cpq_data_out[114],
                     `SPC1.lsu.cid.cpq_data_out[113],
                     `SPC1.lsu.cid.cpq_data_out[112],
                     `SPC1.lsu.cid.cpq_data_out[122],
                     `SPC1.lsu.cid.cpq_data_out[121]
                    };
  assign l1_way_select = `SPC1.lsu.cid_inv_vec[17:16];

//---------------------
// EvictInv

  // Same as store_inv_e but with cpq_evict asserted
  // LSU can invalidate 1-4 Dcache lines
  assign evict_inv_e[3:0]  =  {4{`SPC1.lsu.cic_invalidate_e &          // enable for 4 bit wen below
                                (`SPC1.lsu.cic_inv_wen_e!=0)&
                               `SPC1.lsu.cic.cpq_evict &
                               ~`SPC1.lsu.cic.cid_set_inval &
                               ~`SPC1.lsu.cic.cic_xinval_e}} &

                              {|(`SPC1.lsu.cic.evict_inv_wen[15:12]),   // 4 bit field - 1 hot.  Send evinv when any one set.
                               |(`SPC1.lsu.cic.evict_inv_wen[11:8]),
                               |(`SPC1.lsu.cic.evict_inv_wen[7:4]),
                               |(`SPC1.lsu.cic.evict_inv_wen[3:0])
                              };

  assign evict_srcid_e  = `SPC1.lsu.cid.cpq_data_out[114:112];


//---------------------
// Detect Store to IO ASI in PCX crossbar packet.
// This causes next Store Ack to be suppressed.

// Normal Store only since atomics are always to cacheable space

// Trigger on Store to crossbar.
// If Store request is retried on crossbar (due to no grant),
// then, st_io_asi will fire multiple times for the same request.
// This is OK because it just causes sta_suppress to be set multiple times.

  assign pcx_req    = `SPC1.spc_pcx_req_pq;
  assign pcx_data   = `SPC1.spc_pcx_data_pa;

  assign st_io_asi  = (pcx_req_1 != 9'b0) & 
                      (pcx_data [`PCX_VALID]==1'b1) & 
                      (pcx_data [`PCX_RQTYP]==`CCX_REQ_ST) & 
                      (pcx_data [103:96]==`IO_ASI_ADDR);  // Upper byte of 40 bit addr

  assign st_io_tid  = pcx_data [`PCX_TID];

  assign stb_state0_m = `SPC1.lsu.sbs0.stb_state_vld[7:0];
  assign stb_state1_m = `SPC1.lsu.sbs1.stb_state_vld[7:0];
  assign stb_state2_m = `SPC1.lsu.sbs2.stb_state_vld[7:0];
  assign stb_state3_m = `SPC1.lsu.sbs3.stb_state_vld[7:0];
  assign stb_state4_m = `SPC1.lsu.sbs4.stb_state_vld[7:0];
  assign stb_state5_m = `SPC1.lsu.sbs5.stb_state_vld[7:0];
  assign stb_state6_m = `SPC1.lsu.sbs6.stb_state_vld[7:0];
  assign stb_state7_m = `SPC1.lsu.sbs7.stb_state_vld[7:0];

//---------------------
// Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  assign load_data_hit = load_w && (hit_w | fraw_w);
  assign ld_miss_b = `SPC1.lsu.dcc.dcc_ld_miss_b;
  assign fraw_w    = `SPC1.lsu.lmc.ld_raw_bypass_w;
  assign hit_w     = ~ld_miss_w & ~stb_hit_w;
  assign miss_w    = ~fraw_w & (ld_miss_w | stb_hit_w);

//---------------------
// Load Pop

  assign perfmon_g      = `SPC1.lsu.lsu_perfmon_trap_g;
  assign perfmon_tid_g  = `SPC1.lsu.lsu_dcerr_tid_g;
  // perfmon_mask will not fire if trap is not enabled or higher priority trap is taken.
  assign perfmon_mask_g = {`SPC1.tlu.fls1.pil_mask_15[3:0], `SPC1.tlu.fls0.pil_mask_15[3:0]} &
                           ~{8 {`SPC1.lsu_dcl2u_err_g | `SPC1.lsu_dcl2nd_err_g}};

  assign perfmon      = perfmon_w;
  assign perfmon_tid  = perfmon_tid_w;
  assign perfmon_tnum = {mycid,perfmon_tid_w};
  assign perfmon_mask = perfmon_mask_w;



//---------------------
// Store Pop

  assign bst_kill      = {`SPC1.lsu.sbs7.bst_kill,
                          `SPC1.lsu.sbs6.bst_kill,
                          `SPC1.lsu.sbs5.bst_kill,
                          `SPC1.lsu.sbs4.bst_kill,
                          `SPC1.lsu.sbs3.bst_kill,
                          `SPC1.lsu.sbs2.bst_kill,
                          `SPC1.lsu.sbs1.bst_kill,
                          `SPC1.lsu.sbs0.bst_kill};
  
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC1.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline from B to W

  ldi_pa_w    <= ldi_pa_b;
  ld_miss_w   <= ld_miss_b;
  stb_hit_w   <= `SPC1.lsu.stb_cam_hit;
  ldi_pf_w    <= ldi_pf_b;
  ldi_size_w  <= ldi_size_b;
  load_fill_m <= load_fill_e;
  load_fill_b <= load_fill_m;
  load_fill_w <= load_fill_b;
  ldf_tid_m   <= ldf_tid_e;
  ldf_tid_b   <= ldf_tid_m;
  ldf_tid_w   <= ldf_tid_b;
  ldf_pa_m    <= ldf_pa_e;
  ldf_pa_b    <= ldf_pa_m;
  ldf_pa_w    <= ldf_pa_b;

  sti_size_b     <= sti_size_m;
  sti_size_w     <= (flip_size_b) ? {sti_size_b[0],sti_size_b[1],sti_size_b[2],sti_size_b[3],
                                     sti_size_b[4],sti_size_b[5],sti_size_b[6],sti_size_b[7]} 
                                  : sti_size_b;
  sti_pa_w       <= sti_pa_b;
  sti_tid_w      <= sti_tid_b;
  st_ack_no_asi_m  <= st_ack_no_asi_e;
  st_ack_no_asi_b  <= st_ack_no_asi_m;
  st_data_access_m <= st_data_access_e;
  st_data_access_b <= st_data_access_m;
  st_data_access_w <= st_data_access_b;
  store_ack_w    <= store_ack_b;
  store_update_m <= store_update_e;
  store_update_b <= store_update_m;
  store_update_w <= store_update_b;
  store_inv_m    <= store_inv_e;
  store_inv_b    <= store_inv_m;
  store_inv_w    <= store_inv_b;
  stinv_tnum_m   <= stinv_tnum_e;
  stinv_tnum_b   <= stinv_tnum_m;
  stinv_tnum_w   <= stinv_tnum_b;
  st_ack_rmo_w   <= st_ack_rmo_b;
  stu_tid_m      <= stu_tid_e;
  stu_tid_b      <= stu_tid_m;
  stu_tid_w      <= stu_tid_b;
  stu_tnum_m     <= stu_tnum_e;
  stu_tnum_b     <= stu_tnum_m;
  stu_tnum_w     <= stu_tnum_b;
  store_pa_b     <= store_pa_m;
  store_pa_w     <= store_pa_b;
  bst_in_prog_w  <= bst_in_prog_b;
  blk_inst_w     <= blk_inst_b;
  sbd_st_data_w  <=  sbd_st_data_b;
  evict_inv_m    <= evict_inv_e;
  evict_inv_b    <= evict_inv_m;
  evict_inv_w    <= evict_inv_b;
  evict_srcid_m  <= evict_srcid_e;
  evict_srcid_b  <= evict_srcid_m;
  evict_srcid_w  <= evict_srcid_b;
  pcx_req_1      <= pcx_req;
  stb_state0_b   <= stb_state0_m;
  stb_state1_b   <= stb_state1_m;
  stb_state2_b   <= stb_state2_m;
  stb_state3_b   <= stb_state3_m;
  stb_state4_b   <= stb_state4_m;
  stb_state5_b   <= stb_state5_m;
  stb_state6_b   <= stb_state6_m;
  stb_state7_b   <= stb_state7_m;
  stb_state0_w   <= stb_state0_b;
  stb_state1_w   <= stb_state1_b;
  stb_state2_w   <= stb_state2_b;
  stb_state3_w   <= stb_state3_b;
  stb_state4_w   <= stb_state4_b;
  stb_state5_w   <= stb_state5_b;
  stb_state6_w   <= stb_state6_b;
  stb_state7_w   <= stb_state7_b;

  perfmon_m      <= perfmon_g;
  perfmon_b      <= perfmon_m;
  perfmon_w      <= perfmon_b;
  perfmon_tid_m  <= perfmon_tid_g;
  perfmon_tid_b  <= perfmon_tid_m;
  perfmon_tid_w  <= perfmon_tid_b;
  perfmon_mask_m <= perfmon_mask_g;
  perfmon_mask_b <= perfmon_mask_m;
  perfmon_mask_w <= perfmon_mask_b;

  //----------------------------------------------------------
  // Calculate pa for STUPDATE and STINV
  // Moved this into the always block to avoid the constant
  // probing of the dtag memory structure.

  if (store_inv_e | store_update_e) begin // {
    store_pa_m[2:0]    <= 3'b000;
    store_pa_m[10:3]   <= {`SPC1.lsu.cid.cpq_data_out[116],
                           `SPC1.lsu.cid.cpq_data_out[115],
                           `SPC1.lsu.cid.cpq_data_out[114],
                           `SPC1.lsu.cid.cpq_data_out[113],
                           `SPC1.lsu.cid.cpq_data_out[112],
                           `SPC1.lsu.cid.cpq_data_out[122],
                           `SPC1.lsu.cid.cpq_data_out[121],
                           `SPC1.lsu.cid.cpq_data_out[104]
                          };
    store_pa_m[38:11] <= (l1_way_select==2'h0) ? dta_way0[l1_index] :
                         (l1_way_select==2'h1) ? dta_way1[l1_index] :
                         (l1_way_select==2'h2) ? dta_way2[l1_index] : dta_way3[l1_index];
    store_pa_m[39]    <= 1'b0;		// Only memory stores get inv/update
  end // }


  // After Store to IO ASI is detected at StI time, suppress the next Store Ack
  // There is only 1 store to IO ASI active at one time per thread because
  //   that is all the LSU allows.
  if (st_io_asi) begin
    sta_suppress [st_io_tid] <= 1'b1;
  end 

  case ({ldi_atomic_b,ldi_bld_b,ldi_ldd_b,ldi_qld_b,ldi_pf_b})
    5'b00000: ldi_itype_w <= `ITYPE_LOAD;
    5'b00001: ldi_itype_w <= `ITYPE_PREFETCH;
    5'b00010: ldi_itype_w <= `ITYPE_QUAD_LOAD;
    5'b00100: ldi_itype_w <= `ITYPE_DOUBLE_LOAD;
    5'b01000: ldi_itype_w <= `ITYPE_BLOCK_LOAD;
    5'b10000: ldi_itype_w <= `ITYPE_ATOMIC;
    default: ldi_itype_w <= `ITYPE_NO; // Illegal
  endcase

  case ({atomic_b,rmo_st_b,bst_in_prog_b})
    3'b000: itype_w <= `ITYPE_STORE;
    3'b010: itype_w <= `ITYPE_BLK_INIT_ST;
    3'b011: itype_w <= `ITYPE_BLOCK_STORE;
    3'b100: itype_w <= `ITYPE_ATOMIC;
    3'b001,
    3'b101,
    3'b110,
    3'b111: itype_w <= `ITYPE_NO; // Illegal
  endcase

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Issue

  //  Load Issue must be before Store Issue for atomic

  if (load_w) begin // {

    if (ldi_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h size=%h  typ=%0h                     ts=%0d",
                            mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_LD_ISSUE,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
      end // }
    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h  Suppress for IO ASI",mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_LOAD  tid=%d pa=%h  ts=%0d  (LSU - W stage)",
                     mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  if (load_data_hit) begin // {

    dsrc = hit_w ? `DSRC_L1 : `DSRC_STB;

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
                         mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
      junk = $sim_send(`PLI_MEM_LD_DATA,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Ack
  //
  // Store Ack cmd must be sent before Store Inv, Store Update for NAS
  // Store Ack & Store Update will be in the same timestamp

  if (store_ack_w != 8'b0) begin // {

    for (i=0; i<=7; i=i+1) begin // {
      if (store_ack_w[i]) begin // {
        sta_tid = i[2:0];
        sta_tnum = {mycid,sta_tid};
        sta_rmo = st_ack_rmo_w[i];

        if (sta_suppress[sta_tid]==1'b0)  begin // {
          if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
            junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
          end // }
        end // }

        else begin // {

          // It is possible for 2 Stores it be in flight because of the delay from CPQ push & pop.
          // So, make sure Bench is suppressing the correct Store.
          case (sta_tid)
            3'h0: stb_state=stb_state0_w;
            3'h1: stb_state=stb_state1_w;
            3'h2: stb_state=stb_state2_w;
            3'h3: stb_state=stb_state3_w;
            3'h4: stb_state=stb_state4_w;
            3'h5: stb_state=stb_state5_w;
            3'h6: stb_state=stb_state6_w;
            3'h7: stb_state=stb_state7_w;
            default: 
              `PR_ERROR ("pli_ldst", `ERROR, 
              "C%0d T%0d PLI_MEM_XXX Bench Error.  Should never execute case default",mycid,sta_tid);
          endcase

          // If stb_state has only 1 bit asserted, then suppress the STACK.  Otherwise, send the STACK.
          case (stb_state) // {
            8'b0000_0000: begin
                `PR_ERROR ("pli_ldst", `ERROR, 
                "C%0d T%0d PLI_MEM_XXX Bench Error.  stb_state should not be 8'b0",
                 mycid,sta_tid);
              end
            8'b0000_0001,
            8'b0000_0010,
            8'b0000_0100,
            8'b0000_1000,
            8'b0001_0000,
            8'b0010_0000,
            8'b0100_0000,
            8'b1000_0000: stb_last = 1'b1;
            default:      stb_last = 1'b0;
          endcase // }

          if (stb_last==1'b0) begin // {
            if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
              `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                  mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
              junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
            end // }
          end // }
          else begin // {
            sta_suppress[sta_tid] <= 1'b0;
            `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d                Suppress for IO ASI",mycid,sta_tid,sta_tnum);
          end // }
        end // }

      end //  if (store_ack_w[i]) }
    end // for }

  end // if (store_ack_w) }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Inv

  if (store_inv_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stinv_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d    PLI_MEM_STINV  tid=%d pa=%h cid=%h                             ts=%0d",
                                  mycid,stinv_tnum_w,store_pa_w,mycid,tstamp);
      junk = $sim_send(`PLI_MEM_ST_INV,mycid,stinv_tnum_w,store_pa_w,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Update

  if (store_update_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stu_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STUP   tid=%d pa=%h                                   ts=%0d",
                           mycid,stu_tid_w,stu_tnum_w,store_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_ST_UPDATE,stu_tnum_w,store_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Fill

  if (load_fill_w) begin // {

    ldf_tnum_w = {mycid,ldf_tid_w};

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldf_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDFILL tid=%d pa=%h                                   ts=%0d",
                         mycid,ldf_tid_w,ldf_tnum_w,ldf_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_LD_FILL,ldf_tnum_w,ldf_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Issue

  if (store_w) begin // {

    if (sti_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sti_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h data=%h sz=%h typ=%0h ts=%0d",
                          mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_ST_ISSUE,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
      end // }

    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h  Suppress for IO ASI",mycid,sti_tid_w,sti_tnum_w,sti_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_STORE tid=%d pa=%h  data=%h sz=%h ts=%0d  (LSU - W stage)",
                     mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // EvictInv
  // Send 1-4 EvictInv messages per cycle - based on how many Dcache lines were invalidated.

  for (i=0; i<=3; i=i+1) begin // {
    if (evict_inv_w[i]) begin // {

      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d    PLI_MEM_EVINV                      cid=%d  srcid=%0d                    ts=%0d",
                                       mycid,mycid,evict_srcid_w,tstamp);
        junk = $sim_send(`PLI_MEM_EVICT_INV,mycid,evict_srcid_w,tstamp);
      end // }

    end // }
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Load Pop - special case

  // This is required in case of a performance monitor trap due to L2 miss.
  // In this case, the trap is not indicated until after the Load pkt returns to the LSU.
  // ldst_sync has already sent LDISSUE and LDDATA to Riesling.  But, the Load is not executed.
  // Load Pop tells Riesling to pop the LDISSUE,LDDATA off of its queues.

  if (perfmon & perfmon_mask[perfmon_tid]) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[perfmon_tnum]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDPOP  tid=%d                                                 ts=%0d",
                           mycid,perfmon_tid,perfmon_tnum,tstamp);
      junk = $sim_send(`PLI_MEM_LD_POP,perfmon_tnum);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Pop - special cases

  // This is required in case of a FRF error trap (internal_proc_error) on a Block Store.
  // In this case, the trap is not indicated until after the 8 STISSUE has been sent to Riesling.
  // But, the Store is not executed.
  // Store Pop tells Riesling to pop the 8 STISSUE off of its queues.

  if (bst_kill!==8'b0) begin // {

    for (i=0;i<=7;i=i+1) begin
      if (bst_kill[i]==1'b1) begin
        bst_kill_tid = i;
        bst_kill_tnum = {mycid,bst_kill_tid};

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[bst_kill_tnum]) begin // {
          `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
                               mycid,bst_kill_tid,bst_kill_tnum,tstamp);
          junk = $sim_send(`PLI_MEM_ST_POP,bst_kill_tnum);
        end // }
      end
    end

  end // }

  //--------------------
  // This is required for data_access_error on atomic.  In this case, Riesling only cleans up the Load,
  // but doesn't know it is an atomic so Riesling doesn't clean up the store in its buffers.
  // The STPOP tells Riesling to clear the newest Store from the buffers.
  // It is possible to have older Stores in-flight but not newer Stores in-flight.

//  if (st_data_access_w != 8'b0) begin // {
//
//    for (i=0; i<=7; i=i+1) begin // {
//      if (st_data_access_w[i]) begin // {
//        tmp_tid = i[2:0];
//        tmp_tnum = {mycid,tmp_tid};
//
//        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[tmp_tnum]) begin // {
//           `PR_INFO ("pli_ldst", `INFO, 
//               "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
//                               mycid,tmp_tid,tmp_tnum,tstamp);
//           junk = $sim_send(`PLI_MEM_ST_POP,tmp_tnum);
//        end // }
//      end // } if st_data_access[i]
//    end // } for
//  end // } if st_data_access

end // always }

//----------------------------------------------------------
// Need to model the D arrays to get PA's for store updates and invalidates

always @ (negedge `SPC1.l2clk) begin // {
  if (`SPC1.lsu.dta.wr_way[0])
    dta_way0[`SPC1.lsu.dta.index_y[6:0]] <= `SPC1.lsu.dta.wrtag_y[27:0];
  if (`SPC1.lsu.dta.wr_way[1])
    dta_way1[`SPC1.lsu.dta.index_y[6:0]] <= `SPC1.lsu.dta.wrtag_y[27:0];
  if (`SPC1.lsu.dta.wr_way[2])
    dta_way2[`SPC1.lsu.dta.index_y[6:0]] <= `SPC1.lsu.dta.wrtag_y[27:0];
  if (`SPC1.lsu.dta.wr_way[3])
    dta_way3[`SPC1.lsu.dta.index_y[6:0]] <= `SPC1.lsu.dta.wrtag_y[27:0];
end // always }

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_2

module ldst_lsu_c2 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "nas.vh"
// PCX/CPX packet defines (see :/verif/env/common/vera/include)
`include "ccx.vri"
`include "cmp.vri"

//---------------------
// Load Signals
wire                       load_w;

wire                       ldi_suppress;
wire                 [2:0] ldi_tid_w;
wire                 [5:0] ldi_tnum_w;
wire                [39:0] ldi_pa_b;
reg                 [39:0] ldi_pa_w;
wire                 [1:0] ldi_size_b;
reg                  [1:0] ldi_size_w;
wire                       ldi_bld_b;
wire                       ldi_qld_b;
wire                       ldi_ldbl_b;
wire                       ldi_ldd_b;
wire                       ldi_atomic_b;
wire                       ldi_pf_b;
reg                        ldi_pf_w;
reg                  [7:0] ldi_itype_w;
reg                  [7:0] dsrc;

wire                       ld_miss_b;
reg                        ld_miss_w;
reg                        stb_hit_w;
wire                       fraw_w;
wire                       hit_w;
wire                       miss_w;
wire                       load_data_hit;

wire                       load_fill_e;
reg                        load_fill_m;
reg                        load_fill_b;
reg                        load_fill_w;
wire                 [2:0] ldf_tid_e;
reg                  [2:0] ldf_tid_m;
reg                  [2:0] ldf_tid_b;
reg                  [2:0] ldf_tid_w;
reg                  [5:0] ldf_tnum_w;
wire                [39:0] ldf_pa_e;
reg                 [39:0] ldf_pa_m;
reg                 [39:0] ldf_pa_b;
reg                 [39:0] ldf_pa_w;

//---------------------
// Store Signals
wire                       unflushed_store_w;
wire                       store_w;
wire                       sti_suppress;
wire                 [2:0] sti_tid_b;
reg                  [2:0] sti_tid_w;
wire                 [5:0] sti_tnum_w;
wire                [39:0] sti_pa_b;
reg                 [39:0] sti_pa_w;
wire                [63:0] sti_data_w;
wire                 [7:0] sti_size_m;
reg                  [7:0] sti_size_b;
reg                  [7:0] sti_size_w;
wire                 [7:0] sti_itype_w;
reg                  [7:0] itype_w;
wire                [63:0] sbd_st_data_b;
reg                 [63:0] sbd_st_data_w;
wire                       flip_size_b;

wire                       atomic_b;
wire                       rmo_st_b;
wire                       blk_inst_b;
reg                        blk_inst_w;

wire                       bst_in_prog_b;
reg                        bst_in_prog_w;
wire                [39:0] bst_pa_b;
reg                 [39:0] bst_pa_w;
wire                 [2:0] bst_tid_b;
reg                  [2:0] bst_tid_w;
wire                [39:0] st_pa_b;
reg                 [39:0] st_pa_w;
wire                 [2:0] st_tid_b;
reg                  [2:0] st_tid_w;

wire                       store_inv_e;
reg                        store_inv_m;
reg                        store_inv_b;
reg                        store_inv_w;
wire                 [5:0] stinv_tnum_e;
reg                  [5:0] stinv_tnum_m;
reg                  [5:0] stinv_tnum_b;
reg                  [5:0] stinv_tnum_w;

wire                       store_update_e;
reg                        store_update_m;
reg                        store_update_b;
reg                        store_update_w;
wire                 [2:0] stu_tid_e;
reg                  [2:0] stu_tid_m;
reg                  [2:0] stu_tid_b;
reg                  [2:0] stu_tid_w;
wire                 [5:0] stu_tnum_e;
reg                  [5:0] stu_tnum_m;
reg                  [5:0] stu_tnum_b;
reg                  [5:0] stu_tnum_w;

wire                 [7:0] asi_st_dequeue;
wire                 [7:0] st_ack_no_asi_e;
reg                  [7:0] st_ack_no_asi_m;
reg                  [7:0] st_ack_no_asi_b;
wire                 [7:0] store_ack_b;
reg                  [7:0] store_ack_w;
wire                 [7:0] st_ack_rmo_b;
reg                  [7:0] st_ack_rmo_w;
reg                        sta_rmo;
reg                  [2:0] sta_tid;
reg                  [5:0] sta_tnum;
reg                        sta_suppress [0:7];  // 1 per thread
wire                       st_io_asi;
wire                 [2:0] st_io_tid;
wire                 [7:0] st_data_access_e;
reg                  [7:0] st_data_access_m;
reg                  [7:0] st_data_access_b;
reg                  [7:0] st_data_access_w;
reg                  [2:0] tmp_tid;
reg                  [5:0] tmp_tnum;

reg                 [39:0] store_pa_m;
reg                 [39:0] store_pa_b;
reg                 [39:0] store_pa_w;

wire                 [1:0] l1_way_select;
wire                 [6:0] l1_index;
wire                [27:0] my_way;
wire                [27:0] way0;
wire                [27:0] way1;
wire                [27:0] way2;
wire                [27:0] way3;

wire                 [3:0] evict_inv_e;
reg                  [3:0] evict_inv_m;
reg                  [3:0] evict_inv_b;
reg                  [3:0] evict_inv_w;
wire                 [2:0] evict_srcid_e;
reg                  [2:0] evict_srcid_m;
reg                  [2:0] evict_srcid_b;
reg                  [2:0] evict_srcid_w;

wire                 [8:0] pcx_req;
reg                  [8:0] pcx_req_1;
wire               [129:0] pcx_data;

wire                       perfmon;
wire                       perfmon_g;
reg                        perfmon_m;
reg                        perfmon_b;
reg                        perfmon_w;
wire                 [2:0] perfmon_tid;
wire                 [2:0] perfmon_tid_g;
reg                  [2:0] perfmon_tid_m;
reg                  [2:0] perfmon_tid_b;
reg                  [2:0] perfmon_tid_w;
wire                 [5:0] perfmon_tnum;
wire                 [7:0] perfmon_mask;
wire                 [7:0] perfmon_mask_g;
reg                  [7:0] perfmon_mask_m;
reg                  [7:0] perfmon_mask_b;
reg                  [7:0] perfmon_mask_w;

wire                 [7:0] bst_kill;
reg                  [2:0] bst_kill_tid;
reg                  [5:0] bst_kill_tnum;

wire                 [7:0] stb_state0_m;
wire                 [7:0] stb_state1_m;
wire                 [7:0] stb_state2_m;
wire                 [7:0] stb_state3_m;
wire                 [7:0] stb_state4_m;
wire                 [7:0] stb_state5_m;
wire                 [7:0] stb_state6_m;
wire                 [7:0] stb_state7_m;
reg                  [7:0] stb_state0_b;
reg                  [7:0] stb_state1_b;
reg                  [7:0] stb_state2_b;
reg                  [7:0] stb_state3_b;
reg                  [7:0] stb_state4_b;
reg                  [7:0] stb_state5_b;
reg                  [7:0] stb_state6_b;
reg                  [7:0] stb_state7_b;
reg                  [7:0] stb_state0_w;
reg                  [7:0] stb_state1_w;
reg                  [7:0] stb_state2_w;
reg                  [7:0] stb_state3_w;
reg                  [7:0] stb_state4_w;
reg                  [7:0] stb_state5_w;
reg                  [7:0] stb_state6_w;
reg                  [7:0] stb_state7_w;
reg                  [7:0] stb_state;
reg                        stb_last;

// Copy of dtag
reg [27:0] dta_way0 [127:0];
reg [27:0] dta_way1 [127:0];
reg [27:0] dta_way2 [127:0];
reg [27:0] dta_way3 [127:0];

//---------------------
// Misc Signals
wire                 [2:0] mycid;
integer                    tstamp;
integer                    junk;
integer                    i;

initial begin // {
  ldf_tnum_w = 6'b0;
  dsrc = 2'b0;
  sta_tid    = 3'b0;
  sta_tnum   = 6'b0;
  for (i=0; i<=7; i=i+1) begin
    sta_suppress[i] = 1'b0;
  end

end // }

// for debug only - allows display in Debussy
wire    sta_suppress0;
wire    sta_suppress1;
wire    sta_suppress2;
wire    sta_suppress3;
wire    sta_suppress4;
wire    sta_suppress5;
wire    sta_suppress6;
wire    sta_suppress7;

  assign   sta_suppress0 = sta_suppress[0];
  assign   sta_suppress1 = sta_suppress[1];
  assign   sta_suppress2 = sta_suppress[2];
  assign   sta_suppress3 = sta_suppress[3];
  assign   sta_suppress4 = sta_suppress[4];
  assign   sta_suppress5 = sta_suppress[5];
  assign   sta_suppress6 = sta_suppress[6];
  assign   sta_suppress7 = sta_suppress[7];

//----------------------------------------------------------
//----------------------------------------------------------
// DUT probes

  assign   mycid = 2;

//---------------------
// Load Issue

  // If Load to IO ASIs, load issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress load_w.

  assign load_w      = `SPC2.lsu.dcc.ld_inst_vld_w & 
                        ~`PROBES2.asi_internal_w &
                        ~`SPC2.lsu.dcc.flush_w &
                        ~ldi_pf_w;

  // ldxa to IO ASI are already suppressed since load_w will not assert.
  // ldi_suppress is required to also suppress normal ld to IO ASI address range.
  assign ldi_suppress = (ldi_pa_w[39:32] == `IO_ASI_ADDR);

  assign ldi_tid_w    = `SPC2.lsu.dcc.tid_w;
  assign ldi_tnum_w   = {mycid,ldi_tid_w};
  assign ldi_size_b   = `SPC2.lsu.dcc.ldst_sz_b;  // 2 bits
  assign ldi_atomic_b = `SPC2.lsu.dcc.atomic_b;
  assign ldi_qld_b    = `SPC2.lsu.dcc.quad_ldd_b;
  assign ldi_ldbl_b   = `SPC2.lsu.dcc_ldbl_b;
  assign ldi_ldd_b    = ldi_ldbl_b & !ldi_qld_b;
  assign ldi_bld_b    = `SPC2.lsu.dcc.dcc_blk_inst_b;
  assign ldi_pf_b     = `SPC2.lsu.dcc.pref_inst_b;

  // pa, tid are same for LoadIssue and StoreIssue
  assign ldi_pa_b = {`SPC2.lsu.tlb_pgnum[39:13],
                    `SPC2.lsu.lmd.lsu_va_b[12:0]};

//---------------------
// Load Fill

  assign load_fill_e = `SPC2.lsu.dcc.ld_fill_e;
  assign ldf_tid_e   = `SPC2.lsu.cid.cid_tid;
  assign ldf_pa_e    = {`SPC2.lsu.lmd.lmd_fill_addr_e[39:3],3'b0};

//---------------------
// Store Issue

  // blk_inst_w will suppress store_w for 1st of 9 cycles on block store.

  // If Store to IO ASIs, store issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress store_w.

  assign unflushed_store_w = `SPC2.lsu.sbc.unflushed_store_w;

  assign store_w      =   unflushed_store_w &
                          (~(`PROBES2.asi_internal_w | blk_inst_w) |
                            bst_in_prog_w);

  assign atomic_b      = `SPC2.lsu.dcc.atomic_b;
  assign rmo_st_b      = `SPC2.lsu.sbc_rmo_st_b;
  assign blk_inst_b    = `SPC2.lsu.dcc.dcc_blk_inst_b;

  assign sti_tnum_w   = {mycid,sti_tid_w};
  assign sti_size_m   = `SPC2.lsu.dcc_ldst_bmask;

  // flip_size will assert if endian swap for partial store is needed
  assign flip_size_b  = `SPC2.lsu.dcc.pst_asi_b & `SPC2.lsu.dcc.tlb_tte_ie_b & `SPC2.lsu.dcc.tlb_tte_vld_b & `SPC2.lsu.dcc.st_inst_vld_b;

  // Change itype only when control signals are valid
  assign sti_itype_w  = unflushed_store_w ? itype_w : sti_itype_w;

  // It is correct to mix W & B stage signals for this.
  // STD is a 2 cycle instruction.
  // inst valid in W, data in B (1 cycle behind)
  assign sti_data_w    = `SPC2.lsu.sbc.std_inst_w ?
                          sbd_st_data_b :
                          sbd_st_data_w;
  assign sbd_st_data_b = `SPC2.lsu.sbd_st_data_b;

  // Use different pa,tid if block store
  assign sti_pa_b     = bst_in_prog_b ? bst_pa_b  : st_pa_b;
  assign sti_tid_b    = bst_in_prog_b ? bst_tid_b : st_tid_b;

  // stxa to IO ASI are already suppressed since store_w will not assert.
  // sti_suppress is required to also suppress normal st to IO ASI address range.
  assign sti_suppress = (sti_pa_w[39:32] == `IO_ASI_ADDR);

  // Normal Store
  assign st_pa_b      = {`SPC2.lsu.tlb_pgnum[39:13],
                         `SPC2.lsu.lmd.lsu_va_b[12:0]};
  assign st_tid_b     = `SPC2.lsu.dcc.tid_b;

  // Block Store
  assign bst_in_prog_b = `SPC2.lsu.sbc.bst_in_prog_b;
  assign bst_pa_b      = {`SPC2.lsu.sbd.st_addr_b[39:3],3'b0};
  assign bst_tid_b     = `SPC2.lsu.sbc.bst_tid;

//---------------------
// Store Ack

assign asi_st_dequeue[7:0] = `SPC2.lsu.dcc_asi_rtn_vld[7:0] &
                             {8{~`SPC2.lsu.dcc_asi_rtn_rd}};

  assign st_ack_no_asi_e = `SPC2.lsu.cic.cic_st_dequeue[7:0] & 
                           ~asi_st_dequeue[7:0] & 
                           ~`SPC2.lsu.cic.sbc_bst_sel[7:0];

  assign st_ack_rmo_b  = {`SPC2.lsu.sbs7.rmo_st_commit_p4,
                          `SPC2.lsu.sbs6.rmo_st_commit_p4,
                          `SPC2.lsu.sbs5.rmo_st_commit_p4,
                          `SPC2.lsu.sbs4.rmo_st_commit_p4,
                          `SPC2.lsu.sbs3.rmo_st_commit_p4,
                          `SPC2.lsu.sbs2.rmo_st_commit_p4,
                          `SPC2.lsu.sbs1.rmo_st_commit_p4,
                          `SPC2.lsu.sbs0.rmo_st_commit_p4
                         };

  // It is possible to see 2 threads store_ack in same cycle
  // (1 st_ack_no_asi & 1 st_ack_rmo)

  assign store_ack_b   = st_ack_no_asi_b | st_ack_rmo_b;

  // cic_st_atm_cmplt is atomic store completing (same time as store ack)
  // (lsu.lmc.dcl2u_err | dcl2nd_err) indicate a data_access_error condition
  assign st_data_access_e = {8{(`SPC2.lsu.cic.cic_st_atm_cmplt & 
                             (`SPC2.lsu.lmc.dcl2u_err | `SPC2.lsu.lmc.dcl2nd_err))}} &
                            `SPC2.lsu.cic.cic_st_dequeue[7:0];
//---------------------
// Store Inv

  // Same as evict_inv_e but with cpq_evict deasserted
  assign store_inv_e  =  `SPC2.lsu.cic_invalidate_e &
                         (`SPC2.lsu.cic_inv_wen_e!=0)&
                        ~`SPC2.lsu.cic.cpq_evict & 
                        ~`SPC2.lsu.cic.cid_set_inval & 
                        ~`SPC2.lsu.cic.cic_xinval_e &
			~(`SPC2.lsu.cic.cid_pkt_type[4:0] == 5'b10110);
  assign stinv_tnum_e = 
         {`SPC2.lsu.cid.cpq_data_out[`CPX_VACK_CID],
          `SPC2.lsu.cid.cid_tid};

//---------------------
// Store Update

  assign store_update_e = `SPC2.lsu.cic_st_update_e;
  assign stu_tid_e      = `SPC2.lsu.cid.cid_tid;
  assign stu_tnum_e     = {mycid,stu_tid_e};

  assign l1_index = {`SPC2.lsu.cid.cpq_data_out[116],
                     `SPC2.lsu.cid.cpq_data_out[115],
                     `SPC2.lsu.cid.cpq_data_out[114],
                     `SPC2.lsu.cid.cpq_data_out[113],
                     `SPC2.lsu.cid.cpq_data_out[112],
                     `SPC2.lsu.cid.cpq_data_out[122],
                     `SPC2.lsu.cid.cpq_data_out[121]
                    };
  assign l1_way_select = `SPC2.lsu.cid_inv_vec[17:16];

//---------------------
// EvictInv

  // Same as store_inv_e but with cpq_evict asserted
  // LSU can invalidate 1-4 Dcache lines
  assign evict_inv_e[3:0]  =  {4{`SPC2.lsu.cic_invalidate_e &          // enable for 4 bit wen below
                                (`SPC2.lsu.cic_inv_wen_e!=0)&
                               `SPC2.lsu.cic.cpq_evict &
                               ~`SPC2.lsu.cic.cid_set_inval &
                               ~`SPC2.lsu.cic.cic_xinval_e}} &

                              {|(`SPC2.lsu.cic.evict_inv_wen[15:12]),   // 4 bit field - 1 hot.  Send evinv when any one set.
                               |(`SPC2.lsu.cic.evict_inv_wen[11:8]),
                               |(`SPC2.lsu.cic.evict_inv_wen[7:4]),
                               |(`SPC2.lsu.cic.evict_inv_wen[3:0])
                              };

  assign evict_srcid_e  = `SPC2.lsu.cid.cpq_data_out[114:112];


//---------------------
// Detect Store to IO ASI in PCX crossbar packet.
// This causes next Store Ack to be suppressed.

// Normal Store only since atomics are always to cacheable space

// Trigger on Store to crossbar.
// If Store request is retried on crossbar (due to no grant),
// then, st_io_asi will fire multiple times for the same request.
// This is OK because it just causes sta_suppress to be set multiple times.

  assign pcx_req    = `SPC2.spc_pcx_req_pq;
  assign pcx_data   = `SPC2.spc_pcx_data_pa;

  assign st_io_asi  = (pcx_req_1 != 9'b0) & 
                      (pcx_data [`PCX_VALID]==1'b1) & 
                      (pcx_data [`PCX_RQTYP]==`CCX_REQ_ST) & 
                      (pcx_data [103:96]==`IO_ASI_ADDR);  // Upper byte of 40 bit addr

  assign st_io_tid  = pcx_data [`PCX_TID];

  assign stb_state0_m = `SPC2.lsu.sbs0.stb_state_vld[7:0];
  assign stb_state1_m = `SPC2.lsu.sbs1.stb_state_vld[7:0];
  assign stb_state2_m = `SPC2.lsu.sbs2.stb_state_vld[7:0];
  assign stb_state3_m = `SPC2.lsu.sbs3.stb_state_vld[7:0];
  assign stb_state4_m = `SPC2.lsu.sbs4.stb_state_vld[7:0];
  assign stb_state5_m = `SPC2.lsu.sbs5.stb_state_vld[7:0];
  assign stb_state6_m = `SPC2.lsu.sbs6.stb_state_vld[7:0];
  assign stb_state7_m = `SPC2.lsu.sbs7.stb_state_vld[7:0];

//---------------------
// Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  assign load_data_hit = load_w && (hit_w | fraw_w);
  assign ld_miss_b = `SPC2.lsu.dcc.dcc_ld_miss_b;
  assign fraw_w    = `SPC2.lsu.lmc.ld_raw_bypass_w;
  assign hit_w     = ~ld_miss_w & ~stb_hit_w;
  assign miss_w    = ~fraw_w & (ld_miss_w | stb_hit_w);

//---------------------
// Load Pop

  assign perfmon_g      = `SPC2.lsu.lsu_perfmon_trap_g;
  assign perfmon_tid_g  = `SPC2.lsu.lsu_dcerr_tid_g;
  // perfmon_mask will not fire if trap is not enabled or higher priority trap is taken.
  assign perfmon_mask_g = {`SPC2.tlu.fls1.pil_mask_15[3:0], `SPC2.tlu.fls0.pil_mask_15[3:0]} &
                           ~{8 {`SPC2.lsu_dcl2u_err_g | `SPC2.lsu_dcl2nd_err_g}};

  assign perfmon      = perfmon_w;
  assign perfmon_tid  = perfmon_tid_w;
  assign perfmon_tnum = {mycid,perfmon_tid_w};
  assign perfmon_mask = perfmon_mask_w;



//---------------------
// Store Pop

  assign bst_kill      = {`SPC2.lsu.sbs7.bst_kill,
                          `SPC2.lsu.sbs6.bst_kill,
                          `SPC2.lsu.sbs5.bst_kill,
                          `SPC2.lsu.sbs4.bst_kill,
                          `SPC2.lsu.sbs3.bst_kill,
                          `SPC2.lsu.sbs2.bst_kill,
                          `SPC2.lsu.sbs1.bst_kill,
                          `SPC2.lsu.sbs0.bst_kill};
  
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC2.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline from B to W

  ldi_pa_w    <= ldi_pa_b;
  ld_miss_w   <= ld_miss_b;
  stb_hit_w   <= `SPC2.lsu.stb_cam_hit;
  ldi_pf_w    <= ldi_pf_b;
  ldi_size_w  <= ldi_size_b;
  load_fill_m <= load_fill_e;
  load_fill_b <= load_fill_m;
  load_fill_w <= load_fill_b;
  ldf_tid_m   <= ldf_tid_e;
  ldf_tid_b   <= ldf_tid_m;
  ldf_tid_w   <= ldf_tid_b;
  ldf_pa_m    <= ldf_pa_e;
  ldf_pa_b    <= ldf_pa_m;
  ldf_pa_w    <= ldf_pa_b;

  sti_size_b     <= sti_size_m;
  sti_size_w     <= (flip_size_b) ? {sti_size_b[0],sti_size_b[1],sti_size_b[2],sti_size_b[3],
                                     sti_size_b[4],sti_size_b[5],sti_size_b[6],sti_size_b[7]} 
                                  : sti_size_b;
  sti_pa_w       <= sti_pa_b;
  sti_tid_w      <= sti_tid_b;
  st_ack_no_asi_m  <= st_ack_no_asi_e;
  st_ack_no_asi_b  <= st_ack_no_asi_m;
  st_data_access_m <= st_data_access_e;
  st_data_access_b <= st_data_access_m;
  st_data_access_w <= st_data_access_b;
  store_ack_w    <= store_ack_b;
  store_update_m <= store_update_e;
  store_update_b <= store_update_m;
  store_update_w <= store_update_b;
  store_inv_m    <= store_inv_e;
  store_inv_b    <= store_inv_m;
  store_inv_w    <= store_inv_b;
  stinv_tnum_m   <= stinv_tnum_e;
  stinv_tnum_b   <= stinv_tnum_m;
  stinv_tnum_w   <= stinv_tnum_b;
  st_ack_rmo_w   <= st_ack_rmo_b;
  stu_tid_m      <= stu_tid_e;
  stu_tid_b      <= stu_tid_m;
  stu_tid_w      <= stu_tid_b;
  stu_tnum_m     <= stu_tnum_e;
  stu_tnum_b     <= stu_tnum_m;
  stu_tnum_w     <= stu_tnum_b;
  store_pa_b     <= store_pa_m;
  store_pa_w     <= store_pa_b;
  bst_in_prog_w  <= bst_in_prog_b;
  blk_inst_w     <= blk_inst_b;
  sbd_st_data_w  <=  sbd_st_data_b;
  evict_inv_m    <= evict_inv_e;
  evict_inv_b    <= evict_inv_m;
  evict_inv_w    <= evict_inv_b;
  evict_srcid_m  <= evict_srcid_e;
  evict_srcid_b  <= evict_srcid_m;
  evict_srcid_w  <= evict_srcid_b;
  pcx_req_1      <= pcx_req;
  stb_state0_b   <= stb_state0_m;
  stb_state1_b   <= stb_state1_m;
  stb_state2_b   <= stb_state2_m;
  stb_state3_b   <= stb_state3_m;
  stb_state4_b   <= stb_state4_m;
  stb_state5_b   <= stb_state5_m;
  stb_state6_b   <= stb_state6_m;
  stb_state7_b   <= stb_state7_m;
  stb_state0_w   <= stb_state0_b;
  stb_state1_w   <= stb_state1_b;
  stb_state2_w   <= stb_state2_b;
  stb_state3_w   <= stb_state3_b;
  stb_state4_w   <= stb_state4_b;
  stb_state5_w   <= stb_state5_b;
  stb_state6_w   <= stb_state6_b;
  stb_state7_w   <= stb_state7_b;

  perfmon_m      <= perfmon_g;
  perfmon_b      <= perfmon_m;
  perfmon_w      <= perfmon_b;
  perfmon_tid_m  <= perfmon_tid_g;
  perfmon_tid_b  <= perfmon_tid_m;
  perfmon_tid_w  <= perfmon_tid_b;
  perfmon_mask_m <= perfmon_mask_g;
  perfmon_mask_b <= perfmon_mask_m;
  perfmon_mask_w <= perfmon_mask_b;

  //----------------------------------------------------------
  // Calculate pa for STUPDATE and STINV
  // Moved this into the always block to avoid the constant
  // probing of the dtag memory structure.

  if (store_inv_e | store_update_e) begin // {
    store_pa_m[2:0]    <= 3'b000;
    store_pa_m[10:3]   <= {`SPC2.lsu.cid.cpq_data_out[116],
                           `SPC2.lsu.cid.cpq_data_out[115],
                           `SPC2.lsu.cid.cpq_data_out[114],
                           `SPC2.lsu.cid.cpq_data_out[113],
                           `SPC2.lsu.cid.cpq_data_out[112],
                           `SPC2.lsu.cid.cpq_data_out[122],
                           `SPC2.lsu.cid.cpq_data_out[121],
                           `SPC2.lsu.cid.cpq_data_out[104]
                          };
    store_pa_m[38:11] <= (l1_way_select==2'h0) ? dta_way0[l1_index] :
                         (l1_way_select==2'h1) ? dta_way1[l1_index] :
                         (l1_way_select==2'h2) ? dta_way2[l1_index] : dta_way3[l1_index];
    store_pa_m[39]    <= 1'b0;		// Only memory stores get inv/update
  end // }


  // After Store to IO ASI is detected at StI time, suppress the next Store Ack
  // There is only 1 store to IO ASI active at one time per thread because
  //   that is all the LSU allows.
  if (st_io_asi) begin
    sta_suppress [st_io_tid] <= 1'b1;
  end 

  case ({ldi_atomic_b,ldi_bld_b,ldi_ldd_b,ldi_qld_b,ldi_pf_b})
    5'b00000: ldi_itype_w <= `ITYPE_LOAD;
    5'b00001: ldi_itype_w <= `ITYPE_PREFETCH;
    5'b00010: ldi_itype_w <= `ITYPE_QUAD_LOAD;
    5'b00100: ldi_itype_w <= `ITYPE_DOUBLE_LOAD;
    5'b01000: ldi_itype_w <= `ITYPE_BLOCK_LOAD;
    5'b10000: ldi_itype_w <= `ITYPE_ATOMIC;
    default: ldi_itype_w <= `ITYPE_NO; // Illegal
  endcase

  case ({atomic_b,rmo_st_b,bst_in_prog_b})
    3'b000: itype_w <= `ITYPE_STORE;
    3'b010: itype_w <= `ITYPE_BLK_INIT_ST;
    3'b011: itype_w <= `ITYPE_BLOCK_STORE;
    3'b100: itype_w <= `ITYPE_ATOMIC;
    3'b001,
    3'b101,
    3'b110,
    3'b111: itype_w <= `ITYPE_NO; // Illegal
  endcase

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Issue

  //  Load Issue must be before Store Issue for atomic

  if (load_w) begin // {

    if (ldi_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h size=%h  typ=%0h                     ts=%0d",
                            mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_LD_ISSUE,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
      end // }
    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h  Suppress for IO ASI",mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_LOAD  tid=%d pa=%h  ts=%0d  (LSU - W stage)",
                     mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  if (load_data_hit) begin // {

    dsrc = hit_w ? `DSRC_L1 : `DSRC_STB;

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
                         mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
      junk = $sim_send(`PLI_MEM_LD_DATA,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Ack
  //
  // Store Ack cmd must be sent before Store Inv, Store Update for NAS
  // Store Ack & Store Update will be in the same timestamp

  if (store_ack_w != 8'b0) begin // {

    for (i=0; i<=7; i=i+1) begin // {
      if (store_ack_w[i]) begin // {
        sta_tid = i[2:0];
        sta_tnum = {mycid,sta_tid};
        sta_rmo = st_ack_rmo_w[i];

        if (sta_suppress[sta_tid]==1'b0)  begin // {
          if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
            junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
          end // }
        end // }

        else begin // {

          // It is possible for 2 Stores it be in flight because of the delay from CPQ push & pop.
          // So, make sure Bench is suppressing the correct Store.
          case (sta_tid)
            3'h0: stb_state=stb_state0_w;
            3'h1: stb_state=stb_state1_w;
            3'h2: stb_state=stb_state2_w;
            3'h3: stb_state=stb_state3_w;
            3'h4: stb_state=stb_state4_w;
            3'h5: stb_state=stb_state5_w;
            3'h6: stb_state=stb_state6_w;
            3'h7: stb_state=stb_state7_w;
            default: 
              `PR_ERROR ("pli_ldst", `ERROR, 
              "C%0d T%0d PLI_MEM_XXX Bench Error.  Should never execute case default",mycid,sta_tid);
          endcase

          // If stb_state has only 1 bit asserted, then suppress the STACK.  Otherwise, send the STACK.
          case (stb_state) // {
            8'b0000_0000: begin
                `PR_ERROR ("pli_ldst", `ERROR, 
                "C%0d T%0d PLI_MEM_XXX Bench Error.  stb_state should not be 8'b0",
                 mycid,sta_tid);
              end
            8'b0000_0001,
            8'b0000_0010,
            8'b0000_0100,
            8'b0000_1000,
            8'b0001_0000,
            8'b0010_0000,
            8'b0100_0000,
            8'b1000_0000: stb_last = 1'b1;
            default:      stb_last = 1'b0;
          endcase // }

          if (stb_last==1'b0) begin // {
            if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
              `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                  mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
              junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
            end // }
          end // }
          else begin // {
            sta_suppress[sta_tid] <= 1'b0;
            `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d                Suppress for IO ASI",mycid,sta_tid,sta_tnum);
          end // }
        end // }

      end //  if (store_ack_w[i]) }
    end // for }

  end // if (store_ack_w) }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Inv

  if (store_inv_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stinv_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d    PLI_MEM_STINV  tid=%d pa=%h cid=%h                             ts=%0d",
                                  mycid,stinv_tnum_w,store_pa_w,mycid,tstamp);
      junk = $sim_send(`PLI_MEM_ST_INV,mycid,stinv_tnum_w,store_pa_w,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Update

  if (store_update_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stu_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STUP   tid=%d pa=%h                                   ts=%0d",
                           mycid,stu_tid_w,stu_tnum_w,store_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_ST_UPDATE,stu_tnum_w,store_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Fill

  if (load_fill_w) begin // {

    ldf_tnum_w = {mycid,ldf_tid_w};

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldf_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDFILL tid=%d pa=%h                                   ts=%0d",
                         mycid,ldf_tid_w,ldf_tnum_w,ldf_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_LD_FILL,ldf_tnum_w,ldf_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Issue

  if (store_w) begin // {

    if (sti_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sti_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h data=%h sz=%h typ=%0h ts=%0d",
                          mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_ST_ISSUE,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
      end // }

    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h  Suppress for IO ASI",mycid,sti_tid_w,sti_tnum_w,sti_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_STORE tid=%d pa=%h  data=%h sz=%h ts=%0d  (LSU - W stage)",
                     mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // EvictInv
  // Send 1-4 EvictInv messages per cycle - based on how many Dcache lines were invalidated.

  for (i=0; i<=3; i=i+1) begin // {
    if (evict_inv_w[i]) begin // {

      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d    PLI_MEM_EVINV                      cid=%d  srcid=%0d                    ts=%0d",
                                       mycid,mycid,evict_srcid_w,tstamp);
        junk = $sim_send(`PLI_MEM_EVICT_INV,mycid,evict_srcid_w,tstamp);
      end // }

    end // }
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Load Pop - special case

  // This is required in case of a performance monitor trap due to L2 miss.
  // In this case, the trap is not indicated until after the Load pkt returns to the LSU.
  // ldst_sync has already sent LDISSUE and LDDATA to Riesling.  But, the Load is not executed.
  // Load Pop tells Riesling to pop the LDISSUE,LDDATA off of its queues.

  if (perfmon & perfmon_mask[perfmon_tid]) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[perfmon_tnum]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDPOP  tid=%d                                                 ts=%0d",
                           mycid,perfmon_tid,perfmon_tnum,tstamp);
      junk = $sim_send(`PLI_MEM_LD_POP,perfmon_tnum);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Pop - special cases

  // This is required in case of a FRF error trap (internal_proc_error) on a Block Store.
  // In this case, the trap is not indicated until after the 8 STISSUE has been sent to Riesling.
  // But, the Store is not executed.
  // Store Pop tells Riesling to pop the 8 STISSUE off of its queues.

  if (bst_kill!==8'b0) begin // {

    for (i=0;i<=7;i=i+1) begin
      if (bst_kill[i]==1'b1) begin
        bst_kill_tid = i;
        bst_kill_tnum = {mycid,bst_kill_tid};

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[bst_kill_tnum]) begin // {
          `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
                               mycid,bst_kill_tid,bst_kill_tnum,tstamp);
          junk = $sim_send(`PLI_MEM_ST_POP,bst_kill_tnum);
        end // }
      end
    end

  end // }

  //--------------------
  // This is required for data_access_error on atomic.  In this case, Riesling only cleans up the Load,
  // but doesn't know it is an atomic so Riesling doesn't clean up the store in its buffers.
  // The STPOP tells Riesling to clear the newest Store from the buffers.
  // It is possible to have older Stores in-flight but not newer Stores in-flight.

//  if (st_data_access_w != 8'b0) begin // {
//
//    for (i=0; i<=7; i=i+1) begin // {
//      if (st_data_access_w[i]) begin // {
//        tmp_tid = i[2:0];
//        tmp_tnum = {mycid,tmp_tid};
//
//        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[tmp_tnum]) begin // {
//           `PR_INFO ("pli_ldst", `INFO, 
//               "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
//                               mycid,tmp_tid,tmp_tnum,tstamp);
//           junk = $sim_send(`PLI_MEM_ST_POP,tmp_tnum);
//        end // }
//      end // } if st_data_access[i]
//    end // } for
//  end // } if st_data_access

end // always }

//----------------------------------------------------------
// Need to model the D arrays to get PA's for store updates and invalidates

always @ (negedge `SPC2.l2clk) begin // {
  if (`SPC2.lsu.dta.wr_way[0])
    dta_way0[`SPC2.lsu.dta.index_y[6:0]] <= `SPC2.lsu.dta.wrtag_y[27:0];
  if (`SPC2.lsu.dta.wr_way[1])
    dta_way1[`SPC2.lsu.dta.index_y[6:0]] <= `SPC2.lsu.dta.wrtag_y[27:0];
  if (`SPC2.lsu.dta.wr_way[2])
    dta_way2[`SPC2.lsu.dta.index_y[6:0]] <= `SPC2.lsu.dta.wrtag_y[27:0];
  if (`SPC2.lsu.dta.wr_way[3])
    dta_way3[`SPC2.lsu.dta.index_y[6:0]] <= `SPC2.lsu.dta.wrtag_y[27:0];
end // always }

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_3

module ldst_lsu_c3 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "nas.vh"
// PCX/CPX packet defines (see :/verif/env/common/vera/include)
`include "ccx.vri"
`include "cmp.vri"

//---------------------
// Load Signals
wire                       load_w;

wire                       ldi_suppress;
wire                 [2:0] ldi_tid_w;
wire                 [5:0] ldi_tnum_w;
wire                [39:0] ldi_pa_b;
reg                 [39:0] ldi_pa_w;
wire                 [1:0] ldi_size_b;
reg                  [1:0] ldi_size_w;
wire                       ldi_bld_b;
wire                       ldi_qld_b;
wire                       ldi_ldbl_b;
wire                       ldi_ldd_b;
wire                       ldi_atomic_b;
wire                       ldi_pf_b;
reg                        ldi_pf_w;
reg                  [7:0] ldi_itype_w;
reg                  [7:0] dsrc;

wire                       ld_miss_b;
reg                        ld_miss_w;
reg                        stb_hit_w;
wire                       fraw_w;
wire                       hit_w;
wire                       miss_w;
wire                       load_data_hit;

wire                       load_fill_e;
reg                        load_fill_m;
reg                        load_fill_b;
reg                        load_fill_w;
wire                 [2:0] ldf_tid_e;
reg                  [2:0] ldf_tid_m;
reg                  [2:0] ldf_tid_b;
reg                  [2:0] ldf_tid_w;
reg                  [5:0] ldf_tnum_w;
wire                [39:0] ldf_pa_e;
reg                 [39:0] ldf_pa_m;
reg                 [39:0] ldf_pa_b;
reg                 [39:0] ldf_pa_w;

//---------------------
// Store Signals
wire                       unflushed_store_w;
wire                       store_w;
wire                       sti_suppress;
wire                 [2:0] sti_tid_b;
reg                  [2:0] sti_tid_w;
wire                 [5:0] sti_tnum_w;
wire                [39:0] sti_pa_b;
reg                 [39:0] sti_pa_w;
wire                [63:0] sti_data_w;
wire                 [7:0] sti_size_m;
reg                  [7:0] sti_size_b;
reg                  [7:0] sti_size_w;
wire                 [7:0] sti_itype_w;
reg                  [7:0] itype_w;
wire                [63:0] sbd_st_data_b;
reg                 [63:0] sbd_st_data_w;
wire                       flip_size_b;

wire                       atomic_b;
wire                       rmo_st_b;
wire                       blk_inst_b;
reg                        blk_inst_w;

wire                       bst_in_prog_b;
reg                        bst_in_prog_w;
wire                [39:0] bst_pa_b;
reg                 [39:0] bst_pa_w;
wire                 [2:0] bst_tid_b;
reg                  [2:0] bst_tid_w;
wire                [39:0] st_pa_b;
reg                 [39:0] st_pa_w;
wire                 [2:0] st_tid_b;
reg                  [2:0] st_tid_w;

wire                       store_inv_e;
reg                        store_inv_m;
reg                        store_inv_b;
reg                        store_inv_w;
wire                 [5:0] stinv_tnum_e;
reg                  [5:0] stinv_tnum_m;
reg                  [5:0] stinv_tnum_b;
reg                  [5:0] stinv_tnum_w;

wire                       store_update_e;
reg                        store_update_m;
reg                        store_update_b;
reg                        store_update_w;
wire                 [2:0] stu_tid_e;
reg                  [2:0] stu_tid_m;
reg                  [2:0] stu_tid_b;
reg                  [2:0] stu_tid_w;
wire                 [5:0] stu_tnum_e;
reg                  [5:0] stu_tnum_m;
reg                  [5:0] stu_tnum_b;
reg                  [5:0] stu_tnum_w;

wire                 [7:0] asi_st_dequeue;
wire                 [7:0] st_ack_no_asi_e;
reg                  [7:0] st_ack_no_asi_m;
reg                  [7:0] st_ack_no_asi_b;
wire                 [7:0] store_ack_b;
reg                  [7:0] store_ack_w;
wire                 [7:0] st_ack_rmo_b;
reg                  [7:0] st_ack_rmo_w;
reg                        sta_rmo;
reg                  [2:0] sta_tid;
reg                  [5:0] sta_tnum;
reg                        sta_suppress [0:7];  // 1 per thread
wire                       st_io_asi;
wire                 [2:0] st_io_tid;
wire                 [7:0] st_data_access_e;
reg                  [7:0] st_data_access_m;
reg                  [7:0] st_data_access_b;
reg                  [7:0] st_data_access_w;
reg                  [2:0] tmp_tid;
reg                  [5:0] tmp_tnum;

reg                 [39:0] store_pa_m;
reg                 [39:0] store_pa_b;
reg                 [39:0] store_pa_w;

wire                 [1:0] l1_way_select;
wire                 [6:0] l1_index;
wire                [27:0] my_way;
wire                [27:0] way0;
wire                [27:0] way1;
wire                [27:0] way2;
wire                [27:0] way3;

wire                 [3:0] evict_inv_e;
reg                  [3:0] evict_inv_m;
reg                  [3:0] evict_inv_b;
reg                  [3:0] evict_inv_w;
wire                 [2:0] evict_srcid_e;
reg                  [2:0] evict_srcid_m;
reg                  [2:0] evict_srcid_b;
reg                  [2:0] evict_srcid_w;

wire                 [8:0] pcx_req;
reg                  [8:0] pcx_req_1;
wire               [129:0] pcx_data;

wire                       perfmon;
wire                       perfmon_g;
reg                        perfmon_m;
reg                        perfmon_b;
reg                        perfmon_w;
wire                 [2:0] perfmon_tid;
wire                 [2:0] perfmon_tid_g;
reg                  [2:0] perfmon_tid_m;
reg                  [2:0] perfmon_tid_b;
reg                  [2:0] perfmon_tid_w;
wire                 [5:0] perfmon_tnum;
wire                 [7:0] perfmon_mask;
wire                 [7:0] perfmon_mask_g;
reg                  [7:0] perfmon_mask_m;
reg                  [7:0] perfmon_mask_b;
reg                  [7:0] perfmon_mask_w;

wire                 [7:0] bst_kill;
reg                  [2:0] bst_kill_tid;
reg                  [5:0] bst_kill_tnum;

wire                 [7:0] stb_state0_m;
wire                 [7:0] stb_state1_m;
wire                 [7:0] stb_state2_m;
wire                 [7:0] stb_state3_m;
wire                 [7:0] stb_state4_m;
wire                 [7:0] stb_state5_m;
wire                 [7:0] stb_state6_m;
wire                 [7:0] stb_state7_m;
reg                  [7:0] stb_state0_b;
reg                  [7:0] stb_state1_b;
reg                  [7:0] stb_state2_b;
reg                  [7:0] stb_state3_b;
reg                  [7:0] stb_state4_b;
reg                  [7:0] stb_state5_b;
reg                  [7:0] stb_state6_b;
reg                  [7:0] stb_state7_b;
reg                  [7:0] stb_state0_w;
reg                  [7:0] stb_state1_w;
reg                  [7:0] stb_state2_w;
reg                  [7:0] stb_state3_w;
reg                  [7:0] stb_state4_w;
reg                  [7:0] stb_state5_w;
reg                  [7:0] stb_state6_w;
reg                  [7:0] stb_state7_w;
reg                  [7:0] stb_state;
reg                        stb_last;

// Copy of dtag
reg [27:0] dta_way0 [127:0];
reg [27:0] dta_way1 [127:0];
reg [27:0] dta_way2 [127:0];
reg [27:0] dta_way3 [127:0];

//---------------------
// Misc Signals
wire                 [2:0] mycid;
integer                    tstamp;
integer                    junk;
integer                    i;

initial begin // {
  ldf_tnum_w = 6'b0;
  dsrc = 2'b0;
  sta_tid    = 3'b0;
  sta_tnum   = 6'b0;
  for (i=0; i<=7; i=i+1) begin
    sta_suppress[i] = 1'b0;
  end

end // }

// for debug only - allows display in Debussy
wire    sta_suppress0;
wire    sta_suppress1;
wire    sta_suppress2;
wire    sta_suppress3;
wire    sta_suppress4;
wire    sta_suppress5;
wire    sta_suppress6;
wire    sta_suppress7;

  assign   sta_suppress0 = sta_suppress[0];
  assign   sta_suppress1 = sta_suppress[1];
  assign   sta_suppress2 = sta_suppress[2];
  assign   sta_suppress3 = sta_suppress[3];
  assign   sta_suppress4 = sta_suppress[4];
  assign   sta_suppress5 = sta_suppress[5];
  assign   sta_suppress6 = sta_suppress[6];
  assign   sta_suppress7 = sta_suppress[7];

//----------------------------------------------------------
//----------------------------------------------------------
// DUT probes

  assign   mycid = 3;

//---------------------
// Load Issue

  // If Load to IO ASIs, load issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress load_w.

  assign load_w      = `SPC3.lsu.dcc.ld_inst_vld_w & 
                        ~`PROBES3.asi_internal_w &
                        ~`SPC3.lsu.dcc.flush_w &
                        ~ldi_pf_w;

  // ldxa to IO ASI are already suppressed since load_w will not assert.
  // ldi_suppress is required to also suppress normal ld to IO ASI address range.
  assign ldi_suppress = (ldi_pa_w[39:32] == `IO_ASI_ADDR);

  assign ldi_tid_w    = `SPC3.lsu.dcc.tid_w;
  assign ldi_tnum_w   = {mycid,ldi_tid_w};
  assign ldi_size_b   = `SPC3.lsu.dcc.ldst_sz_b;  // 2 bits
  assign ldi_atomic_b = `SPC3.lsu.dcc.atomic_b;
  assign ldi_qld_b    = `SPC3.lsu.dcc.quad_ldd_b;
  assign ldi_ldbl_b   = `SPC3.lsu.dcc_ldbl_b;
  assign ldi_ldd_b    = ldi_ldbl_b & !ldi_qld_b;
  assign ldi_bld_b    = `SPC3.lsu.dcc.dcc_blk_inst_b;
  assign ldi_pf_b     = `SPC3.lsu.dcc.pref_inst_b;

  // pa, tid are same for LoadIssue and StoreIssue
  assign ldi_pa_b = {`SPC3.lsu.tlb_pgnum[39:13],
                    `SPC3.lsu.lmd.lsu_va_b[12:0]};

//---------------------
// Load Fill

  assign load_fill_e = `SPC3.lsu.dcc.ld_fill_e;
  assign ldf_tid_e   = `SPC3.lsu.cid.cid_tid;
  assign ldf_pa_e    = {`SPC3.lsu.lmd.lmd_fill_addr_e[39:3],3'b0};

//---------------------
// Store Issue

  // blk_inst_w will suppress store_w for 1st of 9 cycles on block store.

  // If Store to IO ASIs, store issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress store_w.

  assign unflushed_store_w = `SPC3.lsu.sbc.unflushed_store_w;

  assign store_w      =   unflushed_store_w &
                          (~(`PROBES3.asi_internal_w | blk_inst_w) |
                            bst_in_prog_w);

  assign atomic_b      = `SPC3.lsu.dcc.atomic_b;
  assign rmo_st_b      = `SPC3.lsu.sbc_rmo_st_b;
  assign blk_inst_b    = `SPC3.lsu.dcc.dcc_blk_inst_b;

  assign sti_tnum_w   = {mycid,sti_tid_w};
  assign sti_size_m   = `SPC3.lsu.dcc_ldst_bmask;

  // flip_size will assert if endian swap for partial store is needed
  assign flip_size_b  = `SPC3.lsu.dcc.pst_asi_b & `SPC3.lsu.dcc.tlb_tte_ie_b & `SPC3.lsu.dcc.tlb_tte_vld_b & `SPC3.lsu.dcc.st_inst_vld_b;

  // Change itype only when control signals are valid
  assign sti_itype_w  = unflushed_store_w ? itype_w : sti_itype_w;

  // It is correct to mix W & B stage signals for this.
  // STD is a 2 cycle instruction.
  // inst valid in W, data in B (1 cycle behind)
  assign sti_data_w    = `SPC3.lsu.sbc.std_inst_w ?
                          sbd_st_data_b :
                          sbd_st_data_w;
  assign sbd_st_data_b = `SPC3.lsu.sbd_st_data_b;

  // Use different pa,tid if block store
  assign sti_pa_b     = bst_in_prog_b ? bst_pa_b  : st_pa_b;
  assign sti_tid_b    = bst_in_prog_b ? bst_tid_b : st_tid_b;

  // stxa to IO ASI are already suppressed since store_w will not assert.
  // sti_suppress is required to also suppress normal st to IO ASI address range.
  assign sti_suppress = (sti_pa_w[39:32] == `IO_ASI_ADDR);

  // Normal Store
  assign st_pa_b      = {`SPC3.lsu.tlb_pgnum[39:13],
                         `SPC3.lsu.lmd.lsu_va_b[12:0]};
  assign st_tid_b     = `SPC3.lsu.dcc.tid_b;

  // Block Store
  assign bst_in_prog_b = `SPC3.lsu.sbc.bst_in_prog_b;
  assign bst_pa_b      = {`SPC3.lsu.sbd.st_addr_b[39:3],3'b0};
  assign bst_tid_b     = `SPC3.lsu.sbc.bst_tid;

//---------------------
// Store Ack

assign asi_st_dequeue[7:0] = `SPC3.lsu.dcc_asi_rtn_vld[7:0] &
                             {8{~`SPC3.lsu.dcc_asi_rtn_rd}};

  assign st_ack_no_asi_e = `SPC3.lsu.cic.cic_st_dequeue[7:0] & 
                           ~asi_st_dequeue[7:0] & 
                           ~`SPC3.lsu.cic.sbc_bst_sel[7:0];

  assign st_ack_rmo_b  = {`SPC3.lsu.sbs7.rmo_st_commit_p4,
                          `SPC3.lsu.sbs6.rmo_st_commit_p4,
                          `SPC3.lsu.sbs5.rmo_st_commit_p4,
                          `SPC3.lsu.sbs4.rmo_st_commit_p4,
                          `SPC3.lsu.sbs3.rmo_st_commit_p4,
                          `SPC3.lsu.sbs2.rmo_st_commit_p4,
                          `SPC3.lsu.sbs1.rmo_st_commit_p4,
                          `SPC3.lsu.sbs0.rmo_st_commit_p4
                         };

  // It is possible to see 2 threads store_ack in same cycle
  // (1 st_ack_no_asi & 1 st_ack_rmo)

  assign store_ack_b   = st_ack_no_asi_b | st_ack_rmo_b;

  // cic_st_atm_cmplt is atomic store completing (same time as store ack)
  // (lsu.lmc.dcl2u_err | dcl2nd_err) indicate a data_access_error condition
  assign st_data_access_e = {8{(`SPC3.lsu.cic.cic_st_atm_cmplt & 
                             (`SPC3.lsu.lmc.dcl2u_err | `SPC3.lsu.lmc.dcl2nd_err))}} &
                            `SPC3.lsu.cic.cic_st_dequeue[7:0];
//---------------------
// Store Inv

  // Same as evict_inv_e but with cpq_evict deasserted
  assign store_inv_e  =  `SPC3.lsu.cic_invalidate_e &
                         (`SPC3.lsu.cic_inv_wen_e!=0)&
                        ~`SPC3.lsu.cic.cpq_evict & 
                        ~`SPC3.lsu.cic.cid_set_inval & 
                        ~`SPC3.lsu.cic.cic_xinval_e &
			~(`SPC3.lsu.cic.cid_pkt_type[4:0] == 5'b10110);
  assign stinv_tnum_e = 
         {`SPC3.lsu.cid.cpq_data_out[`CPX_VACK_CID],
          `SPC3.lsu.cid.cid_tid};

//---------------------
// Store Update

  assign store_update_e = `SPC3.lsu.cic_st_update_e;
  assign stu_tid_e      = `SPC3.lsu.cid.cid_tid;
  assign stu_tnum_e     = {mycid,stu_tid_e};

  assign l1_index = {`SPC3.lsu.cid.cpq_data_out[116],
                     `SPC3.lsu.cid.cpq_data_out[115],
                     `SPC3.lsu.cid.cpq_data_out[114],
                     `SPC3.lsu.cid.cpq_data_out[113],
                     `SPC3.lsu.cid.cpq_data_out[112],
                     `SPC3.lsu.cid.cpq_data_out[122],
                     `SPC3.lsu.cid.cpq_data_out[121]
                    };
  assign l1_way_select = `SPC3.lsu.cid_inv_vec[17:16];

//---------------------
// EvictInv

  // Same as store_inv_e but with cpq_evict asserted
  // LSU can invalidate 1-4 Dcache lines
  assign evict_inv_e[3:0]  =  {4{`SPC3.lsu.cic_invalidate_e &          // enable for 4 bit wen below
                                (`SPC3.lsu.cic_inv_wen_e!=0)&
                               `SPC3.lsu.cic.cpq_evict &
                               ~`SPC3.lsu.cic.cid_set_inval &
                               ~`SPC3.lsu.cic.cic_xinval_e}} &

                              {|(`SPC3.lsu.cic.evict_inv_wen[15:12]),   // 4 bit field - 1 hot.  Send evinv when any one set.
                               |(`SPC3.lsu.cic.evict_inv_wen[11:8]),
                               |(`SPC3.lsu.cic.evict_inv_wen[7:4]),
                               |(`SPC3.lsu.cic.evict_inv_wen[3:0])
                              };

  assign evict_srcid_e  = `SPC3.lsu.cid.cpq_data_out[114:112];


//---------------------
// Detect Store to IO ASI in PCX crossbar packet.
// This causes next Store Ack to be suppressed.

// Normal Store only since atomics are always to cacheable space

// Trigger on Store to crossbar.
// If Store request is retried on crossbar (due to no grant),
// then, st_io_asi will fire multiple times for the same request.
// This is OK because it just causes sta_suppress to be set multiple times.

  assign pcx_req    = `SPC3.spc_pcx_req_pq;
  assign pcx_data   = `SPC3.spc_pcx_data_pa;

  assign st_io_asi  = (pcx_req_1 != 9'b0) & 
                      (pcx_data [`PCX_VALID]==1'b1) & 
                      (pcx_data [`PCX_RQTYP]==`CCX_REQ_ST) & 
                      (pcx_data [103:96]==`IO_ASI_ADDR);  // Upper byte of 40 bit addr

  assign st_io_tid  = pcx_data [`PCX_TID];

  assign stb_state0_m = `SPC3.lsu.sbs0.stb_state_vld[7:0];
  assign stb_state1_m = `SPC3.lsu.sbs1.stb_state_vld[7:0];
  assign stb_state2_m = `SPC3.lsu.sbs2.stb_state_vld[7:0];
  assign stb_state3_m = `SPC3.lsu.sbs3.stb_state_vld[7:0];
  assign stb_state4_m = `SPC3.lsu.sbs4.stb_state_vld[7:0];
  assign stb_state5_m = `SPC3.lsu.sbs5.stb_state_vld[7:0];
  assign stb_state6_m = `SPC3.lsu.sbs6.stb_state_vld[7:0];
  assign stb_state7_m = `SPC3.lsu.sbs7.stb_state_vld[7:0];

//---------------------
// Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  assign load_data_hit = load_w && (hit_w | fraw_w);
  assign ld_miss_b = `SPC3.lsu.dcc.dcc_ld_miss_b;
  assign fraw_w    = `SPC3.lsu.lmc.ld_raw_bypass_w;
  assign hit_w     = ~ld_miss_w & ~stb_hit_w;
  assign miss_w    = ~fraw_w & (ld_miss_w | stb_hit_w);

//---------------------
// Load Pop

  assign perfmon_g      = `SPC3.lsu.lsu_perfmon_trap_g;
  assign perfmon_tid_g  = `SPC3.lsu.lsu_dcerr_tid_g;
  // perfmon_mask will not fire if trap is not enabled or higher priority trap is taken.
  assign perfmon_mask_g = {`SPC3.tlu.fls1.pil_mask_15[3:0], `SPC3.tlu.fls0.pil_mask_15[3:0]} &
                           ~{8 {`SPC3.lsu_dcl2u_err_g | `SPC3.lsu_dcl2nd_err_g}};

  assign perfmon      = perfmon_w;
  assign perfmon_tid  = perfmon_tid_w;
  assign perfmon_tnum = {mycid,perfmon_tid_w};
  assign perfmon_mask = perfmon_mask_w;



//---------------------
// Store Pop

  assign bst_kill      = {`SPC3.lsu.sbs7.bst_kill,
                          `SPC3.lsu.sbs6.bst_kill,
                          `SPC3.lsu.sbs5.bst_kill,
                          `SPC3.lsu.sbs4.bst_kill,
                          `SPC3.lsu.sbs3.bst_kill,
                          `SPC3.lsu.sbs2.bst_kill,
                          `SPC3.lsu.sbs1.bst_kill,
                          `SPC3.lsu.sbs0.bst_kill};
  
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC3.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline from B to W

  ldi_pa_w    <= ldi_pa_b;
  ld_miss_w   <= ld_miss_b;
  stb_hit_w   <= `SPC3.lsu.stb_cam_hit;
  ldi_pf_w    <= ldi_pf_b;
  ldi_size_w  <= ldi_size_b;
  load_fill_m <= load_fill_e;
  load_fill_b <= load_fill_m;
  load_fill_w <= load_fill_b;
  ldf_tid_m   <= ldf_tid_e;
  ldf_tid_b   <= ldf_tid_m;
  ldf_tid_w   <= ldf_tid_b;
  ldf_pa_m    <= ldf_pa_e;
  ldf_pa_b    <= ldf_pa_m;
  ldf_pa_w    <= ldf_pa_b;

  sti_size_b     <= sti_size_m;
  sti_size_w     <= (flip_size_b) ? {sti_size_b[0],sti_size_b[1],sti_size_b[2],sti_size_b[3],
                                     sti_size_b[4],sti_size_b[5],sti_size_b[6],sti_size_b[7]} 
                                  : sti_size_b;
  sti_pa_w       <= sti_pa_b;
  sti_tid_w      <= sti_tid_b;
  st_ack_no_asi_m  <= st_ack_no_asi_e;
  st_ack_no_asi_b  <= st_ack_no_asi_m;
  st_data_access_m <= st_data_access_e;
  st_data_access_b <= st_data_access_m;
  st_data_access_w <= st_data_access_b;
  store_ack_w    <= store_ack_b;
  store_update_m <= store_update_e;
  store_update_b <= store_update_m;
  store_update_w <= store_update_b;
  store_inv_m    <= store_inv_e;
  store_inv_b    <= store_inv_m;
  store_inv_w    <= store_inv_b;
  stinv_tnum_m   <= stinv_tnum_e;
  stinv_tnum_b   <= stinv_tnum_m;
  stinv_tnum_w   <= stinv_tnum_b;
  st_ack_rmo_w   <= st_ack_rmo_b;
  stu_tid_m      <= stu_tid_e;
  stu_tid_b      <= stu_tid_m;
  stu_tid_w      <= stu_tid_b;
  stu_tnum_m     <= stu_tnum_e;
  stu_tnum_b     <= stu_tnum_m;
  stu_tnum_w     <= stu_tnum_b;
  store_pa_b     <= store_pa_m;
  store_pa_w     <= store_pa_b;
  bst_in_prog_w  <= bst_in_prog_b;
  blk_inst_w     <= blk_inst_b;
  sbd_st_data_w  <=  sbd_st_data_b;
  evict_inv_m    <= evict_inv_e;
  evict_inv_b    <= evict_inv_m;
  evict_inv_w    <= evict_inv_b;
  evict_srcid_m  <= evict_srcid_e;
  evict_srcid_b  <= evict_srcid_m;
  evict_srcid_w  <= evict_srcid_b;
  pcx_req_1      <= pcx_req;
  stb_state0_b   <= stb_state0_m;
  stb_state1_b   <= stb_state1_m;
  stb_state2_b   <= stb_state2_m;
  stb_state3_b   <= stb_state3_m;
  stb_state4_b   <= stb_state4_m;
  stb_state5_b   <= stb_state5_m;
  stb_state6_b   <= stb_state6_m;
  stb_state7_b   <= stb_state7_m;
  stb_state0_w   <= stb_state0_b;
  stb_state1_w   <= stb_state1_b;
  stb_state2_w   <= stb_state2_b;
  stb_state3_w   <= stb_state3_b;
  stb_state4_w   <= stb_state4_b;
  stb_state5_w   <= stb_state5_b;
  stb_state6_w   <= stb_state6_b;
  stb_state7_w   <= stb_state7_b;

  perfmon_m      <= perfmon_g;
  perfmon_b      <= perfmon_m;
  perfmon_w      <= perfmon_b;
  perfmon_tid_m  <= perfmon_tid_g;
  perfmon_tid_b  <= perfmon_tid_m;
  perfmon_tid_w  <= perfmon_tid_b;
  perfmon_mask_m <= perfmon_mask_g;
  perfmon_mask_b <= perfmon_mask_m;
  perfmon_mask_w <= perfmon_mask_b;

  //----------------------------------------------------------
  // Calculate pa for STUPDATE and STINV
  // Moved this into the always block to avoid the constant
  // probing of the dtag memory structure.

  if (store_inv_e | store_update_e) begin // {
    store_pa_m[2:0]    <= 3'b000;
    store_pa_m[10:3]   <= {`SPC3.lsu.cid.cpq_data_out[116],
                           `SPC3.lsu.cid.cpq_data_out[115],
                           `SPC3.lsu.cid.cpq_data_out[114],
                           `SPC3.lsu.cid.cpq_data_out[113],
                           `SPC3.lsu.cid.cpq_data_out[112],
                           `SPC3.lsu.cid.cpq_data_out[122],
                           `SPC3.lsu.cid.cpq_data_out[121],
                           `SPC3.lsu.cid.cpq_data_out[104]
                          };
    store_pa_m[38:11] <= (l1_way_select==2'h0) ? dta_way0[l1_index] :
                         (l1_way_select==2'h1) ? dta_way1[l1_index] :
                         (l1_way_select==2'h2) ? dta_way2[l1_index] : dta_way3[l1_index];
    store_pa_m[39]    <= 1'b0;		// Only memory stores get inv/update
  end // }


  // After Store to IO ASI is detected at StI time, suppress the next Store Ack
  // There is only 1 store to IO ASI active at one time per thread because
  //   that is all the LSU allows.
  if (st_io_asi) begin
    sta_suppress [st_io_tid] <= 1'b1;
  end 

  case ({ldi_atomic_b,ldi_bld_b,ldi_ldd_b,ldi_qld_b,ldi_pf_b})
    5'b00000: ldi_itype_w <= `ITYPE_LOAD;
    5'b00001: ldi_itype_w <= `ITYPE_PREFETCH;
    5'b00010: ldi_itype_w <= `ITYPE_QUAD_LOAD;
    5'b00100: ldi_itype_w <= `ITYPE_DOUBLE_LOAD;
    5'b01000: ldi_itype_w <= `ITYPE_BLOCK_LOAD;
    5'b10000: ldi_itype_w <= `ITYPE_ATOMIC;
    default: ldi_itype_w <= `ITYPE_NO; // Illegal
  endcase

  case ({atomic_b,rmo_st_b,bst_in_prog_b})
    3'b000: itype_w <= `ITYPE_STORE;
    3'b010: itype_w <= `ITYPE_BLK_INIT_ST;
    3'b011: itype_w <= `ITYPE_BLOCK_STORE;
    3'b100: itype_w <= `ITYPE_ATOMIC;
    3'b001,
    3'b101,
    3'b110,
    3'b111: itype_w <= `ITYPE_NO; // Illegal
  endcase

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Issue

  //  Load Issue must be before Store Issue for atomic

  if (load_w) begin // {

    if (ldi_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h size=%h  typ=%0h                     ts=%0d",
                            mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_LD_ISSUE,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
      end // }
    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h  Suppress for IO ASI",mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_LOAD  tid=%d pa=%h  ts=%0d  (LSU - W stage)",
                     mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  if (load_data_hit) begin // {

    dsrc = hit_w ? `DSRC_L1 : `DSRC_STB;

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
                         mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
      junk = $sim_send(`PLI_MEM_LD_DATA,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Ack
  //
  // Store Ack cmd must be sent before Store Inv, Store Update for NAS
  // Store Ack & Store Update will be in the same timestamp

  if (store_ack_w != 8'b0) begin // {

    for (i=0; i<=7; i=i+1) begin // {
      if (store_ack_w[i]) begin // {
        sta_tid = i[2:0];
        sta_tnum = {mycid,sta_tid};
        sta_rmo = st_ack_rmo_w[i];

        if (sta_suppress[sta_tid]==1'b0)  begin // {
          if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
            junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
          end // }
        end // }

        else begin // {

          // It is possible for 2 Stores it be in flight because of the delay from CPQ push & pop.
          // So, make sure Bench is suppressing the correct Store.
          case (sta_tid)
            3'h0: stb_state=stb_state0_w;
            3'h1: stb_state=stb_state1_w;
            3'h2: stb_state=stb_state2_w;
            3'h3: stb_state=stb_state3_w;
            3'h4: stb_state=stb_state4_w;
            3'h5: stb_state=stb_state5_w;
            3'h6: stb_state=stb_state6_w;
            3'h7: stb_state=stb_state7_w;
            default: 
              `PR_ERROR ("pli_ldst", `ERROR, 
              "C%0d T%0d PLI_MEM_XXX Bench Error.  Should never execute case default",mycid,sta_tid);
          endcase

          // If stb_state has only 1 bit asserted, then suppress the STACK.  Otherwise, send the STACK.
          case (stb_state) // {
            8'b0000_0000: begin
                `PR_ERROR ("pli_ldst", `ERROR, 
                "C%0d T%0d PLI_MEM_XXX Bench Error.  stb_state should not be 8'b0",
                 mycid,sta_tid);
              end
            8'b0000_0001,
            8'b0000_0010,
            8'b0000_0100,
            8'b0000_1000,
            8'b0001_0000,
            8'b0010_0000,
            8'b0100_0000,
            8'b1000_0000: stb_last = 1'b1;
            default:      stb_last = 1'b0;
          endcase // }

          if (stb_last==1'b0) begin // {
            if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
              `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                  mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
              junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
            end // }
          end // }
          else begin // {
            sta_suppress[sta_tid] <= 1'b0;
            `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d                Suppress for IO ASI",mycid,sta_tid,sta_tnum);
          end // }
        end // }

      end //  if (store_ack_w[i]) }
    end // for }

  end // if (store_ack_w) }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Inv

  if (store_inv_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stinv_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d    PLI_MEM_STINV  tid=%d pa=%h cid=%h                             ts=%0d",
                                  mycid,stinv_tnum_w,store_pa_w,mycid,tstamp);
      junk = $sim_send(`PLI_MEM_ST_INV,mycid,stinv_tnum_w,store_pa_w,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Update

  if (store_update_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stu_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STUP   tid=%d pa=%h                                   ts=%0d",
                           mycid,stu_tid_w,stu_tnum_w,store_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_ST_UPDATE,stu_tnum_w,store_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Fill

  if (load_fill_w) begin // {

    ldf_tnum_w = {mycid,ldf_tid_w};

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldf_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDFILL tid=%d pa=%h                                   ts=%0d",
                         mycid,ldf_tid_w,ldf_tnum_w,ldf_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_LD_FILL,ldf_tnum_w,ldf_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Issue

  if (store_w) begin // {

    if (sti_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sti_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h data=%h sz=%h typ=%0h ts=%0d",
                          mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_ST_ISSUE,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
      end // }

    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h  Suppress for IO ASI",mycid,sti_tid_w,sti_tnum_w,sti_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_STORE tid=%d pa=%h  data=%h sz=%h ts=%0d  (LSU - W stage)",
                     mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // EvictInv
  // Send 1-4 EvictInv messages per cycle - based on how many Dcache lines were invalidated.

  for (i=0; i<=3; i=i+1) begin // {
    if (evict_inv_w[i]) begin // {

      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d    PLI_MEM_EVINV                      cid=%d  srcid=%0d                    ts=%0d",
                                       mycid,mycid,evict_srcid_w,tstamp);
        junk = $sim_send(`PLI_MEM_EVICT_INV,mycid,evict_srcid_w,tstamp);
      end // }

    end // }
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Load Pop - special case

  // This is required in case of a performance monitor trap due to L2 miss.
  // In this case, the trap is not indicated until after the Load pkt returns to the LSU.
  // ldst_sync has already sent LDISSUE and LDDATA to Riesling.  But, the Load is not executed.
  // Load Pop tells Riesling to pop the LDISSUE,LDDATA off of its queues.

  if (perfmon & perfmon_mask[perfmon_tid]) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[perfmon_tnum]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDPOP  tid=%d                                                 ts=%0d",
                           mycid,perfmon_tid,perfmon_tnum,tstamp);
      junk = $sim_send(`PLI_MEM_LD_POP,perfmon_tnum);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Pop - special cases

  // This is required in case of a FRF error trap (internal_proc_error) on a Block Store.
  // In this case, the trap is not indicated until after the 8 STISSUE has been sent to Riesling.
  // But, the Store is not executed.
  // Store Pop tells Riesling to pop the 8 STISSUE off of its queues.

  if (bst_kill!==8'b0) begin // {

    for (i=0;i<=7;i=i+1) begin
      if (bst_kill[i]==1'b1) begin
        bst_kill_tid = i;
        bst_kill_tnum = {mycid,bst_kill_tid};

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[bst_kill_tnum]) begin // {
          `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
                               mycid,bst_kill_tid,bst_kill_tnum,tstamp);
          junk = $sim_send(`PLI_MEM_ST_POP,bst_kill_tnum);
        end // }
      end
    end

  end // }

  //--------------------
  // This is required for data_access_error on atomic.  In this case, Riesling only cleans up the Load,
  // but doesn't know it is an atomic so Riesling doesn't clean up the store in its buffers.
  // The STPOP tells Riesling to clear the newest Store from the buffers.
  // It is possible to have older Stores in-flight but not newer Stores in-flight.

//  if (st_data_access_w != 8'b0) begin // {
//
//    for (i=0; i<=7; i=i+1) begin // {
//      if (st_data_access_w[i]) begin // {
//        tmp_tid = i[2:0];
//        tmp_tnum = {mycid,tmp_tid};
//
//        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[tmp_tnum]) begin // {
//           `PR_INFO ("pli_ldst", `INFO, 
//               "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
//                               mycid,tmp_tid,tmp_tnum,tstamp);
//           junk = $sim_send(`PLI_MEM_ST_POP,tmp_tnum);
//        end // }
//      end // } if st_data_access[i]
//    end // } for
//  end // } if st_data_access

end // always }

//----------------------------------------------------------
// Need to model the D arrays to get PA's for store updates and invalidates

always @ (negedge `SPC3.l2clk) begin // {
  if (`SPC3.lsu.dta.wr_way[0])
    dta_way0[`SPC3.lsu.dta.index_y[6:0]] <= `SPC3.lsu.dta.wrtag_y[27:0];
  if (`SPC3.lsu.dta.wr_way[1])
    dta_way1[`SPC3.lsu.dta.index_y[6:0]] <= `SPC3.lsu.dta.wrtag_y[27:0];
  if (`SPC3.lsu.dta.wr_way[2])
    dta_way2[`SPC3.lsu.dta.index_y[6:0]] <= `SPC3.lsu.dta.wrtag_y[27:0];
  if (`SPC3.lsu.dta.wr_way[3])
    dta_way3[`SPC3.lsu.dta.index_y[6:0]] <= `SPC3.lsu.dta.wrtag_y[27:0];
end // always }

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_4

module ldst_lsu_c4 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "nas.vh"
// PCX/CPX packet defines (see :/verif/env/common/vera/include)
`include "ccx.vri"
`include "cmp.vri"

//---------------------
// Load Signals
wire                       load_w;

wire                       ldi_suppress;
wire                 [2:0] ldi_tid_w;
wire                 [5:0] ldi_tnum_w;
wire                [39:0] ldi_pa_b;
reg                 [39:0] ldi_pa_w;
wire                 [1:0] ldi_size_b;
reg                  [1:0] ldi_size_w;
wire                       ldi_bld_b;
wire                       ldi_qld_b;
wire                       ldi_ldbl_b;
wire                       ldi_ldd_b;
wire                       ldi_atomic_b;
wire                       ldi_pf_b;
reg                        ldi_pf_w;
reg                  [7:0] ldi_itype_w;
reg                  [7:0] dsrc;

wire                       ld_miss_b;
reg                        ld_miss_w;
reg                        stb_hit_w;
wire                       fraw_w;
wire                       hit_w;
wire                       miss_w;
wire                       load_data_hit;

wire                       load_fill_e;
reg                        load_fill_m;
reg                        load_fill_b;
reg                        load_fill_w;
wire                 [2:0] ldf_tid_e;
reg                  [2:0] ldf_tid_m;
reg                  [2:0] ldf_tid_b;
reg                  [2:0] ldf_tid_w;
reg                  [5:0] ldf_tnum_w;
wire                [39:0] ldf_pa_e;
reg                 [39:0] ldf_pa_m;
reg                 [39:0] ldf_pa_b;
reg                 [39:0] ldf_pa_w;

//---------------------
// Store Signals
wire                       unflushed_store_w;
wire                       store_w;
wire                       sti_suppress;
wire                 [2:0] sti_tid_b;
reg                  [2:0] sti_tid_w;
wire                 [5:0] sti_tnum_w;
wire                [39:0] sti_pa_b;
reg                 [39:0] sti_pa_w;
wire                [63:0] sti_data_w;
wire                 [7:0] sti_size_m;
reg                  [7:0] sti_size_b;
reg                  [7:0] sti_size_w;
wire                 [7:0] sti_itype_w;
reg                  [7:0] itype_w;
wire                [63:0] sbd_st_data_b;
reg                 [63:0] sbd_st_data_w;
wire                       flip_size_b;

wire                       atomic_b;
wire                       rmo_st_b;
wire                       blk_inst_b;
reg                        blk_inst_w;

wire                       bst_in_prog_b;
reg                        bst_in_prog_w;
wire                [39:0] bst_pa_b;
reg                 [39:0] bst_pa_w;
wire                 [2:0] bst_tid_b;
reg                  [2:0] bst_tid_w;
wire                [39:0] st_pa_b;
reg                 [39:0] st_pa_w;
wire                 [2:0] st_tid_b;
reg                  [2:0] st_tid_w;

wire                       store_inv_e;
reg                        store_inv_m;
reg                        store_inv_b;
reg                        store_inv_w;
wire                 [5:0] stinv_tnum_e;
reg                  [5:0] stinv_tnum_m;
reg                  [5:0] stinv_tnum_b;
reg                  [5:0] stinv_tnum_w;

wire                       store_update_e;
reg                        store_update_m;
reg                        store_update_b;
reg                        store_update_w;
wire                 [2:0] stu_tid_e;
reg                  [2:0] stu_tid_m;
reg                  [2:0] stu_tid_b;
reg                  [2:0] stu_tid_w;
wire                 [5:0] stu_tnum_e;
reg                  [5:0] stu_tnum_m;
reg                  [5:0] stu_tnum_b;
reg                  [5:0] stu_tnum_w;

wire                 [7:0] asi_st_dequeue;
wire                 [7:0] st_ack_no_asi_e;
reg                  [7:0] st_ack_no_asi_m;
reg                  [7:0] st_ack_no_asi_b;
wire                 [7:0] store_ack_b;
reg                  [7:0] store_ack_w;
wire                 [7:0] st_ack_rmo_b;
reg                  [7:0] st_ack_rmo_w;
reg                        sta_rmo;
reg                  [2:0] sta_tid;
reg                  [5:0] sta_tnum;
reg                        sta_suppress [0:7];  // 1 per thread
wire                       st_io_asi;
wire                 [2:0] st_io_tid;
wire                 [7:0] st_data_access_e;
reg                  [7:0] st_data_access_m;
reg                  [7:0] st_data_access_b;
reg                  [7:0] st_data_access_w;
reg                  [2:0] tmp_tid;
reg                  [5:0] tmp_tnum;

reg                 [39:0] store_pa_m;
reg                 [39:0] store_pa_b;
reg                 [39:0] store_pa_w;

wire                 [1:0] l1_way_select;
wire                 [6:0] l1_index;
wire                [27:0] my_way;
wire                [27:0] way0;
wire                [27:0] way1;
wire                [27:0] way2;
wire                [27:0] way3;

wire                 [3:0] evict_inv_e;
reg                  [3:0] evict_inv_m;
reg                  [3:0] evict_inv_b;
reg                  [3:0] evict_inv_w;
wire                 [2:0] evict_srcid_e;
reg                  [2:0] evict_srcid_m;
reg                  [2:0] evict_srcid_b;
reg                  [2:0] evict_srcid_w;

wire                 [8:0] pcx_req;
reg                  [8:0] pcx_req_1;
wire               [129:0] pcx_data;

wire                       perfmon;
wire                       perfmon_g;
reg                        perfmon_m;
reg                        perfmon_b;
reg                        perfmon_w;
wire                 [2:0] perfmon_tid;
wire                 [2:0] perfmon_tid_g;
reg                  [2:0] perfmon_tid_m;
reg                  [2:0] perfmon_tid_b;
reg                  [2:0] perfmon_tid_w;
wire                 [5:0] perfmon_tnum;
wire                 [7:0] perfmon_mask;
wire                 [7:0] perfmon_mask_g;
reg                  [7:0] perfmon_mask_m;
reg                  [7:0] perfmon_mask_b;
reg                  [7:0] perfmon_mask_w;

wire                 [7:0] bst_kill;
reg                  [2:0] bst_kill_tid;
reg                  [5:0] bst_kill_tnum;

wire                 [7:0] stb_state0_m;
wire                 [7:0] stb_state1_m;
wire                 [7:0] stb_state2_m;
wire                 [7:0] stb_state3_m;
wire                 [7:0] stb_state4_m;
wire                 [7:0] stb_state5_m;
wire                 [7:0] stb_state6_m;
wire                 [7:0] stb_state7_m;
reg                  [7:0] stb_state0_b;
reg                  [7:0] stb_state1_b;
reg                  [7:0] stb_state2_b;
reg                  [7:0] stb_state3_b;
reg                  [7:0] stb_state4_b;
reg                  [7:0] stb_state5_b;
reg                  [7:0] stb_state6_b;
reg                  [7:0] stb_state7_b;
reg                  [7:0] stb_state0_w;
reg                  [7:0] stb_state1_w;
reg                  [7:0] stb_state2_w;
reg                  [7:0] stb_state3_w;
reg                  [7:0] stb_state4_w;
reg                  [7:0] stb_state5_w;
reg                  [7:0] stb_state6_w;
reg                  [7:0] stb_state7_w;
reg                  [7:0] stb_state;
reg                        stb_last;

// Copy of dtag
reg [27:0] dta_way0 [127:0];
reg [27:0] dta_way1 [127:0];
reg [27:0] dta_way2 [127:0];
reg [27:0] dta_way3 [127:0];

//---------------------
// Misc Signals
wire                 [2:0] mycid;
integer                    tstamp;
integer                    junk;
integer                    i;

initial begin // {
  ldf_tnum_w = 6'b0;
  dsrc = 2'b0;
  sta_tid    = 3'b0;
  sta_tnum   = 6'b0;
  for (i=0; i<=7; i=i+1) begin
    sta_suppress[i] = 1'b0;
  end

end // }

// for debug only - allows display in Debussy
wire    sta_suppress0;
wire    sta_suppress1;
wire    sta_suppress2;
wire    sta_suppress3;
wire    sta_suppress4;
wire    sta_suppress5;
wire    sta_suppress6;
wire    sta_suppress7;

  assign   sta_suppress0 = sta_suppress[0];
  assign   sta_suppress1 = sta_suppress[1];
  assign   sta_suppress2 = sta_suppress[2];
  assign   sta_suppress3 = sta_suppress[3];
  assign   sta_suppress4 = sta_suppress[4];
  assign   sta_suppress5 = sta_suppress[5];
  assign   sta_suppress6 = sta_suppress[6];
  assign   sta_suppress7 = sta_suppress[7];

//----------------------------------------------------------
//----------------------------------------------------------
// DUT probes

  assign   mycid = 4;

//---------------------
// Load Issue

  // If Load to IO ASIs, load issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress load_w.

  assign load_w      = `SPC4.lsu.dcc.ld_inst_vld_w & 
                        ~`PROBES4.asi_internal_w &
                        ~`SPC4.lsu.dcc.flush_w &
                        ~ldi_pf_w;

  // ldxa to IO ASI are already suppressed since load_w will not assert.
  // ldi_suppress is required to also suppress normal ld to IO ASI address range.
  assign ldi_suppress = (ldi_pa_w[39:32] == `IO_ASI_ADDR);

  assign ldi_tid_w    = `SPC4.lsu.dcc.tid_w;
  assign ldi_tnum_w   = {mycid,ldi_tid_w};
  assign ldi_size_b   = `SPC4.lsu.dcc.ldst_sz_b;  // 2 bits
  assign ldi_atomic_b = `SPC4.lsu.dcc.atomic_b;
  assign ldi_qld_b    = `SPC4.lsu.dcc.quad_ldd_b;
  assign ldi_ldbl_b   = `SPC4.lsu.dcc_ldbl_b;
  assign ldi_ldd_b    = ldi_ldbl_b & !ldi_qld_b;
  assign ldi_bld_b    = `SPC4.lsu.dcc.dcc_blk_inst_b;
  assign ldi_pf_b     = `SPC4.lsu.dcc.pref_inst_b;

  // pa, tid are same for LoadIssue and StoreIssue
  assign ldi_pa_b = {`SPC4.lsu.tlb_pgnum[39:13],
                    `SPC4.lsu.lmd.lsu_va_b[12:0]};

//---------------------
// Load Fill

  assign load_fill_e = `SPC4.lsu.dcc.ld_fill_e;
  assign ldf_tid_e   = `SPC4.lsu.cid.cid_tid;
  assign ldf_pa_e    = {`SPC4.lsu.lmd.lmd_fill_addr_e[39:3],3'b0};

//---------------------
// Store Issue

  // blk_inst_w will suppress store_w for 1st of 9 cycles on block store.

  // If Store to IO ASIs, store issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress store_w.

  assign unflushed_store_w = `SPC4.lsu.sbc.unflushed_store_w;

  assign store_w      =   unflushed_store_w &
                          (~(`PROBES4.asi_internal_w | blk_inst_w) |
                            bst_in_prog_w);

  assign atomic_b      = `SPC4.lsu.dcc.atomic_b;
  assign rmo_st_b      = `SPC4.lsu.sbc_rmo_st_b;
  assign blk_inst_b    = `SPC4.lsu.dcc.dcc_blk_inst_b;

  assign sti_tnum_w   = {mycid,sti_tid_w};
  assign sti_size_m   = `SPC4.lsu.dcc_ldst_bmask;

  // flip_size will assert if endian swap for partial store is needed
  assign flip_size_b  = `SPC4.lsu.dcc.pst_asi_b & `SPC4.lsu.dcc.tlb_tte_ie_b & `SPC4.lsu.dcc.tlb_tte_vld_b & `SPC4.lsu.dcc.st_inst_vld_b;

  // Change itype only when control signals are valid
  assign sti_itype_w  = unflushed_store_w ? itype_w : sti_itype_w;

  // It is correct to mix W & B stage signals for this.
  // STD is a 2 cycle instruction.
  // inst valid in W, data in B (1 cycle behind)
  assign sti_data_w    = `SPC4.lsu.sbc.std_inst_w ?
                          sbd_st_data_b :
                          sbd_st_data_w;
  assign sbd_st_data_b = `SPC4.lsu.sbd_st_data_b;

  // Use different pa,tid if block store
  assign sti_pa_b     = bst_in_prog_b ? bst_pa_b  : st_pa_b;
  assign sti_tid_b    = bst_in_prog_b ? bst_tid_b : st_tid_b;

  // stxa to IO ASI are already suppressed since store_w will not assert.
  // sti_suppress is required to also suppress normal st to IO ASI address range.
  assign sti_suppress = (sti_pa_w[39:32] == `IO_ASI_ADDR);

  // Normal Store
  assign st_pa_b      = {`SPC4.lsu.tlb_pgnum[39:13],
                         `SPC4.lsu.lmd.lsu_va_b[12:0]};
  assign st_tid_b     = `SPC4.lsu.dcc.tid_b;

  // Block Store
  assign bst_in_prog_b = `SPC4.lsu.sbc.bst_in_prog_b;
  assign bst_pa_b      = {`SPC4.lsu.sbd.st_addr_b[39:3],3'b0};
  assign bst_tid_b     = `SPC4.lsu.sbc.bst_tid;

//---------------------
// Store Ack

assign asi_st_dequeue[7:0] = `SPC4.lsu.dcc_asi_rtn_vld[7:0] &
                             {8{~`SPC4.lsu.dcc_asi_rtn_rd}};

  assign st_ack_no_asi_e = `SPC4.lsu.cic.cic_st_dequeue[7:0] & 
                           ~asi_st_dequeue[7:0] & 
                           ~`SPC4.lsu.cic.sbc_bst_sel[7:0];

  assign st_ack_rmo_b  = {`SPC4.lsu.sbs7.rmo_st_commit_p4,
                          `SPC4.lsu.sbs6.rmo_st_commit_p4,
                          `SPC4.lsu.sbs5.rmo_st_commit_p4,
                          `SPC4.lsu.sbs4.rmo_st_commit_p4,
                          `SPC4.lsu.sbs3.rmo_st_commit_p4,
                          `SPC4.lsu.sbs2.rmo_st_commit_p4,
                          `SPC4.lsu.sbs1.rmo_st_commit_p4,
                          `SPC4.lsu.sbs0.rmo_st_commit_p4
                         };

  // It is possible to see 2 threads store_ack in same cycle
  // (1 st_ack_no_asi & 1 st_ack_rmo)

  assign store_ack_b   = st_ack_no_asi_b | st_ack_rmo_b;

  // cic_st_atm_cmplt is atomic store completing (same time as store ack)
  // (lsu.lmc.dcl2u_err | dcl2nd_err) indicate a data_access_error condition
  assign st_data_access_e = {8{(`SPC4.lsu.cic.cic_st_atm_cmplt & 
                             (`SPC4.lsu.lmc.dcl2u_err | `SPC4.lsu.lmc.dcl2nd_err))}} &
                            `SPC4.lsu.cic.cic_st_dequeue[7:0];
//---------------------
// Store Inv

  // Same as evict_inv_e but with cpq_evict deasserted
  assign store_inv_e  =  `SPC4.lsu.cic_invalidate_e &
                         (`SPC4.lsu.cic_inv_wen_e!=0)&
                        ~`SPC4.lsu.cic.cpq_evict & 
                        ~`SPC4.lsu.cic.cid_set_inval & 
                        ~`SPC4.lsu.cic.cic_xinval_e &
			~(`SPC4.lsu.cic.cid_pkt_type[4:0] == 5'b10110);
  assign stinv_tnum_e = 
         {`SPC4.lsu.cid.cpq_data_out[`CPX_VACK_CID],
          `SPC4.lsu.cid.cid_tid};

//---------------------
// Store Update

  assign store_update_e = `SPC4.lsu.cic_st_update_e;
  assign stu_tid_e      = `SPC4.lsu.cid.cid_tid;
  assign stu_tnum_e     = {mycid,stu_tid_e};

  assign l1_index = {`SPC4.lsu.cid.cpq_data_out[116],
                     `SPC4.lsu.cid.cpq_data_out[115],
                     `SPC4.lsu.cid.cpq_data_out[114],
                     `SPC4.lsu.cid.cpq_data_out[113],
                     `SPC4.lsu.cid.cpq_data_out[112],
                     `SPC4.lsu.cid.cpq_data_out[122],
                     `SPC4.lsu.cid.cpq_data_out[121]
                    };
  assign l1_way_select = `SPC4.lsu.cid_inv_vec[17:16];

//---------------------
// EvictInv

  // Same as store_inv_e but with cpq_evict asserted
  // LSU can invalidate 1-4 Dcache lines
  assign evict_inv_e[3:0]  =  {4{`SPC4.lsu.cic_invalidate_e &          // enable for 4 bit wen below
                                (`SPC4.lsu.cic_inv_wen_e!=0)&
                               `SPC4.lsu.cic.cpq_evict &
                               ~`SPC4.lsu.cic.cid_set_inval &
                               ~`SPC4.lsu.cic.cic_xinval_e}} &

                              {|(`SPC4.lsu.cic.evict_inv_wen[15:12]),   // 4 bit field - 1 hot.  Send evinv when any one set.
                               |(`SPC4.lsu.cic.evict_inv_wen[11:8]),
                               |(`SPC4.lsu.cic.evict_inv_wen[7:4]),
                               |(`SPC4.lsu.cic.evict_inv_wen[3:0])
                              };

  assign evict_srcid_e  = `SPC4.lsu.cid.cpq_data_out[114:112];


//---------------------
// Detect Store to IO ASI in PCX crossbar packet.
// This causes next Store Ack to be suppressed.

// Normal Store only since atomics are always to cacheable space

// Trigger on Store to crossbar.
// If Store request is retried on crossbar (due to no grant),
// then, st_io_asi will fire multiple times for the same request.
// This is OK because it just causes sta_suppress to be set multiple times.

  assign pcx_req    = `SPC4.spc_pcx_req_pq;
  assign pcx_data   = `SPC4.spc_pcx_data_pa;

  assign st_io_asi  = (pcx_req_1 != 9'b0) & 
                      (pcx_data [`PCX_VALID]==1'b1) & 
                      (pcx_data [`PCX_RQTYP]==`CCX_REQ_ST) & 
                      (pcx_data [103:96]==`IO_ASI_ADDR);  // Upper byte of 40 bit addr

  assign st_io_tid  = pcx_data [`PCX_TID];

  assign stb_state0_m = `SPC4.lsu.sbs0.stb_state_vld[7:0];
  assign stb_state1_m = `SPC4.lsu.sbs1.stb_state_vld[7:0];
  assign stb_state2_m = `SPC4.lsu.sbs2.stb_state_vld[7:0];
  assign stb_state3_m = `SPC4.lsu.sbs3.stb_state_vld[7:0];
  assign stb_state4_m = `SPC4.lsu.sbs4.stb_state_vld[7:0];
  assign stb_state5_m = `SPC4.lsu.sbs5.stb_state_vld[7:0];
  assign stb_state6_m = `SPC4.lsu.sbs6.stb_state_vld[7:0];
  assign stb_state7_m = `SPC4.lsu.sbs7.stb_state_vld[7:0];

//---------------------
// Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  assign load_data_hit = load_w && (hit_w | fraw_w);
  assign ld_miss_b = `SPC4.lsu.dcc.dcc_ld_miss_b;
  assign fraw_w    = `SPC4.lsu.lmc.ld_raw_bypass_w;
  assign hit_w     = ~ld_miss_w & ~stb_hit_w;
  assign miss_w    = ~fraw_w & (ld_miss_w | stb_hit_w);

//---------------------
// Load Pop

  assign perfmon_g      = `SPC4.lsu.lsu_perfmon_trap_g;
  assign perfmon_tid_g  = `SPC4.lsu.lsu_dcerr_tid_g;
  // perfmon_mask will not fire if trap is not enabled or higher priority trap is taken.
  assign perfmon_mask_g = {`SPC4.tlu.fls1.pil_mask_15[3:0], `SPC4.tlu.fls0.pil_mask_15[3:0]} &
                           ~{8 {`SPC4.lsu_dcl2u_err_g | `SPC4.lsu_dcl2nd_err_g}};

  assign perfmon      = perfmon_w;
  assign perfmon_tid  = perfmon_tid_w;
  assign perfmon_tnum = {mycid,perfmon_tid_w};
  assign perfmon_mask = perfmon_mask_w;



//---------------------
// Store Pop

  assign bst_kill      = {`SPC4.lsu.sbs7.bst_kill,
                          `SPC4.lsu.sbs6.bst_kill,
                          `SPC4.lsu.sbs5.bst_kill,
                          `SPC4.lsu.sbs4.bst_kill,
                          `SPC4.lsu.sbs3.bst_kill,
                          `SPC4.lsu.sbs2.bst_kill,
                          `SPC4.lsu.sbs1.bst_kill,
                          `SPC4.lsu.sbs0.bst_kill};
  
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC4.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline from B to W

  ldi_pa_w    <= ldi_pa_b;
  ld_miss_w   <= ld_miss_b;
  stb_hit_w   <= `SPC4.lsu.stb_cam_hit;
  ldi_pf_w    <= ldi_pf_b;
  ldi_size_w  <= ldi_size_b;
  load_fill_m <= load_fill_e;
  load_fill_b <= load_fill_m;
  load_fill_w <= load_fill_b;
  ldf_tid_m   <= ldf_tid_e;
  ldf_tid_b   <= ldf_tid_m;
  ldf_tid_w   <= ldf_tid_b;
  ldf_pa_m    <= ldf_pa_e;
  ldf_pa_b    <= ldf_pa_m;
  ldf_pa_w    <= ldf_pa_b;

  sti_size_b     <= sti_size_m;
  sti_size_w     <= (flip_size_b) ? {sti_size_b[0],sti_size_b[1],sti_size_b[2],sti_size_b[3],
                                     sti_size_b[4],sti_size_b[5],sti_size_b[6],sti_size_b[7]} 
                                  : sti_size_b;
  sti_pa_w       <= sti_pa_b;
  sti_tid_w      <= sti_tid_b;
  st_ack_no_asi_m  <= st_ack_no_asi_e;
  st_ack_no_asi_b  <= st_ack_no_asi_m;
  st_data_access_m <= st_data_access_e;
  st_data_access_b <= st_data_access_m;
  st_data_access_w <= st_data_access_b;
  store_ack_w    <= store_ack_b;
  store_update_m <= store_update_e;
  store_update_b <= store_update_m;
  store_update_w <= store_update_b;
  store_inv_m    <= store_inv_e;
  store_inv_b    <= store_inv_m;
  store_inv_w    <= store_inv_b;
  stinv_tnum_m   <= stinv_tnum_e;
  stinv_tnum_b   <= stinv_tnum_m;
  stinv_tnum_w   <= stinv_tnum_b;
  st_ack_rmo_w   <= st_ack_rmo_b;
  stu_tid_m      <= stu_tid_e;
  stu_tid_b      <= stu_tid_m;
  stu_tid_w      <= stu_tid_b;
  stu_tnum_m     <= stu_tnum_e;
  stu_tnum_b     <= stu_tnum_m;
  stu_tnum_w     <= stu_tnum_b;
  store_pa_b     <= store_pa_m;
  store_pa_w     <= store_pa_b;
  bst_in_prog_w  <= bst_in_prog_b;
  blk_inst_w     <= blk_inst_b;
  sbd_st_data_w  <=  sbd_st_data_b;
  evict_inv_m    <= evict_inv_e;
  evict_inv_b    <= evict_inv_m;
  evict_inv_w    <= evict_inv_b;
  evict_srcid_m  <= evict_srcid_e;
  evict_srcid_b  <= evict_srcid_m;
  evict_srcid_w  <= evict_srcid_b;
  pcx_req_1      <= pcx_req;
  stb_state0_b   <= stb_state0_m;
  stb_state1_b   <= stb_state1_m;
  stb_state2_b   <= stb_state2_m;
  stb_state3_b   <= stb_state3_m;
  stb_state4_b   <= stb_state4_m;
  stb_state5_b   <= stb_state5_m;
  stb_state6_b   <= stb_state6_m;
  stb_state7_b   <= stb_state7_m;
  stb_state0_w   <= stb_state0_b;
  stb_state1_w   <= stb_state1_b;
  stb_state2_w   <= stb_state2_b;
  stb_state3_w   <= stb_state3_b;
  stb_state4_w   <= stb_state4_b;
  stb_state5_w   <= stb_state5_b;
  stb_state6_w   <= stb_state6_b;
  stb_state7_w   <= stb_state7_b;

  perfmon_m      <= perfmon_g;
  perfmon_b      <= perfmon_m;
  perfmon_w      <= perfmon_b;
  perfmon_tid_m  <= perfmon_tid_g;
  perfmon_tid_b  <= perfmon_tid_m;
  perfmon_tid_w  <= perfmon_tid_b;
  perfmon_mask_m <= perfmon_mask_g;
  perfmon_mask_b <= perfmon_mask_m;
  perfmon_mask_w <= perfmon_mask_b;

  //----------------------------------------------------------
  // Calculate pa for STUPDATE and STINV
  // Moved this into the always block to avoid the constant
  // probing of the dtag memory structure.

  if (store_inv_e | store_update_e) begin // {
    store_pa_m[2:0]    <= 3'b000;
    store_pa_m[10:3]   <= {`SPC4.lsu.cid.cpq_data_out[116],
                           `SPC4.lsu.cid.cpq_data_out[115],
                           `SPC4.lsu.cid.cpq_data_out[114],
                           `SPC4.lsu.cid.cpq_data_out[113],
                           `SPC4.lsu.cid.cpq_data_out[112],
                           `SPC4.lsu.cid.cpq_data_out[122],
                           `SPC4.lsu.cid.cpq_data_out[121],
                           `SPC4.lsu.cid.cpq_data_out[104]
                          };
    store_pa_m[38:11] <= (l1_way_select==2'h0) ? dta_way0[l1_index] :
                         (l1_way_select==2'h1) ? dta_way1[l1_index] :
                         (l1_way_select==2'h2) ? dta_way2[l1_index] : dta_way3[l1_index];
    store_pa_m[39]    <= 1'b0;		// Only memory stores get inv/update
  end // }


  // After Store to IO ASI is detected at StI time, suppress the next Store Ack
  // There is only 1 store to IO ASI active at one time per thread because
  //   that is all the LSU allows.
  if (st_io_asi) begin
    sta_suppress [st_io_tid] <= 1'b1;
  end 

  case ({ldi_atomic_b,ldi_bld_b,ldi_ldd_b,ldi_qld_b,ldi_pf_b})
    5'b00000: ldi_itype_w <= `ITYPE_LOAD;
    5'b00001: ldi_itype_w <= `ITYPE_PREFETCH;
    5'b00010: ldi_itype_w <= `ITYPE_QUAD_LOAD;
    5'b00100: ldi_itype_w <= `ITYPE_DOUBLE_LOAD;
    5'b01000: ldi_itype_w <= `ITYPE_BLOCK_LOAD;
    5'b10000: ldi_itype_w <= `ITYPE_ATOMIC;
    default: ldi_itype_w <= `ITYPE_NO; // Illegal
  endcase

  case ({atomic_b,rmo_st_b,bst_in_prog_b})
    3'b000: itype_w <= `ITYPE_STORE;
    3'b010: itype_w <= `ITYPE_BLK_INIT_ST;
    3'b011: itype_w <= `ITYPE_BLOCK_STORE;
    3'b100: itype_w <= `ITYPE_ATOMIC;
    3'b001,
    3'b101,
    3'b110,
    3'b111: itype_w <= `ITYPE_NO; // Illegal
  endcase

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Issue

  //  Load Issue must be before Store Issue for atomic

  if (load_w) begin // {

    if (ldi_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h size=%h  typ=%0h                     ts=%0d",
                            mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_LD_ISSUE,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
      end // }
    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h  Suppress for IO ASI",mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_LOAD  tid=%d pa=%h  ts=%0d  (LSU - W stage)",
                     mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  if (load_data_hit) begin // {

    dsrc = hit_w ? `DSRC_L1 : `DSRC_STB;

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
                         mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
      junk = $sim_send(`PLI_MEM_LD_DATA,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Ack
  //
  // Store Ack cmd must be sent before Store Inv, Store Update for NAS
  // Store Ack & Store Update will be in the same timestamp

  if (store_ack_w != 8'b0) begin // {

    for (i=0; i<=7; i=i+1) begin // {
      if (store_ack_w[i]) begin // {
        sta_tid = i[2:0];
        sta_tnum = {mycid,sta_tid};
        sta_rmo = st_ack_rmo_w[i];

        if (sta_suppress[sta_tid]==1'b0)  begin // {
          if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
            junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
          end // }
        end // }

        else begin // {

          // It is possible for 2 Stores it be in flight because of the delay from CPQ push & pop.
          // So, make sure Bench is suppressing the correct Store.
          case (sta_tid)
            3'h0: stb_state=stb_state0_w;
            3'h1: stb_state=stb_state1_w;
            3'h2: stb_state=stb_state2_w;
            3'h3: stb_state=stb_state3_w;
            3'h4: stb_state=stb_state4_w;
            3'h5: stb_state=stb_state5_w;
            3'h6: stb_state=stb_state6_w;
            3'h7: stb_state=stb_state7_w;
            default: 
              `PR_ERROR ("pli_ldst", `ERROR, 
              "C%0d T%0d PLI_MEM_XXX Bench Error.  Should never execute case default",mycid,sta_tid);
          endcase

          // If stb_state has only 1 bit asserted, then suppress the STACK.  Otherwise, send the STACK.
          case (stb_state) // {
            8'b0000_0000: begin
                `PR_ERROR ("pli_ldst", `ERROR, 
                "C%0d T%0d PLI_MEM_XXX Bench Error.  stb_state should not be 8'b0",
                 mycid,sta_tid);
              end
            8'b0000_0001,
            8'b0000_0010,
            8'b0000_0100,
            8'b0000_1000,
            8'b0001_0000,
            8'b0010_0000,
            8'b0100_0000,
            8'b1000_0000: stb_last = 1'b1;
            default:      stb_last = 1'b0;
          endcase // }

          if (stb_last==1'b0) begin // {
            if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
              `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                  mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
              junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
            end // }
          end // }
          else begin // {
            sta_suppress[sta_tid] <= 1'b0;
            `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d                Suppress for IO ASI",mycid,sta_tid,sta_tnum);
          end // }
        end // }

      end //  if (store_ack_w[i]) }
    end // for }

  end // if (store_ack_w) }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Inv

  if (store_inv_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stinv_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d    PLI_MEM_STINV  tid=%d pa=%h cid=%h                             ts=%0d",
                                  mycid,stinv_tnum_w,store_pa_w,mycid,tstamp);
      junk = $sim_send(`PLI_MEM_ST_INV,mycid,stinv_tnum_w,store_pa_w,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Update

  if (store_update_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stu_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STUP   tid=%d pa=%h                                   ts=%0d",
                           mycid,stu_tid_w,stu_tnum_w,store_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_ST_UPDATE,stu_tnum_w,store_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Fill

  if (load_fill_w) begin // {

    ldf_tnum_w = {mycid,ldf_tid_w};

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldf_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDFILL tid=%d pa=%h                                   ts=%0d",
                         mycid,ldf_tid_w,ldf_tnum_w,ldf_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_LD_FILL,ldf_tnum_w,ldf_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Issue

  if (store_w) begin // {

    if (sti_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sti_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h data=%h sz=%h typ=%0h ts=%0d",
                          mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_ST_ISSUE,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
      end // }

    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h  Suppress for IO ASI",mycid,sti_tid_w,sti_tnum_w,sti_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_STORE tid=%d pa=%h  data=%h sz=%h ts=%0d  (LSU - W stage)",
                     mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // EvictInv
  // Send 1-4 EvictInv messages per cycle - based on how many Dcache lines were invalidated.

  for (i=0; i<=3; i=i+1) begin // {
    if (evict_inv_w[i]) begin // {

      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d    PLI_MEM_EVINV                      cid=%d  srcid=%0d                    ts=%0d",
                                       mycid,mycid,evict_srcid_w,tstamp);
        junk = $sim_send(`PLI_MEM_EVICT_INV,mycid,evict_srcid_w,tstamp);
      end // }

    end // }
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Load Pop - special case

  // This is required in case of a performance monitor trap due to L2 miss.
  // In this case, the trap is not indicated until after the Load pkt returns to the LSU.
  // ldst_sync has already sent LDISSUE and LDDATA to Riesling.  But, the Load is not executed.
  // Load Pop tells Riesling to pop the LDISSUE,LDDATA off of its queues.

  if (perfmon & perfmon_mask[perfmon_tid]) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[perfmon_tnum]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDPOP  tid=%d                                                 ts=%0d",
                           mycid,perfmon_tid,perfmon_tnum,tstamp);
      junk = $sim_send(`PLI_MEM_LD_POP,perfmon_tnum);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Pop - special cases

  // This is required in case of a FRF error trap (internal_proc_error) on a Block Store.
  // In this case, the trap is not indicated until after the 8 STISSUE has been sent to Riesling.
  // But, the Store is not executed.
  // Store Pop tells Riesling to pop the 8 STISSUE off of its queues.

  if (bst_kill!==8'b0) begin // {

    for (i=0;i<=7;i=i+1) begin
      if (bst_kill[i]==1'b1) begin
        bst_kill_tid = i;
        bst_kill_tnum = {mycid,bst_kill_tid};

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[bst_kill_tnum]) begin // {
          `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
                               mycid,bst_kill_tid,bst_kill_tnum,tstamp);
          junk = $sim_send(`PLI_MEM_ST_POP,bst_kill_tnum);
        end // }
      end
    end

  end // }

  //--------------------
  // This is required for data_access_error on atomic.  In this case, Riesling only cleans up the Load,
  // but doesn't know it is an atomic so Riesling doesn't clean up the store in its buffers.
  // The STPOP tells Riesling to clear the newest Store from the buffers.
  // It is possible to have older Stores in-flight but not newer Stores in-flight.

//  if (st_data_access_w != 8'b0) begin // {
//
//    for (i=0; i<=7; i=i+1) begin // {
//      if (st_data_access_w[i]) begin // {
//        tmp_tid = i[2:0];
//        tmp_tnum = {mycid,tmp_tid};
//
//        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[tmp_tnum]) begin // {
//           `PR_INFO ("pli_ldst", `INFO, 
//               "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
//                               mycid,tmp_tid,tmp_tnum,tstamp);
//           junk = $sim_send(`PLI_MEM_ST_POP,tmp_tnum);
//        end // }
//      end // } if st_data_access[i]
//    end // } for
//  end // } if st_data_access

end // always }

//----------------------------------------------------------
// Need to model the D arrays to get PA's for store updates and invalidates

always @ (negedge `SPC4.l2clk) begin // {
  if (`SPC4.lsu.dta.wr_way[0])
    dta_way0[`SPC4.lsu.dta.index_y[6:0]] <= `SPC4.lsu.dta.wrtag_y[27:0];
  if (`SPC4.lsu.dta.wr_way[1])
    dta_way1[`SPC4.lsu.dta.index_y[6:0]] <= `SPC4.lsu.dta.wrtag_y[27:0];
  if (`SPC4.lsu.dta.wr_way[2])
    dta_way2[`SPC4.lsu.dta.index_y[6:0]] <= `SPC4.lsu.dta.wrtag_y[27:0];
  if (`SPC4.lsu.dta.wr_way[3])
    dta_way3[`SPC4.lsu.dta.index_y[6:0]] <= `SPC4.lsu.dta.wrtag_y[27:0];
end // always }

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_5

module ldst_lsu_c5 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "nas.vh"
// PCX/CPX packet defines (see :/verif/env/common/vera/include)
`include "ccx.vri"
`include "cmp.vri"

//---------------------
// Load Signals
wire                       load_w;

wire                       ldi_suppress;
wire                 [2:0] ldi_tid_w;
wire                 [5:0] ldi_tnum_w;
wire                [39:0] ldi_pa_b;
reg                 [39:0] ldi_pa_w;
wire                 [1:0] ldi_size_b;
reg                  [1:0] ldi_size_w;
wire                       ldi_bld_b;
wire                       ldi_qld_b;
wire                       ldi_ldbl_b;
wire                       ldi_ldd_b;
wire                       ldi_atomic_b;
wire                       ldi_pf_b;
reg                        ldi_pf_w;
reg                  [7:0] ldi_itype_w;
reg                  [7:0] dsrc;

wire                       ld_miss_b;
reg                        ld_miss_w;
reg                        stb_hit_w;
wire                       fraw_w;
wire                       hit_w;
wire                       miss_w;
wire                       load_data_hit;

wire                       load_fill_e;
reg                        load_fill_m;
reg                        load_fill_b;
reg                        load_fill_w;
wire                 [2:0] ldf_tid_e;
reg                  [2:0] ldf_tid_m;
reg                  [2:0] ldf_tid_b;
reg                  [2:0] ldf_tid_w;
reg                  [5:0] ldf_tnum_w;
wire                [39:0] ldf_pa_e;
reg                 [39:0] ldf_pa_m;
reg                 [39:0] ldf_pa_b;
reg                 [39:0] ldf_pa_w;

//---------------------
// Store Signals
wire                       unflushed_store_w;
wire                       store_w;
wire                       sti_suppress;
wire                 [2:0] sti_tid_b;
reg                  [2:0] sti_tid_w;
wire                 [5:0] sti_tnum_w;
wire                [39:0] sti_pa_b;
reg                 [39:0] sti_pa_w;
wire                [63:0] sti_data_w;
wire                 [7:0] sti_size_m;
reg                  [7:0] sti_size_b;
reg                  [7:0] sti_size_w;
wire                 [7:0] sti_itype_w;
reg                  [7:0] itype_w;
wire                [63:0] sbd_st_data_b;
reg                 [63:0] sbd_st_data_w;
wire                       flip_size_b;

wire                       atomic_b;
wire                       rmo_st_b;
wire                       blk_inst_b;
reg                        blk_inst_w;

wire                       bst_in_prog_b;
reg                        bst_in_prog_w;
wire                [39:0] bst_pa_b;
reg                 [39:0] bst_pa_w;
wire                 [2:0] bst_tid_b;
reg                  [2:0] bst_tid_w;
wire                [39:0] st_pa_b;
reg                 [39:0] st_pa_w;
wire                 [2:0] st_tid_b;
reg                  [2:0] st_tid_w;

wire                       store_inv_e;
reg                        store_inv_m;
reg                        store_inv_b;
reg                        store_inv_w;
wire                 [5:0] stinv_tnum_e;
reg                  [5:0] stinv_tnum_m;
reg                  [5:0] stinv_tnum_b;
reg                  [5:0] stinv_tnum_w;

wire                       store_update_e;
reg                        store_update_m;
reg                        store_update_b;
reg                        store_update_w;
wire                 [2:0] stu_tid_e;
reg                  [2:0] stu_tid_m;
reg                  [2:0] stu_tid_b;
reg                  [2:0] stu_tid_w;
wire                 [5:0] stu_tnum_e;
reg                  [5:0] stu_tnum_m;
reg                  [5:0] stu_tnum_b;
reg                  [5:0] stu_tnum_w;

wire                 [7:0] asi_st_dequeue;
wire                 [7:0] st_ack_no_asi_e;
reg                  [7:0] st_ack_no_asi_m;
reg                  [7:0] st_ack_no_asi_b;
wire                 [7:0] store_ack_b;
reg                  [7:0] store_ack_w;
wire                 [7:0] st_ack_rmo_b;
reg                  [7:0] st_ack_rmo_w;
reg                        sta_rmo;
reg                  [2:0] sta_tid;
reg                  [5:0] sta_tnum;
reg                        sta_suppress [0:7];  // 1 per thread
wire                       st_io_asi;
wire                 [2:0] st_io_tid;
wire                 [7:0] st_data_access_e;
reg                  [7:0] st_data_access_m;
reg                  [7:0] st_data_access_b;
reg                  [7:0] st_data_access_w;
reg                  [2:0] tmp_tid;
reg                  [5:0] tmp_tnum;

reg                 [39:0] store_pa_m;
reg                 [39:0] store_pa_b;
reg                 [39:0] store_pa_w;

wire                 [1:0] l1_way_select;
wire                 [6:0] l1_index;
wire                [27:0] my_way;
wire                [27:0] way0;
wire                [27:0] way1;
wire                [27:0] way2;
wire                [27:0] way3;

wire                 [3:0] evict_inv_e;
reg                  [3:0] evict_inv_m;
reg                  [3:0] evict_inv_b;
reg                  [3:0] evict_inv_w;
wire                 [2:0] evict_srcid_e;
reg                  [2:0] evict_srcid_m;
reg                  [2:0] evict_srcid_b;
reg                  [2:0] evict_srcid_w;

wire                 [8:0] pcx_req;
reg                  [8:0] pcx_req_1;
wire               [129:0] pcx_data;

wire                       perfmon;
wire                       perfmon_g;
reg                        perfmon_m;
reg                        perfmon_b;
reg                        perfmon_w;
wire                 [2:0] perfmon_tid;
wire                 [2:0] perfmon_tid_g;
reg                  [2:0] perfmon_tid_m;
reg                  [2:0] perfmon_tid_b;
reg                  [2:0] perfmon_tid_w;
wire                 [5:0] perfmon_tnum;
wire                 [7:0] perfmon_mask;
wire                 [7:0] perfmon_mask_g;
reg                  [7:0] perfmon_mask_m;
reg                  [7:0] perfmon_mask_b;
reg                  [7:0] perfmon_mask_w;

wire                 [7:0] bst_kill;
reg                  [2:0] bst_kill_tid;
reg                  [5:0] bst_kill_tnum;

wire                 [7:0] stb_state0_m;
wire                 [7:0] stb_state1_m;
wire                 [7:0] stb_state2_m;
wire                 [7:0] stb_state3_m;
wire                 [7:0] stb_state4_m;
wire                 [7:0] stb_state5_m;
wire                 [7:0] stb_state6_m;
wire                 [7:0] stb_state7_m;
reg                  [7:0] stb_state0_b;
reg                  [7:0] stb_state1_b;
reg                  [7:0] stb_state2_b;
reg                  [7:0] stb_state3_b;
reg                  [7:0] stb_state4_b;
reg                  [7:0] stb_state5_b;
reg                  [7:0] stb_state6_b;
reg                  [7:0] stb_state7_b;
reg                  [7:0] stb_state0_w;
reg                  [7:0] stb_state1_w;
reg                  [7:0] stb_state2_w;
reg                  [7:0] stb_state3_w;
reg                  [7:0] stb_state4_w;
reg                  [7:0] stb_state5_w;
reg                  [7:0] stb_state6_w;
reg                  [7:0] stb_state7_w;
reg                  [7:0] stb_state;
reg                        stb_last;

// Copy of dtag
reg [27:0] dta_way0 [127:0];
reg [27:0] dta_way1 [127:0];
reg [27:0] dta_way2 [127:0];
reg [27:0] dta_way3 [127:0];

//---------------------
// Misc Signals
wire                 [2:0] mycid;
integer                    tstamp;
integer                    junk;
integer                    i;

initial begin // {
  ldf_tnum_w = 6'b0;
  dsrc = 2'b0;
  sta_tid    = 3'b0;
  sta_tnum   = 6'b0;
  for (i=0; i<=7; i=i+1) begin
    sta_suppress[i] = 1'b0;
  end

end // }

// for debug only - allows display in Debussy
wire    sta_suppress0;
wire    sta_suppress1;
wire    sta_suppress2;
wire    sta_suppress3;
wire    sta_suppress4;
wire    sta_suppress5;
wire    sta_suppress6;
wire    sta_suppress7;

  assign   sta_suppress0 = sta_suppress[0];
  assign   sta_suppress1 = sta_suppress[1];
  assign   sta_suppress2 = sta_suppress[2];
  assign   sta_suppress3 = sta_suppress[3];
  assign   sta_suppress4 = sta_suppress[4];
  assign   sta_suppress5 = sta_suppress[5];
  assign   sta_suppress6 = sta_suppress[6];
  assign   sta_suppress7 = sta_suppress[7];

//----------------------------------------------------------
//----------------------------------------------------------
// DUT probes

  assign   mycid = 5;

//---------------------
// Load Issue

  // If Load to IO ASIs, load issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress load_w.

  assign load_w      = `SPC5.lsu.dcc.ld_inst_vld_w & 
                        ~`PROBES5.asi_internal_w &
                        ~`SPC5.lsu.dcc.flush_w &
                        ~ldi_pf_w;

  // ldxa to IO ASI are already suppressed since load_w will not assert.
  // ldi_suppress is required to also suppress normal ld to IO ASI address range.
  assign ldi_suppress = (ldi_pa_w[39:32] == `IO_ASI_ADDR);

  assign ldi_tid_w    = `SPC5.lsu.dcc.tid_w;
  assign ldi_tnum_w   = {mycid,ldi_tid_w};
  assign ldi_size_b   = `SPC5.lsu.dcc.ldst_sz_b;  // 2 bits
  assign ldi_atomic_b = `SPC5.lsu.dcc.atomic_b;
  assign ldi_qld_b    = `SPC5.lsu.dcc.quad_ldd_b;
  assign ldi_ldbl_b   = `SPC5.lsu.dcc_ldbl_b;
  assign ldi_ldd_b    = ldi_ldbl_b & !ldi_qld_b;
  assign ldi_bld_b    = `SPC5.lsu.dcc.dcc_blk_inst_b;
  assign ldi_pf_b     = `SPC5.lsu.dcc.pref_inst_b;

  // pa, tid are same for LoadIssue and StoreIssue
  assign ldi_pa_b = {`SPC5.lsu.tlb_pgnum[39:13],
                    `SPC5.lsu.lmd.lsu_va_b[12:0]};

//---------------------
// Load Fill

  assign load_fill_e = `SPC5.lsu.dcc.ld_fill_e;
  assign ldf_tid_e   = `SPC5.lsu.cid.cid_tid;
  assign ldf_pa_e    = {`SPC5.lsu.lmd.lmd_fill_addr_e[39:3],3'b0};

//---------------------
// Store Issue

  // blk_inst_w will suppress store_w for 1st of 9 cycles on block store.

  // If Store to IO ASIs, store issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress store_w.

  assign unflushed_store_w = `SPC5.lsu.sbc.unflushed_store_w;

  assign store_w      =   unflushed_store_w &
                          (~(`PROBES5.asi_internal_w | blk_inst_w) |
                            bst_in_prog_w);

  assign atomic_b      = `SPC5.lsu.dcc.atomic_b;
  assign rmo_st_b      = `SPC5.lsu.sbc_rmo_st_b;
  assign blk_inst_b    = `SPC5.lsu.dcc.dcc_blk_inst_b;

  assign sti_tnum_w   = {mycid,sti_tid_w};
  assign sti_size_m   = `SPC5.lsu.dcc_ldst_bmask;

  // flip_size will assert if endian swap for partial store is needed
  assign flip_size_b  = `SPC5.lsu.dcc.pst_asi_b & `SPC5.lsu.dcc.tlb_tte_ie_b & `SPC5.lsu.dcc.tlb_tte_vld_b & `SPC5.lsu.dcc.st_inst_vld_b;

  // Change itype only when control signals are valid
  assign sti_itype_w  = unflushed_store_w ? itype_w : sti_itype_w;

  // It is correct to mix W & B stage signals for this.
  // STD is a 2 cycle instruction.
  // inst valid in W, data in B (1 cycle behind)
  assign sti_data_w    = `SPC5.lsu.sbc.std_inst_w ?
                          sbd_st_data_b :
                          sbd_st_data_w;
  assign sbd_st_data_b = `SPC5.lsu.sbd_st_data_b;

  // Use different pa,tid if block store
  assign sti_pa_b     = bst_in_prog_b ? bst_pa_b  : st_pa_b;
  assign sti_tid_b    = bst_in_prog_b ? bst_tid_b : st_tid_b;

  // stxa to IO ASI are already suppressed since store_w will not assert.
  // sti_suppress is required to also suppress normal st to IO ASI address range.
  assign sti_suppress = (sti_pa_w[39:32] == `IO_ASI_ADDR);

  // Normal Store
  assign st_pa_b      = {`SPC5.lsu.tlb_pgnum[39:13],
                         `SPC5.lsu.lmd.lsu_va_b[12:0]};
  assign st_tid_b     = `SPC5.lsu.dcc.tid_b;

  // Block Store
  assign bst_in_prog_b = `SPC5.lsu.sbc.bst_in_prog_b;
  assign bst_pa_b      = {`SPC5.lsu.sbd.st_addr_b[39:3],3'b0};
  assign bst_tid_b     = `SPC5.lsu.sbc.bst_tid;

//---------------------
// Store Ack

assign asi_st_dequeue[7:0] = `SPC5.lsu.dcc_asi_rtn_vld[7:0] &
                             {8{~`SPC5.lsu.dcc_asi_rtn_rd}};

  assign st_ack_no_asi_e = `SPC5.lsu.cic.cic_st_dequeue[7:0] & 
                           ~asi_st_dequeue[7:0] & 
                           ~`SPC5.lsu.cic.sbc_bst_sel[7:0];

  assign st_ack_rmo_b  = {`SPC5.lsu.sbs7.rmo_st_commit_p4,
                          `SPC5.lsu.sbs6.rmo_st_commit_p4,
                          `SPC5.lsu.sbs5.rmo_st_commit_p4,
                          `SPC5.lsu.sbs4.rmo_st_commit_p4,
                          `SPC5.lsu.sbs3.rmo_st_commit_p4,
                          `SPC5.lsu.sbs2.rmo_st_commit_p4,
                          `SPC5.lsu.sbs1.rmo_st_commit_p4,
                          `SPC5.lsu.sbs0.rmo_st_commit_p4
                         };

  // It is possible to see 2 threads store_ack in same cycle
  // (1 st_ack_no_asi & 1 st_ack_rmo)

  assign store_ack_b   = st_ack_no_asi_b | st_ack_rmo_b;

  // cic_st_atm_cmplt is atomic store completing (same time as store ack)
  // (lsu.lmc.dcl2u_err | dcl2nd_err) indicate a data_access_error condition
  assign st_data_access_e = {8{(`SPC5.lsu.cic.cic_st_atm_cmplt & 
                             (`SPC5.lsu.lmc.dcl2u_err | `SPC5.lsu.lmc.dcl2nd_err))}} &
                            `SPC5.lsu.cic.cic_st_dequeue[7:0];
//---------------------
// Store Inv

  // Same as evict_inv_e but with cpq_evict deasserted
  assign store_inv_e  =  `SPC5.lsu.cic_invalidate_e &
                         (`SPC5.lsu.cic_inv_wen_e!=0)&
                        ~`SPC5.lsu.cic.cpq_evict & 
                        ~`SPC5.lsu.cic.cid_set_inval & 
                        ~`SPC5.lsu.cic.cic_xinval_e &
			~(`SPC5.lsu.cic.cid_pkt_type[4:0] == 5'b10110);
  assign stinv_tnum_e = 
         {`SPC5.lsu.cid.cpq_data_out[`CPX_VACK_CID],
          `SPC5.lsu.cid.cid_tid};

//---------------------
// Store Update

  assign store_update_e = `SPC5.lsu.cic_st_update_e;
  assign stu_tid_e      = `SPC5.lsu.cid.cid_tid;
  assign stu_tnum_e     = {mycid,stu_tid_e};

  assign l1_index = {`SPC5.lsu.cid.cpq_data_out[116],
                     `SPC5.lsu.cid.cpq_data_out[115],
                     `SPC5.lsu.cid.cpq_data_out[114],
                     `SPC5.lsu.cid.cpq_data_out[113],
                     `SPC5.lsu.cid.cpq_data_out[112],
                     `SPC5.lsu.cid.cpq_data_out[122],
                     `SPC5.lsu.cid.cpq_data_out[121]
                    };
  assign l1_way_select = `SPC5.lsu.cid_inv_vec[17:16];

//---------------------
// EvictInv

  // Same as store_inv_e but with cpq_evict asserted
  // LSU can invalidate 1-4 Dcache lines
  assign evict_inv_e[3:0]  =  {4{`SPC5.lsu.cic_invalidate_e &          // enable for 4 bit wen below
                                (`SPC5.lsu.cic_inv_wen_e!=0)&
                               `SPC5.lsu.cic.cpq_evict &
                               ~`SPC5.lsu.cic.cid_set_inval &
                               ~`SPC5.lsu.cic.cic_xinval_e}} &

                              {|(`SPC5.lsu.cic.evict_inv_wen[15:12]),   // 4 bit field - 1 hot.  Send evinv when any one set.
                               |(`SPC5.lsu.cic.evict_inv_wen[11:8]),
                               |(`SPC5.lsu.cic.evict_inv_wen[7:4]),
                               |(`SPC5.lsu.cic.evict_inv_wen[3:0])
                              };

  assign evict_srcid_e  = `SPC5.lsu.cid.cpq_data_out[114:112];


//---------------------
// Detect Store to IO ASI in PCX crossbar packet.
// This causes next Store Ack to be suppressed.

// Normal Store only since atomics are always to cacheable space

// Trigger on Store to crossbar.
// If Store request is retried on crossbar (due to no grant),
// then, st_io_asi will fire multiple times for the same request.
// This is OK because it just causes sta_suppress to be set multiple times.

  assign pcx_req    = `SPC5.spc_pcx_req_pq;
  assign pcx_data   = `SPC5.spc_pcx_data_pa;

  assign st_io_asi  = (pcx_req_1 != 9'b0) & 
                      (pcx_data [`PCX_VALID]==1'b1) & 
                      (pcx_data [`PCX_RQTYP]==`CCX_REQ_ST) & 
                      (pcx_data [103:96]==`IO_ASI_ADDR);  // Upper byte of 40 bit addr

  assign st_io_tid  = pcx_data [`PCX_TID];

  assign stb_state0_m = `SPC5.lsu.sbs0.stb_state_vld[7:0];
  assign stb_state1_m = `SPC5.lsu.sbs1.stb_state_vld[7:0];
  assign stb_state2_m = `SPC5.lsu.sbs2.stb_state_vld[7:0];
  assign stb_state3_m = `SPC5.lsu.sbs3.stb_state_vld[7:0];
  assign stb_state4_m = `SPC5.lsu.sbs4.stb_state_vld[7:0];
  assign stb_state5_m = `SPC5.lsu.sbs5.stb_state_vld[7:0];
  assign stb_state6_m = `SPC5.lsu.sbs6.stb_state_vld[7:0];
  assign stb_state7_m = `SPC5.lsu.sbs7.stb_state_vld[7:0];

//---------------------
// Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  assign load_data_hit = load_w && (hit_w | fraw_w);
  assign ld_miss_b = `SPC5.lsu.dcc.dcc_ld_miss_b;
  assign fraw_w    = `SPC5.lsu.lmc.ld_raw_bypass_w;
  assign hit_w     = ~ld_miss_w & ~stb_hit_w;
  assign miss_w    = ~fraw_w & (ld_miss_w | stb_hit_w);

//---------------------
// Load Pop

  assign perfmon_g      = `SPC5.lsu.lsu_perfmon_trap_g;
  assign perfmon_tid_g  = `SPC5.lsu.lsu_dcerr_tid_g;
  // perfmon_mask will not fire if trap is not enabled or higher priority trap is taken.
  assign perfmon_mask_g = {`SPC5.tlu.fls1.pil_mask_15[3:0], `SPC5.tlu.fls0.pil_mask_15[3:0]} &
                           ~{8 {`SPC5.lsu_dcl2u_err_g | `SPC5.lsu_dcl2nd_err_g}};

  assign perfmon      = perfmon_w;
  assign perfmon_tid  = perfmon_tid_w;
  assign perfmon_tnum = {mycid,perfmon_tid_w};
  assign perfmon_mask = perfmon_mask_w;



//---------------------
// Store Pop

  assign bst_kill      = {`SPC5.lsu.sbs7.bst_kill,
                          `SPC5.lsu.sbs6.bst_kill,
                          `SPC5.lsu.sbs5.bst_kill,
                          `SPC5.lsu.sbs4.bst_kill,
                          `SPC5.lsu.sbs3.bst_kill,
                          `SPC5.lsu.sbs2.bst_kill,
                          `SPC5.lsu.sbs1.bst_kill,
                          `SPC5.lsu.sbs0.bst_kill};
  
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC5.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline from B to W

  ldi_pa_w    <= ldi_pa_b;
  ld_miss_w   <= ld_miss_b;
  stb_hit_w   <= `SPC5.lsu.stb_cam_hit;
  ldi_pf_w    <= ldi_pf_b;
  ldi_size_w  <= ldi_size_b;
  load_fill_m <= load_fill_e;
  load_fill_b <= load_fill_m;
  load_fill_w <= load_fill_b;
  ldf_tid_m   <= ldf_tid_e;
  ldf_tid_b   <= ldf_tid_m;
  ldf_tid_w   <= ldf_tid_b;
  ldf_pa_m    <= ldf_pa_e;
  ldf_pa_b    <= ldf_pa_m;
  ldf_pa_w    <= ldf_pa_b;

  sti_size_b     <= sti_size_m;
  sti_size_w     <= (flip_size_b) ? {sti_size_b[0],sti_size_b[1],sti_size_b[2],sti_size_b[3],
                                     sti_size_b[4],sti_size_b[5],sti_size_b[6],sti_size_b[7]} 
                                  : sti_size_b;
  sti_pa_w       <= sti_pa_b;
  sti_tid_w      <= sti_tid_b;
  st_ack_no_asi_m  <= st_ack_no_asi_e;
  st_ack_no_asi_b  <= st_ack_no_asi_m;
  st_data_access_m <= st_data_access_e;
  st_data_access_b <= st_data_access_m;
  st_data_access_w <= st_data_access_b;
  store_ack_w    <= store_ack_b;
  store_update_m <= store_update_e;
  store_update_b <= store_update_m;
  store_update_w <= store_update_b;
  store_inv_m    <= store_inv_e;
  store_inv_b    <= store_inv_m;
  store_inv_w    <= store_inv_b;
  stinv_tnum_m   <= stinv_tnum_e;
  stinv_tnum_b   <= stinv_tnum_m;
  stinv_tnum_w   <= stinv_tnum_b;
  st_ack_rmo_w   <= st_ack_rmo_b;
  stu_tid_m      <= stu_tid_e;
  stu_tid_b      <= stu_tid_m;
  stu_tid_w      <= stu_tid_b;
  stu_tnum_m     <= stu_tnum_e;
  stu_tnum_b     <= stu_tnum_m;
  stu_tnum_w     <= stu_tnum_b;
  store_pa_b     <= store_pa_m;
  store_pa_w     <= store_pa_b;
  bst_in_prog_w  <= bst_in_prog_b;
  blk_inst_w     <= blk_inst_b;
  sbd_st_data_w  <=  sbd_st_data_b;
  evict_inv_m    <= evict_inv_e;
  evict_inv_b    <= evict_inv_m;
  evict_inv_w    <= evict_inv_b;
  evict_srcid_m  <= evict_srcid_e;
  evict_srcid_b  <= evict_srcid_m;
  evict_srcid_w  <= evict_srcid_b;
  pcx_req_1      <= pcx_req;
  stb_state0_b   <= stb_state0_m;
  stb_state1_b   <= stb_state1_m;
  stb_state2_b   <= stb_state2_m;
  stb_state3_b   <= stb_state3_m;
  stb_state4_b   <= stb_state4_m;
  stb_state5_b   <= stb_state5_m;
  stb_state6_b   <= stb_state6_m;
  stb_state7_b   <= stb_state7_m;
  stb_state0_w   <= stb_state0_b;
  stb_state1_w   <= stb_state1_b;
  stb_state2_w   <= stb_state2_b;
  stb_state3_w   <= stb_state3_b;
  stb_state4_w   <= stb_state4_b;
  stb_state5_w   <= stb_state5_b;
  stb_state6_w   <= stb_state6_b;
  stb_state7_w   <= stb_state7_b;

  perfmon_m      <= perfmon_g;
  perfmon_b      <= perfmon_m;
  perfmon_w      <= perfmon_b;
  perfmon_tid_m  <= perfmon_tid_g;
  perfmon_tid_b  <= perfmon_tid_m;
  perfmon_tid_w  <= perfmon_tid_b;
  perfmon_mask_m <= perfmon_mask_g;
  perfmon_mask_b <= perfmon_mask_m;
  perfmon_mask_w <= perfmon_mask_b;

  //----------------------------------------------------------
  // Calculate pa for STUPDATE and STINV
  // Moved this into the always block to avoid the constant
  // probing of the dtag memory structure.

  if (store_inv_e | store_update_e) begin // {
    store_pa_m[2:0]    <= 3'b000;
    store_pa_m[10:3]   <= {`SPC5.lsu.cid.cpq_data_out[116],
                           `SPC5.lsu.cid.cpq_data_out[115],
                           `SPC5.lsu.cid.cpq_data_out[114],
                           `SPC5.lsu.cid.cpq_data_out[113],
                           `SPC5.lsu.cid.cpq_data_out[112],
                           `SPC5.lsu.cid.cpq_data_out[122],
                           `SPC5.lsu.cid.cpq_data_out[121],
                           `SPC5.lsu.cid.cpq_data_out[104]
                          };
    store_pa_m[38:11] <= (l1_way_select==2'h0) ? dta_way0[l1_index] :
                         (l1_way_select==2'h1) ? dta_way1[l1_index] :
                         (l1_way_select==2'h2) ? dta_way2[l1_index] : dta_way3[l1_index];
    store_pa_m[39]    <= 1'b0;		// Only memory stores get inv/update
  end // }


  // After Store to IO ASI is detected at StI time, suppress the next Store Ack
  // There is only 1 store to IO ASI active at one time per thread because
  //   that is all the LSU allows.
  if (st_io_asi) begin
    sta_suppress [st_io_tid] <= 1'b1;
  end 

  case ({ldi_atomic_b,ldi_bld_b,ldi_ldd_b,ldi_qld_b,ldi_pf_b})
    5'b00000: ldi_itype_w <= `ITYPE_LOAD;
    5'b00001: ldi_itype_w <= `ITYPE_PREFETCH;
    5'b00010: ldi_itype_w <= `ITYPE_QUAD_LOAD;
    5'b00100: ldi_itype_w <= `ITYPE_DOUBLE_LOAD;
    5'b01000: ldi_itype_w <= `ITYPE_BLOCK_LOAD;
    5'b10000: ldi_itype_w <= `ITYPE_ATOMIC;
    default: ldi_itype_w <= `ITYPE_NO; // Illegal
  endcase

  case ({atomic_b,rmo_st_b,bst_in_prog_b})
    3'b000: itype_w <= `ITYPE_STORE;
    3'b010: itype_w <= `ITYPE_BLK_INIT_ST;
    3'b011: itype_w <= `ITYPE_BLOCK_STORE;
    3'b100: itype_w <= `ITYPE_ATOMIC;
    3'b001,
    3'b101,
    3'b110,
    3'b111: itype_w <= `ITYPE_NO; // Illegal
  endcase

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Issue

  //  Load Issue must be before Store Issue for atomic

  if (load_w) begin // {

    if (ldi_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h size=%h  typ=%0h                     ts=%0d",
                            mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_LD_ISSUE,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
      end // }
    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h  Suppress for IO ASI",mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_LOAD  tid=%d pa=%h  ts=%0d  (LSU - W stage)",
                     mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  if (load_data_hit) begin // {

    dsrc = hit_w ? `DSRC_L1 : `DSRC_STB;

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
                         mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
      junk = $sim_send(`PLI_MEM_LD_DATA,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Ack
  //
  // Store Ack cmd must be sent before Store Inv, Store Update for NAS
  // Store Ack & Store Update will be in the same timestamp

  if (store_ack_w != 8'b0) begin // {

    for (i=0; i<=7; i=i+1) begin // {
      if (store_ack_w[i]) begin // {
        sta_tid = i[2:0];
        sta_tnum = {mycid,sta_tid};
        sta_rmo = st_ack_rmo_w[i];

        if (sta_suppress[sta_tid]==1'b0)  begin // {
          if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
            junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
          end // }
        end // }

        else begin // {

          // It is possible for 2 Stores it be in flight because of the delay from CPQ push & pop.
          // So, make sure Bench is suppressing the correct Store.
          case (sta_tid)
            3'h0: stb_state=stb_state0_w;
            3'h1: stb_state=stb_state1_w;
            3'h2: stb_state=stb_state2_w;
            3'h3: stb_state=stb_state3_w;
            3'h4: stb_state=stb_state4_w;
            3'h5: stb_state=stb_state5_w;
            3'h6: stb_state=stb_state6_w;
            3'h7: stb_state=stb_state7_w;
            default: 
              `PR_ERROR ("pli_ldst", `ERROR, 
              "C%0d T%0d PLI_MEM_XXX Bench Error.  Should never execute case default",mycid,sta_tid);
          endcase

          // If stb_state has only 1 bit asserted, then suppress the STACK.  Otherwise, send the STACK.
          case (stb_state) // {
            8'b0000_0000: begin
                `PR_ERROR ("pli_ldst", `ERROR, 
                "C%0d T%0d PLI_MEM_XXX Bench Error.  stb_state should not be 8'b0",
                 mycid,sta_tid);
              end
            8'b0000_0001,
            8'b0000_0010,
            8'b0000_0100,
            8'b0000_1000,
            8'b0001_0000,
            8'b0010_0000,
            8'b0100_0000,
            8'b1000_0000: stb_last = 1'b1;
            default:      stb_last = 1'b0;
          endcase // }

          if (stb_last==1'b0) begin // {
            if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
              `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                  mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
              junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
            end // }
          end // }
          else begin // {
            sta_suppress[sta_tid] <= 1'b0;
            `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d                Suppress for IO ASI",mycid,sta_tid,sta_tnum);
          end // }
        end // }

      end //  if (store_ack_w[i]) }
    end // for }

  end // if (store_ack_w) }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Inv

  if (store_inv_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stinv_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d    PLI_MEM_STINV  tid=%d pa=%h cid=%h                             ts=%0d",
                                  mycid,stinv_tnum_w,store_pa_w,mycid,tstamp);
      junk = $sim_send(`PLI_MEM_ST_INV,mycid,stinv_tnum_w,store_pa_w,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Update

  if (store_update_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stu_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STUP   tid=%d pa=%h                                   ts=%0d",
                           mycid,stu_tid_w,stu_tnum_w,store_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_ST_UPDATE,stu_tnum_w,store_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Fill

  if (load_fill_w) begin // {

    ldf_tnum_w = {mycid,ldf_tid_w};

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldf_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDFILL tid=%d pa=%h                                   ts=%0d",
                         mycid,ldf_tid_w,ldf_tnum_w,ldf_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_LD_FILL,ldf_tnum_w,ldf_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Issue

  if (store_w) begin // {

    if (sti_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sti_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h data=%h sz=%h typ=%0h ts=%0d",
                          mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_ST_ISSUE,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
      end // }

    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h  Suppress for IO ASI",mycid,sti_tid_w,sti_tnum_w,sti_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_STORE tid=%d pa=%h  data=%h sz=%h ts=%0d  (LSU - W stage)",
                     mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // EvictInv
  // Send 1-4 EvictInv messages per cycle - based on how many Dcache lines were invalidated.

  for (i=0; i<=3; i=i+1) begin // {
    if (evict_inv_w[i]) begin // {

      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d    PLI_MEM_EVINV                      cid=%d  srcid=%0d                    ts=%0d",
                                       mycid,mycid,evict_srcid_w,tstamp);
        junk = $sim_send(`PLI_MEM_EVICT_INV,mycid,evict_srcid_w,tstamp);
      end // }

    end // }
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Load Pop - special case

  // This is required in case of a performance monitor trap due to L2 miss.
  // In this case, the trap is not indicated until after the Load pkt returns to the LSU.
  // ldst_sync has already sent LDISSUE and LDDATA to Riesling.  But, the Load is not executed.
  // Load Pop tells Riesling to pop the LDISSUE,LDDATA off of its queues.

  if (perfmon & perfmon_mask[perfmon_tid]) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[perfmon_tnum]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDPOP  tid=%d                                                 ts=%0d",
                           mycid,perfmon_tid,perfmon_tnum,tstamp);
      junk = $sim_send(`PLI_MEM_LD_POP,perfmon_tnum);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Pop - special cases

  // This is required in case of a FRF error trap (internal_proc_error) on a Block Store.
  // In this case, the trap is not indicated until after the 8 STISSUE has been sent to Riesling.
  // But, the Store is not executed.
  // Store Pop tells Riesling to pop the 8 STISSUE off of its queues.

  if (bst_kill!==8'b0) begin // {

    for (i=0;i<=7;i=i+1) begin
      if (bst_kill[i]==1'b1) begin
        bst_kill_tid = i;
        bst_kill_tnum = {mycid,bst_kill_tid};

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[bst_kill_tnum]) begin // {
          `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
                               mycid,bst_kill_tid,bst_kill_tnum,tstamp);
          junk = $sim_send(`PLI_MEM_ST_POP,bst_kill_tnum);
        end // }
      end
    end

  end // }

  //--------------------
  // This is required for data_access_error on atomic.  In this case, Riesling only cleans up the Load,
  // but doesn't know it is an atomic so Riesling doesn't clean up the store in its buffers.
  // The STPOP tells Riesling to clear the newest Store from the buffers.
  // It is possible to have older Stores in-flight but not newer Stores in-flight.

//  if (st_data_access_w != 8'b0) begin // {
//
//    for (i=0; i<=7; i=i+1) begin // {
//      if (st_data_access_w[i]) begin // {
//        tmp_tid = i[2:0];
//        tmp_tnum = {mycid,tmp_tid};
//
//        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[tmp_tnum]) begin // {
//           `PR_INFO ("pli_ldst", `INFO, 
//               "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
//                               mycid,tmp_tid,tmp_tnum,tstamp);
//           junk = $sim_send(`PLI_MEM_ST_POP,tmp_tnum);
//        end // }
//      end // } if st_data_access[i]
//    end // } for
//  end // } if st_data_access

end // always }

//----------------------------------------------------------
// Need to model the D arrays to get PA's for store updates and invalidates

always @ (negedge `SPC5.l2clk) begin // {
  if (`SPC5.lsu.dta.wr_way[0])
    dta_way0[`SPC5.lsu.dta.index_y[6:0]] <= `SPC5.lsu.dta.wrtag_y[27:0];
  if (`SPC5.lsu.dta.wr_way[1])
    dta_way1[`SPC5.lsu.dta.index_y[6:0]] <= `SPC5.lsu.dta.wrtag_y[27:0];
  if (`SPC5.lsu.dta.wr_way[2])
    dta_way2[`SPC5.lsu.dta.index_y[6:0]] <= `SPC5.lsu.dta.wrtag_y[27:0];
  if (`SPC5.lsu.dta.wr_way[3])
    dta_way3[`SPC5.lsu.dta.index_y[6:0]] <= `SPC5.lsu.dta.wrtag_y[27:0];
end // always }

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_6

module ldst_lsu_c6 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "nas.vh"
// PCX/CPX packet defines (see :/verif/env/common/vera/include)
`include "ccx.vri"
`include "cmp.vri"

//---------------------
// Load Signals
wire                       load_w;

wire                       ldi_suppress;
wire                 [2:0] ldi_tid_w;
wire                 [5:0] ldi_tnum_w;
wire                [39:0] ldi_pa_b;
reg                 [39:0] ldi_pa_w;
wire                 [1:0] ldi_size_b;
reg                  [1:0] ldi_size_w;
wire                       ldi_bld_b;
wire                       ldi_qld_b;
wire                       ldi_ldbl_b;
wire                       ldi_ldd_b;
wire                       ldi_atomic_b;
wire                       ldi_pf_b;
reg                        ldi_pf_w;
reg                  [7:0] ldi_itype_w;
reg                  [7:0] dsrc;

wire                       ld_miss_b;
reg                        ld_miss_w;
reg                        stb_hit_w;
wire                       fraw_w;
wire                       hit_w;
wire                       miss_w;
wire                       load_data_hit;

wire                       load_fill_e;
reg                        load_fill_m;
reg                        load_fill_b;
reg                        load_fill_w;
wire                 [2:0] ldf_tid_e;
reg                  [2:0] ldf_tid_m;
reg                  [2:0] ldf_tid_b;
reg                  [2:0] ldf_tid_w;
reg                  [5:0] ldf_tnum_w;
wire                [39:0] ldf_pa_e;
reg                 [39:0] ldf_pa_m;
reg                 [39:0] ldf_pa_b;
reg                 [39:0] ldf_pa_w;

//---------------------
// Store Signals
wire                       unflushed_store_w;
wire                       store_w;
wire                       sti_suppress;
wire                 [2:0] sti_tid_b;
reg                  [2:0] sti_tid_w;
wire                 [5:0] sti_tnum_w;
wire                [39:0] sti_pa_b;
reg                 [39:0] sti_pa_w;
wire                [63:0] sti_data_w;
wire                 [7:0] sti_size_m;
reg                  [7:0] sti_size_b;
reg                  [7:0] sti_size_w;
wire                 [7:0] sti_itype_w;
reg                  [7:0] itype_w;
wire                [63:0] sbd_st_data_b;
reg                 [63:0] sbd_st_data_w;
wire                       flip_size_b;

wire                       atomic_b;
wire                       rmo_st_b;
wire                       blk_inst_b;
reg                        blk_inst_w;

wire                       bst_in_prog_b;
reg                        bst_in_prog_w;
wire                [39:0] bst_pa_b;
reg                 [39:0] bst_pa_w;
wire                 [2:0] bst_tid_b;
reg                  [2:0] bst_tid_w;
wire                [39:0] st_pa_b;
reg                 [39:0] st_pa_w;
wire                 [2:0] st_tid_b;
reg                  [2:0] st_tid_w;

wire                       store_inv_e;
reg                        store_inv_m;
reg                        store_inv_b;
reg                        store_inv_w;
wire                 [5:0] stinv_tnum_e;
reg                  [5:0] stinv_tnum_m;
reg                  [5:0] stinv_tnum_b;
reg                  [5:0] stinv_tnum_w;

wire                       store_update_e;
reg                        store_update_m;
reg                        store_update_b;
reg                        store_update_w;
wire                 [2:0] stu_tid_e;
reg                  [2:0] stu_tid_m;
reg                  [2:0] stu_tid_b;
reg                  [2:0] stu_tid_w;
wire                 [5:0] stu_tnum_e;
reg                  [5:0] stu_tnum_m;
reg                  [5:0] stu_tnum_b;
reg                  [5:0] stu_tnum_w;

wire                 [7:0] asi_st_dequeue;
wire                 [7:0] st_ack_no_asi_e;
reg                  [7:0] st_ack_no_asi_m;
reg                  [7:0] st_ack_no_asi_b;
wire                 [7:0] store_ack_b;
reg                  [7:0] store_ack_w;
wire                 [7:0] st_ack_rmo_b;
reg                  [7:0] st_ack_rmo_w;
reg                        sta_rmo;
reg                  [2:0] sta_tid;
reg                  [5:0] sta_tnum;
reg                        sta_suppress [0:7];  // 1 per thread
wire                       st_io_asi;
wire                 [2:0] st_io_tid;
wire                 [7:0] st_data_access_e;
reg                  [7:0] st_data_access_m;
reg                  [7:0] st_data_access_b;
reg                  [7:0] st_data_access_w;
reg                  [2:0] tmp_tid;
reg                  [5:0] tmp_tnum;

reg                 [39:0] store_pa_m;
reg                 [39:0] store_pa_b;
reg                 [39:0] store_pa_w;

wire                 [1:0] l1_way_select;
wire                 [6:0] l1_index;
wire                [27:0] my_way;
wire                [27:0] way0;
wire                [27:0] way1;
wire                [27:0] way2;
wire                [27:0] way3;

wire                 [3:0] evict_inv_e;
reg                  [3:0] evict_inv_m;
reg                  [3:0] evict_inv_b;
reg                  [3:0] evict_inv_w;
wire                 [2:0] evict_srcid_e;
reg                  [2:0] evict_srcid_m;
reg                  [2:0] evict_srcid_b;
reg                  [2:0] evict_srcid_w;

wire                 [8:0] pcx_req;
reg                  [8:0] pcx_req_1;
wire               [129:0] pcx_data;

wire                       perfmon;
wire                       perfmon_g;
reg                        perfmon_m;
reg                        perfmon_b;
reg                        perfmon_w;
wire                 [2:0] perfmon_tid;
wire                 [2:0] perfmon_tid_g;
reg                  [2:0] perfmon_tid_m;
reg                  [2:0] perfmon_tid_b;
reg                  [2:0] perfmon_tid_w;
wire                 [5:0] perfmon_tnum;
wire                 [7:0] perfmon_mask;
wire                 [7:0] perfmon_mask_g;
reg                  [7:0] perfmon_mask_m;
reg                  [7:0] perfmon_mask_b;
reg                  [7:0] perfmon_mask_w;

wire                 [7:0] bst_kill;
reg                  [2:0] bst_kill_tid;
reg                  [5:0] bst_kill_tnum;

wire                 [7:0] stb_state0_m;
wire                 [7:0] stb_state1_m;
wire                 [7:0] stb_state2_m;
wire                 [7:0] stb_state3_m;
wire                 [7:0] stb_state4_m;
wire                 [7:0] stb_state5_m;
wire                 [7:0] stb_state6_m;
wire                 [7:0] stb_state7_m;
reg                  [7:0] stb_state0_b;
reg                  [7:0] stb_state1_b;
reg                  [7:0] stb_state2_b;
reg                  [7:0] stb_state3_b;
reg                  [7:0] stb_state4_b;
reg                  [7:0] stb_state5_b;
reg                  [7:0] stb_state6_b;
reg                  [7:0] stb_state7_b;
reg                  [7:0] stb_state0_w;
reg                  [7:0] stb_state1_w;
reg                  [7:0] stb_state2_w;
reg                  [7:0] stb_state3_w;
reg                  [7:0] stb_state4_w;
reg                  [7:0] stb_state5_w;
reg                  [7:0] stb_state6_w;
reg                  [7:0] stb_state7_w;
reg                  [7:0] stb_state;
reg                        stb_last;

// Copy of dtag
reg [27:0] dta_way0 [127:0];
reg [27:0] dta_way1 [127:0];
reg [27:0] dta_way2 [127:0];
reg [27:0] dta_way3 [127:0];

//---------------------
// Misc Signals
wire                 [2:0] mycid;
integer                    tstamp;
integer                    junk;
integer                    i;

initial begin // {
  ldf_tnum_w = 6'b0;
  dsrc = 2'b0;
  sta_tid    = 3'b0;
  sta_tnum   = 6'b0;
  for (i=0; i<=7; i=i+1) begin
    sta_suppress[i] = 1'b0;
  end

end // }

// for debug only - allows display in Debussy
wire    sta_suppress0;
wire    sta_suppress1;
wire    sta_suppress2;
wire    sta_suppress3;
wire    sta_suppress4;
wire    sta_suppress5;
wire    sta_suppress6;
wire    sta_suppress7;

  assign   sta_suppress0 = sta_suppress[0];
  assign   sta_suppress1 = sta_suppress[1];
  assign   sta_suppress2 = sta_suppress[2];
  assign   sta_suppress3 = sta_suppress[3];
  assign   sta_suppress4 = sta_suppress[4];
  assign   sta_suppress5 = sta_suppress[5];
  assign   sta_suppress6 = sta_suppress[6];
  assign   sta_suppress7 = sta_suppress[7];

//----------------------------------------------------------
//----------------------------------------------------------
// DUT probes

  assign   mycid = 6;

//---------------------
// Load Issue

  // If Load to IO ASIs, load issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress load_w.

  assign load_w      = `SPC6.lsu.dcc.ld_inst_vld_w & 
                        ~`PROBES6.asi_internal_w &
                        ~`SPC6.lsu.dcc.flush_w &
                        ~ldi_pf_w;

  // ldxa to IO ASI are already suppressed since load_w will not assert.
  // ldi_suppress is required to also suppress normal ld to IO ASI address range.
  assign ldi_suppress = (ldi_pa_w[39:32] == `IO_ASI_ADDR);

  assign ldi_tid_w    = `SPC6.lsu.dcc.tid_w;
  assign ldi_tnum_w   = {mycid,ldi_tid_w};
  assign ldi_size_b   = `SPC6.lsu.dcc.ldst_sz_b;  // 2 bits
  assign ldi_atomic_b = `SPC6.lsu.dcc.atomic_b;
  assign ldi_qld_b    = `SPC6.lsu.dcc.quad_ldd_b;
  assign ldi_ldbl_b   = `SPC6.lsu.dcc_ldbl_b;
  assign ldi_ldd_b    = ldi_ldbl_b & !ldi_qld_b;
  assign ldi_bld_b    = `SPC6.lsu.dcc.dcc_blk_inst_b;
  assign ldi_pf_b     = `SPC6.lsu.dcc.pref_inst_b;

  // pa, tid are same for LoadIssue and StoreIssue
  assign ldi_pa_b = {`SPC6.lsu.tlb_pgnum[39:13],
                    `SPC6.lsu.lmd.lsu_va_b[12:0]};

//---------------------
// Load Fill

  assign load_fill_e = `SPC6.lsu.dcc.ld_fill_e;
  assign ldf_tid_e   = `SPC6.lsu.cid.cid_tid;
  assign ldf_pa_e    = {`SPC6.lsu.lmd.lmd_fill_addr_e[39:3],3'b0};

//---------------------
// Store Issue

  // blk_inst_w will suppress store_w for 1st of 9 cycles on block store.

  // If Store to IO ASIs, store issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress store_w.

  assign unflushed_store_w = `SPC6.lsu.sbc.unflushed_store_w;

  assign store_w      =   unflushed_store_w &
                          (~(`PROBES6.asi_internal_w | blk_inst_w) |
                            bst_in_prog_w);

  assign atomic_b      = `SPC6.lsu.dcc.atomic_b;
  assign rmo_st_b      = `SPC6.lsu.sbc_rmo_st_b;
  assign blk_inst_b    = `SPC6.lsu.dcc.dcc_blk_inst_b;

  assign sti_tnum_w   = {mycid,sti_tid_w};
  assign sti_size_m   = `SPC6.lsu.dcc_ldst_bmask;

  // flip_size will assert if endian swap for partial store is needed
  assign flip_size_b  = `SPC6.lsu.dcc.pst_asi_b & `SPC6.lsu.dcc.tlb_tte_ie_b & `SPC6.lsu.dcc.tlb_tte_vld_b & `SPC6.lsu.dcc.st_inst_vld_b;

  // Change itype only when control signals are valid
  assign sti_itype_w  = unflushed_store_w ? itype_w : sti_itype_w;

  // It is correct to mix W & B stage signals for this.
  // STD is a 2 cycle instruction.
  // inst valid in W, data in B (1 cycle behind)
  assign sti_data_w    = `SPC6.lsu.sbc.std_inst_w ?
                          sbd_st_data_b :
                          sbd_st_data_w;
  assign sbd_st_data_b = `SPC6.lsu.sbd_st_data_b;

  // Use different pa,tid if block store
  assign sti_pa_b     = bst_in_prog_b ? bst_pa_b  : st_pa_b;
  assign sti_tid_b    = bst_in_prog_b ? bst_tid_b : st_tid_b;

  // stxa to IO ASI are already suppressed since store_w will not assert.
  // sti_suppress is required to also suppress normal st to IO ASI address range.
  assign sti_suppress = (sti_pa_w[39:32] == `IO_ASI_ADDR);

  // Normal Store
  assign st_pa_b      = {`SPC6.lsu.tlb_pgnum[39:13],
                         `SPC6.lsu.lmd.lsu_va_b[12:0]};
  assign st_tid_b     = `SPC6.lsu.dcc.tid_b;

  // Block Store
  assign bst_in_prog_b = `SPC6.lsu.sbc.bst_in_prog_b;
  assign bst_pa_b      = {`SPC6.lsu.sbd.st_addr_b[39:3],3'b0};
  assign bst_tid_b     = `SPC6.lsu.sbc.bst_tid;

//---------------------
// Store Ack

assign asi_st_dequeue[7:0] = `SPC6.lsu.dcc_asi_rtn_vld[7:0] &
                             {8{~`SPC6.lsu.dcc_asi_rtn_rd}};

  assign st_ack_no_asi_e = `SPC6.lsu.cic.cic_st_dequeue[7:0] & 
                           ~asi_st_dequeue[7:0] & 
                           ~`SPC6.lsu.cic.sbc_bst_sel[7:0];

  assign st_ack_rmo_b  = {`SPC6.lsu.sbs7.rmo_st_commit_p4,
                          `SPC6.lsu.sbs6.rmo_st_commit_p4,
                          `SPC6.lsu.sbs5.rmo_st_commit_p4,
                          `SPC6.lsu.sbs4.rmo_st_commit_p4,
                          `SPC6.lsu.sbs3.rmo_st_commit_p4,
                          `SPC6.lsu.sbs2.rmo_st_commit_p4,
                          `SPC6.lsu.sbs1.rmo_st_commit_p4,
                          `SPC6.lsu.sbs0.rmo_st_commit_p4
                         };

  // It is possible to see 2 threads store_ack in same cycle
  // (1 st_ack_no_asi & 1 st_ack_rmo)

  assign store_ack_b   = st_ack_no_asi_b | st_ack_rmo_b;

  // cic_st_atm_cmplt is atomic store completing (same time as store ack)
  // (lsu.lmc.dcl2u_err | dcl2nd_err) indicate a data_access_error condition
  assign st_data_access_e = {8{(`SPC6.lsu.cic.cic_st_atm_cmplt & 
                             (`SPC6.lsu.lmc.dcl2u_err | `SPC6.lsu.lmc.dcl2nd_err))}} &
                            `SPC6.lsu.cic.cic_st_dequeue[7:0];
//---------------------
// Store Inv

  // Same as evict_inv_e but with cpq_evict deasserted
  assign store_inv_e  =  `SPC6.lsu.cic_invalidate_e &
                         (`SPC6.lsu.cic_inv_wen_e!=0)&
                        ~`SPC6.lsu.cic.cpq_evict & 
                        ~`SPC6.lsu.cic.cid_set_inval & 
                        ~`SPC6.lsu.cic.cic_xinval_e &
			~(`SPC6.lsu.cic.cid_pkt_type[4:0] == 5'b10110);
  assign stinv_tnum_e = 
         {`SPC6.lsu.cid.cpq_data_out[`CPX_VACK_CID],
          `SPC6.lsu.cid.cid_tid};

//---------------------
// Store Update

  assign store_update_e = `SPC6.lsu.cic_st_update_e;
  assign stu_tid_e      = `SPC6.lsu.cid.cid_tid;
  assign stu_tnum_e     = {mycid,stu_tid_e};

  assign l1_index = {`SPC6.lsu.cid.cpq_data_out[116],
                     `SPC6.lsu.cid.cpq_data_out[115],
                     `SPC6.lsu.cid.cpq_data_out[114],
                     `SPC6.lsu.cid.cpq_data_out[113],
                     `SPC6.lsu.cid.cpq_data_out[112],
                     `SPC6.lsu.cid.cpq_data_out[122],
                     `SPC6.lsu.cid.cpq_data_out[121]
                    };
  assign l1_way_select = `SPC6.lsu.cid_inv_vec[17:16];

//---------------------
// EvictInv

  // Same as store_inv_e but with cpq_evict asserted
  // LSU can invalidate 1-4 Dcache lines
  assign evict_inv_e[3:0]  =  {4{`SPC6.lsu.cic_invalidate_e &          // enable for 4 bit wen below
                                (`SPC6.lsu.cic_inv_wen_e!=0)&
                               `SPC6.lsu.cic.cpq_evict &
                               ~`SPC6.lsu.cic.cid_set_inval &
                               ~`SPC6.lsu.cic.cic_xinval_e}} &

                              {|(`SPC6.lsu.cic.evict_inv_wen[15:12]),   // 4 bit field - 1 hot.  Send evinv when any one set.
                               |(`SPC6.lsu.cic.evict_inv_wen[11:8]),
                               |(`SPC6.lsu.cic.evict_inv_wen[7:4]),
                               |(`SPC6.lsu.cic.evict_inv_wen[3:0])
                              };

  assign evict_srcid_e  = `SPC6.lsu.cid.cpq_data_out[114:112];


//---------------------
// Detect Store to IO ASI in PCX crossbar packet.
// This causes next Store Ack to be suppressed.

// Normal Store only since atomics are always to cacheable space

// Trigger on Store to crossbar.
// If Store request is retried on crossbar (due to no grant),
// then, st_io_asi will fire multiple times for the same request.
// This is OK because it just causes sta_suppress to be set multiple times.

  assign pcx_req    = `SPC6.spc_pcx_req_pq;
  assign pcx_data   = `SPC6.spc_pcx_data_pa;

  assign st_io_asi  = (pcx_req_1 != 9'b0) & 
                      (pcx_data [`PCX_VALID]==1'b1) & 
                      (pcx_data [`PCX_RQTYP]==`CCX_REQ_ST) & 
                      (pcx_data [103:96]==`IO_ASI_ADDR);  // Upper byte of 40 bit addr

  assign st_io_tid  = pcx_data [`PCX_TID];

  assign stb_state0_m = `SPC6.lsu.sbs0.stb_state_vld[7:0];
  assign stb_state1_m = `SPC6.lsu.sbs1.stb_state_vld[7:0];
  assign stb_state2_m = `SPC6.lsu.sbs2.stb_state_vld[7:0];
  assign stb_state3_m = `SPC6.lsu.sbs3.stb_state_vld[7:0];
  assign stb_state4_m = `SPC6.lsu.sbs4.stb_state_vld[7:0];
  assign stb_state5_m = `SPC6.lsu.sbs5.stb_state_vld[7:0];
  assign stb_state6_m = `SPC6.lsu.sbs6.stb_state_vld[7:0];
  assign stb_state7_m = `SPC6.lsu.sbs7.stb_state_vld[7:0];

//---------------------
// Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  assign load_data_hit = load_w && (hit_w | fraw_w);
  assign ld_miss_b = `SPC6.lsu.dcc.dcc_ld_miss_b;
  assign fraw_w    = `SPC6.lsu.lmc.ld_raw_bypass_w;
  assign hit_w     = ~ld_miss_w & ~stb_hit_w;
  assign miss_w    = ~fraw_w & (ld_miss_w | stb_hit_w);

//---------------------
// Load Pop

  assign perfmon_g      = `SPC6.lsu.lsu_perfmon_trap_g;
  assign perfmon_tid_g  = `SPC6.lsu.lsu_dcerr_tid_g;
  // perfmon_mask will not fire if trap is not enabled or higher priority trap is taken.
  assign perfmon_mask_g = {`SPC6.tlu.fls1.pil_mask_15[3:0], `SPC6.tlu.fls0.pil_mask_15[3:0]} &
                           ~{8 {`SPC6.lsu_dcl2u_err_g | `SPC6.lsu_dcl2nd_err_g}};

  assign perfmon      = perfmon_w;
  assign perfmon_tid  = perfmon_tid_w;
  assign perfmon_tnum = {mycid,perfmon_tid_w};
  assign perfmon_mask = perfmon_mask_w;



//---------------------
// Store Pop

  assign bst_kill      = {`SPC6.lsu.sbs7.bst_kill,
                          `SPC6.lsu.sbs6.bst_kill,
                          `SPC6.lsu.sbs5.bst_kill,
                          `SPC6.lsu.sbs4.bst_kill,
                          `SPC6.lsu.sbs3.bst_kill,
                          `SPC6.lsu.sbs2.bst_kill,
                          `SPC6.lsu.sbs1.bst_kill,
                          `SPC6.lsu.sbs0.bst_kill};
  
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC6.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline from B to W

  ldi_pa_w    <= ldi_pa_b;
  ld_miss_w   <= ld_miss_b;
  stb_hit_w   <= `SPC6.lsu.stb_cam_hit;
  ldi_pf_w    <= ldi_pf_b;
  ldi_size_w  <= ldi_size_b;
  load_fill_m <= load_fill_e;
  load_fill_b <= load_fill_m;
  load_fill_w <= load_fill_b;
  ldf_tid_m   <= ldf_tid_e;
  ldf_tid_b   <= ldf_tid_m;
  ldf_tid_w   <= ldf_tid_b;
  ldf_pa_m    <= ldf_pa_e;
  ldf_pa_b    <= ldf_pa_m;
  ldf_pa_w    <= ldf_pa_b;

  sti_size_b     <= sti_size_m;
  sti_size_w     <= (flip_size_b) ? {sti_size_b[0],sti_size_b[1],sti_size_b[2],sti_size_b[3],
                                     sti_size_b[4],sti_size_b[5],sti_size_b[6],sti_size_b[7]} 
                                  : sti_size_b;
  sti_pa_w       <= sti_pa_b;
  sti_tid_w      <= sti_tid_b;
  st_ack_no_asi_m  <= st_ack_no_asi_e;
  st_ack_no_asi_b  <= st_ack_no_asi_m;
  st_data_access_m <= st_data_access_e;
  st_data_access_b <= st_data_access_m;
  st_data_access_w <= st_data_access_b;
  store_ack_w    <= store_ack_b;
  store_update_m <= store_update_e;
  store_update_b <= store_update_m;
  store_update_w <= store_update_b;
  store_inv_m    <= store_inv_e;
  store_inv_b    <= store_inv_m;
  store_inv_w    <= store_inv_b;
  stinv_tnum_m   <= stinv_tnum_e;
  stinv_tnum_b   <= stinv_tnum_m;
  stinv_tnum_w   <= stinv_tnum_b;
  st_ack_rmo_w   <= st_ack_rmo_b;
  stu_tid_m      <= stu_tid_e;
  stu_tid_b      <= stu_tid_m;
  stu_tid_w      <= stu_tid_b;
  stu_tnum_m     <= stu_tnum_e;
  stu_tnum_b     <= stu_tnum_m;
  stu_tnum_w     <= stu_tnum_b;
  store_pa_b     <= store_pa_m;
  store_pa_w     <= store_pa_b;
  bst_in_prog_w  <= bst_in_prog_b;
  blk_inst_w     <= blk_inst_b;
  sbd_st_data_w  <=  sbd_st_data_b;
  evict_inv_m    <= evict_inv_e;
  evict_inv_b    <= evict_inv_m;
  evict_inv_w    <= evict_inv_b;
  evict_srcid_m  <= evict_srcid_e;
  evict_srcid_b  <= evict_srcid_m;
  evict_srcid_w  <= evict_srcid_b;
  pcx_req_1      <= pcx_req;
  stb_state0_b   <= stb_state0_m;
  stb_state1_b   <= stb_state1_m;
  stb_state2_b   <= stb_state2_m;
  stb_state3_b   <= stb_state3_m;
  stb_state4_b   <= stb_state4_m;
  stb_state5_b   <= stb_state5_m;
  stb_state6_b   <= stb_state6_m;
  stb_state7_b   <= stb_state7_m;
  stb_state0_w   <= stb_state0_b;
  stb_state1_w   <= stb_state1_b;
  stb_state2_w   <= stb_state2_b;
  stb_state3_w   <= stb_state3_b;
  stb_state4_w   <= stb_state4_b;
  stb_state5_w   <= stb_state5_b;
  stb_state6_w   <= stb_state6_b;
  stb_state7_w   <= stb_state7_b;

  perfmon_m      <= perfmon_g;
  perfmon_b      <= perfmon_m;
  perfmon_w      <= perfmon_b;
  perfmon_tid_m  <= perfmon_tid_g;
  perfmon_tid_b  <= perfmon_tid_m;
  perfmon_tid_w  <= perfmon_tid_b;
  perfmon_mask_m <= perfmon_mask_g;
  perfmon_mask_b <= perfmon_mask_m;
  perfmon_mask_w <= perfmon_mask_b;

  //----------------------------------------------------------
  // Calculate pa for STUPDATE and STINV
  // Moved this into the always block to avoid the constant
  // probing of the dtag memory structure.

  if (store_inv_e | store_update_e) begin // {
    store_pa_m[2:0]    <= 3'b000;
    store_pa_m[10:3]   <= {`SPC6.lsu.cid.cpq_data_out[116],
                           `SPC6.lsu.cid.cpq_data_out[115],
                           `SPC6.lsu.cid.cpq_data_out[114],
                           `SPC6.lsu.cid.cpq_data_out[113],
                           `SPC6.lsu.cid.cpq_data_out[112],
                           `SPC6.lsu.cid.cpq_data_out[122],
                           `SPC6.lsu.cid.cpq_data_out[121],
                           `SPC6.lsu.cid.cpq_data_out[104]
                          };
    store_pa_m[38:11] <= (l1_way_select==2'h0) ? dta_way0[l1_index] :
                         (l1_way_select==2'h1) ? dta_way1[l1_index] :
                         (l1_way_select==2'h2) ? dta_way2[l1_index] : dta_way3[l1_index];
    store_pa_m[39]    <= 1'b0;		// Only memory stores get inv/update
  end // }


  // After Store to IO ASI is detected at StI time, suppress the next Store Ack
  // There is only 1 store to IO ASI active at one time per thread because
  //   that is all the LSU allows.
  if (st_io_asi) begin
    sta_suppress [st_io_tid] <= 1'b1;
  end 

  case ({ldi_atomic_b,ldi_bld_b,ldi_ldd_b,ldi_qld_b,ldi_pf_b})
    5'b00000: ldi_itype_w <= `ITYPE_LOAD;
    5'b00001: ldi_itype_w <= `ITYPE_PREFETCH;
    5'b00010: ldi_itype_w <= `ITYPE_QUAD_LOAD;
    5'b00100: ldi_itype_w <= `ITYPE_DOUBLE_LOAD;
    5'b01000: ldi_itype_w <= `ITYPE_BLOCK_LOAD;
    5'b10000: ldi_itype_w <= `ITYPE_ATOMIC;
    default: ldi_itype_w <= `ITYPE_NO; // Illegal
  endcase

  case ({atomic_b,rmo_st_b,bst_in_prog_b})
    3'b000: itype_w <= `ITYPE_STORE;
    3'b010: itype_w <= `ITYPE_BLK_INIT_ST;
    3'b011: itype_w <= `ITYPE_BLOCK_STORE;
    3'b100: itype_w <= `ITYPE_ATOMIC;
    3'b001,
    3'b101,
    3'b110,
    3'b111: itype_w <= `ITYPE_NO; // Illegal
  endcase

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Issue

  //  Load Issue must be before Store Issue for atomic

  if (load_w) begin // {

    if (ldi_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h size=%h  typ=%0h                     ts=%0d",
                            mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_LD_ISSUE,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
      end // }
    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h  Suppress for IO ASI",mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_LOAD  tid=%d pa=%h  ts=%0d  (LSU - W stage)",
                     mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  if (load_data_hit) begin // {

    dsrc = hit_w ? `DSRC_L1 : `DSRC_STB;

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
                         mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
      junk = $sim_send(`PLI_MEM_LD_DATA,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Ack
  //
  // Store Ack cmd must be sent before Store Inv, Store Update for NAS
  // Store Ack & Store Update will be in the same timestamp

  if (store_ack_w != 8'b0) begin // {

    for (i=0; i<=7; i=i+1) begin // {
      if (store_ack_w[i]) begin // {
        sta_tid = i[2:0];
        sta_tnum = {mycid,sta_tid};
        sta_rmo = st_ack_rmo_w[i];

        if (sta_suppress[sta_tid]==1'b0)  begin // {
          if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
            junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
          end // }
        end // }

        else begin // {

          // It is possible for 2 Stores it be in flight because of the delay from CPQ push & pop.
          // So, make sure Bench is suppressing the correct Store.
          case (sta_tid)
            3'h0: stb_state=stb_state0_w;
            3'h1: stb_state=stb_state1_w;
            3'h2: stb_state=stb_state2_w;
            3'h3: stb_state=stb_state3_w;
            3'h4: stb_state=stb_state4_w;
            3'h5: stb_state=stb_state5_w;
            3'h6: stb_state=stb_state6_w;
            3'h7: stb_state=stb_state7_w;
            default: 
              `PR_ERROR ("pli_ldst", `ERROR, 
              "C%0d T%0d PLI_MEM_XXX Bench Error.  Should never execute case default",mycid,sta_tid);
          endcase

          // If stb_state has only 1 bit asserted, then suppress the STACK.  Otherwise, send the STACK.
          case (stb_state) // {
            8'b0000_0000: begin
                `PR_ERROR ("pli_ldst", `ERROR, 
                "C%0d T%0d PLI_MEM_XXX Bench Error.  stb_state should not be 8'b0",
                 mycid,sta_tid);
              end
            8'b0000_0001,
            8'b0000_0010,
            8'b0000_0100,
            8'b0000_1000,
            8'b0001_0000,
            8'b0010_0000,
            8'b0100_0000,
            8'b1000_0000: stb_last = 1'b1;
            default:      stb_last = 1'b0;
          endcase // }

          if (stb_last==1'b0) begin // {
            if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
              `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                  mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
              junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
            end // }
          end // }
          else begin // {
            sta_suppress[sta_tid] <= 1'b0;
            `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d                Suppress for IO ASI",mycid,sta_tid,sta_tnum);
          end // }
        end // }

      end //  if (store_ack_w[i]) }
    end // for }

  end // if (store_ack_w) }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Inv

  if (store_inv_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stinv_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d    PLI_MEM_STINV  tid=%d pa=%h cid=%h                             ts=%0d",
                                  mycid,stinv_tnum_w,store_pa_w,mycid,tstamp);
      junk = $sim_send(`PLI_MEM_ST_INV,mycid,stinv_tnum_w,store_pa_w,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Update

  if (store_update_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stu_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STUP   tid=%d pa=%h                                   ts=%0d",
                           mycid,stu_tid_w,stu_tnum_w,store_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_ST_UPDATE,stu_tnum_w,store_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Fill

  if (load_fill_w) begin // {

    ldf_tnum_w = {mycid,ldf_tid_w};

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldf_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDFILL tid=%d pa=%h                                   ts=%0d",
                         mycid,ldf_tid_w,ldf_tnum_w,ldf_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_LD_FILL,ldf_tnum_w,ldf_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Issue

  if (store_w) begin // {

    if (sti_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sti_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h data=%h sz=%h typ=%0h ts=%0d",
                          mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_ST_ISSUE,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
      end // }

    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h  Suppress for IO ASI",mycid,sti_tid_w,sti_tnum_w,sti_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_STORE tid=%d pa=%h  data=%h sz=%h ts=%0d  (LSU - W stage)",
                     mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // EvictInv
  // Send 1-4 EvictInv messages per cycle - based on how many Dcache lines were invalidated.

  for (i=0; i<=3; i=i+1) begin // {
    if (evict_inv_w[i]) begin // {

      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d    PLI_MEM_EVINV                      cid=%d  srcid=%0d                    ts=%0d",
                                       mycid,mycid,evict_srcid_w,tstamp);
        junk = $sim_send(`PLI_MEM_EVICT_INV,mycid,evict_srcid_w,tstamp);
      end // }

    end // }
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Load Pop - special case

  // This is required in case of a performance monitor trap due to L2 miss.
  // In this case, the trap is not indicated until after the Load pkt returns to the LSU.
  // ldst_sync has already sent LDISSUE and LDDATA to Riesling.  But, the Load is not executed.
  // Load Pop tells Riesling to pop the LDISSUE,LDDATA off of its queues.

  if (perfmon & perfmon_mask[perfmon_tid]) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[perfmon_tnum]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDPOP  tid=%d                                                 ts=%0d",
                           mycid,perfmon_tid,perfmon_tnum,tstamp);
      junk = $sim_send(`PLI_MEM_LD_POP,perfmon_tnum);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Pop - special cases

  // This is required in case of a FRF error trap (internal_proc_error) on a Block Store.
  // In this case, the trap is not indicated until after the 8 STISSUE has been sent to Riesling.
  // But, the Store is not executed.
  // Store Pop tells Riesling to pop the 8 STISSUE off of its queues.

  if (bst_kill!==8'b0) begin // {

    for (i=0;i<=7;i=i+1) begin
      if (bst_kill[i]==1'b1) begin
        bst_kill_tid = i;
        bst_kill_tnum = {mycid,bst_kill_tid};

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[bst_kill_tnum]) begin // {
          `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
                               mycid,bst_kill_tid,bst_kill_tnum,tstamp);
          junk = $sim_send(`PLI_MEM_ST_POP,bst_kill_tnum);
        end // }
      end
    end

  end // }

  //--------------------
  // This is required for data_access_error on atomic.  In this case, Riesling only cleans up the Load,
  // but doesn't know it is an atomic so Riesling doesn't clean up the store in its buffers.
  // The STPOP tells Riesling to clear the newest Store from the buffers.
  // It is possible to have older Stores in-flight but not newer Stores in-flight.

//  if (st_data_access_w != 8'b0) begin // {
//
//    for (i=0; i<=7; i=i+1) begin // {
//      if (st_data_access_w[i]) begin // {
//        tmp_tid = i[2:0];
//        tmp_tnum = {mycid,tmp_tid};
//
//        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[tmp_tnum]) begin // {
//           `PR_INFO ("pli_ldst", `INFO, 
//               "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
//                               mycid,tmp_tid,tmp_tnum,tstamp);
//           junk = $sim_send(`PLI_MEM_ST_POP,tmp_tnum);
//        end // }
//      end // } if st_data_access[i]
//    end // } for
//  end // } if st_data_access

end // always }

//----------------------------------------------------------
// Need to model the D arrays to get PA's for store updates and invalidates

always @ (negedge `SPC6.l2clk) begin // {
  if (`SPC6.lsu.dta.wr_way[0])
    dta_way0[`SPC6.lsu.dta.index_y[6:0]] <= `SPC6.lsu.dta.wrtag_y[27:0];
  if (`SPC6.lsu.dta.wr_way[1])
    dta_way1[`SPC6.lsu.dta.index_y[6:0]] <= `SPC6.lsu.dta.wrtag_y[27:0];
  if (`SPC6.lsu.dta.wr_way[2])
    dta_way2[`SPC6.lsu.dta.index_y[6:0]] <= `SPC6.lsu.dta.wrtag_y[27:0];
  if (`SPC6.lsu.dta.wr_way[3])
    dta_way3[`SPC6.lsu.dta.index_y[6:0]] <= `SPC6.lsu.dta.wrtag_y[27:0];
end // always }

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_7

module ldst_lsu_c7 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "nas.vh"
// PCX/CPX packet defines (see :/verif/env/common/vera/include)
`include "ccx.vri"
`include "cmp.vri"

//---------------------
// Load Signals
wire                       load_w;

wire                       ldi_suppress;
wire                 [2:0] ldi_tid_w;
wire                 [5:0] ldi_tnum_w;
wire                [39:0] ldi_pa_b;
reg                 [39:0] ldi_pa_w;
wire                 [1:0] ldi_size_b;
reg                  [1:0] ldi_size_w;
wire                       ldi_bld_b;
wire                       ldi_qld_b;
wire                       ldi_ldbl_b;
wire                       ldi_ldd_b;
wire                       ldi_atomic_b;
wire                       ldi_pf_b;
reg                        ldi_pf_w;
reg                  [7:0] ldi_itype_w;
reg                  [7:0] dsrc;

wire                       ld_miss_b;
reg                        ld_miss_w;
reg                        stb_hit_w;
wire                       fraw_w;
wire                       hit_w;
wire                       miss_w;
wire                       load_data_hit;

wire                       load_fill_e;
reg                        load_fill_m;
reg                        load_fill_b;
reg                        load_fill_w;
wire                 [2:0] ldf_tid_e;
reg                  [2:0] ldf_tid_m;
reg                  [2:0] ldf_tid_b;
reg                  [2:0] ldf_tid_w;
reg                  [5:0] ldf_tnum_w;
wire                [39:0] ldf_pa_e;
reg                 [39:0] ldf_pa_m;
reg                 [39:0] ldf_pa_b;
reg                 [39:0] ldf_pa_w;

//---------------------
// Store Signals
wire                       unflushed_store_w;
wire                       store_w;
wire                       sti_suppress;
wire                 [2:0] sti_tid_b;
reg                  [2:0] sti_tid_w;
wire                 [5:0] sti_tnum_w;
wire                [39:0] sti_pa_b;
reg                 [39:0] sti_pa_w;
wire                [63:0] sti_data_w;
wire                 [7:0] sti_size_m;
reg                  [7:0] sti_size_b;
reg                  [7:0] sti_size_w;
wire                 [7:0] sti_itype_w;
reg                  [7:0] itype_w;
wire                [63:0] sbd_st_data_b;
reg                 [63:0] sbd_st_data_w;
wire                       flip_size_b;

wire                       atomic_b;
wire                       rmo_st_b;
wire                       blk_inst_b;
reg                        blk_inst_w;

wire                       bst_in_prog_b;
reg                        bst_in_prog_w;
wire                [39:0] bst_pa_b;
reg                 [39:0] bst_pa_w;
wire                 [2:0] bst_tid_b;
reg                  [2:0] bst_tid_w;
wire                [39:0] st_pa_b;
reg                 [39:0] st_pa_w;
wire                 [2:0] st_tid_b;
reg                  [2:0] st_tid_w;

wire                       store_inv_e;
reg                        store_inv_m;
reg                        store_inv_b;
reg                        store_inv_w;
wire                 [5:0] stinv_tnum_e;
reg                  [5:0] stinv_tnum_m;
reg                  [5:0] stinv_tnum_b;
reg                  [5:0] stinv_tnum_w;

wire                       store_update_e;
reg                        store_update_m;
reg                        store_update_b;
reg                        store_update_w;
wire                 [2:0] stu_tid_e;
reg                  [2:0] stu_tid_m;
reg                  [2:0] stu_tid_b;
reg                  [2:0] stu_tid_w;
wire                 [5:0] stu_tnum_e;
reg                  [5:0] stu_tnum_m;
reg                  [5:0] stu_tnum_b;
reg                  [5:0] stu_tnum_w;

wire                 [7:0] asi_st_dequeue;
wire                 [7:0] st_ack_no_asi_e;
reg                  [7:0] st_ack_no_asi_m;
reg                  [7:0] st_ack_no_asi_b;
wire                 [7:0] store_ack_b;
reg                  [7:0] store_ack_w;
wire                 [7:0] st_ack_rmo_b;
reg                  [7:0] st_ack_rmo_w;
reg                        sta_rmo;
reg                  [2:0] sta_tid;
reg                  [5:0] sta_tnum;
reg                        sta_suppress [0:7];  // 1 per thread
wire                       st_io_asi;
wire                 [2:0] st_io_tid;
wire                 [7:0] st_data_access_e;
reg                  [7:0] st_data_access_m;
reg                  [7:0] st_data_access_b;
reg                  [7:0] st_data_access_w;
reg                  [2:0] tmp_tid;
reg                  [5:0] tmp_tnum;

reg                 [39:0] store_pa_m;
reg                 [39:0] store_pa_b;
reg                 [39:0] store_pa_w;

wire                 [1:0] l1_way_select;
wire                 [6:0] l1_index;
wire                [27:0] my_way;
wire                [27:0] way0;
wire                [27:0] way1;
wire                [27:0] way2;
wire                [27:0] way3;

wire                 [3:0] evict_inv_e;
reg                  [3:0] evict_inv_m;
reg                  [3:0] evict_inv_b;
reg                  [3:0] evict_inv_w;
wire                 [2:0] evict_srcid_e;
reg                  [2:0] evict_srcid_m;
reg                  [2:0] evict_srcid_b;
reg                  [2:0] evict_srcid_w;

wire                 [8:0] pcx_req;
reg                  [8:0] pcx_req_1;
wire               [129:0] pcx_data;

wire                       perfmon;
wire                       perfmon_g;
reg                        perfmon_m;
reg                        perfmon_b;
reg                        perfmon_w;
wire                 [2:0] perfmon_tid;
wire                 [2:0] perfmon_tid_g;
reg                  [2:0] perfmon_tid_m;
reg                  [2:0] perfmon_tid_b;
reg                  [2:0] perfmon_tid_w;
wire                 [5:0] perfmon_tnum;
wire                 [7:0] perfmon_mask;
wire                 [7:0] perfmon_mask_g;
reg                  [7:0] perfmon_mask_m;
reg                  [7:0] perfmon_mask_b;
reg                  [7:0] perfmon_mask_w;

wire                 [7:0] bst_kill;
reg                  [2:0] bst_kill_tid;
reg                  [5:0] bst_kill_tnum;

wire                 [7:0] stb_state0_m;
wire                 [7:0] stb_state1_m;
wire                 [7:0] stb_state2_m;
wire                 [7:0] stb_state3_m;
wire                 [7:0] stb_state4_m;
wire                 [7:0] stb_state5_m;
wire                 [7:0] stb_state6_m;
wire                 [7:0] stb_state7_m;
reg                  [7:0] stb_state0_b;
reg                  [7:0] stb_state1_b;
reg                  [7:0] stb_state2_b;
reg                  [7:0] stb_state3_b;
reg                  [7:0] stb_state4_b;
reg                  [7:0] stb_state5_b;
reg                  [7:0] stb_state6_b;
reg                  [7:0] stb_state7_b;
reg                  [7:0] stb_state0_w;
reg                  [7:0] stb_state1_w;
reg                  [7:0] stb_state2_w;
reg                  [7:0] stb_state3_w;
reg                  [7:0] stb_state4_w;
reg                  [7:0] stb_state5_w;
reg                  [7:0] stb_state6_w;
reg                  [7:0] stb_state7_w;
reg                  [7:0] stb_state;
reg                        stb_last;

// Copy of dtag
reg [27:0] dta_way0 [127:0];
reg [27:0] dta_way1 [127:0];
reg [27:0] dta_way2 [127:0];
reg [27:0] dta_way3 [127:0];

//---------------------
// Misc Signals
wire                 [2:0] mycid;
integer                    tstamp;
integer                    junk;
integer                    i;

initial begin // {
  ldf_tnum_w = 6'b0;
  dsrc = 2'b0;
  sta_tid    = 3'b0;
  sta_tnum   = 6'b0;
  for (i=0; i<=7; i=i+1) begin
    sta_suppress[i] = 1'b0;
  end

end // }

// for debug only - allows display in Debussy
wire    sta_suppress0;
wire    sta_suppress1;
wire    sta_suppress2;
wire    sta_suppress3;
wire    sta_suppress4;
wire    sta_suppress5;
wire    sta_suppress6;
wire    sta_suppress7;

  assign   sta_suppress0 = sta_suppress[0];
  assign   sta_suppress1 = sta_suppress[1];
  assign   sta_suppress2 = sta_suppress[2];
  assign   sta_suppress3 = sta_suppress[3];
  assign   sta_suppress4 = sta_suppress[4];
  assign   sta_suppress5 = sta_suppress[5];
  assign   sta_suppress6 = sta_suppress[6];
  assign   sta_suppress7 = sta_suppress[7];

//----------------------------------------------------------
//----------------------------------------------------------
// DUT probes

  assign   mycid = 7;

//---------------------
// Load Issue

  // If Load to IO ASIs, load issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress load_w.

  assign load_w      = `SPC7.lsu.dcc.ld_inst_vld_w & 
                        ~`PROBES7.asi_internal_w &
                        ~`SPC7.lsu.dcc.flush_w &
                        ~ldi_pf_w;

  // ldxa to IO ASI are already suppressed since load_w will not assert.
  // ldi_suppress is required to also suppress normal ld to IO ASI address range.
  assign ldi_suppress = (ldi_pa_w[39:32] == `IO_ASI_ADDR);

  assign ldi_tid_w    = `SPC7.lsu.dcc.tid_w;
  assign ldi_tnum_w   = {mycid,ldi_tid_w};
  assign ldi_size_b   = `SPC7.lsu.dcc.ldst_sz_b;  // 2 bits
  assign ldi_atomic_b = `SPC7.lsu.dcc.atomic_b;
  assign ldi_qld_b    = `SPC7.lsu.dcc.quad_ldd_b;
  assign ldi_ldbl_b   = `SPC7.lsu.dcc_ldbl_b;
  assign ldi_ldd_b    = ldi_ldbl_b & !ldi_qld_b;
  assign ldi_bld_b    = `SPC7.lsu.dcc.dcc_blk_inst_b;
  assign ldi_pf_b     = `SPC7.lsu.dcc.pref_inst_b;

  // pa, tid are same for LoadIssue and StoreIssue
  assign ldi_pa_b = {`SPC7.lsu.tlb_pgnum[39:13],
                    `SPC7.lsu.lmd.lsu_va_b[12:0]};

//---------------------
// Load Fill

  assign load_fill_e = `SPC7.lsu.dcc.ld_fill_e;
  assign ldf_tid_e   = `SPC7.lsu.cid.cid_tid;
  assign ldf_pa_e    = {`SPC7.lsu.lmd.lmd_fill_addr_e[39:3],3'b0};

//---------------------
// Store Issue

  // blk_inst_w will suppress store_w for 1st of 9 cycles on block store.

  // If Store to IO ASIs, store issue should not be sent.
  // In this case, asi_internal_w is asserted and will suppress store_w.

  assign unflushed_store_w = `SPC7.lsu.sbc.unflushed_store_w;

  assign store_w      =   unflushed_store_w &
                          (~(`PROBES7.asi_internal_w | blk_inst_w) |
                            bst_in_prog_w);

  assign atomic_b      = `SPC7.lsu.dcc.atomic_b;
  assign rmo_st_b      = `SPC7.lsu.sbc_rmo_st_b;
  assign blk_inst_b    = `SPC7.lsu.dcc.dcc_blk_inst_b;

  assign sti_tnum_w   = {mycid,sti_tid_w};
  assign sti_size_m   = `SPC7.lsu.dcc_ldst_bmask;

  // flip_size will assert if endian swap for partial store is needed
  assign flip_size_b  = `SPC7.lsu.dcc.pst_asi_b & `SPC7.lsu.dcc.tlb_tte_ie_b & `SPC7.lsu.dcc.tlb_tte_vld_b & `SPC7.lsu.dcc.st_inst_vld_b;

  // Change itype only when control signals are valid
  assign sti_itype_w  = unflushed_store_w ? itype_w : sti_itype_w;

  // It is correct to mix W & B stage signals for this.
  // STD is a 2 cycle instruction.
  // inst valid in W, data in B (1 cycle behind)
  assign sti_data_w    = `SPC7.lsu.sbc.std_inst_w ?
                          sbd_st_data_b :
                          sbd_st_data_w;
  assign sbd_st_data_b = `SPC7.lsu.sbd_st_data_b;

  // Use different pa,tid if block store
  assign sti_pa_b     = bst_in_prog_b ? bst_pa_b  : st_pa_b;
  assign sti_tid_b    = bst_in_prog_b ? bst_tid_b : st_tid_b;

  // stxa to IO ASI are already suppressed since store_w will not assert.
  // sti_suppress is required to also suppress normal st to IO ASI address range.
  assign sti_suppress = (sti_pa_w[39:32] == `IO_ASI_ADDR);

  // Normal Store
  assign st_pa_b      = {`SPC7.lsu.tlb_pgnum[39:13],
                         `SPC7.lsu.lmd.lsu_va_b[12:0]};
  assign st_tid_b     = `SPC7.lsu.dcc.tid_b;

  // Block Store
  assign bst_in_prog_b = `SPC7.lsu.sbc.bst_in_prog_b;
  assign bst_pa_b      = {`SPC7.lsu.sbd.st_addr_b[39:3],3'b0};
  assign bst_tid_b     = `SPC7.lsu.sbc.bst_tid;

//---------------------
// Store Ack

assign asi_st_dequeue[7:0] = `SPC7.lsu.dcc_asi_rtn_vld[7:0] &
                             {8{~`SPC7.lsu.dcc_asi_rtn_rd}};

  assign st_ack_no_asi_e = `SPC7.lsu.cic.cic_st_dequeue[7:0] & 
                           ~asi_st_dequeue[7:0] & 
                           ~`SPC7.lsu.cic.sbc_bst_sel[7:0];

  assign st_ack_rmo_b  = {`SPC7.lsu.sbs7.rmo_st_commit_p4,
                          `SPC7.lsu.sbs6.rmo_st_commit_p4,
                          `SPC7.lsu.sbs5.rmo_st_commit_p4,
                          `SPC7.lsu.sbs4.rmo_st_commit_p4,
                          `SPC7.lsu.sbs3.rmo_st_commit_p4,
                          `SPC7.lsu.sbs2.rmo_st_commit_p4,
                          `SPC7.lsu.sbs1.rmo_st_commit_p4,
                          `SPC7.lsu.sbs0.rmo_st_commit_p4
                         };

  // It is possible to see 2 threads store_ack in same cycle
  // (1 st_ack_no_asi & 1 st_ack_rmo)

  assign store_ack_b   = st_ack_no_asi_b | st_ack_rmo_b;

  // cic_st_atm_cmplt is atomic store completing (same time as store ack)
  // (lsu.lmc.dcl2u_err | dcl2nd_err) indicate a data_access_error condition
  assign st_data_access_e = {8{(`SPC7.lsu.cic.cic_st_atm_cmplt & 
                             (`SPC7.lsu.lmc.dcl2u_err | `SPC7.lsu.lmc.dcl2nd_err))}} &
                            `SPC7.lsu.cic.cic_st_dequeue[7:0];
//---------------------
// Store Inv

  // Same as evict_inv_e but with cpq_evict deasserted
  assign store_inv_e  =  `SPC7.lsu.cic_invalidate_e &
                         (`SPC7.lsu.cic_inv_wen_e!=0)&
                        ~`SPC7.lsu.cic.cpq_evict & 
                        ~`SPC7.lsu.cic.cid_set_inval & 
                        ~`SPC7.lsu.cic.cic_xinval_e &
			~(`SPC7.lsu.cic.cid_pkt_type[4:0] == 5'b10110);
  assign stinv_tnum_e = 
         {`SPC7.lsu.cid.cpq_data_out[`CPX_VACK_CID],
          `SPC7.lsu.cid.cid_tid};

//---------------------
// Store Update

  assign store_update_e = `SPC7.lsu.cic_st_update_e;
  assign stu_tid_e      = `SPC7.lsu.cid.cid_tid;
  assign stu_tnum_e     = {mycid,stu_tid_e};

  assign l1_index = {`SPC7.lsu.cid.cpq_data_out[116],
                     `SPC7.lsu.cid.cpq_data_out[115],
                     `SPC7.lsu.cid.cpq_data_out[114],
                     `SPC7.lsu.cid.cpq_data_out[113],
                     `SPC7.lsu.cid.cpq_data_out[112],
                     `SPC7.lsu.cid.cpq_data_out[122],
                     `SPC7.lsu.cid.cpq_data_out[121]
                    };
  assign l1_way_select = `SPC7.lsu.cid_inv_vec[17:16];

//---------------------
// EvictInv

  // Same as store_inv_e but with cpq_evict asserted
  // LSU can invalidate 1-4 Dcache lines
  assign evict_inv_e[3:0]  =  {4{`SPC7.lsu.cic_invalidate_e &          // enable for 4 bit wen below
                                (`SPC7.lsu.cic_inv_wen_e!=0)&
                               `SPC7.lsu.cic.cpq_evict &
                               ~`SPC7.lsu.cic.cid_set_inval &
                               ~`SPC7.lsu.cic.cic_xinval_e}} &

                              {|(`SPC7.lsu.cic.evict_inv_wen[15:12]),   // 4 bit field - 1 hot.  Send evinv when any one set.
                               |(`SPC7.lsu.cic.evict_inv_wen[11:8]),
                               |(`SPC7.lsu.cic.evict_inv_wen[7:4]),
                               |(`SPC7.lsu.cic.evict_inv_wen[3:0])
                              };

  assign evict_srcid_e  = `SPC7.lsu.cid.cpq_data_out[114:112];


//---------------------
// Detect Store to IO ASI in PCX crossbar packet.
// This causes next Store Ack to be suppressed.

// Normal Store only since atomics are always to cacheable space

// Trigger on Store to crossbar.
// If Store request is retried on crossbar (due to no grant),
// then, st_io_asi will fire multiple times for the same request.
// This is OK because it just causes sta_suppress to be set multiple times.

  assign pcx_req    = `SPC7.spc_pcx_req_pq;
  assign pcx_data   = `SPC7.spc_pcx_data_pa;

  assign st_io_asi  = (pcx_req_1 != 9'b0) & 
                      (pcx_data [`PCX_VALID]==1'b1) & 
                      (pcx_data [`PCX_RQTYP]==`CCX_REQ_ST) & 
                      (pcx_data [103:96]==`IO_ASI_ADDR);  // Upper byte of 40 bit addr

  assign st_io_tid  = pcx_data [`PCX_TID];

  assign stb_state0_m = `SPC7.lsu.sbs0.stb_state_vld[7:0];
  assign stb_state1_m = `SPC7.lsu.sbs1.stb_state_vld[7:0];
  assign stb_state2_m = `SPC7.lsu.sbs2.stb_state_vld[7:0];
  assign stb_state3_m = `SPC7.lsu.sbs3.stb_state_vld[7:0];
  assign stb_state4_m = `SPC7.lsu.sbs4.stb_state_vld[7:0];
  assign stb_state5_m = `SPC7.lsu.sbs5.stb_state_vld[7:0];
  assign stb_state6_m = `SPC7.lsu.sbs6.stb_state_vld[7:0];
  assign stb_state7_m = `SPC7.lsu.sbs7.stb_state_vld[7:0];

//---------------------
// Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  assign load_data_hit = load_w && (hit_w | fraw_w);
  assign ld_miss_b = `SPC7.lsu.dcc.dcc_ld_miss_b;
  assign fraw_w    = `SPC7.lsu.lmc.ld_raw_bypass_w;
  assign hit_w     = ~ld_miss_w & ~stb_hit_w;
  assign miss_w    = ~fraw_w & (ld_miss_w | stb_hit_w);

//---------------------
// Load Pop

  assign perfmon_g      = `SPC7.lsu.lsu_perfmon_trap_g;
  assign perfmon_tid_g  = `SPC7.lsu.lsu_dcerr_tid_g;
  // perfmon_mask will not fire if trap is not enabled or higher priority trap is taken.
  assign perfmon_mask_g = {`SPC7.tlu.fls1.pil_mask_15[3:0], `SPC7.tlu.fls0.pil_mask_15[3:0]} &
                           ~{8 {`SPC7.lsu_dcl2u_err_g | `SPC7.lsu_dcl2nd_err_g}};

  assign perfmon      = perfmon_w;
  assign perfmon_tid  = perfmon_tid_w;
  assign perfmon_tnum = {mycid,perfmon_tid_w};
  assign perfmon_mask = perfmon_mask_w;



//---------------------
// Store Pop

  assign bst_kill      = {`SPC7.lsu.sbs7.bst_kill,
                          `SPC7.lsu.sbs6.bst_kill,
                          `SPC7.lsu.sbs5.bst_kill,
                          `SPC7.lsu.sbs4.bst_kill,
                          `SPC7.lsu.sbs3.bst_kill,
                          `SPC7.lsu.sbs2.bst_kill,
                          `SPC7.lsu.sbs1.bst_kill,
                          `SPC7.lsu.sbs0.bst_kill};
  
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC7.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  //------------------------------
  //  Pipeline from B to W

  ldi_pa_w    <= ldi_pa_b;
  ld_miss_w   <= ld_miss_b;
  stb_hit_w   <= `SPC7.lsu.stb_cam_hit;
  ldi_pf_w    <= ldi_pf_b;
  ldi_size_w  <= ldi_size_b;
  load_fill_m <= load_fill_e;
  load_fill_b <= load_fill_m;
  load_fill_w <= load_fill_b;
  ldf_tid_m   <= ldf_tid_e;
  ldf_tid_b   <= ldf_tid_m;
  ldf_tid_w   <= ldf_tid_b;
  ldf_pa_m    <= ldf_pa_e;
  ldf_pa_b    <= ldf_pa_m;
  ldf_pa_w    <= ldf_pa_b;

  sti_size_b     <= sti_size_m;
  sti_size_w     <= (flip_size_b) ? {sti_size_b[0],sti_size_b[1],sti_size_b[2],sti_size_b[3],
                                     sti_size_b[4],sti_size_b[5],sti_size_b[6],sti_size_b[7]} 
                                  : sti_size_b;
  sti_pa_w       <= sti_pa_b;
  sti_tid_w      <= sti_tid_b;
  st_ack_no_asi_m  <= st_ack_no_asi_e;
  st_ack_no_asi_b  <= st_ack_no_asi_m;
  st_data_access_m <= st_data_access_e;
  st_data_access_b <= st_data_access_m;
  st_data_access_w <= st_data_access_b;
  store_ack_w    <= store_ack_b;
  store_update_m <= store_update_e;
  store_update_b <= store_update_m;
  store_update_w <= store_update_b;
  store_inv_m    <= store_inv_e;
  store_inv_b    <= store_inv_m;
  store_inv_w    <= store_inv_b;
  stinv_tnum_m   <= stinv_tnum_e;
  stinv_tnum_b   <= stinv_tnum_m;
  stinv_tnum_w   <= stinv_tnum_b;
  st_ack_rmo_w   <= st_ack_rmo_b;
  stu_tid_m      <= stu_tid_e;
  stu_tid_b      <= stu_tid_m;
  stu_tid_w      <= stu_tid_b;
  stu_tnum_m     <= stu_tnum_e;
  stu_tnum_b     <= stu_tnum_m;
  stu_tnum_w     <= stu_tnum_b;
  store_pa_b     <= store_pa_m;
  store_pa_w     <= store_pa_b;
  bst_in_prog_w  <= bst_in_prog_b;
  blk_inst_w     <= blk_inst_b;
  sbd_st_data_w  <=  sbd_st_data_b;
  evict_inv_m    <= evict_inv_e;
  evict_inv_b    <= evict_inv_m;
  evict_inv_w    <= evict_inv_b;
  evict_srcid_m  <= evict_srcid_e;
  evict_srcid_b  <= evict_srcid_m;
  evict_srcid_w  <= evict_srcid_b;
  pcx_req_1      <= pcx_req;
  stb_state0_b   <= stb_state0_m;
  stb_state1_b   <= stb_state1_m;
  stb_state2_b   <= stb_state2_m;
  stb_state3_b   <= stb_state3_m;
  stb_state4_b   <= stb_state4_m;
  stb_state5_b   <= stb_state5_m;
  stb_state6_b   <= stb_state6_m;
  stb_state7_b   <= stb_state7_m;
  stb_state0_w   <= stb_state0_b;
  stb_state1_w   <= stb_state1_b;
  stb_state2_w   <= stb_state2_b;
  stb_state3_w   <= stb_state3_b;
  stb_state4_w   <= stb_state4_b;
  stb_state5_w   <= stb_state5_b;
  stb_state6_w   <= stb_state6_b;
  stb_state7_w   <= stb_state7_b;

  perfmon_m      <= perfmon_g;
  perfmon_b      <= perfmon_m;
  perfmon_w      <= perfmon_b;
  perfmon_tid_m  <= perfmon_tid_g;
  perfmon_tid_b  <= perfmon_tid_m;
  perfmon_tid_w  <= perfmon_tid_b;
  perfmon_mask_m <= perfmon_mask_g;
  perfmon_mask_b <= perfmon_mask_m;
  perfmon_mask_w <= perfmon_mask_b;

  //----------------------------------------------------------
  // Calculate pa for STUPDATE and STINV
  // Moved this into the always block to avoid the constant
  // probing of the dtag memory structure.

  if (store_inv_e | store_update_e) begin // {
    store_pa_m[2:0]    <= 3'b000;
    store_pa_m[10:3]   <= {`SPC7.lsu.cid.cpq_data_out[116],
                           `SPC7.lsu.cid.cpq_data_out[115],
                           `SPC7.lsu.cid.cpq_data_out[114],
                           `SPC7.lsu.cid.cpq_data_out[113],
                           `SPC7.lsu.cid.cpq_data_out[112],
                           `SPC7.lsu.cid.cpq_data_out[122],
                           `SPC7.lsu.cid.cpq_data_out[121],
                           `SPC7.lsu.cid.cpq_data_out[104]
                          };
    store_pa_m[38:11] <= (l1_way_select==2'h0) ? dta_way0[l1_index] :
                         (l1_way_select==2'h1) ? dta_way1[l1_index] :
                         (l1_way_select==2'h2) ? dta_way2[l1_index] : dta_way3[l1_index];
    store_pa_m[39]    <= 1'b0;		// Only memory stores get inv/update
  end // }


  // After Store to IO ASI is detected at StI time, suppress the next Store Ack
  // There is only 1 store to IO ASI active at one time per thread because
  //   that is all the LSU allows.
  if (st_io_asi) begin
    sta_suppress [st_io_tid] <= 1'b1;
  end 

  case ({ldi_atomic_b,ldi_bld_b,ldi_ldd_b,ldi_qld_b,ldi_pf_b})
    5'b00000: ldi_itype_w <= `ITYPE_LOAD;
    5'b00001: ldi_itype_w <= `ITYPE_PREFETCH;
    5'b00010: ldi_itype_w <= `ITYPE_QUAD_LOAD;
    5'b00100: ldi_itype_w <= `ITYPE_DOUBLE_LOAD;
    5'b01000: ldi_itype_w <= `ITYPE_BLOCK_LOAD;
    5'b10000: ldi_itype_w <= `ITYPE_ATOMIC;
    default: ldi_itype_w <= `ITYPE_NO; // Illegal
  endcase

  case ({atomic_b,rmo_st_b,bst_in_prog_b})
    3'b000: itype_w <= `ITYPE_STORE;
    3'b010: itype_w <= `ITYPE_BLK_INIT_ST;
    3'b011: itype_w <= `ITYPE_BLOCK_STORE;
    3'b100: itype_w <= `ITYPE_ATOMIC;
    3'b001,
    3'b101,
    3'b110,
    3'b111: itype_w <= `ITYPE_NO; // Illegal
  endcase

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Issue

  //  Load Issue must be before Store Issue for atomic

  if (load_w) begin // {

    if (ldi_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h size=%h  typ=%0h                     ts=%0d",
                            mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_LD_ISSUE,ldi_tnum_w,ldi_pa_w,ldi_size_w,ldi_itype_w,tstamp);
      end // }
    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_LDISSU tid=%d pa=%h  Suppress for IO ASI",mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_LOAD  tid=%d pa=%h  ts=%0d  (LSU - W stage)",
                     mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Data (hit only) (See ldst_l2.v for Load Data - miss)

  if (load_data_hit) begin // {

    dsrc = hit_w ? `DSRC_L1 : `DSRC_STB;

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldi_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDDATA tid=%d pa=%h dsrc=%0h                            ts=%0d",
                         mycid,ldi_tid_w,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
      junk = $sim_send(`PLI_MEM_LD_DATA,ldi_tnum_w,ldi_pa_w,dsrc,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Ack
  //
  // Store Ack cmd must be sent before Store Inv, Store Update for NAS
  // Store Ack & Store Update will be in the same timestamp

  if (store_ack_w != 8'b0) begin // {

    for (i=0; i<=7; i=i+1) begin // {
      if (store_ack_w[i]) begin // {
        sta_tid = i[2:0];
        sta_tnum = {mycid,sta_tid};
        sta_rmo = st_ack_rmo_w[i];

        if (sta_suppress[sta_tid]==1'b0)  begin // {
          if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
            `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
            junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
          end // }
        end // }

        else begin // {

          // It is possible for 2 Stores it be in flight because of the delay from CPQ push & pop.
          // So, make sure Bench is suppressing the correct Store.
          case (sta_tid)
            3'h0: stb_state=stb_state0_w;
            3'h1: stb_state=stb_state1_w;
            3'h2: stb_state=stb_state2_w;
            3'h3: stb_state=stb_state3_w;
            3'h4: stb_state=stb_state4_w;
            3'h5: stb_state=stb_state5_w;
            3'h6: stb_state=stb_state6_w;
            3'h7: stb_state=stb_state7_w;
            default: 
              `PR_ERROR ("pli_ldst", `ERROR, 
              "C%0d T%0d PLI_MEM_XXX Bench Error.  Should never execute case default",mycid,sta_tid);
          endcase

          // If stb_state has only 1 bit asserted, then suppress the STACK.  Otherwise, send the STACK.
          case (stb_state) // {
            8'b0000_0000: begin
                `PR_ERROR ("pli_ldst", `ERROR, 
                "C%0d T%0d PLI_MEM_XXX Bench Error.  stb_state should not be 8'b0",
                 mycid,sta_tid);
              end
            8'b0000_0001,
            8'b0000_0010,
            8'b0000_0100,
            8'b0000_1000,
            8'b0001_0000,
            8'b0010_0000,
            8'b0100_0000,
            8'b1000_0000: stb_last = 1'b1;
            default:      stb_last = 1'b0;
          endcase // }

          if (stb_last==1'b0) begin // {
            if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sta_tnum]) begin // {
              `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d               rmo=%0h                             ts=%0d",
                                  mycid,sta_tid,sta_tnum,sta_rmo,tstamp);
              junk = $sim_send(`PLI_MEM_ST_ACK,sta_tnum,sta_rmo,tstamp);
            end // }
          end // }
          else begin // {
            sta_suppress[sta_tid] <= 1'b0;
            `PR_INFO ("pli_ldst", `INFO, 
                "C%0d T%0d PLI_MEM_STACK  tid=%d                Suppress for IO ASI",mycid,sta_tid,sta_tnum);
          end // }
        end // }

      end //  if (store_ack_w[i]) }
    end // for }

  end // if (store_ack_w) }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Inv

  if (store_inv_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stinv_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d    PLI_MEM_STINV  tid=%d pa=%h cid=%h                             ts=%0d",
                                  mycid,stinv_tnum_w,store_pa_w,mycid,tstamp);
      junk = $sim_send(`PLI_MEM_ST_INV,mycid,stinv_tnum_w,store_pa_w,tstamp);
    end // }

  end // }


  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Update

  if (store_update_w) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[stu_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_STUP   tid=%d pa=%h                                   ts=%0d",
                           mycid,stu_tid_w,stu_tnum_w,store_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_ST_UPDATE,stu_tnum_w,store_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  //  Load Fill

  if (load_fill_w) begin // {

    ldf_tnum_w = {mycid,ldf_tid_w};

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[ldf_tnum_w]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDFILL tid=%d pa=%h                                   ts=%0d",
                         mycid,ldf_tid_w,ldf_tnum_w,ldf_pa_w,tstamp);
      junk = $sim_send(`PLI_MEM_LD_FILL,ldf_tnum_w,ldf_pa_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Issue

  if (store_w) begin // {

    if (sti_suppress==1'b0)  begin // {
      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[sti_tnum_w]) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h data=%h sz=%h typ=%0h ts=%0d",
                          mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
        junk = $sim_send(`PLI_MEM_ST_ISSUE,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,sti_itype_w,tstamp);
      end // }

    end // }
    else begin // {
      `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STISSU tid=%d pa=%h  Suppress for IO ASI",mycid,sti_tid_w,sti_tnum_w,sti_pa_w);
    end // }
    
    if (`PARGS.show_memop_on) begin // {
      `PR_NORMAL ("pli_ldst", `NORMAL, 
          "C%0d T%0d MEMOP_STORE tid=%d pa=%h  data=%h sz=%h ts=%0d  (LSU - W stage)",
                     mycid,sti_tid_w,sti_tnum_w,sti_pa_w,sti_data_w,sti_size_w,tstamp);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // EvictInv
  // Send 1-4 EvictInv messages per cycle - based on how many Dcache lines were invalidated.

  for (i=0; i<=3; i=i+1) begin // {
    if (evict_inv_w[i]) begin // {

      if (`PARGS.nas_check_on && `PARGS.ldst_sync_on) begin // {
        `PR_INFO ("pli_ldst", `INFO, 
            "C%0d    PLI_MEM_EVINV                      cid=%d  srcid=%0d                    ts=%0d",
                                       mycid,mycid,evict_srcid_w,tstamp);
        junk = $sim_send(`PLI_MEM_EVICT_INV,mycid,evict_srcid_w,tstamp);
      end // }

    end // }
  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Load Pop - special case

  // This is required in case of a performance monitor trap due to L2 miss.
  // In this case, the trap is not indicated until after the Load pkt returns to the LSU.
  // ldst_sync has already sent LDISSUE and LDDATA to Riesling.  But, the Load is not executed.
  // Load Pop tells Riesling to pop the LDISSUE,LDDATA off of its queues.

  if (perfmon & perfmon_mask[perfmon_tid]) begin // {

    if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[perfmon_tnum]) begin // {
      `PR_INFO ("pli_ldst", `INFO, 
          "C%0d T%0d PLI_MEM_LDPOP  tid=%d                                                 ts=%0d",
                           mycid,perfmon_tid,perfmon_tnum,tstamp);
      junk = $sim_send(`PLI_MEM_LD_POP,perfmon_tnum);
    end // }

  end // }

  //----------------------------------------------------------
  //----------------------------------------------------------
  // Store Pop - special cases

  // This is required in case of a FRF error trap (internal_proc_error) on a Block Store.
  // In this case, the trap is not indicated until after the 8 STISSUE has been sent to Riesling.
  // But, the Store is not executed.
  // Store Pop tells Riesling to pop the 8 STISSUE off of its queues.

  if (bst_kill!==8'b0) begin // {

    for (i=0;i<=7;i=i+1) begin
      if (bst_kill[i]==1'b1) begin
        bst_kill_tid = i;
        bst_kill_tnum = {mycid,bst_kill_tid};

        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[bst_kill_tnum]) begin // {
          `PR_INFO ("pli_ldst", `INFO, 
              "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
                               mycid,bst_kill_tid,bst_kill_tnum,tstamp);
          junk = $sim_send(`PLI_MEM_ST_POP,bst_kill_tnum);
        end // }
      end
    end

  end // }

  //--------------------
  // This is required for data_access_error on atomic.  In this case, Riesling only cleans up the Load,
  // but doesn't know it is an atomic so Riesling doesn't clean up the store in its buffers.
  // The STPOP tells Riesling to clear the newest Store from the buffers.
  // It is possible to have older Stores in-flight but not newer Stores in-flight.

//  if (st_data_access_w != 8'b0) begin // {
//
//    for (i=0; i<=7; i=i+1) begin // {
//      if (st_data_access_w[i]) begin // {
//        tmp_tid = i[2:0];
//        tmp_tnum = {mycid,tmp_tid};
//
//        if (`PARGS.nas_check_on && `PARGS.ldst_sync_on && `PARGS.th_check_enable[tmp_tnum]) begin // {
//           `PR_INFO ("pli_ldst", `INFO, 
//               "C%0d T%0d PLI_MEM_STPOP  tid=%d                                                 ts=%0d",
//                               mycid,tmp_tid,tmp_tnum,tstamp);
//           junk = $sim_send(`PLI_MEM_ST_POP,tmp_tnum);
//        end // }
//      end // } if st_data_access[i]
//    end // } for
//  end // } if st_data_access

end // always }

//----------------------------------------------------------
// Need to model the D arrays to get PA's for store updates and invalidates

always @ (negedge `SPC7.l2clk) begin // {
  if (`SPC7.lsu.dta.wr_way[0])
    dta_way0[`SPC7.lsu.dta.index_y[6:0]] <= `SPC7.lsu.dta.wrtag_y[27:0];
  if (`SPC7.lsu.dta.wr_way[1])
    dta_way1[`SPC7.lsu.dta.index_y[6:0]] <= `SPC7.lsu.dta.wrtag_y[27:0];
  if (`SPC7.lsu.dta.wr_way[2])
    dta_way2[`SPC7.lsu.dta.index_y[6:0]] <= `SPC7.lsu.dta.wrtag_y[27:0];
  if (`SPC7.lsu.dta.wr_way[3])
    dta_way3[`SPC7.lsu.dta.index_y[6:0]] <= `SPC7.lsu.dta.wrtag_y[27:0];
end // always }

//----------------------------------------------------------
`endif
endmodule

`endif
//----------------------------------------------------------
//----------------------------------------------------------
