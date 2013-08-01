// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_ipp_load.v
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

    File name       : niu_ipp_load.v

    Module(s) name  : niu_ipp_load
    Original:       : ipp_load.v main.45, label: IPP_VERIF_1.84

    Parent modules  : niu_ipp.v

    Child modules   : niu_ipp_lib.v

    Author's name   : Jonathan Shen, George Chu

    Date            : May 2001

    Description     : This module loads the 64 bit double word data from 
		      MAC/XMAC into ipp fifo. The data will be packed from
		      64-bit bus to 128-bit bus before loading in IPP Header fifo.
		      The protocol between IPP, XMAC and IPP, big MAC are
		      different.
		      FFLP reads the header part.

    Synthesis Notes:

    Modification History:

    Date       Description
    ----       -----------

************************************************************
***********************************************************/

module niu_ipp_load(
// input
		clk, reset, 

// input from mac
        	mac_ipp_req, xmac_ipp_ack,
		mac_ipp_data, mac_ipp_tag, 
		mac_ipp_ctrl, mac_ipp_stat,

// input from ffl
        	ffl_ipp_ready,  
        	ffl_ipp_dvalid,  
        	fflp_ipp_sum,  

// input from ffl_arbiter
                ffl_arb_ack,

		port_id,
		ippfifo_rd_wr_ptr_bypass,
		ippfifo_wr_ptr_pio_wr_en,
		eop_from_hdr_fifo,
		pio_wr_data,
		fifo_wr_data_reg,
		fifo_wr_data_reg_wr_en_pls,
		ipp_enable, xmac_mode, 
                bypass_ffl,
                vec_cycle1_wr_en,
                inc_hfifo_dat_rptr,
                ipp_hfifo_dat_rptr,
                n_ipp_unload_idle,
                clr_ipp_unload,

// output
// output to mac
        	ipp_mac_ack, ipp_xmac_req, 

// output to ffl
		ipp_ffl_dvalid,
		                   ipp_ffl_mac_default,

// outout to ffl_arbiter
		ipp_ffl_req,

// output to ipp fifo
		fifo_wr_en, fifo_wr_ptr,
		ipp_hfifo_rden, ipp_hfifo_rptr,
		ipp_hfifo_dat_empty,
		fifo_data_in,
		ipp_ffl_dvalid_n,
// output to ipp_post
		runt,
// end of output to ipp post
		ipp_hfifo_over_run_r, ipp_hfifo_under_run_r,
		phase_state_xmac, phase_state, 
		phase_state_1st_data, mac_ack_fsm_curstate,
		ipp_ffl_curstate, 
                cur_pkt_hdr_base_ptr, cur_pkt_ffl_sum_info 
		);

input		clk;
input		reset;
input		mac_ipp_req;
input		xmac_ipp_ack;
input 	[63:0]  mac_ipp_data;
input		mac_ipp_tag;
input		mac_ipp_ctrl;
input 	[22:0]	mac_ipp_stat;
input		ffl_ipp_ready;			// from ffl_top module
input		ffl_ipp_dvalid;			// from ffl_top module
input	[13:0]	fflp_ipp_sum;			// from ffl_top module
input		ffl_arb_ack;			// from ffl_arb module
input		ippfifo_rd_wr_ptr_bypass;	// from slave
input		ippfifo_wr_ptr_pio_wr_en;	// from slave
input		eop_from_hdr_fifo;		// from ipp
input 	[13:0]  pio_wr_data;
input	[129:0]	fifo_wr_data_reg;
input		fifo_wr_data_reg_wr_en_pls;
input 	[1:0]   port_id;
input           ipp_enable;
input		xmac_mode;
input		bypass_ffl;
input		vec_cycle1_wr_en;
input		inc_hfifo_dat_rptr;
input 	[6:0]   ipp_hfifo_dat_rptr;

input		n_ipp_unload_idle;
input		clr_ipp_unload;

output          ipp_mac_ack;
output		ipp_xmac_req;		// if fifo not full, always high (xmac)
output		ipp_ffl_req;		// to ffl_arb module
output		ipp_ffl_dvalid;		// valid data from ipp to ffl
output		ipp_ffl_dvalid_n;	// valid data from ipp to ffl for par
output 	[11:0]	ipp_ffl_mac_default;	// control inf. to ffl
output          ipp_hfifo_dat_empty;
output		fifo_wr_en;		// to ipp_fifo
output 	[6:0]	fifo_wr_ptr;		// to ipp_fifo
output          ipp_hfifo_rden;         // to ipp_hdr_fifo
output 	[5:0]	ipp_hfifo_rptr;	        // to ipp_hdr_fifo
output 	[129:0]	fifo_data_in;		// to ipp_fifo 
output          ipp_hfifo_over_run_r;
output          ipp_hfifo_under_run_r;
output	[2:0]	phase_state_xmac;
output	[2:0]	phase_state;
output		phase_state_1st_data;
output 	[3:0]   mac_ack_fsm_curstate;
output	[1:0]	ipp_ffl_curstate;
output		runt;
output	[6:0]	cur_pkt_hdr_base_ptr;
output [13:0]   cur_pkt_ffl_sum_info;

wire            ipp_hfifo_dat_empty;
reg             ipp_hfifo_over_run_r;
reg             ipp_hfifo_under_run_r;
reg     [6:0]   cur_pkt_hdr_base_ptr; 
reg    [13:0]   cur_pkt_ffl_sum_info;

wire    [6:0]   ipp_hfifo_dat_empty_space;
wire            ipp_hfifo_dat_full;
wire            ipp_hfifo_over_run,  n_ipp_hfifo_over_run;
wire            ipp_hfifo_under_run, n_ipp_hfifo_under_run;
wire            n_ipp_hfifo_bad_mac_load;
reg             ipp_hfifo_bad_mac_load;

reg             ffl_ipp_dvalid_d;

reg             ipp_mac_ack;
reg		ipp_mac_ack_d;		// use ack delay as internal signal
reg		ipp_mac_ack_reg1;
reg		xmac_ack;
reg		bmac_ack;
reg		ipp_xmac_req;
reg   	[6:0]   fifo_wr_ptr;
reg   	[6:0]   wr_base_ptr;	// use for rewind pointer like run packet only  
reg   	[6:0]   hdr_rd_ptr;  
reg	[6:0]	hdr_rd_ptr_n;

reg   	[3:0]	hdr_count;
reg	[3:0]	hdr_count_n;
reg		ipp_ffl_req;
reg		ipp_ffl_req_n;
wire 		ipp_ffl_dvalid;
reg 		ipp_ffl_dvalid_n;
wire            ipp_ffl_dvalid_n_nxt;
wire		filtered_tag;
wire		bmac_ipp_tag;

// pipeline register stuff
reg   	[63:0]	mac_ipp_data_reg1;	
reg   	[131:0]	mac_ipp_data_reg2;
reg   	[130:0]	xmac_ipp_data_reg2;
reg   	[63:0]	mac_ipp_stat_reg;
reg   	[11:0]	mac_ipp_ctl_reg;		// store the mac ctl word
reg		mac_ipp_ctrl_reg;		// registered the control signal
reg		mac_ipp_tag_reg1;
reg		xmac_ipp_ack_d;
reg		xmac_ipp_ack_reg1;
reg	[63:0]	stage0_dout;
reg	[63:0]	stage1_dout;
reg	[63:0]	xstage0_dout;	
reg	[63:0]	xstage1_dout;	
reg		stage0_tout;
reg		stage1_tout;
reg 		sel;
wire            valid2;
wire            valid2_xmac;
wire            valid2_xmac_pio;
wire		stat_wr_reg2;
wire		fifo_wr_en;
wire		ctlfifo_wr_en;

