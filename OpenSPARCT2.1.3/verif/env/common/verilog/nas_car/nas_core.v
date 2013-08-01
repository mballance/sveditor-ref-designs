// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nas_core.v
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

module nas_core0 (

  cid
);

input [2:0] cid;

integer i;

//----------------------------------------------------------

//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//
   
  nas_pipe0 t0 (
   .mycid               (cid),
   .mytid               (3'h0),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES0.op_0_w}),
   .PC_reg              ({`PROBES0.pc_0_w}),
   .Y_reg               (`SPC0.exu0.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC0.exu0.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC0.fgu.fac.fprs_tid0),
   .FSR_reg             (`SPC0.fgu.fad.fsr0_fx1[27:0]),
   .ASI_reg             (`SPC0.lsu.dcs.asi_state0),
   .GSR_reg             ({`SPC0.fgu.fgd.gsr0_mask_fx4[31:0], `SPC0.fgu.fpc.gsr0_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES0.tick_cmpr_0),
   .STICK_CMPR_reg      (`PROBES0.stick_cmpr_0),
   .HSTICK_CMPR_reg     (`PROBES0.hstick_cmpr_0),
   .PSTATE_reg          (`SPC0.tlu.tsd0.arch_pstate0),
   .TL_reg              (`SPC0.tlu.trl0.tl0),
   .PIL_reg             (`SPC0.tlu.trl0.pil0),
   .TBA_reg             (`SPC0.tlu.tsd0.tba0[47:15]),
   .VER_reg             (`SPC0.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC0.exu0.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC0.exu0.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC0.exu0.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC0.exu0.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC0.exu0.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC0.exu0.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC0.tlu.trl0.rd_softint0),
   .SOFTINT_reg         (`SPC0.tlu.trl0.softint0),
   .INTR_RECEIVE_reg    (`SPC0.tlu.cth.int_rec0),
   .GL_reg              (`SPC0.tlu.tlu_gl0),
   .HPSTATE_reg         (`SPC0.tlu.tsd0.arch_hpstate0),
   .HTBA_reg            (`SPC0.tlu.tsd0.htba0[47:14]),
   .HINTP_reg           (`SPC0.tlu.trl0.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC0.lsu.dcs.p0ctxt_0[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC0.lsu.dcs.s0ctxt_0[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC0.lsu.dcs.p1ctxt_0[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC0.lsu.dcs.s1ctxt_0[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC0.lsu.dcs.wpt_mode_0[1:0],
                                   `SPC0.lsu.dcs.wpt_mask_0[7:0],
                                   `SPC0.lsu.dcs.wpt_enable_0[1:0],
                                   18'd0,
                                   `SPC0.lsu.dcs.spec_enable[0],
                                   `SPC0.lsu.dcs.dmmu_enable[0],
                                   `SPC0.lsu.dcs.immu_enable[0],
                                   `SPC0.lsu.dcs.dc_enable[0],
                                   `SPC0.lsu.dcs.ic_enable[0]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd0.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd0.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC0.lsu.dcs.watchpoint0[47:3],3'b00}),
   .DSFAR_reg                     (`SPC0.tlu.dfd.dsfar_0[47:0]),

   .Trap_Entry_1        (`PROBES0.trap_entry_1_t0),
   .Trap_Entry_2        (`PROBES0.trap_entry_2_t0),
   .Trap_Entry_3        (`PROBES0.trap_entry_3_t0),
   .Trap_Entry_4        (`PROBES0.trap_entry_4_t0),
   .Trap_Entry_5        (`PROBES0.trap_entry_5_t0),
   .Trap_Entry_6        (`PROBES0.trap_entry_6_t0),

   .exu_valid           (`PROBES0.ex_valid[0]),

   .imul_valid          (`PROBES0.imul_valid[0]),

   .fp_valid            (`PROBES0.fg_valid[0]),
   .frf_w1_valid        (`SPC0.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC0.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC0.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES0.fgu_idiv_valid[0]),

   .fdiv_valid          (`PROBES0.fgu_fdiv_valid[0]),

   .lsu_valid           (`PROBES0.lsu_valid[0]),
   .frf_w2_valid        (`SPC0.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC0.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC0.fgu.frf.w2_addr),

   .asi_valid           (`PROBES0.asi_valid_fx5[0]),
   .asi_in_progress     (`PROBES0.asi_in_progress_fx4[0]),

   .tlu_valid           (`PROBES0.tlu_valid[0])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 1
//
   
  nas_pipe0 t1 (
   .mycid               (cid),
   .mytid               (3'h1),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES0.op_1_w}),
   .PC_reg              ({`PROBES0.pc_1_w}),
   .Y_reg               (`SPC0.exu0.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC0.exu0.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC0.fgu.fac.fprs_tid1),
   .FSR_reg             (`SPC0.fgu.fad.fsr1_fx1[27:0]),
   .ASI_reg             (`SPC0.lsu.dcs.asi_state1),
   .GSR_reg             ({`SPC0.fgu.fgd.gsr1_mask_fx4[31:0], `SPC0.fgu.fpc.gsr1_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES0.tick_cmpr_1),
   .STICK_CMPR_reg      (`PROBES0.stick_cmpr_1),
   .HSTICK_CMPR_reg     (`PROBES0.hstick_cmpr_1),
   .PSTATE_reg          (`SPC0.tlu.tsd0.arch_pstate1),
   .TL_reg              (`SPC0.tlu.trl0.tl1),
   .PIL_reg             (`SPC0.tlu.trl0.pil1),
   .TBA_reg             (`SPC0.tlu.tsd0.tba1[47:15]),
   .VER_reg             (`SPC0.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC0.exu0.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC0.exu0.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC0.exu0.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC0.exu0.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC0.exu0.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC0.exu0.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC0.tlu.trl0.rd_softint1),
   .SOFTINT_reg         (`SPC0.tlu.trl0.softint1),
   .INTR_RECEIVE_reg    (`SPC0.tlu.cth.int_rec1),
   .GL_reg              (`SPC0.tlu.tlu_gl1),
   .HPSTATE_reg         (`SPC0.tlu.tsd0.arch_hpstate1),
   .HTBA_reg            (`SPC0.tlu.tsd0.htba1[47:14]),
   .HINTP_reg           (`SPC0.tlu.trl0.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC0.lsu.dcs.p0ctxt_1[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC0.lsu.dcs.s0ctxt_1[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC0.lsu.dcs.p1ctxt_1[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC0.lsu.dcs.s1ctxt_1[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC0.lsu.dcs.wpt_mode_1[1:0],
                                   `SPC0.lsu.dcs.wpt_mask_1[7:0],
                                   `SPC0.lsu.dcs.wpt_enable_1[1:0],
                                   18'd0,
                                   `SPC0.lsu.dcs.spec_enable[1],
                                   `SPC0.lsu.dcs.dmmu_enable[1],
                                   `SPC0.lsu.dcs.immu_enable[1],
                                   `SPC0.lsu.dcs.dc_enable[1],
                                   `SPC0.lsu.dcs.ic_enable[1]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd0.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd0.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC0.lsu.dcs.watchpoint1[47:3],3'b00}),
   .DSFAR_reg                     (`SPC0.tlu.dfd.dsfar_1[47:0]),

   .Trap_Entry_1        (`PROBES0.trap_entry_1_t1),
   .Trap_Entry_2        (`PROBES0.trap_entry_2_t1),
   .Trap_Entry_3        (`PROBES0.trap_entry_3_t1),
   .Trap_Entry_4        (`PROBES0.trap_entry_4_t1),
   .Trap_Entry_5        (`PROBES0.trap_entry_5_t1),
   .Trap_Entry_6        (`PROBES0.trap_entry_6_t1),

   .exu_valid           (`PROBES0.ex_valid[1]),

   .imul_valid          (`PROBES0.imul_valid[1]),

   .fp_valid            (`PROBES0.fg_valid[1]),
   .frf_w1_valid        (`SPC0.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC0.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC0.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES0.fgu_idiv_valid[1]),

   .fdiv_valid          (`PROBES0.fgu_fdiv_valid[1]),

   .lsu_valid           (`PROBES0.lsu_valid[1]),
   .frf_w2_valid        (`SPC0.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC0.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC0.fgu.frf.w2_addr),

   .asi_valid           (`PROBES0.asi_valid_fx5[1]),
   .asi_in_progress     (`PROBES0.asi_in_progress_fx4[1]),

   .tlu_valid           (`PROBES0.tlu_valid[1])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 2
//
   
  nas_pipe0 t2 (
   .mycid               (cid),
   .mytid               (3'h2),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES0.op_2_w}),
   .PC_reg              ({`PROBES0.pc_2_w}),
   .Y_reg               (`SPC0.exu0.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC0.exu0.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC0.fgu.fac.fprs_tid2),
   .FSR_reg             (`SPC0.fgu.fad.fsr2_fx1[27:0]),
   .ASI_reg             (`SPC0.lsu.dcs.asi_state2),
   .GSR_reg             ({`SPC0.fgu.fgd.gsr2_mask_fx4[31:0], `SPC0.fgu.fpc.gsr2_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES0.tick_cmpr_2),
   .STICK_CMPR_reg      (`PROBES0.stick_cmpr_2),
   .HSTICK_CMPR_reg     (`PROBES0.hstick_cmpr_2),
   .PSTATE_reg          (`SPC0.tlu.tsd0.arch_pstate2),
   .TL_reg              (`SPC0.tlu.trl0.tl2),
   .PIL_reg             (`SPC0.tlu.trl0.pil2),
   .TBA_reg             (`SPC0.tlu.tsd0.tba2[47:15]),
   .VER_reg             (`SPC0.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC0.exu0.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC0.exu0.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC0.exu0.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC0.exu0.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC0.exu0.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC0.exu0.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC0.tlu.trl0.rd_softint2),
   .SOFTINT_reg         (`SPC0.tlu.trl0.softint2),
   .INTR_RECEIVE_reg    (`SPC0.tlu.cth.int_rec2),
   .GL_reg              (`SPC0.tlu.tlu_gl2),
   .HPSTATE_reg         (`SPC0.tlu.tsd0.arch_hpstate2),
   .HTBA_reg            (`SPC0.tlu.tsd0.htba2[47:14]),
   .HINTP_reg           (`SPC0.tlu.trl0.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC0.lsu.dcs.p0ctxt_2[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC0.lsu.dcs.s0ctxt_2[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC0.lsu.dcs.p1ctxt_2[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC0.lsu.dcs.s1ctxt_2[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC0.lsu.dcs.wpt_mode_2[1:0],
                                   `SPC0.lsu.dcs.wpt_mask_2[7:0],
                                   `SPC0.lsu.dcs.wpt_enable_2[1:0],
                                   18'd0,
                                   `SPC0.lsu.dcs.spec_enable[2],
                                   `SPC0.lsu.dcs.dmmu_enable[2],
                                   `SPC0.lsu.dcs.immu_enable[2],
                                   `SPC0.lsu.dcs.dc_enable[2],
                                   `SPC0.lsu.dcs.ic_enable[2]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd0.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd0.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC0.lsu.dcs.watchpoint2[47:3],3'b00}),
   .DSFAR_reg                     (`SPC0.tlu.dfd.dsfar_2[47:0]),

   .Trap_Entry_1        (`PROBES0.trap_entry_1_t2),
   .Trap_Entry_2        (`PROBES0.trap_entry_2_t2),
   .Trap_Entry_3        (`PROBES0.trap_entry_3_t2),
   .Trap_Entry_4        (`PROBES0.trap_entry_4_t2),
   .Trap_Entry_5        (`PROBES0.trap_entry_5_t2),
   .Trap_Entry_6        (`PROBES0.trap_entry_6_t2),

   .exu_valid           (`PROBES0.ex_valid[2]),

   .imul_valid          (`PROBES0.imul_valid[2]),

   .fp_valid            (`PROBES0.fg_valid[2]),
   .frf_w1_valid        (`SPC0.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC0.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC0.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES0.fgu_idiv_valid[2]),

   .fdiv_valid          (`PROBES0.fgu_fdiv_valid[2]),

   .lsu_valid           (`PROBES0.lsu_valid[2]),
   .frf_w2_valid        (`SPC0.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC0.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC0.fgu.frf.w2_addr),

   .asi_valid           (`PROBES0.asi_valid_fx5[2]),
   .asi_in_progress     (`PROBES0.asi_in_progress_fx4[2]),

   .tlu_valid           (`PROBES0.tlu_valid[2])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 3
//
   
  nas_pipe0 t3 (
   .mycid               (cid),
   .mytid               (3'h3),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES0.op_3_w}),
   .PC_reg              ({`PROBES0.pc_3_w}),
   .Y_reg               (`SPC0.exu0.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC0.exu0.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC0.fgu.fac.fprs_tid3),
   .FSR_reg             (`SPC0.fgu.fad.fsr3_fx1[27:0]),
   .ASI_reg             (`SPC0.lsu.dcs.asi_state3),
   .GSR_reg             ({`SPC0.fgu.fgd.gsr3_mask_fx4[31:0], `SPC0.fgu.fpc.gsr3_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES0.tick_cmpr_3),
   .STICK_CMPR_reg      (`PROBES0.stick_cmpr_3),
   .HSTICK_CMPR_reg     (`PROBES0.hstick_cmpr_3),
   .PSTATE_reg          (`SPC0.tlu.tsd0.arch_pstate3),
   .TL_reg              (`SPC0.tlu.trl0.tl3),
   .PIL_reg             (`SPC0.tlu.trl0.pil3),
   .TBA_reg             (`SPC0.tlu.tsd0.tba3[47:15]),
   .VER_reg             (`SPC0.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC0.exu0.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC0.exu0.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC0.exu0.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC0.exu0.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC0.exu0.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC0.exu0.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC0.tlu.trl0.rd_softint3),
   .SOFTINT_reg         (`SPC0.tlu.trl0.softint3),
   .INTR_RECEIVE_reg    (`SPC0.tlu.cth.int_rec3),
   .GL_reg              (`SPC0.tlu.tlu_gl3),
   .HPSTATE_reg         (`SPC0.tlu.tsd0.arch_hpstate3),
   .HTBA_reg            (`SPC0.tlu.tsd0.htba3[47:14]),
   .HINTP_reg           (`SPC0.tlu.trl0.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC0.lsu.dcs.p0ctxt_3[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC0.lsu.dcs.s0ctxt_3[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC0.lsu.dcs.p1ctxt_3[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC0.lsu.dcs.s1ctxt_3[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC0.lsu.dcs.wpt_mode_3[1:0],
                                   `SPC0.lsu.dcs.wpt_mask_3[7:0],
                                   `SPC0.lsu.dcs.wpt_enable_3[1:0],
                                   18'd0,
                                   `SPC0.lsu.dcs.spec_enable[3],
                                   `SPC0.lsu.dcs.dmmu_enable[3],
                                   `SPC0.lsu.dcs.immu_enable[3],
                                   `SPC0.lsu.dcs.dc_enable[3],
                                   `SPC0.lsu.dcs.ic_enable[3]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd0.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd0.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC0.lsu.dcs.watchpoint3[47:3],3'b00}),
   .DSFAR_reg                     (`SPC0.tlu.dfd.dsfar_3[47:0]),

   .Trap_Entry_1        (`PROBES0.trap_entry_1_t3),
   .Trap_Entry_2        (`PROBES0.trap_entry_2_t3),
   .Trap_Entry_3        (`PROBES0.trap_entry_3_t3),
   .Trap_Entry_4        (`PROBES0.trap_entry_4_t3),
   .Trap_Entry_5        (`PROBES0.trap_entry_5_t3),
   .Trap_Entry_6        (`PROBES0.trap_entry_6_t3),

   .exu_valid           (`PROBES0.ex_valid[3]),

   .imul_valid          (`PROBES0.imul_valid[3]),

   .fp_valid            (`PROBES0.fg_valid[3]),
   .frf_w1_valid        (`SPC0.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC0.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC0.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES0.fgu_idiv_valid[3]),

   .fdiv_valid          (`PROBES0.fgu_fdiv_valid[3]),

   .lsu_valid           (`PROBES0.lsu_valid[3]),
   .frf_w2_valid        (`SPC0.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC0.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC0.fgu.frf.w2_addr),

   .asi_valid           (`PROBES0.asi_valid_fx5[3]),
   .asi_in_progress     (`PROBES0.asi_in_progress_fx4[3]),

   .tlu_valid           (`PROBES0.tlu_valid[3])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 4
//
   
  nas_pipe0 t4 (
   .mycid               (cid),
   .mytid               (3'h4),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES0.op_4_w}),
   .PC_reg              ({`PROBES0.pc_4_w}),
   .Y_reg               (`SPC0.exu1.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC0.exu1.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC0.fgu.fac.fprs_tid4),
   .FSR_reg             (`SPC0.fgu.fad.fsr4_fx1[27:0]),
   .ASI_reg             (`SPC0.lsu.dcs.asi_state4),
   .GSR_reg             ({`SPC0.fgu.fgd.gsr4_mask_fx4[31:0], `SPC0.fgu.fpc.gsr4_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES0.tick_cmpr_4),
   .STICK_CMPR_reg      (`PROBES0.stick_cmpr_4),
   .HSTICK_CMPR_reg     (`PROBES0.hstick_cmpr_4),
   .PSTATE_reg          (`SPC0.tlu.tsd1.arch_pstate0),
   .TL_reg              (`SPC0.tlu.trl1.tl0),
   .PIL_reg             (`SPC0.tlu.trl1.pil0),
   .TBA_reg             (`SPC0.tlu.tsd1.tba0[47:15]),
   .VER_reg             (`SPC0.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC0.exu1.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC0.exu1.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC0.exu1.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC0.exu1.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC0.exu1.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC0.exu1.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC0.tlu.trl1.rd_softint0),
   .SOFTINT_reg         (`SPC0.tlu.trl1.softint0),
   .INTR_RECEIVE_reg    (`SPC0.tlu.cth.int_rec4),
   .GL_reg              (`SPC0.tlu.tlu_gl4),
   .HPSTATE_reg         (`SPC0.tlu.tsd1.arch_hpstate0),
   .HTBA_reg            (`SPC0.tlu.tsd1.htba0[47:14]),
   .HINTP_reg           (`SPC0.tlu.trl1.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC0.lsu.dcs.p0ctxt_4[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC0.lsu.dcs.s0ctxt_4[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC0.lsu.dcs.p1ctxt_4[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC0.lsu.dcs.s1ctxt_4[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC0.lsu.dcs.wpt_mode_4[1:0],
                                   `SPC0.lsu.dcs.wpt_mask_4[7:0],
                                   `SPC0.lsu.dcs.wpt_enable_4[1:0],
                                   18'd0,
                                   `SPC0.lsu.dcs.spec_enable[4],
                                   `SPC0.lsu.dcs.dmmu_enable[4],
                                   `SPC0.lsu.dcs.immu_enable[4],
                                   `SPC0.lsu.dcs.dc_enable[4],
                                   `SPC0.lsu.dcs.ic_enable[4]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd1.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd1.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC0.lsu.dcs.watchpoint4[47:3],3'b00}),
   .DSFAR_reg                     (`SPC0.tlu.dfd.dsfar_4[47:0]),

   .Trap_Entry_1        (`PROBES0.trap_entry_1_t4),
   .Trap_Entry_2        (`PROBES0.trap_entry_2_t4),
   .Trap_Entry_3        (`PROBES0.trap_entry_3_t4),
   .Trap_Entry_4        (`PROBES0.trap_entry_4_t4),
   .Trap_Entry_5        (`PROBES0.trap_entry_5_t4),
   .Trap_Entry_6        (`PROBES0.trap_entry_6_t4),

   .exu_valid           (`PROBES0.ex_valid[4]),

   .imul_valid          (`PROBES0.imul_valid[4]),

   .fp_valid            (`PROBES0.fg_valid[4]),
   .frf_w1_valid        (`SPC0.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC0.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC0.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES0.fgu_idiv_valid[4]),

   .fdiv_valid          (`PROBES0.fgu_fdiv_valid[4]),

   .lsu_valid           (`PROBES0.lsu_valid[4]),
   .frf_w2_valid        (`SPC0.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC0.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC0.fgu.frf.w2_addr),

   .asi_valid           (`PROBES0.asi_valid_fx5[4]),
   .asi_in_progress     (`PROBES0.asi_in_progress_fx4[4]),

   .tlu_valid           (`PROBES0.tlu_valid[4])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 5
//
   
  nas_pipe0 t5 (
   .mycid               (cid),
   .mytid               (3'h5),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES0.op_5_w}),
   .PC_reg              ({`PROBES0.pc_5_w}),
   .Y_reg               (`SPC0.exu1.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC0.exu1.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC0.fgu.fac.fprs_tid5),
   .FSR_reg             (`SPC0.fgu.fad.fsr5_fx1[27:0]),
   .ASI_reg             (`SPC0.lsu.dcs.asi_state5),
   .GSR_reg             ({`SPC0.fgu.fgd.gsr5_mask_fx4[31:0], `SPC0.fgu.fpc.gsr5_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES0.tick_cmpr_5),
   .STICK_CMPR_reg      (`PROBES0.stick_cmpr_5),
   .HSTICK_CMPR_reg     (`PROBES0.hstick_cmpr_5),
   .PSTATE_reg          (`SPC0.tlu.tsd1.arch_pstate1),
   .TL_reg              (`SPC0.tlu.trl1.tl1),
   .PIL_reg             (`SPC0.tlu.trl1.pil1),
   .TBA_reg             (`SPC0.tlu.tsd1.tba1[47:15]),
   .VER_reg             (`SPC0.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC0.exu1.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC0.exu1.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC0.exu1.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC0.exu1.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC0.exu1.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC0.exu1.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC0.tlu.trl1.rd_softint1),
   .SOFTINT_reg         (`SPC0.tlu.trl1.softint1),
   .INTR_RECEIVE_reg    (`SPC0.tlu.cth.int_rec5),
   .GL_reg              (`SPC0.tlu.tlu_gl5),
   .HPSTATE_reg         (`SPC0.tlu.tsd1.arch_hpstate1),
   .HTBA_reg            (`SPC0.tlu.tsd1.htba1[47:14]),
   .HINTP_reg           (`SPC0.tlu.trl1.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC0.lsu.dcs.p0ctxt_5[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC0.lsu.dcs.s0ctxt_5[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC0.lsu.dcs.p1ctxt_5[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC0.lsu.dcs.s1ctxt_5[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC0.lsu.dcs.wpt_mode_5[1:0],
                                   `SPC0.lsu.dcs.wpt_mask_5[7:0],
                                   `SPC0.lsu.dcs.wpt_enable_5[1:0],
                                   18'd0,
                                   `SPC0.lsu.dcs.spec_enable[5],
                                   `SPC0.lsu.dcs.dmmu_enable[5],
                                   `SPC0.lsu.dcs.immu_enable[5],
                                   `SPC0.lsu.dcs.dc_enable[5],
                                   `SPC0.lsu.dcs.ic_enable[5]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd1.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd1.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC0.lsu.dcs.watchpoint5[47:3],3'b00}),
   .DSFAR_reg                     (`SPC0.tlu.dfd.dsfar_5[47:0]),

   .Trap_Entry_1        (`PROBES0.trap_entry_1_t5),
   .Trap_Entry_2        (`PROBES0.trap_entry_2_t5),
   .Trap_Entry_3        (`PROBES0.trap_entry_3_t5),
   .Trap_Entry_4        (`PROBES0.trap_entry_4_t5),
   .Trap_Entry_5        (`PROBES0.trap_entry_5_t5),
   .Trap_Entry_6        (`PROBES0.trap_entry_6_t5),

   .exu_valid           (`PROBES0.ex_valid[5]),

   .imul_valid          (`PROBES0.imul_valid[5]),

   .fp_valid            (`PROBES0.fg_valid[5]),
   .frf_w1_valid        (`SPC0.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC0.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC0.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES0.fgu_idiv_valid[5]),

   .fdiv_valid          (`PROBES0.fgu_fdiv_valid[5]),

   .lsu_valid           (`PROBES0.lsu_valid[5]),
   .frf_w2_valid        (`SPC0.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC0.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC0.fgu.frf.w2_addr),

   .asi_valid           (`PROBES0.asi_valid_fx5[5]),
   .asi_in_progress     (`PROBES0.asi_in_progress_fx4[5]),

   .tlu_valid           (`PROBES0.tlu_valid[5])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 6
//
   
  nas_pipe0 t6 (
   .mycid               (cid),
   .mytid               (3'h6),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES0.op_6_w}),
   .PC_reg              ({`PROBES0.pc_6_w}),
   .Y_reg               (`SPC0.exu1.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC0.exu1.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC0.fgu.fac.fprs_tid6),
   .FSR_reg             (`SPC0.fgu.fad.fsr6_fx1[27:0]),
   .ASI_reg             (`SPC0.lsu.dcs.asi_state6),
   .GSR_reg             ({`SPC0.fgu.fgd.gsr6_mask_fx4[31:0], `SPC0.fgu.fpc.gsr6_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES0.tick_cmpr_6),
   .STICK_CMPR_reg      (`PROBES0.stick_cmpr_6),
   .HSTICK_CMPR_reg     (`PROBES0.hstick_cmpr_6),
   .PSTATE_reg          (`SPC0.tlu.tsd1.arch_pstate2),
   .TL_reg              (`SPC0.tlu.trl1.tl2),
   .PIL_reg             (`SPC0.tlu.trl1.pil2),
   .TBA_reg             (`SPC0.tlu.tsd1.tba2[47:15]),
   .VER_reg             (`SPC0.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC0.exu1.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC0.exu1.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC0.exu1.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC0.exu1.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC0.exu1.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC0.exu1.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC0.tlu.trl1.rd_softint2),
   .SOFTINT_reg         (`SPC0.tlu.trl1.softint2),
   .INTR_RECEIVE_reg    (`SPC0.tlu.cth.int_rec6),
   .GL_reg              (`SPC0.tlu.tlu_gl6),
   .HPSTATE_reg         (`SPC0.tlu.tsd1.arch_hpstate2),
   .HTBA_reg            (`SPC0.tlu.tsd1.htba2[47:14]),
   .HINTP_reg           (`SPC0.tlu.trl1.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC0.lsu.dcs.p0ctxt_6[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC0.lsu.dcs.s0ctxt_6[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC0.lsu.dcs.p1ctxt_6[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC0.lsu.dcs.s1ctxt_6[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC0.lsu.dcs.wpt_mode_6[1:0],
                                   `SPC0.lsu.dcs.wpt_mask_6[7:0],
                                   `SPC0.lsu.dcs.wpt_enable_6[1:0],
                                   18'd0,
                                   `SPC0.lsu.dcs.spec_enable[6],
                                   `SPC0.lsu.dcs.dmmu_enable[6],
                                   `SPC0.lsu.dcs.immu_enable[6],
                                   `SPC0.lsu.dcs.dc_enable[6],
                                   `SPC0.lsu.dcs.ic_enable[6]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd1.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd1.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC0.lsu.dcs.watchpoint6[47:3],3'b00}),
   .DSFAR_reg                     (`SPC0.tlu.dfd.dsfar_6[47:0]),

   .Trap_Entry_1        (`PROBES0.trap_entry_1_t6),
   .Trap_Entry_2        (`PROBES0.trap_entry_2_t6),
   .Trap_Entry_3        (`PROBES0.trap_entry_3_t6),
   .Trap_Entry_4        (`PROBES0.trap_entry_4_t6),
   .Trap_Entry_5        (`PROBES0.trap_entry_5_t6),
   .Trap_Entry_6        (`PROBES0.trap_entry_6_t6),

   .exu_valid           (`PROBES0.ex_valid[6]),

   .imul_valid          (`PROBES0.imul_valid[6]),

   .fp_valid            (`PROBES0.fg_valid[6]),
   .frf_w1_valid        (`SPC0.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC0.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC0.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES0.fgu_idiv_valid[6]),

   .fdiv_valid          (`PROBES0.fgu_fdiv_valid[6]),

   .lsu_valid           (`PROBES0.lsu_valid[6]),
   .frf_w2_valid        (`SPC0.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC0.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC0.fgu.frf.w2_addr),

   .asi_valid           (`PROBES0.asi_valid_fx5[6]),
   .asi_in_progress     (`PROBES0.asi_in_progress_fx4[6]),

   .tlu_valid           (`PROBES0.tlu_valid[6])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 7
//
   
  nas_pipe0 t7 (
   .mycid               (cid),
   .mytid               (3'h7),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES0.op_7_w}),
   .PC_reg              ({`PROBES0.pc_7_w}),
   .Y_reg               (`SPC0.exu1.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC0.exu1.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC0.fgu.fac.fprs_tid7),
   .FSR_reg             (`SPC0.fgu.fad.fsr7_fx1[27:0]),
   .ASI_reg             (`SPC0.lsu.dcs.asi_state7),
   .GSR_reg             ({`SPC0.fgu.fgd.gsr7_mask_fx4[31:0], `SPC0.fgu.fpc.gsr7_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES0.tick_cmpr_7),
   .STICK_CMPR_reg      (`PROBES0.stick_cmpr_7),
   .HSTICK_CMPR_reg     (`PROBES0.hstick_cmpr_7),
   .PSTATE_reg          (`SPC0.tlu.tsd1.arch_pstate3),
   .TL_reg              (`SPC0.tlu.trl1.tl3),
   .PIL_reg             (`SPC0.tlu.trl1.pil3),
   .TBA_reg             (`SPC0.tlu.tsd1.tba3[47:15]),
   .VER_reg             (`SPC0.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC0.exu1.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC0.exu1.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC0.exu1.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC0.exu1.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC0.exu1.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC0.exu1.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC0.tlu.trl1.rd_softint3),
   .SOFTINT_reg         (`SPC0.tlu.trl1.softint3),
   .INTR_RECEIVE_reg    (`SPC0.tlu.cth.int_rec7),
   .GL_reg              (`SPC0.tlu.tlu_gl7),
   .HPSTATE_reg         (`SPC0.tlu.tsd1.arch_hpstate3),
   .HTBA_reg            (`SPC0.tlu.tsd1.htba3[47:14]),
   .HINTP_reg           (`SPC0.tlu.trl1.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC0.lsu.dcs.p0ctxt_7[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC0.lsu.dcs.s0ctxt_7[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC0.lsu.dcs.p1ctxt_7[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC0.lsu.dcs.s1ctxt_7[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC0.lsu.dcs.wpt_mode_7[1:0],
                                   `SPC0.lsu.dcs.wpt_mask_7[7:0],
                                   `SPC0.lsu.dcs.wpt_enable_7[1:0],
                                   18'd0,
                                   `SPC0.lsu.dcs.spec_enable[7],
                                   `SPC0.lsu.dcs.dmmu_enable[7],
                                   `SPC0.lsu.dcs.immu_enable[7],
                                   `SPC0.lsu.dcs.dc_enable[7],
                                   `SPC0.lsu.dcs.ic_enable[7]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd1.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC0.mmu.asd1.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC0.lsu.dcs.watchpoint7[47:3],3'b00}),
   .DSFAR_reg                     (`SPC0.tlu.dfd.dsfar_7[47:0]),

   .Trap_Entry_1        (`PROBES0.trap_entry_1_t7),
   .Trap_Entry_2        (`PROBES0.trap_entry_2_t7),
   .Trap_Entry_3        (`PROBES0.trap_entry_3_t7),
   .Trap_Entry_4        (`PROBES0.trap_entry_4_t7),
   .Trap_Entry_5        (`PROBES0.trap_entry_5_t7),
   .Trap_Entry_6        (`PROBES0.trap_entry_6_t7),

   .exu_valid           (`PROBES0.ex_valid[7]),

   .imul_valid          (`PROBES0.imul_valid[7]),

   .fp_valid            (`PROBES0.fg_valid[7]),
   .frf_w1_valid        (`SPC0.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC0.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC0.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES0.fgu_idiv_valid[7]),

   .fdiv_valid          (`PROBES0.fgu_fdiv_valid[7]),

   .lsu_valid           (`PROBES0.lsu_valid[7]),
   .frf_w2_valid        (`SPC0.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC0.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC0.fgu.frf.w2_addr),

   .asi_valid           (`PROBES0.asi_valid_fx5[7]),
   .asi_in_progress     (`PROBES0.asi_in_progress_fx4[7]),

   .tlu_valid           (`PROBES0.tlu_valid[7])
`endif
  );
				      
//----------------------------------------------------------


//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_1

module nas_core1 (

  cid
);

input [2:0] cid;

integer i;

//----------------------------------------------------------

//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//
   
  nas_pipe1 t0 (
   .mycid               (cid),
   .mytid               (3'h0),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES1.op_0_w}),
   .PC_reg              ({`PROBES1.pc_0_w}),
   .Y_reg               (`SPC1.exu0.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC1.exu0.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC1.fgu.fac.fprs_tid0),
   .FSR_reg             (`SPC1.fgu.fad.fsr0_fx1[27:0]),
   .ASI_reg             (`SPC1.lsu.dcs.asi_state0),
   .GSR_reg             ({`SPC1.fgu.fgd.gsr0_mask_fx4[31:0], `SPC1.fgu.fpc.gsr0_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES1.tick_cmpr_0),
   .STICK_CMPR_reg      (`PROBES1.stick_cmpr_0),
   .HSTICK_CMPR_reg     (`PROBES1.hstick_cmpr_0),
   .PSTATE_reg          (`SPC1.tlu.tsd0.arch_pstate0),
   .TL_reg              (`SPC1.tlu.trl0.tl0),
   .PIL_reg             (`SPC1.tlu.trl0.pil0),
   .TBA_reg             (`SPC1.tlu.tsd0.tba0[47:15]),
   .VER_reg             (`SPC1.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC1.exu0.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC1.exu0.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC1.exu0.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC1.exu0.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC1.exu0.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC1.exu0.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC1.tlu.trl0.rd_softint0),
   .SOFTINT_reg         (`SPC1.tlu.trl0.softint0),
   .INTR_RECEIVE_reg    (`SPC1.tlu.cth.int_rec0),
   .GL_reg              (`SPC1.tlu.tlu_gl0),
   .HPSTATE_reg         (`SPC1.tlu.tsd0.arch_hpstate0),
   .HTBA_reg            (`SPC1.tlu.tsd0.htba0[47:14]),
   .HINTP_reg           (`SPC1.tlu.trl0.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC1.lsu.dcs.p0ctxt_0[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC1.lsu.dcs.s0ctxt_0[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC1.lsu.dcs.p1ctxt_0[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC1.lsu.dcs.s1ctxt_0[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC1.lsu.dcs.wpt_mode_0[1:0],
                                   `SPC1.lsu.dcs.wpt_mask_0[7:0],
                                   `SPC1.lsu.dcs.wpt_enable_0[1:0],
                                   18'd0,
                                   `SPC1.lsu.dcs.spec_enable[0],
                                   `SPC1.lsu.dcs.dmmu_enable[0],
                                   `SPC1.lsu.dcs.immu_enable[0],
                                   `SPC1.lsu.dcs.dc_enable[0],
                                   `SPC1.lsu.dcs.ic_enable[0]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd0.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd0.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC1.lsu.dcs.watchpoint0[47:3],3'b00}),
   .DSFAR_reg                     (`SPC1.tlu.dfd.dsfar_0[47:0]),

   .Trap_Entry_1        (`PROBES1.trap_entry_1_t0),
   .Trap_Entry_2        (`PROBES1.trap_entry_2_t0),
   .Trap_Entry_3        (`PROBES1.trap_entry_3_t0),
   .Trap_Entry_4        (`PROBES1.trap_entry_4_t0),
   .Trap_Entry_5        (`PROBES1.trap_entry_5_t0),
   .Trap_Entry_6        (`PROBES1.trap_entry_6_t0),

   .exu_valid           (`PROBES1.ex_valid[0]),

   .imul_valid          (`PROBES1.imul_valid[0]),

   .fp_valid            (`PROBES1.fg_valid[0]),
   .frf_w1_valid        (`SPC1.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC1.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC1.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES1.fgu_idiv_valid[0]),

   .fdiv_valid          (`PROBES1.fgu_fdiv_valid[0]),

   .lsu_valid           (`PROBES1.lsu_valid[0]),
   .frf_w2_valid        (`SPC1.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC1.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC1.fgu.frf.w2_addr),

   .asi_valid           (`PROBES1.asi_valid_fx5[0]),
   .asi_in_progress     (`PROBES1.asi_in_progress_fx4[0]),

   .tlu_valid           (`PROBES1.tlu_valid[0])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 1
//
   
  nas_pipe1 t1 (
   .mycid               (cid),
   .mytid               (3'h1),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES1.op_1_w}),
   .PC_reg              ({`PROBES1.pc_1_w}),
   .Y_reg               (`SPC1.exu0.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC1.exu0.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC1.fgu.fac.fprs_tid1),
   .FSR_reg             (`SPC1.fgu.fad.fsr1_fx1[27:0]),
   .ASI_reg             (`SPC1.lsu.dcs.asi_state1),
   .GSR_reg             ({`SPC1.fgu.fgd.gsr1_mask_fx4[31:0], `SPC1.fgu.fpc.gsr1_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES1.tick_cmpr_1),
   .STICK_CMPR_reg      (`PROBES1.stick_cmpr_1),
   .HSTICK_CMPR_reg     (`PROBES1.hstick_cmpr_1),
   .PSTATE_reg          (`SPC1.tlu.tsd0.arch_pstate1),
   .TL_reg              (`SPC1.tlu.trl0.tl1),
   .PIL_reg             (`SPC1.tlu.trl0.pil1),
   .TBA_reg             (`SPC1.tlu.tsd0.tba1[47:15]),
   .VER_reg             (`SPC1.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC1.exu0.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC1.exu0.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC1.exu0.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC1.exu0.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC1.exu0.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC1.exu0.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC1.tlu.trl0.rd_softint1),
   .SOFTINT_reg         (`SPC1.tlu.trl0.softint1),
   .INTR_RECEIVE_reg    (`SPC1.tlu.cth.int_rec1),
   .GL_reg              (`SPC1.tlu.tlu_gl1),
   .HPSTATE_reg         (`SPC1.tlu.tsd0.arch_hpstate1),
   .HTBA_reg            (`SPC1.tlu.tsd0.htba1[47:14]),
   .HINTP_reg           (`SPC1.tlu.trl0.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC1.lsu.dcs.p0ctxt_1[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC1.lsu.dcs.s0ctxt_1[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC1.lsu.dcs.p1ctxt_1[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC1.lsu.dcs.s1ctxt_1[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC1.lsu.dcs.wpt_mode_1[1:0],
                                   `SPC1.lsu.dcs.wpt_mask_1[7:0],
                                   `SPC1.lsu.dcs.wpt_enable_1[1:0],
                                   18'd0,
                                   `SPC1.lsu.dcs.spec_enable[1],
                                   `SPC1.lsu.dcs.dmmu_enable[1],
                                   `SPC1.lsu.dcs.immu_enable[1],
                                   `SPC1.lsu.dcs.dc_enable[1],
                                   `SPC1.lsu.dcs.ic_enable[1]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd0.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd0.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC1.lsu.dcs.watchpoint1[47:3],3'b00}),
   .DSFAR_reg                     (`SPC1.tlu.dfd.dsfar_1[47:0]),

   .Trap_Entry_1        (`PROBES1.trap_entry_1_t1),
   .Trap_Entry_2        (`PROBES1.trap_entry_2_t1),
   .Trap_Entry_3        (`PROBES1.trap_entry_3_t1),
   .Trap_Entry_4        (`PROBES1.trap_entry_4_t1),
   .Trap_Entry_5        (`PROBES1.trap_entry_5_t1),
   .Trap_Entry_6        (`PROBES1.trap_entry_6_t1),

   .exu_valid           (`PROBES1.ex_valid[1]),

   .imul_valid          (`PROBES1.imul_valid[1]),

   .fp_valid            (`PROBES1.fg_valid[1]),
   .frf_w1_valid        (`SPC1.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC1.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC1.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES1.fgu_idiv_valid[1]),

   .fdiv_valid          (`PROBES1.fgu_fdiv_valid[1]),

   .lsu_valid           (`PROBES1.lsu_valid[1]),
   .frf_w2_valid        (`SPC1.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC1.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC1.fgu.frf.w2_addr),

   .asi_valid           (`PROBES1.asi_valid_fx5[1]),
   .asi_in_progress     (`PROBES1.asi_in_progress_fx4[1]),

   .tlu_valid           (`PROBES1.tlu_valid[1])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 2
//
   
  nas_pipe1 t2 (
   .mycid               (cid),
   .mytid               (3'h2),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES1.op_2_w}),
   .PC_reg              ({`PROBES1.pc_2_w}),
   .Y_reg               (`SPC1.exu0.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC1.exu0.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC1.fgu.fac.fprs_tid2),
   .FSR_reg             (`SPC1.fgu.fad.fsr2_fx1[27:0]),
   .ASI_reg             (`SPC1.lsu.dcs.asi_state2),
   .GSR_reg             ({`SPC1.fgu.fgd.gsr2_mask_fx4[31:0], `SPC1.fgu.fpc.gsr2_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES1.tick_cmpr_2),
   .STICK_CMPR_reg      (`PROBES1.stick_cmpr_2),
   .HSTICK_CMPR_reg     (`PROBES1.hstick_cmpr_2),
   .PSTATE_reg          (`SPC1.tlu.tsd0.arch_pstate2),
   .TL_reg              (`SPC1.tlu.trl0.tl2),
   .PIL_reg             (`SPC1.tlu.trl0.pil2),
   .TBA_reg             (`SPC1.tlu.tsd0.tba2[47:15]),
   .VER_reg             (`SPC1.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC1.exu0.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC1.exu0.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC1.exu0.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC1.exu0.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC1.exu0.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC1.exu0.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC1.tlu.trl0.rd_softint2),
   .SOFTINT_reg         (`SPC1.tlu.trl0.softint2),
   .INTR_RECEIVE_reg    (`SPC1.tlu.cth.int_rec2),
   .GL_reg              (`SPC1.tlu.tlu_gl2),
   .HPSTATE_reg         (`SPC1.tlu.tsd0.arch_hpstate2),
   .HTBA_reg            (`SPC1.tlu.tsd0.htba2[47:14]),
   .HINTP_reg           (`SPC1.tlu.trl0.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC1.lsu.dcs.p0ctxt_2[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC1.lsu.dcs.s0ctxt_2[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC1.lsu.dcs.p1ctxt_2[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC1.lsu.dcs.s1ctxt_2[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC1.lsu.dcs.wpt_mode_2[1:0],
                                   `SPC1.lsu.dcs.wpt_mask_2[7:0],
                                   `SPC1.lsu.dcs.wpt_enable_2[1:0],
                                   18'd0,
                                   `SPC1.lsu.dcs.spec_enable[2],
                                   `SPC1.lsu.dcs.dmmu_enable[2],
                                   `SPC1.lsu.dcs.immu_enable[2],
                                   `SPC1.lsu.dcs.dc_enable[2],
                                   `SPC1.lsu.dcs.ic_enable[2]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd0.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd0.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC1.lsu.dcs.watchpoint2[47:3],3'b00}),
   .DSFAR_reg                     (`SPC1.tlu.dfd.dsfar_2[47:0]),

   .Trap_Entry_1        (`PROBES1.trap_entry_1_t2),
   .Trap_Entry_2        (`PROBES1.trap_entry_2_t2),
   .Trap_Entry_3        (`PROBES1.trap_entry_3_t2),
   .Trap_Entry_4        (`PROBES1.trap_entry_4_t2),
   .Trap_Entry_5        (`PROBES1.trap_entry_5_t2),
   .Trap_Entry_6        (`PROBES1.trap_entry_6_t2),

   .exu_valid           (`PROBES1.ex_valid[2]),

   .imul_valid          (`PROBES1.imul_valid[2]),

   .fp_valid            (`PROBES1.fg_valid[2]),
   .frf_w1_valid        (`SPC1.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC1.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC1.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES1.fgu_idiv_valid[2]),

   .fdiv_valid          (`PROBES1.fgu_fdiv_valid[2]),

   .lsu_valid           (`PROBES1.lsu_valid[2]),
   .frf_w2_valid        (`SPC1.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC1.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC1.fgu.frf.w2_addr),

   .asi_valid           (`PROBES1.asi_valid_fx5[2]),
   .asi_in_progress     (`PROBES1.asi_in_progress_fx4[2]),

   .tlu_valid           (`PROBES1.tlu_valid[2])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 3
//
   
  nas_pipe1 t3 (
   .mycid               (cid),
   .mytid               (3'h3),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES1.op_3_w}),
   .PC_reg              ({`PROBES1.pc_3_w}),
   .Y_reg               (`SPC1.exu0.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC1.exu0.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC1.fgu.fac.fprs_tid3),
   .FSR_reg             (`SPC1.fgu.fad.fsr3_fx1[27:0]),
   .ASI_reg             (`SPC1.lsu.dcs.asi_state3),
   .GSR_reg             ({`SPC1.fgu.fgd.gsr3_mask_fx4[31:0], `SPC1.fgu.fpc.gsr3_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES1.tick_cmpr_3),
   .STICK_CMPR_reg      (`PROBES1.stick_cmpr_3),
   .HSTICK_CMPR_reg     (`PROBES1.hstick_cmpr_3),
   .PSTATE_reg          (`SPC1.tlu.tsd0.arch_pstate3),
   .TL_reg              (`SPC1.tlu.trl0.tl3),
   .PIL_reg             (`SPC1.tlu.trl0.pil3),
   .TBA_reg             (`SPC1.tlu.tsd0.tba3[47:15]),
   .VER_reg             (`SPC1.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC1.exu0.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC1.exu0.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC1.exu0.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC1.exu0.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC1.exu0.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC1.exu0.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC1.tlu.trl0.rd_softint3),
   .SOFTINT_reg         (`SPC1.tlu.trl0.softint3),
   .INTR_RECEIVE_reg    (`SPC1.tlu.cth.int_rec3),
   .GL_reg              (`SPC1.tlu.tlu_gl3),
   .HPSTATE_reg         (`SPC1.tlu.tsd0.arch_hpstate3),
   .HTBA_reg            (`SPC1.tlu.tsd0.htba3[47:14]),
   .HINTP_reg           (`SPC1.tlu.trl0.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC1.lsu.dcs.p0ctxt_3[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC1.lsu.dcs.s0ctxt_3[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC1.lsu.dcs.p1ctxt_3[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC1.lsu.dcs.s1ctxt_3[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC1.lsu.dcs.wpt_mode_3[1:0],
                                   `SPC1.lsu.dcs.wpt_mask_3[7:0],
                                   `SPC1.lsu.dcs.wpt_enable_3[1:0],
                                   18'd0,
                                   `SPC1.lsu.dcs.spec_enable[3],
                                   `SPC1.lsu.dcs.dmmu_enable[3],
                                   `SPC1.lsu.dcs.immu_enable[3],
                                   `SPC1.lsu.dcs.dc_enable[3],
                                   `SPC1.lsu.dcs.ic_enable[3]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd0.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd0.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC1.lsu.dcs.watchpoint3[47:3],3'b00}),
   .DSFAR_reg                     (`SPC1.tlu.dfd.dsfar_3[47:0]),

   .Trap_Entry_1        (`PROBES1.trap_entry_1_t3),
   .Trap_Entry_2        (`PROBES1.trap_entry_2_t3),
   .Trap_Entry_3        (`PROBES1.trap_entry_3_t3),
   .Trap_Entry_4        (`PROBES1.trap_entry_4_t3),
   .Trap_Entry_5        (`PROBES1.trap_entry_5_t3),
   .Trap_Entry_6        (`PROBES1.trap_entry_6_t3),

   .exu_valid           (`PROBES1.ex_valid[3]),

   .imul_valid          (`PROBES1.imul_valid[3]),

   .fp_valid            (`PROBES1.fg_valid[3]),
   .frf_w1_valid        (`SPC1.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC1.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC1.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES1.fgu_idiv_valid[3]),

   .fdiv_valid          (`PROBES1.fgu_fdiv_valid[3]),

   .lsu_valid           (`PROBES1.lsu_valid[3]),
   .frf_w2_valid        (`SPC1.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC1.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC1.fgu.frf.w2_addr),

   .asi_valid           (`PROBES1.asi_valid_fx5[3]),
   .asi_in_progress     (`PROBES1.asi_in_progress_fx4[3]),

   .tlu_valid           (`PROBES1.tlu_valid[3])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 4
//
   
  nas_pipe1 t4 (
   .mycid               (cid),
   .mytid               (3'h4),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES1.op_4_w}),
   .PC_reg              ({`PROBES1.pc_4_w}),
   .Y_reg               (`SPC1.exu1.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC1.exu1.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC1.fgu.fac.fprs_tid4),
   .FSR_reg             (`SPC1.fgu.fad.fsr4_fx1[27:0]),
   .ASI_reg             (`SPC1.lsu.dcs.asi_state4),
   .GSR_reg             ({`SPC1.fgu.fgd.gsr4_mask_fx4[31:0], `SPC1.fgu.fpc.gsr4_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES1.tick_cmpr_4),
   .STICK_CMPR_reg      (`PROBES1.stick_cmpr_4),
   .HSTICK_CMPR_reg     (`PROBES1.hstick_cmpr_4),
   .PSTATE_reg          (`SPC1.tlu.tsd1.arch_pstate0),
   .TL_reg              (`SPC1.tlu.trl1.tl0),
   .PIL_reg             (`SPC1.tlu.trl1.pil0),
   .TBA_reg             (`SPC1.tlu.tsd1.tba0[47:15]),
   .VER_reg             (`SPC1.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC1.exu1.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC1.exu1.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC1.exu1.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC1.exu1.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC1.exu1.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC1.exu1.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC1.tlu.trl1.rd_softint0),
   .SOFTINT_reg         (`SPC1.tlu.trl1.softint0),
   .INTR_RECEIVE_reg    (`SPC1.tlu.cth.int_rec4),
   .GL_reg              (`SPC1.tlu.tlu_gl4),
   .HPSTATE_reg         (`SPC1.tlu.tsd1.arch_hpstate0),
   .HTBA_reg            (`SPC1.tlu.tsd1.htba0[47:14]),
   .HINTP_reg           (`SPC1.tlu.trl1.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC1.lsu.dcs.p0ctxt_4[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC1.lsu.dcs.s0ctxt_4[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC1.lsu.dcs.p1ctxt_4[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC1.lsu.dcs.s1ctxt_4[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC1.lsu.dcs.wpt_mode_4[1:0],
                                   `SPC1.lsu.dcs.wpt_mask_4[7:0],
                                   `SPC1.lsu.dcs.wpt_enable_4[1:0],
                                   18'd0,
                                   `SPC1.lsu.dcs.spec_enable[4],
                                   `SPC1.lsu.dcs.dmmu_enable[4],
                                   `SPC1.lsu.dcs.immu_enable[4],
                                   `SPC1.lsu.dcs.dc_enable[4],
                                   `SPC1.lsu.dcs.ic_enable[4]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd1.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd1.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC1.lsu.dcs.watchpoint4[47:3],3'b00}),
   .DSFAR_reg                     (`SPC1.tlu.dfd.dsfar_4[47:0]),

   .Trap_Entry_1        (`PROBES1.trap_entry_1_t4),
   .Trap_Entry_2        (`PROBES1.trap_entry_2_t4),
   .Trap_Entry_3        (`PROBES1.trap_entry_3_t4),
   .Trap_Entry_4        (`PROBES1.trap_entry_4_t4),
   .Trap_Entry_5        (`PROBES1.trap_entry_5_t4),
   .Trap_Entry_6        (`PROBES1.trap_entry_6_t4),

   .exu_valid           (`PROBES1.ex_valid[4]),

   .imul_valid          (`PROBES1.imul_valid[4]),

   .fp_valid            (`PROBES1.fg_valid[4]),
   .frf_w1_valid        (`SPC1.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC1.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC1.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES1.fgu_idiv_valid[4]),

   .fdiv_valid          (`PROBES1.fgu_fdiv_valid[4]),

   .lsu_valid           (`PROBES1.lsu_valid[4]),
   .frf_w2_valid        (`SPC1.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC1.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC1.fgu.frf.w2_addr),

   .asi_valid           (`PROBES1.asi_valid_fx5[4]),
   .asi_in_progress     (`PROBES1.asi_in_progress_fx4[4]),

   .tlu_valid           (`PROBES1.tlu_valid[4])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 5
//
   
  nas_pipe1 t5 (
   .mycid               (cid),
   .mytid               (3'h5),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES1.op_5_w}),
   .PC_reg              ({`PROBES1.pc_5_w}),
   .Y_reg               (`SPC1.exu1.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC1.exu1.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC1.fgu.fac.fprs_tid5),
   .FSR_reg             (`SPC1.fgu.fad.fsr5_fx1[27:0]),
   .ASI_reg             (`SPC1.lsu.dcs.asi_state5),
   .GSR_reg             ({`SPC1.fgu.fgd.gsr5_mask_fx4[31:0], `SPC1.fgu.fpc.gsr5_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES1.tick_cmpr_5),
   .STICK_CMPR_reg      (`PROBES1.stick_cmpr_5),
   .HSTICK_CMPR_reg     (`PROBES1.hstick_cmpr_5),
   .PSTATE_reg          (`SPC1.tlu.tsd1.arch_pstate1),
   .TL_reg              (`SPC1.tlu.trl1.tl1),
   .PIL_reg             (`SPC1.tlu.trl1.pil1),
   .TBA_reg             (`SPC1.tlu.tsd1.tba1[47:15]),
   .VER_reg             (`SPC1.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC1.exu1.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC1.exu1.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC1.exu1.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC1.exu1.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC1.exu1.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC1.exu1.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC1.tlu.trl1.rd_softint1),
   .SOFTINT_reg         (`SPC1.tlu.trl1.softint1),
   .INTR_RECEIVE_reg    (`SPC1.tlu.cth.int_rec5),
   .GL_reg              (`SPC1.tlu.tlu_gl5),
   .HPSTATE_reg         (`SPC1.tlu.tsd1.arch_hpstate1),
   .HTBA_reg            (`SPC1.tlu.tsd1.htba1[47:14]),
   .HINTP_reg           (`SPC1.tlu.trl1.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC1.lsu.dcs.p0ctxt_5[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC1.lsu.dcs.s0ctxt_5[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC1.lsu.dcs.p1ctxt_5[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC1.lsu.dcs.s1ctxt_5[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC1.lsu.dcs.wpt_mode_5[1:0],
                                   `SPC1.lsu.dcs.wpt_mask_5[7:0],
                                   `SPC1.lsu.dcs.wpt_enable_5[1:0],
                                   18'd0,
                                   `SPC1.lsu.dcs.spec_enable[5],
                                   `SPC1.lsu.dcs.dmmu_enable[5],
                                   `SPC1.lsu.dcs.immu_enable[5],
                                   `SPC1.lsu.dcs.dc_enable[5],
                                   `SPC1.lsu.dcs.ic_enable[5]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd1.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd1.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC1.lsu.dcs.watchpoint5[47:3],3'b00}),
   .DSFAR_reg                     (`SPC1.tlu.dfd.dsfar_5[47:0]),

   .Trap_Entry_1        (`PROBES1.trap_entry_1_t5),
   .Trap_Entry_2        (`PROBES1.trap_entry_2_t5),
   .Trap_Entry_3        (`PROBES1.trap_entry_3_t5),
   .Trap_Entry_4        (`PROBES1.trap_entry_4_t5),
   .Trap_Entry_5        (`PROBES1.trap_entry_5_t5),
   .Trap_Entry_6        (`PROBES1.trap_entry_6_t5),

   .exu_valid           (`PROBES1.ex_valid[5]),

   .imul_valid          (`PROBES1.imul_valid[5]),

   .fp_valid            (`PROBES1.fg_valid[5]),
   .frf_w1_valid        (`SPC1.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC1.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC1.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES1.fgu_idiv_valid[5]),

   .fdiv_valid          (`PROBES1.fgu_fdiv_valid[5]),

   .lsu_valid           (`PROBES1.lsu_valid[5]),
   .frf_w2_valid        (`SPC1.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC1.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC1.fgu.frf.w2_addr),

   .asi_valid           (`PROBES1.asi_valid_fx5[5]),
   .asi_in_progress     (`PROBES1.asi_in_progress_fx4[5]),

   .tlu_valid           (`PROBES1.tlu_valid[5])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 6
//
   
  nas_pipe1 t6 (
   .mycid               (cid),
   .mytid               (3'h6),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES1.op_6_w}),
   .PC_reg              ({`PROBES1.pc_6_w}),
   .Y_reg               (`SPC1.exu1.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC1.exu1.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC1.fgu.fac.fprs_tid6),
   .FSR_reg             (`SPC1.fgu.fad.fsr6_fx1[27:0]),
   .ASI_reg             (`SPC1.lsu.dcs.asi_state6),
   .GSR_reg             ({`SPC1.fgu.fgd.gsr6_mask_fx4[31:0], `SPC1.fgu.fpc.gsr6_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES1.tick_cmpr_6),
   .STICK_CMPR_reg      (`PROBES1.stick_cmpr_6),
   .HSTICK_CMPR_reg     (`PROBES1.hstick_cmpr_6),
   .PSTATE_reg          (`SPC1.tlu.tsd1.arch_pstate2),
   .TL_reg              (`SPC1.tlu.trl1.tl2),
   .PIL_reg             (`SPC1.tlu.trl1.pil2),
   .TBA_reg             (`SPC1.tlu.tsd1.tba2[47:15]),
   .VER_reg             (`SPC1.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC1.exu1.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC1.exu1.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC1.exu1.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC1.exu1.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC1.exu1.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC1.exu1.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC1.tlu.trl1.rd_softint2),
   .SOFTINT_reg         (`SPC1.tlu.trl1.softint2),
   .INTR_RECEIVE_reg    (`SPC1.tlu.cth.int_rec6),
   .GL_reg              (`SPC1.tlu.tlu_gl6),
   .HPSTATE_reg         (`SPC1.tlu.tsd1.arch_hpstate2),
   .HTBA_reg            (`SPC1.tlu.tsd1.htba2[47:14]),
   .HINTP_reg           (`SPC1.tlu.trl1.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC1.lsu.dcs.p0ctxt_6[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC1.lsu.dcs.s0ctxt_6[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC1.lsu.dcs.p1ctxt_6[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC1.lsu.dcs.s1ctxt_6[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC1.lsu.dcs.wpt_mode_6[1:0],
                                   `SPC1.lsu.dcs.wpt_mask_6[7:0],
                                   `SPC1.lsu.dcs.wpt_enable_6[1:0],
                                   18'd0,
                                   `SPC1.lsu.dcs.spec_enable[6],
                                   `SPC1.lsu.dcs.dmmu_enable[6],
                                   `SPC1.lsu.dcs.immu_enable[6],
                                   `SPC1.lsu.dcs.dc_enable[6],
                                   `SPC1.lsu.dcs.ic_enable[6]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd1.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd1.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC1.lsu.dcs.watchpoint6[47:3],3'b00}),
   .DSFAR_reg                     (`SPC1.tlu.dfd.dsfar_6[47:0]),

   .Trap_Entry_1        (`PROBES1.trap_entry_1_t6),
   .Trap_Entry_2        (`PROBES1.trap_entry_2_t6),
   .Trap_Entry_3        (`PROBES1.trap_entry_3_t6),
   .Trap_Entry_4        (`PROBES1.trap_entry_4_t6),
   .Trap_Entry_5        (`PROBES1.trap_entry_5_t6),
   .Trap_Entry_6        (`PROBES1.trap_entry_6_t6),

   .exu_valid           (`PROBES1.ex_valid[6]),

   .imul_valid          (`PROBES1.imul_valid[6]),

   .fp_valid            (`PROBES1.fg_valid[6]),
   .frf_w1_valid        (`SPC1.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC1.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC1.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES1.fgu_idiv_valid[6]),

   .fdiv_valid          (`PROBES1.fgu_fdiv_valid[6]),

   .lsu_valid           (`PROBES1.lsu_valid[6]),
   .frf_w2_valid        (`SPC1.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC1.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC1.fgu.frf.w2_addr),

   .asi_valid           (`PROBES1.asi_valid_fx5[6]),
   .asi_in_progress     (`PROBES1.asi_in_progress_fx4[6]),

   .tlu_valid           (`PROBES1.tlu_valid[6])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 7
//
   
  nas_pipe1 t7 (
   .mycid               (cid),
   .mytid               (3'h7),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES1.op_7_w}),
   .PC_reg              ({`PROBES1.pc_7_w}),
   .Y_reg               (`SPC1.exu1.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC1.exu1.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC1.fgu.fac.fprs_tid7),
   .FSR_reg             (`SPC1.fgu.fad.fsr7_fx1[27:0]),
   .ASI_reg             (`SPC1.lsu.dcs.asi_state7),
   .GSR_reg             ({`SPC1.fgu.fgd.gsr7_mask_fx4[31:0], `SPC1.fgu.fpc.gsr7_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES1.tick_cmpr_7),
   .STICK_CMPR_reg      (`PROBES1.stick_cmpr_7),
   .HSTICK_CMPR_reg     (`PROBES1.hstick_cmpr_7),
   .PSTATE_reg          (`SPC1.tlu.tsd1.arch_pstate3),
   .TL_reg              (`SPC1.tlu.trl1.tl3),
   .PIL_reg             (`SPC1.tlu.trl1.pil3),
   .TBA_reg             (`SPC1.tlu.tsd1.tba3[47:15]),
   .VER_reg             (`SPC1.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC1.exu1.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC1.exu1.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC1.exu1.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC1.exu1.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC1.exu1.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC1.exu1.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC1.tlu.trl1.rd_softint3),
   .SOFTINT_reg         (`SPC1.tlu.trl1.softint3),
   .INTR_RECEIVE_reg    (`SPC1.tlu.cth.int_rec7),
   .GL_reg              (`SPC1.tlu.tlu_gl7),
   .HPSTATE_reg         (`SPC1.tlu.tsd1.arch_hpstate3),
   .HTBA_reg            (`SPC1.tlu.tsd1.htba3[47:14]),
   .HINTP_reg           (`SPC1.tlu.trl1.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC1.lsu.dcs.p0ctxt_7[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC1.lsu.dcs.s0ctxt_7[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC1.lsu.dcs.p1ctxt_7[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC1.lsu.dcs.s1ctxt_7[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC1.lsu.dcs.wpt_mode_7[1:0],
                                   `SPC1.lsu.dcs.wpt_mask_7[7:0],
                                   `SPC1.lsu.dcs.wpt_enable_7[1:0],
                                   18'd0,
                                   `SPC1.lsu.dcs.spec_enable[7],
                                   `SPC1.lsu.dcs.dmmu_enable[7],
                                   `SPC1.lsu.dcs.immu_enable[7],
                                   `SPC1.lsu.dcs.dc_enable[7],
                                   `SPC1.lsu.dcs.ic_enable[7]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd1.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC1.mmu.asd1.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC1.lsu.dcs.watchpoint7[47:3],3'b00}),
   .DSFAR_reg                     (`SPC1.tlu.dfd.dsfar_7[47:0]),

   .Trap_Entry_1        (`PROBES1.trap_entry_1_t7),
   .Trap_Entry_2        (`PROBES1.trap_entry_2_t7),
   .Trap_Entry_3        (`PROBES1.trap_entry_3_t7),
   .Trap_Entry_4        (`PROBES1.trap_entry_4_t7),
   .Trap_Entry_5        (`PROBES1.trap_entry_5_t7),
   .Trap_Entry_6        (`PROBES1.trap_entry_6_t7),

   .exu_valid           (`PROBES1.ex_valid[7]),

   .imul_valid          (`PROBES1.imul_valid[7]),

   .fp_valid            (`PROBES1.fg_valid[7]),
   .frf_w1_valid        (`SPC1.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC1.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC1.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES1.fgu_idiv_valid[7]),

   .fdiv_valid          (`PROBES1.fgu_fdiv_valid[7]),

   .lsu_valid           (`PROBES1.lsu_valid[7]),
   .frf_w2_valid        (`SPC1.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC1.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC1.fgu.frf.w2_addr),

   .asi_valid           (`PROBES1.asi_valid_fx5[7]),
   .asi_in_progress     (`PROBES1.asi_in_progress_fx4[7]),

   .tlu_valid           (`PROBES1.tlu_valid[7])
`endif
  );
				      
//----------------------------------------------------------


//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_2

module nas_core2 (

  cid
);

input [2:0] cid;

integer i;

//----------------------------------------------------------

//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//
   
  nas_pipe2 t0 (
   .mycid               (cid),
   .mytid               (3'h0),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES2.op_0_w}),
   .PC_reg              ({`PROBES2.pc_0_w}),
   .Y_reg               (`SPC2.exu0.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC2.exu0.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC2.fgu.fac.fprs_tid0),
   .FSR_reg             (`SPC2.fgu.fad.fsr0_fx1[27:0]),
   .ASI_reg             (`SPC2.lsu.dcs.asi_state0),
   .GSR_reg             ({`SPC2.fgu.fgd.gsr0_mask_fx4[31:0], `SPC2.fgu.fpc.gsr0_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES2.tick_cmpr_0),
   .STICK_CMPR_reg      (`PROBES2.stick_cmpr_0),
   .HSTICK_CMPR_reg     (`PROBES2.hstick_cmpr_0),
   .PSTATE_reg          (`SPC2.tlu.tsd0.arch_pstate0),
   .TL_reg              (`SPC2.tlu.trl0.tl0),
   .PIL_reg             (`SPC2.tlu.trl0.pil0),
   .TBA_reg             (`SPC2.tlu.tsd0.tba0[47:15]),
   .VER_reg             (`SPC2.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC2.exu0.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC2.exu0.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC2.exu0.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC2.exu0.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC2.exu0.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC2.exu0.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC2.tlu.trl0.rd_softint0),
   .SOFTINT_reg         (`SPC2.tlu.trl0.softint0),
   .INTR_RECEIVE_reg    (`SPC2.tlu.cth.int_rec0),
   .GL_reg              (`SPC2.tlu.tlu_gl0),
   .HPSTATE_reg         (`SPC2.tlu.tsd0.arch_hpstate0),
   .HTBA_reg            (`SPC2.tlu.tsd0.htba0[47:14]),
   .HINTP_reg           (`SPC2.tlu.trl0.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC2.lsu.dcs.p0ctxt_0[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC2.lsu.dcs.s0ctxt_0[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC2.lsu.dcs.p1ctxt_0[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC2.lsu.dcs.s1ctxt_0[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC2.lsu.dcs.wpt_mode_0[1:0],
                                   `SPC2.lsu.dcs.wpt_mask_0[7:0],
                                   `SPC2.lsu.dcs.wpt_enable_0[1:0],
                                   18'd0,
                                   `SPC2.lsu.dcs.spec_enable[0],
                                   `SPC2.lsu.dcs.dmmu_enable[0],
                                   `SPC2.lsu.dcs.immu_enable[0],
                                   `SPC2.lsu.dcs.dc_enable[0],
                                   `SPC2.lsu.dcs.ic_enable[0]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd0.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd0.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC2.lsu.dcs.watchpoint0[47:3],3'b00}),
   .DSFAR_reg                     (`SPC2.tlu.dfd.dsfar_0[47:0]),

   .Trap_Entry_1        (`PROBES2.trap_entry_1_t0),
   .Trap_Entry_2        (`PROBES2.trap_entry_2_t0),
   .Trap_Entry_3        (`PROBES2.trap_entry_3_t0),
   .Trap_Entry_4        (`PROBES2.trap_entry_4_t0),
   .Trap_Entry_5        (`PROBES2.trap_entry_5_t0),
   .Trap_Entry_6        (`PROBES2.trap_entry_6_t0),

   .exu_valid           (`PROBES2.ex_valid[0]),

   .imul_valid          (`PROBES2.imul_valid[0]),

   .fp_valid            (`PROBES2.fg_valid[0]),
   .frf_w1_valid        (`SPC2.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC2.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC2.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES2.fgu_idiv_valid[0]),

   .fdiv_valid          (`PROBES2.fgu_fdiv_valid[0]),

   .lsu_valid           (`PROBES2.lsu_valid[0]),
   .frf_w2_valid        (`SPC2.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC2.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC2.fgu.frf.w2_addr),

   .asi_valid           (`PROBES2.asi_valid_fx5[0]),
   .asi_in_progress     (`PROBES2.asi_in_progress_fx4[0]),

   .tlu_valid           (`PROBES2.tlu_valid[0])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 1
//
   
  nas_pipe2 t1 (
   .mycid               (cid),
   .mytid               (3'h1),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES2.op_1_w}),
   .PC_reg              ({`PROBES2.pc_1_w}),
   .Y_reg               (`SPC2.exu0.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC2.exu0.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC2.fgu.fac.fprs_tid1),
   .FSR_reg             (`SPC2.fgu.fad.fsr1_fx1[27:0]),
   .ASI_reg             (`SPC2.lsu.dcs.asi_state1),
   .GSR_reg             ({`SPC2.fgu.fgd.gsr1_mask_fx4[31:0], `SPC2.fgu.fpc.gsr1_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES2.tick_cmpr_1),
   .STICK_CMPR_reg      (`PROBES2.stick_cmpr_1),
   .HSTICK_CMPR_reg     (`PROBES2.hstick_cmpr_1),
   .PSTATE_reg          (`SPC2.tlu.tsd0.arch_pstate1),
   .TL_reg              (`SPC2.tlu.trl0.tl1),
   .PIL_reg             (`SPC2.tlu.trl0.pil1),
   .TBA_reg             (`SPC2.tlu.tsd0.tba1[47:15]),
   .VER_reg             (`SPC2.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC2.exu0.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC2.exu0.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC2.exu0.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC2.exu0.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC2.exu0.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC2.exu0.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC2.tlu.trl0.rd_softint1),
   .SOFTINT_reg         (`SPC2.tlu.trl0.softint1),
   .INTR_RECEIVE_reg    (`SPC2.tlu.cth.int_rec1),
   .GL_reg              (`SPC2.tlu.tlu_gl1),
   .HPSTATE_reg         (`SPC2.tlu.tsd0.arch_hpstate1),
   .HTBA_reg            (`SPC2.tlu.tsd0.htba1[47:14]),
   .HINTP_reg           (`SPC2.tlu.trl0.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC2.lsu.dcs.p0ctxt_1[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC2.lsu.dcs.s0ctxt_1[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC2.lsu.dcs.p1ctxt_1[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC2.lsu.dcs.s1ctxt_1[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC2.lsu.dcs.wpt_mode_1[1:0],
                                   `SPC2.lsu.dcs.wpt_mask_1[7:0],
                                   `SPC2.lsu.dcs.wpt_enable_1[1:0],
                                   18'd0,
                                   `SPC2.lsu.dcs.spec_enable[1],
                                   `SPC2.lsu.dcs.dmmu_enable[1],
                                   `SPC2.lsu.dcs.immu_enable[1],
                                   `SPC2.lsu.dcs.dc_enable[1],
                                   `SPC2.lsu.dcs.ic_enable[1]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd0.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd0.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC2.lsu.dcs.watchpoint1[47:3],3'b00}),
   .DSFAR_reg                     (`SPC2.tlu.dfd.dsfar_1[47:0]),

   .Trap_Entry_1        (`PROBES2.trap_entry_1_t1),
   .Trap_Entry_2        (`PROBES2.trap_entry_2_t1),
   .Trap_Entry_3        (`PROBES2.trap_entry_3_t1),
   .Trap_Entry_4        (`PROBES2.trap_entry_4_t1),
   .Trap_Entry_5        (`PROBES2.trap_entry_5_t1),
   .Trap_Entry_6        (`PROBES2.trap_entry_6_t1),

   .exu_valid           (`PROBES2.ex_valid[1]),

   .imul_valid          (`PROBES2.imul_valid[1]),

   .fp_valid            (`PROBES2.fg_valid[1]),
   .frf_w1_valid        (`SPC2.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC2.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC2.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES2.fgu_idiv_valid[1]),

   .fdiv_valid          (`PROBES2.fgu_fdiv_valid[1]),

   .lsu_valid           (`PROBES2.lsu_valid[1]),
   .frf_w2_valid        (`SPC2.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC2.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC2.fgu.frf.w2_addr),

   .asi_valid           (`PROBES2.asi_valid_fx5[1]),
   .asi_in_progress     (`PROBES2.asi_in_progress_fx4[1]),

   .tlu_valid           (`PROBES2.tlu_valid[1])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 2
//
   
  nas_pipe2 t2 (
   .mycid               (cid),
   .mytid               (3'h2),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES2.op_2_w}),
   .PC_reg              ({`PROBES2.pc_2_w}),
   .Y_reg               (`SPC2.exu0.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC2.exu0.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC2.fgu.fac.fprs_tid2),
   .FSR_reg             (`SPC2.fgu.fad.fsr2_fx1[27:0]),
   .ASI_reg             (`SPC2.lsu.dcs.asi_state2),
   .GSR_reg             ({`SPC2.fgu.fgd.gsr2_mask_fx4[31:0], `SPC2.fgu.fpc.gsr2_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES2.tick_cmpr_2),
   .STICK_CMPR_reg      (`PROBES2.stick_cmpr_2),
   .HSTICK_CMPR_reg     (`PROBES2.hstick_cmpr_2),
   .PSTATE_reg          (`SPC2.tlu.tsd0.arch_pstate2),
   .TL_reg              (`SPC2.tlu.trl0.tl2),
   .PIL_reg             (`SPC2.tlu.trl0.pil2),
   .TBA_reg             (`SPC2.tlu.tsd0.tba2[47:15]),
   .VER_reg             (`SPC2.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC2.exu0.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC2.exu0.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC2.exu0.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC2.exu0.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC2.exu0.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC2.exu0.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC2.tlu.trl0.rd_softint2),
   .SOFTINT_reg         (`SPC2.tlu.trl0.softint2),
   .INTR_RECEIVE_reg    (`SPC2.tlu.cth.int_rec2),
   .GL_reg              (`SPC2.tlu.tlu_gl2),
   .HPSTATE_reg         (`SPC2.tlu.tsd0.arch_hpstate2),
   .HTBA_reg            (`SPC2.tlu.tsd0.htba2[47:14]),
   .HINTP_reg           (`SPC2.tlu.trl0.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC2.lsu.dcs.p0ctxt_2[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC2.lsu.dcs.s0ctxt_2[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC2.lsu.dcs.p1ctxt_2[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC2.lsu.dcs.s1ctxt_2[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC2.lsu.dcs.wpt_mode_2[1:0],
                                   `SPC2.lsu.dcs.wpt_mask_2[7:0],
                                   `SPC2.lsu.dcs.wpt_enable_2[1:0],
                                   18'd0,
                                   `SPC2.lsu.dcs.spec_enable[2],
                                   `SPC2.lsu.dcs.dmmu_enable[2],
                                   `SPC2.lsu.dcs.immu_enable[2],
                                   `SPC2.lsu.dcs.dc_enable[2],
                                   `SPC2.lsu.dcs.ic_enable[2]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd0.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd0.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC2.lsu.dcs.watchpoint2[47:3],3'b00}),
   .DSFAR_reg                     (`SPC2.tlu.dfd.dsfar_2[47:0]),

   .Trap_Entry_1        (`PROBES2.trap_entry_1_t2),
   .Trap_Entry_2        (`PROBES2.trap_entry_2_t2),
   .Trap_Entry_3        (`PROBES2.trap_entry_3_t2),
   .Trap_Entry_4        (`PROBES2.trap_entry_4_t2),
   .Trap_Entry_5        (`PROBES2.trap_entry_5_t2),
   .Trap_Entry_6        (`PROBES2.trap_entry_6_t2),

   .exu_valid           (`PROBES2.ex_valid[2]),

   .imul_valid          (`PROBES2.imul_valid[2]),

   .fp_valid            (`PROBES2.fg_valid[2]),
   .frf_w1_valid        (`SPC2.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC2.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC2.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES2.fgu_idiv_valid[2]),

   .fdiv_valid          (`PROBES2.fgu_fdiv_valid[2]),

   .lsu_valid           (`PROBES2.lsu_valid[2]),
   .frf_w2_valid        (`SPC2.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC2.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC2.fgu.frf.w2_addr),

   .asi_valid           (`PROBES2.asi_valid_fx5[2]),
   .asi_in_progress     (`PROBES2.asi_in_progress_fx4[2]),

   .tlu_valid           (`PROBES2.tlu_valid[2])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 3
//
   
  nas_pipe2 t3 (
   .mycid               (cid),
   .mytid               (3'h3),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES2.op_3_w}),
   .PC_reg              ({`PROBES2.pc_3_w}),
   .Y_reg               (`SPC2.exu0.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC2.exu0.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC2.fgu.fac.fprs_tid3),
   .FSR_reg             (`SPC2.fgu.fad.fsr3_fx1[27:0]),
   .ASI_reg             (`SPC2.lsu.dcs.asi_state3),
   .GSR_reg             ({`SPC2.fgu.fgd.gsr3_mask_fx4[31:0], `SPC2.fgu.fpc.gsr3_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES2.tick_cmpr_3),
   .STICK_CMPR_reg      (`PROBES2.stick_cmpr_3),
   .HSTICK_CMPR_reg     (`PROBES2.hstick_cmpr_3),
   .PSTATE_reg          (`SPC2.tlu.tsd0.arch_pstate3),
   .TL_reg              (`SPC2.tlu.trl0.tl3),
   .PIL_reg             (`SPC2.tlu.trl0.pil3),
   .TBA_reg             (`SPC2.tlu.tsd0.tba3[47:15]),
   .VER_reg             (`SPC2.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC2.exu0.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC2.exu0.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC2.exu0.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC2.exu0.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC2.exu0.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC2.exu0.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC2.tlu.trl0.rd_softint3),
   .SOFTINT_reg         (`SPC2.tlu.trl0.softint3),
   .INTR_RECEIVE_reg    (`SPC2.tlu.cth.int_rec3),
   .GL_reg              (`SPC2.tlu.tlu_gl3),
   .HPSTATE_reg         (`SPC2.tlu.tsd0.arch_hpstate3),
   .HTBA_reg            (`SPC2.tlu.tsd0.htba3[47:14]),
   .HINTP_reg           (`SPC2.tlu.trl0.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC2.lsu.dcs.p0ctxt_3[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC2.lsu.dcs.s0ctxt_3[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC2.lsu.dcs.p1ctxt_3[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC2.lsu.dcs.s1ctxt_3[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC2.lsu.dcs.wpt_mode_3[1:0],
                                   `SPC2.lsu.dcs.wpt_mask_3[7:0],
                                   `SPC2.lsu.dcs.wpt_enable_3[1:0],
                                   18'd0,
                                   `SPC2.lsu.dcs.spec_enable[3],
                                   `SPC2.lsu.dcs.dmmu_enable[3],
                                   `SPC2.lsu.dcs.immu_enable[3],
                                   `SPC2.lsu.dcs.dc_enable[3],
                                   `SPC2.lsu.dcs.ic_enable[3]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd0.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd0.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC2.lsu.dcs.watchpoint3[47:3],3'b00}),
   .DSFAR_reg                     (`SPC2.tlu.dfd.dsfar_3[47:0]),

   .Trap_Entry_1        (`PROBES2.trap_entry_1_t3),
   .Trap_Entry_2        (`PROBES2.trap_entry_2_t3),
   .Trap_Entry_3        (`PROBES2.trap_entry_3_t3),
   .Trap_Entry_4        (`PROBES2.trap_entry_4_t3),
   .Trap_Entry_5        (`PROBES2.trap_entry_5_t3),
   .Trap_Entry_6        (`PROBES2.trap_entry_6_t3),

   .exu_valid           (`PROBES2.ex_valid[3]),

   .imul_valid          (`PROBES2.imul_valid[3]),

   .fp_valid            (`PROBES2.fg_valid[3]),
   .frf_w1_valid        (`SPC2.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC2.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC2.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES2.fgu_idiv_valid[3]),

   .fdiv_valid          (`PROBES2.fgu_fdiv_valid[3]),

   .lsu_valid           (`PROBES2.lsu_valid[3]),
   .frf_w2_valid        (`SPC2.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC2.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC2.fgu.frf.w2_addr),

   .asi_valid           (`PROBES2.asi_valid_fx5[3]),
   .asi_in_progress     (`PROBES2.asi_in_progress_fx4[3]),

   .tlu_valid           (`PROBES2.tlu_valid[3])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 4
//
   
  nas_pipe2 t4 (
   .mycid               (cid),
   .mytid               (3'h4),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES2.op_4_w}),
   .PC_reg              ({`PROBES2.pc_4_w}),
   .Y_reg               (`SPC2.exu1.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC2.exu1.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC2.fgu.fac.fprs_tid4),
   .FSR_reg             (`SPC2.fgu.fad.fsr4_fx1[27:0]),
   .ASI_reg             (`SPC2.lsu.dcs.asi_state4),
   .GSR_reg             ({`SPC2.fgu.fgd.gsr4_mask_fx4[31:0], `SPC2.fgu.fpc.gsr4_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES2.tick_cmpr_4),
   .STICK_CMPR_reg      (`PROBES2.stick_cmpr_4),
   .HSTICK_CMPR_reg     (`PROBES2.hstick_cmpr_4),
   .PSTATE_reg          (`SPC2.tlu.tsd1.arch_pstate0),
   .TL_reg              (`SPC2.tlu.trl1.tl0),
   .PIL_reg             (`SPC2.tlu.trl1.pil0),
   .TBA_reg             (`SPC2.tlu.tsd1.tba0[47:15]),
   .VER_reg             (`SPC2.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC2.exu1.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC2.exu1.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC2.exu1.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC2.exu1.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC2.exu1.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC2.exu1.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC2.tlu.trl1.rd_softint0),
   .SOFTINT_reg         (`SPC2.tlu.trl1.softint0),
   .INTR_RECEIVE_reg    (`SPC2.tlu.cth.int_rec4),
   .GL_reg              (`SPC2.tlu.tlu_gl4),
   .HPSTATE_reg         (`SPC2.tlu.tsd1.arch_hpstate0),
   .HTBA_reg            (`SPC2.tlu.tsd1.htba0[47:14]),
   .HINTP_reg           (`SPC2.tlu.trl1.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC2.lsu.dcs.p0ctxt_4[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC2.lsu.dcs.s0ctxt_4[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC2.lsu.dcs.p1ctxt_4[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC2.lsu.dcs.s1ctxt_4[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC2.lsu.dcs.wpt_mode_4[1:0],
                                   `SPC2.lsu.dcs.wpt_mask_4[7:0],
                                   `SPC2.lsu.dcs.wpt_enable_4[1:0],
                                   18'd0,
                                   `SPC2.lsu.dcs.spec_enable[4],
                                   `SPC2.lsu.dcs.dmmu_enable[4],
                                   `SPC2.lsu.dcs.immu_enable[4],
                                   `SPC2.lsu.dcs.dc_enable[4],
                                   `SPC2.lsu.dcs.ic_enable[4]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd1.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd1.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC2.lsu.dcs.watchpoint4[47:3],3'b00}),
   .DSFAR_reg                     (`SPC2.tlu.dfd.dsfar_4[47:0]),

   .Trap_Entry_1        (`PROBES2.trap_entry_1_t4),
   .Trap_Entry_2        (`PROBES2.trap_entry_2_t4),
   .Trap_Entry_3        (`PROBES2.trap_entry_3_t4),
   .Trap_Entry_4        (`PROBES2.trap_entry_4_t4),
   .Trap_Entry_5        (`PROBES2.trap_entry_5_t4),
   .Trap_Entry_6        (`PROBES2.trap_entry_6_t4),

   .exu_valid           (`PROBES2.ex_valid[4]),

   .imul_valid          (`PROBES2.imul_valid[4]),

   .fp_valid            (`PROBES2.fg_valid[4]),
   .frf_w1_valid        (`SPC2.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC2.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC2.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES2.fgu_idiv_valid[4]),

   .fdiv_valid          (`PROBES2.fgu_fdiv_valid[4]),

   .lsu_valid           (`PROBES2.lsu_valid[4]),
   .frf_w2_valid        (`SPC2.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC2.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC2.fgu.frf.w2_addr),

   .asi_valid           (`PROBES2.asi_valid_fx5[4]),
   .asi_in_progress     (`PROBES2.asi_in_progress_fx4[4]),

   .tlu_valid           (`PROBES2.tlu_valid[4])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 5
//
   
  nas_pipe2 t5 (
   .mycid               (cid),
   .mytid               (3'h5),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES2.op_5_w}),
   .PC_reg              ({`PROBES2.pc_5_w}),
   .Y_reg               (`SPC2.exu1.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC2.exu1.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC2.fgu.fac.fprs_tid5),
   .FSR_reg             (`SPC2.fgu.fad.fsr5_fx1[27:0]),
   .ASI_reg             (`SPC2.lsu.dcs.asi_state5),
   .GSR_reg             ({`SPC2.fgu.fgd.gsr5_mask_fx4[31:0], `SPC2.fgu.fpc.gsr5_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES2.tick_cmpr_5),
   .STICK_CMPR_reg      (`PROBES2.stick_cmpr_5),
   .HSTICK_CMPR_reg     (`PROBES2.hstick_cmpr_5),
   .PSTATE_reg          (`SPC2.tlu.tsd1.arch_pstate1),
   .TL_reg              (`SPC2.tlu.trl1.tl1),
   .PIL_reg             (`SPC2.tlu.trl1.pil1),
   .TBA_reg             (`SPC2.tlu.tsd1.tba1[47:15]),
   .VER_reg             (`SPC2.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC2.exu1.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC2.exu1.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC2.exu1.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC2.exu1.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC2.exu1.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC2.exu1.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC2.tlu.trl1.rd_softint1),
   .SOFTINT_reg         (`SPC2.tlu.trl1.softint1),
   .INTR_RECEIVE_reg    (`SPC2.tlu.cth.int_rec5),
   .GL_reg              (`SPC2.tlu.tlu_gl5),
   .HPSTATE_reg         (`SPC2.tlu.tsd1.arch_hpstate1),
   .HTBA_reg            (`SPC2.tlu.tsd1.htba1[47:14]),
   .HINTP_reg           (`SPC2.tlu.trl1.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC2.lsu.dcs.p0ctxt_5[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC2.lsu.dcs.s0ctxt_5[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC2.lsu.dcs.p1ctxt_5[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC2.lsu.dcs.s1ctxt_5[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC2.lsu.dcs.wpt_mode_5[1:0],
                                   `SPC2.lsu.dcs.wpt_mask_5[7:0],
                                   `SPC2.lsu.dcs.wpt_enable_5[1:0],
                                   18'd0,
                                   `SPC2.lsu.dcs.spec_enable[5],
                                   `SPC2.lsu.dcs.dmmu_enable[5],
                                   `SPC2.lsu.dcs.immu_enable[5],
                                   `SPC2.lsu.dcs.dc_enable[5],
                                   `SPC2.lsu.dcs.ic_enable[5]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd1.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd1.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC2.lsu.dcs.watchpoint5[47:3],3'b00}),
   .DSFAR_reg                     (`SPC2.tlu.dfd.dsfar_5[47:0]),

   .Trap_Entry_1        (`PROBES2.trap_entry_1_t5),
   .Trap_Entry_2        (`PROBES2.trap_entry_2_t5),
   .Trap_Entry_3        (`PROBES2.trap_entry_3_t5),
   .Trap_Entry_4        (`PROBES2.trap_entry_4_t5),
   .Trap_Entry_5        (`PROBES2.trap_entry_5_t5),
   .Trap_Entry_6        (`PROBES2.trap_entry_6_t5),

   .exu_valid           (`PROBES2.ex_valid[5]),

   .imul_valid          (`PROBES2.imul_valid[5]),

   .fp_valid            (`PROBES2.fg_valid[5]),
   .frf_w1_valid        (`SPC2.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC2.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC2.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES2.fgu_idiv_valid[5]),

   .fdiv_valid          (`PROBES2.fgu_fdiv_valid[5]),

   .lsu_valid           (`PROBES2.lsu_valid[5]),
   .frf_w2_valid        (`SPC2.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC2.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC2.fgu.frf.w2_addr),

   .asi_valid           (`PROBES2.asi_valid_fx5[5]),
   .asi_in_progress     (`PROBES2.asi_in_progress_fx4[5]),

   .tlu_valid           (`PROBES2.tlu_valid[5])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 6
//
   
  nas_pipe2 t6 (
   .mycid               (cid),
   .mytid               (3'h6),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES2.op_6_w}),
   .PC_reg              ({`PROBES2.pc_6_w}),
   .Y_reg               (`SPC2.exu1.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC2.exu1.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC2.fgu.fac.fprs_tid6),
   .FSR_reg             (`SPC2.fgu.fad.fsr6_fx1[27:0]),
   .ASI_reg             (`SPC2.lsu.dcs.asi_state6),
   .GSR_reg             ({`SPC2.fgu.fgd.gsr6_mask_fx4[31:0], `SPC2.fgu.fpc.gsr6_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES2.tick_cmpr_6),
   .STICK_CMPR_reg      (`PROBES2.stick_cmpr_6),
   .HSTICK_CMPR_reg     (`PROBES2.hstick_cmpr_6),
   .PSTATE_reg          (`SPC2.tlu.tsd1.arch_pstate2),
   .TL_reg              (`SPC2.tlu.trl1.tl2),
   .PIL_reg             (`SPC2.tlu.trl1.pil2),
   .TBA_reg             (`SPC2.tlu.tsd1.tba2[47:15]),
   .VER_reg             (`SPC2.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC2.exu1.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC2.exu1.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC2.exu1.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC2.exu1.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC2.exu1.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC2.exu1.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC2.tlu.trl1.rd_softint2),
   .SOFTINT_reg         (`SPC2.tlu.trl1.softint2),
   .INTR_RECEIVE_reg    (`SPC2.tlu.cth.int_rec6),
   .GL_reg              (`SPC2.tlu.tlu_gl6),
   .HPSTATE_reg         (`SPC2.tlu.tsd1.arch_hpstate2),
   .HTBA_reg            (`SPC2.tlu.tsd1.htba2[47:14]),
   .HINTP_reg           (`SPC2.tlu.trl1.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC2.lsu.dcs.p0ctxt_6[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC2.lsu.dcs.s0ctxt_6[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC2.lsu.dcs.p1ctxt_6[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC2.lsu.dcs.s1ctxt_6[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC2.lsu.dcs.wpt_mode_6[1:0],
                                   `SPC2.lsu.dcs.wpt_mask_6[7:0],
                                   `SPC2.lsu.dcs.wpt_enable_6[1:0],
                                   18'd0,
                                   `SPC2.lsu.dcs.spec_enable[6],
                                   `SPC2.lsu.dcs.dmmu_enable[6],
                                   `SPC2.lsu.dcs.immu_enable[6],
                                   `SPC2.lsu.dcs.dc_enable[6],
                                   `SPC2.lsu.dcs.ic_enable[6]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd1.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd1.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC2.lsu.dcs.watchpoint6[47:3],3'b00}),
   .DSFAR_reg                     (`SPC2.tlu.dfd.dsfar_6[47:0]),

   .Trap_Entry_1        (`PROBES2.trap_entry_1_t6),
   .Trap_Entry_2        (`PROBES2.trap_entry_2_t6),
   .Trap_Entry_3        (`PROBES2.trap_entry_3_t6),
   .Trap_Entry_4        (`PROBES2.trap_entry_4_t6),
   .Trap_Entry_5        (`PROBES2.trap_entry_5_t6),
   .Trap_Entry_6        (`PROBES2.trap_entry_6_t6),

   .exu_valid           (`PROBES2.ex_valid[6]),

   .imul_valid          (`PROBES2.imul_valid[6]),

   .fp_valid            (`PROBES2.fg_valid[6]),
   .frf_w1_valid        (`SPC2.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC2.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC2.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES2.fgu_idiv_valid[6]),

   .fdiv_valid          (`PROBES2.fgu_fdiv_valid[6]),

   .lsu_valid           (`PROBES2.lsu_valid[6]),
   .frf_w2_valid        (`SPC2.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC2.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC2.fgu.frf.w2_addr),

   .asi_valid           (`PROBES2.asi_valid_fx5[6]),
   .asi_in_progress     (`PROBES2.asi_in_progress_fx4[6]),

   .tlu_valid           (`PROBES2.tlu_valid[6])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 7
//
   
  nas_pipe2 t7 (
   .mycid               (cid),
   .mytid               (3'h7),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES2.op_7_w}),
   .PC_reg              ({`PROBES2.pc_7_w}),
   .Y_reg               (`SPC2.exu1.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC2.exu1.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC2.fgu.fac.fprs_tid7),
   .FSR_reg             (`SPC2.fgu.fad.fsr7_fx1[27:0]),
   .ASI_reg             (`SPC2.lsu.dcs.asi_state7),
   .GSR_reg             ({`SPC2.fgu.fgd.gsr7_mask_fx4[31:0], `SPC2.fgu.fpc.gsr7_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES2.tick_cmpr_7),
   .STICK_CMPR_reg      (`PROBES2.stick_cmpr_7),
   .HSTICK_CMPR_reg     (`PROBES2.hstick_cmpr_7),
   .PSTATE_reg          (`SPC2.tlu.tsd1.arch_pstate3),
   .TL_reg              (`SPC2.tlu.trl1.tl3),
   .PIL_reg             (`SPC2.tlu.trl1.pil3),
   .TBA_reg             (`SPC2.tlu.tsd1.tba3[47:15]),
   .VER_reg             (`SPC2.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC2.exu1.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC2.exu1.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC2.exu1.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC2.exu1.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC2.exu1.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC2.exu1.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC2.tlu.trl1.rd_softint3),
   .SOFTINT_reg         (`SPC2.tlu.trl1.softint3),
   .INTR_RECEIVE_reg    (`SPC2.tlu.cth.int_rec7),
   .GL_reg              (`SPC2.tlu.tlu_gl7),
   .HPSTATE_reg         (`SPC2.tlu.tsd1.arch_hpstate3),
   .HTBA_reg            (`SPC2.tlu.tsd1.htba3[47:14]),
   .HINTP_reg           (`SPC2.tlu.trl1.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC2.lsu.dcs.p0ctxt_7[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC2.lsu.dcs.s0ctxt_7[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC2.lsu.dcs.p1ctxt_7[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC2.lsu.dcs.s1ctxt_7[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC2.lsu.dcs.wpt_mode_7[1:0],
                                   `SPC2.lsu.dcs.wpt_mask_7[7:0],
                                   `SPC2.lsu.dcs.wpt_enable_7[1:0],
                                   18'd0,
                                   `SPC2.lsu.dcs.spec_enable[7],
                                   `SPC2.lsu.dcs.dmmu_enable[7],
                                   `SPC2.lsu.dcs.immu_enable[7],
                                   `SPC2.lsu.dcs.dc_enable[7],
                                   `SPC2.lsu.dcs.ic_enable[7]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd1.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC2.mmu.asd1.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC2.lsu.dcs.watchpoint7[47:3],3'b00}),
   .DSFAR_reg                     (`SPC2.tlu.dfd.dsfar_7[47:0]),

   .Trap_Entry_1        (`PROBES2.trap_entry_1_t7),
   .Trap_Entry_2        (`PROBES2.trap_entry_2_t7),
   .Trap_Entry_3        (`PROBES2.trap_entry_3_t7),
   .Trap_Entry_4        (`PROBES2.trap_entry_4_t7),
   .Trap_Entry_5        (`PROBES2.trap_entry_5_t7),
   .Trap_Entry_6        (`PROBES2.trap_entry_6_t7),

   .exu_valid           (`PROBES2.ex_valid[7]),

   .imul_valid          (`PROBES2.imul_valid[7]),

   .fp_valid            (`PROBES2.fg_valid[7]),
   .frf_w1_valid        (`SPC2.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC2.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC2.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES2.fgu_idiv_valid[7]),

   .fdiv_valid          (`PROBES2.fgu_fdiv_valid[7]),

   .lsu_valid           (`PROBES2.lsu_valid[7]),
   .frf_w2_valid        (`SPC2.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC2.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC2.fgu.frf.w2_addr),

   .asi_valid           (`PROBES2.asi_valid_fx5[7]),
   .asi_in_progress     (`PROBES2.asi_in_progress_fx4[7]),

   .tlu_valid           (`PROBES2.tlu_valid[7])
`endif
  );
				      
//----------------------------------------------------------


//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_3

module nas_core3 (

  cid
);

input [2:0] cid;

integer i;

//----------------------------------------------------------

//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//
   
  nas_pipe3 t0 (
   .mycid               (cid),
   .mytid               (3'h0),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES3.op_0_w}),
   .PC_reg              ({`PROBES3.pc_0_w}),
   .Y_reg               (`SPC3.exu0.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC3.exu0.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC3.fgu.fac.fprs_tid0),
   .FSR_reg             (`SPC3.fgu.fad.fsr0_fx1[27:0]),
   .ASI_reg             (`SPC3.lsu.dcs.asi_state0),
   .GSR_reg             ({`SPC3.fgu.fgd.gsr0_mask_fx4[31:0], `SPC3.fgu.fpc.gsr0_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES3.tick_cmpr_0),
   .STICK_CMPR_reg      (`PROBES3.stick_cmpr_0),
   .HSTICK_CMPR_reg     (`PROBES3.hstick_cmpr_0),
   .PSTATE_reg          (`SPC3.tlu.tsd0.arch_pstate0),
   .TL_reg              (`SPC3.tlu.trl0.tl0),
   .PIL_reg             (`SPC3.tlu.trl0.pil0),
   .TBA_reg             (`SPC3.tlu.tsd0.tba0[47:15]),
   .VER_reg             (`SPC3.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC3.exu0.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC3.exu0.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC3.exu0.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC3.exu0.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC3.exu0.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC3.exu0.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC3.tlu.trl0.rd_softint0),
   .SOFTINT_reg         (`SPC3.tlu.trl0.softint0),
   .INTR_RECEIVE_reg    (`SPC3.tlu.cth.int_rec0),
   .GL_reg              (`SPC3.tlu.tlu_gl0),
   .HPSTATE_reg         (`SPC3.tlu.tsd0.arch_hpstate0),
   .HTBA_reg            (`SPC3.tlu.tsd0.htba0[47:14]),
   .HINTP_reg           (`SPC3.tlu.trl0.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC3.lsu.dcs.p0ctxt_0[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC3.lsu.dcs.s0ctxt_0[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC3.lsu.dcs.p1ctxt_0[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC3.lsu.dcs.s1ctxt_0[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC3.lsu.dcs.wpt_mode_0[1:0],
                                   `SPC3.lsu.dcs.wpt_mask_0[7:0],
                                   `SPC3.lsu.dcs.wpt_enable_0[1:0],
                                   18'd0,
                                   `SPC3.lsu.dcs.spec_enable[0],
                                   `SPC3.lsu.dcs.dmmu_enable[0],
                                   `SPC3.lsu.dcs.immu_enable[0],
                                   `SPC3.lsu.dcs.dc_enable[0],
                                   `SPC3.lsu.dcs.ic_enable[0]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd0.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd0.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC3.lsu.dcs.watchpoint0[47:3],3'b00}),
   .DSFAR_reg                     (`SPC3.tlu.dfd.dsfar_0[47:0]),

   .Trap_Entry_1        (`PROBES3.trap_entry_1_t0),
   .Trap_Entry_2        (`PROBES3.trap_entry_2_t0),
   .Trap_Entry_3        (`PROBES3.trap_entry_3_t0),
   .Trap_Entry_4        (`PROBES3.trap_entry_4_t0),
   .Trap_Entry_5        (`PROBES3.trap_entry_5_t0),
   .Trap_Entry_6        (`PROBES3.trap_entry_6_t0),

   .exu_valid           (`PROBES3.ex_valid[0]),

   .imul_valid          (`PROBES3.imul_valid[0]),

   .fp_valid            (`PROBES3.fg_valid[0]),
   .frf_w1_valid        (`SPC3.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC3.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC3.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES3.fgu_idiv_valid[0]),

   .fdiv_valid          (`PROBES3.fgu_fdiv_valid[0]),

   .lsu_valid           (`PROBES3.lsu_valid[0]),
   .frf_w2_valid        (`SPC3.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC3.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC3.fgu.frf.w2_addr),

   .asi_valid           (`PROBES3.asi_valid_fx5[0]),
   .asi_in_progress     (`PROBES3.asi_in_progress_fx4[0]),

   .tlu_valid           (`PROBES3.tlu_valid[0])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 1
//
   
  nas_pipe3 t1 (
   .mycid               (cid),
   .mytid               (3'h1),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES3.op_1_w}),
   .PC_reg              ({`PROBES3.pc_1_w}),
   .Y_reg               (`SPC3.exu0.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC3.exu0.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC3.fgu.fac.fprs_tid1),
   .FSR_reg             (`SPC3.fgu.fad.fsr1_fx1[27:0]),
   .ASI_reg             (`SPC3.lsu.dcs.asi_state1),
   .GSR_reg             ({`SPC3.fgu.fgd.gsr1_mask_fx4[31:0], `SPC3.fgu.fpc.gsr1_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES3.tick_cmpr_1),
   .STICK_CMPR_reg      (`PROBES3.stick_cmpr_1),
   .HSTICK_CMPR_reg     (`PROBES3.hstick_cmpr_1),
   .PSTATE_reg          (`SPC3.tlu.tsd0.arch_pstate1),
   .TL_reg              (`SPC3.tlu.trl0.tl1),
   .PIL_reg             (`SPC3.tlu.trl0.pil1),
   .TBA_reg             (`SPC3.tlu.tsd0.tba1[47:15]),
   .VER_reg             (`SPC3.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC3.exu0.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC3.exu0.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC3.exu0.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC3.exu0.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC3.exu0.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC3.exu0.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC3.tlu.trl0.rd_softint1),
   .SOFTINT_reg         (`SPC3.tlu.trl0.softint1),
   .INTR_RECEIVE_reg    (`SPC3.tlu.cth.int_rec1),
   .GL_reg              (`SPC3.tlu.tlu_gl1),
   .HPSTATE_reg         (`SPC3.tlu.tsd0.arch_hpstate1),
   .HTBA_reg            (`SPC3.tlu.tsd0.htba1[47:14]),
   .HINTP_reg           (`SPC3.tlu.trl0.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC3.lsu.dcs.p0ctxt_1[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC3.lsu.dcs.s0ctxt_1[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC3.lsu.dcs.p1ctxt_1[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC3.lsu.dcs.s1ctxt_1[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC3.lsu.dcs.wpt_mode_1[1:0],
                                   `SPC3.lsu.dcs.wpt_mask_1[7:0],
                                   `SPC3.lsu.dcs.wpt_enable_1[1:0],
                                   18'd0,
                                   `SPC3.lsu.dcs.spec_enable[1],
                                   `SPC3.lsu.dcs.dmmu_enable[1],
                                   `SPC3.lsu.dcs.immu_enable[1],
                                   `SPC3.lsu.dcs.dc_enable[1],
                                   `SPC3.lsu.dcs.ic_enable[1]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd0.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd0.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC3.lsu.dcs.watchpoint1[47:3],3'b00}),
   .DSFAR_reg                     (`SPC3.tlu.dfd.dsfar_1[47:0]),

   .Trap_Entry_1        (`PROBES3.trap_entry_1_t1),
   .Trap_Entry_2        (`PROBES3.trap_entry_2_t1),
   .Trap_Entry_3        (`PROBES3.trap_entry_3_t1),
   .Trap_Entry_4        (`PROBES3.trap_entry_4_t1),
   .Trap_Entry_5        (`PROBES3.trap_entry_5_t1),
   .Trap_Entry_6        (`PROBES3.trap_entry_6_t1),

   .exu_valid           (`PROBES3.ex_valid[1]),

   .imul_valid          (`PROBES3.imul_valid[1]),

   .fp_valid            (`PROBES3.fg_valid[1]),
   .frf_w1_valid        (`SPC3.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC3.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC3.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES3.fgu_idiv_valid[1]),

   .fdiv_valid          (`PROBES3.fgu_fdiv_valid[1]),

   .lsu_valid           (`PROBES3.lsu_valid[1]),
   .frf_w2_valid        (`SPC3.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC3.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC3.fgu.frf.w2_addr),

   .asi_valid           (`PROBES3.asi_valid_fx5[1]),
   .asi_in_progress     (`PROBES3.asi_in_progress_fx4[1]),

   .tlu_valid           (`PROBES3.tlu_valid[1])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 2
//
   
  nas_pipe3 t2 (
   .mycid               (cid),
   .mytid               (3'h2),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES3.op_2_w}),
   .PC_reg              ({`PROBES3.pc_2_w}),
   .Y_reg               (`SPC3.exu0.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC3.exu0.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC3.fgu.fac.fprs_tid2),
   .FSR_reg             (`SPC3.fgu.fad.fsr2_fx1[27:0]),
   .ASI_reg             (`SPC3.lsu.dcs.asi_state2),
   .GSR_reg             ({`SPC3.fgu.fgd.gsr2_mask_fx4[31:0], `SPC3.fgu.fpc.gsr2_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES3.tick_cmpr_2),
   .STICK_CMPR_reg      (`PROBES3.stick_cmpr_2),
   .HSTICK_CMPR_reg     (`PROBES3.hstick_cmpr_2),
   .PSTATE_reg          (`SPC3.tlu.tsd0.arch_pstate2),
   .TL_reg              (`SPC3.tlu.trl0.tl2),
   .PIL_reg             (`SPC3.tlu.trl0.pil2),
   .TBA_reg             (`SPC3.tlu.tsd0.tba2[47:15]),
   .VER_reg             (`SPC3.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC3.exu0.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC3.exu0.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC3.exu0.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC3.exu0.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC3.exu0.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC3.exu0.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC3.tlu.trl0.rd_softint2),
   .SOFTINT_reg         (`SPC3.tlu.trl0.softint2),
   .INTR_RECEIVE_reg    (`SPC3.tlu.cth.int_rec2),
   .GL_reg              (`SPC3.tlu.tlu_gl2),
   .HPSTATE_reg         (`SPC3.tlu.tsd0.arch_hpstate2),
   .HTBA_reg            (`SPC3.tlu.tsd0.htba2[47:14]),
   .HINTP_reg           (`SPC3.tlu.trl0.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC3.lsu.dcs.p0ctxt_2[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC3.lsu.dcs.s0ctxt_2[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC3.lsu.dcs.p1ctxt_2[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC3.lsu.dcs.s1ctxt_2[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC3.lsu.dcs.wpt_mode_2[1:0],
                                   `SPC3.lsu.dcs.wpt_mask_2[7:0],
                                   `SPC3.lsu.dcs.wpt_enable_2[1:0],
                                   18'd0,
                                   `SPC3.lsu.dcs.spec_enable[2],
                                   `SPC3.lsu.dcs.dmmu_enable[2],
                                   `SPC3.lsu.dcs.immu_enable[2],
                                   `SPC3.lsu.dcs.dc_enable[2],
                                   `SPC3.lsu.dcs.ic_enable[2]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd0.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd0.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC3.lsu.dcs.watchpoint2[47:3],3'b00}),
   .DSFAR_reg                     (`SPC3.tlu.dfd.dsfar_2[47:0]),

   .Trap_Entry_1        (`PROBES3.trap_entry_1_t2),
   .Trap_Entry_2        (`PROBES3.trap_entry_2_t2),
   .Trap_Entry_3        (`PROBES3.trap_entry_3_t2),
   .Trap_Entry_4        (`PROBES3.trap_entry_4_t2),
   .Trap_Entry_5        (`PROBES3.trap_entry_5_t2),
   .Trap_Entry_6        (`PROBES3.trap_entry_6_t2),

   .exu_valid           (`PROBES3.ex_valid[2]),

   .imul_valid          (`PROBES3.imul_valid[2]),

   .fp_valid            (`PROBES3.fg_valid[2]),
   .frf_w1_valid        (`SPC3.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC3.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC3.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES3.fgu_idiv_valid[2]),

   .fdiv_valid          (`PROBES3.fgu_fdiv_valid[2]),

   .lsu_valid           (`PROBES3.lsu_valid[2]),
   .frf_w2_valid        (`SPC3.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC3.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC3.fgu.frf.w2_addr),

   .asi_valid           (`PROBES3.asi_valid_fx5[2]),
   .asi_in_progress     (`PROBES3.asi_in_progress_fx4[2]),

   .tlu_valid           (`PROBES3.tlu_valid[2])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 3
//
   
  nas_pipe3 t3 (
   .mycid               (cid),
   .mytid               (3'h3),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES3.op_3_w}),
   .PC_reg              ({`PROBES3.pc_3_w}),
   .Y_reg               (`SPC3.exu0.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC3.exu0.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC3.fgu.fac.fprs_tid3),
   .FSR_reg             (`SPC3.fgu.fad.fsr3_fx1[27:0]),
   .ASI_reg             (`SPC3.lsu.dcs.asi_state3),
   .GSR_reg             ({`SPC3.fgu.fgd.gsr3_mask_fx4[31:0], `SPC3.fgu.fpc.gsr3_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES3.tick_cmpr_3),
   .STICK_CMPR_reg      (`PROBES3.stick_cmpr_3),
   .HSTICK_CMPR_reg     (`PROBES3.hstick_cmpr_3),
   .PSTATE_reg          (`SPC3.tlu.tsd0.arch_pstate3),
   .TL_reg              (`SPC3.tlu.trl0.tl3),
   .PIL_reg             (`SPC3.tlu.trl0.pil3),
   .TBA_reg             (`SPC3.tlu.tsd0.tba3[47:15]),
   .VER_reg             (`SPC3.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC3.exu0.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC3.exu0.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC3.exu0.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC3.exu0.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC3.exu0.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC3.exu0.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC3.tlu.trl0.rd_softint3),
   .SOFTINT_reg         (`SPC3.tlu.trl0.softint3),
   .INTR_RECEIVE_reg    (`SPC3.tlu.cth.int_rec3),
   .GL_reg              (`SPC3.tlu.tlu_gl3),
   .HPSTATE_reg         (`SPC3.tlu.tsd0.arch_hpstate3),
   .HTBA_reg            (`SPC3.tlu.tsd0.htba3[47:14]),
   .HINTP_reg           (`SPC3.tlu.trl0.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC3.lsu.dcs.p0ctxt_3[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC3.lsu.dcs.s0ctxt_3[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC3.lsu.dcs.p1ctxt_3[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC3.lsu.dcs.s1ctxt_3[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC3.lsu.dcs.wpt_mode_3[1:0],
                                   `SPC3.lsu.dcs.wpt_mask_3[7:0],
                                   `SPC3.lsu.dcs.wpt_enable_3[1:0],
                                   18'd0,
                                   `SPC3.lsu.dcs.spec_enable[3],
                                   `SPC3.lsu.dcs.dmmu_enable[3],
                                   `SPC3.lsu.dcs.immu_enable[3],
                                   `SPC3.lsu.dcs.dc_enable[3],
                                   `SPC3.lsu.dcs.ic_enable[3]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd0.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd0.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC3.lsu.dcs.watchpoint3[47:3],3'b00}),
   .DSFAR_reg                     (`SPC3.tlu.dfd.dsfar_3[47:0]),

   .Trap_Entry_1        (`PROBES3.trap_entry_1_t3),
   .Trap_Entry_2        (`PROBES3.trap_entry_2_t3),
   .Trap_Entry_3        (`PROBES3.trap_entry_3_t3),
   .Trap_Entry_4        (`PROBES3.trap_entry_4_t3),
   .Trap_Entry_5        (`PROBES3.trap_entry_5_t3),
   .Trap_Entry_6        (`PROBES3.trap_entry_6_t3),

   .exu_valid           (`PROBES3.ex_valid[3]),

   .imul_valid          (`PROBES3.imul_valid[3]),

   .fp_valid            (`PROBES3.fg_valid[3]),
   .frf_w1_valid        (`SPC3.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC3.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC3.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES3.fgu_idiv_valid[3]),

   .fdiv_valid          (`PROBES3.fgu_fdiv_valid[3]),

   .lsu_valid           (`PROBES3.lsu_valid[3]),
   .frf_w2_valid        (`SPC3.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC3.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC3.fgu.frf.w2_addr),

   .asi_valid           (`PROBES3.asi_valid_fx5[3]),
   .asi_in_progress     (`PROBES3.asi_in_progress_fx4[3]),

   .tlu_valid           (`PROBES3.tlu_valid[3])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 4
//
   
  nas_pipe3 t4 (
   .mycid               (cid),
   .mytid               (3'h4),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES3.op_4_w}),
   .PC_reg              ({`PROBES3.pc_4_w}),
   .Y_reg               (`SPC3.exu1.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC3.exu1.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC3.fgu.fac.fprs_tid4),
   .FSR_reg             (`SPC3.fgu.fad.fsr4_fx1[27:0]),
   .ASI_reg             (`SPC3.lsu.dcs.asi_state4),
   .GSR_reg             ({`SPC3.fgu.fgd.gsr4_mask_fx4[31:0], `SPC3.fgu.fpc.gsr4_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES3.tick_cmpr_4),
   .STICK_CMPR_reg      (`PROBES3.stick_cmpr_4),
   .HSTICK_CMPR_reg     (`PROBES3.hstick_cmpr_4),
   .PSTATE_reg          (`SPC3.tlu.tsd1.arch_pstate0),
   .TL_reg              (`SPC3.tlu.trl1.tl0),
   .PIL_reg             (`SPC3.tlu.trl1.pil0),
   .TBA_reg             (`SPC3.tlu.tsd1.tba0[47:15]),
   .VER_reg             (`SPC3.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC3.exu1.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC3.exu1.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC3.exu1.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC3.exu1.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC3.exu1.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC3.exu1.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC3.tlu.trl1.rd_softint0),
   .SOFTINT_reg         (`SPC3.tlu.trl1.softint0),
   .INTR_RECEIVE_reg    (`SPC3.tlu.cth.int_rec4),
   .GL_reg              (`SPC3.tlu.tlu_gl4),
   .HPSTATE_reg         (`SPC3.tlu.tsd1.arch_hpstate0),
   .HTBA_reg            (`SPC3.tlu.tsd1.htba0[47:14]),
   .HINTP_reg           (`SPC3.tlu.trl1.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC3.lsu.dcs.p0ctxt_4[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC3.lsu.dcs.s0ctxt_4[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC3.lsu.dcs.p1ctxt_4[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC3.lsu.dcs.s1ctxt_4[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC3.lsu.dcs.wpt_mode_4[1:0],
                                   `SPC3.lsu.dcs.wpt_mask_4[7:0],
                                   `SPC3.lsu.dcs.wpt_enable_4[1:0],
                                   18'd0,
                                   `SPC3.lsu.dcs.spec_enable[4],
                                   `SPC3.lsu.dcs.dmmu_enable[4],
                                   `SPC3.lsu.dcs.immu_enable[4],
                                   `SPC3.lsu.dcs.dc_enable[4],
                                   `SPC3.lsu.dcs.ic_enable[4]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd1.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd1.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC3.lsu.dcs.watchpoint4[47:3],3'b00}),
   .DSFAR_reg                     (`SPC3.tlu.dfd.dsfar_4[47:0]),

   .Trap_Entry_1        (`PROBES3.trap_entry_1_t4),
   .Trap_Entry_2        (`PROBES3.trap_entry_2_t4),
   .Trap_Entry_3        (`PROBES3.trap_entry_3_t4),
   .Trap_Entry_4        (`PROBES3.trap_entry_4_t4),
   .Trap_Entry_5        (`PROBES3.trap_entry_5_t4),
   .Trap_Entry_6        (`PROBES3.trap_entry_6_t4),

   .exu_valid           (`PROBES3.ex_valid[4]),

   .imul_valid          (`PROBES3.imul_valid[4]),

   .fp_valid            (`PROBES3.fg_valid[4]),
   .frf_w1_valid        (`SPC3.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC3.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC3.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES3.fgu_idiv_valid[4]),

   .fdiv_valid          (`PROBES3.fgu_fdiv_valid[4]),

   .lsu_valid           (`PROBES3.lsu_valid[4]),
   .frf_w2_valid        (`SPC3.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC3.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC3.fgu.frf.w2_addr),

   .asi_valid           (`PROBES3.asi_valid_fx5[4]),
   .asi_in_progress     (`PROBES3.asi_in_progress_fx4[4]),

   .tlu_valid           (`PROBES3.tlu_valid[4])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 5
//
   
  nas_pipe3 t5 (
   .mycid               (cid),
   .mytid               (3'h5),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES3.op_5_w}),
   .PC_reg              ({`PROBES3.pc_5_w}),
   .Y_reg               (`SPC3.exu1.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC3.exu1.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC3.fgu.fac.fprs_tid5),
   .FSR_reg             (`SPC3.fgu.fad.fsr5_fx1[27:0]),
   .ASI_reg             (`SPC3.lsu.dcs.asi_state5),
   .GSR_reg             ({`SPC3.fgu.fgd.gsr5_mask_fx4[31:0], `SPC3.fgu.fpc.gsr5_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES3.tick_cmpr_5),
   .STICK_CMPR_reg      (`PROBES3.stick_cmpr_5),
   .HSTICK_CMPR_reg     (`PROBES3.hstick_cmpr_5),
   .PSTATE_reg          (`SPC3.tlu.tsd1.arch_pstate1),
   .TL_reg              (`SPC3.tlu.trl1.tl1),
   .PIL_reg             (`SPC3.tlu.trl1.pil1),
   .TBA_reg             (`SPC3.tlu.tsd1.tba1[47:15]),
   .VER_reg             (`SPC3.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC3.exu1.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC3.exu1.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC3.exu1.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC3.exu1.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC3.exu1.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC3.exu1.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC3.tlu.trl1.rd_softint1),
   .SOFTINT_reg         (`SPC3.tlu.trl1.softint1),
   .INTR_RECEIVE_reg    (`SPC3.tlu.cth.int_rec5),
   .GL_reg              (`SPC3.tlu.tlu_gl5),
   .HPSTATE_reg         (`SPC3.tlu.tsd1.arch_hpstate1),
   .HTBA_reg            (`SPC3.tlu.tsd1.htba1[47:14]),
   .HINTP_reg           (`SPC3.tlu.trl1.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC3.lsu.dcs.p0ctxt_5[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC3.lsu.dcs.s0ctxt_5[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC3.lsu.dcs.p1ctxt_5[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC3.lsu.dcs.s1ctxt_5[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC3.lsu.dcs.wpt_mode_5[1:0],
                                   `SPC3.lsu.dcs.wpt_mask_5[7:0],
                                   `SPC3.lsu.dcs.wpt_enable_5[1:0],
                                   18'd0,
                                   `SPC3.lsu.dcs.spec_enable[5],
                                   `SPC3.lsu.dcs.dmmu_enable[5],
                                   `SPC3.lsu.dcs.immu_enable[5],
                                   `SPC3.lsu.dcs.dc_enable[5],
                                   `SPC3.lsu.dcs.ic_enable[5]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd1.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd1.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC3.lsu.dcs.watchpoint5[47:3],3'b00}),
   .DSFAR_reg                     (`SPC3.tlu.dfd.dsfar_5[47:0]),

   .Trap_Entry_1        (`PROBES3.trap_entry_1_t5),
   .Trap_Entry_2        (`PROBES3.trap_entry_2_t5),
   .Trap_Entry_3        (`PROBES3.trap_entry_3_t5),
   .Trap_Entry_4        (`PROBES3.trap_entry_4_t5),
   .Trap_Entry_5        (`PROBES3.trap_entry_5_t5),
   .Trap_Entry_6        (`PROBES3.trap_entry_6_t5),

   .exu_valid           (`PROBES3.ex_valid[5]),

   .imul_valid          (`PROBES3.imul_valid[5]),

   .fp_valid            (`PROBES3.fg_valid[5]),
   .frf_w1_valid        (`SPC3.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC3.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC3.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES3.fgu_idiv_valid[5]),

   .fdiv_valid          (`PROBES3.fgu_fdiv_valid[5]),

   .lsu_valid           (`PROBES3.lsu_valid[5]),
   .frf_w2_valid        (`SPC3.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC3.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC3.fgu.frf.w2_addr),

   .asi_valid           (`PROBES3.asi_valid_fx5[5]),
   .asi_in_progress     (`PROBES3.asi_in_progress_fx4[5]),

   .tlu_valid           (`PROBES3.tlu_valid[5])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 6
//
   
  nas_pipe3 t6 (
   .mycid               (cid),
   .mytid               (3'h6),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES3.op_6_w}),
   .PC_reg              ({`PROBES3.pc_6_w}),
   .Y_reg               (`SPC3.exu1.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC3.exu1.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC3.fgu.fac.fprs_tid6),
   .FSR_reg             (`SPC3.fgu.fad.fsr6_fx1[27:0]),
   .ASI_reg             (`SPC3.lsu.dcs.asi_state6),
   .GSR_reg             ({`SPC3.fgu.fgd.gsr6_mask_fx4[31:0], `SPC3.fgu.fpc.gsr6_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES3.tick_cmpr_6),
   .STICK_CMPR_reg      (`PROBES3.stick_cmpr_6),
   .HSTICK_CMPR_reg     (`PROBES3.hstick_cmpr_6),
   .PSTATE_reg          (`SPC3.tlu.tsd1.arch_pstate2),
   .TL_reg              (`SPC3.tlu.trl1.tl2),
   .PIL_reg             (`SPC3.tlu.trl1.pil2),
   .TBA_reg             (`SPC3.tlu.tsd1.tba2[47:15]),
   .VER_reg             (`SPC3.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC3.exu1.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC3.exu1.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC3.exu1.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC3.exu1.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC3.exu1.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC3.exu1.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC3.tlu.trl1.rd_softint2),
   .SOFTINT_reg         (`SPC3.tlu.trl1.softint2),
   .INTR_RECEIVE_reg    (`SPC3.tlu.cth.int_rec6),
   .GL_reg              (`SPC3.tlu.tlu_gl6),
   .HPSTATE_reg         (`SPC3.tlu.tsd1.arch_hpstate2),
   .HTBA_reg            (`SPC3.tlu.tsd1.htba2[47:14]),
   .HINTP_reg           (`SPC3.tlu.trl1.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC3.lsu.dcs.p0ctxt_6[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC3.lsu.dcs.s0ctxt_6[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC3.lsu.dcs.p1ctxt_6[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC3.lsu.dcs.s1ctxt_6[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC3.lsu.dcs.wpt_mode_6[1:0],
                                   `SPC3.lsu.dcs.wpt_mask_6[7:0],
                                   `SPC3.lsu.dcs.wpt_enable_6[1:0],
                                   18'd0,
                                   `SPC3.lsu.dcs.spec_enable[6],
                                   `SPC3.lsu.dcs.dmmu_enable[6],
                                   `SPC3.lsu.dcs.immu_enable[6],
                                   `SPC3.lsu.dcs.dc_enable[6],
                                   `SPC3.lsu.dcs.ic_enable[6]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd1.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd1.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC3.lsu.dcs.watchpoint6[47:3],3'b00}),
   .DSFAR_reg                     (`SPC3.tlu.dfd.dsfar_6[47:0]),

   .Trap_Entry_1        (`PROBES3.trap_entry_1_t6),
   .Trap_Entry_2        (`PROBES3.trap_entry_2_t6),
   .Trap_Entry_3        (`PROBES3.trap_entry_3_t6),
   .Trap_Entry_4        (`PROBES3.trap_entry_4_t6),
   .Trap_Entry_5        (`PROBES3.trap_entry_5_t6),
   .Trap_Entry_6        (`PROBES3.trap_entry_6_t6),

   .exu_valid           (`PROBES3.ex_valid[6]),

   .imul_valid          (`PROBES3.imul_valid[6]),

   .fp_valid            (`PROBES3.fg_valid[6]),
   .frf_w1_valid        (`SPC3.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC3.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC3.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES3.fgu_idiv_valid[6]),

   .fdiv_valid          (`PROBES3.fgu_fdiv_valid[6]),

   .lsu_valid           (`PROBES3.lsu_valid[6]),
   .frf_w2_valid        (`SPC3.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC3.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC3.fgu.frf.w2_addr),

   .asi_valid           (`PROBES3.asi_valid_fx5[6]),
   .asi_in_progress     (`PROBES3.asi_in_progress_fx4[6]),

   .tlu_valid           (`PROBES3.tlu_valid[6])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 7
//
   
  nas_pipe3 t7 (
   .mycid               (cid),
   .mytid               (3'h7),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES3.op_7_w}),
   .PC_reg              ({`PROBES3.pc_7_w}),
   .Y_reg               (`SPC3.exu1.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC3.exu1.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC3.fgu.fac.fprs_tid7),
   .FSR_reg             (`SPC3.fgu.fad.fsr7_fx1[27:0]),
   .ASI_reg             (`SPC3.lsu.dcs.asi_state7),
   .GSR_reg             ({`SPC3.fgu.fgd.gsr7_mask_fx4[31:0], `SPC3.fgu.fpc.gsr7_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES3.tick_cmpr_7),
   .STICK_CMPR_reg      (`PROBES3.stick_cmpr_7),
   .HSTICK_CMPR_reg     (`PROBES3.hstick_cmpr_7),
   .PSTATE_reg          (`SPC3.tlu.tsd1.arch_pstate3),
   .TL_reg              (`SPC3.tlu.trl1.tl3),
   .PIL_reg             (`SPC3.tlu.trl1.pil3),
   .TBA_reg             (`SPC3.tlu.tsd1.tba3[47:15]),
   .VER_reg             (`SPC3.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC3.exu1.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC3.exu1.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC3.exu1.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC3.exu1.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC3.exu1.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC3.exu1.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC3.tlu.trl1.rd_softint3),
   .SOFTINT_reg         (`SPC3.tlu.trl1.softint3),
   .INTR_RECEIVE_reg    (`SPC3.tlu.cth.int_rec7),
   .GL_reg              (`SPC3.tlu.tlu_gl7),
   .HPSTATE_reg         (`SPC3.tlu.tsd1.arch_hpstate3),
   .HTBA_reg            (`SPC3.tlu.tsd1.htba3[47:14]),
   .HINTP_reg           (`SPC3.tlu.trl1.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC3.lsu.dcs.p0ctxt_7[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC3.lsu.dcs.s0ctxt_7[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC3.lsu.dcs.p1ctxt_7[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC3.lsu.dcs.s1ctxt_7[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC3.lsu.dcs.wpt_mode_7[1:0],
                                   `SPC3.lsu.dcs.wpt_mask_7[7:0],
                                   `SPC3.lsu.dcs.wpt_enable_7[1:0],
                                   18'd0,
                                   `SPC3.lsu.dcs.spec_enable[7],
                                   `SPC3.lsu.dcs.dmmu_enable[7],
                                   `SPC3.lsu.dcs.immu_enable[7],
                                   `SPC3.lsu.dcs.dc_enable[7],
                                   `SPC3.lsu.dcs.ic_enable[7]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd1.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC3.mmu.asd1.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC3.lsu.dcs.watchpoint7[47:3],3'b00}),
   .DSFAR_reg                     (`SPC3.tlu.dfd.dsfar_7[47:0]),

   .Trap_Entry_1        (`PROBES3.trap_entry_1_t7),
   .Trap_Entry_2        (`PROBES3.trap_entry_2_t7),
   .Trap_Entry_3        (`PROBES3.trap_entry_3_t7),
   .Trap_Entry_4        (`PROBES3.trap_entry_4_t7),
   .Trap_Entry_5        (`PROBES3.trap_entry_5_t7),
   .Trap_Entry_6        (`PROBES3.trap_entry_6_t7),

   .exu_valid           (`PROBES3.ex_valid[7]),

   .imul_valid          (`PROBES3.imul_valid[7]),

   .fp_valid            (`PROBES3.fg_valid[7]),
   .frf_w1_valid        (`SPC3.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC3.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC3.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES3.fgu_idiv_valid[7]),

   .fdiv_valid          (`PROBES3.fgu_fdiv_valid[7]),

   .lsu_valid           (`PROBES3.lsu_valid[7]),
   .frf_w2_valid        (`SPC3.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC3.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC3.fgu.frf.w2_addr),

   .asi_valid           (`PROBES3.asi_valid_fx5[7]),
   .asi_in_progress     (`PROBES3.asi_in_progress_fx4[7]),

   .tlu_valid           (`PROBES3.tlu_valid[7])
`endif
  );
				      
//----------------------------------------------------------


//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_4

module nas_core4 (

  cid
);

input [2:0] cid;

integer i;

//----------------------------------------------------------

//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//
   
  nas_pipe4 t0 (
   .mycid               (cid),
   .mytid               (3'h0),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES4.op_0_w}),
   .PC_reg              ({`PROBES4.pc_0_w}),
   .Y_reg               (`SPC4.exu0.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC4.exu0.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC4.fgu.fac.fprs_tid0),
   .FSR_reg             (`SPC4.fgu.fad.fsr0_fx1[27:0]),
   .ASI_reg             (`SPC4.lsu.dcs.asi_state0),
   .GSR_reg             ({`SPC4.fgu.fgd.gsr0_mask_fx4[31:0], `SPC4.fgu.fpc.gsr0_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES4.tick_cmpr_0),
   .STICK_CMPR_reg      (`PROBES4.stick_cmpr_0),
   .HSTICK_CMPR_reg     (`PROBES4.hstick_cmpr_0),
   .PSTATE_reg          (`SPC4.tlu.tsd0.arch_pstate0),
   .TL_reg              (`SPC4.tlu.trl0.tl0),
   .PIL_reg             (`SPC4.tlu.trl0.pil0),
   .TBA_reg             (`SPC4.tlu.tsd0.tba0[47:15]),
   .VER_reg             (`SPC4.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC4.exu0.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC4.exu0.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC4.exu0.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC4.exu0.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC4.exu0.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC4.exu0.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC4.tlu.trl0.rd_softint0),
   .SOFTINT_reg         (`SPC4.tlu.trl0.softint0),
   .INTR_RECEIVE_reg    (`SPC4.tlu.cth.int_rec0),
   .GL_reg              (`SPC4.tlu.tlu_gl0),
   .HPSTATE_reg         (`SPC4.tlu.tsd0.arch_hpstate0),
   .HTBA_reg            (`SPC4.tlu.tsd0.htba0[47:14]),
   .HINTP_reg           (`SPC4.tlu.trl0.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC4.lsu.dcs.p0ctxt_0[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC4.lsu.dcs.s0ctxt_0[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC4.lsu.dcs.p1ctxt_0[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC4.lsu.dcs.s1ctxt_0[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC4.lsu.dcs.wpt_mode_0[1:0],
                                   `SPC4.lsu.dcs.wpt_mask_0[7:0],
                                   `SPC4.lsu.dcs.wpt_enable_0[1:0],
                                   18'd0,
                                   `SPC4.lsu.dcs.spec_enable[0],
                                   `SPC4.lsu.dcs.dmmu_enable[0],
                                   `SPC4.lsu.dcs.immu_enable[0],
                                   `SPC4.lsu.dcs.dc_enable[0],
                                   `SPC4.lsu.dcs.ic_enable[0]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd0.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd0.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC4.lsu.dcs.watchpoint0[47:3],3'b00}),
   .DSFAR_reg                     (`SPC4.tlu.dfd.dsfar_0[47:0]),

   .Trap_Entry_1        (`PROBES4.trap_entry_1_t0),
   .Trap_Entry_2        (`PROBES4.trap_entry_2_t0),
   .Trap_Entry_3        (`PROBES4.trap_entry_3_t0),
   .Trap_Entry_4        (`PROBES4.trap_entry_4_t0),
   .Trap_Entry_5        (`PROBES4.trap_entry_5_t0),
   .Trap_Entry_6        (`PROBES4.trap_entry_6_t0),

   .exu_valid           (`PROBES4.ex_valid[0]),

   .imul_valid          (`PROBES4.imul_valid[0]),

   .fp_valid            (`PROBES4.fg_valid[0]),
   .frf_w1_valid        (`SPC4.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC4.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC4.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES4.fgu_idiv_valid[0]),

   .fdiv_valid          (`PROBES4.fgu_fdiv_valid[0]),

   .lsu_valid           (`PROBES4.lsu_valid[0]),
   .frf_w2_valid        (`SPC4.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC4.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC4.fgu.frf.w2_addr),

   .asi_valid           (`PROBES4.asi_valid_fx5[0]),
   .asi_in_progress     (`PROBES4.asi_in_progress_fx4[0]),

   .tlu_valid           (`PROBES4.tlu_valid[0])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 1
//
   
  nas_pipe4 t1 (
   .mycid               (cid),
   .mytid               (3'h1),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES4.op_1_w}),
   .PC_reg              ({`PROBES4.pc_1_w}),
   .Y_reg               (`SPC4.exu0.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC4.exu0.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC4.fgu.fac.fprs_tid1),
   .FSR_reg             (`SPC4.fgu.fad.fsr1_fx1[27:0]),
   .ASI_reg             (`SPC4.lsu.dcs.asi_state1),
   .GSR_reg             ({`SPC4.fgu.fgd.gsr1_mask_fx4[31:0], `SPC4.fgu.fpc.gsr1_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES4.tick_cmpr_1),
   .STICK_CMPR_reg      (`PROBES4.stick_cmpr_1),
   .HSTICK_CMPR_reg     (`PROBES4.hstick_cmpr_1),
   .PSTATE_reg          (`SPC4.tlu.tsd0.arch_pstate1),
   .TL_reg              (`SPC4.tlu.trl0.tl1),
   .PIL_reg             (`SPC4.tlu.trl0.pil1),
   .TBA_reg             (`SPC4.tlu.tsd0.tba1[47:15]),
   .VER_reg             (`SPC4.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC4.exu0.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC4.exu0.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC4.exu0.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC4.exu0.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC4.exu0.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC4.exu0.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC4.tlu.trl0.rd_softint1),
   .SOFTINT_reg         (`SPC4.tlu.trl0.softint1),
   .INTR_RECEIVE_reg    (`SPC4.tlu.cth.int_rec1),
   .GL_reg              (`SPC4.tlu.tlu_gl1),
   .HPSTATE_reg         (`SPC4.tlu.tsd0.arch_hpstate1),
   .HTBA_reg            (`SPC4.tlu.tsd0.htba1[47:14]),
   .HINTP_reg           (`SPC4.tlu.trl0.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC4.lsu.dcs.p0ctxt_1[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC4.lsu.dcs.s0ctxt_1[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC4.lsu.dcs.p1ctxt_1[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC4.lsu.dcs.s1ctxt_1[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC4.lsu.dcs.wpt_mode_1[1:0],
                                   `SPC4.lsu.dcs.wpt_mask_1[7:0],
                                   `SPC4.lsu.dcs.wpt_enable_1[1:0],
                                   18'd0,
                                   `SPC4.lsu.dcs.spec_enable[1],
                                   `SPC4.lsu.dcs.dmmu_enable[1],
                                   `SPC4.lsu.dcs.immu_enable[1],
                                   `SPC4.lsu.dcs.dc_enable[1],
                                   `SPC4.lsu.dcs.ic_enable[1]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd0.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd0.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC4.lsu.dcs.watchpoint1[47:3],3'b00}),
   .DSFAR_reg                     (`SPC4.tlu.dfd.dsfar_1[47:0]),

   .Trap_Entry_1        (`PROBES4.trap_entry_1_t1),
   .Trap_Entry_2        (`PROBES4.trap_entry_2_t1),
   .Trap_Entry_3        (`PROBES4.trap_entry_3_t1),
   .Trap_Entry_4        (`PROBES4.trap_entry_4_t1),
   .Trap_Entry_5        (`PROBES4.trap_entry_5_t1),
   .Trap_Entry_6        (`PROBES4.trap_entry_6_t1),

   .exu_valid           (`PROBES4.ex_valid[1]),

   .imul_valid          (`PROBES4.imul_valid[1]),

   .fp_valid            (`PROBES4.fg_valid[1]),
   .frf_w1_valid        (`SPC4.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC4.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC4.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES4.fgu_idiv_valid[1]),

   .fdiv_valid          (`PROBES4.fgu_fdiv_valid[1]),

   .lsu_valid           (`PROBES4.lsu_valid[1]),
   .frf_w2_valid        (`SPC4.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC4.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC4.fgu.frf.w2_addr),

   .asi_valid           (`PROBES4.asi_valid_fx5[1]),
   .asi_in_progress     (`PROBES4.asi_in_progress_fx4[1]),

   .tlu_valid           (`PROBES4.tlu_valid[1])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 2
//
   
  nas_pipe4 t2 (
   .mycid               (cid),
   .mytid               (3'h2),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES4.op_2_w}),
   .PC_reg              ({`PROBES4.pc_2_w}),
   .Y_reg               (`SPC4.exu0.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC4.exu0.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC4.fgu.fac.fprs_tid2),
   .FSR_reg             (`SPC4.fgu.fad.fsr2_fx1[27:0]),
   .ASI_reg             (`SPC4.lsu.dcs.asi_state2),
   .GSR_reg             ({`SPC4.fgu.fgd.gsr2_mask_fx4[31:0], `SPC4.fgu.fpc.gsr2_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES4.tick_cmpr_2),
   .STICK_CMPR_reg      (`PROBES4.stick_cmpr_2),
   .HSTICK_CMPR_reg     (`PROBES4.hstick_cmpr_2),
   .PSTATE_reg          (`SPC4.tlu.tsd0.arch_pstate2),
   .TL_reg              (`SPC4.tlu.trl0.tl2),
   .PIL_reg             (`SPC4.tlu.trl0.pil2),
   .TBA_reg             (`SPC4.tlu.tsd0.tba2[47:15]),
   .VER_reg             (`SPC4.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC4.exu0.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC4.exu0.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC4.exu0.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC4.exu0.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC4.exu0.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC4.exu0.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC4.tlu.trl0.rd_softint2),
   .SOFTINT_reg         (`SPC4.tlu.trl0.softint2),
   .INTR_RECEIVE_reg    (`SPC4.tlu.cth.int_rec2),
   .GL_reg              (`SPC4.tlu.tlu_gl2),
   .HPSTATE_reg         (`SPC4.tlu.tsd0.arch_hpstate2),
   .HTBA_reg            (`SPC4.tlu.tsd0.htba2[47:14]),
   .HINTP_reg           (`SPC4.tlu.trl0.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC4.lsu.dcs.p0ctxt_2[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC4.lsu.dcs.s0ctxt_2[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC4.lsu.dcs.p1ctxt_2[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC4.lsu.dcs.s1ctxt_2[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC4.lsu.dcs.wpt_mode_2[1:0],
                                   `SPC4.lsu.dcs.wpt_mask_2[7:0],
                                   `SPC4.lsu.dcs.wpt_enable_2[1:0],
                                   18'd0,
                                   `SPC4.lsu.dcs.spec_enable[2],
                                   `SPC4.lsu.dcs.dmmu_enable[2],
                                   `SPC4.lsu.dcs.immu_enable[2],
                                   `SPC4.lsu.dcs.dc_enable[2],
                                   `SPC4.lsu.dcs.ic_enable[2]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd0.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd0.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC4.lsu.dcs.watchpoint2[47:3],3'b00}),
   .DSFAR_reg                     (`SPC4.tlu.dfd.dsfar_2[47:0]),

   .Trap_Entry_1        (`PROBES4.trap_entry_1_t2),
   .Trap_Entry_2        (`PROBES4.trap_entry_2_t2),
   .Trap_Entry_3        (`PROBES4.trap_entry_3_t2),
   .Trap_Entry_4        (`PROBES4.trap_entry_4_t2),
   .Trap_Entry_5        (`PROBES4.trap_entry_5_t2),
   .Trap_Entry_6        (`PROBES4.trap_entry_6_t2),

   .exu_valid           (`PROBES4.ex_valid[2]),

   .imul_valid          (`PROBES4.imul_valid[2]),

   .fp_valid            (`PROBES4.fg_valid[2]),
   .frf_w1_valid        (`SPC4.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC4.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC4.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES4.fgu_idiv_valid[2]),

   .fdiv_valid          (`PROBES4.fgu_fdiv_valid[2]),

   .lsu_valid           (`PROBES4.lsu_valid[2]),
   .frf_w2_valid        (`SPC4.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC4.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC4.fgu.frf.w2_addr),

   .asi_valid           (`PROBES4.asi_valid_fx5[2]),
   .asi_in_progress     (`PROBES4.asi_in_progress_fx4[2]),

   .tlu_valid           (`PROBES4.tlu_valid[2])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 3
//
   
  nas_pipe4 t3 (
   .mycid               (cid),
   .mytid               (3'h3),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES4.op_3_w}),
   .PC_reg              ({`PROBES4.pc_3_w}),
   .Y_reg               (`SPC4.exu0.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC4.exu0.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC4.fgu.fac.fprs_tid3),
   .FSR_reg             (`SPC4.fgu.fad.fsr3_fx1[27:0]),
   .ASI_reg             (`SPC4.lsu.dcs.asi_state3),
   .GSR_reg             ({`SPC4.fgu.fgd.gsr3_mask_fx4[31:0], `SPC4.fgu.fpc.gsr3_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES4.tick_cmpr_3),
   .STICK_CMPR_reg      (`PROBES4.stick_cmpr_3),
   .HSTICK_CMPR_reg     (`PROBES4.hstick_cmpr_3),
   .PSTATE_reg          (`SPC4.tlu.tsd0.arch_pstate3),
   .TL_reg              (`SPC4.tlu.trl0.tl3),
   .PIL_reg             (`SPC4.tlu.trl0.pil3),
   .TBA_reg             (`SPC4.tlu.tsd0.tba3[47:15]),
   .VER_reg             (`SPC4.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC4.exu0.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC4.exu0.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC4.exu0.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC4.exu0.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC4.exu0.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC4.exu0.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC4.tlu.trl0.rd_softint3),
   .SOFTINT_reg         (`SPC4.tlu.trl0.softint3),
   .INTR_RECEIVE_reg    (`SPC4.tlu.cth.int_rec3),
   .GL_reg              (`SPC4.tlu.tlu_gl3),
   .HPSTATE_reg         (`SPC4.tlu.tsd0.arch_hpstate3),
   .HTBA_reg            (`SPC4.tlu.tsd0.htba3[47:14]),
   .HINTP_reg           (`SPC4.tlu.trl0.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC4.lsu.dcs.p0ctxt_3[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC4.lsu.dcs.s0ctxt_3[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC4.lsu.dcs.p1ctxt_3[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC4.lsu.dcs.s1ctxt_3[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC4.lsu.dcs.wpt_mode_3[1:0],
                                   `SPC4.lsu.dcs.wpt_mask_3[7:0],
                                   `SPC4.lsu.dcs.wpt_enable_3[1:0],
                                   18'd0,
                                   `SPC4.lsu.dcs.spec_enable[3],
                                   `SPC4.lsu.dcs.dmmu_enable[3],
                                   `SPC4.lsu.dcs.immu_enable[3],
                                   `SPC4.lsu.dcs.dc_enable[3],
                                   `SPC4.lsu.dcs.ic_enable[3]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd0.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd0.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC4.lsu.dcs.watchpoint3[47:3],3'b00}),
   .DSFAR_reg                     (`SPC4.tlu.dfd.dsfar_3[47:0]),

   .Trap_Entry_1        (`PROBES4.trap_entry_1_t3),
   .Trap_Entry_2        (`PROBES4.trap_entry_2_t3),
   .Trap_Entry_3        (`PROBES4.trap_entry_3_t3),
   .Trap_Entry_4        (`PROBES4.trap_entry_4_t3),
   .Trap_Entry_5        (`PROBES4.trap_entry_5_t3),
   .Trap_Entry_6        (`PROBES4.trap_entry_6_t3),

   .exu_valid           (`PROBES4.ex_valid[3]),

   .imul_valid          (`PROBES4.imul_valid[3]),

   .fp_valid            (`PROBES4.fg_valid[3]),
   .frf_w1_valid        (`SPC4.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC4.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC4.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES4.fgu_idiv_valid[3]),

   .fdiv_valid          (`PROBES4.fgu_fdiv_valid[3]),

   .lsu_valid           (`PROBES4.lsu_valid[3]),
   .frf_w2_valid        (`SPC4.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC4.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC4.fgu.frf.w2_addr),

   .asi_valid           (`PROBES4.asi_valid_fx5[3]),
   .asi_in_progress     (`PROBES4.asi_in_progress_fx4[3]),

   .tlu_valid           (`PROBES4.tlu_valid[3])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 4
//
   
  nas_pipe4 t4 (
   .mycid               (cid),
   .mytid               (3'h4),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES4.op_4_w}),
   .PC_reg              ({`PROBES4.pc_4_w}),
   .Y_reg               (`SPC4.exu1.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC4.exu1.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC4.fgu.fac.fprs_tid4),
   .FSR_reg             (`SPC4.fgu.fad.fsr4_fx1[27:0]),
   .ASI_reg             (`SPC4.lsu.dcs.asi_state4),
   .GSR_reg             ({`SPC4.fgu.fgd.gsr4_mask_fx4[31:0], `SPC4.fgu.fpc.gsr4_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES4.tick_cmpr_4),
   .STICK_CMPR_reg      (`PROBES4.stick_cmpr_4),
   .HSTICK_CMPR_reg     (`PROBES4.hstick_cmpr_4),
   .PSTATE_reg          (`SPC4.tlu.tsd1.arch_pstate0),
   .TL_reg              (`SPC4.tlu.trl1.tl0),
   .PIL_reg             (`SPC4.tlu.trl1.pil0),
   .TBA_reg             (`SPC4.tlu.tsd1.tba0[47:15]),
   .VER_reg             (`SPC4.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC4.exu1.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC4.exu1.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC4.exu1.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC4.exu1.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC4.exu1.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC4.exu1.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC4.tlu.trl1.rd_softint0),
   .SOFTINT_reg         (`SPC4.tlu.trl1.softint0),
   .INTR_RECEIVE_reg    (`SPC4.tlu.cth.int_rec4),
   .GL_reg              (`SPC4.tlu.tlu_gl4),
   .HPSTATE_reg         (`SPC4.tlu.tsd1.arch_hpstate0),
   .HTBA_reg            (`SPC4.tlu.tsd1.htba0[47:14]),
   .HINTP_reg           (`SPC4.tlu.trl1.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC4.lsu.dcs.p0ctxt_4[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC4.lsu.dcs.s0ctxt_4[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC4.lsu.dcs.p1ctxt_4[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC4.lsu.dcs.s1ctxt_4[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC4.lsu.dcs.wpt_mode_4[1:0],
                                   `SPC4.lsu.dcs.wpt_mask_4[7:0],
                                   `SPC4.lsu.dcs.wpt_enable_4[1:0],
                                   18'd0,
                                   `SPC4.lsu.dcs.spec_enable[4],
                                   `SPC4.lsu.dcs.dmmu_enable[4],
                                   `SPC4.lsu.dcs.immu_enable[4],
                                   `SPC4.lsu.dcs.dc_enable[4],
                                   `SPC4.lsu.dcs.ic_enable[4]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd1.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd1.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC4.lsu.dcs.watchpoint4[47:3],3'b00}),
   .DSFAR_reg                     (`SPC4.tlu.dfd.dsfar_4[47:0]),

   .Trap_Entry_1        (`PROBES4.trap_entry_1_t4),
   .Trap_Entry_2        (`PROBES4.trap_entry_2_t4),
   .Trap_Entry_3        (`PROBES4.trap_entry_3_t4),
   .Trap_Entry_4        (`PROBES4.trap_entry_4_t4),
   .Trap_Entry_5        (`PROBES4.trap_entry_5_t4),
   .Trap_Entry_6        (`PROBES4.trap_entry_6_t4),

   .exu_valid           (`PROBES4.ex_valid[4]),

   .imul_valid          (`PROBES4.imul_valid[4]),

   .fp_valid            (`PROBES4.fg_valid[4]),
   .frf_w1_valid        (`SPC4.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC4.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC4.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES4.fgu_idiv_valid[4]),

   .fdiv_valid          (`PROBES4.fgu_fdiv_valid[4]),

   .lsu_valid           (`PROBES4.lsu_valid[4]),
   .frf_w2_valid        (`SPC4.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC4.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC4.fgu.frf.w2_addr),

   .asi_valid           (`PROBES4.asi_valid_fx5[4]),
   .asi_in_progress     (`PROBES4.asi_in_progress_fx4[4]),

   .tlu_valid           (`PROBES4.tlu_valid[4])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 5
//
   
  nas_pipe4 t5 (
   .mycid               (cid),
   .mytid               (3'h5),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES4.op_5_w}),
   .PC_reg              ({`PROBES4.pc_5_w}),
   .Y_reg               (`SPC4.exu1.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC4.exu1.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC4.fgu.fac.fprs_tid5),
   .FSR_reg             (`SPC4.fgu.fad.fsr5_fx1[27:0]),
   .ASI_reg             (`SPC4.lsu.dcs.asi_state5),
   .GSR_reg             ({`SPC4.fgu.fgd.gsr5_mask_fx4[31:0], `SPC4.fgu.fpc.gsr5_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES4.tick_cmpr_5),
   .STICK_CMPR_reg      (`PROBES4.stick_cmpr_5),
   .HSTICK_CMPR_reg     (`PROBES4.hstick_cmpr_5),
   .PSTATE_reg          (`SPC4.tlu.tsd1.arch_pstate1),
   .TL_reg              (`SPC4.tlu.trl1.tl1),
   .PIL_reg             (`SPC4.tlu.trl1.pil1),
   .TBA_reg             (`SPC4.tlu.tsd1.tba1[47:15]),
   .VER_reg             (`SPC4.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC4.exu1.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC4.exu1.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC4.exu1.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC4.exu1.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC4.exu1.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC4.exu1.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC4.tlu.trl1.rd_softint1),
   .SOFTINT_reg         (`SPC4.tlu.trl1.softint1),
   .INTR_RECEIVE_reg    (`SPC4.tlu.cth.int_rec5),
   .GL_reg              (`SPC4.tlu.tlu_gl5),
   .HPSTATE_reg         (`SPC4.tlu.tsd1.arch_hpstate1),
   .HTBA_reg            (`SPC4.tlu.tsd1.htba1[47:14]),
   .HINTP_reg           (`SPC4.tlu.trl1.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC4.lsu.dcs.p0ctxt_5[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC4.lsu.dcs.s0ctxt_5[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC4.lsu.dcs.p1ctxt_5[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC4.lsu.dcs.s1ctxt_5[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC4.lsu.dcs.wpt_mode_5[1:0],
                                   `SPC4.lsu.dcs.wpt_mask_5[7:0],
                                   `SPC4.lsu.dcs.wpt_enable_5[1:0],
                                   18'd0,
                                   `SPC4.lsu.dcs.spec_enable[5],
                                   `SPC4.lsu.dcs.dmmu_enable[5],
                                   `SPC4.lsu.dcs.immu_enable[5],
                                   `SPC4.lsu.dcs.dc_enable[5],
                                   `SPC4.lsu.dcs.ic_enable[5]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd1.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd1.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC4.lsu.dcs.watchpoint5[47:3],3'b00}),
   .DSFAR_reg                     (`SPC4.tlu.dfd.dsfar_5[47:0]),

   .Trap_Entry_1        (`PROBES4.trap_entry_1_t5),
   .Trap_Entry_2        (`PROBES4.trap_entry_2_t5),
   .Trap_Entry_3        (`PROBES4.trap_entry_3_t5),
   .Trap_Entry_4        (`PROBES4.trap_entry_4_t5),
   .Trap_Entry_5        (`PROBES4.trap_entry_5_t5),
   .Trap_Entry_6        (`PROBES4.trap_entry_6_t5),

   .exu_valid           (`PROBES4.ex_valid[5]),

   .imul_valid          (`PROBES4.imul_valid[5]),

   .fp_valid            (`PROBES4.fg_valid[5]),
   .frf_w1_valid        (`SPC4.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC4.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC4.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES4.fgu_idiv_valid[5]),

   .fdiv_valid          (`PROBES4.fgu_fdiv_valid[5]),

   .lsu_valid           (`PROBES4.lsu_valid[5]),
   .frf_w2_valid        (`SPC4.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC4.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC4.fgu.frf.w2_addr),

   .asi_valid           (`PROBES4.asi_valid_fx5[5]),
   .asi_in_progress     (`PROBES4.asi_in_progress_fx4[5]),

   .tlu_valid           (`PROBES4.tlu_valid[5])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 6
//
   
  nas_pipe4 t6 (
   .mycid               (cid),
   .mytid               (3'h6),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES4.op_6_w}),
   .PC_reg              ({`PROBES4.pc_6_w}),
   .Y_reg               (`SPC4.exu1.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC4.exu1.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC4.fgu.fac.fprs_tid6),
   .FSR_reg             (`SPC4.fgu.fad.fsr6_fx1[27:0]),
   .ASI_reg             (`SPC4.lsu.dcs.asi_state6),
   .GSR_reg             ({`SPC4.fgu.fgd.gsr6_mask_fx4[31:0], `SPC4.fgu.fpc.gsr6_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES4.tick_cmpr_6),
   .STICK_CMPR_reg      (`PROBES4.stick_cmpr_6),
   .HSTICK_CMPR_reg     (`PROBES4.hstick_cmpr_6),
   .PSTATE_reg          (`SPC4.tlu.tsd1.arch_pstate2),
   .TL_reg              (`SPC4.tlu.trl1.tl2),
   .PIL_reg             (`SPC4.tlu.trl1.pil2),
   .TBA_reg             (`SPC4.tlu.tsd1.tba2[47:15]),
   .VER_reg             (`SPC4.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC4.exu1.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC4.exu1.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC4.exu1.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC4.exu1.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC4.exu1.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC4.exu1.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC4.tlu.trl1.rd_softint2),
   .SOFTINT_reg         (`SPC4.tlu.trl1.softint2),
   .INTR_RECEIVE_reg    (`SPC4.tlu.cth.int_rec6),
   .GL_reg              (`SPC4.tlu.tlu_gl6),
   .HPSTATE_reg         (`SPC4.tlu.tsd1.arch_hpstate2),
   .HTBA_reg            (`SPC4.tlu.tsd1.htba2[47:14]),
   .HINTP_reg           (`SPC4.tlu.trl1.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC4.lsu.dcs.p0ctxt_6[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC4.lsu.dcs.s0ctxt_6[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC4.lsu.dcs.p1ctxt_6[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC4.lsu.dcs.s1ctxt_6[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC4.lsu.dcs.wpt_mode_6[1:0],
                                   `SPC4.lsu.dcs.wpt_mask_6[7:0],
                                   `SPC4.lsu.dcs.wpt_enable_6[1:0],
                                   18'd0,
                                   `SPC4.lsu.dcs.spec_enable[6],
                                   `SPC4.lsu.dcs.dmmu_enable[6],
                                   `SPC4.lsu.dcs.immu_enable[6],
                                   `SPC4.lsu.dcs.dc_enable[6],
                                   `SPC4.lsu.dcs.ic_enable[6]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd1.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd1.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC4.lsu.dcs.watchpoint6[47:3],3'b00}),
   .DSFAR_reg                     (`SPC4.tlu.dfd.dsfar_6[47:0]),

   .Trap_Entry_1        (`PROBES4.trap_entry_1_t6),
   .Trap_Entry_2        (`PROBES4.trap_entry_2_t6),
   .Trap_Entry_3        (`PROBES4.trap_entry_3_t6),
   .Trap_Entry_4        (`PROBES4.trap_entry_4_t6),
   .Trap_Entry_5        (`PROBES4.trap_entry_5_t6),
   .Trap_Entry_6        (`PROBES4.trap_entry_6_t6),

   .exu_valid           (`PROBES4.ex_valid[6]),

   .imul_valid          (`PROBES4.imul_valid[6]),

   .fp_valid            (`PROBES4.fg_valid[6]),
   .frf_w1_valid        (`SPC4.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC4.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC4.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES4.fgu_idiv_valid[6]),

   .fdiv_valid          (`PROBES4.fgu_fdiv_valid[6]),

   .lsu_valid           (`PROBES4.lsu_valid[6]),
   .frf_w2_valid        (`SPC4.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC4.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC4.fgu.frf.w2_addr),

   .asi_valid           (`PROBES4.asi_valid_fx5[6]),
   .asi_in_progress     (`PROBES4.asi_in_progress_fx4[6]),

   .tlu_valid           (`PROBES4.tlu_valid[6])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 7
//
   
  nas_pipe4 t7 (
   .mycid               (cid),
   .mytid               (3'h7),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES4.op_7_w}),
   .PC_reg              ({`PROBES4.pc_7_w}),
   .Y_reg               (`SPC4.exu1.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC4.exu1.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC4.fgu.fac.fprs_tid7),
   .FSR_reg             (`SPC4.fgu.fad.fsr7_fx1[27:0]),
   .ASI_reg             (`SPC4.lsu.dcs.asi_state7),
   .GSR_reg             ({`SPC4.fgu.fgd.gsr7_mask_fx4[31:0], `SPC4.fgu.fpc.gsr7_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES4.tick_cmpr_7),
   .STICK_CMPR_reg      (`PROBES4.stick_cmpr_7),
   .HSTICK_CMPR_reg     (`PROBES4.hstick_cmpr_7),
   .PSTATE_reg          (`SPC4.tlu.tsd1.arch_pstate3),
   .TL_reg              (`SPC4.tlu.trl1.tl3),
   .PIL_reg             (`SPC4.tlu.trl1.pil3),
   .TBA_reg             (`SPC4.tlu.tsd1.tba3[47:15]),
   .VER_reg             (`SPC4.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC4.exu1.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC4.exu1.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC4.exu1.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC4.exu1.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC4.exu1.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC4.exu1.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC4.tlu.trl1.rd_softint3),
   .SOFTINT_reg         (`SPC4.tlu.trl1.softint3),
   .INTR_RECEIVE_reg    (`SPC4.tlu.cth.int_rec7),
   .GL_reg              (`SPC4.tlu.tlu_gl7),
   .HPSTATE_reg         (`SPC4.tlu.tsd1.arch_hpstate3),
   .HTBA_reg            (`SPC4.tlu.tsd1.htba3[47:14]),
   .HINTP_reg           (`SPC4.tlu.trl1.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC4.lsu.dcs.p0ctxt_7[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC4.lsu.dcs.s0ctxt_7[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC4.lsu.dcs.p1ctxt_7[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC4.lsu.dcs.s1ctxt_7[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC4.lsu.dcs.wpt_mode_7[1:0],
                                   `SPC4.lsu.dcs.wpt_mask_7[7:0],
                                   `SPC4.lsu.dcs.wpt_enable_7[1:0],
                                   18'd0,
                                   `SPC4.lsu.dcs.spec_enable[7],
                                   `SPC4.lsu.dcs.dmmu_enable[7],
                                   `SPC4.lsu.dcs.immu_enable[7],
                                   `SPC4.lsu.dcs.dc_enable[7],
                                   `SPC4.lsu.dcs.ic_enable[7]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd1.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC4.mmu.asd1.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC4.lsu.dcs.watchpoint7[47:3],3'b00}),
   .DSFAR_reg                     (`SPC4.tlu.dfd.dsfar_7[47:0]),

   .Trap_Entry_1        (`PROBES4.trap_entry_1_t7),
   .Trap_Entry_2        (`PROBES4.trap_entry_2_t7),
   .Trap_Entry_3        (`PROBES4.trap_entry_3_t7),
   .Trap_Entry_4        (`PROBES4.trap_entry_4_t7),
   .Trap_Entry_5        (`PROBES4.trap_entry_5_t7),
   .Trap_Entry_6        (`PROBES4.trap_entry_6_t7),

   .exu_valid           (`PROBES4.ex_valid[7]),

   .imul_valid          (`PROBES4.imul_valid[7]),

   .fp_valid            (`PROBES4.fg_valid[7]),
   .frf_w1_valid        (`SPC4.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC4.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC4.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES4.fgu_idiv_valid[7]),

   .fdiv_valid          (`PROBES4.fgu_fdiv_valid[7]),

   .lsu_valid           (`PROBES4.lsu_valid[7]),
   .frf_w2_valid        (`SPC4.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC4.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC4.fgu.frf.w2_addr),

   .asi_valid           (`PROBES4.asi_valid_fx5[7]),
   .asi_in_progress     (`PROBES4.asi_in_progress_fx4[7]),

   .tlu_valid           (`PROBES4.tlu_valid[7])
`endif
  );
				      
//----------------------------------------------------------


//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_5

module nas_core5 (

  cid
);

input [2:0] cid;

integer i;

//----------------------------------------------------------

//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//
   
  nas_pipe5 t0 (
   .mycid               (cid),
   .mytid               (3'h0),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES5.op_0_w}),
   .PC_reg              ({`PROBES5.pc_0_w}),
   .Y_reg               (`SPC5.exu0.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC5.exu0.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC5.fgu.fac.fprs_tid0),
   .FSR_reg             (`SPC5.fgu.fad.fsr0_fx1[27:0]),
   .ASI_reg             (`SPC5.lsu.dcs.asi_state0),
   .GSR_reg             ({`SPC5.fgu.fgd.gsr0_mask_fx4[31:0], `SPC5.fgu.fpc.gsr0_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES5.tick_cmpr_0),
   .STICK_CMPR_reg      (`PROBES5.stick_cmpr_0),
   .HSTICK_CMPR_reg     (`PROBES5.hstick_cmpr_0),
   .PSTATE_reg          (`SPC5.tlu.tsd0.arch_pstate0),
   .TL_reg              (`SPC5.tlu.trl0.tl0),
   .PIL_reg             (`SPC5.tlu.trl0.pil0),
   .TBA_reg             (`SPC5.tlu.tsd0.tba0[47:15]),
   .VER_reg             (`SPC5.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC5.exu0.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC5.exu0.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC5.exu0.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC5.exu0.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC5.exu0.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC5.exu0.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC5.tlu.trl0.rd_softint0),
   .SOFTINT_reg         (`SPC5.tlu.trl0.softint0),
   .INTR_RECEIVE_reg    (`SPC5.tlu.cth.int_rec0),
   .GL_reg              (`SPC5.tlu.tlu_gl0),
   .HPSTATE_reg         (`SPC5.tlu.tsd0.arch_hpstate0),
   .HTBA_reg            (`SPC5.tlu.tsd0.htba0[47:14]),
   .HINTP_reg           (`SPC5.tlu.trl0.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC5.lsu.dcs.p0ctxt_0[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC5.lsu.dcs.s0ctxt_0[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC5.lsu.dcs.p1ctxt_0[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC5.lsu.dcs.s1ctxt_0[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC5.lsu.dcs.wpt_mode_0[1:0],
                                   `SPC5.lsu.dcs.wpt_mask_0[7:0],
                                   `SPC5.lsu.dcs.wpt_enable_0[1:0],
                                   18'd0,
                                   `SPC5.lsu.dcs.spec_enable[0],
                                   `SPC5.lsu.dcs.dmmu_enable[0],
                                   `SPC5.lsu.dcs.immu_enable[0],
                                   `SPC5.lsu.dcs.dc_enable[0],
                                   `SPC5.lsu.dcs.ic_enable[0]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd0.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd0.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC5.lsu.dcs.watchpoint0[47:3],3'b00}),
   .DSFAR_reg                     (`SPC5.tlu.dfd.dsfar_0[47:0]),

   .Trap_Entry_1        (`PROBES5.trap_entry_1_t0),
   .Trap_Entry_2        (`PROBES5.trap_entry_2_t0),
   .Trap_Entry_3        (`PROBES5.trap_entry_3_t0),
   .Trap_Entry_4        (`PROBES5.trap_entry_4_t0),
   .Trap_Entry_5        (`PROBES5.trap_entry_5_t0),
   .Trap_Entry_6        (`PROBES5.trap_entry_6_t0),

   .exu_valid           (`PROBES5.ex_valid[0]),

   .imul_valid          (`PROBES5.imul_valid[0]),

   .fp_valid            (`PROBES5.fg_valid[0]),
   .frf_w1_valid        (`SPC5.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC5.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC5.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES5.fgu_idiv_valid[0]),

   .fdiv_valid          (`PROBES5.fgu_fdiv_valid[0]),

   .lsu_valid           (`PROBES5.lsu_valid[0]),
   .frf_w2_valid        (`SPC5.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC5.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC5.fgu.frf.w2_addr),

   .asi_valid           (`PROBES5.asi_valid_fx5[0]),
   .asi_in_progress     (`PROBES5.asi_in_progress_fx4[0]),

   .tlu_valid           (`PROBES5.tlu_valid[0])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 1
//
   
  nas_pipe5 t1 (
   .mycid               (cid),
   .mytid               (3'h1),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES5.op_1_w}),
   .PC_reg              ({`PROBES5.pc_1_w}),
   .Y_reg               (`SPC5.exu0.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC5.exu0.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC5.fgu.fac.fprs_tid1),
   .FSR_reg             (`SPC5.fgu.fad.fsr1_fx1[27:0]),
   .ASI_reg             (`SPC5.lsu.dcs.asi_state1),
   .GSR_reg             ({`SPC5.fgu.fgd.gsr1_mask_fx4[31:0], `SPC5.fgu.fpc.gsr1_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES5.tick_cmpr_1),
   .STICK_CMPR_reg      (`PROBES5.stick_cmpr_1),
   .HSTICK_CMPR_reg     (`PROBES5.hstick_cmpr_1),
   .PSTATE_reg          (`SPC5.tlu.tsd0.arch_pstate1),
   .TL_reg              (`SPC5.tlu.trl0.tl1),
   .PIL_reg             (`SPC5.tlu.trl0.pil1),
   .TBA_reg             (`SPC5.tlu.tsd0.tba1[47:15]),
   .VER_reg             (`SPC5.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC5.exu0.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC5.exu0.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC5.exu0.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC5.exu0.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC5.exu0.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC5.exu0.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC5.tlu.trl0.rd_softint1),
   .SOFTINT_reg         (`SPC5.tlu.trl0.softint1),
   .INTR_RECEIVE_reg    (`SPC5.tlu.cth.int_rec1),
   .GL_reg              (`SPC5.tlu.tlu_gl1),
   .HPSTATE_reg         (`SPC5.tlu.tsd0.arch_hpstate1),
   .HTBA_reg            (`SPC5.tlu.tsd0.htba1[47:14]),
   .HINTP_reg           (`SPC5.tlu.trl0.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC5.lsu.dcs.p0ctxt_1[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC5.lsu.dcs.s0ctxt_1[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC5.lsu.dcs.p1ctxt_1[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC5.lsu.dcs.s1ctxt_1[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC5.lsu.dcs.wpt_mode_1[1:0],
                                   `SPC5.lsu.dcs.wpt_mask_1[7:0],
                                   `SPC5.lsu.dcs.wpt_enable_1[1:0],
                                   18'd0,
                                   `SPC5.lsu.dcs.spec_enable[1],
                                   `SPC5.lsu.dcs.dmmu_enable[1],
                                   `SPC5.lsu.dcs.immu_enable[1],
                                   `SPC5.lsu.dcs.dc_enable[1],
                                   `SPC5.lsu.dcs.ic_enable[1]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd0.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd0.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC5.lsu.dcs.watchpoint1[47:3],3'b00}),
   .DSFAR_reg                     (`SPC5.tlu.dfd.dsfar_1[47:0]),

   .Trap_Entry_1        (`PROBES5.trap_entry_1_t1),
   .Trap_Entry_2        (`PROBES5.trap_entry_2_t1),
   .Trap_Entry_3        (`PROBES5.trap_entry_3_t1),
   .Trap_Entry_4        (`PROBES5.trap_entry_4_t1),
   .Trap_Entry_5        (`PROBES5.trap_entry_5_t1),
   .Trap_Entry_6        (`PROBES5.trap_entry_6_t1),

   .exu_valid           (`PROBES5.ex_valid[1]),

   .imul_valid          (`PROBES5.imul_valid[1]),

   .fp_valid            (`PROBES5.fg_valid[1]),
   .frf_w1_valid        (`SPC5.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC5.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC5.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES5.fgu_idiv_valid[1]),

   .fdiv_valid          (`PROBES5.fgu_fdiv_valid[1]),

   .lsu_valid           (`PROBES5.lsu_valid[1]),
   .frf_w2_valid        (`SPC5.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC5.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC5.fgu.frf.w2_addr),

   .asi_valid           (`PROBES5.asi_valid_fx5[1]),
   .asi_in_progress     (`PROBES5.asi_in_progress_fx4[1]),

   .tlu_valid           (`PROBES5.tlu_valid[1])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 2
//
   
  nas_pipe5 t2 (
   .mycid               (cid),
   .mytid               (3'h2),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES5.op_2_w}),
   .PC_reg              ({`PROBES5.pc_2_w}),
   .Y_reg               (`SPC5.exu0.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC5.exu0.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC5.fgu.fac.fprs_tid2),
   .FSR_reg             (`SPC5.fgu.fad.fsr2_fx1[27:0]),
   .ASI_reg             (`SPC5.lsu.dcs.asi_state2),
   .GSR_reg             ({`SPC5.fgu.fgd.gsr2_mask_fx4[31:0], `SPC5.fgu.fpc.gsr2_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES5.tick_cmpr_2),
   .STICK_CMPR_reg      (`PROBES5.stick_cmpr_2),
   .HSTICK_CMPR_reg     (`PROBES5.hstick_cmpr_2),
   .PSTATE_reg          (`SPC5.tlu.tsd0.arch_pstate2),
   .TL_reg              (`SPC5.tlu.trl0.tl2),
   .PIL_reg             (`SPC5.tlu.trl0.pil2),
   .TBA_reg             (`SPC5.tlu.tsd0.tba2[47:15]),
   .VER_reg             (`SPC5.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC5.exu0.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC5.exu0.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC5.exu0.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC5.exu0.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC5.exu0.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC5.exu0.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC5.tlu.trl0.rd_softint2),
   .SOFTINT_reg         (`SPC5.tlu.trl0.softint2),
   .INTR_RECEIVE_reg    (`SPC5.tlu.cth.int_rec2),
   .GL_reg              (`SPC5.tlu.tlu_gl2),
   .HPSTATE_reg         (`SPC5.tlu.tsd0.arch_hpstate2),
   .HTBA_reg            (`SPC5.tlu.tsd0.htba2[47:14]),
   .HINTP_reg           (`SPC5.tlu.trl0.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC5.lsu.dcs.p0ctxt_2[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC5.lsu.dcs.s0ctxt_2[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC5.lsu.dcs.p1ctxt_2[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC5.lsu.dcs.s1ctxt_2[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC5.lsu.dcs.wpt_mode_2[1:0],
                                   `SPC5.lsu.dcs.wpt_mask_2[7:0],
                                   `SPC5.lsu.dcs.wpt_enable_2[1:0],
                                   18'd0,
                                   `SPC5.lsu.dcs.spec_enable[2],
                                   `SPC5.lsu.dcs.dmmu_enable[2],
                                   `SPC5.lsu.dcs.immu_enable[2],
                                   `SPC5.lsu.dcs.dc_enable[2],
                                   `SPC5.lsu.dcs.ic_enable[2]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd0.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd0.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC5.lsu.dcs.watchpoint2[47:3],3'b00}),
   .DSFAR_reg                     (`SPC5.tlu.dfd.dsfar_2[47:0]),

   .Trap_Entry_1        (`PROBES5.trap_entry_1_t2),
   .Trap_Entry_2        (`PROBES5.trap_entry_2_t2),
   .Trap_Entry_3        (`PROBES5.trap_entry_3_t2),
   .Trap_Entry_4        (`PROBES5.trap_entry_4_t2),
   .Trap_Entry_5        (`PROBES5.trap_entry_5_t2),
   .Trap_Entry_6        (`PROBES5.trap_entry_6_t2),

   .exu_valid           (`PROBES5.ex_valid[2]),

   .imul_valid          (`PROBES5.imul_valid[2]),

   .fp_valid            (`PROBES5.fg_valid[2]),
   .frf_w1_valid        (`SPC5.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC5.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC5.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES5.fgu_idiv_valid[2]),

   .fdiv_valid          (`PROBES5.fgu_fdiv_valid[2]),

   .lsu_valid           (`PROBES5.lsu_valid[2]),
   .frf_w2_valid        (`SPC5.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC5.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC5.fgu.frf.w2_addr),

   .asi_valid           (`PROBES5.asi_valid_fx5[2]),
   .asi_in_progress     (`PROBES5.asi_in_progress_fx4[2]),

   .tlu_valid           (`PROBES5.tlu_valid[2])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 3
//
   
  nas_pipe5 t3 (
   .mycid               (cid),
   .mytid               (3'h3),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES5.op_3_w}),
   .PC_reg              ({`PROBES5.pc_3_w}),
   .Y_reg               (`SPC5.exu0.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC5.exu0.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC5.fgu.fac.fprs_tid3),
   .FSR_reg             (`SPC5.fgu.fad.fsr3_fx1[27:0]),
   .ASI_reg             (`SPC5.lsu.dcs.asi_state3),
   .GSR_reg             ({`SPC5.fgu.fgd.gsr3_mask_fx4[31:0], `SPC5.fgu.fpc.gsr3_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES5.tick_cmpr_3),
   .STICK_CMPR_reg      (`PROBES5.stick_cmpr_3),
   .HSTICK_CMPR_reg     (`PROBES5.hstick_cmpr_3),
   .PSTATE_reg          (`SPC5.tlu.tsd0.arch_pstate3),
   .TL_reg              (`SPC5.tlu.trl0.tl3),
   .PIL_reg             (`SPC5.tlu.trl0.pil3),
   .TBA_reg             (`SPC5.tlu.tsd0.tba3[47:15]),
   .VER_reg             (`SPC5.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC5.exu0.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC5.exu0.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC5.exu0.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC5.exu0.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC5.exu0.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC5.exu0.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC5.tlu.trl0.rd_softint3),
   .SOFTINT_reg         (`SPC5.tlu.trl0.softint3),
   .INTR_RECEIVE_reg    (`SPC5.tlu.cth.int_rec3),
   .GL_reg              (`SPC5.tlu.tlu_gl3),
   .HPSTATE_reg         (`SPC5.tlu.tsd0.arch_hpstate3),
   .HTBA_reg            (`SPC5.tlu.tsd0.htba3[47:14]),
   .HINTP_reg           (`SPC5.tlu.trl0.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC5.lsu.dcs.p0ctxt_3[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC5.lsu.dcs.s0ctxt_3[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC5.lsu.dcs.p1ctxt_3[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC5.lsu.dcs.s1ctxt_3[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC5.lsu.dcs.wpt_mode_3[1:0],
                                   `SPC5.lsu.dcs.wpt_mask_3[7:0],
                                   `SPC5.lsu.dcs.wpt_enable_3[1:0],
                                   18'd0,
                                   `SPC5.lsu.dcs.spec_enable[3],
                                   `SPC5.lsu.dcs.dmmu_enable[3],
                                   `SPC5.lsu.dcs.immu_enable[3],
                                   `SPC5.lsu.dcs.dc_enable[3],
                                   `SPC5.lsu.dcs.ic_enable[3]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd0.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd0.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC5.lsu.dcs.watchpoint3[47:3],3'b00}),
   .DSFAR_reg                     (`SPC5.tlu.dfd.dsfar_3[47:0]),

   .Trap_Entry_1        (`PROBES5.trap_entry_1_t3),
   .Trap_Entry_2        (`PROBES5.trap_entry_2_t3),
   .Trap_Entry_3        (`PROBES5.trap_entry_3_t3),
   .Trap_Entry_4        (`PROBES5.trap_entry_4_t3),
   .Trap_Entry_5        (`PROBES5.trap_entry_5_t3),
   .Trap_Entry_6        (`PROBES5.trap_entry_6_t3),

   .exu_valid           (`PROBES5.ex_valid[3]),

   .imul_valid          (`PROBES5.imul_valid[3]),

   .fp_valid            (`PROBES5.fg_valid[3]),
   .frf_w1_valid        (`SPC5.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC5.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC5.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES5.fgu_idiv_valid[3]),

   .fdiv_valid          (`PROBES5.fgu_fdiv_valid[3]),

   .lsu_valid           (`PROBES5.lsu_valid[3]),
   .frf_w2_valid        (`SPC5.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC5.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC5.fgu.frf.w2_addr),

   .asi_valid           (`PROBES5.asi_valid_fx5[3]),
   .asi_in_progress     (`PROBES5.asi_in_progress_fx4[3]),

   .tlu_valid           (`PROBES5.tlu_valid[3])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 4
//
   
  nas_pipe5 t4 (
   .mycid               (cid),
   .mytid               (3'h4),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES5.op_4_w}),
   .PC_reg              ({`PROBES5.pc_4_w}),
   .Y_reg               (`SPC5.exu1.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC5.exu1.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC5.fgu.fac.fprs_tid4),
   .FSR_reg             (`SPC5.fgu.fad.fsr4_fx1[27:0]),
   .ASI_reg             (`SPC5.lsu.dcs.asi_state4),
   .GSR_reg             ({`SPC5.fgu.fgd.gsr4_mask_fx4[31:0], `SPC5.fgu.fpc.gsr4_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES5.tick_cmpr_4),
   .STICK_CMPR_reg      (`PROBES5.stick_cmpr_4),
   .HSTICK_CMPR_reg     (`PROBES5.hstick_cmpr_4),
   .PSTATE_reg          (`SPC5.tlu.tsd1.arch_pstate0),
   .TL_reg              (`SPC5.tlu.trl1.tl0),
   .PIL_reg             (`SPC5.tlu.trl1.pil0),
   .TBA_reg             (`SPC5.tlu.tsd1.tba0[47:15]),
   .VER_reg             (`SPC5.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC5.exu1.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC5.exu1.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC5.exu1.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC5.exu1.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC5.exu1.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC5.exu1.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC5.tlu.trl1.rd_softint0),
   .SOFTINT_reg         (`SPC5.tlu.trl1.softint0),
   .INTR_RECEIVE_reg    (`SPC5.tlu.cth.int_rec4),
   .GL_reg              (`SPC5.tlu.tlu_gl4),
   .HPSTATE_reg         (`SPC5.tlu.tsd1.arch_hpstate0),
   .HTBA_reg            (`SPC5.tlu.tsd1.htba0[47:14]),
   .HINTP_reg           (`SPC5.tlu.trl1.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC5.lsu.dcs.p0ctxt_4[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC5.lsu.dcs.s0ctxt_4[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC5.lsu.dcs.p1ctxt_4[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC5.lsu.dcs.s1ctxt_4[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC5.lsu.dcs.wpt_mode_4[1:0],
                                   `SPC5.lsu.dcs.wpt_mask_4[7:0],
                                   `SPC5.lsu.dcs.wpt_enable_4[1:0],
                                   18'd0,
                                   `SPC5.lsu.dcs.spec_enable[4],
                                   `SPC5.lsu.dcs.dmmu_enable[4],
                                   `SPC5.lsu.dcs.immu_enable[4],
                                   `SPC5.lsu.dcs.dc_enable[4],
                                   `SPC5.lsu.dcs.ic_enable[4]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd1.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd1.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC5.lsu.dcs.watchpoint4[47:3],3'b00}),
   .DSFAR_reg                     (`SPC5.tlu.dfd.dsfar_4[47:0]),

   .Trap_Entry_1        (`PROBES5.trap_entry_1_t4),
   .Trap_Entry_2        (`PROBES5.trap_entry_2_t4),
   .Trap_Entry_3        (`PROBES5.trap_entry_3_t4),
   .Trap_Entry_4        (`PROBES5.trap_entry_4_t4),
   .Trap_Entry_5        (`PROBES5.trap_entry_5_t4),
   .Trap_Entry_6        (`PROBES5.trap_entry_6_t4),

   .exu_valid           (`PROBES5.ex_valid[4]),

   .imul_valid          (`PROBES5.imul_valid[4]),

   .fp_valid            (`PROBES5.fg_valid[4]),
   .frf_w1_valid        (`SPC5.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC5.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC5.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES5.fgu_idiv_valid[4]),

   .fdiv_valid          (`PROBES5.fgu_fdiv_valid[4]),

   .lsu_valid           (`PROBES5.lsu_valid[4]),
   .frf_w2_valid        (`SPC5.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC5.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC5.fgu.frf.w2_addr),

   .asi_valid           (`PROBES5.asi_valid_fx5[4]),
   .asi_in_progress     (`PROBES5.asi_in_progress_fx4[4]),

   .tlu_valid           (`PROBES5.tlu_valid[4])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 5
//
   
  nas_pipe5 t5 (
   .mycid               (cid),
   .mytid               (3'h5),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES5.op_5_w}),
   .PC_reg              ({`PROBES5.pc_5_w}),
   .Y_reg               (`SPC5.exu1.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC5.exu1.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC5.fgu.fac.fprs_tid5),
   .FSR_reg             (`SPC5.fgu.fad.fsr5_fx1[27:0]),
   .ASI_reg             (`SPC5.lsu.dcs.asi_state5),
   .GSR_reg             ({`SPC5.fgu.fgd.gsr5_mask_fx4[31:0], `SPC5.fgu.fpc.gsr5_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES5.tick_cmpr_5),
   .STICK_CMPR_reg      (`PROBES5.stick_cmpr_5),
   .HSTICK_CMPR_reg     (`PROBES5.hstick_cmpr_5),
   .PSTATE_reg          (`SPC5.tlu.tsd1.arch_pstate1),
   .TL_reg              (`SPC5.tlu.trl1.tl1),
   .PIL_reg             (`SPC5.tlu.trl1.pil1),
   .TBA_reg             (`SPC5.tlu.tsd1.tba1[47:15]),
   .VER_reg             (`SPC5.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC5.exu1.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC5.exu1.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC5.exu1.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC5.exu1.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC5.exu1.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC5.exu1.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC5.tlu.trl1.rd_softint1),
   .SOFTINT_reg         (`SPC5.tlu.trl1.softint1),
   .INTR_RECEIVE_reg    (`SPC5.tlu.cth.int_rec5),
   .GL_reg              (`SPC5.tlu.tlu_gl5),
   .HPSTATE_reg         (`SPC5.tlu.tsd1.arch_hpstate1),
   .HTBA_reg            (`SPC5.tlu.tsd1.htba1[47:14]),
   .HINTP_reg           (`SPC5.tlu.trl1.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC5.lsu.dcs.p0ctxt_5[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC5.lsu.dcs.s0ctxt_5[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC5.lsu.dcs.p1ctxt_5[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC5.lsu.dcs.s1ctxt_5[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC5.lsu.dcs.wpt_mode_5[1:0],
                                   `SPC5.lsu.dcs.wpt_mask_5[7:0],
                                   `SPC5.lsu.dcs.wpt_enable_5[1:0],
                                   18'd0,
                                   `SPC5.lsu.dcs.spec_enable[5],
                                   `SPC5.lsu.dcs.dmmu_enable[5],
                                   `SPC5.lsu.dcs.immu_enable[5],
                                   `SPC5.lsu.dcs.dc_enable[5],
                                   `SPC5.lsu.dcs.ic_enable[5]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd1.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd1.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC5.lsu.dcs.watchpoint5[47:3],3'b00}),
   .DSFAR_reg                     (`SPC5.tlu.dfd.dsfar_5[47:0]),

   .Trap_Entry_1        (`PROBES5.trap_entry_1_t5),
   .Trap_Entry_2        (`PROBES5.trap_entry_2_t5),
   .Trap_Entry_3        (`PROBES5.trap_entry_3_t5),
   .Trap_Entry_4        (`PROBES5.trap_entry_4_t5),
   .Trap_Entry_5        (`PROBES5.trap_entry_5_t5),
   .Trap_Entry_6        (`PROBES5.trap_entry_6_t5),

   .exu_valid           (`PROBES5.ex_valid[5]),

   .imul_valid          (`PROBES5.imul_valid[5]),

   .fp_valid            (`PROBES5.fg_valid[5]),
   .frf_w1_valid        (`SPC5.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC5.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC5.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES5.fgu_idiv_valid[5]),

   .fdiv_valid          (`PROBES5.fgu_fdiv_valid[5]),

   .lsu_valid           (`PROBES5.lsu_valid[5]),
   .frf_w2_valid        (`SPC5.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC5.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC5.fgu.frf.w2_addr),

   .asi_valid           (`PROBES5.asi_valid_fx5[5]),
   .asi_in_progress     (`PROBES5.asi_in_progress_fx4[5]),

   .tlu_valid           (`PROBES5.tlu_valid[5])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 6
//
   
  nas_pipe5 t6 (
   .mycid               (cid),
   .mytid               (3'h6),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES5.op_6_w}),
   .PC_reg              ({`PROBES5.pc_6_w}),
   .Y_reg               (`SPC5.exu1.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC5.exu1.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC5.fgu.fac.fprs_tid6),
   .FSR_reg             (`SPC5.fgu.fad.fsr6_fx1[27:0]),
   .ASI_reg             (`SPC5.lsu.dcs.asi_state6),
   .GSR_reg             ({`SPC5.fgu.fgd.gsr6_mask_fx4[31:0], `SPC5.fgu.fpc.gsr6_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES5.tick_cmpr_6),
   .STICK_CMPR_reg      (`PROBES5.stick_cmpr_6),
   .HSTICK_CMPR_reg     (`PROBES5.hstick_cmpr_6),
   .PSTATE_reg          (`SPC5.tlu.tsd1.arch_pstate2),
   .TL_reg              (`SPC5.tlu.trl1.tl2),
   .PIL_reg             (`SPC5.tlu.trl1.pil2),
   .TBA_reg             (`SPC5.tlu.tsd1.tba2[47:15]),
   .VER_reg             (`SPC5.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC5.exu1.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC5.exu1.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC5.exu1.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC5.exu1.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC5.exu1.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC5.exu1.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC5.tlu.trl1.rd_softint2),
   .SOFTINT_reg         (`SPC5.tlu.trl1.softint2),
   .INTR_RECEIVE_reg    (`SPC5.tlu.cth.int_rec6),
   .GL_reg              (`SPC5.tlu.tlu_gl6),
   .HPSTATE_reg         (`SPC5.tlu.tsd1.arch_hpstate2),
   .HTBA_reg            (`SPC5.tlu.tsd1.htba2[47:14]),
   .HINTP_reg           (`SPC5.tlu.trl1.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC5.lsu.dcs.p0ctxt_6[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC5.lsu.dcs.s0ctxt_6[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC5.lsu.dcs.p1ctxt_6[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC5.lsu.dcs.s1ctxt_6[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC5.lsu.dcs.wpt_mode_6[1:0],
                                   `SPC5.lsu.dcs.wpt_mask_6[7:0],
                                   `SPC5.lsu.dcs.wpt_enable_6[1:0],
                                   18'd0,
                                   `SPC5.lsu.dcs.spec_enable[6],
                                   `SPC5.lsu.dcs.dmmu_enable[6],
                                   `SPC5.lsu.dcs.immu_enable[6],
                                   `SPC5.lsu.dcs.dc_enable[6],
                                   `SPC5.lsu.dcs.ic_enable[6]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd1.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd1.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC5.lsu.dcs.watchpoint6[47:3],3'b00}),
   .DSFAR_reg                     (`SPC5.tlu.dfd.dsfar_6[47:0]),

   .Trap_Entry_1        (`PROBES5.trap_entry_1_t6),
   .Trap_Entry_2        (`PROBES5.trap_entry_2_t6),
   .Trap_Entry_3        (`PROBES5.trap_entry_3_t6),
   .Trap_Entry_4        (`PROBES5.trap_entry_4_t6),
   .Trap_Entry_5        (`PROBES5.trap_entry_5_t6),
   .Trap_Entry_6        (`PROBES5.trap_entry_6_t6),

   .exu_valid           (`PROBES5.ex_valid[6]),

   .imul_valid          (`PROBES5.imul_valid[6]),

   .fp_valid            (`PROBES5.fg_valid[6]),
   .frf_w1_valid        (`SPC5.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC5.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC5.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES5.fgu_idiv_valid[6]),

   .fdiv_valid          (`PROBES5.fgu_fdiv_valid[6]),

   .lsu_valid           (`PROBES5.lsu_valid[6]),
   .frf_w2_valid        (`SPC5.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC5.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC5.fgu.frf.w2_addr),

   .asi_valid           (`PROBES5.asi_valid_fx5[6]),
   .asi_in_progress     (`PROBES5.asi_in_progress_fx4[6]),

   .tlu_valid           (`PROBES5.tlu_valid[6])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 7
//
   
  nas_pipe5 t7 (
   .mycid               (cid),
   .mytid               (3'h7),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES5.op_7_w}),
   .PC_reg              ({`PROBES5.pc_7_w}),
   .Y_reg               (`SPC5.exu1.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC5.exu1.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC5.fgu.fac.fprs_tid7),
   .FSR_reg             (`SPC5.fgu.fad.fsr7_fx1[27:0]),
   .ASI_reg             (`SPC5.lsu.dcs.asi_state7),
   .GSR_reg             ({`SPC5.fgu.fgd.gsr7_mask_fx4[31:0], `SPC5.fgu.fpc.gsr7_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES5.tick_cmpr_7),
   .STICK_CMPR_reg      (`PROBES5.stick_cmpr_7),
   .HSTICK_CMPR_reg     (`PROBES5.hstick_cmpr_7),
   .PSTATE_reg          (`SPC5.tlu.tsd1.arch_pstate3),
   .TL_reg              (`SPC5.tlu.trl1.tl3),
   .PIL_reg             (`SPC5.tlu.trl1.pil3),
   .TBA_reg             (`SPC5.tlu.tsd1.tba3[47:15]),
   .VER_reg             (`SPC5.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC5.exu1.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC5.exu1.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC5.exu1.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC5.exu1.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC5.exu1.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC5.exu1.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC5.tlu.trl1.rd_softint3),
   .SOFTINT_reg         (`SPC5.tlu.trl1.softint3),
   .INTR_RECEIVE_reg    (`SPC5.tlu.cth.int_rec7),
   .GL_reg              (`SPC5.tlu.tlu_gl7),
   .HPSTATE_reg         (`SPC5.tlu.tsd1.arch_hpstate3),
   .HTBA_reg            (`SPC5.tlu.tsd1.htba3[47:14]),
   .HINTP_reg           (`SPC5.tlu.trl1.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC5.lsu.dcs.p0ctxt_7[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC5.lsu.dcs.s0ctxt_7[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC5.lsu.dcs.p1ctxt_7[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC5.lsu.dcs.s1ctxt_7[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC5.lsu.dcs.wpt_mode_7[1:0],
                                   `SPC5.lsu.dcs.wpt_mask_7[7:0],
                                   `SPC5.lsu.dcs.wpt_enable_7[1:0],
                                   18'd0,
                                   `SPC5.lsu.dcs.spec_enable[7],
                                   `SPC5.lsu.dcs.dmmu_enable[7],
                                   `SPC5.lsu.dcs.immu_enable[7],
                                   `SPC5.lsu.dcs.dc_enable[7],
                                   `SPC5.lsu.dcs.ic_enable[7]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd1.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC5.mmu.asd1.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC5.lsu.dcs.watchpoint7[47:3],3'b00}),
   .DSFAR_reg                     (`SPC5.tlu.dfd.dsfar_7[47:0]),

   .Trap_Entry_1        (`PROBES5.trap_entry_1_t7),
   .Trap_Entry_2        (`PROBES5.trap_entry_2_t7),
   .Trap_Entry_3        (`PROBES5.trap_entry_3_t7),
   .Trap_Entry_4        (`PROBES5.trap_entry_4_t7),
   .Trap_Entry_5        (`PROBES5.trap_entry_5_t7),
   .Trap_Entry_6        (`PROBES5.trap_entry_6_t7),

   .exu_valid           (`PROBES5.ex_valid[7]),

   .imul_valid          (`PROBES5.imul_valid[7]),

   .fp_valid            (`PROBES5.fg_valid[7]),
   .frf_w1_valid        (`SPC5.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC5.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC5.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES5.fgu_idiv_valid[7]),

   .fdiv_valid          (`PROBES5.fgu_fdiv_valid[7]),

   .lsu_valid           (`PROBES5.lsu_valid[7]),
   .frf_w2_valid        (`SPC5.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC5.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC5.fgu.frf.w2_addr),

   .asi_valid           (`PROBES5.asi_valid_fx5[7]),
   .asi_in_progress     (`PROBES5.asi_in_progress_fx4[7]),

   .tlu_valid           (`PROBES5.tlu_valid[7])
`endif
  );
				      
//----------------------------------------------------------


//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_6

module nas_core6 (

  cid
);

input [2:0] cid;

integer i;

//----------------------------------------------------------

//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//
   
  nas_pipe6 t0 (
   .mycid               (cid),
   .mytid               (3'h0),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES6.op_0_w}),
   .PC_reg              ({`PROBES6.pc_0_w}),
   .Y_reg               (`SPC6.exu0.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC6.exu0.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC6.fgu.fac.fprs_tid0),
   .FSR_reg             (`SPC6.fgu.fad.fsr0_fx1[27:0]),
   .ASI_reg             (`SPC6.lsu.dcs.asi_state0),
   .GSR_reg             ({`SPC6.fgu.fgd.gsr0_mask_fx4[31:0], `SPC6.fgu.fpc.gsr0_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES6.tick_cmpr_0),
   .STICK_CMPR_reg      (`PROBES6.stick_cmpr_0),
   .HSTICK_CMPR_reg     (`PROBES6.hstick_cmpr_0),
   .PSTATE_reg          (`SPC6.tlu.tsd0.arch_pstate0),
   .TL_reg              (`SPC6.tlu.trl0.tl0),
   .PIL_reg             (`SPC6.tlu.trl0.pil0),
   .TBA_reg             (`SPC6.tlu.tsd0.tba0[47:15]),
   .VER_reg             (`SPC6.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC6.exu0.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC6.exu0.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC6.exu0.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC6.exu0.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC6.exu0.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC6.exu0.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC6.tlu.trl0.rd_softint0),
   .SOFTINT_reg         (`SPC6.tlu.trl0.softint0),
   .INTR_RECEIVE_reg    (`SPC6.tlu.cth.int_rec0),
   .GL_reg              (`SPC6.tlu.tlu_gl0),
   .HPSTATE_reg         (`SPC6.tlu.tsd0.arch_hpstate0),
   .HTBA_reg            (`SPC6.tlu.tsd0.htba0[47:14]),
   .HINTP_reg           (`SPC6.tlu.trl0.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC6.lsu.dcs.p0ctxt_0[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC6.lsu.dcs.s0ctxt_0[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC6.lsu.dcs.p1ctxt_0[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC6.lsu.dcs.s1ctxt_0[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC6.lsu.dcs.wpt_mode_0[1:0],
                                   `SPC6.lsu.dcs.wpt_mask_0[7:0],
                                   `SPC6.lsu.dcs.wpt_enable_0[1:0],
                                   18'd0,
                                   `SPC6.lsu.dcs.spec_enable[0],
                                   `SPC6.lsu.dcs.dmmu_enable[0],
                                   `SPC6.lsu.dcs.immu_enable[0],
                                   `SPC6.lsu.dcs.dc_enable[0],
                                   `SPC6.lsu.dcs.ic_enable[0]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd0.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd0.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC6.lsu.dcs.watchpoint0[47:3],3'b00}),
   .DSFAR_reg                     (`SPC6.tlu.dfd.dsfar_0[47:0]),

   .Trap_Entry_1        (`PROBES6.trap_entry_1_t0),
   .Trap_Entry_2        (`PROBES6.trap_entry_2_t0),
   .Trap_Entry_3        (`PROBES6.trap_entry_3_t0),
   .Trap_Entry_4        (`PROBES6.trap_entry_4_t0),
   .Trap_Entry_5        (`PROBES6.trap_entry_5_t0),
   .Trap_Entry_6        (`PROBES6.trap_entry_6_t0),

   .exu_valid           (`PROBES6.ex_valid[0]),

   .imul_valid          (`PROBES6.imul_valid[0]),

   .fp_valid            (`PROBES6.fg_valid[0]),
   .frf_w1_valid        (`SPC6.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC6.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC6.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES6.fgu_idiv_valid[0]),

   .fdiv_valid          (`PROBES6.fgu_fdiv_valid[0]),

   .lsu_valid           (`PROBES6.lsu_valid[0]),
   .frf_w2_valid        (`SPC6.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC6.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC6.fgu.frf.w2_addr),

   .asi_valid           (`PROBES6.asi_valid_fx5[0]),
   .asi_in_progress     (`PROBES6.asi_in_progress_fx4[0]),

   .tlu_valid           (`PROBES6.tlu_valid[0])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 1
//
   
  nas_pipe6 t1 (
   .mycid               (cid),
   .mytid               (3'h1),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES6.op_1_w}),
   .PC_reg              ({`PROBES6.pc_1_w}),
   .Y_reg               (`SPC6.exu0.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC6.exu0.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC6.fgu.fac.fprs_tid1),
   .FSR_reg             (`SPC6.fgu.fad.fsr1_fx1[27:0]),
   .ASI_reg             (`SPC6.lsu.dcs.asi_state1),
   .GSR_reg             ({`SPC6.fgu.fgd.gsr1_mask_fx4[31:0], `SPC6.fgu.fpc.gsr1_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES6.tick_cmpr_1),
   .STICK_CMPR_reg      (`PROBES6.stick_cmpr_1),
   .HSTICK_CMPR_reg     (`PROBES6.hstick_cmpr_1),
   .PSTATE_reg          (`SPC6.tlu.tsd0.arch_pstate1),
   .TL_reg              (`SPC6.tlu.trl0.tl1),
   .PIL_reg             (`SPC6.tlu.trl0.pil1),
   .TBA_reg             (`SPC6.tlu.tsd0.tba1[47:15]),
   .VER_reg             (`SPC6.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC6.exu0.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC6.exu0.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC6.exu0.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC6.exu0.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC6.exu0.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC6.exu0.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC6.tlu.trl0.rd_softint1),
   .SOFTINT_reg         (`SPC6.tlu.trl0.softint1),
   .INTR_RECEIVE_reg    (`SPC6.tlu.cth.int_rec1),
   .GL_reg              (`SPC6.tlu.tlu_gl1),
   .HPSTATE_reg         (`SPC6.tlu.tsd0.arch_hpstate1),
   .HTBA_reg            (`SPC6.tlu.tsd0.htba1[47:14]),
   .HINTP_reg           (`SPC6.tlu.trl0.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC6.lsu.dcs.p0ctxt_1[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC6.lsu.dcs.s0ctxt_1[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC6.lsu.dcs.p1ctxt_1[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC6.lsu.dcs.s1ctxt_1[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC6.lsu.dcs.wpt_mode_1[1:0],
                                   `SPC6.lsu.dcs.wpt_mask_1[7:0],
                                   `SPC6.lsu.dcs.wpt_enable_1[1:0],
                                   18'd0,
                                   `SPC6.lsu.dcs.spec_enable[1],
                                   `SPC6.lsu.dcs.dmmu_enable[1],
                                   `SPC6.lsu.dcs.immu_enable[1],
                                   `SPC6.lsu.dcs.dc_enable[1],
                                   `SPC6.lsu.dcs.ic_enable[1]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd0.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd0.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC6.lsu.dcs.watchpoint1[47:3],3'b00}),
   .DSFAR_reg                     (`SPC6.tlu.dfd.dsfar_1[47:0]),

   .Trap_Entry_1        (`PROBES6.trap_entry_1_t1),
   .Trap_Entry_2        (`PROBES6.trap_entry_2_t1),
   .Trap_Entry_3        (`PROBES6.trap_entry_3_t1),
   .Trap_Entry_4        (`PROBES6.trap_entry_4_t1),
   .Trap_Entry_5        (`PROBES6.trap_entry_5_t1),
   .Trap_Entry_6        (`PROBES6.trap_entry_6_t1),

   .exu_valid           (`PROBES6.ex_valid[1]),

   .imul_valid          (`PROBES6.imul_valid[1]),

   .fp_valid            (`PROBES6.fg_valid[1]),
   .frf_w1_valid        (`SPC6.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC6.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC6.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES6.fgu_idiv_valid[1]),

   .fdiv_valid          (`PROBES6.fgu_fdiv_valid[1]),

   .lsu_valid           (`PROBES6.lsu_valid[1]),
   .frf_w2_valid        (`SPC6.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC6.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC6.fgu.frf.w2_addr),

   .asi_valid           (`PROBES6.asi_valid_fx5[1]),
   .asi_in_progress     (`PROBES6.asi_in_progress_fx4[1]),

   .tlu_valid           (`PROBES6.tlu_valid[1])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 2
//
   
  nas_pipe6 t2 (
   .mycid               (cid),
   .mytid               (3'h2),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES6.op_2_w}),
   .PC_reg              ({`PROBES6.pc_2_w}),
   .Y_reg               (`SPC6.exu0.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC6.exu0.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC6.fgu.fac.fprs_tid2),
   .FSR_reg             (`SPC6.fgu.fad.fsr2_fx1[27:0]),
   .ASI_reg             (`SPC6.lsu.dcs.asi_state2),
   .GSR_reg             ({`SPC6.fgu.fgd.gsr2_mask_fx4[31:0], `SPC6.fgu.fpc.gsr2_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES6.tick_cmpr_2),
   .STICK_CMPR_reg      (`PROBES6.stick_cmpr_2),
   .HSTICK_CMPR_reg     (`PROBES6.hstick_cmpr_2),
   .PSTATE_reg          (`SPC6.tlu.tsd0.arch_pstate2),
   .TL_reg              (`SPC6.tlu.trl0.tl2),
   .PIL_reg             (`SPC6.tlu.trl0.pil2),
   .TBA_reg             (`SPC6.tlu.tsd0.tba2[47:15]),
   .VER_reg             (`SPC6.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC6.exu0.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC6.exu0.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC6.exu0.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC6.exu0.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC6.exu0.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC6.exu0.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC6.tlu.trl0.rd_softint2),
   .SOFTINT_reg         (`SPC6.tlu.trl0.softint2),
   .INTR_RECEIVE_reg    (`SPC6.tlu.cth.int_rec2),
   .GL_reg              (`SPC6.tlu.tlu_gl2),
   .HPSTATE_reg         (`SPC6.tlu.tsd0.arch_hpstate2),
   .HTBA_reg            (`SPC6.tlu.tsd0.htba2[47:14]),
   .HINTP_reg           (`SPC6.tlu.trl0.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC6.lsu.dcs.p0ctxt_2[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC6.lsu.dcs.s0ctxt_2[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC6.lsu.dcs.p1ctxt_2[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC6.lsu.dcs.s1ctxt_2[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC6.lsu.dcs.wpt_mode_2[1:0],
                                   `SPC6.lsu.dcs.wpt_mask_2[7:0],
                                   `SPC6.lsu.dcs.wpt_enable_2[1:0],
                                   18'd0,
                                   `SPC6.lsu.dcs.spec_enable[2],
                                   `SPC6.lsu.dcs.dmmu_enable[2],
                                   `SPC6.lsu.dcs.immu_enable[2],
                                   `SPC6.lsu.dcs.dc_enable[2],
                                   `SPC6.lsu.dcs.ic_enable[2]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd0.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd0.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC6.lsu.dcs.watchpoint2[47:3],3'b00}),
   .DSFAR_reg                     (`SPC6.tlu.dfd.dsfar_2[47:0]),

   .Trap_Entry_1        (`PROBES6.trap_entry_1_t2),
   .Trap_Entry_2        (`PROBES6.trap_entry_2_t2),
   .Trap_Entry_3        (`PROBES6.trap_entry_3_t2),
   .Trap_Entry_4        (`PROBES6.trap_entry_4_t2),
   .Trap_Entry_5        (`PROBES6.trap_entry_5_t2),
   .Trap_Entry_6        (`PROBES6.trap_entry_6_t2),

   .exu_valid           (`PROBES6.ex_valid[2]),

   .imul_valid          (`PROBES6.imul_valid[2]),

   .fp_valid            (`PROBES6.fg_valid[2]),
   .frf_w1_valid        (`SPC6.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC6.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC6.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES6.fgu_idiv_valid[2]),

   .fdiv_valid          (`PROBES6.fgu_fdiv_valid[2]),

   .lsu_valid           (`PROBES6.lsu_valid[2]),
   .frf_w2_valid        (`SPC6.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC6.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC6.fgu.frf.w2_addr),

   .asi_valid           (`PROBES6.asi_valid_fx5[2]),
   .asi_in_progress     (`PROBES6.asi_in_progress_fx4[2]),

   .tlu_valid           (`PROBES6.tlu_valid[2])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 3
//
   
  nas_pipe6 t3 (
   .mycid               (cid),
   .mytid               (3'h3),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES6.op_3_w}),
   .PC_reg              ({`PROBES6.pc_3_w}),
   .Y_reg               (`SPC6.exu0.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC6.exu0.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC6.fgu.fac.fprs_tid3),
   .FSR_reg             (`SPC6.fgu.fad.fsr3_fx1[27:0]),
   .ASI_reg             (`SPC6.lsu.dcs.asi_state3),
   .GSR_reg             ({`SPC6.fgu.fgd.gsr3_mask_fx4[31:0], `SPC6.fgu.fpc.gsr3_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES6.tick_cmpr_3),
   .STICK_CMPR_reg      (`PROBES6.stick_cmpr_3),
   .HSTICK_CMPR_reg     (`PROBES6.hstick_cmpr_3),
   .PSTATE_reg          (`SPC6.tlu.tsd0.arch_pstate3),
   .TL_reg              (`SPC6.tlu.trl0.tl3),
   .PIL_reg             (`SPC6.tlu.trl0.pil3),
   .TBA_reg             (`SPC6.tlu.tsd0.tba3[47:15]),
   .VER_reg             (`SPC6.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC6.exu0.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC6.exu0.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC6.exu0.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC6.exu0.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC6.exu0.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC6.exu0.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC6.tlu.trl0.rd_softint3),
   .SOFTINT_reg         (`SPC6.tlu.trl0.softint3),
   .INTR_RECEIVE_reg    (`SPC6.tlu.cth.int_rec3),
   .GL_reg              (`SPC6.tlu.tlu_gl3),
   .HPSTATE_reg         (`SPC6.tlu.tsd0.arch_hpstate3),
   .HTBA_reg            (`SPC6.tlu.tsd0.htba3[47:14]),
   .HINTP_reg           (`SPC6.tlu.trl0.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC6.lsu.dcs.p0ctxt_3[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC6.lsu.dcs.s0ctxt_3[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC6.lsu.dcs.p1ctxt_3[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC6.lsu.dcs.s1ctxt_3[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC6.lsu.dcs.wpt_mode_3[1:0],
                                   `SPC6.lsu.dcs.wpt_mask_3[7:0],
                                   `SPC6.lsu.dcs.wpt_enable_3[1:0],
                                   18'd0,
                                   `SPC6.lsu.dcs.spec_enable[3],
                                   `SPC6.lsu.dcs.dmmu_enable[3],
                                   `SPC6.lsu.dcs.immu_enable[3],
                                   `SPC6.lsu.dcs.dc_enable[3],
                                   `SPC6.lsu.dcs.ic_enable[3]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd0.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd0.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC6.lsu.dcs.watchpoint3[47:3],3'b00}),
   .DSFAR_reg                     (`SPC6.tlu.dfd.dsfar_3[47:0]),

   .Trap_Entry_1        (`PROBES6.trap_entry_1_t3),
   .Trap_Entry_2        (`PROBES6.trap_entry_2_t3),
   .Trap_Entry_3        (`PROBES6.trap_entry_3_t3),
   .Trap_Entry_4        (`PROBES6.trap_entry_4_t3),
   .Trap_Entry_5        (`PROBES6.trap_entry_5_t3),
   .Trap_Entry_6        (`PROBES6.trap_entry_6_t3),

   .exu_valid           (`PROBES6.ex_valid[3]),

   .imul_valid          (`PROBES6.imul_valid[3]),

   .fp_valid            (`PROBES6.fg_valid[3]),
   .frf_w1_valid        (`SPC6.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC6.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC6.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES6.fgu_idiv_valid[3]),

   .fdiv_valid          (`PROBES6.fgu_fdiv_valid[3]),

   .lsu_valid           (`PROBES6.lsu_valid[3]),
   .frf_w2_valid        (`SPC6.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC6.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC6.fgu.frf.w2_addr),

   .asi_valid           (`PROBES6.asi_valid_fx5[3]),
   .asi_in_progress     (`PROBES6.asi_in_progress_fx4[3]),

   .tlu_valid           (`PROBES6.tlu_valid[3])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 4
//
   
  nas_pipe6 t4 (
   .mycid               (cid),
   .mytid               (3'h4),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES6.op_4_w}),
   .PC_reg              ({`PROBES6.pc_4_w}),
   .Y_reg               (`SPC6.exu1.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC6.exu1.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC6.fgu.fac.fprs_tid4),
   .FSR_reg             (`SPC6.fgu.fad.fsr4_fx1[27:0]),
   .ASI_reg             (`SPC6.lsu.dcs.asi_state4),
   .GSR_reg             ({`SPC6.fgu.fgd.gsr4_mask_fx4[31:0], `SPC6.fgu.fpc.gsr4_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES6.tick_cmpr_4),
   .STICK_CMPR_reg      (`PROBES6.stick_cmpr_4),
   .HSTICK_CMPR_reg     (`PROBES6.hstick_cmpr_4),
   .PSTATE_reg          (`SPC6.tlu.tsd1.arch_pstate0),
   .TL_reg              (`SPC6.tlu.trl1.tl0),
   .PIL_reg             (`SPC6.tlu.trl1.pil0),
   .TBA_reg             (`SPC6.tlu.tsd1.tba0[47:15]),
   .VER_reg             (`SPC6.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC6.exu1.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC6.exu1.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC6.exu1.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC6.exu1.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC6.exu1.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC6.exu1.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC6.tlu.trl1.rd_softint0),
   .SOFTINT_reg         (`SPC6.tlu.trl1.softint0),
   .INTR_RECEIVE_reg    (`SPC6.tlu.cth.int_rec4),
   .GL_reg              (`SPC6.tlu.tlu_gl4),
   .HPSTATE_reg         (`SPC6.tlu.tsd1.arch_hpstate0),
   .HTBA_reg            (`SPC6.tlu.tsd1.htba0[47:14]),
   .HINTP_reg           (`SPC6.tlu.trl1.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC6.lsu.dcs.p0ctxt_4[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC6.lsu.dcs.s0ctxt_4[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC6.lsu.dcs.p1ctxt_4[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC6.lsu.dcs.s1ctxt_4[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC6.lsu.dcs.wpt_mode_4[1:0],
                                   `SPC6.lsu.dcs.wpt_mask_4[7:0],
                                   `SPC6.lsu.dcs.wpt_enable_4[1:0],
                                   18'd0,
                                   `SPC6.lsu.dcs.spec_enable[4],
                                   `SPC6.lsu.dcs.dmmu_enable[4],
                                   `SPC6.lsu.dcs.immu_enable[4],
                                   `SPC6.lsu.dcs.dc_enable[4],
                                   `SPC6.lsu.dcs.ic_enable[4]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd1.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd1.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC6.lsu.dcs.watchpoint4[47:3],3'b00}),
   .DSFAR_reg                     (`SPC6.tlu.dfd.dsfar_4[47:0]),

   .Trap_Entry_1        (`PROBES6.trap_entry_1_t4),
   .Trap_Entry_2        (`PROBES6.trap_entry_2_t4),
   .Trap_Entry_3        (`PROBES6.trap_entry_3_t4),
   .Trap_Entry_4        (`PROBES6.trap_entry_4_t4),
   .Trap_Entry_5        (`PROBES6.trap_entry_5_t4),
   .Trap_Entry_6        (`PROBES6.trap_entry_6_t4),

   .exu_valid           (`PROBES6.ex_valid[4]),

   .imul_valid          (`PROBES6.imul_valid[4]),

   .fp_valid            (`PROBES6.fg_valid[4]),
   .frf_w1_valid        (`SPC6.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC6.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC6.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES6.fgu_idiv_valid[4]),

   .fdiv_valid          (`PROBES6.fgu_fdiv_valid[4]),

   .lsu_valid           (`PROBES6.lsu_valid[4]),
   .frf_w2_valid        (`SPC6.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC6.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC6.fgu.frf.w2_addr),

   .asi_valid           (`PROBES6.asi_valid_fx5[4]),
   .asi_in_progress     (`PROBES6.asi_in_progress_fx4[4]),

   .tlu_valid           (`PROBES6.tlu_valid[4])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 5
//
   
  nas_pipe6 t5 (
   .mycid               (cid),
   .mytid               (3'h5),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES6.op_5_w}),
   .PC_reg              ({`PROBES6.pc_5_w}),
   .Y_reg               (`SPC6.exu1.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC6.exu1.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC6.fgu.fac.fprs_tid5),
   .FSR_reg             (`SPC6.fgu.fad.fsr5_fx1[27:0]),
   .ASI_reg             (`SPC6.lsu.dcs.asi_state5),
   .GSR_reg             ({`SPC6.fgu.fgd.gsr5_mask_fx4[31:0], `SPC6.fgu.fpc.gsr5_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES6.tick_cmpr_5),
   .STICK_CMPR_reg      (`PROBES6.stick_cmpr_5),
   .HSTICK_CMPR_reg     (`PROBES6.hstick_cmpr_5),
   .PSTATE_reg          (`SPC6.tlu.tsd1.arch_pstate1),
   .TL_reg              (`SPC6.tlu.trl1.tl1),
   .PIL_reg             (`SPC6.tlu.trl1.pil1),
   .TBA_reg             (`SPC6.tlu.tsd1.tba1[47:15]),
   .VER_reg             (`SPC6.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC6.exu1.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC6.exu1.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC6.exu1.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC6.exu1.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC6.exu1.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC6.exu1.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC6.tlu.trl1.rd_softint1),
   .SOFTINT_reg         (`SPC6.tlu.trl1.softint1),
   .INTR_RECEIVE_reg    (`SPC6.tlu.cth.int_rec5),
   .GL_reg              (`SPC6.tlu.tlu_gl5),
   .HPSTATE_reg         (`SPC6.tlu.tsd1.arch_hpstate1),
   .HTBA_reg            (`SPC6.tlu.tsd1.htba1[47:14]),
   .HINTP_reg           (`SPC6.tlu.trl1.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC6.lsu.dcs.p0ctxt_5[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC6.lsu.dcs.s0ctxt_5[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC6.lsu.dcs.p1ctxt_5[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC6.lsu.dcs.s1ctxt_5[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC6.lsu.dcs.wpt_mode_5[1:0],
                                   `SPC6.lsu.dcs.wpt_mask_5[7:0],
                                   `SPC6.lsu.dcs.wpt_enable_5[1:0],
                                   18'd0,
                                   `SPC6.lsu.dcs.spec_enable[5],
                                   `SPC6.lsu.dcs.dmmu_enable[5],
                                   `SPC6.lsu.dcs.immu_enable[5],
                                   `SPC6.lsu.dcs.dc_enable[5],
                                   `SPC6.lsu.dcs.ic_enable[5]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd1.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd1.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC6.lsu.dcs.watchpoint5[47:3],3'b00}),
   .DSFAR_reg                     (`SPC6.tlu.dfd.dsfar_5[47:0]),

   .Trap_Entry_1        (`PROBES6.trap_entry_1_t5),
   .Trap_Entry_2        (`PROBES6.trap_entry_2_t5),
   .Trap_Entry_3        (`PROBES6.trap_entry_3_t5),
   .Trap_Entry_4        (`PROBES6.trap_entry_4_t5),
   .Trap_Entry_5        (`PROBES6.trap_entry_5_t5),
   .Trap_Entry_6        (`PROBES6.trap_entry_6_t5),

   .exu_valid           (`PROBES6.ex_valid[5]),

   .imul_valid          (`PROBES6.imul_valid[5]),

   .fp_valid            (`PROBES6.fg_valid[5]),
   .frf_w1_valid        (`SPC6.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC6.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC6.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES6.fgu_idiv_valid[5]),

   .fdiv_valid          (`PROBES6.fgu_fdiv_valid[5]),

   .lsu_valid           (`PROBES6.lsu_valid[5]),
   .frf_w2_valid        (`SPC6.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC6.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC6.fgu.frf.w2_addr),

   .asi_valid           (`PROBES6.asi_valid_fx5[5]),
   .asi_in_progress     (`PROBES6.asi_in_progress_fx4[5]),

   .tlu_valid           (`PROBES6.tlu_valid[5])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 6
//
   
  nas_pipe6 t6 (
   .mycid               (cid),
   .mytid               (3'h6),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES6.op_6_w}),
   .PC_reg              ({`PROBES6.pc_6_w}),
   .Y_reg               (`SPC6.exu1.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC6.exu1.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC6.fgu.fac.fprs_tid6),
   .FSR_reg             (`SPC6.fgu.fad.fsr6_fx1[27:0]),
   .ASI_reg             (`SPC6.lsu.dcs.asi_state6),
   .GSR_reg             ({`SPC6.fgu.fgd.gsr6_mask_fx4[31:0], `SPC6.fgu.fpc.gsr6_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES6.tick_cmpr_6),
   .STICK_CMPR_reg      (`PROBES6.stick_cmpr_6),
   .HSTICK_CMPR_reg     (`PROBES6.hstick_cmpr_6),
   .PSTATE_reg          (`SPC6.tlu.tsd1.arch_pstate2),
   .TL_reg              (`SPC6.tlu.trl1.tl2),
   .PIL_reg             (`SPC6.tlu.trl1.pil2),
   .TBA_reg             (`SPC6.tlu.tsd1.tba2[47:15]),
   .VER_reg             (`SPC6.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC6.exu1.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC6.exu1.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC6.exu1.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC6.exu1.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC6.exu1.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC6.exu1.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC6.tlu.trl1.rd_softint2),
   .SOFTINT_reg         (`SPC6.tlu.trl1.softint2),
   .INTR_RECEIVE_reg    (`SPC6.tlu.cth.int_rec6),
   .GL_reg              (`SPC6.tlu.tlu_gl6),
   .HPSTATE_reg         (`SPC6.tlu.tsd1.arch_hpstate2),
   .HTBA_reg            (`SPC6.tlu.tsd1.htba2[47:14]),
   .HINTP_reg           (`SPC6.tlu.trl1.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC6.lsu.dcs.p0ctxt_6[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC6.lsu.dcs.s0ctxt_6[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC6.lsu.dcs.p1ctxt_6[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC6.lsu.dcs.s1ctxt_6[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC6.lsu.dcs.wpt_mode_6[1:0],
                                   `SPC6.lsu.dcs.wpt_mask_6[7:0],
                                   `SPC6.lsu.dcs.wpt_enable_6[1:0],
                                   18'd0,
                                   `SPC6.lsu.dcs.spec_enable[6],
                                   `SPC6.lsu.dcs.dmmu_enable[6],
                                   `SPC6.lsu.dcs.immu_enable[6],
                                   `SPC6.lsu.dcs.dc_enable[6],
                                   `SPC6.lsu.dcs.ic_enable[6]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd1.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd1.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC6.lsu.dcs.watchpoint6[47:3],3'b00}),
   .DSFAR_reg                     (`SPC6.tlu.dfd.dsfar_6[47:0]),

   .Trap_Entry_1        (`PROBES6.trap_entry_1_t6),
   .Trap_Entry_2        (`PROBES6.trap_entry_2_t6),
   .Trap_Entry_3        (`PROBES6.trap_entry_3_t6),
   .Trap_Entry_4        (`PROBES6.trap_entry_4_t6),
   .Trap_Entry_5        (`PROBES6.trap_entry_5_t6),
   .Trap_Entry_6        (`PROBES6.trap_entry_6_t6),

   .exu_valid           (`PROBES6.ex_valid[6]),

   .imul_valid          (`PROBES6.imul_valid[6]),

   .fp_valid            (`PROBES6.fg_valid[6]),
   .frf_w1_valid        (`SPC6.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC6.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC6.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES6.fgu_idiv_valid[6]),

   .fdiv_valid          (`PROBES6.fgu_fdiv_valid[6]),

   .lsu_valid           (`PROBES6.lsu_valid[6]),
   .frf_w2_valid        (`SPC6.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC6.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC6.fgu.frf.w2_addr),

   .asi_valid           (`PROBES6.asi_valid_fx5[6]),
   .asi_in_progress     (`PROBES6.asi_in_progress_fx4[6]),

   .tlu_valid           (`PROBES6.tlu_valid[6])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 7
//
   
  nas_pipe6 t7 (
   .mycid               (cid),
   .mytid               (3'h7),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES6.op_7_w}),
   .PC_reg              ({`PROBES6.pc_7_w}),
   .Y_reg               (`SPC6.exu1.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC6.exu1.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC6.fgu.fac.fprs_tid7),
   .FSR_reg             (`SPC6.fgu.fad.fsr7_fx1[27:0]),
   .ASI_reg             (`SPC6.lsu.dcs.asi_state7),
   .GSR_reg             ({`SPC6.fgu.fgd.gsr7_mask_fx4[31:0], `SPC6.fgu.fpc.gsr7_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES6.tick_cmpr_7),
   .STICK_CMPR_reg      (`PROBES6.stick_cmpr_7),
   .HSTICK_CMPR_reg     (`PROBES6.hstick_cmpr_7),
   .PSTATE_reg          (`SPC6.tlu.tsd1.arch_pstate3),
   .TL_reg              (`SPC6.tlu.trl1.tl3),
   .PIL_reg             (`SPC6.tlu.trl1.pil3),
   .TBA_reg             (`SPC6.tlu.tsd1.tba3[47:15]),
   .VER_reg             (`SPC6.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC6.exu1.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC6.exu1.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC6.exu1.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC6.exu1.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC6.exu1.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC6.exu1.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC6.tlu.trl1.rd_softint3),
   .SOFTINT_reg         (`SPC6.tlu.trl1.softint3),
   .INTR_RECEIVE_reg    (`SPC6.tlu.cth.int_rec7),
   .GL_reg              (`SPC6.tlu.tlu_gl7),
   .HPSTATE_reg         (`SPC6.tlu.tsd1.arch_hpstate3),
   .HTBA_reg            (`SPC6.tlu.tsd1.htba3[47:14]),
   .HINTP_reg           (`SPC6.tlu.trl1.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC6.lsu.dcs.p0ctxt_7[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC6.lsu.dcs.s0ctxt_7[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC6.lsu.dcs.p1ctxt_7[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC6.lsu.dcs.s1ctxt_7[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC6.lsu.dcs.wpt_mode_7[1:0],
                                   `SPC6.lsu.dcs.wpt_mask_7[7:0],
                                   `SPC6.lsu.dcs.wpt_enable_7[1:0],
                                   18'd0,
                                   `SPC6.lsu.dcs.spec_enable[7],
                                   `SPC6.lsu.dcs.dmmu_enable[7],
                                   `SPC6.lsu.dcs.immu_enable[7],
                                   `SPC6.lsu.dcs.dc_enable[7],
                                   `SPC6.lsu.dcs.ic_enable[7]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd1.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC6.mmu.asd1.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC6.lsu.dcs.watchpoint7[47:3],3'b00}),
   .DSFAR_reg                     (`SPC6.tlu.dfd.dsfar_7[47:0]),

   .Trap_Entry_1        (`PROBES6.trap_entry_1_t7),
   .Trap_Entry_2        (`PROBES6.trap_entry_2_t7),
   .Trap_Entry_3        (`PROBES6.trap_entry_3_t7),
   .Trap_Entry_4        (`PROBES6.trap_entry_4_t7),
   .Trap_Entry_5        (`PROBES6.trap_entry_5_t7),
   .Trap_Entry_6        (`PROBES6.trap_entry_6_t7),

   .exu_valid           (`PROBES6.ex_valid[7]),

   .imul_valid          (`PROBES6.imul_valid[7]),

   .fp_valid            (`PROBES6.fg_valid[7]),
   .frf_w1_valid        (`SPC6.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC6.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC6.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES6.fgu_idiv_valid[7]),

   .fdiv_valid          (`PROBES6.fgu_fdiv_valid[7]),

   .lsu_valid           (`PROBES6.lsu_valid[7]),
   .frf_w2_valid        (`SPC6.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC6.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC6.fgu.frf.w2_addr),

   .asi_valid           (`PROBES6.asi_valid_fx5[7]),
   .asi_in_progress     (`PROBES6.asi_in_progress_fx4[7]),

   .tlu_valid           (`PROBES6.tlu_valid[7])
`endif
  );
				      
//----------------------------------------------------------


//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_7

module nas_core7 (

  cid
);

input [2:0] cid;

integer i;

//----------------------------------------------------------

//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//
   
  nas_pipe7 t0 (
   .mycid               (cid),
   .mytid               (3'h0),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES7.op_0_w}),
   .PC_reg              ({`PROBES7.pc_0_w}),
   .Y_reg               (`SPC7.exu0.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC7.exu0.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC7.fgu.fac.fprs_tid0),
   .FSR_reg             (`SPC7.fgu.fad.fsr0_fx1[27:0]),
   .ASI_reg             (`SPC7.lsu.dcs.asi_state0),
   .GSR_reg             ({`SPC7.fgu.fgd.gsr0_mask_fx4[31:0], `SPC7.fgu.fpc.gsr0_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES7.tick_cmpr_0),
   .STICK_CMPR_reg      (`PROBES7.stick_cmpr_0),
   .HSTICK_CMPR_reg     (`PROBES7.hstick_cmpr_0),
   .PSTATE_reg          (`SPC7.tlu.tsd0.arch_pstate0),
   .TL_reg              (`SPC7.tlu.trl0.tl0),
   .PIL_reg             (`SPC7.tlu.trl0.pil0),
   .TBA_reg             (`SPC7.tlu.tsd0.tba0[47:15]),
   .VER_reg             (`SPC7.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC7.exu0.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC7.exu0.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC7.exu0.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC7.exu0.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC7.exu0.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC7.exu0.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC7.tlu.trl0.rd_softint0),
   .SOFTINT_reg         (`SPC7.tlu.trl0.softint0),
   .INTR_RECEIVE_reg    (`SPC7.tlu.cth.int_rec0),
   .GL_reg              (`SPC7.tlu.tlu_gl0),
   .HPSTATE_reg         (`SPC7.tlu.tsd0.arch_hpstate0),
   .HTBA_reg            (`SPC7.tlu.tsd0.htba0[47:14]),
   .HINTP_reg           (`SPC7.tlu.trl0.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC7.lsu.dcs.p0ctxt_0[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC7.lsu.dcs.s0ctxt_0[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC7.lsu.dcs.p1ctxt_0[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC7.lsu.dcs.s1ctxt_0[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC7.lsu.dcs.wpt_mode_0[1:0],
                                   `SPC7.lsu.dcs.wpt_mask_0[7:0],
                                   `SPC7.lsu.dcs.wpt_enable_0[1:0],
                                   18'd0,
                                   `SPC7.lsu.dcs.spec_enable[0],
                                   `SPC7.lsu.dcs.dmmu_enable[0],
                                   `SPC7.lsu.dcs.immu_enable[0],
                                   `SPC7.lsu.dcs.dc_enable[0],
                                   `SPC7.lsu.dcs.ic_enable[0]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd0.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd0.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC7.lsu.dcs.watchpoint0[47:3],3'b00}),
   .DSFAR_reg                     (`SPC7.tlu.dfd.dsfar_0[47:0]),

   .Trap_Entry_1        (`PROBES7.trap_entry_1_t0),
   .Trap_Entry_2        (`PROBES7.trap_entry_2_t0),
   .Trap_Entry_3        (`PROBES7.trap_entry_3_t0),
   .Trap_Entry_4        (`PROBES7.trap_entry_4_t0),
   .Trap_Entry_5        (`PROBES7.trap_entry_5_t0),
   .Trap_Entry_6        (`PROBES7.trap_entry_6_t0),

   .exu_valid           (`PROBES7.ex_valid[0]),

   .imul_valid          (`PROBES7.imul_valid[0]),

   .fp_valid            (`PROBES7.fg_valid[0]),
   .frf_w1_valid        (`SPC7.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC7.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC7.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES7.fgu_idiv_valid[0]),

   .fdiv_valid          (`PROBES7.fgu_fdiv_valid[0]),

   .lsu_valid           (`PROBES7.lsu_valid[0]),
   .frf_w2_valid        (`SPC7.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC7.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC7.fgu.frf.w2_addr),

   .asi_valid           (`PROBES7.asi_valid_fx5[0]),
   .asi_in_progress     (`PROBES7.asi_in_progress_fx4[0]),

   .tlu_valid           (`PROBES7.tlu_valid[0])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 1
//
   
  nas_pipe7 t1 (
   .mycid               (cid),
   .mytid               (3'h1),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES7.op_1_w}),
   .PC_reg              ({`PROBES7.pc_1_w}),
   .Y_reg               (`SPC7.exu0.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC7.exu0.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC7.fgu.fac.fprs_tid1),
   .FSR_reg             (`SPC7.fgu.fad.fsr1_fx1[27:0]),
   .ASI_reg             (`SPC7.lsu.dcs.asi_state1),
   .GSR_reg             ({`SPC7.fgu.fgd.gsr1_mask_fx4[31:0], `SPC7.fgu.fpc.gsr1_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES7.tick_cmpr_1),
   .STICK_CMPR_reg      (`PROBES7.stick_cmpr_1),
   .HSTICK_CMPR_reg     (`PROBES7.hstick_cmpr_1),
   .PSTATE_reg          (`SPC7.tlu.tsd0.arch_pstate1),
   .TL_reg              (`SPC7.tlu.trl0.tl1),
   .PIL_reg             (`SPC7.tlu.trl0.pil1),
   .TBA_reg             (`SPC7.tlu.tsd0.tba1[47:15]),
   .VER_reg             (`SPC7.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC7.exu0.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC7.exu0.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC7.exu0.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC7.exu0.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC7.exu0.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC7.exu0.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC7.tlu.trl0.rd_softint1),
   .SOFTINT_reg         (`SPC7.tlu.trl0.softint1),
   .INTR_RECEIVE_reg    (`SPC7.tlu.cth.int_rec1),
   .GL_reg              (`SPC7.tlu.tlu_gl1),
   .HPSTATE_reg         (`SPC7.tlu.tsd0.arch_hpstate1),
   .HTBA_reg            (`SPC7.tlu.tsd0.htba1[47:14]),
   .HINTP_reg           (`SPC7.tlu.trl0.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC7.lsu.dcs.p0ctxt_1[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC7.lsu.dcs.s0ctxt_1[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC7.lsu.dcs.p1ctxt_1[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC7.lsu.dcs.s1ctxt_1[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC7.lsu.dcs.wpt_mode_1[1:0],
                                   `SPC7.lsu.dcs.wpt_mask_1[7:0],
                                   `SPC7.lsu.dcs.wpt_enable_1[1:0],
                                   18'd0,
                                   `SPC7.lsu.dcs.spec_enable[1],
                                   `SPC7.lsu.dcs.dmmu_enable[1],
                                   `SPC7.lsu.dcs.immu_enable[1],
                                   `SPC7.lsu.dcs.dc_enable[1],
                                   `SPC7.lsu.dcs.ic_enable[1]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd0.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd0.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC7.lsu.dcs.watchpoint1[47:3],3'b00}),
   .DSFAR_reg                     (`SPC7.tlu.dfd.dsfar_1[47:0]),

   .Trap_Entry_1        (`PROBES7.trap_entry_1_t1),
   .Trap_Entry_2        (`PROBES7.trap_entry_2_t1),
   .Trap_Entry_3        (`PROBES7.trap_entry_3_t1),
   .Trap_Entry_4        (`PROBES7.trap_entry_4_t1),
   .Trap_Entry_5        (`PROBES7.trap_entry_5_t1),
   .Trap_Entry_6        (`PROBES7.trap_entry_6_t1),

   .exu_valid           (`PROBES7.ex_valid[1]),

   .imul_valid          (`PROBES7.imul_valid[1]),

   .fp_valid            (`PROBES7.fg_valid[1]),
   .frf_w1_valid        (`SPC7.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC7.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC7.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES7.fgu_idiv_valid[1]),

   .fdiv_valid          (`PROBES7.fgu_fdiv_valid[1]),

   .lsu_valid           (`PROBES7.lsu_valid[1]),
   .frf_w2_valid        (`SPC7.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC7.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC7.fgu.frf.w2_addr),

   .asi_valid           (`PROBES7.asi_valid_fx5[1]),
   .asi_in_progress     (`PROBES7.asi_in_progress_fx4[1]),

   .tlu_valid           (`PROBES7.tlu_valid[1])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 2
//
   
  nas_pipe7 t2 (
   .mycid               (cid),
   .mytid               (3'h2),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES7.op_2_w}),
   .PC_reg              ({`PROBES7.pc_2_w}),
   .Y_reg               (`SPC7.exu0.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC7.exu0.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC7.fgu.fac.fprs_tid2),
   .FSR_reg             (`SPC7.fgu.fad.fsr2_fx1[27:0]),
   .ASI_reg             (`SPC7.lsu.dcs.asi_state2),
   .GSR_reg             ({`SPC7.fgu.fgd.gsr2_mask_fx4[31:0], `SPC7.fgu.fpc.gsr2_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES7.tick_cmpr_2),
   .STICK_CMPR_reg      (`PROBES7.stick_cmpr_2),
   .HSTICK_CMPR_reg     (`PROBES7.hstick_cmpr_2),
   .PSTATE_reg          (`SPC7.tlu.tsd0.arch_pstate2),
   .TL_reg              (`SPC7.tlu.trl0.tl2),
   .PIL_reg             (`SPC7.tlu.trl0.pil2),
   .TBA_reg             (`SPC7.tlu.tsd0.tba2[47:15]),
   .VER_reg             (`SPC7.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC7.exu0.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC7.exu0.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC7.exu0.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC7.exu0.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC7.exu0.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC7.exu0.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC7.tlu.trl0.rd_softint2),
   .SOFTINT_reg         (`SPC7.tlu.trl0.softint2),
   .INTR_RECEIVE_reg    (`SPC7.tlu.cth.int_rec2),
   .GL_reg              (`SPC7.tlu.tlu_gl2),
   .HPSTATE_reg         (`SPC7.tlu.tsd0.arch_hpstate2),
   .HTBA_reg            (`SPC7.tlu.tsd0.htba2[47:14]),
   .HINTP_reg           (`SPC7.tlu.trl0.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC7.lsu.dcs.p0ctxt_2[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC7.lsu.dcs.s0ctxt_2[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC7.lsu.dcs.p1ctxt_2[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC7.lsu.dcs.s1ctxt_2[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC7.lsu.dcs.wpt_mode_2[1:0],
                                   `SPC7.lsu.dcs.wpt_mask_2[7:0],
                                   `SPC7.lsu.dcs.wpt_enable_2[1:0],
                                   18'd0,
                                   `SPC7.lsu.dcs.spec_enable[2],
                                   `SPC7.lsu.dcs.dmmu_enable[2],
                                   `SPC7.lsu.dcs.immu_enable[2],
                                   `SPC7.lsu.dcs.dc_enable[2],
                                   `SPC7.lsu.dcs.ic_enable[2]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd0.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd0.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC7.lsu.dcs.watchpoint2[47:3],3'b00}),
   .DSFAR_reg                     (`SPC7.tlu.dfd.dsfar_2[47:0]),

   .Trap_Entry_1        (`PROBES7.trap_entry_1_t2),
   .Trap_Entry_2        (`PROBES7.trap_entry_2_t2),
   .Trap_Entry_3        (`PROBES7.trap_entry_3_t2),
   .Trap_Entry_4        (`PROBES7.trap_entry_4_t2),
   .Trap_Entry_5        (`PROBES7.trap_entry_5_t2),
   .Trap_Entry_6        (`PROBES7.trap_entry_6_t2),

   .exu_valid           (`PROBES7.ex_valid[2]),

   .imul_valid          (`PROBES7.imul_valid[2]),

   .fp_valid            (`PROBES7.fg_valid[2]),
   .frf_w1_valid        (`SPC7.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC7.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC7.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES7.fgu_idiv_valid[2]),

   .fdiv_valid          (`PROBES7.fgu_fdiv_valid[2]),

   .lsu_valid           (`PROBES7.lsu_valid[2]),
   .frf_w2_valid        (`SPC7.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC7.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC7.fgu.frf.w2_addr),

   .asi_valid           (`PROBES7.asi_valid_fx5[2]),
   .asi_in_progress     (`PROBES7.asi_in_progress_fx4[2]),

   .tlu_valid           (`PROBES7.tlu_valid[2])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 3
//
   
  nas_pipe7 t3 (
   .mycid               (cid),
   .mytid               (3'h3),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES7.op_3_w}),
   .PC_reg              ({`PROBES7.pc_3_w}),
   .Y_reg               (`SPC7.exu0.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC7.exu0.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC7.fgu.fac.fprs_tid3),
   .FSR_reg             (`SPC7.fgu.fad.fsr3_fx1[27:0]),
   .ASI_reg             (`SPC7.lsu.dcs.asi_state3),
   .GSR_reg             ({`SPC7.fgu.fgd.gsr3_mask_fx4[31:0], `SPC7.fgu.fpc.gsr3_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES7.tick_cmpr_3),
   .STICK_CMPR_reg      (`PROBES7.stick_cmpr_3),
   .HSTICK_CMPR_reg     (`PROBES7.hstick_cmpr_3),
   .PSTATE_reg          (`SPC7.tlu.tsd0.arch_pstate3),
   .TL_reg              (`SPC7.tlu.trl0.tl3),
   .PIL_reg             (`SPC7.tlu.trl0.pil3),
   .TBA_reg             (`SPC7.tlu.tsd0.tba3[47:15]),
   .VER_reg             (`SPC7.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC7.exu0.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC7.exu0.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC7.exu0.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC7.exu0.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC7.exu0.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC7.exu0.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC7.tlu.trl0.rd_softint3),
   .SOFTINT_reg         (`SPC7.tlu.trl0.softint3),
   .INTR_RECEIVE_reg    (`SPC7.tlu.cth.int_rec3),
   .GL_reg              (`SPC7.tlu.tlu_gl3),
   .HPSTATE_reg         (`SPC7.tlu.tsd0.arch_hpstate3),
   .HTBA_reg            (`SPC7.tlu.tsd0.htba3[47:14]),
   .HINTP_reg           (`SPC7.tlu.trl0.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC7.lsu.dcs.p0ctxt_3[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC7.lsu.dcs.s0ctxt_3[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC7.lsu.dcs.p1ctxt_3[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC7.lsu.dcs.s1ctxt_3[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC7.lsu.dcs.wpt_mode_3[1:0],
                                   `SPC7.lsu.dcs.wpt_mask_3[7:0],
                                   `SPC7.lsu.dcs.wpt_enable_3[1:0],
                                   18'd0,
                                   `SPC7.lsu.dcs.spec_enable[3],
                                   `SPC7.lsu.dcs.dmmu_enable[3],
                                   `SPC7.lsu.dcs.immu_enable[3],
                                   `SPC7.lsu.dcs.dc_enable[3],
                                   `SPC7.lsu.dcs.ic_enable[3]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd0.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd0.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC7.lsu.dcs.watchpoint3[47:3],3'b00}),
   .DSFAR_reg                     (`SPC7.tlu.dfd.dsfar_3[47:0]),

   .Trap_Entry_1        (`PROBES7.trap_entry_1_t3),
   .Trap_Entry_2        (`PROBES7.trap_entry_2_t3),
   .Trap_Entry_3        (`PROBES7.trap_entry_3_t3),
   .Trap_Entry_4        (`PROBES7.trap_entry_4_t3),
   .Trap_Entry_5        (`PROBES7.trap_entry_5_t3),
   .Trap_Entry_6        (`PROBES7.trap_entry_6_t3),

   .exu_valid           (`PROBES7.ex_valid[3]),

   .imul_valid          (`PROBES7.imul_valid[3]),

   .fp_valid            (`PROBES7.fg_valid[3]),
   .frf_w1_valid        (`SPC7.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC7.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC7.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES7.fgu_idiv_valid[3]),

   .fdiv_valid          (`PROBES7.fgu_fdiv_valid[3]),

   .lsu_valid           (`PROBES7.lsu_valid[3]),
   .frf_w2_valid        (`SPC7.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC7.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC7.fgu.frf.w2_addr),

   .asi_valid           (`PROBES7.asi_valid_fx5[3]),
   .asi_in_progress     (`PROBES7.asi_in_progress_fx4[3]),

   .tlu_valid           (`PROBES7.tlu_valid[3])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 4
//
   
  nas_pipe7 t4 (
   .mycid               (cid),
   .mytid               (3'h4),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES7.op_4_w}),
   .PC_reg              ({`PROBES7.pc_4_w}),
   .Y_reg               (`SPC7.exu1.rml.arch_yreg_tid0_ff),
   .CCR_reg             (`SPC7.exu1.ect.arch_ccr_tid0_lth),
   .FPRS_reg            (`SPC7.fgu.fac.fprs_tid4),
   .FSR_reg             (`SPC7.fgu.fad.fsr4_fx1[27:0]),
   .ASI_reg             (`SPC7.lsu.dcs.asi_state4),
   .GSR_reg             ({`SPC7.fgu.fgd.gsr4_mask_fx4[31:0], `SPC7.fgu.fpc.gsr4_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES7.tick_cmpr_4),
   .STICK_CMPR_reg      (`PROBES7.stick_cmpr_4),
   .HSTICK_CMPR_reg     (`PROBES7.hstick_cmpr_4),
   .PSTATE_reg          (`SPC7.tlu.tsd1.arch_pstate0),
   .TL_reg              (`SPC7.tlu.trl1.tl0),
   .PIL_reg             (`SPC7.tlu.trl1.pil0),
   .TBA_reg             (`SPC7.tlu.tsd1.tba0[47:15]),
   .VER_reg             (`SPC7.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC7.exu1.rml.cwp_thr0),
   .CANSAVE_reg         (`SPC7.exu1.rml.cansave_thr0),
   .CANRESTORE_reg      (`SPC7.exu1.rml.canrestore_thr0),
   .OTHERWIN_reg        (`SPC7.exu1.rml.otherwin_thr0),
   .WSTATE_reg          (`SPC7.exu1.rml.wstate_thr0),
   .CLEANWIN_reg        (`SPC7.exu1.rml.cleanwin_thr0),
   .rd_SOFTINT_reg      (`SPC7.tlu.trl1.rd_softint0),
   .SOFTINT_reg         (`SPC7.tlu.trl1.softint0),
   .INTR_RECEIVE_reg    (`SPC7.tlu.cth.int_rec4),
   .GL_reg              (`SPC7.tlu.tlu_gl4),
   .HPSTATE_reg         (`SPC7.tlu.tsd1.arch_hpstate0),
   .HTBA_reg            (`SPC7.tlu.tsd1.htba0[47:14]),
   .HINTP_reg           (`SPC7.tlu.trl1.hintp0),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC7.lsu.dcs.p0ctxt_4[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC7.lsu.dcs.s0ctxt_4[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC7.lsu.dcs.p1ctxt_4[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC7.lsu.dcs.s1ctxt_4[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC7.lsu.dcs.wpt_mode_4[1:0],
                                   `SPC7.lsu.dcs.wpt_mask_4[7:0],
                                   `SPC7.lsu.dcs.wpt_enable_4[1:0],
                                   18'd0,
                                   `SPC7.lsu.dcs.spec_enable[4],
                                   `SPC7.lsu.dcs.dmmu_enable[4],
                                   `SPC7.lsu.dcs.immu_enable[4],
                                   `SPC7.lsu.dcs.dc_enable[4],
                                   `SPC7.lsu.dcs.ic_enable[4]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd1.immu_tag_access_0[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd1.dmmu_tag_access_0[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC7.lsu.dcs.watchpoint4[47:3],3'b00}),
   .DSFAR_reg                     (`SPC7.tlu.dfd.dsfar_4[47:0]),

   .Trap_Entry_1        (`PROBES7.trap_entry_1_t4),
   .Trap_Entry_2        (`PROBES7.trap_entry_2_t4),
   .Trap_Entry_3        (`PROBES7.trap_entry_3_t4),
   .Trap_Entry_4        (`PROBES7.trap_entry_4_t4),
   .Trap_Entry_5        (`PROBES7.trap_entry_5_t4),
   .Trap_Entry_6        (`PROBES7.trap_entry_6_t4),

   .exu_valid           (`PROBES7.ex_valid[4]),

   .imul_valid          (`PROBES7.imul_valid[4]),

   .fp_valid            (`PROBES7.fg_valid[4]),
   .frf_w1_valid        (`SPC7.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC7.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC7.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES7.fgu_idiv_valid[4]),

   .fdiv_valid          (`PROBES7.fgu_fdiv_valid[4]),

   .lsu_valid           (`PROBES7.lsu_valid[4]),
   .frf_w2_valid        (`SPC7.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC7.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC7.fgu.frf.w2_addr),

   .asi_valid           (`PROBES7.asi_valid_fx5[4]),
   .asi_in_progress     (`PROBES7.asi_in_progress_fx4[4]),

   .tlu_valid           (`PROBES7.tlu_valid[4])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 5
//
   
  nas_pipe7 t5 (
   .mycid               (cid),
   .mytid               (3'h5),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES7.op_5_w}),
   .PC_reg              ({`PROBES7.pc_5_w}),
   .Y_reg               (`SPC7.exu1.rml.arch_yreg_tid1_ff),
   .CCR_reg             (`SPC7.exu1.ect.arch_ccr_tid1_lth),
   .FPRS_reg            (`SPC7.fgu.fac.fprs_tid5),
   .FSR_reg             (`SPC7.fgu.fad.fsr5_fx1[27:0]),
   .ASI_reg             (`SPC7.lsu.dcs.asi_state5),
   .GSR_reg             ({`SPC7.fgu.fgd.gsr5_mask_fx4[31:0], `SPC7.fgu.fpc.gsr5_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES7.tick_cmpr_5),
   .STICK_CMPR_reg      (`PROBES7.stick_cmpr_5),
   .HSTICK_CMPR_reg     (`PROBES7.hstick_cmpr_5),
   .PSTATE_reg          (`SPC7.tlu.tsd1.arch_pstate1),
   .TL_reg              (`SPC7.tlu.trl1.tl1),
   .PIL_reg             (`SPC7.tlu.trl1.pil1),
   .TBA_reg             (`SPC7.tlu.tsd1.tba1[47:15]),
   .VER_reg             (`SPC7.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC7.exu1.rml.cwp_thr1),
   .CANSAVE_reg         (`SPC7.exu1.rml.cansave_thr1),
   .CANRESTORE_reg      (`SPC7.exu1.rml.canrestore_thr1),
   .OTHERWIN_reg        (`SPC7.exu1.rml.otherwin_thr1),
   .WSTATE_reg          (`SPC7.exu1.rml.wstate_thr1),
   .CLEANWIN_reg        (`SPC7.exu1.rml.cleanwin_thr1),
   .rd_SOFTINT_reg      (`SPC7.tlu.trl1.rd_softint1),
   .SOFTINT_reg         (`SPC7.tlu.trl1.softint1),
   .INTR_RECEIVE_reg    (`SPC7.tlu.cth.int_rec5),
   .GL_reg              (`SPC7.tlu.tlu_gl5),
   .HPSTATE_reg         (`SPC7.tlu.tsd1.arch_hpstate1),
   .HTBA_reg            (`SPC7.tlu.tsd1.htba1[47:14]),
   .HINTP_reg           (`SPC7.tlu.trl1.hintp1),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC7.lsu.dcs.p0ctxt_5[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC7.lsu.dcs.s0ctxt_5[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC7.lsu.dcs.p1ctxt_5[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC7.lsu.dcs.s1ctxt_5[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC7.lsu.dcs.wpt_mode_5[1:0],
                                   `SPC7.lsu.dcs.wpt_mask_5[7:0],
                                   `SPC7.lsu.dcs.wpt_enable_5[1:0],
                                   18'd0,
                                   `SPC7.lsu.dcs.spec_enable[5],
                                   `SPC7.lsu.dcs.dmmu_enable[5],
                                   `SPC7.lsu.dcs.immu_enable[5],
                                   `SPC7.lsu.dcs.dc_enable[5],
                                   `SPC7.lsu.dcs.ic_enable[5]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd1.immu_tag_access_1[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd1.dmmu_tag_access_1[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC7.lsu.dcs.watchpoint5[47:3],3'b00}),
   .DSFAR_reg                     (`SPC7.tlu.dfd.dsfar_5[47:0]),

   .Trap_Entry_1        (`PROBES7.trap_entry_1_t5),
   .Trap_Entry_2        (`PROBES7.trap_entry_2_t5),
   .Trap_Entry_3        (`PROBES7.trap_entry_3_t5),
   .Trap_Entry_4        (`PROBES7.trap_entry_4_t5),
   .Trap_Entry_5        (`PROBES7.trap_entry_5_t5),
   .Trap_Entry_6        (`PROBES7.trap_entry_6_t5),

   .exu_valid           (`PROBES7.ex_valid[5]),

   .imul_valid          (`PROBES7.imul_valid[5]),

   .fp_valid            (`PROBES7.fg_valid[5]),
   .frf_w1_valid        (`SPC7.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC7.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC7.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES7.fgu_idiv_valid[5]),

   .fdiv_valid          (`PROBES7.fgu_fdiv_valid[5]),

   .lsu_valid           (`PROBES7.lsu_valid[5]),
   .frf_w2_valid        (`SPC7.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC7.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC7.fgu.frf.w2_addr),

   .asi_valid           (`PROBES7.asi_valid_fx5[5]),
   .asi_in_progress     (`PROBES7.asi_in_progress_fx4[5]),

   .tlu_valid           (`PROBES7.tlu_valid[5])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 6
//
   
  nas_pipe7 t6 (
   .mycid               (cid),
   .mytid               (3'h6),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES7.op_6_w}),
   .PC_reg              ({`PROBES7.pc_6_w}),
   .Y_reg               (`SPC7.exu1.rml.arch_yreg_tid2_ff),
   .CCR_reg             (`SPC7.exu1.ect.arch_ccr_tid2_lth),
   .FPRS_reg            (`SPC7.fgu.fac.fprs_tid6),
   .FSR_reg             (`SPC7.fgu.fad.fsr6_fx1[27:0]),
   .ASI_reg             (`SPC7.lsu.dcs.asi_state6),
   .GSR_reg             ({`SPC7.fgu.fgd.gsr6_mask_fx4[31:0], `SPC7.fgu.fpc.gsr6_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES7.tick_cmpr_6),
   .STICK_CMPR_reg      (`PROBES7.stick_cmpr_6),
   .HSTICK_CMPR_reg     (`PROBES7.hstick_cmpr_6),
   .PSTATE_reg          (`SPC7.tlu.tsd1.arch_pstate2),
   .TL_reg              (`SPC7.tlu.trl1.tl2),
   .PIL_reg             (`SPC7.tlu.trl1.pil2),
   .TBA_reg             (`SPC7.tlu.tsd1.tba2[47:15]),
   .VER_reg             (`SPC7.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC7.exu1.rml.cwp_thr2),
   .CANSAVE_reg         (`SPC7.exu1.rml.cansave_thr2),
   .CANRESTORE_reg      (`SPC7.exu1.rml.canrestore_thr2),
   .OTHERWIN_reg        (`SPC7.exu1.rml.otherwin_thr2),
   .WSTATE_reg          (`SPC7.exu1.rml.wstate_thr2),
   .CLEANWIN_reg        (`SPC7.exu1.rml.cleanwin_thr2),
   .rd_SOFTINT_reg      (`SPC7.tlu.trl1.rd_softint2),
   .SOFTINT_reg         (`SPC7.tlu.trl1.softint2),
   .INTR_RECEIVE_reg    (`SPC7.tlu.cth.int_rec6),
   .GL_reg              (`SPC7.tlu.tlu_gl6),
   .HPSTATE_reg         (`SPC7.tlu.tsd1.arch_hpstate2),
   .HTBA_reg            (`SPC7.tlu.tsd1.htba2[47:14]),
   .HINTP_reg           (`SPC7.tlu.trl1.hintp2),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC7.lsu.dcs.p0ctxt_6[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC7.lsu.dcs.s0ctxt_6[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC7.lsu.dcs.p1ctxt_6[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC7.lsu.dcs.s1ctxt_6[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC7.lsu.dcs.wpt_mode_6[1:0],
                                   `SPC7.lsu.dcs.wpt_mask_6[7:0],
                                   `SPC7.lsu.dcs.wpt_enable_6[1:0],
                                   18'd0,
                                   `SPC7.lsu.dcs.spec_enable[6],
                                   `SPC7.lsu.dcs.dmmu_enable[6],
                                   `SPC7.lsu.dcs.immu_enable[6],
                                   `SPC7.lsu.dcs.dc_enable[6],
                                   `SPC7.lsu.dcs.ic_enable[6]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd1.immu_tag_access_2[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd1.dmmu_tag_access_2[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC7.lsu.dcs.watchpoint6[47:3],3'b00}),
   .DSFAR_reg                     (`SPC7.tlu.dfd.dsfar_6[47:0]),

   .Trap_Entry_1        (`PROBES7.trap_entry_1_t6),
   .Trap_Entry_2        (`PROBES7.trap_entry_2_t6),
   .Trap_Entry_3        (`PROBES7.trap_entry_3_t6),
   .Trap_Entry_4        (`PROBES7.trap_entry_4_t6),
   .Trap_Entry_5        (`PROBES7.trap_entry_5_t6),
   .Trap_Entry_6        (`PROBES7.trap_entry_6_t6),

   .exu_valid           (`PROBES7.ex_valid[6]),

   .imul_valid          (`PROBES7.imul_valid[6]),

   .fp_valid            (`PROBES7.fg_valid[6]),
   .frf_w1_valid        (`SPC7.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC7.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC7.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES7.fgu_idiv_valid[6]),

   .fdiv_valid          (`PROBES7.fgu_fdiv_valid[6]),

   .lsu_valid           (`PROBES7.lsu_valid[6]),
   .frf_w2_valid        (`SPC7.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC7.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC7.fgu.frf.w2_addr),

   .asi_valid           (`PROBES7.asi_valid_fx5[6]),
   .asi_in_progress     (`PROBES7.asi_in_progress_fx4[6]),

   .tlu_valid           (`PROBES7.tlu_valid[6])
`endif
  );
				      

//----------------------------------------------------------
//
//  THREAD 7
//
   
  nas_pipe7 t7 (
   .mycid               (cid),
   .mytid               (3'h7),

// If GATESIM, instantiate "dummy" module with floating ports since unused.
`ifdef GATESIM
   .opcode              ()   // this and all other ports are unconnected
`else
   .opcode              ({`PROBES7.op_7_w}),
   .PC_reg              ({`PROBES7.pc_7_w}),
   .Y_reg               (`SPC7.exu1.rml.arch_yreg_tid3_ff),
   .CCR_reg             (`SPC7.exu1.ect.arch_ccr_tid3_lth),
   .FPRS_reg            (`SPC7.fgu.fac.fprs_tid7),
   .FSR_reg             (`SPC7.fgu.fad.fsr7_fx1[27:0]),
   .ASI_reg             (`SPC7.lsu.dcs.asi_state7),
   .GSR_reg             ({`SPC7.fgu.fgd.gsr7_mask_fx4[31:0], `SPC7.fgu.fpc.gsr7_11bits_fx4[10:0]}),
   .TICK_CMPR_reg       (`PROBES7.tick_cmpr_7),
   .STICK_CMPR_reg      (`PROBES7.stick_cmpr_7),
   .HSTICK_CMPR_reg     (`PROBES7.hstick_cmpr_7),
   .PSTATE_reg          (`SPC7.tlu.tsd1.arch_pstate3),
   .TL_reg              (`SPC7.tlu.trl1.tl3),
   .PIL_reg             (`SPC7.tlu.trl1.pil3),
   .TBA_reg             (`SPC7.tlu.tsd1.tba3[47:15]),
   .VER_reg             (`SPC7.tlu.asi.hver_value),  // static
   .CWP_reg             (`SPC7.exu1.rml.cwp_thr3),
   .CANSAVE_reg         (`SPC7.exu1.rml.cansave_thr3),
   .CANRESTORE_reg      (`SPC7.exu1.rml.canrestore_thr3),
   .OTHERWIN_reg        (`SPC7.exu1.rml.otherwin_thr3),
   .WSTATE_reg          (`SPC7.exu1.rml.wstate_thr3),
   .CLEANWIN_reg        (`SPC7.exu1.rml.cleanwin_thr3),
   .rd_SOFTINT_reg      (`SPC7.tlu.trl1.rd_softint3),
   .SOFTINT_reg         (`SPC7.tlu.trl1.softint3),
   .INTR_RECEIVE_reg    (`SPC7.tlu.cth.int_rec7),
   .GL_reg              (`SPC7.tlu.tlu_gl7),
   .HPSTATE_reg         (`SPC7.tlu.tsd1.arch_hpstate3),
   .HTBA_reg            (`SPC7.tlu.tsd1.htba3[47:14]),
   .HINTP_reg           (`SPC7.tlu.trl1.hintp3),

   .CTXT_PRIM_0_reg               ({51'b0,`SPC7.lsu.dcs.p0ctxt_7[12:0]}),
   .CTXT_SEC_0_reg                ({51'b0,`SPC7.lsu.dcs.s0ctxt_7[12:0]}),
   .CTXT_PRIM_1_reg               ({51'b0,`SPC7.lsu.dcs.p1ctxt_7[12:0]}),
   .CTXT_SEC_1_reg                ({51'b0,`SPC7.lsu.dcs.s1ctxt_7[12:0]}),
   .LSU_CONTROL_reg               ({29'd0,
                                   `SPC7.lsu.dcs.wpt_mode_7[1:0],
                                   `SPC7.lsu.dcs.wpt_mask_7[7:0],
                                   `SPC7.lsu.dcs.wpt_enable_7[1:0],
                                   18'd0,
                                   `SPC7.lsu.dcs.spec_enable[7],
                                   `SPC7.lsu.dcs.dmmu_enable[7],
                                   `SPC7.lsu.dcs.immu_enable[7],
                                   `SPC7.lsu.dcs.dc_enable[7],
                                   `SPC7.lsu.dcs.ic_enable[7]}),
   .I_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd1.immu_tag_access_3[47:0]}),
   .D_TAG_ACC_reg                 ({16'b0,`SPC7.mmu.asd1.dmmu_tag_access_3[47:0]}),
   .WATCHPOINT_ADDR_reg           ({16'b0,`SPC7.lsu.dcs.watchpoint7[47:3],3'b00}),
   .DSFAR_reg                     (`SPC7.tlu.dfd.dsfar_7[47:0]),

   .Trap_Entry_1        (`PROBES7.trap_entry_1_t7),
   .Trap_Entry_2        (`PROBES7.trap_entry_2_t7),
   .Trap_Entry_3        (`PROBES7.trap_entry_3_t7),
   .Trap_Entry_4        (`PROBES7.trap_entry_4_t7),
   .Trap_Entry_5        (`PROBES7.trap_entry_5_t7),
   .Trap_Entry_6        (`PROBES7.trap_entry_6_t7),

   .exu_valid           (`PROBES7.ex_valid[7]),

   .imul_valid          (`PROBES7.imul_valid[7]),

   .fp_valid            (`PROBES7.fg_valid[7]),
   .frf_w1_valid        (`SPC7.fgu.frf.w1_valid),
   .frf_w1_tid          (`SPC7.fgu.frf.w1_tid),
   .frf_w1_addr         (`SPC7.fgu.frf.w1_addr),

   .idiv_valid          (`PROBES7.fgu_idiv_valid[7]),

   .fdiv_valid          (`PROBES7.fgu_fdiv_valid[7]),

   .lsu_valid           (`PROBES7.lsu_valid[7]),
   .frf_w2_valid        (`SPC7.fgu.frf.w2_valid),
   .frf_w2_tid          (`SPC7.fgu.frf.w2_tid),
   .frf_w2_addr         (`SPC7.fgu.frf.w2_addr),

   .asi_valid           (`PROBES7.asi_valid_fx5[7]),
   .asi_in_progress     (`PROBES7.asi_in_progress_fx4[7]),

   .tlu_valid           (`PROBES7.tlu_valid[7])
`endif
  );
				      
//----------------------------------------------------------


//----------------------------------------------------------
endmodule

`endif

