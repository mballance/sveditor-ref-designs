// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_pio.v
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

module niu_smx_pio(
/*AUTOARG*/
   // Outputs
   reg_timer_cfg, reg_ras_cfg, smx_pio_intr, smx_pio_status, 
   smx_debug_port, pio_xtb_err_inject_cfg, pio_resp_err_inject_cfg, 
   // Inputs
   clk, reset_l, pio_data, pio_smx_clear_intr, pio_smx_ctrl, 
   pio_smx_debug_vector, tohdl_set_intr, tohdl_intr_status, 
   niu_sii_hdr_vld, niu_sii_reqbypass, niu_sii_datareq, sii_niu_oqdq, 
   sii_niu_bqdq, wreq_cmdff_rd, rdreq_cmdff_rd, wreq_dataff_rd, 
   wreq_cmdff_wr, rdreq_cmdff_wr, wreq_dataff_wr, sio_niu_hdr_vld, 
   sio_niu_datareq, niu_sio_dq, resp_cmdff_wr, resp_dataff_wr, 
   resp_cmdff_rd, resp_dataff_rd, meta_dmc_resp_ready, 
   meta_dmc_ack_ready, dmc_meta0_req, meta_dmc1_req_accept, 
   dmc_meta1_req, meta_dmc0_req_accept, meta_dmc0_data_req, 
   dmc_meta0_data_valid, sii_cs, arb_cs, rdreq_cmd_cs, wreq_cmd_cs, 
   wreq_dv_cs, dreq_cs, proc_cs, cmdl_cs, dv_cs
   );


input clk;
input reset_l;

output [31:0] reg_timer_cfg;
output [1:0] reg_ras_cfg; 

// pio blk if
// input pio_ld;
input [31:0] pio_data;
output      smx_pio_intr;   // level signal;
                                // once high stays high until clear by pio
output[31:0]    smx_pio_status;   // status info related to intr
input		pio_smx_clear_intr;  // a pulse          
				// read_only status

input [31:0] pio_smx_ctrl;     // debug select; extra bits
				// reserved within smx in case
				// needed for sth else
input [31:0] pio_smx_debug_vector;  // training vector
output [31:0] smx_debug_port;

	// timout_hdlr i/f
input		tohdl_set_intr;
input [5:0]	tohdl_intr_status;


	// xtb i/f (error inject)
output	[2:0]  pio_xtb_err_inject_cfg; // [0] - one pkt
				       // [1] - alt pkt
			  	       // [2] - all pkt

	// resp_dv i/f (err inject)
output	[2:0]  pio_resp_err_inject_cfg; // [0] - one pkt
				       // [1] - alt pkt
			  	       // [2] - all pkt


	// debug port
input	niu_sii_hdr_vld;
input	niu_sii_reqbypass;
input	niu_sii_datareq;
input	sii_niu_oqdq;
input	sii_niu_bqdq;
input	wreq_cmdff_rd;
input	rdreq_cmdff_rd;
input	wreq_dataff_rd;
input	wreq_cmdff_wr;
input	rdreq_cmdff_wr;
input	wreq_dataff_wr;
input	sio_niu_hdr_vld;
input	sio_niu_datareq;
input	niu_sio_dq;
input	resp_cmdff_wr;
input	resp_dataff_wr;
input	resp_cmdff_rd;
input	resp_dataff_rd;
input	meta_dmc_resp_ready;
input	meta_dmc_ack_ready;
input   dmc_meta0_req;
input	meta_dmc1_req_accept;
input	dmc_meta1_req;
input	meta_dmc0_req_accept;
input	meta_dmc0_data_req;
input	dmc_meta0_data_valid;


input    [1:0]   sii_cs;
input    [1:0]   arb_cs;
input    [2:0]   rdreq_cmd_cs;
input    [2:0]   wreq_cmd_cs;
input    [1:0]   wreq_dv_cs;
input    [2:0]   dreq_cs;
input    [1:0]   proc_cs;
input    [2:0]   cmdl_cs;
input    [2:0]   dv_cs;



// place holder ????
// don't have anything to intr for now
// wire smx_pio_intr= 1'b0;
// wire [31:0] smx_pio_status= 32'h0;


// timer config related
reg [31:0]  reg_smx_cfg;
wire [31:0] reg_timer_cfg= reg_smx_cfg;
wire [1:0] reg_ras_cfg= reg_smx_cfg[31:30];


