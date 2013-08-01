// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu.v
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
module dmu_clu 
  (
   // clock/reset
   clk,
   rst_l,
   
   // jbc: dmc req/cpl port
   d2j_cmd,
   d2j_addr,
   d2j_ctag,
   d2j_cmd_vld,
   d2j_data,
   d2j_bmsk,
   d2j_data_par,
   d2j_data_vld,
   
   // jbc : jbc req/cpl port
   j2d_d_wrack_tag,
   j2d_d_wrack_vld,
   j2d_di_cmd,
   j2d_di_ctag,
   j2d_di_cmd_vld,
   j2d_p_cmd,
   j2d_p_addr,
   j2d_p_bmsk,
   j2d_p_ctag,
   j2d_p_cmd_vld,
   j2d_d_data,
   j2d_d_data_par,
   j2d_d_data_err,
   j2d_d_data_vld,
   j2d_p_data,
   j2d_p_data_par,
   j2d_p_data_vld,
   
   // ilu: dou-dma status port
   k2y_dou_dptr,
   k2y_dou_err,
   k2y_dou_vld,
   
   // psb: sbd access port
   cl2ps_e_cmd_type,
   cl2ps_e_trn,
   cl2ps_e_wr_data,
   cl2ps_e_req,
   ps2cl_e_rd_data,
   ps2cl_e_gnt,
   
   // pmu: icr port
   cl2pm_rcd_full,
   pm2cl_rcd,
   pm2cl_rcd_enq,
   
   // cmu: epr port
   cl2cm_rcd,
   cl2cm_rcd_enq,
   cm2cl_rcd_full,
   
   // mmu: tcr port
   cl2mm_tcr_ack,
   mm2cl_tcr_rcd,
   mm2cl_tcr_req,
   
   // mmu : tdr port
   cl2mm_tdr_rcd,
   cl2mm_tdr_vld,
   
   // rmu: dou dma buffer rel port
   rm2cl_bufrel,
   rm2cl_bufrel_enq,
   
   // tmu: diu buffer mgr port
   cl2tm_dma_rptr,
   cl2tm_int_rptr,
   tm2cl_dma_wptr,
   tm2cl_pio_wptr,
   
   // diu: data read port
   cl2di_addr,
   cl2di_rd_en,
   di2cl_data,
   di2cl_bmask,
   di2cl_dpar,
   
   // dou : data write port
   cl2do_dma_data,
   cl2do_dma_dpar,
   cl2do_dma_addr,
   cl2do_dma_wr,
   cl2do_pio_data,
   cl2do_pio_dpar,
   cl2do_pio_addr,
   cl2do_pio_wr,
   
   // cru : debug ports
   cl2cr_dbg_a,
   cl2cr_dbg_b,
   cr2cl_dbg_sel_a,
   cr2cl_dbg_sel_b,
   
   // cru : config packet setup
   cr2cl_bus_num,
   // for N2 dbg quiescing
   ds2cl_stall,
   // force 1 outstanding non-posted write
   p2d_npwr_stall_en,
   rm2crm_npwr_wrack,
   // enables for 2 fixes for bug 107207 from spare imu
   im2crm_bc_stall_en,
   im2crm_ilu_stall_en,
   il2cl_gr_16
   );
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // JBC Interface
  // --------------------------------------------------------
  
  // ----- CTM: DMC Req/Cpl Port -----
  
  // command port
  output  [(`FIRE_D2J_CMD_WDTH - 1):0] d2j_cmd;
  output [(`FIRE_D2J_ADDR_WDTH - 1):0] d2j_addr;
  output [(`FIRE_D2J_CTAG_WDTH - 1):0] d2j_ctag;
  output                               d2j_cmd_vld;
  
  // data port
  output [(`FIRE_D2J_DATA_WDTH - 1):0] d2j_data;
  output [(`FIRE_D2J_BMSK_WDTH - 1):0] d2j_bmsk;
  output [(`FIRE_D2J_DPAR_WDTH - 1):0] d2j_data_par;
  output                               d2j_data_vld;
  
  // ----- CTM: DMA Wrack Port -----
  input [(`FIRE_J2D_D_WRACK_WDTH - 1):0] j2d_d_wrack_tag;
  input                                  j2d_d_wrack_vld;
  
  // ----- CRM: Req/Cpl Command Port -----
  
  // completion port
  input  [(`FIRE_J2D_DI_CMD_WDTH - 1):0] j2d_di_cmd;
  input [(`FIRE_J2D_DI_CTAG_WDTH - 1):0] j2d_di_ctag;
  input                                  j2d_di_cmd_vld;
  
  // request port
  input  [(`FIRE_J2D_P_CMD_WDTH - 1):0] j2d_p_cmd;
  input [(`FIRE_J2D_P_ADDR_WDTH - 1):0] j2d_p_addr;
  input [(`FIRE_J2D_P_BMSK_WDTH - 1):0] j2d_p_bmsk;
  input [(`FIRE_J2D_P_CTAG_WDTH - 1):0] j2d_p_ctag;
  input                                 j2d_p_cmd_vld;
  
  // ----- CRM: Req/Cpl Data Port -----
  
  // completion port
  input [(`FIRE_J2D_D_DATA_WDTH - 1):0] j2d_d_data;
  input [(`FIRE_J2D_D_DPAR_WDTH - 1):0] j2d_d_data_par;
  input                                 j2d_d_data_err;
  input                                 j2d_d_data_vld;
  
  // request port
  input [(`FIRE_J2D_P_DATA_WDTH - 1):0] j2d_p_data;
  input [(`FIRE_J2D_P_DPAR_WDTH - 1):0] j2d_p_data_par;
  input                                 j2d_p_data_vld;
  
  // --------------------------------------------------------
  // ILU Interface
  // --------------------------------------------------------
  
  // ----- CRM: DOU-DMA Status Port -----
  output [(`FIRE_DLC_DOU_REL_WDTH - 1):0] k2y_dou_dptr;
  output 				  k2y_dou_err;
  output 				  k2y_dou_vld;
  
  // --------------------------------------------------------
  // PSB Interface
  // --------------------------------------------------------
  
  // ----- CRM: Scoreboard Access Port -----
  output  [(`FIRE_DLC_PSR_CMD_TYPE_WDTH - 1):0] cl2ps_e_cmd_type;
  output       [(`FIRE_DLC_PSR_TRN_WDTH - 1):0] cl2ps_e_trn;
  output   [(`FIRE_DLC_PSR_PIO_DATA_WDTH - 1):0] cl2ps_e_wr_data;
  output                                        cl2ps_e_req;
  input [(`FIRE_DLC_PSR_DMA_DATA_WDTH - 1):0] ps2cl_e_rd_data;
  input                                         ps2cl_e_gnt;
  
  // --------------------------------------------------------
  // PMU Interface
  // --------------------------------------------------------
  
  // ----- CTM: Ingress Command Record (ICR) Port -----
  output                                 cl2pm_rcd_full;
  input [(`FIRE_DLC_ICR_REC_WDTH - 1):0] pm2cl_rcd;
  input                                  pm2cl_rcd_enq;
  
  // --------------------------------------------------------
  // CMU Interface
  // --------------------------------------------------------
  
  // ----- CRM: Egress Packet Record (EPR) Port -----
  output [(`FIRE_DLC_EPR_REC_WDTH - 1):0] cl2cm_rcd;
  output                                  cl2cm_rcd_enq;
  input                                   cm2cl_rcd_full;
  
  // --------------------------------------------------------
  // MMU Interface
  // --------------------------------------------------------
  
  // ----- CTM: Tablewalk Command Record (TCR) Port -----
  output                             cl2mm_tcr_ack;
  input [(`FIRE_DLC_TCR_WDTH - 1):0] mm2cl_tcr_rcd;
  input                              mm2cl_tcr_req;
  
  // ----- CRM: Tablewalk Data Record (TDR) Port -----
  output [(`FIRE_DLC_TDR_WDTH - 1):0] cl2mm_tdr_rcd;
  output                              cl2mm_tdr_vld;
  
  // --------------------------------------------------------
  // RMU Interface
  // --------------------------------------------------------
  
  // ----- CTM: DOU DMA Buffer Release Port -----
  input [(`FIRE_DLC_DOU_REL_WDTH - 1):0] rm2cl_bufrel;
  input                                  rm2cl_bufrel_enq;
  
  // --------------------------------------------------------
  // TMU Interface
  // --------------------------------------------------------
  
  // ----- CTM: DIU Buffer Manager Port -----
  output [(`FIRE_DLC_DMA_RPTR_WDTH - 1):0] cl2tm_dma_rptr;
  output [(`FIRE_DLC_INT_RPTR_WDTH - 1):0] cl2tm_int_rptr;
  input  [(`FIRE_DLC_DMA_WPTR_WDTH - 1):0] tm2cl_dma_wptr;
  input  [(`FIRE_DLC_PIO_WPTR_WDTH - 1):0] tm2cl_pio_wptr;
  
  // --------------------------------------------------------
  // DIU Interface
  // --------------------------------------------------------
  
  // ----- CTM: Data Buffer Read Port -----
  output [(`FIRE_DLC_CRD_ADDR_WDTH - 1):0] cl2di_addr;
  output  				   cl2di_rd_en;
  input  [(`FIRE_DLC_CRD_DATA_WDTH - 1):0] di2cl_data;
  input [(`FIRE_DLC_CRD_BMASK_WDTH - 1):0] di2cl_bmask;
  input  [(`FIRE_DLC_CRD_DPAR_WDTH - 1):0] di2cl_dpar;
  
  // --------------------------------------------------------
  // DOU Interface
  // --------------------------------------------------------
  
  // ----- CRM: DMA Data Buffer Write Port -----
  output [(`FIRE_DLC_CDD_DATA_WDTH - 1):0] cl2do_dma_data;
  output [(`FIRE_DLC_CDD_DPAR_WDTH - 1):0] cl2do_dma_dpar;
  output [(`FIRE_DLC_CDD_ADDR_WDTH - 1):0] cl2do_dma_addr;
  output                                   cl2do_dma_wr;
  
  // ----- CRM: PIO Data Buffer Write Port -----
  output [(`FIRE_DLC_CPD_DATA_WDTH - 1):0] cl2do_pio_data;
  output [(`FIRE_DLC_CPD_DPAR_WDTH - 1):0] cl2do_pio_dpar;
  output [(`FIRE_DLC_CPD_ADDR_WDTH - 1):0] cl2do_pio_addr;
  output                                   cl2do_pio_wr;
  
  // --------------------------------------------------------
  // CRU Interface
  // --------------------------------------------------------
  
  // ----- Debug Ports -----
  output [`FIRE_DBG_DATA_BITS] 		   cl2cr_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 		   cl2cr_dbg_b;
  input [5:0] 				   cr2cl_dbg_sel_a;
  input [5:0] 				   cr2cl_dbg_sel_b;
  
  // ----- Config Packet Setup -----
  input [`FIRE_PCIE_BUS_NUM_BITS] 	   cr2cl_bus_num;
  
  // ----- Config Packet Setup -----
  input  	   			   ds2cl_stall;

  // ----- force 1 outstanding non-posted write -----
  input  	   			   p2d_npwr_stall_en;
  input  	   			   rm2crm_npwr_wrack;

  input  	   			   im2crm_bc_stall_en;
  input  	   			   im2crm_ilu_stall_en;
  input  	   			   il2cl_gr_16;


  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // --------------------------------------------------------
  // CTM-CRM Sub-block Interface
  // --------------------------------------------------------
  
  // ----- Unsupported Request Record (URR) Port -----
  wire [(`FIRE_DLC_CLU_URR_WDTH - 1):0] ctm2crm_rcd;
  wire                                  ctm2crm_rcd_enq;
  wire                                  crm2ctm_rcd_deq;
  
  // ----- DMA/INT Tag Return Port -----
  wire [3:0] crm2ctm_tag;
  wire       crm2ctm_tag_enq;
  
  // ----- Debug Ports -----
  wire [`FIRE_DBG_DATA_BITS] ctm_dbg0_bus_a;
  wire [`FIRE_DBG_DATA_BITS] ctm_dbg0_bus_b;
  wire [`FIRE_DBG_DATA_BITS] ctm_dbg1_bus_a;
  wire [`FIRE_DBG_DATA_BITS] ctm_dbg1_bus_b;
  wire [`FIRE_DBG_DATA_BITS] crm_dbg0_bus_a;
  wire [`FIRE_DBG_DATA_BITS] crm_dbg0_bus_b;
  wire [`FIRE_DBG_DATA_BITS] crm_dbg1_bus_a;
  wire [`FIRE_DBG_DATA_BITS] crm_dbg1_bus_b;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // CTM Sub-block
  dmu_clu_ctm ctm
    (
     // clock/reset
     .clk                  (clk),
     .rst_l                (rst_l),
     
     // jbc: dmc req/cpl port
     .d2j_cmd              (d2j_cmd),
     .d2j_addr             (d2j_addr),
     .d2j_ctag             (d2j_ctag),
     .d2j_cmd_vld          (d2j_cmd_vld),
     .d2j_data             (d2j_data),
     .d2j_bmsk             (d2j_bmsk),
     .d2j_data_par         (d2j_data_par),
     .d2j_data_vld         (d2j_data_vld),
     
     // jbc : dma wrack port
     .j2d_d_wrack_tag      (j2d_d_wrack_tag),
     .j2d_d_wrack_vld      (j2d_d_wrack_vld),
     
     // pmu : icr port
     .cl2pm_rcd_full       (cl2pm_rcd_full),
     .pm2cl_rcd            (pm2cl_rcd),
     .pm2cl_rcd_enq        (pm2cl_rcd_enq),
     
     // mmu : tcr port
     .cl2mm_tcr_ack        (cl2mm_tcr_ack),
     .mm2cl_tcr_rcd        (mm2cl_tcr_rcd),
     .mm2cl_tcr_req        (mm2cl_tcr_req),
     
     // rmu : dou dma buffer rel port
     .rm2cl_bufrel         (rm2cl_bufrel),
     .rm2cl_bufrel_enq     (rm2cl_bufrel_enq),
     
     // tmu: diu buffer mgr port
     .cl2tm_dma_rptr       (cl2tm_dma_rptr),
     .cl2tm_int_rptr       (cl2tm_int_rptr),
     .tm2cl_dma_wptr       (tm2cl_dma_wptr),
     .tm2cl_pio_wptr       (tm2cl_pio_wptr),
     
     // diu : data read port
     .cl2di_addr           (cl2di_addr),
     .cl2di_rd_en          (cl2di_rd_en),
     .di2cl_data           (di2cl_data),
     .di2cl_bmask          (di2cl_bmask),
     .di2cl_dpar           (di2cl_dpar),
     
     // crm : urr port
     .ctm2crm_rcd          (ctm2crm_rcd),
     .ctm2crm_rcd_enq      (ctm2crm_rcd_enq),
     .crm2ctm_rcd_deq      (crm2ctm_rcd_deq),
     
     // crm: dma tag return port
     .crm2ctm_tag          (crm2ctm_tag),
     .crm2ctm_tag_enq      (crm2ctm_tag_enq),
     
     // cru : debug ports
     .ctm_dbg0_bus_a       (ctm_dbg0_bus_a),
     .ctm_dbg0_bus_b       (ctm_dbg0_bus_b),
     .ctm_dbg1_bus_a       (ctm_dbg1_bus_a),
     .ctm_dbg1_bus_b       (ctm_dbg1_bus_b),
     .cr2cl_dbg_sel_a      (cr2cl_dbg_sel_a[2:0]),
     .cr2cl_dbg_sel_b      (cr2cl_dbg_sel_b[2:0]),
     .ds2cl_stall          (ds2cl_stall)
     );
  
  // CRM Sub-block
  dmu_clu_crm crm
    (
     // clock/reset
     .clk                  (clk),
     .rst_l                (rst_l),
     
     // jbc: dma/int cpl port
     .j2d_di_cmd           (j2d_di_cmd),
     .j2d_di_ctag          (j2d_di_ctag),
     .j2d_di_cmd_vld       (j2d_di_cmd_vld),
     .j2d_d_data           (j2d_d_data),
     .j2d_d_data_par       (j2d_d_data_par),
     .j2d_d_data_err       (j2d_d_data_err),
     .j2d_d_data_vld       (j2d_d_data_vld),
     
     // jbc: pio rd/wr req port
     .j2d_p_cmd            (j2d_p_cmd),
     .j2d_p_addr           (j2d_p_addr),
     .j2d_p_bmsk           (j2d_p_bmsk),
     .j2d_p_ctag           (j2d_p_ctag),
     .j2d_p_cmd_vld        (j2d_p_cmd_vld),
     .j2d_p_data           (j2d_p_data),
     .j2d_p_data_par       (j2d_p_data_par),
     .j2d_p_data_vld       (j2d_p_data_vld),
     
     // ilu: dou-dma status port
     .k2y_dou_dptr         (k2y_dou_dptr),
     .k2y_dou_err          (k2y_dou_err),
     .k2y_dou_vld          (k2y_dou_vld),
     
     // psb : sbd access port
     .cl2ps_e_cmd_type     (cl2ps_e_cmd_type),
     .cl2ps_e_trn          (cl2ps_e_trn),
     .cl2ps_e_wr_data      (cl2ps_e_wr_data),
     .cl2ps_e_req          (cl2ps_e_req),
     .ps2cl_e_rd_data      (ps2cl_e_rd_data),
     .ps2cl_e_gnt          (ps2cl_e_gnt),
     
     // cmu : epr port
     .cl2cm_rcd            (cl2cm_rcd),
     .cl2cm_rcd_enq        (cl2cm_rcd_enq),
     .cm2cl_rcd_full       (cm2cl_rcd_full),
     
     // mmu: tdr port
     .cl2mm_tdr_rcd        (cl2mm_tdr_rcd),
     .cl2mm_tdr_vld        (cl2mm_tdr_vld),
     
     // dou: data write port
     .cl2do_dma_data       (cl2do_dma_data),
     .cl2do_dma_dpar       (cl2do_dma_dpar),
     .cl2do_dma_addr       (cl2do_dma_addr),
     .cl2do_dma_wr         (cl2do_dma_wr),
     .cl2do_pio_data       (cl2do_pio_data),
     .cl2do_pio_dpar       (cl2do_pio_dpar),
     .cl2do_pio_addr       (cl2do_pio_addr),
     .cl2do_pio_wr         (cl2do_pio_wr),
     
     // ctm : urr port
     .crm2ctm_rcd_deq      (crm2ctm_rcd_deq),
     .ctm2crm_rcd          (ctm2crm_rcd),
     .ctm2crm_rcd_enq      (ctm2crm_rcd_enq),
     
     // ctm: dma/int tag return port
     .crm2ctm_tag          (crm2ctm_tag),
     .crm2ctm_tag_enq      (crm2ctm_tag_enq),
     
     // cru : debug ports
     .crm_dbg0_bus_a       (crm_dbg0_bus_a),
     .crm_dbg0_bus_b       (crm_dbg0_bus_b),
     .crm_dbg1_bus_a       (crm_dbg1_bus_a),
     .crm_dbg1_bus_b       (crm_dbg1_bus_b),
     .cr2cl_dbg_sel_a      (cr2cl_dbg_sel_a[2:0]),
     .cr2cl_dbg_sel_b      (cr2cl_dbg_sel_b[2:0]),
     
     // cru : config packet setup
     .cr2cl_bus_num        (cr2cl_bus_num),

     // force 1 outstanding non-posted pio write
     .p2d_npwr_stall_en    (p2d_npwr_stall_en),
     .rm2crm_npwr_wrack    (rm2crm_npwr_wrack),

     .im2crm_bc_stall_en   (im2crm_bc_stall_en),
     .im2crm_ilu_stall_en  (im2crm_ilu_stall_en),
     .il2cl_gr_16  	   (il2cl_gr_16),

     // used to keep ehb from filling for stall
     .d2j_cmd_bit3         (d2j_cmd[3]),
     .d2j_cmd_vld          (d2j_cmd_vld)
     );
  
  // DEBUG
  dmu_clu_debug debug
    (
     // clock
     .clk                   (clk),
     .rst_l                 (rst_l),
     
     // cru : debug ports
     .cl2cr_dbg_a           (cl2cr_dbg_a),
     .cl2cr_dbg_b           (cl2cr_dbg_b),
     .cr2cl_dbg_sel_a       (cr2cl_dbg_sel_a[5:3]),
     .cr2cl_dbg_sel_b       (cr2cl_dbg_sel_b[5:3]),
     
     // ctm : debug ports
     .ctm_dbg0_bus_a        (ctm_dbg0_bus_a),
     .ctm_dbg0_bus_b        (ctm_dbg0_bus_b),
     .ctm_dbg1_bus_a        (ctm_dbg1_bus_a),
     .ctm_dbg1_bus_b        (ctm_dbg1_bus_b),
     
     // crm : debug ports
     .crm_dbg0_bus_a        (crm_dbg0_bus_a),
     .crm_dbg0_bus_b        (crm_dbg0_bus_b),
     .crm_dbg1_bus_a        (crm_dbg1_bus_a),
     .crm_dbg1_bus_b        (crm_dbg1_bus_b)
     );
  
endmodule // dmu_clu