wire		load_fifo;
wire		xload_fifo;

wire	[129:0] fifo_data_in = (ippfifo_rd_wr_ptr_bypass && valid2) ?
				mac_ipp_data_reg2[129:0] :
			       (ippfifo_rd_wr_ptr_bypass && valid2_xmac_pio) ?
				xmac_ipp_data_reg2[129:0] :
			       ((xmac_mode == 1'b0) && (load_fifo == 1'b0)) ? 
				130'h0 :
			       ((xmac_mode == 1'b1) && (xload_fifo == 1'b0)) ? 
                                130'h0 :
				xmac_mode ? xmac_ipp_data_reg2[129:0] :
                                mac_ipp_data_reg2[129:0];

wire 	[5:0]   ipp_hfifo_hdr_rptr = hdr_rd_ptr_n[5:0]; // to FFL read ptr
wire    [5:0]   ipp_hfifo_rptr     = (n_ipp_unload_idle && !ippfifo_rd_wr_ptr_bypass) ?
                                     ipp_hfifo_hdr_rptr[5:0] : ipp_hfifo_dat_rptr[5:0];
wire            ipp_hfifo_rden     = ipp_ffl_dvalid_n_nxt   || inc_hfifo_dat_rptr ||
                                     ippfifo_rd_wr_ptr_bypass || reset;

// for mac_ack_fsm
wire            n_tag;
wire            nn_tag;
wire	[2:0]	phase_state;
wire	[2:0]	phase_state_xmac;
wire		phase_state_1st_data;
wire 	[3:0]   mac_ack_fsm_curstate;
reg 	[1:0]	ipp_ffl_curstate;
reg 	[1:0]	nex_state;
wire            ipp_ack;
// geo: wire		mac_tag;
reg		nn_tag_d;
wire		tag_err_mac = nn_tag_d & ~bmac_ipp_tag;
wire            set_tag_err_mac;   //geo: from Vega: No load now, leave it for future use

// geo: wire            fifo_rdy_4rd;
wire		fifo_rdy_4wr;
wire            runt;        
wire		hdr_ok_2xfer;
wire		ctlfifo_rd_dn;
wire		wr_1st_data;
wire		swap;
wire	[1:0]	eop_4_fifo;

reg       [4:0] hdr_ok_2xfer_cnt, n_hdr_ok_2xfer_cnt;
wire            dec_hdr_ok_2xfer_cnt;
wire            hdr_ok_2xfer_cnt_gt_eq_1 = |(hdr_ok_2xfer_cnt[4:1]);
wire            start_hdr_xfer;

assign bmac_ipp_tag = xmac_mode ? 1'b0 : mac_ipp_tag;
assign filtered_tag = xmac_mode ? (mac_ipp_tag & xmac_ipp_ack):
				  (mac_ipp_tag & ipp_mac_ack_d);
/* filtered_tag equals to the and function of tag and delayed ack
*/
assign valid2 = mac_ipp_data_reg2[130];
assign valid2_xmac = xmac_ack;
assign valid2_xmac_pio = xmac_ipp_data_reg2[130];
assign stat_wr_reg2 = xmac_mode ? (xmac_ipp_data_reg2[128] & fifo_wr_en) :
				  (mac_ipp_data_reg2[128] & fifo_wr_en);
assign eop_4_fifo = xmac_mode ? xmac_ipp_data_reg2[129:128] :
				mac_ipp_data_reg2[129:128];

assign fifo_wr_en = ippfifo_rd_wr_ptr_bypass ? (valid2 || valid2_xmac_pio) :
		    xmac_mode ? xload_fifo : load_fifo;

//**********************************************************
//***** mac_ipp_data pipe and associated control logic *****
//**********************************************************

