// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_slv.v
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
/**********************************************************
***********************************************************

    Project         : Vega

    File name       : niu_ipp_slv.v

    Module(s) name  : niu_ipp_slv
    Original:       : ipp_slv.v main.18, 

    Parent modules  : niu_ipp.v

    Child modules   : niu_ipp_lib.v

    Author's name   : Jonathan Shen, George Chu

    Date            : May. 2002

    Description     : Slave module for PIO access.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_ipp_slv (

		fifo_data_out_reg,		// from ipp_fifo
		fifo_wr_data_reg,		// to ipp_load
		fifo_wr_data_reg_wr_en_pls,	// to ipp_load
		inc_pkt_disc_cntr,		// from niu_ipp_pkt_dsc
                sum_prt_fail,                   // from cksum
                sum_prt_valid,                  // from cksum
                fifo_over_run,                  // from ipp_load
                fifo_under_run,                 // from ipp_load
		par_err,			// from ipp_fifo
		ipp_hfifo_par_addr,             // from ipp_fifo
		fwd_vec_cycle1,			// from ipp_ffl
		vec_cycle1_wr_en,		// to ipp_ffl
		ippfifo_rd_ptr_pio_wr_en,	// to ipp_load
		ippfifo_wr_ptr_pio_wr_en,	// to ipp_load
		fifo_rd_ptr,			// from ipp_load
		fifo_wr_ptr,			// from ipp_load
                ipp_dfifo_rptr,                 // from ipp_unload_ctl
                ipp_dfifo_wptr,                 // from ipp_unload_ctl, addr[10:0] of 2k-entry
                ipp_dfifo_dout1,                // from ipp_dfifo data_out_1
                ipp_dfifo_dout1_ecc,
                ipp_dfifo_dout1_ecc_syn,
                dfifo_miss_eop,
                dfifo_miss_sop,
                ecc_pkt_corrupted,
                dfifo_wt_data_reg_wr_en_pls,    // to ipp_unload_dat
                dfifo_rd_ptr_pio_wr_en,
                dfifo_wt_ptr_pio_wr_en,
// for ipp enable
		rst_ipp_en,			// from ipp
		wr_ipp_en_bit0,			// to ipp
// state machine
		state_mach0,			// from ipp
		state_mach1,			// from ipp
		state_mach2,			// from ipp
		state_mach3,			// from ipp
		state_mach4,			// from ipp
		state_mach5,			// from ipp
		state_mach6,			// from ipp
		state_mach7,			// from ipp
                state_mach8,                    // from ipp
                state_mach9,                    // from ipp
                state_mach10,                   // from ipp
                state_mach11,                   // from ipp
                state_mach12,                   // from ipp
                state_mach13,                   // from ipp
                state_mach14,                   // from ipp
                state_mach15,                   // from ipp
// pio interface
		ipp_pio_sel,
            	ipp_pio_addr,
            	ipp_pio_rd,
            	ipp_pio_wdata,
            	ipp_pio_ack,
            	ipp_pio_rdata,
            	ipp_pio_err,
            	ipp_pio_intr,
// for debug_bus
		mac_ipp_req,
            	xmac_ipp_ack,
            	mac_ipp_tag,
            	mac_ipp_data,
            	mac_ipp_ctrl,
            	mac_ipp_stat,
            	ipp_mac_ack,
            	ipp_xmac_req,
            	ffl_ipp_dvalid,
            	ffl_ipp_data,
            	ffl_ipp_ready,
            	ipp_ffl_mac_default,
            	ipp_ffl_dvalid,
		ffl_arb_ack,
            	ipp_ffl_req,
// global
		config_reg,			// to ipp
		ipp_debug,			// to ipp
                ipp_ecc_corrupt_sop,
                ipp_ecc_corrupt_2nd,
                ipp_ecc_corrupt_eop,
                ipp_ecc_corrupt_sing,
                ipp_ecc_corrupt_doub,
                ipp_ecc_corrupt_no_uncor,
                ecc_pkt_corrupted_clr,
		clk,
            	reset,
		reset2
		);		// end of pin definition

input	[145:0]	fifo_data_out_reg;
input		inc_pkt_disc_cntr;
input           sum_prt_fail;
input           sum_prt_valid;
input           fifo_over_run;
input           fifo_under_run;
input		par_err;
input     [5:0] ipp_hfifo_par_addr;
input    [13:0] fwd_vec_cycle1;

input	[5:0]	fifo_rd_ptr;
input	[6:0]	fifo_wr_ptr;

input    [11:0] ipp_dfifo_rptr;      // from ipp_unload_ctl
input    [11:0] ipp_dfifo_wptr;      // from ipp_unload_ctl, addr[11:0] of 2k-entry+1.wrap
input   [129:0] ipp_dfifo_dout1;     // from ipp_dfifo data_out_1
input    [18:0] ipp_dfifo_dout1_ecc;
input    [15:0] ipp_dfifo_dout1_ecc_syn;
input           dfifo_miss_eop;
input           dfifo_miss_sop;
input           ecc_pkt_corrupted;

input		rst_ipp_en;

input	[3:0]	state_mach0;
input	[3:0]	state_mach1;
input	[3:0]	state_mach2;
input	[3:0]	state_mach3;
input	[3:0]	state_mach4;
input	[3:0]	state_mach5;
input	[3:0]	state_mach6;
input	[3:0]	state_mach7;
input   [3:0]   state_mach8;
input   [3:0]   state_mach9;
input   [3:0]   state_mach10;
input   [3:0]   state_mach11;
input   [3:0]   state_mach12;
input   [3:0]   state_mach13;
input   [3:0]   state_mach14;
input   [3:0]   state_mach15;

input		ipp_pio_sel;
`ifdef NEPTUNE
input	[13:0]	ipp_pio_addr;
`else
input	[14:0]	ipp_pio_addr;
`endif
input		ipp_pio_rd;
input	[31:0]	ipp_pio_wdata;

input           mac_ipp_req;            // bmac sends the request to ipp
input           xmac_ipp_ack;           // xmac sends the ack to ipp
input           mac_ipp_tag;            // mac identifies the last part packet
input   [63:0]  mac_ipp_data;           // mac writing the data to ipp
input           mac_ipp_ctrl;           // active high for control information
input   [22:0]  mac_ipp_stat;           // mac writing the status to ipp
input          	ipp_mac_ack;            // ack from ipp to bmac
input          	ipp_xmac_req;           // req(as rdy) from ipp to xmac

input   [13:0] 	ffl_ipp_data;
input          	ffl_ipp_dvalid;
input          	ffl_ipp_ready;
input  	[11:0]  ipp_ffl_mac_default;
input          	ipp_ffl_dvalid;
input           ffl_arb_ack;
input           ipp_ffl_req;

input		clk, reset;

output	[129:0]	fifo_wr_data_reg;
output		fifo_wr_data_reg_wr_en_pls;
output	[24:0]	config_reg;
output	[31:0]	ipp_debug;
output          ipp_ecc_corrupt_sop;
output          ipp_ecc_corrupt_2nd;
output          ipp_ecc_corrupt_eop;
output          ipp_ecc_corrupt_sing;
output          ipp_ecc_corrupt_doub;
output          ipp_ecc_corrupt_no_uncor;
output          ecc_pkt_corrupted_clr;
output		vec_cycle1_wr_en;
output		ippfifo_rd_ptr_pio_wr_en;
output		ippfifo_wr_ptr_pio_wr_en;
output          dfifo_wt_data_reg_wr_en_pls; // to ipp_unload_dat
output          dfifo_rd_ptr_pio_wr_en;
output          dfifo_wt_ptr_pio_wr_en;

output		wr_ipp_en_bit0;

output		ipp_pio_ack;
output	[31:0]	ipp_pio_rdata;
output		ipp_pio_err;
output		ipp_pio_intr;

output		reset2;

/***************************************
** Register declaration
***************************************/
reg	[31:0]	rd_data;
reg		non_qualified_addr_err;
reg		config_wr_en;
reg		ipp_soft_reset;
reg		pkt_disc_cntr_wr_en;
reg		pkt_disc_cntr_auto_clr;
reg		bad_chksum_cntr_wr_en;
reg		bad_chksum_cntr_auto_clr;
reg		ecc_error_cntr_wr_en;
reg		ecc_error_cntr_auto_clr;
reg		ld_status;
reg		interr_stat_auto_clr;
reg		interr_mask_wr_en;
reg	[7:0]	interr_mask_reg;
reg		fifo_wr_data_reg_wr_en;
reg		fifo_wr_data_reg0_wr_en;
reg		fifo_wr_data_reg1_wr_en;
reg		fifo_wr_data_reg2_wr_en;
reg		fifo_wr_data_reg3_wr_en;
reg		fifo_wr_data_reg4_wr_en;
reg		ippfifo_rd_ptr_pio_wr_en;
reg		ippfifo_wr_ptr_pio_wr_en;
reg		vec_cycle1_wr_en;
reg		ipp_pio_intr;
reg		debug_wr_en;

