// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_iil.v
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
module dmu_ilu_iil (
			 clk,
			 rst_l,
			 
			 p2d_ihb_wptr,
			 d2p_ihb_addr,
			 p2d_ihb_data,
			 p2d_ihb_dpar,
			 d2p_ihb_rd,
			 
			 d2p_ibc_req,
			 d2p_ibc_nhc,
			 d2p_ibc_phc,
			 d2p_ibc_pdc,
			 p2d_ibc_ack,
			 
			 d2p_idb_addr,
			 p2d_idb_data,
			 p2d_idb_dpar,
			 
			 p2d_cto_req,
			 p2d_cto_tag,
			 d2p_cto_ack,
			 
			 y2k_rcd,
			 y2k_rcd_enq,
			 k2y_rcd_deq,
			 
			 k2y_rel_rcd,
			 k2y_rel_enq,
			 
			 k2y_buf_addr,
			 y2k_buf_data,
			 y2k_buf_dpar,
			 
                         cib2iil_ihb_pe_drain, // caused by iil2cib_ihb_pe
                         cib2iil_pec_drain,    // caused by p2d_drain
			 iil2cib_ihb_pe,
			 iil2isb_clr,
			 iil2isb_tag,
			 isb2iil_vld,
			 isb2iil_low_addr,

			 // debug
                         low_dbg_sel_a,
                         low_dbg_sel_b,
                         iil_dbg_a,
                         iil_dbg_b,

			 // idle check
			 iil_is_idle,
			 ilu_is_idle );
 
  //synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  Clock and Reset Signals
  //---------------------------------------------------------------------
  input		  clk;		    // input clock
  input		  rst_l;   	    // input reset
    
  //---------------------------------------------------------------------
  //   IHB and IHB management interface
  //---------------------------------------------------------------------  
  input [6:0]                      p2d_ihb_wptr;     // grey-coded IHB write pointer
  input  [`FIRE_IHB_REC_WDTH-1:0]  p2d_ihb_data;     // TLP header record
  output [5:0] 			   d2p_ihb_addr;     // binary read pointer to IHB
  input [3:0] 			   p2d_ihb_dpar;     // TLP header record parity
  output			   d2p_ihb_rd;	     // read enable to peu ihb ram, requested
						     // by n2 ram designers  
  //---------------------------------------------------------------------
  //   IDB interface
  //---------------------------------------------------------------------
  output   [7:0]  d2p_idb_addr;     // binary read pointer to IDB
  input  [127:0]  p2d_idb_data;     // 16-byte data    
  input    [3:0]  p2d_idb_dpar;     // data parity

  //---------------------------------------------------------------------
  //   PCIE FC credits interface to TLU
  //---------------------------------------------------------------------
  output          d2p_ibc_req;       // request for ingress buffer credits
  input           p2d_ibc_ack;       // ack for ingress buffer credits
  output   [7:0]  d2p_ibc_nhc;       // PCIE FC NPH credits
  output   [7:0]  d2p_ibc_phc;       // PCIE FC PH credits
  output  [11:0]  d2p_ibc_pdc;       // PCIE FC PD credits
  
  //---------------------------------------------------------------------
  //   cto interface - PIO completion time out
  //---------------------------------------------------------------------
  input 	  p2d_cto_req;       // cto request from TLU 
  input [4:0] 	  p2d_cto_tag;       // cto tag
  output 	  d2p_cto_ack;       // cto ack back

  //---------------------------------------------------------------------
  //   data path interface to TMU
  //---------------------------------------------------------------------
  input    [7:0]  k2y_buf_addr;       // read pointer to IDB
  output [127:0]  y2k_buf_data;       // 16-byte data    
  output   [3:0]  y2k_buf_dpar;       // data parity
    
  //---------------------------------------------------------------------
  //   record interface to TMU
  //---------------------------------------------------------------------
  input                                k2y_rcd_deq;       // record fifo dequeue
  output [`FIRE_DLC_IPE_REC_WDTH-1:0]  y2k_rcd;            // ingress PEC record
  output 			       y2k_rcd_enq;        // ingress PEC record enqueue
  
  //---------------------------------------------------------------------
  //   DMA MWr buffer release interface from TMU
  //---------------------------------------------------------------------
  input [8:0]	  k2y_rel_rcd;        // release rcd
  input           k2y_rel_enq;        // enqueue for release record

  //---------------------------------------------------------------------
  //   sub-block to sub-block interface
  //---------------------------------------------------------------------
  input           cib2iil_ihb_pe_drain; // caused by iil2cib_ihb_pe
  input           cib2iil_pec_drain;    // caused by p2d_drain
