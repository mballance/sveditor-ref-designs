// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_crm.v
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
module dmu_clu_crm 
  (
   // clock/reset
   clk,
   rst_l,
   
   // jbc: dma/int cpl port
   j2d_di_cmd,
   j2d_di_ctag,
   j2d_di_cmd_vld,
   j2d_d_data,
   j2d_d_data_par,
   j2d_d_data_err,
   j2d_d_data_vld,
   
   // jbc: pio rd/wr req port
   j2d_p_cmd,
   j2d_p_addr,
   j2d_p_bmsk,
   j2d_p_ctag,
   j2d_p_cmd_vld,
   j2d_p_data,
   j2d_p_data_par,
   j2d_p_data_vld,
   
   // ilu: dou-dma status port
   k2y_dou_dptr,
   k2y_dou_err,
   k2y_dou_vld,
   
   // psb : sbd access port
   cl2ps_e_cmd_type,
   cl2ps_e_trn,
   cl2ps_e_wr_data,
   cl2ps_e_req,
   ps2cl_e_rd_data,
   ps2cl_e_gnt,
   
   // cmu : epr port
   cl2cm_rcd,
   cl2cm_rcd_enq,
   cm2cl_rcd_full,
   
   // mmu: tdr port
   cl2mm_tdr_rcd,
   cl2mm_tdr_vld,
   
   // dou: data write port
   cl2do_dma_data,
   cl2do_dma_dpar,
   cl2do_dma_addr,
   cl2do_dma_wr,
   cl2do_pio_data,
   cl2do_pio_dpar,
   cl2do_pio_addr,
   cl2do_pio_wr,
   
   // ctm : urr port
   crm2ctm_rcd_deq,
   ctm2crm_rcd,
   ctm2crm_rcd_enq,
   
   // ctm: dma/int tag return port
   crm2ctm_tag,
   crm2ctm_tag_enq,
   
   // cru : debug ports
   crm_dbg0_bus_a,
   crm_dbg0_bus_b,
   crm_dbg1_bus_a,
   crm_dbg1_bus_b,
   cr2cl_dbg_sel_a,
   cr2cl_dbg_sel_b,
   
   // cru : config packet setup
   cr2cl_bus_num,

   // from peu, force 1 non-posted pio write outstanding
   p2d_npwr_stall_en,
   rm2crm_npwr_wrack,

   im2crm_bc_stall_en,
   im2crm_ilu_stall_en,
   il2cl_gr_16,

   // for stall to keep ehb from filling with pios
   d2j_cmd_vld,
   d2j_cmd_bit3
   );
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // DMA/INT Command Record (DCR) FIFO Configuration
  // --------------------------------------------------------
  
  parameter DCR_FDEPTH        = 5'd16;
  parameter DCR_FDEPTH_MINONE = 4'd15;
  parameter DCR_FPTR_WDTH     = 4;
  
  // --------------------------------------------------------
  // PIO Command Record (PCR) FIFO Configuration
  // --------------------------------------------------------
  
  parameter PCR_FDEPTH        = 5'd16;
  parameter PCR_FDEPTH_MINONE = 4'd15;
  parameter PCR_FPTR_WDTH     = 4;
  
  // --------------------------------------------------------
  // Unsupported Request Record (URR) FIFO Configuration
  // --------------------------------------------------------
  
  parameter URR_FDEPTH        = 4'd6;
  parameter URR_FDEPTH_MINONE = 3'd5;
  parameter URR_FPTR_WDTH     = 3;
  
  // --------------------------------------------------------
  // DMA/INT Command Record (DCR) Field Definitions
  // --------------------------------------------------------
  
  // ctag field
  parameter DCR_CTAG_LSB  = 0;
  parameter DCR_CTAG_WDTH = `FIRE_J2D_DI_CTAG_WDTH;
  parameter DCR_CTAG_MSB  = DCR_CTAG_LSB + DCR_CTAG_WDTH - 1;
  
  // cmd field
  parameter DCR_CMD_LSB   = DCR_CTAG_LSB + DCR_CTAG_WDTH;
  parameter DCR_CMD_WDTH  = `FIRE_J2D_DI_CMD_WDTH;
  parameter DCR_CMD_MSB   = DCR_CMD_LSB + DCR_CMD_WDTH - 1;
  
  // total rcd bit-width
  parameter DCR_WDTH      = DCR_CMD_LSB + DCR_CMD_WDTH;
  
 parameter   FREE_RUNNING   	= 2'b00,
              NPWR_STALL   	= 2'b01,
              POTENTIAL_STALL   = 2'b10,
              NPRD_STALL    	= 2'b11; 

  // --------------------------------------------------------
  // DMA CTAG Field Definitions
  // --------------------------------------------------------
  
  // misc field : {pktag[4:0], clsts}/mtag[5:0]
  parameter DCTAG_MISC_LSB     = 0;
  parameter DCTAG_MISC_WDTH    = 6;
  parameter DCTAG_MISC_MSB     = DCTAG_MISC_LSB + DCTAG_MISC_WDTH - 1;
  
  // dptr field
  parameter DCTAG_DPTR_LSB     = DCTAG_MISC_LSB + DCTAG_MISC_WDTH;
  parameter DCTAG_DPTR_WDTH    = 5;
  parameter DCTAG_DPTR_MSB     = DCTAG_DPTR_LSB + DCTAG_DPTR_WDTH - 1;
  
  // transaction number field
  parameter DCTAG_TRNSNUM_LSB  = DCTAG_DPTR_LSB + DCTAG_DPTR_WDTH;
  parameter DCTAG_TRNSNUM_WDTH = 4;
  parameter DCTAG_TRNSNUM_MSB  = DCTAG_TRNSNUM_LSB + DCTAG_TRNSNUM_WDTH - 1;
  
  // type field
  parameter DCTAG_TYP          = DCTAG_TRNSNUM_LSB + DCTAG_TRNSNUM_WDTH;
  
  // --------------------------------------------------------
  // PIO Command Record (PCR) Field Definitions
  // --------------------------------------------------------
  
  // ctag field
  parameter PCR_CTAG_LSB  = 0;
  parameter PCR_CTAG_WDTH = `FIRE_J2D_P_CTAG_WDTH;
  parameter PCR_CTAG_MSB  = PCR_CTAG_LSB + PCR_CTAG_WDTH - 1;
  
  // bmask field
  parameter PCR_BMSK_LSB  = PCR_CTAG_LSB + PCR_CTAG_WDTH;
  parameter PCR_BMSK_WDTH = `FIRE_J2D_P_BMSK_WDTH;
  parameter PCR_BMSK_MSB  = PCR_BMSK_LSB + PCR_BMSK_WDTH - 1;
  
  // address field
  parameter PCR_ADDR_LSB  = PCR_BMSK_LSB + PCR_BMSK_WDTH;
  parameter PCR_ADDR_WDTH = `FIRE_J2D_P_ADDR_WDTH;
  parameter PCR_ADDR_MSB  = PCR_ADDR_LSB + PCR_ADDR_WDTH - 1;
  
  // cmd field
  parameter PCR_CMD_LSB   = PCR_ADDR_LSB + PCR_ADDR_WDTH;
  parameter PCR_CMD_WDTH  = `FIRE_J2D_P_CMD_WDTH;
  parameter PCR_CMD_MSB   = PCR_CMD_LSB + PCR_CMD_WDTH - 1;
  
  // total rcd bit-width
  parameter PCR_WDTH      = PCR_CMD_LSB + PCR_CMD_WDTH;
  
  // --------------------------------------------------------
  // PIO CTAG Field Definitions
  // --------------------------------------------------------
  
