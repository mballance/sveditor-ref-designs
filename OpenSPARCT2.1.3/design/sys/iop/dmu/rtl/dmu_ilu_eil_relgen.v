// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_ilu_eil_relgen.v
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
module dmu_ilu_eil_relgen (
				clk,
				rst_l,
				y2k_rel_rcd,
				y2k_rel_enq,
				rcd_is_pio_mwr,
				rcd_is_cpl_reg,
				pio_tag,
				data_start,
				data_done,
				n_y2k_buf_addr_cl,
				y2k_buf_addr,

				k2y_dou_dptr,
				k2y_dou_err,
				k2y_dou_vld,
				dou_sbd_vld_datafsm,
				dou_sbd_vld_rcdbldr,
				dou_sbd_err_rcdbldr,

				// debug signal
				cpl_cl_done);
  

  // synopsys sync_set_reset "rst_l"
  

  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  //------------------------------------------------------------------------
  // Clock and Reset Signals
  //------------------------------------------------------------------------
  input           clk;	             // input clock
  input 	  rst_l;	     // input reset
  
  //------------------------------------------------------------------------
  // release interface to RMU
  //------------------------------------------------------------------------
  output 	  y2k_rel_enq;       // enqueue for release rcd
  output [8:0] 	  y2k_rel_rcd;       // release rcd
 
  //------------------------------------------------------------------------
  //   DOU DMA Rd Cpl Buffer status rcd interface with CLU
  //------------------------------------------------------------------------
  input [`FIRE_DLC_DOU_DPTR_WDTH-1:0] k2y_dou_dptr;
  input 			      k2y_dou_err;
  input 			      k2y_dou_vld;

  //------------------------------------------------------------------------
  // internal signals
  //------------------------------------------------------------------------ 
  input 	  rcd_is_pio_mwr;           // rcd is PIO MWr,       from *_rcdbldr.v
  input 	  rcd_is_cpl_reg;           // rcd is cpl from rcdbldr
  input [3:0]	  pio_tag;           //                       from *_rcdbldr.v
  input 	  data_start;
  input 	  data_done;         //                       from *_datafsm.v
  input [6:2] 	  n_y2k_buf_addr_cl;
  input [6:0] 	  y2k_buf_addr;      //                       from *_datafsm.v

  output 	  dou_sbd_vld_datafsm;       // dou cl avairable to pull to datafsm
  output 	  dou_sbd_vld_rcdbldr;       // dou cl avairable         to rcdbldr
  output 	  dou_sbd_err_rcdbldr;       // dou cl error             to rcdbldr
  
  //---------------------------------------------------------------------
  //  debug signals
  //---------------------------------------------------------------------
  output 	  cpl_cl_done;

  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  reg [8:0] 	  y2k_rel_rcd;
  reg 		  y2k_rel_enq;

  reg [3:0] 	  pio_tag_reg;
  reg 		  rcd_is_pio_mwr_reg;
  reg 		  data_done_reg;

  // scoreboard for dou dma rd cpl buffer status
  reg [`FIRE_DLC_DOU_DPTR_DPTH-1:0] sbd_vld_array;
  reg [`FIRE_DLC_DOU_DPTR_DPTH-1:0] sbd_err_array;

  reg [6:2] 			    adv_y2k_buf_addr_cl; // advanced 1 from cacheline y2k_buf_addr

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTER - NON-FLOPS ~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  reg [`FIRE_DLC_DOU_DPTR_DPTH-1:0] sbd_vld_set;
  reg [`FIRE_DLC_DOU_DPTR_DPTH-1:0] sbd_vld_clr;

  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  wire [8:0]	  n_rel_rcd;
  wire 		  n_rel_enq;
  wire 		  cpl_cl_done;       // when DOU read address over a cache line

  wire [`FIRE_DLC_DOU_DPTR_DPTH-1:0] n_sbd_vld_array;
  wire [`FIRE_DLC_DOU_DPTR_WDTH-1:0] sbd_rd_entry_datafsm;
  wire [`FIRE_DLC_DOU_DPTR_WDTH-1:0] sbd_rd_entry_rcdbldr;

  wire 				     clr_sbd;

  wire [6:2] 			     n_adv_y2k_buf_addr_cl;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Zero In Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  /* 0in scoreboard -rx_id k2y_dou_dptr -rx k2y_dou_vld
                    -tx_id y2k_buf_addr[6:2] -tx clr_sbd
                    -max_ids 32 -max_count_per_id 1  */

  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL/Behavioral Model <<<<<<<<<<<<<<<<<<<<<<<<<<<

  //------------------------------------------------------------------------
  // release records generation -
  //   need to release a cache line whenever y2k_buf_addr[2] flips when it's in 
  //   the middle of processing a DMA CPL(D) rcd
  //------------------------------------------------------------------------

  assign cpl_cl_done = (y2k_buf_addr[2] ^ n_y2k_buf_addr_cl[2]) & (~data_start);