//  input 	  cib2iil_drain;      // drain signal from sub-block CIB
  output 	  iil2cib_ihb_pe;    // ingress header parity error
  output 	  iil2isb_clr;       
  output [4:0] 	  iil2isb_tag;
  input 	  isb2iil_vld;
  input [3:2] 	  isb2iil_low_addr;

  //------------------------------------------------------------------------
  // clocks to IHB, IDB
  //------------------------------------------------------------------------

  //------------------------------------------------------------------------
  //   debug
  //------------------------------------------------------------------------
  input [2:0]                         low_dbg_sel_a;
  input [2:0]                         low_dbg_sel_b;
  output [`FIRE_DBG_DATA_BITS]        iil_dbg_a;
  output [`FIRE_DBG_DATA_BITS]        iil_dbg_b;
  
  //------------------------------------------------------------------------
  //   idle check
  //------------------------------------------------------------------------
  output 			      iil_is_idle;
  input 			      ilu_is_idle;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg [`FIRE_DBG_DATA_BITS]           dbg_bus [0:1];

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~

  reg [`FIRE_DBG_DATA_BITS]           nxt_dbg_bus [0:1];
  reg [2:0]                           dbg_sel [0:1];

  integer                              j;
 
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  //---------------------------------------------------------------------
  // outputs from *_bufmgr.v
  // --------------------------------------------------------------------
  wire 		  ihb_empty;
  wire [6:0] 	  ihb_rptr; // for debug port only
  wire [6:0] 	  ihb_wptr; // for debug port only

  //---------------------------------------------------------------------
  // outputs from *_parchk.v
  // --------------------------------------------------------------------
  wire 		  iil2cib_ihb_pe;
  
  //---------------------------------------------------------------------
  // outputs from *_rcdbldr.v
  // --------------------------------------------------------------------
  wire 		  ihb_rcd_is_cpl;
  wire [1:0] 	  credit_type;
  wire [`FIRE_IHB_REC_WDTH-1:0] in_ihb_rcd;
  
  //---------------------------------------------------------------------
  // outputs from *_xfrfsm.v
  // --------------------------------------------------------------------
  wire 		  ihb_rptr_inc;
  wire 		  is_ihb_rcd;
  wire 		  is_cto_rcd;
  wire [4:0] 	  pio_tag_gen;
  wire [4:0] 	  state; // for debug port only
  wire 		  is_fifo_space; // for debug port only
  wire 		  drop_inserted_rcd; // for debug port only
  wire 		  n_cto_req_reg; // for debug port only, sync version of p2d_cto_req

  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // 0in custom -fire ihb_rptr_inc -active cib2iil_ihb_pe_drain

  // 0in constant -var d2p_ihb_addr -active cib2iil_ihb_pe_drain
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  // debug
  //---------------------------------------------------------------------

  always @ (low_dbg_sel_a or low_dbg_sel_b) begin
    dbg_sel[0] = low_dbg_sel_a;
    dbg_sel[1] = low_dbg_sel_b;
  end
  
  always @ (dbg_sel[0] or dbg_sel[1] or
	    n_cto_req_reg or			// synchronized version of p2d_cto_req
	    d2p_cto_ack or
	    d2p_ihb_addr or
	    d2p_ibc_nhc or
	    d2p_ibc_phc or
	    y2k_rcd_enq or
	    k2y_rcd_deq or
	    k2y_rel_enq or
	    k2y_rel_rcd[8] or
            cib2iil_ihb_pe_drain or
            cib2iil_pec_drain or
	    iil2cib_ihb_pe or
	    isb2iil_vld or
	    iil2isb_clr or
	    ilu_is_idle or
	    ihb_empty or
	    ihb_rcd_is_cpl or
	    credit_type or
	    ihb_rptr_inc or
	    is_ihb_rcd or
	    is_cto_rcd or
	    state or
	    is_fifo_space or
	    drop_inserted_rcd or
	    ihb_rptr or
	    ihb_wptr  ) begin : dbg_case
	integer i;
    for (i = 0; i < 2; i = i + 1) begin
      case (dbg_sel[i]) // synopsys infer_mux
        3'b000: nxt_dbg_bus[i] = {state, is_fifo_space, cib2iil_ihb_pe_drain, cib2iil_pec_drain};
	3'b001: nxt_dbg_bus[i] = {n_cto_req_reg, d2p_cto_ack, ihb_empty, ihb_rptr_inc,
				  credit_type, k2y_rel_enq, k2y_rel_rcd[8]};
        3'b010: nxt_dbg_bus[i] = {ilu_is_idle, ihb_rptr};
        3'b011: nxt_dbg_bus[i] = {1'b0, ihb_wptr};
        3'b100: nxt_dbg_bus[i] = {1'b0, is_ihb_rcd, is_cto_rcd, ihb_rcd_is_cpl,
				  drop_inserted_rcd, iil2cib_ihb_pe, isb2iil_vld, iil2isb_clr}; 
        3'b101: nxt_dbg_bus[i] = {y2k_rcd_enq, k2y_rcd_deq, d2p_ihb_addr};
        3'b110: nxt_dbg_bus[i] = d2p_ibc_nhc;
        3'b111: nxt_dbg_bus[i] = d2p_ibc_phc;
      endcase
    end
  end

  assign iil_dbg_a = dbg_bus[0];
  assign iil_dbg_b = dbg_bus[1];

  always @ (posedge clk) 
	if(~rst_l) begin : dbg_rst
	   integer i;
    for (i = 0; i < 2; i = i + 1) begin
      dbg_bus[i] <= {8{1'b0}};
	end
      end
	else begin
    for (j = 0; j < 2; j = j + 1) begin
      dbg_bus[j] <= nxt_dbg_bus[j];
    end
  end 
   
  //---------------------------------------------------------------------
  //  clocks to IHB, IDB
  //---------------------------------------------------------------------

  //---------------------------------------------------------------------
  //  data path feed through
  //---------------------------------------------------------------------
  assign d2p_idb_addr = k2y_buf_addr;
  assign y2k_buf_data = p2d_idb_data;
  assign y2k_buf_dpar = p2d_idb_dpar;
 
//BP 3-28-05
assign	d2p_ihb_rd = ~ihb_empty & rst_l;
 
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

//sun_buff_clk d2p_idb_clk_buf
//  (     .a                   (clk),
//	.z                   (d2p_idb_clk) );
  
//sun_buff_clk d2p_ihb_clk_buf
//  (     .a                   (clk),
//	.z                   (d2p_ihb_clk) );  

dmu_ilu_iil_bufmgr bufmgr
  (     .clk 	      (clk),
        .rst_l 	      (rst_l),
        .p2d_ihb_wptr (p2d_ihb_wptr),
        .d2p_ihb_addr (d2p_ihb_addr),
        .ihb_rptr_inc (ihb_rptr_inc),
        .ihb_empty    (ihb_empty),
	.ihb_rptr     (ihb_rptr),
	.ihb_wptr     (ihb_wptr) );


dmu_ilu_iil_crdtcnt crdtcnt
  (    .clk 	       (clk),
        .rst_l 	       (rst_l),
        .cib2iil_pec_drain (cib2iil_pec_drain),
        .k2y_rel_rcd   (k2y_rel_rcd),
        .k2y_rel_enq   (k2y_rel_enq),
        .d2p_ibc_req   (d2p_ibc_req),
        .d2p_ibc_nhc   (d2p_ibc_nhc),
        .d2p_ibc_phc   (d2p_ibc_phc),
        .d2p_ibc_pdc   (d2p_ibc_pdc),
        .p2d_ibc_ack   (p2d_ibc_ack),
        .is_ihb_rcd    (is_ihb_rcd),
        .credit_type   (credit_type) );

dmu_ilu_iil_parchk parchk
  (    .clk 		 (clk),
        .rst_l 	 	 (rst_l),
        .p2d_ihb_dpar 	 (p2d_ihb_dpar),
        .is_ihb_rcd      (is_ihb_rcd),
        .iil2cib_ihb_pe (iil2cib_ihb_pe),
        .in_ihb_rcd 	 (in_ihb_rcd));

dmu_ilu_iil_rcdbldr rcdbldr
  (    .clk 		(clk),
        .rst_l 		(rst_l),
        .p2d_ihb_data 	(p2d_ihb_data),
        .y2k_rcd 	(y2k_rcd),
        .iil2isb_tag 	(iil2isb_tag),
        .isb2iil_low_addr (isb2iil_low_addr),
        .ihb_rcd_is_cpl (ihb_rcd_is_cpl),
        .credit_type 	(credit_type),
        .is_ihb_rcd 	(is_ihb_rcd),
        .is_cto_rcd 	(is_cto_rcd),
        .pio_tag_gen 	(pio_tag_gen),
        .in_ihb_rcd 	 (in_ihb_rcd));

dmu_ilu_iil_xfrfsm xfrfsm
  (    .clk 		 (clk),
        .rst_l 		 (rst_l),
        .p2d_cto_req 	 (p2d_cto_req),
        .p2d_cto_tag 	 (p2d_cto_tag),
        .d2p_cto_ack 	 (d2p_cto_ack),
        .n_cto_req_reg 	 (n_cto_req_reg),
        .cib2iil_ihb_pe_drain (cib2iil_ihb_pe_drain),
        .cib2iil_pec_drain    (cib2iil_pec_drain),
        .iil2cib_ihb_pe (iil2cib_ihb_pe),
        .y2k_rcd_enq 	 (y2k_rcd_enq),
        .k2y_rcd_deq 	 (k2y_rcd_deq),
        .ihb_rcd_is_cpl  (ihb_rcd_is_cpl),
        .iil2isb_clr 	 (iil2isb_clr),
        .isb2iil_vld 	 (isb2iil_vld),
        .is_ihb_rcd 	 (is_ihb_rcd),
        .is_cto_rcd 	 (is_cto_rcd),
        .pio_tag_gen 	 (pio_tag_gen),
        .ihb_empty 	 (ihb_empty),
        .ihb_rptr_inc 	 (ihb_rptr_inc),
        .iil_is_idle     (iil_is_idle),
        .state           (state),
        .is_fifo_space   (is_fifo_space),
        .drop_inserted_rcd (drop_inserted_rcd) );
  
endmodule // dmu_ilu_iil

