// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_eil.v
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
module dmu_ilu_eil (
			 clk,
			 rst_l,
			 d2p_edb_we,
			 d2p_edb_data,
			 d2p_edb_dpar,
			 d2p_edb_addr,
			 d2p_ehb_we,
			 d2p_ehb_data,
			 d2p_ehb_dpar,
			 d2p_ehb_addr,
			 d2p_ech_wptr,
			 d2p_erh_wptr,
			 p2d_ech_rptr,
			 p2d_erh_rptr,
			 p2d_ecd_rptr,
			 p2d_erd_rptr,
			 k2y_rcd,
			 k2y_rcd_enq,
			 y2k_rcd_deq,
			 y2k_rel_rcd,
			 y2k_rel_enq,
			 k2y_dou_dptr,
			 k2y_dou_err,
			 k2y_dou_vld,
                         k2y_buf_addr_vld_monitor,
                         y2k_buf_addr_vld_monitor,
			 y2k_buf_addr,
			 k2y_buf_data,
			 k2y_buf_dpar,
                         cib2eil_ihb_pe_drain, // caused by iil2cib_ihb_pe
                         cib2eil_pec_drain,    // caused by p2d_drain
//			 cib2eil_drain,
			 eil2isb_log,
			 eil2isb_tag,
			 eil2isb_low_addr,

                         // debug
                         low_dbg_sel_a,
                         low_dbg_sel_b,
                         eil_dbg_0_a,
                         eil_dbg_0_b,
                         eil_dbg_1_a,
                         eil_dbg_1_b,

                         // parity invert signals
                         ilu_diagnos_ehi_trig_hw_clr,
			 ilu_diagnos_ehi_trig_hw_read,
                         ilu_diagnos_ehi_par_hw_read,
                         ilu_diagnos_edi_trig_hw_clr,
			 ilu_diagnos_edi_trig_hw_read,
                         ilu_diagnos_edi_par_hw_read,

			 // idle check
			 eil_is_idle,

			// crm stall case
			il2cl_gr_16 );
    
  // synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  Clock and Reset Signals
  //---------------------------------------------------------------------
  input           clk;	             // input clock
  input 	  rst_l;	     // input reset
  
  //---------------------------------------------------------------------
  // rcd interface to TMU
  //---------------------------------------------------------------------
  input [`FIRE_DLC_EPE_REC_WDTH-1:0]   k2y_rcd;         // command rcd
  input 			       k2y_rcd_enq;     // enqueue for command rcd
  output 			       y2k_rcd_deq;    // rcd fifo full

  //---------------------------------------------------------------------
  // release interface to RMU
  //---------------------------------------------------------------------
  output 	  y2k_rel_enq;     // enqueue for release rcd
  output [8:0] 	  y2k_rel_rcd;     // release rcd

  //---------------------------------------------------------------------
  // stall to crm for delock
  //---------------------------------------------------------------------
  output 	  il2cl_gr_16;     // don't let erh get more than 16 full
  
  //------------------------------------------------------------------------
  //   DOU DMA Rd Cpl Buffer status rcd interface with CLU
  //------------------------------------------------------------------------
  input [`FIRE_DLC_DOU_DPTR_WDTH-1:0] k2y_dou_dptr;
  input 			      k2y_dou_err;
  input 			      k2y_dou_vld;

  //---------------------------------------------------------------------
  // data buffer interface to DOU
  //---------------------------------------------------------------------
  input 			       k2y_buf_addr_vld_monitor;
  output 			       y2k_buf_addr_vld_monitor;
  output [7:0] 	  y2k_buf_addr;        // read address to DOU
  input [127:0]   k2y_buf_data;        // payload
  input [3:0] 	  k2y_buf_dpar;        // word parity for the payload

  //---------------------------------------------------------------------
  // buffer management interface
  //---------------------------------------------------------------------  
  output [5:0] 	  d2p_ech_wptr;      // grey-coded cpl-buffer in EHB write pointer
  input [5:0] 	  p2d_ech_rptr;      // grey-coded cpl-buffer in EHB read pointer
  output [5:0] 	  d2p_erh_wptr;      // grey-coded req-buffer in EHB write pointer
  input [5:0] 	  p2d_erh_rptr;      // grey-coded req-buffer in EHB read pointer
  input [`FIRE_P2D_ECD_RPTR_WDTH-1:0]  p2d_ecd_rptr; // grey-coded EDB DMA Cpl buffer read pointer
  input [`FIRE_P2D_ERD_RPTR_WDTH-1:0]  p2d_erd_rptr; // grey-coded EDB PIO Wr buffer read pointer

  //---------------------------------------------------------------------
  // EHB interface
  //--------------------------------------------------------------------- 
  output 	                   d2p_ehb_we;        // EHB write stroke
  output [5:0] 	                   d2p_ehb_addr;      // EHB write pointer
  output [`FIRE_EHB_REC_WDTH-1:0]  d2p_ehb_data;      // EHB record
  output [3:0] 			   d2p_ehb_dpar;      // EHB word parity for header rcd

  //---------------------------------------------------------------------
  // EDB interface
  //--------------------------------------------------------------------- 
  output 	  d2p_edb_we;        // EDB write stroke
  output [7:0] 	  d2p_edb_addr;      // EDB write pointer
  output [127:0]  d2p_edb_data;      // EDB payload
  output [3:0] 	  d2p_edb_dpar;      // EDB word parity for payload
  
  //---------------------------------------------------------------------
  // drain interface
  //--------------------------------------------------------------------- 
  input           cib2eil_ihb_pe_drain; // caused by iil2cib_ihb_pe
  input           cib2eil_pec_drain;    // caused by p2d_drain
//  input 	  cib2eil_drain;     // drain signal from internal sub-block CIB

  //---------------------------------------------------------------------
  // internal ISB interface
  //--------------------------------------------------------------------- 
  output 	  eil2isb_log;       // log non-posted PIO request to ISB
  output [4:0] 	  eil2isb_tag;       // tlp_tag[4:0] in PIO-req rcd
  output [3:2] 	  eil2isb_low_addr;  // addr[3:2] in PIO-req rcd
  
  //------------------------------------------------------------------------
  // clocks to EHB, EDB
  //------------------------------------------------------------------------

  //------------------------------------------------------------------------
  //   debug
  //------------------------------------------------------------------------
  input [2:0]                         low_dbg_sel_a;
  input [2:0]                         low_dbg_sel_b;
  output [`FIRE_DBG_DATA_BITS]        eil_dbg_0_a;
  output [`FIRE_DBG_DATA_BITS]        eil_dbg_0_b;
  output [`FIRE_DBG_DATA_BITS]        eil_dbg_1_a;
  output [`FIRE_DBG_DATA_BITS]        eil_dbg_1_b;

  //------------------------------------------------------------------------
  //   idle check
  //------------------------------------------------------------------------
  output 			      eil_is_idle;
  
  // SV  04/06/05   EDB Parity invert signals
  output                         ilu_diagnos_edi_trig_hw_clr;
  input				 ilu_diagnos_edi_trig_hw_read;
  input  [3:0] 			 ilu_diagnos_edi_par_hw_read;
  output                         ilu_diagnos_ehi_trig_hw_clr;
  input				 ilu_diagnos_ehi_trig_hw_read;
  input  [3:0] 			 ilu_diagnos_ehi_par_hw_read;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [`FIRE_DBG_DATA_BITS]           dbg_0_bus [0:1];
  reg [`FIRE_DBG_DATA_BITS]           dbg_1_bus [0:1];

  reg 				      y2k_buf_addr_vld_monitor;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~

  reg [`FIRE_DBG_DATA_BITS]           nxt_dbg_0_bus [0:1];
  reg [`FIRE_DBG_DATA_BITS]           nxt_dbg_1_bus [0:1];
  reg [2:0]                           dbg_sel [0:1];

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire                                cib2eil_drain;

  //---------------------------------------------------------------------
  // outputs from *_rcdbldr.v
  // --------------------------------------------------------------------
  wire 		  rcd_empty;
  wire 		  has_payld;
  wire 		  rcd_is_cpl;
  wire 		  rcd_is_cpl_reg;
  wire 		  rcd_is_pio_mwr;
  wire [3:0] 	  pio_tag;
  wire [5:2] 	  align_addr;
  wire [7:0] 	  payld_len;
  wire [5:0] 	  d_ptr_in;
  // debug signals
  wire 		  log_ep_history;
  wire 		  ep_history;
  wire 		  log_dou_sbd_err;
  wire 		  take_care_rcd_ep;
  wire 		  out_rcd_ep;
  
  //---------------------------------------------------------------------
  // outputs from *_xfrfsm.v
  // --------------------------------------------------------------------
  wire 		  n_d2p_ehb_we;    // it drives d2p_ehb_we
  wire 		  data_start;
  wire 		  xfrfsm_is_wfh;
  wire 		  rcd_deq;           // it's a cycle earlier than y2k_rcd_deq
  wire 		  xfrfsm_is_idle;
  // debug signals
  wire [3:0] 	  xfr_state;
  
  //---------------------------------------------------------------------
  // outputs from *_datafsm.v
  // --------------------------------------------------------------------
  wire 		  data_done;         // to xfrfsm.v & relgen.v
  wire 		  only_one_rd_and_can_move;
  wire 		  edb_wptr_inc;
  wire [6:2] 	  n_y2k_buf_addr_cl;    // to relgen.v
  wire 		  datafsm_is_idle;
  // debug signals
  wire [4:0] 	  data_state;
  wire 		  set_residue;
  wire 		  clr_residue;
  wire 		  there_is_data_residue;
  wire 		  set_early_data_done;
  wire 		  clr_early_data_done;
  wire 		  early_data_done;
  wire 		  last_rd;
  wire 		  last_wr;
  wire 		  more_rds;
  wire 		  more_wrs;
  wire 		  dou_rptr_inc;

  //---------------------------------------------------------------------
  // outputs from *_bufmgr.v
  // --------------------------------------------------------------------
  wire [7:0] 	  edb_wptr;         // EDB wptr
  wire 		  ehb_full;         // 
  wire 		  ecd_full;         // full in DMA cpl part of EDB
  wire 		  erd_full;         // full in PIO req part of EDB
  wire 		  edb_full_adv;
  // debug signals
  wire 		  erh_full;
  wire 		  ech_full;
  wire 		  erd_full_adv;
  wire 		  ecd_full_adv;
  
  //---------------------------------------------------------------------
  // outputs from *_relgen.v
  // --------------------------------------------------------------------
  wire 		  dou_sbd_vld_datafsm;    // dou cl avairable to pull
  wire 		  dou_sbd_vld_rcdbldr;    // dou cl avairable to pull
  wire 		  dou_sbd_err_rcdbldr;    // dou cl error            
  // debug signals
  wire 		  cpl_cl_done;
  
  wire  [3:0]	  d2p_ehb_dpar_0 ;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // 0in custom -fire d2p_ehb_we -active $0in_delay(cib2eil_drain, 1)
//BP moved this one to dmu_ilu_eil_datafsm.v
//   // 0in custom -fire d2p_edb_we -active $0in_delay(cib2eil_drain, 3)


  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  clocks to EHB, EDB
  //---------------------------------------------------------------------
//sun_buff_clk d2p_edb_clk_buf
//  (     .a                   (clk),
//	.z                   (d2p_edb_clk) );
  
//sun_buff_clk d2p_ehb_clk_buf
//  (     .a                   (clk),
//	.z                   (d2p_ehb_clk) );


  //---------------------------------------------------------------------
  //  combine drain signals to one to datafsm and xfrfsm
  //---------------------------------------------------------------------
  assign cib2eil_drain = cib2eil_ihb_pe_drain | cib2eil_pec_drain;


  //---------------------------------------------------------------------
  // debug ports
  //---------------------------------------------------------------------

  always @ (low_dbg_sel_a or low_dbg_sel_b) begin
    dbg_sel[0] = low_dbg_sel_a;
    dbg_sel[1] = low_dbg_sel_b;
  end

  always @ (dbg_sel[0] or dbg_sel[1] or
	    d2p_edb_we or
	    d2p_edb_addr or
	    d2p_ehb_we or
	    d2p_ehb_addr or
	    k2y_buf_addr_vld_monitor or
	    y2k_buf_addr or
	    k2y_rcd_enq or
	    y2k_rcd_deq or
	    y2k_rel_enq or
	    y2k_rel_rcd[8] or
	    y2k_rel_rcd[4:0] or
	    k2y_dou_vld or
	    k2y_dou_dptr or
	    k2y_dou_err or
	    cib2eil_drain or
	    eil2isb_log  ) 
    begin : loop_1st
      integer i;
      for (i = 0; i < 2; i = i + 1) begin
	case (dbg_sel[i]) // synopsys infer_mux
          3'b000: nxt_dbg_0_bus[i] = {1'b0, d2p_ehb_we, d2p_ehb_addr};
          3'b001: nxt_dbg_0_bus[i] = d2p_edb_addr;
          3'b010: nxt_dbg_0_bus[i] = {2'b0, k2y_buf_addr_vld_monitor, d2p_edb_we, 
				      k2y_rcd_enq, y2k_rcd_deq,
				      cib2eil_drain, eil2isb_log};
          3'b011: nxt_dbg_0_bus[i] = {1'b0, y2k_rel_enq, y2k_rel_rcd[8], y2k_rel_rcd[4:0]};
          3'b100: nxt_dbg_0_bus[i] = {1'b0, k2y_dou_vld, k2y_dou_dptr, k2y_dou_err};
          3'b101: nxt_dbg_0_bus[i] = y2k_buf_addr;
          3'b110: nxt_dbg_0_bus[i] = 8'b0;
          3'b111: nxt_dbg_0_bus[i] = 8'b0;
	endcase
      end
    end // always @ (dbg_sel[0] or dbg_sel[1] or...
  
  always @ (dbg_sel[0] or dbg_sel[1] or
	    rcd_empty or
	    has_payld or
	    rcd_is_cpl or
	    rcd_is_pio_mwr or
	    data_start or
	    data_done or
	    only_one_rd_and_can_move or
	    edb_wptr_inc or
            ehb_full or
            ecd_full or
            erd_full or
            edb_full_adv  or
	    dou_sbd_vld_datafsm or
	    dou_sbd_vld_rcdbldr or
	    dou_sbd_err_rcdbldr or
	    
	    // xfrfsm
	    xfr_state or
	    // relgen
	    cpl_cl_done or
	    // rcdbldr
	    log_ep_history or
	    ep_history or
	    log_dou_sbd_err or
	    take_care_rcd_ep or
	    out_rcd_ep or
	    // datafsm
	    data_state or
	    set_residue or
	    clr_residue or
	    there_is_data_residue or
	    set_early_data_done or
	    clr_early_data_done or
	    early_data_done or
	    last_rd or
	    last_wr or
	    more_rds or
	    more_wrs or
	    dou_rptr_inc or
	    // bufmgr
	    erh_full or
	    ech_full or
	    erd_full_adv or
	    ecd_full_adv ) 
    begin : loop_2nd
      integer i;
      for (i = 0; i < 2; i = i + 1) begin
	case (dbg_sel[i]) // synopsys infer_mux
          3'b000: nxt_dbg_1_bus[i] = {xfr_state, rcd_empty, ehb_full, 
				      has_payld, only_one_rd_and_can_move};
          3'b001: nxt_dbg_1_bus[i] = {1'b0,data_state, data_start, data_done};
          3'b010: nxt_dbg_1_bus[i] = {1'b0, ecd_full, erd_full, edb_full_adv, 
				      erh_full, ech_full, erd_full_adv, ecd_full_adv};
          3'b011: nxt_dbg_1_bus[i] = {4'b0, rcd_is_cpl, rcd_is_pio_mwr, 
				      cpl_cl_done, edb_wptr_inc};
          3'b100: nxt_dbg_1_bus[i] = {1'b0, log_ep_history, ep_history, log_dou_sbd_err,
				      take_care_rcd_ep, out_rcd_ep, dou_sbd_vld_rcdbldr,
				      dou_sbd_err_rcdbldr};
          3'b101: nxt_dbg_1_bus[i] = {1'b0, dou_sbd_vld_datafsm, set_residue,
				      clr_residue, there_is_data_residue,
				      set_early_data_done, clr_early_data_done,
				      early_data_done};
	  
          3'b110: nxt_dbg_1_bus[i] = {3'b0, last_rd, last_wr, more_rds,
				      more_wrs, dou_rptr_inc};
          3'b111: nxt_dbg_1_bus[i] = 8'b0;
	endcase
      end
    end

  assign eil_dbg_0_a = dbg_0_bus[0];
  assign eil_dbg_0_b = dbg_0_bus[1];
 
  assign eil_dbg_1_a = dbg_1_bus[0];
  assign eil_dbg_1_b = dbg_1_bus[1];
 
  always @ (posedge clk) 
	if(~rst_l) begin : dbg0_rst
	integer j;
      for (j = 0; j < 2; j = j + 1) begin
	dbg_0_bus[j] <= {8{1'b0}};
      end
    end
    else begin : loop_3rd
      integer i;
      for (i = 0; i < 2; i = i + 1) begin
	dbg_0_bus[i] <= nxt_dbg_0_bus[i];
      end
    end

  always @ (posedge clk) 
	if(~rst_l) begin : dbg1_rst
	integer j;
      for (j = 0; j < 2; j = j + 1) begin
	dbg_1_bus[j] <= {8{1'b0}};
      end
    end
    else begin : loop_4th
      integer i;
      for (i = 0; i < 2; i = i + 1) begin
	dbg_1_bus[i] <= nxt_dbg_1_bus[i];
      end
    end

  //---------------------------------------------------------------------
  // idle check
  //---------------------------------------------------------------------
  assign eil_is_idle = rcd_empty & datafsm_is_idle & xfrfsm_is_idle;
   
  //---------------------------------------------------------------------
  // output for y2k_buf_addr_vld_monitor
  //---------------------------------------------------------------------
  always @ (posedge clk) 
	if(~rst_l) begin
      y2k_buf_addr_vld_monitor <= 1'b0;
    end
    else begin
      y2k_buf_addr_vld_monitor <= dou_rptr_inc;
    end

  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // release generator
dmu_ilu_eil_relgen relgen
  (    .clk 		     (clk),
        .rst_l 		     (rst_l),
        .y2k_rel_rcd 	     (y2k_rel_rcd),
        .y2k_rel_enq 	     (y2k_rel_enq),
        .rcd_is_pio_mwr      (rcd_is_pio_mwr),
        .rcd_is_cpl_reg      (rcd_is_cpl_reg),
        .pio_tag 	     (pio_tag),
        .data_start 	     (data_start),
        .data_done 	     (data_done),
        .n_y2k_buf_addr_cl   (n_y2k_buf_addr_cl),
        .y2k_buf_addr 	     (y2k_buf_addr[6:0]),
        .k2y_dou_dptr 	     (k2y_dou_dptr),
        .k2y_dou_err 	     (k2y_dou_err),
        .k2y_dou_vld 	     (k2y_dou_vld),
        .dou_sbd_vld_datafsm (dou_sbd_vld_datafsm),
        .dou_sbd_vld_rcdbldr (dou_sbd_vld_rcdbldr),
        .dou_sbd_err_rcdbldr (dou_sbd_err_rcdbldr),
        .cpl_cl_done 	     (cpl_cl_done));
  
  // buffer manager
dmu_ilu_eil_bufmgr bufmgr
  (    .clk 		(clk),
        .rst_l 		(rst_l),
        .d2p_ehb_addr 	(d2p_ehb_addr),
        .d2p_ech_wptr 	(d2p_ech_wptr),
        .d2p_erh_wptr 	(d2p_erh_wptr),
        .p2d_ech_rptr 	(p2d_ech_rptr),
        .p2d_erh_rptr 	(p2d_erh_rptr),
        .p2d_ecd_rptr 	(p2d_ecd_rptr),
        .p2d_erd_rptr 	(p2d_erd_rptr),
        .cib2eil_drain 	(cib2eil_drain),
        .cib2eil_pec_drain (cib2eil_pec_drain),
        .rcd_is_cpl 	(rcd_is_cpl),
        .rcd_is_cpl_reg (rcd_is_cpl_reg),
        .edb_wptr 	(edb_wptr),
        .n_d2p_ehb_we 	(n_d2p_ehb_we),
        .edb_wptr_inc 	(edb_wptr_inc),
        .ehb_full 	(ehb_full),
        .ecd_full 	(ecd_full),
        .erd_full 	(erd_full),
        .edb_full_adv 	(edb_full_adv),
        .erh_full 	(erh_full),
        .ech_full 	(ech_full),
        .erd_full_adv 	(erd_full_adv),
        .ecd_full_adv 	(ecd_full_adv),
        .il2cl_gr_16 	(il2cl_gr_16)
);

  // data FSM
dmu_ilu_eil_datafsm datafsm
  (    .clk 			  (clk),
        .rst_l 			  (rst_l),
        .y2k_buf_addr 		  (y2k_buf_addr),
        .k2y_buf_data 		  (k2y_buf_data),
        .k2y_buf_dpar 		  (k2y_buf_dpar),
        .d2p_edb_we 		  (d2p_edb_we),
        .d2p_edb_addr 		  (d2p_edb_addr),
        .d2p_edb_data 		  (d2p_edb_data),
        .d2p_edb_dpar 		  (d2p_edb_dpar),
        .data_start 		  (data_start),
        .data_done 		  (data_done),
        .only_one_rd_and_can_move (only_one_rd_and_can_move),
        .ecd_full 		  (ecd_full),
        .erd_full 		  (erd_full),
        .edb_full_adv 		  (edb_full_adv),
        .edb_wptr 		  (edb_wptr),
        .edb_wptr_inc 		  (edb_wptr_inc),
        .align_addr 		  (align_addr),
        .payld_len 		  (payld_len),
        .d_ptr_in 		  (d_ptr_in),
        .rcd_is_cpl 		  (rcd_is_cpl),
        .rcd_is_cpl_reg 	  (rcd_is_cpl_reg),
        .n_y2k_buf_addr_cl 	  (n_y2k_buf_addr_cl),
        .dou_sbd_vld_datafsm 	  (dou_sbd_vld_datafsm),
        .cib2eil_drain 		  (cib2eil_drain),
        .datafsm_is_idle 	  (datafsm_is_idle),
        .ilu_diagnos_edi_trig_hw_clr (ilu_diagnos_edi_trig_hw_clr),
        .ilu_diagnos_edi_trig_hw_read (ilu_diagnos_edi_trig_hw_read),
        .ilu_diagnos_edi_par_hw_read (ilu_diagnos_edi_par_hw_read),
        .data_state 		  (data_state),
        .set_residue 		  (set_residue),
        .clr_residue 		  (clr_residue),
        .there_is_data_residue 	  (there_is_data_residue),
        .set_early_data_done 	  (set_early_data_done),
        .clr_early_data_done 	  (clr_early_data_done),
        .early_data_done 	  (early_data_done),
        .last_rd 		  (last_rd),
        .last_wr 		  (last_wr),
        .more_rds 		  (more_rds),
        .more_wrs 		  (more_wrs),
        .dou_rptr_inc 		  (dou_rptr_inc));
  
  // transfer FSM
dmu_ilu_eil_xfrfsm xfrfsm
  (    .clk 			  (clk),
        .rst_l 			  (rst_l),
        .d2p_ehb_dpar_0           (d2p_ehb_dpar_0),
        .d2p_ehb_dpar             (d2p_ehb_dpar),
        .ilu_diagnos_ehi_trig_hw_clr (ilu_diagnos_ehi_trig_hw_clr),
        .ilu_diagnos_ehi_trig_hw_read (ilu_diagnos_ehi_trig_hw_read),
        .ilu_diagnos_ehi_par_hw_read (ilu_diagnos_ehi_par_hw_read),
        .d2p_ehb_we 		  (d2p_ehb_we),
        .n_d2p_ehb_we 		  (n_d2p_ehb_we),
        .rcd_empty 		  (rcd_empty),
        .rcd_deq 		  (rcd_deq),
        .y2k_rcd_deq 		  (y2k_rcd_deq),
        .xfrfsm_is_wfh 		  (xfrfsm_is_wfh),
        .data_start 		  (data_start),
        .data_done 		  (data_done),
        .only_one_rd_and_can_move (only_one_rd_and_can_move),
        .ehb_full 		  (ehb_full),
        .has_payld 		  (has_payld),
        .cib2eil_drain 		  (cib2eil_drain),
        .xfrfsm_is_idle 	  (xfrfsm_is_idle),
        .xfr_state 		  (xfr_state));

  // record builder
dmu_ilu_eil_rcdbldr rcdbldr
  (    .clk 		     (clk),
        .rst_l 		     (rst_l),
        .d2p_ehb_data 	     (d2p_ehb_data),
        .d2p_ehb_dpar 	     (d2p_ehb_dpar_0),
        .k2y_rcd 	     (k2y_rcd),
        .k2y_rcd_enq 	     (k2y_rcd_enq),
        .rcd_deq 	     (rcd_deq),
        .rcd_empty 	     (rcd_empty),
        .eil2isb_log 	     (eil2isb_log),
        .eil2isb_tag 	     (eil2isb_tag),
        .eil2isb_low_addr    (eil2isb_low_addr),
        .has_payld 	     (has_payld),
        .rcd_is_cpl 	     (rcd_is_cpl),
        .rcd_is_cpl_reg      (rcd_is_cpl_reg),
        .rcd_is_pio_mwr      (rcd_is_pio_mwr),
        .pio_tag 	     (pio_tag),
        .align_addr 	     (align_addr),
        .payld_len 	     (payld_len),
        .d_ptr_in 	     (d_ptr_in),
        .dou_sbd_vld_rcdbldr (dou_sbd_vld_rcdbldr),
        .dou_sbd_err_rcdbldr (dou_sbd_err_rcdbldr),
        .xfrfsm_is_wfh 	     (xfrfsm_is_wfh),
        .data_start 	     (data_start),
        .data_done 	     (data_done),
        .log_ep_history      (log_ep_history),
        .ep_history 	     (ep_history),
        .log_dou_sbd_err     (log_dou_sbd_err),
        .take_care_rcd_ep    (take_care_rcd_ep),
        .out_rcd_ep 	     (out_rcd_ep));

endmodule