// debug port related
reg [31:0]  pio_smx_debug_vector_r;
reg [2:0] debug_sel;
reg [31:0] smx_debug_port, smx_debug_port_n;
reg [31:0] int_debug_port;

// intr related
reg smx_pio_intr;
reg [5:0] pio_status_tohdl;
reg [25:0] int_status;
wire [31:0] smx_pio_status= {int_status, pio_status_tohdl};

// error inject related	
reg [2:0]  pio_xtb_err_inject_cfg; 
reg [2:0]  pio_resp_err_inject_cfg; 

always @(posedge clk)  begin
  if(!reset_l) 
    smx_pio_intr<= `SMX_PD 1'b0;
  else
    if(tohdl_set_intr) smx_pio_intr<= `SMX_PD 1'b1;
    else if (pio_smx_clear_intr)  smx_pio_intr<= `SMX_PD 1'b0;	
end

always @(posedge clk)  begin
  if(!reset_l) 
    pio_status_tohdl<= `SMX_PD 6'h0;
  else
    if(tohdl_set_intr) pio_status_tohdl<= `SMX_PD tohdl_intr_status;
    else if (pio_smx_clear_intr)  pio_status_tohdl<= `SMX_PD 6'h0;
end

always @(posedge clk)  begin
  if(!reset_l) 
    int_status<= `SMX_PD 26'h0;
  else
    int_status<= `SMX_PD {3'h0, 
			sii_cs, arb_cs,
			rdreq_cmd_cs, wreq_cmd_cs,
			wreq_dv_cs, dreq_cs,
			proc_cs, cmdl_cs, dv_cs};
end



always @(posedge clk)  begin
  if(!reset_l) 
    reg_smx_cfg<= `SMX_PD {32'hFFFFFFFF}; // cc 051905 to default enable
  else 			// disable ras for now ????
    // if(pio_ld)	// enable when verif env chg to support ???
    reg_smx_cfg<= `SMX_PD pio_data[31:0]; 
end

always @(posedge clk)  begin
  smx_debug_port<= `SMX_PD smx_debug_port_n;
  pio_smx_debug_vector_r<=  `SMX_PD pio_smx_debug_vector;
  debug_sel<= `SMX_PD  pio_smx_ctrl[2:0];
end

always @(posedge clk)  begin
  if(reset_l) begin
    pio_xtb_err_inject_cfg<= `SMX_PD  3'h0;
    pio_resp_err_inject_cfg<= `SMX_PD  3'h0;
  end
  else begin
    pio_xtb_err_inject_cfg<= `SMX_PD  pio_smx_ctrl[6:4];
    pio_resp_err_inject_cfg<= `SMX_PD  pio_smx_ctrl[10:8];
  end
end

always @(posedge clk)  begin
  int_debug_port<=  `SMX_PD { 6'h0,
	niu_sii_hdr_vld,
	niu_sii_reqbypass,
	niu_sii_datareq,
	sii_niu_oqdq,
	sii_niu_bqdq,
	wreq_cmdff_rd,
	rdreq_cmdff_rd,
	wreq_dataff_rd,
	wreq_cmdff_wr,
	rdreq_cmdff_wr,
	wreq_dataff_wr,
	sio_niu_hdr_vld,
	sio_niu_datareq,
	niu_sio_dq,
	resp_cmdff_wr,
	resp_dataff_wr,
	resp_cmdff_rd,
	resp_dataff_rd,
	meta_dmc_resp_ready,
	meta_dmc_ack_ready,
   	dmc_meta0_req,
	meta_dmc1_req_accept,
	dmc_meta1_req,
	meta_dmc0_req_accept,
	meta_dmc0_data_req,
	dmc_meta0_data_valid};

end


/*AUTO_CONSTANT (`META_ARB__TRAINING_SET `MEGA_ARB__TRAINING_LOAD)*/

always @ (/*AUTOSENSE*/ debug_sel or int_debug_port or pio_smx_debug_vector_r
	  or smx_debug_port) begin
  case(debug_sel) 
    `SMX_TRAINING_SET: smx_debug_port_n= ~smx_debug_port;
    `SMX_TRAINING_LOAD: smx_debug_port_n= pio_smx_debug_vector_r;
    default: smx_debug_port_n= int_debug_port;
  endcase 
end

endmodule