// N2- AT 12/17/04:   assign n_rel_enq = (data_done_reg | cpl_cl_done) & (rcd_is_cpl_reg | rcd_is_pio_mwr_reg);

// N2+ AT 12/17/04: The rel_enq signal is not generated properly in Fire.  This
//		    was not an issue since in Fire, PIO Wr's are 64B.  However,
//		    in N2, PIO Wr's are 8B only.
//		    According to Fire MAS (sec. 8.4.8, pg 935), logically, 
//		    rel_enq = rls_pio_mwr | rls_dma_cpl
//			    = (data_done & rcd_is_pio_mwr) |
//			      ((data_done | y2k_buf_addr[2]_toggle) & rcd_is_cpl)
// 		    The way it was coded above causes an errorneous assertion
//		    of rel_enq when (rls_is_pio_mwr & y2k_buf_addr[2]_toggle).

  assign n_rel_enq = ((data_done_reg | cpl_cl_done) & (rcd_is_cpl_reg)) |
		     (data_done_reg & rcd_is_pio_mwr_reg);
// END N2+ AT 12/17/04

  assign n_rel_rcd = rcd_is_pio_mwr_reg ? {1'b0, 4'b0, pio_tag_reg[3:0]} : 
                                 {1'b1, 3'b0, y2k_buf_addr[6:2]};
  
  always @ (posedge clk)
    if (!rst_l) begin
      y2k_rel_enq <= 1'b0;
    end
    else begin
      y2k_rel_enq <= n_rel_enq;
    end
      
   always @ (posedge clk)
	if(~rst_l) begin
       y2k_rel_rcd <= {9{1'b0}};
       data_done_reg <= {{1'b0}};
       rcd_is_pio_mwr_reg <= {{1'b0}};
       pio_tag_reg <= {{4'b0}};
     end
     else begin
       y2k_rel_rcd <= n_rel_rcd;
       data_done_reg <= data_done;
       rcd_is_pio_mwr_reg <= rcd_is_pio_mwr;
       pio_tag_reg <= pio_tag;
     end

  //------------------------------------------------------------------------
  // flop for advanced 1 cacheline address of y2k_buf_addr[6:2]
  //------------------------------------------------------------------------
  assign n_adv_y2k_buf_addr_cl = n_y2k_buf_addr_cl + 1'b1;
   always @ (posedge clk)
	if(~rst_l) begin
       adv_y2k_buf_addr_cl <= {5{1'b0}};
     end
     else begin
       adv_y2k_buf_addr_cl <= n_adv_y2k_buf_addr_cl;
     end
  
  //------------------------------------------------------------------------
  // DOU dma rd cpl buffer status
  //------------------------------------------------------------------------

  // sbd err
  always @ (posedge clk)
	if(~rst_l) begin 
      	sbd_err_array <= {`FIRE_DLC_DOU_DPTR_DPTH{1'b0}};
    end
    else begin
      if (k2y_dou_vld) sbd_err_array[k2y_dou_dptr] <= k2y_dou_err;
    end

  // sbd vld
  always @ (posedge clk)
    if (!rst_l) begin
      sbd_vld_array <= {`FIRE_DLC_DOU_DPTR_DPTH{1'b0}};
    end
    else begin
      sbd_vld_array <= n_sbd_vld_array;
    end

  // sbd vld set array
  always @ (k2y_dou_vld or k2y_dou_dptr)
    begin
      sbd_vld_set = {`FIRE_DLC_DOU_DPTR_DPTH{1'b0}};
      sbd_vld_set[k2y_dou_dptr] = k2y_dou_vld;
    end

  // sbd vld clr array
  assign clr_sbd = (~rcd_is_pio_mwr_reg) & n_rel_enq;
  
  always @ (clr_sbd or y2k_buf_addr[6:2])
    begin
      sbd_vld_clr = {`FIRE_DLC_DOU_DPTR_DPTH{1'b0}};
      sbd_vld_clr[y2k_buf_addr[6:2]] = clr_sbd;
    end
  
  
  assign n_sbd_vld_array = (sbd_vld_array | sbd_vld_set) & (~sbd_vld_clr);

  // outputs
  assign sbd_rd_entry_datafsm = (&y2k_buf_addr[1:0]) ? adv_y2k_buf_addr_cl :
						 y2k_buf_addr[6:2];
  
  // for PIO MWr, data is in DOU no later than rcd is in ILU and the max. payld is a cacheline
  // thus, mux out 1'b1 of dou_sbd_vld_datafsm for PIO MWr.
  assign dou_sbd_vld_datafsm = rcd_is_pio_mwr ? 1'b1 : sbd_vld_array[sbd_rd_entry_datafsm];


  assign sbd_rd_entry_rcdbldr = n_y2k_buf_addr_cl[6:2];

  assign dou_sbd_vld_rcdbldr = sbd_vld_array[sbd_rd_entry_rcdbldr];

  assign dou_sbd_err_rcdbldr = sbd_err_array[sbd_rd_entry_rcdbldr];
     
endmodule // dmu_ilu_eil_relgen

