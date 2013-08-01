// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nas_probes.v
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
`timescale 1 ps / 1 ps

`ifdef CORE_0

module nas_probes0;


`ifdef GATESIM


`else
   reg [7:0] ex_valid_m;
   reg [7:0] ex_valid_b;
   reg [7:0] ex_valid_w;
   reg [7:0] return_f4;
   reg [2:0] ex0_tid_m;
   reg [2:0] ex1_tid_m;
   reg [2:0] ex0_tid_b;
   reg [2:0] ex1_tid_b;
   reg [2:0] ex0_tid_w;
   reg [2:0] ex1_tid_w;
   reg       fgu_valid_fb0;
   reg       fgu_valid_fb1;

   reg [31:0] inst0_e;
   reg [31:0] inst1_e;

   reg [7:0] fg_valid;

   reg fcc_valid_f4;
   reg fcc_valid_f5;
   reg fcc_valid_fb;

   reg fgu0_e;
   reg fgu1_e;
   reg lsu0_e;
   reg lsu1_e;

   reg [1:0] dcd_idest_e;
   reg [1:0] dcd_fdest_e;

   wire [7:0] ex_valid;
   wire [7:0] exception_w;

   wire [7:0] imul_valid;

   wire       fg_cond_fb;

   wire        exu_lsu_valid;
   wire [47:0] exu_lsu_addr;
   wire [31:0] exu_lsu_instr;
   wire [2:0]  exu_lsu_tid;
   wire [4:0]  exu_lsu_regid;
   wire [63:0] exu_lsu_data;

   wire [2:0] ex0_tid_e;
   wire [2:0] ex1_tid_e;
   wire       ex0_valid_e;
   wire       ex1_valid_e;
   wire [7:0] ex_asr_access;
   wire       ex_asr_valid;

   wire [7:0] lsu_valid;
   wire [2:0] lsu_tid;
   wire [7:0] lsu_tid_dec_b;
   wire       lsu_ld_valid;
   reg  [7:0] lsu_data_w;
   wire [7:0] lsu_data_b;

   wire ld_inst_d;

   reg [7:0] div_idest;
   reg [7:0] div_fdest;
   
   reg load0_e;
   reg load1_e;

   reg load_m;
   reg load_b;

   reg [2:0] lsu_tid_m;
   reg [7:0] lsu_complete_m;
   reg [7:0] lsu_complete_b;
   reg [7:0] lsu_trap_flush_d;	//reqd. for store buffer ue testing

   reg [7:0] ex_flush_w;
   reg [7:0] ex_flush_b;

   reg sel_divide0_e;
   reg sel_divide1_e;

   wire dec_flush_lb;

   wire [7:0] fgu_idiv_valid;

   wire [7:0] fgu_fdiv_valid;
   
   wire [7:0] fg_div_valid;

   wire       lsu_valid_b;

   wire [7:0] return_w;
   wire       return0;
   wire       return1;
   wire [7:0] real_exception;

   reg  [2:0] lsu_tid_b;
   reg        fmov_valid_fb;
   reg        fmov_valid_f5;
   reg        fmov_valid_f4;
   reg        fmov_valid_f3;
   reg        fmov_valid_f2;
   reg        fmov_valid_m;
   reg        fmov_valid_e;

   reg        fg_flush_fb;
   reg        fg_flush_f5;
   reg        fg_flush_f4;
   reg        fg_flush_f3;
   reg        fg_flush_f2;

   reg       siam0_d;   
   reg       siam1_d;   

   reg       done0_d;
   reg       done1_d;
   reg       retry0_d;
   reg       retry1_d;
   reg       done0_e;
   reg       done1_e;
   reg       retry0_e;
   reg       retry1_e;
   reg       tlu_ccr_cwp_0_valid_last;
   reg       tlu_ccr_cwp_1_valid_last;
   reg [7:0] fg_fdiv_valid_fw;
   reg [7:0] asi_in_progress_b;
   reg [7:0] asi_in_progress_w;
   reg [7:0] asi_in_progress_fx4;
   reg [7:0] tlu_valid;
   reg [7:0] sync_reset_w;
            
   reg [7:0] div_special_cancel_f4;

   reg       asi_store_b;
   reg       asi_store_w;
   reg [2:0] dcc_tid_b;
   reg [2:0] dcc_tid_w;
   reg [7:0] asi_valid_w;
   reg [7:0] asi_valid_fx4;
   reg [7:0] asi_valid_fx5;

   reg [7:0] lsu_state;
   reg [7:0] lsu_check;
   reg [2:0] lsu_tid_e;

   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;

   reg fgu_err_fx3; 
   reg fgu_err_fx4; 
   reg fgu_err_fx5; 
   reg fgu_err_fb; 

   reg clkstop_d1;
   reg clkstop_d2;
   reg clkstop_d3;
   reg clkstop_d4;
   reg clkstop_d5;

integer i;
integer start_dmiss0;
integer start_dmiss1;
integer start_dmiss2;
integer start_dmiss3;
integer start_dmiss4;
integer start_dmiss5;
integer start_dmiss6;
integer start_dmiss7;
integer number_dmiss;
integer start_imiss0;
integer start_imiss1;
integer start_imiss2;
integer start_imiss3;
integer start_imiss4;
integer start_imiss5;
integer start_imiss6;
integer start_imiss7;
integer active_imiss0;
integer active_imiss1;
integer active_imiss2;
integer active_imiss3;
integer active_imiss4;
integer active_imiss5;
integer active_imiss6;
integer active_imiss7;
integer first_imiss0;
integer first_imiss1;
integer first_imiss2;
integer first_imiss3;
integer first_imiss4;
integer first_imiss5;
integer first_imiss6;
integer first_imiss7;
integer number_imiss;
integer clock;
integer sum_dmiss_latency;
integer sum_imiss_latency;
reg spec_dmiss;
integer dmiss_cnt;
integer imiss_cnt;
reg pcx_req;
integer l15dmiss_cnt;
integer l15imiss_cnt;


initial begin // {
    pcx_req=0;
    l15imiss_cnt=0;
    l15dmiss_cnt=0;
    imiss_cnt=0;
    dmiss_cnt=0;
    clock=0;
    start_dmiss0=0;
    start_dmiss1=0;
    start_dmiss2=0;
    start_dmiss3=0;
    start_dmiss4=0;
    start_dmiss5=0;
    start_dmiss6=0;
    start_dmiss7=0;
    number_dmiss=0;
    start_imiss0=0;
    start_imiss1=0;
    start_imiss2=0;
    start_imiss3=0;
    start_imiss4=0;
    start_imiss5=0;
    start_imiss6=0;
    start_imiss7=0;
    active_imiss0=0;
    active_imiss1=0;
    active_imiss2=0;
    active_imiss3=0;
    active_imiss4=0;
    active_imiss5=0;
    active_imiss6=0;
    active_imiss7=0;
    first_imiss0=0;
    first_imiss1=0;
    first_imiss2=0;
    first_imiss3=0;
    first_imiss4=0;
    first_imiss5=0;
    first_imiss6=0;
    first_imiss7=0;
    number_imiss=0;
    sum_dmiss_latency=0;
    sum_imiss_latency=0;
    asi_in_progress_b <= 8'h0;
    asi_in_progress_w <= 8'h0;
    asi_in_progress_fx4 <= 8'h0;
    tlu_valid <= 8'h0;
    div_idest <= 8'h0;
    div_fdest <= 8'h0;
    lsu_state <= 8'h0;
    clkstop_d1 <=0;
    clkstop_d2 <=0;
    clkstop_d3 <=0;
    clkstop_d4 <=0;
    clkstop_d5 <=0;

end //}

wire [7:0] asi_store_flush_w =  {`SPC0.lsu.sbs7.flush_st_w,
                                 `SPC0.lsu.sbs6.flush_st_w,
                                 `SPC0.lsu.sbs5.flush_st_w,
                                 `SPC0.lsu.sbs4.flush_st_w,
                                 `SPC0.lsu.sbs3.flush_st_w,
                                 `SPC0.lsu.sbs2.flush_st_w,
                                 `SPC0.lsu.sbs1.flush_st_w,
                                 `SPC0.lsu.sbs0.flush_st_w};

wire [7:0] store_sync = {`SPC0.lsu.sbs7.trap_sync,
                         `SPC0.lsu.sbs6.trap_sync,
                         `SPC0.lsu.sbs5.trap_sync,
                         `SPC0.lsu.sbs4.trap_sync,
                         `SPC0.lsu.sbs3.trap_sync,
                         `SPC0.lsu.sbs2.trap_sync,
                         `SPC0.lsu.sbs1.trap_sync,
                         `SPC0.lsu.sbs0.trap_sync};
wire [7:0] sync_reset = {`SPC0.lsu.sbs7.sync_state_rst,
                         `SPC0.lsu.sbs6.sync_state_rst,
                         `SPC0.lsu.sbs5.sync_state_rst,
                         `SPC0.lsu.sbs4.sync_state_rst,
                         `SPC0.lsu.sbs3.sync_state_rst,
                         `SPC0.lsu.sbs2.sync_state_rst,
                         `SPC0.lsu.sbs1.sync_state_rst,
                         `SPC0.lsu.sbs0.sync_state_rst};

//--------------------
// Used in nas_pipe for TSB Config Regs Capture/Compare
// ADD_TSB_CFG

// NOTE - ADD_TSB_CFG will never be used for Axis or Tharas
`ifndef EMUL
wire [63:0] ctxt_z_tsb_cfg0_reg [7:0];  // 1 per thread
wire [63:0] ctxt_z_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg3_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg0_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg3_reg [7:0];

// There are 32 entries in each MMU MRA but not all are needed.
// Indexing:
// Bits 4:3 of the address are the lower two bits of the TID
// Bits 2:0 of the address select the register as below
//   mmu.mra0.array.mem for T0-T3
//   mmu.mra1.array.mem for T4-T7
// (this is documented in mmu_asi_ctl.sv)
//		z TSB cfg 0,1				address 0
//		z TSB cfg 2,3				address 1
//		nz TSB cfg 0,1				address 2
//		nz TSB cfg 2,3				address 3
//		Real range, physical offset pair 0	address 4
//		Real range, physical offset pair 1	address 5
//		Real range, physical offset pair 2	address 6
//		Real range, physical offset pair 3	address 7

wire [83:0] mmu_mra0_a0 = `SPC0.mmu.mra0.array.mem[0];
wire [83:0] mmu_mra0_a8 = `SPC0.mmu.mra0.array.mem[8];
wire [83:0] mmu_mra0_a16 = `SPC0.mmu.mra0.array.mem[16];
wire [83:0] mmu_mra0_a24 = `SPC0.mmu.mra0.array.mem[24];
wire [83:0] mmu_mra0_a1 = `SPC0.mmu.mra0.array.mem[1];
wire [83:0] mmu_mra0_a9 = `SPC0.mmu.mra0.array.mem[9];
wire [83:0] mmu_mra0_a17 = `SPC0.mmu.mra0.array.mem[17];
wire [83:0] mmu_mra0_a25 = `SPC0.mmu.mra0.array.mem[25];
wire [83:0] mmu_mra0_a2 = `SPC0.mmu.mra0.array.mem[2];
wire [83:0] mmu_mra0_a10 = `SPC0.mmu.mra0.array.mem[10];
wire [83:0] mmu_mra0_a18 = `SPC0.mmu.mra0.array.mem[18];
wire [83:0] mmu_mra0_a26 = `SPC0.mmu.mra0.array.mem[26];
wire [83:0] mmu_mra0_a3 = `SPC0.mmu.mra0.array.mem[3];
wire [83:0] mmu_mra0_a11 = `SPC0.mmu.mra0.array.mem[11];
wire [83:0] mmu_mra0_a19 = `SPC0.mmu.mra0.array.mem[19];
wire [83:0] mmu_mra0_a27 = `SPC0.mmu.mra0.array.mem[27];
wire [83:0] mmu_mra1_a0 = `SPC0.mmu.mra1.array.mem[0];
wire [83:0] mmu_mra1_a8 = `SPC0.mmu.mra1.array.mem[8];
wire [83:0] mmu_mra1_a16 = `SPC0.mmu.mra1.array.mem[16];
wire [83:0] mmu_mra1_a24 = `SPC0.mmu.mra1.array.mem[24];
wire [83:0] mmu_mra1_a1 = `SPC0.mmu.mra1.array.mem[1];
wire [83:0] mmu_mra1_a9 = `SPC0.mmu.mra1.array.mem[9];
wire [83:0] mmu_mra1_a17 = `SPC0.mmu.mra1.array.mem[17];
wire [83:0] mmu_mra1_a25 = `SPC0.mmu.mra1.array.mem[25];
wire [83:0] mmu_mra1_a2 = `SPC0.mmu.mra1.array.mem[2];
wire [83:0] mmu_mra1_a10 = `SPC0.mmu.mra1.array.mem[10];
wire [83:0] mmu_mra1_a18 = `SPC0.mmu.mra1.array.mem[18];
wire [83:0] mmu_mra1_a26 = `SPC0.mmu.mra1.array.mem[26];
wire [83:0] mmu_mra1_a3 = `SPC0.mmu.mra1.array.mem[3];
wire [83:0] mmu_mra1_a11 = `SPC0.mmu.mra1.array.mem[11];
wire [83:0] mmu_mra1_a19 = `SPC0.mmu.mra1.array.mem[19];
wire [83:0] mmu_mra1_a27 = `SPC0.mmu.mra1.array.mem[27];


// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[0] = {`SPC0.mmu.asi.t0_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[0]  = {`SPC0.mmu.asi.t0_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[0]  = {`SPC0.mmu.asi.t0_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[0]  = {`SPC0.mmu.asi.t0_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[0] = {`SPC0.mmu.asi.t0_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[0] = {`SPC0.mmu.asi.t0_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[0] = {`SPC0.mmu.asi.t0_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[0] = {`SPC0.mmu.asi.t0_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[1] = {`SPC0.mmu.asi.t1_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[1]  = {`SPC0.mmu.asi.t1_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[1]  = {`SPC0.mmu.asi.t1_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[1]  = {`SPC0.mmu.asi.t1_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[1] = {`SPC0.mmu.asi.t1_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[1] = {`SPC0.mmu.asi.t1_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[1] = {`SPC0.mmu.asi.t1_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[1] = {`SPC0.mmu.asi.t1_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[2] = {`SPC0.mmu.asi.t2_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[2]  = {`SPC0.mmu.asi.t2_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[2]  = {`SPC0.mmu.asi.t2_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[2]  = {`SPC0.mmu.asi.t2_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[2] = {`SPC0.mmu.asi.t2_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[2] = {`SPC0.mmu.asi.t2_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[2] = {`SPC0.mmu.asi.t2_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[2] = {`SPC0.mmu.asi.t2_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[3] = {`SPC0.mmu.asi.t3_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[3]  = {`SPC0.mmu.asi.t3_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[3]  = {`SPC0.mmu.asi.t3_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[3]  = {`SPC0.mmu.asi.t3_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[3] = {`SPC0.mmu.asi.t3_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[3] = {`SPC0.mmu.asi.t3_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[3] = {`SPC0.mmu.asi.t3_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[3] = {`SPC0.mmu.asi.t3_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[4] = {`SPC0.mmu.asi.t4_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[4]  = {`SPC0.mmu.asi.t4_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[4]  = {`SPC0.mmu.asi.t4_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[4]  = {`SPC0.mmu.asi.t4_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[4] = {`SPC0.mmu.asi.t4_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[4] = {`SPC0.mmu.asi.t4_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[4] = {`SPC0.mmu.asi.t4_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[4] = {`SPC0.mmu.asi.t4_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[5] = {`SPC0.mmu.asi.t5_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[5]  = {`SPC0.mmu.asi.t5_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[5]  = {`SPC0.mmu.asi.t5_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[5]  = {`SPC0.mmu.asi.t5_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[5] = {`SPC0.mmu.asi.t5_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[5] = {`SPC0.mmu.asi.t5_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[5] = {`SPC0.mmu.asi.t5_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[5] = {`SPC0.mmu.asi.t5_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[6] = {`SPC0.mmu.asi.t6_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[6]  = {`SPC0.mmu.asi.t6_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[6]  = {`SPC0.mmu.asi.t6_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[6]  = {`SPC0.mmu.asi.t6_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[6] = {`SPC0.mmu.asi.t6_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[6] = {`SPC0.mmu.asi.t6_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[6] = {`SPC0.mmu.asi.t6_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[6] = {`SPC0.mmu.asi.t6_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[7] = {`SPC0.mmu.asi.t7_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[7]  = {`SPC0.mmu.asi.t7_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[7]  = {`SPC0.mmu.asi.t7_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[7]  = {`SPC0.mmu.asi.t7_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[7] = {`SPC0.mmu.asi.t7_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[7] = {`SPC0.mmu.asi.t7_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[7] = {`SPC0.mmu.asi.t7_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[7] = {`SPC0.mmu.asi.t7_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };
`endif // EMUL - ADD_TSB_CFG


// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
// Suppress instruction on flush or park request 
// (clear_disrupting_flush_pending_w_in & idl_req_in)
//   Suppress instruction for 'refetch' exception after 
//     not taken branch with annulled delay slot
// NOTE:  'with_errors' means that the signal actually IGNORES instruction
// cache errors and asserts IN SPITE OF instruction cache errors
wire [7:0] select_pc_b_with_errors = 
     {{4 {~`SPC0.dec_flush_b[1]}}, {4 {~`SPC0.dec_flush_b[0]}}} & 
     {{4 {~`SPC0.tlu.fls1.refetch_w_in}}, {4 {~`SPC0.tlu.fls0.refetch_w_in}}} &
     {~(`SPC0.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC0.tlu.fls1.idl_req_in}}),
      ~(`SPC0.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC0.tlu.fls0.idl_req_in}})} &
     {`SPC0.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC0.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Qualify select_pc_b_with_errors to get final select_pc_b signal
// Qualifications are
// 	- instruction cache errors (ic_err_w_in)
//	- disrupting single step completion requests (dsc_req_in)
wire [7:0] select_pc_b = 
     select_pc_b_with_errors[7:0]  &
     {{4 {(~`SPC0.tlu.fls1.ic_err_w_in | `SPC0.tlu.fls1.itlb_nfo_exc_b) & 
          ~`SPC0.tlu.fls1.dsc_req_in}}, 
      {4 {(~`SPC0.tlu.fls0.ic_err_w_in | `SPC0.tlu.fls0.itlb_nfo_exc_b) & 
          ~`SPC0.tlu.fls0.dsc_req_in}}};

//------------------------------------

//original select_pc_b_with errors. Select_pc_b_with_errors is no longer asserted
//if the inst. following an annulled delay slot of a not taken branch has a prebuffer
//error and it reaches B stage. I still need a signal if this happens to trigger the chkr.

wire [7:0] select_pc_b_with_errors_and_refetch =
     {{4 {~`SPC0.dec_flush_b[1]}}, {4 {~`SPC0.dec_flush_b[0]}}} &
     {~(`SPC0.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC0.tlu.fls1.idl_req_in}}),
      ~(`SPC0.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC0.tlu.fls0.idl_req_in}})} &
     {`SPC0.tlu.fls1.tid_dec_valid_b[3:0],
      `SPC0.tlu.fls0.tid_dec_valid_b[3:0]};

// Signals required for bench TLB sync & LDST sync

reg        tlb_bypass_m;
reg        tlb_bypass_b;
reg        tlb_rd_vld_m;
reg        tlb_rd_vld_b;
reg        lsu_tl_gt_0_b;
reg  [7:0] dcc_asi_b;
reg        asi_internal_w;

always @ (posedge `BENCH_SPC0_GCLK) begin // {

  clkstop_d1 <= `SPC0.tcu_clk_stop;
  clkstop_d2 <= clkstop_d1;
  clkstop_d3 <= clkstop_d2;
  clkstop_d4 <= clkstop_d3;
  clkstop_d5 <= clkstop_d4;

  tlb_bypass_m <= `SPC0.lsu.tlb.tlb_bypass;
  tlb_bypass_b <= tlb_bypass_m;
  tlb_rd_vld_m <= `SPC0.lsu.tlb.tlb_rd_vld | `SPC0.lsu.tlb.tlb_cam_vld;
  tlb_rd_vld_b <= tlb_rd_vld_m;

  // This signal is only valid for LD/ST instructions
  lsu_tl_gt_0_b <= `SPC0.lsu.dcc.tl_gt_0_m;

  // Can't use lsu.dcc_asi_b for tlb_sync so pipeline from M to B
  dcc_asi_b <= `SPC0.lsu.dcc_asi_m;

  // LD/ST that will not issue to the crossbar
  asi_internal_w <= `SPC0.lsu.dcc.asi_internal_b;
end // }

// TL determines whether Nucleus or Primary
wire [7:0] asi_num = `SPC0.lsu.dcc.altspace_ldst_b ? 
                     dcc_asi_b : 
                     (lsu_tl_gt_0_b ? 8'h04 : 8'h80);

wire [7:0] itlb_miss   = { (`SPC0.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire [7:0] icache_miss = { (`SPC0.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC0.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC0.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire inst_bypass = (`SPC0.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[0] |
                    `SPC0.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[1] |
                    `SPC0.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[2]);

wire [7:0] fetch_bypass = { (inst_bypass & `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                            (inst_bypass & `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                            (inst_bypass & `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                            (inst_bypass & `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                            (inst_bypass & `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                            (inst_bypass & `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                            (inst_bypass & `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                            (inst_bypass & `SPC0.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                          };

wire [7:0] itlb_wr = {(`SPC0.tlu.trl1.take_itw & `SPC0.tlu.trl1.trap[3]),
                      (`SPC0.tlu.trl1.take_itw & `SPC0.tlu.trl1.trap[2]),
                      (`SPC0.tlu.trl1.take_itw & `SPC0.tlu.trl1.trap[1]),
                      (`SPC0.tlu.trl1.take_itw & `SPC0.tlu.trl1.trap[0]),
                      (`SPC0.tlu.trl0.take_itw & `SPC0.tlu.trl0.trap[3]),
                      (`SPC0.tlu.trl0.take_itw & `SPC0.tlu.trl0.trap[2]),
                      (`SPC0.tlu.trl0.take_itw & `SPC0.tlu.trl0.trap[1]),
                      (`SPC0.tlu.trl0.take_itw & `SPC0.tlu.trl0.trap[0])
                     };

//------------------------------------

reg  [71:0] tick_cmpr_0; 
reg  [71:0] stick_cmpr_0; 
reg  [71:0] hstick_cmpr_0;
reg [151:0] trap_entry_1_t0;
reg [151:0] trap_entry_2_t0;
reg [151:0] trap_entry_3_t0;
reg [151:0] trap_entry_4_t0;
reg [151:0] trap_entry_5_t0;
reg [151:0] trap_entry_6_t0;

always @(posedge `BENCH_SPC0_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_0        <= `SPC0.tlu.tca.array.mem[{2'b0,3'h0}];
      stick_cmpr_0       <= `SPC0.tlu.tca.array.mem[{2'b01,3'h0}];
      hstick_cmpr_0      <= `SPC0.tlu.tca.array.mem[{2'b10,3'h0}];
      trap_entry_1_t0    <= `SPC0.tlu.tsa0.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t0    <= `SPC0.tlu.tsa0.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t0    <= `SPC0.tlu.tsa0.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t0    <= `SPC0.tlu.tsa0.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t0    <= `SPC0.tlu.tsa0.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t0    <= `SPC0.tlu.tsa0.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_1; 
reg  [71:0] stick_cmpr_1; 
reg  [71:0] hstick_cmpr_1;
reg [151:0] trap_entry_1_t1;
reg [151:0] trap_entry_2_t1;
reg [151:0] trap_entry_3_t1;
reg [151:0] trap_entry_4_t1;
reg [151:0] trap_entry_5_t1;
reg [151:0] trap_entry_6_t1;

always @(posedge `BENCH_SPC0_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_1        <= `SPC0.tlu.tca.array.mem[{2'b0,3'h1}];
      stick_cmpr_1       <= `SPC0.tlu.tca.array.mem[{2'b01,3'h1}];
      hstick_cmpr_1      <= `SPC0.tlu.tca.array.mem[{2'b10,3'h1}];
      trap_entry_1_t1    <= `SPC0.tlu.tsa0.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t1    <= `SPC0.tlu.tsa0.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t1    <= `SPC0.tlu.tsa0.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t1    <= `SPC0.tlu.tsa0.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t1    <= `SPC0.tlu.tsa0.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t1    <= `SPC0.tlu.tsa0.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_2; 
reg  [71:0] stick_cmpr_2; 
reg  [71:0] hstick_cmpr_2;
reg [151:0] trap_entry_1_t2;
reg [151:0] trap_entry_2_t2;
reg [151:0] trap_entry_3_t2;
reg [151:0] trap_entry_4_t2;
reg [151:0] trap_entry_5_t2;
reg [151:0] trap_entry_6_t2;

always @(posedge `BENCH_SPC0_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_2        <= `SPC0.tlu.tca.array.mem[{2'b0,3'h2}];
      stick_cmpr_2       <= `SPC0.tlu.tca.array.mem[{2'b01,3'h2}];
      hstick_cmpr_2      <= `SPC0.tlu.tca.array.mem[{2'b10,3'h2}];
      trap_entry_1_t2    <= `SPC0.tlu.tsa0.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t2    <= `SPC0.tlu.tsa0.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t2    <= `SPC0.tlu.tsa0.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t2    <= `SPC0.tlu.tsa0.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t2    <= `SPC0.tlu.tsa0.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t2    <= `SPC0.tlu.tsa0.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_3; 
reg  [71:0] stick_cmpr_3; 
reg  [71:0] hstick_cmpr_3;
reg [151:0] trap_entry_1_t3;
reg [151:0] trap_entry_2_t3;
reg [151:0] trap_entry_3_t3;
reg [151:0] trap_entry_4_t3;
reg [151:0] trap_entry_5_t3;
reg [151:0] trap_entry_6_t3;

always @(posedge `BENCH_SPC0_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_3        <= `SPC0.tlu.tca.array.mem[{2'b0,3'h3}];
      stick_cmpr_3       <= `SPC0.tlu.tca.array.mem[{2'b01,3'h3}];
      hstick_cmpr_3      <= `SPC0.tlu.tca.array.mem[{2'b10,3'h3}];
      trap_entry_1_t3    <= `SPC0.tlu.tsa0.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t3    <= `SPC0.tlu.tsa0.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t3    <= `SPC0.tlu.tsa0.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t3    <= `SPC0.tlu.tsa0.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t3    <= `SPC0.tlu.tsa0.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t3    <= `SPC0.tlu.tsa0.array.mem[{2'h3, 3'h5}];

end // }
reg  [71:0] tick_cmpr_4; 
reg  [71:0] stick_cmpr_4; 
reg  [71:0] hstick_cmpr_4;
reg [151:0] trap_entry_1_t4;
reg [151:0] trap_entry_2_t4;
reg [151:0] trap_entry_3_t4;
reg [151:0] trap_entry_4_t4;
reg [151:0] trap_entry_5_t4;
reg [151:0] trap_entry_6_t4;

always @(posedge `BENCH_SPC0_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_4        <= `SPC0.tlu.tca.array.mem[{2'b0,3'h4}];
      stick_cmpr_4       <= `SPC0.tlu.tca.array.mem[{2'b01,3'h4}];
      hstick_cmpr_4      <= `SPC0.tlu.tca.array.mem[{2'b10,3'h4}];
      trap_entry_1_t4    <= `SPC0.tlu.tsa1.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t4    <= `SPC0.tlu.tsa1.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t4    <= `SPC0.tlu.tsa1.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t4    <= `SPC0.tlu.tsa1.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t4    <= `SPC0.tlu.tsa1.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t4    <= `SPC0.tlu.tsa1.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_5; 
reg  [71:0] stick_cmpr_5; 
reg  [71:0] hstick_cmpr_5;
reg [151:0] trap_entry_1_t5;
reg [151:0] trap_entry_2_t5;
reg [151:0] trap_entry_3_t5;
reg [151:0] trap_entry_4_t5;
reg [151:0] trap_entry_5_t5;
reg [151:0] trap_entry_6_t5;

always @(posedge `BENCH_SPC0_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_5        <= `SPC0.tlu.tca.array.mem[{2'b0,3'h5}];
      stick_cmpr_5       <= `SPC0.tlu.tca.array.mem[{2'b01,3'h5}];
      hstick_cmpr_5      <= `SPC0.tlu.tca.array.mem[{2'b10,3'h5}];
      trap_entry_1_t5    <= `SPC0.tlu.tsa1.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t5    <= `SPC0.tlu.tsa1.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t5    <= `SPC0.tlu.tsa1.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t5    <= `SPC0.tlu.tsa1.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t5    <= `SPC0.tlu.tsa1.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t5    <= `SPC0.tlu.tsa1.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_6; 
reg  [71:0] stick_cmpr_6; 
reg  [71:0] hstick_cmpr_6;
reg [151:0] trap_entry_1_t6;
reg [151:0] trap_entry_2_t6;
reg [151:0] trap_entry_3_t6;
reg [151:0] trap_entry_4_t6;
reg [151:0] trap_entry_5_t6;
reg [151:0] trap_entry_6_t6;

always @(posedge `BENCH_SPC0_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_6        <= `SPC0.tlu.tca.array.mem[{2'b0,3'h6}];
      stick_cmpr_6       <= `SPC0.tlu.tca.array.mem[{2'b01,3'h6}];
      hstick_cmpr_6      <= `SPC0.tlu.tca.array.mem[{2'b10,3'h6}];
      trap_entry_1_t6    <= `SPC0.tlu.tsa1.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t6    <= `SPC0.tlu.tsa1.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t6    <= `SPC0.tlu.tsa1.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t6    <= `SPC0.tlu.tsa1.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t6    <= `SPC0.tlu.tsa1.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t6    <= `SPC0.tlu.tsa1.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_7; 
reg  [71:0] stick_cmpr_7; 
reg  [71:0] hstick_cmpr_7;
reg [151:0] trap_entry_1_t7;
reg [151:0] trap_entry_2_t7;
reg [151:0] trap_entry_3_t7;
reg [151:0] trap_entry_4_t7;
reg [151:0] trap_entry_5_t7;
reg [151:0] trap_entry_6_t7;

always @(posedge `BENCH_SPC0_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_7        <= `SPC0.tlu.tca.array.mem[{2'b0,3'h7}];
      stick_cmpr_7       <= `SPC0.tlu.tca.array.mem[{2'b01,3'h7}];
      hstick_cmpr_7      <= `SPC0.tlu.tca.array.mem[{2'b10,3'h7}];
      trap_entry_1_t7    <= `SPC0.tlu.tsa1.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t7    <= `SPC0.tlu.tsa1.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t7    <= `SPC0.tlu.tsa1.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t7    <= `SPC0.tlu.tsa1.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t7    <= `SPC0.tlu.tsa1.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t7    <= `SPC0.tlu.tsa1.array.mem[{2'h3, 3'h5}];

end // }

//------------------------------------
// ASI & Trap State machines
always @(posedge `BENCH_SPC0_GCLK) begin // {

//    pc_0_e[47:0] <= `SPC0.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC0.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC0.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC0.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;


    // altspace_ldst_m is asserted for asi accesses that don't change arch state
    asi_store_b <= (`SPC0.lsu.dcc.asi_store_m & `SPC0.lsu.dcc.asi_sync_m);
    asi_store_w <= asi_store_b;
    dcc_tid_b <= `SPC0.lsu.dcc.dcc_tid_m;
    dcc_tid_w <= dcc_tid_b;

    // ASI in progress state m/c
    if (asi_store_w & ~asi_store_flush_w[dcc_tid_w]) begin // {
        asi_in_progress_b[dcc_tid_w] <= 1'b1;
    end // }

    asi_valid_w <= asi_in_progress_b & store_sync;

    // Delay asi_valid_w and asi_in_progress
    // 2 clocks to ensure TLB Sync DTLBWRITE (demap) comes before SSTEP stxa
    asi_valid_fx4 <= asi_valid_w;
    asi_valid_fx5 <= asi_valid_fx4;
    asi_in_progress_w <= asi_in_progress_b;
    asi_in_progress_fx4 <= asi_in_progress_w;
    sync_reset_w <= sync_reset;
    
    for (i=0;i<8;i=i+1) begin // {
        if (asi_valid_w[i] | sync_reset_w[i]) begin // {
            asi_in_progress_b[i] <= 1'b0;
        end//}
    end //}

    // Trap0 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC0.tlu.tlu_trap_0_tid[1:0] == i) &&
            `SPC0.tlu.tlu_trap_pc_0_valid & tlu_ccr_cwp_0_valid_last)
        begin //{
            tlu_valid[i] <= 1'b1;
        end //}
        // Trap taken
        else if (`SPC0.tlu.trl0.real_trap[i] & ~`SPC0.tlu.trl0.take_por) begin // {
            tlu_valid[i] <= 1'b1;
        end //}
        else 
            tlu_valid[i] <= 1'b0;
    end //}

    // Trap1 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC0.tlu.tlu_trap_1_tid[1:0] == i) &&
            `SPC0.tlu.tlu_trap_pc_1_valid & tlu_ccr_cwp_1_valid_last)
        begin //{
            tlu_valid[i+4] <= 1'b1;
        end //} 
        // Trap taken
        else if (`SPC0.tlu.trl1.real_trap[i] & ~`SPC0.tlu.trl1.take_por) begin // {
            tlu_valid[i+4] <= 1'b1;
        end //}
        else 
            tlu_valid[i+4] <= 1'b0;
    end //}

end // }


always @(posedge `BENCH_SPC0_GCLK) begin

// debug code for TPCC analysis
`ifdef TPCC
if (pcx_req==1) begin
	if (`SPC0.spc_pcx_data_pa[129:124]==6'b100000) begin  // l15 dmiss
	  l15dmiss_cnt=l15dmiss_cnt+1;
	  $display("dmissl15 cnt is %0d",l15dmiss_cnt);
	end
	if (`SPC0.spc_pcx_data_pa[129:124]==6'b110000) begin // l15 imiss
	  l15imiss_cnt=l15imiss_cnt+1;
	  $display("imissl15 cnt is %0d",l15imiss_cnt);
	end
	// `TOP.spg.spc_pcx_data_pa[129:124]==6'b100001   -> all stores 
end

pcx_req <= |`SPC0.spc_pcx_req_pq[8:0];
 
if (`SPC0.ifu_l15_valid==1) begin
	imiss_cnt=imiss_cnt+1;
	$display("imiss cnt is %0d",imiss_cnt);
end
if (spec_dmiss==1 && `SPC0.lsu_l15_cancel==0) begin
	dmiss_cnt=dmiss_cnt+1;
	$display("dmiss cnt is %0d",dmiss_cnt);
	
end
spec_dmiss <= `SPC0.lsu_l15_valid & `SPC0.lsu_l15_load;

clock = clock+1;

// keep track of imiss latencies
if (`SPC0.ftu_agc_thr0_cmiss_c==1) begin
     start_imiss0=clock;
     active_imiss0=1;
end
if (active_imiss0==1 && first_imiss0==1 && `SPC0.l15_spc_cpkt[8:6]==3'b000 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss0 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss0=0;
     first_imiss0=0;
end
if (active_imiss0==1 && first_imiss0==0 && `SPC0.l15_spc_cpkt[8:6]==3'b000 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss0=1;
end
if (`SPC0.ftu_agc_thr1_cmiss_c==1) begin
     start_imiss1=clock;
     active_imiss1=1;
end
if (active_imiss1==1 && first_imiss1==1 && `SPC0.l15_spc_cpkt[8:6]==3'b001 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss1 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss1=0;
     first_imiss1=0;
end
if (active_imiss1==1 && first_imiss1==0 && `SPC0.l15_spc_cpkt[8:6]==3'b001 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss1=1;
end
if (`SPC0.ftu_agc_thr2_cmiss_c==1) begin
     start_imiss2=clock;
     active_imiss2=1;
end
if (active_imiss2==1 && first_imiss2==1 && `SPC0.l15_spc_cpkt[8:6]==3'b010 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss2 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss2=0;
     first_imiss2=0;
end
if (active_imiss2==1 && first_imiss2==0 && `SPC0.l15_spc_cpkt[8:6]==3'b010 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss2=1;
end
if (`SPC0.ftu_agc_thr3_cmiss_c==1) begin
     start_imiss3=clock;
     active_imiss3=1;
end
if (active_imiss3==1 && first_imiss3==1  && `SPC0.l15_spc_cpkt[8:6]==3'b011 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss3 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss3=0;
     first_imiss3=0;
end
if (active_imiss3==1 && first_imiss3==0 && `SPC0.l15_spc_cpkt[8:6]==3'b011 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss3=1;
end
if (`SPC0.ftu_agc_thr4_cmiss_c==1) begin
     start_imiss4=clock;
     active_imiss4=1;
end
if (active_imiss4==1 && first_imiss4==1  && `SPC0.l15_spc_cpkt[8:6]==3'b100 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss4 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss4=0;
     first_imiss4=0;
end
if (active_imiss4==1 && first_imiss4==0 && `SPC0.l15_spc_cpkt[8:6]==3'b100 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss4=1;
end
if (`SPC0.ftu_agc_thr5_cmiss_c==1) begin
     start_imiss5=clock;
     active_imiss5=1;
end
if (active_imiss5==1  && first_imiss5==1 && `SPC0.l15_spc_cpkt[8:6]==3'b101 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss5 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss5=0;
     first_imiss5=0;
end
if (active_imiss5==1 && first_imiss5==0 && `SPC0.l15_spc_cpkt[8:6]==3'b101 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss5=1;
end
if (`SPC0.ftu_agc_thr6_cmiss_c==1) begin
     start_imiss6=clock;
     active_imiss6=1;
end
if (active_imiss6==1 && first_imiss6==1 && `SPC0.l15_spc_cpkt[8:6]==3'b110 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss6 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss6=0;
     first_imiss6=0;
end
if (active_imiss6==1 && first_imiss6==0 && `SPC0.l15_spc_cpkt[8:6]==3'b110 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss6=1;
end
if (`SPC0.ftu_agc_thr7_cmiss_c==1) begin
     start_imiss7=clock;
     active_imiss7=1;
end
if (active_imiss7==1 && first_imiss7==1 && `SPC0.l15_spc_cpkt[8:6]==3'b111 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss7 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss7=0;
    first_imiss7=0;
end
if (active_imiss7==1 && first_imiss7==0 && `SPC0.l15_spc_cpkt[8:6]==3'b111 && `SPC0.l15_spc_valid==1 && `SPC0.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss7=1;
end

if (`SPC0.pku.swl0.set_lsu_sync_wait==1) begin
     start_dmiss0=clock;
end
if (`SPC0.pku.swl0.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss0) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC0.pku.swl1.set_lsu_sync_wait==1) begin
     start_dmiss1=clock;
end
if (`SPC0.pku.swl1.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss1) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC0.pku.swl2.set_lsu_sync_wait==1) begin
     start_dmiss2=clock;
end
if (`SPC0.pku.swl2.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss2) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC0.pku.swl3.set_lsu_sync_wait==1) begin
     start_dmiss3=clock;
end
if (`SPC0.pku.swl3.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss3) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC0.pku.swl4.set_lsu_sync_wait==1) begin
     start_dmiss4=clock;
end
if (`SPC0.pku.swl4.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss4) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC0.pku.swl5.set_lsu_sync_wait==1) begin
     start_dmiss5=clock;
end
if (`SPC0.pku.swl5.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss5) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC0.pku.swl6.set_lsu_sync_wait==1) begin
     start_dmiss6=clock;
end
if (`SPC0.pku.swl6.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss6) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC0.pku.swl7.set_lsu_sync_wait==1) begin
     start_dmiss7=clock;
end
if (`SPC0.pku.swl7.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss7) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
`endif



   lsu_tid_e[2:0] <= `SPC0.lsu.dcc.tid_d[2:0];

   // FG Valid conditions

   // Add fcc valids to fg_valid
   fcc_valid_fb <= fcc_valid_f5;
   fcc_valid_f5 <= fcc_valid_f4;
   fcc_valid_f4 <= |`SPC0.fgu.fgu_cmp_fcc_vld_fx3[3:0];

   fg_flush_fb <= fg_flush_f5;
   fg_flush_f5 <= fg_flush_f4;
   fg_flush_f4 <= fg_flush_f3;
   fg_flush_f3 <= fg_flush_f2 | `SPC0.dec_flush_f2 | 
                  `SPC0.tlu_flush_fgu_b;
   fg_flush_f2 <= `SPC0.dec_flush_f1;

   fgu_err_fx3 <= `SPC0.fgu_cecc_fx2 | `SPC0.fgu_uecc_fx2 | `SPC0.fgu.fpc.exu_flush_fx2; // frf or irf ecc error
   fgu_err_fx4 <= fgu_err_fx3;
   fgu_err_fx5 <= fgu_err_fx4;
   fgu_err_fb <= fgu_err_fx5;

   // Siams cause fg_valid ..
   siam0_d = `SPC0.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC0.dec.dec_inst0_d[24:19]==6'b110110 &
             `SPC0.dec.dec_inst0_d[13:5]==9'b010000001;  

   siam1_d = `SPC0.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC0.dec.dec_inst1_d[24:19]==6'b110110 &
             `SPC0.dec.dec_inst1_d[13:5]==9'b010000001;  
    

   done0_d = `SPC0.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC0.dec.dec_inst0_d[29:25]==5'b00000 & 
             `SPC0.dec.dec_inst0_d[24:19]==6'b111110;
   done1_d = `SPC0.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC0.dec.dec_inst1_d[29:25]==5'b00000 & 
             `SPC0.dec.dec_inst1_d[24:19]==6'b111110;    

   retry0_d = `SPC0.dec.dec_inst0_d[31:30]==2'b10 & 
              `SPC0.dec.dec_inst0_d[29:25]==5'b00001 & 
              `SPC0.dec.dec_inst0_d[24:19]==6'b111110;
   retry1_d = `SPC0.dec.dec_inst1_d[31:30]==2'b10 & 
              `SPC0.dec.dec_inst1_d[29:25]==5'b00001 & 
              `SPC0.dec.dec_inst1_d[24:19]==6'b111110;   

   done0_e <= done0_d & `SPC0.dec.dec_decode0_d;
   done1_e <= done1_d & `SPC0.dec.dec_decode1_d; 

   retry0_e <= retry0_d & `SPC0.dec.dec_decode0_d;
   retry1_e <= retry1_d & `SPC0.dec.dec_decode1_d;   


   // fold siam into cmov logic 

   fmov_valid_fb <= fmov_valid_f5;
   fmov_valid_f5 <= fmov_valid_f4;
   fmov_valid_f4 <= fmov_valid_f3;
   fmov_valid_f3 <= fmov_valid_f2;
   fmov_valid_f2 <= fmov_valid_m;
   fmov_valid_m  <= fmov_valid_e & `SPC0.dec.dec_fgu_valid_e;
   fmov_valid_e <= ((`SPC0.exu0.ect.cmov_d | siam0_d) & 
                    `SPC0.dec.dec_decode0_d&`SPC0.dec.del.fgu0_d) |
                    ((`SPC0.exu1.ect.cmov_d | siam1_d) & 
                    `SPC0.dec.dec_decode1_d&`SPC0.dec.del.fgu1_d);
   
   // fgu check bus

   // fcc_valid_fb doesn't assert for LDFSR. LDFSR gets checked by the LSU
   // checker

   fg_valid <= {(`SPC0.fgu.fac.fac_w1_tid_fb[2:0]==3'h7) && fg_cond_fb,
                (`SPC0.fgu.fac.fac_w1_tid_fb[2:0]==3'h6) && fg_cond_fb,
                (`SPC0.fgu.fac.fac_w1_tid_fb[2:0]==3'h5) && fg_cond_fb,
                (`SPC0.fgu.fac.fac_w1_tid_fb[2:0]==3'h4) && fg_cond_fb,
                (`SPC0.fgu.fac.fac_w1_tid_fb[2:0]==3'h3) && fg_cond_fb,
                (`SPC0.fgu.fac.fac_w1_tid_fb[2:0]==3'h2) && fg_cond_fb,
                (`SPC0.fgu.fac.fac_w1_tid_fb[2:0]==3'h1) && fg_cond_fb,
                (`SPC0.fgu.fac.fac_w1_tid_fb[2:0]==3'h0) && fg_cond_fb };
   

   fgu_valid_fb0      <= `SPC0.fgu_exu_w_vld_fx5[0] && !`SPC0.fgu.fpc.div_finish_int_fb;
   fgu_valid_fb1      <= `SPC0.fgu_exu_w_vld_fx5[1] && !`SPC0.fgu.fpc.div_finish_int_fb;

   // Fdiv
   div_special_cancel_f4[7:0] <= tid2onehot(`SPC0.fgu.fac.tid_fx3[2:0]) & 
                               {8{`SPC0.fgu.fac.q_div_default_res_fx3}};
   fg_fdiv_valid_fw <= `SPC0.fgu_divide_completion & ~div_special_cancel_f4 &
                       {8{~`SPC0.fgu.fpc.fpc_fpd_ieee_trap_fb}} &
                       {8{~`SPC0.fgu.fpc.fpc_fpd_unfin_fb}};

    
   // Used in CCX Stub ?
   inst0_e[31:0] <= `SPC0.dec.dec_inst0_d[31:0];
   inst1_e[31:0] <= `SPC0.dec.dec_inst1_d[31:0];

   // only fgu ops that are not loads/stores
   fgu0_e <= `SPC0.dec.del.decode_fgu0_d;  
   fgu1_e <= `SPC0.dec.del.decode_fgu1_d;

   // LSU logic 
   load_b <= load_m;
   load_m <= (load0_e | load1_e);

   load0_e <= (`SPC0.dec.dec_decode0_d & `SPC0.dec.del.lsu0_d & 
               `SPC0.dec.dcd0.dcd_load_d);

   load1_e <= (`SPC0.dec.dec_decode1_d & `SPC0.dec.del.lsu1_d & 
               `SPC0.dec.dcd1.dcd_load_d);

   lsu_tid_b[2:0] <= lsu_tid_m[2:0];
   lsu_tid_m[2:0] <= lsu_tid_e[2:0];

   lsu_complete_m[7:0] <= `SPC0.lsu_complete[7:0];
   lsu_complete_b[7:0] <= lsu_complete_m[7:0];

   lsu_data_w  <= lsu_data_b;
  
   // Divide destination logic ..
   sel_divide0_e <= (`SPC0.dec_decode0_d & 
                     ((`SPC0.pku.swl0.vld_d & `SPC0.pku.swl_divide_wait[0]) |
                      (`SPC0.pku.swl1.vld_d & `SPC0.pku.swl_divide_wait[1]) |
                      (`SPC0.pku.swl2.vld_d & `SPC0.pku.swl_divide_wait[2]) |
                      (`SPC0.pku.swl3.vld_d & `SPC0.pku.swl_divide_wait[3])));
   sel_divide1_e <= (`SPC0.dec_decode1_d & 
                     ((`SPC0.pku.swl4.vld_d & `SPC0.pku.swl_divide_wait[4]) |
                      (`SPC0.pku.swl5.vld_d & `SPC0.pku.swl_divide_wait[5]) |
                      (`SPC0.pku.swl6.vld_d & `SPC0.pku.swl_divide_wait[6]) |
                      (`SPC0.pku.swl7.vld_d & `SPC0.pku.swl_divide_wait[7])));


   dcd_fdest_e <= {`SPC0.dec.del.fdest1_d,`SPC0.dec.del.fdest0_d};
   dcd_idest_e <= {`SPC0.dec.del.idest1_d,`SPC0.dec.del.idest0_d};

   if (sel_divide0_e) begin // {
         div_idest[{1'b0, `SPC0.dec.del.tid0_e[1:0]}] <= dcd_idest_e[0];
         div_fdest[{1'b0, `SPC0.dec.del.tid0_e[1:0]}] <= dcd_fdest_e[0];
   end // }
   if (sel_divide1_e) begin // {
         div_idest[{1'b1, `SPC0.dec.del.tid1_e[1:0]}] <= dcd_idest_e[1];
         div_fdest[{1'b1, `SPC0.dec.del.tid1_e[1:0]}] <= dcd_fdest_e[1];
   end // }
                 

   // EX logic
   // Save EX tids for later use
   ex0_tid_m <= ex0_tid_e;
   ex1_tid_m <= ex1_tid_e;
   ex0_tid_b <= ex0_tid_m;
   ex1_tid_b <= ex1_tid_m;
   ex0_tid_w <= ex0_tid_b;
   ex1_tid_w <= ex1_tid_b;

   // EX Flush conditions
   ex_flush_w <= {ex_flush_b | {{4{(`SPC0.dec.dec_flush_b[1] | 
                                `SPC0.tlu_flush_exu_b[1])}},
                                {4{(`SPC0.dec.dec_flush_b[0] |
                                `SPC0.tlu_flush_exu_b[0])}}}};

   ex_flush_b <= {{4{`SPC0.dec.dec_flush_m[1]}},
                 {4{`SPC0.dec.dec_flush_m[0]}}};


   // ex_valid_f4 valid will only fire on return
   return_f4 <= return_w & ~(`SPC0.tlu_flush_ifu & real_exception);
   ex_valid_w <= ex_valid_b;

   // Cancel EX valid if it turns out to be asr/asi access for this tid 

   ex_valid_b <= ex_valid_m & ~ex_asr_access;


   ex_valid_m <=      { (ex1_tid_e == 2'h3) && ex1_valid_e,
                       (ex1_tid_e == 2'h2) && ex1_valid_e,
                       (ex1_tid_e == 2'h1) && ex1_valid_e,
                       (ex1_tid_e == 2'h0) && ex1_valid_e,
                       (ex0_tid_e == 2'h3) && ex0_valid_e,
                       (ex0_tid_e == 2'h2) && ex0_valid_e,
                       (ex0_tid_e == 2'h1) && ex0_valid_e,
                       (ex0_tid_e == 2'h0) && ex0_valid_e};
   

  // TLU delays for done and retries
  tlu_ccr_cwp_0_valid_last <= `SPC0.tlu.tlu_ccr_cwp_0_valid;
  tlu_ccr_cwp_1_valid_last <= `SPC0.tlu.tlu_ccr_cwp_1_valid;
  

end // END posedge gclk

// Return instruction is separated out of ex*_valid because CWP update is in
// W+1 for return new window is not available for IRF scan (nas_pipe) until
// W+2
assign return0 = `SPC0.exu0.rml.return_w & 
                 `SPC0.exu0.rml.inst_vld_w;
assign return1 = `SPC0.exu1.rml.return_w & 
                 `SPC0.exu1.rml.inst_vld_w;
assign return_w = {(ex1_tid_w == 2'h3) && return1,
                   (ex1_tid_w == 2'h2) && return1,
                   (ex1_tid_w == 2'h1) && return1,
                   (ex1_tid_w == 2'h0) && return1,
                   (ex0_tid_w == 2'h3) && return0,
                   (ex0_tid_w == 2'h2) && return0,
                   (ex0_tid_w == 2'h1) && return0,
                   (ex0_tid_w == 2'h0) && return0};


// Cancel EX valid if it turns out that exception (tlu flush) taken for
// this tid

// exu check bus
assign ex0_tid_e = `SPC0.exu0.ect_tid_lth_e[1:0];
assign ex0_valid_e = `SPC0.dec.dec_valid_e[0] & ~fgu0_e & ~load0_e &
                     ~retry0_e & ~done0_e;
assign ex1_tid_e = `SPC0.exu1.ect_tid_lth_e[1:0];
assign ex1_valid_e = `SPC0.dec.dec_valid_e[1] & ~fgu1_e & ~load1_e &
                     ~retry1_e & ~done1_e;

assign ex_asr_valid = `SPC0.lsu.dcc.asi_store_m & `SPC0.lsu.dcc.asi_sync_m ;

assign ex_asr_access ={(`SPC0.lsu.dcc.dcc_tid_m[2:0]==3'h7) & ex_asr_valid,
                       (`SPC0.lsu.dcc.dcc_tid_m[2:0]==3'h6) & ex_asr_valid,
                       (`SPC0.lsu.dcc.dcc_tid_m[2:0]==3'h5) & ex_asr_valid,
                       (`SPC0.lsu.dcc.dcc_tid_m[2:0]==3'h4) & ex_asr_valid,
                       (`SPC0.lsu.dcc.dcc_tid_m[2:0]==3'h3) & ex_asr_valid,
                       (`SPC0.lsu.dcc.dcc_tid_m[2:0]==3'h2) & ex_asr_valid,
                       (`SPC0.lsu.dcc.dcc_tid_m[2:0]==3'h1) & ex_asr_valid,
                       (`SPC0.lsu.dcc.dcc_tid_m[2:0]==3'h0) & ex_asr_valid};


// EXU valid is ex_valid_w, except flushes, delayed return, traps, and stfsr
// real_exception added because tlu_flush_ifu activates for second redirect
// of retry if TPC and TNPC are not verified as sequential
assign  real_exception =
	   {{4 {`SPC0.tlu.fls1.dec_exc_w | 
		`SPC0.tlu.fls1.exu_exc_w |
		`SPC0.tlu.fls1.lsu_exc_w | 
                `SPC0.tlu.fls1.bsee_req_w}},
	    {4 {`SPC0.tlu.fls0.dec_exc_w | 
		`SPC0.tlu.fls0.exu_exc_w |
		`SPC0.tlu.fls0.lsu_exc_w | 
                `SPC0.tlu.fls0.bsee_req_w}}};

// Do not assert ex_valid for block store instructions
wire [7:0] block_store_first_at_w = 
           {`SPC0.lsu.sbs7.bst_pend & `SPC0.lsu.sbs7.blk_inst_w, 
            `SPC0.lsu.sbs6.bst_pend & `SPC0.lsu.sbs6.blk_inst_w, 
            `SPC0.lsu.sbs5.bst_pend & `SPC0.lsu.sbs5.blk_inst_w, 
            `SPC0.lsu.sbs4.bst_pend & `SPC0.lsu.sbs4.blk_inst_w, 
            `SPC0.lsu.sbs3.bst_pend & `SPC0.lsu.sbs3.blk_inst_w, 
            `SPC0.lsu.sbs2.bst_pend & `SPC0.lsu.sbs2.blk_inst_w, 
            `SPC0.lsu.sbs1.bst_pend & `SPC0.lsu.sbs1.blk_inst_w, 
            `SPC0.lsu.sbs0.bst_pend & `SPC0.lsu.sbs0.blk_inst_w};

// But inject a valid for a block store that's done...
reg [7:0] block_store_w;
always @(posedge `BENCH_SPC0_GCLK) begin
    block_store_w[7:0] <= `SPC0.lsu.lsu_block_store_b[7:0];
    lsu_trap_flush_d <=  `SPC0.lsu_trap_flush[7:0];
end

wire [7:0] block_store_inject_at_w = 
                                    ~`SPC0.lsu.lsu_block_store_b[7:0] & 
                                    block_store_w[7:0] &
                                    {~`SPC0.lsu.sbs7.bst_kill,
                                     ~`SPC0.lsu.sbs6.bst_kill,
                                     ~`SPC0.lsu.sbs5.bst_kill,
                                     ~`SPC0.lsu.sbs4.bst_kill,
                                     ~`SPC0.lsu.sbs3.bst_kill,
                                     ~`SPC0.lsu.sbs2.bst_kill,
                                     ~`SPC0.lsu.sbs1.bst_kill,
                                     ~`SPC0.lsu.sbs0.bst_kill};

assign ex_valid = (((ex_valid_w & ~ex_flush_w & ~return_w & ~block_store_first_at_w & ~exception_w &
                     ~({{4{`SPC0.tlu.fls1.exu_exc_b & `SPC0.tlu.fls1.beat_two_b}},
                        {4{`SPC0.tlu.fls0.exu_exc_b & `SPC0.tlu.fls0.beat_two_b}}}) &
                     ~{(`SPC0.fgu.fac.tid_fx3[2:0]==3'h7) & `SPC0.fgu.fpc.fsr_store_fx3,
                       (`SPC0.fgu.fac.tid_fx3[2:0]==3'h6) & `SPC0.fgu.fpc.fsr_store_fx3,
                       (`SPC0.fgu.fac.tid_fx3[2:0]==3'h5) & `SPC0.fgu.fpc.fsr_store_fx3,
                       (`SPC0.fgu.fac.tid_fx3[2:0]==3'h4) & `SPC0.fgu.fpc.fsr_store_fx3,
                       (`SPC0.fgu.fac.tid_fx3[2:0]==3'h3) & `SPC0.fgu.fpc.fsr_store_fx3,
                       (`SPC0.fgu.fac.tid_fx3[2:0]==3'h2) & `SPC0.fgu.fpc.fsr_store_fx3,
                       (`SPC0.fgu.fac.tid_fx3[2:0]==3'h1) & `SPC0.fgu.fpc.fsr_store_fx3,
                       (`SPC0.fgu.fac.tid_fx3[2:0]==3'h0) & `SPC0.fgu.fpc.fsr_store_fx3}) | 
                     block_store_inject_at_w) & 
                   ~(`SPC0.tlu_flush_ifu & real_exception)) | return_f4;

assign exception_w = {{4 {`SPC0.tlu.fls1.exc_for_w}} | 
                      `SPC0.tlu.fls1.bsee_req[3:0] | 
		      `SPC0.tlu.fls1.pdist_ecc_w[3:0],
		      {4 {`SPC0.tlu.fls0.exc_for_w}} |
		      `SPC0.tlu.fls0.bsee_req[3:0] | 
		      `SPC0.tlu.fls0.pdist_ecc_w[3:0]};

// imul check bus - includes imul, save, restore instructions
assign imul_valid = {(`SPC0.exu1.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb1,
                     (`SPC0.exu1.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb1,
                     (`SPC0.exu1.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb1,
                     (`SPC0.exu1.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb1,
                     (`SPC0.exu0.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb0,
                     (`SPC0.exu0.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb0,
                     (`SPC0.exu0.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb0,
                     (`SPC0.exu0.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb0};

// qualify this signal with fgu_err. If fgu_err is encountered, deassert
//fg_cond_fb, so we don't send a step to Riesling.

// FGU conditions
wire fg_cond_fb_pre_err = `SPC0.fgu.fpc.fpc_w1_ul_vld_fb | fcc_valid_fb | 
                     (fmov_valid_fb & ~fg_flush_fb) |
                     (`SPC0.fgu.fac.fsr_w1_vld_fb[1]);  // covers ST(X)FSR, which clears FSR.ftt

assign fg_cond_fb = fg_cond_fb_pre_err  & ~fgu_err_fb;

// Idiv/Fdiv signals

assign fgu_idiv_valid = fg_div_valid & div_idest;


assign fgu_fdiv_valid = fg_fdiv_valid_fw & div_fdest;


// Lsu signals needed to check lsu results

assign lsu_valid     = lsu_check | lsu_data_w;

assign fg_div_valid  = `SPC0.fgu_divide_completion & ~div_special_cancel_f4;
   
// State machine asserts lsu_check for LD hit/miss
always @(posedge `BENCH_SPC0_GCLK) begin
  for (i=0; i<=7;i=i+1) begin // {
      lsu_check[i] <= 1'b0;
      case (lsu_state[i])
        1'b0: // IDLE state
              begin
                // LD hit
                if (lsu_ld_valid & lsu_tid_dec_b[i] & load_b) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - normal case
                else if (lsu_ld_valid & lsu_tid_dec_b[i] & lsu_complete_b[i]) 
                begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - LDD or Block LD or SWAP
                else if (lsu_ld_valid & lsu_tid_dec_b[i]) begin
                  lsu_state[i] <= 1'b1; // VALID state
                end
// Added a new term to handle STB uncorrectable errors on atomic or asi stores that are synced
//Send a complete if an atomic is squashed.
//lsu_trap_flush is asserted a cycle after the block_store_kill is asserted
		else if (`SPC0.lsu.dcc.sync_st[i] & `SPC0.lsu_block_store_kill[i] & ~lsu_trap_flush_d[i])
		begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
                
              end
        1'b1: // VALID state
              begin
                if ((lsu_complete_b[i])) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
              end
      endcase
  end // }
end

   
assign lsu_tid   = `SPC0.lsu.dcc.ld_tid_b[2:0];
// Don't assert LSU_complete in case of dtlb or irf errors

assign lsu_valid_b = (`SPC0.lsu.dcc.pref_inst_b & 
                      ~(dec_flush_lb | `SPC0.lsu.dcc.pipe_flush_b | 
			`SPC0.lsu_dtdp_err_b | `SPC0.lsu_dttp_err_b |
			`SPC0.lsu_dtmh_err_b | `SPC0.lsu.dcc.exu_error_b));

assign lsu_data_b[7:0] = { (lsu_tid == 3'h7) & lsu_valid_b,
                          (lsu_tid == 3'h6) & lsu_valid_b,
                          (lsu_tid == 3'h5) & lsu_valid_b,
                          (lsu_tid == 3'h4) & lsu_valid_b,
                          (lsu_tid == 3'h3) & lsu_valid_b,
                          (lsu_tid == 3'h2) & lsu_valid_b,
                          (lsu_tid == 3'h1) & lsu_valid_b,
                          (lsu_tid == 3'h0) & lsu_valid_b};

assign  lsu_tid_dec_b[0] = `SPC0.lsu.dcc.ld_tid_b[2:0] == 3'd0;
assign  lsu_tid_dec_b[1] = `SPC0.lsu.dcc.ld_tid_b[2:0] == 3'd1;
assign  lsu_tid_dec_b[2] = `SPC0.lsu.dcc.ld_tid_b[2:0] == 3'd2;
assign  lsu_tid_dec_b[3] = `SPC0.lsu.dcc.ld_tid_b[2:0] == 3'd3;
assign  lsu_tid_dec_b[4] = `SPC0.lsu.dcc.ld_tid_b[2:0] == 3'd4;
assign  lsu_tid_dec_b[5] = `SPC0.lsu.dcc.ld_tid_b[2:0] == 3'd5;
assign  lsu_tid_dec_b[6] = `SPC0.lsu.dcc.ld_tid_b[2:0] == 3'd6;
assign  lsu_tid_dec_b[7] = `SPC0.lsu.dcc.ld_tid_b[2:0] == 3'd7;

assign  lsu_ld_valid = (`SPC0.lsu.dcc.exu_ld_vld_b |`SPC0.lsu.dcc.fgu_fld_vld_b) &
                       ~(`SPC0.lsu.dcc.flush_all_b & `SPC0.lsu.dcc.ld_inst_vld_b);
assign  dec_flush_lb = `SPC0.dec.dec_flush_lb | `SPC0.tlu_flush_lsu_b; 


// LSU interface to CCX stub

assign  exu_lsu_valid = `SPC0.dec.del.lsu_valid_e;
assign  exu_lsu_addr[47:0] = `SPC0.exu_lsu_address_e[47:0];
assign  exu_lsu_tid[2:0] = lsu_tid_e[2:0];
assign  exu_lsu_regid[4:0] = `SPC0.dec.dec_lsu_rd_e[4:0];
assign  exu_lsu_data[63:0] = `SPC0.exu_lsu_store_data_e[63:0];
assign  exu_lsu_instr[31:0] =   ({32{`SPC0.dec.dec_lsu_sel0_e}} & 
                                inst0_e[31:0]) |
                                ({32{~`SPC0.dec.dec_lsu_sel0_e}} & 
                                inst1_e[31:0]);
assign ld_inst_d = `SPC0.dec.dec_ld_inst_d;

///////////////////////////////////////////////////////////////////////////////
// Debugging Instruction Opcodes Pipeline
///////////////////////////////////////////////////////////////////////////////


   reg [31:0] op_0_w;
   reg [31:0] op_1_w;
   reg [31:0] op_2_w;
   reg [31:0] op_3_w;
   reg [31:0] op_4_w;
   reg [31:0] op_5_w;
   reg [31:0] op_6_w;
   reg [31:0] op_7_w;

   reg [31:0] op0_b;
   reg [31:0] op0_m;
   reg [31:0] op0_e;
   reg [31:0] op0_d;

   reg [31:0] op1_b;
   reg [31:0] op1_m;
   reg [31:0] op1_e;
   reg [31:0] op1_d;

   reg [255:0] inst0_string_w;
   reg [255:0] inst0_string_b;
   reg [255:0] inst0_string_m;
   reg [255:0] inst0_string_e;
   reg [255:0] inst0_string_d;

   reg [255:0] inst1_string_w;
   reg [255:0] inst1_string_b;
   reg [255:0] inst1_string_m;
   reg [255:0] inst1_string_e;
   reg [255:0] inst1_string_d;

   reg [255:0] inst0_string_p;
   reg [255:0] inst1_string_p;
   reg [255:0] inst2_string_p;
   reg [255:0] inst3_string_p;
   reg [255:0] inst4_string_p;
   reg [255:0] inst5_string_p;
   reg [255:0] inst6_string_p;
   reg [255:0] inst7_string_p;

initial begin
    op_0_w = 32'b0;
    op_1_w = 32'b0;
    op_2_w = 32'b0;
    op_3_w = 32'b0;
    op_4_w = 32'b0;
    op_5_w = 32'b0;
    op_6_w = 32'b0;
    op_7_w = 32'b0;
end

always @(posedge `BENCH_SPC0_GCLK) begin // {
  op_0_w <= ({32 { select_pc_b[0]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[0]}} & op_0_w[31:0]) ;
  op_1_w <= ({32 { select_pc_b[1]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[1]}} & op_1_w[31:0]) ;
  op_2_w <= ({32 { select_pc_b[2]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[2]}} & op_2_w[31:0]) ;
  op_3_w <= ({32 { select_pc_b[3]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[3]}} & op_3_w[31:0]) ;
  op_4_w <= ({32 { select_pc_b[4]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[4]}} & op_4_w[31:0]) ;
  op_5_w <= ({32 { select_pc_b[5]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[5]}} & op_5_w[31:0]) ;
  op_6_w <= ({32 { select_pc_b[6]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[6]}} & op_6_w[31:0]) ;
  op_7_w <= ({32 { select_pc_b[7]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[7]}} & op_7_w[31:0]) ;

  op0_b <= op0_m;
  op0_m <= op0_e;
  op0_e <= op0_d;
  op0_d <= `SPC0.dec.ded0.decode_mux[31:0];

  op1_b <= op1_m;
  op1_m <= op1_e;
  op1_e <= op1_d;
  op1_d <= `SPC0.dec.ded1.decode_mux[31:0];

  inst0_string_w<=inst0_string_b;
  inst0_string_b<=inst0_string_m;
  inst0_string_m<=inst0_string_e;
  inst0_string_e<=inst0_string_d;
  inst0_string_d<=xlate(`SPC0.dec.ded0.decode_mux[31:0]);

  inst1_string_w<=inst1_string_b;
  inst1_string_b<=inst1_string_m;
  inst1_string_m<=inst1_string_e;
  inst1_string_e<=inst1_string_d;
  inst1_string_d<=xlate(`SPC0.dec.ded1.decode_mux[31:0]);

// instructions for each thread at pick
  inst0_string_p<=xlate(`SPC0.ifu_ibu.ibf0.buf0_in[31:0]);
  inst1_string_p<=xlate(`SPC0.ifu_ibu.ibf1.buf0_in[31:0]);
  inst2_string_p<=xlate(`SPC0.ifu_ibu.ibf2.buf0_in[31:0]);
  inst3_string_p<=xlate(`SPC0.ifu_ibu.ibf3.buf0_in[31:0]);
  inst4_string_p<=xlate(`SPC0.ifu_ibu.ibf4.buf0_in[31:0]);
  inst5_string_p<=xlate(`SPC0.ifu_ibu.ibf5.buf0_in[31:0]);
  inst6_string_p<=xlate(`SPC0.ifu_ibu.ibf6.buf0_in[31:0]);
  inst7_string_p<=xlate(`SPC0.ifu_ibu.ibf7.buf0_in[31:0]);

end //}

///////////////////////////////////////////////////////////////////////////////
// Functions 
///////////////////////////////////////////////////////////////////////////////
function [2:0] onehot2tid;
   input [7:0] onehot;

   begin

   if      (onehot[7:0]==8'b00000001) onehot2tid[2:0] = 3'b000;
   else if (onehot[7:0]==8'b00000010) onehot2tid[2:0] = 3'b001;
   else if (onehot[7:0]==8'b00000100) onehot2tid[2:0] = 3'b010;
   else if (onehot[7:0]==8'b00001000) onehot2tid[2:0] = 3'b011;
   else if (onehot[7:0]==8'b00010000) onehot2tid[2:0] = 3'b100;
   else if (onehot[7:0]==8'b00100000) onehot2tid[2:0] = 3'b101;
   else if (onehot[7:0]==8'b01000000) onehot2tid[2:0] = 3'b110;
   else if (onehot[7:0]==8'b10000000) onehot2tid[2:0] = 3'b111;
   
   end
endfunction

function [7:0] tid2onehot;
   input [2:0] tid;

   begin

   if      (tid[2:0]==3'b000) tid2onehot[7:0] = 8'b00000001;
   else if (tid[2:0]==3'b001) tid2onehot[7:0] = 8'b00000010;
   else if (tid[2:0]==3'b010) tid2onehot[7:0] = 8'b00000100;
   else if (tid[2:0]==3'b011) tid2onehot[7:0] = 8'b00001000;
   else if (tid[2:0]==3'b100) tid2onehot[7:0] = 8'b00010000;
   else if (tid[2:0]==3'b101) tid2onehot[7:0] = 8'b00100000;
   else if (tid[2:0]==3'b110) tid2onehot[7:0] = 8'b01000000;
   else if (tid[2:0]==3'b111) tid2onehot[7:0] = 8'b10000000;
   
   end
endfunction

//---------------------

function [255:0] xlate;
   input [31:0] inst;

   begin
     casex(inst[31:0])
32'b10xxxxx110100xxxxx001000011xxxxx : xlate[255:0]="FADDq";
32'b10xxxxx110100xxxxx001000111xxxxx : xlate[255:0]="FSUBq";
32'b10000xx110101xxxxx001010011xxxxx : xlate[255:0]="FCMPq";
32'b10000xx110101xxxxx001010111xxxxx : xlate[255:0]="FCMPEq";
32'b10xxxxx110100xxxxx011001101xxxxx : xlate[255:0]="FsTOq";
32'b10xxxxx110100xxxxx011001110xxxxx : xlate[255:0]="FdTOq";
32'b10xxxxx110100xxxxx010001100xxxxx : xlate[255:0]="FxTOq";
32'b10xxxxx110100xxxxx011001100xxxxx : xlate[255:0]="FiTOq";
32'b10xxxxx110100xxxxx000000011xxxxx : xlate[255:0]="FMOVq";
32'b10xxxxx110100xxxxx000000111xxxxx : xlate[255:0]="FNEGq";
32'b10xxxxx110100xxxxx000001011xxxxx : xlate[255:0]="FABSq";
32'b10xxxxx110100xxxxx001001011xxxxx : xlate[255:0]="FMULq";
32'b10xxxxx110100xxxxx001101110xxxxx : xlate[255:0]="FdMULq";
32'b10xxxxx110100xxxxx001001111xxxxx : xlate[255:0]="FDIVq";
32'b10xxxxx110100xxxxx000101011xxxxx : xlate[255:0]="FSQRTq";
32'b10xxxxx1101010xxxx0xx100111xxxxx : xlate[255:0]="FMOVrQa";
32'b10xxxxx1101010xxxx0x1x00111xxxxx : xlate[255:0]="FMOVrQb";
32'b10xxxxx110100xxxxx011010011xxxxx : xlate[255:0]="FqTOi";
32'b10xxxxx110100xxxxx010000011xxxxx : xlate[255:0]="FqTOx";
32'b10xxxxx110100xxxxx011000111xxxxx : xlate[255:0]="FqTOs";
32'b10xxxxx110100xxxxx011001011xxxxx : xlate[255:0]="FqTOd";
32'b11xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQF";
32'b11xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFi";
32'b11xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQFA";
32'b11xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFAi";
32'b11xxxxx100110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFi";
32'b11xxxxx100110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQF";
32'b11xxxxx110110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQFA";
32'b11xxxxx110110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFAi";
32'b10xxxxx1101010xxxxxxx000011xxxxx : xlate[255:0]="FMOVQcc";
32'b10xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADD";
32'b10xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDcc";
32'b10xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDC";
32'b10xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDCcc";
32'b10xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDi";
32'b10xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDcci";
32'b10xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCi";
32'b10xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCcci";
32'b00x0xx1011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr1";
32'b00x0x1x011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr2";
32'b00xx000110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfccA";
32'b00xx1xx110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc1";
32'b00xxx1x110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc2";
32'b00xxxx1110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc3";
32'b00xx000101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfccA";
32'b00xx1xx101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc1";
32'b00xxx1x101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc2";
32'b00xxxx1101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc3";
32'b00xx000010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BiccA";
32'b00xx1xx010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc1";
32'b00xxx1x010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc2";
32'b00xxxx1010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc3";
32'b00xx000001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPccA";
32'b00xx1xx001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc1";
32'b00xxx1x001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc2";
32'b00xxxx1001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc3";
32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="CALL";
32'b11xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASA";
32'b11xxxxx111110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASXA";
32'b11xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASAi";
32'b11xxxxx111110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASXAi";
32'b10xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIV";
32'b10xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIV";
32'b10xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVcc";
32'b10xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVcc";
32'b10xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVi";
32'b10xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVi";
32'b10xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVcci";
32'b10xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVcci";
32'b1000000111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="DONE";
32'b1000001111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RETRY";
32'b10xxxxx110100xxxxx001000001xxxxx : xlate[255:0]="FADDs";
32'b10xxxxx110100xxxxx001000010xxxxx : xlate[255:0]="FADDd";
32'b10xxxxx110100xxxxx001000101xxxxx : xlate[255:0]="FSUBs";
32'b10xxxxx110100xxxxx001000110xxxxx : xlate[255:0]="FSUBd";
32'b10000xx110101xxxxx001010001xxxxx : xlate[255:0]="FCMPs";
32'b10000xx110101xxxxx001010010xxxxx : xlate[255:0]="FCMPd";
32'b10000xx110101xxxxx001010101xxxxx : xlate[255:0]="FCMPEs";
32'b10000xx110101xxxxx001010110xxxxx : xlate[255:0]="FCMPEd";
32'b10xxxxx110100xxxxx010000001xxxxx : xlate[255:0]="FsTOx";
32'b10xxxxx110100xxxxx010000010xxxxx : xlate[255:0]="FdTOx";
32'b10xxxxx110100xxxxx011010001xxxxx : xlate[255:0]="FsTOi";
32'b10xxxxx110100xxxxx011010010xxxxx : xlate[255:0]="FdTOi";
32'b10xxxxx110100xxxxx011001001xxxxx : xlate[255:0]="FsTOd";
32'b10xxxxx110100xxxxx011000110xxxxx : xlate[255:0]="FdTOs";
32'b10xxxxx110100xxxxx010000100xxxxx : xlate[255:0]="FxTOs";
32'b10xxxxx110100xxxxx010001000xxxxx : xlate[255:0]="FxTOd";
32'b10xxxxx110100xxxxx011000100xxxxx : xlate[255:0]="FiTOs";
32'b10xxxxx110100xxxxx011001000xxxxx : xlate[255:0]="FiTOd";
32'b10xxxxx110100xxxxx000000001xxxxx : xlate[255:0]="FMOVs";
32'b10xxxxx110100xxxxx000000010xxxxx : xlate[255:0]="FMOVd";
32'b10xxxxx110100xxxxx000000101xxxxx : xlate[255:0]="FNEGs";
32'b10xxxxx110100xxxxx000000110xxxxx : xlate[255:0]="FNEGd";
32'b10xxxxx110100xxxxx000001001xxxxx : xlate[255:0]="FABSs";
32'b10xxxxx110100xxxxx000001010xxxxx : xlate[255:0]="FABSd";
32'b10xxxxx110100xxxxx001001001xxxxx : xlate[255:0]="FMULs";
32'b10xxxxx110100xxxxx001001010xxxxx : xlate[255:0]="FMULd";
32'b10xxxxx110100xxxxx001101001xxxxx : xlate[255:0]="FsMULd";
32'b10xxxxx110100xxxxx001001101xxxxx : xlate[255:0]="FDIVs";
32'b10xxxxx110100xxxxx001001110xxxxx : xlate[255:0]="FDIVd";
32'b10xxxxx110100xxxxx000101001xxxxx : xlate[255:0]="FSQRTs";
32'b10xxxxx110100xxxxx000101010xxxxx : xlate[255:0]="FSQRTd";
32'b10xxxxx111011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSH";
32'b10xxxxx111011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="FLUSHi";
32'b10xxxxx101011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSHw";
32'b10xxxxx111000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="JMPL";
32'b10xxxxx111000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="JMPLi";
32'b11xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDF";
32'b11xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDF";
32'b1100000100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFSR";
32'b1100001100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXFSR";
32'b11xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFi";
32'b11xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFi";
32'b1100000100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFSRi";
32'b1100001100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXFSRi";
32'b11xxxxx110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFA";
32'b11xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDFA";
32'b11xxxxx110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFAi";
32'b11xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFAi";
32'b11xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSB";
32'b11xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSH";
32'b11xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSW";
32'b11xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUB";
32'b11xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUH";
32'b11xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUW";
32'b11xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDX";
32'b11xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDD";
32'b11xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBi";
32'b11xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHi";
32'b11xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWi";
32'b11xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBi";
32'b11xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHi";
32'b11xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWi";
32'b11xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXi";
32'b11xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDi";
32'b11xxxxx011001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSBA";
32'b11xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSHA";
32'b11xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSWA";
32'b11xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUBA";
32'b11xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUHA";
32'b11xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUWA";
32'b11xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXA";
32'b11xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDA";
32'b11xxxxx011001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBAi";
32'b11xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHAi";
32'b11xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWAi";
32'b11xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBAi";
32'b11xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHAi";
32'b11xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWAi";
32'b11xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXAi";
32'b11xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDAi";
32'b11xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUB";
32'b11xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBi";
32'b11xxxxx011101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUBA";
32'b11xxxxx011101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBAi";
32'b10xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="AND";
32'b10xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDcc";
32'b10xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDN";
32'b10xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDNcc";
32'b10xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="OR";
32'b10xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORcc";
32'b10xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORN";
32'b10xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORNcc";
32'b10xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XOR";
32'b10xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XORcc";
32'b10xxxxx000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNOR";
32'b10xxxxx010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNORcc";
32'b10xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDi";
32'b10xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDcci";
32'b10xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNi";
32'b10xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNcci";
32'b10xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORi";
32'b10xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORcci";
32'b10xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNi";
32'b10xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNcci";
32'b10xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORi";
32'b10xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORcci";
32'b10xxxxx000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORi";
32'b10xxxxx010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORcci";
32'b1000000101000011111xxxxxxxxxxxxx : xlate[255:0]="MEMBAR";
32'b1000000101000011110xxxxxxxxxxxxx : xlate[255:0]="STBAR";
32'b10xxxxx101000000000xxxxxxxxxxxxx : xlate[255:0]="RDY";
32'b10xxxxx101000000100xxxxxxxxxxxxx : xlate[255:0]="RDCCR";
32'b10xxxxx101000000110xxxxxxxxxxxxx : xlate[255:0]="RDASI";
32'b10xxxxx101000001000xxxxxxxxxxxxx : xlate[255:0]="RDTICK";
32'b10xxxxx101000001010xxxxxxxxxxxxx : xlate[255:0]="RDPC";
32'b10xxxxx101000001100xxxxxxxxxxxxx : xlate[255:0]="RDFPRS";
32'b10xxxxx101000100110xxxxxxxxxxxxx : xlate[255:0]="RDGSR";
32'b10xxxxx101000100000xxxxxxxxxxxxx : xlate[255:0]="RDPCR";
32'b10xxxxx101000100010xxxxxxxxxxxxx : xlate[255:0]="RDPIC";
32'b10xxxxx1101010xxxx0xx000001xxxxx : xlate[255:0]="FMOVSfcc";
32'b10xxxxx1101010xxxx1xx000001xxxxx : xlate[255:0]="FMOVSxcc";
32'b10xxxxx1101010xxxx0xx000010xxxxx : xlate[255:0]="FMOVDfcc";
32'b10xxxxx1101010xxxx1xx000010xxxxx : xlate[255:0]="FMOVDxcc";
32'b10xxxxx110101xxxxx0xx100101xxxxx : xlate[255:0]="FMOVrS1";
32'b10xxxxx110101xxxxx0x1x00101xxxxx : xlate[255:0]="FMOVrS2";
32'b10xxxxx110101xxxxx0xx100110xxxxx : xlate[255:0]="FMOVrD1";
32'b10xxxxx110101xxxxx0x1x00110xxxxx : xlate[255:0]="FMOVrD2";
32'b10xxxxx1011001xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVxcc";
32'b10xxxxx1011001xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVxcci";
32'b10xxxxx1011000xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVfcc";
32'b10xxxxx1011000xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVfcci";
32'b10xxxxx101111xxxxx0xx1xxxxxxxxxx : xlate[255:0]="MOVR1";
32'b10xxxxx101111xxxxx0x1xxxxxxxxxxx : xlate[255:0]="MOVR2";
32'b10xxxxx101111xxxxx1xx1xxxxxxxxxx : xlate[255:0]="MOVRi1";
32'b10xxxxx101111xxxxx1x1xxxxxxxxxxx : xlate[255:0]="MOVRi2";
32'b10xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULX";
32'b10xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVX";
32'b10xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVX";
32'b10xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULXi";
32'b10xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVXi";
32'b10xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVXi";
32'b10xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMUL";
32'b10xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMUL";
32'b10xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMULcc";
32'b10xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMULcc";
32'b10xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULi";
32'b10xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULi";
32'b10xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULcci";
32'b10xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULcci";
32'b10xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULScc";
32'b10xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULScci";
32'b10xxxxx101110000000xxxxxxxxxxxxx : xlate[255:0]="POPC";
32'b10xxxxx101110000001xxxxxxxxxxxxx : xlate[255:0]="POPCi";
32'b11xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCH";
32'b11xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHi";
32'b11xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCHA";
32'b11xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHAi";
32'b10xxxxx101010xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDPR";
32'b10xxxxx101001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDHPR";
32'b10xxxxx111001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RETURN";
32'b10xxxxx111001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RETURNi";
32'b10xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SAVE";
32'b10xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SAVEi";
32'b10xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RESTORE";
32'b10xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RESTOREi";
32'b1000000110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="SAVED";
32'b1000001110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RESTORED";
32'b00xxxxx100xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="SETHI";
32'b10xxxxx100101xxxxx00xxxxxxxxxxxx : xlate[255:0]="SLL";
32'b10xxxxx100110xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRL";
32'b10xxxxx100111xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRA";
32'b10xxxxx100101xxxxx01xxxxxxxxxxxx : xlate[255:0]="SLLX";
32'b10xxxxx100110xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRLX";
32'b10xxxxx100111xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRAX";
32'b10xxxxx100101xxxxx10xxxxxxxxxxxx : xlate[255:0]="SLLi";
32'b10xxxxx100110xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRLi";
32'b10xxxxx100111xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRAi";
32'b10xxxxx100101xxxxx11xxxxxxxxxxxx : xlate[255:0]="SLLXi";
32'b10xxxxx100110xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRLXi";
32'b10xxxxx100111xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRAXi";
32'b11xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STF";
32'b11xxxxx100111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDF";
32'b1100000100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFSR";
32'b1100001100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXFSR";
32'b11xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFi";
32'b11xxxxx100111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFi";
32'b1100000100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFSRi";
32'b1100001100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXFSRi";
32'b11xxxxx110100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFA";
32'b11xxxxx110111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDFA";
32'b11xxxxx110100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFAi";
32'b11xxxxx110111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFAi";
32'b11xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STB";
32'b11xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STH";
32'b11xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STW";
32'b11xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STX";
32'b11xxxx0000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STD";
32'b11xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBi";
32'b11xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHi";
32'b11xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWi";
32'b11xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXi";
32'b11xxxx0000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDi";
32'b11xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STBA";
32'b11xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STHA";
32'b11xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STWA";
32'b11xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXA";
32'b11xxxx0010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDA";
32'b11xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBAi";
32'b11xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHAi";
32'b11xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWAi";
32'b11xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXAi";
32'b11xxxx0010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDAi";
32'b10xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUB";
32'b10xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBcc";
32'b10xxxxx001100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBC";
32'b10xxxxx011100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBCcc";
32'b10xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBi";
32'b10xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBcci";
32'b10xxxxx001100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCi";
32'b10xxxxx011100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCcci";
32'b11xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAP";
32'b11xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPi";
32'b11xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAPA";
32'b11xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPAi";
32'b10xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDcc";
32'b10xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDccTV";
32'b10xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDcci";
32'b10xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDccTVi";
32'b10xxxxx100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBcc";
32'b10xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBccTV";
32'b10xxxxx100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBcci";
32'b10xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBccTVi";
32'b10xxxxx111010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TCC";
32'b10xxxxx111010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TCCi";
32'b10xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPR";
32'b10xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPRi";
32'b10xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRHPR";
32'b10xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRHPRi";
32'b1000000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRY";
32'b1000010110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRCCR";
32'b1000011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRASI";
32'b1000110110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRFPRS";
32'b1010011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRGSR";
32'b1010000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPCR";
32'b1010001110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPIC";
32'b1000000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRYi";
32'b1000010110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRCCRi";
32'b1000011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRASIi";
32'b1000110110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRFPRSi";
32'b1010011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRGSRi";
32'b1010000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPCRi";
32'b1010001110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPICi";
32'b1001111110000000001xxxxxxxxxxxxx : xlate[255:0]="SIR";
32'b10xxxxx110110xxxxx001010000xxxxx : xlate[255:0]="FPADD16";
32'b10xxxxx110110xxxxx001010001xxxxx : xlate[255:0]="FPADD16S";
32'b10xxxxx110110xxxxx001010010xxxxx : xlate[255:0]="FPADD32";
32'b10xxxxx110110xxxxx001010011xxxxx : xlate[255:0]="FPADD32S";
32'b10xxxxx110110xxxxx001010100xxxxx : xlate[255:0]="FPSUB16";
32'b10xxxxx110110xxxxx001010101xxxxx : xlate[255:0]="FPSUB16S";
32'b10xxxxx110110xxxxx001010110xxxxx : xlate[255:0]="FPSUB32";
32'b10xxxxx110110xxxxx001010111xxxxx : xlate[255:0]="FPSUB32S";
32'b10xxxxx110110xxxxx000111011xxxxx : xlate[255:0]="FPACK16";
32'b10xxxxx110110xxxxx000111010xxxxx : xlate[255:0]="FPACK32";
32'b10xxxxx110110xxxxx000111101xxxxx : xlate[255:0]="FPACKFIX";
32'b10xxxxx110110xxxxx001001101xxxxx : xlate[255:0]="FEXPAND";
32'b10xxxxx110110xxxxx001001011xxxxx : xlate[255:0]="FPMERGE";
32'b10xxxxx110110xxxxx000110001xxxxx : xlate[255:0]="FMUL8x16";
32'b10xxxxx110110xxxxx000110011xxxxx : xlate[255:0]="FMUL8x16AU";
32'b10xxxxx110110xxxxx000110101xxxxx : xlate[255:0]="FMUL8x16AL";
32'b10xxxxx110110xxxxx000110110xxxxx : xlate[255:0]="FMUL8SUx16";
32'b10xxxxx110110xxxxx000110111xxxxx : xlate[255:0]="FMUL8ULx16";
32'b10xxxxx110110xxxxx000111000xxxxx : xlate[255:0]="FMULD8SUx16";
32'b10xxxxx110110xxxxx000111001xxxxx : xlate[255:0]="FMULD8ULx16";
32'b10xxxxx110110xxxxx000011000xxxxx : xlate[255:0]="ALIGNADDRESS";
32'b10xxxxx110110xxxxx000011010xxxxx : xlate[255:0]="ALIGNADDRESS_LITTLE";
32'b10xxxxx110110xxxxx000011001xxxxx : xlate[255:0]="BMASK";
32'b10xxxxx110110xxxxx001001000xxxxx : xlate[255:0]="FALIGNDATA";
32'b10xxxxx110110xxxxx001001100xxxxx : xlate[255:0]="BSHUFFLE";
32'b10xxxxx110110xxxxx001100000xxxxx : xlate[255:0]="FZERO";
32'b10xxxxx110110xxxxx001100001xxxxx : xlate[255:0]="FZEROS";
32'b10xxxxx110110xxxxx001111110xxxxx : xlate[255:0]="FONE";
32'b10xxxxx110110xxxxx001111111xxxxx : xlate[255:0]="FONES";
32'b10xxxxx110110xxxxx001110100xxxxx : xlate[255:0]="FSRC1";
32'b10xxxxx110110xxxxx001110101xxxxx : xlate[255:0]="FSRC1S";
32'b10xxxxx110110xxxxx001111000xxxxx : xlate[255:0]="FSRC2";
32'b10xxxxx110110xxxxx001111001xxxxx : xlate[255:0]="FSRC2S";
32'b10xxxxx110110xxxxx001101010xxxxx : xlate[255:0]="FNOT1";
32'b10xxxxx110110xxxxx001101011xxxxx : xlate[255:0]="FNOT1S";
32'b10xxxxx110110xxxxx001100110xxxxx : xlate[255:0]="FNOT2";
32'b10xxxxx110110xxxxx001100111xxxxx : xlate[255:0]="FNOT2S";
32'b10xxxxx110110xxxxx001111100xxxxx : xlate[255:0]="FOR";
32'b10xxxxx110110xxxxx001111101xxxxx : xlate[255:0]="FORS";
32'b10xxxxx110110xxxxx001100010xxxxx : xlate[255:0]="FNOR";
32'b10xxxxx110110xxxxx001100011xxxxx : xlate[255:0]="FNORS";
32'b10xxxxx110110xxxxx001110000xxxxx : xlate[255:0]="FAND";
32'b10xxxxx110110xxxxx001110001xxxxx : xlate[255:0]="FANDS";
32'b10xxxxx110110xxxxx001101110xxxxx : xlate[255:0]="FNAND";
32'b10xxxxx110110xxxxx001101111xxxxx : xlate[255:0]="FNANDS";
32'b10xxxxx110110xxxxx001101100xxxxx : xlate[255:0]="FXOR";
32'b10xxxxx110110xxxxx001101101xxxxx : xlate[255:0]="FXORS";
32'b10xxxxx110110xxxxx001110010xxxxx : xlate[255:0]="FXNOR";
32'b10xxxxx110110xxxxx001110011xxxxx : xlate[255:0]="FXNORS";
32'b10xxxxx110110xxxxx001111010xxxxx : xlate[255:0]="FORNOT1";
32'b10xxxxx110110xxxxx001111011xxxxx : xlate[255:0]="FORNOT1S";
32'b10xxxxx110110xxxxx001110110xxxxx : xlate[255:0]="FORNOT2";
32'b10xxxxx110110xxxxx001110111xxxxx : xlate[255:0]="FORNOT2S";
32'b10xxxxx110110xxxxx001101000xxxxx : xlate[255:0]="FANDNOT1";
32'b10xxxxx110110xxxxx001101001xxxxx : xlate[255:0]="FANDNOT1S";
32'b10xxxxx110110xxxxx001100100xxxxx : xlate[255:0]="FANDNOT2";
32'b10xxxxx110110xxxxx001100101xxxxx : xlate[255:0]="FANDNOT2S";
32'b10xxxxx110110xxxxx000101000xxxxx : xlate[255:0]="FCMPGT16";
32'b10xxxxx110110xxxxx000101100xxxxx : xlate[255:0]="FCMPGT32";
32'b10xxxxx110110xxxxx000100000xxxxx : xlate[255:0]="FCMPLE16";
32'b10xxxxx110110xxxxx000100100xxxxx : xlate[255:0]="FCMPLE32";
32'b10xxxxx110110xxxxx000100010xxxxx : xlate[255:0]="FCMPNE16";
32'b10xxxxx110110xxxxx000100110xxxxx : xlate[255:0]="FCMPNE32";
32'b10xxxxx110110xxxxx000101010xxxxx : xlate[255:0]="FCMPEQ16";
32'b10xxxxx110110xxxxx000101110xxxxx : xlate[255:0]="FCMPEQ32";
32'b10xxxxx110110xxxxx000111110xxxxx : xlate[255:0]="PDIST";
32'b10xxxxx110110xxxxx000000000xxxxx : xlate[255:0]="EDGE8";
32'b10xxxxx110110xxxxx000000001xxxxx : xlate[255:0]="EDGE8N";
32'b10xxxxx110110xxxxx000000010xxxxx : xlate[255:0]="EDGE8L";
32'b10xxxxx110110xxxxx000000011xxxxx : xlate[255:0]="EDGE8LN";
32'b10xxxxx110110xxxxx000000100xxxxx : xlate[255:0]="EDGE16";
32'b10xxxxx110110xxxxx000000101xxxxx : xlate[255:0]="EDGE16N";
32'b10xxxxx110110xxxxx000000110xxxxx : xlate[255:0]="EDGE16L";
32'b10xxxxx110110xxxxx000000111xxxxx : xlate[255:0]="EDGE16LN";
32'b10xxxxx110110xxxxx000001000xxxxx : xlate[255:0]="EDGE32";
32'b10xxxxx110110xxxxx000001001xxxxx : xlate[255:0]="EDGE32N";
32'b10xxxxx110110xxxxx000001010xxxxx : xlate[255:0]="EDGE32L";
32'b10xxxxx110110xxxxx000001011xxxxx : xlate[255:0]="EDGE32LN";
32'b10xxxxx110110xxxxx000010000xxxxx : xlate[255:0]="ARRAY8";
32'b10xxxxx110110xxxxx000010010xxxxx : xlate[255:0]="ARRAY16";
32'b10xxxxx110110xxxxx000010100xxxxx : xlate[255:0]="ARRAY32";
32'b10xxxxx110110xxxxx010000001xxxxx : xlate[255:0]="SIAM";
       default : xlate[255:0]="unknown";
    endcase   
   end
endfunction // xlate


`endif
   
endmodule

`endif


`ifdef CORE_1

module nas_probes1;


`ifdef GATESIM


`else
   reg [7:0] ex_valid_m;
   reg [7:0] ex_valid_b;
   reg [7:0] ex_valid_w;
   reg [7:0] return_f4;
   reg [2:0] ex0_tid_m;
   reg [2:0] ex1_tid_m;
   reg [2:0] ex0_tid_b;
   reg [2:0] ex1_tid_b;
   reg [2:0] ex0_tid_w;
   reg [2:0] ex1_tid_w;
   reg       fgu_valid_fb0;
   reg       fgu_valid_fb1;

   reg [31:0] inst0_e;
   reg [31:0] inst1_e;

   reg [7:0] fg_valid;

   reg fcc_valid_f4;
   reg fcc_valid_f5;
   reg fcc_valid_fb;

   reg fgu0_e;
   reg fgu1_e;
   reg lsu0_e;
   reg lsu1_e;

   reg [1:0] dcd_idest_e;
   reg [1:0] dcd_fdest_e;

   wire [7:0] ex_valid;
   wire [7:0] exception_w;

   wire [7:0] imul_valid;

   wire       fg_cond_fb;

   wire        exu_lsu_valid;
   wire [47:0] exu_lsu_addr;
   wire [31:0] exu_lsu_instr;
   wire [2:0]  exu_lsu_tid;
   wire [4:0]  exu_lsu_regid;
   wire [63:0] exu_lsu_data;

   wire [2:0] ex0_tid_e;
   wire [2:0] ex1_tid_e;
   wire       ex0_valid_e;
   wire       ex1_valid_e;
   wire [7:0] ex_asr_access;
   wire       ex_asr_valid;

   wire [7:0] lsu_valid;
   wire [2:0] lsu_tid;
   wire [7:0] lsu_tid_dec_b;
   wire       lsu_ld_valid;
   reg  [7:0] lsu_data_w;
   wire [7:0] lsu_data_b;

   wire ld_inst_d;

   reg [7:0] div_idest;
   reg [7:0] div_fdest;
   
   reg load0_e;
   reg load1_e;

   reg load_m;
   reg load_b;

   reg [2:0] lsu_tid_m;
   reg [7:0] lsu_complete_m;
   reg [7:0] lsu_complete_b;
   reg [7:0] lsu_trap_flush_d;	//reqd. for store buffer ue testing

   reg [7:0] ex_flush_w;
   reg [7:0] ex_flush_b;

   reg sel_divide0_e;
   reg sel_divide1_e;

   wire dec_flush_lb;

   wire [7:0] fgu_idiv_valid;

   wire [7:0] fgu_fdiv_valid;
   
   wire [7:0] fg_div_valid;

   wire       lsu_valid_b;

   wire [7:0] return_w;
   wire       return0;
   wire       return1;
   wire [7:0] real_exception;

   reg  [2:0] lsu_tid_b;
   reg        fmov_valid_fb;
   reg        fmov_valid_f5;
   reg        fmov_valid_f4;
   reg        fmov_valid_f3;
   reg        fmov_valid_f2;
   reg        fmov_valid_m;
   reg        fmov_valid_e;

   reg        fg_flush_fb;
   reg        fg_flush_f5;
   reg        fg_flush_f4;
   reg        fg_flush_f3;
   reg        fg_flush_f2;

   reg       siam0_d;   
   reg       siam1_d;   

   reg       done0_d;
   reg       done1_d;
   reg       retry0_d;
   reg       retry1_d;
   reg       done0_e;
   reg       done1_e;
   reg       retry0_e;
   reg       retry1_e;
   reg       tlu_ccr_cwp_0_valid_last;
   reg       tlu_ccr_cwp_1_valid_last;
   reg [7:0] fg_fdiv_valid_fw;
   reg [7:0] asi_in_progress_b;
   reg [7:0] asi_in_progress_w;
   reg [7:0] asi_in_progress_fx4;
   reg [7:0] tlu_valid;
   reg [7:0] sync_reset_w;
            
   reg [7:0] div_special_cancel_f4;

   reg       asi_store_b;
   reg       asi_store_w;
   reg [2:0] dcc_tid_b;
   reg [2:0] dcc_tid_w;
   reg [7:0] asi_valid_w;
   reg [7:0] asi_valid_fx4;
   reg [7:0] asi_valid_fx5;

   reg [7:0] lsu_state;
   reg [7:0] lsu_check;
   reg [2:0] lsu_tid_e;

   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;

   reg fgu_err_fx3; 
   reg fgu_err_fx4; 
   reg fgu_err_fx5; 
   reg fgu_err_fb; 

   reg clkstop_d1;
   reg clkstop_d2;
   reg clkstop_d3;
   reg clkstop_d4;
   reg clkstop_d5;

integer i;
integer start_dmiss0;
integer start_dmiss1;
integer start_dmiss2;
integer start_dmiss3;
integer start_dmiss4;
integer start_dmiss5;
integer start_dmiss6;
integer start_dmiss7;
integer number_dmiss;
integer start_imiss0;
integer start_imiss1;
integer start_imiss2;
integer start_imiss3;
integer start_imiss4;
integer start_imiss5;
integer start_imiss6;
integer start_imiss7;
integer active_imiss0;
integer active_imiss1;
integer active_imiss2;
integer active_imiss3;
integer active_imiss4;
integer active_imiss5;
integer active_imiss6;
integer active_imiss7;
integer first_imiss0;
integer first_imiss1;
integer first_imiss2;
integer first_imiss3;
integer first_imiss4;
integer first_imiss5;
integer first_imiss6;
integer first_imiss7;
integer number_imiss;
integer clock;
integer sum_dmiss_latency;
integer sum_imiss_latency;
reg spec_dmiss;
integer dmiss_cnt;
integer imiss_cnt;
reg pcx_req;
integer l15dmiss_cnt;
integer l15imiss_cnt;


initial begin // {
    pcx_req=0;
    l15imiss_cnt=0;
    l15dmiss_cnt=0;
    imiss_cnt=0;
    dmiss_cnt=0;
    clock=0;
    start_dmiss0=0;
    start_dmiss1=0;
    start_dmiss2=0;
    start_dmiss3=0;
    start_dmiss4=0;
    start_dmiss5=0;
    start_dmiss6=0;
    start_dmiss7=0;
    number_dmiss=0;
    start_imiss0=0;
    start_imiss1=0;
    start_imiss2=0;
    start_imiss3=0;
    start_imiss4=0;
    start_imiss5=0;
    start_imiss6=0;
    start_imiss7=0;
    active_imiss0=0;
    active_imiss1=0;
    active_imiss2=0;
    active_imiss3=0;
    active_imiss4=0;
    active_imiss5=0;
    active_imiss6=0;
    active_imiss7=0;
    first_imiss0=0;
    first_imiss1=0;
    first_imiss2=0;
    first_imiss3=0;
    first_imiss4=0;
    first_imiss5=0;
    first_imiss6=0;
    first_imiss7=0;
    number_imiss=0;
    sum_dmiss_latency=0;
    sum_imiss_latency=0;
    asi_in_progress_b <= 8'h0;
    asi_in_progress_w <= 8'h0;
    asi_in_progress_fx4 <= 8'h0;
    tlu_valid <= 8'h0;
    div_idest <= 8'h0;
    div_fdest <= 8'h0;
    lsu_state <= 8'h0;
    clkstop_d1 <=0;
    clkstop_d2 <=0;
    clkstop_d3 <=0;
    clkstop_d4 <=0;
    clkstop_d5 <=0;

end //}

wire [7:0] asi_store_flush_w =  {`SPC1.lsu.sbs7.flush_st_w,
                                 `SPC1.lsu.sbs6.flush_st_w,
                                 `SPC1.lsu.sbs5.flush_st_w,
                                 `SPC1.lsu.sbs4.flush_st_w,
                                 `SPC1.lsu.sbs3.flush_st_w,
                                 `SPC1.lsu.sbs2.flush_st_w,
                                 `SPC1.lsu.sbs1.flush_st_w,
                                 `SPC1.lsu.sbs0.flush_st_w};

wire [7:0] store_sync = {`SPC1.lsu.sbs7.trap_sync,
                         `SPC1.lsu.sbs6.trap_sync,
                         `SPC1.lsu.sbs5.trap_sync,
                         `SPC1.lsu.sbs4.trap_sync,
                         `SPC1.lsu.sbs3.trap_sync,
                         `SPC1.lsu.sbs2.trap_sync,
                         `SPC1.lsu.sbs1.trap_sync,
                         `SPC1.lsu.sbs0.trap_sync};
wire [7:0] sync_reset = {`SPC1.lsu.sbs7.sync_state_rst,
                         `SPC1.lsu.sbs6.sync_state_rst,
                         `SPC1.lsu.sbs5.sync_state_rst,
                         `SPC1.lsu.sbs4.sync_state_rst,
                         `SPC1.lsu.sbs3.sync_state_rst,
                         `SPC1.lsu.sbs2.sync_state_rst,
                         `SPC1.lsu.sbs1.sync_state_rst,
                         `SPC1.lsu.sbs0.sync_state_rst};

//--------------------
// Used in nas_pipe for TSB Config Regs Capture/Compare
// ADD_TSB_CFG

// NOTE - ADD_TSB_CFG will never be used for Axis or Tharas
`ifndef EMUL
wire [63:0] ctxt_z_tsb_cfg0_reg [7:0];  // 1 per thread
wire [63:0] ctxt_z_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg3_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg0_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg3_reg [7:0];

// There are 32 entries in each MMU MRA but not all are needed.
// Indexing:
// Bits 4:3 of the address are the lower two bits of the TID
// Bits 2:0 of the address select the register as below
//   mmu.mra0.array.mem for T0-T3
//   mmu.mra1.array.mem for T4-T7
// (this is documented in mmu_asi_ctl.sv)
//		z TSB cfg 0,1				address 0
//		z TSB cfg 2,3				address 1
//		nz TSB cfg 0,1				address 2
//		nz TSB cfg 2,3				address 3
//		Real range, physical offset pair 0	address 4
//		Real range, physical offset pair 1	address 5
//		Real range, physical offset pair 2	address 6
//		Real range, physical offset pair 3	address 7

wire [83:0] mmu_mra0_a0 = `SPC1.mmu.mra0.array.mem[0];
wire [83:0] mmu_mra0_a8 = `SPC1.mmu.mra0.array.mem[8];
wire [83:0] mmu_mra0_a16 = `SPC1.mmu.mra0.array.mem[16];
wire [83:0] mmu_mra0_a24 = `SPC1.mmu.mra0.array.mem[24];
wire [83:0] mmu_mra0_a1 = `SPC1.mmu.mra0.array.mem[1];
wire [83:0] mmu_mra0_a9 = `SPC1.mmu.mra0.array.mem[9];
wire [83:0] mmu_mra0_a17 = `SPC1.mmu.mra0.array.mem[17];
wire [83:0] mmu_mra0_a25 = `SPC1.mmu.mra0.array.mem[25];
wire [83:0] mmu_mra0_a2 = `SPC1.mmu.mra0.array.mem[2];
wire [83:0] mmu_mra0_a10 = `SPC1.mmu.mra0.array.mem[10];
wire [83:0] mmu_mra0_a18 = `SPC1.mmu.mra0.array.mem[18];
wire [83:0] mmu_mra0_a26 = `SPC1.mmu.mra0.array.mem[26];
wire [83:0] mmu_mra0_a3 = `SPC1.mmu.mra0.array.mem[3];
wire [83:0] mmu_mra0_a11 = `SPC1.mmu.mra0.array.mem[11];
wire [83:0] mmu_mra0_a19 = `SPC1.mmu.mra0.array.mem[19];
wire [83:0] mmu_mra0_a27 = `SPC1.mmu.mra0.array.mem[27];
wire [83:0] mmu_mra1_a0 = `SPC1.mmu.mra1.array.mem[0];
wire [83:0] mmu_mra1_a8 = `SPC1.mmu.mra1.array.mem[8];
wire [83:0] mmu_mra1_a16 = `SPC1.mmu.mra1.array.mem[16];
wire [83:0] mmu_mra1_a24 = `SPC1.mmu.mra1.array.mem[24];
wire [83:0] mmu_mra1_a1 = `SPC1.mmu.mra1.array.mem[1];
wire [83:0] mmu_mra1_a9 = `SPC1.mmu.mra1.array.mem[9];
wire [83:0] mmu_mra1_a17 = `SPC1.mmu.mra1.array.mem[17];
wire [83:0] mmu_mra1_a25 = `SPC1.mmu.mra1.array.mem[25];
wire [83:0] mmu_mra1_a2 = `SPC1.mmu.mra1.array.mem[2];
wire [83:0] mmu_mra1_a10 = `SPC1.mmu.mra1.array.mem[10];
wire [83:0] mmu_mra1_a18 = `SPC1.mmu.mra1.array.mem[18];
wire [83:0] mmu_mra1_a26 = `SPC1.mmu.mra1.array.mem[26];
wire [83:0] mmu_mra1_a3 = `SPC1.mmu.mra1.array.mem[3];
wire [83:0] mmu_mra1_a11 = `SPC1.mmu.mra1.array.mem[11];
wire [83:0] mmu_mra1_a19 = `SPC1.mmu.mra1.array.mem[19];
wire [83:0] mmu_mra1_a27 = `SPC1.mmu.mra1.array.mem[27];


// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[0] = {`SPC1.mmu.asi.t0_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[0]  = {`SPC1.mmu.asi.t0_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[0]  = {`SPC1.mmu.asi.t0_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[0]  = {`SPC1.mmu.asi.t0_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[0] = {`SPC1.mmu.asi.t0_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[0] = {`SPC1.mmu.asi.t0_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[0] = {`SPC1.mmu.asi.t0_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[0] = {`SPC1.mmu.asi.t0_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[1] = {`SPC1.mmu.asi.t1_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[1]  = {`SPC1.mmu.asi.t1_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[1]  = {`SPC1.mmu.asi.t1_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[1]  = {`SPC1.mmu.asi.t1_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[1] = {`SPC1.mmu.asi.t1_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[1] = {`SPC1.mmu.asi.t1_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[1] = {`SPC1.mmu.asi.t1_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[1] = {`SPC1.mmu.asi.t1_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[2] = {`SPC1.mmu.asi.t2_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[2]  = {`SPC1.mmu.asi.t2_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[2]  = {`SPC1.mmu.asi.t2_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[2]  = {`SPC1.mmu.asi.t2_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[2] = {`SPC1.mmu.asi.t2_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[2] = {`SPC1.mmu.asi.t2_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[2] = {`SPC1.mmu.asi.t2_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[2] = {`SPC1.mmu.asi.t2_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[3] = {`SPC1.mmu.asi.t3_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[3]  = {`SPC1.mmu.asi.t3_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[3]  = {`SPC1.mmu.asi.t3_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[3]  = {`SPC1.mmu.asi.t3_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[3] = {`SPC1.mmu.asi.t3_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[3] = {`SPC1.mmu.asi.t3_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[3] = {`SPC1.mmu.asi.t3_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[3] = {`SPC1.mmu.asi.t3_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[4] = {`SPC1.mmu.asi.t4_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[4]  = {`SPC1.mmu.asi.t4_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[4]  = {`SPC1.mmu.asi.t4_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[4]  = {`SPC1.mmu.asi.t4_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[4] = {`SPC1.mmu.asi.t4_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[4] = {`SPC1.mmu.asi.t4_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[4] = {`SPC1.mmu.asi.t4_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[4] = {`SPC1.mmu.asi.t4_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[5] = {`SPC1.mmu.asi.t5_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[5]  = {`SPC1.mmu.asi.t5_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[5]  = {`SPC1.mmu.asi.t5_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[5]  = {`SPC1.mmu.asi.t5_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[5] = {`SPC1.mmu.asi.t5_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[5] = {`SPC1.mmu.asi.t5_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[5] = {`SPC1.mmu.asi.t5_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[5] = {`SPC1.mmu.asi.t5_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[6] = {`SPC1.mmu.asi.t6_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[6]  = {`SPC1.mmu.asi.t6_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[6]  = {`SPC1.mmu.asi.t6_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[6]  = {`SPC1.mmu.asi.t6_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[6] = {`SPC1.mmu.asi.t6_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[6] = {`SPC1.mmu.asi.t6_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[6] = {`SPC1.mmu.asi.t6_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[6] = {`SPC1.mmu.asi.t6_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[7] = {`SPC1.mmu.asi.t7_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[7]  = {`SPC1.mmu.asi.t7_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[7]  = {`SPC1.mmu.asi.t7_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[7]  = {`SPC1.mmu.asi.t7_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[7] = {`SPC1.mmu.asi.t7_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[7] = {`SPC1.mmu.asi.t7_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[7] = {`SPC1.mmu.asi.t7_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[7] = {`SPC1.mmu.asi.t7_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };
`endif // EMUL - ADD_TSB_CFG


// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
// Suppress instruction on flush or park request 
// (clear_disrupting_flush_pending_w_in & idl_req_in)
//   Suppress instruction for 'refetch' exception after 
//     not taken branch with annulled delay slot
// NOTE:  'with_errors' means that the signal actually IGNORES instruction
// cache errors and asserts IN SPITE OF instruction cache errors
wire [7:0] select_pc_b_with_errors = 
     {{4 {~`SPC1.dec_flush_b[1]}}, {4 {~`SPC1.dec_flush_b[0]}}} & 
     {{4 {~`SPC1.tlu.fls1.refetch_w_in}}, {4 {~`SPC1.tlu.fls0.refetch_w_in}}} &
     {~(`SPC1.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC1.tlu.fls1.idl_req_in}}),
      ~(`SPC1.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC1.tlu.fls0.idl_req_in}})} &
     {`SPC1.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC1.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Qualify select_pc_b_with_errors to get final select_pc_b signal
// Qualifications are
// 	- instruction cache errors (ic_err_w_in)
//	- disrupting single step completion requests (dsc_req_in)
wire [7:0] select_pc_b = 
     select_pc_b_with_errors[7:0]  &
     {{4 {(~`SPC1.tlu.fls1.ic_err_w_in | `SPC1.tlu.fls1.itlb_nfo_exc_b) & 
          ~`SPC1.tlu.fls1.dsc_req_in}}, 
      {4 {(~`SPC1.tlu.fls0.ic_err_w_in | `SPC1.tlu.fls0.itlb_nfo_exc_b) & 
          ~`SPC1.tlu.fls0.dsc_req_in}}};

//------------------------------------

//original select_pc_b_with errors. Select_pc_b_with_errors is no longer asserted
//if the inst. following an annulled delay slot of a not taken branch has a prebuffer
//error and it reaches B stage. I still need a signal if this happens to trigger the chkr.

wire [7:0] select_pc_b_with_errors_and_refetch =
     {{4 {~`SPC1.dec_flush_b[1]}}, {4 {~`SPC1.dec_flush_b[0]}}} &
     {~(`SPC1.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC1.tlu.fls1.idl_req_in}}),
      ~(`SPC1.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC1.tlu.fls0.idl_req_in}})} &
     {`SPC1.tlu.fls1.tid_dec_valid_b[3:0],
      `SPC1.tlu.fls0.tid_dec_valid_b[3:0]};

// Signals required for bench TLB sync & LDST sync

reg        tlb_bypass_m;
reg        tlb_bypass_b;
reg        tlb_rd_vld_m;
reg        tlb_rd_vld_b;
reg        lsu_tl_gt_0_b;
reg  [7:0] dcc_asi_b;
reg        asi_internal_w;

always @ (posedge `BENCH_SPC1_GCLK) begin // {

  clkstop_d1 <= `SPC1.tcu_clk_stop;
  clkstop_d2 <= clkstop_d1;
  clkstop_d3 <= clkstop_d2;
  clkstop_d4 <= clkstop_d3;
  clkstop_d5 <= clkstop_d4;

  tlb_bypass_m <= `SPC1.lsu.tlb.tlb_bypass;
  tlb_bypass_b <= tlb_bypass_m;
  tlb_rd_vld_m <= `SPC1.lsu.tlb.tlb_rd_vld | `SPC1.lsu.tlb.tlb_cam_vld;
  tlb_rd_vld_b <= tlb_rd_vld_m;

  // This signal is only valid for LD/ST instructions
  lsu_tl_gt_0_b <= `SPC1.lsu.dcc.tl_gt_0_m;

  // Can't use lsu.dcc_asi_b for tlb_sync so pipeline from M to B
  dcc_asi_b <= `SPC1.lsu.dcc_asi_m;

  // LD/ST that will not issue to the crossbar
  asi_internal_w <= `SPC1.lsu.dcc.asi_internal_b;
end // }

// TL determines whether Nucleus or Primary
wire [7:0] asi_num = `SPC1.lsu.dcc.altspace_ldst_b ? 
                     dcc_asi_b : 
                     (lsu_tl_gt_0_b ? 8'h04 : 8'h80);

wire [7:0] itlb_miss   = { (`SPC1.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire [7:0] icache_miss = { (`SPC1.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC1.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC1.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire inst_bypass = (`SPC1.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[0] |
                    `SPC1.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[1] |
                    `SPC1.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[2]);

wire [7:0] fetch_bypass = { (inst_bypass & `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                            (inst_bypass & `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                            (inst_bypass & `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                            (inst_bypass & `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                            (inst_bypass & `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                            (inst_bypass & `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                            (inst_bypass & `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                            (inst_bypass & `SPC1.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                          };

wire [7:0] itlb_wr = {(`SPC1.tlu.trl1.take_itw & `SPC1.tlu.trl1.trap[3]),
                      (`SPC1.tlu.trl1.take_itw & `SPC1.tlu.trl1.trap[2]),
                      (`SPC1.tlu.trl1.take_itw & `SPC1.tlu.trl1.trap[1]),
                      (`SPC1.tlu.trl1.take_itw & `SPC1.tlu.trl1.trap[0]),
                      (`SPC1.tlu.trl0.take_itw & `SPC1.tlu.trl0.trap[3]),
                      (`SPC1.tlu.trl0.take_itw & `SPC1.tlu.trl0.trap[2]),
                      (`SPC1.tlu.trl0.take_itw & `SPC1.tlu.trl0.trap[1]),
                      (`SPC1.tlu.trl0.take_itw & `SPC1.tlu.trl0.trap[0])
                     };

//------------------------------------

reg  [71:0] tick_cmpr_0; 
reg  [71:0] stick_cmpr_0; 
reg  [71:0] hstick_cmpr_0;
reg [151:0] trap_entry_1_t0;
reg [151:0] trap_entry_2_t0;
reg [151:0] trap_entry_3_t0;
reg [151:0] trap_entry_4_t0;
reg [151:0] trap_entry_5_t0;
reg [151:0] trap_entry_6_t0;

always @(posedge `BENCH_SPC1_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_0        <= `SPC1.tlu.tca.array.mem[{2'b0,3'h0}];
      stick_cmpr_0       <= `SPC1.tlu.tca.array.mem[{2'b01,3'h0}];
      hstick_cmpr_0      <= `SPC1.tlu.tca.array.mem[{2'b10,3'h0}];
      trap_entry_1_t0    <= `SPC1.tlu.tsa0.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t0    <= `SPC1.tlu.tsa0.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t0    <= `SPC1.tlu.tsa0.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t0    <= `SPC1.tlu.tsa0.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t0    <= `SPC1.tlu.tsa0.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t0    <= `SPC1.tlu.tsa0.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_1; 
reg  [71:0] stick_cmpr_1; 
reg  [71:0] hstick_cmpr_1;
reg [151:0] trap_entry_1_t1;
reg [151:0] trap_entry_2_t1;
reg [151:0] trap_entry_3_t1;
reg [151:0] trap_entry_4_t1;
reg [151:0] trap_entry_5_t1;
reg [151:0] trap_entry_6_t1;

always @(posedge `BENCH_SPC1_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_1        <= `SPC1.tlu.tca.array.mem[{2'b0,3'h1}];
      stick_cmpr_1       <= `SPC1.tlu.tca.array.mem[{2'b01,3'h1}];
      hstick_cmpr_1      <= `SPC1.tlu.tca.array.mem[{2'b10,3'h1}];
      trap_entry_1_t1    <= `SPC1.tlu.tsa0.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t1    <= `SPC1.tlu.tsa0.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t1    <= `SPC1.tlu.tsa0.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t1    <= `SPC1.tlu.tsa0.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t1    <= `SPC1.tlu.tsa0.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t1    <= `SPC1.tlu.tsa0.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_2; 
reg  [71:0] stick_cmpr_2; 
reg  [71:0] hstick_cmpr_2;
reg [151:0] trap_entry_1_t2;
reg [151:0] trap_entry_2_t2;
reg [151:0] trap_entry_3_t2;
reg [151:0] trap_entry_4_t2;
reg [151:0] trap_entry_5_t2;
reg [151:0] trap_entry_6_t2;

always @(posedge `BENCH_SPC1_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_2        <= `SPC1.tlu.tca.array.mem[{2'b0,3'h2}];
      stick_cmpr_2       <= `SPC1.tlu.tca.array.mem[{2'b01,3'h2}];
      hstick_cmpr_2      <= `SPC1.tlu.tca.array.mem[{2'b10,3'h2}];
      trap_entry_1_t2    <= `SPC1.tlu.tsa0.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t2    <= `SPC1.tlu.tsa0.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t2    <= `SPC1.tlu.tsa0.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t2    <= `SPC1.tlu.tsa0.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t2    <= `SPC1.tlu.tsa0.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t2    <= `SPC1.tlu.tsa0.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_3; 
reg  [71:0] stick_cmpr_3; 
reg  [71:0] hstick_cmpr_3;
reg [151:0] trap_entry_1_t3;
reg [151:0] trap_entry_2_t3;
reg [151:0] trap_entry_3_t3;
reg [151:0] trap_entry_4_t3;
reg [151:0] trap_entry_5_t3;
reg [151:0] trap_entry_6_t3;

always @(posedge `BENCH_SPC1_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_3        <= `SPC1.tlu.tca.array.mem[{2'b0,3'h3}];
      stick_cmpr_3       <= `SPC1.tlu.tca.array.mem[{2'b01,3'h3}];
      hstick_cmpr_3      <= `SPC1.tlu.tca.array.mem[{2'b10,3'h3}];
      trap_entry_1_t3    <= `SPC1.tlu.tsa0.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t3    <= `SPC1.tlu.tsa0.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t3    <= `SPC1.tlu.tsa0.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t3    <= `SPC1.tlu.tsa0.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t3    <= `SPC1.tlu.tsa0.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t3    <= `SPC1.tlu.tsa0.array.mem[{2'h3, 3'h5}];

end // }
reg  [71:0] tick_cmpr_4; 
reg  [71:0] stick_cmpr_4; 
reg  [71:0] hstick_cmpr_4;
reg [151:0] trap_entry_1_t4;
reg [151:0] trap_entry_2_t4;
reg [151:0] trap_entry_3_t4;
reg [151:0] trap_entry_4_t4;
reg [151:0] trap_entry_5_t4;
reg [151:0] trap_entry_6_t4;

always @(posedge `BENCH_SPC1_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_4        <= `SPC1.tlu.tca.array.mem[{2'b0,3'h4}];
      stick_cmpr_4       <= `SPC1.tlu.tca.array.mem[{2'b01,3'h4}];
      hstick_cmpr_4      <= `SPC1.tlu.tca.array.mem[{2'b10,3'h4}];
      trap_entry_1_t4    <= `SPC1.tlu.tsa1.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t4    <= `SPC1.tlu.tsa1.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t4    <= `SPC1.tlu.tsa1.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t4    <= `SPC1.tlu.tsa1.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t4    <= `SPC1.tlu.tsa1.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t4    <= `SPC1.tlu.tsa1.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_5; 
reg  [71:0] stick_cmpr_5; 
reg  [71:0] hstick_cmpr_5;
reg [151:0] trap_entry_1_t5;
reg [151:0] trap_entry_2_t5;
reg [151:0] trap_entry_3_t5;
reg [151:0] trap_entry_4_t5;
reg [151:0] trap_entry_5_t5;
reg [151:0] trap_entry_6_t5;

always @(posedge `BENCH_SPC1_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_5        <= `SPC1.tlu.tca.array.mem[{2'b0,3'h5}];
      stick_cmpr_5       <= `SPC1.tlu.tca.array.mem[{2'b01,3'h5}];
      hstick_cmpr_5      <= `SPC1.tlu.tca.array.mem[{2'b10,3'h5}];
      trap_entry_1_t5    <= `SPC1.tlu.tsa1.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t5    <= `SPC1.tlu.tsa1.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t5    <= `SPC1.tlu.tsa1.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t5    <= `SPC1.tlu.tsa1.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t5    <= `SPC1.tlu.tsa1.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t5    <= `SPC1.tlu.tsa1.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_6; 
reg  [71:0] stick_cmpr_6; 
reg  [71:0] hstick_cmpr_6;
reg [151:0] trap_entry_1_t6;
reg [151:0] trap_entry_2_t6;
reg [151:0] trap_entry_3_t6;
reg [151:0] trap_entry_4_t6;
reg [151:0] trap_entry_5_t6;
reg [151:0] trap_entry_6_t6;

always @(posedge `BENCH_SPC1_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_6        <= `SPC1.tlu.tca.array.mem[{2'b0,3'h6}];
      stick_cmpr_6       <= `SPC1.tlu.tca.array.mem[{2'b01,3'h6}];
      hstick_cmpr_6      <= `SPC1.tlu.tca.array.mem[{2'b10,3'h6}];
      trap_entry_1_t6    <= `SPC1.tlu.tsa1.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t6    <= `SPC1.tlu.tsa1.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t6    <= `SPC1.tlu.tsa1.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t6    <= `SPC1.tlu.tsa1.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t6    <= `SPC1.tlu.tsa1.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t6    <= `SPC1.tlu.tsa1.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_7; 
reg  [71:0] stick_cmpr_7; 
reg  [71:0] hstick_cmpr_7;
reg [151:0] trap_entry_1_t7;
reg [151:0] trap_entry_2_t7;
reg [151:0] trap_entry_3_t7;
reg [151:0] trap_entry_4_t7;
reg [151:0] trap_entry_5_t7;
reg [151:0] trap_entry_6_t7;

always @(posedge `BENCH_SPC1_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_7        <= `SPC1.tlu.tca.array.mem[{2'b0,3'h7}];
      stick_cmpr_7       <= `SPC1.tlu.tca.array.mem[{2'b01,3'h7}];
      hstick_cmpr_7      <= `SPC1.tlu.tca.array.mem[{2'b10,3'h7}];
      trap_entry_1_t7    <= `SPC1.tlu.tsa1.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t7    <= `SPC1.tlu.tsa1.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t7    <= `SPC1.tlu.tsa1.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t7    <= `SPC1.tlu.tsa1.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t7    <= `SPC1.tlu.tsa1.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t7    <= `SPC1.tlu.tsa1.array.mem[{2'h3, 3'h5}];

end // }

//------------------------------------
// ASI & Trap State machines
always @(posedge `BENCH_SPC1_GCLK) begin // {

//    pc_0_e[47:0] <= `SPC1.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC1.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC1.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC1.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;


    // altspace_ldst_m is asserted for asi accesses that don't change arch state
    asi_store_b <= (`SPC1.lsu.dcc.asi_store_m & `SPC1.lsu.dcc.asi_sync_m);
    asi_store_w <= asi_store_b;
    dcc_tid_b <= `SPC1.lsu.dcc.dcc_tid_m;
    dcc_tid_w <= dcc_tid_b;

    // ASI in progress state m/c
    if (asi_store_w & ~asi_store_flush_w[dcc_tid_w]) begin // {
        asi_in_progress_b[dcc_tid_w] <= 1'b1;
    end // }

    asi_valid_w <= asi_in_progress_b & store_sync;

    // Delay asi_valid_w and asi_in_progress
    // 2 clocks to ensure TLB Sync DTLBWRITE (demap) comes before SSTEP stxa
    asi_valid_fx4 <= asi_valid_w;
    asi_valid_fx5 <= asi_valid_fx4;
    asi_in_progress_w <= asi_in_progress_b;
    asi_in_progress_fx4 <= asi_in_progress_w;
    sync_reset_w <= sync_reset;
    
    for (i=0;i<8;i=i+1) begin // {
        if (asi_valid_w[i] | sync_reset_w[i]) begin // {
            asi_in_progress_b[i] <= 1'b0;
        end//}
    end //}

    // Trap0 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC1.tlu.tlu_trap_0_tid[1:0] == i) &&
            `SPC1.tlu.tlu_trap_pc_0_valid & tlu_ccr_cwp_0_valid_last)
        begin //{
            tlu_valid[i] <= 1'b1;
        end //}
        // Trap taken
        else if (`SPC1.tlu.trl0.real_trap[i] & ~`SPC1.tlu.trl0.take_por) begin // {
            tlu_valid[i] <= 1'b1;
        end //}
        else 
            tlu_valid[i] <= 1'b0;
    end //}

    // Trap1 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC1.tlu.tlu_trap_1_tid[1:0] == i) &&
            `SPC1.tlu.tlu_trap_pc_1_valid & tlu_ccr_cwp_1_valid_last)
        begin //{
            tlu_valid[i+4] <= 1'b1;
        end //} 
        // Trap taken
        else if (`SPC1.tlu.trl1.real_trap[i] & ~`SPC1.tlu.trl1.take_por) begin // {
            tlu_valid[i+4] <= 1'b1;
        end //}
        else 
            tlu_valid[i+4] <= 1'b0;
    end //}

end // }


always @(posedge `BENCH_SPC1_GCLK) begin

// debug code for TPCC analysis
`ifdef TPCC
if (pcx_req==1) begin
	if (`SPC1.spc_pcx_data_pa[129:124]==6'b100000) begin  // l15 dmiss
	  l15dmiss_cnt=l15dmiss_cnt+1;
	  $display("dmissl15 cnt is %0d",l15dmiss_cnt);
	end
	if (`SPC1.spc_pcx_data_pa[129:124]==6'b110000) begin // l15 imiss
	  l15imiss_cnt=l15imiss_cnt+1;
	  $display("imissl15 cnt is %0d",l15imiss_cnt);
	end
	// `TOP.spg.spc_pcx_data_pa[129:124]==6'b100001   -> all stores 
end

pcx_req <= |`SPC1.spc_pcx_req_pq[8:0];
 
if (`SPC1.ifu_l15_valid==1) begin
	imiss_cnt=imiss_cnt+1;
	$display("imiss cnt is %0d",imiss_cnt);
end
if (spec_dmiss==1 && `SPC1.lsu_l15_cancel==0) begin
	dmiss_cnt=dmiss_cnt+1;
	$display("dmiss cnt is %0d",dmiss_cnt);
	
end
spec_dmiss <= `SPC1.lsu_l15_valid & `SPC1.lsu_l15_load;

clock = clock+1;

// keep track of imiss latencies
if (`SPC1.ftu_agc_thr0_cmiss_c==1) begin
     start_imiss0=clock;
     active_imiss0=1;
end
if (active_imiss0==1 && first_imiss0==1 && `SPC1.l15_spc_cpkt[8:6]==3'b000 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss0 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss0=0;
     first_imiss0=0;
end
if (active_imiss0==1 && first_imiss0==0 && `SPC1.l15_spc_cpkt[8:6]==3'b000 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss0=1;
end
if (`SPC1.ftu_agc_thr1_cmiss_c==1) begin
     start_imiss1=clock;
     active_imiss1=1;
end
if (active_imiss1==1 && first_imiss1==1 && `SPC1.l15_spc_cpkt[8:6]==3'b001 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss1 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss1=0;
     first_imiss1=0;
end
if (active_imiss1==1 && first_imiss1==0 && `SPC1.l15_spc_cpkt[8:6]==3'b001 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss1=1;
end
if (`SPC1.ftu_agc_thr2_cmiss_c==1) begin
     start_imiss2=clock;
     active_imiss2=1;
end
if (active_imiss2==1 && first_imiss2==1 && `SPC1.l15_spc_cpkt[8:6]==3'b010 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss2 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss2=0;
     first_imiss2=0;
end
if (active_imiss2==1 && first_imiss2==0 && `SPC1.l15_spc_cpkt[8:6]==3'b010 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss2=1;
end
if (`SPC1.ftu_agc_thr3_cmiss_c==1) begin
     start_imiss3=clock;
     active_imiss3=1;
end
if (active_imiss3==1 && first_imiss3==1  && `SPC1.l15_spc_cpkt[8:6]==3'b011 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss3 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss3=0;
     first_imiss3=0;
end
if (active_imiss3==1 && first_imiss3==0 && `SPC1.l15_spc_cpkt[8:6]==3'b011 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss3=1;
end
if (`SPC1.ftu_agc_thr4_cmiss_c==1) begin
     start_imiss4=clock;
     active_imiss4=1;
end
if (active_imiss4==1 && first_imiss4==1  && `SPC1.l15_spc_cpkt[8:6]==3'b100 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss4 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss4=0;
     first_imiss4=0;
end
if (active_imiss4==1 && first_imiss4==0 && `SPC1.l15_spc_cpkt[8:6]==3'b100 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss4=1;
end
if (`SPC1.ftu_agc_thr5_cmiss_c==1) begin
     start_imiss5=clock;
     active_imiss5=1;
end
if (active_imiss5==1  && first_imiss5==1 && `SPC1.l15_spc_cpkt[8:6]==3'b101 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss5 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss5=0;
     first_imiss5=0;
end
if (active_imiss5==1 && first_imiss5==0 && `SPC1.l15_spc_cpkt[8:6]==3'b101 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss5=1;
end
if (`SPC1.ftu_agc_thr6_cmiss_c==1) begin
     start_imiss6=clock;
     active_imiss6=1;
end
if (active_imiss6==1 && first_imiss6==1 && `SPC1.l15_spc_cpkt[8:6]==3'b110 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss6 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss6=0;
     first_imiss6=0;
end
if (active_imiss6==1 && first_imiss6==0 && `SPC1.l15_spc_cpkt[8:6]==3'b110 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss6=1;
end
if (`SPC1.ftu_agc_thr7_cmiss_c==1) begin
     start_imiss7=clock;
     active_imiss7=1;
end
if (active_imiss7==1 && first_imiss7==1 && `SPC1.l15_spc_cpkt[8:6]==3'b111 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss7 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss7=0;
    first_imiss7=0;
end
if (active_imiss7==1 && first_imiss7==0 && `SPC1.l15_spc_cpkt[8:6]==3'b111 && `SPC1.l15_spc_valid==1 && `SPC1.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss7=1;
end

if (`SPC1.pku.swl0.set_lsu_sync_wait==1) begin
     start_dmiss0=clock;
end
if (`SPC1.pku.swl0.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss0) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC1.pku.swl1.set_lsu_sync_wait==1) begin
     start_dmiss1=clock;
end
if (`SPC1.pku.swl1.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss1) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC1.pku.swl2.set_lsu_sync_wait==1) begin
     start_dmiss2=clock;
end
if (`SPC1.pku.swl2.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss2) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC1.pku.swl3.set_lsu_sync_wait==1) begin
     start_dmiss3=clock;
end
if (`SPC1.pku.swl3.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss3) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC1.pku.swl4.set_lsu_sync_wait==1) begin
     start_dmiss4=clock;
end
if (`SPC1.pku.swl4.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss4) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC1.pku.swl5.set_lsu_sync_wait==1) begin
     start_dmiss5=clock;
end
if (`SPC1.pku.swl5.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss5) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC1.pku.swl6.set_lsu_sync_wait==1) begin
     start_dmiss6=clock;
end
if (`SPC1.pku.swl6.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss6) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC1.pku.swl7.set_lsu_sync_wait==1) begin
     start_dmiss7=clock;
end
if (`SPC1.pku.swl7.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss7) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
`endif



   lsu_tid_e[2:0] <= `SPC1.lsu.dcc.tid_d[2:0];

   // FG Valid conditions

   // Add fcc valids to fg_valid
   fcc_valid_fb <= fcc_valid_f5;
   fcc_valid_f5 <= fcc_valid_f4;
   fcc_valid_f4 <= |`SPC1.fgu.fgu_cmp_fcc_vld_fx3[3:0];

   fg_flush_fb <= fg_flush_f5;
   fg_flush_f5 <= fg_flush_f4;
   fg_flush_f4 <= fg_flush_f3;
   fg_flush_f3 <= fg_flush_f2 | `SPC1.dec_flush_f2 | 
                  `SPC1.tlu_flush_fgu_b;
   fg_flush_f2 <= `SPC1.dec_flush_f1;

   fgu_err_fx3 <= `SPC1.fgu_cecc_fx2 | `SPC1.fgu_uecc_fx2 | `SPC1.fgu.fpc.exu_flush_fx2; // frf or irf ecc error
   fgu_err_fx4 <= fgu_err_fx3;
   fgu_err_fx5 <= fgu_err_fx4;
   fgu_err_fb <= fgu_err_fx5;

   // Siams cause fg_valid ..
   siam0_d = `SPC1.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC1.dec.dec_inst0_d[24:19]==6'b110110 &
             `SPC1.dec.dec_inst0_d[13:5]==9'b010000001;  

   siam1_d = `SPC1.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC1.dec.dec_inst1_d[24:19]==6'b110110 &
             `SPC1.dec.dec_inst1_d[13:5]==9'b010000001;  
    

   done0_d = `SPC1.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC1.dec.dec_inst0_d[29:25]==5'b00000 & 
             `SPC1.dec.dec_inst0_d[24:19]==6'b111110;
   done1_d = `SPC1.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC1.dec.dec_inst1_d[29:25]==5'b00000 & 
             `SPC1.dec.dec_inst1_d[24:19]==6'b111110;    

   retry0_d = `SPC1.dec.dec_inst0_d[31:30]==2'b10 & 
              `SPC1.dec.dec_inst0_d[29:25]==5'b00001 & 
              `SPC1.dec.dec_inst0_d[24:19]==6'b111110;
   retry1_d = `SPC1.dec.dec_inst1_d[31:30]==2'b10 & 
              `SPC1.dec.dec_inst1_d[29:25]==5'b00001 & 
              `SPC1.dec.dec_inst1_d[24:19]==6'b111110;   

   done0_e <= done0_d & `SPC1.dec.dec_decode0_d;
   done1_e <= done1_d & `SPC1.dec.dec_decode1_d; 

   retry0_e <= retry0_d & `SPC1.dec.dec_decode0_d;
   retry1_e <= retry1_d & `SPC1.dec.dec_decode1_d;   


   // fold siam into cmov logic 

   fmov_valid_fb <= fmov_valid_f5;
   fmov_valid_f5 <= fmov_valid_f4;
   fmov_valid_f4 <= fmov_valid_f3;
   fmov_valid_f3 <= fmov_valid_f2;
   fmov_valid_f2 <= fmov_valid_m;
   fmov_valid_m  <= fmov_valid_e & `SPC1.dec.dec_fgu_valid_e;
   fmov_valid_e <= ((`SPC1.exu0.ect.cmov_d | siam0_d) & 
                    `SPC1.dec.dec_decode0_d&`SPC1.dec.del.fgu0_d) |
                    ((`SPC1.exu1.ect.cmov_d | siam1_d) & 
                    `SPC1.dec.dec_decode1_d&`SPC1.dec.del.fgu1_d);
   
   // fgu check bus

   // fcc_valid_fb doesn't assert for LDFSR. LDFSR gets checked by the LSU
   // checker

   fg_valid <= {(`SPC1.fgu.fac.fac_w1_tid_fb[2:0]==3'h7) && fg_cond_fb,
                (`SPC1.fgu.fac.fac_w1_tid_fb[2:0]==3'h6) && fg_cond_fb,
                (`SPC1.fgu.fac.fac_w1_tid_fb[2:0]==3'h5) && fg_cond_fb,
                (`SPC1.fgu.fac.fac_w1_tid_fb[2:0]==3'h4) && fg_cond_fb,
                (`SPC1.fgu.fac.fac_w1_tid_fb[2:0]==3'h3) && fg_cond_fb,
                (`SPC1.fgu.fac.fac_w1_tid_fb[2:0]==3'h2) && fg_cond_fb,
                (`SPC1.fgu.fac.fac_w1_tid_fb[2:0]==3'h1) && fg_cond_fb,
                (`SPC1.fgu.fac.fac_w1_tid_fb[2:0]==3'h0) && fg_cond_fb };
   

   fgu_valid_fb0      <= `SPC1.fgu_exu_w_vld_fx5[0] && !`SPC1.fgu.fpc.div_finish_int_fb;
   fgu_valid_fb1      <= `SPC1.fgu_exu_w_vld_fx5[1] && !`SPC1.fgu.fpc.div_finish_int_fb;

   // Fdiv
   div_special_cancel_f4[7:0] <= tid2onehot(`SPC1.fgu.fac.tid_fx3[2:0]) & 
                               {8{`SPC1.fgu.fac.q_div_default_res_fx3}};
   fg_fdiv_valid_fw <= `SPC1.fgu_divide_completion & ~div_special_cancel_f4 &
                       {8{~`SPC1.fgu.fpc.fpc_fpd_ieee_trap_fb}} &
                       {8{~`SPC1.fgu.fpc.fpc_fpd_unfin_fb}};

    
   // Used in CCX Stub ?
   inst0_e[31:0] <= `SPC1.dec.dec_inst0_d[31:0];
   inst1_e[31:0] <= `SPC1.dec.dec_inst1_d[31:0];

   // only fgu ops that are not loads/stores
   fgu0_e <= `SPC1.dec.del.decode_fgu0_d;  
   fgu1_e <= `SPC1.dec.del.decode_fgu1_d;

   // LSU logic 
   load_b <= load_m;
   load_m <= (load0_e | load1_e);

   load0_e <= (`SPC1.dec.dec_decode0_d & `SPC1.dec.del.lsu0_d & 
               `SPC1.dec.dcd0.dcd_load_d);

   load1_e <= (`SPC1.dec.dec_decode1_d & `SPC1.dec.del.lsu1_d & 
               `SPC1.dec.dcd1.dcd_load_d);

   lsu_tid_b[2:0] <= lsu_tid_m[2:0];
   lsu_tid_m[2:0] <= lsu_tid_e[2:0];

   lsu_complete_m[7:0] <= `SPC1.lsu_complete[7:0];
   lsu_complete_b[7:0] <= lsu_complete_m[7:0];

   lsu_data_w  <= lsu_data_b;
  
   // Divide destination logic ..
   sel_divide0_e <= (`SPC1.dec_decode0_d & 
                     ((`SPC1.pku.swl0.vld_d & `SPC1.pku.swl_divide_wait[0]) |
                      (`SPC1.pku.swl1.vld_d & `SPC1.pku.swl_divide_wait[1]) |
                      (`SPC1.pku.swl2.vld_d & `SPC1.pku.swl_divide_wait[2]) |
                      (`SPC1.pku.swl3.vld_d & `SPC1.pku.swl_divide_wait[3])));
   sel_divide1_e <= (`SPC1.dec_decode1_d & 
                     ((`SPC1.pku.swl4.vld_d & `SPC1.pku.swl_divide_wait[4]) |
                      (`SPC1.pku.swl5.vld_d & `SPC1.pku.swl_divide_wait[5]) |
                      (`SPC1.pku.swl6.vld_d & `SPC1.pku.swl_divide_wait[6]) |
                      (`SPC1.pku.swl7.vld_d & `SPC1.pku.swl_divide_wait[7])));


   dcd_fdest_e <= {`SPC1.dec.del.fdest1_d,`SPC1.dec.del.fdest0_d};
   dcd_idest_e <= {`SPC1.dec.del.idest1_d,`SPC1.dec.del.idest0_d};

   if (sel_divide0_e) begin // {
         div_idest[{1'b0, `SPC1.dec.del.tid0_e[1:0]}] <= dcd_idest_e[0];
         div_fdest[{1'b0, `SPC1.dec.del.tid0_e[1:0]}] <= dcd_fdest_e[0];
   end // }
   if (sel_divide1_e) begin // {
         div_idest[{1'b1, `SPC1.dec.del.tid1_e[1:0]}] <= dcd_idest_e[1];
         div_fdest[{1'b1, `SPC1.dec.del.tid1_e[1:0]}] <= dcd_fdest_e[1];
   end // }
                 

   // EX logic
   // Save EX tids for later use
   ex0_tid_m <= ex0_tid_e;
   ex1_tid_m <= ex1_tid_e;
   ex0_tid_b <= ex0_tid_m;
   ex1_tid_b <= ex1_tid_m;
   ex0_tid_w <= ex0_tid_b;
   ex1_tid_w <= ex1_tid_b;

   // EX Flush conditions
   ex_flush_w <= {ex_flush_b | {{4{(`SPC1.dec.dec_flush_b[1] | 
                                `SPC1.tlu_flush_exu_b[1])}},
                                {4{(`SPC1.dec.dec_flush_b[0] |
                                `SPC1.tlu_flush_exu_b[0])}}}};

   ex_flush_b <= {{4{`SPC1.dec.dec_flush_m[1]}},
                 {4{`SPC1.dec.dec_flush_m[0]}}};


   // ex_valid_f4 valid will only fire on return
   return_f4 <= return_w & ~(`SPC1.tlu_flush_ifu & real_exception);
   ex_valid_w <= ex_valid_b;

   // Cancel EX valid if it turns out to be asr/asi access for this tid 

   ex_valid_b <= ex_valid_m & ~ex_asr_access;


   ex_valid_m <=      { (ex1_tid_e == 2'h3) && ex1_valid_e,
                       (ex1_tid_e == 2'h2) && ex1_valid_e,
                       (ex1_tid_e == 2'h1) && ex1_valid_e,
                       (ex1_tid_e == 2'h0) && ex1_valid_e,
                       (ex0_tid_e == 2'h3) && ex0_valid_e,
                       (ex0_tid_e == 2'h2) && ex0_valid_e,
                       (ex0_tid_e == 2'h1) && ex0_valid_e,
                       (ex0_tid_e == 2'h0) && ex0_valid_e};
   

  // TLU delays for done and retries
  tlu_ccr_cwp_0_valid_last <= `SPC1.tlu.tlu_ccr_cwp_0_valid;
  tlu_ccr_cwp_1_valid_last <= `SPC1.tlu.tlu_ccr_cwp_1_valid;
  

end // END posedge gclk

// Return instruction is separated out of ex*_valid because CWP update is in
// W+1 for return new window is not available for IRF scan (nas_pipe) until
// W+2
assign return0 = `SPC1.exu0.rml.return_w & 
                 `SPC1.exu0.rml.inst_vld_w;
assign return1 = `SPC1.exu1.rml.return_w & 
                 `SPC1.exu1.rml.inst_vld_w;
assign return_w = {(ex1_tid_w == 2'h3) && return1,
                   (ex1_tid_w == 2'h2) && return1,
                   (ex1_tid_w == 2'h1) && return1,
                   (ex1_tid_w == 2'h0) && return1,
                   (ex0_tid_w == 2'h3) && return0,
                   (ex0_tid_w == 2'h2) && return0,
                   (ex0_tid_w == 2'h1) && return0,
                   (ex0_tid_w == 2'h0) && return0};


// Cancel EX valid if it turns out that exception (tlu flush) taken for
// this tid

// exu check bus
assign ex0_tid_e = `SPC1.exu0.ect_tid_lth_e[1:0];
assign ex0_valid_e = `SPC1.dec.dec_valid_e[0] & ~fgu0_e & ~load0_e &
                     ~retry0_e & ~done0_e;
assign ex1_tid_e = `SPC1.exu1.ect_tid_lth_e[1:0];
assign ex1_valid_e = `SPC1.dec.dec_valid_e[1] & ~fgu1_e & ~load1_e &
                     ~retry1_e & ~done1_e;

assign ex_asr_valid = `SPC1.lsu.dcc.asi_store_m & `SPC1.lsu.dcc.asi_sync_m ;

assign ex_asr_access ={(`SPC1.lsu.dcc.dcc_tid_m[2:0]==3'h7) & ex_asr_valid,
                       (`SPC1.lsu.dcc.dcc_tid_m[2:0]==3'h6) & ex_asr_valid,
                       (`SPC1.lsu.dcc.dcc_tid_m[2:0]==3'h5) & ex_asr_valid,
                       (`SPC1.lsu.dcc.dcc_tid_m[2:0]==3'h4) & ex_asr_valid,
                       (`SPC1.lsu.dcc.dcc_tid_m[2:0]==3'h3) & ex_asr_valid,
                       (`SPC1.lsu.dcc.dcc_tid_m[2:0]==3'h2) & ex_asr_valid,
                       (`SPC1.lsu.dcc.dcc_tid_m[2:0]==3'h1) & ex_asr_valid,
                       (`SPC1.lsu.dcc.dcc_tid_m[2:0]==3'h0) & ex_asr_valid};


// EXU valid is ex_valid_w, except flushes, delayed return, traps, and stfsr
// real_exception added because tlu_flush_ifu activates for second redirect
// of retry if TPC and TNPC are not verified as sequential
assign  real_exception =
	   {{4 {`SPC1.tlu.fls1.dec_exc_w | 
		`SPC1.tlu.fls1.exu_exc_w |
		`SPC1.tlu.fls1.lsu_exc_w | 
                `SPC1.tlu.fls1.bsee_req_w}},
	    {4 {`SPC1.tlu.fls0.dec_exc_w | 
		`SPC1.tlu.fls0.exu_exc_w |
		`SPC1.tlu.fls0.lsu_exc_w | 
                `SPC1.tlu.fls0.bsee_req_w}}};

// Do not assert ex_valid for block store instructions
wire [7:0] block_store_first_at_w = 
           {`SPC1.lsu.sbs7.bst_pend & `SPC1.lsu.sbs7.blk_inst_w, 
            `SPC1.lsu.sbs6.bst_pend & `SPC1.lsu.sbs6.blk_inst_w, 
            `SPC1.lsu.sbs5.bst_pend & `SPC1.lsu.sbs5.blk_inst_w, 
            `SPC1.lsu.sbs4.bst_pend & `SPC1.lsu.sbs4.blk_inst_w, 
            `SPC1.lsu.sbs3.bst_pend & `SPC1.lsu.sbs3.blk_inst_w, 
            `SPC1.lsu.sbs2.bst_pend & `SPC1.lsu.sbs2.blk_inst_w, 
            `SPC1.lsu.sbs1.bst_pend & `SPC1.lsu.sbs1.blk_inst_w, 
            `SPC1.lsu.sbs0.bst_pend & `SPC1.lsu.sbs0.blk_inst_w};

// But inject a valid for a block store that's done...
reg [7:0] block_store_w;
always @(posedge `BENCH_SPC1_GCLK) begin
    block_store_w[7:0] <= `SPC1.lsu.lsu_block_store_b[7:0];
    lsu_trap_flush_d <=  `SPC1.lsu_trap_flush[7:0];
end

wire [7:0] block_store_inject_at_w = 
                                    ~`SPC1.lsu.lsu_block_store_b[7:0] & 
                                    block_store_w[7:0] &
                                    {~`SPC1.lsu.sbs7.bst_kill,
                                     ~`SPC1.lsu.sbs6.bst_kill,
                                     ~`SPC1.lsu.sbs5.bst_kill,
                                     ~`SPC1.lsu.sbs4.bst_kill,
                                     ~`SPC1.lsu.sbs3.bst_kill,
                                     ~`SPC1.lsu.sbs2.bst_kill,
                                     ~`SPC1.lsu.sbs1.bst_kill,
                                     ~`SPC1.lsu.sbs0.bst_kill};

assign ex_valid = (((ex_valid_w & ~ex_flush_w & ~return_w & ~block_store_first_at_w & ~exception_w &
                     ~({{4{`SPC1.tlu.fls1.exu_exc_b & `SPC1.tlu.fls1.beat_two_b}},
                        {4{`SPC1.tlu.fls0.exu_exc_b & `SPC1.tlu.fls0.beat_two_b}}}) &
                     ~{(`SPC1.fgu.fac.tid_fx3[2:0]==3'h7) & `SPC1.fgu.fpc.fsr_store_fx3,
                       (`SPC1.fgu.fac.tid_fx3[2:0]==3'h6) & `SPC1.fgu.fpc.fsr_store_fx3,
                       (`SPC1.fgu.fac.tid_fx3[2:0]==3'h5) & `SPC1.fgu.fpc.fsr_store_fx3,
                       (`SPC1.fgu.fac.tid_fx3[2:0]==3'h4) & `SPC1.fgu.fpc.fsr_store_fx3,
                       (`SPC1.fgu.fac.tid_fx3[2:0]==3'h3) & `SPC1.fgu.fpc.fsr_store_fx3,
                       (`SPC1.fgu.fac.tid_fx3[2:0]==3'h2) & `SPC1.fgu.fpc.fsr_store_fx3,
                       (`SPC1.fgu.fac.tid_fx3[2:0]==3'h1) & `SPC1.fgu.fpc.fsr_store_fx3,
                       (`SPC1.fgu.fac.tid_fx3[2:0]==3'h0) & `SPC1.fgu.fpc.fsr_store_fx3}) | 
                     block_store_inject_at_w) & 
                   ~(`SPC1.tlu_flush_ifu & real_exception)) | return_f4;

assign exception_w = {{4 {`SPC1.tlu.fls1.exc_for_w}} | 
                      `SPC1.tlu.fls1.bsee_req[3:0] | 
		      `SPC1.tlu.fls1.pdist_ecc_w[3:0],
		      {4 {`SPC1.tlu.fls0.exc_for_w}} |
		      `SPC1.tlu.fls0.bsee_req[3:0] | 
		      `SPC1.tlu.fls0.pdist_ecc_w[3:0]};

// imul check bus - includes imul, save, restore instructions
assign imul_valid = {(`SPC1.exu1.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb1,
                     (`SPC1.exu1.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb1,
                     (`SPC1.exu1.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb1,
                     (`SPC1.exu1.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb1,
                     (`SPC1.exu0.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb0,
                     (`SPC1.exu0.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb0,
                     (`SPC1.exu0.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb0,
                     (`SPC1.exu0.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb0};

// qualify this signal with fgu_err. If fgu_err is encountered, deassert
//fg_cond_fb, so we don't send a step to Riesling.

// FGU conditions
wire fg_cond_fb_pre_err = `SPC1.fgu.fpc.fpc_w1_ul_vld_fb | fcc_valid_fb | 
                     (fmov_valid_fb & ~fg_flush_fb) |
                     (`SPC1.fgu.fac.fsr_w1_vld_fb[1]);  // covers ST(X)FSR, which clears FSR.ftt

assign fg_cond_fb = fg_cond_fb_pre_err  & ~fgu_err_fb;

// Idiv/Fdiv signals

assign fgu_idiv_valid = fg_div_valid & div_idest;


assign fgu_fdiv_valid = fg_fdiv_valid_fw & div_fdest;


// Lsu signals needed to check lsu results

assign lsu_valid     = lsu_check | lsu_data_w;

assign fg_div_valid  = `SPC1.fgu_divide_completion & ~div_special_cancel_f4;
   
// State machine asserts lsu_check for LD hit/miss
always @(posedge `BENCH_SPC1_GCLK) begin
  for (i=0; i<=7;i=i+1) begin // {
      lsu_check[i] <= 1'b0;
      case (lsu_state[i])
        1'b0: // IDLE state
              begin
                // LD hit
                if (lsu_ld_valid & lsu_tid_dec_b[i] & load_b) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - normal case
                else if (lsu_ld_valid & lsu_tid_dec_b[i] & lsu_complete_b[i]) 
                begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - LDD or Block LD or SWAP
                else if (lsu_ld_valid & lsu_tid_dec_b[i]) begin
                  lsu_state[i] <= 1'b1; // VALID state
                end
// Added a new term to handle STB uncorrectable errors on atomic or asi stores that are synced
//Send a complete if an atomic is squashed.
//lsu_trap_flush is asserted a cycle after the block_store_kill is asserted
		else if (`SPC1.lsu.dcc.sync_st[i] & `SPC1.lsu_block_store_kill[i] & ~lsu_trap_flush_d[i])
		begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
                
              end
        1'b1: // VALID state
              begin
                if ((lsu_complete_b[i])) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
              end
      endcase
  end // }
end

   
assign lsu_tid   = `SPC1.lsu.dcc.ld_tid_b[2:0];
// Don't assert LSU_complete in case of dtlb or irf errors

assign lsu_valid_b = (`SPC1.lsu.dcc.pref_inst_b & 
                      ~(dec_flush_lb | `SPC1.lsu.dcc.pipe_flush_b | 
			`SPC1.lsu_dtdp_err_b | `SPC1.lsu_dttp_err_b |
			`SPC1.lsu_dtmh_err_b | `SPC1.lsu.dcc.exu_error_b));

assign lsu_data_b[7:0] = { (lsu_tid == 3'h7) & lsu_valid_b,
                          (lsu_tid == 3'h6) & lsu_valid_b,
                          (lsu_tid == 3'h5) & lsu_valid_b,
                          (lsu_tid == 3'h4) & lsu_valid_b,
                          (lsu_tid == 3'h3) & lsu_valid_b,
                          (lsu_tid == 3'h2) & lsu_valid_b,
                          (lsu_tid == 3'h1) & lsu_valid_b,
                          (lsu_tid == 3'h0) & lsu_valid_b};

assign  lsu_tid_dec_b[0] = `SPC1.lsu.dcc.ld_tid_b[2:0] == 3'd0;
assign  lsu_tid_dec_b[1] = `SPC1.lsu.dcc.ld_tid_b[2:0] == 3'd1;
assign  lsu_tid_dec_b[2] = `SPC1.lsu.dcc.ld_tid_b[2:0] == 3'd2;
assign  lsu_tid_dec_b[3] = `SPC1.lsu.dcc.ld_tid_b[2:0] == 3'd3;
assign  lsu_tid_dec_b[4] = `SPC1.lsu.dcc.ld_tid_b[2:0] == 3'd4;
assign  lsu_tid_dec_b[5] = `SPC1.lsu.dcc.ld_tid_b[2:0] == 3'd5;
assign  lsu_tid_dec_b[6] = `SPC1.lsu.dcc.ld_tid_b[2:0] == 3'd6;
assign  lsu_tid_dec_b[7] = `SPC1.lsu.dcc.ld_tid_b[2:0] == 3'd7;

assign  lsu_ld_valid = (`SPC1.lsu.dcc.exu_ld_vld_b |`SPC1.lsu.dcc.fgu_fld_vld_b) &
                       ~(`SPC1.lsu.dcc.flush_all_b & `SPC1.lsu.dcc.ld_inst_vld_b);
assign  dec_flush_lb = `SPC1.dec.dec_flush_lb | `SPC1.tlu_flush_lsu_b; 


// LSU interface to CCX stub

assign  exu_lsu_valid = `SPC1.dec.del.lsu_valid_e;
assign  exu_lsu_addr[47:0] = `SPC1.exu_lsu_address_e[47:0];
assign  exu_lsu_tid[2:0] = lsu_tid_e[2:0];
assign  exu_lsu_regid[4:0] = `SPC1.dec.dec_lsu_rd_e[4:0];
assign  exu_lsu_data[63:0] = `SPC1.exu_lsu_store_data_e[63:0];
assign  exu_lsu_instr[31:0] =   ({32{`SPC1.dec.dec_lsu_sel0_e}} & 
                                inst0_e[31:0]) |
                                ({32{~`SPC1.dec.dec_lsu_sel0_e}} & 
                                inst1_e[31:0]);
assign ld_inst_d = `SPC1.dec.dec_ld_inst_d;

///////////////////////////////////////////////////////////////////////////////
// Debugging Instruction Opcodes Pipeline
///////////////////////////////////////////////////////////////////////////////


   reg [31:0] op_0_w;
   reg [31:0] op_1_w;
   reg [31:0] op_2_w;
   reg [31:0] op_3_w;
   reg [31:0] op_4_w;
   reg [31:0] op_5_w;
   reg [31:0] op_6_w;
   reg [31:0] op_7_w;

   reg [31:0] op0_b;
   reg [31:0] op0_m;
   reg [31:0] op0_e;
   reg [31:0] op0_d;

   reg [31:0] op1_b;
   reg [31:0] op1_m;
   reg [31:0] op1_e;
   reg [31:0] op1_d;

   reg [255:0] inst0_string_w;
   reg [255:0] inst0_string_b;
   reg [255:0] inst0_string_m;
   reg [255:0] inst0_string_e;
   reg [255:0] inst0_string_d;

   reg [255:0] inst1_string_w;
   reg [255:0] inst1_string_b;
   reg [255:0] inst1_string_m;
   reg [255:0] inst1_string_e;
   reg [255:0] inst1_string_d;

   reg [255:0] inst0_string_p;
   reg [255:0] inst1_string_p;
   reg [255:0] inst2_string_p;
   reg [255:0] inst3_string_p;
   reg [255:0] inst4_string_p;
   reg [255:0] inst5_string_p;
   reg [255:0] inst6_string_p;
   reg [255:0] inst7_string_p;

initial begin
    op_0_w = 32'b0;
    op_1_w = 32'b0;
    op_2_w = 32'b0;
    op_3_w = 32'b0;
    op_4_w = 32'b0;
    op_5_w = 32'b0;
    op_6_w = 32'b0;
    op_7_w = 32'b0;
end

always @(posedge `BENCH_SPC1_GCLK) begin // {
  op_0_w <= ({32 { select_pc_b[0]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[0]}} & op_0_w[31:0]) ;
  op_1_w <= ({32 { select_pc_b[1]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[1]}} & op_1_w[31:0]) ;
  op_2_w <= ({32 { select_pc_b[2]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[2]}} & op_2_w[31:0]) ;
  op_3_w <= ({32 { select_pc_b[3]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[3]}} & op_3_w[31:0]) ;
  op_4_w <= ({32 { select_pc_b[4]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[4]}} & op_4_w[31:0]) ;
  op_5_w <= ({32 { select_pc_b[5]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[5]}} & op_5_w[31:0]) ;
  op_6_w <= ({32 { select_pc_b[6]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[6]}} & op_6_w[31:0]) ;
  op_7_w <= ({32 { select_pc_b[7]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[7]}} & op_7_w[31:0]) ;

  op0_b <= op0_m;
  op0_m <= op0_e;
  op0_e <= op0_d;
  op0_d <= `SPC1.dec.ded0.decode_mux[31:0];

  op1_b <= op1_m;
  op1_m <= op1_e;
  op1_e <= op1_d;
  op1_d <= `SPC1.dec.ded1.decode_mux[31:0];

  inst0_string_w<=inst0_string_b;
  inst0_string_b<=inst0_string_m;
  inst0_string_m<=inst0_string_e;
  inst0_string_e<=inst0_string_d;
  inst0_string_d<=xlate(`SPC1.dec.ded0.decode_mux[31:0]);

  inst1_string_w<=inst1_string_b;
  inst1_string_b<=inst1_string_m;
  inst1_string_m<=inst1_string_e;
  inst1_string_e<=inst1_string_d;
  inst1_string_d<=xlate(`SPC1.dec.ded1.decode_mux[31:0]);

// instructions for each thread at pick
  inst0_string_p<=xlate(`SPC1.ifu_ibu.ibf0.buf0_in[31:0]);
  inst1_string_p<=xlate(`SPC1.ifu_ibu.ibf1.buf0_in[31:0]);
  inst2_string_p<=xlate(`SPC1.ifu_ibu.ibf2.buf0_in[31:0]);
  inst3_string_p<=xlate(`SPC1.ifu_ibu.ibf3.buf0_in[31:0]);
  inst4_string_p<=xlate(`SPC1.ifu_ibu.ibf4.buf0_in[31:0]);
  inst5_string_p<=xlate(`SPC1.ifu_ibu.ibf5.buf0_in[31:0]);
  inst6_string_p<=xlate(`SPC1.ifu_ibu.ibf6.buf0_in[31:0]);
  inst7_string_p<=xlate(`SPC1.ifu_ibu.ibf7.buf0_in[31:0]);

end //}

///////////////////////////////////////////////////////////////////////////////
// Functions 
///////////////////////////////////////////////////////////////////////////////
function [2:0] onehot2tid;
   input [7:0] onehot;

   begin

   if      (onehot[7:0]==8'b00000001) onehot2tid[2:0] = 3'b000;
   else if (onehot[7:0]==8'b00000010) onehot2tid[2:0] = 3'b001;
   else if (onehot[7:0]==8'b00000100) onehot2tid[2:0] = 3'b010;
   else if (onehot[7:0]==8'b00001000) onehot2tid[2:0] = 3'b011;
   else if (onehot[7:0]==8'b00010000) onehot2tid[2:0] = 3'b100;
   else if (onehot[7:0]==8'b00100000) onehot2tid[2:0] = 3'b101;
   else if (onehot[7:0]==8'b01000000) onehot2tid[2:0] = 3'b110;
   else if (onehot[7:0]==8'b10000000) onehot2tid[2:0] = 3'b111;
   
   end
endfunction

function [7:0] tid2onehot;
   input [2:0] tid;

   begin

   if      (tid[2:0]==3'b000) tid2onehot[7:0] = 8'b00000001;
   else if (tid[2:0]==3'b001) tid2onehot[7:0] = 8'b00000010;
   else if (tid[2:0]==3'b010) tid2onehot[7:0] = 8'b00000100;
   else if (tid[2:0]==3'b011) tid2onehot[7:0] = 8'b00001000;
   else if (tid[2:0]==3'b100) tid2onehot[7:0] = 8'b00010000;
   else if (tid[2:0]==3'b101) tid2onehot[7:0] = 8'b00100000;
   else if (tid[2:0]==3'b110) tid2onehot[7:0] = 8'b01000000;
   else if (tid[2:0]==3'b111) tid2onehot[7:0] = 8'b10000000;
   
   end
endfunction

//---------------------

function [255:0] xlate;
   input [31:0] inst;

   begin
     casex(inst[31:0])
32'b10xxxxx110100xxxxx001000011xxxxx : xlate[255:0]="FADDq";
32'b10xxxxx110100xxxxx001000111xxxxx : xlate[255:0]="FSUBq";
32'b10000xx110101xxxxx001010011xxxxx : xlate[255:0]="FCMPq";
32'b10000xx110101xxxxx001010111xxxxx : xlate[255:0]="FCMPEq";
32'b10xxxxx110100xxxxx011001101xxxxx : xlate[255:0]="FsTOq";
32'b10xxxxx110100xxxxx011001110xxxxx : xlate[255:0]="FdTOq";
32'b10xxxxx110100xxxxx010001100xxxxx : xlate[255:0]="FxTOq";
32'b10xxxxx110100xxxxx011001100xxxxx : xlate[255:0]="FiTOq";
32'b10xxxxx110100xxxxx000000011xxxxx : xlate[255:0]="FMOVq";
32'b10xxxxx110100xxxxx000000111xxxxx : xlate[255:0]="FNEGq";
32'b10xxxxx110100xxxxx000001011xxxxx : xlate[255:0]="FABSq";
32'b10xxxxx110100xxxxx001001011xxxxx : xlate[255:0]="FMULq";
32'b10xxxxx110100xxxxx001101110xxxxx : xlate[255:0]="FdMULq";
32'b10xxxxx110100xxxxx001001111xxxxx : xlate[255:0]="FDIVq";
32'b10xxxxx110100xxxxx000101011xxxxx : xlate[255:0]="FSQRTq";
32'b10xxxxx1101010xxxx0xx100111xxxxx : xlate[255:0]="FMOVrQa";
32'b10xxxxx1101010xxxx0x1x00111xxxxx : xlate[255:0]="FMOVrQb";
32'b10xxxxx110100xxxxx011010011xxxxx : xlate[255:0]="FqTOi";
32'b10xxxxx110100xxxxx010000011xxxxx : xlate[255:0]="FqTOx";
32'b10xxxxx110100xxxxx011000111xxxxx : xlate[255:0]="FqTOs";
32'b10xxxxx110100xxxxx011001011xxxxx : xlate[255:0]="FqTOd";
32'b11xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQF";
32'b11xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFi";
32'b11xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQFA";
32'b11xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFAi";
32'b11xxxxx100110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFi";
32'b11xxxxx100110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQF";
32'b11xxxxx110110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQFA";
32'b11xxxxx110110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFAi";
32'b10xxxxx1101010xxxxxxx000011xxxxx : xlate[255:0]="FMOVQcc";
32'b10xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADD";
32'b10xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDcc";
32'b10xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDC";
32'b10xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDCcc";
32'b10xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDi";
32'b10xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDcci";
32'b10xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCi";
32'b10xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCcci";
32'b00x0xx1011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr1";
32'b00x0x1x011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr2";
32'b00xx000110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfccA";
32'b00xx1xx110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc1";
32'b00xxx1x110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc2";
32'b00xxxx1110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc3";
32'b00xx000101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfccA";
32'b00xx1xx101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc1";
32'b00xxx1x101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc2";
32'b00xxxx1101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc3";
32'b00xx000010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BiccA";
32'b00xx1xx010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc1";
32'b00xxx1x010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc2";
32'b00xxxx1010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc3";
32'b00xx000001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPccA";
32'b00xx1xx001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc1";
32'b00xxx1x001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc2";
32'b00xxxx1001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc3";
32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="CALL";
32'b11xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASA";
32'b11xxxxx111110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASXA";
32'b11xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASAi";
32'b11xxxxx111110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASXAi";
32'b10xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIV";
32'b10xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIV";
32'b10xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVcc";
32'b10xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVcc";
32'b10xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVi";
32'b10xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVi";
32'b10xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVcci";
32'b10xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVcci";
32'b1000000111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="DONE";
32'b1000001111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RETRY";
32'b10xxxxx110100xxxxx001000001xxxxx : xlate[255:0]="FADDs";
32'b10xxxxx110100xxxxx001000010xxxxx : xlate[255:0]="FADDd";
32'b10xxxxx110100xxxxx001000101xxxxx : xlate[255:0]="FSUBs";
32'b10xxxxx110100xxxxx001000110xxxxx : xlate[255:0]="FSUBd";
32'b10000xx110101xxxxx001010001xxxxx : xlate[255:0]="FCMPs";
32'b10000xx110101xxxxx001010010xxxxx : xlate[255:0]="FCMPd";
32'b10000xx110101xxxxx001010101xxxxx : xlate[255:0]="FCMPEs";
32'b10000xx110101xxxxx001010110xxxxx : xlate[255:0]="FCMPEd";
32'b10xxxxx110100xxxxx010000001xxxxx : xlate[255:0]="FsTOx";
32'b10xxxxx110100xxxxx010000010xxxxx : xlate[255:0]="FdTOx";
32'b10xxxxx110100xxxxx011010001xxxxx : xlate[255:0]="FsTOi";
32'b10xxxxx110100xxxxx011010010xxxxx : xlate[255:0]="FdTOi";
32'b10xxxxx110100xxxxx011001001xxxxx : xlate[255:0]="FsTOd";
32'b10xxxxx110100xxxxx011000110xxxxx : xlate[255:0]="FdTOs";
32'b10xxxxx110100xxxxx010000100xxxxx : xlate[255:0]="FxTOs";
32'b10xxxxx110100xxxxx010001000xxxxx : xlate[255:0]="FxTOd";
32'b10xxxxx110100xxxxx011000100xxxxx : xlate[255:0]="FiTOs";
32'b10xxxxx110100xxxxx011001000xxxxx : xlate[255:0]="FiTOd";
32'b10xxxxx110100xxxxx000000001xxxxx : xlate[255:0]="FMOVs";
32'b10xxxxx110100xxxxx000000010xxxxx : xlate[255:0]="FMOVd";
32'b10xxxxx110100xxxxx000000101xxxxx : xlate[255:0]="FNEGs";
32'b10xxxxx110100xxxxx000000110xxxxx : xlate[255:0]="FNEGd";
32'b10xxxxx110100xxxxx000001001xxxxx : xlate[255:0]="FABSs";
32'b10xxxxx110100xxxxx000001010xxxxx : xlate[255:0]="FABSd";
32'b10xxxxx110100xxxxx001001001xxxxx : xlate[255:0]="FMULs";
32'b10xxxxx110100xxxxx001001010xxxxx : xlate[255:0]="FMULd";
32'b10xxxxx110100xxxxx001101001xxxxx : xlate[255:0]="FsMULd";
32'b10xxxxx110100xxxxx001001101xxxxx : xlate[255:0]="FDIVs";
32'b10xxxxx110100xxxxx001001110xxxxx : xlate[255:0]="FDIVd";
32'b10xxxxx110100xxxxx000101001xxxxx : xlate[255:0]="FSQRTs";
32'b10xxxxx110100xxxxx000101010xxxxx : xlate[255:0]="FSQRTd";
32'b10xxxxx111011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSH";
32'b10xxxxx111011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="FLUSHi";
32'b10xxxxx101011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSHw";
32'b10xxxxx111000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="JMPL";
32'b10xxxxx111000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="JMPLi";
32'b11xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDF";
32'b11xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDF";
32'b1100000100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFSR";
32'b1100001100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXFSR";
32'b11xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFi";
32'b11xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFi";
32'b1100000100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFSRi";
32'b1100001100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXFSRi";
32'b11xxxxx110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFA";
32'b11xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDFA";
32'b11xxxxx110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFAi";
32'b11xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFAi";
32'b11xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSB";
32'b11xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSH";
32'b11xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSW";
32'b11xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUB";
32'b11xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUH";
32'b11xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUW";
32'b11xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDX";
32'b11xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDD";
32'b11xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBi";
32'b11xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHi";
32'b11xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWi";
32'b11xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBi";
32'b11xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHi";
32'b11xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWi";
32'b11xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXi";
32'b11xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDi";
32'b11xxxxx011001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSBA";
32'b11xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSHA";
32'b11xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSWA";
32'b11xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUBA";
32'b11xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUHA";
32'b11xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUWA";
32'b11xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXA";
32'b11xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDA";
32'b11xxxxx011001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBAi";
32'b11xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHAi";
32'b11xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWAi";
32'b11xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBAi";
32'b11xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHAi";
32'b11xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWAi";
32'b11xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXAi";
32'b11xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDAi";
32'b11xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUB";
32'b11xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBi";
32'b11xxxxx011101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUBA";
32'b11xxxxx011101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBAi";
32'b10xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="AND";
32'b10xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDcc";
32'b10xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDN";
32'b10xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDNcc";
32'b10xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="OR";
32'b10xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORcc";
32'b10xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORN";
32'b10xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORNcc";
32'b10xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XOR";
32'b10xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XORcc";
32'b10xxxxx000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNOR";
32'b10xxxxx010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNORcc";
32'b10xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDi";
32'b10xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDcci";
32'b10xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNi";
32'b10xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNcci";
32'b10xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORi";
32'b10xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORcci";
32'b10xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNi";
32'b10xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNcci";
32'b10xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORi";
32'b10xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORcci";
32'b10xxxxx000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORi";
32'b10xxxxx010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORcci";
32'b1000000101000011111xxxxxxxxxxxxx : xlate[255:0]="MEMBAR";
32'b1000000101000011110xxxxxxxxxxxxx : xlate[255:0]="STBAR";
32'b10xxxxx101000000000xxxxxxxxxxxxx : xlate[255:0]="RDY";
32'b10xxxxx101000000100xxxxxxxxxxxxx : xlate[255:0]="RDCCR";
32'b10xxxxx101000000110xxxxxxxxxxxxx : xlate[255:0]="RDASI";
32'b10xxxxx101000001000xxxxxxxxxxxxx : xlate[255:0]="RDTICK";
32'b10xxxxx101000001010xxxxxxxxxxxxx : xlate[255:0]="RDPC";
32'b10xxxxx101000001100xxxxxxxxxxxxx : xlate[255:0]="RDFPRS";
32'b10xxxxx101000100110xxxxxxxxxxxxx : xlate[255:0]="RDGSR";
32'b10xxxxx101000100000xxxxxxxxxxxxx : xlate[255:0]="RDPCR";
32'b10xxxxx101000100010xxxxxxxxxxxxx : xlate[255:0]="RDPIC";
32'b10xxxxx1101010xxxx0xx000001xxxxx : xlate[255:0]="FMOVSfcc";
32'b10xxxxx1101010xxxx1xx000001xxxxx : xlate[255:0]="FMOVSxcc";
32'b10xxxxx1101010xxxx0xx000010xxxxx : xlate[255:0]="FMOVDfcc";
32'b10xxxxx1101010xxxx1xx000010xxxxx : xlate[255:0]="FMOVDxcc";
32'b10xxxxx110101xxxxx0xx100101xxxxx : xlate[255:0]="FMOVrS1";
32'b10xxxxx110101xxxxx0x1x00101xxxxx : xlate[255:0]="FMOVrS2";
32'b10xxxxx110101xxxxx0xx100110xxxxx : xlate[255:0]="FMOVrD1";
32'b10xxxxx110101xxxxx0x1x00110xxxxx : xlate[255:0]="FMOVrD2";
32'b10xxxxx1011001xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVxcc";
32'b10xxxxx1011001xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVxcci";
32'b10xxxxx1011000xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVfcc";
32'b10xxxxx1011000xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVfcci";
32'b10xxxxx101111xxxxx0xx1xxxxxxxxxx : xlate[255:0]="MOVR1";
32'b10xxxxx101111xxxxx0x1xxxxxxxxxxx : xlate[255:0]="MOVR2";
32'b10xxxxx101111xxxxx1xx1xxxxxxxxxx : xlate[255:0]="MOVRi1";
32'b10xxxxx101111xxxxx1x1xxxxxxxxxxx : xlate[255:0]="MOVRi2";
32'b10xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULX";
32'b10xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVX";
32'b10xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVX";
32'b10xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULXi";
32'b10xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVXi";
32'b10xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVXi";
32'b10xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMUL";
32'b10xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMUL";
32'b10xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMULcc";
32'b10xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMULcc";
32'b10xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULi";
32'b10xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULi";
32'b10xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULcci";
32'b10xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULcci";
32'b10xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULScc";
32'b10xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULScci";
32'b10xxxxx101110000000xxxxxxxxxxxxx : xlate[255:0]="POPC";
32'b10xxxxx101110000001xxxxxxxxxxxxx : xlate[255:0]="POPCi";
32'b11xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCH";
32'b11xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHi";
32'b11xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCHA";
32'b11xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHAi";
32'b10xxxxx101010xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDPR";
32'b10xxxxx101001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDHPR";
32'b10xxxxx111001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RETURN";
32'b10xxxxx111001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RETURNi";
32'b10xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SAVE";
32'b10xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SAVEi";
32'b10xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RESTORE";
32'b10xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RESTOREi";
32'b1000000110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="SAVED";
32'b1000001110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RESTORED";
32'b00xxxxx100xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="SETHI";
32'b10xxxxx100101xxxxx00xxxxxxxxxxxx : xlate[255:0]="SLL";
32'b10xxxxx100110xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRL";
32'b10xxxxx100111xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRA";
32'b10xxxxx100101xxxxx01xxxxxxxxxxxx : xlate[255:0]="SLLX";
32'b10xxxxx100110xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRLX";
32'b10xxxxx100111xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRAX";
32'b10xxxxx100101xxxxx10xxxxxxxxxxxx : xlate[255:0]="SLLi";
32'b10xxxxx100110xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRLi";
32'b10xxxxx100111xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRAi";
32'b10xxxxx100101xxxxx11xxxxxxxxxxxx : xlate[255:0]="SLLXi";
32'b10xxxxx100110xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRLXi";
32'b10xxxxx100111xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRAXi";
32'b11xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STF";
32'b11xxxxx100111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDF";
32'b1100000100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFSR";
32'b1100001100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXFSR";
32'b11xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFi";
32'b11xxxxx100111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFi";
32'b1100000100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFSRi";
32'b1100001100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXFSRi";
32'b11xxxxx110100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFA";
32'b11xxxxx110111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDFA";
32'b11xxxxx110100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFAi";
32'b11xxxxx110111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFAi";
32'b11xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STB";
32'b11xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STH";
32'b11xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STW";
32'b11xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STX";
32'b11xxxx0000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STD";
32'b11xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBi";
32'b11xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHi";
32'b11xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWi";
32'b11xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXi";
32'b11xxxx0000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDi";
32'b11xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STBA";
32'b11xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STHA";
32'b11xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STWA";
32'b11xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXA";
32'b11xxxx0010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDA";
32'b11xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBAi";
32'b11xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHAi";
32'b11xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWAi";
32'b11xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXAi";
32'b11xxxx0010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDAi";
32'b10xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUB";
32'b10xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBcc";
32'b10xxxxx001100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBC";
32'b10xxxxx011100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBCcc";
32'b10xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBi";
32'b10xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBcci";
32'b10xxxxx001100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCi";
32'b10xxxxx011100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCcci";
32'b11xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAP";
32'b11xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPi";
32'b11xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAPA";
32'b11xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPAi";
32'b10xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDcc";
32'b10xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDccTV";
32'b10xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDcci";
32'b10xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDccTVi";
32'b10xxxxx100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBcc";
32'b10xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBccTV";
32'b10xxxxx100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBcci";
32'b10xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBccTVi";
32'b10xxxxx111010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TCC";
32'b10xxxxx111010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TCCi";
32'b10xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPR";
32'b10xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPRi";
32'b10xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRHPR";
32'b10xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRHPRi";
32'b1000000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRY";
32'b1000010110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRCCR";
32'b1000011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRASI";
32'b1000110110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRFPRS";
32'b1010011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRGSR";
32'b1010000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPCR";
32'b1010001110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPIC";
32'b1000000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRYi";
32'b1000010110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRCCRi";
32'b1000011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRASIi";
32'b1000110110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRFPRSi";
32'b1010011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRGSRi";
32'b1010000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPCRi";
32'b1010001110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPICi";
32'b1001111110000000001xxxxxxxxxxxxx : xlate[255:0]="SIR";
32'b10xxxxx110110xxxxx001010000xxxxx : xlate[255:0]="FPADD16";
32'b10xxxxx110110xxxxx001010001xxxxx : xlate[255:0]="FPADD16S";
32'b10xxxxx110110xxxxx001010010xxxxx : xlate[255:0]="FPADD32";
32'b10xxxxx110110xxxxx001010011xxxxx : xlate[255:0]="FPADD32S";
32'b10xxxxx110110xxxxx001010100xxxxx : xlate[255:0]="FPSUB16";
32'b10xxxxx110110xxxxx001010101xxxxx : xlate[255:0]="FPSUB16S";
32'b10xxxxx110110xxxxx001010110xxxxx : xlate[255:0]="FPSUB32";
32'b10xxxxx110110xxxxx001010111xxxxx : xlate[255:0]="FPSUB32S";
32'b10xxxxx110110xxxxx000111011xxxxx : xlate[255:0]="FPACK16";
32'b10xxxxx110110xxxxx000111010xxxxx : xlate[255:0]="FPACK32";
32'b10xxxxx110110xxxxx000111101xxxxx : xlate[255:0]="FPACKFIX";
32'b10xxxxx110110xxxxx001001101xxxxx : xlate[255:0]="FEXPAND";
32'b10xxxxx110110xxxxx001001011xxxxx : xlate[255:0]="FPMERGE";
32'b10xxxxx110110xxxxx000110001xxxxx : xlate[255:0]="FMUL8x16";
32'b10xxxxx110110xxxxx000110011xxxxx : xlate[255:0]="FMUL8x16AU";
32'b10xxxxx110110xxxxx000110101xxxxx : xlate[255:0]="FMUL8x16AL";
32'b10xxxxx110110xxxxx000110110xxxxx : xlate[255:0]="FMUL8SUx16";
32'b10xxxxx110110xxxxx000110111xxxxx : xlate[255:0]="FMUL8ULx16";
32'b10xxxxx110110xxxxx000111000xxxxx : xlate[255:0]="FMULD8SUx16";
32'b10xxxxx110110xxxxx000111001xxxxx : xlate[255:0]="FMULD8ULx16";
32'b10xxxxx110110xxxxx000011000xxxxx : xlate[255:0]="ALIGNADDRESS";
32'b10xxxxx110110xxxxx000011010xxxxx : xlate[255:0]="ALIGNADDRESS_LITTLE";
32'b10xxxxx110110xxxxx000011001xxxxx : xlate[255:0]="BMASK";
32'b10xxxxx110110xxxxx001001000xxxxx : xlate[255:0]="FALIGNDATA";
32'b10xxxxx110110xxxxx001001100xxxxx : xlate[255:0]="BSHUFFLE";
32'b10xxxxx110110xxxxx001100000xxxxx : xlate[255:0]="FZERO";
32'b10xxxxx110110xxxxx001100001xxxxx : xlate[255:0]="FZEROS";
32'b10xxxxx110110xxxxx001111110xxxxx : xlate[255:0]="FONE";
32'b10xxxxx110110xxxxx001111111xxxxx : xlate[255:0]="FONES";
32'b10xxxxx110110xxxxx001110100xxxxx : xlate[255:0]="FSRC1";
32'b10xxxxx110110xxxxx001110101xxxxx : xlate[255:0]="FSRC1S";
32'b10xxxxx110110xxxxx001111000xxxxx : xlate[255:0]="FSRC2";
32'b10xxxxx110110xxxxx001111001xxxxx : xlate[255:0]="FSRC2S";
32'b10xxxxx110110xxxxx001101010xxxxx : xlate[255:0]="FNOT1";
32'b10xxxxx110110xxxxx001101011xxxxx : xlate[255:0]="FNOT1S";
32'b10xxxxx110110xxxxx001100110xxxxx : xlate[255:0]="FNOT2";
32'b10xxxxx110110xxxxx001100111xxxxx : xlate[255:0]="FNOT2S";
32'b10xxxxx110110xxxxx001111100xxxxx : xlate[255:0]="FOR";
32'b10xxxxx110110xxxxx001111101xxxxx : xlate[255:0]="FORS";
32'b10xxxxx110110xxxxx001100010xxxxx : xlate[255:0]="FNOR";
32'b10xxxxx110110xxxxx001100011xxxxx : xlate[255:0]="FNORS";
32'b10xxxxx110110xxxxx001110000xxxxx : xlate[255:0]="FAND";
32'b10xxxxx110110xxxxx001110001xxxxx : xlate[255:0]="FANDS";
32'b10xxxxx110110xxxxx001101110xxxxx : xlate[255:0]="FNAND";
32'b10xxxxx110110xxxxx001101111xxxxx : xlate[255:0]="FNANDS";
32'b10xxxxx110110xxxxx001101100xxxxx : xlate[255:0]="FXOR";
32'b10xxxxx110110xxxxx001101101xxxxx : xlate[255:0]="FXORS";
32'b10xxxxx110110xxxxx001110010xxxxx : xlate[255:0]="FXNOR";
32'b10xxxxx110110xxxxx001110011xxxxx : xlate[255:0]="FXNORS";
32'b10xxxxx110110xxxxx001111010xxxxx : xlate[255:0]="FORNOT1";
32'b10xxxxx110110xxxxx001111011xxxxx : xlate[255:0]="FORNOT1S";
32'b10xxxxx110110xxxxx001110110xxxxx : xlate[255:0]="FORNOT2";
32'b10xxxxx110110xxxxx001110111xxxxx : xlate[255:0]="FORNOT2S";
32'b10xxxxx110110xxxxx001101000xxxxx : xlate[255:0]="FANDNOT1";
32'b10xxxxx110110xxxxx001101001xxxxx : xlate[255:0]="FANDNOT1S";
32'b10xxxxx110110xxxxx001100100xxxxx : xlate[255:0]="FANDNOT2";
32'b10xxxxx110110xxxxx001100101xxxxx : xlate[255:0]="FANDNOT2S";
32'b10xxxxx110110xxxxx000101000xxxxx : xlate[255:0]="FCMPGT16";
32'b10xxxxx110110xxxxx000101100xxxxx : xlate[255:0]="FCMPGT32";
32'b10xxxxx110110xxxxx000100000xxxxx : xlate[255:0]="FCMPLE16";
32'b10xxxxx110110xxxxx000100100xxxxx : xlate[255:0]="FCMPLE32";
32'b10xxxxx110110xxxxx000100010xxxxx : xlate[255:0]="FCMPNE16";
32'b10xxxxx110110xxxxx000100110xxxxx : xlate[255:0]="FCMPNE32";
32'b10xxxxx110110xxxxx000101010xxxxx : xlate[255:0]="FCMPEQ16";
32'b10xxxxx110110xxxxx000101110xxxxx : xlate[255:0]="FCMPEQ32";
32'b10xxxxx110110xxxxx000111110xxxxx : xlate[255:0]="PDIST";
32'b10xxxxx110110xxxxx000000000xxxxx : xlate[255:0]="EDGE8";
32'b10xxxxx110110xxxxx000000001xxxxx : xlate[255:0]="EDGE8N";
32'b10xxxxx110110xxxxx000000010xxxxx : xlate[255:0]="EDGE8L";
32'b10xxxxx110110xxxxx000000011xxxxx : xlate[255:0]="EDGE8LN";
32'b10xxxxx110110xxxxx000000100xxxxx : xlate[255:0]="EDGE16";
32'b10xxxxx110110xxxxx000000101xxxxx : xlate[255:0]="EDGE16N";
32'b10xxxxx110110xxxxx000000110xxxxx : xlate[255:0]="EDGE16L";
32'b10xxxxx110110xxxxx000000111xxxxx : xlate[255:0]="EDGE16LN";
32'b10xxxxx110110xxxxx000001000xxxxx : xlate[255:0]="EDGE32";
32'b10xxxxx110110xxxxx000001001xxxxx : xlate[255:0]="EDGE32N";
32'b10xxxxx110110xxxxx000001010xxxxx : xlate[255:0]="EDGE32L";
32'b10xxxxx110110xxxxx000001011xxxxx : xlate[255:0]="EDGE32LN";
32'b10xxxxx110110xxxxx000010000xxxxx : xlate[255:0]="ARRAY8";
32'b10xxxxx110110xxxxx000010010xxxxx : xlate[255:0]="ARRAY16";
32'b10xxxxx110110xxxxx000010100xxxxx : xlate[255:0]="ARRAY32";
32'b10xxxxx110110xxxxx010000001xxxxx : xlate[255:0]="SIAM";
       default : xlate[255:0]="unknown";
    endcase   
   end
endfunction // xlate


`endif
   
endmodule

`endif


`ifdef CORE_2

module nas_probes2;


`ifdef GATESIM


`else
   reg [7:0] ex_valid_m;
   reg [7:0] ex_valid_b;
   reg [7:0] ex_valid_w;
   reg [7:0] return_f4;
   reg [2:0] ex0_tid_m;
   reg [2:0] ex1_tid_m;
   reg [2:0] ex0_tid_b;
   reg [2:0] ex1_tid_b;
   reg [2:0] ex0_tid_w;
   reg [2:0] ex1_tid_w;
   reg       fgu_valid_fb0;
   reg       fgu_valid_fb1;

   reg [31:0] inst0_e;
   reg [31:0] inst1_e;

   reg [7:0] fg_valid;

   reg fcc_valid_f4;
   reg fcc_valid_f5;
   reg fcc_valid_fb;

   reg fgu0_e;
   reg fgu1_e;
   reg lsu0_e;
   reg lsu1_e;

   reg [1:0] dcd_idest_e;
   reg [1:0] dcd_fdest_e;

   wire [7:0] ex_valid;
   wire [7:0] exception_w;

   wire [7:0] imul_valid;

   wire       fg_cond_fb;

   wire        exu_lsu_valid;
   wire [47:0] exu_lsu_addr;
   wire [31:0] exu_lsu_instr;
   wire [2:0]  exu_lsu_tid;
   wire [4:0]  exu_lsu_regid;
   wire [63:0] exu_lsu_data;

   wire [2:0] ex0_tid_e;
   wire [2:0] ex1_tid_e;
   wire       ex0_valid_e;
   wire       ex1_valid_e;
   wire [7:0] ex_asr_access;
   wire       ex_asr_valid;

   wire [7:0] lsu_valid;
   wire [2:0] lsu_tid;
   wire [7:0] lsu_tid_dec_b;
   wire       lsu_ld_valid;
   reg  [7:0] lsu_data_w;
   wire [7:0] lsu_data_b;

   wire ld_inst_d;

   reg [7:0] div_idest;
   reg [7:0] div_fdest;
   
   reg load0_e;
   reg load1_e;

   reg load_m;
   reg load_b;

   reg [2:0] lsu_tid_m;
   reg [7:0] lsu_complete_m;
   reg [7:0] lsu_complete_b;
   reg [7:0] lsu_trap_flush_d;	//reqd. for store buffer ue testing

   reg [7:0] ex_flush_w;
   reg [7:0] ex_flush_b;

   reg sel_divide0_e;
   reg sel_divide1_e;

   wire dec_flush_lb;

   wire [7:0] fgu_idiv_valid;

   wire [7:0] fgu_fdiv_valid;
   
   wire [7:0] fg_div_valid;

   wire       lsu_valid_b;

   wire [7:0] return_w;
   wire       return0;
   wire       return1;
   wire [7:0] real_exception;

   reg  [2:0] lsu_tid_b;
   reg        fmov_valid_fb;
   reg        fmov_valid_f5;
   reg        fmov_valid_f4;
   reg        fmov_valid_f3;
   reg        fmov_valid_f2;
   reg        fmov_valid_m;
   reg        fmov_valid_e;

   reg        fg_flush_fb;
   reg        fg_flush_f5;
   reg        fg_flush_f4;
   reg        fg_flush_f3;
   reg        fg_flush_f2;

   reg       siam0_d;   
   reg       siam1_d;   

   reg       done0_d;
   reg       done1_d;
   reg       retry0_d;
   reg       retry1_d;
   reg       done0_e;
   reg       done1_e;
   reg       retry0_e;
   reg       retry1_e;
   reg       tlu_ccr_cwp_0_valid_last;
   reg       tlu_ccr_cwp_1_valid_last;
   reg [7:0] fg_fdiv_valid_fw;
   reg [7:0] asi_in_progress_b;
   reg [7:0] asi_in_progress_w;
   reg [7:0] asi_in_progress_fx4;
   reg [7:0] tlu_valid;
   reg [7:0] sync_reset_w;
            
   reg [7:0] div_special_cancel_f4;

   reg       asi_store_b;
   reg       asi_store_w;
   reg [2:0] dcc_tid_b;
   reg [2:0] dcc_tid_w;
   reg [7:0] asi_valid_w;
   reg [7:0] asi_valid_fx4;
   reg [7:0] asi_valid_fx5;

   reg [7:0] lsu_state;
   reg [7:0] lsu_check;
   reg [2:0] lsu_tid_e;

   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;

   reg fgu_err_fx3; 
   reg fgu_err_fx4; 
   reg fgu_err_fx5; 
   reg fgu_err_fb; 

   reg clkstop_d1;
   reg clkstop_d2;
   reg clkstop_d3;
   reg clkstop_d4;
   reg clkstop_d5;

integer i;
integer start_dmiss0;
integer start_dmiss1;
integer start_dmiss2;
integer start_dmiss3;
integer start_dmiss4;
integer start_dmiss5;
integer start_dmiss6;
integer start_dmiss7;
integer number_dmiss;
integer start_imiss0;
integer start_imiss1;
integer start_imiss2;
integer start_imiss3;
integer start_imiss4;
integer start_imiss5;
integer start_imiss6;
integer start_imiss7;
integer active_imiss0;
integer active_imiss1;
integer active_imiss2;
integer active_imiss3;
integer active_imiss4;
integer active_imiss5;
integer active_imiss6;
integer active_imiss7;
integer first_imiss0;
integer first_imiss1;
integer first_imiss2;
integer first_imiss3;
integer first_imiss4;
integer first_imiss5;
integer first_imiss6;
integer first_imiss7;
integer number_imiss;
integer clock;
integer sum_dmiss_latency;
integer sum_imiss_latency;
reg spec_dmiss;
integer dmiss_cnt;
integer imiss_cnt;
reg pcx_req;
integer l15dmiss_cnt;
integer l15imiss_cnt;


initial begin // {
    pcx_req=0;
    l15imiss_cnt=0;
    l15dmiss_cnt=0;
    imiss_cnt=0;
    dmiss_cnt=0;
    clock=0;
    start_dmiss0=0;
    start_dmiss1=0;
    start_dmiss2=0;
    start_dmiss3=0;
    start_dmiss4=0;
    start_dmiss5=0;
    start_dmiss6=0;
    start_dmiss7=0;
    number_dmiss=0;
    start_imiss0=0;
    start_imiss1=0;
    start_imiss2=0;
    start_imiss3=0;
    start_imiss4=0;
    start_imiss5=0;
    start_imiss6=0;
    start_imiss7=0;
    active_imiss0=0;
    active_imiss1=0;
    active_imiss2=0;
    active_imiss3=0;
    active_imiss4=0;
    active_imiss5=0;
    active_imiss6=0;
    active_imiss7=0;
    first_imiss0=0;
    first_imiss1=0;
    first_imiss2=0;
    first_imiss3=0;
    first_imiss4=0;
    first_imiss5=0;
    first_imiss6=0;
    first_imiss7=0;
    number_imiss=0;
    sum_dmiss_latency=0;
    sum_imiss_latency=0;
    asi_in_progress_b <= 8'h0;
    asi_in_progress_w <= 8'h0;
    asi_in_progress_fx4 <= 8'h0;
    tlu_valid <= 8'h0;
    div_idest <= 8'h0;
    div_fdest <= 8'h0;
    lsu_state <= 8'h0;
    clkstop_d1 <=0;
    clkstop_d2 <=0;
    clkstop_d3 <=0;
    clkstop_d4 <=0;
    clkstop_d5 <=0;

end //}

wire [7:0] asi_store_flush_w =  {`SPC2.lsu.sbs7.flush_st_w,
                                 `SPC2.lsu.sbs6.flush_st_w,
                                 `SPC2.lsu.sbs5.flush_st_w,
                                 `SPC2.lsu.sbs4.flush_st_w,
                                 `SPC2.lsu.sbs3.flush_st_w,
                                 `SPC2.lsu.sbs2.flush_st_w,
                                 `SPC2.lsu.sbs1.flush_st_w,
                                 `SPC2.lsu.sbs0.flush_st_w};

wire [7:0] store_sync = {`SPC2.lsu.sbs7.trap_sync,
                         `SPC2.lsu.sbs6.trap_sync,
                         `SPC2.lsu.sbs5.trap_sync,
                         `SPC2.lsu.sbs4.trap_sync,
                         `SPC2.lsu.sbs3.trap_sync,
                         `SPC2.lsu.sbs2.trap_sync,
                         `SPC2.lsu.sbs1.trap_sync,
                         `SPC2.lsu.sbs0.trap_sync};
wire [7:0] sync_reset = {`SPC2.lsu.sbs7.sync_state_rst,
                         `SPC2.lsu.sbs6.sync_state_rst,
                         `SPC2.lsu.sbs5.sync_state_rst,
                         `SPC2.lsu.sbs4.sync_state_rst,
                         `SPC2.lsu.sbs3.sync_state_rst,
                         `SPC2.lsu.sbs2.sync_state_rst,
                         `SPC2.lsu.sbs1.sync_state_rst,
                         `SPC2.lsu.sbs0.sync_state_rst};

//--------------------
// Used in nas_pipe for TSB Config Regs Capture/Compare
// ADD_TSB_CFG

// NOTE - ADD_TSB_CFG will never be used for Axis or Tharas
`ifndef EMUL
wire [63:0] ctxt_z_tsb_cfg0_reg [7:0];  // 1 per thread
wire [63:0] ctxt_z_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg3_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg0_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg3_reg [7:0];

// There are 32 entries in each MMU MRA but not all are needed.
// Indexing:
// Bits 4:3 of the address are the lower two bits of the TID
// Bits 2:0 of the address select the register as below
//   mmu.mra0.array.mem for T0-T3
//   mmu.mra1.array.mem for T4-T7
// (this is documented in mmu_asi_ctl.sv)
//		z TSB cfg 0,1				address 0
//		z TSB cfg 2,3				address 1
//		nz TSB cfg 0,1				address 2
//		nz TSB cfg 2,3				address 3
//		Real range, physical offset pair 0	address 4
//		Real range, physical offset pair 1	address 5
//		Real range, physical offset pair 2	address 6
//		Real range, physical offset pair 3	address 7

wire [83:0] mmu_mra0_a0 = `SPC2.mmu.mra0.array.mem[0];
wire [83:0] mmu_mra0_a8 = `SPC2.mmu.mra0.array.mem[8];
wire [83:0] mmu_mra0_a16 = `SPC2.mmu.mra0.array.mem[16];
wire [83:0] mmu_mra0_a24 = `SPC2.mmu.mra0.array.mem[24];
wire [83:0] mmu_mra0_a1 = `SPC2.mmu.mra0.array.mem[1];
wire [83:0] mmu_mra0_a9 = `SPC2.mmu.mra0.array.mem[9];
wire [83:0] mmu_mra0_a17 = `SPC2.mmu.mra0.array.mem[17];
wire [83:0] mmu_mra0_a25 = `SPC2.mmu.mra0.array.mem[25];
wire [83:0] mmu_mra0_a2 = `SPC2.mmu.mra0.array.mem[2];
wire [83:0] mmu_mra0_a10 = `SPC2.mmu.mra0.array.mem[10];
wire [83:0] mmu_mra0_a18 = `SPC2.mmu.mra0.array.mem[18];
wire [83:0] mmu_mra0_a26 = `SPC2.mmu.mra0.array.mem[26];
wire [83:0] mmu_mra0_a3 = `SPC2.mmu.mra0.array.mem[3];
wire [83:0] mmu_mra0_a11 = `SPC2.mmu.mra0.array.mem[11];
wire [83:0] mmu_mra0_a19 = `SPC2.mmu.mra0.array.mem[19];
wire [83:0] mmu_mra0_a27 = `SPC2.mmu.mra0.array.mem[27];
wire [83:0] mmu_mra1_a0 = `SPC2.mmu.mra1.array.mem[0];
wire [83:0] mmu_mra1_a8 = `SPC2.mmu.mra1.array.mem[8];
wire [83:0] mmu_mra1_a16 = `SPC2.mmu.mra1.array.mem[16];
wire [83:0] mmu_mra1_a24 = `SPC2.mmu.mra1.array.mem[24];
wire [83:0] mmu_mra1_a1 = `SPC2.mmu.mra1.array.mem[1];
wire [83:0] mmu_mra1_a9 = `SPC2.mmu.mra1.array.mem[9];
wire [83:0] mmu_mra1_a17 = `SPC2.mmu.mra1.array.mem[17];
wire [83:0] mmu_mra1_a25 = `SPC2.mmu.mra1.array.mem[25];
wire [83:0] mmu_mra1_a2 = `SPC2.mmu.mra1.array.mem[2];
wire [83:0] mmu_mra1_a10 = `SPC2.mmu.mra1.array.mem[10];
wire [83:0] mmu_mra1_a18 = `SPC2.mmu.mra1.array.mem[18];
wire [83:0] mmu_mra1_a26 = `SPC2.mmu.mra1.array.mem[26];
wire [83:0] mmu_mra1_a3 = `SPC2.mmu.mra1.array.mem[3];
wire [83:0] mmu_mra1_a11 = `SPC2.mmu.mra1.array.mem[11];
wire [83:0] mmu_mra1_a19 = `SPC2.mmu.mra1.array.mem[19];
wire [83:0] mmu_mra1_a27 = `SPC2.mmu.mra1.array.mem[27];


// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[0] = {`SPC2.mmu.asi.t0_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[0]  = {`SPC2.mmu.asi.t0_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[0]  = {`SPC2.mmu.asi.t0_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[0]  = {`SPC2.mmu.asi.t0_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[0] = {`SPC2.mmu.asi.t0_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[0] = {`SPC2.mmu.asi.t0_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[0] = {`SPC2.mmu.asi.t0_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[0] = {`SPC2.mmu.asi.t0_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[1] = {`SPC2.mmu.asi.t1_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[1]  = {`SPC2.mmu.asi.t1_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[1]  = {`SPC2.mmu.asi.t1_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[1]  = {`SPC2.mmu.asi.t1_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[1] = {`SPC2.mmu.asi.t1_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[1] = {`SPC2.mmu.asi.t1_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[1] = {`SPC2.mmu.asi.t1_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[1] = {`SPC2.mmu.asi.t1_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[2] = {`SPC2.mmu.asi.t2_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[2]  = {`SPC2.mmu.asi.t2_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[2]  = {`SPC2.mmu.asi.t2_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[2]  = {`SPC2.mmu.asi.t2_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[2] = {`SPC2.mmu.asi.t2_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[2] = {`SPC2.mmu.asi.t2_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[2] = {`SPC2.mmu.asi.t2_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[2] = {`SPC2.mmu.asi.t2_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[3] = {`SPC2.mmu.asi.t3_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[3]  = {`SPC2.mmu.asi.t3_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[3]  = {`SPC2.mmu.asi.t3_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[3]  = {`SPC2.mmu.asi.t3_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[3] = {`SPC2.mmu.asi.t3_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[3] = {`SPC2.mmu.asi.t3_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[3] = {`SPC2.mmu.asi.t3_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[3] = {`SPC2.mmu.asi.t3_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[4] = {`SPC2.mmu.asi.t4_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[4]  = {`SPC2.mmu.asi.t4_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[4]  = {`SPC2.mmu.asi.t4_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[4]  = {`SPC2.mmu.asi.t4_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[4] = {`SPC2.mmu.asi.t4_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[4] = {`SPC2.mmu.asi.t4_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[4] = {`SPC2.mmu.asi.t4_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[4] = {`SPC2.mmu.asi.t4_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[5] = {`SPC2.mmu.asi.t5_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[5]  = {`SPC2.mmu.asi.t5_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[5]  = {`SPC2.mmu.asi.t5_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[5]  = {`SPC2.mmu.asi.t5_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[5] = {`SPC2.mmu.asi.t5_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[5] = {`SPC2.mmu.asi.t5_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[5] = {`SPC2.mmu.asi.t5_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[5] = {`SPC2.mmu.asi.t5_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[6] = {`SPC2.mmu.asi.t6_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[6]  = {`SPC2.mmu.asi.t6_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[6]  = {`SPC2.mmu.asi.t6_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[6]  = {`SPC2.mmu.asi.t6_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[6] = {`SPC2.mmu.asi.t6_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[6] = {`SPC2.mmu.asi.t6_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[6] = {`SPC2.mmu.asi.t6_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[6] = {`SPC2.mmu.asi.t6_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[7] = {`SPC2.mmu.asi.t7_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[7]  = {`SPC2.mmu.asi.t7_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[7]  = {`SPC2.mmu.asi.t7_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[7]  = {`SPC2.mmu.asi.t7_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[7] = {`SPC2.mmu.asi.t7_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[7] = {`SPC2.mmu.asi.t7_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[7] = {`SPC2.mmu.asi.t7_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[7] = {`SPC2.mmu.asi.t7_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };
`endif // EMUL - ADD_TSB_CFG


// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
// Suppress instruction on flush or park request 
// (clear_disrupting_flush_pending_w_in & idl_req_in)
//   Suppress instruction for 'refetch' exception after 
//     not taken branch with annulled delay slot
// NOTE:  'with_errors' means that the signal actually IGNORES instruction
// cache errors and asserts IN SPITE OF instruction cache errors
wire [7:0] select_pc_b_with_errors = 
     {{4 {~`SPC2.dec_flush_b[1]}}, {4 {~`SPC2.dec_flush_b[0]}}} & 
     {{4 {~`SPC2.tlu.fls1.refetch_w_in}}, {4 {~`SPC2.tlu.fls0.refetch_w_in}}} &
     {~(`SPC2.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC2.tlu.fls1.idl_req_in}}),
      ~(`SPC2.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC2.tlu.fls0.idl_req_in}})} &
     {`SPC2.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC2.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Qualify select_pc_b_with_errors to get final select_pc_b signal
// Qualifications are
// 	- instruction cache errors (ic_err_w_in)
//	- disrupting single step completion requests (dsc_req_in)
wire [7:0] select_pc_b = 
     select_pc_b_with_errors[7:0]  &
     {{4 {(~`SPC2.tlu.fls1.ic_err_w_in | `SPC2.tlu.fls1.itlb_nfo_exc_b) & 
          ~`SPC2.tlu.fls1.dsc_req_in}}, 
      {4 {(~`SPC2.tlu.fls0.ic_err_w_in | `SPC2.tlu.fls0.itlb_nfo_exc_b) & 
          ~`SPC2.tlu.fls0.dsc_req_in}}};

//------------------------------------

//original select_pc_b_with errors. Select_pc_b_with_errors is no longer asserted
//if the inst. following an annulled delay slot of a not taken branch has a prebuffer
//error and it reaches B stage. I still need a signal if this happens to trigger the chkr.

wire [7:0] select_pc_b_with_errors_and_refetch =
     {{4 {~`SPC2.dec_flush_b[1]}}, {4 {~`SPC2.dec_flush_b[0]}}} &
     {~(`SPC2.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC2.tlu.fls1.idl_req_in}}),
      ~(`SPC2.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC2.tlu.fls0.idl_req_in}})} &
     {`SPC2.tlu.fls1.tid_dec_valid_b[3:0],
      `SPC2.tlu.fls0.tid_dec_valid_b[3:0]};

// Signals required for bench TLB sync & LDST sync

reg        tlb_bypass_m;
reg        tlb_bypass_b;
reg        tlb_rd_vld_m;
reg        tlb_rd_vld_b;
reg        lsu_tl_gt_0_b;
reg  [7:0] dcc_asi_b;
reg        asi_internal_w;

always @ (posedge `BENCH_SPC2_GCLK) begin // {

  clkstop_d1 <= `SPC2.tcu_clk_stop;
  clkstop_d2 <= clkstop_d1;
  clkstop_d3 <= clkstop_d2;
  clkstop_d4 <= clkstop_d3;
  clkstop_d5 <= clkstop_d4;

  tlb_bypass_m <= `SPC2.lsu.tlb.tlb_bypass;
  tlb_bypass_b <= tlb_bypass_m;
  tlb_rd_vld_m <= `SPC2.lsu.tlb.tlb_rd_vld | `SPC2.lsu.tlb.tlb_cam_vld;
  tlb_rd_vld_b <= tlb_rd_vld_m;

  // This signal is only valid for LD/ST instructions
  lsu_tl_gt_0_b <= `SPC2.lsu.dcc.tl_gt_0_m;

  // Can't use lsu.dcc_asi_b for tlb_sync so pipeline from M to B
  dcc_asi_b <= `SPC2.lsu.dcc_asi_m;

  // LD/ST that will not issue to the crossbar
  asi_internal_w <= `SPC2.lsu.dcc.asi_internal_b;
end // }

// TL determines whether Nucleus or Primary
wire [7:0] asi_num = `SPC2.lsu.dcc.altspace_ldst_b ? 
                     dcc_asi_b : 
                     (lsu_tl_gt_0_b ? 8'h04 : 8'h80);

wire [7:0] itlb_miss   = { (`SPC2.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire [7:0] icache_miss = { (`SPC2.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC2.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC2.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire inst_bypass = (`SPC2.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[0] |
                    `SPC2.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[1] |
                    `SPC2.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[2]);

wire [7:0] fetch_bypass = { (inst_bypass & `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                            (inst_bypass & `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                            (inst_bypass & `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                            (inst_bypass & `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                            (inst_bypass & `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                            (inst_bypass & `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                            (inst_bypass & `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                            (inst_bypass & `SPC2.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                          };

wire [7:0] itlb_wr = {(`SPC2.tlu.trl1.take_itw & `SPC2.tlu.trl1.trap[3]),
                      (`SPC2.tlu.trl1.take_itw & `SPC2.tlu.trl1.trap[2]),
                      (`SPC2.tlu.trl1.take_itw & `SPC2.tlu.trl1.trap[1]),
                      (`SPC2.tlu.trl1.take_itw & `SPC2.tlu.trl1.trap[0]),
                      (`SPC2.tlu.trl0.take_itw & `SPC2.tlu.trl0.trap[3]),
                      (`SPC2.tlu.trl0.take_itw & `SPC2.tlu.trl0.trap[2]),
                      (`SPC2.tlu.trl0.take_itw & `SPC2.tlu.trl0.trap[1]),
                      (`SPC2.tlu.trl0.take_itw & `SPC2.tlu.trl0.trap[0])
                     };

//------------------------------------

reg  [71:0] tick_cmpr_0; 
reg  [71:0] stick_cmpr_0; 
reg  [71:0] hstick_cmpr_0;
reg [151:0] trap_entry_1_t0;
reg [151:0] trap_entry_2_t0;
reg [151:0] trap_entry_3_t0;
reg [151:0] trap_entry_4_t0;
reg [151:0] trap_entry_5_t0;
reg [151:0] trap_entry_6_t0;

always @(posedge `BENCH_SPC2_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_0        <= `SPC2.tlu.tca.array.mem[{2'b0,3'h0}];
      stick_cmpr_0       <= `SPC2.tlu.tca.array.mem[{2'b01,3'h0}];
      hstick_cmpr_0      <= `SPC2.tlu.tca.array.mem[{2'b10,3'h0}];
      trap_entry_1_t0    <= `SPC2.tlu.tsa0.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t0    <= `SPC2.tlu.tsa0.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t0    <= `SPC2.tlu.tsa0.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t0    <= `SPC2.tlu.tsa0.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t0    <= `SPC2.tlu.tsa0.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t0    <= `SPC2.tlu.tsa0.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_1; 
reg  [71:0] stick_cmpr_1; 
reg  [71:0] hstick_cmpr_1;
reg [151:0] trap_entry_1_t1;
reg [151:0] trap_entry_2_t1;
reg [151:0] trap_entry_3_t1;
reg [151:0] trap_entry_4_t1;
reg [151:0] trap_entry_5_t1;
reg [151:0] trap_entry_6_t1;

always @(posedge `BENCH_SPC2_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_1        <= `SPC2.tlu.tca.array.mem[{2'b0,3'h1}];
      stick_cmpr_1       <= `SPC2.tlu.tca.array.mem[{2'b01,3'h1}];
      hstick_cmpr_1      <= `SPC2.tlu.tca.array.mem[{2'b10,3'h1}];
      trap_entry_1_t1    <= `SPC2.tlu.tsa0.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t1    <= `SPC2.tlu.tsa0.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t1    <= `SPC2.tlu.tsa0.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t1    <= `SPC2.tlu.tsa0.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t1    <= `SPC2.tlu.tsa0.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t1    <= `SPC2.tlu.tsa0.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_2; 
reg  [71:0] stick_cmpr_2; 
reg  [71:0] hstick_cmpr_2;
reg [151:0] trap_entry_1_t2;
reg [151:0] trap_entry_2_t2;
reg [151:0] trap_entry_3_t2;
reg [151:0] trap_entry_4_t2;
reg [151:0] trap_entry_5_t2;
reg [151:0] trap_entry_6_t2;

always @(posedge `BENCH_SPC2_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_2        <= `SPC2.tlu.tca.array.mem[{2'b0,3'h2}];
      stick_cmpr_2       <= `SPC2.tlu.tca.array.mem[{2'b01,3'h2}];
      hstick_cmpr_2      <= `SPC2.tlu.tca.array.mem[{2'b10,3'h2}];
      trap_entry_1_t2    <= `SPC2.tlu.tsa0.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t2    <= `SPC2.tlu.tsa0.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t2    <= `SPC2.tlu.tsa0.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t2    <= `SPC2.tlu.tsa0.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t2    <= `SPC2.tlu.tsa0.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t2    <= `SPC2.tlu.tsa0.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_3; 
reg  [71:0] stick_cmpr_3; 
reg  [71:0] hstick_cmpr_3;
reg [151:0] trap_entry_1_t3;
reg [151:0] trap_entry_2_t3;
reg [151:0] trap_entry_3_t3;
reg [151:0] trap_entry_4_t3;
reg [151:0] trap_entry_5_t3;
reg [151:0] trap_entry_6_t3;

always @(posedge `BENCH_SPC2_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_3        <= `SPC2.tlu.tca.array.mem[{2'b0,3'h3}];
      stick_cmpr_3       <= `SPC2.tlu.tca.array.mem[{2'b01,3'h3}];
      hstick_cmpr_3      <= `SPC2.tlu.tca.array.mem[{2'b10,3'h3}];
      trap_entry_1_t3    <= `SPC2.tlu.tsa0.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t3    <= `SPC2.tlu.tsa0.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t3    <= `SPC2.tlu.tsa0.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t3    <= `SPC2.tlu.tsa0.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t3    <= `SPC2.tlu.tsa0.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t3    <= `SPC2.tlu.tsa0.array.mem[{2'h3, 3'h5}];

end // }
reg  [71:0] tick_cmpr_4; 
reg  [71:0] stick_cmpr_4; 
reg  [71:0] hstick_cmpr_4;
reg [151:0] trap_entry_1_t4;
reg [151:0] trap_entry_2_t4;
reg [151:0] trap_entry_3_t4;
reg [151:0] trap_entry_4_t4;
reg [151:0] trap_entry_5_t4;
reg [151:0] trap_entry_6_t4;

always @(posedge `BENCH_SPC2_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_4        <= `SPC2.tlu.tca.array.mem[{2'b0,3'h4}];
      stick_cmpr_4       <= `SPC2.tlu.tca.array.mem[{2'b01,3'h4}];
      hstick_cmpr_4      <= `SPC2.tlu.tca.array.mem[{2'b10,3'h4}];
      trap_entry_1_t4    <= `SPC2.tlu.tsa1.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t4    <= `SPC2.tlu.tsa1.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t4    <= `SPC2.tlu.tsa1.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t4    <= `SPC2.tlu.tsa1.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t4    <= `SPC2.tlu.tsa1.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t4    <= `SPC2.tlu.tsa1.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_5; 
reg  [71:0] stick_cmpr_5; 
reg  [71:0] hstick_cmpr_5;
reg [151:0] trap_entry_1_t5;
reg [151:0] trap_entry_2_t5;
reg [151:0] trap_entry_3_t5;
reg [151:0] trap_entry_4_t5;
reg [151:0] trap_entry_5_t5;
reg [151:0] trap_entry_6_t5;

always @(posedge `BENCH_SPC2_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_5        <= `SPC2.tlu.tca.array.mem[{2'b0,3'h5}];
      stick_cmpr_5       <= `SPC2.tlu.tca.array.mem[{2'b01,3'h5}];
      hstick_cmpr_5      <= `SPC2.tlu.tca.array.mem[{2'b10,3'h5}];
      trap_entry_1_t5    <= `SPC2.tlu.tsa1.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t5    <= `SPC2.tlu.tsa1.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t5    <= `SPC2.tlu.tsa1.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t5    <= `SPC2.tlu.tsa1.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t5    <= `SPC2.tlu.tsa1.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t5    <= `SPC2.tlu.tsa1.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_6; 
reg  [71:0] stick_cmpr_6; 
reg  [71:0] hstick_cmpr_6;
reg [151:0] trap_entry_1_t6;
reg [151:0] trap_entry_2_t6;
reg [151:0] trap_entry_3_t6;
reg [151:0] trap_entry_4_t6;
reg [151:0] trap_entry_5_t6;
reg [151:0] trap_entry_6_t6;

always @(posedge `BENCH_SPC2_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_6        <= `SPC2.tlu.tca.array.mem[{2'b0,3'h6}];
      stick_cmpr_6       <= `SPC2.tlu.tca.array.mem[{2'b01,3'h6}];
      hstick_cmpr_6      <= `SPC2.tlu.tca.array.mem[{2'b10,3'h6}];
      trap_entry_1_t6    <= `SPC2.tlu.tsa1.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t6    <= `SPC2.tlu.tsa1.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t6    <= `SPC2.tlu.tsa1.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t6    <= `SPC2.tlu.tsa1.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t6    <= `SPC2.tlu.tsa1.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t6    <= `SPC2.tlu.tsa1.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_7; 
reg  [71:0] stick_cmpr_7; 
reg  [71:0] hstick_cmpr_7;
reg [151:0] trap_entry_1_t7;
reg [151:0] trap_entry_2_t7;
reg [151:0] trap_entry_3_t7;
reg [151:0] trap_entry_4_t7;
reg [151:0] trap_entry_5_t7;
reg [151:0] trap_entry_6_t7;

always @(posedge `BENCH_SPC2_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_7        <= `SPC2.tlu.tca.array.mem[{2'b0,3'h7}];
      stick_cmpr_7       <= `SPC2.tlu.tca.array.mem[{2'b01,3'h7}];
      hstick_cmpr_7      <= `SPC2.tlu.tca.array.mem[{2'b10,3'h7}];
      trap_entry_1_t7    <= `SPC2.tlu.tsa1.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t7    <= `SPC2.tlu.tsa1.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t7    <= `SPC2.tlu.tsa1.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t7    <= `SPC2.tlu.tsa1.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t7    <= `SPC2.tlu.tsa1.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t7    <= `SPC2.tlu.tsa1.array.mem[{2'h3, 3'h5}];

end // }

//------------------------------------
// ASI & Trap State machines
always @(posedge `BENCH_SPC2_GCLK) begin // {

//    pc_0_e[47:0] <= `SPC2.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC2.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC2.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC2.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;


    // altspace_ldst_m is asserted for asi accesses that don't change arch state
    asi_store_b <= (`SPC2.lsu.dcc.asi_store_m & `SPC2.lsu.dcc.asi_sync_m);
    asi_store_w <= asi_store_b;
    dcc_tid_b <= `SPC2.lsu.dcc.dcc_tid_m;
    dcc_tid_w <= dcc_tid_b;

    // ASI in progress state m/c
    if (asi_store_w & ~asi_store_flush_w[dcc_tid_w]) begin // {
        asi_in_progress_b[dcc_tid_w] <= 1'b1;
    end // }

    asi_valid_w <= asi_in_progress_b & store_sync;

    // Delay asi_valid_w and asi_in_progress
    // 2 clocks to ensure TLB Sync DTLBWRITE (demap) comes before SSTEP stxa
    asi_valid_fx4 <= asi_valid_w;
    asi_valid_fx5 <= asi_valid_fx4;
    asi_in_progress_w <= asi_in_progress_b;
    asi_in_progress_fx4 <= asi_in_progress_w;
    sync_reset_w <= sync_reset;
    
    for (i=0;i<8;i=i+1) begin // {
        if (asi_valid_w[i] | sync_reset_w[i]) begin // {
            asi_in_progress_b[i] <= 1'b0;
        end//}
    end //}

    // Trap0 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC2.tlu.tlu_trap_0_tid[1:0] == i) &&
            `SPC2.tlu.tlu_trap_pc_0_valid & tlu_ccr_cwp_0_valid_last)
        begin //{
            tlu_valid[i] <= 1'b1;
        end //}
        // Trap taken
        else if (`SPC2.tlu.trl0.real_trap[i] & ~`SPC2.tlu.trl0.take_por) begin // {
            tlu_valid[i] <= 1'b1;
        end //}
        else 
            tlu_valid[i] <= 1'b0;
    end //}

    // Trap1 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC2.tlu.tlu_trap_1_tid[1:0] == i) &&
            `SPC2.tlu.tlu_trap_pc_1_valid & tlu_ccr_cwp_1_valid_last)
        begin //{
            tlu_valid[i+4] <= 1'b1;
        end //} 
        // Trap taken
        else if (`SPC2.tlu.trl1.real_trap[i] & ~`SPC2.tlu.trl1.take_por) begin // {
            tlu_valid[i+4] <= 1'b1;
        end //}
        else 
            tlu_valid[i+4] <= 1'b0;
    end //}

end // }


always @(posedge `BENCH_SPC2_GCLK) begin

// debug code for TPCC analysis
`ifdef TPCC
if (pcx_req==1) begin
	if (`SPC2.spc_pcx_data_pa[129:124]==6'b100000) begin  // l15 dmiss
	  l15dmiss_cnt=l15dmiss_cnt+1;
	  $display("dmissl15 cnt is %0d",l15dmiss_cnt);
	end
	if (`SPC2.spc_pcx_data_pa[129:124]==6'b110000) begin // l15 imiss
	  l15imiss_cnt=l15imiss_cnt+1;
	  $display("imissl15 cnt is %0d",l15imiss_cnt);
	end
	// `TOP.spg.spc_pcx_data_pa[129:124]==6'b100001   -> all stores 
end

pcx_req <= |`SPC2.spc_pcx_req_pq[8:0];
 
if (`SPC2.ifu_l15_valid==1) begin
	imiss_cnt=imiss_cnt+1;
	$display("imiss cnt is %0d",imiss_cnt);
end
if (spec_dmiss==1 && `SPC2.lsu_l15_cancel==0) begin
	dmiss_cnt=dmiss_cnt+1;
	$display("dmiss cnt is %0d",dmiss_cnt);
	
end
spec_dmiss <= `SPC2.lsu_l15_valid & `SPC2.lsu_l15_load;

clock = clock+1;

// keep track of imiss latencies
if (`SPC2.ftu_agc_thr0_cmiss_c==1) begin
     start_imiss0=clock;
     active_imiss0=1;
end
if (active_imiss0==1 && first_imiss0==1 && `SPC2.l15_spc_cpkt[8:6]==3'b000 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss0 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss0=0;
     first_imiss0=0;
end
if (active_imiss0==1 && first_imiss0==0 && `SPC2.l15_spc_cpkt[8:6]==3'b000 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss0=1;
end
if (`SPC2.ftu_agc_thr1_cmiss_c==1) begin
     start_imiss1=clock;
     active_imiss1=1;
end
if (active_imiss1==1 && first_imiss1==1 && `SPC2.l15_spc_cpkt[8:6]==3'b001 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss1 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss1=0;
     first_imiss1=0;
end
if (active_imiss1==1 && first_imiss1==0 && `SPC2.l15_spc_cpkt[8:6]==3'b001 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss1=1;
end
if (`SPC2.ftu_agc_thr2_cmiss_c==1) begin
     start_imiss2=clock;
     active_imiss2=1;
end
if (active_imiss2==1 && first_imiss2==1 && `SPC2.l15_spc_cpkt[8:6]==3'b010 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss2 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss2=0;
     first_imiss2=0;
end
if (active_imiss2==1 && first_imiss2==0 && `SPC2.l15_spc_cpkt[8:6]==3'b010 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss2=1;
end
if (`SPC2.ftu_agc_thr3_cmiss_c==1) begin
     start_imiss3=clock;
     active_imiss3=1;
end
if (active_imiss3==1 && first_imiss3==1  && `SPC2.l15_spc_cpkt[8:6]==3'b011 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss3 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss3=0;
     first_imiss3=0;
end
if (active_imiss3==1 && first_imiss3==0 && `SPC2.l15_spc_cpkt[8:6]==3'b011 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss3=1;
end
if (`SPC2.ftu_agc_thr4_cmiss_c==1) begin
     start_imiss4=clock;
     active_imiss4=1;
end
if (active_imiss4==1 && first_imiss4==1  && `SPC2.l15_spc_cpkt[8:6]==3'b100 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss4 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss4=0;
     first_imiss4=0;
end
if (active_imiss4==1 && first_imiss4==0 && `SPC2.l15_spc_cpkt[8:6]==3'b100 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss4=1;
end
if (`SPC2.ftu_agc_thr5_cmiss_c==1) begin
     start_imiss5=clock;
     active_imiss5=1;
end
if (active_imiss5==1  && first_imiss5==1 && `SPC2.l15_spc_cpkt[8:6]==3'b101 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss5 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss5=0;
     first_imiss5=0;
end
if (active_imiss5==1 && first_imiss5==0 && `SPC2.l15_spc_cpkt[8:6]==3'b101 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss5=1;
end
if (`SPC2.ftu_agc_thr6_cmiss_c==1) begin
     start_imiss6=clock;
     active_imiss6=1;
end
if (active_imiss6==1 && first_imiss6==1 && `SPC2.l15_spc_cpkt[8:6]==3'b110 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss6 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss6=0;
     first_imiss6=0;
end
if (active_imiss6==1 && first_imiss6==0 && `SPC2.l15_spc_cpkt[8:6]==3'b110 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss6=1;
end
if (`SPC2.ftu_agc_thr7_cmiss_c==1) begin
     start_imiss7=clock;
     active_imiss7=1;
end
if (active_imiss7==1 && first_imiss7==1 && `SPC2.l15_spc_cpkt[8:6]==3'b111 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss7 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss7=0;
    first_imiss7=0;
end
if (active_imiss7==1 && first_imiss7==0 && `SPC2.l15_spc_cpkt[8:6]==3'b111 && `SPC2.l15_spc_valid==1 && `SPC2.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss7=1;
end

if (`SPC2.pku.swl0.set_lsu_sync_wait==1) begin
     start_dmiss0=clock;
end
if (`SPC2.pku.swl0.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss0) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC2.pku.swl1.set_lsu_sync_wait==1) begin
     start_dmiss1=clock;
end
if (`SPC2.pku.swl1.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss1) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC2.pku.swl2.set_lsu_sync_wait==1) begin
     start_dmiss2=clock;
end
if (`SPC2.pku.swl2.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss2) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC2.pku.swl3.set_lsu_sync_wait==1) begin
     start_dmiss3=clock;
end
if (`SPC2.pku.swl3.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss3) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC2.pku.swl4.set_lsu_sync_wait==1) begin
     start_dmiss4=clock;
end
if (`SPC2.pku.swl4.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss4) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC2.pku.swl5.set_lsu_sync_wait==1) begin
     start_dmiss5=clock;
end
if (`SPC2.pku.swl5.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss5) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC2.pku.swl6.set_lsu_sync_wait==1) begin
     start_dmiss6=clock;
end
if (`SPC2.pku.swl6.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss6) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC2.pku.swl7.set_lsu_sync_wait==1) begin
     start_dmiss7=clock;
end
if (`SPC2.pku.swl7.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss7) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
`endif



   lsu_tid_e[2:0] <= `SPC2.lsu.dcc.tid_d[2:0];

   // FG Valid conditions

   // Add fcc valids to fg_valid
   fcc_valid_fb <= fcc_valid_f5;
   fcc_valid_f5 <= fcc_valid_f4;
   fcc_valid_f4 <= |`SPC2.fgu.fgu_cmp_fcc_vld_fx3[3:0];

   fg_flush_fb <= fg_flush_f5;
   fg_flush_f5 <= fg_flush_f4;
   fg_flush_f4 <= fg_flush_f3;
   fg_flush_f3 <= fg_flush_f2 | `SPC2.dec_flush_f2 | 
                  `SPC2.tlu_flush_fgu_b;
   fg_flush_f2 <= `SPC2.dec_flush_f1;

   fgu_err_fx3 <= `SPC2.fgu_cecc_fx2 | `SPC2.fgu_uecc_fx2 | `SPC2.fgu.fpc.exu_flush_fx2; // frf or irf ecc error
   fgu_err_fx4 <= fgu_err_fx3;
   fgu_err_fx5 <= fgu_err_fx4;
   fgu_err_fb <= fgu_err_fx5;

   // Siams cause fg_valid ..
   siam0_d = `SPC2.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC2.dec.dec_inst0_d[24:19]==6'b110110 &
             `SPC2.dec.dec_inst0_d[13:5]==9'b010000001;  

   siam1_d = `SPC2.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC2.dec.dec_inst1_d[24:19]==6'b110110 &
             `SPC2.dec.dec_inst1_d[13:5]==9'b010000001;  
    

   done0_d = `SPC2.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC2.dec.dec_inst0_d[29:25]==5'b00000 & 
             `SPC2.dec.dec_inst0_d[24:19]==6'b111110;
   done1_d = `SPC2.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC2.dec.dec_inst1_d[29:25]==5'b00000 & 
             `SPC2.dec.dec_inst1_d[24:19]==6'b111110;    

   retry0_d = `SPC2.dec.dec_inst0_d[31:30]==2'b10 & 
              `SPC2.dec.dec_inst0_d[29:25]==5'b00001 & 
              `SPC2.dec.dec_inst0_d[24:19]==6'b111110;
   retry1_d = `SPC2.dec.dec_inst1_d[31:30]==2'b10 & 
              `SPC2.dec.dec_inst1_d[29:25]==5'b00001 & 
              `SPC2.dec.dec_inst1_d[24:19]==6'b111110;   

   done0_e <= done0_d & `SPC2.dec.dec_decode0_d;
   done1_e <= done1_d & `SPC2.dec.dec_decode1_d; 

   retry0_e <= retry0_d & `SPC2.dec.dec_decode0_d;
   retry1_e <= retry1_d & `SPC2.dec.dec_decode1_d;   


   // fold siam into cmov logic 

   fmov_valid_fb <= fmov_valid_f5;
   fmov_valid_f5 <= fmov_valid_f4;
   fmov_valid_f4 <= fmov_valid_f3;
   fmov_valid_f3 <= fmov_valid_f2;
   fmov_valid_f2 <= fmov_valid_m;
   fmov_valid_m  <= fmov_valid_e & `SPC2.dec.dec_fgu_valid_e;
   fmov_valid_e <= ((`SPC2.exu0.ect.cmov_d | siam0_d) & 
                    `SPC2.dec.dec_decode0_d&`SPC2.dec.del.fgu0_d) |
                    ((`SPC2.exu1.ect.cmov_d | siam1_d) & 
                    `SPC2.dec.dec_decode1_d&`SPC2.dec.del.fgu1_d);
   
   // fgu check bus

   // fcc_valid_fb doesn't assert for LDFSR. LDFSR gets checked by the LSU
   // checker

   fg_valid <= {(`SPC2.fgu.fac.fac_w1_tid_fb[2:0]==3'h7) && fg_cond_fb,
                (`SPC2.fgu.fac.fac_w1_tid_fb[2:0]==3'h6) && fg_cond_fb,
                (`SPC2.fgu.fac.fac_w1_tid_fb[2:0]==3'h5) && fg_cond_fb,
                (`SPC2.fgu.fac.fac_w1_tid_fb[2:0]==3'h4) && fg_cond_fb,
                (`SPC2.fgu.fac.fac_w1_tid_fb[2:0]==3'h3) && fg_cond_fb,
                (`SPC2.fgu.fac.fac_w1_tid_fb[2:0]==3'h2) && fg_cond_fb,
                (`SPC2.fgu.fac.fac_w1_tid_fb[2:0]==3'h1) && fg_cond_fb,
                (`SPC2.fgu.fac.fac_w1_tid_fb[2:0]==3'h0) && fg_cond_fb };
   

   fgu_valid_fb0      <= `SPC2.fgu_exu_w_vld_fx5[0] && !`SPC2.fgu.fpc.div_finish_int_fb;
   fgu_valid_fb1      <= `SPC2.fgu_exu_w_vld_fx5[1] && !`SPC2.fgu.fpc.div_finish_int_fb;

   // Fdiv
   div_special_cancel_f4[7:0] <= tid2onehot(`SPC2.fgu.fac.tid_fx3[2:0]) & 
                               {8{`SPC2.fgu.fac.q_div_default_res_fx3}};
   fg_fdiv_valid_fw <= `SPC2.fgu_divide_completion & ~div_special_cancel_f4 &
                       {8{~`SPC2.fgu.fpc.fpc_fpd_ieee_trap_fb}} &
                       {8{~`SPC2.fgu.fpc.fpc_fpd_unfin_fb}};

    
   // Used in CCX Stub ?
   inst0_e[31:0] <= `SPC2.dec.dec_inst0_d[31:0];
   inst1_e[31:0] <= `SPC2.dec.dec_inst1_d[31:0];

   // only fgu ops that are not loads/stores
   fgu0_e <= `SPC2.dec.del.decode_fgu0_d;  
   fgu1_e <= `SPC2.dec.del.decode_fgu1_d;

   // LSU logic 
   load_b <= load_m;
   load_m <= (load0_e | load1_e);

   load0_e <= (`SPC2.dec.dec_decode0_d & `SPC2.dec.del.lsu0_d & 
               `SPC2.dec.dcd0.dcd_load_d);

   load1_e <= (`SPC2.dec.dec_decode1_d & `SPC2.dec.del.lsu1_d & 
               `SPC2.dec.dcd1.dcd_load_d);

   lsu_tid_b[2:0] <= lsu_tid_m[2:0];
   lsu_tid_m[2:0] <= lsu_tid_e[2:0];

   lsu_complete_m[7:0] <= `SPC2.lsu_complete[7:0];
   lsu_complete_b[7:0] <= lsu_complete_m[7:0];

   lsu_data_w  <= lsu_data_b;
  
   // Divide destination logic ..
   sel_divide0_e <= (`SPC2.dec_decode0_d & 
                     ((`SPC2.pku.swl0.vld_d & `SPC2.pku.swl_divide_wait[0]) |
                      (`SPC2.pku.swl1.vld_d & `SPC2.pku.swl_divide_wait[1]) |
                      (`SPC2.pku.swl2.vld_d & `SPC2.pku.swl_divide_wait[2]) |
                      (`SPC2.pku.swl3.vld_d & `SPC2.pku.swl_divide_wait[3])));
   sel_divide1_e <= (`SPC2.dec_decode1_d & 
                     ((`SPC2.pku.swl4.vld_d & `SPC2.pku.swl_divide_wait[4]) |
                      (`SPC2.pku.swl5.vld_d & `SPC2.pku.swl_divide_wait[5]) |
                      (`SPC2.pku.swl6.vld_d & `SPC2.pku.swl_divide_wait[6]) |
                      (`SPC2.pku.swl7.vld_d & `SPC2.pku.swl_divide_wait[7])));


   dcd_fdest_e <= {`SPC2.dec.del.fdest1_d,`SPC2.dec.del.fdest0_d};
   dcd_idest_e <= {`SPC2.dec.del.idest1_d,`SPC2.dec.del.idest0_d};

   if (sel_divide0_e) begin // {
         div_idest[{1'b0, `SPC2.dec.del.tid0_e[1:0]}] <= dcd_idest_e[0];
         div_fdest[{1'b0, `SPC2.dec.del.tid0_e[1:0]}] <= dcd_fdest_e[0];
   end // }
   if (sel_divide1_e) begin // {
         div_idest[{1'b1, `SPC2.dec.del.tid1_e[1:0]}] <= dcd_idest_e[1];
         div_fdest[{1'b1, `SPC2.dec.del.tid1_e[1:0]}] <= dcd_fdest_e[1];
   end // }
                 

   // EX logic
   // Save EX tids for later use
   ex0_tid_m <= ex0_tid_e;
   ex1_tid_m <= ex1_tid_e;
   ex0_tid_b <= ex0_tid_m;
   ex1_tid_b <= ex1_tid_m;
   ex0_tid_w <= ex0_tid_b;
   ex1_tid_w <= ex1_tid_b;

   // EX Flush conditions
   ex_flush_w <= {ex_flush_b | {{4{(`SPC2.dec.dec_flush_b[1] | 
                                `SPC2.tlu_flush_exu_b[1])}},
                                {4{(`SPC2.dec.dec_flush_b[0] |
                                `SPC2.tlu_flush_exu_b[0])}}}};

   ex_flush_b <= {{4{`SPC2.dec.dec_flush_m[1]}},
                 {4{`SPC2.dec.dec_flush_m[0]}}};


   // ex_valid_f4 valid will only fire on return
   return_f4 <= return_w & ~(`SPC2.tlu_flush_ifu & real_exception);
   ex_valid_w <= ex_valid_b;

   // Cancel EX valid if it turns out to be asr/asi access for this tid 

   ex_valid_b <= ex_valid_m & ~ex_asr_access;


   ex_valid_m <=      { (ex1_tid_e == 2'h3) && ex1_valid_e,
                       (ex1_tid_e == 2'h2) && ex1_valid_e,
                       (ex1_tid_e == 2'h1) && ex1_valid_e,
                       (ex1_tid_e == 2'h0) && ex1_valid_e,
                       (ex0_tid_e == 2'h3) && ex0_valid_e,
                       (ex0_tid_e == 2'h2) && ex0_valid_e,
                       (ex0_tid_e == 2'h1) && ex0_valid_e,
                       (ex0_tid_e == 2'h0) && ex0_valid_e};
   

  // TLU delays for done and retries
  tlu_ccr_cwp_0_valid_last <= `SPC2.tlu.tlu_ccr_cwp_0_valid;
  tlu_ccr_cwp_1_valid_last <= `SPC2.tlu.tlu_ccr_cwp_1_valid;
  

end // END posedge gclk

// Return instruction is separated out of ex*_valid because CWP update is in
// W+1 for return new window is not available for IRF scan (nas_pipe) until
// W+2
assign return0 = `SPC2.exu0.rml.return_w & 
                 `SPC2.exu0.rml.inst_vld_w;
assign return1 = `SPC2.exu1.rml.return_w & 
                 `SPC2.exu1.rml.inst_vld_w;
assign return_w = {(ex1_tid_w == 2'h3) && return1,
                   (ex1_tid_w == 2'h2) && return1,
                   (ex1_tid_w == 2'h1) && return1,
                   (ex1_tid_w == 2'h0) && return1,
                   (ex0_tid_w == 2'h3) && return0,
                   (ex0_tid_w == 2'h2) && return0,
                   (ex0_tid_w == 2'h1) && return0,
                   (ex0_tid_w == 2'h0) && return0};


// Cancel EX valid if it turns out that exception (tlu flush) taken for
// this tid

// exu check bus
assign ex0_tid_e = `SPC2.exu0.ect_tid_lth_e[1:0];
assign ex0_valid_e = `SPC2.dec.dec_valid_e[0] & ~fgu0_e & ~load0_e &
                     ~retry0_e & ~done0_e;
assign ex1_tid_e = `SPC2.exu1.ect_tid_lth_e[1:0];
assign ex1_valid_e = `SPC2.dec.dec_valid_e[1] & ~fgu1_e & ~load1_e &
                     ~retry1_e & ~done1_e;

assign ex_asr_valid = `SPC2.lsu.dcc.asi_store_m & `SPC2.lsu.dcc.asi_sync_m ;

assign ex_asr_access ={(`SPC2.lsu.dcc.dcc_tid_m[2:0]==3'h7) & ex_asr_valid,
                       (`SPC2.lsu.dcc.dcc_tid_m[2:0]==3'h6) & ex_asr_valid,
                       (`SPC2.lsu.dcc.dcc_tid_m[2:0]==3'h5) & ex_asr_valid,
                       (`SPC2.lsu.dcc.dcc_tid_m[2:0]==3'h4) & ex_asr_valid,
                       (`SPC2.lsu.dcc.dcc_tid_m[2:0]==3'h3) & ex_asr_valid,
                       (`SPC2.lsu.dcc.dcc_tid_m[2:0]==3'h2) & ex_asr_valid,
                       (`SPC2.lsu.dcc.dcc_tid_m[2:0]==3'h1) & ex_asr_valid,
                       (`SPC2.lsu.dcc.dcc_tid_m[2:0]==3'h0) & ex_asr_valid};


// EXU valid is ex_valid_w, except flushes, delayed return, traps, and stfsr
// real_exception added because tlu_flush_ifu activates for second redirect
// of retry if TPC and TNPC are not verified as sequential
assign  real_exception =
	   {{4 {`SPC2.tlu.fls1.dec_exc_w | 
		`SPC2.tlu.fls1.exu_exc_w |
		`SPC2.tlu.fls1.lsu_exc_w | 
                `SPC2.tlu.fls1.bsee_req_w}},
	    {4 {`SPC2.tlu.fls0.dec_exc_w | 
		`SPC2.tlu.fls0.exu_exc_w |
		`SPC2.tlu.fls0.lsu_exc_w | 
                `SPC2.tlu.fls0.bsee_req_w}}};

// Do not assert ex_valid for block store instructions
wire [7:0] block_store_first_at_w = 
           {`SPC2.lsu.sbs7.bst_pend & `SPC2.lsu.sbs7.blk_inst_w, 
            `SPC2.lsu.sbs6.bst_pend & `SPC2.lsu.sbs6.blk_inst_w, 
            `SPC2.lsu.sbs5.bst_pend & `SPC2.lsu.sbs5.blk_inst_w, 
            `SPC2.lsu.sbs4.bst_pend & `SPC2.lsu.sbs4.blk_inst_w, 
            `SPC2.lsu.sbs3.bst_pend & `SPC2.lsu.sbs3.blk_inst_w, 
            `SPC2.lsu.sbs2.bst_pend & `SPC2.lsu.sbs2.blk_inst_w, 
            `SPC2.lsu.sbs1.bst_pend & `SPC2.lsu.sbs1.blk_inst_w, 
            `SPC2.lsu.sbs0.bst_pend & `SPC2.lsu.sbs0.blk_inst_w};

// But inject a valid for a block store that's done...
reg [7:0] block_store_w;
always @(posedge `BENCH_SPC2_GCLK) begin
    block_store_w[7:0] <= `SPC2.lsu.lsu_block_store_b[7:0];
    lsu_trap_flush_d <=  `SPC2.lsu_trap_flush[7:0];
end

wire [7:0] block_store_inject_at_w = 
                                    ~`SPC2.lsu.lsu_block_store_b[7:0] & 
                                    block_store_w[7:0] &
                                    {~`SPC2.lsu.sbs7.bst_kill,
                                     ~`SPC2.lsu.sbs6.bst_kill,
                                     ~`SPC2.lsu.sbs5.bst_kill,
                                     ~`SPC2.lsu.sbs4.bst_kill,
                                     ~`SPC2.lsu.sbs3.bst_kill,
                                     ~`SPC2.lsu.sbs2.bst_kill,
                                     ~`SPC2.lsu.sbs1.bst_kill,
                                     ~`SPC2.lsu.sbs0.bst_kill};

assign ex_valid = (((ex_valid_w & ~ex_flush_w & ~return_w & ~block_store_first_at_w & ~exception_w &
                     ~({{4{`SPC2.tlu.fls1.exu_exc_b & `SPC2.tlu.fls1.beat_two_b}},
                        {4{`SPC2.tlu.fls0.exu_exc_b & `SPC2.tlu.fls0.beat_two_b}}}) &
                     ~{(`SPC2.fgu.fac.tid_fx3[2:0]==3'h7) & `SPC2.fgu.fpc.fsr_store_fx3,
                       (`SPC2.fgu.fac.tid_fx3[2:0]==3'h6) & `SPC2.fgu.fpc.fsr_store_fx3,
                       (`SPC2.fgu.fac.tid_fx3[2:0]==3'h5) & `SPC2.fgu.fpc.fsr_store_fx3,
                       (`SPC2.fgu.fac.tid_fx3[2:0]==3'h4) & `SPC2.fgu.fpc.fsr_store_fx3,
                       (`SPC2.fgu.fac.tid_fx3[2:0]==3'h3) & `SPC2.fgu.fpc.fsr_store_fx3,
                       (`SPC2.fgu.fac.tid_fx3[2:0]==3'h2) & `SPC2.fgu.fpc.fsr_store_fx3,
                       (`SPC2.fgu.fac.tid_fx3[2:0]==3'h1) & `SPC2.fgu.fpc.fsr_store_fx3,
                       (`SPC2.fgu.fac.tid_fx3[2:0]==3'h0) & `SPC2.fgu.fpc.fsr_store_fx3}) | 
                     block_store_inject_at_w) & 
                   ~(`SPC2.tlu_flush_ifu & real_exception)) | return_f4;

assign exception_w = {{4 {`SPC2.tlu.fls1.exc_for_w}} | 
                      `SPC2.tlu.fls1.bsee_req[3:0] | 
		      `SPC2.tlu.fls1.pdist_ecc_w[3:0],
		      {4 {`SPC2.tlu.fls0.exc_for_w}} |
		      `SPC2.tlu.fls0.bsee_req[3:0] | 
		      `SPC2.tlu.fls0.pdist_ecc_w[3:0]};

// imul check bus - includes imul, save, restore instructions
assign imul_valid = {(`SPC2.exu1.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb1,
                     (`SPC2.exu1.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb1,
                     (`SPC2.exu1.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb1,
                     (`SPC2.exu1.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb1,
                     (`SPC2.exu0.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb0,
                     (`SPC2.exu0.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb0,
                     (`SPC2.exu0.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb0,
                     (`SPC2.exu0.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb0};

//qualify this signal with fgu_err. If fgu_err is encountered, deassert
//fg_cond_fb, so we don't send a step to Riesling.

// FGU conditions
wire fg_cond_fb_pre_err = `SPC2.fgu.fpc.fpc_w1_ul_vld_fb | fcc_valid_fb | 
                     (fmov_valid_fb & ~fg_flush_fb) |
                     (`SPC2.fgu.fac.fsr_w1_vld_fb[1]);  // covers ST(X)FSR, which clears FSR.ftt

assign fg_cond_fb = fg_cond_fb_pre_err  & ~fgu_err_fb;

// Idiv/Fdiv signals

assign fgu_idiv_valid = fg_div_valid & div_idest;


assign fgu_fdiv_valid = fg_fdiv_valid_fw & div_fdest;


// Lsu signals needed to check lsu results

assign lsu_valid     = lsu_check | lsu_data_w;

assign fg_div_valid  = `SPC2.fgu_divide_completion & ~div_special_cancel_f4;
   
// State machine asserts lsu_check for LD hit/miss
always @(posedge `BENCH_SPC2_GCLK) begin
  for (i=0; i<=7;i=i+1) begin // {
      lsu_check[i] <= 1'b0;
      case (lsu_state[i])
        1'b0: // IDLE state
              begin
                // LD hit
                if (lsu_ld_valid & lsu_tid_dec_b[i] & load_b) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - normal case
                else if (lsu_ld_valid & lsu_tid_dec_b[i] & lsu_complete_b[i]) 
                begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - LDD or Block LD or SWAP
                else if (lsu_ld_valid & lsu_tid_dec_b[i]) begin
                  lsu_state[i] <= 1'b1; // VALID state
                end
// Added a new term to handle STB uncorrectable errors on atomic or asi stores that are synced
//Send a complete if an atomic is squashed.
//lsu_trap_flush is asserted a cycle after the block_store_kill is asserted
		else if (`SPC2.lsu.dcc.sync_st[i] & `SPC2.lsu_block_store_kill[i] & ~lsu_trap_flush_d[i])
		begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
                
              end
        1'b1: // VALID state
              begin
                if ((lsu_complete_b[i])) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
              end
      endcase
  end // }
end

   
assign lsu_tid   = `SPC2.lsu.dcc.ld_tid_b[2:0];
// Don't assert LSU_complete in case of dtlb or irf errors

assign lsu_valid_b = (`SPC2.lsu.dcc.pref_inst_b & 
                      ~(dec_flush_lb | `SPC2.lsu.dcc.pipe_flush_b | 
			`SPC2.lsu_dtdp_err_b | `SPC2.lsu_dttp_err_b |
			`SPC2.lsu_dtmh_err_b | `SPC2.lsu.dcc.exu_error_b));

assign lsu_data_b[7:0] = { (lsu_tid == 3'h7) & lsu_valid_b,
                          (lsu_tid == 3'h6) & lsu_valid_b,
                          (lsu_tid == 3'h5) & lsu_valid_b,
                          (lsu_tid == 3'h4) & lsu_valid_b,
                          (lsu_tid == 3'h3) & lsu_valid_b,
                          (lsu_tid == 3'h2) & lsu_valid_b,
                          (lsu_tid == 3'h1) & lsu_valid_b,
                          (lsu_tid == 3'h0) & lsu_valid_b};

assign  lsu_tid_dec_b[0] = `SPC2.lsu.dcc.ld_tid_b[2:0] == 3'd0;
assign  lsu_tid_dec_b[1] = `SPC2.lsu.dcc.ld_tid_b[2:0] == 3'd1;
assign  lsu_tid_dec_b[2] = `SPC2.lsu.dcc.ld_tid_b[2:0] == 3'd2;
assign  lsu_tid_dec_b[3] = `SPC2.lsu.dcc.ld_tid_b[2:0] == 3'd3;
assign  lsu_tid_dec_b[4] = `SPC2.lsu.dcc.ld_tid_b[2:0] == 3'd4;
assign  lsu_tid_dec_b[5] = `SPC2.lsu.dcc.ld_tid_b[2:0] == 3'd5;
assign  lsu_tid_dec_b[6] = `SPC2.lsu.dcc.ld_tid_b[2:0] == 3'd6;
assign  lsu_tid_dec_b[7] = `SPC2.lsu.dcc.ld_tid_b[2:0] == 3'd7;

assign  lsu_ld_valid = (`SPC2.lsu.dcc.exu_ld_vld_b |`SPC2.lsu.dcc.fgu_fld_vld_b) &
                       ~(`SPC2.lsu.dcc.flush_all_b & `SPC2.lsu.dcc.ld_inst_vld_b);
assign  dec_flush_lb = `SPC2.dec.dec_flush_lb | `SPC2.tlu_flush_lsu_b; 


// LSU interface to CCX stub

assign  exu_lsu_valid = `SPC2.dec.del.lsu_valid_e;
assign  exu_lsu_addr[47:0] = `SPC2.exu_lsu_address_e[47:0];
assign  exu_lsu_tid[2:0] = lsu_tid_e[2:0];
assign  exu_lsu_regid[4:0] = `SPC2.dec.dec_lsu_rd_e[4:0];
assign  exu_lsu_data[63:0] = `SPC2.exu_lsu_store_data_e[63:0];
assign  exu_lsu_instr[31:0] =   ({32{`SPC2.dec.dec_lsu_sel0_e}} & 
                                inst0_e[31:0]) |
                                ({32{~`SPC2.dec.dec_lsu_sel0_e}} & 
                                inst1_e[31:0]);
assign ld_inst_d = `SPC2.dec.dec_ld_inst_d;

///////////////////////////////////////////////////////////////////////////////
// Debugging Instruction Opcodes Pipeline
///////////////////////////////////////////////////////////////////////////////


   reg [31:0] op_0_w;
   reg [31:0] op_1_w;
   reg [31:0] op_2_w;
   reg [31:0] op_3_w;
   reg [31:0] op_4_w;
   reg [31:0] op_5_w;
   reg [31:0] op_6_w;
   reg [31:0] op_7_w;

   reg [31:0] op0_b;
   reg [31:0] op0_m;
   reg [31:0] op0_e;
   reg [31:0] op0_d;

   reg [31:0] op1_b;
   reg [31:0] op1_m;
   reg [31:0] op1_e;
   reg [31:0] op1_d;

   reg [255:0] inst0_string_w;
   reg [255:0] inst0_string_b;
   reg [255:0] inst0_string_m;
   reg [255:0] inst0_string_e;
   reg [255:0] inst0_string_d;

   reg [255:0] inst1_string_w;
   reg [255:0] inst1_string_b;
   reg [255:0] inst1_string_m;
   reg [255:0] inst1_string_e;
   reg [255:0] inst1_string_d;

   reg [255:0] inst0_string_p;
   reg [255:0] inst1_string_p;
   reg [255:0] inst2_string_p;
   reg [255:0] inst3_string_p;
   reg [255:0] inst4_string_p;
   reg [255:0] inst5_string_p;
   reg [255:0] inst6_string_p;
   reg [255:0] inst7_string_p;

initial begin
    op_0_w = 32'b0;
    op_1_w = 32'b0;
    op_2_w = 32'b0;
    op_3_w = 32'b0;
    op_4_w = 32'b0;
    op_5_w = 32'b0;
    op_6_w = 32'b0;
    op_7_w = 32'b0;
end

always @(posedge `BENCH_SPC2_GCLK) begin // {
  op_0_w <= ({32 { select_pc_b[0]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[0]}} & op_0_w[31:0]) ;
  op_1_w <= ({32 { select_pc_b[1]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[1]}} & op_1_w[31:0]) ;
  op_2_w <= ({32 { select_pc_b[2]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[2]}} & op_2_w[31:0]) ;
  op_3_w <= ({32 { select_pc_b[3]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[3]}} & op_3_w[31:0]) ;
  op_4_w <= ({32 { select_pc_b[4]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[4]}} & op_4_w[31:0]) ;
  op_5_w <= ({32 { select_pc_b[5]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[5]}} & op_5_w[31:0]) ;
  op_6_w <= ({32 { select_pc_b[6]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[6]}} & op_6_w[31:0]) ;
  op_7_w <= ({32 { select_pc_b[7]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[7]}} & op_7_w[31:0]) ;

  op0_b <= op0_m;
  op0_m <= op0_e;
  op0_e <= op0_d;
  op0_d <= `SPC2.dec.ded0.decode_mux[31:0];

  op1_b <= op1_m;
  op1_m <= op1_e;
  op1_e <= op1_d;
  op1_d <= `SPC2.dec.ded1.decode_mux[31:0];

  inst0_string_w<=inst0_string_b;
  inst0_string_b<=inst0_string_m;
  inst0_string_m<=inst0_string_e;
  inst0_string_e<=inst0_string_d;
  inst0_string_d<=xlate(`SPC2.dec.ded0.decode_mux[31:0]);

  inst1_string_w<=inst1_string_b;
  inst1_string_b<=inst1_string_m;
  inst1_string_m<=inst1_string_e;
  inst1_string_e<=inst1_string_d;
  inst1_string_d<=xlate(`SPC2.dec.ded1.decode_mux[31:0]);

// instructions for each thread at pick
  inst0_string_p<=xlate(`SPC2.ifu_ibu.ibf0.buf0_in[31:0]);
  inst1_string_p<=xlate(`SPC2.ifu_ibu.ibf1.buf0_in[31:0]);
  inst2_string_p<=xlate(`SPC2.ifu_ibu.ibf2.buf0_in[31:0]);
  inst3_string_p<=xlate(`SPC2.ifu_ibu.ibf3.buf0_in[31:0]);
  inst4_string_p<=xlate(`SPC2.ifu_ibu.ibf4.buf0_in[31:0]);
  inst5_string_p<=xlate(`SPC2.ifu_ibu.ibf5.buf0_in[31:0]);
  inst6_string_p<=xlate(`SPC2.ifu_ibu.ibf6.buf0_in[31:0]);
  inst7_string_p<=xlate(`SPC2.ifu_ibu.ibf7.buf0_in[31:0]);

end //}

///////////////////////////////////////////////////////////////////////////////
// Functions 
///////////////////////////////////////////////////////////////////////////////
function [2:0] onehot2tid;
   input [7:0] onehot;

   begin

   if      (onehot[7:0]==8'b00000001) onehot2tid[2:0] = 3'b000;
   else if (onehot[7:0]==8'b00000010) onehot2tid[2:0] = 3'b001;
   else if (onehot[7:0]==8'b00000100) onehot2tid[2:0] = 3'b010;
   else if (onehot[7:0]==8'b00001000) onehot2tid[2:0] = 3'b011;
   else if (onehot[7:0]==8'b00010000) onehot2tid[2:0] = 3'b100;
   else if (onehot[7:0]==8'b00100000) onehot2tid[2:0] = 3'b101;
   else if (onehot[7:0]==8'b01000000) onehot2tid[2:0] = 3'b110;
   else if (onehot[7:0]==8'b10000000) onehot2tid[2:0] = 3'b111;
   
   end
endfunction

function [7:0] tid2onehot;
   input [2:0] tid;

   begin

   if      (tid[2:0]==3'b000) tid2onehot[7:0] = 8'b00000001;
   else if (tid[2:0]==3'b001) tid2onehot[7:0] = 8'b00000010;
   else if (tid[2:0]==3'b010) tid2onehot[7:0] = 8'b00000100;
   else if (tid[2:0]==3'b011) tid2onehot[7:0] = 8'b00001000;
   else if (tid[2:0]==3'b100) tid2onehot[7:0] = 8'b00010000;
   else if (tid[2:0]==3'b101) tid2onehot[7:0] = 8'b00100000;
   else if (tid[2:0]==3'b110) tid2onehot[7:0] = 8'b01000000;
   else if (tid[2:0]==3'b111) tid2onehot[7:0] = 8'b10000000;
   
   end
endfunction

//---------------------

function [255:0] xlate;
   input [31:0] inst;

   begin
     casex(inst[31:0])
32'b10xxxxx110100xxxxx001000011xxxxx : xlate[255:0]="FADDq";
32'b10xxxxx110100xxxxx001000111xxxxx : xlate[255:0]="FSUBq";
32'b10000xx110101xxxxx001010011xxxxx : xlate[255:0]="FCMPq";
32'b10000xx110101xxxxx001010111xxxxx : xlate[255:0]="FCMPEq";
32'b10xxxxx110100xxxxx011001101xxxxx : xlate[255:0]="FsTOq";
32'b10xxxxx110100xxxxx011001110xxxxx : xlate[255:0]="FdTOq";
32'b10xxxxx110100xxxxx010001100xxxxx : xlate[255:0]="FxTOq";
32'b10xxxxx110100xxxxx011001100xxxxx : xlate[255:0]="FiTOq";
32'b10xxxxx110100xxxxx000000011xxxxx : xlate[255:0]="FMOVq";
32'b10xxxxx110100xxxxx000000111xxxxx : xlate[255:0]="FNEGq";
32'b10xxxxx110100xxxxx000001011xxxxx : xlate[255:0]="FABSq";
32'b10xxxxx110100xxxxx001001011xxxxx : xlate[255:0]="FMULq";
32'b10xxxxx110100xxxxx001101110xxxxx : xlate[255:0]="FdMULq";
32'b10xxxxx110100xxxxx001001111xxxxx : xlate[255:0]="FDIVq";
32'b10xxxxx110100xxxxx000101011xxxxx : xlate[255:0]="FSQRTq";
32'b10xxxxx1101010xxxx0xx100111xxxxx : xlate[255:0]="FMOVrQa";
32'b10xxxxx1101010xxxx0x1x00111xxxxx : xlate[255:0]="FMOVrQb";
32'b10xxxxx110100xxxxx011010011xxxxx : xlate[255:0]="FqTOi";
32'b10xxxxx110100xxxxx010000011xxxxx : xlate[255:0]="FqTOx";
32'b10xxxxx110100xxxxx011000111xxxxx : xlate[255:0]="FqTOs";
32'b10xxxxx110100xxxxx011001011xxxxx : xlate[255:0]="FqTOd";
32'b11xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQF";
32'b11xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFi";
32'b11xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQFA";
32'b11xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFAi";
32'b11xxxxx100110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFi";
32'b11xxxxx100110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQF";
32'b11xxxxx110110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQFA";
32'b11xxxxx110110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFAi";
32'b10xxxxx1101010xxxxxxx000011xxxxx : xlate[255:0]="FMOVQcc";
32'b10xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADD";
32'b10xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDcc";
32'b10xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDC";
32'b10xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDCcc";
32'b10xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDi";
32'b10xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDcci";
32'b10xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCi";
32'b10xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCcci";
32'b00x0xx1011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr1";
32'b00x0x1x011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr2";
32'b00xx000110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfccA";
32'b00xx1xx110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc1";
32'b00xxx1x110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc2";
32'b00xxxx1110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc3";
32'b00xx000101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfccA";
32'b00xx1xx101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc1";
32'b00xxx1x101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc2";
32'b00xxxx1101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc3";
32'b00xx000010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BiccA";
32'b00xx1xx010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc1";
32'b00xxx1x010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc2";
32'b00xxxx1010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc3";
32'b00xx000001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPccA";
32'b00xx1xx001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc1";
32'b00xxx1x001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc2";
32'b00xxxx1001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc3";
32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="CALL";
32'b11xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASA";
32'b11xxxxx111110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASXA";
32'b11xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASAi";
32'b11xxxxx111110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASXAi";
32'b10xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIV";
32'b10xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIV";
32'b10xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVcc";
32'b10xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVcc";
32'b10xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVi";
32'b10xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVi";
32'b10xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVcci";
32'b10xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVcci";
32'b1000000111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="DONE";
32'b1000001111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RETRY";
32'b10xxxxx110100xxxxx001000001xxxxx : xlate[255:0]="FADDs";
32'b10xxxxx110100xxxxx001000010xxxxx : xlate[255:0]="FADDd";
32'b10xxxxx110100xxxxx001000101xxxxx : xlate[255:0]="FSUBs";
32'b10xxxxx110100xxxxx001000110xxxxx : xlate[255:0]="FSUBd";
32'b10000xx110101xxxxx001010001xxxxx : xlate[255:0]="FCMPs";
32'b10000xx110101xxxxx001010010xxxxx : xlate[255:0]="FCMPd";
32'b10000xx110101xxxxx001010101xxxxx : xlate[255:0]="FCMPEs";
32'b10000xx110101xxxxx001010110xxxxx : xlate[255:0]="FCMPEd";
32'b10xxxxx110100xxxxx010000001xxxxx : xlate[255:0]="FsTOx";
32'b10xxxxx110100xxxxx010000010xxxxx : xlate[255:0]="FdTOx";
32'b10xxxxx110100xxxxx011010001xxxxx : xlate[255:0]="FsTOi";
32'b10xxxxx110100xxxxx011010010xxxxx : xlate[255:0]="FdTOi";
32'b10xxxxx110100xxxxx011001001xxxxx : xlate[255:0]="FsTOd";
32'b10xxxxx110100xxxxx011000110xxxxx : xlate[255:0]="FdTOs";
32'b10xxxxx110100xxxxx010000100xxxxx : xlate[255:0]="FxTOs";
32'b10xxxxx110100xxxxx010001000xxxxx : xlate[255:0]="FxTOd";
32'b10xxxxx110100xxxxx011000100xxxxx : xlate[255:0]="FiTOs";
32'b10xxxxx110100xxxxx011001000xxxxx : xlate[255:0]="FiTOd";
32'b10xxxxx110100xxxxx000000001xxxxx : xlate[255:0]="FMOVs";
32'b10xxxxx110100xxxxx000000010xxxxx : xlate[255:0]="FMOVd";
32'b10xxxxx110100xxxxx000000101xxxxx : xlate[255:0]="FNEGs";
32'b10xxxxx110100xxxxx000000110xxxxx : xlate[255:0]="FNEGd";
32'b10xxxxx110100xxxxx000001001xxxxx : xlate[255:0]="FABSs";
32'b10xxxxx110100xxxxx000001010xxxxx : xlate[255:0]="FABSd";
32'b10xxxxx110100xxxxx001001001xxxxx : xlate[255:0]="FMULs";
32'b10xxxxx110100xxxxx001001010xxxxx : xlate[255:0]="FMULd";
32'b10xxxxx110100xxxxx001101001xxxxx : xlate[255:0]="FsMULd";
32'b10xxxxx110100xxxxx001001101xxxxx : xlate[255:0]="FDIVs";
32'b10xxxxx110100xxxxx001001110xxxxx : xlate[255:0]="FDIVd";
32'b10xxxxx110100xxxxx000101001xxxxx : xlate[255:0]="FSQRTs";
32'b10xxxxx110100xxxxx000101010xxxxx : xlate[255:0]="FSQRTd";
32'b10xxxxx111011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSH";
32'b10xxxxx111011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="FLUSHi";
32'b10xxxxx101011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSHw";
32'b10xxxxx111000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="JMPL";
32'b10xxxxx111000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="JMPLi";
32'b11xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDF";
32'b11xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDF";
32'b1100000100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFSR";
32'b1100001100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXFSR";
32'b11xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFi";
32'b11xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFi";
32'b1100000100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFSRi";
32'b1100001100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXFSRi";
32'b11xxxxx110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFA";
32'b11xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDFA";
32'b11xxxxx110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFAi";
32'b11xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFAi";
32'b11xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSB";
32'b11xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSH";
32'b11xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSW";
32'b11xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUB";
32'b11xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUH";
32'b11xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUW";
32'b11xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDX";
32'b11xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDD";
32'b11xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBi";
32'b11xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHi";
32'b11xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWi";
32'b11xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBi";
32'b11xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHi";
32'b11xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWi";
32'b11xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXi";
32'b11xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDi";
32'b11xxxxx011001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSBA";
32'b11xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSHA";
32'b11xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSWA";
32'b11xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUBA";
32'b11xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUHA";
32'b11xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUWA";
32'b11xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXA";
32'b11xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDA";
32'b11xxxxx011001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBAi";
32'b11xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHAi";
32'b11xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWAi";
32'b11xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBAi";
32'b11xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHAi";
32'b11xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWAi";
32'b11xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXAi";
32'b11xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDAi";
32'b11xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUB";
32'b11xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBi";
32'b11xxxxx011101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUBA";
32'b11xxxxx011101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBAi";
32'b10xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="AND";
32'b10xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDcc";
32'b10xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDN";
32'b10xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDNcc";
32'b10xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="OR";
32'b10xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORcc";
32'b10xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORN";
32'b10xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORNcc";
32'b10xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XOR";
32'b10xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XORcc";
32'b10xxxxx000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNOR";
32'b10xxxxx010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNORcc";
32'b10xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDi";
32'b10xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDcci";
32'b10xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNi";
32'b10xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNcci";
32'b10xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORi";
32'b10xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORcci";
32'b10xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNi";
32'b10xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNcci";
32'b10xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORi";
32'b10xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORcci";
32'b10xxxxx000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORi";
32'b10xxxxx010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORcci";
32'b1000000101000011111xxxxxxxxxxxxx : xlate[255:0]="MEMBAR";
32'b1000000101000011110xxxxxxxxxxxxx : xlate[255:0]="STBAR";
32'b10xxxxx101000000000xxxxxxxxxxxxx : xlate[255:0]="RDY";
32'b10xxxxx101000000100xxxxxxxxxxxxx : xlate[255:0]="RDCCR";
32'b10xxxxx101000000110xxxxxxxxxxxxx : xlate[255:0]="RDASI";
32'b10xxxxx101000001000xxxxxxxxxxxxx : xlate[255:0]="RDTICK";
32'b10xxxxx101000001010xxxxxxxxxxxxx : xlate[255:0]="RDPC";
32'b10xxxxx101000001100xxxxxxxxxxxxx : xlate[255:0]="RDFPRS";
32'b10xxxxx101000100110xxxxxxxxxxxxx : xlate[255:0]="RDGSR";
32'b10xxxxx101000100000xxxxxxxxxxxxx : xlate[255:0]="RDPCR";
32'b10xxxxx101000100010xxxxxxxxxxxxx : xlate[255:0]="RDPIC";
32'b10xxxxx1101010xxxx0xx000001xxxxx : xlate[255:0]="FMOVSfcc";
32'b10xxxxx1101010xxxx1xx000001xxxxx : xlate[255:0]="FMOVSxcc";
32'b10xxxxx1101010xxxx0xx000010xxxxx : xlate[255:0]="FMOVDfcc";
32'b10xxxxx1101010xxxx1xx000010xxxxx : xlate[255:0]="FMOVDxcc";
32'b10xxxxx110101xxxxx0xx100101xxxxx : xlate[255:0]="FMOVrS1";
32'b10xxxxx110101xxxxx0x1x00101xxxxx : xlate[255:0]="FMOVrS2";
32'b10xxxxx110101xxxxx0xx100110xxxxx : xlate[255:0]="FMOVrD1";
32'b10xxxxx110101xxxxx0x1x00110xxxxx : xlate[255:0]="FMOVrD2";
32'b10xxxxx1011001xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVxcc";
32'b10xxxxx1011001xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVxcci";
32'b10xxxxx1011000xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVfcc";
32'b10xxxxx1011000xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVfcci";
32'b10xxxxx101111xxxxx0xx1xxxxxxxxxx : xlate[255:0]="MOVR1";
32'b10xxxxx101111xxxxx0x1xxxxxxxxxxx : xlate[255:0]="MOVR2";
32'b10xxxxx101111xxxxx1xx1xxxxxxxxxx : xlate[255:0]="MOVRi1";
32'b10xxxxx101111xxxxx1x1xxxxxxxxxxx : xlate[255:0]="MOVRi2";
32'b10xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULX";
32'b10xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVX";
32'b10xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVX";
32'b10xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULXi";
32'b10xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVXi";
32'b10xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVXi";
32'b10xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMUL";
32'b10xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMUL";
32'b10xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMULcc";
32'b10xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMULcc";
32'b10xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULi";
32'b10xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULi";
32'b10xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULcci";
32'b10xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULcci";
32'b10xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULScc";
32'b10xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULScci";
32'b10xxxxx101110000000xxxxxxxxxxxxx : xlate[255:0]="POPC";
32'b10xxxxx101110000001xxxxxxxxxxxxx : xlate[255:0]="POPCi";
32'b11xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCH";
32'b11xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHi";
32'b11xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCHA";
32'b11xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHAi";
32'b10xxxxx101010xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDPR";
32'b10xxxxx101001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDHPR";
32'b10xxxxx111001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RETURN";
32'b10xxxxx111001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RETURNi";
32'b10xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SAVE";
32'b10xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SAVEi";
32'b10xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RESTORE";
32'b10xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RESTOREi";
32'b1000000110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="SAVED";
32'b1000001110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RESTORED";
32'b00xxxxx100xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="SETHI";
32'b10xxxxx100101xxxxx00xxxxxxxxxxxx : xlate[255:0]="SLL";
32'b10xxxxx100110xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRL";
32'b10xxxxx100111xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRA";
32'b10xxxxx100101xxxxx01xxxxxxxxxxxx : xlate[255:0]="SLLX";
32'b10xxxxx100110xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRLX";
32'b10xxxxx100111xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRAX";
32'b10xxxxx100101xxxxx10xxxxxxxxxxxx : xlate[255:0]="SLLi";
32'b10xxxxx100110xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRLi";
32'b10xxxxx100111xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRAi";
32'b10xxxxx100101xxxxx11xxxxxxxxxxxx : xlate[255:0]="SLLXi";
32'b10xxxxx100110xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRLXi";
32'b10xxxxx100111xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRAXi";
32'b11xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STF";
32'b11xxxxx100111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDF";
32'b1100000100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFSR";
32'b1100001100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXFSR";
32'b11xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFi";
32'b11xxxxx100111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFi";
32'b1100000100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFSRi";
32'b1100001100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXFSRi";
32'b11xxxxx110100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFA";
32'b11xxxxx110111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDFA";
32'b11xxxxx110100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFAi";
32'b11xxxxx110111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFAi";
32'b11xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STB";
32'b11xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STH";
32'b11xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STW";
32'b11xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STX";
32'b11xxxx0000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STD";
32'b11xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBi";
32'b11xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHi";
32'b11xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWi";
32'b11xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXi";
32'b11xxxx0000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDi";
32'b11xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STBA";
32'b11xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STHA";
32'b11xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STWA";
32'b11xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXA";
32'b11xxxx0010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDA";
32'b11xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBAi";
32'b11xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHAi";
32'b11xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWAi";
32'b11xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXAi";
32'b11xxxx0010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDAi";
32'b10xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUB";
32'b10xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBcc";
32'b10xxxxx001100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBC";
32'b10xxxxx011100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBCcc";
32'b10xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBi";
32'b10xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBcci";
32'b10xxxxx001100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCi";
32'b10xxxxx011100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCcci";
32'b11xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAP";
32'b11xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPi";
32'b11xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAPA";
32'b11xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPAi";
32'b10xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDcc";
32'b10xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDccTV";
32'b10xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDcci";
32'b10xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDccTVi";
32'b10xxxxx100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBcc";
32'b10xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBccTV";
32'b10xxxxx100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBcci";
32'b10xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBccTVi";
32'b10xxxxx111010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TCC";
32'b10xxxxx111010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TCCi";
32'b10xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPR";
32'b10xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPRi";
32'b10xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRHPR";
32'b10xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRHPRi";
32'b1000000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRY";
32'b1000010110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRCCR";
32'b1000011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRASI";
32'b1000110110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRFPRS";
32'b1010011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRGSR";
32'b1010000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPCR";
32'b1010001110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPIC";
32'b1000000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRYi";
32'b1000010110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRCCRi";
32'b1000011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRASIi";
32'b1000110110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRFPRSi";
32'b1010011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRGSRi";
32'b1010000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPCRi";
32'b1010001110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPICi";
32'b1001111110000000001xxxxxxxxxxxxx : xlate[255:0]="SIR";
32'b10xxxxx110110xxxxx001010000xxxxx : xlate[255:0]="FPADD16";
32'b10xxxxx110110xxxxx001010001xxxxx : xlate[255:0]="FPADD16S";
32'b10xxxxx110110xxxxx001010010xxxxx : xlate[255:0]="FPADD32";
32'b10xxxxx110110xxxxx001010011xxxxx : xlate[255:0]="FPADD32S";
32'b10xxxxx110110xxxxx001010100xxxxx : xlate[255:0]="FPSUB16";
32'b10xxxxx110110xxxxx001010101xxxxx : xlate[255:0]="FPSUB16S";
32'b10xxxxx110110xxxxx001010110xxxxx : xlate[255:0]="FPSUB32";
32'b10xxxxx110110xxxxx001010111xxxxx : xlate[255:0]="FPSUB32S";
32'b10xxxxx110110xxxxx000111011xxxxx : xlate[255:0]="FPACK16";
32'b10xxxxx110110xxxxx000111010xxxxx : xlate[255:0]="FPACK32";
32'b10xxxxx110110xxxxx000111101xxxxx : xlate[255:0]="FPACKFIX";
32'b10xxxxx110110xxxxx001001101xxxxx : xlate[255:0]="FEXPAND";
32'b10xxxxx110110xxxxx001001011xxxxx : xlate[255:0]="FPMERGE";
32'b10xxxxx110110xxxxx000110001xxxxx : xlate[255:0]="FMUL8x16";
32'b10xxxxx110110xxxxx000110011xxxxx : xlate[255:0]="FMUL8x16AU";
32'b10xxxxx110110xxxxx000110101xxxxx : xlate[255:0]="FMUL8x16AL";
32'b10xxxxx110110xxxxx000110110xxxxx : xlate[255:0]="FMUL8SUx16";
32'b10xxxxx110110xxxxx000110111xxxxx : xlate[255:0]="FMUL8ULx16";
32'b10xxxxx110110xxxxx000111000xxxxx : xlate[255:0]="FMULD8SUx16";
32'b10xxxxx110110xxxxx000111001xxxxx : xlate[255:0]="FMULD8ULx16";
32'b10xxxxx110110xxxxx000011000xxxxx : xlate[255:0]="ALIGNADDRESS";
32'b10xxxxx110110xxxxx000011010xxxxx : xlate[255:0]="ALIGNADDRESS_LITTLE";
32'b10xxxxx110110xxxxx000011001xxxxx : xlate[255:0]="BMASK";
32'b10xxxxx110110xxxxx001001000xxxxx : xlate[255:0]="FALIGNDATA";
32'b10xxxxx110110xxxxx001001100xxxxx : xlate[255:0]="BSHUFFLE";
32'b10xxxxx110110xxxxx001100000xxxxx : xlate[255:0]="FZERO";
32'b10xxxxx110110xxxxx001100001xxxxx : xlate[255:0]="FZEROS";
32'b10xxxxx110110xxxxx001111110xxxxx : xlate[255:0]="FONE";
32'b10xxxxx110110xxxxx001111111xxxxx : xlate[255:0]="FONES";
32'b10xxxxx110110xxxxx001110100xxxxx : xlate[255:0]="FSRC1";
32'b10xxxxx110110xxxxx001110101xxxxx : xlate[255:0]="FSRC1S";
32'b10xxxxx110110xxxxx001111000xxxxx : xlate[255:0]="FSRC2";
32'b10xxxxx110110xxxxx001111001xxxxx : xlate[255:0]="FSRC2S";
32'b10xxxxx110110xxxxx001101010xxxxx : xlate[255:0]="FNOT1";
32'b10xxxxx110110xxxxx001101011xxxxx : xlate[255:0]="FNOT1S";
32'b10xxxxx110110xxxxx001100110xxxxx : xlate[255:0]="FNOT2";
32'b10xxxxx110110xxxxx001100111xxxxx : xlate[255:0]="FNOT2S";
32'b10xxxxx110110xxxxx001111100xxxxx : xlate[255:0]="FOR";
32'b10xxxxx110110xxxxx001111101xxxxx : xlate[255:0]="FORS";
32'b10xxxxx110110xxxxx001100010xxxxx : xlate[255:0]="FNOR";
32'b10xxxxx110110xxxxx001100011xxxxx : xlate[255:0]="FNORS";
32'b10xxxxx110110xxxxx001110000xxxxx : xlate[255:0]="FAND";
32'b10xxxxx110110xxxxx001110001xxxxx : xlate[255:0]="FANDS";
32'b10xxxxx110110xxxxx001101110xxxxx : xlate[255:0]="FNAND";
32'b10xxxxx110110xxxxx001101111xxxxx : xlate[255:0]="FNANDS";
32'b10xxxxx110110xxxxx001101100xxxxx : xlate[255:0]="FXOR";
32'b10xxxxx110110xxxxx001101101xxxxx : xlate[255:0]="FXORS";
32'b10xxxxx110110xxxxx001110010xxxxx : xlate[255:0]="FXNOR";
32'b10xxxxx110110xxxxx001110011xxxxx : xlate[255:0]="FXNORS";
32'b10xxxxx110110xxxxx001111010xxxxx : xlate[255:0]="FORNOT1";
32'b10xxxxx110110xxxxx001111011xxxxx : xlate[255:0]="FORNOT1S";
32'b10xxxxx110110xxxxx001110110xxxxx : xlate[255:0]="FORNOT2";
32'b10xxxxx110110xxxxx001110111xxxxx : xlate[255:0]="FORNOT2S";
32'b10xxxxx110110xxxxx001101000xxxxx : xlate[255:0]="FANDNOT1";
32'b10xxxxx110110xxxxx001101001xxxxx : xlate[255:0]="FANDNOT1S";
32'b10xxxxx110110xxxxx001100100xxxxx : xlate[255:0]="FANDNOT2";
32'b10xxxxx110110xxxxx001100101xxxxx : xlate[255:0]="FANDNOT2S";
32'b10xxxxx110110xxxxx000101000xxxxx : xlate[255:0]="FCMPGT16";
32'b10xxxxx110110xxxxx000101100xxxxx : xlate[255:0]="FCMPGT32";
32'b10xxxxx110110xxxxx000100000xxxxx : xlate[255:0]="FCMPLE16";
32'b10xxxxx110110xxxxx000100100xxxxx : xlate[255:0]="FCMPLE32";
32'b10xxxxx110110xxxxx000100010xxxxx : xlate[255:0]="FCMPNE16";
32'b10xxxxx110110xxxxx000100110xxxxx : xlate[255:0]="FCMPNE32";
32'b10xxxxx110110xxxxx000101010xxxxx : xlate[255:0]="FCMPEQ16";
32'b10xxxxx110110xxxxx000101110xxxxx : xlate[255:0]="FCMPEQ32";
32'b10xxxxx110110xxxxx000111110xxxxx : xlate[255:0]="PDIST";
32'b10xxxxx110110xxxxx000000000xxxxx : xlate[255:0]="EDGE8";
32'b10xxxxx110110xxxxx000000001xxxxx : xlate[255:0]="EDGE8N";
32'b10xxxxx110110xxxxx000000010xxxxx : xlate[255:0]="EDGE8L";
32'b10xxxxx110110xxxxx000000011xxxxx : xlate[255:0]="EDGE8LN";
32'b10xxxxx110110xxxxx000000100xxxxx : xlate[255:0]="EDGE16";
32'b10xxxxx110110xxxxx000000101xxxxx : xlate[255:0]="EDGE16N";
32'b10xxxxx110110xxxxx000000110xxxxx : xlate[255:0]="EDGE16L";
32'b10xxxxx110110xxxxx000000111xxxxx : xlate[255:0]="EDGE16LN";
32'b10xxxxx110110xxxxx000001000xxxxx : xlate[255:0]="EDGE32";
32'b10xxxxx110110xxxxx000001001xxxxx : xlate[255:0]="EDGE32N";
32'b10xxxxx110110xxxxx000001010xxxxx : xlate[255:0]="EDGE32L";
32'b10xxxxx110110xxxxx000001011xxxxx : xlate[255:0]="EDGE32LN";
32'b10xxxxx110110xxxxx000010000xxxxx : xlate[255:0]="ARRAY8";
32'b10xxxxx110110xxxxx000010010xxxxx : xlate[255:0]="ARRAY16";
32'b10xxxxx110110xxxxx000010100xxxxx : xlate[255:0]="ARRAY32";
32'b10xxxxx110110xxxxx010000001xxxxx : xlate[255:0]="SIAM";
       default : xlate[255:0]="unknown";
    endcase   
   end
endfunction // xlate


`endif
   
endmodule

`endif


`ifdef CORE_3

module nas_probes3;


`ifdef GATESIM


`else
   reg [7:0] ex_valid_m;
   reg [7:0] ex_valid_b;
   reg [7:0] ex_valid_w;
   reg [7:0] return_f4;
   reg [2:0] ex0_tid_m;
   reg [2:0] ex1_tid_m;
   reg [2:0] ex0_tid_b;
   reg [2:0] ex1_tid_b;
   reg [2:0] ex0_tid_w;
   reg [2:0] ex1_tid_w;
   reg       fgu_valid_fb0;
   reg       fgu_valid_fb1;

   reg [31:0] inst0_e;
   reg [31:0] inst1_e;

   reg [7:0] fg_valid;

   reg fcc_valid_f4;
   reg fcc_valid_f5;
   reg fcc_valid_fb;

   reg fgu0_e;
   reg fgu1_e;
   reg lsu0_e;
   reg lsu1_e;

   reg [1:0] dcd_idest_e;
   reg [1:0] dcd_fdest_e;

   wire [7:0] ex_valid;
   wire [7:0] exception_w;

   wire [7:0] imul_valid;

   wire       fg_cond_fb;

   wire        exu_lsu_valid;
   wire [47:0] exu_lsu_addr;
   wire [31:0] exu_lsu_instr;
   wire [2:0]  exu_lsu_tid;
   wire [4:0]  exu_lsu_regid;
   wire [63:0] exu_lsu_data;

   wire [2:0] ex0_tid_e;
   wire [2:0] ex1_tid_e;
   wire       ex0_valid_e;
   wire       ex1_valid_e;
   wire [7:0] ex_asr_access;
   wire       ex_asr_valid;

   wire [7:0] lsu_valid;
   wire [2:0] lsu_tid;
   wire [7:0] lsu_tid_dec_b;
   wire       lsu_ld_valid;
   reg  [7:0] lsu_data_w;
   wire [7:0] lsu_data_b;

   wire ld_inst_d;

   reg [7:0] div_idest;
   reg [7:0] div_fdest;
   
   reg load0_e;
   reg load1_e;

   reg load_m;
   reg load_b;

   reg [2:0] lsu_tid_m;
   reg [7:0] lsu_complete_m;
   reg [7:0] lsu_complete_b;
   reg [7:0] lsu_trap_flush_d;	//reqd. for store buffer ue testing

   reg [7:0] ex_flush_w;
   reg [7:0] ex_flush_b;

   reg sel_divide0_e;
   reg sel_divide1_e;

   wire dec_flush_lb;

   wire [7:0] fgu_idiv_valid;

   wire [7:0] fgu_fdiv_valid;
   
   wire [7:0] fg_div_valid;

   wire       lsu_valid_b;

   wire [7:0] return_w;
   wire       return0;
   wire       return1;
   wire [7:0] real_exception;

   reg  [2:0] lsu_tid_b;
   reg        fmov_valid_fb;
   reg        fmov_valid_f5;
   reg        fmov_valid_f4;
   reg        fmov_valid_f3;
   reg        fmov_valid_f2;
   reg        fmov_valid_m;
   reg        fmov_valid_e;

   reg        fg_flush_fb;
   reg        fg_flush_f5;
   reg        fg_flush_f4;
   reg        fg_flush_f3;
   reg        fg_flush_f2;

   reg       siam0_d;   
   reg       siam1_d;   

   reg       done0_d;
   reg       done1_d;
   reg       retry0_d;
   reg       retry1_d;
   reg       done0_e;
   reg       done1_e;
   reg       retry0_e;
   reg       retry1_e;
   reg       tlu_ccr_cwp_0_valid_last;
   reg       tlu_ccr_cwp_1_valid_last;
   reg [7:0] fg_fdiv_valid_fw;
   reg [7:0] asi_in_progress_b;
   reg [7:0] asi_in_progress_w;
   reg [7:0] asi_in_progress_fx4;
   reg [7:0] tlu_valid;
   reg [7:0] sync_reset_w;
            
   reg [7:0] div_special_cancel_f4;

   reg       asi_store_b;
   reg       asi_store_w;
   reg [2:0] dcc_tid_b;
   reg [2:0] dcc_tid_w;
   reg [7:0] asi_valid_w;
   reg [7:0] asi_valid_fx4;
   reg [7:0] asi_valid_fx5;

   reg [7:0] lsu_state;
   reg [7:0] lsu_check;
   reg [2:0] lsu_tid_e;

   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;

   reg fgu_err_fx3; 
   reg fgu_err_fx4; 
   reg fgu_err_fx5; 
   reg fgu_err_fb; 

   reg clkstop_d1;
   reg clkstop_d2;
   reg clkstop_d3;
   reg clkstop_d4;
   reg clkstop_d5;

integer i;
integer start_dmiss0;
integer start_dmiss1;
integer start_dmiss2;
integer start_dmiss3;
integer start_dmiss4;
integer start_dmiss5;
integer start_dmiss6;
integer start_dmiss7;
integer number_dmiss;
integer start_imiss0;
integer start_imiss1;
integer start_imiss2;
integer start_imiss3;
integer start_imiss4;
integer start_imiss5;
integer start_imiss6;
integer start_imiss7;
integer active_imiss0;
integer active_imiss1;
integer active_imiss2;
integer active_imiss3;
integer active_imiss4;
integer active_imiss5;
integer active_imiss6;
integer active_imiss7;
integer first_imiss0;
integer first_imiss1;
integer first_imiss2;
integer first_imiss3;
integer first_imiss4;
integer first_imiss5;
integer first_imiss6;
integer first_imiss7;
integer number_imiss;
integer clock;
integer sum_dmiss_latency;
integer sum_imiss_latency;
reg spec_dmiss;
integer dmiss_cnt;
integer imiss_cnt;
reg pcx_req;
integer l15dmiss_cnt;
integer l15imiss_cnt;


initial begin // {
    pcx_req=0;
    l15imiss_cnt=0;
    l15dmiss_cnt=0;
    imiss_cnt=0;
    dmiss_cnt=0;
    clock=0;
    start_dmiss0=0;
    start_dmiss1=0;
    start_dmiss2=0;
    start_dmiss3=0;
    start_dmiss4=0;
    start_dmiss5=0;
    start_dmiss6=0;
    start_dmiss7=0;
    number_dmiss=0;
    start_imiss0=0;
    start_imiss1=0;
    start_imiss2=0;
    start_imiss3=0;
    start_imiss4=0;
    start_imiss5=0;
    start_imiss6=0;
    start_imiss7=0;
    active_imiss0=0;
    active_imiss1=0;
    active_imiss2=0;
    active_imiss3=0;
    active_imiss4=0;
    active_imiss5=0;
    active_imiss6=0;
    active_imiss7=0;
    first_imiss0=0;
    first_imiss1=0;
    first_imiss2=0;
    first_imiss3=0;
    first_imiss4=0;
    first_imiss5=0;
    first_imiss6=0;
    first_imiss7=0;
    number_imiss=0;
    sum_dmiss_latency=0;
    sum_imiss_latency=0;
    asi_in_progress_b <= 8'h0;
    asi_in_progress_w <= 8'h0;
    asi_in_progress_fx4 <= 8'h0;
    tlu_valid <= 8'h0;
    div_idest <= 8'h0;
    div_fdest <= 8'h0;
    lsu_state <= 8'h0;
    clkstop_d1 <=0;
    clkstop_d2 <=0;
    clkstop_d3 <=0;
    clkstop_d4 <=0;
    clkstop_d5 <=0;

end //}

wire [7:0] asi_store_flush_w =  {`SPC3.lsu.sbs7.flush_st_w,
                                 `SPC3.lsu.sbs6.flush_st_w,
                                 `SPC3.lsu.sbs5.flush_st_w,
                                 `SPC3.lsu.sbs4.flush_st_w,
                                 `SPC3.lsu.sbs3.flush_st_w,
                                 `SPC3.lsu.sbs2.flush_st_w,
                                 `SPC3.lsu.sbs1.flush_st_w,
                                 `SPC3.lsu.sbs0.flush_st_w};

wire [7:0] store_sync = {`SPC3.lsu.sbs7.trap_sync,
                         `SPC3.lsu.sbs6.trap_sync,
                         `SPC3.lsu.sbs5.trap_sync,
                         `SPC3.lsu.sbs4.trap_sync,
                         `SPC3.lsu.sbs3.trap_sync,
                         `SPC3.lsu.sbs2.trap_sync,
                         `SPC3.lsu.sbs1.trap_sync,
                         `SPC3.lsu.sbs0.trap_sync};
wire [7:0] sync_reset = {`SPC3.lsu.sbs7.sync_state_rst,
                         `SPC3.lsu.sbs6.sync_state_rst,
                         `SPC3.lsu.sbs5.sync_state_rst,
                         `SPC3.lsu.sbs4.sync_state_rst,
                         `SPC3.lsu.sbs3.sync_state_rst,
                         `SPC3.lsu.sbs2.sync_state_rst,
                         `SPC3.lsu.sbs1.sync_state_rst,
                         `SPC3.lsu.sbs0.sync_state_rst};

//--------------------
// Used in nas_pipe for TSB Config Regs Capture/Compare
// ADD_TSB_CFG

// NOTE - ADD_TSB_CFG will never be used for Axis or Tharas
`ifndef EMUL
wire [63:0] ctxt_z_tsb_cfg0_reg [7:0];  // 1 per thread
wire [63:0] ctxt_z_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg3_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg0_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg3_reg [7:0];

// There are 32 entries in each MMU MRA but not all are needed.
// Indexing:
// Bits 4:3 of the address are the lower two bits of the TID
// Bits 2:0 of the address select the register as below
//   mmu.mra0.array.mem for T0-T3
//   mmu.mra1.array.mem for T4-T7
// (this is documented in mmu_asi_ctl.sv)
//		z TSB cfg 0,1				address 0
//		z TSB cfg 2,3				address 1
//		nz TSB cfg 0,1				address 2
//		nz TSB cfg 2,3				address 3
//		Real range, physical offset pair 0	address 4
//		Real range, physical offset pair 1	address 5
//		Real range, physical offset pair 2	address 6
//		Real range, physical offset pair 3	address 7

wire [83:0] mmu_mra0_a0 = `SPC3.mmu.mra0.array.mem[0];
wire [83:0] mmu_mra0_a8 = `SPC3.mmu.mra0.array.mem[8];
wire [83:0] mmu_mra0_a16 = `SPC3.mmu.mra0.array.mem[16];
wire [83:0] mmu_mra0_a24 = `SPC3.mmu.mra0.array.mem[24];
wire [83:0] mmu_mra0_a1 = `SPC3.mmu.mra0.array.mem[1];
wire [83:0] mmu_mra0_a9 = `SPC3.mmu.mra0.array.mem[9];
wire [83:0] mmu_mra0_a17 = `SPC3.mmu.mra0.array.mem[17];
wire [83:0] mmu_mra0_a25 = `SPC3.mmu.mra0.array.mem[25];
wire [83:0] mmu_mra0_a2 = `SPC3.mmu.mra0.array.mem[2];
wire [83:0] mmu_mra0_a10 = `SPC3.mmu.mra0.array.mem[10];
wire [83:0] mmu_mra0_a18 = `SPC3.mmu.mra0.array.mem[18];
wire [83:0] mmu_mra0_a26 = `SPC3.mmu.mra0.array.mem[26];
wire [83:0] mmu_mra0_a3 = `SPC3.mmu.mra0.array.mem[3];
wire [83:0] mmu_mra0_a11 = `SPC3.mmu.mra0.array.mem[11];
wire [83:0] mmu_mra0_a19 = `SPC3.mmu.mra0.array.mem[19];
wire [83:0] mmu_mra0_a27 = `SPC3.mmu.mra0.array.mem[27];
wire [83:0] mmu_mra1_a0 = `SPC3.mmu.mra1.array.mem[0];
wire [83:0] mmu_mra1_a8 = `SPC3.mmu.mra1.array.mem[8];
wire [83:0] mmu_mra1_a16 = `SPC3.mmu.mra1.array.mem[16];
wire [83:0] mmu_mra1_a24 = `SPC3.mmu.mra1.array.mem[24];
wire [83:0] mmu_mra1_a1 = `SPC3.mmu.mra1.array.mem[1];
wire [83:0] mmu_mra1_a9 = `SPC3.mmu.mra1.array.mem[9];
wire [83:0] mmu_mra1_a17 = `SPC3.mmu.mra1.array.mem[17];
wire [83:0] mmu_mra1_a25 = `SPC3.mmu.mra1.array.mem[25];
wire [83:0] mmu_mra1_a2 = `SPC3.mmu.mra1.array.mem[2];
wire [83:0] mmu_mra1_a10 = `SPC3.mmu.mra1.array.mem[10];
wire [83:0] mmu_mra1_a18 = `SPC3.mmu.mra1.array.mem[18];
wire [83:0] mmu_mra1_a26 = `SPC3.mmu.mra1.array.mem[26];
wire [83:0] mmu_mra1_a3 = `SPC3.mmu.mra1.array.mem[3];
wire [83:0] mmu_mra1_a11 = `SPC3.mmu.mra1.array.mem[11];
wire [83:0] mmu_mra1_a19 = `SPC3.mmu.mra1.array.mem[19];
wire [83:0] mmu_mra1_a27 = `SPC3.mmu.mra1.array.mem[27];


// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[0] = {`SPC3.mmu.asi.t0_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[0]  = {`SPC3.mmu.asi.t0_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[0]  = {`SPC3.mmu.asi.t0_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[0]  = {`SPC3.mmu.asi.t0_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[0] = {`SPC3.mmu.asi.t0_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[0] = {`SPC3.mmu.asi.t0_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[0] = {`SPC3.mmu.asi.t0_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[0] = {`SPC3.mmu.asi.t0_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[1] = {`SPC3.mmu.asi.t1_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[1]  = {`SPC3.mmu.asi.t1_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[1]  = {`SPC3.mmu.asi.t1_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[1]  = {`SPC3.mmu.asi.t1_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[1] = {`SPC3.mmu.asi.t1_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[1] = {`SPC3.mmu.asi.t1_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[1] = {`SPC3.mmu.asi.t1_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[1] = {`SPC3.mmu.asi.t1_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[2] = {`SPC3.mmu.asi.t2_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[2]  = {`SPC3.mmu.asi.t2_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[2]  = {`SPC3.mmu.asi.t2_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[2]  = {`SPC3.mmu.asi.t2_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[2] = {`SPC3.mmu.asi.t2_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[2] = {`SPC3.mmu.asi.t2_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[2] = {`SPC3.mmu.asi.t2_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[2] = {`SPC3.mmu.asi.t2_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[3] = {`SPC3.mmu.asi.t3_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[3]  = {`SPC3.mmu.asi.t3_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[3]  = {`SPC3.mmu.asi.t3_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[3]  = {`SPC3.mmu.asi.t3_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[3] = {`SPC3.mmu.asi.t3_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[3] = {`SPC3.mmu.asi.t3_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[3] = {`SPC3.mmu.asi.t3_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[3] = {`SPC3.mmu.asi.t3_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[4] = {`SPC3.mmu.asi.t4_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[4]  = {`SPC3.mmu.asi.t4_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[4]  = {`SPC3.mmu.asi.t4_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[4]  = {`SPC3.mmu.asi.t4_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[4] = {`SPC3.mmu.asi.t4_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[4] = {`SPC3.mmu.asi.t4_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[4] = {`SPC3.mmu.asi.t4_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[4] = {`SPC3.mmu.asi.t4_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[5] = {`SPC3.mmu.asi.t5_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[5]  = {`SPC3.mmu.asi.t5_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[5]  = {`SPC3.mmu.asi.t5_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[5]  = {`SPC3.mmu.asi.t5_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[5] = {`SPC3.mmu.asi.t5_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[5] = {`SPC3.mmu.asi.t5_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[5] = {`SPC3.mmu.asi.t5_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[5] = {`SPC3.mmu.asi.t5_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[6] = {`SPC3.mmu.asi.t6_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[6]  = {`SPC3.mmu.asi.t6_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[6]  = {`SPC3.mmu.asi.t6_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[6]  = {`SPC3.mmu.asi.t6_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[6] = {`SPC3.mmu.asi.t6_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[6] = {`SPC3.mmu.asi.t6_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[6] = {`SPC3.mmu.asi.t6_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[6] = {`SPC3.mmu.asi.t6_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[7] = {`SPC3.mmu.asi.t7_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[7]  = {`SPC3.mmu.asi.t7_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[7]  = {`SPC3.mmu.asi.t7_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[7]  = {`SPC3.mmu.asi.t7_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[7] = {`SPC3.mmu.asi.t7_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[7] = {`SPC3.mmu.asi.t7_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[7] = {`SPC3.mmu.asi.t7_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[7] = {`SPC3.mmu.asi.t7_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };
`endif // EMUL - ADD_TSB_CFG


// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
// Suppress instruction on flush or park request 
// (clear_disrupting_flush_pending_w_in & idl_req_in)
//   Suppress instruction for 'refetch' exception after 
//     not taken branch with annulled delay slot
// NOTE:  'with_errors' means that the signal actually IGNORES instruction
// cache errors and asserts IN SPITE OF instruction cache errors
wire [7:0] select_pc_b_with_errors = 
     {{4 {~`SPC3.dec_flush_b[1]}}, {4 {~`SPC3.dec_flush_b[0]}}} & 
     {{4 {~`SPC3.tlu.fls1.refetch_w_in}}, {4 {~`SPC3.tlu.fls0.refetch_w_in}}} &
     {~(`SPC3.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC3.tlu.fls1.idl_req_in}}),
      ~(`SPC3.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC3.tlu.fls0.idl_req_in}})} &
     {`SPC3.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC3.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Qualify select_pc_b_with_errors to get final select_pc_b signal
// Qualifications are
// 	- instruction cache errors (ic_err_w_in)
//	- disrupting single step completion requests (dsc_req_in)
wire [7:0] select_pc_b = 
     select_pc_b_with_errors[7:0]  &
     {{4 {(~`SPC3.tlu.fls1.ic_err_w_in | `SPC3.tlu.fls1.itlb_nfo_exc_b) & 
          ~`SPC3.tlu.fls1.dsc_req_in}}, 
      {4 {(~`SPC3.tlu.fls0.ic_err_w_in | `SPC3.tlu.fls0.itlb_nfo_exc_b) & 
          ~`SPC3.tlu.fls0.dsc_req_in}}};

//------------------------------------

//original select_pc_b_with errors. Select_pc_b_with_errors is no longer asserted
//if the inst. following an annulled delay slot of a not taken branch has a prebuffer
//error and it reaches B stage. I still need a signal if this happens to trigger the chkr.

wire [7:0] select_pc_b_with_errors_and_refetch =
     {{4 {~`SPC3.dec_flush_b[1]}}, {4 {~`SPC3.dec_flush_b[0]}}} &
     {~(`SPC3.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC3.tlu.fls1.idl_req_in}}),
      ~(`SPC3.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC3.tlu.fls0.idl_req_in}})} &
     {`SPC3.tlu.fls1.tid_dec_valid_b[3:0],
      `SPC3.tlu.fls0.tid_dec_valid_b[3:0]};

// Signals required for bench TLB sync & LDST sync

reg        tlb_bypass_m;
reg        tlb_bypass_b;
reg        tlb_rd_vld_m;
reg        tlb_rd_vld_b;
reg        lsu_tl_gt_0_b;
reg  [7:0] dcc_asi_b;
reg        asi_internal_w;

always @ (posedge `BENCH_SPC3_GCLK) begin // {

  clkstop_d1 <= `SPC3.tcu_clk_stop;
  clkstop_d2 <= clkstop_d1;
  clkstop_d3 <= clkstop_d2;
  clkstop_d4 <= clkstop_d3;
  clkstop_d5 <= clkstop_d4;

  tlb_bypass_m <= `SPC3.lsu.tlb.tlb_bypass;
  tlb_bypass_b <= tlb_bypass_m;
  tlb_rd_vld_m <= `SPC3.lsu.tlb.tlb_rd_vld | `SPC3.lsu.tlb.tlb_cam_vld;
  tlb_rd_vld_b <= tlb_rd_vld_m;

  // This signal is only valid for LD/ST instructions
  lsu_tl_gt_0_b <= `SPC3.lsu.dcc.tl_gt_0_m;

  // Can't use lsu.dcc_asi_b for tlb_sync so pipeline from M to B
  dcc_asi_b <= `SPC3.lsu.dcc_asi_m;

  // LD/ST that will not issue to the crossbar
  asi_internal_w <= `SPC3.lsu.dcc.asi_internal_b;
end // }

// TL determines whether Nucleus or Primary
wire [7:0] asi_num = `SPC3.lsu.dcc.altspace_ldst_b ? 
                     dcc_asi_b : 
                     (lsu_tl_gt_0_b ? 8'h04 : 8'h80);

wire [7:0] itlb_miss   = { (`SPC3.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire [7:0] icache_miss = { (`SPC3.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC3.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC3.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire inst_bypass = (`SPC3.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[0] |
                    `SPC3.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[1] |
                    `SPC3.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[2]);

wire [7:0] fetch_bypass = { (inst_bypass & `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                            (inst_bypass & `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                            (inst_bypass & `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                            (inst_bypass & `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                            (inst_bypass & `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                            (inst_bypass & `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                            (inst_bypass & `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                            (inst_bypass & `SPC3.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                          };

wire [7:0] itlb_wr = {(`SPC3.tlu.trl1.take_itw & `SPC3.tlu.trl1.trap[3]),
                      (`SPC3.tlu.trl1.take_itw & `SPC3.tlu.trl1.trap[2]),
                      (`SPC3.tlu.trl1.take_itw & `SPC3.tlu.trl1.trap[1]),
                      (`SPC3.tlu.trl1.take_itw & `SPC3.tlu.trl1.trap[0]),
                      (`SPC3.tlu.trl0.take_itw & `SPC3.tlu.trl0.trap[3]),
                      (`SPC3.tlu.trl0.take_itw & `SPC3.tlu.trl0.trap[2]),
                      (`SPC3.tlu.trl0.take_itw & `SPC3.tlu.trl0.trap[1]),
                      (`SPC3.tlu.trl0.take_itw & `SPC3.tlu.trl0.trap[0])
                     };

//------------------------------------

reg  [71:0] tick_cmpr_0; 
reg  [71:0] stick_cmpr_0; 
reg  [71:0] hstick_cmpr_0;
reg [151:0] trap_entry_1_t0;
reg [151:0] trap_entry_2_t0;
reg [151:0] trap_entry_3_t0;
reg [151:0] trap_entry_4_t0;
reg [151:0] trap_entry_5_t0;
reg [151:0] trap_entry_6_t0;

always @(posedge `BENCH_SPC3_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_0        <= `SPC3.tlu.tca.array.mem[{2'b0,3'h0}];
      stick_cmpr_0       <= `SPC3.tlu.tca.array.mem[{2'b01,3'h0}];
      hstick_cmpr_0      <= `SPC3.tlu.tca.array.mem[{2'b10,3'h0}];
      trap_entry_1_t0    <= `SPC3.tlu.tsa0.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t0    <= `SPC3.tlu.tsa0.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t0    <= `SPC3.tlu.tsa0.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t0    <= `SPC3.tlu.tsa0.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t0    <= `SPC3.tlu.tsa0.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t0    <= `SPC3.tlu.tsa0.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_1; 
reg  [71:0] stick_cmpr_1; 
reg  [71:0] hstick_cmpr_1;
reg [151:0] trap_entry_1_t1;
reg [151:0] trap_entry_2_t1;
reg [151:0] trap_entry_3_t1;
reg [151:0] trap_entry_4_t1;
reg [151:0] trap_entry_5_t1;
reg [151:0] trap_entry_6_t1;

always @(posedge `BENCH_SPC3_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_1        <= `SPC3.tlu.tca.array.mem[{2'b0,3'h1}];
      stick_cmpr_1       <= `SPC3.tlu.tca.array.mem[{2'b01,3'h1}];
      hstick_cmpr_1      <= `SPC3.tlu.tca.array.mem[{2'b10,3'h1}];
      trap_entry_1_t1    <= `SPC3.tlu.tsa0.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t1    <= `SPC3.tlu.tsa0.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t1    <= `SPC3.tlu.tsa0.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t1    <= `SPC3.tlu.tsa0.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t1    <= `SPC3.tlu.tsa0.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t1    <= `SPC3.tlu.tsa0.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_2; 
reg  [71:0] stick_cmpr_2; 
reg  [71:0] hstick_cmpr_2;
reg [151:0] trap_entry_1_t2;
reg [151:0] trap_entry_2_t2;
reg [151:0] trap_entry_3_t2;
reg [151:0] trap_entry_4_t2;
reg [151:0] trap_entry_5_t2;
reg [151:0] trap_entry_6_t2;

always @(posedge `BENCH_SPC3_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_2        <= `SPC3.tlu.tca.array.mem[{2'b0,3'h2}];
      stick_cmpr_2       <= `SPC3.tlu.tca.array.mem[{2'b01,3'h2}];
      hstick_cmpr_2      <= `SPC3.tlu.tca.array.mem[{2'b10,3'h2}];
      trap_entry_1_t2    <= `SPC3.tlu.tsa0.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t2    <= `SPC3.tlu.tsa0.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t2    <= `SPC3.tlu.tsa0.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t2    <= `SPC3.tlu.tsa0.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t2    <= `SPC3.tlu.tsa0.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t2    <= `SPC3.tlu.tsa0.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_3; 
reg  [71:0] stick_cmpr_3; 
reg  [71:0] hstick_cmpr_3;
reg [151:0] trap_entry_1_t3;
reg [151:0] trap_entry_2_t3;
reg [151:0] trap_entry_3_t3;
reg [151:0] trap_entry_4_t3;
reg [151:0] trap_entry_5_t3;
reg [151:0] trap_entry_6_t3;

always @(posedge `BENCH_SPC3_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_3        <= `SPC3.tlu.tca.array.mem[{2'b0,3'h3}];
      stick_cmpr_3       <= `SPC3.tlu.tca.array.mem[{2'b01,3'h3}];
      hstick_cmpr_3      <= `SPC3.tlu.tca.array.mem[{2'b10,3'h3}];
      trap_entry_1_t3    <= `SPC3.tlu.tsa0.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t3    <= `SPC3.tlu.tsa0.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t3    <= `SPC3.tlu.tsa0.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t3    <= `SPC3.tlu.tsa0.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t3    <= `SPC3.tlu.tsa0.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t3    <= `SPC3.tlu.tsa0.array.mem[{2'h3, 3'h5}];

end // }
reg  [71:0] tick_cmpr_4; 
reg  [71:0] stick_cmpr_4; 
reg  [71:0] hstick_cmpr_4;
reg [151:0] trap_entry_1_t4;
reg [151:0] trap_entry_2_t4;
reg [151:0] trap_entry_3_t4;
reg [151:0] trap_entry_4_t4;
reg [151:0] trap_entry_5_t4;
reg [151:0] trap_entry_6_t4;

always @(posedge `BENCH_SPC3_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_4        <= `SPC3.tlu.tca.array.mem[{2'b0,3'h4}];
      stick_cmpr_4       <= `SPC3.tlu.tca.array.mem[{2'b01,3'h4}];
      hstick_cmpr_4      <= `SPC3.tlu.tca.array.mem[{2'b10,3'h4}];
      trap_entry_1_t4    <= `SPC3.tlu.tsa1.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t4    <= `SPC3.tlu.tsa1.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t4    <= `SPC3.tlu.tsa1.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t4    <= `SPC3.tlu.tsa1.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t4    <= `SPC3.tlu.tsa1.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t4    <= `SPC3.tlu.tsa1.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_5; 
reg  [71:0] stick_cmpr_5; 
reg  [71:0] hstick_cmpr_5;
reg [151:0] trap_entry_1_t5;
reg [151:0] trap_entry_2_t5;
reg [151:0] trap_entry_3_t5;
reg [151:0] trap_entry_4_t5;
reg [151:0] trap_entry_5_t5;
reg [151:0] trap_entry_6_t5;

always @(posedge `BENCH_SPC3_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_5        <= `SPC3.tlu.tca.array.mem[{2'b0,3'h5}];
      stick_cmpr_5       <= `SPC3.tlu.tca.array.mem[{2'b01,3'h5}];
      hstick_cmpr_5      <= `SPC3.tlu.tca.array.mem[{2'b10,3'h5}];
      trap_entry_1_t5    <= `SPC3.tlu.tsa1.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t5    <= `SPC3.tlu.tsa1.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t5    <= `SPC3.tlu.tsa1.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t5    <= `SPC3.tlu.tsa1.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t5    <= `SPC3.tlu.tsa1.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t5    <= `SPC3.tlu.tsa1.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_6; 
reg  [71:0] stick_cmpr_6; 
reg  [71:0] hstick_cmpr_6;
reg [151:0] trap_entry_1_t6;
reg [151:0] trap_entry_2_t6;
reg [151:0] trap_entry_3_t6;
reg [151:0] trap_entry_4_t6;
reg [151:0] trap_entry_5_t6;
reg [151:0] trap_entry_6_t6;

always @(posedge `BENCH_SPC3_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_6        <= `SPC3.tlu.tca.array.mem[{2'b0,3'h6}];
      stick_cmpr_6       <= `SPC3.tlu.tca.array.mem[{2'b01,3'h6}];
      hstick_cmpr_6      <= `SPC3.tlu.tca.array.mem[{2'b10,3'h6}];
      trap_entry_1_t6    <= `SPC3.tlu.tsa1.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t6    <= `SPC3.tlu.tsa1.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t6    <= `SPC3.tlu.tsa1.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t6    <= `SPC3.tlu.tsa1.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t6    <= `SPC3.tlu.tsa1.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t6    <= `SPC3.tlu.tsa1.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_7; 
reg  [71:0] stick_cmpr_7; 
reg  [71:0] hstick_cmpr_7;
reg [151:0] trap_entry_1_t7;
reg [151:0] trap_entry_2_t7;
reg [151:0] trap_entry_3_t7;
reg [151:0] trap_entry_4_t7;
reg [151:0] trap_entry_5_t7;
reg [151:0] trap_entry_6_t7;

always @(posedge `BENCH_SPC3_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_7        <= `SPC3.tlu.tca.array.mem[{2'b0,3'h7}];
      stick_cmpr_7       <= `SPC3.tlu.tca.array.mem[{2'b01,3'h7}];
      hstick_cmpr_7      <= `SPC3.tlu.tca.array.mem[{2'b10,3'h7}];
      trap_entry_1_t7    <= `SPC3.tlu.tsa1.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t7    <= `SPC3.tlu.tsa1.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t7    <= `SPC3.tlu.tsa1.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t7    <= `SPC3.tlu.tsa1.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t7    <= `SPC3.tlu.tsa1.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t7    <= `SPC3.tlu.tsa1.array.mem[{2'h3, 3'h5}];

end // }

//------------------------------------
// ASI & Trap State machines
always @(posedge `BENCH_SPC3_GCLK) begin // {

//    pc_0_e[47:0] <= `SPC3.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC3.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC3.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC3.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;


    // altspace_ldst_m is asserted for asi accesses that don't change arch state
    asi_store_b <= (`SPC3.lsu.dcc.asi_store_m & `SPC3.lsu.dcc.asi_sync_m);
    asi_store_w <= asi_store_b;
    dcc_tid_b <= `SPC3.lsu.dcc.dcc_tid_m;
    dcc_tid_w <= dcc_tid_b;

    // ASI in progress state m/c
    if (asi_store_w & ~asi_store_flush_w[dcc_tid_w]) begin // {
        asi_in_progress_b[dcc_tid_w] <= 1'b1;
    end // }

    asi_valid_w <= asi_in_progress_b & store_sync;

    // Delay asi_valid_w and asi_in_progress
    // 2 clocks to ensure TLB Sync DTLBWRITE (demap) comes before SSTEP stxa
    asi_valid_fx4 <= asi_valid_w;
    asi_valid_fx5 <= asi_valid_fx4;
    asi_in_progress_w <= asi_in_progress_b;
    asi_in_progress_fx4 <= asi_in_progress_w;
    sync_reset_w <= sync_reset;
    
    for (i=0;i<8;i=i+1) begin // {
        if (asi_valid_w[i] | sync_reset_w[i]) begin // {
            asi_in_progress_b[i] <= 1'b0;
        end//}
    end //}

    // Trap0 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC3.tlu.tlu_trap_0_tid[1:0] == i) &&
            `SPC3.tlu.tlu_trap_pc_0_valid & tlu_ccr_cwp_0_valid_last)
        begin //{
            tlu_valid[i] <= 1'b1;
        end //}
        // Trap taken
        else if (`SPC3.tlu.trl0.real_trap[i] & ~`SPC3.tlu.trl0.take_por) begin // {
            tlu_valid[i] <= 1'b1;
        end //}
        else 
            tlu_valid[i] <= 1'b0;
    end //}

    // Trap1 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC3.tlu.tlu_trap_1_tid[1:0] == i) &&
            `SPC3.tlu.tlu_trap_pc_1_valid & tlu_ccr_cwp_1_valid_last)
        begin //{
            tlu_valid[i+4] <= 1'b1;
        end //} 
        // Trap taken
        else if (`SPC3.tlu.trl1.real_trap[i] & ~`SPC3.tlu.trl1.take_por) begin // {
            tlu_valid[i+4] <= 1'b1;
        end //}
        else 
            tlu_valid[i+4] <= 1'b0;
    end //}

end // }


always @(posedge `BENCH_SPC3_GCLK) begin

// debug code for TPCC analysis
`ifdef TPCC
if (pcx_req==1) begin
	if (`SPC3.spc_pcx_data_pa[129:124]==6'b100000) begin  // l15 dmiss
	  l15dmiss_cnt=l15dmiss_cnt+1;
	  $display("dmissl15 cnt is %0d",l15dmiss_cnt);
	end
	if (`SPC3.spc_pcx_data_pa[129:124]==6'b110000) begin // l15 imiss
	  l15imiss_cnt=l15imiss_cnt+1;
	  $display("imissl15 cnt is %0d",l15imiss_cnt);
	end
	// `TOP.spg.spc_pcx_data_pa[129:124]==6'b100001   -> all stores 
end

pcx_req <= |`SPC3.spc_pcx_req_pq[8:0];
 
if (`SPC3.ifu_l15_valid==1) begin
	imiss_cnt=imiss_cnt+1;
	$display("imiss cnt is %0d",imiss_cnt);
end
if (spec_dmiss==1 && `SPC3.lsu_l15_cancel==0) begin
	dmiss_cnt=dmiss_cnt+1;
	$display("dmiss cnt is %0d",dmiss_cnt);
	
end
spec_dmiss <= `SPC3.lsu_l15_valid & `SPC3.lsu_l15_load;

clock = clock+1;

// keep track of imiss latencies
if (`SPC3.ftu_agc_thr0_cmiss_c==1) begin
     start_imiss0=clock;
     active_imiss0=1;
end
if (active_imiss0==1 && first_imiss0==1 && `SPC3.l15_spc_cpkt[8:6]==3'b000 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss0 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss0=0;
     first_imiss0=0;
end
if (active_imiss0==1 && first_imiss0==0 && `SPC3.l15_spc_cpkt[8:6]==3'b000 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss0=1;
end
if (`SPC3.ftu_agc_thr1_cmiss_c==1) begin
     start_imiss1=clock;
     active_imiss1=1;
end
if (active_imiss1==1 && first_imiss1==1 && `SPC3.l15_spc_cpkt[8:6]==3'b001 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss1 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss1=0;
     first_imiss1=0;
end
if (active_imiss1==1 && first_imiss1==0 && `SPC3.l15_spc_cpkt[8:6]==3'b001 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss1=1;
end
if (`SPC3.ftu_agc_thr2_cmiss_c==1) begin
     start_imiss2=clock;
     active_imiss2=1;
end
if (active_imiss2==1 && first_imiss2==1 && `SPC3.l15_spc_cpkt[8:6]==3'b010 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss2 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss2=0;
     first_imiss2=0;
end
if (active_imiss2==1 && first_imiss2==0 && `SPC3.l15_spc_cpkt[8:6]==3'b010 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss2=1;
end
if (`SPC3.ftu_agc_thr3_cmiss_c==1) begin
     start_imiss3=clock;
     active_imiss3=1;
end
if (active_imiss3==1 && first_imiss3==1  && `SPC3.l15_spc_cpkt[8:6]==3'b011 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss3 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss3=0;
     first_imiss3=0;
end
if (active_imiss3==1 && first_imiss3==0 && `SPC3.l15_spc_cpkt[8:6]==3'b011 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss3=1;
end
if (`SPC3.ftu_agc_thr4_cmiss_c==1) begin
     start_imiss4=clock;
     active_imiss4=1;
end
if (active_imiss4==1 && first_imiss4==1  && `SPC3.l15_spc_cpkt[8:6]==3'b100 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss4 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss4=0;
     first_imiss4=0;
end
if (active_imiss4==1 && first_imiss4==0 && `SPC3.l15_spc_cpkt[8:6]==3'b100 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss4=1;
end
if (`SPC3.ftu_agc_thr5_cmiss_c==1) begin
     start_imiss5=clock;
     active_imiss5=1;
end
if (active_imiss5==1  && first_imiss5==1 && `SPC3.l15_spc_cpkt[8:6]==3'b101 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss5 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss5=0;
     first_imiss5=0;
end
if (active_imiss5==1 && first_imiss5==0 && `SPC3.l15_spc_cpkt[8:6]==3'b101 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss5=1;
end
if (`SPC3.ftu_agc_thr6_cmiss_c==1) begin
     start_imiss6=clock;
     active_imiss6=1;
end
if (active_imiss6==1 && first_imiss6==1 && `SPC3.l15_spc_cpkt[8:6]==3'b110 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss6 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss6=0;
     first_imiss6=0;
end
if (active_imiss6==1 && first_imiss6==0 && `SPC3.l15_spc_cpkt[8:6]==3'b110 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss6=1;
end
if (`SPC3.ftu_agc_thr7_cmiss_c==1) begin
     start_imiss7=clock;
     active_imiss7=1;
end
if (active_imiss7==1 && first_imiss7==1 && `SPC3.l15_spc_cpkt[8:6]==3'b111 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss7 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss7=0;
    first_imiss7=0;
end
if (active_imiss7==1 && first_imiss7==0 && `SPC3.l15_spc_cpkt[8:6]==3'b111 && `SPC3.l15_spc_valid==1 && `SPC3.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss7=1;
end

if (`SPC3.pku.swl0.set_lsu_sync_wait==1) begin
     start_dmiss0=clock;
end
if (`SPC3.pku.swl0.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss0) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC3.pku.swl1.set_lsu_sync_wait==1) begin
     start_dmiss1=clock;
end
if (`SPC3.pku.swl1.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss1) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC3.pku.swl2.set_lsu_sync_wait==1) begin
     start_dmiss2=clock;
end
if (`SPC3.pku.swl2.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss2) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC3.pku.swl3.set_lsu_sync_wait==1) begin
     start_dmiss3=clock;
end
if (`SPC3.pku.swl3.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss3) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC3.pku.swl4.set_lsu_sync_wait==1) begin
     start_dmiss4=clock;
end
if (`SPC3.pku.swl4.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss4) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC3.pku.swl5.set_lsu_sync_wait==1) begin
     start_dmiss5=clock;
end
if (`SPC3.pku.swl5.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss5) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC3.pku.swl6.set_lsu_sync_wait==1) begin
     start_dmiss6=clock;
end
if (`SPC3.pku.swl6.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss6) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC3.pku.swl7.set_lsu_sync_wait==1) begin
     start_dmiss7=clock;
end
if (`SPC3.pku.swl7.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss7) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
`endif



   lsu_tid_e[2:0] <= `SPC3.lsu.dcc.tid_d[2:0];

   // FG Valid conditions

   // Add fcc valids to fg_valid
   fcc_valid_fb <= fcc_valid_f5;
   fcc_valid_f5 <= fcc_valid_f4;
   fcc_valid_f4 <= |`SPC3.fgu.fgu_cmp_fcc_vld_fx3[3:0];

   fg_flush_fb <= fg_flush_f5;
   fg_flush_f5 <= fg_flush_f4;
   fg_flush_f4 <= fg_flush_f3;
   fg_flush_f3 <= fg_flush_f2 | `SPC3.dec_flush_f2 | 
                  `SPC3.tlu_flush_fgu_b;
   fg_flush_f2 <= `SPC3.dec_flush_f1;

   fgu_err_fx3 <= `SPC3.fgu_cecc_fx2 | `SPC3.fgu_uecc_fx2 | `SPC3.fgu.fpc.exu_flush_fx2; // frf or irf ecc error
   fgu_err_fx4 <= fgu_err_fx3;
   fgu_err_fx5 <= fgu_err_fx4;
   fgu_err_fb <= fgu_err_fx5;

   // Siams cause fg_valid ..
   siam0_d = `SPC3.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC3.dec.dec_inst0_d[24:19]==6'b110110 &
             `SPC3.dec.dec_inst0_d[13:5]==9'b010000001;  

   siam1_d = `SPC3.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC3.dec.dec_inst1_d[24:19]==6'b110110 &
             `SPC3.dec.dec_inst1_d[13:5]==9'b010000001;  
    

   done0_d = `SPC3.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC3.dec.dec_inst0_d[29:25]==5'b00000 & 
             `SPC3.dec.dec_inst0_d[24:19]==6'b111110;
   done1_d = `SPC3.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC3.dec.dec_inst1_d[29:25]==5'b00000 & 
             `SPC3.dec.dec_inst1_d[24:19]==6'b111110;    

   retry0_d = `SPC3.dec.dec_inst0_d[31:30]==2'b10 & 
              `SPC3.dec.dec_inst0_d[29:25]==5'b00001 & 
              `SPC3.dec.dec_inst0_d[24:19]==6'b111110;
   retry1_d = `SPC3.dec.dec_inst1_d[31:30]==2'b10 & 
              `SPC3.dec.dec_inst1_d[29:25]==5'b00001 & 
              `SPC3.dec.dec_inst1_d[24:19]==6'b111110;   

   done0_e <= done0_d & `SPC3.dec.dec_decode0_d;
   done1_e <= done1_d & `SPC3.dec.dec_decode1_d; 

   retry0_e <= retry0_d & `SPC3.dec.dec_decode0_d;
   retry1_e <= retry1_d & `SPC3.dec.dec_decode1_d;   


   // fold siam into cmov logic 

   fmov_valid_fb <= fmov_valid_f5;
   fmov_valid_f5 <= fmov_valid_f4;
   fmov_valid_f4 <= fmov_valid_f3;
   fmov_valid_f3 <= fmov_valid_f2;
   fmov_valid_f2 <= fmov_valid_m;
   fmov_valid_m  <= fmov_valid_e & `SPC3.dec.dec_fgu_valid_e;
   fmov_valid_e <= ((`SPC3.exu0.ect.cmov_d | siam0_d) & 
                    `SPC3.dec.dec_decode0_d&`SPC3.dec.del.fgu0_d) |
                    ((`SPC3.exu1.ect.cmov_d | siam1_d) & 
                    `SPC3.dec.dec_decode1_d&`SPC3.dec.del.fgu1_d);
   
   // fgu check bus

   // fcc_valid_fb doesn't assert for LDFSR. LDFSR gets checked by the LSU
   // checker

   fg_valid <= {(`SPC3.fgu.fac.fac_w1_tid_fb[2:0]==3'h7) && fg_cond_fb,
                (`SPC3.fgu.fac.fac_w1_tid_fb[2:0]==3'h6) && fg_cond_fb,
                (`SPC3.fgu.fac.fac_w1_tid_fb[2:0]==3'h5) && fg_cond_fb,
                (`SPC3.fgu.fac.fac_w1_tid_fb[2:0]==3'h4) && fg_cond_fb,
                (`SPC3.fgu.fac.fac_w1_tid_fb[2:0]==3'h3) && fg_cond_fb,
                (`SPC3.fgu.fac.fac_w1_tid_fb[2:0]==3'h2) && fg_cond_fb,
                (`SPC3.fgu.fac.fac_w1_tid_fb[2:0]==3'h1) && fg_cond_fb,
                (`SPC3.fgu.fac.fac_w1_tid_fb[2:0]==3'h0) && fg_cond_fb };
   

   fgu_valid_fb0      <= `SPC3.fgu_exu_w_vld_fx5[0] && !`SPC3.fgu.fpc.div_finish_int_fb;
   fgu_valid_fb1      <= `SPC3.fgu_exu_w_vld_fx5[1] && !`SPC3.fgu.fpc.div_finish_int_fb;

   // Fdiv
   div_special_cancel_f4[7:0] <= tid2onehot(`SPC3.fgu.fac.tid_fx3[2:0]) & 
                               {8{`SPC3.fgu.fac.q_div_default_res_fx3}};
   fg_fdiv_valid_fw <= `SPC3.fgu_divide_completion & ~div_special_cancel_f4 &
                       {8{~`SPC3.fgu.fpc.fpc_fpd_ieee_trap_fb}} &
                       {8{~`SPC3.fgu.fpc.fpc_fpd_unfin_fb}};

    
   // Used in CCX Stub ?
   inst0_e[31:0] <= `SPC3.dec.dec_inst0_d[31:0];
   inst1_e[31:0] <= `SPC3.dec.dec_inst1_d[31:0];

   // only fgu ops that are not loads/stores
   fgu0_e <= `SPC3.dec.del.decode_fgu0_d;  
   fgu1_e <= `SPC3.dec.del.decode_fgu1_d;

   // LSU logic 
   load_b <= load_m;
   load_m <= (load0_e | load1_e);

   load0_e <= (`SPC3.dec.dec_decode0_d & `SPC3.dec.del.lsu0_d & 
               `SPC3.dec.dcd0.dcd_load_d);

   load1_e <= (`SPC3.dec.dec_decode1_d & `SPC3.dec.del.lsu1_d & 
               `SPC3.dec.dcd1.dcd_load_d);

   lsu_tid_b[2:0] <= lsu_tid_m[2:0];
   lsu_tid_m[2:0] <= lsu_tid_e[2:0];

   lsu_complete_m[7:0] <= `SPC3.lsu_complete[7:0];
   lsu_complete_b[7:0] <= lsu_complete_m[7:0];

   lsu_data_w  <= lsu_data_b;
  
   // Divide destination logic ..
   sel_divide0_e <= (`SPC3.dec_decode0_d & 
                     ((`SPC3.pku.swl0.vld_d & `SPC3.pku.swl_divide_wait[0]) |
                      (`SPC3.pku.swl1.vld_d & `SPC3.pku.swl_divide_wait[1]) |
                      (`SPC3.pku.swl2.vld_d & `SPC3.pku.swl_divide_wait[2]) |
                      (`SPC3.pku.swl3.vld_d & `SPC3.pku.swl_divide_wait[3])));
   sel_divide1_e <= (`SPC3.dec_decode1_d & 
                     ((`SPC3.pku.swl4.vld_d & `SPC3.pku.swl_divide_wait[4]) |
                      (`SPC3.pku.swl5.vld_d & `SPC3.pku.swl_divide_wait[5]) |
                      (`SPC3.pku.swl6.vld_d & `SPC3.pku.swl_divide_wait[6]) |
                      (`SPC3.pku.swl7.vld_d & `SPC3.pku.swl_divide_wait[7])));


   dcd_fdest_e <= {`SPC3.dec.del.fdest1_d,`SPC3.dec.del.fdest0_d};
   dcd_idest_e <= {`SPC3.dec.del.idest1_d,`SPC3.dec.del.idest0_d};

   if (sel_divide0_e) begin // {
         div_idest[{1'b0, `SPC3.dec.del.tid0_e[1:0]}] <= dcd_idest_e[0];
         div_fdest[{1'b0, `SPC3.dec.del.tid0_e[1:0]}] <= dcd_fdest_e[0];
   end // }
   if (sel_divide1_e) begin // {
         div_idest[{1'b1, `SPC3.dec.del.tid1_e[1:0]}] <= dcd_idest_e[1];
         div_fdest[{1'b1, `SPC3.dec.del.tid1_e[1:0]}] <= dcd_fdest_e[1];
   end // }
                 

   // EX logic
   // Save EX tids for later use
   ex0_tid_m <= ex0_tid_e;
   ex1_tid_m <= ex1_tid_e;
   ex0_tid_b <= ex0_tid_m;
   ex1_tid_b <= ex1_tid_m;
   ex0_tid_w <= ex0_tid_b;
   ex1_tid_w <= ex1_tid_b;

   // EX Flush conditions
   ex_flush_w <= {ex_flush_b | {{4{(`SPC3.dec.dec_flush_b[1] | 
                                `SPC3.tlu_flush_exu_b[1])}},
                                {4{(`SPC3.dec.dec_flush_b[0] |
                                `SPC3.tlu_flush_exu_b[0])}}}};

   ex_flush_b <= {{4{`SPC3.dec.dec_flush_m[1]}},
                 {4{`SPC3.dec.dec_flush_m[0]}}};


   // ex_valid_f4 valid will only fire on return
   return_f4 <= return_w & ~(`SPC3.tlu_flush_ifu & real_exception);
   ex_valid_w <= ex_valid_b;

   // Cancel EX valid if it turns out to be asr/asi access for this tid 

   ex_valid_b <= ex_valid_m & ~ex_asr_access;


   ex_valid_m <=      { (ex1_tid_e == 2'h3) && ex1_valid_e,
                       (ex1_tid_e == 2'h2) && ex1_valid_e,
                       (ex1_tid_e == 2'h1) && ex1_valid_e,
                       (ex1_tid_e == 2'h0) && ex1_valid_e,
                       (ex0_tid_e == 2'h3) && ex0_valid_e,
                       (ex0_tid_e == 2'h2) && ex0_valid_e,
                       (ex0_tid_e == 2'h1) && ex0_valid_e,
                       (ex0_tid_e == 2'h0) && ex0_valid_e};
   

  // TLU delays for done and retries
  tlu_ccr_cwp_0_valid_last <= `SPC3.tlu.tlu_ccr_cwp_0_valid;
  tlu_ccr_cwp_1_valid_last <= `SPC3.tlu.tlu_ccr_cwp_1_valid;
  

end // END posedge gclk

// Return instruction is separated out of ex*_valid because CWP update is in
// W+1 for return new window is not available for IRF scan (nas_pipe) until
// W+2
assign return0 = `SPC3.exu0.rml.return_w & 
                 `SPC3.exu0.rml.inst_vld_w;
assign return1 = `SPC3.exu1.rml.return_w & 
                 `SPC3.exu1.rml.inst_vld_w;
assign return_w = {(ex1_tid_w == 2'h3) && return1,
                   (ex1_tid_w == 2'h2) && return1,
                   (ex1_tid_w == 2'h1) && return1,
                   (ex1_tid_w == 2'h0) && return1,
                   (ex0_tid_w == 2'h3) && return0,
                   (ex0_tid_w == 2'h2) && return0,
                   (ex0_tid_w == 2'h1) && return0,
                   (ex0_tid_w == 2'h0) && return0};


// Cancel EX valid if it turns out that exception (tlu flush) taken for
// this tid

// exu check bus
assign ex0_tid_e = `SPC3.exu0.ect_tid_lth_e[1:0];
assign ex0_valid_e = `SPC3.dec.dec_valid_e[0] & ~fgu0_e & ~load0_e &
                     ~retry0_e & ~done0_e;
assign ex1_tid_e = `SPC3.exu1.ect_tid_lth_e[1:0];
assign ex1_valid_e = `SPC3.dec.dec_valid_e[1] & ~fgu1_e & ~load1_e &
                     ~retry1_e & ~done1_e;

assign ex_asr_valid = `SPC3.lsu.dcc.asi_store_m & `SPC3.lsu.dcc.asi_sync_m ;

assign ex_asr_access ={(`SPC3.lsu.dcc.dcc_tid_m[2:0]==3'h7) & ex_asr_valid,
                       (`SPC3.lsu.dcc.dcc_tid_m[2:0]==3'h6) & ex_asr_valid,
                       (`SPC3.lsu.dcc.dcc_tid_m[2:0]==3'h5) & ex_asr_valid,
                       (`SPC3.lsu.dcc.dcc_tid_m[2:0]==3'h4) & ex_asr_valid,
                       (`SPC3.lsu.dcc.dcc_tid_m[2:0]==3'h3) & ex_asr_valid,
                       (`SPC3.lsu.dcc.dcc_tid_m[2:0]==3'h2) & ex_asr_valid,
                       (`SPC3.lsu.dcc.dcc_tid_m[2:0]==3'h1) & ex_asr_valid,
                       (`SPC3.lsu.dcc.dcc_tid_m[2:0]==3'h0) & ex_asr_valid};


// EXU valid is ex_valid_w, except flushes, delayed return, traps, and stfsr
// real_exception added because tlu_flush_ifu activates for second redirect
// of retry if TPC and TNPC are not verified as sequential
assign  real_exception =
	   {{4 {`SPC3.tlu.fls1.dec_exc_w | 
		`SPC3.tlu.fls1.exu_exc_w |
		`SPC3.tlu.fls1.lsu_exc_w | 
                `SPC3.tlu.fls1.bsee_req_w}},
	    {4 {`SPC3.tlu.fls0.dec_exc_w | 
		`SPC3.tlu.fls0.exu_exc_w |
		`SPC3.tlu.fls0.lsu_exc_w | 
                `SPC3.tlu.fls0.bsee_req_w}}};

// Do not assert ex_valid for block store instructions
wire [7:0] block_store_first_at_w = 
           {`SPC3.lsu.sbs7.bst_pend & `SPC3.lsu.sbs7.blk_inst_w, 
            `SPC3.lsu.sbs6.bst_pend & `SPC3.lsu.sbs6.blk_inst_w, 
            `SPC3.lsu.sbs5.bst_pend & `SPC3.lsu.sbs5.blk_inst_w, 
            `SPC3.lsu.sbs4.bst_pend & `SPC3.lsu.sbs4.blk_inst_w, 
            `SPC3.lsu.sbs3.bst_pend & `SPC3.lsu.sbs3.blk_inst_w, 
            `SPC3.lsu.sbs2.bst_pend & `SPC3.lsu.sbs2.blk_inst_w, 
            `SPC3.lsu.sbs1.bst_pend & `SPC3.lsu.sbs1.blk_inst_w, 
            `SPC3.lsu.sbs0.bst_pend & `SPC3.lsu.sbs0.blk_inst_w};

// But inject a valid for a block store that's done...
reg [7:0] block_store_w;
always @(posedge `BENCH_SPC3_GCLK) begin
    block_store_w[7:0] <= `SPC3.lsu.lsu_block_store_b[7:0];
    lsu_trap_flush_d <=  `SPC3.lsu_trap_flush[7:0];
end

wire [7:0] block_store_inject_at_w = 
                                    ~`SPC3.lsu.lsu_block_store_b[7:0] & 
                                    block_store_w[7:0] &
                                    {~`SPC3.lsu.sbs7.bst_kill,
                                     ~`SPC3.lsu.sbs6.bst_kill,
                                     ~`SPC3.lsu.sbs5.bst_kill,
                                     ~`SPC3.lsu.sbs4.bst_kill,
                                     ~`SPC3.lsu.sbs3.bst_kill,
                                     ~`SPC3.lsu.sbs2.bst_kill,
                                     ~`SPC3.lsu.sbs1.bst_kill,
                                     ~`SPC3.lsu.sbs0.bst_kill};

assign ex_valid = (((ex_valid_w & ~ex_flush_w & ~return_w & ~block_store_first_at_w & ~exception_w &
                     ~({{4{`SPC3.tlu.fls1.exu_exc_b & `SPC3.tlu.fls1.beat_two_b}},
                        {4{`SPC3.tlu.fls0.exu_exc_b & `SPC3.tlu.fls0.beat_two_b}}}) &
                     ~{(`SPC3.fgu.fac.tid_fx3[2:0]==3'h7) & `SPC3.fgu.fpc.fsr_store_fx3,
                       (`SPC3.fgu.fac.tid_fx3[2:0]==3'h6) & `SPC3.fgu.fpc.fsr_store_fx3,
                       (`SPC3.fgu.fac.tid_fx3[2:0]==3'h5) & `SPC3.fgu.fpc.fsr_store_fx3,
                       (`SPC3.fgu.fac.tid_fx3[2:0]==3'h4) & `SPC3.fgu.fpc.fsr_store_fx3,
                       (`SPC3.fgu.fac.tid_fx3[2:0]==3'h3) & `SPC3.fgu.fpc.fsr_store_fx3,
                       (`SPC3.fgu.fac.tid_fx3[2:0]==3'h2) & `SPC3.fgu.fpc.fsr_store_fx3,
                       (`SPC3.fgu.fac.tid_fx3[2:0]==3'h1) & `SPC3.fgu.fpc.fsr_store_fx3,
                       (`SPC3.fgu.fac.tid_fx3[2:0]==3'h0) & `SPC3.fgu.fpc.fsr_store_fx3}) | 
                     block_store_inject_at_w) & 
                   ~(`SPC3.tlu_flush_ifu & real_exception)) | return_f4;

assign exception_w = {{4 {`SPC3.tlu.fls1.exc_for_w}} | 
                      `SPC3.tlu.fls1.bsee_req[3:0] | 
		      `SPC3.tlu.fls1.pdist_ecc_w[3:0],
		      {4 {`SPC3.tlu.fls0.exc_for_w}} |
		      `SPC3.tlu.fls0.bsee_req[3:0] | 
		      `SPC3.tlu.fls0.pdist_ecc_w[3:0]};

// imul check bus - includes imul, save, restore instructions
assign imul_valid = {(`SPC3.exu1.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb1,
                     (`SPC3.exu1.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb1,
                     (`SPC3.exu1.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb1,
                     (`SPC3.exu1.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb1,
                     (`SPC3.exu0.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb0,
                     (`SPC3.exu0.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb0,
                     (`SPC3.exu0.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb0,
                     (`SPC3.exu0.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb0};

// qualify this signal with fgu_err. If fgu_err is encountered, deassert
//fg_cond_fb, so we don't send a step to Riesling.

// FGU conditions
wire fg_cond_fb_pre_err = `SPC3.fgu.fpc.fpc_w1_ul_vld_fb | fcc_valid_fb | 
                     (fmov_valid_fb & ~fg_flush_fb) |
                     (`SPC3.fgu.fac.fsr_w1_vld_fb[1]);  // covers ST(X)FSR, which clears FSR.ftt

assign fg_cond_fb = fg_cond_fb_pre_err  & ~fgu_err_fb;

// Idiv/Fdiv signals

assign fgu_idiv_valid = fg_div_valid & div_idest;


assign fgu_fdiv_valid = fg_fdiv_valid_fw & div_fdest;


// Lsu signals needed to check lsu results

assign lsu_valid     = lsu_check | lsu_data_w;

assign fg_div_valid  = `SPC3.fgu_divide_completion & ~div_special_cancel_f4;
   
// State machine asserts lsu_check for LD hit/miss
always @(posedge `BENCH_SPC3_GCLK) begin
  for (i=0; i<=7;i=i+1) begin // {
      lsu_check[i] <= 1'b0;
      case (lsu_state[i])
        1'b0: // IDLE state
              begin
                // LD hit
                if (lsu_ld_valid & lsu_tid_dec_b[i] & load_b) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - normal case
                else if (lsu_ld_valid & lsu_tid_dec_b[i] & lsu_complete_b[i]) 
                begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - LDD or Block LD or SWAP
                else if (lsu_ld_valid & lsu_tid_dec_b[i]) begin
                  lsu_state[i] <= 1'b1; // VALID state
                end
// Added a new term to handle STB uncorrectable errors on atomic or asi stores that are synced
//Send a complete if an atomic is squashed.
//lsu_trap_flush is asserted a cycle after the block_store_kill is asserted
		else if (`SPC3.lsu.dcc.sync_st[i] & `SPC3.lsu_block_store_kill[i] & ~lsu_trap_flush_d[i])
		begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
                
              end
        1'b1: // VALID state
              begin
                if ((lsu_complete_b[i])) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
              end
      endcase
  end // }
end

   
assign lsu_tid   = `SPC3.lsu.dcc.ld_tid_b[2:0];
//Don't assert LSU_complete in case of dtlb or irf errors

assign lsu_valid_b = (`SPC3.lsu.dcc.pref_inst_b & 
                      ~(dec_flush_lb | `SPC3.lsu.dcc.pipe_flush_b | 
			`SPC3.lsu_dtdp_err_b | `SPC3.lsu_dttp_err_b |
			`SPC3.lsu_dtmh_err_b | `SPC3.lsu.dcc.exu_error_b));

assign lsu_data_b[7:0] = { (lsu_tid == 3'h7) & lsu_valid_b,
                          (lsu_tid == 3'h6) & lsu_valid_b,
                          (lsu_tid == 3'h5) & lsu_valid_b,
                          (lsu_tid == 3'h4) & lsu_valid_b,
                          (lsu_tid == 3'h3) & lsu_valid_b,
                          (lsu_tid == 3'h2) & lsu_valid_b,
                          (lsu_tid == 3'h1) & lsu_valid_b,
                          (lsu_tid == 3'h0) & lsu_valid_b};

assign  lsu_tid_dec_b[0] = `SPC3.lsu.dcc.ld_tid_b[2:0] == 3'd0;
assign  lsu_tid_dec_b[1] = `SPC3.lsu.dcc.ld_tid_b[2:0] == 3'd1;
assign  lsu_tid_dec_b[2] = `SPC3.lsu.dcc.ld_tid_b[2:0] == 3'd2;
assign  lsu_tid_dec_b[3] = `SPC3.lsu.dcc.ld_tid_b[2:0] == 3'd3;
assign  lsu_tid_dec_b[4] = `SPC3.lsu.dcc.ld_tid_b[2:0] == 3'd4;
assign  lsu_tid_dec_b[5] = `SPC3.lsu.dcc.ld_tid_b[2:0] == 3'd5;
assign  lsu_tid_dec_b[6] = `SPC3.lsu.dcc.ld_tid_b[2:0] == 3'd6;
assign  lsu_tid_dec_b[7] = `SPC3.lsu.dcc.ld_tid_b[2:0] == 3'd7;

assign  lsu_ld_valid = (`SPC3.lsu.dcc.exu_ld_vld_b |`SPC3.lsu.dcc.fgu_fld_vld_b) &
                       ~(`SPC3.lsu.dcc.flush_all_b & `SPC3.lsu.dcc.ld_inst_vld_b);
assign  dec_flush_lb = `SPC3.dec.dec_flush_lb | `SPC3.tlu_flush_lsu_b; 


// LSU interface to CCX stub

assign  exu_lsu_valid = `SPC3.dec.del.lsu_valid_e;
assign  exu_lsu_addr[47:0] = `SPC3.exu_lsu_address_e[47:0];
assign  exu_lsu_tid[2:0] = lsu_tid_e[2:0];
assign  exu_lsu_regid[4:0] = `SPC3.dec.dec_lsu_rd_e[4:0];
assign  exu_lsu_data[63:0] = `SPC3.exu_lsu_store_data_e[63:0];
assign  exu_lsu_instr[31:0] =   ({32{`SPC3.dec.dec_lsu_sel0_e}} & 
                                inst0_e[31:0]) |
                                ({32{~`SPC3.dec.dec_lsu_sel0_e}} & 
                                inst1_e[31:0]);
assign ld_inst_d = `SPC3.dec.dec_ld_inst_d;

///////////////////////////////////////////////////////////////////////////////
// Debugging Instruction Opcodes Pipeline
///////////////////////////////////////////////////////////////////////////////


   reg [31:0] op_0_w;
   reg [31:0] op_1_w;
   reg [31:0] op_2_w;
   reg [31:0] op_3_w;
   reg [31:0] op_4_w;
   reg [31:0] op_5_w;
   reg [31:0] op_6_w;
   reg [31:0] op_7_w;

   reg [31:0] op0_b;
   reg [31:0] op0_m;
   reg [31:0] op0_e;
   reg [31:0] op0_d;

   reg [31:0] op1_b;
   reg [31:0] op1_m;
   reg [31:0] op1_e;
   reg [31:0] op1_d;

   reg [255:0] inst0_string_w;
   reg [255:0] inst0_string_b;
   reg [255:0] inst0_string_m;
   reg [255:0] inst0_string_e;
   reg [255:0] inst0_string_d;

   reg [255:0] inst1_string_w;
   reg [255:0] inst1_string_b;
   reg [255:0] inst1_string_m;
   reg [255:0] inst1_string_e;
   reg [255:0] inst1_string_d;

   reg [255:0] inst0_string_p;
   reg [255:0] inst1_string_p;
   reg [255:0] inst2_string_p;
   reg [255:0] inst3_string_p;
   reg [255:0] inst4_string_p;
   reg [255:0] inst5_string_p;
   reg [255:0] inst6_string_p;
   reg [255:0] inst7_string_p;

initial begin
    op_0_w = 32'b0;
    op_1_w = 32'b0;
    op_2_w = 32'b0;
    op_3_w = 32'b0;
    op_4_w = 32'b0;
    op_5_w = 32'b0;
    op_6_w = 32'b0;
    op_7_w = 32'b0;
end

always @(posedge `BENCH_SPC3_GCLK) begin // {
  op_0_w <= ({32 { select_pc_b[0]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[0]}} & op_0_w[31:0]) ;
  op_1_w <= ({32 { select_pc_b[1]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[1]}} & op_1_w[31:0]) ;
  op_2_w <= ({32 { select_pc_b[2]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[2]}} & op_2_w[31:0]) ;
  op_3_w <= ({32 { select_pc_b[3]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[3]}} & op_3_w[31:0]) ;
  op_4_w <= ({32 { select_pc_b[4]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[4]}} & op_4_w[31:0]) ;
  op_5_w <= ({32 { select_pc_b[5]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[5]}} & op_5_w[31:0]) ;
  op_6_w <= ({32 { select_pc_b[6]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[6]}} & op_6_w[31:0]) ;
  op_7_w <= ({32 { select_pc_b[7]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[7]}} & op_7_w[31:0]) ;

  op0_b <= op0_m;
  op0_m <= op0_e;
  op0_e <= op0_d;
  op0_d <= `SPC3.dec.ded0.decode_mux[31:0];

  op1_b <= op1_m;
  op1_m <= op1_e;
  op1_e <= op1_d;
  op1_d <= `SPC3.dec.ded1.decode_mux[31:0];

  inst0_string_w<=inst0_string_b;
  inst0_string_b<=inst0_string_m;
  inst0_string_m<=inst0_string_e;
  inst0_string_e<=inst0_string_d;
  inst0_string_d<=xlate(`SPC3.dec.ded0.decode_mux[31:0]);

  inst1_string_w<=inst1_string_b;
  inst1_string_b<=inst1_string_m;
  inst1_string_m<=inst1_string_e;
  inst1_string_e<=inst1_string_d;
  inst1_string_d<=xlate(`SPC3.dec.ded1.decode_mux[31:0]);

// instructions for each thread at pick
  inst0_string_p<=xlate(`SPC3.ifu_ibu.ibf0.buf0_in[31:0]);
  inst1_string_p<=xlate(`SPC3.ifu_ibu.ibf1.buf0_in[31:0]);
  inst2_string_p<=xlate(`SPC3.ifu_ibu.ibf2.buf0_in[31:0]);
  inst3_string_p<=xlate(`SPC3.ifu_ibu.ibf3.buf0_in[31:0]);
  inst4_string_p<=xlate(`SPC3.ifu_ibu.ibf4.buf0_in[31:0]);
  inst5_string_p<=xlate(`SPC3.ifu_ibu.ibf5.buf0_in[31:0]);
  inst6_string_p<=xlate(`SPC3.ifu_ibu.ibf6.buf0_in[31:0]);
  inst7_string_p<=xlate(`SPC3.ifu_ibu.ibf7.buf0_in[31:0]);

end //}

///////////////////////////////////////////////////////////////////////////////
// Functions 
///////////////////////////////////////////////////////////////////////////////
function [2:0] onehot2tid;
   input [7:0] onehot;

   begin

   if      (onehot[7:0]==8'b00000001) onehot2tid[2:0] = 3'b000;
   else if (onehot[7:0]==8'b00000010) onehot2tid[2:0] = 3'b001;
   else if (onehot[7:0]==8'b00000100) onehot2tid[2:0] = 3'b010;
   else if (onehot[7:0]==8'b00001000) onehot2tid[2:0] = 3'b011;
   else if (onehot[7:0]==8'b00010000) onehot2tid[2:0] = 3'b100;
   else if (onehot[7:0]==8'b00100000) onehot2tid[2:0] = 3'b101;
   else if (onehot[7:0]==8'b01000000) onehot2tid[2:0] = 3'b110;
   else if (onehot[7:0]==8'b10000000) onehot2tid[2:0] = 3'b111;
   
   end
endfunction

function [7:0] tid2onehot;
   input [2:0] tid;

   begin

   if      (tid[2:0]==3'b000) tid2onehot[7:0] = 8'b00000001;
   else if (tid[2:0]==3'b001) tid2onehot[7:0] = 8'b00000010;
   else if (tid[2:0]==3'b010) tid2onehot[7:0] = 8'b00000100;
   else if (tid[2:0]==3'b011) tid2onehot[7:0] = 8'b00001000;
   else if (tid[2:0]==3'b100) tid2onehot[7:0] = 8'b00010000;
   else if (tid[2:0]==3'b101) tid2onehot[7:0] = 8'b00100000;
   else if (tid[2:0]==3'b110) tid2onehot[7:0] = 8'b01000000;
   else if (tid[2:0]==3'b111) tid2onehot[7:0] = 8'b10000000;
   
   end
endfunction

//---------------------

function [255:0] xlate;
   input [31:0] inst;

   begin
     casex(inst[31:0])
32'b10xxxxx110100xxxxx001000011xxxxx : xlate[255:0]="FADDq";
32'b10xxxxx110100xxxxx001000111xxxxx : xlate[255:0]="FSUBq";
32'b10000xx110101xxxxx001010011xxxxx : xlate[255:0]="FCMPq";
32'b10000xx110101xxxxx001010111xxxxx : xlate[255:0]="FCMPEq";
32'b10xxxxx110100xxxxx011001101xxxxx : xlate[255:0]="FsTOq";
32'b10xxxxx110100xxxxx011001110xxxxx : xlate[255:0]="FdTOq";
32'b10xxxxx110100xxxxx010001100xxxxx : xlate[255:0]="FxTOq";
32'b10xxxxx110100xxxxx011001100xxxxx : xlate[255:0]="FiTOq";
32'b10xxxxx110100xxxxx000000011xxxxx : xlate[255:0]="FMOVq";
32'b10xxxxx110100xxxxx000000111xxxxx : xlate[255:0]="FNEGq";
32'b10xxxxx110100xxxxx000001011xxxxx : xlate[255:0]="FABSq";
32'b10xxxxx110100xxxxx001001011xxxxx : xlate[255:0]="FMULq";
32'b10xxxxx110100xxxxx001101110xxxxx : xlate[255:0]="FdMULq";
32'b10xxxxx110100xxxxx001001111xxxxx : xlate[255:0]="FDIVq";
32'b10xxxxx110100xxxxx000101011xxxxx : xlate[255:0]="FSQRTq";
32'b10xxxxx1101010xxxx0xx100111xxxxx : xlate[255:0]="FMOVrQa";
32'b10xxxxx1101010xxxx0x1x00111xxxxx : xlate[255:0]="FMOVrQb";
32'b10xxxxx110100xxxxx011010011xxxxx : xlate[255:0]="FqTOi";
32'b10xxxxx110100xxxxx010000011xxxxx : xlate[255:0]="FqTOx";
32'b10xxxxx110100xxxxx011000111xxxxx : xlate[255:0]="FqTOs";
32'b10xxxxx110100xxxxx011001011xxxxx : xlate[255:0]="FqTOd";
32'b11xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQF";
32'b11xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFi";
32'b11xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQFA";
32'b11xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFAi";
32'b11xxxxx100110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFi";
32'b11xxxxx100110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQF";
32'b11xxxxx110110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQFA";
32'b11xxxxx110110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFAi";
32'b10xxxxx1101010xxxxxxx000011xxxxx : xlate[255:0]="FMOVQcc";
32'b10xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADD";
32'b10xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDcc";
32'b10xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDC";
32'b10xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDCcc";
32'b10xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDi";
32'b10xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDcci";
32'b10xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCi";
32'b10xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCcci";
32'b00x0xx1011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr1";
32'b00x0x1x011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr2";
32'b00xx000110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfccA";
32'b00xx1xx110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc1";
32'b00xxx1x110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc2";
32'b00xxxx1110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc3";
32'b00xx000101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfccA";
32'b00xx1xx101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc1";
32'b00xxx1x101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc2";
32'b00xxxx1101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc3";
32'b00xx000010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BiccA";
32'b00xx1xx010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc1";
32'b00xxx1x010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc2";
32'b00xxxx1010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc3";
32'b00xx000001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPccA";
32'b00xx1xx001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc1";
32'b00xxx1x001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc2";
32'b00xxxx1001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc3";
32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="CALL";
32'b11xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASA";
32'b11xxxxx111110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASXA";
32'b11xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASAi";
32'b11xxxxx111110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASXAi";
32'b10xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIV";
32'b10xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIV";
32'b10xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVcc";
32'b10xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVcc";
32'b10xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVi";
32'b10xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVi";
32'b10xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVcci";
32'b10xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVcci";
32'b1000000111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="DONE";
32'b1000001111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RETRY";
32'b10xxxxx110100xxxxx001000001xxxxx : xlate[255:0]="FADDs";
32'b10xxxxx110100xxxxx001000010xxxxx : xlate[255:0]="FADDd";
32'b10xxxxx110100xxxxx001000101xxxxx : xlate[255:0]="FSUBs";
32'b10xxxxx110100xxxxx001000110xxxxx : xlate[255:0]="FSUBd";
32'b10000xx110101xxxxx001010001xxxxx : xlate[255:0]="FCMPs";
32'b10000xx110101xxxxx001010010xxxxx : xlate[255:0]="FCMPd";
32'b10000xx110101xxxxx001010101xxxxx : xlate[255:0]="FCMPEs";
32'b10000xx110101xxxxx001010110xxxxx : xlate[255:0]="FCMPEd";
32'b10xxxxx110100xxxxx010000001xxxxx : xlate[255:0]="FsTOx";
32'b10xxxxx110100xxxxx010000010xxxxx : xlate[255:0]="FdTOx";
32'b10xxxxx110100xxxxx011010001xxxxx : xlate[255:0]="FsTOi";
32'b10xxxxx110100xxxxx011010010xxxxx : xlate[255:0]="FdTOi";
32'b10xxxxx110100xxxxx011001001xxxxx : xlate[255:0]="FsTOd";
32'b10xxxxx110100xxxxx011000110xxxxx : xlate[255:0]="FdTOs";
32'b10xxxxx110100xxxxx010000100xxxxx : xlate[255:0]="FxTOs";
32'b10xxxxx110100xxxxx010001000xxxxx : xlate[255:0]="FxTOd";
32'b10xxxxx110100xxxxx011000100xxxxx : xlate[255:0]="FiTOs";
32'b10xxxxx110100xxxxx011001000xxxxx : xlate[255:0]="FiTOd";
32'b10xxxxx110100xxxxx000000001xxxxx : xlate[255:0]="FMOVs";
32'b10xxxxx110100xxxxx000000010xxxxx : xlate[255:0]="FMOVd";
32'b10xxxxx110100xxxxx000000101xxxxx : xlate[255:0]="FNEGs";
32'b10xxxxx110100xxxxx000000110xxxxx : xlate[255:0]="FNEGd";
32'b10xxxxx110100xxxxx000001001xxxxx : xlate[255:0]="FABSs";
32'b10xxxxx110100xxxxx000001010xxxxx : xlate[255:0]="FABSd";
32'b10xxxxx110100xxxxx001001001xxxxx : xlate[255:0]="FMULs";
32'b10xxxxx110100xxxxx001001010xxxxx : xlate[255:0]="FMULd";
32'b10xxxxx110100xxxxx001101001xxxxx : xlate[255:0]="FsMULd";
32'b10xxxxx110100xxxxx001001101xxxxx : xlate[255:0]="FDIVs";
32'b10xxxxx110100xxxxx001001110xxxxx : xlate[255:0]="FDIVd";
32'b10xxxxx110100xxxxx000101001xxxxx : xlate[255:0]="FSQRTs";
32'b10xxxxx110100xxxxx000101010xxxxx : xlate[255:0]="FSQRTd";
32'b10xxxxx111011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSH";
32'b10xxxxx111011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="FLUSHi";
32'b10xxxxx101011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSHw";
32'b10xxxxx111000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="JMPL";
32'b10xxxxx111000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="JMPLi";
32'b11xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDF";
32'b11xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDF";
32'b1100000100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFSR";
32'b1100001100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXFSR";
32'b11xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFi";
32'b11xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFi";
32'b1100000100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFSRi";
32'b1100001100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXFSRi";
32'b11xxxxx110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFA";
32'b11xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDFA";
32'b11xxxxx110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFAi";
32'b11xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFAi";
32'b11xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSB";
32'b11xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSH";
32'b11xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSW";
32'b11xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUB";
32'b11xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUH";
32'b11xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUW";
32'b11xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDX";
32'b11xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDD";
32'b11xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBi";
32'b11xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHi";
32'b11xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWi";
32'b11xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBi";
32'b11xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHi";
32'b11xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWi";
32'b11xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXi";
32'b11xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDi";
32'b11xxxxx011001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSBA";
32'b11xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSHA";
32'b11xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSWA";
32'b11xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUBA";
32'b11xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUHA";
32'b11xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUWA";
32'b11xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXA";
32'b11xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDA";
32'b11xxxxx011001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBAi";
32'b11xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHAi";
32'b11xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWAi";
32'b11xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBAi";
32'b11xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHAi";
32'b11xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWAi";
32'b11xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXAi";
32'b11xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDAi";
32'b11xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUB";
32'b11xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBi";
32'b11xxxxx011101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUBA";
32'b11xxxxx011101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBAi";
32'b10xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="AND";
32'b10xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDcc";
32'b10xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDN";
32'b10xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDNcc";
32'b10xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="OR";
32'b10xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORcc";
32'b10xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORN";
32'b10xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORNcc";
32'b10xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XOR";
32'b10xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XORcc";
32'b10xxxxx000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNOR";
32'b10xxxxx010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNORcc";
32'b10xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDi";
32'b10xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDcci";
32'b10xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNi";
32'b10xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNcci";
32'b10xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORi";
32'b10xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORcci";
32'b10xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNi";
32'b10xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNcci";
32'b10xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORi";
32'b10xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORcci";
32'b10xxxxx000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORi";
32'b10xxxxx010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORcci";
32'b1000000101000011111xxxxxxxxxxxxx : xlate[255:0]="MEMBAR";
32'b1000000101000011110xxxxxxxxxxxxx : xlate[255:0]="STBAR";
32'b10xxxxx101000000000xxxxxxxxxxxxx : xlate[255:0]="RDY";
32'b10xxxxx101000000100xxxxxxxxxxxxx : xlate[255:0]="RDCCR";
32'b10xxxxx101000000110xxxxxxxxxxxxx : xlate[255:0]="RDASI";
32'b10xxxxx101000001000xxxxxxxxxxxxx : xlate[255:0]="RDTICK";
32'b10xxxxx101000001010xxxxxxxxxxxxx : xlate[255:0]="RDPC";
32'b10xxxxx101000001100xxxxxxxxxxxxx : xlate[255:0]="RDFPRS";
32'b10xxxxx101000100110xxxxxxxxxxxxx : xlate[255:0]="RDGSR";
32'b10xxxxx101000100000xxxxxxxxxxxxx : xlate[255:0]="RDPCR";
32'b10xxxxx101000100010xxxxxxxxxxxxx : xlate[255:0]="RDPIC";
32'b10xxxxx1101010xxxx0xx000001xxxxx : xlate[255:0]="FMOVSfcc";
32'b10xxxxx1101010xxxx1xx000001xxxxx : xlate[255:0]="FMOVSxcc";
32'b10xxxxx1101010xxxx0xx000010xxxxx : xlate[255:0]="FMOVDfcc";
32'b10xxxxx1101010xxxx1xx000010xxxxx : xlate[255:0]="FMOVDxcc";
32'b10xxxxx110101xxxxx0xx100101xxxxx : xlate[255:0]="FMOVrS1";
32'b10xxxxx110101xxxxx0x1x00101xxxxx : xlate[255:0]="FMOVrS2";
32'b10xxxxx110101xxxxx0xx100110xxxxx : xlate[255:0]="FMOVrD1";
32'b10xxxxx110101xxxxx0x1x00110xxxxx : xlate[255:0]="FMOVrD2";
32'b10xxxxx1011001xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVxcc";
32'b10xxxxx1011001xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVxcci";
32'b10xxxxx1011000xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVfcc";
32'b10xxxxx1011000xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVfcci";
32'b10xxxxx101111xxxxx0xx1xxxxxxxxxx : xlate[255:0]="MOVR1";
32'b10xxxxx101111xxxxx0x1xxxxxxxxxxx : xlate[255:0]="MOVR2";
32'b10xxxxx101111xxxxx1xx1xxxxxxxxxx : xlate[255:0]="MOVRi1";
32'b10xxxxx101111xxxxx1x1xxxxxxxxxxx : xlate[255:0]="MOVRi2";
32'b10xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULX";
32'b10xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVX";
32'b10xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVX";
32'b10xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULXi";
32'b10xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVXi";
32'b10xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVXi";
32'b10xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMUL";
32'b10xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMUL";
32'b10xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMULcc";
32'b10xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMULcc";
32'b10xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULi";
32'b10xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULi";
32'b10xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULcci";
32'b10xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULcci";
32'b10xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULScc";
32'b10xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULScci";
32'b10xxxxx101110000000xxxxxxxxxxxxx : xlate[255:0]="POPC";
32'b10xxxxx101110000001xxxxxxxxxxxxx : xlate[255:0]="POPCi";
32'b11xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCH";
32'b11xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHi";
32'b11xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCHA";
32'b11xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHAi";
32'b10xxxxx101010xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDPR";
32'b10xxxxx101001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDHPR";
32'b10xxxxx111001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RETURN";
32'b10xxxxx111001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RETURNi";
32'b10xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SAVE";
32'b10xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SAVEi";
32'b10xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RESTORE";
32'b10xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RESTOREi";
32'b1000000110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="SAVED";
32'b1000001110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RESTORED";
32'b00xxxxx100xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="SETHI";
32'b10xxxxx100101xxxxx00xxxxxxxxxxxx : xlate[255:0]="SLL";
32'b10xxxxx100110xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRL";
32'b10xxxxx100111xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRA";
32'b10xxxxx100101xxxxx01xxxxxxxxxxxx : xlate[255:0]="SLLX";
32'b10xxxxx100110xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRLX";
32'b10xxxxx100111xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRAX";
32'b10xxxxx100101xxxxx10xxxxxxxxxxxx : xlate[255:0]="SLLi";
32'b10xxxxx100110xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRLi";
32'b10xxxxx100111xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRAi";
32'b10xxxxx100101xxxxx11xxxxxxxxxxxx : xlate[255:0]="SLLXi";
32'b10xxxxx100110xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRLXi";
32'b10xxxxx100111xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRAXi";
32'b11xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STF";
32'b11xxxxx100111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDF";
32'b1100000100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFSR";
32'b1100001100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXFSR";
32'b11xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFi";
32'b11xxxxx100111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFi";
32'b1100000100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFSRi";
32'b1100001100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXFSRi";
32'b11xxxxx110100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFA";
32'b11xxxxx110111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDFA";
32'b11xxxxx110100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFAi";
32'b11xxxxx110111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFAi";
32'b11xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STB";
32'b11xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STH";
32'b11xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STW";
32'b11xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STX";
32'b11xxxx0000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STD";
32'b11xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBi";
32'b11xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHi";
32'b11xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWi";
32'b11xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXi";
32'b11xxxx0000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDi";
32'b11xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STBA";
32'b11xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STHA";
32'b11xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STWA";
32'b11xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXA";
32'b11xxxx0010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDA";
32'b11xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBAi";
32'b11xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHAi";
32'b11xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWAi";
32'b11xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXAi";
32'b11xxxx0010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDAi";
32'b10xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUB";
32'b10xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBcc";
32'b10xxxxx001100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBC";
32'b10xxxxx011100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBCcc";
32'b10xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBi";
32'b10xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBcci";
32'b10xxxxx001100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCi";
32'b10xxxxx011100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCcci";
32'b11xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAP";
32'b11xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPi";
32'b11xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAPA";
32'b11xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPAi";
32'b10xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDcc";
32'b10xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDccTV";
32'b10xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDcci";
32'b10xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDccTVi";
32'b10xxxxx100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBcc";
32'b10xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBccTV";
32'b10xxxxx100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBcci";
32'b10xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBccTVi";
32'b10xxxxx111010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TCC";
32'b10xxxxx111010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TCCi";
32'b10xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPR";
32'b10xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPRi";
32'b10xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRHPR";
32'b10xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRHPRi";
32'b1000000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRY";
32'b1000010110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRCCR";
32'b1000011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRASI";
32'b1000110110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRFPRS";
32'b1010011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRGSR";
32'b1010000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPCR";
32'b1010001110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPIC";
32'b1000000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRYi";
32'b1000010110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRCCRi";
32'b1000011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRASIi";
32'b1000110110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRFPRSi";
32'b1010011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRGSRi";
32'b1010000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPCRi";
32'b1010001110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPICi";
32'b1001111110000000001xxxxxxxxxxxxx : xlate[255:0]="SIR";
32'b10xxxxx110110xxxxx001010000xxxxx : xlate[255:0]="FPADD16";
32'b10xxxxx110110xxxxx001010001xxxxx : xlate[255:0]="FPADD16S";
32'b10xxxxx110110xxxxx001010010xxxxx : xlate[255:0]="FPADD32";
32'b10xxxxx110110xxxxx001010011xxxxx : xlate[255:0]="FPADD32S";
32'b10xxxxx110110xxxxx001010100xxxxx : xlate[255:0]="FPSUB16";
32'b10xxxxx110110xxxxx001010101xxxxx : xlate[255:0]="FPSUB16S";
32'b10xxxxx110110xxxxx001010110xxxxx : xlate[255:0]="FPSUB32";
32'b10xxxxx110110xxxxx001010111xxxxx : xlate[255:0]="FPSUB32S";
32'b10xxxxx110110xxxxx000111011xxxxx : xlate[255:0]="FPACK16";
32'b10xxxxx110110xxxxx000111010xxxxx : xlate[255:0]="FPACK32";
32'b10xxxxx110110xxxxx000111101xxxxx : xlate[255:0]="FPACKFIX";
32'b10xxxxx110110xxxxx001001101xxxxx : xlate[255:0]="FEXPAND";
32'b10xxxxx110110xxxxx001001011xxxxx : xlate[255:0]="FPMERGE";
32'b10xxxxx110110xxxxx000110001xxxxx : xlate[255:0]="FMUL8x16";
32'b10xxxxx110110xxxxx000110011xxxxx : xlate[255:0]="FMUL8x16AU";
32'b10xxxxx110110xxxxx000110101xxxxx : xlate[255:0]="FMUL8x16AL";
32'b10xxxxx110110xxxxx000110110xxxxx : xlate[255:0]="FMUL8SUx16";
32'b10xxxxx110110xxxxx000110111xxxxx : xlate[255:0]="FMUL8ULx16";
32'b10xxxxx110110xxxxx000111000xxxxx : xlate[255:0]="FMULD8SUx16";
32'b10xxxxx110110xxxxx000111001xxxxx : xlate[255:0]="FMULD8ULx16";
32'b10xxxxx110110xxxxx000011000xxxxx : xlate[255:0]="ALIGNADDRESS";
32'b10xxxxx110110xxxxx000011010xxxxx : xlate[255:0]="ALIGNADDRESS_LITTLE";
32'b10xxxxx110110xxxxx000011001xxxxx : xlate[255:0]="BMASK";
32'b10xxxxx110110xxxxx001001000xxxxx : xlate[255:0]="FALIGNDATA";
32'b10xxxxx110110xxxxx001001100xxxxx : xlate[255:0]="BSHUFFLE";
32'b10xxxxx110110xxxxx001100000xxxxx : xlate[255:0]="FZERO";
32'b10xxxxx110110xxxxx001100001xxxxx : xlate[255:0]="FZEROS";
32'b10xxxxx110110xxxxx001111110xxxxx : xlate[255:0]="FONE";
32'b10xxxxx110110xxxxx001111111xxxxx : xlate[255:0]="FONES";
32'b10xxxxx110110xxxxx001110100xxxxx : xlate[255:0]="FSRC1";
32'b10xxxxx110110xxxxx001110101xxxxx : xlate[255:0]="FSRC1S";
32'b10xxxxx110110xxxxx001111000xxxxx : xlate[255:0]="FSRC2";
32'b10xxxxx110110xxxxx001111001xxxxx : xlate[255:0]="FSRC2S";
32'b10xxxxx110110xxxxx001101010xxxxx : xlate[255:0]="FNOT1";
32'b10xxxxx110110xxxxx001101011xxxxx : xlate[255:0]="FNOT1S";
32'b10xxxxx110110xxxxx001100110xxxxx : xlate[255:0]="FNOT2";
32'b10xxxxx110110xxxxx001100111xxxxx : xlate[255:0]="FNOT2S";
32'b10xxxxx110110xxxxx001111100xxxxx : xlate[255:0]="FOR";
32'b10xxxxx110110xxxxx001111101xxxxx : xlate[255:0]="FORS";
32'b10xxxxx110110xxxxx001100010xxxxx : xlate[255:0]="FNOR";
32'b10xxxxx110110xxxxx001100011xxxxx : xlate[255:0]="FNORS";
32'b10xxxxx110110xxxxx001110000xxxxx : xlate[255:0]="FAND";
32'b10xxxxx110110xxxxx001110001xxxxx : xlate[255:0]="FANDS";
32'b10xxxxx110110xxxxx001101110xxxxx : xlate[255:0]="FNAND";
32'b10xxxxx110110xxxxx001101111xxxxx : xlate[255:0]="FNANDS";
32'b10xxxxx110110xxxxx001101100xxxxx : xlate[255:0]="FXOR";
32'b10xxxxx110110xxxxx001101101xxxxx : xlate[255:0]="FXORS";
32'b10xxxxx110110xxxxx001110010xxxxx : xlate[255:0]="FXNOR";
32'b10xxxxx110110xxxxx001110011xxxxx : xlate[255:0]="FXNORS";
32'b10xxxxx110110xxxxx001111010xxxxx : xlate[255:0]="FORNOT1";
32'b10xxxxx110110xxxxx001111011xxxxx : xlate[255:0]="FORNOT1S";
32'b10xxxxx110110xxxxx001110110xxxxx : xlate[255:0]="FORNOT2";
32'b10xxxxx110110xxxxx001110111xxxxx : xlate[255:0]="FORNOT2S";
32'b10xxxxx110110xxxxx001101000xxxxx : xlate[255:0]="FANDNOT1";
32'b10xxxxx110110xxxxx001101001xxxxx : xlate[255:0]="FANDNOT1S";
32'b10xxxxx110110xxxxx001100100xxxxx : xlate[255:0]="FANDNOT2";
32'b10xxxxx110110xxxxx001100101xxxxx : xlate[255:0]="FANDNOT2S";
32'b10xxxxx110110xxxxx000101000xxxxx : xlate[255:0]="FCMPGT16";
32'b10xxxxx110110xxxxx000101100xxxxx : xlate[255:0]="FCMPGT32";
32'b10xxxxx110110xxxxx000100000xxxxx : xlate[255:0]="FCMPLE16";
32'b10xxxxx110110xxxxx000100100xxxxx : xlate[255:0]="FCMPLE32";
32'b10xxxxx110110xxxxx000100010xxxxx : xlate[255:0]="FCMPNE16";
32'b10xxxxx110110xxxxx000100110xxxxx : xlate[255:0]="FCMPNE32";
32'b10xxxxx110110xxxxx000101010xxxxx : xlate[255:0]="FCMPEQ16";
32'b10xxxxx110110xxxxx000101110xxxxx : xlate[255:0]="FCMPEQ32";
32'b10xxxxx110110xxxxx000111110xxxxx : xlate[255:0]="PDIST";
32'b10xxxxx110110xxxxx000000000xxxxx : xlate[255:0]="EDGE8";
32'b10xxxxx110110xxxxx000000001xxxxx : xlate[255:0]="EDGE8N";
32'b10xxxxx110110xxxxx000000010xxxxx : xlate[255:0]="EDGE8L";
32'b10xxxxx110110xxxxx000000011xxxxx : xlate[255:0]="EDGE8LN";
32'b10xxxxx110110xxxxx000000100xxxxx : xlate[255:0]="EDGE16";
32'b10xxxxx110110xxxxx000000101xxxxx : xlate[255:0]="EDGE16N";
32'b10xxxxx110110xxxxx000000110xxxxx : xlate[255:0]="EDGE16L";
32'b10xxxxx110110xxxxx000000111xxxxx : xlate[255:0]="EDGE16LN";
32'b10xxxxx110110xxxxx000001000xxxxx : xlate[255:0]="EDGE32";
32'b10xxxxx110110xxxxx000001001xxxxx : xlate[255:0]="EDGE32N";
32'b10xxxxx110110xxxxx000001010xxxxx : xlate[255:0]="EDGE32L";
32'b10xxxxx110110xxxxx000001011xxxxx : xlate[255:0]="EDGE32LN";
32'b10xxxxx110110xxxxx000010000xxxxx : xlate[255:0]="ARRAY8";
32'b10xxxxx110110xxxxx000010010xxxxx : xlate[255:0]="ARRAY16";
32'b10xxxxx110110xxxxx000010100xxxxx : xlate[255:0]="ARRAY32";
32'b10xxxxx110110xxxxx010000001xxxxx : xlate[255:0]="SIAM";
       default : xlate[255:0]="unknown";
    endcase   
   end
endfunction // xlate


`endif
   
endmodule

`endif


`ifdef CORE_4

module nas_probes4;


`ifdef GATESIM


`else
   reg [7:0] ex_valid_m;
   reg [7:0] ex_valid_b;
   reg [7:0] ex_valid_w;
   reg [7:0] return_f4;
   reg [2:0] ex0_tid_m;
   reg [2:0] ex1_tid_m;
   reg [2:0] ex0_tid_b;
   reg [2:0] ex1_tid_b;
   reg [2:0] ex0_tid_w;
   reg [2:0] ex1_tid_w;
   reg       fgu_valid_fb0;
   reg       fgu_valid_fb1;

   reg [31:0] inst0_e;
   reg [31:0] inst1_e;

   reg [7:0] fg_valid;

   reg fcc_valid_f4;
   reg fcc_valid_f5;
   reg fcc_valid_fb;

   reg fgu0_e;
   reg fgu1_e;
   reg lsu0_e;
   reg lsu1_e;

   reg [1:0] dcd_idest_e;
   reg [1:0] dcd_fdest_e;

   wire [7:0] ex_valid;
   wire [7:0] exception_w;

   wire [7:0] imul_valid;

   wire       fg_cond_fb;

   wire        exu_lsu_valid;
   wire [47:0] exu_lsu_addr;
   wire [31:0] exu_lsu_instr;
   wire [2:0]  exu_lsu_tid;
   wire [4:0]  exu_lsu_regid;
   wire [63:0] exu_lsu_data;

   wire [2:0] ex0_tid_e;
   wire [2:0] ex1_tid_e;
   wire       ex0_valid_e;
   wire       ex1_valid_e;
   wire [7:0] ex_asr_access;
   wire       ex_asr_valid;

   wire [7:0] lsu_valid;
   wire [2:0] lsu_tid;
   wire [7:0] lsu_tid_dec_b;
   wire       lsu_ld_valid;
   reg  [7:0] lsu_data_w;
   wire [7:0] lsu_data_b;

   wire ld_inst_d;

   reg [7:0] div_idest;
   reg [7:0] div_fdest;
   
   reg load0_e;
   reg load1_e;

   reg load_m;
   reg load_b;

   reg [2:0] lsu_tid_m;
   reg [7:0] lsu_complete_m;
   reg [7:0] lsu_complete_b;
   reg [7:0] lsu_trap_flush_d;	//reqd. for store buffer ue testing

   reg [7:0] ex_flush_w;
   reg [7:0] ex_flush_b;

   reg sel_divide0_e;
   reg sel_divide1_e;

   wire dec_flush_lb;

   wire [7:0] fgu_idiv_valid;

   wire [7:0] fgu_fdiv_valid;
   
   wire [7:0] fg_div_valid;

   wire       lsu_valid_b;

   wire [7:0] return_w;
   wire       return0;
   wire       return1;
   wire [7:0] real_exception;

   reg  [2:0] lsu_tid_b;
   reg        fmov_valid_fb;
   reg        fmov_valid_f5;
   reg        fmov_valid_f4;
   reg        fmov_valid_f3;
   reg        fmov_valid_f2;
   reg        fmov_valid_m;
   reg        fmov_valid_e;

   reg        fg_flush_fb;
   reg        fg_flush_f5;
   reg        fg_flush_f4;
   reg        fg_flush_f3;
   reg        fg_flush_f2;

   reg       siam0_d;   
   reg       siam1_d;   

   reg       done0_d;
   reg       done1_d;
   reg       retry0_d;
   reg       retry1_d;
   reg       done0_e;
   reg       done1_e;
   reg       retry0_e;
   reg       retry1_e;
   reg       tlu_ccr_cwp_0_valid_last;
   reg       tlu_ccr_cwp_1_valid_last;
   reg [7:0] fg_fdiv_valid_fw;
   reg [7:0] asi_in_progress_b;
   reg [7:0] asi_in_progress_w;
   reg [7:0] asi_in_progress_fx4;
   reg [7:0] tlu_valid;
   reg [7:0] sync_reset_w;
            
   reg [7:0] div_special_cancel_f4;

   reg       asi_store_b;
   reg       asi_store_w;
   reg [2:0] dcc_tid_b;
   reg [2:0] dcc_tid_w;
   reg [7:0] asi_valid_w;
   reg [7:0] asi_valid_fx4;
   reg [7:0] asi_valid_fx5;

   reg [7:0] lsu_state;
   reg [7:0] lsu_check;
   reg [2:0] lsu_tid_e;

   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;

   reg fgu_err_fx3; 
   reg fgu_err_fx4; 
   reg fgu_err_fx5; 
   reg fgu_err_fb; 

   reg clkstop_d1;
   reg clkstop_d2;
   reg clkstop_d3;
   reg clkstop_d4;
   reg clkstop_d5;

integer i;
integer start_dmiss0;
integer start_dmiss1;
integer start_dmiss2;
integer start_dmiss3;
integer start_dmiss4;
integer start_dmiss5;
integer start_dmiss6;
integer start_dmiss7;
integer number_dmiss;
integer start_imiss0;
integer start_imiss1;
integer start_imiss2;
integer start_imiss3;
integer start_imiss4;
integer start_imiss5;
integer start_imiss6;
integer start_imiss7;
integer active_imiss0;
integer active_imiss1;
integer active_imiss2;
integer active_imiss3;
integer active_imiss4;
integer active_imiss5;
integer active_imiss6;
integer active_imiss7;
integer first_imiss0;
integer first_imiss1;
integer first_imiss2;
integer first_imiss3;
integer first_imiss4;
integer first_imiss5;
integer first_imiss6;
integer first_imiss7;
integer number_imiss;
integer clock;
integer sum_dmiss_latency;
integer sum_imiss_latency;
reg spec_dmiss;
integer dmiss_cnt;
integer imiss_cnt;
reg pcx_req;
integer l15dmiss_cnt;
integer l15imiss_cnt;


initial begin // {
    pcx_req=0;
    l15imiss_cnt=0;
    l15dmiss_cnt=0;
    imiss_cnt=0;
    dmiss_cnt=0;
    clock=0;
    start_dmiss0=0;
    start_dmiss1=0;
    start_dmiss2=0;
    start_dmiss3=0;
    start_dmiss4=0;
    start_dmiss5=0;
    start_dmiss6=0;
    start_dmiss7=0;
    number_dmiss=0;
    start_imiss0=0;
    start_imiss1=0;
    start_imiss2=0;
    start_imiss3=0;
    start_imiss4=0;
    start_imiss5=0;
    start_imiss6=0;
    start_imiss7=0;
    active_imiss0=0;
    active_imiss1=0;
    active_imiss2=0;
    active_imiss3=0;
    active_imiss4=0;
    active_imiss5=0;
    active_imiss6=0;
    active_imiss7=0;
    first_imiss0=0;
    first_imiss1=0;
    first_imiss2=0;
    first_imiss3=0;
    first_imiss4=0;
    first_imiss5=0;
    first_imiss6=0;
    first_imiss7=0;
    number_imiss=0;
    sum_dmiss_latency=0;
    sum_imiss_latency=0;
    asi_in_progress_b <= 8'h0;
    asi_in_progress_w <= 8'h0;
    asi_in_progress_fx4 <= 8'h0;
    tlu_valid <= 8'h0;
    div_idest <= 8'h0;
    div_fdest <= 8'h0;
    lsu_state <= 8'h0;
    clkstop_d1 <=0;
    clkstop_d2 <=0;
    clkstop_d3 <=0;
    clkstop_d4 <=0;
    clkstop_d5 <=0;

end //}

wire [7:0] asi_store_flush_w =  {`SPC4.lsu.sbs7.flush_st_w,
                                 `SPC4.lsu.sbs6.flush_st_w,
                                 `SPC4.lsu.sbs5.flush_st_w,
                                 `SPC4.lsu.sbs4.flush_st_w,
                                 `SPC4.lsu.sbs3.flush_st_w,
                                 `SPC4.lsu.sbs2.flush_st_w,
                                 `SPC4.lsu.sbs1.flush_st_w,
                                 `SPC4.lsu.sbs0.flush_st_w};

wire [7:0] store_sync = {`SPC4.lsu.sbs7.trap_sync,
                         `SPC4.lsu.sbs6.trap_sync,
                         `SPC4.lsu.sbs5.trap_sync,
                         `SPC4.lsu.sbs4.trap_sync,
                         `SPC4.lsu.sbs3.trap_sync,
                         `SPC4.lsu.sbs2.trap_sync,
                         `SPC4.lsu.sbs1.trap_sync,
                         `SPC4.lsu.sbs0.trap_sync};
wire [7:0] sync_reset = {`SPC4.lsu.sbs7.sync_state_rst,
                         `SPC4.lsu.sbs6.sync_state_rst,
                         `SPC4.lsu.sbs5.sync_state_rst,
                         `SPC4.lsu.sbs4.sync_state_rst,
                         `SPC4.lsu.sbs3.sync_state_rst,
                         `SPC4.lsu.sbs2.sync_state_rst,
                         `SPC4.lsu.sbs1.sync_state_rst,
                         `SPC4.lsu.sbs0.sync_state_rst};

//--------------------
// Used in nas_pipe for TSB Config Regs Capture/Compare
// ADD_TSB_CFG

// NOTE - ADD_TSB_CFG will never be used for Axis or Tharas
`ifndef EMUL
wire [63:0] ctxt_z_tsb_cfg0_reg [7:0];  // 1 per thread
wire [63:0] ctxt_z_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg3_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg0_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg3_reg [7:0];

// There are 32 entries in each MMU MRA but not all are needed.
// Indexing:
// Bits 4:3 of the address are the lower two bits of the TID
// Bits 2:0 of the address select the register as below
//   mmu.mra0.array.mem for T0-T3
//   mmu.mra1.array.mem for T4-T7
// (this is documented in mmu_asi_ctl.sv)
//		z TSB cfg 0,1				address 0
//		z TSB cfg 2,3				address 1
//		nz TSB cfg 0,1				address 2
//		nz TSB cfg 2,3				address 3
//		Real range, physical offset pair 0	address 4
//		Real range, physical offset pair 1	address 5
//		Real range, physical offset pair 2	address 6
//		Real range, physical offset pair 3	address 7

wire [83:0] mmu_mra0_a0 = `SPC4.mmu.mra0.array.mem[0];
wire [83:0] mmu_mra0_a8 = `SPC4.mmu.mra0.array.mem[8];
wire [83:0] mmu_mra0_a16 = `SPC4.mmu.mra0.array.mem[16];
wire [83:0] mmu_mra0_a24 = `SPC4.mmu.mra0.array.mem[24];
wire [83:0] mmu_mra0_a1 = `SPC4.mmu.mra0.array.mem[1];
wire [83:0] mmu_mra0_a9 = `SPC4.mmu.mra0.array.mem[9];
wire [83:0] mmu_mra0_a17 = `SPC4.mmu.mra0.array.mem[17];
wire [83:0] mmu_mra0_a25 = `SPC4.mmu.mra0.array.mem[25];
wire [83:0] mmu_mra0_a2 = `SPC4.mmu.mra0.array.mem[2];
wire [83:0] mmu_mra0_a10 = `SPC4.mmu.mra0.array.mem[10];
wire [83:0] mmu_mra0_a18 = `SPC4.mmu.mra0.array.mem[18];
wire [83:0] mmu_mra0_a26 = `SPC4.mmu.mra0.array.mem[26];
wire [83:0] mmu_mra0_a3 = `SPC4.mmu.mra0.array.mem[3];
wire [83:0] mmu_mra0_a11 = `SPC4.mmu.mra0.array.mem[11];
wire [83:0] mmu_mra0_a19 = `SPC4.mmu.mra0.array.mem[19];
wire [83:0] mmu_mra0_a27 = `SPC4.mmu.mra0.array.mem[27];
wire [83:0] mmu_mra1_a0 = `SPC4.mmu.mra1.array.mem[0];
wire [83:0] mmu_mra1_a8 = `SPC4.mmu.mra1.array.mem[8];
wire [83:0] mmu_mra1_a16 = `SPC4.mmu.mra1.array.mem[16];
wire [83:0] mmu_mra1_a24 = `SPC4.mmu.mra1.array.mem[24];
wire [83:0] mmu_mra1_a1 = `SPC4.mmu.mra1.array.mem[1];
wire [83:0] mmu_mra1_a9 = `SPC4.mmu.mra1.array.mem[9];
wire [83:0] mmu_mra1_a17 = `SPC4.mmu.mra1.array.mem[17];
wire [83:0] mmu_mra1_a25 = `SPC4.mmu.mra1.array.mem[25];
wire [83:0] mmu_mra1_a2 = `SPC4.mmu.mra1.array.mem[2];
wire [83:0] mmu_mra1_a10 = `SPC4.mmu.mra1.array.mem[10];
wire [83:0] mmu_mra1_a18 = `SPC4.mmu.mra1.array.mem[18];
wire [83:0] mmu_mra1_a26 = `SPC4.mmu.mra1.array.mem[26];
wire [83:0] mmu_mra1_a3 = `SPC4.mmu.mra1.array.mem[3];
wire [83:0] mmu_mra1_a11 = `SPC4.mmu.mra1.array.mem[11];
wire [83:0] mmu_mra1_a19 = `SPC4.mmu.mra1.array.mem[19];
wire [83:0] mmu_mra1_a27 = `SPC4.mmu.mra1.array.mem[27];


// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[0] = {`SPC4.mmu.asi.t0_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[0]  = {`SPC4.mmu.asi.t0_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[0]  = {`SPC4.mmu.asi.t0_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[0]  = {`SPC4.mmu.asi.t0_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[0] = {`SPC4.mmu.asi.t0_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[0] = {`SPC4.mmu.asi.t0_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[0] = {`SPC4.mmu.asi.t0_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[0] = {`SPC4.mmu.asi.t0_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[1] = {`SPC4.mmu.asi.t1_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[1]  = {`SPC4.mmu.asi.t1_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[1]  = {`SPC4.mmu.asi.t1_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[1]  = {`SPC4.mmu.asi.t1_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[1] = {`SPC4.mmu.asi.t1_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[1] = {`SPC4.mmu.asi.t1_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[1] = {`SPC4.mmu.asi.t1_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[1] = {`SPC4.mmu.asi.t1_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[2] = {`SPC4.mmu.asi.t2_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[2]  = {`SPC4.mmu.asi.t2_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[2]  = {`SPC4.mmu.asi.t2_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[2]  = {`SPC4.mmu.asi.t2_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[2] = {`SPC4.mmu.asi.t2_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[2] = {`SPC4.mmu.asi.t2_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[2] = {`SPC4.mmu.asi.t2_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[2] = {`SPC4.mmu.asi.t2_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[3] = {`SPC4.mmu.asi.t3_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[3]  = {`SPC4.mmu.asi.t3_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[3]  = {`SPC4.mmu.asi.t3_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[3]  = {`SPC4.mmu.asi.t3_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[3] = {`SPC4.mmu.asi.t3_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[3] = {`SPC4.mmu.asi.t3_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[3] = {`SPC4.mmu.asi.t3_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[3] = {`SPC4.mmu.asi.t3_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[4] = {`SPC4.mmu.asi.t4_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[4]  = {`SPC4.mmu.asi.t4_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[4]  = {`SPC4.mmu.asi.t4_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[4]  = {`SPC4.mmu.asi.t4_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[4] = {`SPC4.mmu.asi.t4_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[4] = {`SPC4.mmu.asi.t4_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[4] = {`SPC4.mmu.asi.t4_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[4] = {`SPC4.mmu.asi.t4_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[5] = {`SPC4.mmu.asi.t5_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[5]  = {`SPC4.mmu.asi.t5_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[5]  = {`SPC4.mmu.asi.t5_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[5]  = {`SPC4.mmu.asi.t5_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[5] = {`SPC4.mmu.asi.t5_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[5] = {`SPC4.mmu.asi.t5_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[5] = {`SPC4.mmu.asi.t5_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[5] = {`SPC4.mmu.asi.t5_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[6] = {`SPC4.mmu.asi.t6_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[6]  = {`SPC4.mmu.asi.t6_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[6]  = {`SPC4.mmu.asi.t6_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[6]  = {`SPC4.mmu.asi.t6_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[6] = {`SPC4.mmu.asi.t6_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[6] = {`SPC4.mmu.asi.t6_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[6] = {`SPC4.mmu.asi.t6_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[6] = {`SPC4.mmu.asi.t6_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[7] = {`SPC4.mmu.asi.t7_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[7]  = {`SPC4.mmu.asi.t7_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[7]  = {`SPC4.mmu.asi.t7_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[7]  = {`SPC4.mmu.asi.t7_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[7] = {`SPC4.mmu.asi.t7_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[7] = {`SPC4.mmu.asi.t7_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[7] = {`SPC4.mmu.asi.t7_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[7] = {`SPC4.mmu.asi.t7_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };
`endif // EMUL - ADD_TSB_CFG


// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
// Suppress instruction on flush or park request 
// (clear_disrupting_flush_pending_w_in & idl_req_in)
//   Suppress instruction for 'refetch' exception after 
//     not taken branch with annulled delay slot
// NOTE:  'with_errors' means that the signal actually IGNORES instruction
// cache errors and asserts IN SPITE OF instruction cache errors
wire [7:0] select_pc_b_with_errors = 
     {{4 {~`SPC4.dec_flush_b[1]}}, {4 {~`SPC4.dec_flush_b[0]}}} & 
     {{4 {~`SPC4.tlu.fls1.refetch_w_in}}, {4 {~`SPC4.tlu.fls0.refetch_w_in}}} &
     {~(`SPC4.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC4.tlu.fls1.idl_req_in}}),
      ~(`SPC4.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC4.tlu.fls0.idl_req_in}})} &
     {`SPC4.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC4.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Qualify select_pc_b_with_errors to get final select_pc_b signal
// Qualifications are
// 	- instruction cache errors (ic_err_w_in)
//	- disrupting single step completion requests (dsc_req_in)
wire [7:0] select_pc_b = 
     select_pc_b_with_errors[7:0]  &
     {{4 {(~`SPC4.tlu.fls1.ic_err_w_in | `SPC4.tlu.fls1.itlb_nfo_exc_b) & 
          ~`SPC4.tlu.fls1.dsc_req_in}}, 
      {4 {(~`SPC4.tlu.fls0.ic_err_w_in | `SPC4.tlu.fls0.itlb_nfo_exc_b) & 
          ~`SPC4.tlu.fls0.dsc_req_in}}};

//------------------------------------

//original select_pc_b_with errors. Select_pc_b_with_errors is no longer asserted
//if the inst. following an annulled delay slot of a not taken branch has a prebuffer
//error and it reaches B stage. I still need a signal if this happens to trigger the chkr.

wire [7:0] select_pc_b_with_errors_and_refetch =
     {{4 {~`SPC4.dec_flush_b[1]}}, {4 {~`SPC4.dec_flush_b[0]}}} &
     {~(`SPC4.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC4.tlu.fls1.idl_req_in}}),
      ~(`SPC4.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC4.tlu.fls0.idl_req_in}})} &
     {`SPC4.tlu.fls1.tid_dec_valid_b[3:0],
      `SPC4.tlu.fls0.tid_dec_valid_b[3:0]};

// Signals required for bench TLB sync & LDST sync

reg        tlb_bypass_m;
reg        tlb_bypass_b;
reg        tlb_rd_vld_m;
reg        tlb_rd_vld_b;
reg        lsu_tl_gt_0_b;
reg  [7:0] dcc_asi_b;
reg        asi_internal_w;

always @ (posedge `BENCH_SPC4_GCLK) begin // {

  clkstop_d1 <= `SPC4.tcu_clk_stop;
  clkstop_d2 <= clkstop_d1;
  clkstop_d3 <= clkstop_d2;
  clkstop_d4 <= clkstop_d3;
  clkstop_d5 <= clkstop_d4;

  tlb_bypass_m <= `SPC4.lsu.tlb.tlb_bypass;
  tlb_bypass_b <= tlb_bypass_m;
  tlb_rd_vld_m <= `SPC4.lsu.tlb.tlb_rd_vld | `SPC4.lsu.tlb.tlb_cam_vld;
  tlb_rd_vld_b <= tlb_rd_vld_m;

  // This signal is only valid for LD/ST instructions
  lsu_tl_gt_0_b <= `SPC4.lsu.dcc.tl_gt_0_m;

  // Can't use lsu.dcc_asi_b for tlb_sync so pipeline from M to B
  dcc_asi_b <= `SPC4.lsu.dcc_asi_m;

  // LD/ST that will not issue to the crossbar
  asi_internal_w <= `SPC4.lsu.dcc.asi_internal_b;
end // }

// TL determines whether Nucleus or Primary
wire [7:0] asi_num = `SPC4.lsu.dcc.altspace_ldst_b ? 
                     dcc_asi_b : 
                     (lsu_tl_gt_0_b ? 8'h04 : 8'h80);

wire [7:0] itlb_miss   = { (`SPC4.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire [7:0] icache_miss = { (`SPC4.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC4.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC4.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire inst_bypass = (`SPC4.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[0] |
                    `SPC4.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[1] |
                    `SPC4.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[2]);

wire [7:0] fetch_bypass = { (inst_bypass & `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                            (inst_bypass & `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                            (inst_bypass & `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                            (inst_bypass & `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                            (inst_bypass & `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                            (inst_bypass & `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                            (inst_bypass & `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                            (inst_bypass & `SPC4.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                          };

wire [7:0] itlb_wr = {(`SPC4.tlu.trl1.take_itw & `SPC4.tlu.trl1.trap[3]),
                      (`SPC4.tlu.trl1.take_itw & `SPC4.tlu.trl1.trap[2]),
                      (`SPC4.tlu.trl1.take_itw & `SPC4.tlu.trl1.trap[1]),
                      (`SPC4.tlu.trl1.take_itw & `SPC4.tlu.trl1.trap[0]),
                      (`SPC4.tlu.trl0.take_itw & `SPC4.tlu.trl0.trap[3]),
                      (`SPC4.tlu.trl0.take_itw & `SPC4.tlu.trl0.trap[2]),
                      (`SPC4.tlu.trl0.take_itw & `SPC4.tlu.trl0.trap[1]),
                      (`SPC4.tlu.trl0.take_itw & `SPC4.tlu.trl0.trap[0])
                     };

//------------------------------------

reg  [71:0] tick_cmpr_0; 
reg  [71:0] stick_cmpr_0; 
reg  [71:0] hstick_cmpr_0;
reg [151:0] trap_entry_1_t0;
reg [151:0] trap_entry_2_t0;
reg [151:0] trap_entry_3_t0;
reg [151:0] trap_entry_4_t0;
reg [151:0] trap_entry_5_t0;
reg [151:0] trap_entry_6_t0;

always @(posedge `BENCH_SPC4_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_0        <= `SPC4.tlu.tca.array.mem[{2'b0,3'h0}];
      stick_cmpr_0       <= `SPC4.tlu.tca.array.mem[{2'b01,3'h0}];
      hstick_cmpr_0      <= `SPC4.tlu.tca.array.mem[{2'b10,3'h0}];
      trap_entry_1_t0    <= `SPC4.tlu.tsa0.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t0    <= `SPC4.tlu.tsa0.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t0    <= `SPC4.tlu.tsa0.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t0    <= `SPC4.tlu.tsa0.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t0    <= `SPC4.tlu.tsa0.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t0    <= `SPC4.tlu.tsa0.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_1; 
reg  [71:0] stick_cmpr_1; 
reg  [71:0] hstick_cmpr_1;
reg [151:0] trap_entry_1_t1;
reg [151:0] trap_entry_2_t1;
reg [151:0] trap_entry_3_t1;
reg [151:0] trap_entry_4_t1;
reg [151:0] trap_entry_5_t1;
reg [151:0] trap_entry_6_t1;

always @(posedge `BENCH_SPC4_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_1        <= `SPC4.tlu.tca.array.mem[{2'b0,3'h1}];
      stick_cmpr_1       <= `SPC4.tlu.tca.array.mem[{2'b01,3'h1}];
      hstick_cmpr_1      <= `SPC4.tlu.tca.array.mem[{2'b10,3'h1}];
      trap_entry_1_t1    <= `SPC4.tlu.tsa0.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t1    <= `SPC4.tlu.tsa0.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t1    <= `SPC4.tlu.tsa0.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t1    <= `SPC4.tlu.tsa0.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t1    <= `SPC4.tlu.tsa0.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t1    <= `SPC4.tlu.tsa0.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_2; 
reg  [71:0] stick_cmpr_2; 
reg  [71:0] hstick_cmpr_2;
reg [151:0] trap_entry_1_t2;
reg [151:0] trap_entry_2_t2;
reg [151:0] trap_entry_3_t2;
reg [151:0] trap_entry_4_t2;
reg [151:0] trap_entry_5_t2;
reg [151:0] trap_entry_6_t2;

always @(posedge `BENCH_SPC4_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_2        <= `SPC4.tlu.tca.array.mem[{2'b0,3'h2}];
      stick_cmpr_2       <= `SPC4.tlu.tca.array.mem[{2'b01,3'h2}];
      hstick_cmpr_2      <= `SPC4.tlu.tca.array.mem[{2'b10,3'h2}];
      trap_entry_1_t2    <= `SPC4.tlu.tsa0.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t2    <= `SPC4.tlu.tsa0.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t2    <= `SPC4.tlu.tsa0.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t2    <= `SPC4.tlu.tsa0.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t2    <= `SPC4.tlu.tsa0.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t2    <= `SPC4.tlu.tsa0.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_3; 
reg  [71:0] stick_cmpr_3; 
reg  [71:0] hstick_cmpr_3;
reg [151:0] trap_entry_1_t3;
reg [151:0] trap_entry_2_t3;
reg [151:0] trap_entry_3_t3;
reg [151:0] trap_entry_4_t3;
reg [151:0] trap_entry_5_t3;
reg [151:0] trap_entry_6_t3;

always @(posedge `BENCH_SPC4_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_3        <= `SPC4.tlu.tca.array.mem[{2'b0,3'h3}];
      stick_cmpr_3       <= `SPC4.tlu.tca.array.mem[{2'b01,3'h3}];
      hstick_cmpr_3      <= `SPC4.tlu.tca.array.mem[{2'b10,3'h3}];
      trap_entry_1_t3    <= `SPC4.tlu.tsa0.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t3    <= `SPC4.tlu.tsa0.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t3    <= `SPC4.tlu.tsa0.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t3    <= `SPC4.tlu.tsa0.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t3    <= `SPC4.tlu.tsa0.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t3    <= `SPC4.tlu.tsa0.array.mem[{2'h3, 3'h5}];

end // }
reg  [71:0] tick_cmpr_4; 
reg  [71:0] stick_cmpr_4; 
reg  [71:0] hstick_cmpr_4;
reg [151:0] trap_entry_1_t4;
reg [151:0] trap_entry_2_t4;
reg [151:0] trap_entry_3_t4;
reg [151:0] trap_entry_4_t4;
reg [151:0] trap_entry_5_t4;
reg [151:0] trap_entry_6_t4;

always @(posedge `BENCH_SPC4_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_4        <= `SPC4.tlu.tca.array.mem[{2'b0,3'h4}];
      stick_cmpr_4       <= `SPC4.tlu.tca.array.mem[{2'b01,3'h4}];
      hstick_cmpr_4      <= `SPC4.tlu.tca.array.mem[{2'b10,3'h4}];
      trap_entry_1_t4    <= `SPC4.tlu.tsa1.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t4    <= `SPC4.tlu.tsa1.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t4    <= `SPC4.tlu.tsa1.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t4    <= `SPC4.tlu.tsa1.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t4    <= `SPC4.tlu.tsa1.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t4    <= `SPC4.tlu.tsa1.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_5; 
reg  [71:0] stick_cmpr_5; 
reg  [71:0] hstick_cmpr_5;
reg [151:0] trap_entry_1_t5;
reg [151:0] trap_entry_2_t5;
reg [151:0] trap_entry_3_t5;
reg [151:0] trap_entry_4_t5;
reg [151:0] trap_entry_5_t5;
reg [151:0] trap_entry_6_t5;

always @(posedge `BENCH_SPC4_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_5        <= `SPC4.tlu.tca.array.mem[{2'b0,3'h5}];
      stick_cmpr_5       <= `SPC4.tlu.tca.array.mem[{2'b01,3'h5}];
      hstick_cmpr_5      <= `SPC4.tlu.tca.array.mem[{2'b10,3'h5}];
      trap_entry_1_t5    <= `SPC4.tlu.tsa1.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t5    <= `SPC4.tlu.tsa1.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t5    <= `SPC4.tlu.tsa1.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t5    <= `SPC4.tlu.tsa1.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t5    <= `SPC4.tlu.tsa1.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t5    <= `SPC4.tlu.tsa1.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_6; 
reg  [71:0] stick_cmpr_6; 
reg  [71:0] hstick_cmpr_6;
reg [151:0] trap_entry_1_t6;
reg [151:0] trap_entry_2_t6;
reg [151:0] trap_entry_3_t6;
reg [151:0] trap_entry_4_t6;
reg [151:0] trap_entry_5_t6;
reg [151:0] trap_entry_6_t6;

always @(posedge `BENCH_SPC4_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_6        <= `SPC4.tlu.tca.array.mem[{2'b0,3'h6}];
      stick_cmpr_6       <= `SPC4.tlu.tca.array.mem[{2'b01,3'h6}];
      hstick_cmpr_6      <= `SPC4.tlu.tca.array.mem[{2'b10,3'h6}];
      trap_entry_1_t6    <= `SPC4.tlu.tsa1.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t6    <= `SPC4.tlu.tsa1.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t6    <= `SPC4.tlu.tsa1.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t6    <= `SPC4.tlu.tsa1.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t6    <= `SPC4.tlu.tsa1.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t6    <= `SPC4.tlu.tsa1.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_7; 
reg  [71:0] stick_cmpr_7; 
reg  [71:0] hstick_cmpr_7;
reg [151:0] trap_entry_1_t7;
reg [151:0] trap_entry_2_t7;
reg [151:0] trap_entry_3_t7;
reg [151:0] trap_entry_4_t7;
reg [151:0] trap_entry_5_t7;
reg [151:0] trap_entry_6_t7;

always @(posedge `BENCH_SPC4_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_7        <= `SPC4.tlu.tca.array.mem[{2'b0,3'h7}];
      stick_cmpr_7       <= `SPC4.tlu.tca.array.mem[{2'b01,3'h7}];
      hstick_cmpr_7      <= `SPC4.tlu.tca.array.mem[{2'b10,3'h7}];
      trap_entry_1_t7    <= `SPC4.tlu.tsa1.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t7    <= `SPC4.tlu.tsa1.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t7    <= `SPC4.tlu.tsa1.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t7    <= `SPC4.tlu.tsa1.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t7    <= `SPC4.tlu.tsa1.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t7    <= `SPC4.tlu.tsa1.array.mem[{2'h3, 3'h5}];

end // }

//------------------------------------
// ASI & Trap State machines
always @(posedge `BENCH_SPC4_GCLK) begin // {

//    pc_0_e[47:0] <= `SPC4.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC4.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC4.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC4.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;


    // altspace_ldst_m is asserted for asi accesses that don't change arch state
    asi_store_b <= (`SPC4.lsu.dcc.asi_store_m & `SPC4.lsu.dcc.asi_sync_m);
    asi_store_w <= asi_store_b;
    dcc_tid_b <= `SPC4.lsu.dcc.dcc_tid_m;
    dcc_tid_w <= dcc_tid_b;

    // ASI in progress state m/c
    if (asi_store_w & ~asi_store_flush_w[dcc_tid_w]) begin // {
        asi_in_progress_b[dcc_tid_w] <= 1'b1;
    end // }

    asi_valid_w <= asi_in_progress_b & store_sync;

    // Delay asi_valid_w and asi_in_progress
    // 2 clocks to ensure TLB Sync DTLBWRITE (demap) comes before SSTEP stxa
    asi_valid_fx4 <= asi_valid_w;
    asi_valid_fx5 <= asi_valid_fx4;
    asi_in_progress_w <= asi_in_progress_b;
    asi_in_progress_fx4 <= asi_in_progress_w;
    sync_reset_w <= sync_reset;
    
    for (i=0;i<8;i=i+1) begin // {
        if (asi_valid_w[i] | sync_reset_w[i]) begin // {
            asi_in_progress_b[i] <= 1'b0;
        end//}
    end //}

    // Trap0 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC4.tlu.tlu_trap_0_tid[1:0] == i) &&
            `SPC4.tlu.tlu_trap_pc_0_valid & tlu_ccr_cwp_0_valid_last)
        begin //{
            tlu_valid[i] <= 1'b1;
        end //}
        // Trap taken
        else if (`SPC4.tlu.trl0.real_trap[i] & ~`SPC4.tlu.trl0.take_por) begin // {
            tlu_valid[i] <= 1'b1;
        end //}
        else 
            tlu_valid[i] <= 1'b0;
    end //}

    // Trap1 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC4.tlu.tlu_trap_1_tid[1:0] == i) &&
            `SPC4.tlu.tlu_trap_pc_1_valid & tlu_ccr_cwp_1_valid_last)
        begin //{
            tlu_valid[i+4] <= 1'b1;
        end //} 
        // Trap taken
        else if (`SPC4.tlu.trl1.real_trap[i] & ~`SPC4.tlu.trl1.take_por) begin // {
            tlu_valid[i+4] <= 1'b1;
        end //}
        else 
            tlu_valid[i+4] <= 1'b0;
    end //}

end // }


always @(posedge `BENCH_SPC4_GCLK) begin

// debug code for TPCC analysis
`ifdef TPCC
if (pcx_req==1) begin
	if (`SPC4.spc_pcx_data_pa[129:124]==6'b100000) begin  // l15 dmiss
	  l15dmiss_cnt=l15dmiss_cnt+1;
	  $display("dmissl15 cnt is %0d",l15dmiss_cnt);
	end
	if (`SPC4.spc_pcx_data_pa[129:124]==6'b110000) begin // l15 imiss
	  l15imiss_cnt=l15imiss_cnt+1;
	  $display("imissl15 cnt is %0d",l15imiss_cnt);
	end
	// `TOP.spg.spc_pcx_data_pa[129:124]==6'b100001   -> all stores 
end

pcx_req <= |`SPC4.spc_pcx_req_pq[8:0];
 
if (`SPC4.ifu_l15_valid==1) begin
	imiss_cnt=imiss_cnt+1;
	$display("imiss cnt is %0d",imiss_cnt);
end
if (spec_dmiss==1 && `SPC4.lsu_l15_cancel==0) begin
	dmiss_cnt=dmiss_cnt+1;
	$display("dmiss cnt is %0d",dmiss_cnt);
	
end
spec_dmiss <= `SPC4.lsu_l15_valid & `SPC4.lsu_l15_load;

clock = clock+1;

// keep track of imiss latencies
if (`SPC4.ftu_agc_thr0_cmiss_c==1) begin
     start_imiss0=clock;
     active_imiss0=1;
end
if (active_imiss0==1 && first_imiss0==1 && `SPC4.l15_spc_cpkt[8:6]==3'b000 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss0 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss0=0;
     first_imiss0=0;
end
if (active_imiss0==1 && first_imiss0==0 && `SPC4.l15_spc_cpkt[8:6]==3'b000 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss0=1;
end
if (`SPC4.ftu_agc_thr1_cmiss_c==1) begin
     start_imiss1=clock;
     active_imiss1=1;
end
if (active_imiss1==1 && first_imiss1==1 && `SPC4.l15_spc_cpkt[8:6]==3'b001 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss1 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss1=0;
     first_imiss1=0;
end
if (active_imiss1==1 && first_imiss1==0 && `SPC4.l15_spc_cpkt[8:6]==3'b001 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss1=1;
end
if (`SPC4.ftu_agc_thr2_cmiss_c==1) begin
     start_imiss2=clock;
     active_imiss2=1;
end
if (active_imiss2==1 && first_imiss2==1 && `SPC4.l15_spc_cpkt[8:6]==3'b010 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss2 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss2=0;
     first_imiss2=0;
end
if (active_imiss2==1 && first_imiss2==0 && `SPC4.l15_spc_cpkt[8:6]==3'b010 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss2=1;
end
if (`SPC4.ftu_agc_thr3_cmiss_c==1) begin
     start_imiss3=clock;
     active_imiss3=1;
end
if (active_imiss3==1 && first_imiss3==1  && `SPC4.l15_spc_cpkt[8:6]==3'b011 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss3 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss3=0;
     first_imiss3=0;
end
if (active_imiss3==1 && first_imiss3==0 && `SPC4.l15_spc_cpkt[8:6]==3'b011 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss3=1;
end
if (`SPC4.ftu_agc_thr4_cmiss_c==1) begin
     start_imiss4=clock;
     active_imiss4=1;
end
if (active_imiss4==1 && first_imiss4==1  && `SPC4.l15_spc_cpkt[8:6]==3'b100 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss4 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss4=0;
     first_imiss4=0;
end
if (active_imiss4==1 && first_imiss4==0 && `SPC4.l15_spc_cpkt[8:6]==3'b100 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss4=1;
end
if (`SPC4.ftu_agc_thr5_cmiss_c==1) begin
     start_imiss5=clock;
     active_imiss5=1;
end
if (active_imiss5==1  && first_imiss5==1 && `SPC4.l15_spc_cpkt[8:6]==3'b101 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss5 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss5=0;
     first_imiss5=0;
end
if (active_imiss5==1 && first_imiss5==0 && `SPC4.l15_spc_cpkt[8:6]==3'b101 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss5=1;
end
if (`SPC4.ftu_agc_thr6_cmiss_c==1) begin
     start_imiss6=clock;
     active_imiss6=1;
end
if (active_imiss6==1 && first_imiss6==1 && `SPC4.l15_spc_cpkt[8:6]==3'b110 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss6 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss6=0;
     first_imiss6=0;
end
if (active_imiss6==1 && first_imiss6==0 && `SPC4.l15_spc_cpkt[8:6]==3'b110 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss6=1;
end
if (`SPC4.ftu_agc_thr7_cmiss_c==1) begin
     start_imiss7=clock;
     active_imiss7=1;
end
if (active_imiss7==1 && first_imiss7==1 && `SPC4.l15_spc_cpkt[8:6]==3'b111 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss7 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss7=0;
    first_imiss7=0;
end
if (active_imiss7==1 && first_imiss7==0 && `SPC4.l15_spc_cpkt[8:6]==3'b111 && `SPC4.l15_spc_valid==1 && `SPC4.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss7=1;
end

if (`SPC4.pku.swl0.set_lsu_sync_wait==1) begin
     start_dmiss0=clock;
end
if (`SPC4.pku.swl0.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss0) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC4.pku.swl1.set_lsu_sync_wait==1) begin
     start_dmiss1=clock;
end
if (`SPC4.pku.swl1.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss1) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC4.pku.swl2.set_lsu_sync_wait==1) begin
     start_dmiss2=clock;
end
if (`SPC4.pku.swl2.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss2) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC4.pku.swl3.set_lsu_sync_wait==1) begin
     start_dmiss3=clock;
end
if (`SPC4.pku.swl3.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss3) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC4.pku.swl4.set_lsu_sync_wait==1) begin
     start_dmiss4=clock;
end
if (`SPC4.pku.swl4.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss4) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC4.pku.swl5.set_lsu_sync_wait==1) begin
     start_dmiss5=clock;
end
if (`SPC4.pku.swl5.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss5) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC4.pku.swl6.set_lsu_sync_wait==1) begin
     start_dmiss6=clock;
end
if (`SPC4.pku.swl6.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss6) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC4.pku.swl7.set_lsu_sync_wait==1) begin
     start_dmiss7=clock;
end
if (`SPC4.pku.swl7.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss7) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
`endif



   lsu_tid_e[2:0] <= `SPC4.lsu.dcc.tid_d[2:0];

   // FG Valid conditions

   // Add fcc valids to fg_valid
   fcc_valid_fb <= fcc_valid_f5;
   fcc_valid_f5 <= fcc_valid_f4;
   fcc_valid_f4 <= |`SPC4.fgu.fgu_cmp_fcc_vld_fx3[3:0];

   fg_flush_fb <= fg_flush_f5;
   fg_flush_f5 <= fg_flush_f4;
   fg_flush_f4 <= fg_flush_f3;
   fg_flush_f3 <= fg_flush_f2 | `SPC4.dec_flush_f2 | 
                  `SPC4.tlu_flush_fgu_b;
   fg_flush_f2 <= `SPC4.dec_flush_f1;

   fgu_err_fx3 <= `SPC4.fgu_cecc_fx2 | `SPC4.fgu_uecc_fx2 | `SPC4.fgu.fpc.exu_flush_fx2; // frf or irf ecc error
   fgu_err_fx4 <= fgu_err_fx3;
   fgu_err_fx5 <= fgu_err_fx4;
   fgu_err_fb <= fgu_err_fx5;

   // Siams cause fg_valid ..
   siam0_d = `SPC4.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC4.dec.dec_inst0_d[24:19]==6'b110110 &
             `SPC4.dec.dec_inst0_d[13:5]==9'b010000001;  

   siam1_d = `SPC4.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC4.dec.dec_inst1_d[24:19]==6'b110110 &
             `SPC4.dec.dec_inst1_d[13:5]==9'b010000001;  
    

   done0_d = `SPC4.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC4.dec.dec_inst0_d[29:25]==5'b00000 & 
             `SPC4.dec.dec_inst0_d[24:19]==6'b111110;
   done1_d = `SPC4.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC4.dec.dec_inst1_d[29:25]==5'b00000 & 
             `SPC4.dec.dec_inst1_d[24:19]==6'b111110;    

   retry0_d = `SPC4.dec.dec_inst0_d[31:30]==2'b10 & 
              `SPC4.dec.dec_inst0_d[29:25]==5'b00001 & 
              `SPC4.dec.dec_inst0_d[24:19]==6'b111110;
   retry1_d = `SPC4.dec.dec_inst1_d[31:30]==2'b10 & 
              `SPC4.dec.dec_inst1_d[29:25]==5'b00001 & 
              `SPC4.dec.dec_inst1_d[24:19]==6'b111110;   

   done0_e <= done0_d & `SPC4.dec.dec_decode0_d;
   done1_e <= done1_d & `SPC4.dec.dec_decode1_d; 

   retry0_e <= retry0_d & `SPC4.dec.dec_decode0_d;
   retry1_e <= retry1_d & `SPC4.dec.dec_decode1_d;   


   // fold siam into cmov logic 

   fmov_valid_fb <= fmov_valid_f5;
   fmov_valid_f5 <= fmov_valid_f4;
   fmov_valid_f4 <= fmov_valid_f3;
   fmov_valid_f3 <= fmov_valid_f2;
   fmov_valid_f2 <= fmov_valid_m;
   fmov_valid_m  <= fmov_valid_e & `SPC4.dec.dec_fgu_valid_e;
   fmov_valid_e <= ((`SPC4.exu0.ect.cmov_d | siam0_d) & 
                    `SPC4.dec.dec_decode0_d&`SPC4.dec.del.fgu0_d) |
                    ((`SPC4.exu1.ect.cmov_d | siam1_d) & 
                    `SPC4.dec.dec_decode1_d&`SPC4.dec.del.fgu1_d);
   
   // fgu check bus

   // fcc_valid_fb doesn't assert for LDFSR. LDFSR gets checked by the LSU
   // checker

   fg_valid <= {(`SPC4.fgu.fac.fac_w1_tid_fb[2:0]==3'h7) && fg_cond_fb,
                (`SPC4.fgu.fac.fac_w1_tid_fb[2:0]==3'h6) && fg_cond_fb,
                (`SPC4.fgu.fac.fac_w1_tid_fb[2:0]==3'h5) && fg_cond_fb,
                (`SPC4.fgu.fac.fac_w1_tid_fb[2:0]==3'h4) && fg_cond_fb,
                (`SPC4.fgu.fac.fac_w1_tid_fb[2:0]==3'h3) && fg_cond_fb,
                (`SPC4.fgu.fac.fac_w1_tid_fb[2:0]==3'h2) && fg_cond_fb,
                (`SPC4.fgu.fac.fac_w1_tid_fb[2:0]==3'h1) && fg_cond_fb,
                (`SPC4.fgu.fac.fac_w1_tid_fb[2:0]==3'h0) && fg_cond_fb };
   

   fgu_valid_fb0      <= `SPC4.fgu_exu_w_vld_fx5[0] && !`SPC4.fgu.fpc.div_finish_int_fb;
   fgu_valid_fb1      <= `SPC4.fgu_exu_w_vld_fx5[1] && !`SPC4.fgu.fpc.div_finish_int_fb;

   // Fdiv
   div_special_cancel_f4[7:0] <= tid2onehot(`SPC4.fgu.fac.tid_fx3[2:0]) & 
                               {8{`SPC4.fgu.fac.q_div_default_res_fx3}};
   fg_fdiv_valid_fw <= `SPC4.fgu_divide_completion & ~div_special_cancel_f4 &
                       {8{~`SPC4.fgu.fpc.fpc_fpd_ieee_trap_fb}} &
                       {8{~`SPC4.fgu.fpc.fpc_fpd_unfin_fb}};

    
   // Used in CCX Stub ?
   inst0_e[31:0] <= `SPC4.dec.dec_inst0_d[31:0];
   inst1_e[31:0] <= `SPC4.dec.dec_inst1_d[31:0];

   // only fgu ops that are not loads/stores
   fgu0_e <= `SPC4.dec.del.decode_fgu0_d;  
   fgu1_e <= `SPC4.dec.del.decode_fgu1_d;

   // LSU logic 
   load_b <= load_m;
   load_m <= (load0_e | load1_e);

   load0_e <= (`SPC4.dec.dec_decode0_d & `SPC4.dec.del.lsu0_d & 
               `SPC4.dec.dcd0.dcd_load_d);

   load1_e <= (`SPC4.dec.dec_decode1_d & `SPC4.dec.del.lsu1_d & 
               `SPC4.dec.dcd1.dcd_load_d);

   lsu_tid_b[2:0] <= lsu_tid_m[2:0];
   lsu_tid_m[2:0] <= lsu_tid_e[2:0];

   lsu_complete_m[7:0] <= `SPC4.lsu_complete[7:0];
   lsu_complete_b[7:0] <= lsu_complete_m[7:0];

   lsu_data_w  <= lsu_data_b;
  
   // Divide destination logic ..
   sel_divide0_e <= (`SPC4.dec_decode0_d & 
                     ((`SPC4.pku.swl0.vld_d & `SPC4.pku.swl_divide_wait[0]) |
                      (`SPC4.pku.swl1.vld_d & `SPC4.pku.swl_divide_wait[1]) |
                      (`SPC4.pku.swl2.vld_d & `SPC4.pku.swl_divide_wait[2]) |
                      (`SPC4.pku.swl3.vld_d & `SPC4.pku.swl_divide_wait[3])));
   sel_divide1_e <= (`SPC4.dec_decode1_d & 
                     ((`SPC4.pku.swl4.vld_d & `SPC4.pku.swl_divide_wait[4]) |
                      (`SPC4.pku.swl5.vld_d & `SPC4.pku.swl_divide_wait[5]) |
                      (`SPC4.pku.swl6.vld_d & `SPC4.pku.swl_divide_wait[6]) |
                      (`SPC4.pku.swl7.vld_d & `SPC4.pku.swl_divide_wait[7])));


   dcd_fdest_e <= {`SPC4.dec.del.fdest1_d,`SPC4.dec.del.fdest0_d};
   dcd_idest_e <= {`SPC4.dec.del.idest1_d,`SPC4.dec.del.idest0_d};

   if (sel_divide0_e) begin // {
         div_idest[{1'b0, `SPC4.dec.del.tid0_e[1:0]}] <= dcd_idest_e[0];
         div_fdest[{1'b0, `SPC4.dec.del.tid0_e[1:0]}] <= dcd_fdest_e[0];
   end // }
   if (sel_divide1_e) begin // {
         div_idest[{1'b1, `SPC4.dec.del.tid1_e[1:0]}] <= dcd_idest_e[1];
         div_fdest[{1'b1, `SPC4.dec.del.tid1_e[1:0]}] <= dcd_fdest_e[1];
   end // }
                 

   // EX logic
   // Save EX tids for later use
   ex0_tid_m <= ex0_tid_e;
   ex1_tid_m <= ex1_tid_e;
   ex0_tid_b <= ex0_tid_m;
   ex1_tid_b <= ex1_tid_m;
   ex0_tid_w <= ex0_tid_b;
   ex1_tid_w <= ex1_tid_b;

   // EX Flush conditions
   ex_flush_w <= {ex_flush_b | {{4{(`SPC4.dec.dec_flush_b[1] | 
                                `SPC4.tlu_flush_exu_b[1])}},
                                {4{(`SPC4.dec.dec_flush_b[0] |
                                `SPC4.tlu_flush_exu_b[0])}}}};

   ex_flush_b <= {{4{`SPC4.dec.dec_flush_m[1]}},
                 {4{`SPC4.dec.dec_flush_m[0]}}};


   // ex_valid_f4 valid will only fire on return
   return_f4 <= return_w & ~(`SPC4.tlu_flush_ifu & real_exception);
   ex_valid_w <= ex_valid_b;

   // Cancel EX valid if it turns out to be asr/asi access for this tid 

   ex_valid_b <= ex_valid_m & ~ex_asr_access;


   ex_valid_m <=      { (ex1_tid_e == 2'h3) && ex1_valid_e,
                       (ex1_tid_e == 2'h2) && ex1_valid_e,
                       (ex1_tid_e == 2'h1) && ex1_valid_e,
                       (ex1_tid_e == 2'h0) && ex1_valid_e,
                       (ex0_tid_e == 2'h3) && ex0_valid_e,
                       (ex0_tid_e == 2'h2) && ex0_valid_e,
                       (ex0_tid_e == 2'h1) && ex0_valid_e,
                       (ex0_tid_e == 2'h0) && ex0_valid_e};
   

  // TLU delays for done and retries
  tlu_ccr_cwp_0_valid_last <= `SPC4.tlu.tlu_ccr_cwp_0_valid;
  tlu_ccr_cwp_1_valid_last <= `SPC4.tlu.tlu_ccr_cwp_1_valid;
  

end // END posedge gclk

// Return instruction is separated out of ex*_valid because CWP update is in
// W+1 for return new window is not available for IRF scan (nas_pipe) until
// W+2
assign return0 = `SPC4.exu0.rml.return_w & 
                 `SPC4.exu0.rml.inst_vld_w;
assign return1 = `SPC4.exu1.rml.return_w & 
                 `SPC4.exu1.rml.inst_vld_w;
assign return_w = {(ex1_tid_w == 2'h3) && return1,
                   (ex1_tid_w == 2'h2) && return1,
                   (ex1_tid_w == 2'h1) && return1,
                   (ex1_tid_w == 2'h0) && return1,
                   (ex0_tid_w == 2'h3) && return0,
                   (ex0_tid_w == 2'h2) && return0,
                   (ex0_tid_w == 2'h1) && return0,
                   (ex0_tid_w == 2'h0) && return0};


// Cancel EX valid if it turns out that exception (tlu flush) taken for
// this tid

// exu check bus
assign ex0_tid_e = `SPC4.exu0.ect_tid_lth_e[1:0];
assign ex0_valid_e = `SPC4.dec.dec_valid_e[0] & ~fgu0_e & ~load0_e &
                     ~retry0_e & ~done0_e;
assign ex1_tid_e = `SPC4.exu1.ect_tid_lth_e[1:0];
assign ex1_valid_e = `SPC4.dec.dec_valid_e[1] & ~fgu1_e & ~load1_e &
                     ~retry1_e & ~done1_e;

assign ex_asr_valid = `SPC4.lsu.dcc.asi_store_m & `SPC4.lsu.dcc.asi_sync_m ;

assign ex_asr_access ={(`SPC4.lsu.dcc.dcc_tid_m[2:0]==3'h7) & ex_asr_valid,
                       (`SPC4.lsu.dcc.dcc_tid_m[2:0]==3'h6) & ex_asr_valid,
                       (`SPC4.lsu.dcc.dcc_tid_m[2:0]==3'h5) & ex_asr_valid,
                       (`SPC4.lsu.dcc.dcc_tid_m[2:0]==3'h4) & ex_asr_valid,
                       (`SPC4.lsu.dcc.dcc_tid_m[2:0]==3'h3) & ex_asr_valid,
                       (`SPC4.lsu.dcc.dcc_tid_m[2:0]==3'h2) & ex_asr_valid,
                       (`SPC4.lsu.dcc.dcc_tid_m[2:0]==3'h1) & ex_asr_valid,
                       (`SPC4.lsu.dcc.dcc_tid_m[2:0]==3'h0) & ex_asr_valid};


// EXU valid is ex_valid_w, except flushes, delayed return, traps, and stfsr
// real_exception added because tlu_flush_ifu activates for second redirect
// of retry if TPC and TNPC are not verified as sequential
assign  real_exception =
	   {{4 {`SPC4.tlu.fls1.dec_exc_w | 
		`SPC4.tlu.fls1.exu_exc_w |
		`SPC4.tlu.fls1.lsu_exc_w | 
                `SPC4.tlu.fls1.bsee_req_w}},
	    {4 {`SPC4.tlu.fls0.dec_exc_w | 
		`SPC4.tlu.fls0.exu_exc_w |
		`SPC4.tlu.fls0.lsu_exc_w | 
                `SPC4.tlu.fls0.bsee_req_w}}};

// Do not assert ex_valid for block store instructions
wire [7:0] block_store_first_at_w = 
           {`SPC4.lsu.sbs7.bst_pend & `SPC4.lsu.sbs7.blk_inst_w, 
            `SPC4.lsu.sbs6.bst_pend & `SPC4.lsu.sbs6.blk_inst_w, 
            `SPC4.lsu.sbs5.bst_pend & `SPC4.lsu.sbs5.blk_inst_w, 
            `SPC4.lsu.sbs4.bst_pend & `SPC4.lsu.sbs4.blk_inst_w, 
            `SPC4.lsu.sbs3.bst_pend & `SPC4.lsu.sbs3.blk_inst_w, 
            `SPC4.lsu.sbs2.bst_pend & `SPC4.lsu.sbs2.blk_inst_w, 
            `SPC4.lsu.sbs1.bst_pend & `SPC4.lsu.sbs1.blk_inst_w, 
            `SPC4.lsu.sbs0.bst_pend & `SPC4.lsu.sbs0.blk_inst_w};

// But inject a valid for a block store that's done...
reg [7:0] block_store_w;
always @(posedge `BENCH_SPC4_GCLK) begin
    block_store_w[7:0] <= `SPC4.lsu.lsu_block_store_b[7:0];
    lsu_trap_flush_d <=  `SPC4.lsu_trap_flush[7:0];
end

wire [7:0] block_store_inject_at_w = 
                                    ~`SPC4.lsu.lsu_block_store_b[7:0] & 
                                    block_store_w[7:0] &
                                    {~`SPC4.lsu.sbs7.bst_kill,
                                     ~`SPC4.lsu.sbs6.bst_kill,
                                     ~`SPC4.lsu.sbs5.bst_kill,
                                     ~`SPC4.lsu.sbs4.bst_kill,
                                     ~`SPC4.lsu.sbs3.bst_kill,
                                     ~`SPC4.lsu.sbs2.bst_kill,
                                     ~`SPC4.lsu.sbs1.bst_kill,
                                     ~`SPC4.lsu.sbs0.bst_kill};

assign ex_valid = (((ex_valid_w & ~ex_flush_w & ~return_w & ~block_store_first_at_w & ~exception_w &
                     ~({{4{`SPC4.tlu.fls1.exu_exc_b & `SPC4.tlu.fls1.beat_two_b}},
                        {4{`SPC4.tlu.fls0.exu_exc_b & `SPC4.tlu.fls0.beat_two_b}}}) &
                     ~{(`SPC4.fgu.fac.tid_fx3[2:0]==3'h7) & `SPC4.fgu.fpc.fsr_store_fx3,
                       (`SPC4.fgu.fac.tid_fx3[2:0]==3'h6) & `SPC4.fgu.fpc.fsr_store_fx3,
                       (`SPC4.fgu.fac.tid_fx3[2:0]==3'h5) & `SPC4.fgu.fpc.fsr_store_fx3,
                       (`SPC4.fgu.fac.tid_fx3[2:0]==3'h4) & `SPC4.fgu.fpc.fsr_store_fx3,
                       (`SPC4.fgu.fac.tid_fx3[2:0]==3'h3) & `SPC4.fgu.fpc.fsr_store_fx3,
                       (`SPC4.fgu.fac.tid_fx3[2:0]==3'h2) & `SPC4.fgu.fpc.fsr_store_fx3,
                       (`SPC4.fgu.fac.tid_fx3[2:0]==3'h1) & `SPC4.fgu.fpc.fsr_store_fx3,
                       (`SPC4.fgu.fac.tid_fx3[2:0]==3'h0) & `SPC4.fgu.fpc.fsr_store_fx3}) | 
                     block_store_inject_at_w) & 
                   ~(`SPC4.tlu_flush_ifu & real_exception)) | return_f4;

assign exception_w = {{4 {`SPC4.tlu.fls1.exc_for_w}} | 
                      `SPC4.tlu.fls1.bsee_req[3:0] | 
		      `SPC4.tlu.fls1.pdist_ecc_w[3:0],
		      {4 {`SPC4.tlu.fls0.exc_for_w}} |
		      `SPC4.tlu.fls0.bsee_req[3:0] | 
		      `SPC4.tlu.fls0.pdist_ecc_w[3:0]};

// imul check bus - includes imul, save, restore instructions
assign imul_valid = {(`SPC4.exu1.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb1,
                     (`SPC4.exu1.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb1,
                     (`SPC4.exu1.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb1,
                     (`SPC4.exu1.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb1,
                     (`SPC4.exu0.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb0,
                     (`SPC4.exu0.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb0,
                     (`SPC4.exu0.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb0,
                     (`SPC4.exu0.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb0};

// qualify this signal with fgu_err. If fgu_err is encountered, deassert
//fg_cond_fb, so we don't send a step to Riesling.

// FGU conditions
wire fg_cond_fb_pre_err = `SPC4.fgu.fpc.fpc_w1_ul_vld_fb | fcc_valid_fb | 
                     (fmov_valid_fb & ~fg_flush_fb) |
                     (`SPC4.fgu.fac.fsr_w1_vld_fb[1]);  // covers ST(X)FSR, which clears FSR.ftt

assign fg_cond_fb = fg_cond_fb_pre_err  & ~fgu_err_fb;

// Idiv/Fdiv signals

assign fgu_idiv_valid = fg_div_valid & div_idest;


assign fgu_fdiv_valid = fg_fdiv_valid_fw & div_fdest;


// Lsu signals needed to check lsu results

assign lsu_valid     = lsu_check | lsu_data_w;

assign fg_div_valid  = `SPC4.fgu_divide_completion & ~div_special_cancel_f4;
   
// State machine asserts lsu_check for LD hit/miss
always @(posedge `BENCH_SPC4_GCLK) begin
  for (i=0; i<=7;i=i+1) begin // {
      lsu_check[i] <= 1'b0;
      case (lsu_state[i])
        1'b0: // IDLE state
              begin
                // LD hit
                if (lsu_ld_valid & lsu_tid_dec_b[i] & load_b) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - normal case
                else if (lsu_ld_valid & lsu_tid_dec_b[i] & lsu_complete_b[i]) 
                begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - LDD or Block LD or SWAP
                else if (lsu_ld_valid & lsu_tid_dec_b[i]) begin
                  lsu_state[i] <= 1'b1; // VALID state
                end
// Added a new term to handle STB uncorrectable errors on atomic or asi stores that are synced
//Send a complete if an atomic is squashed.
//lsu_trap_flush is asserted a cycle after the block_store_kill is asserted
		else if (`SPC4.lsu.dcc.sync_st[i] & `SPC4.lsu_block_store_kill[i] & ~lsu_trap_flush_d[i])
		begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
                
              end
        1'b1: // VALID state
              begin
                if ((lsu_complete_b[i])) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
              end
      endcase
  end // }
end

   
assign lsu_tid   = `SPC4.lsu.dcc.ld_tid_b[2:0];
// Don't assert LSU_complete in case of dtlb or irf errors

assign lsu_valid_b = (`SPC4.lsu.dcc.pref_inst_b & 
                      ~(dec_flush_lb | `SPC4.lsu.dcc.pipe_flush_b | 
			`SPC4.lsu_dtdp_err_b | `SPC4.lsu_dttp_err_b |
			`SPC4.lsu_dtmh_err_b | `SPC4.lsu.dcc.exu_error_b));

assign lsu_data_b[7:0] = { (lsu_tid == 3'h7) & lsu_valid_b,
                          (lsu_tid == 3'h6) & lsu_valid_b,
                          (lsu_tid == 3'h5) & lsu_valid_b,
                          (lsu_tid == 3'h4) & lsu_valid_b,
                          (lsu_tid == 3'h3) & lsu_valid_b,
                          (lsu_tid == 3'h2) & lsu_valid_b,
                          (lsu_tid == 3'h1) & lsu_valid_b,
                          (lsu_tid == 3'h0) & lsu_valid_b};

assign  lsu_tid_dec_b[0] = `SPC4.lsu.dcc.ld_tid_b[2:0] == 3'd0;
assign  lsu_tid_dec_b[1] = `SPC4.lsu.dcc.ld_tid_b[2:0] == 3'd1;
assign  lsu_tid_dec_b[2] = `SPC4.lsu.dcc.ld_tid_b[2:0] == 3'd2;
assign  lsu_tid_dec_b[3] = `SPC4.lsu.dcc.ld_tid_b[2:0] == 3'd3;
assign  lsu_tid_dec_b[4] = `SPC4.lsu.dcc.ld_tid_b[2:0] == 3'd4;
assign  lsu_tid_dec_b[5] = `SPC4.lsu.dcc.ld_tid_b[2:0] == 3'd5;
assign  lsu_tid_dec_b[6] = `SPC4.lsu.dcc.ld_tid_b[2:0] == 3'd6;
assign  lsu_tid_dec_b[7] = `SPC4.lsu.dcc.ld_tid_b[2:0] == 3'd7;

assign  lsu_ld_valid = (`SPC4.lsu.dcc.exu_ld_vld_b |`SPC4.lsu.dcc.fgu_fld_vld_b) &
                       ~(`SPC4.lsu.dcc.flush_all_b & `SPC4.lsu.dcc.ld_inst_vld_b);
assign  dec_flush_lb = `SPC4.dec.dec_flush_lb | `SPC4.tlu_flush_lsu_b; 


// LSU interface to CCX stub

assign  exu_lsu_valid = `SPC4.dec.del.lsu_valid_e;
assign  exu_lsu_addr[47:0] = `SPC4.exu_lsu_address_e[47:0];
assign  exu_lsu_tid[2:0] = lsu_tid_e[2:0];
assign  exu_lsu_regid[4:0] = `SPC4.dec.dec_lsu_rd_e[4:0];
assign  exu_lsu_data[63:0] = `SPC4.exu_lsu_store_data_e[63:0];
assign  exu_lsu_instr[31:0] =   ({32{`SPC4.dec.dec_lsu_sel0_e}} & 
                                inst0_e[31:0]) |
                                ({32{~`SPC4.dec.dec_lsu_sel0_e}} & 
                                inst1_e[31:0]);
assign ld_inst_d = `SPC4.dec.dec_ld_inst_d;

///////////////////////////////////////////////////////////////////////////////
// Debugging Instruction Opcodes Pipeline
///////////////////////////////////////////////////////////////////////////////


   reg [31:0] op_0_w;
   reg [31:0] op_1_w;
   reg [31:0] op_2_w;
   reg [31:0] op_3_w;
   reg [31:0] op_4_w;
   reg [31:0] op_5_w;
   reg [31:0] op_6_w;
   reg [31:0] op_7_w;

   reg [31:0] op0_b;
   reg [31:0] op0_m;
   reg [31:0] op0_e;
   reg [31:0] op0_d;

   reg [31:0] op1_b;
   reg [31:0] op1_m;
   reg [31:0] op1_e;
   reg [31:0] op1_d;

   reg [255:0] inst0_string_w;
   reg [255:0] inst0_string_b;
   reg [255:0] inst0_string_m;
   reg [255:0] inst0_string_e;
   reg [255:0] inst0_string_d;

   reg [255:0] inst1_string_w;
   reg [255:0] inst1_string_b;
   reg [255:0] inst1_string_m;
   reg [255:0] inst1_string_e;
   reg [255:0] inst1_string_d;

   reg [255:0] inst0_string_p;
   reg [255:0] inst1_string_p;
   reg [255:0] inst2_string_p;
   reg [255:0] inst3_string_p;
   reg [255:0] inst4_string_p;
   reg [255:0] inst5_string_p;
   reg [255:0] inst6_string_p;
   reg [255:0] inst7_string_p;

initial begin
    op_0_w = 32'b0;
    op_1_w = 32'b0;
    op_2_w = 32'b0;
    op_3_w = 32'b0;
    op_4_w = 32'b0;
    op_5_w = 32'b0;
    op_6_w = 32'b0;
    op_7_w = 32'b0;
end

always @(posedge `BENCH_SPC4_GCLK) begin // {
  op_0_w <= ({32 { select_pc_b[0]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[0]}} & op_0_w[31:0]) ;
  op_1_w <= ({32 { select_pc_b[1]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[1]}} & op_1_w[31:0]) ;
  op_2_w <= ({32 { select_pc_b[2]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[2]}} & op_2_w[31:0]) ;
  op_3_w <= ({32 { select_pc_b[3]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[3]}} & op_3_w[31:0]) ;
  op_4_w <= ({32 { select_pc_b[4]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[4]}} & op_4_w[31:0]) ;
  op_5_w <= ({32 { select_pc_b[5]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[5]}} & op_5_w[31:0]) ;
  op_6_w <= ({32 { select_pc_b[6]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[6]}} & op_6_w[31:0]) ;
  op_7_w <= ({32 { select_pc_b[7]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[7]}} & op_7_w[31:0]) ;

  op0_b <= op0_m;
  op0_m <= op0_e;
  op0_e <= op0_d;
  op0_d <= `SPC4.dec.ded0.decode_mux[31:0];

  op1_b <= op1_m;
  op1_m <= op1_e;
  op1_e <= op1_d;
  op1_d <= `SPC4.dec.ded1.decode_mux[31:0];

  inst0_string_w<=inst0_string_b;
  inst0_string_b<=inst0_string_m;
  inst0_string_m<=inst0_string_e;
  inst0_string_e<=inst0_string_d;
  inst0_string_d<=xlate(`SPC4.dec.ded0.decode_mux[31:0]);

  inst1_string_w<=inst1_string_b;
  inst1_string_b<=inst1_string_m;
  inst1_string_m<=inst1_string_e;
  inst1_string_e<=inst1_string_d;
  inst1_string_d<=xlate(`SPC4.dec.ded1.decode_mux[31:0]);

// instructions for each thread at pick
  inst0_string_p<=xlate(`SPC4.ifu_ibu.ibf0.buf0_in[31:0]);
  inst1_string_p<=xlate(`SPC4.ifu_ibu.ibf1.buf0_in[31:0]);
  inst2_string_p<=xlate(`SPC4.ifu_ibu.ibf2.buf0_in[31:0]);
  inst3_string_p<=xlate(`SPC4.ifu_ibu.ibf3.buf0_in[31:0]);
  inst4_string_p<=xlate(`SPC4.ifu_ibu.ibf4.buf0_in[31:0]);
  inst5_string_p<=xlate(`SPC4.ifu_ibu.ibf5.buf0_in[31:0]);
  inst6_string_p<=xlate(`SPC4.ifu_ibu.ibf6.buf0_in[31:0]);
  inst7_string_p<=xlate(`SPC4.ifu_ibu.ibf7.buf0_in[31:0]);

end //}

///////////////////////////////////////////////////////////////////////////////
// Functions 
///////////////////////////////////////////////////////////////////////////////
function [2:0] onehot2tid;
   input [7:0] onehot;

   begin

   if      (onehot[7:0]==8'b00000001) onehot2tid[2:0] = 3'b000;
   else if (onehot[7:0]==8'b00000010) onehot2tid[2:0] = 3'b001;
   else if (onehot[7:0]==8'b00000100) onehot2tid[2:0] = 3'b010;
   else if (onehot[7:0]==8'b00001000) onehot2tid[2:0] = 3'b011;
   else if (onehot[7:0]==8'b00010000) onehot2tid[2:0] = 3'b100;
   else if (onehot[7:0]==8'b00100000) onehot2tid[2:0] = 3'b101;
   else if (onehot[7:0]==8'b01000000) onehot2tid[2:0] = 3'b110;
   else if (onehot[7:0]==8'b10000000) onehot2tid[2:0] = 3'b111;
   
   end
endfunction

function [7:0] tid2onehot;
   input [2:0] tid;

   begin

   if      (tid[2:0]==3'b000) tid2onehot[7:0] = 8'b00000001;
   else if (tid[2:0]==3'b001) tid2onehot[7:0] = 8'b00000010;
   else if (tid[2:0]==3'b010) tid2onehot[7:0] = 8'b00000100;
   else if (tid[2:0]==3'b011) tid2onehot[7:0] = 8'b00001000;
   else if (tid[2:0]==3'b100) tid2onehot[7:0] = 8'b00010000;
   else if (tid[2:0]==3'b101) tid2onehot[7:0] = 8'b00100000;
   else if (tid[2:0]==3'b110) tid2onehot[7:0] = 8'b01000000;
   else if (tid[2:0]==3'b111) tid2onehot[7:0] = 8'b10000000;
   
   end
endfunction

//---------------------

function [255:0] xlate;
   input [31:0] inst;

   begin
     casex(inst[31:0])
32'b10xxxxx110100xxxxx001000011xxxxx : xlate[255:0]="FADDq";
32'b10xxxxx110100xxxxx001000111xxxxx : xlate[255:0]="FSUBq";
32'b10000xx110101xxxxx001010011xxxxx : xlate[255:0]="FCMPq";
32'b10000xx110101xxxxx001010111xxxxx : xlate[255:0]="FCMPEq";
32'b10xxxxx110100xxxxx011001101xxxxx : xlate[255:0]="FsTOq";
32'b10xxxxx110100xxxxx011001110xxxxx : xlate[255:0]="FdTOq";
32'b10xxxxx110100xxxxx010001100xxxxx : xlate[255:0]="FxTOq";
32'b10xxxxx110100xxxxx011001100xxxxx : xlate[255:0]="FiTOq";
32'b10xxxxx110100xxxxx000000011xxxxx : xlate[255:0]="FMOVq";
32'b10xxxxx110100xxxxx000000111xxxxx : xlate[255:0]="FNEGq";
32'b10xxxxx110100xxxxx000001011xxxxx : xlate[255:0]="FABSq";
32'b10xxxxx110100xxxxx001001011xxxxx : xlate[255:0]="FMULq";
32'b10xxxxx110100xxxxx001101110xxxxx : xlate[255:0]="FdMULq";
32'b10xxxxx110100xxxxx001001111xxxxx : xlate[255:0]="FDIVq";
32'b10xxxxx110100xxxxx000101011xxxxx : xlate[255:0]="FSQRTq";
32'b10xxxxx1101010xxxx0xx100111xxxxx : xlate[255:0]="FMOVrQa";
32'b10xxxxx1101010xxxx0x1x00111xxxxx : xlate[255:0]="FMOVrQb";
32'b10xxxxx110100xxxxx011010011xxxxx : xlate[255:0]="FqTOi";
32'b10xxxxx110100xxxxx010000011xxxxx : xlate[255:0]="FqTOx";
32'b10xxxxx110100xxxxx011000111xxxxx : xlate[255:0]="FqTOs";
32'b10xxxxx110100xxxxx011001011xxxxx : xlate[255:0]="FqTOd";
32'b11xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQF";
32'b11xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFi";
32'b11xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQFA";
32'b11xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFAi";
32'b11xxxxx100110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFi";
32'b11xxxxx100110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQF";
32'b11xxxxx110110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQFA";
32'b11xxxxx110110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFAi";
32'b10xxxxx1101010xxxxxxx000011xxxxx : xlate[255:0]="FMOVQcc";
32'b10xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADD";
32'b10xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDcc";
32'b10xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDC";
32'b10xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDCcc";
32'b10xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDi";
32'b10xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDcci";
32'b10xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCi";
32'b10xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCcci";
32'b00x0xx1011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr1";
32'b00x0x1x011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr2";
32'b00xx000110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfccA";
32'b00xx1xx110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc1";
32'b00xxx1x110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc2";
32'b00xxxx1110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc3";
32'b00xx000101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfccA";
32'b00xx1xx101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc1";
32'b00xxx1x101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc2";
32'b00xxxx1101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc3";
32'b00xx000010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BiccA";
32'b00xx1xx010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc1";
32'b00xxx1x010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc2";
32'b00xxxx1010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc3";
32'b00xx000001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPccA";
32'b00xx1xx001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc1";
32'b00xxx1x001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc2";
32'b00xxxx1001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc3";
32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="CALL";
32'b11xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASA";
32'b11xxxxx111110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASXA";
32'b11xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASAi";
32'b11xxxxx111110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASXAi";
32'b10xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIV";
32'b10xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIV";
32'b10xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVcc";
32'b10xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVcc";
32'b10xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVi";
32'b10xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVi";
32'b10xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVcci";
32'b10xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVcci";
32'b1000000111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="DONE";
32'b1000001111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RETRY";
32'b10xxxxx110100xxxxx001000001xxxxx : xlate[255:0]="FADDs";
32'b10xxxxx110100xxxxx001000010xxxxx : xlate[255:0]="FADDd";
32'b10xxxxx110100xxxxx001000101xxxxx : xlate[255:0]="FSUBs";
32'b10xxxxx110100xxxxx001000110xxxxx : xlate[255:0]="FSUBd";
32'b10000xx110101xxxxx001010001xxxxx : xlate[255:0]="FCMPs";
32'b10000xx110101xxxxx001010010xxxxx : xlate[255:0]="FCMPd";
32'b10000xx110101xxxxx001010101xxxxx : xlate[255:0]="FCMPEs";
32'b10000xx110101xxxxx001010110xxxxx : xlate[255:0]="FCMPEd";
32'b10xxxxx110100xxxxx010000001xxxxx : xlate[255:0]="FsTOx";
32'b10xxxxx110100xxxxx010000010xxxxx : xlate[255:0]="FdTOx";
32'b10xxxxx110100xxxxx011010001xxxxx : xlate[255:0]="FsTOi";
32'b10xxxxx110100xxxxx011010010xxxxx : xlate[255:0]="FdTOi";
32'b10xxxxx110100xxxxx011001001xxxxx : xlate[255:0]="FsTOd";
32'b10xxxxx110100xxxxx011000110xxxxx : xlate[255:0]="FdTOs";
32'b10xxxxx110100xxxxx010000100xxxxx : xlate[255:0]="FxTOs";
32'b10xxxxx110100xxxxx010001000xxxxx : xlate[255:0]="FxTOd";
32'b10xxxxx110100xxxxx011000100xxxxx : xlate[255:0]="FiTOs";
32'b10xxxxx110100xxxxx011001000xxxxx : xlate[255:0]="FiTOd";
32'b10xxxxx110100xxxxx000000001xxxxx : xlate[255:0]="FMOVs";
32'b10xxxxx110100xxxxx000000010xxxxx : xlate[255:0]="FMOVd";
32'b10xxxxx110100xxxxx000000101xxxxx : xlate[255:0]="FNEGs";
32'b10xxxxx110100xxxxx000000110xxxxx : xlate[255:0]="FNEGd";
32'b10xxxxx110100xxxxx000001001xxxxx : xlate[255:0]="FABSs";
32'b10xxxxx110100xxxxx000001010xxxxx : xlate[255:0]="FABSd";
32'b10xxxxx110100xxxxx001001001xxxxx : xlate[255:0]="FMULs";
32'b10xxxxx110100xxxxx001001010xxxxx : xlate[255:0]="FMULd";
32'b10xxxxx110100xxxxx001101001xxxxx : xlate[255:0]="FsMULd";
32'b10xxxxx110100xxxxx001001101xxxxx : xlate[255:0]="FDIVs";
32'b10xxxxx110100xxxxx001001110xxxxx : xlate[255:0]="FDIVd";
32'b10xxxxx110100xxxxx000101001xxxxx : xlate[255:0]="FSQRTs";
32'b10xxxxx110100xxxxx000101010xxxxx : xlate[255:0]="FSQRTd";
32'b10xxxxx111011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSH";
32'b10xxxxx111011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="FLUSHi";
32'b10xxxxx101011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSHw";
32'b10xxxxx111000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="JMPL";
32'b10xxxxx111000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="JMPLi";
32'b11xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDF";
32'b11xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDF";
32'b1100000100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFSR";
32'b1100001100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXFSR";
32'b11xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFi";
32'b11xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFi";
32'b1100000100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFSRi";
32'b1100001100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXFSRi";
32'b11xxxxx110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFA";
32'b11xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDFA";
32'b11xxxxx110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFAi";
32'b11xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFAi";
32'b11xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSB";
32'b11xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSH";
32'b11xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSW";
32'b11xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUB";
32'b11xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUH";
32'b11xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUW";
32'b11xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDX";
32'b11xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDD";
32'b11xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBi";
32'b11xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHi";
32'b11xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWi";
32'b11xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBi";
32'b11xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHi";
32'b11xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWi";
32'b11xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXi";
32'b11xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDi";
32'b11xxxxx011001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSBA";
32'b11xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSHA";
32'b11xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSWA";
32'b11xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUBA";
32'b11xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUHA";
32'b11xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUWA";
32'b11xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXA";
32'b11xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDA";
32'b11xxxxx011001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBAi";
32'b11xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHAi";
32'b11xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWAi";
32'b11xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBAi";
32'b11xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHAi";
32'b11xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWAi";
32'b11xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXAi";
32'b11xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDAi";
32'b11xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUB";
32'b11xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBi";
32'b11xxxxx011101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUBA";
32'b11xxxxx011101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBAi";
32'b10xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="AND";
32'b10xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDcc";
32'b10xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDN";
32'b10xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDNcc";
32'b10xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="OR";
32'b10xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORcc";
32'b10xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORN";
32'b10xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORNcc";
32'b10xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XOR";
32'b10xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XORcc";
32'b10xxxxx000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNOR";
32'b10xxxxx010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNORcc";
32'b10xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDi";
32'b10xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDcci";
32'b10xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNi";
32'b10xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNcci";
32'b10xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORi";
32'b10xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORcci";
32'b10xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNi";
32'b10xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNcci";
32'b10xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORi";
32'b10xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORcci";
32'b10xxxxx000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORi";
32'b10xxxxx010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORcci";
32'b1000000101000011111xxxxxxxxxxxxx : xlate[255:0]="MEMBAR";
32'b1000000101000011110xxxxxxxxxxxxx : xlate[255:0]="STBAR";
32'b10xxxxx101000000000xxxxxxxxxxxxx : xlate[255:0]="RDY";
32'b10xxxxx101000000100xxxxxxxxxxxxx : xlate[255:0]="RDCCR";
32'b10xxxxx101000000110xxxxxxxxxxxxx : xlate[255:0]="RDASI";
32'b10xxxxx101000001000xxxxxxxxxxxxx : xlate[255:0]="RDTICK";
32'b10xxxxx101000001010xxxxxxxxxxxxx : xlate[255:0]="RDPC";
32'b10xxxxx101000001100xxxxxxxxxxxxx : xlate[255:0]="RDFPRS";
32'b10xxxxx101000100110xxxxxxxxxxxxx : xlate[255:0]="RDGSR";
32'b10xxxxx101000100000xxxxxxxxxxxxx : xlate[255:0]="RDPCR";
32'b10xxxxx101000100010xxxxxxxxxxxxx : xlate[255:0]="RDPIC";
32'b10xxxxx1101010xxxx0xx000001xxxxx : xlate[255:0]="FMOVSfcc";
32'b10xxxxx1101010xxxx1xx000001xxxxx : xlate[255:0]="FMOVSxcc";
32'b10xxxxx1101010xxxx0xx000010xxxxx : xlate[255:0]="FMOVDfcc";
32'b10xxxxx1101010xxxx1xx000010xxxxx : xlate[255:0]="FMOVDxcc";
32'b10xxxxx110101xxxxx0xx100101xxxxx : xlate[255:0]="FMOVrS1";
32'b10xxxxx110101xxxxx0x1x00101xxxxx : xlate[255:0]="FMOVrS2";
32'b10xxxxx110101xxxxx0xx100110xxxxx : xlate[255:0]="FMOVrD1";
32'b10xxxxx110101xxxxx0x1x00110xxxxx : xlate[255:0]="FMOVrD2";
32'b10xxxxx1011001xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVxcc";
32'b10xxxxx1011001xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVxcci";
32'b10xxxxx1011000xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVfcc";
32'b10xxxxx1011000xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVfcci";
32'b10xxxxx101111xxxxx0xx1xxxxxxxxxx : xlate[255:0]="MOVR1";
32'b10xxxxx101111xxxxx0x1xxxxxxxxxxx : xlate[255:0]="MOVR2";
32'b10xxxxx101111xxxxx1xx1xxxxxxxxxx : xlate[255:0]="MOVRi1";
32'b10xxxxx101111xxxxx1x1xxxxxxxxxxx : xlate[255:0]="MOVRi2";
32'b10xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULX";
32'b10xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVX";
32'b10xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVX";
32'b10xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULXi";
32'b10xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVXi";
32'b10xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVXi";
32'b10xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMUL";
32'b10xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMUL";
32'b10xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMULcc";
32'b10xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMULcc";
32'b10xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULi";
32'b10xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULi";
32'b10xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULcci";
32'b10xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULcci";
32'b10xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULScc";
32'b10xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULScci";
32'b10xxxxx101110000000xxxxxxxxxxxxx : xlate[255:0]="POPC";
32'b10xxxxx101110000001xxxxxxxxxxxxx : xlate[255:0]="POPCi";
32'b11xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCH";
32'b11xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHi";
32'b11xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCHA";
32'b11xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHAi";
32'b10xxxxx101010xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDPR";
32'b10xxxxx101001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDHPR";
32'b10xxxxx111001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RETURN";
32'b10xxxxx111001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RETURNi";
32'b10xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SAVE";
32'b10xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SAVEi";
32'b10xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RESTORE";
32'b10xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RESTOREi";
32'b1000000110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="SAVED";
32'b1000001110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RESTORED";
32'b00xxxxx100xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="SETHI";
32'b10xxxxx100101xxxxx00xxxxxxxxxxxx : xlate[255:0]="SLL";
32'b10xxxxx100110xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRL";
32'b10xxxxx100111xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRA";
32'b10xxxxx100101xxxxx01xxxxxxxxxxxx : xlate[255:0]="SLLX";
32'b10xxxxx100110xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRLX";
32'b10xxxxx100111xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRAX";
32'b10xxxxx100101xxxxx10xxxxxxxxxxxx : xlate[255:0]="SLLi";
32'b10xxxxx100110xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRLi";
32'b10xxxxx100111xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRAi";
32'b10xxxxx100101xxxxx11xxxxxxxxxxxx : xlate[255:0]="SLLXi";
32'b10xxxxx100110xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRLXi";
32'b10xxxxx100111xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRAXi";
32'b11xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STF";
32'b11xxxxx100111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDF";
32'b1100000100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFSR";
32'b1100001100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXFSR";
32'b11xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFi";
32'b11xxxxx100111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFi";
32'b1100000100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFSRi";
32'b1100001100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXFSRi";
32'b11xxxxx110100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFA";
32'b11xxxxx110111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDFA";
32'b11xxxxx110100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFAi";
32'b11xxxxx110111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFAi";
32'b11xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STB";
32'b11xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STH";
32'b11xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STW";
32'b11xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STX";
32'b11xxxx0000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STD";
32'b11xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBi";
32'b11xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHi";
32'b11xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWi";
32'b11xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXi";
32'b11xxxx0000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDi";
32'b11xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STBA";
32'b11xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STHA";
32'b11xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STWA";
32'b11xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXA";
32'b11xxxx0010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDA";
32'b11xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBAi";
32'b11xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHAi";
32'b11xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWAi";
32'b11xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXAi";
32'b11xxxx0010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDAi";
32'b10xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUB";
32'b10xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBcc";
32'b10xxxxx001100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBC";
32'b10xxxxx011100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBCcc";
32'b10xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBi";
32'b10xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBcci";
32'b10xxxxx001100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCi";
32'b10xxxxx011100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCcci";
32'b11xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAP";
32'b11xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPi";
32'b11xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAPA";
32'b11xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPAi";
32'b10xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDcc";
32'b10xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDccTV";
32'b10xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDcci";
32'b10xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDccTVi";
32'b10xxxxx100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBcc";
32'b10xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBccTV";
32'b10xxxxx100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBcci";
32'b10xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBccTVi";
32'b10xxxxx111010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TCC";
32'b10xxxxx111010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TCCi";
32'b10xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPR";
32'b10xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPRi";
32'b10xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRHPR";
32'b10xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRHPRi";
32'b1000000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRY";
32'b1000010110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRCCR";
32'b1000011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRASI";
32'b1000110110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRFPRS";
32'b1010011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRGSR";
32'b1010000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPCR";
32'b1010001110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPIC";
32'b1000000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRYi";
32'b1000010110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRCCRi";
32'b1000011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRASIi";
32'b1000110110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRFPRSi";
32'b1010011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRGSRi";
32'b1010000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPCRi";
32'b1010001110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPICi";
32'b1001111110000000001xxxxxxxxxxxxx : xlate[255:0]="SIR";
32'b10xxxxx110110xxxxx001010000xxxxx : xlate[255:0]="FPADD16";
32'b10xxxxx110110xxxxx001010001xxxxx : xlate[255:0]="FPADD16S";
32'b10xxxxx110110xxxxx001010010xxxxx : xlate[255:0]="FPADD32";
32'b10xxxxx110110xxxxx001010011xxxxx : xlate[255:0]="FPADD32S";
32'b10xxxxx110110xxxxx001010100xxxxx : xlate[255:0]="FPSUB16";
32'b10xxxxx110110xxxxx001010101xxxxx : xlate[255:0]="FPSUB16S";
32'b10xxxxx110110xxxxx001010110xxxxx : xlate[255:0]="FPSUB32";
32'b10xxxxx110110xxxxx001010111xxxxx : xlate[255:0]="FPSUB32S";
32'b10xxxxx110110xxxxx000111011xxxxx : xlate[255:0]="FPACK16";
32'b10xxxxx110110xxxxx000111010xxxxx : xlate[255:0]="FPACK32";
32'b10xxxxx110110xxxxx000111101xxxxx : xlate[255:0]="FPACKFIX";
32'b10xxxxx110110xxxxx001001101xxxxx : xlate[255:0]="FEXPAND";
32'b10xxxxx110110xxxxx001001011xxxxx : xlate[255:0]="FPMERGE";
32'b10xxxxx110110xxxxx000110001xxxxx : xlate[255:0]="FMUL8x16";
32'b10xxxxx110110xxxxx000110011xxxxx : xlate[255:0]="FMUL8x16AU";
32'b10xxxxx110110xxxxx000110101xxxxx : xlate[255:0]="FMUL8x16AL";
32'b10xxxxx110110xxxxx000110110xxxxx : xlate[255:0]="FMUL8SUx16";
32'b10xxxxx110110xxxxx000110111xxxxx : xlate[255:0]="FMUL8ULx16";
32'b10xxxxx110110xxxxx000111000xxxxx : xlate[255:0]="FMULD8SUx16";
32'b10xxxxx110110xxxxx000111001xxxxx : xlate[255:0]="FMULD8ULx16";
32'b10xxxxx110110xxxxx000011000xxxxx : xlate[255:0]="ALIGNADDRESS";
32'b10xxxxx110110xxxxx000011010xxxxx : xlate[255:0]="ALIGNADDRESS_LITTLE";
32'b10xxxxx110110xxxxx000011001xxxxx : xlate[255:0]="BMASK";
32'b10xxxxx110110xxxxx001001000xxxxx : xlate[255:0]="FALIGNDATA";
32'b10xxxxx110110xxxxx001001100xxxxx : xlate[255:0]="BSHUFFLE";
32'b10xxxxx110110xxxxx001100000xxxxx : xlate[255:0]="FZERO";
32'b10xxxxx110110xxxxx001100001xxxxx : xlate[255:0]="FZEROS";
32'b10xxxxx110110xxxxx001111110xxxxx : xlate[255:0]="FONE";
32'b10xxxxx110110xxxxx001111111xxxxx : xlate[255:0]="FONES";
32'b10xxxxx110110xxxxx001110100xxxxx : xlate[255:0]="FSRC1";
32'b10xxxxx110110xxxxx001110101xxxxx : xlate[255:0]="FSRC1S";
32'b10xxxxx110110xxxxx001111000xxxxx : xlate[255:0]="FSRC2";
32'b10xxxxx110110xxxxx001111001xxxxx : xlate[255:0]="FSRC2S";
32'b10xxxxx110110xxxxx001101010xxxxx : xlate[255:0]="FNOT1";
32'b10xxxxx110110xxxxx001101011xxxxx : xlate[255:0]="FNOT1S";
32'b10xxxxx110110xxxxx001100110xxxxx : xlate[255:0]="FNOT2";
32'b10xxxxx110110xxxxx001100111xxxxx : xlate[255:0]="FNOT2S";
32'b10xxxxx110110xxxxx001111100xxxxx : xlate[255:0]="FOR";
32'b10xxxxx110110xxxxx001111101xxxxx : xlate[255:0]="FORS";
32'b10xxxxx110110xxxxx001100010xxxxx : xlate[255:0]="FNOR";
32'b10xxxxx110110xxxxx001100011xxxxx : xlate[255:0]="FNORS";
32'b10xxxxx110110xxxxx001110000xxxxx : xlate[255:0]="FAND";
32'b10xxxxx110110xxxxx001110001xxxxx : xlate[255:0]="FANDS";
32'b10xxxxx110110xxxxx001101110xxxxx : xlate[255:0]="FNAND";
32'b10xxxxx110110xxxxx001101111xxxxx : xlate[255:0]="FNANDS";
32'b10xxxxx110110xxxxx001101100xxxxx : xlate[255:0]="FXOR";
32'b10xxxxx110110xxxxx001101101xxxxx : xlate[255:0]="FXORS";
32'b10xxxxx110110xxxxx001110010xxxxx : xlate[255:0]="FXNOR";
32'b10xxxxx110110xxxxx001110011xxxxx : xlate[255:0]="FXNORS";
32'b10xxxxx110110xxxxx001111010xxxxx : xlate[255:0]="FORNOT1";
32'b10xxxxx110110xxxxx001111011xxxxx : xlate[255:0]="FORNOT1S";
32'b10xxxxx110110xxxxx001110110xxxxx : xlate[255:0]="FORNOT2";
32'b10xxxxx110110xxxxx001110111xxxxx : xlate[255:0]="FORNOT2S";
32'b10xxxxx110110xxxxx001101000xxxxx : xlate[255:0]="FANDNOT1";
32'b10xxxxx110110xxxxx001101001xxxxx : xlate[255:0]="FANDNOT1S";
32'b10xxxxx110110xxxxx001100100xxxxx : xlate[255:0]="FANDNOT2";
32'b10xxxxx110110xxxxx001100101xxxxx : xlate[255:0]="FANDNOT2S";
32'b10xxxxx110110xxxxx000101000xxxxx : xlate[255:0]="FCMPGT16";
32'b10xxxxx110110xxxxx000101100xxxxx : xlate[255:0]="FCMPGT32";
32'b10xxxxx110110xxxxx000100000xxxxx : xlate[255:0]="FCMPLE16";
32'b10xxxxx110110xxxxx000100100xxxxx : xlate[255:0]="FCMPLE32";
32'b10xxxxx110110xxxxx000100010xxxxx : xlate[255:0]="FCMPNE16";
32'b10xxxxx110110xxxxx000100110xxxxx : xlate[255:0]="FCMPNE32";
32'b10xxxxx110110xxxxx000101010xxxxx : xlate[255:0]="FCMPEQ16";
32'b10xxxxx110110xxxxx000101110xxxxx : xlate[255:0]="FCMPEQ32";
32'b10xxxxx110110xxxxx000111110xxxxx : xlate[255:0]="PDIST";
32'b10xxxxx110110xxxxx000000000xxxxx : xlate[255:0]="EDGE8";
32'b10xxxxx110110xxxxx000000001xxxxx : xlate[255:0]="EDGE8N";
32'b10xxxxx110110xxxxx000000010xxxxx : xlate[255:0]="EDGE8L";
32'b10xxxxx110110xxxxx000000011xxxxx : xlate[255:0]="EDGE8LN";
32'b10xxxxx110110xxxxx000000100xxxxx : xlate[255:0]="EDGE16";
32'b10xxxxx110110xxxxx000000101xxxxx : xlate[255:0]="EDGE16N";
32'b10xxxxx110110xxxxx000000110xxxxx : xlate[255:0]="EDGE16L";
32'b10xxxxx110110xxxxx000000111xxxxx : xlate[255:0]="EDGE16LN";
32'b10xxxxx110110xxxxx000001000xxxxx : xlate[255:0]="EDGE32";
32'b10xxxxx110110xxxxx000001001xxxxx : xlate[255:0]="EDGE32N";
32'b10xxxxx110110xxxxx000001010xxxxx : xlate[255:0]="EDGE32L";
32'b10xxxxx110110xxxxx000001011xxxxx : xlate[255:0]="EDGE32LN";
32'b10xxxxx110110xxxxx000010000xxxxx : xlate[255:0]="ARRAY8";
32'b10xxxxx110110xxxxx000010010xxxxx : xlate[255:0]="ARRAY16";
32'b10xxxxx110110xxxxx000010100xxxxx : xlate[255:0]="ARRAY32";
32'b10xxxxx110110xxxxx010000001xxxxx : xlate[255:0]="SIAM";
       default : xlate[255:0]="unknown";
    endcase   
   end
endfunction // xlate


`endif
   
endmodule

`endif


`ifdef CORE_5

module nas_probes5;


`ifdef GATESIM


`else
   reg [7:0] ex_valid_m;
   reg [7:0] ex_valid_b;
   reg [7:0] ex_valid_w;
   reg [7:0] return_f4;
   reg [2:0] ex0_tid_m;
   reg [2:0] ex1_tid_m;
   reg [2:0] ex0_tid_b;
   reg [2:0] ex1_tid_b;
   reg [2:0] ex0_tid_w;
   reg [2:0] ex1_tid_w;
   reg       fgu_valid_fb0;
   reg       fgu_valid_fb1;

   reg [31:0] inst0_e;
   reg [31:0] inst1_e;

   reg [7:0] fg_valid;

   reg fcc_valid_f4;
   reg fcc_valid_f5;
   reg fcc_valid_fb;

   reg fgu0_e;
   reg fgu1_e;
   reg lsu0_e;
   reg lsu1_e;

   reg [1:0] dcd_idest_e;
   reg [1:0] dcd_fdest_e;

   wire [7:0] ex_valid;
   wire [7:0] exception_w;

   wire [7:0] imul_valid;

   wire       fg_cond_fb;

   wire        exu_lsu_valid;
   wire [47:0] exu_lsu_addr;
   wire [31:0] exu_lsu_instr;
   wire [2:0]  exu_lsu_tid;
   wire [4:0]  exu_lsu_regid;
   wire [63:0] exu_lsu_data;

   wire [2:0] ex0_tid_e;
   wire [2:0] ex1_tid_e;
   wire       ex0_valid_e;
   wire       ex1_valid_e;
   wire [7:0] ex_asr_access;
   wire       ex_asr_valid;

   wire [7:0] lsu_valid;
   wire [2:0] lsu_tid;
   wire [7:0] lsu_tid_dec_b;
   wire       lsu_ld_valid;
   reg  [7:0] lsu_data_w;
   wire [7:0] lsu_data_b;

   wire ld_inst_d;

   reg [7:0] div_idest;
   reg [7:0] div_fdest;
   
   reg load0_e;
   reg load1_e;

   reg load_m;
   reg load_b;

   reg [2:0] lsu_tid_m;
   reg [7:0] lsu_complete_m;
   reg [7:0] lsu_complete_b;
   reg [7:0] lsu_trap_flush_d;	//reqd. for store buffer ue testing

   reg [7:0] ex_flush_w;
   reg [7:0] ex_flush_b;

   reg sel_divide0_e;
   reg sel_divide1_e;

   wire dec_flush_lb;

   wire [7:0] fgu_idiv_valid;

   wire [7:0] fgu_fdiv_valid;
   
   wire [7:0] fg_div_valid;

   wire       lsu_valid_b;

   wire [7:0] return_w;
   wire       return0;
   wire       return1;
   wire [7:0] real_exception;

   reg  [2:0] lsu_tid_b;
   reg        fmov_valid_fb;
   reg        fmov_valid_f5;
   reg        fmov_valid_f4;
   reg        fmov_valid_f3;
   reg        fmov_valid_f2;
   reg        fmov_valid_m;
   reg        fmov_valid_e;

   reg        fg_flush_fb;
   reg        fg_flush_f5;
   reg        fg_flush_f4;
   reg        fg_flush_f3;
   reg        fg_flush_f2;

   reg       siam0_d;   
   reg       siam1_d;   

   reg       done0_d;
   reg       done1_d;
   reg       retry0_d;
   reg       retry1_d;
   reg       done0_e;
   reg       done1_e;
   reg       retry0_e;
   reg       retry1_e;
   reg       tlu_ccr_cwp_0_valid_last;
   reg       tlu_ccr_cwp_1_valid_last;
   reg [7:0] fg_fdiv_valid_fw;
   reg [7:0] asi_in_progress_b;
   reg [7:0] asi_in_progress_w;
   reg [7:0] asi_in_progress_fx4;
   reg [7:0] tlu_valid;
   reg [7:0] sync_reset_w;
            
   reg [7:0] div_special_cancel_f4;

   reg       asi_store_b;
   reg       asi_store_w;
   reg [2:0] dcc_tid_b;
   reg [2:0] dcc_tid_w;
   reg [7:0] asi_valid_w;
   reg [7:0] asi_valid_fx4;
   reg [7:0] asi_valid_fx5;

   reg [7:0] lsu_state;
   reg [7:0] lsu_check;
   reg [2:0] lsu_tid_e;

   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;

   reg fgu_err_fx3; 
   reg fgu_err_fx4; 
   reg fgu_err_fx5; 
   reg fgu_err_fb; 

   reg clkstop_d1;
   reg clkstop_d2;
   reg clkstop_d3;
   reg clkstop_d4;
   reg clkstop_d5;

integer i;
integer start_dmiss0;
integer start_dmiss1;
integer start_dmiss2;
integer start_dmiss3;
integer start_dmiss4;
integer start_dmiss5;
integer start_dmiss6;
integer start_dmiss7;
integer number_dmiss;
integer start_imiss0;
integer start_imiss1;
integer start_imiss2;
integer start_imiss3;
integer start_imiss4;
integer start_imiss5;
integer start_imiss6;
integer start_imiss7;
integer active_imiss0;
integer active_imiss1;
integer active_imiss2;
integer active_imiss3;
integer active_imiss4;
integer active_imiss5;
integer active_imiss6;
integer active_imiss7;
integer first_imiss0;
integer first_imiss1;
integer first_imiss2;
integer first_imiss3;
integer first_imiss4;
integer first_imiss5;
integer first_imiss6;
integer first_imiss7;
integer number_imiss;
integer clock;
integer sum_dmiss_latency;
integer sum_imiss_latency;
reg spec_dmiss;
integer dmiss_cnt;
integer imiss_cnt;
reg pcx_req;
integer l15dmiss_cnt;
integer l15imiss_cnt;


initial begin // {
    pcx_req=0;
    l15imiss_cnt=0;
    l15dmiss_cnt=0;
    imiss_cnt=0;
    dmiss_cnt=0;
    clock=0;
    start_dmiss0=0;
    start_dmiss1=0;
    start_dmiss2=0;
    start_dmiss3=0;
    start_dmiss4=0;
    start_dmiss5=0;
    start_dmiss6=0;
    start_dmiss7=0;
    number_dmiss=0;
    start_imiss0=0;
    start_imiss1=0;
    start_imiss2=0;
    start_imiss3=0;
    start_imiss4=0;
    start_imiss5=0;
    start_imiss6=0;
    start_imiss7=0;
    active_imiss0=0;
    active_imiss1=0;
    active_imiss2=0;
    active_imiss3=0;
    active_imiss4=0;
    active_imiss5=0;
    active_imiss6=0;
    active_imiss7=0;
    first_imiss0=0;
    first_imiss1=0;
    first_imiss2=0;
    first_imiss3=0;
    first_imiss4=0;
    first_imiss5=0;
    first_imiss6=0;
    first_imiss7=0;
    number_imiss=0;
    sum_dmiss_latency=0;
    sum_imiss_latency=0;
    asi_in_progress_b <= 8'h0;
    asi_in_progress_w <= 8'h0;
    asi_in_progress_fx4 <= 8'h0;
    tlu_valid <= 8'h0;
    div_idest <= 8'h0;
    div_fdest <= 8'h0;
    lsu_state <= 8'h0;
    clkstop_d1 <=0;
    clkstop_d2 <=0;
    clkstop_d3 <=0;
    clkstop_d4 <=0;
    clkstop_d5 <=0;

end //}

wire [7:0] asi_store_flush_w =  {`SPC5.lsu.sbs7.flush_st_w,
                                 `SPC5.lsu.sbs6.flush_st_w,
                                 `SPC5.lsu.sbs5.flush_st_w,
                                 `SPC5.lsu.sbs4.flush_st_w,
                                 `SPC5.lsu.sbs3.flush_st_w,
                                 `SPC5.lsu.sbs2.flush_st_w,
                                 `SPC5.lsu.sbs1.flush_st_w,
                                 `SPC5.lsu.sbs0.flush_st_w};

wire [7:0] store_sync = {`SPC5.lsu.sbs7.trap_sync,
                         `SPC5.lsu.sbs6.trap_sync,
                         `SPC5.lsu.sbs5.trap_sync,
                         `SPC5.lsu.sbs4.trap_sync,
                         `SPC5.lsu.sbs3.trap_sync,
                         `SPC5.lsu.sbs2.trap_sync,
                         `SPC5.lsu.sbs1.trap_sync,
                         `SPC5.lsu.sbs0.trap_sync};
wire [7:0] sync_reset = {`SPC5.lsu.sbs7.sync_state_rst,
                         `SPC5.lsu.sbs6.sync_state_rst,
                         `SPC5.lsu.sbs5.sync_state_rst,
                         `SPC5.lsu.sbs4.sync_state_rst,
                         `SPC5.lsu.sbs3.sync_state_rst,
                         `SPC5.lsu.sbs2.sync_state_rst,
                         `SPC5.lsu.sbs1.sync_state_rst,
                         `SPC5.lsu.sbs0.sync_state_rst};

//--------------------
// Used in nas_pipe for TSB Config Regs Capture/Compare
// ADD_TSB_CFG

// NOTE - ADD_TSB_CFG will never be used for Axis or Tharas
`ifndef EMUL
wire [63:0] ctxt_z_tsb_cfg0_reg [7:0];  // 1 per thread
wire [63:0] ctxt_z_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg3_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg0_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg3_reg [7:0];

// There are 32 entries in each MMU MRA but not all are needed.
// Indexing:
// Bits 4:3 of the address are the lower two bits of the TID
// Bits 2:0 of the address select the register as below
//   mmu.mra0.array.mem for T0-T3
//   mmu.mra1.array.mem for T4-T7
// (this is documented in mmu_asi_ctl.sv)
//		z TSB cfg 0,1				address 0
//		z TSB cfg 2,3				address 1
//		nz TSB cfg 0,1				address 2
//		nz TSB cfg 2,3				address 3
//		Real range, physical offset pair 0	address 4
//		Real range, physical offset pair 1	address 5
//		Real range, physical offset pair 2	address 6
//		Real range, physical offset pair 3	address 7

wire [83:0] mmu_mra0_a0 = `SPC5.mmu.mra0.array.mem[0];
wire [83:0] mmu_mra0_a8 = `SPC5.mmu.mra0.array.mem[8];
wire [83:0] mmu_mra0_a16 = `SPC5.mmu.mra0.array.mem[16];
wire [83:0] mmu_mra0_a24 = `SPC5.mmu.mra0.array.mem[24];
wire [83:0] mmu_mra0_a1 = `SPC5.mmu.mra0.array.mem[1];
wire [83:0] mmu_mra0_a9 = `SPC5.mmu.mra0.array.mem[9];
wire [83:0] mmu_mra0_a17 = `SPC5.mmu.mra0.array.mem[17];
wire [83:0] mmu_mra0_a25 = `SPC5.mmu.mra0.array.mem[25];
wire [83:0] mmu_mra0_a2 = `SPC5.mmu.mra0.array.mem[2];
wire [83:0] mmu_mra0_a10 = `SPC5.mmu.mra0.array.mem[10];
wire [83:0] mmu_mra0_a18 = `SPC5.mmu.mra0.array.mem[18];
wire [83:0] mmu_mra0_a26 = `SPC5.mmu.mra0.array.mem[26];
wire [83:0] mmu_mra0_a3 = `SPC5.mmu.mra0.array.mem[3];
wire [83:0] mmu_mra0_a11 = `SPC5.mmu.mra0.array.mem[11];
wire [83:0] mmu_mra0_a19 = `SPC5.mmu.mra0.array.mem[19];
wire [83:0] mmu_mra0_a27 = `SPC5.mmu.mra0.array.mem[27];
wire [83:0] mmu_mra1_a0 = `SPC5.mmu.mra1.array.mem[0];
wire [83:0] mmu_mra1_a8 = `SPC5.mmu.mra1.array.mem[8];
wire [83:0] mmu_mra1_a16 = `SPC5.mmu.mra1.array.mem[16];
wire [83:0] mmu_mra1_a24 = `SPC5.mmu.mra1.array.mem[24];
wire [83:0] mmu_mra1_a1 = `SPC5.mmu.mra1.array.mem[1];
wire [83:0] mmu_mra1_a9 = `SPC5.mmu.mra1.array.mem[9];
wire [83:0] mmu_mra1_a17 = `SPC5.mmu.mra1.array.mem[17];
wire [83:0] mmu_mra1_a25 = `SPC5.mmu.mra1.array.mem[25];
wire [83:0] mmu_mra1_a2 = `SPC5.mmu.mra1.array.mem[2];
wire [83:0] mmu_mra1_a10 = `SPC5.mmu.mra1.array.mem[10];
wire [83:0] mmu_mra1_a18 = `SPC5.mmu.mra1.array.mem[18];
wire [83:0] mmu_mra1_a26 = `SPC5.mmu.mra1.array.mem[26];
wire [83:0] mmu_mra1_a3 = `SPC5.mmu.mra1.array.mem[3];
wire [83:0] mmu_mra1_a11 = `SPC5.mmu.mra1.array.mem[11];
wire [83:0] mmu_mra1_a19 = `SPC5.mmu.mra1.array.mem[19];
wire [83:0] mmu_mra1_a27 = `SPC5.mmu.mra1.array.mem[27];


// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[0] = {`SPC5.mmu.asi.t0_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[0]  = {`SPC5.mmu.asi.t0_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[0]  = {`SPC5.mmu.asi.t0_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[0]  = {`SPC5.mmu.asi.t0_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[0] = {`SPC5.mmu.asi.t0_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[0] = {`SPC5.mmu.asi.t0_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[0] = {`SPC5.mmu.asi.t0_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[0] = {`SPC5.mmu.asi.t0_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[1] = {`SPC5.mmu.asi.t1_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[1]  = {`SPC5.mmu.asi.t1_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[1]  = {`SPC5.mmu.asi.t1_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[1]  = {`SPC5.mmu.asi.t1_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[1] = {`SPC5.mmu.asi.t1_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[1] = {`SPC5.mmu.asi.t1_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[1] = {`SPC5.mmu.asi.t1_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[1] = {`SPC5.mmu.asi.t1_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[2] = {`SPC5.mmu.asi.t2_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[2]  = {`SPC5.mmu.asi.t2_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[2]  = {`SPC5.mmu.asi.t2_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[2]  = {`SPC5.mmu.asi.t2_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[2] = {`SPC5.mmu.asi.t2_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[2] = {`SPC5.mmu.asi.t2_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[2] = {`SPC5.mmu.asi.t2_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[2] = {`SPC5.mmu.asi.t2_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[3] = {`SPC5.mmu.asi.t3_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[3]  = {`SPC5.mmu.asi.t3_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[3]  = {`SPC5.mmu.asi.t3_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[3]  = {`SPC5.mmu.asi.t3_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[3] = {`SPC5.mmu.asi.t3_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[3] = {`SPC5.mmu.asi.t3_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[3] = {`SPC5.mmu.asi.t3_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[3] = {`SPC5.mmu.asi.t3_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[4] = {`SPC5.mmu.asi.t4_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[4]  = {`SPC5.mmu.asi.t4_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[4]  = {`SPC5.mmu.asi.t4_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[4]  = {`SPC5.mmu.asi.t4_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[4] = {`SPC5.mmu.asi.t4_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[4] = {`SPC5.mmu.asi.t4_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[4] = {`SPC5.mmu.asi.t4_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[4] = {`SPC5.mmu.asi.t4_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[5] = {`SPC5.mmu.asi.t5_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[5]  = {`SPC5.mmu.asi.t5_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[5]  = {`SPC5.mmu.asi.t5_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[5]  = {`SPC5.mmu.asi.t5_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[5] = {`SPC5.mmu.asi.t5_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[5] = {`SPC5.mmu.asi.t5_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[5] = {`SPC5.mmu.asi.t5_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[5] = {`SPC5.mmu.asi.t5_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[6] = {`SPC5.mmu.asi.t6_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[6]  = {`SPC5.mmu.asi.t6_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[6]  = {`SPC5.mmu.asi.t6_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[6]  = {`SPC5.mmu.asi.t6_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[6] = {`SPC5.mmu.asi.t6_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[6] = {`SPC5.mmu.asi.t6_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[6] = {`SPC5.mmu.asi.t6_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[6] = {`SPC5.mmu.asi.t6_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[7] = {`SPC5.mmu.asi.t7_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[7]  = {`SPC5.mmu.asi.t7_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[7]  = {`SPC5.mmu.asi.t7_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[7]  = {`SPC5.mmu.asi.t7_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[7] = {`SPC5.mmu.asi.t7_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[7] = {`SPC5.mmu.asi.t7_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[7] = {`SPC5.mmu.asi.t7_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[7] = {`SPC5.mmu.asi.t7_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };
`endif // EMUL - ADD_TSB_CFG


// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
// Suppress instruction on flush or park request 
// (clear_disrupting_flush_pending_w_in & idl_req_in)
//  Suppress instruction for 'refetch' exception after 
//     not taken branch with annulled delay slot
// NOTE:  'with_errors' means that the signal actually IGNORES instruction
// cache errors and asserts IN SPITE OF instruction cache errors
wire [7:0] select_pc_b_with_errors = 
     {{4 {~`SPC5.dec_flush_b[1]}}, {4 {~`SPC5.dec_flush_b[0]}}} & 
     {{4 {~`SPC5.tlu.fls1.refetch_w_in}}, {4 {~`SPC5.tlu.fls0.refetch_w_in}}} &
     {~(`SPC5.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC5.tlu.fls1.idl_req_in}}),
      ~(`SPC5.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC5.tlu.fls0.idl_req_in}})} &
     {`SPC5.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC5.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Qualify select_pc_b_with_errors to get final select_pc_b signal
// Qualifications are
// 	- instruction cache errors (ic_err_w_in)
//	- disrupting single step completion requests (dsc_req_in)
wire [7:0] select_pc_b = 
     select_pc_b_with_errors[7:0]  &
     {{4 {(~`SPC5.tlu.fls1.ic_err_w_in | `SPC5.tlu.fls1.itlb_nfo_exc_b) & 
          ~`SPC5.tlu.fls1.dsc_req_in}}, 
      {4 {(~`SPC5.tlu.fls0.ic_err_w_in | `SPC5.tlu.fls0.itlb_nfo_exc_b) & 
          ~`SPC5.tlu.fls0.dsc_req_in}}};

//------------------------------------

//original select_pc_b_with errors. Select_pc_b_with_errors is no longer asserted
//if the inst. following an annulled delay slot of a not taken branch has a prebuffer
//error and it reaches B stage. I still need a signal if this happens to trigger the chkr.

wire [7:0] select_pc_b_with_errors_and_refetch =
     {{4 {~`SPC5.dec_flush_b[1]}}, {4 {~`SPC5.dec_flush_b[0]}}} &
     {~(`SPC5.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC5.tlu.fls1.idl_req_in}}),
      ~(`SPC5.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC5.tlu.fls0.idl_req_in}})} &
     {`SPC5.tlu.fls1.tid_dec_valid_b[3:0],
      `SPC5.tlu.fls0.tid_dec_valid_b[3:0]};

// Signals required for bench TLB sync & LDST sync

reg        tlb_bypass_m;
reg        tlb_bypass_b;
reg        tlb_rd_vld_m;
reg        tlb_rd_vld_b;
reg        lsu_tl_gt_0_b;
reg  [7:0] dcc_asi_b;
reg        asi_internal_w;

always @ (posedge `BENCH_SPC5_GCLK) begin // {

  clkstop_d1 <= `SPC5.tcu_clk_stop;
  clkstop_d2 <= clkstop_d1;
  clkstop_d3 <= clkstop_d2;
  clkstop_d4 <= clkstop_d3;
  clkstop_d5 <= clkstop_d4;

  tlb_bypass_m <= `SPC5.lsu.tlb.tlb_bypass;
  tlb_bypass_b <= tlb_bypass_m;
  tlb_rd_vld_m <= `SPC5.lsu.tlb.tlb_rd_vld | `SPC5.lsu.tlb.tlb_cam_vld;
  tlb_rd_vld_b <= tlb_rd_vld_m;

  // This signal is only valid for LD/ST instructions
  lsu_tl_gt_0_b <= `SPC5.lsu.dcc.tl_gt_0_m;

  // Can't use lsu.dcc_asi_b for tlb_sync so pipeline from M to B
  dcc_asi_b <= `SPC5.lsu.dcc_asi_m;

  // LD/ST that will not issue to the crossbar
  asi_internal_w <= `SPC5.lsu.dcc.asi_internal_b;
end // }

// TL determines whether Nucleus or Primary
wire [7:0] asi_num = `SPC5.lsu.dcc.altspace_ldst_b ? 
                     dcc_asi_b : 
                     (lsu_tl_gt_0_b ? 8'h04 : 8'h80);

wire [7:0] itlb_miss   = { (`SPC5.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire [7:0] icache_miss = { (`SPC5.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC5.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC5.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire inst_bypass = (`SPC5.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[0] |
                    `SPC5.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[1] |
                    `SPC5.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[2]);

wire [7:0] fetch_bypass = { (inst_bypass & `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                            (inst_bypass & `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                            (inst_bypass & `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                            (inst_bypass & `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                            (inst_bypass & `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                            (inst_bypass & `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                            (inst_bypass & `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                            (inst_bypass & `SPC5.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                          };

wire [7:0] itlb_wr = {(`SPC5.tlu.trl1.take_itw & `SPC5.tlu.trl1.trap[3]),
                      (`SPC5.tlu.trl1.take_itw & `SPC5.tlu.trl1.trap[2]),
                      (`SPC5.tlu.trl1.take_itw & `SPC5.tlu.trl1.trap[1]),
                      (`SPC5.tlu.trl1.take_itw & `SPC5.tlu.trl1.trap[0]),
                      (`SPC5.tlu.trl0.take_itw & `SPC5.tlu.trl0.trap[3]),
                      (`SPC5.tlu.trl0.take_itw & `SPC5.tlu.trl0.trap[2]),
                      (`SPC5.tlu.trl0.take_itw & `SPC5.tlu.trl0.trap[1]),
                      (`SPC5.tlu.trl0.take_itw & `SPC5.tlu.trl0.trap[0])
                     };

//------------------------------------

reg  [71:0] tick_cmpr_0; 
reg  [71:0] stick_cmpr_0; 
reg  [71:0] hstick_cmpr_0;
reg [151:0] trap_entry_1_t0;
reg [151:0] trap_entry_2_t0;
reg [151:0] trap_entry_3_t0;
reg [151:0] trap_entry_4_t0;
reg [151:0] trap_entry_5_t0;
reg [151:0] trap_entry_6_t0;

always @(posedge `BENCH_SPC5_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_0        <= `SPC5.tlu.tca.array.mem[{2'b0,3'h0}];
      stick_cmpr_0       <= `SPC5.tlu.tca.array.mem[{2'b01,3'h0}];
      hstick_cmpr_0      <= `SPC5.tlu.tca.array.mem[{2'b10,3'h0}];
      trap_entry_1_t0    <= `SPC5.tlu.tsa0.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t0    <= `SPC5.tlu.tsa0.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t0    <= `SPC5.tlu.tsa0.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t0    <= `SPC5.tlu.tsa0.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t0    <= `SPC5.tlu.tsa0.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t0    <= `SPC5.tlu.tsa0.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_1; 
reg  [71:0] stick_cmpr_1; 
reg  [71:0] hstick_cmpr_1;
reg [151:0] trap_entry_1_t1;
reg [151:0] trap_entry_2_t1;
reg [151:0] trap_entry_3_t1;
reg [151:0] trap_entry_4_t1;
reg [151:0] trap_entry_5_t1;
reg [151:0] trap_entry_6_t1;

always @(posedge `BENCH_SPC5_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_1        <= `SPC5.tlu.tca.array.mem[{2'b0,3'h1}];
      stick_cmpr_1       <= `SPC5.tlu.tca.array.mem[{2'b01,3'h1}];
      hstick_cmpr_1      <= `SPC5.tlu.tca.array.mem[{2'b10,3'h1}];
      trap_entry_1_t1    <= `SPC5.tlu.tsa0.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t1    <= `SPC5.tlu.tsa0.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t1    <= `SPC5.tlu.tsa0.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t1    <= `SPC5.tlu.tsa0.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t1    <= `SPC5.tlu.tsa0.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t1    <= `SPC5.tlu.tsa0.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_2; 
reg  [71:0] stick_cmpr_2; 
reg  [71:0] hstick_cmpr_2;
reg [151:0] trap_entry_1_t2;
reg [151:0] trap_entry_2_t2;
reg [151:0] trap_entry_3_t2;
reg [151:0] trap_entry_4_t2;
reg [151:0] trap_entry_5_t2;
reg [151:0] trap_entry_6_t2;

always @(posedge `BENCH_SPC5_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_2        <= `SPC5.tlu.tca.array.mem[{2'b0,3'h2}];
      stick_cmpr_2       <= `SPC5.tlu.tca.array.mem[{2'b01,3'h2}];
      hstick_cmpr_2      <= `SPC5.tlu.tca.array.mem[{2'b10,3'h2}];
      trap_entry_1_t2    <= `SPC5.tlu.tsa0.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t2    <= `SPC5.tlu.tsa0.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t2    <= `SPC5.tlu.tsa0.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t2    <= `SPC5.tlu.tsa0.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t2    <= `SPC5.tlu.tsa0.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t2    <= `SPC5.tlu.tsa0.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_3; 
reg  [71:0] stick_cmpr_3; 
reg  [71:0] hstick_cmpr_3;
reg [151:0] trap_entry_1_t3;
reg [151:0] trap_entry_2_t3;
reg [151:0] trap_entry_3_t3;
reg [151:0] trap_entry_4_t3;
reg [151:0] trap_entry_5_t3;
reg [151:0] trap_entry_6_t3;

always @(posedge `BENCH_SPC5_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_3        <= `SPC5.tlu.tca.array.mem[{2'b0,3'h3}];
      stick_cmpr_3       <= `SPC5.tlu.tca.array.mem[{2'b01,3'h3}];
      hstick_cmpr_3      <= `SPC5.tlu.tca.array.mem[{2'b10,3'h3}];
      trap_entry_1_t3    <= `SPC5.tlu.tsa0.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t3    <= `SPC5.tlu.tsa0.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t3    <= `SPC5.tlu.tsa0.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t3    <= `SPC5.tlu.tsa0.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t3    <= `SPC5.tlu.tsa0.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t3    <= `SPC5.tlu.tsa0.array.mem[{2'h3, 3'h5}];

end // }
reg  [71:0] tick_cmpr_4; 
reg  [71:0] stick_cmpr_4; 
reg  [71:0] hstick_cmpr_4;
reg [151:0] trap_entry_1_t4;
reg [151:0] trap_entry_2_t4;
reg [151:0] trap_entry_3_t4;
reg [151:0] trap_entry_4_t4;
reg [151:0] trap_entry_5_t4;
reg [151:0] trap_entry_6_t4;

always @(posedge `BENCH_SPC5_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_4        <= `SPC5.tlu.tca.array.mem[{2'b0,3'h4}];
      stick_cmpr_4       <= `SPC5.tlu.tca.array.mem[{2'b01,3'h4}];
      hstick_cmpr_4      <= `SPC5.tlu.tca.array.mem[{2'b10,3'h4}];
      trap_entry_1_t4    <= `SPC5.tlu.tsa1.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t4    <= `SPC5.tlu.tsa1.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t4    <= `SPC5.tlu.tsa1.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t4    <= `SPC5.tlu.tsa1.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t4    <= `SPC5.tlu.tsa1.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t4    <= `SPC5.tlu.tsa1.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_5; 
reg  [71:0] stick_cmpr_5; 
reg  [71:0] hstick_cmpr_5;
reg [151:0] trap_entry_1_t5;
reg [151:0] trap_entry_2_t5;
reg [151:0] trap_entry_3_t5;
reg [151:0] trap_entry_4_t5;
reg [151:0] trap_entry_5_t5;
reg [151:0] trap_entry_6_t5;

always @(posedge `BENCH_SPC5_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_5        <= `SPC5.tlu.tca.array.mem[{2'b0,3'h5}];
      stick_cmpr_5       <= `SPC5.tlu.tca.array.mem[{2'b01,3'h5}];
      hstick_cmpr_5      <= `SPC5.tlu.tca.array.mem[{2'b10,3'h5}];
      trap_entry_1_t5    <= `SPC5.tlu.tsa1.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t5    <= `SPC5.tlu.tsa1.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t5    <= `SPC5.tlu.tsa1.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t5    <= `SPC5.tlu.tsa1.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t5    <= `SPC5.tlu.tsa1.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t5    <= `SPC5.tlu.tsa1.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_6; 
reg  [71:0] stick_cmpr_6; 
reg  [71:0] hstick_cmpr_6;
reg [151:0] trap_entry_1_t6;
reg [151:0] trap_entry_2_t6;
reg [151:0] trap_entry_3_t6;
reg [151:0] trap_entry_4_t6;
reg [151:0] trap_entry_5_t6;
reg [151:0] trap_entry_6_t6;

always @(posedge `BENCH_SPC5_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_6        <= `SPC5.tlu.tca.array.mem[{2'b0,3'h6}];
      stick_cmpr_6       <= `SPC5.tlu.tca.array.mem[{2'b01,3'h6}];
      hstick_cmpr_6      <= `SPC5.tlu.tca.array.mem[{2'b10,3'h6}];
      trap_entry_1_t6    <= `SPC5.tlu.tsa1.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t6    <= `SPC5.tlu.tsa1.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t6    <= `SPC5.tlu.tsa1.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t6    <= `SPC5.tlu.tsa1.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t6    <= `SPC5.tlu.tsa1.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t6    <= `SPC5.tlu.tsa1.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_7; 
reg  [71:0] stick_cmpr_7; 
reg  [71:0] hstick_cmpr_7;
reg [151:0] trap_entry_1_t7;
reg [151:0] trap_entry_2_t7;
reg [151:0] trap_entry_3_t7;
reg [151:0] trap_entry_4_t7;
reg [151:0] trap_entry_5_t7;
reg [151:0] trap_entry_6_t7;

always @(posedge `BENCH_SPC5_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_7        <= `SPC5.tlu.tca.array.mem[{2'b0,3'h7}];
      stick_cmpr_7       <= `SPC5.tlu.tca.array.mem[{2'b01,3'h7}];
      hstick_cmpr_7      <= `SPC5.tlu.tca.array.mem[{2'b10,3'h7}];
      trap_entry_1_t7    <= `SPC5.tlu.tsa1.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t7    <= `SPC5.tlu.tsa1.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t7    <= `SPC5.tlu.tsa1.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t7    <= `SPC5.tlu.tsa1.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t7    <= `SPC5.tlu.tsa1.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t7    <= `SPC5.tlu.tsa1.array.mem[{2'h3, 3'h5}];

end // }

//------------------------------------
// ASI & Trap State machines
always @(posedge `BENCH_SPC5_GCLK) begin // {

//    pc_0_e[47:0] <= `SPC5.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC5.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC5.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC5.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;


    // altspace_ldst_m is asserted for asi accesses that don't change arch state
    asi_store_b <= (`SPC5.lsu.dcc.asi_store_m & `SPC5.lsu.dcc.asi_sync_m);
    asi_store_w <= asi_store_b;
    dcc_tid_b <= `SPC5.lsu.dcc.dcc_tid_m;
    dcc_tid_w <= dcc_tid_b;

    // ASI in progress state m/c
    if (asi_store_w & ~asi_store_flush_w[dcc_tid_w]) begin // {
        asi_in_progress_b[dcc_tid_w] <= 1'b1;
    end // }

    asi_valid_w <= asi_in_progress_b & store_sync;

    // Delay asi_valid_w and asi_in_progress
    // 2 clocks to ensure TLB Sync DTLBWRITE (demap) comes before SSTEP stxa
    asi_valid_fx4 <= asi_valid_w;
    asi_valid_fx5 <= asi_valid_fx4;
    asi_in_progress_w <= asi_in_progress_b;
    asi_in_progress_fx4 <= asi_in_progress_w;
    sync_reset_w <= sync_reset;
    
    for (i=0;i<8;i=i+1) begin // {
        if (asi_valid_w[i] | sync_reset_w[i]) begin // {
            asi_in_progress_b[i] <= 1'b0;
        end//}
    end //}

    // Trap0 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC5.tlu.tlu_trap_0_tid[1:0] == i) &&
            `SPC5.tlu.tlu_trap_pc_0_valid & tlu_ccr_cwp_0_valid_last)
        begin //{
            tlu_valid[i] <= 1'b1;
        end //}
        // Trap taken
        else if (`SPC5.tlu.trl0.real_trap[i] & ~`SPC5.tlu.trl0.take_por) begin // {
            tlu_valid[i] <= 1'b1;
        end //}
        else 
            tlu_valid[i] <= 1'b0;
    end //}

    // Trap1 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC5.tlu.tlu_trap_1_tid[1:0] == i) &&
            `SPC5.tlu.tlu_trap_pc_1_valid & tlu_ccr_cwp_1_valid_last)
        begin //{
            tlu_valid[i+4] <= 1'b1;
        end //} 
        // Trap taken
        else if (`SPC5.tlu.trl1.real_trap[i] & ~`SPC5.tlu.trl1.take_por) begin // {
            tlu_valid[i+4] <= 1'b1;
        end //}
        else 
            tlu_valid[i+4] <= 1'b0;
    end //}

end // }


always @(posedge `BENCH_SPC5_GCLK) begin

// debug code for TPCC analysis
`ifdef TPCC
if (pcx_req==1) begin
	if (`SPC5.spc_pcx_data_pa[129:124]==6'b100000) begin  // l15 dmiss
	  l15dmiss_cnt=l15dmiss_cnt+1;
	  $display("dmissl15 cnt is %0d",l15dmiss_cnt);
	end
	if (`SPC5.spc_pcx_data_pa[129:124]==6'b110000) begin // l15 imiss
	  l15imiss_cnt=l15imiss_cnt+1;
	  $display("imissl15 cnt is %0d",l15imiss_cnt);
	end
	// `TOP.spg.spc_pcx_data_pa[129:124]==6'b100001   -> all stores 
end

pcx_req <= |`SPC5.spc_pcx_req_pq[8:0];
 
if (`SPC5.ifu_l15_valid==1) begin
	imiss_cnt=imiss_cnt+1;
	$display("imiss cnt is %0d",imiss_cnt);
end
if (spec_dmiss==1 && `SPC5.lsu_l15_cancel==0) begin
	dmiss_cnt=dmiss_cnt+1;
	$display("dmiss cnt is %0d",dmiss_cnt);
	
end
spec_dmiss <= `SPC5.lsu_l15_valid & `SPC5.lsu_l15_load;

clock = clock+1;

// keep track of imiss latencies
if (`SPC5.ftu_agc_thr0_cmiss_c==1) begin
     start_imiss0=clock;
     active_imiss0=1;
end
if (active_imiss0==1 && first_imiss0==1 && `SPC5.l15_spc_cpkt[8:6]==3'b000 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss0 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss0=0;
     first_imiss0=0;
end
if (active_imiss0==1 && first_imiss0==0 && `SPC5.l15_spc_cpkt[8:6]==3'b000 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss0=1;
end
if (`SPC5.ftu_agc_thr1_cmiss_c==1) begin
     start_imiss1=clock;
     active_imiss1=1;
end
if (active_imiss1==1 && first_imiss1==1 && `SPC5.l15_spc_cpkt[8:6]==3'b001 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss1 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss1=0;
     first_imiss1=0;
end
if (active_imiss1==1 && first_imiss1==0 && `SPC5.l15_spc_cpkt[8:6]==3'b001 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss1=1;
end
if (`SPC5.ftu_agc_thr2_cmiss_c==1) begin
     start_imiss2=clock;
     active_imiss2=1;
end
if (active_imiss2==1 && first_imiss2==1 && `SPC5.l15_spc_cpkt[8:6]==3'b010 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss2 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss2=0;
     first_imiss2=0;
end
if (active_imiss2==1 && first_imiss2==0 && `SPC5.l15_spc_cpkt[8:6]==3'b010 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss2=1;
end
if (`SPC5.ftu_agc_thr3_cmiss_c==1) begin
     start_imiss3=clock;
     active_imiss3=1;
end
if (active_imiss3==1 && first_imiss3==1  && `SPC5.l15_spc_cpkt[8:6]==3'b011 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss3 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss3=0;
     first_imiss3=0;
end
if (active_imiss3==1 && first_imiss3==0 && `SPC5.l15_spc_cpkt[8:6]==3'b011 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss3=1;
end
if (`SPC5.ftu_agc_thr4_cmiss_c==1) begin
     start_imiss4=clock;
     active_imiss4=1;
end
if (active_imiss4==1 && first_imiss4==1  && `SPC5.l15_spc_cpkt[8:6]==3'b100 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss4 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss4=0;
     first_imiss4=0;
end
if (active_imiss4==1 && first_imiss4==0 && `SPC5.l15_spc_cpkt[8:6]==3'b100 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss4=1;
end
if (`SPC5.ftu_agc_thr5_cmiss_c==1) begin
     start_imiss5=clock;
     active_imiss5=1;
end
if (active_imiss5==1  && first_imiss5==1 && `SPC5.l15_spc_cpkt[8:6]==3'b101 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss5 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss5=0;
     first_imiss5=0;
end
if (active_imiss5==1 && first_imiss5==0 && `SPC5.l15_spc_cpkt[8:6]==3'b101 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss5=1;
end
if (`SPC5.ftu_agc_thr6_cmiss_c==1) begin
     start_imiss6=clock;
     active_imiss6=1;
end
if (active_imiss6==1 && first_imiss6==1 && `SPC5.l15_spc_cpkt[8:6]==3'b110 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss6 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss6=0;
     first_imiss6=0;
end
if (active_imiss6==1 && first_imiss6==0 && `SPC5.l15_spc_cpkt[8:6]==3'b110 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss6=1;
end
if (`SPC5.ftu_agc_thr7_cmiss_c==1) begin
     start_imiss7=clock;
     active_imiss7=1;
end
if (active_imiss7==1 && first_imiss7==1 && `SPC5.l15_spc_cpkt[8:6]==3'b111 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss7 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss7=0;
    first_imiss7=0;
end
if (active_imiss7==1 && first_imiss7==0 && `SPC5.l15_spc_cpkt[8:6]==3'b111 && `SPC5.l15_spc_valid==1 && `SPC5.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss7=1;
end

if (`SPC5.pku.swl0.set_lsu_sync_wait==1) begin
     start_dmiss0=clock;
end
if (`SPC5.pku.swl0.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss0) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC5.pku.swl1.set_lsu_sync_wait==1) begin
     start_dmiss1=clock;
end
if (`SPC5.pku.swl1.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss1) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC5.pku.swl2.set_lsu_sync_wait==1) begin
     start_dmiss2=clock;
end
if (`SPC5.pku.swl2.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss2) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC5.pku.swl3.set_lsu_sync_wait==1) begin
     start_dmiss3=clock;
end
if (`SPC5.pku.swl3.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss3) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC5.pku.swl4.set_lsu_sync_wait==1) begin
     start_dmiss4=clock;
end
if (`SPC5.pku.swl4.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss4) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC5.pku.swl5.set_lsu_sync_wait==1) begin
     start_dmiss5=clock;
end
if (`SPC5.pku.swl5.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss5) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC5.pku.swl6.set_lsu_sync_wait==1) begin
     start_dmiss6=clock;
end
if (`SPC5.pku.swl6.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss6) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC5.pku.swl7.set_lsu_sync_wait==1) begin
     start_dmiss7=clock;
end
if (`SPC5.pku.swl7.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss7) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
`endif



   lsu_tid_e[2:0] <= `SPC5.lsu.dcc.tid_d[2:0];

   // FG Valid conditions

   // Add fcc valids to fg_valid
   fcc_valid_fb <= fcc_valid_f5;
   fcc_valid_f5 <= fcc_valid_f4;
   fcc_valid_f4 <= |`SPC5.fgu.fgu_cmp_fcc_vld_fx3[3:0];

   fg_flush_fb <= fg_flush_f5;
   fg_flush_f5 <= fg_flush_f4;
   fg_flush_f4 <= fg_flush_f3;
   fg_flush_f3 <= fg_flush_f2 | `SPC5.dec_flush_f2 | 
                  `SPC5.tlu_flush_fgu_b;
   fg_flush_f2 <= `SPC5.dec_flush_f1;

   fgu_err_fx3 <= `SPC5.fgu_cecc_fx2 | `SPC5.fgu_uecc_fx2 | `SPC5.fgu.fpc.exu_flush_fx2; // frf or irf ecc error
   fgu_err_fx4 <= fgu_err_fx3;
   fgu_err_fx5 <= fgu_err_fx4;
   fgu_err_fb <= fgu_err_fx5;

   // Siams cause fg_valid ..
   siam0_d = `SPC5.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC5.dec.dec_inst0_d[24:19]==6'b110110 &
             `SPC5.dec.dec_inst0_d[13:5]==9'b010000001;  

   siam1_d = `SPC5.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC5.dec.dec_inst1_d[24:19]==6'b110110 &
             `SPC5.dec.dec_inst1_d[13:5]==9'b010000001;  
    

   done0_d = `SPC5.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC5.dec.dec_inst0_d[29:25]==5'b00000 & 
             `SPC5.dec.dec_inst0_d[24:19]==6'b111110;
   done1_d = `SPC5.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC5.dec.dec_inst1_d[29:25]==5'b00000 & 
             `SPC5.dec.dec_inst1_d[24:19]==6'b111110;    

   retry0_d = `SPC5.dec.dec_inst0_d[31:30]==2'b10 & 
              `SPC5.dec.dec_inst0_d[29:25]==5'b00001 & 
              `SPC5.dec.dec_inst0_d[24:19]==6'b111110;
   retry1_d = `SPC5.dec.dec_inst1_d[31:30]==2'b10 & 
              `SPC5.dec.dec_inst1_d[29:25]==5'b00001 & 
              `SPC5.dec.dec_inst1_d[24:19]==6'b111110;   

   done0_e <= done0_d & `SPC5.dec.dec_decode0_d;
   done1_e <= done1_d & `SPC5.dec.dec_decode1_d; 

   retry0_e <= retry0_d & `SPC5.dec.dec_decode0_d;
   retry1_e <= retry1_d & `SPC5.dec.dec_decode1_d;   


   // fold siam into cmov logic 

   fmov_valid_fb <= fmov_valid_f5;
   fmov_valid_f5 <= fmov_valid_f4;
   fmov_valid_f4 <= fmov_valid_f3;
   fmov_valid_f3 <= fmov_valid_f2;
   fmov_valid_f2 <= fmov_valid_m;
   fmov_valid_m  <= fmov_valid_e & `SPC5.dec.dec_fgu_valid_e;
   fmov_valid_e <= ((`SPC5.exu0.ect.cmov_d | siam0_d) & 
                    `SPC5.dec.dec_decode0_d&`SPC5.dec.del.fgu0_d) |
                    ((`SPC5.exu1.ect.cmov_d | siam1_d) & 
                    `SPC5.dec.dec_decode1_d&`SPC5.dec.del.fgu1_d);
   
   // fgu check bus

   // fcc_valid_fb doesn't assert for LDFSR. LDFSR gets checked by the LSU
   // checker

   fg_valid <= {(`SPC5.fgu.fac.fac_w1_tid_fb[2:0]==3'h7) && fg_cond_fb,
                (`SPC5.fgu.fac.fac_w1_tid_fb[2:0]==3'h6) && fg_cond_fb,
                (`SPC5.fgu.fac.fac_w1_tid_fb[2:0]==3'h5) && fg_cond_fb,
                (`SPC5.fgu.fac.fac_w1_tid_fb[2:0]==3'h4) && fg_cond_fb,
                (`SPC5.fgu.fac.fac_w1_tid_fb[2:0]==3'h3) && fg_cond_fb,
                (`SPC5.fgu.fac.fac_w1_tid_fb[2:0]==3'h2) && fg_cond_fb,
                (`SPC5.fgu.fac.fac_w1_tid_fb[2:0]==3'h1) && fg_cond_fb,
                (`SPC5.fgu.fac.fac_w1_tid_fb[2:0]==3'h0) && fg_cond_fb };
   

   fgu_valid_fb0      <= `SPC5.fgu_exu_w_vld_fx5[0] && !`SPC5.fgu.fpc.div_finish_int_fb;
   fgu_valid_fb1      <= `SPC5.fgu_exu_w_vld_fx5[1] && !`SPC5.fgu.fpc.div_finish_int_fb;

   // Fdiv
   div_special_cancel_f4[7:0] <= tid2onehot(`SPC5.fgu.fac.tid_fx3[2:0]) & 
                               {8{`SPC5.fgu.fac.q_div_default_res_fx3}};
   fg_fdiv_valid_fw <= `SPC5.fgu_divide_completion & ~div_special_cancel_f4 &
                       {8{~`SPC5.fgu.fpc.fpc_fpd_ieee_trap_fb}} &
                       {8{~`SPC5.fgu.fpc.fpc_fpd_unfin_fb}};

    
   // Used in CCX Stub ?
   inst0_e[31:0] <= `SPC5.dec.dec_inst0_d[31:0];
   inst1_e[31:0] <= `SPC5.dec.dec_inst1_d[31:0];

   // only fgu ops that are not loads/stores
   fgu0_e <= `SPC5.dec.del.decode_fgu0_d;  
   fgu1_e <= `SPC5.dec.del.decode_fgu1_d;

   // LSU logic 
   load_b <= load_m;
   load_m <= (load0_e | load1_e);

   load0_e <= (`SPC5.dec.dec_decode0_d & `SPC5.dec.del.lsu0_d & 
               `SPC5.dec.dcd0.dcd_load_d);

   load1_e <= (`SPC5.dec.dec_decode1_d & `SPC5.dec.del.lsu1_d & 
               `SPC5.dec.dcd1.dcd_load_d);

   lsu_tid_b[2:0] <= lsu_tid_m[2:0];
   lsu_tid_m[2:0] <= lsu_tid_e[2:0];

   lsu_complete_m[7:0] <= `SPC5.lsu_complete[7:0];
   lsu_complete_b[7:0] <= lsu_complete_m[7:0];

   lsu_data_w  <= lsu_data_b;
  
   // Divide destination logic ..
   sel_divide0_e <= (`SPC5.dec_decode0_d & 
                     ((`SPC5.pku.swl0.vld_d & `SPC5.pku.swl_divide_wait[0]) |
                      (`SPC5.pku.swl1.vld_d & `SPC5.pku.swl_divide_wait[1]) |
                      (`SPC5.pku.swl2.vld_d & `SPC5.pku.swl_divide_wait[2]) |
                      (`SPC5.pku.swl3.vld_d & `SPC5.pku.swl_divide_wait[3])));
   sel_divide1_e <= (`SPC5.dec_decode1_d & 
                     ((`SPC5.pku.swl4.vld_d & `SPC5.pku.swl_divide_wait[4]) |
                      (`SPC5.pku.swl5.vld_d & `SPC5.pku.swl_divide_wait[5]) |
                      (`SPC5.pku.swl6.vld_d & `SPC5.pku.swl_divide_wait[6]) |
                      (`SPC5.pku.swl7.vld_d & `SPC5.pku.swl_divide_wait[7])));


   dcd_fdest_e <= {`SPC5.dec.del.fdest1_d,`SPC5.dec.del.fdest0_d};
   dcd_idest_e <= {`SPC5.dec.del.idest1_d,`SPC5.dec.del.idest0_d};

   if (sel_divide0_e) begin // {
         div_idest[{1'b0, `SPC5.dec.del.tid0_e[1:0]}] <= dcd_idest_e[0];
         div_fdest[{1'b0, `SPC5.dec.del.tid0_e[1:0]}] <= dcd_fdest_e[0];
   end // }
   if (sel_divide1_e) begin // {
         div_idest[{1'b1, `SPC5.dec.del.tid1_e[1:0]}] <= dcd_idest_e[1];
         div_fdest[{1'b1, `SPC5.dec.del.tid1_e[1:0]}] <= dcd_fdest_e[1];
   end // }
                 

   // EX logic
   // Save EX tids for later use
   ex0_tid_m <= ex0_tid_e;
   ex1_tid_m <= ex1_tid_e;
   ex0_tid_b <= ex0_tid_m;
   ex1_tid_b <= ex1_tid_m;
   ex0_tid_w <= ex0_tid_b;
   ex1_tid_w <= ex1_tid_b;

   // EX Flush conditions
   ex_flush_w <= {ex_flush_b | {{4{(`SPC5.dec.dec_flush_b[1] | 
                                `SPC5.tlu_flush_exu_b[1])}},
                                {4{(`SPC5.dec.dec_flush_b[0] |
                                `SPC5.tlu_flush_exu_b[0])}}}};

   ex_flush_b <= {{4{`SPC5.dec.dec_flush_m[1]}},
                 {4{`SPC5.dec.dec_flush_m[0]}}};


   // ex_valid_f4 valid will only fire on return
   return_f4 <= return_w & ~(`SPC5.tlu_flush_ifu & real_exception);
   ex_valid_w <= ex_valid_b;

   // Cancel EX valid if it turns out to be asr/asi access for this tid 

   ex_valid_b <= ex_valid_m & ~ex_asr_access;


   ex_valid_m <=      { (ex1_tid_e == 2'h3) && ex1_valid_e,
                       (ex1_tid_e == 2'h2) && ex1_valid_e,
                       (ex1_tid_e == 2'h1) && ex1_valid_e,
                       (ex1_tid_e == 2'h0) && ex1_valid_e,
                       (ex0_tid_e == 2'h3) && ex0_valid_e,
                       (ex0_tid_e == 2'h2) && ex0_valid_e,
                       (ex0_tid_e == 2'h1) && ex0_valid_e,
                       (ex0_tid_e == 2'h0) && ex0_valid_e};
   

  // TLU delays for done and retries
  tlu_ccr_cwp_0_valid_last <= `SPC5.tlu.tlu_ccr_cwp_0_valid;
  tlu_ccr_cwp_1_valid_last <= `SPC5.tlu.tlu_ccr_cwp_1_valid;
  

end // END posedge gclk

// Return instruction is separated out of ex*_valid because CWP update is in
// W+1 for return new window is not available for IRF scan (nas_pipe) until
// W+2
assign return0 = `SPC5.exu0.rml.return_w & 
                 `SPC5.exu0.rml.inst_vld_w;
assign return1 = `SPC5.exu1.rml.return_w & 
                 `SPC5.exu1.rml.inst_vld_w;
assign return_w = {(ex1_tid_w == 2'h3) && return1,
                   (ex1_tid_w == 2'h2) && return1,
                   (ex1_tid_w == 2'h1) && return1,
                   (ex1_tid_w == 2'h0) && return1,
                   (ex0_tid_w == 2'h3) && return0,
                   (ex0_tid_w == 2'h2) && return0,
                   (ex0_tid_w == 2'h1) && return0,
                   (ex0_tid_w == 2'h0) && return0};


// Cancel EX valid if it turns out that exception (tlu flush) taken for
// this tid

// exu check bus
assign ex0_tid_e = `SPC5.exu0.ect_tid_lth_e[1:0];
assign ex0_valid_e = `SPC5.dec.dec_valid_e[0] & ~fgu0_e & ~load0_e &
                     ~retry0_e & ~done0_e;
assign ex1_tid_e = `SPC5.exu1.ect_tid_lth_e[1:0];
assign ex1_valid_e = `SPC5.dec.dec_valid_e[1] & ~fgu1_e & ~load1_e &
                     ~retry1_e & ~done1_e;

assign ex_asr_valid = `SPC5.lsu.dcc.asi_store_m & `SPC5.lsu.dcc.asi_sync_m ;

assign ex_asr_access ={(`SPC5.lsu.dcc.dcc_tid_m[2:0]==3'h7) & ex_asr_valid,
                       (`SPC5.lsu.dcc.dcc_tid_m[2:0]==3'h6) & ex_asr_valid,
                       (`SPC5.lsu.dcc.dcc_tid_m[2:0]==3'h5) & ex_asr_valid,
                       (`SPC5.lsu.dcc.dcc_tid_m[2:0]==3'h4) & ex_asr_valid,
                       (`SPC5.lsu.dcc.dcc_tid_m[2:0]==3'h3) & ex_asr_valid,
                       (`SPC5.lsu.dcc.dcc_tid_m[2:0]==3'h2) & ex_asr_valid,
                       (`SPC5.lsu.dcc.dcc_tid_m[2:0]==3'h1) & ex_asr_valid,
                       (`SPC5.lsu.dcc.dcc_tid_m[2:0]==3'h0) & ex_asr_valid};


// EXU valid is ex_valid_w, except flushes, delayed return, traps, and stfsr
// real_exception added because tlu_flush_ifu activates for second redirect
// of retry if TPC and TNPC are not verified as sequential
assign  real_exception =
	   {{4 {`SPC5.tlu.fls1.dec_exc_w | 
		`SPC5.tlu.fls1.exu_exc_w |
		`SPC5.tlu.fls1.lsu_exc_w | 
                `SPC5.tlu.fls1.bsee_req_w}},
	    {4 {`SPC5.tlu.fls0.dec_exc_w | 
		`SPC5.tlu.fls0.exu_exc_w |
		`SPC5.tlu.fls0.lsu_exc_w | 
                `SPC5.tlu.fls0.bsee_req_w}}};

// Do not assert ex_valid for block store instructions
wire [7:0] block_store_first_at_w = 
           {`SPC5.lsu.sbs7.bst_pend & `SPC5.lsu.sbs7.blk_inst_w, 
            `SPC5.lsu.sbs6.bst_pend & `SPC5.lsu.sbs6.blk_inst_w, 
            `SPC5.lsu.sbs5.bst_pend & `SPC5.lsu.sbs5.blk_inst_w, 
            `SPC5.lsu.sbs4.bst_pend & `SPC5.lsu.sbs4.blk_inst_w, 
            `SPC5.lsu.sbs3.bst_pend & `SPC5.lsu.sbs3.blk_inst_w, 
            `SPC5.lsu.sbs2.bst_pend & `SPC5.lsu.sbs2.blk_inst_w, 
            `SPC5.lsu.sbs1.bst_pend & `SPC5.lsu.sbs1.blk_inst_w, 
            `SPC5.lsu.sbs0.bst_pend & `SPC5.lsu.sbs0.blk_inst_w};

// But inject a valid for a block store that's done...
reg [7:0] block_store_w;
always @(posedge `BENCH_SPC5_GCLK) begin
    block_store_w[7:0] <= `SPC5.lsu.lsu_block_store_b[7:0];
    lsu_trap_flush_d <=  `SPC5.lsu_trap_flush[7:0];
end

wire [7:0] block_store_inject_at_w = 
                                    ~`SPC5.lsu.lsu_block_store_b[7:0] & 
                                    block_store_w[7:0] &
                                    {~`SPC5.lsu.sbs7.bst_kill,
                                     ~`SPC5.lsu.sbs6.bst_kill,
                                     ~`SPC5.lsu.sbs5.bst_kill,
                                     ~`SPC5.lsu.sbs4.bst_kill,
                                     ~`SPC5.lsu.sbs3.bst_kill,
                                     ~`SPC5.lsu.sbs2.bst_kill,
                                     ~`SPC5.lsu.sbs1.bst_kill,
                                     ~`SPC5.lsu.sbs0.bst_kill};

assign ex_valid = (((ex_valid_w & ~ex_flush_w & ~return_w & ~block_store_first_at_w & ~exception_w &
                     ~({{4{`SPC5.tlu.fls1.exu_exc_b & `SPC5.tlu.fls1.beat_two_b}},
                        {4{`SPC5.tlu.fls0.exu_exc_b & `SPC5.tlu.fls0.beat_two_b}}}) &
                     ~{(`SPC5.fgu.fac.tid_fx3[2:0]==3'h7) & `SPC5.fgu.fpc.fsr_store_fx3,
                       (`SPC5.fgu.fac.tid_fx3[2:0]==3'h6) & `SPC5.fgu.fpc.fsr_store_fx3,
                       (`SPC5.fgu.fac.tid_fx3[2:0]==3'h5) & `SPC5.fgu.fpc.fsr_store_fx3,
                       (`SPC5.fgu.fac.tid_fx3[2:0]==3'h4) & `SPC5.fgu.fpc.fsr_store_fx3,
                       (`SPC5.fgu.fac.tid_fx3[2:0]==3'h3) & `SPC5.fgu.fpc.fsr_store_fx3,
                       (`SPC5.fgu.fac.tid_fx3[2:0]==3'h2) & `SPC5.fgu.fpc.fsr_store_fx3,
                       (`SPC5.fgu.fac.tid_fx3[2:0]==3'h1) & `SPC5.fgu.fpc.fsr_store_fx3,
                       (`SPC5.fgu.fac.tid_fx3[2:0]==3'h0) & `SPC5.fgu.fpc.fsr_store_fx3}) | 
                     block_store_inject_at_w) & 
                   ~(`SPC5.tlu_flush_ifu & real_exception)) | return_f4;

assign exception_w = {{4 {`SPC5.tlu.fls1.exc_for_w}} | 
                      `SPC5.tlu.fls1.bsee_req[3:0] | 
		      `SPC5.tlu.fls1.pdist_ecc_w[3:0],
		      {4 {`SPC5.tlu.fls0.exc_for_w}} |
		      `SPC5.tlu.fls0.bsee_req[3:0] | 
		      `SPC5.tlu.fls0.pdist_ecc_w[3:0]};

// imul check bus - includes imul, save, restore instructions
assign imul_valid = {(`SPC5.exu1.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb1,
                     (`SPC5.exu1.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb1,
                     (`SPC5.exu1.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb1,
                     (`SPC5.exu1.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb1,
                     (`SPC5.exu0.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb0,
                     (`SPC5.exu0.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb0,
                     (`SPC5.exu0.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb0,
                     (`SPC5.exu0.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb0};

// qualify this signal with fgu_err. If fgu_err is encountered, deassert
//fg_cond_fb, so we don't send a step to Riesling.

// FGU conditions
wire fg_cond_fb_pre_err = `SPC5.fgu.fpc.fpc_w1_ul_vld_fb | fcc_valid_fb | 
                     (fmov_valid_fb & ~fg_flush_fb) |
                     (`SPC5.fgu.fac.fsr_w1_vld_fb[1]);  // covers ST(X)FSR, which clears FSR.ftt

assign fg_cond_fb = fg_cond_fb_pre_err  & ~fgu_err_fb;

// Idiv/Fdiv signals

assign fgu_idiv_valid = fg_div_valid & div_idest;


assign fgu_fdiv_valid = fg_fdiv_valid_fw & div_fdest;


// Lsu signals needed to check lsu results

assign lsu_valid     = lsu_check | lsu_data_w;

assign fg_div_valid  = `SPC5.fgu_divide_completion & ~div_special_cancel_f4;
   
// State machine asserts lsu_check for LD hit/miss
always @(posedge `BENCH_SPC5_GCLK) begin
  for (i=0; i<=7;i=i+1) begin // {
      lsu_check[i] <= 1'b0;
      case (lsu_state[i])
        1'b0: // IDLE state
              begin
                // LD hit
                if (lsu_ld_valid & lsu_tid_dec_b[i] & load_b) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - normal case
                else if (lsu_ld_valid & lsu_tid_dec_b[i] & lsu_complete_b[i]) 
                begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - LDD or Block LD or SWAP
                else if (lsu_ld_valid & lsu_tid_dec_b[i]) begin
                  lsu_state[i] <= 1'b1; // VALID state
                end
// Added a new term to handle STB uncorrectable errors on atomic or asi stores that are synced
//Send a complete if an atomic is squashed.
//lsu_trap_flush is asserted a cycle after the block_store_kill is asserted
		else if (`SPC5.lsu.dcc.sync_st[i] & `SPC5.lsu_block_store_kill[i] & ~lsu_trap_flush_d[i])
		begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
                
              end
        1'b1: // VALID state
              begin
                if ((lsu_complete_b[i])) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
              end
      endcase
  end // }
end

   
assign lsu_tid   = `SPC5.lsu.dcc.ld_tid_b[2:0];
// Don't assert LSU_complete in case of dtlb or irf errors

assign lsu_valid_b = (`SPC5.lsu.dcc.pref_inst_b & 
                      ~(dec_flush_lb | `SPC5.lsu.dcc.pipe_flush_b | 
			`SPC5.lsu_dtdp_err_b | `SPC5.lsu_dttp_err_b |
			`SPC5.lsu_dtmh_err_b | `SPC5.lsu.dcc.exu_error_b));

assign lsu_data_b[7:0] = { (lsu_tid == 3'h7) & lsu_valid_b,
                          (lsu_tid == 3'h6) & lsu_valid_b,
                          (lsu_tid == 3'h5) & lsu_valid_b,
                          (lsu_tid == 3'h4) & lsu_valid_b,
                          (lsu_tid == 3'h3) & lsu_valid_b,
                          (lsu_tid == 3'h2) & lsu_valid_b,
                          (lsu_tid == 3'h1) & lsu_valid_b,
                          (lsu_tid == 3'h0) & lsu_valid_b};

assign  lsu_tid_dec_b[0] = `SPC5.lsu.dcc.ld_tid_b[2:0] == 3'd0;
assign  lsu_tid_dec_b[1] = `SPC5.lsu.dcc.ld_tid_b[2:0] == 3'd1;
assign  lsu_tid_dec_b[2] = `SPC5.lsu.dcc.ld_tid_b[2:0] == 3'd2;
assign  lsu_tid_dec_b[3] = `SPC5.lsu.dcc.ld_tid_b[2:0] == 3'd3;
assign  lsu_tid_dec_b[4] = `SPC5.lsu.dcc.ld_tid_b[2:0] == 3'd4;
assign  lsu_tid_dec_b[5] = `SPC5.lsu.dcc.ld_tid_b[2:0] == 3'd5;
assign  lsu_tid_dec_b[6] = `SPC5.lsu.dcc.ld_tid_b[2:0] == 3'd6;
assign  lsu_tid_dec_b[7] = `SPC5.lsu.dcc.ld_tid_b[2:0] == 3'd7;

assign  lsu_ld_valid = (`SPC5.lsu.dcc.exu_ld_vld_b |`SPC5.lsu.dcc.fgu_fld_vld_b) &
                       ~(`SPC5.lsu.dcc.flush_all_b & `SPC5.lsu.dcc.ld_inst_vld_b);
assign  dec_flush_lb = `SPC5.dec.dec_flush_lb | `SPC5.tlu_flush_lsu_b; 


// LSU interface to CCX stub

assign  exu_lsu_valid = `SPC5.dec.del.lsu_valid_e;
assign  exu_lsu_addr[47:0] = `SPC5.exu_lsu_address_e[47:0];
assign  exu_lsu_tid[2:0] = lsu_tid_e[2:0];
assign  exu_lsu_regid[4:0] = `SPC5.dec.dec_lsu_rd_e[4:0];
assign  exu_lsu_data[63:0] = `SPC5.exu_lsu_store_data_e[63:0];
assign  exu_lsu_instr[31:0] =   ({32{`SPC5.dec.dec_lsu_sel0_e}} & 
                                inst0_e[31:0]) |
                                ({32{~`SPC5.dec.dec_lsu_sel0_e}} & 
                                inst1_e[31:0]);
assign ld_inst_d = `SPC5.dec.dec_ld_inst_d;

///////////////////////////////////////////////////////////////////////////////
// Debugging Instruction Opcodes Pipeline
///////////////////////////////////////////////////////////////////////////////


   reg [31:0] op_0_w;
   reg [31:0] op_1_w;
   reg [31:0] op_2_w;
   reg [31:0] op_3_w;
   reg [31:0] op_4_w;
   reg [31:0] op_5_w;
   reg [31:0] op_6_w;
   reg [31:0] op_7_w;

   reg [31:0] op0_b;
   reg [31:0] op0_m;
   reg [31:0] op0_e;
   reg [31:0] op0_d;

   reg [31:0] op1_b;
   reg [31:0] op1_m;
   reg [31:0] op1_e;
   reg [31:0] op1_d;

   reg [255:0] inst0_string_w;
   reg [255:0] inst0_string_b;
   reg [255:0] inst0_string_m;
   reg [255:0] inst0_string_e;
   reg [255:0] inst0_string_d;

   reg [255:0] inst1_string_w;
   reg [255:0] inst1_string_b;
   reg [255:0] inst1_string_m;
   reg [255:0] inst1_string_e;
   reg [255:0] inst1_string_d;

   reg [255:0] inst0_string_p;
   reg [255:0] inst1_string_p;
   reg [255:0] inst2_string_p;
   reg [255:0] inst3_string_p;
   reg [255:0] inst4_string_p;
   reg [255:0] inst5_string_p;
   reg [255:0] inst6_string_p;
   reg [255:0] inst7_string_p;

initial begin
    op_0_w = 32'b0;
    op_1_w = 32'b0;
    op_2_w = 32'b0;
    op_3_w = 32'b0;
    op_4_w = 32'b0;
    op_5_w = 32'b0;
    op_6_w = 32'b0;
    op_7_w = 32'b0;
end

always @(posedge `BENCH_SPC5_GCLK) begin // {
  op_0_w <= ({32 { select_pc_b[0]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[0]}} & op_0_w[31:0]) ;
  op_1_w <= ({32 { select_pc_b[1]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[1]}} & op_1_w[31:0]) ;
  op_2_w <= ({32 { select_pc_b[2]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[2]}} & op_2_w[31:0]) ;
  op_3_w <= ({32 { select_pc_b[3]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[3]}} & op_3_w[31:0]) ;
  op_4_w <= ({32 { select_pc_b[4]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[4]}} & op_4_w[31:0]) ;
  op_5_w <= ({32 { select_pc_b[5]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[5]}} & op_5_w[31:0]) ;
  op_6_w <= ({32 { select_pc_b[6]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[6]}} & op_6_w[31:0]) ;
  op_7_w <= ({32 { select_pc_b[7]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[7]}} & op_7_w[31:0]) ;

  op0_b <= op0_m;
  op0_m <= op0_e;
  op0_e <= op0_d;
  op0_d <= `SPC5.dec.ded0.decode_mux[31:0];

  op1_b <= op1_m;
  op1_m <= op1_e;
  op1_e <= op1_d;
  op1_d <= `SPC5.dec.ded1.decode_mux[31:0];

  inst0_string_w<=inst0_string_b;
  inst0_string_b<=inst0_string_m;
  inst0_string_m<=inst0_string_e;
  inst0_string_e<=inst0_string_d;
  inst0_string_d<=xlate(`SPC5.dec.ded0.decode_mux[31:0]);

  inst1_string_w<=inst1_string_b;
  inst1_string_b<=inst1_string_m;
  inst1_string_m<=inst1_string_e;
  inst1_string_e<=inst1_string_d;
  inst1_string_d<=xlate(`SPC5.dec.ded1.decode_mux[31:0]);

// instructions for each thread at pick
  inst0_string_p<=xlate(`SPC5.ifu_ibu.ibf0.buf0_in[31:0]);
  inst1_string_p<=xlate(`SPC5.ifu_ibu.ibf1.buf0_in[31:0]);
  inst2_string_p<=xlate(`SPC5.ifu_ibu.ibf2.buf0_in[31:0]);
  inst3_string_p<=xlate(`SPC5.ifu_ibu.ibf3.buf0_in[31:0]);
  inst4_string_p<=xlate(`SPC5.ifu_ibu.ibf4.buf0_in[31:0]);
  inst5_string_p<=xlate(`SPC5.ifu_ibu.ibf5.buf0_in[31:0]);
  inst6_string_p<=xlate(`SPC5.ifu_ibu.ibf6.buf0_in[31:0]);
  inst7_string_p<=xlate(`SPC5.ifu_ibu.ibf7.buf0_in[31:0]);

end //}

///////////////////////////////////////////////////////////////////////////////
// Functions 
///////////////////////////////////////////////////////////////////////////////
function [2:0] onehot2tid;
   input [7:0] onehot;

   begin

   if      (onehot[7:0]==8'b00000001) onehot2tid[2:0] = 3'b000;
   else if (onehot[7:0]==8'b00000010) onehot2tid[2:0] = 3'b001;
   else if (onehot[7:0]==8'b00000100) onehot2tid[2:0] = 3'b010;
   else if (onehot[7:0]==8'b00001000) onehot2tid[2:0] = 3'b011;
   else if (onehot[7:0]==8'b00010000) onehot2tid[2:0] = 3'b100;
   else if (onehot[7:0]==8'b00100000) onehot2tid[2:0] = 3'b101;
   else if (onehot[7:0]==8'b01000000) onehot2tid[2:0] = 3'b110;
   else if (onehot[7:0]==8'b10000000) onehot2tid[2:0] = 3'b111;
   
   end
endfunction

function [7:0] tid2onehot;
   input [2:0] tid;

   begin

   if      (tid[2:0]==3'b000) tid2onehot[7:0] = 8'b00000001;
   else if (tid[2:0]==3'b001) tid2onehot[7:0] = 8'b00000010;
   else if (tid[2:0]==3'b010) tid2onehot[7:0] = 8'b00000100;
   else if (tid[2:0]==3'b011) tid2onehot[7:0] = 8'b00001000;
   else if (tid[2:0]==3'b100) tid2onehot[7:0] = 8'b00010000;
   else if (tid[2:0]==3'b101) tid2onehot[7:0] = 8'b00100000;
   else if (tid[2:0]==3'b110) tid2onehot[7:0] = 8'b01000000;
   else if (tid[2:0]==3'b111) tid2onehot[7:0] = 8'b10000000;
   
   end
endfunction

//---------------------

function [255:0] xlate;
   input [31:0] inst;

   begin
     casex(inst[31:0])
32'b10xxxxx110100xxxxx001000011xxxxx : xlate[255:0]="FADDq";
32'b10xxxxx110100xxxxx001000111xxxxx : xlate[255:0]="FSUBq";
32'b10000xx110101xxxxx001010011xxxxx : xlate[255:0]="FCMPq";
32'b10000xx110101xxxxx001010111xxxxx : xlate[255:0]="FCMPEq";
32'b10xxxxx110100xxxxx011001101xxxxx : xlate[255:0]="FsTOq";
32'b10xxxxx110100xxxxx011001110xxxxx : xlate[255:0]="FdTOq";
32'b10xxxxx110100xxxxx010001100xxxxx : xlate[255:0]="FxTOq";
32'b10xxxxx110100xxxxx011001100xxxxx : xlate[255:0]="FiTOq";
32'b10xxxxx110100xxxxx000000011xxxxx : xlate[255:0]="FMOVq";
32'b10xxxxx110100xxxxx000000111xxxxx : xlate[255:0]="FNEGq";
32'b10xxxxx110100xxxxx000001011xxxxx : xlate[255:0]="FABSq";
32'b10xxxxx110100xxxxx001001011xxxxx : xlate[255:0]="FMULq";
32'b10xxxxx110100xxxxx001101110xxxxx : xlate[255:0]="FdMULq";
32'b10xxxxx110100xxxxx001001111xxxxx : xlate[255:0]="FDIVq";
32'b10xxxxx110100xxxxx000101011xxxxx : xlate[255:0]="FSQRTq";
32'b10xxxxx1101010xxxx0xx100111xxxxx : xlate[255:0]="FMOVrQa";
32'b10xxxxx1101010xxxx0x1x00111xxxxx : xlate[255:0]="FMOVrQb";
32'b10xxxxx110100xxxxx011010011xxxxx : xlate[255:0]="FqTOi";
32'b10xxxxx110100xxxxx010000011xxxxx : xlate[255:0]="FqTOx";
32'b10xxxxx110100xxxxx011000111xxxxx : xlate[255:0]="FqTOs";
32'b10xxxxx110100xxxxx011001011xxxxx : xlate[255:0]="FqTOd";
32'b11xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQF";
32'b11xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFi";
32'b11xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQFA";
32'b11xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFAi";
32'b11xxxxx100110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFi";
32'b11xxxxx100110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQF";
32'b11xxxxx110110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQFA";
32'b11xxxxx110110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFAi";
32'b10xxxxx1101010xxxxxxx000011xxxxx : xlate[255:0]="FMOVQcc";
32'b10xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADD";
32'b10xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDcc";
32'b10xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDC";
32'b10xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDCcc";
32'b10xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDi";
32'b10xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDcci";
32'b10xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCi";
32'b10xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCcci";
32'b00x0xx1011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr1";
32'b00x0x1x011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr2";
32'b00xx000110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfccA";
32'b00xx1xx110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc1";
32'b00xxx1x110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc2";
32'b00xxxx1110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc3";
32'b00xx000101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfccA";
32'b00xx1xx101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc1";
32'b00xxx1x101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc2";
32'b00xxxx1101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc3";
32'b00xx000010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BiccA";
32'b00xx1xx010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc1";
32'b00xxx1x010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc2";
32'b00xxxx1010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc3";
32'b00xx000001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPccA";
32'b00xx1xx001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc1";
32'b00xxx1x001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc2";
32'b00xxxx1001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc3";
32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="CALL";
32'b11xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASA";
32'b11xxxxx111110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASXA";
32'b11xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASAi";
32'b11xxxxx111110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASXAi";
32'b10xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIV";
32'b10xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIV";
32'b10xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVcc";
32'b10xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVcc";
32'b10xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVi";
32'b10xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVi";
32'b10xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVcci";
32'b10xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVcci";
32'b1000000111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="DONE";
32'b1000001111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RETRY";
32'b10xxxxx110100xxxxx001000001xxxxx : xlate[255:0]="FADDs";
32'b10xxxxx110100xxxxx001000010xxxxx : xlate[255:0]="FADDd";
32'b10xxxxx110100xxxxx001000101xxxxx : xlate[255:0]="FSUBs";
32'b10xxxxx110100xxxxx001000110xxxxx : xlate[255:0]="FSUBd";
32'b10000xx110101xxxxx001010001xxxxx : xlate[255:0]="FCMPs";
32'b10000xx110101xxxxx001010010xxxxx : xlate[255:0]="FCMPd";
32'b10000xx110101xxxxx001010101xxxxx : xlate[255:0]="FCMPEs";
32'b10000xx110101xxxxx001010110xxxxx : xlate[255:0]="FCMPEd";
32'b10xxxxx110100xxxxx010000001xxxxx : xlate[255:0]="FsTOx";
32'b10xxxxx110100xxxxx010000010xxxxx : xlate[255:0]="FdTOx";
32'b10xxxxx110100xxxxx011010001xxxxx : xlate[255:0]="FsTOi";
32'b10xxxxx110100xxxxx011010010xxxxx : xlate[255:0]="FdTOi";
32'b10xxxxx110100xxxxx011001001xxxxx : xlate[255:0]="FsTOd";
32'b10xxxxx110100xxxxx011000110xxxxx : xlate[255:0]="FdTOs";
32'b10xxxxx110100xxxxx010000100xxxxx : xlate[255:0]="FxTOs";
32'b10xxxxx110100xxxxx010001000xxxxx : xlate[255:0]="FxTOd";
32'b10xxxxx110100xxxxx011000100xxxxx : xlate[255:0]="FiTOs";
32'b10xxxxx110100xxxxx011001000xxxxx : xlate[255:0]="FiTOd";
32'b10xxxxx110100xxxxx000000001xxxxx : xlate[255:0]="FMOVs";
32'b10xxxxx110100xxxxx000000010xxxxx : xlate[255:0]="FMOVd";
32'b10xxxxx110100xxxxx000000101xxxxx : xlate[255:0]="FNEGs";
32'b10xxxxx110100xxxxx000000110xxxxx : xlate[255:0]="FNEGd";
32'b10xxxxx110100xxxxx000001001xxxxx : xlate[255:0]="FABSs";
32'b10xxxxx110100xxxxx000001010xxxxx : xlate[255:0]="FABSd";
32'b10xxxxx110100xxxxx001001001xxxxx : xlate[255:0]="FMULs";
32'b10xxxxx110100xxxxx001001010xxxxx : xlate[255:0]="FMULd";
32'b10xxxxx110100xxxxx001101001xxxxx : xlate[255:0]="FsMULd";
32'b10xxxxx110100xxxxx001001101xxxxx : xlate[255:0]="FDIVs";
32'b10xxxxx110100xxxxx001001110xxxxx : xlate[255:0]="FDIVd";
32'b10xxxxx110100xxxxx000101001xxxxx : xlate[255:0]="FSQRTs";
32'b10xxxxx110100xxxxx000101010xxxxx : xlate[255:0]="FSQRTd";
32'b10xxxxx111011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSH";
32'b10xxxxx111011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="FLUSHi";
32'b10xxxxx101011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSHw";
32'b10xxxxx111000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="JMPL";
32'b10xxxxx111000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="JMPLi";
32'b11xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDF";
32'b11xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDF";
32'b1100000100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFSR";
32'b1100001100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXFSR";
32'b11xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFi";
32'b11xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFi";
32'b1100000100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFSRi";
32'b1100001100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXFSRi";
32'b11xxxxx110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFA";
32'b11xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDFA";
32'b11xxxxx110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFAi";
32'b11xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFAi";
32'b11xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSB";
32'b11xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSH";
32'b11xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSW";
32'b11xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUB";
32'b11xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUH";
32'b11xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUW";
32'b11xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDX";
32'b11xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDD";
32'b11xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBi";
32'b11xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHi";
32'b11xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWi";
32'b11xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBi";
32'b11xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHi";
32'b11xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWi";
32'b11xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXi";
32'b11xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDi";
32'b11xxxxx011001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSBA";
32'b11xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSHA";
32'b11xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSWA";
32'b11xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUBA";
32'b11xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUHA";
32'b11xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUWA";
32'b11xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXA";
32'b11xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDA";
32'b11xxxxx011001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBAi";
32'b11xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHAi";
32'b11xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWAi";
32'b11xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBAi";
32'b11xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHAi";
32'b11xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWAi";
32'b11xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXAi";
32'b11xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDAi";
32'b11xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUB";
32'b11xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBi";
32'b11xxxxx011101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUBA";
32'b11xxxxx011101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBAi";
32'b10xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="AND";
32'b10xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDcc";
32'b10xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDN";
32'b10xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDNcc";
32'b10xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="OR";
32'b10xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORcc";
32'b10xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORN";
32'b10xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORNcc";
32'b10xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XOR";
32'b10xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XORcc";
32'b10xxxxx000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNOR";
32'b10xxxxx010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNORcc";
32'b10xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDi";
32'b10xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDcci";
32'b10xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNi";
32'b10xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNcci";
32'b10xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORi";
32'b10xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORcci";
32'b10xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNi";
32'b10xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNcci";
32'b10xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORi";
32'b10xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORcci";
32'b10xxxxx000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORi";
32'b10xxxxx010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORcci";
32'b1000000101000011111xxxxxxxxxxxxx : xlate[255:0]="MEMBAR";
32'b1000000101000011110xxxxxxxxxxxxx : xlate[255:0]="STBAR";
32'b10xxxxx101000000000xxxxxxxxxxxxx : xlate[255:0]="RDY";
32'b10xxxxx101000000100xxxxxxxxxxxxx : xlate[255:0]="RDCCR";
32'b10xxxxx101000000110xxxxxxxxxxxxx : xlate[255:0]="RDASI";
32'b10xxxxx101000001000xxxxxxxxxxxxx : xlate[255:0]="RDTICK";
32'b10xxxxx101000001010xxxxxxxxxxxxx : xlate[255:0]="RDPC";
32'b10xxxxx101000001100xxxxxxxxxxxxx : xlate[255:0]="RDFPRS";
32'b10xxxxx101000100110xxxxxxxxxxxxx : xlate[255:0]="RDGSR";
32'b10xxxxx101000100000xxxxxxxxxxxxx : xlate[255:0]="RDPCR";
32'b10xxxxx101000100010xxxxxxxxxxxxx : xlate[255:0]="RDPIC";
32'b10xxxxx1101010xxxx0xx000001xxxxx : xlate[255:0]="FMOVSfcc";
32'b10xxxxx1101010xxxx1xx000001xxxxx : xlate[255:0]="FMOVSxcc";
32'b10xxxxx1101010xxxx0xx000010xxxxx : xlate[255:0]="FMOVDfcc";
32'b10xxxxx1101010xxxx1xx000010xxxxx : xlate[255:0]="FMOVDxcc";
32'b10xxxxx110101xxxxx0xx100101xxxxx : xlate[255:0]="FMOVrS1";
32'b10xxxxx110101xxxxx0x1x00101xxxxx : xlate[255:0]="FMOVrS2";
32'b10xxxxx110101xxxxx0xx100110xxxxx : xlate[255:0]="FMOVrD1";
32'b10xxxxx110101xxxxx0x1x00110xxxxx : xlate[255:0]="FMOVrD2";
32'b10xxxxx1011001xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVxcc";
32'b10xxxxx1011001xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVxcci";
32'b10xxxxx1011000xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVfcc";
32'b10xxxxx1011000xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVfcci";
32'b10xxxxx101111xxxxx0xx1xxxxxxxxxx : xlate[255:0]="MOVR1";
32'b10xxxxx101111xxxxx0x1xxxxxxxxxxx : xlate[255:0]="MOVR2";
32'b10xxxxx101111xxxxx1xx1xxxxxxxxxx : xlate[255:0]="MOVRi1";
32'b10xxxxx101111xxxxx1x1xxxxxxxxxxx : xlate[255:0]="MOVRi2";
32'b10xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULX";
32'b10xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVX";
32'b10xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVX";
32'b10xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULXi";
32'b10xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVXi";
32'b10xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVXi";
32'b10xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMUL";
32'b10xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMUL";
32'b10xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMULcc";
32'b10xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMULcc";
32'b10xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULi";
32'b10xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULi";
32'b10xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULcci";
32'b10xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULcci";
32'b10xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULScc";
32'b10xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULScci";
32'b10xxxxx101110000000xxxxxxxxxxxxx : xlate[255:0]="POPC";
32'b10xxxxx101110000001xxxxxxxxxxxxx : xlate[255:0]="POPCi";
32'b11xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCH";
32'b11xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHi";
32'b11xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCHA";
32'b11xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHAi";
32'b10xxxxx101010xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDPR";
32'b10xxxxx101001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDHPR";
32'b10xxxxx111001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RETURN";
32'b10xxxxx111001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RETURNi";
32'b10xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SAVE";
32'b10xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SAVEi";
32'b10xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RESTORE";
32'b10xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RESTOREi";
32'b1000000110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="SAVED";
32'b1000001110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RESTORED";
32'b00xxxxx100xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="SETHI";
32'b10xxxxx100101xxxxx00xxxxxxxxxxxx : xlate[255:0]="SLL";
32'b10xxxxx100110xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRL";
32'b10xxxxx100111xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRA";
32'b10xxxxx100101xxxxx01xxxxxxxxxxxx : xlate[255:0]="SLLX";
32'b10xxxxx100110xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRLX";
32'b10xxxxx100111xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRAX";
32'b10xxxxx100101xxxxx10xxxxxxxxxxxx : xlate[255:0]="SLLi";
32'b10xxxxx100110xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRLi";
32'b10xxxxx100111xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRAi";
32'b10xxxxx100101xxxxx11xxxxxxxxxxxx : xlate[255:0]="SLLXi";
32'b10xxxxx100110xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRLXi";
32'b10xxxxx100111xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRAXi";
32'b11xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STF";
32'b11xxxxx100111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDF";
32'b1100000100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFSR";
32'b1100001100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXFSR";
32'b11xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFi";
32'b11xxxxx100111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFi";
32'b1100000100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFSRi";
32'b1100001100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXFSRi";
32'b11xxxxx110100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFA";
32'b11xxxxx110111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDFA";
32'b11xxxxx110100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFAi";
32'b11xxxxx110111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFAi";
32'b11xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STB";
32'b11xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STH";
32'b11xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STW";
32'b11xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STX";
32'b11xxxx0000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STD";
32'b11xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBi";
32'b11xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHi";
32'b11xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWi";
32'b11xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXi";
32'b11xxxx0000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDi";
32'b11xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STBA";
32'b11xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STHA";
32'b11xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STWA";
32'b11xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXA";
32'b11xxxx0010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDA";
32'b11xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBAi";
32'b11xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHAi";
32'b11xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWAi";
32'b11xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXAi";
32'b11xxxx0010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDAi";
32'b10xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUB";
32'b10xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBcc";
32'b10xxxxx001100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBC";
32'b10xxxxx011100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBCcc";
32'b10xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBi";
32'b10xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBcci";
32'b10xxxxx001100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCi";
32'b10xxxxx011100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCcci";
32'b11xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAP";
32'b11xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPi";
32'b11xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAPA";
32'b11xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPAi";
32'b10xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDcc";
32'b10xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDccTV";
32'b10xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDcci";
32'b10xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDccTVi";
32'b10xxxxx100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBcc";
32'b10xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBccTV";
32'b10xxxxx100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBcci";
32'b10xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBccTVi";
32'b10xxxxx111010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TCC";
32'b10xxxxx111010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TCCi";
32'b10xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPR";
32'b10xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPRi";
32'b10xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRHPR";
32'b10xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRHPRi";
32'b1000000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRY";
32'b1000010110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRCCR";
32'b1000011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRASI";
32'b1000110110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRFPRS";
32'b1010011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRGSR";
32'b1010000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPCR";
32'b1010001110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPIC";
32'b1000000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRYi";
32'b1000010110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRCCRi";
32'b1000011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRASIi";
32'b1000110110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRFPRSi";
32'b1010011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRGSRi";
32'b1010000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPCRi";
32'b1010001110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPICi";
32'b1001111110000000001xxxxxxxxxxxxx : xlate[255:0]="SIR";
32'b10xxxxx110110xxxxx001010000xxxxx : xlate[255:0]="FPADD16";
32'b10xxxxx110110xxxxx001010001xxxxx : xlate[255:0]="FPADD16S";
32'b10xxxxx110110xxxxx001010010xxxxx : xlate[255:0]="FPADD32";
32'b10xxxxx110110xxxxx001010011xxxxx : xlate[255:0]="FPADD32S";
32'b10xxxxx110110xxxxx001010100xxxxx : xlate[255:0]="FPSUB16";
32'b10xxxxx110110xxxxx001010101xxxxx : xlate[255:0]="FPSUB16S";
32'b10xxxxx110110xxxxx001010110xxxxx : xlate[255:0]="FPSUB32";
32'b10xxxxx110110xxxxx001010111xxxxx : xlate[255:0]="FPSUB32S";
32'b10xxxxx110110xxxxx000111011xxxxx : xlate[255:0]="FPACK16";
32'b10xxxxx110110xxxxx000111010xxxxx : xlate[255:0]="FPACK32";
32'b10xxxxx110110xxxxx000111101xxxxx : xlate[255:0]="FPACKFIX";
32'b10xxxxx110110xxxxx001001101xxxxx : xlate[255:0]="FEXPAND";
32'b10xxxxx110110xxxxx001001011xxxxx : xlate[255:0]="FPMERGE";
32'b10xxxxx110110xxxxx000110001xxxxx : xlate[255:0]="FMUL8x16";
32'b10xxxxx110110xxxxx000110011xxxxx : xlate[255:0]="FMUL8x16AU";
32'b10xxxxx110110xxxxx000110101xxxxx : xlate[255:0]="FMUL8x16AL";
32'b10xxxxx110110xxxxx000110110xxxxx : xlate[255:0]="FMUL8SUx16";
32'b10xxxxx110110xxxxx000110111xxxxx : xlate[255:0]="FMUL8ULx16";
32'b10xxxxx110110xxxxx000111000xxxxx : xlate[255:0]="FMULD8SUx16";
32'b10xxxxx110110xxxxx000111001xxxxx : xlate[255:0]="FMULD8ULx16";
32'b10xxxxx110110xxxxx000011000xxxxx : xlate[255:0]="ALIGNADDRESS";
32'b10xxxxx110110xxxxx000011010xxxxx : xlate[255:0]="ALIGNADDRESS_LITTLE";
32'b10xxxxx110110xxxxx000011001xxxxx : xlate[255:0]="BMASK";
32'b10xxxxx110110xxxxx001001000xxxxx : xlate[255:0]="FALIGNDATA";
32'b10xxxxx110110xxxxx001001100xxxxx : xlate[255:0]="BSHUFFLE";
32'b10xxxxx110110xxxxx001100000xxxxx : xlate[255:0]="FZERO";
32'b10xxxxx110110xxxxx001100001xxxxx : xlate[255:0]="FZEROS";
32'b10xxxxx110110xxxxx001111110xxxxx : xlate[255:0]="FONE";
32'b10xxxxx110110xxxxx001111111xxxxx : xlate[255:0]="FONES";
32'b10xxxxx110110xxxxx001110100xxxxx : xlate[255:0]="FSRC1";
32'b10xxxxx110110xxxxx001110101xxxxx : xlate[255:0]="FSRC1S";
32'b10xxxxx110110xxxxx001111000xxxxx : xlate[255:0]="FSRC2";
32'b10xxxxx110110xxxxx001111001xxxxx : xlate[255:0]="FSRC2S";
32'b10xxxxx110110xxxxx001101010xxxxx : xlate[255:0]="FNOT1";
32'b10xxxxx110110xxxxx001101011xxxxx : xlate[255:0]="FNOT1S";
32'b10xxxxx110110xxxxx001100110xxxxx : xlate[255:0]="FNOT2";
32'b10xxxxx110110xxxxx001100111xxxxx : xlate[255:0]="FNOT2S";
32'b10xxxxx110110xxxxx001111100xxxxx : xlate[255:0]="FOR";
32'b10xxxxx110110xxxxx001111101xxxxx : xlate[255:0]="FORS";
32'b10xxxxx110110xxxxx001100010xxxxx : xlate[255:0]="FNOR";
32'b10xxxxx110110xxxxx001100011xxxxx : xlate[255:0]="FNORS";
32'b10xxxxx110110xxxxx001110000xxxxx : xlate[255:0]="FAND";
32'b10xxxxx110110xxxxx001110001xxxxx : xlate[255:0]="FANDS";
32'b10xxxxx110110xxxxx001101110xxxxx : xlate[255:0]="FNAND";
32'b10xxxxx110110xxxxx001101111xxxxx : xlate[255:0]="FNANDS";
32'b10xxxxx110110xxxxx001101100xxxxx : xlate[255:0]="FXOR";
32'b10xxxxx110110xxxxx001101101xxxxx : xlate[255:0]="FXORS";
32'b10xxxxx110110xxxxx001110010xxxxx : xlate[255:0]="FXNOR";
32'b10xxxxx110110xxxxx001110011xxxxx : xlate[255:0]="FXNORS";
32'b10xxxxx110110xxxxx001111010xxxxx : xlate[255:0]="FORNOT1";
32'b10xxxxx110110xxxxx001111011xxxxx : xlate[255:0]="FORNOT1S";
32'b10xxxxx110110xxxxx001110110xxxxx : xlate[255:0]="FORNOT2";
32'b10xxxxx110110xxxxx001110111xxxxx : xlate[255:0]="FORNOT2S";
32'b10xxxxx110110xxxxx001101000xxxxx : xlate[255:0]="FANDNOT1";
32'b10xxxxx110110xxxxx001101001xxxxx : xlate[255:0]="FANDNOT1S";
32'b10xxxxx110110xxxxx001100100xxxxx : xlate[255:0]="FANDNOT2";
32'b10xxxxx110110xxxxx001100101xxxxx : xlate[255:0]="FANDNOT2S";
32'b10xxxxx110110xxxxx000101000xxxxx : xlate[255:0]="FCMPGT16";
32'b10xxxxx110110xxxxx000101100xxxxx : xlate[255:0]="FCMPGT32";
32'b10xxxxx110110xxxxx000100000xxxxx : xlate[255:0]="FCMPLE16";
32'b10xxxxx110110xxxxx000100100xxxxx : xlate[255:0]="FCMPLE32";
32'b10xxxxx110110xxxxx000100010xxxxx : xlate[255:0]="FCMPNE16";
32'b10xxxxx110110xxxxx000100110xxxxx : xlate[255:0]="FCMPNE32";
32'b10xxxxx110110xxxxx000101010xxxxx : xlate[255:0]="FCMPEQ16";
32'b10xxxxx110110xxxxx000101110xxxxx : xlate[255:0]="FCMPEQ32";
32'b10xxxxx110110xxxxx000111110xxxxx : xlate[255:0]="PDIST";
32'b10xxxxx110110xxxxx000000000xxxxx : xlate[255:0]="EDGE8";
32'b10xxxxx110110xxxxx000000001xxxxx : xlate[255:0]="EDGE8N";
32'b10xxxxx110110xxxxx000000010xxxxx : xlate[255:0]="EDGE8L";
32'b10xxxxx110110xxxxx000000011xxxxx : xlate[255:0]="EDGE8LN";
32'b10xxxxx110110xxxxx000000100xxxxx : xlate[255:0]="EDGE16";
32'b10xxxxx110110xxxxx000000101xxxxx : xlate[255:0]="EDGE16N";
32'b10xxxxx110110xxxxx000000110xxxxx : xlate[255:0]="EDGE16L";
32'b10xxxxx110110xxxxx000000111xxxxx : xlate[255:0]="EDGE16LN";
32'b10xxxxx110110xxxxx000001000xxxxx : xlate[255:0]="EDGE32";
32'b10xxxxx110110xxxxx000001001xxxxx : xlate[255:0]="EDGE32N";
32'b10xxxxx110110xxxxx000001010xxxxx : xlate[255:0]="EDGE32L";
32'b10xxxxx110110xxxxx000001011xxxxx : xlate[255:0]="EDGE32LN";
32'b10xxxxx110110xxxxx000010000xxxxx : xlate[255:0]="ARRAY8";
32'b10xxxxx110110xxxxx000010010xxxxx : xlate[255:0]="ARRAY16";
32'b10xxxxx110110xxxxx000010100xxxxx : xlate[255:0]="ARRAY32";
32'b10xxxxx110110xxxxx010000001xxxxx : xlate[255:0]="SIAM";
       default : xlate[255:0]="unknown";
    endcase   
   end
endfunction // xlate


`endif
   
endmodule

`endif


`ifdef CORE_6

module nas_probes6;


`ifdef GATESIM


`else
   reg [7:0] ex_valid_m;
   reg [7:0] ex_valid_b;
   reg [7:0] ex_valid_w;
   reg [7:0] return_f4;
   reg [2:0] ex0_tid_m;
   reg [2:0] ex1_tid_m;
   reg [2:0] ex0_tid_b;
   reg [2:0] ex1_tid_b;
   reg [2:0] ex0_tid_w;
   reg [2:0] ex1_tid_w;
   reg       fgu_valid_fb0;
   reg       fgu_valid_fb1;

   reg [31:0] inst0_e;
   reg [31:0] inst1_e;

   reg [7:0] fg_valid;

   reg fcc_valid_f4;
   reg fcc_valid_f5;
   reg fcc_valid_fb;

   reg fgu0_e;
   reg fgu1_e;
   reg lsu0_e;
   reg lsu1_e;

   reg [1:0] dcd_idest_e;
   reg [1:0] dcd_fdest_e;

   wire [7:0] ex_valid;
   wire [7:0] exception_w;

   wire [7:0] imul_valid;

   wire       fg_cond_fb;

   wire        exu_lsu_valid;
   wire [47:0] exu_lsu_addr;
   wire [31:0] exu_lsu_instr;
   wire [2:0]  exu_lsu_tid;
   wire [4:0]  exu_lsu_regid;
   wire [63:0] exu_lsu_data;

   wire [2:0] ex0_tid_e;
   wire [2:0] ex1_tid_e;
   wire       ex0_valid_e;
   wire       ex1_valid_e;
   wire [7:0] ex_asr_access;
   wire       ex_asr_valid;

   wire [7:0] lsu_valid;
   wire [2:0] lsu_tid;
   wire [7:0] lsu_tid_dec_b;
   wire       lsu_ld_valid;
   reg  [7:0] lsu_data_w;
   wire [7:0] lsu_data_b;

   wire ld_inst_d;

   reg [7:0] div_idest;
   reg [7:0] div_fdest;
   
   reg load0_e;
   reg load1_e;

   reg load_m;
   reg load_b;

   reg [2:0] lsu_tid_m;
   reg [7:0] lsu_complete_m;
   reg [7:0] lsu_complete_b;
   reg [7:0] lsu_trap_flush_d;	//reqd. for store buffer ue testing

   reg [7:0] ex_flush_w;
   reg [7:0] ex_flush_b;

   reg sel_divide0_e;
   reg sel_divide1_e;

   wire dec_flush_lb;

   wire [7:0] fgu_idiv_valid;

   wire [7:0] fgu_fdiv_valid;
   
   wire [7:0] fg_div_valid;

   wire       lsu_valid_b;

   wire [7:0] return_w;
   wire       return0;
   wire       return1;
   wire [7:0] real_exception;

   reg  [2:0] lsu_tid_b;
   reg        fmov_valid_fb;
   reg        fmov_valid_f5;
   reg        fmov_valid_f4;
   reg        fmov_valid_f3;
   reg        fmov_valid_f2;
   reg        fmov_valid_m;
   reg        fmov_valid_e;

   reg        fg_flush_fb;
   reg        fg_flush_f5;
   reg        fg_flush_f4;
   reg        fg_flush_f3;
   reg        fg_flush_f2;

   reg       siam0_d;   
   reg       siam1_d;   

   reg       done0_d;
   reg       done1_d;
   reg       retry0_d;
   reg       retry1_d;
   reg       done0_e;
   reg       done1_e;
   reg       retry0_e;
   reg       retry1_e;
   reg       tlu_ccr_cwp_0_valid_last;
   reg       tlu_ccr_cwp_1_valid_last;
   reg [7:0] fg_fdiv_valid_fw;
   reg [7:0] asi_in_progress_b;
   reg [7:0] asi_in_progress_w;
   reg [7:0] asi_in_progress_fx4;
   reg [7:0] tlu_valid;
   reg [7:0] sync_reset_w;
            
   reg [7:0] div_special_cancel_f4;

   reg       asi_store_b;
   reg       asi_store_w;
   reg [2:0] dcc_tid_b;
   reg [2:0] dcc_tid_w;
   reg [7:0] asi_valid_w;
   reg [7:0] asi_valid_fx4;
   reg [7:0] asi_valid_fx5;

   reg [7:0] lsu_state;
   reg [7:0] lsu_check;
   reg [2:0] lsu_tid_e;

   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;

   reg fgu_err_fx3; 
   reg fgu_err_fx4; 
   reg fgu_err_fx5; 
   reg fgu_err_fb; 

   reg clkstop_d1;
   reg clkstop_d2;
   reg clkstop_d3;
   reg clkstop_d4;
   reg clkstop_d5;

integer i;
integer start_dmiss0;
integer start_dmiss1;
integer start_dmiss2;
integer start_dmiss3;
integer start_dmiss4;
integer start_dmiss5;
integer start_dmiss6;
integer start_dmiss7;
integer number_dmiss;
integer start_imiss0;
integer start_imiss1;
integer start_imiss2;
integer start_imiss3;
integer start_imiss4;
integer start_imiss5;
integer start_imiss6;
integer start_imiss7;
integer active_imiss0;
integer active_imiss1;
integer active_imiss2;
integer active_imiss3;
integer active_imiss4;
integer active_imiss5;
integer active_imiss6;
integer active_imiss7;
integer first_imiss0;
integer first_imiss1;
integer first_imiss2;
integer first_imiss3;
integer first_imiss4;
integer first_imiss5;
integer first_imiss6;
integer first_imiss7;
integer number_imiss;
integer clock;
integer sum_dmiss_latency;
integer sum_imiss_latency;
reg spec_dmiss;
integer dmiss_cnt;
integer imiss_cnt;
reg pcx_req;
integer l15dmiss_cnt;
integer l15imiss_cnt;


initial begin // {
    pcx_req=0;
    l15imiss_cnt=0;
    l15dmiss_cnt=0;
    imiss_cnt=0;
    dmiss_cnt=0;
    clock=0;
    start_dmiss0=0;
    start_dmiss1=0;
    start_dmiss2=0;
    start_dmiss3=0;
    start_dmiss4=0;
    start_dmiss5=0;
    start_dmiss6=0;
    start_dmiss7=0;
    number_dmiss=0;
    start_imiss0=0;
    start_imiss1=0;
    start_imiss2=0;
    start_imiss3=0;
    start_imiss4=0;
    start_imiss5=0;
    start_imiss6=0;
    start_imiss7=0;
    active_imiss0=0;
    active_imiss1=0;
    active_imiss2=0;
    active_imiss3=0;
    active_imiss4=0;
    active_imiss5=0;
    active_imiss6=0;
    active_imiss7=0;
    first_imiss0=0;
    first_imiss1=0;
    first_imiss2=0;
    first_imiss3=0;
    first_imiss4=0;
    first_imiss5=0;
    first_imiss6=0;
    first_imiss7=0;
    number_imiss=0;
    sum_dmiss_latency=0;
    sum_imiss_latency=0;
    asi_in_progress_b <= 8'h0;
    asi_in_progress_w <= 8'h0;
    asi_in_progress_fx4 <= 8'h0;
    tlu_valid <= 8'h0;
    div_idest <= 8'h0;
    div_fdest <= 8'h0;
    lsu_state <= 8'h0;
    clkstop_d1 <=0;
    clkstop_d2 <=0;
    clkstop_d3 <=0;
    clkstop_d4 <=0;
    clkstop_d5 <=0;

end //}

wire [7:0] asi_store_flush_w =  {`SPC6.lsu.sbs7.flush_st_w,
                                 `SPC6.lsu.sbs6.flush_st_w,
                                 `SPC6.lsu.sbs5.flush_st_w,
                                 `SPC6.lsu.sbs4.flush_st_w,
                                 `SPC6.lsu.sbs3.flush_st_w,
                                 `SPC6.lsu.sbs2.flush_st_w,
                                 `SPC6.lsu.sbs1.flush_st_w,
                                 `SPC6.lsu.sbs0.flush_st_w};

wire [7:0] store_sync = {`SPC6.lsu.sbs7.trap_sync,
                         `SPC6.lsu.sbs6.trap_sync,
                         `SPC6.lsu.sbs5.trap_sync,
                         `SPC6.lsu.sbs4.trap_sync,
                         `SPC6.lsu.sbs3.trap_sync,
                         `SPC6.lsu.sbs2.trap_sync,
                         `SPC6.lsu.sbs1.trap_sync,
                         `SPC6.lsu.sbs0.trap_sync};
wire [7:0] sync_reset = {`SPC6.lsu.sbs7.sync_state_rst,
                         `SPC6.lsu.sbs6.sync_state_rst,
                         `SPC6.lsu.sbs5.sync_state_rst,
                         `SPC6.lsu.sbs4.sync_state_rst,
                         `SPC6.lsu.sbs3.sync_state_rst,
                         `SPC6.lsu.sbs2.sync_state_rst,
                         `SPC6.lsu.sbs1.sync_state_rst,
                         `SPC6.lsu.sbs0.sync_state_rst};

//--------------------
// Used in nas_pipe for TSB Config Regs Capture/Compare
// ADD_TSB_CFG

// NOTE - ADD_TSB_CFG will never be used for Axis or Tharas
`ifndef EMUL
wire [63:0] ctxt_z_tsb_cfg0_reg [7:0];  // 1 per thread
wire [63:0] ctxt_z_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg3_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg0_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg3_reg [7:0];

// There are 32 entries in each MMU MRA but not all are needed.
// Indexing:
// Bits 4:3 of the address are the lower two bits of the TID
// Bits 2:0 of the address select the register as below
//   mmu.mra0.array.mem for T0-T3
//   mmu.mra1.array.mem for T4-T7
// (this is documented in mmu_asi_ctl.sv)
//		z TSB cfg 0,1				address 0
//		z TSB cfg 2,3				address 1
//		nz TSB cfg 0,1				address 2
//		nz TSB cfg 2,3				address 3
//		Real range, physical offset pair 0	address 4
//		Real range, physical offset pair 1	address 5
//		Real range, physical offset pair 2	address 6
//		Real range, physical offset pair 3	address 7

wire [83:0] mmu_mra0_a0 = `SPC6.mmu.mra0.array.mem[0];
wire [83:0] mmu_mra0_a8 = `SPC6.mmu.mra0.array.mem[8];
wire [83:0] mmu_mra0_a16 = `SPC6.mmu.mra0.array.mem[16];
wire [83:0] mmu_mra0_a24 = `SPC6.mmu.mra0.array.mem[24];
wire [83:0] mmu_mra0_a1 = `SPC6.mmu.mra0.array.mem[1];
wire [83:0] mmu_mra0_a9 = `SPC6.mmu.mra0.array.mem[9];
wire [83:0] mmu_mra0_a17 = `SPC6.mmu.mra0.array.mem[17];
wire [83:0] mmu_mra0_a25 = `SPC6.mmu.mra0.array.mem[25];
wire [83:0] mmu_mra0_a2 = `SPC6.mmu.mra0.array.mem[2];
wire [83:0] mmu_mra0_a10 = `SPC6.mmu.mra0.array.mem[10];
wire [83:0] mmu_mra0_a18 = `SPC6.mmu.mra0.array.mem[18];
wire [83:0] mmu_mra0_a26 = `SPC6.mmu.mra0.array.mem[26];
wire [83:0] mmu_mra0_a3 = `SPC6.mmu.mra0.array.mem[3];
wire [83:0] mmu_mra0_a11 = `SPC6.mmu.mra0.array.mem[11];
wire [83:0] mmu_mra0_a19 = `SPC6.mmu.mra0.array.mem[19];
wire [83:0] mmu_mra0_a27 = `SPC6.mmu.mra0.array.mem[27];
wire [83:0] mmu_mra1_a0 = `SPC6.mmu.mra1.array.mem[0];
wire [83:0] mmu_mra1_a8 = `SPC6.mmu.mra1.array.mem[8];
wire [83:0] mmu_mra1_a16 = `SPC6.mmu.mra1.array.mem[16];
wire [83:0] mmu_mra1_a24 = `SPC6.mmu.mra1.array.mem[24];
wire [83:0] mmu_mra1_a1 = `SPC6.mmu.mra1.array.mem[1];
wire [83:0] mmu_mra1_a9 = `SPC6.mmu.mra1.array.mem[9];
wire [83:0] mmu_mra1_a17 = `SPC6.mmu.mra1.array.mem[17];
wire [83:0] mmu_mra1_a25 = `SPC6.mmu.mra1.array.mem[25];
wire [83:0] mmu_mra1_a2 = `SPC6.mmu.mra1.array.mem[2];
wire [83:0] mmu_mra1_a10 = `SPC6.mmu.mra1.array.mem[10];
wire [83:0] mmu_mra1_a18 = `SPC6.mmu.mra1.array.mem[18];
wire [83:0] mmu_mra1_a26 = `SPC6.mmu.mra1.array.mem[26];
wire [83:0] mmu_mra1_a3 = `SPC6.mmu.mra1.array.mem[3];
wire [83:0] mmu_mra1_a11 = `SPC6.mmu.mra1.array.mem[11];
wire [83:0] mmu_mra1_a19 = `SPC6.mmu.mra1.array.mem[19];
wire [83:0] mmu_mra1_a27 = `SPC6.mmu.mra1.array.mem[27];


// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[0] = {`SPC6.mmu.asi.t0_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[0]  = {`SPC6.mmu.asi.t0_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[0]  = {`SPC6.mmu.asi.t0_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[0]  = {`SPC6.mmu.asi.t0_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[0] = {`SPC6.mmu.asi.t0_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[0] = {`SPC6.mmu.asi.t0_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[0] = {`SPC6.mmu.asi.t0_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[0] = {`SPC6.mmu.asi.t0_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[1] = {`SPC6.mmu.asi.t1_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[1]  = {`SPC6.mmu.asi.t1_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[1]  = {`SPC6.mmu.asi.t1_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[1]  = {`SPC6.mmu.asi.t1_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[1] = {`SPC6.mmu.asi.t1_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[1] = {`SPC6.mmu.asi.t1_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[1] = {`SPC6.mmu.asi.t1_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[1] = {`SPC6.mmu.asi.t1_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[2] = {`SPC6.mmu.asi.t2_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[2]  = {`SPC6.mmu.asi.t2_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[2]  = {`SPC6.mmu.asi.t2_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[2]  = {`SPC6.mmu.asi.t2_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[2] = {`SPC6.mmu.asi.t2_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[2] = {`SPC6.mmu.asi.t2_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[2] = {`SPC6.mmu.asi.t2_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[2] = {`SPC6.mmu.asi.t2_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[3] = {`SPC6.mmu.asi.t3_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[3]  = {`SPC6.mmu.asi.t3_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[3]  = {`SPC6.mmu.asi.t3_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[3]  = {`SPC6.mmu.asi.t3_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[3] = {`SPC6.mmu.asi.t3_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[3] = {`SPC6.mmu.asi.t3_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[3] = {`SPC6.mmu.asi.t3_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[3] = {`SPC6.mmu.asi.t3_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[4] = {`SPC6.mmu.asi.t4_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[4]  = {`SPC6.mmu.asi.t4_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[4]  = {`SPC6.mmu.asi.t4_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[4]  = {`SPC6.mmu.asi.t4_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[4] = {`SPC6.mmu.asi.t4_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[4] = {`SPC6.mmu.asi.t4_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[4] = {`SPC6.mmu.asi.t4_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[4] = {`SPC6.mmu.asi.t4_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[5] = {`SPC6.mmu.asi.t5_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[5]  = {`SPC6.mmu.asi.t5_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[5]  = {`SPC6.mmu.asi.t5_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[5]  = {`SPC6.mmu.asi.t5_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[5] = {`SPC6.mmu.asi.t5_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[5] = {`SPC6.mmu.asi.t5_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[5] = {`SPC6.mmu.asi.t5_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[5] = {`SPC6.mmu.asi.t5_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[6] = {`SPC6.mmu.asi.t6_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[6]  = {`SPC6.mmu.asi.t6_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[6]  = {`SPC6.mmu.asi.t6_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[6]  = {`SPC6.mmu.asi.t6_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[6] = {`SPC6.mmu.asi.t6_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[6] = {`SPC6.mmu.asi.t6_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[6] = {`SPC6.mmu.asi.t6_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[6] = {`SPC6.mmu.asi.t6_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[7] = {`SPC6.mmu.asi.t7_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[7]  = {`SPC6.mmu.asi.t7_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[7]  = {`SPC6.mmu.asi.t7_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[7]  = {`SPC6.mmu.asi.t7_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[7] = {`SPC6.mmu.asi.t7_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[7] = {`SPC6.mmu.asi.t7_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[7] = {`SPC6.mmu.asi.t7_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[7] = {`SPC6.mmu.asi.t7_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };
`endif // EMUL - ADD_TSB_CFG


// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
// Suppress instruction on flush or park request 
// (clear_disrupting_flush_pending_w_in & idl_req_in)
//   Suppress instruction for 'refetch' exception after 
//     not taken branch with annulled delay slot
// NOTE:  'with_errors' means that the signal actually IGNORES instruction
// cache errors and asserts IN SPITE OF instruction cache errors
wire [7:0] select_pc_b_with_errors = 
     {{4 {~`SPC6.dec_flush_b[1]}}, {4 {~`SPC6.dec_flush_b[0]}}} & 
     {{4 {~`SPC6.tlu.fls1.refetch_w_in}}, {4 {~`SPC6.tlu.fls0.refetch_w_in}}} &
     {~(`SPC6.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC6.tlu.fls1.idl_req_in}}),
      ~(`SPC6.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC6.tlu.fls0.idl_req_in}})} &
     {`SPC6.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC6.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Qualify select_pc_b_with_errors to get final select_pc_b signal
// Qualifications are
// 	- instruction cache errors (ic_err_w_in)
//	- disrupting single step completion requests (dsc_req_in)
wire [7:0] select_pc_b = 
     select_pc_b_with_errors[7:0]  &
     {{4 {(~`SPC6.tlu.fls1.ic_err_w_in | `SPC6.tlu.fls1.itlb_nfo_exc_b) & 
          ~`SPC6.tlu.fls1.dsc_req_in}}, 
      {4 {(~`SPC6.tlu.fls0.ic_err_w_in | `SPC6.tlu.fls0.itlb_nfo_exc_b) & 
          ~`SPC6.tlu.fls0.dsc_req_in}}};

//------------------------------------

//original select_pc_b_with errors. Select_pc_b_with_errors is no longer asserted
//if the inst. following an annulled delay slot of a not taken branch has a prebuffer
//error and it reaches B stage. I still need a signal if this happens to trigger the chkr.

wire [7:0] select_pc_b_with_errors_and_refetch =
     {{4 {~`SPC6.dec_flush_b[1]}}, {4 {~`SPC6.dec_flush_b[0]}}} &
     {~(`SPC6.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC6.tlu.fls1.idl_req_in}}),
      ~(`SPC6.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC6.tlu.fls0.idl_req_in}})} &
     {`SPC6.tlu.fls1.tid_dec_valid_b[3:0],
      `SPC6.tlu.fls0.tid_dec_valid_b[3:0]};

// Signals required for bench TLB sync & LDST sync

reg        tlb_bypass_m;
reg        tlb_bypass_b;
reg        tlb_rd_vld_m;
reg        tlb_rd_vld_b;
reg        lsu_tl_gt_0_b;
reg  [7:0] dcc_asi_b;
reg        asi_internal_w;

always @ (posedge `BENCH_SPC6_GCLK) begin // {

  clkstop_d1 <= `SPC6.tcu_clk_stop;
  clkstop_d2 <= clkstop_d1;
  clkstop_d3 <= clkstop_d2;
  clkstop_d4 <= clkstop_d3;
  clkstop_d5 <= clkstop_d4;

  tlb_bypass_m <= `SPC6.lsu.tlb.tlb_bypass;
  tlb_bypass_b <= tlb_bypass_m;
  tlb_rd_vld_m <= `SPC6.lsu.tlb.tlb_rd_vld | `SPC6.lsu.tlb.tlb_cam_vld;
  tlb_rd_vld_b <= tlb_rd_vld_m;

  // This signal is only valid for LD/ST instructions
  lsu_tl_gt_0_b <= `SPC6.lsu.dcc.tl_gt_0_m;

  // Can't use lsu.dcc_asi_b for tlb_sync so pipeline from M to B
  dcc_asi_b <= `SPC6.lsu.dcc_asi_m;

  // LD/ST that will not issue to the crossbar
  asi_internal_w <= `SPC6.lsu.dcc.asi_internal_b;
end // }

// TL determines whether Nucleus or Primary
wire [7:0] asi_num = `SPC6.lsu.dcc.altspace_ldst_b ? 
                     dcc_asi_b : 
                     (lsu_tl_gt_0_b ? 8'h04 : 8'h80);

wire [7:0] itlb_miss   = { (`SPC6.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire [7:0] icache_miss = { (`SPC6.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC6.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC6.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire inst_bypass = (`SPC6.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[0] |
                    `SPC6.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[1] |
                    `SPC6.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[2]);

wire [7:0] fetch_bypass = { (inst_bypass & `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                            (inst_bypass & `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                            (inst_bypass & `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                            (inst_bypass & `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                            (inst_bypass & `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                            (inst_bypass & `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                            (inst_bypass & `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                            (inst_bypass & `SPC6.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                          };

wire [7:0] itlb_wr = {(`SPC6.tlu.trl1.take_itw & `SPC6.tlu.trl1.trap[3]),
                      (`SPC6.tlu.trl1.take_itw & `SPC6.tlu.trl1.trap[2]),
                      (`SPC6.tlu.trl1.take_itw & `SPC6.tlu.trl1.trap[1]),
                      (`SPC6.tlu.trl1.take_itw & `SPC6.tlu.trl1.trap[0]),
                      (`SPC6.tlu.trl0.take_itw & `SPC6.tlu.trl0.trap[3]),
                      (`SPC6.tlu.trl0.take_itw & `SPC6.tlu.trl0.trap[2]),
                      (`SPC6.tlu.trl0.take_itw & `SPC6.tlu.trl0.trap[1]),
                      (`SPC6.tlu.trl0.take_itw & `SPC6.tlu.trl0.trap[0])
                     };

//------------------------------------

reg  [71:0] tick_cmpr_0; 
reg  [71:0] stick_cmpr_0; 
reg  [71:0] hstick_cmpr_0;
reg [151:0] trap_entry_1_t0;
reg [151:0] trap_entry_2_t0;
reg [151:0] trap_entry_3_t0;
reg [151:0] trap_entry_4_t0;
reg [151:0] trap_entry_5_t0;
reg [151:0] trap_entry_6_t0;

always @(posedge `BENCH_SPC6_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_0        <= `SPC6.tlu.tca.array.mem[{2'b0,3'h0}];
      stick_cmpr_0       <= `SPC6.tlu.tca.array.mem[{2'b01,3'h0}];
      hstick_cmpr_0      <= `SPC6.tlu.tca.array.mem[{2'b10,3'h0}];
      trap_entry_1_t0    <= `SPC6.tlu.tsa0.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t0    <= `SPC6.tlu.tsa0.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t0    <= `SPC6.tlu.tsa0.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t0    <= `SPC6.tlu.tsa0.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t0    <= `SPC6.tlu.tsa0.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t0    <= `SPC6.tlu.tsa0.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_1; 
reg  [71:0] stick_cmpr_1; 
reg  [71:0] hstick_cmpr_1;
reg [151:0] trap_entry_1_t1;
reg [151:0] trap_entry_2_t1;
reg [151:0] trap_entry_3_t1;
reg [151:0] trap_entry_4_t1;
reg [151:0] trap_entry_5_t1;
reg [151:0] trap_entry_6_t1;

always @(posedge `BENCH_SPC6_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_1        <= `SPC6.tlu.tca.array.mem[{2'b0,3'h1}];
      stick_cmpr_1       <= `SPC6.tlu.tca.array.mem[{2'b01,3'h1}];
      hstick_cmpr_1      <= `SPC6.tlu.tca.array.mem[{2'b10,3'h1}];
      trap_entry_1_t1    <= `SPC6.tlu.tsa0.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t1    <= `SPC6.tlu.tsa0.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t1    <= `SPC6.tlu.tsa0.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t1    <= `SPC6.tlu.tsa0.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t1    <= `SPC6.tlu.tsa0.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t1    <= `SPC6.tlu.tsa0.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_2; 
reg  [71:0] stick_cmpr_2; 
reg  [71:0] hstick_cmpr_2;
reg [151:0] trap_entry_1_t2;
reg [151:0] trap_entry_2_t2;
reg [151:0] trap_entry_3_t2;
reg [151:0] trap_entry_4_t2;
reg [151:0] trap_entry_5_t2;
reg [151:0] trap_entry_6_t2;

always @(posedge `BENCH_SPC6_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_2        <= `SPC6.tlu.tca.array.mem[{2'b0,3'h2}];
      stick_cmpr_2       <= `SPC6.tlu.tca.array.mem[{2'b01,3'h2}];
      hstick_cmpr_2      <= `SPC6.tlu.tca.array.mem[{2'b10,3'h2}];
      trap_entry_1_t2    <= `SPC6.tlu.tsa0.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t2    <= `SPC6.tlu.tsa0.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t2    <= `SPC6.tlu.tsa0.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t2    <= `SPC6.tlu.tsa0.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t2    <= `SPC6.tlu.tsa0.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t2    <= `SPC6.tlu.tsa0.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_3; 
reg  [71:0] stick_cmpr_3; 
reg  [71:0] hstick_cmpr_3;
reg [151:0] trap_entry_1_t3;
reg [151:0] trap_entry_2_t3;
reg [151:0] trap_entry_3_t3;
reg [151:0] trap_entry_4_t3;
reg [151:0] trap_entry_5_t3;
reg [151:0] trap_entry_6_t3;

always @(posedge `BENCH_SPC6_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_3        <= `SPC6.tlu.tca.array.mem[{2'b0,3'h3}];
      stick_cmpr_3       <= `SPC6.tlu.tca.array.mem[{2'b01,3'h3}];
      hstick_cmpr_3      <= `SPC6.tlu.tca.array.mem[{2'b10,3'h3}];
      trap_entry_1_t3    <= `SPC6.tlu.tsa0.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t3    <= `SPC6.tlu.tsa0.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t3    <= `SPC6.tlu.tsa0.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t3    <= `SPC6.tlu.tsa0.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t3    <= `SPC6.tlu.tsa0.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t3    <= `SPC6.tlu.tsa0.array.mem[{2'h3, 3'h5}];

end // }
reg  [71:0] tick_cmpr_4; 
reg  [71:0] stick_cmpr_4; 
reg  [71:0] hstick_cmpr_4;
reg [151:0] trap_entry_1_t4;
reg [151:0] trap_entry_2_t4;
reg [151:0] trap_entry_3_t4;
reg [151:0] trap_entry_4_t4;
reg [151:0] trap_entry_5_t4;
reg [151:0] trap_entry_6_t4;

always @(posedge `BENCH_SPC6_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_4        <= `SPC6.tlu.tca.array.mem[{2'b0,3'h4}];
      stick_cmpr_4       <= `SPC6.tlu.tca.array.mem[{2'b01,3'h4}];
      hstick_cmpr_4      <= `SPC6.tlu.tca.array.mem[{2'b10,3'h4}];
      trap_entry_1_t4    <= `SPC6.tlu.tsa1.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t4    <= `SPC6.tlu.tsa1.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t4    <= `SPC6.tlu.tsa1.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t4    <= `SPC6.tlu.tsa1.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t4    <= `SPC6.tlu.tsa1.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t4    <= `SPC6.tlu.tsa1.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_5; 
reg  [71:0] stick_cmpr_5; 
reg  [71:0] hstick_cmpr_5;
reg [151:0] trap_entry_1_t5;
reg [151:0] trap_entry_2_t5;
reg [151:0] trap_entry_3_t5;
reg [151:0] trap_entry_4_t5;
reg [151:0] trap_entry_5_t5;
reg [151:0] trap_entry_6_t5;

always @(posedge `BENCH_SPC6_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_5        <= `SPC6.tlu.tca.array.mem[{2'b0,3'h5}];
      stick_cmpr_5       <= `SPC6.tlu.tca.array.mem[{2'b01,3'h5}];
      hstick_cmpr_5      <= `SPC6.tlu.tca.array.mem[{2'b10,3'h5}];
      trap_entry_1_t5    <= `SPC6.tlu.tsa1.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t5    <= `SPC6.tlu.tsa1.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t5    <= `SPC6.tlu.tsa1.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t5    <= `SPC6.tlu.tsa1.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t5    <= `SPC6.tlu.tsa1.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t5    <= `SPC6.tlu.tsa1.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_6; 
reg  [71:0] stick_cmpr_6; 
reg  [71:0] hstick_cmpr_6;
reg [151:0] trap_entry_1_t6;
reg [151:0] trap_entry_2_t6;
reg [151:0] trap_entry_3_t6;
reg [151:0] trap_entry_4_t6;
reg [151:0] trap_entry_5_t6;
reg [151:0] trap_entry_6_t6;

always @(posedge `BENCH_SPC6_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_6        <= `SPC6.tlu.tca.array.mem[{2'b0,3'h6}];
      stick_cmpr_6       <= `SPC6.tlu.tca.array.mem[{2'b01,3'h6}];
      hstick_cmpr_6      <= `SPC6.tlu.tca.array.mem[{2'b10,3'h6}];
      trap_entry_1_t6    <= `SPC6.tlu.tsa1.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t6    <= `SPC6.tlu.tsa1.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t6    <= `SPC6.tlu.tsa1.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t6    <= `SPC6.tlu.tsa1.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t6    <= `SPC6.tlu.tsa1.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t6    <= `SPC6.tlu.tsa1.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_7; 
reg  [71:0] stick_cmpr_7; 
reg  [71:0] hstick_cmpr_7;
reg [151:0] trap_entry_1_t7;
reg [151:0] trap_entry_2_t7;
reg [151:0] trap_entry_3_t7;
reg [151:0] trap_entry_4_t7;
reg [151:0] trap_entry_5_t7;
reg [151:0] trap_entry_6_t7;

always @(posedge `BENCH_SPC6_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_7        <= `SPC6.tlu.tca.array.mem[{2'b0,3'h7}];
      stick_cmpr_7       <= `SPC6.tlu.tca.array.mem[{2'b01,3'h7}];
      hstick_cmpr_7      <= `SPC6.tlu.tca.array.mem[{2'b10,3'h7}];
      trap_entry_1_t7    <= `SPC6.tlu.tsa1.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t7    <= `SPC6.tlu.tsa1.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t7    <= `SPC6.tlu.tsa1.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t7    <= `SPC6.tlu.tsa1.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t7    <= `SPC6.tlu.tsa1.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t7    <= `SPC6.tlu.tsa1.array.mem[{2'h3, 3'h5}];

end // }

//------------------------------------
// ASI & Trap State machines
always @(posedge `BENCH_SPC6_GCLK) begin // {

//    pc_0_e[47:0] <= `SPC6.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC6.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC6.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC6.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;


    // altspace_ldst_m is asserted for asi accesses that don't change arch state
    asi_store_b <= (`SPC6.lsu.dcc.asi_store_m & `SPC6.lsu.dcc.asi_sync_m);
    asi_store_w <= asi_store_b;
    dcc_tid_b <= `SPC6.lsu.dcc.dcc_tid_m;
    dcc_tid_w <= dcc_tid_b;

    // ASI in progress state m/c
    if (asi_store_w & ~asi_store_flush_w[dcc_tid_w]) begin // {
        asi_in_progress_b[dcc_tid_w] <= 1'b1;
    end // }

    asi_valid_w <= asi_in_progress_b & store_sync;

    // Delay asi_valid_w and asi_in_progress
    // 2 clocks to ensure TLB Sync DTLBWRITE (demap) comes before SSTEP stxa
    asi_valid_fx4 <= asi_valid_w;
    asi_valid_fx5 <= asi_valid_fx4;
    asi_in_progress_w <= asi_in_progress_b;
    asi_in_progress_fx4 <= asi_in_progress_w;
    sync_reset_w <= sync_reset;
    
    for (i=0;i<8;i=i+1) begin // {
        if (asi_valid_w[i] | sync_reset_w[i]) begin // {
            asi_in_progress_b[i] <= 1'b0;
        end//}
    end //}

    // Trap0 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC6.tlu.tlu_trap_0_tid[1:0] == i) &&
            `SPC6.tlu.tlu_trap_pc_0_valid & tlu_ccr_cwp_0_valid_last)
        begin //{
            tlu_valid[i] <= 1'b1;
        end //}
        // Trap taken
        else if (`SPC6.tlu.trl0.real_trap[i] & ~`SPC6.tlu.trl0.take_por) begin // {
            tlu_valid[i] <= 1'b1;
        end //}
        else 
            tlu_valid[i] <= 1'b0;
    end //}

    // Trap1 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC6.tlu.tlu_trap_1_tid[1:0] == i) &&
            `SPC6.tlu.tlu_trap_pc_1_valid & tlu_ccr_cwp_1_valid_last)
        begin //{
            tlu_valid[i+4] <= 1'b1;
        end //} 
        // Trap taken
        else if (`SPC6.tlu.trl1.real_trap[i] & ~`SPC6.tlu.trl1.take_por) begin // {
            tlu_valid[i+4] <= 1'b1;
        end //}
        else 
            tlu_valid[i+4] <= 1'b0;
    end //}

end // }


always @(posedge `BENCH_SPC6_GCLK) begin

// debug code for TPCC analysis
`ifdef TPCC
if (pcx_req==1) begin
	if (`SPC6.spc_pcx_data_pa[129:124]==6'b100000) begin  // l15 dmiss
	  l15dmiss_cnt=l15dmiss_cnt+1;
	  $display("dmissl15 cnt is %0d",l15dmiss_cnt);
	end
	if (`SPC6.spc_pcx_data_pa[129:124]==6'b110000) begin // l15 imiss
	  l15imiss_cnt=l15imiss_cnt+1;
	  $display("imissl15 cnt is %0d",l15imiss_cnt);
	end
	// `TOP.spg.spc_pcx_data_pa[129:124]==6'b100001   -> all stores 
end

pcx_req <= |`SPC6.spc_pcx_req_pq[8:0];
 
if (`SPC6.ifu_l15_valid==1) begin
	imiss_cnt=imiss_cnt+1;
	$display("imiss cnt is %0d",imiss_cnt);
end
if (spec_dmiss==1 && `SPC6.lsu_l15_cancel==0) begin
	dmiss_cnt=dmiss_cnt+1;
	$display("dmiss cnt is %0d",dmiss_cnt);
	
end
spec_dmiss <= `SPC6.lsu_l15_valid & `SPC6.lsu_l15_load;

clock = clock+1;

// keep track of imiss latencies
if (`SPC6.ftu_agc_thr0_cmiss_c==1) begin
     start_imiss0=clock;
     active_imiss0=1;
end
if (active_imiss0==1 && first_imiss0==1 && `SPC6.l15_spc_cpkt[8:6]==3'b000 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss0 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss0=0;
     first_imiss0=0;
end
if (active_imiss0==1 && first_imiss0==0 && `SPC6.l15_spc_cpkt[8:6]==3'b000 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss0=1;
end
if (`SPC6.ftu_agc_thr1_cmiss_c==1) begin
     start_imiss1=clock;
     active_imiss1=1;
end
if (active_imiss1==1 && first_imiss1==1 && `SPC6.l15_spc_cpkt[8:6]==3'b001 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss1 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss1=0;
     first_imiss1=0;
end
if (active_imiss1==1 && first_imiss1==0 && `SPC6.l15_spc_cpkt[8:6]==3'b001 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss1=1;
end
if (`SPC6.ftu_agc_thr2_cmiss_c==1) begin
     start_imiss2=clock;
     active_imiss2=1;
end
if (active_imiss2==1 && first_imiss2==1 && `SPC6.l15_spc_cpkt[8:6]==3'b010 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss2 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss2=0;
     first_imiss2=0;
end
if (active_imiss2==1 && first_imiss2==0 && `SPC6.l15_spc_cpkt[8:6]==3'b010 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss2=1;
end
if (`SPC6.ftu_agc_thr3_cmiss_c==1) begin
     start_imiss3=clock;
     active_imiss3=1;
end
if (active_imiss3==1 && first_imiss3==1  && `SPC6.l15_spc_cpkt[8:6]==3'b011 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss3 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss3=0;
     first_imiss3=0;
end
if (active_imiss3==1 && first_imiss3==0 && `SPC6.l15_spc_cpkt[8:6]==3'b011 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss3=1;
end
if (`SPC6.ftu_agc_thr4_cmiss_c==1) begin
     start_imiss4=clock;
     active_imiss4=1;
end
if (active_imiss4==1 && first_imiss4==1  && `SPC6.l15_spc_cpkt[8:6]==3'b100 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss4 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss4=0;
     first_imiss4=0;
end
if (active_imiss4==1 && first_imiss4==0 && `SPC6.l15_spc_cpkt[8:6]==3'b100 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss4=1;
end
if (`SPC6.ftu_agc_thr5_cmiss_c==1) begin
     start_imiss5=clock;
     active_imiss5=1;
end
if (active_imiss5==1  && first_imiss5==1 && `SPC6.l15_spc_cpkt[8:6]==3'b101 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss5 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss5=0;
     first_imiss5=0;
end
if (active_imiss5==1 && first_imiss5==0 && `SPC6.l15_spc_cpkt[8:6]==3'b101 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss5=1;
end
if (`SPC6.ftu_agc_thr6_cmiss_c==1) begin
     start_imiss6=clock;
     active_imiss6=1;
end
if (active_imiss6==1 && first_imiss6==1 && `SPC6.l15_spc_cpkt[8:6]==3'b110 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss6 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss6=0;
     first_imiss6=0;
end
if (active_imiss6==1 && first_imiss6==0 && `SPC6.l15_spc_cpkt[8:6]==3'b110 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss6=1;
end
if (`SPC6.ftu_agc_thr7_cmiss_c==1) begin
     start_imiss7=clock;
     active_imiss7=1;
end
if (active_imiss7==1 && first_imiss7==1 && `SPC6.l15_spc_cpkt[8:6]==3'b111 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss7 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss7=0;
    first_imiss7=0;
end
if (active_imiss7==1 && first_imiss7==0 && `SPC6.l15_spc_cpkt[8:6]==3'b111 && `SPC6.l15_spc_valid==1 && `SPC6.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss7=1;
end

if (`SPC6.pku.swl0.set_lsu_sync_wait==1) begin
     start_dmiss0=clock;
end
if (`SPC6.pku.swl0.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss0) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC6.pku.swl1.set_lsu_sync_wait==1) begin
     start_dmiss1=clock;
end
if (`SPC6.pku.swl1.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss1) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC6.pku.swl2.set_lsu_sync_wait==1) begin
     start_dmiss2=clock;
end
if (`SPC6.pku.swl2.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss2) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC6.pku.swl3.set_lsu_sync_wait==1) begin
     start_dmiss3=clock;
end
if (`SPC6.pku.swl3.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss3) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC6.pku.swl4.set_lsu_sync_wait==1) begin
     start_dmiss4=clock;
end
if (`SPC6.pku.swl4.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss4) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC6.pku.swl5.set_lsu_sync_wait==1) begin
     start_dmiss5=clock;
end
if (`SPC6.pku.swl5.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss5) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC6.pku.swl6.set_lsu_sync_wait==1) begin
     start_dmiss6=clock;
end
if (`SPC6.pku.swl6.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss6) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC6.pku.swl7.set_lsu_sync_wait==1) begin
     start_dmiss7=clock;
end
if (`SPC6.pku.swl7.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss7) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
`endif



   lsu_tid_e[2:0] <= `SPC6.lsu.dcc.tid_d[2:0];

   // FG Valid conditions

   // Add fcc valids to fg_valid
   fcc_valid_fb <= fcc_valid_f5;
   fcc_valid_f5 <= fcc_valid_f4;
   fcc_valid_f4 <= |`SPC6.fgu.fgu_cmp_fcc_vld_fx3[3:0];

   fg_flush_fb <= fg_flush_f5;
   fg_flush_f5 <= fg_flush_f4;
   fg_flush_f4 <= fg_flush_f3;
   fg_flush_f3 <= fg_flush_f2 | `SPC6.dec_flush_f2 | 
                  `SPC6.tlu_flush_fgu_b;
   fg_flush_f2 <= `SPC6.dec_flush_f1;

   fgu_err_fx3 <= `SPC6.fgu_cecc_fx2 | `SPC6.fgu_uecc_fx2 | `SPC6.fgu.fpc.exu_flush_fx2; // frf or irf ecc error
   fgu_err_fx4 <= fgu_err_fx3;
   fgu_err_fx5 <= fgu_err_fx4;
   fgu_err_fb <= fgu_err_fx5;

   // Siams cause fg_valid ..
   siam0_d = `SPC6.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC6.dec.dec_inst0_d[24:19]==6'b110110 &
             `SPC6.dec.dec_inst0_d[13:5]==9'b010000001;  

   siam1_d = `SPC6.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC6.dec.dec_inst1_d[24:19]==6'b110110 &
             `SPC6.dec.dec_inst1_d[13:5]==9'b010000001;  
    

   done0_d = `SPC6.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC6.dec.dec_inst0_d[29:25]==5'b00000 & 
             `SPC6.dec.dec_inst0_d[24:19]==6'b111110;
   done1_d = `SPC6.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC6.dec.dec_inst1_d[29:25]==5'b00000 & 
             `SPC6.dec.dec_inst1_d[24:19]==6'b111110;    

   retry0_d = `SPC6.dec.dec_inst0_d[31:30]==2'b10 & 
              `SPC6.dec.dec_inst0_d[29:25]==5'b00001 & 
              `SPC6.dec.dec_inst0_d[24:19]==6'b111110;
   retry1_d = `SPC6.dec.dec_inst1_d[31:30]==2'b10 & 
              `SPC6.dec.dec_inst1_d[29:25]==5'b00001 & 
              `SPC6.dec.dec_inst1_d[24:19]==6'b111110;   

   done0_e <= done0_d & `SPC6.dec.dec_decode0_d;
   done1_e <= done1_d & `SPC6.dec.dec_decode1_d; 

   retry0_e <= retry0_d & `SPC6.dec.dec_decode0_d;
   retry1_e <= retry1_d & `SPC6.dec.dec_decode1_d;   


   // fold siam into cmov logic 

   fmov_valid_fb <= fmov_valid_f5;
   fmov_valid_f5 <= fmov_valid_f4;
   fmov_valid_f4 <= fmov_valid_f3;
   fmov_valid_f3 <= fmov_valid_f2;
   fmov_valid_f2 <= fmov_valid_m;
   fmov_valid_m  <= fmov_valid_e & `SPC6.dec.dec_fgu_valid_e;
   fmov_valid_e <= ((`SPC6.exu0.ect.cmov_d | siam0_d) & 
                    `SPC6.dec.dec_decode0_d&`SPC6.dec.del.fgu0_d) |
                    ((`SPC6.exu1.ect.cmov_d | siam1_d) & 
                    `SPC6.dec.dec_decode1_d&`SPC6.dec.del.fgu1_d);
   
   // fgu check bus

   // fcc_valid_fb doesn't assert for LDFSR. LDFSR gets checked by the LSU
   // checker

   fg_valid <= {(`SPC6.fgu.fac.fac_w1_tid_fb[2:0]==3'h7) && fg_cond_fb,
                (`SPC6.fgu.fac.fac_w1_tid_fb[2:0]==3'h6) && fg_cond_fb,
                (`SPC6.fgu.fac.fac_w1_tid_fb[2:0]==3'h5) && fg_cond_fb,
                (`SPC6.fgu.fac.fac_w1_tid_fb[2:0]==3'h4) && fg_cond_fb,
                (`SPC6.fgu.fac.fac_w1_tid_fb[2:0]==3'h3) && fg_cond_fb,
                (`SPC6.fgu.fac.fac_w1_tid_fb[2:0]==3'h2) && fg_cond_fb,
                (`SPC6.fgu.fac.fac_w1_tid_fb[2:0]==3'h1) && fg_cond_fb,
                (`SPC6.fgu.fac.fac_w1_tid_fb[2:0]==3'h0) && fg_cond_fb };
   

   fgu_valid_fb0      <= `SPC6.fgu_exu_w_vld_fx5[0] && !`SPC6.fgu.fpc.div_finish_int_fb;
   fgu_valid_fb1      <= `SPC6.fgu_exu_w_vld_fx5[1] && !`SPC6.fgu.fpc.div_finish_int_fb;

   // Fdiv
   div_special_cancel_f4[7:0] <= tid2onehot(`SPC6.fgu.fac.tid_fx3[2:0]) & 
                               {8{`SPC6.fgu.fac.q_div_default_res_fx3}};
   fg_fdiv_valid_fw <= `SPC6.fgu_divide_completion & ~div_special_cancel_f4 &
                       {8{~`SPC6.fgu.fpc.fpc_fpd_ieee_trap_fb}} &
                       {8{~`SPC6.fgu.fpc.fpc_fpd_unfin_fb}};

    
   // Used in CCX Stub ?
   inst0_e[31:0] <= `SPC6.dec.dec_inst0_d[31:0];
   inst1_e[31:0] <= `SPC6.dec.dec_inst1_d[31:0];

   // only fgu ops that are not loads/stores
   fgu0_e <= `SPC6.dec.del.decode_fgu0_d;  
   fgu1_e <= `SPC6.dec.del.decode_fgu1_d;

   // LSU logic 
   load_b <= load_m;
   load_m <= (load0_e | load1_e);

   load0_e <= (`SPC6.dec.dec_decode0_d & `SPC6.dec.del.lsu0_d & 
               `SPC6.dec.dcd0.dcd_load_d);

   load1_e <= (`SPC6.dec.dec_decode1_d & `SPC6.dec.del.lsu1_d & 
               `SPC6.dec.dcd1.dcd_load_d);

   lsu_tid_b[2:0] <= lsu_tid_m[2:0];
   lsu_tid_m[2:0] <= lsu_tid_e[2:0];

   lsu_complete_m[7:0] <= `SPC6.lsu_complete[7:0];
   lsu_complete_b[7:0] <= lsu_complete_m[7:0];

   lsu_data_w  <= lsu_data_b;
  
   // Divide destination logic ..
   sel_divide0_e <= (`SPC6.dec_decode0_d & 
                     ((`SPC6.pku.swl0.vld_d & `SPC6.pku.swl_divide_wait[0]) |
                      (`SPC6.pku.swl1.vld_d & `SPC6.pku.swl_divide_wait[1]) |
                      (`SPC6.pku.swl2.vld_d & `SPC6.pku.swl_divide_wait[2]) |
                      (`SPC6.pku.swl3.vld_d & `SPC6.pku.swl_divide_wait[3])));
   sel_divide1_e <= (`SPC6.dec_decode1_d & 
                     ((`SPC6.pku.swl4.vld_d & `SPC6.pku.swl_divide_wait[4]) |
                      (`SPC6.pku.swl5.vld_d & `SPC6.pku.swl_divide_wait[5]) |
                      (`SPC6.pku.swl6.vld_d & `SPC6.pku.swl_divide_wait[6]) |
                      (`SPC6.pku.swl7.vld_d & `SPC6.pku.swl_divide_wait[7])));


   dcd_fdest_e <= {`SPC6.dec.del.fdest1_d,`SPC6.dec.del.fdest0_d};
   dcd_idest_e <= {`SPC6.dec.del.idest1_d,`SPC6.dec.del.idest0_d};

   if (sel_divide0_e) begin // {
         div_idest[{1'b0, `SPC6.dec.del.tid0_e[1:0]}] <= dcd_idest_e[0];
         div_fdest[{1'b0, `SPC6.dec.del.tid0_e[1:0]}] <= dcd_fdest_e[0];
   end // }
   if (sel_divide1_e) begin // {
         div_idest[{1'b1, `SPC6.dec.del.tid1_e[1:0]}] <= dcd_idest_e[1];
         div_fdest[{1'b1, `SPC6.dec.del.tid1_e[1:0]}] <= dcd_fdest_e[1];
   end // }
                 

   // EX logic
   // Save EX tids for later use
   ex0_tid_m <= ex0_tid_e;
   ex1_tid_m <= ex1_tid_e;
   ex0_tid_b <= ex0_tid_m;
   ex1_tid_b <= ex1_tid_m;
   ex0_tid_w <= ex0_tid_b;
   ex1_tid_w <= ex1_tid_b;

   // EX Flush conditions
   ex_flush_w <= {ex_flush_b | {{4{(`SPC6.dec.dec_flush_b[1] | 
                                `SPC6.tlu_flush_exu_b[1])}},
                                {4{(`SPC6.dec.dec_flush_b[0] |
                                `SPC6.tlu_flush_exu_b[0])}}}};

   ex_flush_b <= {{4{`SPC6.dec.dec_flush_m[1]}},
                 {4{`SPC6.dec.dec_flush_m[0]}}};


   // ex_valid_f4 valid will only fire on return
   return_f4 <= return_w & ~(`SPC6.tlu_flush_ifu & real_exception);
   ex_valid_w <= ex_valid_b;

   // Cancel EX valid if it turns out to be asr/asi access for this tid 

   ex_valid_b <= ex_valid_m & ~ex_asr_access;


   ex_valid_m <=      { (ex1_tid_e == 2'h3) && ex1_valid_e,
                       (ex1_tid_e == 2'h2) && ex1_valid_e,
                       (ex1_tid_e == 2'h1) && ex1_valid_e,
                       (ex1_tid_e == 2'h0) && ex1_valid_e,
                       (ex0_tid_e == 2'h3) && ex0_valid_e,
                       (ex0_tid_e == 2'h2) && ex0_valid_e,
                       (ex0_tid_e == 2'h1) && ex0_valid_e,
                       (ex0_tid_e == 2'h0) && ex0_valid_e};
   

  // TLU delays for done and retries
  tlu_ccr_cwp_0_valid_last <= `SPC6.tlu.tlu_ccr_cwp_0_valid;
  tlu_ccr_cwp_1_valid_last <= `SPC6.tlu.tlu_ccr_cwp_1_valid;
  

end // END posedge gclk

// Return instruction is separated out of ex*_valid because CWP update is in
// W+1 for return new window is not available for IRF scan (nas_pipe) until
// W+2
assign return0 = `SPC6.exu0.rml.return_w & 
                 `SPC6.exu0.rml.inst_vld_w;
assign return1 = `SPC6.exu1.rml.return_w & 
                 `SPC6.exu1.rml.inst_vld_w;
assign return_w = {(ex1_tid_w == 2'h3) && return1,
                   (ex1_tid_w == 2'h2) && return1,
                   (ex1_tid_w == 2'h1) && return1,
                   (ex1_tid_w == 2'h0) && return1,
                   (ex0_tid_w == 2'h3) && return0,
                   (ex0_tid_w == 2'h2) && return0,
                   (ex0_tid_w == 2'h1) && return0,
                   (ex0_tid_w == 2'h0) && return0};


// Cancel EX valid if it turns out that exception (tlu flush) taken for
// this tid

// exu check bus
assign ex0_tid_e = `SPC6.exu0.ect_tid_lth_e[1:0];
assign ex0_valid_e = `SPC6.dec.dec_valid_e[0] & ~fgu0_e & ~load0_e &
                     ~retry0_e & ~done0_e;
assign ex1_tid_e = `SPC6.exu1.ect_tid_lth_e[1:0];
assign ex1_valid_e = `SPC6.dec.dec_valid_e[1] & ~fgu1_e & ~load1_e &
                     ~retry1_e & ~done1_e;

assign ex_asr_valid = `SPC6.lsu.dcc.asi_store_m & `SPC6.lsu.dcc.asi_sync_m ;

assign ex_asr_access ={(`SPC6.lsu.dcc.dcc_tid_m[2:0]==3'h7) & ex_asr_valid,
                       (`SPC6.lsu.dcc.dcc_tid_m[2:0]==3'h6) & ex_asr_valid,
                       (`SPC6.lsu.dcc.dcc_tid_m[2:0]==3'h5) & ex_asr_valid,
                       (`SPC6.lsu.dcc.dcc_tid_m[2:0]==3'h4) & ex_asr_valid,
                       (`SPC6.lsu.dcc.dcc_tid_m[2:0]==3'h3) & ex_asr_valid,
                       (`SPC6.lsu.dcc.dcc_tid_m[2:0]==3'h2) & ex_asr_valid,
                       (`SPC6.lsu.dcc.dcc_tid_m[2:0]==3'h1) & ex_asr_valid,
                       (`SPC6.lsu.dcc.dcc_tid_m[2:0]==3'h0) & ex_asr_valid};


// EXU valid is ex_valid_w, except flushes, delayed return, traps, and stfsr
// real_exception added because tlu_flush_ifu activates for second redirect
// of retry if TPC and TNPC are not verified as sequential
assign  real_exception =
	   {{4 {`SPC6.tlu.fls1.dec_exc_w | 
		`SPC6.tlu.fls1.exu_exc_w |
		`SPC6.tlu.fls1.lsu_exc_w | 
                `SPC6.tlu.fls1.bsee_req_w}},
	    {4 {`SPC6.tlu.fls0.dec_exc_w | 
		`SPC6.tlu.fls0.exu_exc_w |
		`SPC6.tlu.fls0.lsu_exc_w | 
                `SPC6.tlu.fls0.bsee_req_w}}};

// Do not assert ex_valid for block store instructions
wire [7:0] block_store_first_at_w = 
           {`SPC6.lsu.sbs7.bst_pend & `SPC6.lsu.sbs7.blk_inst_w, 
            `SPC6.lsu.sbs6.bst_pend & `SPC6.lsu.sbs6.blk_inst_w, 
            `SPC6.lsu.sbs5.bst_pend & `SPC6.lsu.sbs5.blk_inst_w, 
            `SPC6.lsu.sbs4.bst_pend & `SPC6.lsu.sbs4.blk_inst_w, 
            `SPC6.lsu.sbs3.bst_pend & `SPC6.lsu.sbs3.blk_inst_w, 
            `SPC6.lsu.sbs2.bst_pend & `SPC6.lsu.sbs2.blk_inst_w, 
            `SPC6.lsu.sbs1.bst_pend & `SPC6.lsu.sbs1.blk_inst_w, 
            `SPC6.lsu.sbs0.bst_pend & `SPC6.lsu.sbs0.blk_inst_w};

// But inject a valid for a block store that's done...
reg [7:0] block_store_w;
always @(posedge `BENCH_SPC6_GCLK) begin
    block_store_w[7:0] <= `SPC6.lsu.lsu_block_store_b[7:0];
    lsu_trap_flush_d <=  `SPC6.lsu_trap_flush[7:0];
end

wire [7:0] block_store_inject_at_w = 
                                    ~`SPC6.lsu.lsu_block_store_b[7:0] & 
                                    block_store_w[7:0] &
                                    {~`SPC6.lsu.sbs7.bst_kill,
                                     ~`SPC6.lsu.sbs6.bst_kill,
                                     ~`SPC6.lsu.sbs5.bst_kill,
                                     ~`SPC6.lsu.sbs4.bst_kill,
                                     ~`SPC6.lsu.sbs3.bst_kill,
                                     ~`SPC6.lsu.sbs2.bst_kill,
                                     ~`SPC6.lsu.sbs1.bst_kill,
                                     ~`SPC6.lsu.sbs0.bst_kill};

assign ex_valid = (((ex_valid_w & ~ex_flush_w & ~return_w & ~block_store_first_at_w & ~exception_w &
                     ~({{4{`SPC6.tlu.fls1.exu_exc_b & `SPC6.tlu.fls1.beat_two_b}},
                        {4{`SPC6.tlu.fls0.exu_exc_b & `SPC6.tlu.fls0.beat_two_b}}}) &
                     ~{(`SPC6.fgu.fac.tid_fx3[2:0]==3'h7) & `SPC6.fgu.fpc.fsr_store_fx3,
                       (`SPC6.fgu.fac.tid_fx3[2:0]==3'h6) & `SPC6.fgu.fpc.fsr_store_fx3,
                       (`SPC6.fgu.fac.tid_fx3[2:0]==3'h5) & `SPC6.fgu.fpc.fsr_store_fx3,
                       (`SPC6.fgu.fac.tid_fx3[2:0]==3'h4) & `SPC6.fgu.fpc.fsr_store_fx3,
                       (`SPC6.fgu.fac.tid_fx3[2:0]==3'h3) & `SPC6.fgu.fpc.fsr_store_fx3,
                       (`SPC6.fgu.fac.tid_fx3[2:0]==3'h2) & `SPC6.fgu.fpc.fsr_store_fx3,
                       (`SPC6.fgu.fac.tid_fx3[2:0]==3'h1) & `SPC6.fgu.fpc.fsr_store_fx3,
                       (`SPC6.fgu.fac.tid_fx3[2:0]==3'h0) & `SPC6.fgu.fpc.fsr_store_fx3}) | 
                     block_store_inject_at_w) & 
                   ~(`SPC6.tlu_flush_ifu & real_exception)) | return_f4;

assign exception_w = {{4 {`SPC6.tlu.fls1.exc_for_w}} | 
                      `SPC6.tlu.fls1.bsee_req[3:0] | 
		      `SPC6.tlu.fls1.pdist_ecc_w[3:0],
		      {4 {`SPC6.tlu.fls0.exc_for_w}} |
		      `SPC6.tlu.fls0.bsee_req[3:0] | 
		      `SPC6.tlu.fls0.pdist_ecc_w[3:0]};

// imul check bus - includes imul, save, restore instructions
assign imul_valid = {(`SPC6.exu1.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb1,
                     (`SPC6.exu1.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb1,
                     (`SPC6.exu1.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb1,
                     (`SPC6.exu1.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb1,
                     (`SPC6.exu0.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb0,
                     (`SPC6.exu0.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb0,
                     (`SPC6.exu0.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb0,
                     (`SPC6.exu0.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb0};

// qualify this signal with fgu_err. If fgu_err is encountered, deassert
//fg_cond_fb, so we don't send a step to Riesling.

// FGU conditions
wire fg_cond_fb_pre_err = `SPC6.fgu.fpc.fpc_w1_ul_vld_fb | fcc_valid_fb | 
                     (fmov_valid_fb & ~fg_flush_fb) |
                     (`SPC6.fgu.fac.fsr_w1_vld_fb[1]);  // covers ST(X)FSR, which clears FSR.ftt

assign fg_cond_fb = fg_cond_fb_pre_err  & ~fgu_err_fb;

// Idiv/Fdiv signals

assign fgu_idiv_valid = fg_div_valid & div_idest;


assign fgu_fdiv_valid = fg_fdiv_valid_fw & div_fdest;


// Lsu signals needed to check lsu results

assign lsu_valid     = lsu_check | lsu_data_w;

assign fg_div_valid  = `SPC6.fgu_divide_completion & ~div_special_cancel_f4;
   
// State machine asserts lsu_check for LD hit/miss
always @(posedge `BENCH_SPC6_GCLK) begin
  for (i=0; i<=7;i=i+1) begin // {
      lsu_check[i] <= 1'b0;
      case (lsu_state[i])
        1'b0: // IDLE state
              begin
                // LD hit
                if (lsu_ld_valid & lsu_tid_dec_b[i] & load_b) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - normal case
                else if (lsu_ld_valid & lsu_tid_dec_b[i] & lsu_complete_b[i]) 
                begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - LDD or Block LD or SWAP
                else if (lsu_ld_valid & lsu_tid_dec_b[i]) begin
                  lsu_state[i] <= 1'b1; // VALID state
                end
// Added a new term to handle STB uncorrectable errors on atomic or asi stores that are synced
//Send a complete if an atomic is squashed.
//lsu_trap_flush is asserted a cycle after the block_store_kill is asserted
		else if (`SPC6.lsu.dcc.sync_st[i] & `SPC6.lsu_block_store_kill[i] & ~lsu_trap_flush_d[i])
		begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
                
              end
        1'b1: // VALID state
              begin
                if ((lsu_complete_b[i])) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
              end
      endcase
  end // }
end

   
assign lsu_tid   = `SPC6.lsu.dcc.ld_tid_b[2:0];
// Don't assert LSU_complete in case of dtlb or irf errors

assign lsu_valid_b = (`SPC6.lsu.dcc.pref_inst_b & 
                      ~(dec_flush_lb | `SPC6.lsu.dcc.pipe_flush_b | 
			`SPC6.lsu_dtdp_err_b | `SPC6.lsu_dttp_err_b |
			`SPC6.lsu_dtmh_err_b | `SPC6.lsu.dcc.exu_error_b));

assign lsu_data_b[7:0] = { (lsu_tid == 3'h7) & lsu_valid_b,
                          (lsu_tid == 3'h6) & lsu_valid_b,
                          (lsu_tid == 3'h5) & lsu_valid_b,
                          (lsu_tid == 3'h4) & lsu_valid_b,
                          (lsu_tid == 3'h3) & lsu_valid_b,
                          (lsu_tid == 3'h2) & lsu_valid_b,
                          (lsu_tid == 3'h1) & lsu_valid_b,
                          (lsu_tid == 3'h0) & lsu_valid_b};

assign  lsu_tid_dec_b[0] = `SPC6.lsu.dcc.ld_tid_b[2:0] == 3'd0;
assign  lsu_tid_dec_b[1] = `SPC6.lsu.dcc.ld_tid_b[2:0] == 3'd1;
assign  lsu_tid_dec_b[2] = `SPC6.lsu.dcc.ld_tid_b[2:0] == 3'd2;
assign  lsu_tid_dec_b[3] = `SPC6.lsu.dcc.ld_tid_b[2:0] == 3'd3;
assign  lsu_tid_dec_b[4] = `SPC6.lsu.dcc.ld_tid_b[2:0] == 3'd4;
assign  lsu_tid_dec_b[5] = `SPC6.lsu.dcc.ld_tid_b[2:0] == 3'd5;
assign  lsu_tid_dec_b[6] = `SPC6.lsu.dcc.ld_tid_b[2:0] == 3'd6;
assign  lsu_tid_dec_b[7] = `SPC6.lsu.dcc.ld_tid_b[2:0] == 3'd7;

assign  lsu_ld_valid = (`SPC6.lsu.dcc.exu_ld_vld_b |`SPC6.lsu.dcc.fgu_fld_vld_b) &
                       ~(`SPC6.lsu.dcc.flush_all_b & `SPC6.lsu.dcc.ld_inst_vld_b);
assign  dec_flush_lb = `SPC6.dec.dec_flush_lb | `SPC6.tlu_flush_lsu_b; 


// LSU interface to CCX stub

assign  exu_lsu_valid = `SPC6.dec.del.lsu_valid_e;
assign  exu_lsu_addr[47:0] = `SPC6.exu_lsu_address_e[47:0];
assign  exu_lsu_tid[2:0] = lsu_tid_e[2:0];
assign  exu_lsu_regid[4:0] = `SPC6.dec.dec_lsu_rd_e[4:0];
assign  exu_lsu_data[63:0] = `SPC6.exu_lsu_store_data_e[63:0];
assign  exu_lsu_instr[31:0] =   ({32{`SPC6.dec.dec_lsu_sel0_e}} & 
                                inst0_e[31:0]) |
                                ({32{~`SPC6.dec.dec_lsu_sel0_e}} & 
                                inst1_e[31:0]);
assign ld_inst_d = `SPC6.dec.dec_ld_inst_d;

///////////////////////////////////////////////////////////////////////////////
// Debugging Instruction Opcodes Pipeline
///////////////////////////////////////////////////////////////////////////////


   reg [31:0] op_0_w;
   reg [31:0] op_1_w;
   reg [31:0] op_2_w;
   reg [31:0] op_3_w;
   reg [31:0] op_4_w;
   reg [31:0] op_5_w;
   reg [31:0] op_6_w;
   reg [31:0] op_7_w;

   reg [31:0] op0_b;
   reg [31:0] op0_m;
   reg [31:0] op0_e;
   reg [31:0] op0_d;

   reg [31:0] op1_b;
   reg [31:0] op1_m;
   reg [31:0] op1_e;
   reg [31:0] op1_d;

   reg [255:0] inst0_string_w;
   reg [255:0] inst0_string_b;
   reg [255:0] inst0_string_m;
   reg [255:0] inst0_string_e;
   reg [255:0] inst0_string_d;

   reg [255:0] inst1_string_w;
   reg [255:0] inst1_string_b;
   reg [255:0] inst1_string_m;
   reg [255:0] inst1_string_e;
   reg [255:0] inst1_string_d;

   reg [255:0] inst0_string_p;
   reg [255:0] inst1_string_p;
   reg [255:0] inst2_string_p;
   reg [255:0] inst3_string_p;
   reg [255:0] inst4_string_p;
   reg [255:0] inst5_string_p;
   reg [255:0] inst6_string_p;
   reg [255:0] inst7_string_p;

initial begin
    op_0_w = 32'b0;
    op_1_w = 32'b0;
    op_2_w = 32'b0;
    op_3_w = 32'b0;
    op_4_w = 32'b0;
    op_5_w = 32'b0;
    op_6_w = 32'b0;
    op_7_w = 32'b0;
end

always @(posedge `BENCH_SPC6_GCLK) begin // {
  op_0_w <= ({32 { select_pc_b[0]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[0]}} & op_0_w[31:0]) ;
  op_1_w <= ({32 { select_pc_b[1]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[1]}} & op_1_w[31:0]) ;
  op_2_w <= ({32 { select_pc_b[2]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[2]}} & op_2_w[31:0]) ;
  op_3_w <= ({32 { select_pc_b[3]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[3]}} & op_3_w[31:0]) ;
  op_4_w <= ({32 { select_pc_b[4]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[4]}} & op_4_w[31:0]) ;
  op_5_w <= ({32 { select_pc_b[5]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[5]}} & op_5_w[31:0]) ;
  op_6_w <= ({32 { select_pc_b[6]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[6]}} & op_6_w[31:0]) ;
  op_7_w <= ({32 { select_pc_b[7]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[7]}} & op_7_w[31:0]) ;

  op0_b <= op0_m;
  op0_m <= op0_e;
  op0_e <= op0_d;
  op0_d <= `SPC6.dec.ded0.decode_mux[31:0];

  op1_b <= op1_m;
  op1_m <= op1_e;
  op1_e <= op1_d;
  op1_d <= `SPC6.dec.ded1.decode_mux[31:0];

  inst0_string_w<=inst0_string_b;
  inst0_string_b<=inst0_string_m;
  inst0_string_m<=inst0_string_e;
  inst0_string_e<=inst0_string_d;
  inst0_string_d<=xlate(`SPC6.dec.ded0.decode_mux[31:0]);

  inst1_string_w<=inst1_string_b;
  inst1_string_b<=inst1_string_m;
  inst1_string_m<=inst1_string_e;
  inst1_string_e<=inst1_string_d;
  inst1_string_d<=xlate(`SPC6.dec.ded1.decode_mux[31:0]);

// instructions for each thread at pick
  inst0_string_p<=xlate(`SPC6.ifu_ibu.ibf0.buf0_in[31:0]);
  inst1_string_p<=xlate(`SPC6.ifu_ibu.ibf1.buf0_in[31:0]);
  inst2_string_p<=xlate(`SPC6.ifu_ibu.ibf2.buf0_in[31:0]);
  inst3_string_p<=xlate(`SPC6.ifu_ibu.ibf3.buf0_in[31:0]);
  inst4_string_p<=xlate(`SPC6.ifu_ibu.ibf4.buf0_in[31:0]);
  inst5_string_p<=xlate(`SPC6.ifu_ibu.ibf5.buf0_in[31:0]);
  inst6_string_p<=xlate(`SPC6.ifu_ibu.ibf6.buf0_in[31:0]);
  inst7_string_p<=xlate(`SPC6.ifu_ibu.ibf7.buf0_in[31:0]);

end //}

///////////////////////////////////////////////////////////////////////////////
// Functions 
///////////////////////////////////////////////////////////////////////////////
function [2:0] onehot2tid;
   input [7:0] onehot;

   begin

   if      (onehot[7:0]==8'b00000001) onehot2tid[2:0] = 3'b000;
   else if (onehot[7:0]==8'b00000010) onehot2tid[2:0] = 3'b001;
   else if (onehot[7:0]==8'b00000100) onehot2tid[2:0] = 3'b010;
   else if (onehot[7:0]==8'b00001000) onehot2tid[2:0] = 3'b011;
   else if (onehot[7:0]==8'b00010000) onehot2tid[2:0] = 3'b100;
   else if (onehot[7:0]==8'b00100000) onehot2tid[2:0] = 3'b101;
   else if (onehot[7:0]==8'b01000000) onehot2tid[2:0] = 3'b110;
   else if (onehot[7:0]==8'b10000000) onehot2tid[2:0] = 3'b111;
   
   end
endfunction

function [7:0] tid2onehot;
   input [2:0] tid;

   begin

   if      (tid[2:0]==3'b000) tid2onehot[7:0] = 8'b00000001;
   else if (tid[2:0]==3'b001) tid2onehot[7:0] = 8'b00000010;
   else if (tid[2:0]==3'b010) tid2onehot[7:0] = 8'b00000100;
   else if (tid[2:0]==3'b011) tid2onehot[7:0] = 8'b00001000;
   else if (tid[2:0]==3'b100) tid2onehot[7:0] = 8'b00010000;
   else if (tid[2:0]==3'b101) tid2onehot[7:0] = 8'b00100000;
   else if (tid[2:0]==3'b110) tid2onehot[7:0] = 8'b01000000;
   else if (tid[2:0]==3'b111) tid2onehot[7:0] = 8'b10000000;
   
   end
endfunction

//---------------------

function [255:0] xlate;
   input [31:0] inst;

   begin
     casex(inst[31:0])
32'b10xxxxx110100xxxxx001000011xxxxx : xlate[255:0]="FADDq";
32'b10xxxxx110100xxxxx001000111xxxxx : xlate[255:0]="FSUBq";
32'b10000xx110101xxxxx001010011xxxxx : xlate[255:0]="FCMPq";
32'b10000xx110101xxxxx001010111xxxxx : xlate[255:0]="FCMPEq";
32'b10xxxxx110100xxxxx011001101xxxxx : xlate[255:0]="FsTOq";
32'b10xxxxx110100xxxxx011001110xxxxx : xlate[255:0]="FdTOq";
32'b10xxxxx110100xxxxx010001100xxxxx : xlate[255:0]="FxTOq";
32'b10xxxxx110100xxxxx011001100xxxxx : xlate[255:0]="FiTOq";
32'b10xxxxx110100xxxxx000000011xxxxx : xlate[255:0]="FMOVq";
32'b10xxxxx110100xxxxx000000111xxxxx : xlate[255:0]="FNEGq";
32'b10xxxxx110100xxxxx000001011xxxxx : xlate[255:0]="FABSq";
32'b10xxxxx110100xxxxx001001011xxxxx : xlate[255:0]="FMULq";
32'b10xxxxx110100xxxxx001101110xxxxx : xlate[255:0]="FdMULq";
32'b10xxxxx110100xxxxx001001111xxxxx : xlate[255:0]="FDIVq";
32'b10xxxxx110100xxxxx000101011xxxxx : xlate[255:0]="FSQRTq";
32'b10xxxxx1101010xxxx0xx100111xxxxx : xlate[255:0]="FMOVrQa";
32'b10xxxxx1101010xxxx0x1x00111xxxxx : xlate[255:0]="FMOVrQb";
32'b10xxxxx110100xxxxx011010011xxxxx : xlate[255:0]="FqTOi";
32'b10xxxxx110100xxxxx010000011xxxxx : xlate[255:0]="FqTOx";
32'b10xxxxx110100xxxxx011000111xxxxx : xlate[255:0]="FqTOs";
32'b10xxxxx110100xxxxx011001011xxxxx : xlate[255:0]="FqTOd";
32'b11xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQF";
32'b11xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFi";
32'b11xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQFA";
32'b11xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFAi";
32'b11xxxxx100110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFi";
32'b11xxxxx100110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQF";
32'b11xxxxx110110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQFA";
32'b11xxxxx110110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFAi";
32'b10xxxxx1101010xxxxxxx000011xxxxx : xlate[255:0]="FMOVQcc";
32'b10xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADD";
32'b10xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDcc";
32'b10xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDC";
32'b10xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDCcc";
32'b10xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDi";
32'b10xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDcci";
32'b10xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCi";
32'b10xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCcci";
32'b00x0xx1011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr1";
32'b00x0x1x011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr2";
32'b00xx000110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfccA";
32'b00xx1xx110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc1";
32'b00xxx1x110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc2";
32'b00xxxx1110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc3";
32'b00xx000101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfccA";
32'b00xx1xx101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc1";
32'b00xxx1x101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc2";
32'b00xxxx1101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc3";
32'b00xx000010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BiccA";
32'b00xx1xx010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc1";
32'b00xxx1x010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc2";
32'b00xxxx1010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc3";
32'b00xx000001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPccA";
32'b00xx1xx001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc1";
32'b00xxx1x001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc2";
32'b00xxxx1001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc3";
32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="CALL";
32'b11xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASA";
32'b11xxxxx111110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASXA";
32'b11xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASAi";
32'b11xxxxx111110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASXAi";
32'b10xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIV";
32'b10xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIV";
32'b10xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVcc";
32'b10xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVcc";
32'b10xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVi";
32'b10xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVi";
32'b10xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVcci";
32'b10xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVcci";
32'b1000000111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="DONE";
32'b1000001111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RETRY";
32'b10xxxxx110100xxxxx001000001xxxxx : xlate[255:0]="FADDs";
32'b10xxxxx110100xxxxx001000010xxxxx : xlate[255:0]="FADDd";
32'b10xxxxx110100xxxxx001000101xxxxx : xlate[255:0]="FSUBs";
32'b10xxxxx110100xxxxx001000110xxxxx : xlate[255:0]="FSUBd";
32'b10000xx110101xxxxx001010001xxxxx : xlate[255:0]="FCMPs";
32'b10000xx110101xxxxx001010010xxxxx : xlate[255:0]="FCMPd";
32'b10000xx110101xxxxx001010101xxxxx : xlate[255:0]="FCMPEs";
32'b10000xx110101xxxxx001010110xxxxx : xlate[255:0]="FCMPEd";
32'b10xxxxx110100xxxxx010000001xxxxx : xlate[255:0]="FsTOx";
32'b10xxxxx110100xxxxx010000010xxxxx : xlate[255:0]="FdTOx";
32'b10xxxxx110100xxxxx011010001xxxxx : xlate[255:0]="FsTOi";
32'b10xxxxx110100xxxxx011010010xxxxx : xlate[255:0]="FdTOi";
32'b10xxxxx110100xxxxx011001001xxxxx : xlate[255:0]="FsTOd";
32'b10xxxxx110100xxxxx011000110xxxxx : xlate[255:0]="FdTOs";
32'b10xxxxx110100xxxxx010000100xxxxx : xlate[255:0]="FxTOs";
32'b10xxxxx110100xxxxx010001000xxxxx : xlate[255:0]="FxTOd";
32'b10xxxxx110100xxxxx011000100xxxxx : xlate[255:0]="FiTOs";
32'b10xxxxx110100xxxxx011001000xxxxx : xlate[255:0]="FiTOd";
32'b10xxxxx110100xxxxx000000001xxxxx : xlate[255:0]="FMOVs";
32'b10xxxxx110100xxxxx000000010xxxxx : xlate[255:0]="FMOVd";
32'b10xxxxx110100xxxxx000000101xxxxx : xlate[255:0]="FNEGs";
32'b10xxxxx110100xxxxx000000110xxxxx : xlate[255:0]="FNEGd";
32'b10xxxxx110100xxxxx000001001xxxxx : xlate[255:0]="FABSs";
32'b10xxxxx110100xxxxx000001010xxxxx : xlate[255:0]="FABSd";
32'b10xxxxx110100xxxxx001001001xxxxx : xlate[255:0]="FMULs";
32'b10xxxxx110100xxxxx001001010xxxxx : xlate[255:0]="FMULd";
32'b10xxxxx110100xxxxx001101001xxxxx : xlate[255:0]="FsMULd";
32'b10xxxxx110100xxxxx001001101xxxxx : xlate[255:0]="FDIVs";
32'b10xxxxx110100xxxxx001001110xxxxx : xlate[255:0]="FDIVd";
32'b10xxxxx110100xxxxx000101001xxxxx : xlate[255:0]="FSQRTs";
32'b10xxxxx110100xxxxx000101010xxxxx : xlate[255:0]="FSQRTd";
32'b10xxxxx111011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSH";
32'b10xxxxx111011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="FLUSHi";
32'b10xxxxx101011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSHw";
32'b10xxxxx111000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="JMPL";
32'b10xxxxx111000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="JMPLi";
32'b11xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDF";
32'b11xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDF";
32'b1100000100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFSR";
32'b1100001100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXFSR";
32'b11xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFi";
32'b11xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFi";
32'b1100000100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFSRi";
32'b1100001100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXFSRi";
32'b11xxxxx110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFA";
32'b11xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDFA";
32'b11xxxxx110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFAi";
32'b11xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFAi";
32'b11xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSB";
32'b11xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSH";
32'b11xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSW";
32'b11xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUB";
32'b11xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUH";
32'b11xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUW";
32'b11xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDX";
32'b11xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDD";
32'b11xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBi";
32'b11xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHi";
32'b11xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWi";
32'b11xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBi";
32'b11xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHi";
32'b11xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWi";
32'b11xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXi";
32'b11xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDi";
32'b11xxxxx011001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSBA";
32'b11xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSHA";
32'b11xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSWA";
32'b11xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUBA";
32'b11xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUHA";
32'b11xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUWA";
32'b11xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXA";
32'b11xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDA";
32'b11xxxxx011001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBAi";
32'b11xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHAi";
32'b11xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWAi";
32'b11xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBAi";
32'b11xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHAi";
32'b11xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWAi";
32'b11xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXAi";
32'b11xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDAi";
32'b11xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUB";
32'b11xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBi";
32'b11xxxxx011101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUBA";
32'b11xxxxx011101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBAi";
32'b10xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="AND";
32'b10xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDcc";
32'b10xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDN";
32'b10xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDNcc";
32'b10xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="OR";
32'b10xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORcc";
32'b10xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORN";
32'b10xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORNcc";
32'b10xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XOR";
32'b10xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XORcc";
32'b10xxxxx000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNOR";
32'b10xxxxx010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNORcc";
32'b10xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDi";
32'b10xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDcci";
32'b10xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNi";
32'b10xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNcci";
32'b10xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORi";
32'b10xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORcci";
32'b10xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNi";
32'b10xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNcci";
32'b10xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORi";
32'b10xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORcci";
32'b10xxxxx000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORi";
32'b10xxxxx010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORcci";
32'b1000000101000011111xxxxxxxxxxxxx : xlate[255:0]="MEMBAR";
32'b1000000101000011110xxxxxxxxxxxxx : xlate[255:0]="STBAR";
32'b10xxxxx101000000000xxxxxxxxxxxxx : xlate[255:0]="RDY";
32'b10xxxxx101000000100xxxxxxxxxxxxx : xlate[255:0]="RDCCR";
32'b10xxxxx101000000110xxxxxxxxxxxxx : xlate[255:0]="RDASI";
32'b10xxxxx101000001000xxxxxxxxxxxxx : xlate[255:0]="RDTICK";
32'b10xxxxx101000001010xxxxxxxxxxxxx : xlate[255:0]="RDPC";
32'b10xxxxx101000001100xxxxxxxxxxxxx : xlate[255:0]="RDFPRS";
32'b10xxxxx101000100110xxxxxxxxxxxxx : xlate[255:0]="RDGSR";
32'b10xxxxx101000100000xxxxxxxxxxxxx : xlate[255:0]="RDPCR";
32'b10xxxxx101000100010xxxxxxxxxxxxx : xlate[255:0]="RDPIC";
32'b10xxxxx1101010xxxx0xx000001xxxxx : xlate[255:0]="FMOVSfcc";
32'b10xxxxx1101010xxxx1xx000001xxxxx : xlate[255:0]="FMOVSxcc";
32'b10xxxxx1101010xxxx0xx000010xxxxx : xlate[255:0]="FMOVDfcc";
32'b10xxxxx1101010xxxx1xx000010xxxxx : xlate[255:0]="FMOVDxcc";
32'b10xxxxx110101xxxxx0xx100101xxxxx : xlate[255:0]="FMOVrS1";
32'b10xxxxx110101xxxxx0x1x00101xxxxx : xlate[255:0]="FMOVrS2";
32'b10xxxxx110101xxxxx0xx100110xxxxx : xlate[255:0]="FMOVrD1";
32'b10xxxxx110101xxxxx0x1x00110xxxxx : xlate[255:0]="FMOVrD2";
32'b10xxxxx1011001xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVxcc";
32'b10xxxxx1011001xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVxcci";
32'b10xxxxx1011000xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVfcc";
32'b10xxxxx1011000xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVfcci";
32'b10xxxxx101111xxxxx0xx1xxxxxxxxxx : xlate[255:0]="MOVR1";
32'b10xxxxx101111xxxxx0x1xxxxxxxxxxx : xlate[255:0]="MOVR2";
32'b10xxxxx101111xxxxx1xx1xxxxxxxxxx : xlate[255:0]="MOVRi1";
32'b10xxxxx101111xxxxx1x1xxxxxxxxxxx : xlate[255:0]="MOVRi2";
32'b10xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULX";
32'b10xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVX";
32'b10xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVX";
32'b10xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULXi";
32'b10xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVXi";
32'b10xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVXi";
32'b10xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMUL";
32'b10xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMUL";
32'b10xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMULcc";
32'b10xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMULcc";
32'b10xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULi";
32'b10xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULi";
32'b10xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULcci";
32'b10xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULcci";
32'b10xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULScc";
32'b10xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULScci";
32'b10xxxxx101110000000xxxxxxxxxxxxx : xlate[255:0]="POPC";
32'b10xxxxx101110000001xxxxxxxxxxxxx : xlate[255:0]="POPCi";
32'b11xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCH";
32'b11xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHi";
32'b11xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCHA";
32'b11xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHAi";
32'b10xxxxx101010xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDPR";
32'b10xxxxx101001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDHPR";
32'b10xxxxx111001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RETURN";
32'b10xxxxx111001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RETURNi";
32'b10xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SAVE";
32'b10xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SAVEi";
32'b10xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RESTORE";
32'b10xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RESTOREi";
32'b1000000110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="SAVED";
32'b1000001110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RESTORED";
32'b00xxxxx100xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="SETHI";
32'b10xxxxx100101xxxxx00xxxxxxxxxxxx : xlate[255:0]="SLL";
32'b10xxxxx100110xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRL";
32'b10xxxxx100111xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRA";
32'b10xxxxx100101xxxxx01xxxxxxxxxxxx : xlate[255:0]="SLLX";
32'b10xxxxx100110xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRLX";
32'b10xxxxx100111xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRAX";
32'b10xxxxx100101xxxxx10xxxxxxxxxxxx : xlate[255:0]="SLLi";
32'b10xxxxx100110xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRLi";
32'b10xxxxx100111xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRAi";
32'b10xxxxx100101xxxxx11xxxxxxxxxxxx : xlate[255:0]="SLLXi";
32'b10xxxxx100110xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRLXi";
32'b10xxxxx100111xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRAXi";
32'b11xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STF";
32'b11xxxxx100111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDF";
32'b1100000100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFSR";
32'b1100001100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXFSR";
32'b11xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFi";
32'b11xxxxx100111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFi";
32'b1100000100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFSRi";
32'b1100001100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXFSRi";
32'b11xxxxx110100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFA";
32'b11xxxxx110111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDFA";
32'b11xxxxx110100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFAi";
32'b11xxxxx110111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFAi";
32'b11xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STB";
32'b11xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STH";
32'b11xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STW";
32'b11xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STX";
32'b11xxxx0000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STD";
32'b11xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBi";
32'b11xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHi";
32'b11xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWi";
32'b11xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXi";
32'b11xxxx0000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDi";
32'b11xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STBA";
32'b11xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STHA";
32'b11xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STWA";
32'b11xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXA";
32'b11xxxx0010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDA";
32'b11xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBAi";
32'b11xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHAi";
32'b11xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWAi";
32'b11xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXAi";
32'b11xxxx0010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDAi";
32'b10xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUB";
32'b10xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBcc";
32'b10xxxxx001100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBC";
32'b10xxxxx011100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBCcc";
32'b10xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBi";
32'b10xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBcci";
32'b10xxxxx001100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCi";
32'b10xxxxx011100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCcci";
32'b11xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAP";
32'b11xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPi";
32'b11xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAPA";
32'b11xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPAi";
32'b10xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDcc";
32'b10xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDccTV";
32'b10xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDcci";
32'b10xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDccTVi";
32'b10xxxxx100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBcc";
32'b10xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBccTV";
32'b10xxxxx100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBcci";
32'b10xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBccTVi";
32'b10xxxxx111010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TCC";
32'b10xxxxx111010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TCCi";
32'b10xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPR";
32'b10xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPRi";
32'b10xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRHPR";
32'b10xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRHPRi";
32'b1000000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRY";
32'b1000010110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRCCR";
32'b1000011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRASI";
32'b1000110110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRFPRS";
32'b1010011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRGSR";
32'b1010000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPCR";
32'b1010001110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPIC";
32'b1000000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRYi";
32'b1000010110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRCCRi";
32'b1000011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRASIi";
32'b1000110110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRFPRSi";
32'b1010011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRGSRi";
32'b1010000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPCRi";
32'b1010001110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPICi";
32'b1001111110000000001xxxxxxxxxxxxx : xlate[255:0]="SIR";
32'b10xxxxx110110xxxxx001010000xxxxx : xlate[255:0]="FPADD16";
32'b10xxxxx110110xxxxx001010001xxxxx : xlate[255:0]="FPADD16S";
32'b10xxxxx110110xxxxx001010010xxxxx : xlate[255:0]="FPADD32";
32'b10xxxxx110110xxxxx001010011xxxxx : xlate[255:0]="FPADD32S";
32'b10xxxxx110110xxxxx001010100xxxxx : xlate[255:0]="FPSUB16";
32'b10xxxxx110110xxxxx001010101xxxxx : xlate[255:0]="FPSUB16S";
32'b10xxxxx110110xxxxx001010110xxxxx : xlate[255:0]="FPSUB32";
32'b10xxxxx110110xxxxx001010111xxxxx : xlate[255:0]="FPSUB32S";
32'b10xxxxx110110xxxxx000111011xxxxx : xlate[255:0]="FPACK16";
32'b10xxxxx110110xxxxx000111010xxxxx : xlate[255:0]="FPACK32";
32'b10xxxxx110110xxxxx000111101xxxxx : xlate[255:0]="FPACKFIX";
32'b10xxxxx110110xxxxx001001101xxxxx : xlate[255:0]="FEXPAND";
32'b10xxxxx110110xxxxx001001011xxxxx : xlate[255:0]="FPMERGE";
32'b10xxxxx110110xxxxx000110001xxxxx : xlate[255:0]="FMUL8x16";
32'b10xxxxx110110xxxxx000110011xxxxx : xlate[255:0]="FMUL8x16AU";
32'b10xxxxx110110xxxxx000110101xxxxx : xlate[255:0]="FMUL8x16AL";
32'b10xxxxx110110xxxxx000110110xxxxx : xlate[255:0]="FMUL8SUx16";
32'b10xxxxx110110xxxxx000110111xxxxx : xlate[255:0]="FMUL8ULx16";
32'b10xxxxx110110xxxxx000111000xxxxx : xlate[255:0]="FMULD8SUx16";
32'b10xxxxx110110xxxxx000111001xxxxx : xlate[255:0]="FMULD8ULx16";
32'b10xxxxx110110xxxxx000011000xxxxx : xlate[255:0]="ALIGNADDRESS";
32'b10xxxxx110110xxxxx000011010xxxxx : xlate[255:0]="ALIGNADDRESS_LITTLE";
32'b10xxxxx110110xxxxx000011001xxxxx : xlate[255:0]="BMASK";
32'b10xxxxx110110xxxxx001001000xxxxx : xlate[255:0]="FALIGNDATA";
32'b10xxxxx110110xxxxx001001100xxxxx : xlate[255:0]="BSHUFFLE";
32'b10xxxxx110110xxxxx001100000xxxxx : xlate[255:0]="FZERO";
32'b10xxxxx110110xxxxx001100001xxxxx : xlate[255:0]="FZEROS";
32'b10xxxxx110110xxxxx001111110xxxxx : xlate[255:0]="FONE";
32'b10xxxxx110110xxxxx001111111xxxxx : xlate[255:0]="FONES";
32'b10xxxxx110110xxxxx001110100xxxxx : xlate[255:0]="FSRC1";
32'b10xxxxx110110xxxxx001110101xxxxx : xlate[255:0]="FSRC1S";
32'b10xxxxx110110xxxxx001111000xxxxx : xlate[255:0]="FSRC2";
32'b10xxxxx110110xxxxx001111001xxxxx : xlate[255:0]="FSRC2S";
32'b10xxxxx110110xxxxx001101010xxxxx : xlate[255:0]="FNOT1";
32'b10xxxxx110110xxxxx001101011xxxxx : xlate[255:0]="FNOT1S";
32'b10xxxxx110110xxxxx001100110xxxxx : xlate[255:0]="FNOT2";
32'b10xxxxx110110xxxxx001100111xxxxx : xlate[255:0]="FNOT2S";
32'b10xxxxx110110xxxxx001111100xxxxx : xlate[255:0]="FOR";
32'b10xxxxx110110xxxxx001111101xxxxx : xlate[255:0]="FORS";
32'b10xxxxx110110xxxxx001100010xxxxx : xlate[255:0]="FNOR";
32'b10xxxxx110110xxxxx001100011xxxxx : xlate[255:0]="FNORS";
32'b10xxxxx110110xxxxx001110000xxxxx : xlate[255:0]="FAND";
32'b10xxxxx110110xxxxx001110001xxxxx : xlate[255:0]="FANDS";
32'b10xxxxx110110xxxxx001101110xxxxx : xlate[255:0]="FNAND";
32'b10xxxxx110110xxxxx001101111xxxxx : xlate[255:0]="FNANDS";
32'b10xxxxx110110xxxxx001101100xxxxx : xlate[255:0]="FXOR";
32'b10xxxxx110110xxxxx001101101xxxxx : xlate[255:0]="FXORS";
32'b10xxxxx110110xxxxx001110010xxxxx : xlate[255:0]="FXNOR";
32'b10xxxxx110110xxxxx001110011xxxxx : xlate[255:0]="FXNORS";
32'b10xxxxx110110xxxxx001111010xxxxx : xlate[255:0]="FORNOT1";
32'b10xxxxx110110xxxxx001111011xxxxx : xlate[255:0]="FORNOT1S";
32'b10xxxxx110110xxxxx001110110xxxxx : xlate[255:0]="FORNOT2";
32'b10xxxxx110110xxxxx001110111xxxxx : xlate[255:0]="FORNOT2S";
32'b10xxxxx110110xxxxx001101000xxxxx : xlate[255:0]="FANDNOT1";
32'b10xxxxx110110xxxxx001101001xxxxx : xlate[255:0]="FANDNOT1S";
32'b10xxxxx110110xxxxx001100100xxxxx : xlate[255:0]="FANDNOT2";
32'b10xxxxx110110xxxxx001100101xxxxx : xlate[255:0]="FANDNOT2S";
32'b10xxxxx110110xxxxx000101000xxxxx : xlate[255:0]="FCMPGT16";
32'b10xxxxx110110xxxxx000101100xxxxx : xlate[255:0]="FCMPGT32";
32'b10xxxxx110110xxxxx000100000xxxxx : xlate[255:0]="FCMPLE16";
32'b10xxxxx110110xxxxx000100100xxxxx : xlate[255:0]="FCMPLE32";
32'b10xxxxx110110xxxxx000100010xxxxx : xlate[255:0]="FCMPNE16";
32'b10xxxxx110110xxxxx000100110xxxxx : xlate[255:0]="FCMPNE32";
32'b10xxxxx110110xxxxx000101010xxxxx : xlate[255:0]="FCMPEQ16";
32'b10xxxxx110110xxxxx000101110xxxxx : xlate[255:0]="FCMPEQ32";
32'b10xxxxx110110xxxxx000111110xxxxx : xlate[255:0]="PDIST";
32'b10xxxxx110110xxxxx000000000xxxxx : xlate[255:0]="EDGE8";
32'b10xxxxx110110xxxxx000000001xxxxx : xlate[255:0]="EDGE8N";
32'b10xxxxx110110xxxxx000000010xxxxx : xlate[255:0]="EDGE8L";
32'b10xxxxx110110xxxxx000000011xxxxx : xlate[255:0]="EDGE8LN";
32'b10xxxxx110110xxxxx000000100xxxxx : xlate[255:0]="EDGE16";
32'b10xxxxx110110xxxxx000000101xxxxx : xlate[255:0]="EDGE16N";
32'b10xxxxx110110xxxxx000000110xxxxx : xlate[255:0]="EDGE16L";
32'b10xxxxx110110xxxxx000000111xxxxx : xlate[255:0]="EDGE16LN";
32'b10xxxxx110110xxxxx000001000xxxxx : xlate[255:0]="EDGE32";
32'b10xxxxx110110xxxxx000001001xxxxx : xlate[255:0]="EDGE32N";
32'b10xxxxx110110xxxxx000001010xxxxx : xlate[255:0]="EDGE32L";
32'b10xxxxx110110xxxxx000001011xxxxx : xlate[255:0]="EDGE32LN";
32'b10xxxxx110110xxxxx000010000xxxxx : xlate[255:0]="ARRAY8";
32'b10xxxxx110110xxxxx000010010xxxxx : xlate[255:0]="ARRAY16";
32'b10xxxxx110110xxxxx000010100xxxxx : xlate[255:0]="ARRAY32";
32'b10xxxxx110110xxxxx010000001xxxxx : xlate[255:0]="SIAM";
       default : xlate[255:0]="unknown";
    endcase   
   end
endfunction // xlate


`endif
   
endmodule

`endif


`ifdef CORE_7

module nas_probes7;


`ifdef GATESIM


`else
   reg [7:0] ex_valid_m;
   reg [7:0] ex_valid_b;
   reg [7:0] ex_valid_w;
   reg [7:0] return_f4;
   reg [2:0] ex0_tid_m;
   reg [2:0] ex1_tid_m;
   reg [2:0] ex0_tid_b;
   reg [2:0] ex1_tid_b;
   reg [2:0] ex0_tid_w;
   reg [2:0] ex1_tid_w;
   reg       fgu_valid_fb0;
   reg       fgu_valid_fb1;

   reg [31:0] inst0_e;
   reg [31:0] inst1_e;

   reg [7:0] fg_valid;

   reg fcc_valid_f4;
   reg fcc_valid_f5;
   reg fcc_valid_fb;

   reg fgu0_e;
   reg fgu1_e;
   reg lsu0_e;
   reg lsu1_e;

   reg [1:0] dcd_idest_e;
   reg [1:0] dcd_fdest_e;

   wire [7:0] ex_valid;
   wire [7:0] exception_w;

   wire [7:0] imul_valid;

   wire       fg_cond_fb;

   wire        exu_lsu_valid;
   wire [47:0] exu_lsu_addr;
   wire [31:0] exu_lsu_instr;
   wire [2:0]  exu_lsu_tid;
   wire [4:0]  exu_lsu_regid;
   wire [63:0] exu_lsu_data;

   wire [2:0] ex0_tid_e;
   wire [2:0] ex1_tid_e;
   wire       ex0_valid_e;
   wire       ex1_valid_e;
   wire [7:0] ex_asr_access;
   wire       ex_asr_valid;

   wire [7:0] lsu_valid;
   wire [2:0] lsu_tid;
   wire [7:0] lsu_tid_dec_b;
   wire       lsu_ld_valid;
   reg  [7:0] lsu_data_w;
   wire [7:0] lsu_data_b;

   wire ld_inst_d;

   reg [7:0] div_idest;
   reg [7:0] div_fdest;
   
   reg load0_e;
   reg load1_e;

   reg load_m;
   reg load_b;

   reg [2:0] lsu_tid_m;
   reg [7:0] lsu_complete_m;
   reg [7:0] lsu_complete_b;
   reg [7:0] lsu_trap_flush_d;	//reqd. for store buffer ue testing

   reg [7:0] ex_flush_w;
   reg [7:0] ex_flush_b;

   reg sel_divide0_e;
   reg sel_divide1_e;

   wire dec_flush_lb;

   wire [7:0] fgu_idiv_valid;

   wire [7:0] fgu_fdiv_valid;
   
   wire [7:0] fg_div_valid;

   wire       lsu_valid_b;

   wire [7:0] return_w;
   wire       return0;
   wire       return1;
   wire [7:0] real_exception;

   reg  [2:0] lsu_tid_b;
   reg        fmov_valid_fb;
   reg        fmov_valid_f5;
   reg        fmov_valid_f4;
   reg        fmov_valid_f3;
   reg        fmov_valid_f2;
   reg        fmov_valid_m;
   reg        fmov_valid_e;

   reg        fg_flush_fb;
   reg        fg_flush_f5;
   reg        fg_flush_f4;
   reg        fg_flush_f3;
   reg        fg_flush_f2;

   reg       siam0_d;   
   reg       siam1_d;   

   reg       done0_d;
   reg       done1_d;
   reg       retry0_d;
   reg       retry1_d;
   reg       done0_e;
   reg       done1_e;
   reg       retry0_e;
   reg       retry1_e;
   reg       tlu_ccr_cwp_0_valid_last;
   reg       tlu_ccr_cwp_1_valid_last;
   reg [7:0] fg_fdiv_valid_fw;
   reg [7:0] asi_in_progress_b;
   reg [7:0] asi_in_progress_w;
   reg [7:0] asi_in_progress_fx4;
   reg [7:0] tlu_valid;
   reg [7:0] sync_reset_w;
            
   reg [7:0] div_special_cancel_f4;

   reg       asi_store_b;
   reg       asi_store_w;
   reg [2:0] dcc_tid_b;
   reg [2:0] dcc_tid_w;
   reg [7:0] asi_valid_w;
   reg [7:0] asi_valid_fx4;
   reg [7:0] asi_valid_fx5;

   reg [7:0] lsu_state;
   reg [7:0] lsu_check;
   reg [2:0] lsu_tid_e;

   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;

   reg fgu_err_fx3; 
   reg fgu_err_fx4; 
   reg fgu_err_fx5; 
   reg fgu_err_fb; 

   reg clkstop_d1;
   reg clkstop_d2;
   reg clkstop_d3;
   reg clkstop_d4;
   reg clkstop_d5;

integer i;
integer start_dmiss0;
integer start_dmiss1;
integer start_dmiss2;
integer start_dmiss3;
integer start_dmiss4;
integer start_dmiss5;
integer start_dmiss6;
integer start_dmiss7;
integer number_dmiss;
integer start_imiss0;
integer start_imiss1;
integer start_imiss2;
integer start_imiss3;
integer start_imiss4;
integer start_imiss5;
integer start_imiss6;
integer start_imiss7;
integer active_imiss0;
integer active_imiss1;
integer active_imiss2;
integer active_imiss3;
integer active_imiss4;
integer active_imiss5;
integer active_imiss6;
integer active_imiss7;
integer first_imiss0;
integer first_imiss1;
integer first_imiss2;
integer first_imiss3;
integer first_imiss4;
integer first_imiss5;
integer first_imiss6;
integer first_imiss7;
integer number_imiss;
integer clock;
integer sum_dmiss_latency;
integer sum_imiss_latency;
reg spec_dmiss;
integer dmiss_cnt;
integer imiss_cnt;
reg pcx_req;
integer l15dmiss_cnt;
integer l15imiss_cnt;


initial begin // {
    pcx_req=0;
    l15imiss_cnt=0;
    l15dmiss_cnt=0;
    imiss_cnt=0;
    dmiss_cnt=0;
    clock=0;
    start_dmiss0=0;
    start_dmiss1=0;
    start_dmiss2=0;
    start_dmiss3=0;
    start_dmiss4=0;
    start_dmiss5=0;
    start_dmiss6=0;
    start_dmiss7=0;
    number_dmiss=0;
    start_imiss0=0;
    start_imiss1=0;
    start_imiss2=0;
    start_imiss3=0;
    start_imiss4=0;
    start_imiss5=0;
    start_imiss6=0;
    start_imiss7=0;
    active_imiss0=0;
    active_imiss1=0;
    active_imiss2=0;
    active_imiss3=0;
    active_imiss4=0;
    active_imiss5=0;
    active_imiss6=0;
    active_imiss7=0;
    first_imiss0=0;
    first_imiss1=0;
    first_imiss2=0;
    first_imiss3=0;
    first_imiss4=0;
    first_imiss5=0;
    first_imiss6=0;
    first_imiss7=0;
    number_imiss=0;
    sum_dmiss_latency=0;
    sum_imiss_latency=0;
    asi_in_progress_b <= 8'h0;
    asi_in_progress_w <= 8'h0;
    asi_in_progress_fx4 <= 8'h0;
    tlu_valid <= 8'h0;
    div_idest <= 8'h0;
    div_fdest <= 8'h0;
    lsu_state <= 8'h0;
    clkstop_d1 <=0;
    clkstop_d2 <=0;
    clkstop_d3 <=0;
    clkstop_d4 <=0;
    clkstop_d5 <=0;

end //}

wire [7:0] asi_store_flush_w =  {`SPC7.lsu.sbs7.flush_st_w,
                                 `SPC7.lsu.sbs6.flush_st_w,
                                 `SPC7.lsu.sbs5.flush_st_w,
                                 `SPC7.lsu.sbs4.flush_st_w,
                                 `SPC7.lsu.sbs3.flush_st_w,
                                 `SPC7.lsu.sbs2.flush_st_w,
                                 `SPC7.lsu.sbs1.flush_st_w,
                                 `SPC7.lsu.sbs0.flush_st_w};

wire [7:0] store_sync = {`SPC7.lsu.sbs7.trap_sync,
                         `SPC7.lsu.sbs6.trap_sync,
                         `SPC7.lsu.sbs5.trap_sync,
                         `SPC7.lsu.sbs4.trap_sync,
                         `SPC7.lsu.sbs3.trap_sync,
                         `SPC7.lsu.sbs2.trap_sync,
                         `SPC7.lsu.sbs1.trap_sync,
                         `SPC7.lsu.sbs0.trap_sync};
wire [7:0] sync_reset = {`SPC7.lsu.sbs7.sync_state_rst,
                         `SPC7.lsu.sbs6.sync_state_rst,
                         `SPC7.lsu.sbs5.sync_state_rst,
                         `SPC7.lsu.sbs4.sync_state_rst,
                         `SPC7.lsu.sbs3.sync_state_rst,
                         `SPC7.lsu.sbs2.sync_state_rst,
                         `SPC7.lsu.sbs1.sync_state_rst,
                         `SPC7.lsu.sbs0.sync_state_rst};

//--------------------
// Used in nas_pipe for TSB Config Regs Capture/Compare
// ADD_TSB_CFG

// NOTE - ADD_TSB_CFG will never be used for Axis or Tharas
`ifndef EMUL
wire [63:0] ctxt_z_tsb_cfg0_reg [7:0];  // 1 per thread
wire [63:0] ctxt_z_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_z_tsb_cfg3_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg0_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg1_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg2_reg [7:0];
wire [63:0] ctxt_nz_tsb_cfg3_reg [7:0];

// There are 32 entries in each MMU MRA but not all are needed.
// Indexing:
// Bits 4:3 of the address are the lower two bits of the TID
// Bits 2:0 of the address select the register as below
//   mmu.mra0.array.mem for T0-T3
//   mmu.mra1.array.mem for T4-T7
// (this is documented in mmu_asi_ctl.sv)
//		z TSB cfg 0,1				address 0
//		z TSB cfg 2,3				address 1
//		nz TSB cfg 0,1				address 2
//		nz TSB cfg 2,3				address 3
//		Real range, physical offset pair 0	address 4
//		Real range, physical offset pair 1	address 5
//		Real range, physical offset pair 2	address 6
//		Real range, physical offset pair 3	address 7

wire [83:0] mmu_mra0_a0 = `SPC7.mmu.mra0.array.mem[0];
wire [83:0] mmu_mra0_a8 = `SPC7.mmu.mra0.array.mem[8];
wire [83:0] mmu_mra0_a16 = `SPC7.mmu.mra0.array.mem[16];
wire [83:0] mmu_mra0_a24 = `SPC7.mmu.mra0.array.mem[24];
wire [83:0] mmu_mra0_a1 = `SPC7.mmu.mra0.array.mem[1];
wire [83:0] mmu_mra0_a9 = `SPC7.mmu.mra0.array.mem[9];
wire [83:0] mmu_mra0_a17 = `SPC7.mmu.mra0.array.mem[17];
wire [83:0] mmu_mra0_a25 = `SPC7.mmu.mra0.array.mem[25];
wire [83:0] mmu_mra0_a2 = `SPC7.mmu.mra0.array.mem[2];
wire [83:0] mmu_mra0_a10 = `SPC7.mmu.mra0.array.mem[10];
wire [83:0] mmu_mra0_a18 = `SPC7.mmu.mra0.array.mem[18];
wire [83:0] mmu_mra0_a26 = `SPC7.mmu.mra0.array.mem[26];
wire [83:0] mmu_mra0_a3 = `SPC7.mmu.mra0.array.mem[3];
wire [83:0] mmu_mra0_a11 = `SPC7.mmu.mra0.array.mem[11];
wire [83:0] mmu_mra0_a19 = `SPC7.mmu.mra0.array.mem[19];
wire [83:0] mmu_mra0_a27 = `SPC7.mmu.mra0.array.mem[27];
wire [83:0] mmu_mra1_a0 = `SPC7.mmu.mra1.array.mem[0];
wire [83:0] mmu_mra1_a8 = `SPC7.mmu.mra1.array.mem[8];
wire [83:0] mmu_mra1_a16 = `SPC7.mmu.mra1.array.mem[16];
wire [83:0] mmu_mra1_a24 = `SPC7.mmu.mra1.array.mem[24];
wire [83:0] mmu_mra1_a1 = `SPC7.mmu.mra1.array.mem[1];
wire [83:0] mmu_mra1_a9 = `SPC7.mmu.mra1.array.mem[9];
wire [83:0] mmu_mra1_a17 = `SPC7.mmu.mra1.array.mem[17];
wire [83:0] mmu_mra1_a25 = `SPC7.mmu.mra1.array.mem[25];
wire [83:0] mmu_mra1_a2 = `SPC7.mmu.mra1.array.mem[2];
wire [83:0] mmu_mra1_a10 = `SPC7.mmu.mra1.array.mem[10];
wire [83:0] mmu_mra1_a18 = `SPC7.mmu.mra1.array.mem[18];
wire [83:0] mmu_mra1_a26 = `SPC7.mmu.mra1.array.mem[26];
wire [83:0] mmu_mra1_a3 = `SPC7.mmu.mra1.array.mem[3];
wire [83:0] mmu_mra1_a11 = `SPC7.mmu.mra1.array.mem[11];
wire [83:0] mmu_mra1_a19 = `SPC7.mmu.mra1.array.mem[19];
wire [83:0] mmu_mra1_a27 = `SPC7.mmu.mra1.array.mem[27];


// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[0] = {`SPC7.mmu.asi.t0_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[0]  = {`SPC7.mmu.asi.t0_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[0]  = {`SPC7.mmu.asi.t0_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[0]  = {`SPC7.mmu.asi.t0_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[0] = {`SPC7.mmu.asi.t0_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[0] = {`SPC7.mmu.asi.t0_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[0] = {`SPC7.mmu.asi.t0_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[0] = {`SPC7.mmu.asi.t0_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[1] = {`SPC7.mmu.asi.t1_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[1]  = {`SPC7.mmu.asi.t1_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[1]  = {`SPC7.mmu.asi.t1_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[1]  = {`SPC7.mmu.asi.t1_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[1] = {`SPC7.mmu.asi.t1_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[1] = {`SPC7.mmu.asi.t1_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[1] = {`SPC7.mmu.asi.t1_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[1] = {`SPC7.mmu.asi.t1_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[2] = {`SPC7.mmu.asi.t2_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[2]  = {`SPC7.mmu.asi.t2_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[2]  = {`SPC7.mmu.asi.t2_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[2]  = {`SPC7.mmu.asi.t2_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[2] = {`SPC7.mmu.asi.t2_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[2] = {`SPC7.mmu.asi.t2_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[2] = {`SPC7.mmu.asi.t2_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[2] = {`SPC7.mmu.asi.t2_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[3] = {`SPC7.mmu.asi.t3_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra0_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[3]  = {`SPC7.mmu.asi.t3_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra0_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[3]  = {`SPC7.mmu.asi.t3_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[3]  = {`SPC7.mmu.asi.t3_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra0_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[3] = {`SPC7.mmu.asi.t3_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[3] = {`SPC7.mmu.asi.t3_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra0_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[3] = {`SPC7.mmu.asi.t3_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[3] = {`SPC7.mmu.asi.t3_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra0_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra0_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra0_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[4] = {`SPC7.mmu.asi.t4_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a0[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[4]  = {`SPC7.mmu.asi.t4_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a0[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a0[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a0[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[4]  = {`SPC7.mmu.asi.t4_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[4]  = {`SPC7.mmu.asi.t4_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a1[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a1[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a1[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[4] = {`SPC7.mmu.asi.t4_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[4] = {`SPC7.mmu.asi.t4_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a2[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a2[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a2[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[4] = {`SPC7.mmu.asi.t4_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[4] = {`SPC7.mmu.asi.t4_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a3[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a3[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a3[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[5] = {`SPC7.mmu.asi.t5_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a8[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[5]  = {`SPC7.mmu.asi.t5_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a8[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a8[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a8[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[5]  = {`SPC7.mmu.asi.t5_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[5]  = {`SPC7.mmu.asi.t5_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a9[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a9[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a9[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[5] = {`SPC7.mmu.asi.t5_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[5] = {`SPC7.mmu.asi.t5_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a10[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a10[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a10[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[5] = {`SPC7.mmu.asi.t5_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[5] = {`SPC7.mmu.asi.t5_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a11[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a11[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a11[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[6] = {`SPC7.mmu.asi.t6_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a16[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[6]  = {`SPC7.mmu.asi.t6_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a16[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a16[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a16[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[6]  = {`SPC7.mmu.asi.t6_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[6]  = {`SPC7.mmu.asi.t6_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a17[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a17[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a17[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[6] = {`SPC7.mmu.asi.t6_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[6] = {`SPC7.mmu.asi.t6_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a18[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a18[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a18[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[6] = {`SPC7.mmu.asi.t6_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[6] = {`SPC7.mmu.asi.t6_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a19[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a19[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a19[8:0]        // z_tsb_cfg0[8:0]
                                     };

// See Table 28-31 in PRM 0.8 (section 28.13) documents the indexing within a thread
// as well as the physical to architectural bit position relationships.
assign ctxt_z_tsb_cfg0_reg[7] = {`SPC7.mmu.asi.t7_e_z[0],  // z_tsb_cfg0[63]
                                     mmu_mra1_a24[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[47:39]      // z_tsb_cfg0[8:0]
                                    };
assign ctxt_z_tsb_cfg1_reg[7]  = {`SPC7.mmu.asi.t7_e_z[1], // z_tsb_cfg0[63]   
                                     mmu_mra1_a24[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a24[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a24[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg2_reg[7]  = {`SPC7.mmu.asi.t7_e_z[2], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_z_tsb_cfg3_reg[7]  = {`SPC7.mmu.asi.t7_e_z[3], // z_tsb_cfg0[63] 
                                     mmu_mra1_a25[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a25[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a25[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg0_reg[7] = {`SPC7.mmu.asi.t7_e_nz[0],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg1_reg[7] = {`SPC7.mmu.asi.t7_e_nz[1],// z_tsb_cfg0[63] 
                                     mmu_mra1_a26[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a26[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a26[8:0]        // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg2_reg[7] = {`SPC7.mmu.asi.t7_e_nz[2],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[76:75],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[74:48],     // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[47:39]      // z_tsb_cfg0[8:0]
                                     };
assign ctxt_nz_tsb_cfg3_reg[7] = {`SPC7.mmu.asi.t7_e_nz[3],// z_tsb_cfg0[63] 
                                     mmu_mra1_a27[37:36],     // z_tsb_cfg0[62:61]
                                     21'b0,                              // z_tsb_cfg0[60:40]
                                     mmu_mra1_a27[35:9],      // z_tsb_cfg0[39:13]
                                     4'b0,                               // z_tsb_cfg0[12:9]
                                     mmu_mra1_a27[8:0]        // z_tsb_cfg0[8:0]
                                     };
`endif // EMUL - ADD_TSB_CFG


// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
// Suppress instruction on flush or park request 
// (clear_disrupting_flush_pending_w_in & idl_req_in)
//   Suppress instruction for 'refetch' exception after 
//     not taken branch with annulled delay slot
// NOTE:  'with_errors' means that the signal actually IGNORES instruction
// cache errors and asserts IN SPITE OF instruction cache errors
wire [7:0] select_pc_b_with_errors = 
     {{4 {~`SPC7.dec_flush_b[1]}}, {4 {~`SPC7.dec_flush_b[0]}}} & 
     {{4 {~`SPC7.tlu.fls1.refetch_w_in}}, {4 {~`SPC7.tlu.fls0.refetch_w_in}}} &
     {~(`SPC7.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC7.tlu.fls1.idl_req_in}}),
      ~(`SPC7.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
        {4 {`SPC7.tlu.fls0.idl_req_in}})} &
     {`SPC7.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC7.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Qualify select_pc_b_with_errors to get final select_pc_b signal
// Qualifications are
// 	- instruction cache errors (ic_err_w_in)
//	- disrupting single step completion requests (dsc_req_in)
wire [7:0] select_pc_b = 
     select_pc_b_with_errors[7:0]  &
     {{4 {(~`SPC7.tlu.fls1.ic_err_w_in | `SPC7.tlu.fls1.itlb_nfo_exc_b) & 
          ~`SPC7.tlu.fls1.dsc_req_in}}, 
      {4 {(~`SPC7.tlu.fls0.ic_err_w_in | `SPC7.tlu.fls0.itlb_nfo_exc_b) & 
          ~`SPC7.tlu.fls0.dsc_req_in}}};

//------------------------------------

//original select_pc_b_with errors. Select_pc_b_with_errors is no longer asserted
//if the inst. following an annulled delay slot of a not taken branch has a prebuffer
//error and it reaches B stage. I still need a signal if this happens to trigger the chkr.

wire [7:0] select_pc_b_with_errors_and_refetch =
     {{4 {~`SPC7.dec_flush_b[1]}}, {4 {~`SPC7.dec_flush_b[0]}}} &
     {~(`SPC7.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC7.tlu.fls1.idl_req_in}}),
      ~(`SPC7.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] &
        {4 {`SPC7.tlu.fls0.idl_req_in}})} &
     {`SPC7.tlu.fls1.tid_dec_valid_b[3:0],
      `SPC7.tlu.fls0.tid_dec_valid_b[3:0]};

// Signals required for bench TLB sync & LDST sync

reg        tlb_bypass_m;
reg        tlb_bypass_b;
reg        tlb_rd_vld_m;
reg        tlb_rd_vld_b;
reg        lsu_tl_gt_0_b;
reg  [7:0] dcc_asi_b;
reg        asi_internal_w;

always @ (posedge `BENCH_SPC7_GCLK) begin // {

  clkstop_d1 <= `SPC7.tcu_clk_stop;
  clkstop_d2 <= clkstop_d1;
  clkstop_d3 <= clkstop_d2;
  clkstop_d4 <= clkstop_d3;
  clkstop_d5 <= clkstop_d4;

  tlb_bypass_m <= `SPC7.lsu.tlb.tlb_bypass;
  tlb_bypass_b <= tlb_bypass_m;
  tlb_rd_vld_m <= `SPC7.lsu.tlb.tlb_rd_vld | `SPC7.lsu.tlb.tlb_cam_vld;
  tlb_rd_vld_b <= tlb_rd_vld_m;

  // This signal is only valid for LD/ST instructions
  lsu_tl_gt_0_b <= `SPC7.lsu.dcc.tl_gt_0_m;

  // Can't use lsu.dcc_asi_b for tlb_sync so pipeline from M to B
  dcc_asi_b <= `SPC7.lsu.dcc_asi_m;

  // LD/ST that will not issue to the crossbar
  asi_internal_w <= `SPC7.lsu.dcc.asi_internal_b;
end // }

// TL determines whether Nucleus or Primary
wire [7:0] asi_num = `SPC7.lsu.dcc.altspace_ldst_b ? 
                     dcc_asi_b : 
                     (lsu_tl_gt_0_b ? 8'h04 : 8'h80);

wire [7:0] itlb_miss   = { (`SPC7.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_itb_miss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire [7:0] icache_miss = { (`SPC7.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                           (`SPC7.ifu_ftu.ftu_agc_ctl.itb_cmiss_c &  
                            `SPC7.ifu_ftu.ftu_agc_ctl.agc_fetch_v_c & 
                            `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                         };

wire inst_bypass = (`SPC7.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[0] |
                    `SPC7.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[1] |
                    `SPC7.ifu_ftu.ftu_agc_ctl.agc_bypass_selects[2]);

wire [7:0] fetch_bypass = { (inst_bypass & `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[7]),
                            (inst_bypass & `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[6]),
                            (inst_bypass & `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[5]),
                            (inst_bypass & `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[4]),
                            (inst_bypass & `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[3]),
                            (inst_bypass & `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[2]),
                            (inst_bypass & `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[1]),
                            (inst_bypass & `SPC7.ifu_ftu.ftu_agc_ctl.ftu_fetch_thr_c[0])
                          };

wire [7:0] itlb_wr = {(`SPC7.tlu.trl1.take_itw & `SPC7.tlu.trl1.trap[3]),
                      (`SPC7.tlu.trl1.take_itw & `SPC7.tlu.trl1.trap[2]),
                      (`SPC7.tlu.trl1.take_itw & `SPC7.tlu.trl1.trap[1]),
                      (`SPC7.tlu.trl1.take_itw & `SPC7.tlu.trl1.trap[0]),
                      (`SPC7.tlu.trl0.take_itw & `SPC7.tlu.trl0.trap[3]),
                      (`SPC7.tlu.trl0.take_itw & `SPC7.tlu.trl0.trap[2]),
                      (`SPC7.tlu.trl0.take_itw & `SPC7.tlu.trl0.trap[1]),
                      (`SPC7.tlu.trl0.take_itw & `SPC7.tlu.trl0.trap[0])
                     };

//------------------------------------

reg  [71:0] tick_cmpr_0; 
reg  [71:0] stick_cmpr_0; 
reg  [71:0] hstick_cmpr_0;
reg [151:0] trap_entry_1_t0;
reg [151:0] trap_entry_2_t0;
reg [151:0] trap_entry_3_t0;
reg [151:0] trap_entry_4_t0;
reg [151:0] trap_entry_5_t0;
reg [151:0] trap_entry_6_t0;

always @(posedge `BENCH_SPC7_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_0        <= `SPC7.tlu.tca.array.mem[{2'b0,3'h0}];
      stick_cmpr_0       <= `SPC7.tlu.tca.array.mem[{2'b01,3'h0}];
      hstick_cmpr_0      <= `SPC7.tlu.tca.array.mem[{2'b10,3'h0}];
      trap_entry_1_t0    <= `SPC7.tlu.tsa0.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t0    <= `SPC7.tlu.tsa0.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t0    <= `SPC7.tlu.tsa0.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t0    <= `SPC7.tlu.tsa0.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t0    <= `SPC7.tlu.tsa0.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t0    <= `SPC7.tlu.tsa0.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_1; 
reg  [71:0] stick_cmpr_1; 
reg  [71:0] hstick_cmpr_1;
reg [151:0] trap_entry_1_t1;
reg [151:0] trap_entry_2_t1;
reg [151:0] trap_entry_3_t1;
reg [151:0] trap_entry_4_t1;
reg [151:0] trap_entry_5_t1;
reg [151:0] trap_entry_6_t1;

always @(posedge `BENCH_SPC7_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_1        <= `SPC7.tlu.tca.array.mem[{2'b0,3'h1}];
      stick_cmpr_1       <= `SPC7.tlu.tca.array.mem[{2'b01,3'h1}];
      hstick_cmpr_1      <= `SPC7.tlu.tca.array.mem[{2'b10,3'h1}];
      trap_entry_1_t1    <= `SPC7.tlu.tsa0.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t1    <= `SPC7.tlu.tsa0.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t1    <= `SPC7.tlu.tsa0.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t1    <= `SPC7.tlu.tsa0.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t1    <= `SPC7.tlu.tsa0.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t1    <= `SPC7.tlu.tsa0.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_2; 
reg  [71:0] stick_cmpr_2; 
reg  [71:0] hstick_cmpr_2;
reg [151:0] trap_entry_1_t2;
reg [151:0] trap_entry_2_t2;
reg [151:0] trap_entry_3_t2;
reg [151:0] trap_entry_4_t2;
reg [151:0] trap_entry_5_t2;
reg [151:0] trap_entry_6_t2;

always @(posedge `BENCH_SPC7_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_2        <= `SPC7.tlu.tca.array.mem[{2'b0,3'h2}];
      stick_cmpr_2       <= `SPC7.tlu.tca.array.mem[{2'b01,3'h2}];
      hstick_cmpr_2      <= `SPC7.tlu.tca.array.mem[{2'b10,3'h2}];
      trap_entry_1_t2    <= `SPC7.tlu.tsa0.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t2    <= `SPC7.tlu.tsa0.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t2    <= `SPC7.tlu.tsa0.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t2    <= `SPC7.tlu.tsa0.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t2    <= `SPC7.tlu.tsa0.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t2    <= `SPC7.tlu.tsa0.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_3; 
reg  [71:0] stick_cmpr_3; 
reg  [71:0] hstick_cmpr_3;
reg [151:0] trap_entry_1_t3;
reg [151:0] trap_entry_2_t3;
reg [151:0] trap_entry_3_t3;
reg [151:0] trap_entry_4_t3;
reg [151:0] trap_entry_5_t3;
reg [151:0] trap_entry_6_t3;

always @(posedge `BENCH_SPC7_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_3        <= `SPC7.tlu.tca.array.mem[{2'b0,3'h3}];
      stick_cmpr_3       <= `SPC7.tlu.tca.array.mem[{2'b01,3'h3}];
      hstick_cmpr_3      <= `SPC7.tlu.tca.array.mem[{2'b10,3'h3}];
      trap_entry_1_t3    <= `SPC7.tlu.tsa0.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t3    <= `SPC7.tlu.tsa0.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t3    <= `SPC7.tlu.tsa0.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t3    <= `SPC7.tlu.tsa0.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t3    <= `SPC7.tlu.tsa0.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t3    <= `SPC7.tlu.tsa0.array.mem[{2'h3, 3'h5}];

end // }
reg  [71:0] tick_cmpr_4; 
reg  [71:0] stick_cmpr_4; 
reg  [71:0] hstick_cmpr_4;
reg [151:0] trap_entry_1_t4;
reg [151:0] trap_entry_2_t4;
reg [151:0] trap_entry_3_t4;
reg [151:0] trap_entry_4_t4;
reg [151:0] trap_entry_5_t4;
reg [151:0] trap_entry_6_t4;

always @(posedge `BENCH_SPC7_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_4        <= `SPC7.tlu.tca.array.mem[{2'b0,3'h4}];
      stick_cmpr_4       <= `SPC7.tlu.tca.array.mem[{2'b01,3'h4}];
      hstick_cmpr_4      <= `SPC7.tlu.tca.array.mem[{2'b10,3'h4}];
      trap_entry_1_t4    <= `SPC7.tlu.tsa1.array.mem[{2'h0, 3'h0}];
      trap_entry_2_t4    <= `SPC7.tlu.tsa1.array.mem[{2'h0, 3'h1}];
      trap_entry_3_t4    <= `SPC7.tlu.tsa1.array.mem[{2'h0, 3'h2}];
      trap_entry_4_t4    <= `SPC7.tlu.tsa1.array.mem[{2'h0, 3'h3}];
      trap_entry_5_t4    <= `SPC7.tlu.tsa1.array.mem[{2'h0, 3'h4}];
      trap_entry_6_t4    <= `SPC7.tlu.tsa1.array.mem[{2'h0, 3'h5}];

end // }
reg  [71:0] tick_cmpr_5; 
reg  [71:0] stick_cmpr_5; 
reg  [71:0] hstick_cmpr_5;
reg [151:0] trap_entry_1_t5;
reg [151:0] trap_entry_2_t5;
reg [151:0] trap_entry_3_t5;
reg [151:0] trap_entry_4_t5;
reg [151:0] trap_entry_5_t5;
reg [151:0] trap_entry_6_t5;

always @(posedge `BENCH_SPC7_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_5        <= `SPC7.tlu.tca.array.mem[{2'b0,3'h5}];
      stick_cmpr_5       <= `SPC7.tlu.tca.array.mem[{2'b01,3'h5}];
      hstick_cmpr_5      <= `SPC7.tlu.tca.array.mem[{2'b10,3'h5}];
      trap_entry_1_t5    <= `SPC7.tlu.tsa1.array.mem[{2'h1, 3'h0}];
      trap_entry_2_t5    <= `SPC7.tlu.tsa1.array.mem[{2'h1, 3'h1}];
      trap_entry_3_t5    <= `SPC7.tlu.tsa1.array.mem[{2'h1, 3'h2}];
      trap_entry_4_t5    <= `SPC7.tlu.tsa1.array.mem[{2'h1, 3'h3}];
      trap_entry_5_t5    <= `SPC7.tlu.tsa1.array.mem[{2'h1, 3'h4}];
      trap_entry_6_t5    <= `SPC7.tlu.tsa1.array.mem[{2'h1, 3'h5}];

end // }
reg  [71:0] tick_cmpr_6; 
reg  [71:0] stick_cmpr_6; 
reg  [71:0] hstick_cmpr_6;
reg [151:0] trap_entry_1_t6;
reg [151:0] trap_entry_2_t6;
reg [151:0] trap_entry_3_t6;
reg [151:0] trap_entry_4_t6;
reg [151:0] trap_entry_5_t6;
reg [151:0] trap_entry_6_t6;

always @(posedge `BENCH_SPC7_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_6        <= `SPC7.tlu.tca.array.mem[{2'b0,3'h6}];
      stick_cmpr_6       <= `SPC7.tlu.tca.array.mem[{2'b01,3'h6}];
      hstick_cmpr_6      <= `SPC7.tlu.tca.array.mem[{2'b10,3'h6}];
      trap_entry_1_t6    <= `SPC7.tlu.tsa1.array.mem[{2'h2, 3'h0}];
      trap_entry_2_t6    <= `SPC7.tlu.tsa1.array.mem[{2'h2, 3'h1}];
      trap_entry_3_t6    <= `SPC7.tlu.tsa1.array.mem[{2'h2, 3'h2}];
      trap_entry_4_t6    <= `SPC7.tlu.tsa1.array.mem[{2'h2, 3'h3}];
      trap_entry_5_t6    <= `SPC7.tlu.tsa1.array.mem[{2'h2, 3'h4}];
      trap_entry_6_t6    <= `SPC7.tlu.tsa1.array.mem[{2'h2, 3'h5}];

end // }
reg  [71:0] tick_cmpr_7; 
reg  [71:0] stick_cmpr_7; 
reg  [71:0] hstick_cmpr_7;
reg [151:0] trap_entry_1_t7;
reg [151:0] trap_entry_2_t7;
reg [151:0] trap_entry_3_t7;
reg [151:0] trap_entry_4_t7;
reg [151:0] trap_entry_5_t7;
reg [151:0] trap_entry_6_t7;

always @(posedge `BENCH_SPC7_GCLK) begin // {

    // Probes for nas_pipe
      tick_cmpr_7        <= `SPC7.tlu.tca.array.mem[{2'b0,3'h7}];
      stick_cmpr_7       <= `SPC7.tlu.tca.array.mem[{2'b01,3'h7}];
      hstick_cmpr_7      <= `SPC7.tlu.tca.array.mem[{2'b10,3'h7}];
      trap_entry_1_t7    <= `SPC7.tlu.tsa1.array.mem[{2'h3, 3'h0}];
      trap_entry_2_t7    <= `SPC7.tlu.tsa1.array.mem[{2'h3, 3'h1}];
      trap_entry_3_t7    <= `SPC7.tlu.tsa1.array.mem[{2'h3, 3'h2}];
      trap_entry_4_t7    <= `SPC7.tlu.tsa1.array.mem[{2'h3, 3'h3}];
      trap_entry_5_t7    <= `SPC7.tlu.tsa1.array.mem[{2'h3, 3'h4}];
      trap_entry_6_t7    <= `SPC7.tlu.tsa1.array.mem[{2'h3, 3'h5}];

end // }

//------------------------------------
// ASI & Trap State machines
always @(posedge `BENCH_SPC7_GCLK) begin // {

//    pc_0_e[47:0] <= `SPC7.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC7.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC7.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC7.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;


    // altspace_ldst_m is asserted for asi accesses that don't change arch state
    asi_store_b <= (`SPC7.lsu.dcc.asi_store_m & `SPC7.lsu.dcc.asi_sync_m);
    asi_store_w <= asi_store_b;
    dcc_tid_b <= `SPC7.lsu.dcc.dcc_tid_m;
    dcc_tid_w <= dcc_tid_b;

    // ASI in progress state m/c
    if (asi_store_w & ~asi_store_flush_w[dcc_tid_w]) begin // {
        asi_in_progress_b[dcc_tid_w] <= 1'b1;
    end // }

    asi_valid_w <= asi_in_progress_b & store_sync;

    // Delay asi_valid_w and asi_in_progress
    // 2 clocks to ensure TLB Sync DTLBWRITE (demap) comes before SSTEP stxa
    asi_valid_fx4 <= asi_valid_w;
    asi_valid_fx5 <= asi_valid_fx4;
    asi_in_progress_w <= asi_in_progress_b;
    asi_in_progress_fx4 <= asi_in_progress_w;
    sync_reset_w <= sync_reset;
    
    for (i=0;i<8;i=i+1) begin // {
        if (asi_valid_w[i] | sync_reset_w[i]) begin // {
            asi_in_progress_b[i] <= 1'b0;
        end//}
    end //}

    // Trap0 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC7.tlu.tlu_trap_0_tid[1:0] == i) &&
            `SPC7.tlu.tlu_trap_pc_0_valid & tlu_ccr_cwp_0_valid_last)
        begin //{
            tlu_valid[i] <= 1'b1;
        end //}
        // Trap taken
        else if (`SPC7.tlu.trl0.real_trap[i] & ~`SPC7.tlu.trl0.take_por) begin // {
            tlu_valid[i] <= 1'b1;
        end //}
        else 
            tlu_valid[i] <= 1'b0;
    end //}

    // Trap1 pipeline [valid W stage]

    for (i=0;i<4;i=i+1) begin // {
        // Done & Retry
        if ((`SPC7.tlu.tlu_trap_1_tid[1:0] == i) &&
            `SPC7.tlu.tlu_trap_pc_1_valid & tlu_ccr_cwp_1_valid_last)
        begin //{
            tlu_valid[i+4] <= 1'b1;
        end //} 
        // Trap taken
        else if (`SPC7.tlu.trl1.real_trap[i] & ~`SPC7.tlu.trl1.take_por) begin // {
            tlu_valid[i+4] <= 1'b1;
        end //}
        else 
            tlu_valid[i+4] <= 1'b0;
    end //}

end // }


always @(posedge `BENCH_SPC7_GCLK) begin

// debug code for TPCC analysis
`ifdef TPCC
if (pcx_req==1) begin
	if (`SPC7.spc_pcx_data_pa[129:124]==6'b100000) begin  // l15 dmiss
	  l15dmiss_cnt=l15dmiss_cnt+1;
	  $display("dmissl15 cnt is %0d",l15dmiss_cnt);
	end
	if (`SPC7.spc_pcx_data_pa[129:124]==6'b110000) begin // l15 imiss
	  l15imiss_cnt=l15imiss_cnt+1;
	  $display("imissl15 cnt is %0d",l15imiss_cnt);
	end
	// `TOP.spg.spc_pcx_data_pa[129:124]==6'b100001   -> all stores 
end

pcx_req <= |`SPC7.spc_pcx_req_pq[8:0];
 
if (`SPC7.ifu_l15_valid==1) begin
	imiss_cnt=imiss_cnt+1;
	$display("imiss cnt is %0d",imiss_cnt);
end
if (spec_dmiss==1 && `SPC7.lsu_l15_cancel==0) begin
	dmiss_cnt=dmiss_cnt+1;
	$display("dmiss cnt is %0d",dmiss_cnt);
	
end
spec_dmiss <= `SPC7.lsu_l15_valid & `SPC7.lsu_l15_load;

clock = clock+1;

// keep track of imiss latencies
if (`SPC7.ftu_agc_thr0_cmiss_c==1) begin
     start_imiss0=clock;
     active_imiss0=1;
end
if (active_imiss0==1 && first_imiss0==1 && `SPC7.l15_spc_cpkt[8:6]==3'b000 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss0 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss0=0;
     first_imiss0=0;
end
if (active_imiss0==1 && first_imiss0==0 && `SPC7.l15_spc_cpkt[8:6]==3'b000 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss0=1;
end
if (`SPC7.ftu_agc_thr1_cmiss_c==1) begin
     start_imiss1=clock;
     active_imiss1=1;
end
if (active_imiss1==1 && first_imiss1==1 && `SPC7.l15_spc_cpkt[8:6]==3'b001 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss1 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss1=0;
     first_imiss1=0;
end
if (active_imiss1==1 && first_imiss1==0 && `SPC7.l15_spc_cpkt[8:6]==3'b001 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss1=1;
end
if (`SPC7.ftu_agc_thr2_cmiss_c==1) begin
     start_imiss2=clock;
     active_imiss2=1;
end
if (active_imiss2==1 && first_imiss2==1 && `SPC7.l15_spc_cpkt[8:6]==3'b010 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss2 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss2=0;
     first_imiss2=0;
end
if (active_imiss2==1 && first_imiss2==0 && `SPC7.l15_spc_cpkt[8:6]==3'b010 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss2=1;
end
if (`SPC7.ftu_agc_thr3_cmiss_c==1) begin
     start_imiss3=clock;
     active_imiss3=1;
end
if (active_imiss3==1 && first_imiss3==1  && `SPC7.l15_spc_cpkt[8:6]==3'b011 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss3 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss3=0;
     first_imiss3=0;
end
if (active_imiss3==1 && first_imiss3==0 && `SPC7.l15_spc_cpkt[8:6]==3'b011 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss3=1;
end
if (`SPC7.ftu_agc_thr4_cmiss_c==1) begin
     start_imiss4=clock;
     active_imiss4=1;
end
if (active_imiss4==1 && first_imiss4==1  && `SPC7.l15_spc_cpkt[8:6]==3'b100 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss4 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss4=0;
     first_imiss4=0;
end
if (active_imiss4==1 && first_imiss4==0 && `SPC7.l15_spc_cpkt[8:6]==3'b100 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss4=1;
end
if (`SPC7.ftu_agc_thr5_cmiss_c==1) begin
     start_imiss5=clock;
     active_imiss5=1;
end
if (active_imiss5==1  && first_imiss5==1 && `SPC7.l15_spc_cpkt[8:6]==3'b101 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss5 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss5=0;
     first_imiss5=0;
end
if (active_imiss5==1 && first_imiss5==0 && `SPC7.l15_spc_cpkt[8:6]==3'b101 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss5=1;
end
if (`SPC7.ftu_agc_thr6_cmiss_c==1) begin
     start_imiss6=clock;
     active_imiss6=1;
end
if (active_imiss6==1 && first_imiss6==1 && `SPC7.l15_spc_cpkt[8:6]==3'b110 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss6 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss6=0;
     first_imiss6=0;
end
if (active_imiss6==1 && first_imiss6==0 && `SPC7.l15_spc_cpkt[8:6]==3'b110 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss6=1;
end
if (`SPC7.ftu_agc_thr7_cmiss_c==1) begin
     start_imiss7=clock;
     active_imiss7=1;
end
if (active_imiss7==1 && first_imiss7==1 && `SPC7.l15_spc_cpkt[8:6]==3'b111 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
     sum_imiss_latency = sum_imiss_latency + clock - start_imiss7 + 1;
     number_imiss = number_imiss + 1;
     $display("sum imiss latency %0d number imiss %0d",sum_imiss_latency,number_imiss);     
     active_imiss7=0;
    first_imiss7=0;
end
if (active_imiss7==1 && first_imiss7==0 && `SPC7.l15_spc_cpkt[8:6]==3'b111 && `SPC7.l15_spc_valid==1 && `SPC7.l15_spc_cpkt[17:14]==4'b0001) begin
    first_imiss7=1;
end

if (`SPC7.pku.swl0.set_lsu_sync_wait==1) begin
     start_dmiss0=clock;
end
if (`SPC7.pku.swl0.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss0) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC7.pku.swl1.set_lsu_sync_wait==1) begin
     start_dmiss1=clock;
end
if (`SPC7.pku.swl1.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss1) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC7.pku.swl2.set_lsu_sync_wait==1) begin
     start_dmiss2=clock;
end
if (`SPC7.pku.swl2.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss2) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC7.pku.swl3.set_lsu_sync_wait==1) begin
     start_dmiss3=clock;
end
if (`SPC7.pku.swl3.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss3) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC7.pku.swl4.set_lsu_sync_wait==1) begin
     start_dmiss4=clock;
end
if (`SPC7.pku.swl4.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss4) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC7.pku.swl5.set_lsu_sync_wait==1) begin
     start_dmiss5=clock;
end
if (`SPC7.pku.swl5.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss5) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC7.pku.swl6.set_lsu_sync_wait==1) begin
     start_dmiss6=clock;
end
if (`SPC7.pku.swl6.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss6) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
if (`SPC7.pku.swl7.set_lsu_sync_wait==1) begin
     start_dmiss7=clock;
end
if (`SPC7.pku.swl7.clear_lsu_sync_wait==1) begin
     sum_dmiss_latency = sum_dmiss_latency + (clock - start_dmiss7) + 3;
     number_dmiss = number_dmiss + 1;
     $display("sum dmiss latency %0d number dmiss %0d",sum_dmiss_latency,number_dmiss);     
end
`endif



   lsu_tid_e[2:0] <= `SPC7.lsu.dcc.tid_d[2:0];

   // FG Valid conditions

   // Add fcc valids to fg_valid
   fcc_valid_fb <= fcc_valid_f5;
   fcc_valid_f5 <= fcc_valid_f4;
   fcc_valid_f4 <= |`SPC7.fgu.fgu_cmp_fcc_vld_fx3[3:0];

   fg_flush_fb <= fg_flush_f5;
   fg_flush_f5 <= fg_flush_f4;
   fg_flush_f4 <= fg_flush_f3;
   fg_flush_f3 <= fg_flush_f2 | `SPC7.dec_flush_f2 | 
                  `SPC7.tlu_flush_fgu_b;
   fg_flush_f2 <= `SPC7.dec_flush_f1;

   fgu_err_fx3 <= `SPC7.fgu_cecc_fx2 | `SPC7.fgu_uecc_fx2 | `SPC7.fgu.fpc.exu_flush_fx2; // frf or irf ecc error
   fgu_err_fx4 <= fgu_err_fx3;
   fgu_err_fx5 <= fgu_err_fx4;
   fgu_err_fb <= fgu_err_fx5;

   // Siams cause fg_valid ..
   siam0_d = `SPC7.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC7.dec.dec_inst0_d[24:19]==6'b110110 &
             `SPC7.dec.dec_inst0_d[13:5]==9'b010000001;  

   siam1_d = `SPC7.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC7.dec.dec_inst1_d[24:19]==6'b110110 &
             `SPC7.dec.dec_inst1_d[13:5]==9'b010000001;  
    

   done0_d = `SPC7.dec.dec_inst0_d[31:30]==2'b10 & 
             `SPC7.dec.dec_inst0_d[29:25]==5'b00000 & 
             `SPC7.dec.dec_inst0_d[24:19]==6'b111110;
   done1_d = `SPC7.dec.dec_inst1_d[31:30]==2'b10 & 
             `SPC7.dec.dec_inst1_d[29:25]==5'b00000 & 
             `SPC7.dec.dec_inst1_d[24:19]==6'b111110;    

   retry0_d = `SPC7.dec.dec_inst0_d[31:30]==2'b10 & 
              `SPC7.dec.dec_inst0_d[29:25]==5'b00001 & 
              `SPC7.dec.dec_inst0_d[24:19]==6'b111110;
   retry1_d = `SPC7.dec.dec_inst1_d[31:30]==2'b10 & 
              `SPC7.dec.dec_inst1_d[29:25]==5'b00001 & 
              `SPC7.dec.dec_inst1_d[24:19]==6'b111110;   

   done0_e <= done0_d & `SPC7.dec.dec_decode0_d;
   done1_e <= done1_d & `SPC7.dec.dec_decode1_d; 

   retry0_e <= retry0_d & `SPC7.dec.dec_decode0_d;
   retry1_e <= retry1_d & `SPC7.dec.dec_decode1_d;   


   // fold siam into cmov logic 

   fmov_valid_fb <= fmov_valid_f5;
   fmov_valid_f5 <= fmov_valid_f4;
   fmov_valid_f4 <= fmov_valid_f3;
   fmov_valid_f3 <= fmov_valid_f2;
   fmov_valid_f2 <= fmov_valid_m;
   fmov_valid_m  <= fmov_valid_e & `SPC7.dec.dec_fgu_valid_e;
   fmov_valid_e <= ((`SPC7.exu0.ect.cmov_d | siam0_d) & 
                    `SPC7.dec.dec_decode0_d&`SPC7.dec.del.fgu0_d) |
                    ((`SPC7.exu1.ect.cmov_d | siam1_d) & 
                    `SPC7.dec.dec_decode1_d&`SPC7.dec.del.fgu1_d);
   
   // fgu check bus

   // fcc_valid_fb doesn't assert for LDFSR. LDFSR gets checked by the LSU
   // checker

   fg_valid <= {(`SPC7.fgu.fac.fac_w1_tid_fb[2:0]==3'h7) && fg_cond_fb,
                (`SPC7.fgu.fac.fac_w1_tid_fb[2:0]==3'h6) && fg_cond_fb,
                (`SPC7.fgu.fac.fac_w1_tid_fb[2:0]==3'h5) && fg_cond_fb,
                (`SPC7.fgu.fac.fac_w1_tid_fb[2:0]==3'h4) && fg_cond_fb,
                (`SPC7.fgu.fac.fac_w1_tid_fb[2:0]==3'h3) && fg_cond_fb,
                (`SPC7.fgu.fac.fac_w1_tid_fb[2:0]==3'h2) && fg_cond_fb,
                (`SPC7.fgu.fac.fac_w1_tid_fb[2:0]==3'h1) && fg_cond_fb,
                (`SPC7.fgu.fac.fac_w1_tid_fb[2:0]==3'h0) && fg_cond_fb };
   

   fgu_valid_fb0      <= `SPC7.fgu_exu_w_vld_fx5[0] && !`SPC7.fgu.fpc.div_finish_int_fb;
   fgu_valid_fb1      <= `SPC7.fgu_exu_w_vld_fx5[1] && !`SPC7.fgu.fpc.div_finish_int_fb;

   // Fdiv
   div_special_cancel_f4[7:0] <= tid2onehot(`SPC7.fgu.fac.tid_fx3[2:0]) & 
                               {8{`SPC7.fgu.fac.q_div_default_res_fx3}};
   fg_fdiv_valid_fw <= `SPC7.fgu_divide_completion & ~div_special_cancel_f4 &
                       {8{~`SPC7.fgu.fpc.fpc_fpd_ieee_trap_fb}} &
                       {8{~`SPC7.fgu.fpc.fpc_fpd_unfin_fb}};

    
   // Used in CCX Stub ?
   inst0_e[31:0] <= `SPC7.dec.dec_inst0_d[31:0];
   inst1_e[31:0] <= `SPC7.dec.dec_inst1_d[31:0];

   // only fgu ops that are not loads/stores
   fgu0_e <= `SPC7.dec.del.decode_fgu0_d;  
   fgu1_e <= `SPC7.dec.del.decode_fgu1_d;

   // LSU logic 
   load_b <= load_m;
   load_m <= (load0_e | load1_e);

   load0_e <= (`SPC7.dec.dec_decode0_d & `SPC7.dec.del.lsu0_d & 
               `SPC7.dec.dcd0.dcd_load_d);

   load1_e <= (`SPC7.dec.dec_decode1_d & `SPC7.dec.del.lsu1_d & 
               `SPC7.dec.dcd1.dcd_load_d);

   lsu_tid_b[2:0] <= lsu_tid_m[2:0];
   lsu_tid_m[2:0] <= lsu_tid_e[2:0];

   lsu_complete_m[7:0] <= `SPC7.lsu_complete[7:0];
   lsu_complete_b[7:0] <= lsu_complete_m[7:0];

   lsu_data_w  <= lsu_data_b;
  
   // Divide destination logic ..
   sel_divide0_e <= (`SPC7.dec_decode0_d & 
                     ((`SPC7.pku.swl0.vld_d & `SPC7.pku.swl_divide_wait[0]) |
                      (`SPC7.pku.swl1.vld_d & `SPC7.pku.swl_divide_wait[1]) |
                      (`SPC7.pku.swl2.vld_d & `SPC7.pku.swl_divide_wait[2]) |
                      (`SPC7.pku.swl3.vld_d & `SPC7.pku.swl_divide_wait[3])));
   sel_divide1_e <= (`SPC7.dec_decode1_d & 
                     ((`SPC7.pku.swl4.vld_d & `SPC7.pku.swl_divide_wait[4]) |
                      (`SPC7.pku.swl5.vld_d & `SPC7.pku.swl_divide_wait[5]) |
                      (`SPC7.pku.swl6.vld_d & `SPC7.pku.swl_divide_wait[6]) |
                      (`SPC7.pku.swl7.vld_d & `SPC7.pku.swl_divide_wait[7])));


   dcd_fdest_e <= {`SPC7.dec.del.fdest1_d,`SPC7.dec.del.fdest0_d};
   dcd_idest_e <= {`SPC7.dec.del.idest1_d,`SPC7.dec.del.idest0_d};

   if (sel_divide0_e) begin // {
         div_idest[{1'b0, `SPC7.dec.del.tid0_e[1:0]}] <= dcd_idest_e[0];
         div_fdest[{1'b0, `SPC7.dec.del.tid0_e[1:0]}] <= dcd_fdest_e[0];
   end // }
   if (sel_divide1_e) begin // {
         div_idest[{1'b1, `SPC7.dec.del.tid1_e[1:0]}] <= dcd_idest_e[1];
         div_fdest[{1'b1, `SPC7.dec.del.tid1_e[1:0]}] <= dcd_fdest_e[1];
   end // }
                 

   // EX logic
   // Save EX tids for later use
   ex0_tid_m <= ex0_tid_e;
   ex1_tid_m <= ex1_tid_e;
   ex0_tid_b <= ex0_tid_m;
   ex1_tid_b <= ex1_tid_m;
   ex0_tid_w <= ex0_tid_b;
   ex1_tid_w <= ex1_tid_b;

   // EX Flush conditions
   ex_flush_w <= {ex_flush_b | {{4{(`SPC7.dec.dec_flush_b[1] | 
                                `SPC7.tlu_flush_exu_b[1])}},
                                {4{(`SPC7.dec.dec_flush_b[0] |
                                `SPC7.tlu_flush_exu_b[0])}}}};

   ex_flush_b <= {{4{`SPC7.dec.dec_flush_m[1]}},
                 {4{`SPC7.dec.dec_flush_m[0]}}};


   // ex_valid_f4 valid will only fire on return
   return_f4 <= return_w & ~(`SPC7.tlu_flush_ifu & real_exception);
   ex_valid_w <= ex_valid_b;

   // Cancel EX valid if it turns out to be asr/asi access for this tid 

   ex_valid_b <= ex_valid_m & ~ex_asr_access;


   ex_valid_m <=      { (ex1_tid_e == 2'h3) && ex1_valid_e,
                       (ex1_tid_e == 2'h2) && ex1_valid_e,
                       (ex1_tid_e == 2'h1) && ex1_valid_e,
                       (ex1_tid_e == 2'h0) && ex1_valid_e,
                       (ex0_tid_e == 2'h3) && ex0_valid_e,
                       (ex0_tid_e == 2'h2) && ex0_valid_e,
                       (ex0_tid_e == 2'h1) && ex0_valid_e,
                       (ex0_tid_e == 2'h0) && ex0_valid_e};
   

  // TLU delays for done and retries
  tlu_ccr_cwp_0_valid_last <= `SPC7.tlu.tlu_ccr_cwp_0_valid;
  tlu_ccr_cwp_1_valid_last <= `SPC7.tlu.tlu_ccr_cwp_1_valid;
  

end // END posedge gclk

// Return instruction is separated out of ex*_valid because CWP update is in
// W+1 for return new window is not available for IRF scan (nas_pipe) until
// W+2
assign return0 = `SPC7.exu0.rml.return_w & 
                 `SPC7.exu0.rml.inst_vld_w;
assign return1 = `SPC7.exu1.rml.return_w & 
                 `SPC7.exu1.rml.inst_vld_w;
assign return_w = {(ex1_tid_w == 2'h3) && return1,
                   (ex1_tid_w == 2'h2) && return1,
                   (ex1_tid_w == 2'h1) && return1,
                   (ex1_tid_w == 2'h0) && return1,
                   (ex0_tid_w == 2'h3) && return0,
                   (ex0_tid_w == 2'h2) && return0,
                   (ex0_tid_w == 2'h1) && return0,
                   (ex0_tid_w == 2'h0) && return0};


// Cancel EX valid if it turns out that exception (tlu flush) taken for
// this tid

// exu check bus
assign ex0_tid_e = `SPC7.exu0.ect_tid_lth_e[1:0];
assign ex0_valid_e = `SPC7.dec.dec_valid_e[0] & ~fgu0_e & ~load0_e &
                     ~retry0_e & ~done0_e;
assign ex1_tid_e = `SPC7.exu1.ect_tid_lth_e[1:0];
assign ex1_valid_e = `SPC7.dec.dec_valid_e[1] & ~fgu1_e & ~load1_e &
                     ~retry1_e & ~done1_e;

assign ex_asr_valid = `SPC7.lsu.dcc.asi_store_m & `SPC7.lsu.dcc.asi_sync_m ;

assign ex_asr_access ={(`SPC7.lsu.dcc.dcc_tid_m[2:0]==3'h7) & ex_asr_valid,
                       (`SPC7.lsu.dcc.dcc_tid_m[2:0]==3'h6) & ex_asr_valid,
                       (`SPC7.lsu.dcc.dcc_tid_m[2:0]==3'h5) & ex_asr_valid,
                       (`SPC7.lsu.dcc.dcc_tid_m[2:0]==3'h4) & ex_asr_valid,
                       (`SPC7.lsu.dcc.dcc_tid_m[2:0]==3'h3) & ex_asr_valid,
                       (`SPC7.lsu.dcc.dcc_tid_m[2:0]==3'h2) & ex_asr_valid,
                       (`SPC7.lsu.dcc.dcc_tid_m[2:0]==3'h1) & ex_asr_valid,
                       (`SPC7.lsu.dcc.dcc_tid_m[2:0]==3'h0) & ex_asr_valid};


// EXU valid is ex_valid_w, except flushes, delayed return, traps, and stfsr
// real_exception added because tlu_flush_ifu activates for second redirect
// of retry if TPC and TNPC are not verified as sequential
assign  real_exception =
	   {{4 {`SPC7.tlu.fls1.dec_exc_w | 
		`SPC7.tlu.fls1.exu_exc_w |
		`SPC7.tlu.fls1.lsu_exc_w | 
                `SPC7.tlu.fls1.bsee_req_w}},
	    {4 {`SPC7.tlu.fls0.dec_exc_w | 
		`SPC7.tlu.fls0.exu_exc_w |
		`SPC7.tlu.fls0.lsu_exc_w | 
                `SPC7.tlu.fls0.bsee_req_w}}};

// Do not assert ex_valid for block store instructions
wire [7:0] block_store_first_at_w = 
           {`SPC7.lsu.sbs7.bst_pend & `SPC7.lsu.sbs7.blk_inst_w, 
            `SPC7.lsu.sbs6.bst_pend & `SPC7.lsu.sbs6.blk_inst_w, 
            `SPC7.lsu.sbs5.bst_pend & `SPC7.lsu.sbs5.blk_inst_w, 
            `SPC7.lsu.sbs4.bst_pend & `SPC7.lsu.sbs4.blk_inst_w, 
            `SPC7.lsu.sbs3.bst_pend & `SPC7.lsu.sbs3.blk_inst_w, 
            `SPC7.lsu.sbs2.bst_pend & `SPC7.lsu.sbs2.blk_inst_w, 
            `SPC7.lsu.sbs1.bst_pend & `SPC7.lsu.sbs1.blk_inst_w, 
            `SPC7.lsu.sbs0.bst_pend & `SPC7.lsu.sbs0.blk_inst_w};

// But inject a valid for a block store that's done...
reg [7:0] block_store_w;
always @(posedge `BENCH_SPC7_GCLK) begin
    block_store_w[7:0] <= `SPC7.lsu.lsu_block_store_b[7:0];
    lsu_trap_flush_d <=  `SPC7.lsu_trap_flush[7:0];
end

wire [7:0] block_store_inject_at_w = 
                                    ~`SPC7.lsu.lsu_block_store_b[7:0] & 
                                    block_store_w[7:0] &
                                    {~`SPC7.lsu.sbs7.bst_kill,
                                     ~`SPC7.lsu.sbs6.bst_kill,
                                     ~`SPC7.lsu.sbs5.bst_kill,
                                     ~`SPC7.lsu.sbs4.bst_kill,
                                     ~`SPC7.lsu.sbs3.bst_kill,
                                     ~`SPC7.lsu.sbs2.bst_kill,
                                     ~`SPC7.lsu.sbs1.bst_kill,
                                     ~`SPC7.lsu.sbs0.bst_kill};

assign ex_valid = (((ex_valid_w & ~ex_flush_w & ~return_w & ~block_store_first_at_w & ~exception_w &
                     ~({{4{`SPC7.tlu.fls1.exu_exc_b & `SPC7.tlu.fls1.beat_two_b}},
                        {4{`SPC7.tlu.fls0.exu_exc_b & `SPC7.tlu.fls0.beat_two_b}}}) &
                     ~{(`SPC7.fgu.fac.tid_fx3[2:0]==3'h7) & `SPC7.fgu.fpc.fsr_store_fx3,
                       (`SPC7.fgu.fac.tid_fx3[2:0]==3'h6) & `SPC7.fgu.fpc.fsr_store_fx3,
                       (`SPC7.fgu.fac.tid_fx3[2:0]==3'h5) & `SPC7.fgu.fpc.fsr_store_fx3,
                       (`SPC7.fgu.fac.tid_fx3[2:0]==3'h4) & `SPC7.fgu.fpc.fsr_store_fx3,
                       (`SPC7.fgu.fac.tid_fx3[2:0]==3'h3) & `SPC7.fgu.fpc.fsr_store_fx3,
                       (`SPC7.fgu.fac.tid_fx3[2:0]==3'h2) & `SPC7.fgu.fpc.fsr_store_fx3,
                       (`SPC7.fgu.fac.tid_fx3[2:0]==3'h1) & `SPC7.fgu.fpc.fsr_store_fx3,
                       (`SPC7.fgu.fac.tid_fx3[2:0]==3'h0) & `SPC7.fgu.fpc.fsr_store_fx3}) | 
                     block_store_inject_at_w) & 
                   ~(`SPC7.tlu_flush_ifu & real_exception)) | return_f4;

assign exception_w = {{4 {`SPC7.tlu.fls1.exc_for_w}} | 
                      `SPC7.tlu.fls1.bsee_req[3:0] | 
		      `SPC7.tlu.fls1.pdist_ecc_w[3:0],
		      {4 {`SPC7.tlu.fls0.exc_for_w}} |
		      `SPC7.tlu.fls0.bsee_req[3:0] | 
		      `SPC7.tlu.fls0.pdist_ecc_w[3:0]};

// imul check bus - includes imul, save, restore instructions
assign imul_valid = {(`SPC7.exu1.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb1,
                     (`SPC7.exu1.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb1,
                     (`SPC7.exu1.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb1,
                     (`SPC7.exu1.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb1,
                     (`SPC7.exu0.ect_tid_lth_w[1:0]== 2'h3) & fgu_valid_fb0,
                     (`SPC7.exu0.ect_tid_lth_w[1:0]== 2'h2) & fgu_valid_fb0,
                     (`SPC7.exu0.ect_tid_lth_w[1:0]== 2'h1) & fgu_valid_fb0,
                     (`SPC7.exu0.ect_tid_lth_w[1:0]== 2'h0) & fgu_valid_fb0};

// qualify this signal with fgu_err. If fgu_err is encountered, deassert
//fg_cond_fb, so we don't send a step to Riesling.

// FGU conditions
wire fg_cond_fb_pre_err = `SPC7.fgu.fpc.fpc_w1_ul_vld_fb | fcc_valid_fb | 
                     (fmov_valid_fb & ~fg_flush_fb) |
                     (`SPC7.fgu.fac.fsr_w1_vld_fb[1]);  // covers ST(X)FSR, which clears FSR.ftt

assign fg_cond_fb = fg_cond_fb_pre_err  & ~fgu_err_fb;

// Idiv/Fdiv signals

assign fgu_idiv_valid = fg_div_valid & div_idest;


assign fgu_fdiv_valid = fg_fdiv_valid_fw & div_fdest;


// Lsu signals needed to check lsu results

assign lsu_valid     = lsu_check | lsu_data_w;

assign fg_div_valid  = `SPC7.fgu_divide_completion & ~div_special_cancel_f4;
   
// State machine asserts lsu_check for LD hit/miss
always @(posedge `BENCH_SPC7_GCLK) begin
  for (i=0; i<=7;i=i+1) begin // {
      lsu_check[i] <= 1'b0;
      case (lsu_state[i])
        1'b0: // IDLE state
              begin
                // LD hit
                if (lsu_ld_valid & lsu_tid_dec_b[i] & load_b) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - normal case
                else if (lsu_ld_valid & lsu_tid_dec_b[i] & lsu_complete_b[i]) 
                begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                // LD miss - LDD or Block LD or SWAP
                else if (lsu_ld_valid & lsu_tid_dec_b[i]) begin
                  lsu_state[i] <= 1'b1; // VALID state
                end
// Added a new term to handle STB uncorrectable errors on atomic or asi stores that are synced
//Send a complete if an atomic is squashed.
//lsu_trap_flush is asserted a cycle after the block_store_kill is asserted
		else if (`SPC7.lsu.dcc.sync_st[i] & `SPC7.lsu_block_store_kill[i] & ~lsu_trap_flush_d[i])
		begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
                
              end
        1'b1: // VALID state
              begin
                if ((lsu_complete_b[i])) begin
                  lsu_check[i] <= 1'b1;
                  lsu_state[i] <= 1'b0; // IDLE state
                end
                else begin
                  lsu_state[i] <= lsu_state[i];
                end
              end
      endcase
  end // }
end

   
assign lsu_tid   = `SPC7.lsu.dcc.ld_tid_b[2:0];
// Don't assert LSU_complete in case of dtlb or irf errors

assign lsu_valid_b = (`SPC7.lsu.dcc.pref_inst_b & 
                      ~(dec_flush_lb | `SPC7.lsu.dcc.pipe_flush_b | 
			`SPC7.lsu_dtdp_err_b | `SPC7.lsu_dttp_err_b |
			`SPC7.lsu_dtmh_err_b | `SPC7.lsu.dcc.exu_error_b));

assign lsu_data_b[7:0] = { (lsu_tid == 3'h7) & lsu_valid_b,
                          (lsu_tid == 3'h6) & lsu_valid_b,
                          (lsu_tid == 3'h5) & lsu_valid_b,
                          (lsu_tid == 3'h4) & lsu_valid_b,
                          (lsu_tid == 3'h3) & lsu_valid_b,
                          (lsu_tid == 3'h2) & lsu_valid_b,
                          (lsu_tid == 3'h1) & lsu_valid_b,
                          (lsu_tid == 3'h0) & lsu_valid_b};

assign  lsu_tid_dec_b[0] = `SPC7.lsu.dcc.ld_tid_b[2:0] == 3'd0;
assign  lsu_tid_dec_b[1] = `SPC7.lsu.dcc.ld_tid_b[2:0] == 3'd1;
assign  lsu_tid_dec_b[2] = `SPC7.lsu.dcc.ld_tid_b[2:0] == 3'd2;
assign  lsu_tid_dec_b[3] = `SPC7.lsu.dcc.ld_tid_b[2:0] == 3'd3;
assign  lsu_tid_dec_b[4] = `SPC7.lsu.dcc.ld_tid_b[2:0] == 3'd4;
assign  lsu_tid_dec_b[5] = `SPC7.lsu.dcc.ld_tid_b[2:0] == 3'd5;
assign  lsu_tid_dec_b[6] = `SPC7.lsu.dcc.ld_tid_b[2:0] == 3'd6;
assign  lsu_tid_dec_b[7] = `SPC7.lsu.dcc.ld_tid_b[2:0] == 3'd7;

assign  lsu_ld_valid = (`SPC7.lsu.dcc.exu_ld_vld_b |`SPC7.lsu.dcc.fgu_fld_vld_b) &
                       ~(`SPC7.lsu.dcc.flush_all_b & `SPC7.lsu.dcc.ld_inst_vld_b);
assign  dec_flush_lb = `SPC7.dec.dec_flush_lb | `SPC7.tlu_flush_lsu_b; 


// LSU interface to CCX stub

assign  exu_lsu_valid = `SPC7.dec.del.lsu_valid_e;
assign  exu_lsu_addr[47:0] = `SPC7.exu_lsu_address_e[47:0];
assign  exu_lsu_tid[2:0] = lsu_tid_e[2:0];
assign  exu_lsu_regid[4:0] = `SPC7.dec.dec_lsu_rd_e[4:0];
assign  exu_lsu_data[63:0] = `SPC7.exu_lsu_store_data_e[63:0];
assign  exu_lsu_instr[31:0] =   ({32{`SPC7.dec.dec_lsu_sel0_e}} & 
                                inst0_e[31:0]) |
                                ({32{~`SPC7.dec.dec_lsu_sel0_e}} & 
                                inst1_e[31:0]);
assign ld_inst_d = `SPC7.dec.dec_ld_inst_d;

///////////////////////////////////////////////////////////////////////////////
// Debugging Instruction Opcodes Pipeline
///////////////////////////////////////////////////////////////////////////////


   reg [31:0] op_0_w;
   reg [31:0] op_1_w;
   reg [31:0] op_2_w;
   reg [31:0] op_3_w;
   reg [31:0] op_4_w;
   reg [31:0] op_5_w;
   reg [31:0] op_6_w;
   reg [31:0] op_7_w;

   reg [31:0] op0_b;
   reg [31:0] op0_m;
   reg [31:0] op0_e;
   reg [31:0] op0_d;

   reg [31:0] op1_b;
   reg [31:0] op1_m;
   reg [31:0] op1_e;
   reg [31:0] op1_d;

   reg [255:0] inst0_string_w;
   reg [255:0] inst0_string_b;
   reg [255:0] inst0_string_m;
   reg [255:0] inst0_string_e;
   reg [255:0] inst0_string_d;

   reg [255:0] inst1_string_w;
   reg [255:0] inst1_string_b;
   reg [255:0] inst1_string_m;
   reg [255:0] inst1_string_e;
   reg [255:0] inst1_string_d;

   reg [255:0] inst0_string_p;
   reg [255:0] inst1_string_p;
   reg [255:0] inst2_string_p;
   reg [255:0] inst3_string_p;
   reg [255:0] inst4_string_p;
   reg [255:0] inst5_string_p;
   reg [255:0] inst6_string_p;
   reg [255:0] inst7_string_p;

initial begin
    op_0_w = 32'b0;
    op_1_w = 32'b0;
    op_2_w = 32'b0;
    op_3_w = 32'b0;
    op_4_w = 32'b0;
    op_5_w = 32'b0;
    op_6_w = 32'b0;
    op_7_w = 32'b0;
end

always @(posedge `BENCH_SPC7_GCLK) begin // {
  op_0_w <= ({32 { select_pc_b[0]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[0]}} & op_0_w[31:0]) ;
  op_1_w <= ({32 { select_pc_b[1]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[1]}} & op_1_w[31:0]) ;
  op_2_w <= ({32 { select_pc_b[2]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[2]}} & op_2_w[31:0]) ;
  op_3_w <= ({32 { select_pc_b[3]}} & op0_b[31:0]) | 
            ({32 {~select_pc_b[3]}} & op_3_w[31:0]) ;
  op_4_w <= ({32 { select_pc_b[4]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[4]}} & op_4_w[31:0]) ;
  op_5_w <= ({32 { select_pc_b[5]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[5]}} & op_5_w[31:0]) ;
  op_6_w <= ({32 { select_pc_b[6]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[6]}} & op_6_w[31:0]) ;
  op_7_w <= ({32 { select_pc_b[7]}} & op1_b[31:0]) | 
            ({32 {~select_pc_b[7]}} & op_7_w[31:0]) ;

  op0_b <= op0_m;
  op0_m <= op0_e;
  op0_e <= op0_d;
  op0_d <= `SPC7.dec.ded0.decode_mux[31:0];

  op1_b <= op1_m;
  op1_m <= op1_e;
  op1_e <= op1_d;
  op1_d <= `SPC7.dec.ded1.decode_mux[31:0];

  inst0_string_w<=inst0_string_b;
  inst0_string_b<=inst0_string_m;
  inst0_string_m<=inst0_string_e;
  inst0_string_e<=inst0_string_d;
  inst0_string_d<=xlate(`SPC7.dec.ded0.decode_mux[31:0]);

  inst1_string_w<=inst1_string_b;
  inst1_string_b<=inst1_string_m;
  inst1_string_m<=inst1_string_e;
  inst1_string_e<=inst1_string_d;
  inst1_string_d<=xlate(`SPC7.dec.ded1.decode_mux[31:0]);

// instructions for each thread at pick
  inst0_string_p<=xlate(`SPC7.ifu_ibu.ibf0.buf0_in[31:0]);
  inst1_string_p<=xlate(`SPC7.ifu_ibu.ibf1.buf0_in[31:0]);
  inst2_string_p<=xlate(`SPC7.ifu_ibu.ibf2.buf0_in[31:0]);
  inst3_string_p<=xlate(`SPC7.ifu_ibu.ibf3.buf0_in[31:0]);
  inst4_string_p<=xlate(`SPC7.ifu_ibu.ibf4.buf0_in[31:0]);
  inst5_string_p<=xlate(`SPC7.ifu_ibu.ibf5.buf0_in[31:0]);
  inst6_string_p<=xlate(`SPC7.ifu_ibu.ibf6.buf0_in[31:0]);
  inst7_string_p<=xlate(`SPC7.ifu_ibu.ibf7.buf0_in[31:0]);

end //}

///////////////////////////////////////////////////////////////////////////////
// Functions 
///////////////////////////////////////////////////////////////////////////////
function [2:0] onehot2tid;
   input [7:0] onehot;

   begin

   if      (onehot[7:0]==8'b00000001) onehot2tid[2:0] = 3'b000;
   else if (onehot[7:0]==8'b00000010) onehot2tid[2:0] = 3'b001;
   else if (onehot[7:0]==8'b00000100) onehot2tid[2:0] = 3'b010;
   else if (onehot[7:0]==8'b00001000) onehot2tid[2:0] = 3'b011;
   else if (onehot[7:0]==8'b00010000) onehot2tid[2:0] = 3'b100;
   else if (onehot[7:0]==8'b00100000) onehot2tid[2:0] = 3'b101;
   else if (onehot[7:0]==8'b01000000) onehot2tid[2:0] = 3'b110;
   else if (onehot[7:0]==8'b10000000) onehot2tid[2:0] = 3'b111;
   
   end
endfunction

function [7:0] tid2onehot;
   input [2:0] tid;

   begin

   if      (tid[2:0]==3'b000) tid2onehot[7:0] = 8'b00000001;
   else if (tid[2:0]==3'b001) tid2onehot[7:0] = 8'b00000010;
   else if (tid[2:0]==3'b010) tid2onehot[7:0] = 8'b00000100;
   else if (tid[2:0]==3'b011) tid2onehot[7:0] = 8'b00001000;
   else if (tid[2:0]==3'b100) tid2onehot[7:0] = 8'b00010000;
   else if (tid[2:0]==3'b101) tid2onehot[7:0] = 8'b00100000;
   else if (tid[2:0]==3'b110) tid2onehot[7:0] = 8'b01000000;
   else if (tid[2:0]==3'b111) tid2onehot[7:0] = 8'b10000000;
   
   end
endfunction

//---------------------

function [255:0] xlate;
   input [31:0] inst;

   begin
     casex(inst[31:0])
32'b10xxxxx110100xxxxx001000011xxxxx : xlate[255:0]="FADDq";
32'b10xxxxx110100xxxxx001000111xxxxx : xlate[255:0]="FSUBq";
32'b10000xx110101xxxxx001010011xxxxx : xlate[255:0]="FCMPq";
32'b10000xx110101xxxxx001010111xxxxx : xlate[255:0]="FCMPEq";
32'b10xxxxx110100xxxxx011001101xxxxx : xlate[255:0]="FsTOq";
32'b10xxxxx110100xxxxx011001110xxxxx : xlate[255:0]="FdTOq";
32'b10xxxxx110100xxxxx010001100xxxxx : xlate[255:0]="FxTOq";
32'b10xxxxx110100xxxxx011001100xxxxx : xlate[255:0]="FiTOq";
32'b10xxxxx110100xxxxx000000011xxxxx : xlate[255:0]="FMOVq";
32'b10xxxxx110100xxxxx000000111xxxxx : xlate[255:0]="FNEGq";
32'b10xxxxx110100xxxxx000001011xxxxx : xlate[255:0]="FABSq";
32'b10xxxxx110100xxxxx001001011xxxxx : xlate[255:0]="FMULq";
32'b10xxxxx110100xxxxx001101110xxxxx : xlate[255:0]="FdMULq";
32'b10xxxxx110100xxxxx001001111xxxxx : xlate[255:0]="FDIVq";
32'b10xxxxx110100xxxxx000101011xxxxx : xlate[255:0]="FSQRTq";
32'b10xxxxx1101010xxxx0xx100111xxxxx : xlate[255:0]="FMOVrQa";
32'b10xxxxx1101010xxxx0x1x00111xxxxx : xlate[255:0]="FMOVrQb";
32'b10xxxxx110100xxxxx011010011xxxxx : xlate[255:0]="FqTOi";
32'b10xxxxx110100xxxxx010000011xxxxx : xlate[255:0]="FqTOx";
32'b10xxxxx110100xxxxx011000111xxxxx : xlate[255:0]="FqTOs";
32'b10xxxxx110100xxxxx011001011xxxxx : xlate[255:0]="FqTOd";
32'b11xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQF";
32'b11xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFi";
32'b11xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDQFA";
32'b11xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDQFAi";
32'b11xxxxx100110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFi";
32'b11xxxxx100110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQF";
32'b11xxxxx110110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STQFA";
32'b11xxxxx110110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STQFAi";
32'b10xxxxx1101010xxxxxxx000011xxxxx : xlate[255:0]="FMOVQcc";
32'b10xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADD";
32'b10xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDcc";
32'b10xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDC";
32'b10xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ADDCcc";
32'b10xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDi";
32'b10xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDcci";
32'b10xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCi";
32'b10xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ADDCcci";
32'b00x0xx1011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr1";
32'b00x0x1x011xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPr2";
32'b00xx000110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfccA";
32'b00xx1xx110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc1";
32'b00xxx1x110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc2";
32'b00xxxx1110xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBfcc3";
32'b00xx000101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfccA";
32'b00xx1xx101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc1";
32'b00xxx1x101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc2";
32'b00xxxx1101xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="FBPfcc3";
32'b00xx000010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BiccA";
32'b00xx1xx010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc1";
32'b00xxx1x010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc2";
32'b00xxxx1010xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="Bicc3";
32'b00xx000001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPccA";
32'b00xx1xx001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc1";
32'b00xxx1x001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc2";
32'b00xxxx1001xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="BPcc3";
32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="CALL";
32'b11xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASA";
32'b11xxxxx111110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="CASXA";
32'b11xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASAi";
32'b11xxxxx111110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="CASXAi";
32'b10xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIV";
32'b10xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIV";
32'b10xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVcc";
32'b10xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVcc";
32'b10xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVi";
32'b10xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVi";
32'b10xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVcci";
32'b10xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVcci";
32'b1000000111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="DONE";
32'b1000001111110xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RETRY";
32'b10xxxxx110100xxxxx001000001xxxxx : xlate[255:0]="FADDs";
32'b10xxxxx110100xxxxx001000010xxxxx : xlate[255:0]="FADDd";
32'b10xxxxx110100xxxxx001000101xxxxx : xlate[255:0]="FSUBs";
32'b10xxxxx110100xxxxx001000110xxxxx : xlate[255:0]="FSUBd";
32'b10000xx110101xxxxx001010001xxxxx : xlate[255:0]="FCMPs";
32'b10000xx110101xxxxx001010010xxxxx : xlate[255:0]="FCMPd";
32'b10000xx110101xxxxx001010101xxxxx : xlate[255:0]="FCMPEs";
32'b10000xx110101xxxxx001010110xxxxx : xlate[255:0]="FCMPEd";
32'b10xxxxx110100xxxxx010000001xxxxx : xlate[255:0]="FsTOx";
32'b10xxxxx110100xxxxx010000010xxxxx : xlate[255:0]="FdTOx";
32'b10xxxxx110100xxxxx011010001xxxxx : xlate[255:0]="FsTOi";
32'b10xxxxx110100xxxxx011010010xxxxx : xlate[255:0]="FdTOi";
32'b10xxxxx110100xxxxx011001001xxxxx : xlate[255:0]="FsTOd";
32'b10xxxxx110100xxxxx011000110xxxxx : xlate[255:0]="FdTOs";
32'b10xxxxx110100xxxxx010000100xxxxx : xlate[255:0]="FxTOs";
32'b10xxxxx110100xxxxx010001000xxxxx : xlate[255:0]="FxTOd";
32'b10xxxxx110100xxxxx011000100xxxxx : xlate[255:0]="FiTOs";
32'b10xxxxx110100xxxxx011001000xxxxx : xlate[255:0]="FiTOd";
32'b10xxxxx110100xxxxx000000001xxxxx : xlate[255:0]="FMOVs";
32'b10xxxxx110100xxxxx000000010xxxxx : xlate[255:0]="FMOVd";
32'b10xxxxx110100xxxxx000000101xxxxx : xlate[255:0]="FNEGs";
32'b10xxxxx110100xxxxx000000110xxxxx : xlate[255:0]="FNEGd";
32'b10xxxxx110100xxxxx000001001xxxxx : xlate[255:0]="FABSs";
32'b10xxxxx110100xxxxx000001010xxxxx : xlate[255:0]="FABSd";
32'b10xxxxx110100xxxxx001001001xxxxx : xlate[255:0]="FMULs";
32'b10xxxxx110100xxxxx001001010xxxxx : xlate[255:0]="FMULd";
32'b10xxxxx110100xxxxx001101001xxxxx : xlate[255:0]="FsMULd";
32'b10xxxxx110100xxxxx001001101xxxxx : xlate[255:0]="FDIVs";
32'b10xxxxx110100xxxxx001001110xxxxx : xlate[255:0]="FDIVd";
32'b10xxxxx110100xxxxx000101001xxxxx : xlate[255:0]="FSQRTs";
32'b10xxxxx110100xxxxx000101010xxxxx : xlate[255:0]="FSQRTd";
32'b10xxxxx111011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSH";
32'b10xxxxx111011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="FLUSHi";
32'b10xxxxx101011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="FLUSHw";
32'b10xxxxx111000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="JMPL";
32'b10xxxxx111000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="JMPLi";
32'b11xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDF";
32'b11xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDF";
32'b1100000100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFSR";
32'b1100001100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXFSR";
32'b11xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFi";
32'b11xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFi";
32'b1100000100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFSRi";
32'b1100001100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXFSRi";
32'b11xxxxx110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDFA";
32'b11xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDFA";
32'b11xxxxx110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDFAi";
32'b11xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDFAi";
32'b11xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSB";
32'b11xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSH";
32'b11xxxxx001000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSW";
32'b11xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUB";
32'b11xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUH";
32'b11xxxxx000000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUW";
32'b11xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDX";
32'b11xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDD";
32'b11xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBi";
32'b11xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHi";
32'b11xxxxx001000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWi";
32'b11xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBi";
32'b11xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHi";
32'b11xxxxx000000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWi";
32'b11xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXi";
32'b11xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDi";
32'b11xxxxx011001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSBA";
32'b11xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSHA";
32'b11xxxxx011000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSWA";
32'b11xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUBA";
32'b11xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUHA";
32'b11xxxxx010000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDUWA";
32'b11xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDXA";
32'b11xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDDA";
32'b11xxxxx011001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSBAi";
32'b11xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSHAi";
32'b11xxxxx011000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSWAi";
32'b11xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUBAi";
32'b11xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUHAi";
32'b11xxxxx010000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDUWAi";
32'b11xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDXAi";
32'b11xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDDAi";
32'b11xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUB";
32'b11xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBi";
32'b11xxxxx011101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="LDSTUBA";
32'b11xxxxx011101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="LDSTUBAi";
32'b10xxxxx000001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="AND";
32'b10xxxxx010001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDcc";
32'b10xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDN";
32'b10xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ANDNcc";
32'b10xxxxx000010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="OR";
32'b10xxxxx010010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORcc";
32'b10xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORN";
32'b10xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="ORNcc";
32'b10xxxxx000011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XOR";
32'b10xxxxx010011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XORcc";
32'b10xxxxx000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNOR";
32'b10xxxxx010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="XNORcc";
32'b10xxxxx000001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDi";
32'b10xxxxx010001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDcci";
32'b10xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNi";
32'b10xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ANDNcci";
32'b10xxxxx000010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORi";
32'b10xxxxx010010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORcci";
32'b10xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNi";
32'b10xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="ORNcci";
32'b10xxxxx000011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORi";
32'b10xxxxx010011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XORcci";
32'b10xxxxx000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORi";
32'b10xxxxx010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="XNORcci";
32'b1000000101000011111xxxxxxxxxxxxx : xlate[255:0]="MEMBAR";
32'b1000000101000011110xxxxxxxxxxxxx : xlate[255:0]="STBAR";
32'b10xxxxx101000000000xxxxxxxxxxxxx : xlate[255:0]="RDY";
32'b10xxxxx101000000100xxxxxxxxxxxxx : xlate[255:0]="RDCCR";
32'b10xxxxx101000000110xxxxxxxxxxxxx : xlate[255:0]="RDASI";
32'b10xxxxx101000001000xxxxxxxxxxxxx : xlate[255:0]="RDTICK";
32'b10xxxxx101000001010xxxxxxxxxxxxx : xlate[255:0]="RDPC";
32'b10xxxxx101000001100xxxxxxxxxxxxx : xlate[255:0]="RDFPRS";
32'b10xxxxx101000100110xxxxxxxxxxxxx : xlate[255:0]="RDGSR";
32'b10xxxxx101000100000xxxxxxxxxxxxx : xlate[255:0]="RDPCR";
32'b10xxxxx101000100010xxxxxxxxxxxxx : xlate[255:0]="RDPIC";
32'b10xxxxx1101010xxxx0xx000001xxxxx : xlate[255:0]="FMOVSfcc";
32'b10xxxxx1101010xxxx1xx000001xxxxx : xlate[255:0]="FMOVSxcc";
32'b10xxxxx1101010xxxx0xx000010xxxxx : xlate[255:0]="FMOVDfcc";
32'b10xxxxx1101010xxxx1xx000010xxxxx : xlate[255:0]="FMOVDxcc";
32'b10xxxxx110101xxxxx0xx100101xxxxx : xlate[255:0]="FMOVrS1";
32'b10xxxxx110101xxxxx0x1x00101xxxxx : xlate[255:0]="FMOVrS2";
32'b10xxxxx110101xxxxx0xx100110xxxxx : xlate[255:0]="FMOVrD1";
32'b10xxxxx110101xxxxx0x1x00110xxxxx : xlate[255:0]="FMOVrD2";
32'b10xxxxx1011001xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVxcc";
32'b10xxxxx1011001xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVxcci";
32'b10xxxxx1011000xxxx0xxxxxxxxxxxxx : xlate[255:0]="MOVfcc";
32'b10xxxxx1011000xxxx1xxxxxxxxxxxxx : xlate[255:0]="MOVfcci";
32'b10xxxxx101111xxxxx0xx1xxxxxxxxxx : xlate[255:0]="MOVR1";
32'b10xxxxx101111xxxxx0x1xxxxxxxxxxx : xlate[255:0]="MOVR2";
32'b10xxxxx101111xxxxx1xx1xxxxxxxxxx : xlate[255:0]="MOVRi1";
32'b10xxxxx101111xxxxx1x1xxxxxxxxxxx : xlate[255:0]="MOVRi2";
32'b10xxxxx001001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULX";
32'b10xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SDIVX";
32'b10xxxxx001101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UDIVX";
32'b10xxxxx001001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULXi";
32'b10xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SDIVXi";
32'b10xxxxx001101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UDIVXi";
32'b10xxxxx001010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMUL";
32'b10xxxxx001011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMUL";
32'b10xxxxx011010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="UMULcc";
32'b10xxxxx011011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SMULcc";
32'b10xxxxx001010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULi";
32'b10xxxxx001011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULi";
32'b10xxxxx011010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="UMULcci";
32'b10xxxxx011011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SMULcci";
32'b10xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="MULScc";
32'b10xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="MULScci";
32'b10xxxxx101110000000xxxxxxxxxxxxx : xlate[255:0]="POPC";
32'b10xxxxx101110000001xxxxxxxxxxxxx : xlate[255:0]="POPCi";
32'b11xxxxx101101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCH";
32'b11xxxxx101101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHi";
32'b11xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="PREFETCHA";
32'b11xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="PREFETCHAi";
32'b10xxxxx101010xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDPR";
32'b10xxxxx101001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RDHPR";
32'b10xxxxx111001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RETURN";
32'b10xxxxx111001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RETURNi";
32'b10xxxxx111100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SAVE";
32'b10xxxxx111100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SAVEi";
32'b10xxxxx111101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="RESTORE";
32'b10xxxxx111101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="RESTOREi";
32'b1000000110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="SAVED";
32'b1000001110001xxxxxxxxxxxxxxxxxxx : xlate[255:0]="RESTORED";
32'b00xxxxx100xxxxxxxxxxxxxxxxxxxxxx : xlate[255:0]="SETHI";
32'b10xxxxx100101xxxxx00xxxxxxxxxxxx : xlate[255:0]="SLL";
32'b10xxxxx100110xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRL";
32'b10xxxxx100111xxxxx00xxxxxxxxxxxx : xlate[255:0]="SRA";
32'b10xxxxx100101xxxxx01xxxxxxxxxxxx : xlate[255:0]="SLLX";
32'b10xxxxx100110xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRLX";
32'b10xxxxx100111xxxxx01xxxxxxxxxxxx : xlate[255:0]="SRAX";
32'b10xxxxx100101xxxxx10xxxxxxxxxxxx : xlate[255:0]="SLLi";
32'b10xxxxx100110xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRLi";
32'b10xxxxx100111xxxxx10xxxxxxxxxxxx : xlate[255:0]="SRAi";
32'b10xxxxx100101xxxxx11xxxxxxxxxxxx : xlate[255:0]="SLLXi";
32'b10xxxxx100110xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRLXi";
32'b10xxxxx100111xxxxx11xxxxxxxxxxxx : xlate[255:0]="SRAXi";
32'b11xxxxx100100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STF";
32'b11xxxxx100111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDF";
32'b1100000100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFSR";
32'b1100001100101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXFSR";
32'b11xxxxx100100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFi";
32'b11xxxxx100111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFi";
32'b1100000100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFSRi";
32'b1100001100101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXFSRi";
32'b11xxxxx110100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STFA";
32'b11xxxxx110111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDFA";
32'b11xxxxx110100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STFAi";
32'b11xxxxx110111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDFAi";
32'b11xxxxx000101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STB";
32'b11xxxxx000110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STH";
32'b11xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STW";
32'b11xxxxx001110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STX";
32'b11xxxx0000111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STD";
32'b11xxxxx000101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBi";
32'b11xxxxx000110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHi";
32'b11xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWi";
32'b11xxxxx001110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXi";
32'b11xxxx0000111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDi";
32'b11xxxxx010101xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STBA";
32'b11xxxxx010110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STHA";
32'b11xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STWA";
32'b11xxxxx011110xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STXA";
32'b11xxxx0010111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="STDA";
32'b11xxxxx010101xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STBAi";
32'b11xxxxx010110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STHAi";
32'b11xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STWAi";
32'b11xxxxx011110xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STXAi";
32'b11xxxx0010111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="STDAi";
32'b10xxxxx000100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUB";
32'b10xxxxx010100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBcc";
32'b10xxxxx001100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBC";
32'b10xxxxx011100xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SUBCcc";
32'b10xxxxx000100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBi";
32'b10xxxxx010100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBcci";
32'b10xxxxx001100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCi";
32'b10xxxxx011100xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SUBCcci";
32'b11xxxxx001111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAP";
32'b11xxxxx001111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPi";
32'b11xxxxx011111xxxxx0xxxxxxxxxxxxx : xlate[255:0]="SWAPA";
32'b11xxxxx011111xxxxx1xxxxxxxxxxxxx : xlate[255:0]="SWAPAi";
32'b10xxxxx100000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDcc";
32'b10xxxxx100010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TADDccTV";
32'b10xxxxx100000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDcci";
32'b10xxxxx100010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TADDccTVi";
32'b10xxxxx100001xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBcc";
32'b10xxxxx100011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TSUBccTV";
32'b10xxxxx100001xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBcci";
32'b10xxxxx100011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TSUBccTVi";
32'b10xxxxx111010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="TCC";
32'b10xxxxx111010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="TCCi";
32'b10xxxxx110010xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPR";
32'b10xxxxx110010xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPRi";
32'b10xxxxx110011xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRHPR";
32'b10xxxxx110011xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRHPRi";
32'b1000000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRY";
32'b1000010110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRCCR";
32'b1000011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRASI";
32'b1000110110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRFPRS";
32'b1010011110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRGSR";
32'b1010000110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPCR";
32'b1010001110000xxxxx0xxxxxxxxxxxxx : xlate[255:0]="WRPIC";
32'b1000000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRYi";
32'b1000010110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRCCRi";
32'b1000011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRASIi";
32'b1000110110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRFPRSi";
32'b1010011110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRGSRi";
32'b1010000110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPCRi";
32'b1010001110000xxxxx1xxxxxxxxxxxxx : xlate[255:0]="WRPICi";
32'b1001111110000000001xxxxxxxxxxxxx : xlate[255:0]="SIR";
32'b10xxxxx110110xxxxx001010000xxxxx : xlate[255:0]="FPADD16";
32'b10xxxxx110110xxxxx001010001xxxxx : xlate[255:0]="FPADD16S";
32'b10xxxxx110110xxxxx001010010xxxxx : xlate[255:0]="FPADD32";
32'b10xxxxx110110xxxxx001010011xxxxx : xlate[255:0]="FPADD32S";
32'b10xxxxx110110xxxxx001010100xxxxx : xlate[255:0]="FPSUB16";
32'b10xxxxx110110xxxxx001010101xxxxx : xlate[255:0]="FPSUB16S";
32'b10xxxxx110110xxxxx001010110xxxxx : xlate[255:0]="FPSUB32";
32'b10xxxxx110110xxxxx001010111xxxxx : xlate[255:0]="FPSUB32S";
32'b10xxxxx110110xxxxx000111011xxxxx : xlate[255:0]="FPACK16";
32'b10xxxxx110110xxxxx000111010xxxxx : xlate[255:0]="FPACK32";
32'b10xxxxx110110xxxxx000111101xxxxx : xlate[255:0]="FPACKFIX";
32'b10xxxxx110110xxxxx001001101xxxxx : xlate[255:0]="FEXPAND";
32'b10xxxxx110110xxxxx001001011xxxxx : xlate[255:0]="FPMERGE";
32'b10xxxxx110110xxxxx000110001xxxxx : xlate[255:0]="FMUL8x16";
32'b10xxxxx110110xxxxx000110011xxxxx : xlate[255:0]="FMUL8x16AU";
32'b10xxxxx110110xxxxx000110101xxxxx : xlate[255:0]="FMUL8x16AL";
32'b10xxxxx110110xxxxx000110110xxxxx : xlate[255:0]="FMUL8SUx16";
32'b10xxxxx110110xxxxx000110111xxxxx : xlate[255:0]="FMUL8ULx16";
32'b10xxxxx110110xxxxx000111000xxxxx : xlate[255:0]="FMULD8SUx16";
32'b10xxxxx110110xxxxx000111001xxxxx : xlate[255:0]="FMULD8ULx16";
32'b10xxxxx110110xxxxx000011000xxxxx : xlate[255:0]="ALIGNADDRESS";
32'b10xxxxx110110xxxxx000011010xxxxx : xlate[255:0]="ALIGNADDRESS_LITTLE";
32'b10xxxxx110110xxxxx000011001xxxxx : xlate[255:0]="BMASK";
32'b10xxxxx110110xxxxx001001000xxxxx : xlate[255:0]="FALIGNDATA";
32'b10xxxxx110110xxxxx001001100xxxxx : xlate[255:0]="BSHUFFLE";
32'b10xxxxx110110xxxxx001100000xxxxx : xlate[255:0]="FZERO";
32'b10xxxxx110110xxxxx001100001xxxxx : xlate[255:0]="FZEROS";
32'b10xxxxx110110xxxxx001111110xxxxx : xlate[255:0]="FONE";
32'b10xxxxx110110xxxxx001111111xxxxx : xlate[255:0]="FONES";
32'b10xxxxx110110xxxxx001110100xxxxx : xlate[255:0]="FSRC1";
32'b10xxxxx110110xxxxx001110101xxxxx : xlate[255:0]="FSRC1S";
32'b10xxxxx110110xxxxx001111000xxxxx : xlate[255:0]="FSRC2";
32'b10xxxxx110110xxxxx001111001xxxxx : xlate[255:0]="FSRC2S";
32'b10xxxxx110110xxxxx001101010xxxxx : xlate[255:0]="FNOT1";
32'b10xxxxx110110xxxxx001101011xxxxx : xlate[255:0]="FNOT1S";
32'b10xxxxx110110xxxxx001100110xxxxx : xlate[255:0]="FNOT2";
32'b10xxxxx110110xxxxx001100111xxxxx : xlate[255:0]="FNOT2S";
32'b10xxxxx110110xxxxx001111100xxxxx : xlate[255:0]="FOR";
32'b10xxxxx110110xxxxx001111101xxxxx : xlate[255:0]="FORS";
32'b10xxxxx110110xxxxx001100010xxxxx : xlate[255:0]="FNOR";
32'b10xxxxx110110xxxxx001100011xxxxx : xlate[255:0]="FNORS";
32'b10xxxxx110110xxxxx001110000xxxxx : xlate[255:0]="FAND";
32'b10xxxxx110110xxxxx001110001xxxxx : xlate[255:0]="FANDS";
32'b10xxxxx110110xxxxx001101110xxxxx : xlate[255:0]="FNAND";
32'b10xxxxx110110xxxxx001101111xxxxx : xlate[255:0]="FNANDS";
32'b10xxxxx110110xxxxx001101100xxxxx : xlate[255:0]="FXOR";
32'b10xxxxx110110xxxxx001101101xxxxx : xlate[255:0]="FXORS";
32'b10xxxxx110110xxxxx001110010xxxxx : xlate[255:0]="FXNOR";
32'b10xxxxx110110xxxxx001110011xxxxx : xlate[255:0]="FXNORS";
32'b10xxxxx110110xxxxx001111010xxxxx : xlate[255:0]="FORNOT1";
32'b10xxxxx110110xxxxx001111011xxxxx : xlate[255:0]="FORNOT1S";
32'b10xxxxx110110xxxxx001110110xxxxx : xlate[255:0]="FORNOT2";
32'b10xxxxx110110xxxxx001110111xxxxx : xlate[255:0]="FORNOT2S";
32'b10xxxxx110110xxxxx001101000xxxxx : xlate[255:0]="FANDNOT1";
32'b10xxxxx110110xxxxx001101001xxxxx : xlate[255:0]="FANDNOT1S";
32'b10xxxxx110110xxxxx001100100xxxxx : xlate[255:0]="FANDNOT2";
32'b10xxxxx110110xxxxx001100101xxxxx : xlate[255:0]="FANDNOT2S";
32'b10xxxxx110110xxxxx000101000xxxxx : xlate[255:0]="FCMPGT16";
32'b10xxxxx110110xxxxx000101100xxxxx : xlate[255:0]="FCMPGT32";
32'b10xxxxx110110xxxxx000100000xxxxx : xlate[255:0]="FCMPLE16";
32'b10xxxxx110110xxxxx000100100xxxxx : xlate[255:0]="FCMPLE32";
32'b10xxxxx110110xxxxx000100010xxxxx : xlate[255:0]="FCMPNE16";
32'b10xxxxx110110xxxxx000100110xxxxx : xlate[255:0]="FCMPNE32";
32'b10xxxxx110110xxxxx000101010xxxxx : xlate[255:0]="FCMPEQ16";
32'b10xxxxx110110xxxxx000101110xxxxx : xlate[255:0]="FCMPEQ32";
32'b10xxxxx110110xxxxx000111110xxxxx : xlate[255:0]="PDIST";
32'b10xxxxx110110xxxxx000000000xxxxx : xlate[255:0]="EDGE8";
32'b10xxxxx110110xxxxx000000001xxxxx : xlate[255:0]="EDGE8N";
32'b10xxxxx110110xxxxx000000010xxxxx : xlate[255:0]="EDGE8L";
32'b10xxxxx110110xxxxx000000011xxxxx : xlate[255:0]="EDGE8LN";
32'b10xxxxx110110xxxxx000000100xxxxx : xlate[255:0]="EDGE16";
32'b10xxxxx110110xxxxx000000101xxxxx : xlate[255:0]="EDGE16N";
32'b10xxxxx110110xxxxx000000110xxxxx : xlate[255:0]="EDGE16L";
32'b10xxxxx110110xxxxx000000111xxxxx : xlate[255:0]="EDGE16LN";
32'b10xxxxx110110xxxxx000001000xxxxx : xlate[255:0]="EDGE32";
32'b10xxxxx110110xxxxx000001001xxxxx : xlate[255:0]="EDGE32N";
32'b10xxxxx110110xxxxx000001010xxxxx : xlate[255:0]="EDGE32L";
32'b10xxxxx110110xxxxx000001011xxxxx : xlate[255:0]="EDGE32LN";
32'b10xxxxx110110xxxxx000010000xxxxx : xlate[255:0]="ARRAY8";
32'b10xxxxx110110xxxxx000010010xxxxx : xlate[255:0]="ARRAY16";
32'b10xxxxx110110xxxxx000010100xxxxx : xlate[255:0]="ARRAY32";
32'b10xxxxx110110xxxxx010000001xxxxx : xlate[255:0]="SIAM";
       default : xlate[255:0]="unknown";
    endcase   
   end
endfunction // xlate


`endif
   
endmodule

`endif