reg             dfifo_wt_data_reg_wr_en;
wire            dfifo_wt_data_reg_wr_en_pls;
reg             dfifo_rd_ptr_pio_wr_en;
reg             dfifo_wt_ptr_pio_wr_en;
/***************************************
** Wire declaration
***************************************/
`ifdef NEPTUNE
wire	[13:0]	reg_offset;
`else
wire	[14:0]	reg_offset;
`endif
wire	[31:0]	ipp_pio_wdata;
wire	[31:0]	wr_data;
wire		rd_wr, wr_en;
//wire		rd_en; 
wire		rac_pls;
wire		core_sel;
wire		core_sel_lead;
//wire		core_sel_trail;
wire		addr_err;
wire	[24:0]	config_reg;
wire	[31:0]	ipp_debug;
wire	[13:0]	pkt_disc_cntr_reg;
wire	[13:0]	bad_chksum_cntr_reg;
wire	 [7:0]	ecc_error_cntr_reg;
wire            dfifo_miss_tag       = dfifo_miss_eop    || dfifo_miss_sop;
wire            dfifo_miss_eop_oc;
wire            dfifo_miss_sop_oc;
wire		par_err_oc;
wire     [5:0]  hfifo_par_addr_oc;
wire		fifo_over_run_oc;
wire		fifo_under_run_oc;
wire		max_pkt_disc_cntr_reached;
wire		max_bad_chksum_cntr_reached;
wire		max_ecc_error_cntr_reached;
wire		fifo_wr_data_reg_wr_en_pls;
wire		n_reset2 = reset | ipp_soft_reset;
reg             reset2;
wire     [3:0]  debug_reg;

wire            datfifo_pio_wr_ena   = config_reg[5];
wire    [17:0]  ipp_dfifo_dout1_ecc_sti;
wire    [15:0]  ipp_dfifo_dout1_ecc_syn_sti;
wire            uncorr_error1_found  = ipp_dfifo_dout1_ecc[18];
wire            uncorr_error1_found_d;
wire    [10:0]  ipp_dfifo_rptr1      = ipp_dfifo_dout1_ecc[17:7]; 
wire    [10:0]  ipp_dfifo_rptr1_d; 
wire            ecc_no_error         = ipp_dfifo_dout1_ecc[0]; 
wire            ecc_no_error_d;
wire     [1:0]  ecc_uncorrect_error  = ipp_dfifo_dout1_ecc[6:5]; 
wire            wt_ecc_status        = |ecc_uncorrect_error[1:0];
reg             rac_ecc_syndrome;
reg             wt_ecc_corrupt_reg;
wire    [31:0]  n_ipp_ecc_corrupt_reg;
wire    [31:0]  ipp_ecc_corrupt_reg;
wire            ipp_ecc_corrupt_sop;
wire            ipp_ecc_corrupt_2nd;
wire            ipp_ecc_corrupt_eop;
wire            ipp_ecc_corrupt_sing     = ipp_ecc_corrupt_reg[16];
wire            ipp_ecc_corrupt_doub     = ipp_ecc_corrupt_reg[17];
wire            ipp_ecc_corrupt_no_uncor = ipp_ecc_corrupt_reg[31];
wire            ecc_pkt_corrupted_clr;
wire            ipp_ecc_corrupt_one_pkt  = ipp_ecc_corrupt_reg[8];
wire            ipp_ecc_corrupt_all_pkt  = ipp_ecc_corrupt_reg[10];
reg             ipp_ecc_corrupt_ena;
wire    [11:0]  ipp_dfifo_rptr_d;
reg             wt_dfifo_rptr;
reg             rac_dfifo_rptr;
wire    [11:0]  ipp_dfifo_rptr_sti;

wire    [31:0]  interr_stat_bus = {dfifo_miss_sop_oc,
                                   dfifo_miss_eop_oc,             // bit 30
                                   ipp_dfifo_dout1_ecc_sti[17:0], // bit 12~29
				   par_err_oc,			  // bit 11
                                   max_ecc_error_cntr_reached,    // bit 10
				   hfifo_par_addr_oc[5:0],        // bit 4~9
				   fifo_over_run_oc,		  // bit 3
				   fifo_under_run_oc,		  // bit 2
				   max_bad_chksum_cntr_reached,	  // bit 1
				   max_pkt_disc_cntr_reached	  // bit 0
				  };

wire            inc_bad_chksum_cntr = sum_prt_fail && sum_prt_valid;
wire            inc_ecc_error_cntr  = !ecc_no_error_d && !(ipp_dfifo_rptr1[10:0]==ipp_dfifo_rptr1_d[10:0]) ||
                                       uncorr_error1_found  && !uncorr_error1_found_d;

`ifdef NEPTUNE
`define IPP_SLV_ZEROS 1'h0
`else
`define IPP_SLV_ZEROS 2'h0
`endif
				   
