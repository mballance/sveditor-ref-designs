// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_ctm.v
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
module dmu_clu_ctm 
  (
   // clock/reset
   clk,
   rst_l,
   
   // jbc : dmc req/resp port
   d2j_cmd,
   d2j_addr,
   d2j_ctag,
   d2j_cmd_vld,
   d2j_data,
   d2j_bmsk,
   d2j_data_par,
   d2j_data_vld,
   
   // jbc : dma wrack port
   j2d_d_wrack_tag,
   j2d_d_wrack_vld,
   
   // pmu : icr port
   cl2pm_rcd_full,
   pm2cl_rcd,
   pm2cl_rcd_enq,
   
   // mmu : tcr port
   cl2mm_tcr_ack,
   mm2cl_tcr_rcd,
   mm2cl_tcr_req,
   
   // rmu : dou dma buffer rel port
   rm2cl_bufrel,
   rm2cl_bufrel_enq,
   
   // tmu: diu buffer mgr port
   cl2tm_dma_rptr,
   cl2tm_int_rptr,
   tm2cl_dma_wptr,
   tm2cl_pio_wptr,
   
   // diu : data read port
   cl2di_addr,
   cl2di_rd_en,
   di2cl_data,
   di2cl_bmask,
   di2cl_dpar,
   
   // crm : urr port
   ctm2crm_rcd,
   ctm2crm_rcd_enq,
   crm2ctm_rcd_deq,
   
   // crm: dma tag return port
   crm2ctm_tag,
   crm2ctm_tag_enq,
   
   // cru : debug ports
   ctm_dbg0_bus_a,
   ctm_dbg0_bus_b,
   ctm_dbg1_bus_a,
   ctm_dbg1_bus_b,
   cr2cl_dbg_sel_a,
   cr2cl_dbg_sel_b,
   ds2cl_stall
   );
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Ingress Command Record (ICR) FIFO Configuration
  // --------------------------------------------------------
  
  parameter ICR_FDEPTH        = 5'd10;
  parameter ICR_FDEPTH_MINONE = 4'd9;
  parameter ICR_FPTR_WDTH     = 4;
  
  // --------------------------------------------------------
  // TAGMGR Configuration
  // --------------------------------------------------------
  
  parameter TAG_WDTH = 4;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // JBC Interface
  // --------------------------------------------------------
  
  // Cmd Port -> DMC Req/Resp
  output  [(`FIRE_D2J_CMD_WDTH - 1):0] d2j_cmd;
  output [(`FIRE_D2J_ADDR_WDTH - 1):0] d2j_addr;
  output [(`FIRE_D2J_CTAG_WDTH - 1):0] d2j_ctag;
  output                               d2j_cmd_vld;
  
  // Data Port -> DMC Req/Resp
  output [(`FIRE_D2J_DATA_WDTH - 1):0] d2j_data;
  output [(`FIRE_D2J_BMSK_WDTH - 1):0] d2j_bmsk;
  output [(`FIRE_D2J_DPAR_WDTH - 1):0] d2j_data_par;
  output                               d2j_data_vld;
  
  // DMA Wrack Port
  input [(`FIRE_J2D_D_WRACK_WDTH - 1):0] j2d_d_wrack_tag;
  input                                  j2d_d_wrack_vld;
  
  // --------------------------------------------------------
  // PMU Interface
  // --------------------------------------------------------
  
  // Ingress Command Record (ICR) Port
  output                                 cl2pm_rcd_full;
  input [(`FIRE_DLC_ICR_REC_WDTH - 1):0] pm2cl_rcd;
  input                                  pm2cl_rcd_enq;
  
  // --------------------------------------------------------
  // MMU Interface
  // --------------------------------------------------------
  
  // Tablewalk Command Record (TCR) Port
  output                             cl2mm_tcr_ack;
  input [(`FIRE_DLC_TCR_WDTH - 1):0] mm2cl_tcr_rcd;
  input                              mm2cl_tcr_req;
  
  // --------------------------------------------------------
  // RMU Interface
  // --------------------------------------------------------
  
  // DOU DMA Buffer Release Port
  input [(`FIRE_DLC_DOU_REL_WDTH - 1):0] rm2cl_bufrel;
  input                                  rm2cl_bufrel_enq;
  
  // --------------------------------------------------------
  // TMU Interface
  // --------------------------------------------------------
  
  // DIU Buffer Manager Port
  output [(`FIRE_DLC_DMA_RPTR_WDTH - 1):0] cl2tm_dma_rptr;
  output [(`FIRE_DLC_INT_RPTR_WDTH - 1):0] cl2tm_int_rptr;
  input  [(`FIRE_DLC_DMA_WPTR_WDTH - 1):0] tm2cl_dma_wptr;
  input  [(`FIRE_DLC_PIO_WPTR_WDTH - 1):0] tm2cl_pio_wptr;
  
  // --------------------------------------------------------
  // DIU Interface
  // --------------------------------------------------------
  
  // Data Buffer Read Port
  output [(`FIRE_DLC_CRD_ADDR_WDTH - 1):0] cl2di_addr;
  output 				   cl2di_rd_en;
  input  [(`FIRE_DLC_CRD_DATA_WDTH - 1):0] di2cl_data;
  input [(`FIRE_DLC_CRD_BMASK_WDTH - 1):0] di2cl_bmask;
  input  [(`FIRE_DLC_CRD_DPAR_WDTH - 1):0] di2cl_dpar;
  
  // --------------------------------------------------------
  // CRM Interface
  // --------------------------------------------------------
  
  // Unsupported Request Record (URR) Port
  output [(`FIRE_DLC_CLU_URR_WDTH - 1):0] ctm2crm_rcd;
  output                                  ctm2crm_rcd_enq;
  input                                   crm2ctm_rcd_deq;
  
  // DMA/INT Tag-Credit Return Port
  input [3:0] crm2ctm_tag;
  input       crm2ctm_tag_enq;
  
  // --------------------------------------------------------
  // CRU Interface
  // --------------------------------------------------------
  
  // ----- Debug Ports -----
  output [`FIRE_DBG_DATA_BITS] ctm_dbg0_bus_a;
  output [`FIRE_DBG_DATA_BITS] ctm_dbg0_bus_b;
  output [`FIRE_DBG_DATA_BITS] ctm_dbg1_bus_a;
  output [`FIRE_DBG_DATA_BITS] ctm_dbg1_bus_b;
  input [2:0] 		       cr2cl_dbg_sel_a;
  input [2:0] 		       cr2cl_dbg_sel_b;

  input  		       ds2cl_stall;
  
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
  // ICR FIFO Interface
  // --------------------------------------------------------
  
  wire [(`FIRE_DLC_ICR_REC_WDTH - 1):0] icr_fifo_dout;
  wire                                  icr_fifo_rd;
  wire                                  icr_fifo_empty;
  
  // --------------------------------------------------------
  // ICR Field Declarations
  // --------------------------------------------------------
  
  wire    [(`FIRE_DLC_ICR_TYP_WDTH - 1):0] icr_typ;
  wire  [(`FIRE_DLC_ICR_CLSTS_WDTH - 1):0] icr_clsts;
  wire   [(`FIRE_DLC_ICR_ADDR_WDTH - 1):0] icr_addr;
  wire   [(`FIRE_DLC_ICR_STAT_WDTH - 1):0] icr_cmdsts;
  wire   [(`FIRE_DLC_ICR_DPTR_WDTH - 1):0] icr_dptr;
  wire [(`FIRE_DLC_ICR_SBDTAG_WDTH - 1):0] icr_sbdtag;
  
  // --------------------------------------------------------
  // TCR Field Declarations
  // --------------------------------------------------------
  
  wire [(`FIRE_DLC_TCR_ADDR_WDTH - 1):0] tcr_addr;
  wire [(`FIRE_DLC_TCR_MTAG_WDTH - 1):0] tcr_mtag;
  
  // --------------------------------------------------------
  // TAGMGR Outputs
  // --------------------------------------------------------
  
  wire [(TAG_WDTH - 1):0] nxt_tag;
  wire                    nxt_tag_avail;
  wire                    nxt_tag_req;
  
  // --------------------------------------------------------
  // MISC
  // --------------------------------------------------------
  
  wire 			  cmd_req_sel;
  wire 			  diu_dma_bufmgmt_bsy;
  wire 			  diu_eqw_bufmgmt_bsy;
  wire 			  diu_dma_empty;
  wire 			  diu_pio_empty;
  wire [1:0] 		  diu_typ_sel;
  wire 			  inc_dma_blk_addr;
  wire 			  inc_pio_blk_addr;
  wire 			  inc_eqw_blk_addr;
  wire 			  inc_mdo_blk_addr;
  wire 			  ld_diu_addr;
  wire 			  inc_diu_row_ptr;
  wire 			  dpath_sel;
  wire 			  ld_diu_data;
  wire [4:0] 		  dma_dptr;
  wire 			  dou_space_avail;
  wire 			  dma_dptr_req;
  wire 			  mrd_vld;
  wire 			  mwr_vld;
  wire 			  mwr_err;
  wire 			  eqwr_vld;
  wire 			  eqwr_err;
  wire 			  mdo_vld;
  wire 			  uns_vld;
  wire 			  null_vld;
  wire 			  pio16_vld;
  wire 			  pio64_vld;
  wire 			  pio_err;
  wire 			  proc_uns;
  wire 			  uns_req_crdt_avail;
  wire 			  icr_grnt;
  wire 			  proc_pio_err;
  
  // idle checks
  wire 			  ctm_idle;
  wire 			  cmdctlfsm_idle;
  wire 			  datactlfsm_idle;
  wire 			  tag_pool_full;
  wire 			  dou_dptr_pool_full;
  
  // --------------------------------------------------------
  // Debug Ports
  // --------------------------------------------------------
  
  wire [3:0] 		  cmdctlfsm_state;
  wire [4:0] 		  datactlfsm_state;
  wire [7:0] 		  inmod_dbg0_0;
  wire [7:0] 		  inmod_dbg0_1;
  wire [7:0] 		  inmod_dbg0_2;
  wire [7:0] 		  inmod_dbg0_3;
  wire [7:0] 		  inmod_dbg0_4;
  wire [7:0] 		  inmod_dbg0_5;
  wire [7:0] 		  inmod_dbg0_6;
  wire [7:0] 		  inmod_dbg0_7;
  wire [7:0] 		  inmod_dbg1_0;
  wire [7:0] 		  inmod_dbg1_1;
  wire [7:0] 		  inmod_dbg1_2;
  wire [7:0] 		  inmod_dbg1_3;
  wire [7:0] 		  inmod_dbg1_4;
  wire [7:0] 		  inmod_dbg1_5;
  wire [7:0] 		  inmod_dbg1_6;
  wire [7:0] 		  inmod_dbg1_7;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  /* 0in kndr
     -var {tcr_addr, tcr_mtag}
     -active (mm2cl_tcr_req ^ cl2mm_tcr_ack)
  */
  
  /* 0in kndr
     -var icr_typ
     -active ~icr_fifo_empty
  */
  
  /* 0in bits_on
     -var {mrd_vld, mwr_vld, mwr_err, eqwr_vld, eqwr_err, mdo_vld,
           uns_vld, null_vld, pio16_vld, pio64_vld, pio_err}
     -active ~icr_fifo_empty
  */
