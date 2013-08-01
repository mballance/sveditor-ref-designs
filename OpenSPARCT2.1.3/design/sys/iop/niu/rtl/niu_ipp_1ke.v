// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_1ke.v
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

    Project         : Niu

    File name       : niu_ipp_1ke.v

    Module(s) name  : niu_ipp_1ke
    Original:       : ipp.v main.70, label: IPP_VERIF_1.84

    Parent modules  : niu_ipp_top.v

    Child modules   : niu_ipp_load.v,           niu_ipp_slv.v,          niu_ipp_lib.v,
		      niu_ipp_hdr_fifo.v,       niu_ipp_dat_fifo_1ke.v, niu_ipp_sum_unit.v, 
		      niu_ipp_unload_ctl_1ke.v, niu_ipp_unload_dat.v,   niu_ipp_pkt_dsc.v, 
		      niu_ipp.h.

    Author's name   : Jonathan Shen, George Chu

    Date            : January. 2001

    Description     : Top level of single IPP.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/
/* top level of single ipp block*/

module niu_ipp_1ke (
`ifdef NEPTUNE
`else
                         tcu_aclk,
                         tcu_bclk,
                         tcu_scan_en,
                         tcu_se_scancollar_in,
                         tcu_se_scancollar_out,
                         tcu_array_wr_inhibit,
                         hdr_sram_rvalue,
                         hdr_sram_rid,
                         hdr_sram_wr_en,
                         hdr_sram_red_clr,
                         sram_hdr_read_data,
                         iol2clk,
                         l2clk_2x,

                         mbi_prebuf_header_wdata,
                         mbi_prebuf_header_rd_addr,
                         mbi_prebuf_header_wr_addr,
                         mbi_prebuf_header_wr_en,
                         mbi_prebuf_header_rd_en,
                         mbi_prebuf_header_run,
                         mbi_prebuf_header_scan_in,
                         mbi_prebuf_header_scan_out,
                         mbi_prebuf_header_data_out,

                         mbi_rx_data_fifo_wdata,
                         mbi_rx_data_fifo_rd_addr,
                         mbi_rx_data_fifo_wr_addr,
                         mbi_rx_data_fifo_wr_en,
                         mbi_rx_data_fifo_rd_en,
                         mbi_rx_data_fifo_run,
                         mbi_rx_data_fifo_scan_in,
                         mbi_rx_data_fifo_scan_out,
                         mbi_rx_data_fifo_data_out,
`endif

// mac(xmac) interface
	    mac_ipp_req, 
	    xmac_ipp_ack, 
	    mac_ipp_tag, 
	    mac_ipp_data, 
	    mac_ipp_ctrl,
	    mac_ipp_stat, 
	    ipp_mac_ack, 
	    ipp_xmac_req,

// ffl interface
	    ffl_ipp_dvalid, 
	    ffl_ipp_data, 
	    ffl_ipp_ready,
	    ipp_ffl_dvalid,
	    ipp_ffl_data, 
	    ipp_ffl_mac_default,

// dmc interface
            dmc_ipp_dat_req,
            ipp_dmc_dat_ack,
            ipp_dmc_data, 
            ipp_dmc_ful_pkt,
            ipp_dmc_dat_err,

// ffl_arb interface
	    ipp_ffl_req,
	    ffl_arb_ack,

// cpu (ht) interface
	    ipp_pio_sel,
	    ipp_pio_addr,
	    ipp_pio_rd,
	    ipp_pio_wdata,
	    ipp_pio_ack,
	    ipp_pio_rdata,
	    ipp_pio_err,
	    ipp_pio_intr,
	    ipp_debug,
	    debug_out_ena,

// global
	    xmac_mode,
	    port_id,
	    clk, 
	    reset
	    );		// end of pin definition

`ifdef NEPTUNE
`else
input                          tcu_aclk;
input                          tcu_bclk;
input                          tcu_scan_en;
input                          tcu_se_scancollar_in;
input                          tcu_se_scancollar_out;
input                          tcu_array_wr_inhibit;

input                    [6:0] hdr_sram_rvalue;
input                    [2:0] hdr_sram_rid;
input                          hdr_sram_wr_en;
input                          hdr_sram_red_clr;
output                   [6:0] sram_hdr_read_data;

input                          iol2clk;
input                          l2clk_2x;

input                    [7:0] mbi_prebuf_header_wdata;
input                    [5:0] mbi_prebuf_header_rd_addr;
input                    [5:0] mbi_prebuf_header_wr_addr;
input                          mbi_prebuf_header_wr_en;
input                          mbi_prebuf_header_rd_en;
input                          mbi_prebuf_header_run;
input                          mbi_prebuf_header_scan_in;
output                         mbi_prebuf_header_scan_out;
output                 [145:0] mbi_prebuf_header_data_out;

input                    [7:0] mbi_rx_data_fifo_wdata;
input                    [9:0] mbi_rx_data_fifo_rd_addr;
input                    [9:0] mbi_rx_data_fifo_wr_addr;
input                          mbi_rx_data_fifo_wr_en;
input                          mbi_rx_data_fifo_rd_en;
input                          mbi_rx_data_fifo_run;
input                          mbi_rx_data_fifo_scan_in;
output                         mbi_rx_data_fifo_scan_out;
output                 [145:0] mbi_rx_data_fifo_data_out;
`endif

// input from mac
input		mac_ipp_req;		// bmac sends the request to ipp
input		xmac_ipp_ack;		// xmac sends the ack to ipp
input		mac_ipp_tag;		// mac identifies the last part packet
input 	[63:0]	mac_ipp_data;		// mac writing the data to ipp
input		mac_ipp_ctrl;		// active high for control information
input 	[22:0]	mac_ipp_stat;		// mac writing the status to ipp

// input from ffl
input		ffl_ipp_ready;		// ffl ready to take header
input      	ffl_ipp_dvalid;         // which port's parsed data is valid
input 	[13:0] 	ffl_ipp_data;           // parsed packet header information

// input from dmc
input           dmc_ipp_dat_req;        // dmc request data from ipp_data_fifo

// input from ffl_arb
input		ffl_arb_ack;

// input from cpu (ht)
input           ipp_pio_sel;         	// behaves like req
`ifdef NEPTUNE
input   [13:0]  ipp_pio_addr;           // addr for slave
`else
input   [14:0]  ipp_pio_addr;           // addr for slave
`endif
input           ipp_pio_rd;             // 1: rd; 0: wr.
input   [31:0]  ipp_pio_wdata;          // wr data bus

// input grobal
input		xmac_mode;
input	[1:0]  	port_id;
input		clk;
input		reset;

// output to mac
output		ipp_mac_ack;		// ack from ipp to bmac
output		ipp_xmac_req;		// req(as rdy) from ipp to xmac

// output to ffl
output		ipp_ffl_dvalid;		// valid data from ipp to ffl
output 	[127:0] ipp_ffl_data;           // ipp sends a packet's header data
output 	[11:0]	ipp_ffl_mac_default;	// default value of mac addr table

// output to dmc 
output          ipp_dmc_dat_ack;
output  [129:0] ipp_dmc_data; 
output          ipp_dmc_ful_pkt;
output          ipp_dmc_dat_err;

// output to ffl_arb
output          ipp_ffl_req;         	// packet header data is valid

// output to pio
output          ipp_pio_ack;            // ack from nrx
output  [31:0]  ipp_pio_rdata;          // rd data bus
output		ipp_pio_err;
output		ipp_pio_intr;
output	[31:0]	ipp_debug;
output		debug_out_ena;

/*****************************************************************************/
wire            ipp_dmc_dat_ack;
wire    [129:0] ipp_dmc_data; 
wire            ipp_dmc_ful_pkt;
wire            ipp_dmc_dat_err; 

// from slave
wire		reset2;
wire	[31:0]	ipp_debug;
wire	[24:0]	config_reg;
wire            ipp_ecc_corrupt_sop;
wire            ipp_ecc_corrupt_2nd;
wire            ipp_ecc_corrupt_eop;
wire            ipp_ecc_corrupt_sing;
wire            ipp_ecc_corrupt_doub;
wire            ipp_ecc_corrupt_no_uncor;
wire            ecc_pkt_corrupted_clr;
wire		ipp_enable 		 = config_reg[0];
wire            debug_out_ena            = config_reg[1];
wire            dfifo_ecc_correct_en     = config_reg[2];
wire            ipp_hfifo_par_err_inc_en = config_reg[3];
wire            pio_cksum_ena            = config_reg[4];
wire            datfifo_pio_wr_ena       = config_reg[5];
wire		ippfifo_rd_wr_ptr_bypass = config_reg[6];	// to ipp_load
wire		bypass_ffl 		 = config_reg[7];
wire    [16:0]  ipp_max_bytes            = config_reg[24:8];
wire            pio_full_cksum           = 1'h0;                // geo: pio directly selects, No need

wire		xmac_mode; 		 //1: xmac, 0: big mac;

wire		ippfifo_rd_ptr_pio_wr_en;	// from slave to ipp_load
wire		ippfifo_wr_ptr_pio_wr_en;	// from slave to ipp_load

wire            dfifo_wt_data_reg_wr_en_pls;
wire            dfifo_rd_ptr_pio_wr_en;
wire            dfifo_wt_ptr_pio_wr_en;

wire		mac_ipp_req;			// from ipp to ipp_slv
wire		xmac_ipp_ack;			// from ipp to ipp_slv
wire		mac_ipp_tag;			// from ipp to ipp_slv
wire	[63:0]  mac_ipp_data;			// from ipp to ipp_slv
wire		mac_ipp_ctrl;			// from ipp to ipp_slv
wire	[22:0]  mac_ipp_stat;			// from ipp to ipp_slv
wire		ipp_mac_ack;			// from ipp to ipp_slv
wire		ipp_xmac_req;			// from ipp to ipp_slv

wire	[129:0]	fifo_wr_data_reg;
wire		fifo_wr_data_reg_wr_en_pls;

wire		vec_cycle1_wr_en;  // geo: this is for pio programming fflp_ipp_sum

wire            rst_ipp_en;
wire            wr_ipp_en_bit0;

// from state machine
wire	[2:0]	phase_state_xmac;
wire	[2:0]	phase_state;
wire		phase_state_1st_data;
wire	[3:0]	mac_ack_fsm_curstate;
wire	[1:0]	ipp_ffl_curstate;
wire	[1:0]	tag_fsm_curstate;
wire	[1:0]	ipp_en_rst_fsm_curstate;

wire	[31:0]	ipp_pio_rdata;
// end of slave module

// from ipp_pkt_dsc
wire            ipp_dsc_pkt;
wire            ipp_inc_pkt_dsc_cnt;

// from sum_unit
wire           sum_prt_started;
wire           sum_prt_valid;
wire           sum_prt_fail;
wire    [15:0] sum_prt_cksum;
wire    [15:0] sum_prt_length;
wire    [31:0] sum_prt_state;

// from ipp_load
wire		ipp_hfifo_wten;
wire	[6:0]	ipp_hfifo_wptr;
wire            ipp_hfifo_rden;
wire	[5:0]	ipp_hfifo_rptr;
wire		ipp_hfifo_dat_empty;
wire		ipp_hfifo_over_run_r;
wire		ipp_hfifo_under_run_r;
wire	[1:0]	port_id;
wire		ipp_ffl_dvalid_n;
wire		runt;
wire	[6:0]	cur_pkt_hdr_base_ptr;
wire   [13:0]   cur_pkt_ffl_sum_info;

// from ipp_hdr_fifo
wire    [145:0] ipp_hfifo_dout;
wire            ipp_hfifo_par_err;
wire      [5:0] ipp_hfifo_par_addr;
wire            ipp_hfifo_par_err_inc = ipp_hfifo_par_err && ipp_hfifo_par_err_inc_en;

// from ipp_unload_ctl
wire	[129:0]	ipp_hfifo_dinp;
wire            inc_hfifo_dat_rptr;
wire            inc_hfifo_dat_rptr_d;
wire      [6:0] ipp_hfifo_dat_rptr;
wire      [1:0] ipp_hfifo_dat_tag_rd;
wire     [10:0] ipp_dfifo_wptr;          // addr[9:0] of 16k-byte data, 1k entries, + 1_wrap
wire            ipp_dfifo_wten;
wire            ipp_dfifo_wten_2nd;
wire            ipp_dfifo_rden;
wire     [10:0] ipp_dfifo_rptr;          // addr[9:0] of 16k-byte data, 1k entries, + 1_wrap
wire            ipp_dfifo_full;
wire            wt_dfifo_1st_wd;
wire     [11:0] addr_status;
wire            ipp_full_cksum;
wire            ipp_start_tcp;
wire            ipp_sum_info_vld;
wire            req_rd_dfifo_eop; // geo: may NOT need
wire            req_rd_dfifo_sop; // geo: may NOT need
wire      [1:0] ipp_la2_opti;
wire      [1:0] ipp_la3_vers;
wire      [3:0] ip4_hdr_leng;
wire      [1:0] ipp_la4_prot;
wire            clr_ipp_unload;
wire            fwd_posting_dn = clr_ipp_unload;
wire            n_ipp_unload_idle;
wire            fet_pio_tcp_ena;
wire            dfifo_miss_eop;
wire            dfifo_miss_sop;
wire      [4:0] c_unload_st;

// from ipp_unload_dat
wire    [129:0] ipp_dfifo_dinp; 
wire            sum_prt_fail_act = sum_prt_fail && ipp_full_cksum && fet_pio_tcp_ena;

// from ipp_dat_fifo
wire      [1:0] ipp_dfifo_dout0_tag; 
wire    [129:0] ipp_dfifo_dout1;
wire     [31:0] ipp_dfifo_dout1_ecc;
wire     [15:0] ipp_dfifo_dout1_ecc_syn;
wire            ipp_dmc_dat_err1;
wire            ecc_pkt_corrupted;

// from ipp_slv
wire	[1:0]	rd_eop;			//10: eop, data; 11: stat, eop
wire	[1:0]	rd_stat;		//01: null, stat; 11: stat, eop

wire	[145:0] fifo_data_out = inc_hfifo_dat_rptr_d ? ipp_hfifo_dout[145:0] : 146'h0; // geo

wire		rd_abort_occ = (rd_stat[1:0] == 2'b01) ? 
			        fifo_data_out[15] :
			      ((rd_stat[1:0] == 2'b11) ? 
			        fifo_data_out[79] : 1'b0);

wire		rd_abort;
ipp_RSFF RSFF_abortOc (.reset(reset), .clk(clk), .set(rd_abort_occ),
		       .rst(fwd_posting_dn), .Q(rd_abort));

wire		bad_crc_occ = (rd_stat[1:0] == 2'b01) ? 
			       fifo_data_out[14] :
			     ((rd_stat[1:0] == 2'b11) ? 
			       fifo_data_out[78] : 1'b0); 

wire		bad_crc;
ipp_RSFF RSFF_bad_crcOc (.reset(reset), .clk(clk), .set(bad_crc_occ),
                         .rst(fwd_posting_dn), .Q(bad_crc));

wire		drop_bad_crc =                   bad_crc;

// for fifo_data_out
reg	[145:0]	fifo_data_out_reg;	// for ipp_slv

always @(posedge clk)
  if (reset)
    fifo_data_out_reg[145:0] <= 146'h0;
  else
//g:fifo_data_out_reg[145:0] <= fifo_data_out[145:0];
    fifo_data_out_reg[145:0] <= ipp_hfifo_dout[145:0];

/***** ipp_ffl hand-shaking *****/
wire    [127:0] ipp_ffl_data      = ipp_hfifo_dout[127:0];
wire  		eop_from_hdr_fifo = ipp_hfifo_dout[129];

//****** Phase Monitor at IPP fifo data out point ******
// Generating rd_eop, rd_status
wire /* geo */  fifo_rd_en_reg = inc_hfifo_dat_rptr_d; // 1 cycle delay of fifo_rd_en; no rd advance

wire    [1:0]   ipp_fifo_rd_tag;
assign		ipp_fifo_rd_tag[1:0] = {fifo_rd_en_reg & fifo_data_out[129],
				   	fifo_rd_en_reg & fifo_data_out[128]};

/******************************* Instantiation *******************************/

// geo: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ NIU ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//VCS coverage off
// synopsys translate_off
// from fflp_driver
wire            dmc_sum_prt_fail;
wire     [15:0] dmc_sum_prt_cksum;
wire     [31:0] dmc_sum_prt_state;
wire            dmc_sum_prt_valid;

niu_ipp_dmc_checker ipp_dmc_checker_0 (
                .ipp_dmc_data        (ipp_dmc_data[129:0]),
                .ipp_dmc_dat_ack     (ipp_dmc_dat_ack),
                .ipp_dmc_ful_pkt     (ipp_dmc_ful_pkt),
                .reset               (reset),
                .clk                 (clk),
                .dmc_ipp_dat_req     (),
                .dmc_sum_prt_fail    (dmc_sum_prt_fail),
                .dmc_sum_prt_cksum   (dmc_sum_prt_cksum[15:0]),
                .dmc_sum_prt_state   (dmc_sum_prt_state[31:0]), 
                .dmc_sum_prt_valid   (dmc_sum_prt_valid));
// synopsys translate_on
//VCS coverage on

// ---------------------------------------------------------------------------
niu_ipp_pkt_dsc ipp_pkt_dsc_0 (
                               .ipp_hfifo_par_err_inc (ipp_hfifo_par_err_inc),
                               .ipp_runt            (runt),
                               .clr_ipp_unload      (clr_ipp_unload),
                               .reset               (reset),
                               .clk                 (clk),
                               .ipp_dsc_pkt         (ipp_dsc_pkt),
                               .ipp_inc_pkt_dsc_cnt (ipp_inc_pkt_dsc_cnt)
                              );

reg             ipp_sum_info_vld_d;
reg             ipp_start_tcp_d;
reg             ipp_hfifo_dat_tag_rd1_d;

always @(posedge clk)
  if (reset) begin
    ipp_sum_info_vld_d      <= 1'h0;
    ipp_start_tcp_d         <= 1'h0;
    ipp_hfifo_dat_tag_rd1_d <= 1'h0;
  end
  else begin
    ipp_sum_info_vld_d      <= ipp_sum_info_vld;
    ipp_start_tcp_d         <= ipp_start_tcp;
    ipp_hfifo_dat_tag_rd1_d <= ipp_hfifo_dat_tag_rd[1];
  end

niu_ipp_sum_unit sum_unit_0 (
                     .ipp_din_dat      (fifo_data_out_reg[127:0]),
                     .port_num         (1'h1 /* geo */),
                     .ipp_full_cksum   (1'h1 /* rxc */),
                     .ipp_la4_prot     (ipp_la4_prot[1:0]),
                     .ipp_la3_vers     (ipp_la3_vers[1:0]),
                     .ipp_la2_opti     (ipp_la2_opti[1:0]),
                     .ip4_hdr_leng     (ip4_hdr_leng[3:0]),
                     .ipp_info_valid   (ipp_sum_info_vld_d),
                     .ipp_start_tcp    (ipp_start_tcp_d),
                     .ipp_pkt_end      (ipp_hfifo_dat_tag_rd1_d),
                     .ipp_max_bytes    (ipp_max_bytes[16:0]),
                     .reset            (reset2),
                     .clk              (clk),
                     .sum_prt_started  (sum_prt_started),
                     .sum_prt_valid    (sum_prt_valid),
                     .sum_prt_fail     (sum_prt_fail),
                     .sum_prt_cksum    (sum_prt_cksum[15:0]),
                     .sum_prt_length   (sum_prt_length[15:0]),
                     .sum_prt_state    (sum_prt_state[31:0]) 
                    );
/* Zin memacc
   -read_addr           ipp_hfifo_dat_rptr[5:0]
   -read                inc_hfifo_dat_rptr_d
   -write_addr          ipp_hfifo_wptr[5:0]
   -write               ipp_hfifo_wten
   -single_access
   -read_data           ipp_hfifo_dout
   -write_data          ipp_hfifo_dinp
   -latency             1
   -message "test ipp_ffl_hdr_fifo_146x64 FIFO"
*/

`ifdef NEPTUNE
`else 
wire                     [6:0] sram_hdr_read_data;
wire                           mbi_prebuf_header_scan_out;
wire                           mbi_rx_data_fifo_scan_out;
wire                   [145:0] mbi_prebuf_header_data_out = ipp_hfifo_dout[145:0];
wire                   [145:0] mbi_rx_data_fifo_data_out;
wire [145:0] mbi_prebuf_header_wdata_146 = {mbi_prebuf_header_wdata[1:0],{18{mbi_prebuf_header_wdata}}};
wire [145:0] mbi_rx_data_fifo_wdata_146  = {mbi_rx_data_fifo_wdata[1:0], {18{mbi_rx_data_fifo_wdata}}};
`endif

niu_ipp_hdr_fifo ipp_hdr_fifo_0 (
`ifdef NEPTUNE
`else
                                         .iol2clk                 (iol2clk),
                                         .tcu_aclk                (tcu_aclk),
                                         .tcu_bclk                (tcu_bclk),
                                         .tcu_se_scancollar_in    (tcu_se_scancollar_in),
                                         .tcu_array_wr_inhibit    (tcu_array_wr_inhibit),
                                         .scan_in                 (mbi_prebuf_header_scan_in),
                                         .scan_out                (mbi_prebuf_header_scan_out),
                                         .mbi_wdata               (mbi_prebuf_header_wdata_146),
                                         .mbi_rd_adr              (mbi_prebuf_header_rd_addr),
                                         .mbi_wr_adr              (mbi_prebuf_header_wr_addr),
                                         .mbi_wr_en               (mbi_prebuf_header_wr_en),
                                         .mbi_rd_en               (mbi_prebuf_header_rd_en),
                                         .mbi_run                 (mbi_prebuf_header_run),
`endif
                                         .ipp_hfifo_rden          (ipp_hfifo_rden),
                                         .ipp_hfifo_rptr          (ipp_hfifo_rptr[5:0]),
                                         .ipp_hfifo_wptr          (ipp_hfifo_wptr[5:0]),
                                         .ipp_hfifo_wten          (ipp_hfifo_wten),
                                         .ipp_hfifo_dinp          (ipp_hfifo_dinp[129:0]),
                                         .inc_hfifo_dat_rptr_d    (inc_hfifo_dat_rptr_d),
                                         .ipp_ffl_dvalid_n        (ipp_ffl_dvalid_n),
                                         .clr_ipp_hfifo_par_err   (clr_ipp_unload),
                                         .reset                   (reset),
                                         .clk                     (clk),
                                         .ipp_hfifo_dout          (ipp_hfifo_dout[145:0]),
                                         .ipp_hfifo_par_err       (ipp_hfifo_par_err),
                                         .ipp_hfifo_par_addr      (ipp_hfifo_par_addr[5:0])
                                        );

niu_ipp_load	ipp_load(
// input signals
		.clk(clk),
		.reset(reset2),
		.mac_ipp_req(mac_ipp_req),
		.xmac_ipp_ack(xmac_ipp_ack),
		.mac_ipp_data(mac_ipp_data),
		.mac_ipp_tag(mac_ipp_tag),
		.mac_ipp_ctrl(mac_ipp_ctrl),
		.mac_ipp_stat(mac_ipp_stat),
		.ffl_ipp_ready(ffl_ipp_ready),
		.ffl_ipp_dvalid(ffl_ipp_dvalid),
		.fflp_ipp_sum        (ffl_ipp_data[13:0]),
		.ffl_arb_ack(ffl_arb_ack),
		.port_id(port_id),
		.ippfifo_rd_wr_ptr_bypass(ippfifo_rd_wr_ptr_bypass),
		.ippfifo_wr_ptr_pio_wr_en(ippfifo_wr_ptr_pio_wr_en),
		.eop_from_hdr_fifo(eop_from_hdr_fifo),
		.pio_wr_data         (ipp_pio_wdata[13:0]),
		.fifo_wr_data_reg(fifo_wr_data_reg),
		.fifo_wr_data_reg_wr_en_pls(fifo_wr_data_reg_wr_en_pls),
		.ipp_enable(ipp_enable),
		.xmac_mode(xmac_mode),
		.bypass_ffl          (bypass_ffl),
		.vec_cycle1_wr_en    (vec_cycle1_wr_en),
		.inc_hfifo_dat_rptr  (inc_hfifo_dat_rptr),
		.ipp_hfifo_dat_rptr  (ipp_hfifo_dat_rptr[6:0]),
		.n_ipp_unload_idle   (n_ipp_unload_idle),
		.clr_ipp_unload      (clr_ipp_unload),
// output signals
		.ipp_mac_ack(ipp_mac_ack),
		.ipp_xmac_req(ipp_xmac_req),
		.ipp_ffl_dvalid(ipp_ffl_dvalid),
		.ipp_ffl_dvalid_n(ipp_ffl_dvalid_n),
		.runt(runt),
		.ipp_ffl_mac_default(ipp_ffl_mac_default),
		.ipp_ffl_req(ipp_ffl_req),
		.fifo_wr_en            (ipp_hfifo_wten),
		.fifo_wr_ptr           (ipp_hfifo_wptr[6:0]),
                .ipp_hfifo_rden        (ipp_hfifo_rden),
		.ipp_hfifo_rptr        (ipp_hfifo_rptr[5:0]),
		.ipp_hfifo_dat_empty   (ipp_hfifo_dat_empty),
		.fifo_data_in          (ipp_hfifo_dinp[129:0]),
		.ipp_hfifo_over_run_r  (ipp_hfifo_over_run_r),
		.ipp_hfifo_under_run_r (ipp_hfifo_under_run_r),
		.phase_state_xmac(phase_state_xmac),
		.phase_state(phase_state),
		.phase_state_1st_data(phase_state_1st_data),
		.mac_ack_fsm_curstate(mac_ack_fsm_curstate),
		.ipp_ffl_curstate(ipp_ffl_curstate),
		.cur_pkt_hdr_base_ptr  (cur_pkt_hdr_base_ptr[6:0]), 
		.cur_pkt_ffl_sum_info  (cur_pkt_ffl_sum_info[13:0]) 
       		);			// end of ipp_load

niu_ipp_unload_ctl_1ke ipp_unload_ctl_1ke_0 (
                                             .ipp_ffl_dvalid_n      (ipp_ffl_dvalid_n),
                                             .cur_pkt_hdr_base_ptr  (cur_pkt_hdr_base_ptr[6:0]),
                                             .cur_pkt_ffl_sum_info  (cur_pkt_ffl_sum_info[9:0]),
                                             .ipp_hfifo_dat_tag     (ipp_hfifo_dout[129:128]),
                                             .ipp_hfifo_dat_empty   (ipp_hfifo_dat_empty),
                                             .ipp_dfifo_dout_tag    (ipp_dfifo_dout0_tag[1:0]),
                                             .ipp_dmc_dat_err1      (ipp_dmc_dat_err1),
                                             .sum_prt_valid         (sum_prt_valid),
                                             .dmc_ipp_dat_req       (dmc_ipp_dat_req),
                                             .pio_cksum_ena         (pio_cksum_ena),  
                                             .pio_full_cksum        (pio_full_cksum),
                                             .ipp_enable                   (ipp_enable),
                                             .ippfifo_rd_wr_ptr_bypass     (ippfifo_rd_wr_ptr_bypass),
                                             .ippfifo_rd_ptr_pio_wr_en     (ippfifo_rd_ptr_pio_wr_en),
                                             .datfifo_pio_wr_ena           (datfifo_pio_wr_ena),
                                             .dfifo_rd_ptr_pio_wr_en       (dfifo_rd_ptr_pio_wr_en),
                                             .dfifo_wt_ptr_pio_wr_en       (dfifo_wt_ptr_pio_wr_en),
                                             .dfifo_wt_data_reg_wr_en_pls  (dfifo_wt_data_reg_wr_en_pls),
                                             .ipp_pio_wdata         (ipp_pio_wdata[10:0]),
                                             .reset                 (reset2),
                                             .clk                   (clk),
                                             .inc_hfifo_dat_rptr    (inc_hfifo_dat_rptr),
                                             .inc_hfifo_dat_rptr_d  (inc_hfifo_dat_rptr_d),
                                             .ipp_hfifo_dat_rptr    (ipp_hfifo_dat_rptr[6:0]),
                                             .ipp_hfifo_dat_tag_rd  (ipp_hfifo_dat_tag_rd[1:0]),
                                             .ipp_dfifo_wptr        (ipp_dfifo_wptr[10:0]), 
                                             .ipp_dfifo_wten        (ipp_dfifo_wten),
                                             .ipp_dfifo_wten_2nd    (ipp_dfifo_wten_2nd),
                                             .ipp_dfifo_rden        (ipp_dfifo_rden),
                                             .ipp_dfifo_rptr        (ipp_dfifo_rptr[10:0]), 
                                             .ipp_dfifo_full        (ipp_dfifo_full),
                                             .wt_dfifo_1st_wd       (wt_dfifo_1st_wd),
                                             .addr_status           (addr_status[11:0]),
                                             .ipp_dmc_dat_ack       (ipp_dmc_dat_ack),
                                             .ipp_dmc_ful_pkt       (ipp_dmc_ful_pkt),
                                             .ipp_full_cksum        (ipp_full_cksum),
                                             .ipp_start_tcp         (ipp_start_tcp),
                                             .ipp_sum_info_vld      (ipp_sum_info_vld),
                                             .req_rd_dfifo_eop      (req_rd_dfifo_eop),
                                             .req_rd_dfifo_sop      (req_rd_dfifo_sop),
                                             .ipp_la2_opti          (ipp_la2_opti[1:0]),
                                             .ipp_la3_vers          (ipp_la3_vers[1:0]),
                                             .ip4_hdr_leng          (ip4_hdr_leng[3:0]),
                                             .ipp_la4_prot          (ipp_la4_prot[1:0]),
                                             .clr_ipp_unload        (clr_ipp_unload),
                                             .n_ipp_unload_idle     (n_ipp_unload_idle),
                                             .fet_pio_tcp_ena       (fet_pio_tcp_ena),
                                             .dfifo_miss_eop        (dfifo_miss_eop),
                                             .dfifo_miss_sop        (dfifo_miss_sop),
                                             .c_unload_st           (c_unload_st[4:0]) 
                                            );

niu_ipp_unload_dat ipp_unload_dat_0 (
                                     .ipp_hfifo_dat_dout            (ipp_hfifo_dout[129:0]),
                                     .inc_hfifo_dat_rptr_d          (inc_hfifo_dat_rptr_d),
                                     .ipp_hfifo_dat_tag_rd          (rd_stat /* geo: ipp_hfifo_dat_tag_rd[1:0] */),
                                     .wt_dfifo_1st_wd               (wt_dfifo_1st_wd),
                                     .cur_pkt_ffl_sum_info          (cur_pkt_ffl_sum_info[13:0]),
                                     .ipp_dsc_pkt                   (ipp_dsc_pkt),
                                     .mac_drop_bad_crc              (1'h0 /* geo: drop_bad_crc */),
                                     .status_rd_abort               (rd_abort),
                                     .ipp_hfifo_over_run_r          (1'h0 /* geo: ipp_hfifo_over_run_r  */),
                                     .ipp_hfifo_under_run_r         (1'h0 /* geo: ipp_hfifo_under_run_r */),
                                     .ipp_hfifo_par_err             (1'h0 /* geo: ipp_hfifo_par_err     */),
                                     .fet_pio_tcp_ena               (fet_pio_tcp_ena),
                                     .ipp_full_cksum                (ipp_full_cksum),
                                     .sum_prt_cksum                 (sum_prt_cksum[15:0]),
                                     .sum_prt_length                (sum_prt_length[15:0]),
                                     .sum_prt_fail                  (sum_prt_fail_act),
`ifdef NEPTUNE                       .addr_status                   (12'h0 /* geo: addr_status[11:0] */),
`else                                .addr_status                   (addr_status[11:0]),
`endif
                                     .datfifo_pio_wr_ena            (datfifo_pio_wr_ena),
                                     .dfifo_wt_data_reg             (fifo_wr_data_reg[129:0]),
                                     .clr_ipp_unload                (clr_ipp_unload),
                                     .reset                         (reset),
                                     .clk                           (clk),
                                     .ipp_dfifo_dinp                (ipp_dfifo_dinp[129:0]) 
                                    );

niu_ipp_dat_fifo_1ke ipp_dat_fifo_1ke_0 (
`ifdef NEPTUNE
`else                                    .tcu_aclk                (tcu_aclk),
                                         .tcu_bclk                (tcu_bclk),
                                         .tcu_scan_en             (tcu_scan_en),
                                         .tcu_se_scancollar_in    (tcu_se_scancollar_in),
                                         .tcu_se_scancollar_out   (tcu_se_scancollar_out),
                                         .tcu_array_wr_inhibit    (tcu_array_wr_inhibit),
                                         .scan_in                 (mbi_rx_data_fifo_scan_in),
                                         .scan_out                (mbi_rx_data_fifo_scan_out),
                                         .hdr_sram_rvalue         (hdr_sram_rvalue[6:0]),
                                         .hdr_sram_rid            (hdr_sram_rid[2:0]),
                                         .hdr_sram_wr_en          (hdr_sram_wr_en),
                                         .hdr_sram_red_clr        (hdr_sram_red_clr),
                                         .sram_hdr_read_data      (sram_hdr_read_data[6:0]),
                                         .iol2clk                 (iol2clk),
                                         .l2clk_2x                (l2clk_2x),
                                         .mbi_wdata               (mbi_rx_data_fifo_wdata_146),
                                         .mbi_rd_adr              (mbi_rx_data_fifo_rd_addr),
                                         .mbi_wr_adr              (mbi_rx_data_fifo_wr_addr),
                                         .mbi_wr_en               (mbi_rx_data_fifo_wr_en),
                                         .mbi_rd_en               (mbi_rx_data_fifo_rd_en),
                                         .mbi_run                 (mbi_rx_data_fifo_run),
                                         .mbi_rx_data_fifo_data_out (mbi_rx_data_fifo_data_out),
`endif
                                         .ipp_dfifo_rden          (ipp_dfifo_rden),
                                         .ipp_dfifo_rptr          (ipp_dfifo_rptr[9:0]),
                                         .ipp_dfifo_wptr          (ipp_dfifo_wptr[9:0]), 
                                         .ipp_dfifo_wten          (ipp_dfifo_wten),
                                         .ipp_dfifo_wten_2nd      (ipp_dfifo_wten_2nd),
                                         .ipp_dfifo_dinp          (ipp_dfifo_dinp[129:0]),
                                         .ipp_ecc_corrupt_sop     (ipp_ecc_corrupt_sop),
                                         .ipp_ecc_corrupt_2nd     (ipp_ecc_corrupt_2nd),
                                         .ipp_ecc_corrupt_eop     (ipp_ecc_corrupt_eop),
                                         .ipp_ecc_corrupt_sing    (ipp_ecc_corrupt_sing),
                                         .ipp_ecc_corrupt_doub    (ipp_ecc_corrupt_doub),
                                         .ipp_ecc_corrupt_no_uncor(ipp_ecc_corrupt_no_uncor),
                                         .dfifo_ecc_correct_en    (dfifo_ecc_correct_en),
                                         .ecc_pkt_corrupted_clr   (ecc_pkt_corrupted_clr),
                                         .reset                   (reset),
                                         .clk                     (clk),
                                         .ipp_dfifo_dout          (ipp_dmc_data[129:0]),
                                         .ipp_dfifo_dout0_tag     (ipp_dfifo_dout0_tag[1:0]),
                                         .ipp_dmc_dat_err         (ipp_dmc_dat_err),
                                         .ipp_dmc_dat_err1        (ipp_dmc_dat_err1),
                                         .ipp_dfifo_dout1         (ipp_dfifo_dout1[129:0]),
                                         .ipp_dfifo_dout1_ecc     (ipp_dfifo_dout1_ecc[31:0]),
                                         .ipp_dfifo_dout1_ecc_syn (ipp_dfifo_dout1_ecc_syn[15:0]),
                                         .ecc_pkt_corrupted       (ecc_pkt_corrupted)
                                        );

niu_ipp_slv     ipp_slv (
// input signals
		.fifo_data_out_reg    (fifo_data_out_reg[145:0]),
		.inc_pkt_disc_cntr    (ipp_inc_pkt_dsc_cnt),
		.sum_prt_fail         (sum_prt_fail),
		.sum_prt_valid        (sum_prt_valid),
		.fifo_over_run        (ipp_hfifo_over_run_r),
		.fifo_under_run       (ipp_hfifo_under_run_r),
		.par_err              (ipp_hfifo_par_err),
		.ipp_hfifo_par_addr   (ipp_hfifo_par_addr[5:0]),
		.fwd_vec_cycle1       (cur_pkt_ffl_sum_info[13:0]),
		.fifo_rd_ptr          (ipp_hfifo_dat_rptr[5:0]),
		.fifo_wr_ptr          (ipp_hfifo_wptr[6:0]),
                .ipp_dfifo_rptr       ({1'h0,ipp_dfifo_rptr[10:0]}),
                .ipp_dfifo_wptr       ({1'h0,ipp_dfifo_wptr[10:0]}),
                .ipp_dfifo_dout1      (ipp_dfifo_dout1[129:0]),
                .ipp_dfifo_dout1_ecc  (ipp_dfifo_dout1_ecc[18:0]),
                .ipp_dfifo_dout1_ecc_syn (ipp_dfifo_dout1_ecc_syn[15:0]),
                .dfifo_miss_eop          (dfifo_miss_eop),
                .dfifo_miss_sop          (dfifo_miss_sop),
                .ecc_pkt_corrupted       (ecc_pkt_corrupted),
		.rst_ipp_en(rst_ipp_en),
		.state_mach0({1'b0, phase_state[2:0]}),
		.state_mach1({mac_ack_fsm_curstate[3:0]}),
		.state_mach2({2'b0, ipp_ffl_curstate[1:0]}),
		.state_mach3          (c_unload_st[3:0]),
		.state_mach4          ({3'h0,c_unload_st[4]}),
		.state_mach5          ({phase_state_1st_data,phase_state_xmac[2:0]}),
		.state_mach6({2'b0, tag_fsm_curstate[1:0]}),
		.state_mach7({2'b0, ipp_en_rst_fsm_curstate[1:0]}),
		.state_mach8          (sum_prt_state[03:00]),
		.state_mach9          (sum_prt_state[07:04]),
		.state_mach10         (sum_prt_state[11:08]),
		.state_mach11         (sum_prt_state[15:12]),
		.state_mach12         (sum_prt_state[19:16]),
		.state_mach13         (sum_prt_state[23:20]),
		.state_mach14         (sum_prt_state[27:24]),
		.state_mach15         (sum_prt_state[31:28]),
		.mac_ipp_req(mac_ipp_req),
		.xmac_ipp_ack(xmac_ipp_ack),
		.mac_ipp_tag(mac_ipp_tag),
		.mac_ipp_data(mac_ipp_data),
		.mac_ipp_ctrl(mac_ipp_ctrl),
		.mac_ipp_stat(mac_ipp_stat),
		.ipp_mac_ack(ipp_mac_ack),
		.ipp_xmac_req(ipp_xmac_req),
		.ffl_ipp_data         (ffl_ipp_data[13:0]),
		.ffl_ipp_dvalid       (ffl_ipp_dvalid),
		.ffl_ipp_ready        (ffl_ipp_ready),
		.ipp_ffl_mac_default  (ipp_ffl_mac_default[11:0]),
		.ipp_ffl_dvalid       (ipp_ffl_dvalid),
		.ffl_arb_ack          (ffl_arb_ack),
		.ipp_ffl_req          (ipp_ffl_req),
		.ipp_pio_sel(ipp_pio_sel),
`ifdef NEPTUNE  .ipp_pio_addr         (ipp_pio_addr[13:0]),
`else           .ipp_pio_addr         (ipp_pio_addr[14:0]),
`endif          .ipp_pio_rd           (ipp_pio_rd),
		.ipp_pio_wdata(ipp_pio_wdata),
		.clk(clk),
		.reset(reset),
// output signals
		.fifo_wr_data_reg(fifo_wr_data_reg),
		.fifo_wr_data_reg_wr_en_pls(fifo_wr_data_reg_wr_en_pls),
		.config_reg                   (config_reg[24:0]),
		.vec_cycle1_wr_en(vec_cycle1_wr_en),
		.ippfifo_rd_ptr_pio_wr_en(ippfifo_rd_ptr_pio_wr_en),
		.ippfifo_wr_ptr_pio_wr_en(ippfifo_wr_ptr_pio_wr_en),
                .dfifo_wt_data_reg_wr_en_pls  (dfifo_wt_data_reg_wr_en_pls),
                .dfifo_rd_ptr_pio_wr_en       (dfifo_rd_ptr_pio_wr_en),
                .dfifo_wt_ptr_pio_wr_en       (dfifo_wt_ptr_pio_wr_en),
		.wr_ipp_en_bit0(wr_ipp_en_bit0),
		.ipp_pio_ack(ipp_pio_ack),
		.ipp_pio_rdata(ipp_pio_rdata),
		.ipp_pio_err(ipp_pio_err),
		.ipp_pio_intr(ipp_pio_intr),
		.ipp_debug(ipp_debug),
                .ipp_ecc_corrupt_sop          (ipp_ecc_corrupt_sop),
                .ipp_ecc_corrupt_2nd          (ipp_ecc_corrupt_2nd),
                .ipp_ecc_corrupt_eop          (ipp_ecc_corrupt_eop),
                .ipp_ecc_corrupt_sing         (ipp_ecc_corrupt_sing),
                .ipp_ecc_corrupt_doub         (ipp_ecc_corrupt_doub),
                .ipp_ecc_corrupt_no_uncor     (ipp_ecc_corrupt_no_uncor),
                .ecc_pkt_corrupted_clr        (ecc_pkt_corrupted_clr),
		.reset2(reset2)
		);			// end of ipp_slv

// For phase_sm2
/***** geo:
reg		fifo_empty_reg;	// fifo is read in front; same as ipp_hfifo_dat_empty

always @ (posedge clk)
  fifo_empty_reg <= ipp_hfifo_dat_empty;
*****/

ipp_phase_sm2 phase_sm2_u1 (
		.clk(clk), 
		.reset(reset2),
  		.valid(~fifo_data_out[129] & ~fifo_data_out[128] &
//       	       ~fifo_empty_reg),
		       fifo_rd_en_reg),
		.rx_tag(ipp_fifo_rd_tag),
		.rd_eop(rd_eop),
		.rd_status(rd_stat),
		.cur_state(tag_fsm_curstate)
	        );

wire		IFG = tag_fsm_curstate[1:0] == 2'b00;

niu_ipp_en_rst_fsm  ipp_en_rst_fsm_u1(.clk(clk), .reset(reset2), 
		.ipp_enable(ipp_enable), .wr_ipp_en_bit0(wr_ipp_en_bit0),
		.mac_stat(rd_stat[0]), .IFG(IFG), .rst_ipp_en(rst_ipp_en),
		.ipp_en_rst_fsm_curstate(ipp_en_rst_fsm_curstate[1:0]));
 			
endmodule	// end of ipp module