always @ (posedge clk)
  ipp_pio_intr <= ((~interr_mask_reg[6]) & (interr_stat_bus[31] || interr_stat_bus[30])) ||
                  ((~interr_mask_reg[5]) & (interr_stat_bus[29] || interr_stat_bus[28])) ||
		  ((~interr_mask_reg[4]) & interr_stat_bus[11]) ||
		  ((~interr_mask_reg[7]) & interr_stat_bus[10]) ||
		  ((~interr_mask_reg[3]) & interr_stat_bus[3]) |
		  ((~interr_mask_reg[2]) & interr_stat_bus[2]) |
		  ((~interr_mask_reg[1]) & interr_stat_bus[1]) |
		  ((~interr_mask_reg[0]) & interr_stat_bus[0]); 

/***************************************
** Read and Write logic
***************************************/

ipp_FD1 rd_wr_FD1 (.D(ipp_pio_rd), .CP(clk), .Q(rd_wr));

ipp_FD1 core_sel_FD1 (.D(ipp_pio_sel), .CP(clk), .Q(core_sel));

`ifdef NEPTUNE
ipp_RegDff #(14) reg_offset_RegDff (.din(ipp_pio_addr[13:0]),
                                    .clk(clk),
                                    .qout(reg_offset[13:0]));
`else
ipp_RegDff #(15) reg_offset_RegDff (.din(ipp_pio_addr[14:0]),
                                    .clk(clk),
                                    .qout(reg_offset[14:0]));