// 1st stage mac_ipp_data pipe
wire    [63:0]  mac_ipp_data_next = (sel == 1'b1) ? mac_ipp_stat_reg[63:0] :
                                                    mac_ipp_data[63:0];
wire            xmac_ipp_ack_next = (sel == 1'b1) ? sel :
                                                    xmac_ipp_ack;
wire            mac_ipp_tag_next = (sel == 1'b1) ? sel :
                                                   filtered_tag;

always @ (posedge clk)
  if (reset) begin
    xmac_ipp_ack_d    <=  1'h0;
    ipp_mac_ack_d     <=  1'h0;
    xmac_ipp_ack_reg1 <=  1'h0;
    ipp_mac_ack_reg1  <=  1'h0;
    mac_ipp_ctrl_reg  <=  1'h0;
    mac_ipp_stat_reg  <= 64'h0;
//g mac_ipp_ctl_reg   <= 12'h0;
    sel               <=  1'h0;
    mac_ipp_data_reg1 <= 64'h0;
    mac_ipp_tag_reg1  <=  1'h0;
  end
  else 
  begin
    xmac_ipp_ack_d <= xmac_ipp_ack_next;
    ipp_mac_ack_d <= ipp_mac_ack;
    xmac_ipp_ack_reg1 <= xmac_ipp_ack_d;
    ipp_mac_ack_reg1 <= ipp_mac_ack_d;
    mac_ipp_ctrl_reg <= mac_ipp_ctrl;

    if (filtered_tag & xmac_mode)
      mac_ipp_stat_reg[63:0] <= {41'b0, mac_ipp_stat[22:0]};
//g   mac_ipp_ctl_reg[11:0] <= mac_ipp_stat[11:0];
      sel <= (filtered_tag && xmac_mode)? 1'h1 : 1'h0;
      mac_ipp_data_reg1[63:0] <= mac_ipp_data_next[63:0];
      mac_ipp_tag_reg1 <= mac_ipp_tag_next;
  end

/******** geo ***********************************************************/
  always @ (posedge clk) begin
    if (reset || mac_ipp_ctrl) begin
      mac_ipp_ctl_reg  <= mac_ipp_stat[11:0]  & {12{!reset}};
    end
    else begin
      mac_ipp_ctl_reg  <= mac_ipp_ctl_reg[11:0];
    end
  end
/************************************************************************/

// 2nd stage mac_data_in2 pipe, pack the data from 64-bit to 128-bit
always @ (posedge clk)
  begin
    stage0_dout[63:0] <= mac_ipp_data_reg1[63:0];
    stage1_dout[63:0] <= stage0_dout[63:0];
    stage0_tout <= mac_ipp_tag_reg1;
    stage1_tout <= stage0_tout; 
    xmac_ack <= xmac_ipp_ack_reg1;
    bmac_ack <= ipp_mac_ack_reg1;

// for xmac only
    if (reset) 
      begin
        xstage0_dout[63:0] <= 64'h0;
      end
    else if (xmac_ipp_ack_d)
      begin
	xstage0_dout[63:0] <= mac_ipp_data_reg1[63:0];
      end
    else
	xstage0_dout[63:0] <= xstage0_dout[63:0];

    if (reset)
      begin
        xstage1_dout[63:0] <= 64'h0;
      end
    else if (xmac_ipp_ack_reg1)
      begin
	xstage1_dout[63:0] <= xstage0_dout[63:0];
      end
    else
        xstage1_dout[63:0] <= xstage1_dout[63:0];

    if (reset)
	xmac_ipp_data_reg2[130:0] <= 131'b0;
    else if (fifo_wr_data_reg_wr_en_pls && xmac_mode)
        xmac_ipp_data_reg2[130:0] <= {1'b1, fifo_wr_data_reg[129:0]}; 
    else if (xmac_ipp_ack_reg1)
	xmac_ipp_data_reg2[130:0] <= {1'b0, stage0_tout, stage1_tout, xstage0_dout[63:0], xstage1_dout[63:0]};
    else if (xmac_ack & swap)	// swap data
	xmac_ipp_data_reg2[130:0] <= {1'b0, stage0_tout, stage1_tout, xstage1_dout[63:0], xstage0_dout[63:0]};
    else
	xmac_ipp_data_reg2[130:0] <= {1'b0, xmac_ipp_data_reg2[129:0]};
// end of for xmac only

    if (reset)
      mac_ipp_data_reg2[131:0] <= 132'h0;
    else if (fifo_wr_data_reg_wr_en_pls && (xmac_mode == 1'h0))
      mac_ipp_data_reg2[131:0] <= {2'b01, fifo_wr_data_reg[129:0]};
    else if ((stage0_tout == 1'b0) && (stage1_tout == 1'b1))
      mac_ipp_data_reg2[131:0] <= {xmac_ack, bmac_ack, stage0_tout, stage1_tout, 64'h0, stage1_dout[63:0]};
    else
      mac_ipp_data_reg2[131:0] <= {xmac_ack, bmac_ack, stage0_tout, stage1_tout, stage0_dout[63:0], stage1_dout[63:0]};
  end

//***** end of mac_data_in pipe *****

//***** phase_sm instantiation *****
phase_sm0 xmac_phase_sm_after_packing (.clk(clk), .reset(reset),
            .valid(valid2_xmac & (!ippfifo_rd_wr_ptr_bypass)),
	    .eop(eop_4_fifo), .swap(swap),
            .load_fifo(xload_fifo), .phase_state(phase_state_xmac));

phase_sm bmac_phase_sm_after_packing (.clk(clk), .reset(reset), 
	    .valid(valid2 & (!ippfifo_rd_wr_ptr_bypass)), .eop(eop_4_fifo), 
	    .load_fifo(load_fifo), .phase_state(phase_state));

phase_sm3 phase_sm_1st_data (.clk(clk), .reset(reset), 
	    .valid((valid2 | valid2_xmac) & (!ippfifo_rd_wr_ptr_bypass)),
            .eop(stat_wr_reg2), .wr_1st_data(wr_1st_data),
            .phase_state(phase_state_1st_data));

//***** ipp_mac_ack shaper *****
mac_ack_fsm mac_ack_fsm_ack (.clk(clk), .reset(reset | ~ipp_enable),
	    .ipp_enable(ipp_enable),
	    .mac_ipp_req(mac_ipp_req), .mac_tag(bmac_ipp_tag),
	    .fifo_rdy_4wr(fifo_rdy_4wr),
	    .tag_err_mac(tag_err_mac),
	    .n_tag(n_tag), .nn_tag(nn_tag), .set_tag_err_mac(set_tag_err_mac),
	    .ipp_ack(ipp_ack), .cur_state(mac_ack_fsm_curstate[3:0]));
 
//***** ack to mac & control signals from mac_ack_fsm *****
always @ (posedge clk)
   if (reset |                   (~ipp_enable))
       begin
         ipp_mac_ack <= 0;
	 nn_tag_d <=0;
       end
   else
       begin
      	 ipp_mac_ack <= ipp_ack;
	 nn_tag_d <= nn_tag;
       end

//***** end of ack behavior *****


//***** req to xmac *****
always @ (posedge clk)
  if (reset | (~fifo_rdy_4wr) | (~ipp_enable))
      ipp_xmac_req <= 0;
  else if (fifo_rdy_4wr)
      ipp_xmac_req <= 1;
  else
      ipp_xmac_req <= ipp_xmac_req;
//***** end of req behavior *****

//************************************************
//***** Ipp_hdr_fifo and associated control logic *****
//************************************************

//***** Ipp_hdr_fifo Write Pointer *****
always @ (posedge clk)
  if (reset)
    fifo_wr_ptr <= 0;
  else if (ippfifo_rd_wr_ptr_bypass)
    casex (ippfifo_wr_ptr_pio_wr_en)
      1'b0: fifo_wr_ptr <= fifo_wr_ptr;		// hold the value
      1'b1: fifo_wr_ptr <= pio_wr_data[6:0];
    endcase
  else if (runt)
    fifo_wr_ptr <= wr_base_ptr;			// abort packet; rewind pointer
  else if (fifo_wr_en)
    fifo_wr_ptr <= fifo_wr_ptr + 1;		// increment
  else
    fifo_wr_ptr <= fifo_wr_ptr;			// hold the value

//***** Ipp_hdr_fifo Write Base Pointer *****
always @ (posedge clk)
  if (reset) 
    wr_base_ptr <= fifo_wr_ptr;
  else if (wr_1st_data)
    wr_base_ptr <= fifo_wr_ptr;			// update count
  else
    wr_base_ptr <= wr_base_ptr;    

//***** Ipp_hdr_fifo Read Pointer *****
/****** geo: ******
input		ippfifo_rd_ptr_pio_wr_en;	// from slave
always @ (posedge clk)
  if (reset)
    fifo_rd_ptr <= 7'b0;
  else if (ippfifo_rd_wr_ptr_bypass)
    casex (ippfifo_rd_ptr_pio_wr_en)
      1'b0: fifo_rd_ptr <= fifo_rd_ptr;		// hold the value
      1'b1: fifo_rd_ptr <= pio_wr_data[6:0];
    endcase
  else if (fifo_rd_en)
    fifo_rd_ptr <= fifo_rd_ptr_plus1[6:0];	// inc pointer
  else
    fifo_rd_ptr <= fifo_rd_ptr;			// hold the value
******* geo: *****/

//*** 1K bytes Ipp_hdr_fifo Management (64-bit depth and 16 bytes(128-bit) wide) ***
/****** geo: ******
wire [6:0] fifo_empty_space = (fifo_wr_ptr[6]   == fifo_rd_ptr[6])  ?
                      7'd64 - (fifo_wr_ptr[5:0]  - fifo_rd_ptr[5:0]):
                              (fifo_rd_ptr[5:0]  - fifo_wr_ptr[5:0]);

wire       fifo_full        = (fifo_wr_ptr[6]   == (!fifo_rd_ptr[6])) &&
                              (fifo_wr_ptr[5:0] == fifo_rd_ptr[5:0]);

wire       fifo_empty       = (fifo_wr_ptr[6:0] == fifo_rd_ptr[6:0]);

wire       fifo_over_run    = fifo_full  & fifo_wr_en & (!ippfifo_rd_wr_ptr_bypass);

wire       fifo_under_run   = fifo_empty & fifo_rd_en & (!ippfifo_rd_wr_ptr_bypass);
******* geo: *****/

// geo:
  assign ipp_hfifo_dat_empty_space = (fifo_wr_ptr[6]   == ipp_hfifo_dat_rptr[6])  ?
                             7'd64 - {1'b0,(fifo_wr_ptr[5:0]        - ipp_hfifo_dat_rptr[5:0])}:
                                     {1'b0,(ipp_hfifo_dat_rptr[5:0] - fifo_wr_ptr[5:0])};
  assign ipp_hfifo_dat_full    = (fifo_wr_ptr[6]   == (!ipp_hfifo_dat_rptr[6]) ) &&
                                 (fifo_wr_ptr[5:0] ==   ipp_hfifo_dat_rptr[5:0]);
  assign ipp_hfifo_dat_empty   = (fifo_wr_ptr[6:0] == ipp_hfifo_dat_rptr[6:0]);
  assign ipp_hfifo_over_run    = (ipp_hfifo_dat_full  && fifo_wr_en         || ipp_hfifo_bad_mac_load) && !ippfifo_rd_wr_ptr_bypass;
  assign ipp_hfifo_under_run   = (ipp_hfifo_dat_empty && inc_hfifo_dat_rptr || ipp_hfifo_bad_mac_load) && !ippfifo_rd_wr_ptr_bypass;

  assign n_ipp_hfifo_over_run  = (reset || clr_ipp_unload) ? 1'b0 :
                                 ipp_hfifo_over_run        ? 1'b1 :
                                 ipp_hfifo_over_run_r;

  assign n_ipp_hfifo_under_run = (reset || clr_ipp_unload) ? 1'b0 :
                                 ipp_hfifo_under_run       ? 1'b1 :
                                 ipp_hfifo_under_run_r;

  assign n_ipp_hfifo_bad_mac_load =  xmac_mode && (phase_state_xmac[2:0]==3'h5)     ||  // phase_sm0   ERROR state 
                                    !xmac_mode && (phase_state[2:0]==3'h5)          ||  // phase_sm    ERROR state
                                    !xmac_mode && (mac_ack_fsm_curstate[3:0]==4'hB);    // mac_ack_fsm error state

  always @ (posedge clk)
    begin
      ipp_hfifo_over_run_r  <= n_ipp_hfifo_over_run;
      ipp_hfifo_under_run_r <= n_ipp_hfifo_under_run;
      ipp_hfifo_bad_mac_load<= n_ipp_hfifo_bad_mac_load;
    end

// assign the sixteen byte data
reg  [11:0]	sixteen_byte_count;
always @ (posedge clk)
  if (reset | runt | stat_wr_reg2)
      sixteen_byte_count <= 0;
   else if (fifo_wr_en)
      sixteen_byte_count <= sixteen_byte_count + 1;	// hold
   else
      sixteen_byte_count <= sixteen_byte_count;		// inc.

// assign the abort_wr
reg		abort_wr;
always @ (posedge clk)
  if (stat_wr_reg2)
    if (xmac_mode) begin
      if (xmac_ipp_data_reg2[129])
 	abort_wr <= xmac_ipp_data_reg2[79];
      else
	abort_wr <= xmac_ipp_data_reg2[15];
    end
    else begin
      if (mac_ipp_data_reg2[129])
        abort_wr <= mac_ipp_data_reg2[79];
      else
        abort_wr <= mac_ipp_data_reg2[15];
    end
  else
	abort_wr <= 1'b0;

// definition of runt packet
assign runt = ((sixteen_byte_count < 12'd4) |
	      ((sixteen_byte_count == 12'd4) & abort_wr)) & stat_wr_reg2;
 
// synopsys translate_off
// For diagnostic purpose
always @ (posedge clk)
  if (!reset)
     begin
       if (ipp_hfifo_over_run) 
          $display("\n -> Warning at sim time = %d, ipp PortID=%d Ipp_hdr_fifo over run occurred.", $stime, port_id);
       else if (ipp_hfifo_under_run) 
          $display("\n -> Warning at sim time = %d, ipp PortID=%d ipp Ipp_hdr_fifo under run occurred.", $stime, port_id);
       else ;
     end
// synopsys translate_on

// geo: wire [6:0] fifo_full_space = 7'd64 - ipp_hfifo_dat_empty_space[6:0];

// there are 5 stages of registers for mac/ipp interface
// As John's request change 5 to 6 (2-3-3)

wire      [6:0] hfifo_space = xmac_mode ? 7'd5 : 7'd9; // geo

assign  fifo_rdy_4wr = (ipp_hfifo_dat_empty_space[6:0] > hfifo_space);

//***** used by ipp_bmc_ctrl *****
//accumulate to 16-byte data (1) 
// geo: assign 	fifo_rdy_4rd = (fifo_full_space > 7'h0) & ~runt;


//***** Ipp_hdr_fifo Header Read by FFL *****
// oThe2ndTagTime is the status word. Can not count as part of the 
// 64 byte payload requirement. 
// 
// look inside PktLength field of status word approach.
//wire  time_2_xfer_hdr =((fifo_data_in[13:0] == `SIXTY_FOUR) & oThe2ndTagTime)|
//      ((sixteen_byte_count == `THIRTY_TWO) & fifo_wr_en & ~oThe2ndTagTime);

// independent ipp approach
wire	time_2_xfer_hdr = ((sixteen_byte_count == 12'd4) &	// 64-byte 
			   (~abort_wr & stat_wr_reg2)) |
			  ((sixteen_byte_count == 12'd5) &	// 80- byte
                           (~abort_wr & stat_wr_reg2)) |
			  ((sixteen_byte_count == 12'd6) &	// 96-byte
                           (~abort_wr & stat_wr_reg2)) |
			  ((sixteen_byte_count == 12'd7) &	//112-byte
                           (~abort_wr & stat_wr_reg2)) |
			  ((sixteen_byte_count == 12'd8) &	//128-byte
			  ((~abort_wr & stat_wr_reg2) |
                          (fifo_wr_en & ~stat_wr_reg2)));

ipp_puls_gen puls_gen_hdr_xfer (.reset(reset), .clk(clk), 
         		.signal_in(time_2_xfer_hdr), .puls_out(hdr_ok_2xfer));

//*********************************************
//***** header base pointer fifo (7 x 16) *****
//*********************************************

reg     [6:0]   hdr_base_ptr_fifo [0:15];	// 7-bit by 16 deep
reg     [3:0]   hdr_base_ptr_wr_ptr;
reg     [3:0]   hdr_base_ptr_rd_ptr;

//***** write to header base pointer fifo
always @ (posedge clk)
  if (reset)
    begin
      hdr_base_ptr_fifo[0]  <= 7'b0;
      hdr_base_ptr_fifo[1]  <= 7'b0;
      hdr_base_ptr_fifo[2]  <= 7'b0;
      hdr_base_ptr_fifo[3]  <= 7'b0;
      hdr_base_ptr_fifo[4]  <= 7'b0;
      hdr_base_ptr_fifo[5]  <= 7'b0;
      hdr_base_ptr_fifo[6]  <= 7'b0;
      hdr_base_ptr_fifo[7]  <= 7'b0;
      hdr_base_ptr_fifo[8]  <= 7'b0;
      hdr_base_ptr_fifo[9]  <= 7'b0;
      hdr_base_ptr_fifo[10] <= 7'b0;
      hdr_base_ptr_fifo[11] <= 7'b0;
      hdr_base_ptr_fifo[12] <= 7'b0;
      hdr_base_ptr_fifo[13] <= 7'b0;
      hdr_base_ptr_fifo[14] <= 7'b0;
      hdr_base_ptr_fifo[15] <= 7'b0;
    end
  else if (wr_1st_data)
      hdr_base_ptr_fifo[hdr_base_ptr_wr_ptr] <= fifo_wr_ptr[6:0];
  else
      hdr_base_ptr_fifo[hdr_base_ptr_wr_ptr] <= hdr_base_ptr_fifo[hdr_base_ptr_wr_ptr];

//***** header base pointer write pointer *****
always @ (posedge clk)
  if (reset)
    hdr_base_ptr_wr_ptr <= 4'h0;
  else
    casex ({wr_1st_data, runt})
        2'b00: hdr_base_ptr_wr_ptr <= hdr_base_ptr_wr_ptr;
        2'b01: hdr_base_ptr_wr_ptr <= hdr_base_ptr_wr_ptr - 4'h1;  // rewind
        2'b10: hdr_base_ptr_wr_ptr <= hdr_base_ptr_wr_ptr + 4'h1;  // increment
        2'b11: hdr_base_ptr_wr_ptr <= hdr_base_ptr_wr_ptr;
    endcase

//***** header base pointer read pointer *****
always @ (posedge clk)
  if (reset)
    hdr_base_ptr_rd_ptr <= 4'h0;
  else if (hdr_count == 4'd1)
    hdr_base_ptr_rd_ptr <= hdr_base_ptr_rd_ptr + 1;
  else
    hdr_base_ptr_rd_ptr <= hdr_base_ptr_rd_ptr;

//***** header base pointer
wire    [6:0]   hdr_base_ptr = hdr_base_ptr_fifo[hdr_base_ptr_rd_ptr];

// geo:
always @ (posedge clk)
  if (reset)
    cur_pkt_hdr_base_ptr <= 7'h0;
  else if (hdr_count == 4'd1)
    cur_pkt_hdr_base_ptr <= hdr_base_ptr;
  else
    cur_pkt_hdr_base_ptr <= cur_pkt_hdr_base_ptr;
//***** end of header base pointer fifo

always @ (posedge clk)
  if (reset)
    cur_pkt_ffl_sum_info <= 14'h0;
  else if (ffl_ipp_dvalid && !ffl_ipp_dvalid_d)
    cur_pkt_ffl_sum_info <= fflp_ipp_sum[13:0];
  else if (bypass_ffl && vec_cycle1_wr_en)
    cur_pkt_ffl_sum_info <= pio_wr_data[13:0];
  else
    cur_pkt_ffl_sum_info <= cur_pkt_ffl_sum_info[13:0];

parameter
  Idle     = 2'h0,
  Wait4rdy = 2'h1,
  Wait4ack = 2'h2,
  Hdr_xfer = 2'h3;

always @ (start_hdr_xfer or ffl_ipp_ready or ffl_arb_ack or 
	  hdr_count or hdr_rd_ptr or hdr_base_ptr or ipp_ffl_dvalid_n or 
	  n_ipp_unload_idle or 
	  ipp_ffl_curstate)
  begin
    ipp_ffl_req_n = 0;
// geo:    ipp_ffl_dvalid_n = 0; 
    hdr_count_n = 0;
    hdr_rd_ptr_n = 0;
    nex_state = ipp_ffl_curstate;

    case(ipp_ffl_curstate) 	// synopsys parallel_case full_case
      Idle:
	begin
	  if ((start_hdr_xfer) && (~ffl_ipp_ready) && n_ipp_unload_idle)
	    begin
		ipp_ffl_req_n = 1;
		nex_state = Wait4rdy;
	    end
	  else if ((start_hdr_xfer) && (ffl_ipp_ready) && n_ipp_unload_idle) 
	    begin
		ipp_ffl_req_n = 1;
		nex_state = Wait4ack;
	    end
	  else 	nex_state = ipp_ffl_curstate;
	end

      Wait4rdy:
	begin
	  ipp_ffl_req_n = 1;

	  if (ffl_ipp_ready)
	    begin
                nex_state = Wait4ack;
	    end
	  else
		nex_state = ipp_ffl_curstate;
	end

      Wait4ack:	
	begin
	  ipp_ffl_req_n = 1;
	  hdr_rd_ptr_n = hdr_base_ptr;

	  if (ffl_arb_ack & ffl_ipp_ready)
		nex_state = Hdr_xfer;
	  else
                nex_state = ipp_ffl_curstate;
	end

      Hdr_xfer:
	begin
          ipp_ffl_req_n = 1;
// geo:	  ipp_ffl_dvalid_n = ((hdr_count == 3'd0) | (hdr_count == 3'd1) |
// geo:			      (hdr_count == 3'd2) |
// geo:			      ((3'd2 < hdr_count) && (hdr_count < 3'd6) &&
// geo:			       (~eop_from_hdr_fifo))
// geo:			     );

	  if (ipp_ffl_dvalid_n)
	    begin
		hdr_count_n = hdr_count + 1;
		hdr_rd_ptr_n = hdr_rd_ptr + 1;
		nex_state = ipp_ffl_curstate;
	    end
	  else
	    begin
                ipp_ffl_req_n = 0;
		hdr_count_n = 0;
		hdr_rd_ptr_n = hdr_rd_ptr;
		nex_state = Idle; 
	    end
	end
    endcase
  end	// end of comb part

// geo: 
  assign ipp_ffl_dvalid_n_nxt = (nex_state==Hdr_xfer) && 
                                ((hdr_count_n == 4'd0) | (hdr_count_n == 4'd1) |
                                 (hdr_count_n == 4'd2) |
                                 ((4'd2 < hdr_count_n) && (hdr_count_n < 4'd8) &&
                                  (~eop_from_hdr_fifo))
                                );

  assign ipp_ffl_dvalid = ipp_ffl_dvalid_n;

  always @ (dec_hdr_ok_2xfer_cnt or hdr_ok_2xfer or hdr_ok_2xfer_cnt)
    case ({dec_hdr_ok_2xfer_cnt,hdr_ok_2xfer})         // synopsys parallel_case
      2'b00:   n_hdr_ok_2xfer_cnt = hdr_ok_2xfer_cnt;
      2'b01:   n_hdr_ok_2xfer_cnt = hdr_ok_2xfer_cnt + 5'h1;  // get     1
      2'b10:   n_hdr_ok_2xfer_cnt = hdr_ok_2xfer_cnt - 5'h1;  // consume 1
      2'b11:   n_hdr_ok_2xfer_cnt = hdr_ok_2xfer_cnt;
      default: n_hdr_ok_2xfer_cnt = hdr_ok_2xfer_cnt;
    endcase

  assign dec_hdr_ok_2xfer_cnt = (nex_state == Hdr_xfer) && (ipp_ffl_curstate != Hdr_xfer) && hdr_ok_2xfer_cnt_gt_eq_1;
  assign start_hdr_xfer       = hdr_ok_2xfer || hdr_ok_2xfer_cnt_gt_eq_1;


always @(posedge clk)
  if (reset)
    begin
      ipp_ffl_req      <= 1'h0;
//geo ipp_ffl_dvalid   <= 1'h0;
      hdr_count        <= 4'h0;
      hdr_rd_ptr       <= 7'h0;
      ipp_ffl_curstate <= 2'h0;
      ipp_ffl_dvalid_n <= 1'h0;
      ffl_ipp_dvalid_d <= 1'h0;
      hdr_ok_2xfer_cnt <= 5'h0;
    end
  else
    begin
      ipp_ffl_req      <= ipp_ffl_req_n;
//geo ipp_ffl_dvalid   <= ipp_ffl_dvalid_n;
      hdr_count        <= hdr_count_n[3:0];
      hdr_rd_ptr       <= hdr_rd_ptr_n[6:0];
      ipp_ffl_curstate <= nex_state[1:0];
      ipp_ffl_dvalid_n <= ipp_ffl_dvalid_n_nxt;
      ffl_ipp_dvalid_d <= ffl_ipp_dvalid;
      hdr_ok_2xfer_cnt <= n_hdr_ok_2xfer_cnt;
    end

//***********************************************
//***** Control Word FIFO and related logic *****
//***********************************************
// Control word fifo can maintain up to 16 minimum size packet(64 bytes) which
// equals to 1k size fifo.

reg	[11:0]	ctlfifo	[0:15];		// 12-bit by 16 deep
reg	[3:0]	ctlfifo_wr_ptr;
reg	[3:0]	ctlfifo_rd_ptr;

assign ctlfifo_wr_en = wr_1st_data;
/******** geo ************************************************************
assign ctlfifo_wr_en = xmac_mode ? (mac_ipp_ctrl_reg & xmac_ipp_ack_d) : 
				   (mac_ipp_ctrl_reg & ipp_mac_ack_d);
*************************************************************************/


//***** write to control word fifo
always @ (posedge clk)
  if (reset)
    begin
      ctlfifo[0] <= 0;
      ctlfifo[1] <= 0;
      ctlfifo[2] <= 0;
      ctlfifo[3] <= 0;
      ctlfifo[4] <= 0;
      ctlfifo[5] <= 0;
      ctlfifo[6] <= 0;
      ctlfifo[7] <= 0;
      ctlfifo[8] <= 0;
      ctlfifo[9] <= 0;
      ctlfifo[10] <= 0;
      ctlfifo[11] <= 0;
      ctlfifo[12] <= 0;
      ctlfifo[13] <= 0;
      ctlfifo[14] <= 0;
      ctlfifo[15] <= 0;
    end
  else if (ctlfifo_wr_en)
      ctlfifo[ctlfifo_wr_ptr] <= mac_ipp_ctl_reg[11:0];
  else
      ctlfifo[ctlfifo_wr_ptr] <= ctlfifo[ctlfifo_wr_ptr];

//***** control word write pointer *****
always @ (posedge clk)
  if (reset)
    ctlfifo_wr_ptr <= 0;
  else
    casex ({ctlfifo_wr_en, runt})
	2'b00: ctlfifo_wr_ptr <= ctlfifo_wr_ptr;
	2'b01: ctlfifo_wr_ptr <= ctlfifo_wr_ptr - 1;	// rewind
	2'b10: ctlfifo_wr_ptr <= ctlfifo_wr_ptr + 1;	// increment
	2'b11: ctlfifo_wr_ptr <= ctlfifo_wr_ptr;
    endcase

//***** control word read pointer by FFL *****
ipp_falling_edge_puls_gen falling_edge_puls_gen_ctlfifo_rd_dn (.reset(reset),
			.clk(clk), .signal_in(ipp_ffl_dvalid),
			.puls_out(ctlfifo_rd_dn));

always @ (posedge clk)
  if (reset | ~ipp_enable)
    ctlfifo_rd_ptr <= 0;
  else if (ctlfifo_rd_dn)
    ctlfifo_rd_ptr <= ctlfifo_rd_ptr + 1;
  else
    ctlfifo_rd_ptr <= ctlfifo_rd_ptr;

// read from control word
// {2'b00, mac_addr_index(6), defaultQPN(8), mode_bit(1), local_CPU(1), 
//  ph_bit(1), mu_bit(1)}
wire	[11:0]	ffl_ctl_word = ctlfifo[ctlfifo_rd_ptr];
wire	[11:0]	ipp_ffl_mac_default = ffl_ctl_word[11:0];

//***** end of control word fifo and related logic *****

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

`ifdef NEP_SIM_MAC_IPP_PKT_CNT

// synopsys translate_off

wire            tag2_acked;
wire     [15:0] mac_ipp_pkt_cnt;

  ipp_tag_acked tag_acked_0 (
                             .filtered_tag       (filtered_tag),
                             .mac_ipp_ctrl       (mac_ipp_ctrl),
                             .xmac_mode          (xmac_mode),
                             .xmac_ipp_ack       (xmac_ipp_ack),
                             .ipp_mac_ack        (ipp_mac_ack),
                             .reset              (reset),
                             .clk                (clk),
                             .tag2_acked         (tag2_acked),
                             .mac_ipp_pkt_cnt    (mac_ipp_pkt_cnt)
                            );
// synopsys translate_on
`endif


endmodule // end of ipp_load
//***** end of main program ************************************************


/**************************************************************************
*  mac_ack_fsm: Use this state machine to count phases before packing data.
**************************************************************************/
module mac_ack_fsm (clk, reset, ipp_enable,
		    mac_ipp_req, mac_tag, fifo_rdy_4wr, tag_err_mac,
		    n_tag, nn_tag, set_tag_err_mac,
                    ipp_ack, cur_state);
input          	clk;
input          	reset; 
input		ipp_enable;
input          	mac_ipp_req;
input          	mac_tag; 
input		fifo_rdy_4wr;
input		tag_err_mac;

output		n_tag;
output		nn_tag;
output		set_tag_err_mac;
output         	ipp_ack;
output [3:0]   	cur_state;

reg		n_tag;
reg		nn_tag;
reg		set_tag_err_mac;
reg            	ipp_ack;
reg    [3:0]   	cur_state, nex_state;

parameter       idle		= 4'h0;
parameter       load_bop	= 4'h1;
parameter       load_1		= 4'h2;
parameter       load_2		= 4'h3;
parameter       load_3		= 4'h4;
parameter       load_4		= 4'h5;
parameter       last_detect	= 4'h6;
parameter       wait_req	= 4'h7;
parameter       wait_req_stat_1	= 4'h8;
parameter       load_stat	= 4'h9;
parameter       bubble_mac	= 4'hA;
parameter       error		= 4'hB;

// Comb part
always @ (cur_state or mac_tag or tag_err_mac or ipp_enable or fifo_rdy_4wr
	  or mac_ipp_req)
  begin   
    ipp_ack = 0;
    nex_state = idle;
    n_tag = 0;
    nn_tag = 0;
    set_tag_err_mac = 0;
    
      casex (cur_state) // synopsys parallel_case full_case
	idle:			// 0
	  if (tag_err_mac)
	    begin
	       	  set_tag_err_mac = 1;
	      	  nex_state = error;
	    end
	  else if (ipp_enable && fifo_rdy_4wr && mac_ipp_req)
	    begin
	      	  ipp_ack = 1;
              	  nex_state = load_bop;
	    end
	  else
	      	  nex_state = idle;

	load_bop:		// 1
	    begin
	      	  ipp_ack = 1;
	      	  nex_state = load_2;
	    end

	load_1:			// 2
	    begin
	      	  ipp_ack = 1;
	      	  nex_state = load_2;	// parallel with load_bop
	    end

	load_2:			// 3
	    begin
	      if (mac_tag)
		begin
		  n_tag = 1;
		  nn_tag = 1;
		  nex_state = idle;
		end
	      else
		begin
		  ipp_ack = 1;
		  nex_state = load_3;
		end
	    end

	load_3:			// 4
            begin
              if (mac_tag)
                begin
                  n_tag = 1;
                  nn_tag = 1;
                  nex_state = idle;
                end
              else
                begin
                  ipp_ack = 1;
                  nex_state = load_4;
                end
            end

	load_4:			// 5
            begin
              if (mac_tag)
                begin
                  n_tag = 1;
                  nn_tag = 1;
                  nex_state = idle;
                end
              else
                begin
                  nex_state = last_detect;
                end
            end

	last_detect:		// 6
            begin
              if (mac_tag)
                begin
		  n_tag = 1;
                  nex_state = wait_req_stat_1;
		end
	      else
		  nex_state = wait_req;
	    end

	wait_req:		// 7
            begin
              if (~ipp_enable)
		  nex_state = wait_req;
	      else if (fifo_rdy_4wr && mac_ipp_req)
                begin
		  ipp_ack = 1;
                  nex_state = load_1;
		end
	      else
                  nex_state = wait_req;
	    end

	wait_req_stat_1:	// 8
            begin
              if (~ipp_enable)
                  nex_state = wait_req_stat_1;
              else if (fifo_rdy_4wr && mac_ipp_req)
                begin
                  ipp_ack = 1;
                  nex_state = load_stat;
                end
              else
                  nex_state = wait_req_stat_1;
	    end

	load_stat:		// 9
            begin
		  nn_tag = 1;
		  nex_state = bubble_mac;
	    end

/* This state only exists because there is a bug in the big mac which no one
 ** can fix. The MAC continues to assert request a cycle after the ack has been
 ** asserted and deasserted. However, it does not want to transfer more data. 
 ** This bubble exists in order to ignore this extraneous request.
  */
	bubble_mac:		// A
	  if (tag_err_mac)
	    begin
	      	  set_tag_err_mac = 1;
	      	  nex_state = error;
	    end
	  else
	      	  nex_state = idle;

	error:			// B
	      	  nex_state = error;

/*geo*/ default:  nex_state = idle;

      endcase
  end // end of comb part

// Seq part
always @ (posedge clk)
   if (reset)
      cur_state <= 4'b0;
   else
      cur_state <= nex_state;

endmodule // end of mac_ack_fsm module


/**********************************************************************
*  phase_sm0: Use this state machine to count phases after packing data.
              and generate the load_fifo for xmac
**********************************************************************/
module phase_sm0 (clk, reset, valid, eop, phase_state, load_fifo, swap);

input           clk;
input           reset;
input           valid;
input   [1:0]   eop;
output  [2:0]   phase_state;
output          load_fifo;
output		swap;

reg     [2:0]   phase_state;
reg     [2:0]   nx_phase_state;
reg             load_fifo;
reg		swap;

parameter       NO_ACK          = 3'h0;
parameter       WAIT_2ND_TAG    = 3'h1;
parameter       WAIT_2ND_ACK    = 3'h2;
parameter       LAST_TAG        = 3'h3;
parameter       STATUS          = 3'h4;
parameter       ERROR           = 3'h5;

// Comb part
always @ (phase_state or valid or eop)
  begin
    load_fifo = 1'b0;
    swap = 1'b0;
    nx_phase_state = 3'b0;

      case (phase_state) // synopsys parallel_case full_case
        NO_ACK:                                         // 3'h0
          case (valid)
            1'b0:     nx_phase_state = phase_state;     // stay
            1'b1: begin
                    if (eop == 2'b00)
                      nx_phase_state = WAIT_2ND_ACK;    // 3'h2
                    else if (eop == 2'b10)
                      nx_phase_state = WAIT_2ND_TAG;    // 3'h1
                    else
                      nx_phase_state = ERROR;
//                    $display("Error: wrong state at NO_ACK of phase_sm at simtime = %d", $stime);
                  end
          endcase

        WAIT_2ND_TAG:                                   // 3'h1
          if (eop == 2'b01)
            begin
              load_fifo = 1'b1;
              nx_phase_state = NO_ACK;                  // 3'h0
            end
          else if ((valid) && (eop == 2'b11))
            begin
              load_fifo = 1'b1;
              nx_phase_state = NO_ACK;                  // 3'h0
            end
          else
            nx_phase_state = ERROR;
//          $display("Error: wrong state at WAIT_2ND_TAG of phase_sm at simtime= %d", $stime);

        WAIT_2ND_ACK:                                   // 3'h2
          case (valid)
            1'b0:     nx_phase_state = phase_state;     // stay
            1'b1: begin
                    load_fifo = 1'b1;

                    if (eop == 2'b10)
                      nx_phase_state = LAST_TAG;        // 3'h3
                    else if (eop == 2'b00)
                      nx_phase_state = NO_ACK;          // 3'h0
                    else
                      nx_phase_state = ERROR;
//                    $display("Error: wrong state at WAIT_2ND_ACK of phase_sm at simtime = %d", $stime);
                  end
          endcase

        LAST_TAG:                                       // 3'h3
          case (valid)
            1'b0: begin
                    if (eop == 2'b01)
                      nx_phase_state = NO_ACK;          // 3'h0
                    else
                      nx_phase_state = phase_state;     // stay
                  end
            1'b1: begin
                    if (eop == 2'b11)
		      begin
			swap = 1'b1;
                        nx_phase_state = STATUS;          // 3'h4
		      end
                    else
                      nx_phase_state = ERROR;
//                    $display("Error: wrong state at LAST_TAG of phase_sm at simtime = %d", $stime);
                  end
          endcase

        STATUS:                                         // 3'h4
          begin
            load_fifo = 1'b1;
            nx_phase_state = NO_ACK;                  	// 3'h0
          end

        ERROR:                                          // 3'h5
          begin
//          $display("E-rror: wrong state at phase_sm at simtime = %d", $stime);
            nx_phase_state = ERROR;
          end

/*geo*/ default: nx_phase_state = NO_ACK;

      endcase   // case(phase_state)
  end   // end of comb part

// Seq part

always @ (posedge clk)
   if (reset)
      phase_state <= 3'b0;
   else
      phase_state <= nx_phase_state;

endmodule // end of phase_sm0 module


/**********************************************************************
*  phase_sm: Use this state machine to count phases after packing data.
	     and generate the load_fifo for bmac
**********************************************************************/
module phase_sm (clk, reset, valid, eop, phase_state, load_fifo);

input 		clk;
input 		reset;
input  		valid;
input	[1:0]	eop;
output	[2:0]	phase_state;
output		load_fifo;

reg	[2:0]	phase_state;
reg     [2:0]	nx_phase_state;
reg		load_fifo;

parameter  	NO_ACK  	= 3'h0;
parameter  	WAIT_2ND_TAG	= 3'h1;
parameter  	WAIT_2ND_ACK	= 3'h2;
parameter	LAST_TAG	= 3'h3;
parameter	STATUS		= 3'h4;
parameter	ERROR 		= 3'h5;

// Comb part
always @ (phase_state or valid or eop)
  begin
    load_fifo = 1'b0;
    nx_phase_state = 0;

      case (phase_state) // synopsys parallel_case full_case
        NO_ACK:						// 3'h0
          case (valid)
            1'b0:     nx_phase_state = phase_state; 	// stay
            1'b1: begin
		    if (eop == 2'b00)
		      nx_phase_state = WAIT_2ND_ACK;	// 3'h2
		    else if (eop == 2'b10)
                      nx_phase_state = WAIT_2ND_TAG;	// 3'h1
		    else
		      nx_phase_state = ERROR;
//		      $display("Error: wrong state at NO_ACK of phase_sm at simtime = %d", $stime);
                  end
          endcase

        WAIT_2ND_TAG:					// 3'h1
	  if (eop == 2'b01)
	    begin
	      load_fifo = 1'b1;
	      nx_phase_state = NO_ACK;			// 3'h0
	    end
	  else if ((valid) && (eop == 2'b11))
            begin
              load_fifo = 1'b1;
              nx_phase_state = NO_ACK;                  // 3'h0
            end
	  else
	    nx_phase_state = ERROR;
//	    $display("Error: wrong state at WAIT_2ND_TAG of phase_sm at simtime = %d", $stime);

	WAIT_2ND_ACK:					// 3'h2
          case (valid)
            1'b0:     nx_phase_state = phase_state;     // stay
            1'b1: begin
		    load_fifo = 1'b1;

                    if (eop == 2'b10)
		      nx_phase_state = LAST_TAG;	// 3'h3
		    else if (eop == 2'b00)
                      nx_phase_state = NO_ACK;     	// 3'h0
		    else
		      nx_phase_state = ERROR;
//		      $display("Error: wrong state at WAIT_2ND_ACK of phase_sm at simtime = %d", $stime);
		  end
          endcase

	LAST_TAG:					// 3'h3
          case (valid)
            1'b0: begin
		    if (eop == 2'b01)
		      nx_phase_state = NO_ACK;		// 3'h0
		    else
		      nx_phase_state = phase_state;     // stay
		  end
            1'b1: begin
		    if (eop == 2'b11)
		      nx_phase_state = STATUS;		// 3'h4
		    else
		      nx_phase_state = ERROR;
//		      $display("Error: wrong state at LAST_TAG of phase_sm at simtime = %d", $stime);
		  end
	  endcase

	STATUS:						// 3'h4
	  if (eop == 2'b01)
	    begin
	      load_fifo = 1'b1;
	      nx_phase_state = NO_ACK;          	// 3'h0
	    end
	  else
	    nx_phase_state = ERROR;
//	    $display("Error: wrong state at STATUS of phase_sm at simtime = %d", $stime);

	ERROR:						// 3'h5
	  begin
//	    $display("E-rror: wrong state at phase_sm at simtime = %d", $stime);
	    nx_phase_state = ERROR;
	  end

/*geo*/ default: nx_phase_state = NO_ACK;

      endcase 	// case(phase_state)
  end 	// end of comb part

// Seq part

always @ (posedge clk)
   if (reset)
      phase_state <= 3'b0;
   else
      phase_state <= nx_phase_state;

endmodule // end of phase_sm module


/**********************************************************************
*  phase_sm3: Use this state machine to generate the wr_1st_data
**********************************************************************/
module phase_sm3 (clk, reset, valid, eop, phase_state, wr_1st_data);

input           clk;
input           reset;
input           valid;
input           eop;
output          phase_state;
output          wr_1st_data;

reg             phase_state;
reg             nx_phase_state;
reg             wr_1st_data;

parameter       IDLE            = 1'b0;
parameter       WAIT4TAG        = 1'b1;

// Comb part
always @ (phase_state or valid or eop )
  begin
    wr_1st_data  = 0;
    nx_phase_state  = 0;

      case (phase_state) // synopsys parallel_case full_case
         IDLE:
            casex (valid)
               1'b0:     nx_phase_state  = phase_state; // stay
               1'b1:  begin
                         nx_phase_state  = WAIT4TAG;
                         wr_1st_data  = 1;
                      end
            endcase

         WAIT4TAG:
            casex (eop)
               1'b0:    nx_phase_state   = phase_state; // stay
               1'b1:    nx_phase_state   = IDLE;
            endcase

      endcase // case(phase_state)
   end // end of comb part

// Seq part

always @ (posedge clk)
   if (reset)
      phase_state <= 1'b0;
   else
      phase_state <= nx_phase_state;

endmodule // end of phase_sm3 module


//////////////////////////////////////////////////////////////////
`ifdef NEP_SIM_MAC_IPP_PKT_CNT
module ipp_tag_acked (
                      filtered_tag,
                      mac_ipp_ctrl,
                      xmac_mode,
                      xmac_ipp_ack,
                      ipp_mac_ack,
                      reset,
                      clk,
                      tag2_acked,
                      mac_ipp_pkt_cnt
                     );

input           filtered_tag;
input           mac_ipp_ctrl;
input           xmac_mode;
input           xmac_ipp_ack;
input           ipp_mac_ack;
input           reset;
input           clk;
output          tag2_acked;
output   [15:0] mac_ipp_pkt_cnt;

wire            tag2_acked;
reg      [15:0] mac_ipp_pkt_cnt;

wire     [15:0] mac_ipp_pkt_cnt_nxt;

reg       [1:0] tag_acked_cnt;
reg       [1:0] tag_acked_cnt_nxt;

reg             inc_mac_ipp_pkt_cnt;
reg             inc_mac_ipp_pkt_cnt_nxt;

wire            macipp_ack = xmac_mode ? xmac_ipp_ack : ipp_mac_ack;

  always @ (filtered_tag    or
            xmac_mode       or
            tag_acked_cnt) begin

    tag_acked_cnt_nxt        = 2'h0;
    inc_mac_ipp_pkt_cnt_nxt  = 1'h0;

    case (tag_acked_cnt) // synopsys parallel_case full_case

      2'h0: begin
              if (filtered_tag) begin
                inc_mac_ipp_pkt_cnt_nxt = 1'h1;
                tag_acked_cnt_nxt = xmac_mode ? 2'h2 : 2'h1;
              end
              else begin
                tag_acked_cnt_nxt = tag_acked_cnt;
              end
            end

      2'h1: begin
              if (filtered_tag) begin
                tag_acked_cnt_nxt = 2'h2;
              end
              else begin
                tag_acked_cnt_nxt = tag_acked_cnt;
              end
            end

      2'h2: begin
                 tag_acked_cnt_nxt = 2'h0;
            end

      default:   tag_acked_cnt_nxt = 2'h0;

    endcase

  end

  assign tag2_acked          = tag_acked_cnt_nxt[1];
  assign mac_ipp_pkt_cnt_nxt = mac_ipp_pkt_cnt[15:0] + {15'h0,inc_mac_ipp_pkt_cnt};

  always @(posedge clk) begin
    if (reset || mac_ipp_ctrl && macipp_ack) begin
      tag_acked_cnt     <= #1 2'h0;
    end
    else begin
      tag_acked_cnt     <= #1 tag_acked_cnt_nxt[1:0];
    end
  end

  always @(posedge clk) begin
    if (reset) begin
      inc_mac_ipp_pkt_cnt   <= #1 1'h0;
      mac_ipp_pkt_cnt       <= #1 16'h0;
    end
    else begin
      inc_mac_ipp_pkt_cnt   <= #1 inc_mac_ipp_pkt_cnt_nxt;
      mac_ipp_pkt_cnt       <= #1 mac_ipp_pkt_cnt_nxt[15:0];
    end
  end

// synopsys translate_on

endmodule
`endif