//BP n2 10-26-04 since DSN adds 1 cycle, ctm cannot send back to back data txn's
//		these 2 checker look to see if this is violated
/* 0in assert_follower -leader (d2j_cmd_vld & d2j_data_vld & ((d2j_cmd[3:0] == 4'b0000) ||
                                                                (d2j_cmd[3:0] == 4'b0001)) )
                        -follower ( ~d2j_cmd_vld )
                        -max 4
                        -min 1
*/
// second for pio 16 byte read return, interrupts, pio rd return errors
/* 0in assert_follower -leader (d2j_cmd_vld & d2j_data_vld & ((d2j_cmd[3:0] == 4'b0100) ||
                                                                (d2j_cmd[3:0] == 4'b1000) ))
                        -follower ( ~d2j_cmd_vld )
                        -max 1
                        -min 1
*/
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // IDLE Checker
  // --------------------------------------------------------
  
  assign ctm_idle = (icr_fifo_empty & cmdctlfsm_idle & datactlfsm_idle &
		     tag_pool_full & dou_dptr_pool_full);
  
  // --------------------------------------------------------
  // Debug Port 0
  // --------------------------------------------------------
  
  // ----- debug0 bus assignments ----------------
  
  assign inmod_dbg0_0 = {pm2cl_rcd_enq, d2j_cmd_vld, d2j_data_vld,
			 j2d_d_wrack_vld, j2d_d_wrack_tag};
  assign inmod_dbg0_1 = {cl2pm_rcd_full, mm2cl_tcr_req, cl2mm_tcr_ack,
			 rm2cl_bufrel};
  assign inmod_dbg0_2 = {rm2cl_bufrel_enq, ctm2crm_rcd_enq, crm2ctm_rcd_deq,
			 crm2ctm_tag_enq, crm2ctm_tag};
  assign inmod_dbg0_3 = {uns_req_crdt_avail, icr_fifo_empty, icr_fifo_rd,
			 mrd_vld, mwr_vld, mwr_err, eqwr_vld, eqwr_err};
  assign inmod_dbg0_4 = {mdo_vld, uns_vld, null_vld, pio16_vld, pio64_vld,
			 pio_err, proc_uns, cmd_req_sel};
  assign inmod_dbg0_5 = {cl2tm_dma_rptr, diu_dma_empty, diu_pio_empty};
  assign inmod_dbg0_6 = {tm2cl_dma_wptr, inc_dma_blk_addr, inc_pio_blk_addr};
  assign inmod_dbg0_7 = {cl2tm_int_rptr, inc_eqw_blk_addr, inc_mdo_blk_addr,
			 ld_diu_addr};
  
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
    if (~rst_l) begin : dbg0_bus_reg_reset
      integer i;
      for (i=0; i<2; i=i+1)
	begin
	  dbg0_bus[i] <= nxt_dbg0_bus[i];
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
  assign ctm_dbg0_bus_a = dbg0_bus[0];
  assign ctm_dbg0_bus_b = dbg0_bus[1];
  
  // --------------------------------------------------------
  // Debug Port 1
  // --------------------------------------------------------
  
  // ----- debug1 bus assignments ----------------
  
  assign inmod_dbg1_0 = {4'b0, cmdctlfsm_state};
  assign inmod_dbg1_1 = {tm2cl_pio_wptr, diu_typ_sel, inc_diu_row_ptr};
  assign inmod_dbg1_2 = {1'b0, dou_space_avail, dma_dptr_req, dma_dptr};
  assign inmod_dbg1_3 = {dpath_sel, nxt_tag, nxt_tag_avail, nxt_tag_req,
			 icr_grnt};
  assign inmod_dbg1_4 = {2'b0, icr_sbdtag, cl2di_addr[8]};
  assign inmod_dbg1_5 = {cl2di_addr[7:0]};
  assign inmod_dbg1_6 = {3'b0, datactlfsm_state};
  assign inmod_dbg1_7 = {icr_dptr, ctm_idle};
  
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
           inmod_dbg1_6 or inmod_dbg1_7)
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
	    3'b110: nxt_dbg1_bus[i] = inmod_dbg1_6;
	    3'b111: nxt_dbg1_bus[i] = inmod_dbg1_7;
	  endcase
	end
    end
  
  // register debug1 busses
  always @(posedge clk)
    if (~rst_l) begin : dbg1_bus_reg_reset
      integer i;
      for (i=0; i<2; i=i+1)
	begin
	  dbg1_bus[i] <= nxt_dbg1_bus[i];
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
  assign ctm_dbg1_bus_a = dbg1_bus[0];
  assign ctm_dbg1_bus_b = dbg1_bus[1];
  
  // --------------------------------------------------------
  // ICR Field Assignments
  // --------------------------------------------------------
  
  assign icr_typ    = icr_fifo_dout[`FIRE_DLC_ICR_TYP];
  assign icr_clsts  = icr_fifo_dout[`FIRE_DLC_ICR_CLSTS];
  assign icr_addr   = icr_fifo_dout[`FIRE_DLC_ICR_ADDR];
  assign icr_cmdsts = icr_fifo_dout[`FIRE_DLC_ICR_STAT];
  assign icr_dptr   = icr_fifo_dout[`FIRE_DLC_ICR_DPTR];
  assign icr_sbdtag = icr_fifo_dout[`FIRE_DLC_ICR_SBDTAG];
  
  // --------------------------------------------------------
  // TCR Field Assignments
  // --------------------------------------------------------
  
  assign tcr_addr = mm2cl_tcr_rcd[`FIRE_DLC_TCR_ADDR];
  assign tcr_mtag = mm2cl_tcr_rcd[`FIRE_DLC_TCR_MTAG];
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // TAGMGR
  dmu_clu_ctm_tagmgr tagmgr
    (
     // clock/reset
     .clk               (clk),
     .rst_l             (rst_l),
     
     // tag retire port 0
     .tag_ret_0         (j2d_d_wrack_tag),
     .tag_ret_0_vld     (j2d_d_wrack_vld),
     
     // tag retire port 1
     .tag_ret_1         (crm2ctm_tag),
     .tag_ret_1_vld     (crm2ctm_tag_enq),
     
     // tag issue port
     .nxt_tag           (nxt_tag),
     
     // tag ctl/status port
     .tag_pool_full     (tag_pool_full),
     .nxt_tag_avail     (nxt_tag_avail),
     .nxt_tag_req       (nxt_tag_req)
     );
  
  // CMDCTLFSM
  dmu_clu_ctm_cmdctlfsm cmdctlfsm
    (
     // clock/reset
     .clk                     (clk),
     .rst_l                   (rst_l),
     
     // fsm inputs
     .mm2cl_tcr_req           (mm2cl_tcr_req),
     .icr_fifo_empty          (icr_fifo_empty),
     .nxt_tag_avail           (nxt_tag_avail),
     .mrd_vld                 (mrd_vld),
     .mwr_vld                 (mwr_vld),
     .eqwr_vld                (eqwr_vld),
     .mdo_vld                 (mdo_vld),
     .pio16_vld               (pio16_vld),
     .pio64_vld               (pio64_vld),
     .uns_vld                 (uns_vld),
     .null_vld                (null_vld),
     .mwr_err                 (mwr_err),
     .eqwr_err                (eqwr_err),
     .pio_err                 (pio_err),
     .diu_dma_bufmgmt_bsy     (diu_dma_bufmgmt_bsy),
     .diu_eqw_bufmgmt_bsy     (diu_eqw_bufmgmt_bsy),
     .diu_dma_empty           (diu_dma_empty),
     .diu_pio_empty           (diu_pio_empty),
     .icr_clsts               (icr_clsts),
     .dou_space_avail         (dou_space_avail),
     .uns_req_crdt_avail      (uns_req_crdt_avail),
     .ds2cl_stall      	      (ds2cl_stall),
     
     // fsm outputs
     .d2j_cmd_vld             (d2j_cmd_vld),
     .d2j_data_vld            (d2j_data_vld),
     .cl2mm_tcr_ack           (cl2mm_tcr_ack),
     .ctm2crm_rcd_enq         (ctm2crm_rcd_enq),
     .cmd_req_sel             (cmd_req_sel),
     .icr_fifo_rd             (icr_fifo_rd),
     .nxt_tag_req             (nxt_tag_req),
     .dma_dptr_req            (dma_dptr_req),
     .proc_uns                (proc_uns),
     .icr_grnt                (icr_grnt),
     .proc_pio_err            (proc_pio_err),
     .cl2di_rd_en             (cl2di_rd_en),
     
     // debug port
     .cmdctlfsm_state         (cmdctlfsm_state),
     
     // idle checker port
     .cmdctlfsm_idle          (cmdctlfsm_idle)
     );
  
  // DATACTLFSM
  dmu_clu_ctm_datactlfsm datactlfsm
    (
     // clock/reset
     .clk                     (clk),
     .rst_l                   (rst_l),
     
     // fsm inputs
     .icr_fifo_empty          (icr_fifo_empty),
     .icr_grnt                (icr_grnt),
     .nxt_tag_avail           (nxt_tag_avail),
     .mwr_vld                 (mwr_vld),
     .eqwr_vld                (eqwr_vld),
     .mdo_vld                 (mdo_vld),
     .pio16_vld               (pio16_vld),
     .pio64_vld               (pio64_vld),
     .null_vld                (null_vld),
     .mwr_err                 (mwr_err),
     .eqwr_err                (eqwr_err),
     .diu_dma_empty           (diu_dma_empty),
     .diu_pio_empty           (diu_pio_empty),
     
     // fsm outputs
     .diu_dma_bufmgmt_bsy     (diu_dma_bufmgmt_bsy),
     .diu_eqw_bufmgmt_bsy     (diu_eqw_bufmgmt_bsy),
     .diu_typ_sel             (diu_typ_sel),
     .inc_dma_blk_addr        (inc_dma_blk_addr),
     .inc_pio_blk_addr        (inc_pio_blk_addr),
     .inc_eqw_blk_addr        (inc_eqw_blk_addr),
     .inc_mdo_blk_addr        (inc_mdo_blk_addr),
     .ld_diu_addr             (ld_diu_addr),
     .inc_diu_row_ptr         (inc_diu_row_ptr),
     .dpath_sel               (dpath_sel),
     .ld_diu_data             (ld_diu_data),
     
     // debug port
     .datactlfsm_state        (datactlfsm_state),
     
     // idle checker port
     .datactlfsm_idle         (datactlfsm_idle)
     );
  
  // CMDGEN
  dmu_clu_ctm_cmdgen cmdgen
    (
     // clock/reset
     .clk                    (clk),
     .rst_l                  (rst_l),
     
     // jbc : cmd port
     .d2j_cmd                (d2j_cmd),
     .d2j_addr               (d2j_addr),
     .d2j_ctag               (d2j_ctag),
     
     // crm : urr port
     .ctm2crm_rcd            (ctm2crm_rcd),
     .crm2ctm_rcd_deq        (crm2ctm_rcd_deq),
     .proc_uns               (proc_uns),
     
     // icr port
     .icr_typ                (icr_typ),
     .icr_clsts              (icr_clsts),
     .icr_addr               (icr_addr),
     .icr_cmdsts             (icr_cmdsts),
     .icr_sbdtag             (icr_sbdtag),
     
     // tcr port
     .tcr_addr               (tcr_addr),
     .tcr_mtag               (tcr_mtag),
     
     // tagmgr port
     .nxt_tag                (nxt_tag),
     
     // bufmgr port
     .dma_dptr               (dma_dptr),
     
     // cmd sel port
     .cmd_req_sel            (cmd_req_sel),
     
     // uns req fifo credit port
     .uns_req_crdt_avail     (uns_req_crdt_avail),
     
     // cmd type control signals
     .mrd_vld                (mrd_vld),
     .mwr_vld                (mwr_vld),
     .mwr_err                (mwr_err),
     .eqwr_vld               (eqwr_vld),
     .eqwr_err               (eqwr_err),
     .mdo_vld                (mdo_vld),
     .uns_vld                (uns_vld),
     .null_vld               (null_vld),
     .pio16_vld              (pio16_vld),
     .pio64_vld              (pio64_vld),
     .pio_err                (pio_err)
     );
  
  // BUFMGR
  dmu_clu_ctm_bufmgr bufmgr
    (
     // clock/reset
     .clk                  (clk),
     .rst_l                (rst_l),
     
     // tmu: diu buffer mgr port
     .cl2tm_dma_rptr       (cl2tm_dma_rptr),
     .cl2tm_int_rptr       (cl2tm_int_rptr),
     .tm2cl_dma_wptr       (tm2cl_dma_wptr),
     .tm2cl_pio_wptr       (tm2cl_pio_wptr),
     
     // rmu : dou dma buffer rel port
     .rm2cl_bufrel         (rm2cl_bufrel),
     .rm2cl_bufrel_enq     (rm2cl_bufrel_enq),
     
     // diu : data read port
     .cl2di_addr           (cl2di_addr),
     
     // dou buffer ctl/sts port
     .dma_dptr             (dma_dptr),
     .dou_space_avail      (dou_space_avail),
     .dma_dptr_req         (dma_dptr_req),
     .dma_cltot            (icr_dptr[3:0]),
     
     // diu buffer ctl/sts port
     .diu_dma_empty        (diu_dma_empty),
     .diu_pio_empty        (diu_pio_empty),
     .diu_typ_sel          (diu_typ_sel),
     .inc_dma_blk_addr     (inc_dma_blk_addr),
     .inc_pio_blk_addr     (inc_pio_blk_addr),
     .inc_eqw_blk_addr     (inc_eqw_blk_addr),
     .inc_mdo_blk_addr     (inc_mdo_blk_addr),
     .ld_diu_addr          (ld_diu_addr),
     .inc_diu_row_ptr      (inc_diu_row_ptr),
     
     // idle checker port
     .dou_dptr_pool_full   (dou_dptr_pool_full)
     );
  
  // DATAPIPE
  dmu_clu_ctm_datapipe datapipe
    (
     // clock
     .clk              (clk),
     .rst_l            (rst_l),
     
     // jbc : dmc req/resp data port
     .d2j_data         (d2j_data),
     .d2j_bmsk         (d2j_bmsk),
     .d2j_data_par     (d2j_data_par),
     
     // diu : data read port
     .di2cl_data       (di2cl_data),
     .di2cl_bmask      (di2cl_bmask),
     .di2cl_dpar       (di2cl_dpar),
     
     // datapath select
     .dpath_sel        (dpath_sel),
     .ld_diu_data      (ld_diu_data),
     .proc_pio_err     (proc_pio_err)		// BP 4-28-05 n2
     );
  
  // ICR_FIFO
  dmu_common_simple_fifo
    #(`FIRE_DLC_ICR_REC_WDTH, ICR_FDEPTH, ICR_FPTR_WDTH, ICR_FDEPTH_MINONE) icr_fifo
      (
       // clock/reset
       .clk                  (clk),
       .rst_l                (rst_l),
       
       // icr enqueue port
       .data_in              (pm2cl_rcd),
       .write                (pm2cl_rcd_enq),
       
       // icr dequeue port
       .data_out             (icr_fifo_dout),
       .read                 (icr_fifo_rd),
       
       // icr fifo status port
       .fifo_full            (),
       .fifo_almost_full     (cl2pm_rcd_full),
       .fifo_empty           (icr_fifo_empty)
       );
  
endmodule // dmu_clu_ctm