`endif

ipp_RegDff #(32) wr_data_RegDff (.din(ipp_pio_wdata[31:0]),
                                 .clk(clk),
                                 .qout(wr_data[31:0]));

ipp_PlsGen2 core_sel_PlsGen2 (.sig_in(core_sel),. clk(clk),
                              .lead(core_sel_lead),
                              .trail(/*core_sel_trail*/));

//assign	rd_en  = core_sel & rd_wr;
wire	rac_ok = core_sel_lead & rd_wr;
assign	wr_en  = core_sel_lead & (~rd_wr);

ipp_RegDff #(32) pio_rd_data_RegDff (.din(rd_data),.clk(clk),
                                     .qout(ipp_pio_rdata));

ipp_FD1 pio_ack_FD1 (.D(core_sel_lead), .CP(clk), .Q(ipp_pio_ack));

ipp_FD1 rac_pls_FD1 (.D(rac_ok), .CP(clk), .Q(rac_pls));

assign addr_err = non_qualified_addr_err & core_sel_lead;

ipp_FD1 pio_err_FD1 (.D(addr_err), .CP(clk), .Q(ipp_pio_err));

//***** ipp local Reset Logic *****
always @ (posedge clk) begin
  ipp_soft_reset <= config_wr_en & wr_data[31] && !reset; 
  reset2         <= n_reset2;
end

/***************************************
** Read and Write Address Decoder
***************************************/
always @ (rac_ok or wr_en or reg_offset or config_reg or ipp_soft_reset or rac_pls
	  or pkt_disc_cntr_reg or bad_chksum_cntr_reg or interr_stat_bus or 
	  interr_mask_reg or fifo_data_out_reg or fifo_wr_data_reg or 
	  fifo_rd_ptr or fifo_wr_ptr or 
          ipp_dfifo_dout1 or ipp_dfifo_rptr or ipp_dfifo_wptr or
	                state_mach0 or state_mach1 or state_mach2 or 
	  state_mach3 or state_mach4 or state_mach5 or state_mach6 or
	  state_mach7 or state_mach8 or state_mach9 or state_mach10 or
	  state_mach11 or state_mach12 or state_mach13 or state_mach14 or
	  state_mach15 or fwd_vec_cycle1 or
          ecc_error_cntr_reg or ipp_ecc_corrupt_reg or 
                          ipp_dfifo_dout1_ecc_syn_sti or
          ipp_dfifo_rptr_sti or
	  debug_reg)
  begin
    non_qualified_addr_err = 0;
    rd_data = 32'hDEAD_BEEF;
    config_wr_en = 1'b0;
    pkt_disc_cntr_wr_en = 1'b0;
    pkt_disc_cntr_auto_clr = 1'b0;
    bad_chksum_cntr_wr_en = 1'b0;
    bad_chksum_cntr_auto_clr = 1'b0;
    ld_status = 1'b0;
    interr_stat_auto_clr = 1'b0;
    interr_mask_wr_en = 1'b0;
    fifo_wr_data_reg_wr_en = 1'b0;
    fifo_wr_data_reg0_wr_en = 1'b0;
    fifo_wr_data_reg1_wr_en = 1'b0;
    fifo_wr_data_reg2_wr_en = 1'b0;
    fifo_wr_data_reg3_wr_en = 1'b0;
    fifo_wr_data_reg4_wr_en = 1'b0;
    ippfifo_rd_ptr_pio_wr_en = 1'b0;
    ippfifo_wr_ptr_pio_wr_en = 1'b0;
    vec_cycle1_wr_en = 1'b0;
    debug_wr_en = 1'b0;

    dfifo_wt_data_reg_wr_en  = 1'h0;
    dfifo_rd_ptr_pio_wr_en   = 1'h0;
    dfifo_wt_ptr_pio_wr_en   = 1'h0;
    ecc_error_cntr_wr_en     = 1'h0;
    ecc_error_cntr_auto_clr  = 1'h0;
    wt_ecc_corrupt_reg       = 1'h0;
    rac_ecc_syndrome         = 1'h0;
    wt_dfifo_rptr            = 1'h0;
    rac_dfifo_rptr           = 1'h0;

    case (reg_offset) //synopsys parallel_case full_case
      {`IPP_SLV_ZEROS,13'h000}: begin
		 config_wr_en = wr_en;
		 rd_data = {ipp_soft_reset,6'h0,config_reg[24:0]};
	       end
      {`IPP_SLV_ZEROS,13'h004}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h020}: begin
		 pkt_disc_cntr_wr_en = wr_en;
		 pkt_disc_cntr_auto_clr = rac_pls;
		 rd_data = {18'b0, pkt_disc_cntr_reg[13:0]};
	       end
      {`IPP_SLV_ZEROS,13'h024}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h028}: begin
		 bad_chksum_cntr_wr_en = wr_en;
		 bad_chksum_cntr_auto_clr = rac_pls;
		 rd_data = {18'b0, bad_chksum_cntr_reg[13:0]};
	       end
      {`IPP_SLV_ZEROS,13'h02c}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h030}: begin
                 ecc_error_cntr_wr_en = wr_en;
                 ecc_error_cntr_auto_clr = rac_pls;
                 rd_data = {24'b0, ecc_error_cntr_reg[7:0]};
               end
      {`IPP_SLV_ZEROS,13'h034}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h040}: begin	// both R/W and RAC
		 ld_status = wr_en;
		 interr_stat_auto_clr = rac_pls;
		 rd_data = interr_stat_bus;
	       end	 
      {`IPP_SLV_ZEROS,13'h044}: begin
		 rd_data = 32'h0;
	       end	 
      {`IPP_SLV_ZEROS,13'h048}: begin 	// "1" means Mask Enable
		 interr_mask_wr_en = wr_en;
		 rd_data = {{24{1'h0}}, interr_mask_reg[7:0]};
	       end
      {`IPP_SLV_ZEROS,13'h04c}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h060}: begin	// fifo_data_out_reg[31:0]; RO
		 rd_data = fifo_data_out_reg[31:0]; 
	       end
      {`IPP_SLV_ZEROS,13'h064}: begin
		 rd_data = 32'h0; 
	       end
      {`IPP_SLV_ZEROS,13'h068}: begin    // fifo_data_out_reg[63:32]; RO
                 rd_data = fifo_data_out_reg[63:32];
               end
      {`IPP_SLV_ZEROS,13'h06c}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h070}: begin    // fifo_data_out_reg[95:64]; RO
                 rd_data = fifo_data_out_reg[95:64];
               end
      {`IPP_SLV_ZEROS,13'h074}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h078}: begin    // fifo_data_out_reg[127:96]; RO
                 rd_data = fifo_data_out_reg[127:96];
               end
      {`IPP_SLV_ZEROS,13'h07c}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h080}: begin    // fifo_data_out_reg[145:128]; RO
                 rd_data = {14'b0, fifo_data_out_reg[145:128]};
               end
      {`IPP_SLV_ZEROS,13'h084}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h088}: begin
		 fifo_wr_data_reg0_wr_en = wr_en;
		 rd_data = fifo_wr_data_reg[31:0];
	       end
      {`IPP_SLV_ZEROS,13'h08c}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h090}: begin
		 fifo_wr_data_reg1_wr_en = wr_en;
                 rd_data = fifo_wr_data_reg[63:32];
               end
      {`IPP_SLV_ZEROS,13'h094}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h098}: begin
		 fifo_wr_data_reg2_wr_en = wr_en;
                 rd_data = fifo_wr_data_reg[95:64];
               end
      {`IPP_SLV_ZEROS,13'h09c}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h0a0}: begin
		 fifo_wr_data_reg3_wr_en = wr_en;
                 rd_data = fifo_wr_data_reg[127:96];
               end
      {`IPP_SLV_ZEROS,13'h0a4}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h0a8}: begin
		 fifo_wr_data_reg4_wr_en = wr_en;
		 fifo_wr_data_reg_wr_en = wr_en;
                 rd_data = {30'b0, fifo_wr_data_reg[129:128]};
               end
      {`IPP_SLV_ZEROS,13'h0ac}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h0b0}: begin
		 ippfifo_rd_ptr_pio_wr_en = wr_en;
		 rd_data = {26'b0, fifo_rd_ptr[5:0]};
	       end
      {`IPP_SLV_ZEROS,13'h0b4}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h0b8}: begin
		 ippfifo_wr_ptr_pio_wr_en = wr_en;
		 rd_data = {25'b0, fifo_wr_ptr[6:0]};
	       end
      {`IPP_SLV_ZEROS,13'h0bc}: begin
                 rd_data = 32'h0;
               end

      {`IPP_SLV_ZEROS,13'h0c0}: begin	// ipp_dfifo_dout1[31:0]; RO
		 rd_data = ipp_dfifo_dout1[31:0]; 
	       end
      {`IPP_SLV_ZEROS,13'h0c4}: begin
		 rd_data = 32'h0; 
	       end
      {`IPP_SLV_ZEROS,13'h0c8}: begin    // ipp_dfifo_dout1[63:32]; RO
                 rd_data = ipp_dfifo_dout1[63:32];
               end
      {`IPP_SLV_ZEROS,13'h0cc}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h0d0}: begin    // ipp_dfifo_dout1[95:64]; RO
                 rd_data = ipp_dfifo_dout1[95:64];
               end
      {`IPP_SLV_ZEROS,13'h0d4}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h0d8}: begin    // ipp_dfifo_dout1[127:96]; RO
                 rd_data = ipp_dfifo_dout1[127:96];
               end
      {`IPP_SLV_ZEROS,13'h0dc}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h0e0}: begin    // ipp_dfifo_dout1[129:128]; RO
                 rd_data = {30'b0, ipp_dfifo_dout1[129:128]};
               end
      {`IPP_SLV_ZEROS,13'h0e4}: begin
                 rd_data = 32'h0;
               end

      {`IPP_SLV_ZEROS,13'h0e8}: begin
		 fifo_wr_data_reg0_wr_en = wr_en;
		 rd_data = fifo_wr_data_reg[31:0];
	       end
      {`IPP_SLV_ZEROS,13'h0ec}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h0f0}: begin
		 fifo_wr_data_reg1_wr_en = wr_en;
                 rd_data = fifo_wr_data_reg[63:32];
               end
      {`IPP_SLV_ZEROS,13'h0f4}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h0f8}: begin
		 fifo_wr_data_reg2_wr_en = wr_en;
                 rd_data = fifo_wr_data_reg[95:64];
               end
      {`IPP_SLV_ZEROS,13'h0fc}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h100}: begin
		 fifo_wr_data_reg3_wr_en = wr_en;
                 rd_data = fifo_wr_data_reg[127:96];
               end
      {`IPP_SLV_ZEROS,13'h104}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h108}: begin
		 fifo_wr_data_reg4_wr_en = wr_en;
		 dfifo_wt_data_reg_wr_en = wr_en;
                 rd_data = {30'h0,fifo_wr_data_reg[129:128]};
               end
      {`IPP_SLV_ZEROS,13'h10c}: begin
                 rd_data = 32'h0;
               end

      {`IPP_SLV_ZEROS,13'h110}: begin
		 dfifo_rd_ptr_pio_wr_en = wr_en;
		 rd_data = {20'h0, ipp_dfifo_rptr[11:0]};
	       end
      {`IPP_SLV_ZEROS,13'h114}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h118}: begin
		 dfifo_wt_ptr_pio_wr_en = wr_en;
		 rd_data = {20'h0, ipp_dfifo_wptr[11:0]};
	       end
      {`IPP_SLV_ZEROS,13'h11c}: begin
		 rd_data = 32'h0;
	       end

      {`IPP_SLV_ZEROS,13'h120}: begin	// RO
		 rd_data = {state_mach7, state_mach6,
			    state_mach5, state_mach4,
			    state_mach3, state_mach2,
			    state_mach1, state_mach0};
	       end
      {`IPP_SLV_ZEROS,13'h124}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h128}: begin    // RO
		 rd_data = {state_mach15, state_mach14,
			    state_mach13, state_mach12,
			    state_mach11, state_mach10,
			    state_mach9, state_mach8};
	       end
      {`IPP_SLV_ZEROS,13'h12c}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h130}: begin
		 vec_cycle1_wr_en = wr_en;
		 rd_data = {18'h0, fwd_vec_cycle1[13:0]};
	       end
      {`IPP_SLV_ZEROS,13'h134}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h138}: begin
		 debug_wr_en = wr_en;
		 rd_data = {28'b0, debug_reg[3:0]};
	       end
      {`IPP_SLV_ZEROS,13'h13c}: begin
		 rd_data = 32'h0;
	       end
      {`IPP_SLV_ZEROS,13'h140}: begin
                 rac_ecc_syndrome = rac_pls;
                 rd_data = {16'h0,ipp_dfifo_dout1_ecc_syn_sti[15:0]};
               end
      {`IPP_SLV_ZEROS,13'h144}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h148}: begin
                 wt_dfifo_rptr = wr_en;
                 rac_dfifo_rptr = rac_pls;
                 rd_data = {20'h0,ipp_dfifo_rptr_sti[11:0]};
               end
      {`IPP_SLV_ZEROS,13'h14c}: begin
                 rd_data = 32'h0;
               end
      {`IPP_SLV_ZEROS,13'h150}: begin
                 wt_ecc_corrupt_reg = wr_en;
                 rd_data = ipp_ecc_corrupt_reg[31:0];
               end
      {`IPP_SLV_ZEROS,13'h154}: begin
                 rd_data = 32'h0;
               end
      default: begin
		 rd_data = 32'hDEAD_BEEF;
		 non_qualified_addr_err = rac_ok;
	       end

    endcase
  end

// ****** Ecc Corruption Controls ***********************/
  always @ (ecc_pkt_corrupted       or
            ipp_ecc_corrupt_all_pkt or ipp_ecc_corrupt_one_pkt
           )
    case({ecc_pkt_corrupted,ipp_ecc_corrupt_all_pkt,ipp_ecc_corrupt_one_pkt}) // synopsys parallel_case
      3'b000: ipp_ecc_corrupt_ena = 1'h0;
      3'b001: ipp_ecc_corrupt_ena = 1'h1;
      3'b010: ipp_ecc_corrupt_ena = 1'h1;
      3'b011: ipp_ecc_corrupt_ena = 1'h1;
      3'b100: ipp_ecc_corrupt_ena = 1'h0;
      3'b101: ipp_ecc_corrupt_ena = 1'h0;
      3'b110: ipp_ecc_corrupt_ena = 1'h1;
      3'b111: ipp_ecc_corrupt_ena = 1'h1;
     default: ipp_ecc_corrupt_ena = 1'h0;
    endcase

  assign ipp_ecc_corrupt_sop   =  ipp_ecc_corrupt_reg[0]  &&  ipp_ecc_corrupt_ena;
  assign ipp_ecc_corrupt_2nd   =  ipp_ecc_corrupt_reg[1]  &&  ipp_ecc_corrupt_ena;
  assign ipp_ecc_corrupt_eop   =  ipp_ecc_corrupt_reg[2]  &&  ipp_ecc_corrupt_ena;
  assign ecc_pkt_corrupted_clr = !ipp_ecc_corrupt_all_pkt && !ipp_ecc_corrupt_one_pkt || reset;

//******************************
//* Registers instantiation
//******************************

// ****** configuration register: 25 bits (R/W) ******/
ipp_reg_w_s_17 reg_w_s_17_max (
                               .di     (wr_data[24:8]),
                               .wr     (config_wr_en),
                               .rs     (reset),
                               .ck     (clk),
                               .qo     (config_reg[24:8])
                              );

ipp_xREG #(7) xREG_Config(.clk(clk), .reset(reset),
                   	   .en(config_wr_en), .din(wr_data[7:1]),
			   .qout(config_reg[7:1]));
// ConfigBit0 = IPP_EN
// ConfigBit0 can only be written with "1" value.
// "0" value can only be written by reset hardware.
wire		wr_ipp_en_bit1 = config_wr_en & wr_data[0];
wire		wr_ipp_en_bit0 = config_wr_en & (~wr_data[0]);

ipp_xREG #(1)  xREG_ConfigBit0(.clk(clk), .reset(reset | rst_ipp_en),
			       .en(wr_ipp_en_bit1), .din(wr_data[0]),
			       .qout(config_reg[0]));

// ****** Packet Discard Counter register: 14 bits ******/
ipp_RAC_Plus1_Reg #(14) RAC_Plus1_Reg_PktDiscaCntr(.clk(clk), .reset(reset),
			.iInc(inc_pkt_disc_cntr),
			.iAutoClrEn(pkt_disc_cntr_auto_clr),
			.iMaxValue({14{1'b1}}),
			.iLoad(pkt_disc_cntr_wr_en),
			.iLoadValue(wr_data[13:0]),
			.oDout(pkt_disc_cntr_reg[13:0]),
			.oMaxValueReached(max_pkt_disc_cntr_reached));

// ****** Bad Chksum Counter register: 14 bits ******/
ipp_RAC_Plus1_Reg #(14) RAC_Plus1_Reg_BadChksumCntr(.clk(clk), .reset(reset),
			.iInc(inc_bad_chksum_cntr),
			.iAutoClrEn(bad_chksum_cntr_auto_clr),
			.iMaxValue({14{1'b1}}),
			.iLoad(bad_chksum_cntr_wr_en),
			.iLoadValue(wr_data[13:0]),
			.oDout(bad_chksum_cntr_reg[13:0]),
			.oMaxValueReached(max_bad_chksum_cntr_reached));

// ****** Ecc Error  Counter register:  8 bits ******/
ipp_RAC_Plus1_Reg #(8)  RAC_Plus1_Reg_EccErrorCntr(.clk(clk), .reset(reset),
                        .iInc(inc_ecc_error_cntr),
                        .iAutoClrEn(ecc_error_cntr_auto_clr),
                        .iMaxValue({8{1'b1}}),
                        .iLoad(ecc_error_cntr_wr_en),
                        .iLoadValue(wr_data[7:0]),
                        .oDout(ecc_error_cntr_reg[7:0]),
                        .oMaxValueReached(max_ecc_error_cntr_reached));

// ****** Interrupt Status bits ******/
ipp_RAC_FF reg_rac_mis_sop   (.clk(clk), .reset(reset),   .set(dfifo_miss_sop),
                             .rst(interr_stat_auto_clr), .load(ld_status), .load_data(wr_data[31]),
                             .dout(dfifo_miss_sop_oc));

ipp_RAC_FF reg_rac_mis_eop   (.clk(clk), .reset(reset),   .set(dfifo_miss_eop),
                             .rst(interr_stat_auto_clr), .load(ld_status), .load_data(wr_data[30]),
                             .dout(dfifo_miss_eop_oc));

ipp_reg_w_sti_r_rac_1  reg_w_sti_r_rac_1_ecc_unc1 (
                                                   .di   (ld_status ? wr_data[29]   : ipp_dfifo_dout1_ecc[6]),
                                                   .wr   (ld_status || wt_ecc_status),
                                                   .rs   (reset),
                                                   .rac  (interr_stat_auto_clr),
                                                   .ck   (clk),
                                                   .qo   (ipp_dfifo_dout1_ecc_sti[17])
                                                  );

ipp_reg_w_sti_r_rac_1  reg_w_sti_r_rac_1_ecc_unc0 (
                                                   .di   (ld_status ? wr_data[28]   : ipp_dfifo_dout1_ecc[5]),
                                                   .wr   (ld_status || wt_ecc_status),
                                                   .rs   (reset),
                                                   .rac  (interr_stat_auto_clr),
                                                   .ck   (clk),
                                                   .qo   (ipp_dfifo_dout1_ecc_sti[16])
                                                  );

wire [3:0] ecc_inp_15_11 = (ld_status ? wr_data[27:24] : ipp_dfifo_dout1_ecc[4:1]);

ipp_reg_w_sti_r_rac_5  reg_w_sti_r_rac_5_ecc_err  (
                                                   .di   ({ecc_inp_15_11,1'h0}),
                                                   .wr   (ld_status || wt_ecc_status),
                                                   .rs   (reset),
                                                   .rac  (interr_stat_auto_clr),
                                                   .ck   (clk),
                                                   .qo   (ipp_dfifo_dout1_ecc_sti[15:11])
                                                  );

ipp_reg_w_sti_r_rac_11 reg_w_sti_r_rac_11_ecc_adr (
                                                   .di   (ld_status ? wr_data[22:12] : ipp_dfifo_dout1_ecc[17:7]),
                                                   .wr   (ld_status || wt_ecc_status),
                                                   .rs   (reset),
                                                   .rac  (interr_stat_auto_clr),
                                                   .ck   (clk),
                                                   .qo   (ipp_dfifo_dout1_ecc_sti[10:0])
                                                  );

// ParityErrorOc bit; bit 11
ipp_RAC_FF RAC_FF_parity_err(.clk(clk), .reset(reset),
          .set(par_err), .rst(interr_stat_auto_clr),
          .load(ld_status), .load_data(wr_data[11]),
	  .dout(par_err_oc));

// Head_fifo_parity_addr[5:0] bit; bit [9:4]
ipp_reg_w_sti_r_rac_6  reg_w_sti_r_rac_6_par_adr  (
                                                   .di   (ld_status ? wr_data[9:4] : ipp_hfifo_par_addr[5:0]),
                                                   .wr   (ld_status || par_err),
                                                   .rs   (reset),
                                                   .rac  (interr_stat_auto_clr),
                                                   .ck   (clk),
                                                   .qo   (hfifo_par_addr_oc[5:0])
                                                  );

// IPP fifoOverRunOc bit; bit 3
ipp_RAC_FF RAC_FF_fifo_over_run(.clk(clk), .reset(reset),
	  .set(fifo_over_run), .rst(interr_stat_auto_clr),
	  .load(ld_status), .load_data(wr_data[3]),
	  .dout(fifo_over_run_oc));

// IPP fifoUnderRunOc bit; bit 2
ipp_RAC_FF RAC_FF_fifo_under_run(.clk(clk), .reset(reset),
          .set(fifo_under_run), .rst(interr_stat_auto_clr),
	  .load(ld_status), .load_data(wr_data[2]),
          .dout(fifo_under_run_oc));

// synopsys translate_off

// For diagnostic purpose
always @ (reset or fifo_over_run_oc)
  if (!reset && fifo_over_run_oc)
    $display("Warning at sim time = %d, ipp fifo over run occurred.", $stime);
  else ;

// For diagnostic purpose
always @ (reset or fifo_under_run_oc)
  if (!reset && fifo_under_run_oc)
    $display("Warning at sim time = %d, ipp fifo under run occurred.", $stime);
  else ;
// synopsys translate_on

// ****** Interrupt Mask Register: 8 bits ******/
always @ (posedge clk)
  if (reset)
    interr_mask_reg[7:0] <= 8'b1111_1111;		// reset to all "1"
  else if (interr_mask_wr_en)
    interr_mask_reg[7:0] <= wr_data[7:0];
  else interr_mask_reg[7:0] <= interr_mask_reg[7:0];

// ****** fifo_wr_data_register0: 32 bits (R/W) ******/
ipp_xREG #(32) xREG_fifo_wr_data_register0(.clk(clk), .reset(reset),
					   .en(fifo_wr_data_reg0_wr_en),
					   .din(wr_data[31:0]),
					   .qout(fifo_wr_data_reg[31:0]));

// ****** fifo_wr_data_register1: 32 bits (R/W) ******/
ipp_xREG #(32) xREG_fifo_wr_data_register1(.clk(clk), .reset(reset),
                                           .en(fifo_wr_data_reg1_wr_en),
                                           .din(wr_data[31:0]),
                                           .qout(fifo_wr_data_reg[63:32]));

// ****** fifo_wr_data_register2: 32 bits (R/W) ******/
ipp_xREG #(32) xREG_fifo_wr_data_register2(.clk(clk), .reset(reset),
                                           .en(fifo_wr_data_reg2_wr_en),
                                           .din(wr_data[31:0]),
                                           .qout(fifo_wr_data_reg[95:64]));

// ****** fifo_wr_data_register3: 32 bits (R/W) ******/
ipp_xREG #(32) xREG_fifo_wr_data_register3(.clk(clk), .reset(reset),
                                           .en(fifo_wr_data_reg3_wr_en),
                                           .din(wr_data[31:0]),
                                           .qout(fifo_wr_data_reg[127:96]));

// ****** fifo_wr_data_register4: 2 bits (R/W) ******/
ipp_xREG #(2) xREG_fifo_wr_data_register4(.clk(clk), .reset(reset),
                                          .en(fifo_wr_data_reg4_wr_en),
                                          .din(wr_data[1:0]),
                                          .qout(fifo_wr_data_reg[129:128]));

// fifo_wr_data_reg write enable
ipp_falling_edge_puls_gen falling_edge_puls_gen_fifo_wr_data_reg_wr_en_pls(
			  .reset(reset), .clk(clk),
			  .signal_in(fifo_wr_data_reg_wr_en),
			  .puls_out(fifo_wr_data_reg_wr_en_pls));

// dfifo_wt_data_reg write enable
ipp_falling_edge_puls_gen falling_edge_puls_gen_dfifo_wt_data_reg_wr_en_pls(
			                .reset      (reset),
                                        .clk        (clk),
			                .signal_in  (dfifo_wt_data_reg_wr_en && datfifo_pio_wr_ena),
			                .puls_out   (dfifo_wt_data_reg_wr_en_pls));

// ****** debug register ******/
ipp_xREG #(4) debug_reg_xREG(.clk(clk), .reset(reset),
			     .en(debug_wr_en),
			     .din(wr_data[3:0]),
			     .qout(debug_reg[3:0]));

reg	[31:0]	debug_din;
wire	[3:0]	ipp_debug_sel = debug_reg[3:0];
wire	[31:0]	debug_bus0;
wire	[31:0]	debug_bus1;
wire	[31:0]	debug_bus2;
wire	[31:0]	debug_bus3;
wire	[31:0]	debug_bus4;
wire	[31:0]	debug_bus5;
wire	[31:0]	debug_bus6;
wire	[31:0]	debug_bus7;
wire	[31:0]	debug_bus8;

wire     [1:0]  xface_arb     = {ffl_arb_ack,ipp_ffl_req};
wire    [12:0]  xface_to_ffl  = {ipp_ffl_dvalid,ipp_ffl_mac_default[11:0]};
wire    [15:0]  xface_fr_ffl  = {ffl_ipp_ready,ffl_ipp_dvalid,ffl_ipp_data[13:0]};
wire    [31:0]  xface_ffl_bus = {xface_arb[1:0],1'h0,xface_to_ffl[12:0],xface_fr_ffl[15:0]};

assign          debug_bus0 = {state_mach2[1:0], 1'b0,
                              state_mach10[0],  state_mach9[3:0], state_mach8[3:0],
                              state_mach7[1:0], state_mach6[1:0],
                              state_mach5[3:0],
                              state_mach1[3:0],
                              state_mach0[2:0],
                              state_mach4[0],   state_mach3[3:0]};

assign		debug_bus1 = {3'b0, mac_ipp_req, ipp_mac_ack, mac_ipp_ctrl,
			      xmac_ipp_ack, ipp_xmac_req, mac_ipp_tag,
			      mac_ipp_stat[22:0]};

assign		debug_bus2 = {mac_ipp_data[63:32]};
assign		debug_bus3 = {mac_ipp_data[31:0]};

assign		debug_bus4 = xface_ffl_bus[31:0];

assign		debug_bus5 = {fifo_data_out_reg[031:00]};
assign		debug_bus6 = {fifo_data_out_reg[063:32]};
assign		debug_bus7 = {fifo_data_out_reg[095:64]};
assign		debug_bus8 = {fifo_data_out_reg[127:96]};

always @ (       ipp_debug_sel or debug_bus0 or debug_bus1 or debug_bus2 or
	  debug_bus3 or debug_bus4 or debug_bus5 or debug_bus6 or debug_bus7 or debug_bus8)

  casex (ipp_debug_sel) // synopsys parallel_case full_case
    4'd0: debug_din = debug_bus0;
    4'd1: debug_din = debug_bus1;
    4'd2: debug_din = debug_bus2;
    4'd3: debug_din = debug_bus3;
    4'd4: debug_din = debug_bus4;
    4'd5: debug_din = debug_bus5;
    4'd6: debug_din = debug_bus6;
    4'd7: debug_din = debug_bus7;
    4'd8: debug_din = debug_bus8;
    default: debug_din = debug_bus0;
  endcase // casex(ipp_debug_sel)

  ipp_RegDff #(32) ipp_debug_RegDff(.din(debug_din[31:0]), .clk(clk),
				    .qout(ipp_debug[31:0]));

ipp_reg_r_12           reg_r_12_dfi_rpt           (
                                                   .di   (ipp_dfifo_rptr[11:0]),
                                                   .rs   (reset),
                                                   .ck   (clk),
                                                   .qo   (ipp_dfifo_rptr_d[11:0])
                                                  );
 
ipp_reg_w_sti_r_rac_16 reg_w_sti_r_rac_16_ecc_syn (
                                                   .di   (ipp_dfifo_dout1_ecc_syn[15:0]),
                                                   .wr   (wt_ecc_status),
                                                   .rs   (reset),
                                                   .rac  (rac_ecc_syndrome),
                                                   .ck   (clk),
                                                   .qo   (ipp_dfifo_dout1_ecc_syn_sti[15:0])
                                                  );

  assign n_ipp_ecc_corrupt_reg[31]    = wr_data[31];
  assign n_ipp_ecc_corrupt_reg[30:18] = 13'h0;
  assign n_ipp_ecc_corrupt_reg[17:16] = wr_data[17:16];
  assign n_ipp_ecc_corrupt_reg[15:11] = 5'h0;
  assign n_ipp_ecc_corrupt_reg[10]    = wr_data[10];
  assign n_ipp_ecc_corrupt_reg[9]     = 1'h0;
  assign n_ipp_ecc_corrupt_reg[8]     = wr_data[8];
  assign n_ipp_ecc_corrupt_reg[7:3]   = 5'h0;
  assign n_ipp_ecc_corrupt_reg[2:0]   = wr_data[2:0];

ipp_reg_w_r_32         reg_w_r_32_ecc_corrupt     (
                                                   .di   (n_ipp_ecc_corrupt_reg[31:0]),
                                                   .wr   (wt_ecc_corrupt_reg),
                                                   .rs   (reset),
                                                   .ck   (clk),
                                                   .qo   (ipp_ecc_corrupt_reg[31:0])
                                                  );

ipp_reg_w_sti_r_rac_12 reg_w_sti_r_rac_12_tag_rpt (
                                                   .di   (wt_dfifo_rptr ? wr_data[11:0] : ipp_dfifo_rptr_d[11:0]),
                                                   .wr   (wt_dfifo_rptr || dfifo_miss_tag),
                                                   .rs   (reset),
                                                   .rac  (rac_dfifo_rptr),
                                                   .ck   (clk),
                                                   .qo   (ipp_dfifo_rptr_sti[11:0])
                                                  );

ipp_reg_r_11           reg_r_11_ecc_rptr          (
                                                   .di   (ipp_dfifo_rptr1[10:0]),
                                                   .rs   (reset),
                                                   .ck   (clk),
                                                   .qo   (ipp_dfifo_rptr1_d[10:0])
                                                  );

ipp_reg_r_1            reg_r_1_ecc_no_err         (
                                                   .di   (ecc_no_error),
                                                   .rs   (reset),
                                                   .ck   (clk),
                                                   .qo   (ecc_no_error_d)
                                                  );

ipp_reg_r_1            reg_r_1_uncorr_error1_found(
                                                   .di   (uncorr_error1_found),
                                                   .rs   (reset),
                                                   .ck   (clk),
                                                   .qo   (uncorr_error1_found_d)
                                                  );

`ifdef NEPTUNE
wire      [3:0] do_nad;
wire      [3:0] do_nor;
wire      [3:0] do_inv;
wire      [3:0] do_mux;
wire      [3:0] do_q;
wire            so;

  nep_spare_ipp spare_ipp_0 (
                             .di_nd3     ({1'h1, 1'h1, do_q[3]}),
                             .di_nd2     ({1'h1, 1'h1, do_q[2]}),
                             .di_nd1     ({1'h1, 1'h1, do_q[1]}),
                             .di_nd0     ({1'h1, 1'h1, do_q[0]}),
                             .di_nr3     ({1'h0, 1'h0}),
                             .di_nr2     ({1'h0, 1'h0}),
                             .di_nr1     ({1'h0, 1'h0}),
                             .di_nr0     ({1'h0, 1'h0}),
                             .di_inv     (do_nad[3:0]),
                             .di_mx3     ({1'h0, 1'h0}),
                             .di_mx2     ({1'h0, 1'h0}),
                             .di_mx1     ({1'h0, 1'h0}),
                             .di_mx0     ({1'h0, 1'h0}),
                             .mx_sel     (do_nor[3:0]),
                             .di_reg     (do_inv[3:0]),
                             .wt_ena     (do_mux[3:0]),
                             .rst        ({reset,reset,reset,reset}),
                             .si         (1'h0),
                             .se         (1'h0),
                             .clk        (clk),
                             .do_nad     (do_nad[3:0]),
                             .do_nor     (do_nor[3:0]),
                             .do_inv     (do_inv[3:0]),
                             .do_mux     (do_mux[3:0]),
                             .do_q       (do_q[3:0]),
                             .so         (so)
                            );
`endif

endmodule