/*  // trans_id field
//  parameter PCTAG_TRNSID_LSB   = 0;
//  parameter PCTAG_TRNSID_WDTH  = 2;
//  parameter PCTAG_TRNSID_MSB   = PCTAG_TRNSID_LSB + PCTAG_TRNSID_WDTH - 1;
//  
//  // agent_id field
//  parameter PCTAG_AGNTID_LSB   = PCTAG_TRNSID_LSB + PCTAG_TRNSID_WDTH;
//  parameter PCTAG_AGNTID_WDTH  = 4;
//  parameter PCTAG_AGNTID_MSB   = PCTAG_AGNTID_LSB + PCTAG_AGNTID_WDTH - 1;
*/
//	N2, BP 05-24-04
//  // thread_id field
  parameter PCTAG_THRDID_LSB   = 0;
  parameter PCTAG_THRDID_WDTH  = 7;
  parameter PCTAG_THRDID_MSB   = PCTAG_THRDID_LSB + PCTAG_THRDID_WDTH - 1;
  
  // transaction number field
//  parameter PCTAG_TRNSNUM_LSB  = PCTAG_AGNTID_LSB + PCTAG_AGNTID_WDTH;
  parameter PCTAG_TRNSNUM_LSB  = PCTAG_THRDID_LSB + PCTAG_THRDID_WDTH;
  parameter PCTAG_TRNSNUM_WDTH = 4;
  parameter PCTAG_TRNSNUM_MSB  = PCTAG_TRNSNUM_LSB + PCTAG_TRNSNUM_WDTH - 1;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // JBC Interface
  // --------------------------------------------------------
  
  // ----- DMA/INT CPL -----
  
  // command port
  input  [(`FIRE_J2D_DI_CMD_WDTH - 1):0] j2d_di_cmd;
  input [(`FIRE_J2D_DI_CTAG_WDTH - 1):0] j2d_di_ctag;
  input                                  j2d_di_cmd_vld;
  
  // data port
  input [(`FIRE_J2D_D_DATA_WDTH - 1):0] j2d_d_data;
  input [(`FIRE_J2D_D_DPAR_WDTH - 1):0] j2d_d_data_par;
  input                                 j2d_d_data_err;
  input                                 j2d_d_data_vld;
  
  // ----- PIO RD/WR REQ -----
  
  // command port
  input  [(`FIRE_J2D_P_CMD_WDTH - 1):0] j2d_p_cmd;
  input [(`FIRE_J2D_P_ADDR_WDTH - 1):0] j2d_p_addr;
  input [(`FIRE_J2D_P_BMSK_WDTH - 1):0] j2d_p_bmsk;
  input [(`FIRE_J2D_P_CTAG_WDTH - 1):0] j2d_p_ctag;
  input                                 j2d_p_cmd_vld;
  
  // data port
  input [(`FIRE_J2D_P_DATA_WDTH - 1):0] j2d_p_data;
  input [(`FIRE_J2D_P_DPAR_WDTH - 1):0] j2d_p_data_par;
  input                                 j2d_p_data_vld;
  
  // --------------------------------------------------------
  // ILU Interface
  // --------------------------------------------------------
  
  // ----- DOU-DMA Status Port -----
  output [(`FIRE_DLC_DOU_REL_WDTH - 1):0] k2y_dou_dptr;
  output 				  k2y_dou_err;
  output 				  k2y_dou_vld;
  
  // --------------------------------------------------------
  // PSB Interface
  // --------------------------------------------------------
  
  // ----- Scoreboard Access Port -----
  output [(`FIRE_DLC_PSR_CMD_TYPE_WDTH - 1):0] cl2ps_e_cmd_type;
  output      [(`FIRE_DLC_PSR_TRN_WDTH - 1):0] cl2ps_e_trn;
  output [(`FIRE_DLC_PSR_PIO_DATA_WDTH - 1):0] cl2ps_e_wr_data;
  output                                       cl2ps_e_req;
  input   [(`FIRE_DLC_PSR_DMA_DATA_WDTH - 1):0] ps2cl_e_rd_data;
  input                                        ps2cl_e_gnt;
  
  // --------------------------------------------------------
  // CMU Interface
  // --------------------------------------------------------
  
  // ----- Egress Packet Record (EPR) Port -----
  output [(`FIRE_DLC_EPR_REC_WDTH - 1):0] cl2cm_rcd;
  output                                  cl2cm_rcd_enq;
  input                                   cm2cl_rcd_full;
  
  // --------------------------------------------------------
  // MMU Interface
  // --------------------------------------------------------
  
  // ----- Tablewalk Data Response (TDR) Port -----
  output [(`FIRE_DLC_TDR_WDTH - 1):0] cl2mm_tdr_rcd;
  output                              cl2mm_tdr_vld;
  
  // --------------------------------------------------------
  // DOU Interface
  // --------------------------------------------------------
  
  // ----- DMA Data Buffer Write Port -----
  output [(`FIRE_DLC_CDD_DATA_WDTH - 1):0] cl2do_dma_data;
  output [(`FIRE_DLC_CDD_DPAR_WDTH - 1):0] cl2do_dma_dpar;
  output [(`FIRE_DLC_CDD_ADDR_WDTH - 1):0] cl2do_dma_addr;
  output                                   cl2do_dma_wr;
  
  // ----- PIO Data Buffer Write Port -----
  output [(`FIRE_DLC_CPD_DATA_WDTH - 1):0] cl2do_pio_data;
  output [(`FIRE_DLC_CPD_DPAR_WDTH - 1):0] cl2do_pio_dpar;
  output [(`FIRE_DLC_CPD_ADDR_WDTH - 1):0] cl2do_pio_addr;
  output                                   cl2do_pio_wr;
  
  // --------------------------------------------------------
  // CTM Interface
  // --------------------------------------------------------
  
  // ----- Unsupported Request Record (URR) Port -----
  output                                 crm2ctm_rcd_deq;
  input [(`FIRE_DLC_CLU_URR_WDTH - 1):0] ctm2crm_rcd;
  input                                  ctm2crm_rcd_enq;
  
  // ----- DMA/INT Tag Return Port -----
  output [3:0] crm2ctm_tag;
  output       crm2ctm_tag_enq;
  
  // ----- from peu force 1 non-posted write outstanding -----
  input   p2d_npwr_stall_en;
  input   rm2crm_npwr_wrack;

  input   im2crm_bc_stall_en;
  input   im2crm_ilu_stall_en;
  input   il2cl_gr_16;

  
  // used for npwr stall to keep ehb from filling
  input  		 	      d2j_cmd_bit3;
  input                               d2j_cmd_vld;
  // --------------------------------------------------------
  // CRU Interface
  // --------------------------------------------------------
  
  // ----- Debug Ports -----
  output [`FIRE_DBG_DATA_BITS] crm_dbg0_bus_a;
  output [`FIRE_DBG_DATA_BITS] crm_dbg0_bus_b;
  output [`FIRE_DBG_DATA_BITS] crm_dbg1_bus_a;
  output [`FIRE_DBG_DATA_BITS] crm_dbg1_bus_b;
  input [2:0] 		       cr2cl_dbg_sel_a;
  input [2:0] 		       cr2cl_dbg_sel_b;
  
  // ----- Config Packet Setup -----
  input [`FIRE_PCIE_BUS_NUM_BITS] cr2cl_bus_num;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  // debug ports
  reg [`FIRE_DBG_DATA_BITS]    dbg0_bus [0:1];
  reg [`FIRE_DBG_DATA_BITS]    dbg1_bus [0:1];
  
  // ********** Non-Flops ******
  
  // debug ports
  reg [2:0] 		       dbg0_sel [0:1];
  reg [`FIRE_DBG_DATA_BITS]    nxt_dbg0_bus [0:1];
  reg [2:0] 		       dbg1_sel [0:1];
  reg [`FIRE_DBG_DATA_BITS]    nxt_dbg1_bus [0:1];
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // --------------------------------------------------------
  // DCR FIFO Interface
  // --------------------------------------------------------
  
  wire [(DCR_WDTH - 1):0] dcr_fifo_dout;
  wire                    dcr_deq;
  wire                    dcr_fifo_empty;
  
  // --------------------------------------------------------
  // PCR FIFO Interface
  // --------------------------------------------------------
  
  wire [(PCR_WDTH - 1):0] pcr_fifo_dout;
  wire                    pcr_deq;
  wire                    pcr_fifo_empty;
  
  // --------------------------------------------------------
  // URR FIFO Interface
  // --------------------------------------------------------
  
  wire [(`FIRE_DLC_CLU_URR_WDTH - 1):0] urr_fifo_dout;
  wire                                  urr_deq;
  wire                                  urr_fifo_empty;
  
  // --------------------------------------------------------
  // DCR Field Declarations
  // --------------------------------------------------------
  
  wire  [(DCR_CMD_WDTH - 1):0] dcr_cmd;
  wire [(DCR_CTAG_WDTH - 1):0] dcr_ctag;
  
  // --------------------------------------------------------
  // PCR Field Declarations
  // --------------------------------------------------------
  
  wire  [(PCR_CMD_WDTH - 1):0] pcr_cmd;
  wire [(PCR_ADDR_WDTH - 1):0] pcr_addr;
  wire [(PCR_BMSK_WDTH - 1):0] pcr_bmsk;
  wire [(PCR_CTAG_WDTH - 1):0] pcr_ctag;
  
  // --------------------------------------------------------
  // URR Field Declarations
  // --------------------------------------------------------
  
  wire    [(`FIRE_DLC_CLU_URR_TYP_WDTH - 1):0] urr_typ;
  wire [(`FIRE_DLC_CLU_URR_SBDTAG_WDTH - 1):0] urr_sbdtag;
  
  // --------------------------------------------------------
  // TDR Field Declarations
  // --------------------------------------------------------
  
  wire 					 tdr_cerr;
  wire 					 tdr_derr;
  wire [(`FIRE_DLC_TDR_MTAG_WDTH - 1):0] tdr_mtag;
  wire [(`FIRE_DLC_TDR_DPAR_WDTH - 1):0] tdr_dpar;
  wire [(`FIRE_DLC_TDR_DATA_WDTH - 1):0] tdr_data;
  
  // --------------------------------------------------------
  // DCR CTAG Field Declarations
  // --------------------------------------------------------
  
  wire    [(DCTAG_MISC_WDTH - 1):0] dcr_ctag_misc;
  wire    [(DCTAG_DPTR_WDTH - 1):0] dcr_ctag_dptr;
  wire [(DCTAG_TRNSNUM_WDTH - 1):0] dcr_ctag_trnsnum;
  wire 				    dcr_ctag_typ;
  
  // --------------------------------------------------------
  // PCR CTAG Field Declarations
  // --------------------------------------------------------
  
  wire [(PCTAG_TRNSNUM_WDTH - 1):0] pcr_ctag_trnsnum;
// BP N2 5-24-04
//  wire  [(PCTAG_AGNTID_WDTH - 1):0] pcr_ctag_agntid;
//  wire  [(PCTAG_TRNSID_WDTH - 1):0] pcr_ctag_trnsid;
  wire  [(PCTAG_THRDID_WDTH - 1):0] pcr_ctag_thrdid;
  
  // --------------------------------------------------------
  // PSB RD_DATA (PSRD) Field Declarations
  // --------------------------------------------------------
  
  wire [(`FIRE_DLC_PSR_BYTECNT_WDTH - 1):0] psb_rd_bcnt;
  wire  [(`FIRE_DLC_PSR_LENGTH_WDTH - 1):0] psb_rd_len;
  wire   [(`FIRE_DLC_PSR_PKSEQ_WDTH - 1):0] psb_rd_pktseq;
  wire    [(`FIRE_DLC_PSR_CNTX_WDTH - 1):0] psb_rd_cntxtnum;
  wire   [(`FIRE_DLC_PSR_TRTAG_WDTH - 1):0] psb_rd_sbdtag;
  
  // --------------------------------------------------------
  // MISC
  // --------------------------------------------------------
  
  wire [4:0] 				    dcr_pktag;
  wire 					    dcr_clsts;
  wire 					    pcr_typ;
  wire 					    mdo_vld;
  wire 					    drd_vld;
  wire 					    tdr_vld;
  wire [1:0] 				    pkt_sel;
  wire 					    epr_ld;
  wire 					    start_psb_op;
  wire [1:0] 				    psb_op_typ;
  wire 					    psb_ld;
  wire [1:0] 				    trn_sel;
  wire 					    done_psb_op;
  wire 					    done_psb_rd;
  wire 					    grnt_lck;
  wire 					    urr_grnt;
  wire 					    pcr_grnt;
  wire 					    dcr_grnt;
  wire 					    urr_req;
  wire 					    pcr_req;
  wire 					    dcr_req;
  wire 					    pcr_fifo_empty_out;
  
  // idle checks
  wire 					    crm_idle;
  wire 					    pktctlfsm_idle;
  wire 					    psbctlfsm_idle;
  
  // --------------------------------------------------------
  // Debug Ports
  // --------------------------------------------------------
  
  wire [3:0] 				    pktctlfsm_state;
  wire [4:0] 				    psbctlfsm_state;
  wire [7:0] 				    inmod_dbg0_0;
  wire [7:0] 				    inmod_dbg0_1;
  wire [7:0] 				    inmod_dbg0_2;
  wire [7:0] 				    inmod_dbg0_3;
  wire [7:0] 				    inmod_dbg0_4;
  wire [7:0] 				    inmod_dbg0_5;
  wire [7:0] 				    inmod_dbg0_6;
  wire [7:0] 				    inmod_dbg0_7;
  wire [7:0] 				    inmod_dbg1_0;
  wire [7:0] 				    inmod_dbg1_1;
  wire [7:0] 				    inmod_dbg1_2;
  wire [7:0] 				    inmod_dbg1_3;
  wire [7:0] 				    inmod_dbg1_4;
  wire [7:0] 				    inmod_dbg1_5;
  wire [7:0] 				    inmod_dbg1_7;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // 0in kndr -var ps2cl_e_gnt
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // IDLE Checker
  // --------------------------------------------------------
  
  assign crm_idle = (dcr_fifo_empty & pcr_fifo_empty & urr_fifo_empty &
		     pktctlfsm_idle & psbctlfsm_idle & ~j2d_d_data_vld &
		     ~j2d_p_data_vld & ~cl2mm_tdr_vld & ~cl2do_dma_wr &
		     ~cl2do_pio_wr & ~k2y_dou_vld);
  
  // --------------------------------------------------------
  // Debug Port 0
  // --------------------------------------------------------
  
  // ----- debug0 bus assignments ----------------
  
  assign inmod_dbg0_0 = {j2d_di_cmd_vld, j2d_d_data_vld, j2d_d_data_err,
			 j2d_p_cmd_vld, j2d_p_data_vld, cl2cm_rcd_enq,
			 cm2cl_rcd_full, cl2mm_tdr_vld};
  assign inmod_dbg0_1 = {cl2do_dma_wr, cl2do_dma_addr};
  assign inmod_dbg0_2 = {1'b0, k2y_dou_vld, k2y_dou_err, k2y_dou_dptr};
  assign inmod_dbg0_3 = {1'b0, cl2ps_e_req, ps2cl_e_gnt, cl2ps_e_trn};
  assign inmod_dbg0_4 = {1'b0, cl2do_pio_wr, cl2do_pio_addr};
  assign inmod_dbg0_5 = {1'b0, crm2ctm_rcd_deq, ctm2crm_rcd_enq,
			 crm2ctm_tag_enq, crm2ctm_tag};
  assign inmod_dbg0_6 = {dcr_fifo_empty, dcr_deq, pcr_fifo_empty, pcr_deq,
			 urr_fifo_empty, urr_deq, tdr_cerr, tdr_derr};
  assign inmod_dbg0_7 = {dcr_ctag_trnsnum, pcr_ctag_trnsnum};
  
  // ----- debug0 port logic ---------------------
  
  // debug0 select assignments
  always @(cr2cl_dbg_sel_a or cr2cl_dbg_sel_b)
    begin
      dbg0_sel[0] = cr2cl_dbg_sel_a;
      dbg0_sel[1] = cr2cl_dbg_sel_b;
    end
  
  // debug0_bus select
  always @(dbg0_sel[0] or dbg0_sel[1] or inmod_dbg0_0 or inmod_dbg0_1 or
           inmod_dbg0_2 or inmod_dbg0_3 or inmod_dbg0_4 or inmod_dbg0_5 or
           inmod_dbg0_6 or inmod_dbg0_7)
    begin : dbg0_bus_sel
      integer i;
      for (i=0; i<2; i=i+1)
	begin
	  case (dbg0_sel[i]) // synopsys infer_mux
	    3'b000: nxt_dbg0_bus[i] = inmod_dbg0_0;
	    3'b001: nxt_dbg0_bus[i] = inmod_dbg0_1;
	    3'b010: nxt_dbg0_bus[i] = inmod_dbg0_2;
	    3'b011: nxt_dbg0_bus[i] = inmod_dbg0_3;
	    3'b100: nxt_dbg0_bus[i] = inmod_dbg0_4;
	    3'b101: nxt_dbg0_bus[i] = inmod_dbg0_5;
	    3'b110: nxt_dbg0_bus[i] = inmod_dbg0_6;
	    3'b111: nxt_dbg0_bus[i] = inmod_dbg0_7;
	  endcase
	end
    end
  
  // register debug0 busses
  always @(posedge clk)
    if (~rst_l)
      begin : dbg0_bus_reg_reset
      integer i;
      for (i=0; i<2; i=i+1)
	begin
	  dbg0_bus[i] <= `FIRE_DEBUG_WDTH'b0;
	end
      end
    else begin : dbg0_bus_reg
      integer i;
      for (i=0; i<2; i=i+1)
	begin
	  dbg0_bus[i] <= nxt_dbg0_bus[i];
	end
    end
  
  // output debug0 busses
  assign crm_dbg0_bus_a = dbg0_bus[0];
  assign crm_dbg0_bus_b = dbg0_bus[1];
  
  // --------------------------------------------------------
  // Debug Port 1
  // --------------------------------------------------------
  
  // ----- debug1 bus assignments ----------------
  
  assign inmod_dbg1_0 = {2'b0, dcr_ctag_typ, dcr_clsts, pcr_typ, mdo_vld,
			 drd_vld, tdr_vld};
  assign inmod_dbg1_1 = {2'b0, epr_ld, psb_ld, pkt_sel, trn_sel};
  assign inmod_dbg1_2 = {3'b0, psb_op_typ, start_psb_op, done_psb_op,
			 done_psb_rd};
  assign inmod_dbg1_3 = {1'b0, grnt_lck, urr_req, pcr_req, dcr_req, urr_grnt,
			 pcr_grnt, dcr_grnt};
  assign inmod_dbg1_4 = {4'b0, pktctlfsm_state};
  assign inmod_dbg1_5 = {3'b0, psbctlfsm_state};
  assign inmod_dbg1_7 = {7'b0, crm_idle};
  
  // ----- debug1 port logic ---------------------
  
  // debug1 select assignments
  always @(cr2cl_dbg_sel_a or cr2cl_dbg_sel_b)
    begin
      dbg1_sel[0] = cr2cl_dbg_sel_a;
      dbg1_sel[1] = cr2cl_dbg_sel_b;
    end
  
  // debug1_bus select
  always @(dbg1_sel[0] or dbg1_sel[1] or inmod_dbg1_0 or inmod_dbg1_1 or
           inmod_dbg1_2 or inmod_dbg1_3 or inmod_dbg1_4 or inmod_dbg1_5 or
           inmod_dbg1_7)
    begin : dbg1_bus_sel
      integer i;
      for (i=0; i<2; i=i+1)
	begin
	  case (dbg1_sel[i]) // synopsys infer_mux
	    3'b000: nxt_dbg1_bus[i] = inmod_dbg1_0;
	    3'b001: nxt_dbg1_bus[i] = inmod_dbg1_1;
	    3'b010: nxt_dbg1_bus[i] = inmod_dbg1_2;
	    3'b011: nxt_dbg1_bus[i] = inmod_dbg1_3;
	    3'b100: nxt_dbg1_bus[i] = inmod_dbg1_4;
	    3'b101: nxt_dbg1_bus[i] = inmod_dbg1_5;
	    3'b110: nxt_dbg1_bus[i] = 8'h0;
	    3'b111: nxt_dbg1_bus[i] = inmod_dbg1_7;
	  endcase
	end
    end
  
  // register debug1 busses
  always @(posedge clk)
    if (~rst_l)
      begin : dbg1_bus_reg_reset
      integer i;
      for (i=0; i<2; i=i+1)
	begin
	  dbg1_bus[i] <= `FIRE_DEBUG_WDTH'b0;
	end
      end
    else begin : dbg1_bus_reg
      integer i;
      for (i=0; i<2; i=i+1)
	begin
	  dbg1_bus[i] <= nxt_dbg1_bus[i];
	end
    end
  
  // output debug1 busses
  assign crm_dbg1_bus_a = dbg1_bus[0];
  assign crm_dbg1_bus_b = dbg1_bus[1];
  
  // --------------------------------------------------------
  // DCR Field Assignments
  // --------------------------------------------------------
  
  // dcr field assignments
  assign dcr_cmd  = dcr_fifo_dout[DCR_CMD_MSB:DCR_CMD_LSB];
  assign dcr_ctag = dcr_fifo_dout[DCR_CTAG_MSB:DCR_CTAG_LSB];
  
  // dcr ctag assignments
  assign dcr_ctag_typ     = dcr_ctag[DCTAG_TYP];
  assign dcr_ctag_trnsnum = dcr_ctag[DCTAG_TRNSNUM_MSB:DCTAG_TRNSNUM_LSB];
  assign dcr_ctag_dptr    = dcr_ctag[DCTAG_DPTR_MSB:DCTAG_DPTR_LSB];
  assign dcr_ctag_misc    = dcr_ctag[DCTAG_MISC_MSB:DCTAG_MISC_LSB];
  
  // dcr pktag assignment for pktgen
  assign dcr_pktag = dcr_ctag_misc[5:1];
  // dcr cl_sts assignment for pktctlfsm
  assign dcr_clsts = dcr_ctag_misc[0];
  
  // --------------------------------------------------------
  // PCR Field Assignments
  // --------------------------------------------------------
  
  // pcr field assignments
  assign pcr_cmd  = pcr_fifo_dout[PCR_CMD_MSB:PCR_CMD_LSB];
  assign pcr_addr = pcr_fifo_dout[PCR_ADDR_MSB:PCR_ADDR_LSB];
  assign pcr_bmsk = pcr_fifo_dout[PCR_BMSK_MSB:PCR_BMSK_LSB];
  assign pcr_ctag = pcr_fifo_dout[PCR_CTAG_MSB:PCR_CTAG_LSB];
  
  // pcr ctag assignments
  assign pcr_ctag_trnsnum = pcr_ctag[PCTAG_TRNSNUM_MSB:PCTAG_TRNSNUM_LSB];
//BP n2 5-24-04
//  assign pcr_ctag_agntid  = pcr_ctag[PCTAG_AGNTID_MSB:PCTAG_AGNTID_LSB];
//  assign pcr_ctag_trnsid  = pcr_ctag[PCTAG_TRNSID_MSB:PCTAG_TRNSID_LSB];
  assign pcr_ctag_thrdid  = pcr_ctag[PCTAG_THRDID_MSB:PCTAG_THRDID_LSB];
  
  // --------------------------------------------------------
  // URR Field Assignments
  // --------------------------------------------------------
  
  assign urr_typ    = urr_fifo_dout[`FIRE_DLC_CLU_URR_TYP];
  assign urr_sbdtag = urr_fifo_dout[`FIRE_DLC_CLU_URR_SBDTAG];
  
  // --------------------------------------------------------
  // PSB RD_DATA Field Assignments
  // --------------------------------------------------------
  
  assign psb_rd_bcnt     = ps2cl_e_rd_data[`FIRE_DLC_PSR_BYTECNT];
  assign psb_rd_len      = ps2cl_e_rd_data[`FIRE_DLC_PSR_LENGTH];
  assign psb_rd_pktseq   = ps2cl_e_rd_data[`FIRE_DLC_PSR_PKSEQ];
  assign psb_rd_cntxtnum = ps2cl_e_rd_data[`FIRE_DLC_PSR_CNTX];
  assign psb_rd_sbdtag   = ps2cl_e_rd_data[`FIRE_DLC_PSR_TRTAG];
  
  // --------------------------------------------------------
  // TDR Construction
  // --------------------------------------------------------
  
  assign cl2mm_tdr_rcd[`FIRE_DLC_TDR_CERR] = tdr_cerr;
  assign cl2mm_tdr_rcd[`FIRE_DLC_TDR_DERR] = tdr_derr;
  assign cl2mm_tdr_rcd[`FIRE_DLC_TDR_MTAG] = tdr_mtag;
  assign cl2mm_tdr_rcd[`FIRE_DLC_TDR_DPAR] = tdr_dpar;
  assign cl2mm_tdr_rcd[`FIRE_DLC_TDR_DATA] = tdr_data;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // PKTCTLFSM
  dmu_clu_crm_pktctlfsm pktctlfsm
    (
     // clock/reset
     .clk                 (clk),
     .rst_l               (rst_l),
     
     // fsm inputs
     .dcr_fifo_empty      (dcr_fifo_empty),
     .pcr_fifo_empty      (pcr_fifo_empty),
     .urr_fifo_empty      (urr_fifo_empty),
     .dcr_grnt            (dcr_grnt),
     .pcr_grnt            (pcr_grnt),
     .urr_grnt            (urr_grnt),
     .cm2cl_rcd_full      (cm2cl_rcd_full),
     .done_psb_op         (done_psb_op),
     .pcr_typ             (pcr_typ),
     .mdo_vld             (mdo_vld),
     .drd_vld             (drd_vld),
     .tdr_vld             (tdr_vld),
     .dcr_clsts           (dcr_clsts),
     
     // fsm outputs
     .dcr_req             (dcr_req),
     .pcr_req             (pcr_req),
     .urr_req             (urr_req),
     .dcr_deq             (dcr_deq),
     .pcr_deq             (pcr_deq),
     .urr_deq             (urr_deq),
     .grnt_lck            (grnt_lck),
     .pkt_sel             (pkt_sel),
     .epr_ld              (epr_ld),
     .cl2cm_rcd_enq       (cl2cm_rcd_enq),
     .crm2ctm_tag_enq     (crm2ctm_tag_enq),
     .crm2ctm_rcd_deq     (crm2ctm_rcd_deq),
     .start_psb_op        (start_psb_op),
     .psb_op_typ          (psb_op_typ),
     .psb_ld              (psb_ld),
     .trn_sel             (trn_sel),
     
     // debug port
     .pktctlfsm_state     (pktctlfsm_state),
     
     // idle checker port
     .pktctlfsm_idle      (pktctlfsm_idle)
     );
  
  // PSBCTLFSM
  dmu_clu_crm_psbctlfsm psbctlfsm
    (
     // clock/reset
     .clk                  (clk),
     .rst_l                (rst_l),
     
     // fsm inputs
     .start_psb_op         (start_psb_op),
     .psb_op_typ           (psb_op_typ),
     .ps2cl_e_gnt          (ps2cl_e_gnt),
     
     // fsm outputs
     .done_psb_op          (done_psb_op),
     .done_psb_rd          (done_psb_rd),
     .cl2ps_e_req          (cl2ps_e_req),
     .cl2ps_e_cmd_type     (cl2ps_e_cmd_type),
     
     // debug port
     .psbctlfsm_state      (psbctlfsm_state),
     
     // idle checker port
     .psbctlfsm_idle       (psbctlfsm_idle)
     );
  
  // ARBITER
  dmu_clu_crm_arb arb
    (
     // clock/reset
     .clk          (clk),
     .rst_l        (rst_l),
     
     // ctl port
     .grant        ({urr_grnt, pcr_grnt, dcr_grnt}),
     .req          ({urr_req,  pcr_req,  dcr_req}),
     .grnt_lck     (grnt_lck)
     );
  
  // PKTGEN
  dmu_clu_crm_pktgen pktgen
    (
     // clock
     .clk                  (clk),
     .rst_l                (rst_l),
     
     // cmu : epr port
     .cl2cm_rcd            (cl2cm_rcd),
     
     // psb : sbd access port
     .cl2ps_e_trn          (cl2ps_e_trn),
     .cl2ps_e_wr_data      (cl2ps_e_wr_data),
     .psb_rd_bcnt          (psb_rd_bcnt),
     .psb_rd_len           (psb_rd_len),
     .psb_rd_pktseq        (psb_rd_pktseq),
     .psb_rd_cntxtnum      (psb_rd_cntxtnum),
     .psb_rd_sbdtag        (psb_rd_sbdtag),
     
     // cru : config packet setup
     .cr2cl_bus_num        (cr2cl_bus_num),
     
     // ctm : tag return port
     .crm2ctm_tag          (crm2ctm_tag),
     
     // pkt_gen sel port
     .pkt_sel              (pkt_sel),
     .psb_ld               (psb_ld),
     .trn_sel              (trn_sel),
     .epr_ld               (epr_ld),
     .done_psb_rd          (done_psb_rd),
     
     // dcr port
     .dcr_cmd              (dcr_cmd),
     .dcr_ctag_typ         (dcr_ctag_typ),
     .dcr_ctag_trnsnum     (dcr_ctag_trnsnum),
     .dcr_ctag_dptr        (dcr_ctag_dptr),
     .dcr_pktag            (dcr_pktag),
     
     // pcr port
     .pcr_cmd              (pcr_cmd),
     .pcr_addr             (pcr_addr),
     .pcr_bmsk             (pcr_bmsk),
     .pcr_ctag_trnsnum     (pcr_ctag_trnsnum),
//BP n2 5-24-04
//     .pcr_ctag_agntid      (pcr_ctag_agntid),
//     .pcr_ctag_trnsid      (pcr_ctag_trnsid),
     .pcr_ctag_thrdid      (pcr_ctag_thrdid),
     
     // urr port
     .urr_typ              (urr_typ),
     .urr_sbdtag           (urr_sbdtag),
     
     // type port
     .mdo_vld              (mdo_vld),
     .drd_vld              (drd_vld),
     .tdr_vld              (tdr_vld),
     .pcr_typ              (pcr_typ)
     );
  
  // DATA CTL
  dmu_clu_crm_datactl datactl
    (
     // clock/reset
     .clk                (clk),
     .rst_l              (rst_l),
     
     // jbc: dma data ctl port
     .dctag_typ          (j2d_di_ctag[DCTAG_TYP]),
     .dctag_dptr         (j2d_di_ctag[DCTAG_DPTR_MSB:DCTAG_DPTR_LSB]),
     .dctag_misc         (j2d_di_ctag[DCTAG_MISC_MSB:DCTAG_MISC_LSB]),
     .j2d_di_cmd         (j2d_di_cmd),
     .j2d_di_cmd_vld     (j2d_di_cmd_vld),
     .j2d_d_data_err     (j2d_d_data_err),
     .j2d_d_data_vld     (j2d_d_data_vld),
     
     // jbc: pio data ctl port
     .pctag_trnsnum      (j2d_p_ctag[PCTAG_TRNSNUM_MSB:PCTAG_TRNSNUM_LSB]),
     .j2d_p_cmd_vld      (j2d_p_cmd_vld),
     .j2d_p_data_vld     (j2d_p_data_vld),
     
     // mmu: tdr port
     .tdr_mtag           (tdr_mtag),
     .tdr_cerr           (tdr_cerr),
     .cl2mm_tdr_vld      (cl2mm_tdr_vld),
     
     // dou: data ctl port
     .cl2do_dma_addr     (cl2do_dma_addr),
     .cl2do_dma_wr       (cl2do_dma_wr),
     .cl2do_pio_addr     (cl2do_pio_addr),
     .cl2do_pio_wr       (cl2do_pio_wr),
     
     // ilu: cacheline sts port
     .k2y_dou_dptr       (k2y_dou_dptr),
     .k2y_dou_err        (k2y_dou_err),
     .k2y_dou_vld        (k2y_dou_vld)
     );
  
  // DATA PIPE
  dmu_clu_crm_datapipe datapipe
    (
     // clock
     .clk                (clk),
     .rst_l              (rst_l),
     
     // jbc: dma data port
     .j2d_d_data_vld     (j2d_d_data_vld),
     .j2d_d_data         (j2d_d_data),
     .j2d_d_data_par     (j2d_d_data_par),
     .j2d_d_data_err     (j2d_d_data_err),
     
     // jbc: pio data port
     .j2d_p_data         (j2d_p_data),
     .j2d_p_data_par     (j2d_p_data_par),
     
     // mmu: tdr port
     .tdr_data           (tdr_data),
     .tdr_dpar           (tdr_dpar),
     .tdr_derr           (tdr_derr),
     
     // dou: data port
     .cl2do_dma_data     (cl2do_dma_data),
     .cl2do_dma_dpar     (cl2do_dma_dpar),
     .cl2do_pio_data     (cl2do_pio_data),
     .cl2do_pio_dpar     (cl2do_pio_dpar)
     );
  
  // --------------------------------------------------------------------------
  // NOTE:
  //       *** DCR FIFO ***
  // 
  //       the "fifo_full port" is unconnected since this fifo serves as a cmd
  //       buffer for the JBC-DMC interface. this interface is "cmd push",
  //       hence no back-pressure ability. this fifo is maximally sized at 16
  //       entries according to the credit base specified by the JBC-DMC
  //       interface protocol.
  // --------------------------------------------------------------------------
  
  // DCR FIFO
  dmu_common_simple_fifo
    #(DCR_WDTH, DCR_FDEPTH, DCR_FPTR_WDTH, DCR_FDEPTH_MINONE) dcr_fifo
      (
       // clock/reset
       .clk                  (clk),
       .rst_l                (rst_l),
       
       // enq port
       .data_in              ({j2d_di_cmd, j2d_di_ctag}),
       .write                (j2d_di_cmd_vld),
       
       // deq port
       .data_out             (dcr_fifo_dout),
       .read                 (dcr_deq),
       
       // status port
       .fifo_full            (),
       .fifo_almost_full     (),
       .fifo_empty           (dcr_fifo_empty)
       );
  
  // --------------------------------------------------------------------------
  // NOTE:
  //       *** PCR FIFO ***
  // 
  //       the "fifo_full port" is unconnected since this fifo serves as a cmd
  //       buffer for the JBC-DMC interface. this interface is "cmd push",
  //       hence no back-pressure ability. this fifo is maximally sized at 16
  //       entries according to the credit base specified by the JBC-DMC
  //       interface protocol.
  // --------------------------------------------------------------------------
  
  // PCR FIFO
  dmu_common_simple_fifo
    #(PCR_WDTH, PCR_FDEPTH, PCR_FPTR_WDTH, PCR_FDEPTH_MINONE) pcr_fifo
      (
       // clock/reset
       .clk                  (clk),
       .rst_l                (rst_l),
       
       // enq port
       .data_in              ({j2d_p_cmd, j2d_p_addr, j2d_p_bmsk, j2d_p_ctag}),
       .write                (j2d_p_cmd_vld),
       
       // deq port
       .data_out             (pcr_fifo_dout),
       .read                 (pcr_deq),
       
       // status port
       .fifo_full            (),
       .fifo_almost_full     (),
       .fifo_empty           (pcr_fifo_empty_out)
       );

//BP npwr is non-posted pio write
// 12-02-05 for bug 106560, if PIO write is non-posted(config or I/O write) then
// if enabled force only 1 outstanding non-posted write
 wire sync_npwr_stall_en;
reg	[1:0]	stall_state;
reg	[1:0]	next_stall_state;
 wire	non_post_write	= ( (pcr_cmd[3:0]== 4'b0110) | (pcr_cmd[3:0] == 4'b0111) ) & pcr_deq;
  cl_a1_clksyncff_4x npwr_stall_syncff ( .d(p2d_npwr_stall_en), .si(1'b0), .q( sync_npwr_stall_en), .so(),
        .l1clk(clk), .siclk(1'b0), .soclk(1'b0) );

reg	npwr_stall_d;
  always @(posedge clk)
    if (~rst_l)
      begin
          npwr_stall_d  <= 1'b0;
        end
    else if (rm2crm_npwr_wrack )
        begin
          npwr_stall_d  <= 1'b0;
        end
    else if (sync_npwr_stall_en & non_post_write )
        begin
          npwr_stall_d  <= 1'b1;
        end
    else 
        begin
          npwr_stall_d  <= npwr_stall_d;
        end

reg	[4:0]	pw_count;
reg	[4:0]	nprd_count;
 wire state_stall_decode = ((stall_state == 2'b01) | (stall_state == 2'b11) |
			((stall_state == 2'b10) & ((nprd_count + pw_count) == 5'b11111) ) )
				& im2crm_bc_stall_en;

//BP tmp wire	npwr_stall	= npwr_stall_d & sync_npwr_stall_en;
 wire	npwr_stall	= (npwr_stall_d & sync_npwr_stall_en & !im2crm_bc_stall_en) | 
				state_stall_decode |
				il2cl_gr_16 & im2crm_ilu_stall_en;


 assign	pcr_fifo_empty	= npwr_stall | pcr_fifo_empty_out;
// assign	pcr_fifo_empty	=  pcr_fifo_empty_out;
  
  // --------------------------------------------------------------------------
  // NOTE:
  //       *** ehb full detect ***
  // 
  //      the following logic keeps the ehb from filling with pio's 
  //       
  // --------------------------------------------------------------------------
 
//0in mutex -var {non_post_rd,post_write,non_post_write};
 wire	non_post_rd	= ( (pcr_cmd[3:0] == 4'b1000) | 
			  (pcr_cmd[3:0] == 4'b1001) |
			  (pcr_cmd[3:0] == 4'b1100) |
			  (pcr_cmd[3:0] == 4'b1101) |
			  (pcr_cmd[3:0] == 4'b1110) |
			  (pcr_cmd[3:0] == 4'b1111) ) & pcr_deq;

 wire	post_write	= ( (pcr_cmd[3:0] == 4'b0000) | 
			  (pcr_cmd[3:0] == 4'b0001) |
			  (pcr_cmd[3:0] == 4'b0100) |
			  (pcr_cmd[3:0] == 4'b0101) ) & pcr_deq;

// decode pio rd cpls from d2j
 wire	non_post_rd_ack	= d2j_cmd_vld & (d2j_cmd_bit3 == 1'b1);

// nprd_counter
//0in max -val 16 -var nprd_count
  always @(posedge clk)
    if (~rst_l | ~im2crm_bc_stall_en)
      begin
          nprd_count  <= 5'b0;
        end
    else if (non_post_rd & !non_post_rd_ack )
          nprd_count  <= nprd_count + 5'b1;
    else if (!non_post_rd & non_post_rd_ack )
          nprd_count  <= nprd_count - 5'b1;		//0in < underflow
    else 
          nprd_count  <= nprd_count ;

 wire	pw_counter_clear =  ( (stall_state == 2'b01) & rm2crm_npwr_wrack)  |
			( ((stall_state == 2'b10) | (stall_state == 2'b11))  & (nprd_count == 5'b0)  )
			 ;
// pw_counter
//0in max -val 31 -var nprd_count
  always @(posedge clk)
    if (~rst_l | ~im2crm_bc_stall_en)
      begin
          pw_count  <= 5'b0;
        end
    else if (pw_counter_clear )
          pw_count  <=  5'b0;
    else if (post_write & (stall_state == 2'b10) )
          pw_count  <= pw_count + 5'b1;
    else 
          pw_count  <= pw_count ;


  always @(posedge clk)
    if (~rst_l | ~im2crm_bc_stall_en)
      begin
          stall_state  <= 2'b0;
        end
    else 
      begin
          stall_state  <= next_stall_state;
        end

  always @( pw_count or nprd_count or post_write or non_post_rd or non_post_write or
	stall_state or rm2crm_npwr_wrack ) begin
	next_stall_state	= 2'b00;

	case(stall_state)
	FREE_RUNNING:	if(post_write)						// FREE_RUNNING state_00
		next_stall_state = 2'b00;
		else if (non_post_write)
		next_stall_state = 2'b01;
		else if (non_post_rd)
		next_stall_state = 2'b10;
		else
		next_stall_state = 2'b00;
 
	NPWR_STALL:	if(rm2crm_npwr_wrack & (nprd_count == 5'b0) )		// NPWR_STALL state_01
		next_stall_state = 2'b00;
		else if (rm2crm_npwr_wrack & (nprd_count != 5'b0) )
		next_stall_state = 2'b10;
		else 
		next_stall_state = 2'b01;
	
	POTENTIAL_STALL:	if(non_post_write)				// POTENTIAL_STALL state_10
		next_stall_state = 2'b01;
		else if ((nprd_count == 5'b0) )
		next_stall_state = 2'b00;
		else if((nprd_count + pw_count) == 5'b11111)
		next_stall_state = 2'b11;
		else 
		next_stall_state = 2'b10;

	NPRD_STALL:	if(non_post_write)					// NPRD_STALL state_11
		next_stall_state = 2'b01;
		else if ((nprd_count == 5'b0) )
		next_stall_state = 2'b00;
	      	else if((nprd_count + pw_count) < 5'b11111)	
		next_stall_state = 2'b10;
		else 
		next_stall_state = 2'b11;
	endcase
end


  // --------------------------------------------------------------------------
  // NOTE:
  //       *** URR FIFO ***
  // 
  //       the "fifo_full port" is unconnected since it is managed as a credit
  //       based fifo. the credit management logic is located in the CTM.
  // --------------------------------------------------------------------------
  
  // URR FIFO
  dmu_common_simple_fifo
    #(`FIRE_DLC_CLU_URR_WDTH, URR_FDEPTH, URR_FPTR_WDTH, URR_FDEPTH_MINONE) urr_fifo
      (
       // clock/reset
       .clk                  (clk),
       .rst_l                (rst_l),
       
       // enq port
       .data_in              (ctm2crm_rcd),
       .write                (ctm2crm_rcd_enq),
       
       // deq port
       .data_out             (urr_fifo_dout),
       .read                 (urr_deq),
       
       // status port
       .fifo_full            (),
       .fifo_almost_full     (),
       .fifo_empty           (urr_fifo_empty)
       );
  
endmodule // dmu_clu_crm
