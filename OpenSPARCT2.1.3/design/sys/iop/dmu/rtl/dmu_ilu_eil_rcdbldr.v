// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_eil_rcdbldr.v
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
module dmu_ilu_eil_rcdbldr (
				 clk,
				 rst_l,
				 				 
				 d2p_ehb_data,
				 d2p_ehb_dpar,
				 				 
				 k2y_rcd,
				 k2y_rcd_enq,

				 // rcd fifo
				 rcd_deq,
				 rcd_empty,
				 
				 // ISB interface
				 eil2isb_log,
				 eil2isb_tag,
				 eil2isb_low_addr,

				 // type decoder
				 has_payld,
				 rcd_is_cpl,
				 rcd_is_cpl_reg,
				 rcd_is_pio_mwr,

				 // rcd info
				 pio_tag,
				 align_addr,
				 payld_len,
				 d_ptr_in,

				 // for EP poison bit
				 dou_sbd_vld_rcdbldr,
				 dou_sbd_err_rcdbldr,
				 xfrfsm_is_wfh,
                                 data_start,
                                 data_done,
				 
				 // debug signals
				 log_ep_history,
				 ep_history,
				 log_dou_sbd_err,
				 take_care_rcd_ep,
				 out_rcd_ep );

    
  // synopsys sync_set_reset "rst_l"

  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<

  // rcd type
  parameter   PIO_MRD32   = 7'b0000000,
	      PIO_MRD64   = 7'b0100000,
	      PIO_IORD    = 7'b0000010,
	      PIO_CFGRD   = 7'b000010z,
	      PIO_MWR32   = 7'b1000000,
	      PIO_MWR64   = 7'b1100000,
	      PIO_IOWR    = 7'b1000010,
	      PIO_CFGWR   = 7'b100010z,
	      DMA_CPL     = 7'b0001010,
	      DMA_CPLLK   = 7'b0001011,
	      DMA_CPLD    = 7'b1001010;
  

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //---------------------------------------------------------------------
  //  Clock and Reset Signals
  //---------------------------------------------------------------------
  input           clk;	             // input clock
  input 	  rst_l;	     // input reset
  
  //---------------------------------------------------------------------
  // rcd interface to TMU
  //---------------------------------------------------------------------
  input [`FIRE_DLC_EPE_REC_WDTH-1:0]   k2y_rcd;         // record
  input 			       k2y_rcd_enq;     // enqueue for record

  //---------------------------------------------------------------------
  // EHB interface
  //--------------------------------------------------------------------- 
  output [`FIRE_EHB_REC_WDTH-1:0]  d2p_ehb_data;      // EHB record
  output [3:0] 			   d2p_ehb_dpar;      // EHB word parity for header rcd

  //---------------------------------------------------------------------
  // ISB interface
  //--------------------------------------------------------------------- 
  output 	  eil2isb_log;       // log non-posted PIO request to ISB
  output [4:0] 	  eil2isb_tag;       // tlp_tag[4:0] in PIO-req rcd
  output [3:2] 	  eil2isb_low_addr;  // addr[3:2] in PIO-req rcd

  //---------------------------------------------------------------------
  // talk to xfrfms.v - rcd fifo
  //---------------------------------------------------------------------
  input 	  rcd_deq;         // from *_xfrfsm.v
  output 	  rcd_empty;       //   to *_xfrfsm.v

  //---------------------------------------------------------------------
  // type decoder outputs
  //--------------------------------------------------------------------- 
  output 	  has_payld;		      //   to *_xfrfsm.v
  output 	  rcd_is_cpl;                 //   to bufmgr, xfrfsm, relgen
  output 	  rcd_is_cpl_reg;             //  flopped rcd_is_cpl
  output 	  rcd_is_pio_mwr;                    //   to *_relgen.v

  //---------------------------------------------------------------------
  // rcd info
  //---------------------------------------------------------------------
  output [3:0] 	  pio_tag;                    //   to *_relgen.v
  output [5:2]	  align_addr;                 //   to *_datafsm.v
  output [7:0]	  payld_len;                  //   to *_bufmgr.v & *_datafsm.v
  output [5:0]	  d_ptr_in;                   //   to *_datafsm.v

  //---------------------------------------------------------------------
  // EP poison bit in output record
  //---------------------------------------------------------------------
  input           dou_sbd_vld_rcdbldr;       // dou cl aveirable to pull
  input           dou_sbd_err_rcdbldr;       // dou cl error
  input 	  xfrfsm_is_wfh;
  input           data_start;
  input           data_done;

  //---------------------------------------------------------------------
  //  debug signals
  //---------------------------------------------------------------------
  output 	  log_ep_history;
  output 	  ep_history;
  output 	  log_dou_sbd_err;
  output 	  take_care_rcd_ep;
  output 	  out_rcd_ep;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  reg 			       rcd_is_cpl_reg;
  
  reg [`FIRE_EHB_REC_WDTH-1:0] 	  d2p_ehb_data;
  reg [3:0] 			  d2p_ehb_dpar;
  reg 				  eil2isb_log;
  reg [4:0] 			  eil2isb_tag;
  reg [3:2] 			  eil2isb_low_addr;

  reg                             log_dou_sbd_err;
  reg 				  ep_history;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~
  reg 				  is_pio_mem64;
  reg 				  non_posted_pio;
  reg 				  rcd_is_pio_mwr;
  reg 				  rcd_is_cpl;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  wire 				  has_payld;

  wire [`FIRE_DLC_EPE_REC_WDTH-1:0] 	  curr_rcd;
  wire [`FIRE_EHB_REC_WDTH-1:0] 	  n_d2p_ehb_data;
  wire [3:0] 				  n_d2p_ehb_dpar;

  wire 					  n_eil2isb_log;
  wire [4:0] 				  n_eil2isb_tag;
  wire [3:2] 				  n_eil2isb_low_addr;

  wire                                    log_ep_history;
  wire 					  take_care_rcd_ep;
  wire 					  out_rcd_ep;

  //---------------------------------------------------------------------
  // In record fields
  //--------------------------------------------------------------------- 
  wire [`FIRE_DLC_EPE_DPTR_WDTH-1:0] 	in_rcd_dptr;
  wire [`FIRE_DLC_EPE_ADDR_WDTH-1:0]    in_rcd_addr;
  wire [`FIRE_DLC_EPE_FDWBE_WDTH-1:0]   in_rcd_fdwbe;
  wire [`FIRE_DLC_EPE_LDWBE_WDTH-1:0]   in_rcd_ldwbe;
  wire [`FIRE_DLC_EPE_TAG_WDTH-1:0] 	in_rcd_tag;
  wire [`FIRE_DLC_EPE_REQID_WDTH-1:0] 	in_rcd_reqid;
  wire [`FIRE_DLC_EPE_LEN_WDTH-1:0] 	in_rcd_len;
  wire [`FIRE_DLC_EPE_ATR_WDTH-1:0] 	in_rcd_atr;
  wire [`FIRE_DLC_EPE_TC_WDTH-1:0] 	in_rcd_tc;
  wire [`FIRE_DLC_EPE_TYPE_WDTH-1:0] 	in_rcd_type;
  wire [`FIRE_DLC_EPE_F_WDTH-1:0] 	in_rcd_f;

  //---------------------------------------------------------------------
  // Out record fields
  //---------------------------------------------------------------------
  wire [`FIRE_EHB_1DWH_WDTH-1:0] 	out_rcd_1dwh;
  wire [`FIRE_EHB_2DWH_WDTH-1:0] 	out_rcd_2dwh;
  wire [`FIRE_EHB_3DWH_WDTH-1:0] 	out_rcd_3dwh;
  wire [`FIRE_EHB_4DWH_WDTH-1:0] 	out_rcd_4dwh;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  /* 0in odd_parity -var {n_d2p_ehb_data[127:96], n_d2p_ehb_dpar[3]}
                         -name ilu_eil_odd_pargen_3
                         -active ~rcd_empty */
  /* 0in odd_parity -var {n_d2p_ehb_data[95:64], n_d2p_ehb_dpar[2]}
                         -name ilu_eil_odd_pargen_2
                         -active ~rcd_empty */
  /* 0in odd_parity -var {n_d2p_ehb_data[63:32], n_d2p_ehb_dpar[1]}
                         -name ilu_eil_odd_pargen_1
                         -active ~rcd_empty */
  /* 0in odd_parity -var {n_d2p_ehb_data[31:0], n_d2p_ehb_dpar[0]}
                         -name ilu_eil_odd_pargen_0
                         -active ~rcd_empty */

  /* 0in one_hot -var {rcd_is_pio_mwr, non_posted_pio, rcd_is_cpl}
                         -active ~rcd_empty */

  // 0in known_driven -var data_done
  // N2- AT 04/06/05: duplicate checkers: x0in known_driven -var data_start 
  // 0in known_driven -var log_ep_history
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Function Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<
  
  function [3:0] calc_parity;
    input [127:0] data;
    begin
      calc_parity[3] = ~(^data[127:96]);

      calc_parity[2] = ~(^data[95:64]);

      calc_parity[1] = ~(^data[63:32]);

      calc_parity[0] = ~(^data[31:0]);
    end
  endfunction // calc_parity
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  //---------------------------------------------------------------------
  // In record fields
  //--------------------------------------------------------------------- 
  assign in_rcd_dptr = curr_rcd[`FIRE_DLC_EPE_DPTR_MSB:`FIRE_DLC_EPE_DPTR_LSB];
  assign in_rcd_addr = curr_rcd[`FIRE_DLC_EPE_ADDR_MSB:`FIRE_DLC_EPE_ADDR_LSB];
  assign in_rcd_fdwbe = curr_rcd[`FIRE_DLC_EPE_FDWBE_MSB:`FIRE_DLC_EPE_FDWBE_LSB];
  assign in_rcd_ldwbe = curr_rcd[`FIRE_DLC_EPE_LDWBE_MSB:`FIRE_DLC_EPE_LDWBE_LSB];
  assign in_rcd_tag = curr_rcd[`FIRE_DLC_EPE_TAG_MSB:`FIRE_DLC_EPE_TAG_LSB];
  assign in_rcd_reqid = curr_rcd[`FIRE_DLC_EPE_REQID_MSB:`FIRE_DLC_EPE_REQID_LSB];
  assign in_rcd_len = curr_rcd[`FIRE_DLC_EPE_LEN_MSB:`FIRE_DLC_EPE_LEN_LSB];
  assign in_rcd_atr = curr_rcd[`FIRE_DLC_EPE_ATR_MSB:`FIRE_DLC_EPE_ATR_LSB];
  assign in_rcd_tc = curr_rcd[`FIRE_DLC_EPE_TC_MSB:`FIRE_DLC_EPE_TC_LSB];
  assign in_rcd_type = curr_rcd[`FIRE_DLC_EPE_TYPE_MSB:`FIRE_DLC_EPE_TYPE_LSB];
  assign in_rcd_f = curr_rcd[`FIRE_DLC_EPE_F_MSB:`FIRE_DLC_EPE_F_LSB];


  //---------------------------------------------------------------------
  // type decoder
  //---------------------------------------------------------------------
  always @ (in_rcd_f or in_rcd_type)
    begin
      is_pio_mem64   = 1'b0;
      rcd_is_pio_mwr = 1'b0;
      non_posted_pio = 1'b0;
      rcd_is_cpl     = 1'b0;

      casez ({in_rcd_f, in_rcd_type}) // 0in < case -parallel -full -active ~rcd_empty
	PIO_MRD32,
	PIO_IORD,
	PIO_CFGRD:  non_posted_pio = 1'b1;

	PIO_MRD64:  
	  begin
	    is_pio_mem64 = 1'b1;
	    non_posted_pio = 1'b1;
	  end
	
	PIO_MWR32:  
	  begin
	    rcd_is_pio_mwr = 1'b1;
	  end
	
	PIO_MWR64:  
	  begin
	    is_pio_mem64 = 1'b1;
	    rcd_is_pio_mwr = 1'b1;
	  end
	
	PIO_IOWR,
	PIO_CFGWR:	
	  begin
	    non_posted_pio = 1'b1;
	  end
	
	DMA_CPLD,
	DMA_CPL,
	DMA_CPLLK:
	  begin
	    rcd_is_cpl = 1'b1;
	  end
	
      endcase // casez({in_rcd_f, in_rcd_type})
    end // always @ (in_rcd_f or in_rcd_type)
  
  assign has_payld = in_rcd_f[1];
  assign take_care_rcd_ep = in_rcd_type[3] & in_rcd_f[1]; // DMA CplD

  // flop rcd_is_cpl
  always @ (posedge clk)
	if(~rst_l) begin
      rcd_is_cpl_reg <= 1'b0;
    end
    else begin
      rcd_is_cpl_reg <= rcd_is_cpl;
    end
  
  //---------------------------------------------------------------------
  // ISB interface
  //---------------------------------------------------------------------
  assign n_eil2isb_log = non_posted_pio & rcd_deq;
  assign n_eil2isb_tag = in_rcd_tag[4:0];
  assign n_eil2isb_low_addr = in_rcd_addr[3:2];

  always @ (posedge clk)
	if(~rst_l) begin
      eil2isb_log <= {{1'b0}};
      eil2isb_tag <= {5{1'b0}};
      eil2isb_low_addr <= {2{1'b0}};
    end
    else begin
      eil2isb_log <= n_eil2isb_log;
      eil2isb_tag <= n_eil2isb_tag;
      eil2isb_low_addr <= n_eil2isb_low_addr;
    end

  //---------------------------------------------------------------------
  // record info
  //---------------------------------------------------------------------
  assign pio_tag = in_rcd_tag[3:0];
  assign align_addr = in_rcd_addr[5:2];
  assign payld_len = in_rcd_len[7:0];
  assign d_ptr_in = in_rcd_dptr;

  //---------------------------------------------------------------------
  // Out record fields
  //---------------------------------------------------------------------
  assign out_rcd_4dwh = is_pio_mem64 ? in_rcd_addr[31:0] : in_rcd_addr[63:32];
  assign out_rcd_3dwh = is_pio_mem64 ? in_rcd_addr[63:32] : in_rcd_addr[31:0];
  assign out_rcd_2dwh = {in_rcd_reqid, in_rcd_tag, in_rcd_ldwbe, in_rcd_fdwbe};

  // zero fill td field and all reserved fields
  assign out_rcd_1dwh = {1'b0, in_rcd_f, in_rcd_type, 1'b0, in_rcd_tc, 4'b0, 
			 1'b0, out_rcd_ep, in_rcd_atr, 2'b0, in_rcd_len};

  // out record
  assign n_d2p_ehb_data = {out_rcd_1dwh, out_rcd_2dwh, out_rcd_3dwh, out_rcd_4dwh};
  
  assign n_d2p_ehb_dpar = calc_parity(n_d2p_ehb_data);

  always @ (posedge clk)
	if(~rst_l) begin
	d2p_ehb_data <= {`FIRE_EHB_REC_WDTH{1'b0}};
	d2p_ehb_dpar <= {4{1'b0}};
    end
    else begin
      if (~xfrfsm_is_wfh) begin
	d2p_ehb_data <= n_d2p_ehb_data;
	d2p_ehb_dpar <= n_d2p_ehb_dpar;
      end
    end
  
  //------------------------------------------------------------------------
  // EP bit in out_rcd
  //    at data_start, enable loging of dou_sbd_err_rcdbldr to ep_history;
  //    at data_done, disable loging of dou_sbd_err_rcdbldr to ep_history;
  //    when data_start & data_done both asserted (that only_one_rd case),
  //    disable loging of dou_sbd_err_rcdbldr to ep_history.
  //------------------------------------------------------------------------
   always @ (posedge clk)
    begin
      if (~rst_l) log_dou_sbd_err <= 1'b0;
      else if (data_done) begin 
	log_dou_sbd_err <= 1'b0;
      end
      else if (data_start) begin 
	log_dou_sbd_err <= 1'b1;
      end
    end

  assign log_ep_history = ~data_done & (data_start | log_dou_sbd_err) & dou_sbd_vld_rcdbldr;

  always @ (posedge clk)
    begin
      if (~rst_l) ep_history <= 1'b0;
      else if (log_ep_history) begin 
	ep_history <= ep_history | dou_sbd_err_rcdbldr;
      end
      else ep_history <= 1'b0;
    end
  
  assign out_rcd_ep = take_care_rcd_ep ? (dou_sbd_err_rcdbldr | ep_history) : 1'b0;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Instantiations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // srq fifo
  pcie_common_srq #(4, `FIRE_DLC_EPE_REC_WDTH) rcd_fifo 
    (
     .clk        (clk),
     .rst_l      (rst_l),
     .enq        (k2y_rcd_enq),
     .deq        (rcd_deq),
     .di         (k2y_rcd),
     .do         (curr_rcd),
     .empty      (rcd_empty),
     .full       (),
     .afull      ()
     );

endmodule // dmu_ilu_eil_rcdbldr

