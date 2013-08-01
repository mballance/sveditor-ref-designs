// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_xtb.v
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

module niu_smx_xtb(
/*AUTOARG*/
   // Outputs
   rdreq_rst_xtb_wr, wreq_rst_xtb_wr, xtb_rdata, xtb_rd_ack, 
   xtb_rdata_err, tid_valid_set, tid_valid_set_addr, tid_newarr_set, 
   tid_newarr_set_addr, tohdl_xtb_rdata, tohdl_xtb_rd_ack, 
   tohdl_xtb_rdata_err, mb0_smx_table_64x146_scan_out, 
   niu_mb0_smx_table_data_out, 
   // Inputs
   clk, iol2clk, reset_l, rdreq_xtb_wr, rdreq_xtb_waddr, rdreq_xtb_wdata, 
   wreq_xtb_wr, wreq_xtb_waddr, wreq_xtb_wdata, xtb_rd, xtb_raddr, 
   xtb_rcvfile_update, xtb_rcvfile_update_addr, tohdl_xtb_rd, 
   tohdl_xtb_raddr, tcu_aclk, tcu_bclk, 
   tcu_se_scancollar_in,
   tcu_array_wr_inhibit, mb0_smx_table_64x146_scan_in, 
   niu_mb0_smx_table_64x146_wdata, niu_mb0_smx_table_64x146_rd_addr, 
   niu_mb0_smx_table_64x146_wr_addr, niu_mb0_smx_table_64x146_wr_en, 
   niu_mb0_smx_table_64x146_rd_en, niu_mb0_run, 
   pio_xtb_err_inject_cfg
   );

input		clk;
input           iol2clk;
input		reset_l;

// rdreq if
input 		rdreq_xtb_wr;
input [5:0] 	rdreq_xtb_waddr;
input [127:0] 	rdreq_xtb_wdata;
output		rdreq_rst_xtb_wr;

// wreq if
input 		wreq_xtb_wr;
input [5:0] 	wreq_xtb_waddr;
input [127:0] 	wreq_xtb_wdata;
output 		wreq_rst_xtb_wr;

// resp dmc sm if
input 		xtb_rd;
input [5:0] 	xtb_raddr;
output [128:0] 	xtb_rdata; // {rcvcnt, xtb_rdata}
output		xtb_rd_ack; // rst client rd signal
output		xtb_rdata_err;   	

input		xtb_rcvfile_update;
input [5:0] 	xtb_rcvfile_update_addr;


// status if
output tid_valid_set;   // set by req_cmd
output [5:0] tid_valid_set_addr;
output tid_newarr_set;   // set by req_cmd
output [5:0] tid_newarr_set_addr;



// timeout handler; arb with resp dmc 
input 		tohdl_xtb_rd;
input [5:0] 	tohdl_xtb_raddr;
output [118:0] 	tohdl_xtb_rdata; // {xtb_rdata}; rcvcnt not part of 
output		tohdl_xtb_rd_ack; // rst client rd signal
output		tohdl_xtb_rdata_err;   	
		// client must rst rd in next cycle 

// mbist if
input                          tcu_aclk;
input                          tcu_bclk;
input                          tcu_se_scancollar_in;
input                          tcu_array_wr_inhibit;
input                          mb0_smx_table_64x146_scan_in;
output                         mb0_smx_table_64x146_scan_out;

input    [7:0]   niu_mb0_smx_table_64x146_wdata;
input    [5:0]   niu_mb0_smx_table_64x146_rd_addr;
input    [5:0]   niu_mb0_smx_table_64x146_wr_addr;
input            niu_mb0_smx_table_64x146_wr_en;
input            niu_mb0_smx_table_64x146_rd_en;
input            niu_mb0_run;

output [145:0]	niu_mb0_smx_table_data_out;

// pio i/f
input [2:0]  pio_xtb_err_inject_cfg; // [0] - one pkt
				     //	[1] - alt pkt
			  	     // [2] - all pkt

// wire [4:0] rdreq_xtb_raddr= xtb_raddr[4:0];
// wire [4:0] wreq_xtb_raddr= xtb_raddr[4:0];

// wire rdreq_xtb_rd= xtb_rd;
// wire wreq_xtb_rd= xtb_rd;

// wire [143:0] wreq_xtb_rdata;  
// wire [143:0] rdreq_xtb_rdata;  

wire [145:0] sel_xtb_rdata;

wire [145:0]	niu_mb0_smx_table_data_out= sel_xtb_rdata;


// wire [143:0] sel_xtb_rdata;

// wire [143:0] sel_xtb_rdata= (xtb_raddr[5])? wreq_xtb_rdata : rdreq_xtb_rdata;  

// or arb rd/wr, rd steal wr cycles
// during wr writes 4 data  ???
// if use one ram 144bx64 ??

reg rdreq_rst_xtb_wr_n;
wire rdreq_rst_xtb_wr= rdreq_rst_xtb_wr_n;
reg wreq_rst_xtb_wr_n;
wire wreq_rst_xtb_wr= wreq_rst_xtb_wr_n;

reg first_choice;
reg first_choice_n;
always @(posedge clk) begin
  if(!reset_l) begin
    first_choice<= `SMX_PD 1'b0;  // 0-wr, 1- rd
  end
  else begin
    first_choice<= `SMX_PD first_choice_n;  // 0-wr, 1- rd
  end
end

always @(/*AUTOSENSE*/first_choice or rdreq_xtb_wr or wreq_xtb_wr) begin
  first_choice_n= first_choice;
  rdreq_rst_xtb_wr_n= 1'b0;
  wreq_rst_xtb_wr_n= 1'b0;
  case({first_choice, wreq_xtb_wr, rdreq_xtb_wr})
    3'b000: begin
  	      first_choice_n= first_choice;
  	      rdreq_rst_xtb_wr_n= 1'b0;
  	      wreq_rst_xtb_wr_n= 1'b0;
	    end 
    3'b001: begin // rd
  	      first_choice_n= 1'b0; // wr first nxt
  	      rdreq_rst_xtb_wr_n= 1'b1;
  	      wreq_rst_xtb_wr_n= 1'b0;
	    end 
    3'b010: begin // wr
  	      first_choice_n= 1'b1; // rd first nxt
  	      rdreq_rst_xtb_wr_n= 1'b0;
  	      wreq_rst_xtb_wr_n= 1'b1;
	    end 
    3'b011: begin // wr, rd; wr first
  	      first_choice_n= 1'b1; // rd first nxt
  	      rdreq_rst_xtb_wr_n= 1'b0;
  	      wreq_rst_xtb_wr_n= 1'b1;
	    end 
    3'b100: begin //
  	      first_choice_n= first_choice;
  	      rdreq_rst_xtb_wr_n= 1'b0;
  	      wreq_rst_xtb_wr_n= 1'b0;
	    end 
    3'b101: begin // rd
  	      first_choice_n= 1'b0; // wr first nxt
  	      rdreq_rst_xtb_wr_n= 1'b1;
  	      wreq_rst_xtb_wr_n= 1'b0;
	    end 
    3'b110: begin // wr
  	      first_choice_n= 1'b1; // rd first nxt
  	      rdreq_rst_xtb_wr_n= 1'b0;
  	      wreq_rst_xtb_wr_n= 1'b1;
	    end 
    3'b111: begin // rd, wr; rd first
  	      first_choice_n= 1'b0; // wr first nxt
  	      rdreq_rst_xtb_wr_n= 1'b1;
  	      wreq_rst_xtb_wr_n= 1'b0;
	    end 
   endcase
end

wire xtb_rd_ack_n;
wire tohdl_xtb_rd_ack_n;
wire [5:0] sel_xtb_raddr;
reg xtb_busy;
reg xtb_rd_ack_r2;  // ram data avail
reg xtb_rd_ack_r3;  // extra stage for err check
reg xtb_rd_ack;	    
reg tohdl_xtb_rd_ack_r2;
reg tohdl_xtb_rd_ack_r3;
reg tohdl_xtb_rd_ack;
reg [145:0] xtb_rdata_r3;
reg [145:0] xtb_rdata_r4;

// move xtb_raddr_r1 one cycle earlier
//reg xtb_rd_ack_r1; // ram input
//reg tohdl_xtb_rd_ack_r1;
//reg [5:0] sel_xtb_raddr_r1; // ram input

wire 		xtb_rd_ack_r1= xtb_rd_ack_n; 
wire 		tohdl_xtb_rd_ack_r1= tohdl_xtb_rd_ack_n;
wire [5:0] 	sel_xtb_raddr_r1= sel_xtb_raddr;

wire xtb_rd_n= (xtb_rd_ack_r1 | tohdl_xtb_rd_ack_r1); 

reg xtb_rdata_perr;
wire xtb_rdata_err= xtb_rdata_perr;	
reg tohdl_xtb_rdata_perr; 
wire tohdl_xtb_rdata_err= tohdl_xtb_rdata_perr; 
reg [145:0] tohdl_xtb_rdata_r4;
wire [118:0] tohdl_xtb_rdata= tohdl_xtb_rdata_r4[118:0]; 

niu_smx_arb_2c #(6) arb_xtb_rd(
	.clk		(clk),
	.reset_l	(reset_l),
	.req_a		(xtb_rd & ~xtb_busy), 
	.req_b		(tohdl_xtb_rd & ~xtb_busy), 
	.muxin_a	(xtb_raddr [5:0]), 
	.muxin_b	(tohdl_xtb_raddr [5:0]),
	.ack_a		(xtb_rd_ack_n), 
	.ack_b		(tohdl_xtb_rd_ack_n), 
	.selout		(sel_xtb_raddr [5:0])
	);

always @(posedge clk) begin
  if(!reset_l) begin
    xtb_busy<= `SMX_PD 1'b0;
  end
  else begin
    if(xtb_rd_ack_n | tohdl_xtb_rd_ack_n) xtb_busy<= `SMX_PD 1'b1;
    else if (xtb_rd_ack | tohdl_xtb_rd_ack) xtb_busy<= `SMX_PD 1'b0;
  end
end

wire [5:0] sel_xtb_waddr= (rdreq_rst_xtb_wr_n)?
			rdreq_xtb_waddr : wreq_xtb_waddr; 
wire [127:0] sel_xtb_wdata= (rdreq_rst_xtb_wr_n)?
			rdreq_xtb_wdata : wreq_xtb_wdata; 

wire tid_valid_set= rdreq_rst_xtb_wr_n|wreq_rst_xtb_wr_n;
wire [5:0] tid_valid_set_addr= sel_xtb_waddr;
wire tid_newarr_set= rdreq_rst_xtb_wr_n|wreq_rst_xtb_wr_n;
wire [5:0] tid_newarr_set_addr= sel_xtb_waddr;


wire [7:0] xtb_parity_wdata_n;
niu_smx_gen_siudp gen_xtb_par_wdata(// gen parity per N2 ras   
		.data	(sel_xtb_wdata [127:0]),
		.parity (xtb_parity_wdata_n [7:0])
	);

wire [145:0] concat_niu_mb0_smx_table_64x146_wdata={
	niu_mb0_smx_table_64x146_wdata[1:0],
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata,
	niu_mb0_smx_table_64x146_wdata
	}; 

niu_ram_64_146 xtb_ram(
          .tcu_aclk		(tcu_aclk),
          .tcu_bclk		(tcu_bclk),
          .tcu_se_scancollar_in	  (tcu_se_scancollar_in),
          .tcu_array_wr_inhibit  (tcu_array_wr_inhibit),
          .scan_in	(mb0_smx_table_64x146_scan_in),
          .scan_out 	(mb0_smx_table_64x146_scan_out),
          .mbi_wdata    (concat_niu_mb0_smx_table_64x146_wdata [145:0]),
          .mbi_rd_adr   (niu_mb0_smx_table_64x146_rd_addr [5:0]),
          .mbi_wr_adr   (niu_mb0_smx_table_64x146_wr_addr [5:0]),
          .mbi_wr_en 	(niu_mb0_smx_table_64x146_wr_en),
          .mbi_rd_en	(niu_mb0_smx_table_64x146_rd_en),
          .mbi_run	(niu_mb0_run),
          .clk	(iol2clk),
          .wt_enable	(rdreq_xtb_wr | wreq_xtb_wr),
          .addr_wt	(sel_xtb_waddr[5:0]),
          .data_inp	({10'h0, xtb_parity_wdata_n, sel_xtb_wdata[127:0]}),
          .cs_rd	(xtb_rd_n),
          .addr_rd	(sel_xtb_raddr_r1[5:0]),
          .data_out	(sel_xtb_rdata[145:0])
	);

wire  err_inject_enable_n;
wire [127:0] xtb_rdata_r3_n= (err_inject_enable_n)? 
				{xtb_rdata_r3[127:1], ~xtb_rdata_r3[0]}:
				xtb_rdata_r3[127:0];
 

wire [7:0] xtb_parity_rdata_n;
niu_smx_gen_siudp gen_xtb_par_rdata(// gen parity per N2 ras   
		.data	(xtb_rdata_r3_n [127:0]),
		.parity (xtb_parity_rdata_n [7:0])
	);
wire xtb_rdata_perr_n= |(xtb_parity_rdata_n ^ xtb_rdata_r3[135:128]); 

// move xtb_rd_r1 one cycle earlier 
//    xtb_rd_ack_r1<= `SMX_PD 1'b0;
//    tohdl_xtb_rd_ack_r1<= `SMX_PD 1'b0;
//    xtb_rd_ack_r1<= `SMX_PD xtb_rd_ack_n ;
//    tohdl_xtb_rd_ack_r1<= `SMX_PD tohdl_xtb_rd_ack_n;

always @(posedge clk) begin
  if(!reset_l) begin
    xtb_rd_ack_r2<= `SMX_PD 1'b0;
    xtb_rd_ack_r3<= `SMX_PD 1'b0;
    xtb_rd_ack<= `SMX_PD 1'b0;
    tohdl_xtb_rd_ack_r2<= `SMX_PD 1'b0;
    tohdl_xtb_rd_ack_r3<= `SMX_PD 1'b0;
    tohdl_xtb_rd_ack<= `SMX_PD 1'b0;
  end
  else begin 
    xtb_rd_ack_r2<= `SMX_PD xtb_rd_ack_r1 ;  // rdata avail at r2
    xtb_rd_ack_r3<= `SMX_PD xtb_rd_ack_r2 ;  // extra cycle for ecc
    xtb_rd_ack<= `SMX_PD xtb_rd_ack_r3;  
    tohdl_xtb_rd_ack_r2<= `SMX_PD tohdl_xtb_rd_ack_r1;
    tohdl_xtb_rd_ack_r3<= `SMX_PD tohdl_xtb_rd_ack_r2;
    tohdl_xtb_rd_ack<= `SMX_PD tohdl_xtb_rd_ack_r3;
  end
end 
always @(posedge clk) begin
//  if(xtb_rd_ack_n | tohdl_xtb_rd_ack_n) sel_xtb_raddr_r1<= `SMX_PD sel_xtb_raddr;

  xtb_rdata_r3<= `SMX_PD sel_xtb_rdata;

	// wanna keep data constant after ack
  if(xtb_rd_ack_r3) begin
    xtb_rdata_r4<= `SMX_PD xtb_rdata_r3;
    xtb_rdata_perr<= `SMX_PD xtb_rdata_perr_n;
  end
  if(tohdl_xtb_rd_ack_r3) begin
    tohdl_xtb_rdata_r4<= `SMX_PD xtb_rdata_r3;
    tohdl_xtb_rdata_perr<= `SMX_PD xtb_rdata_perr_n;
  end
end

/*
register implemented
niu_smx_regfl #(144,6) xtb_regfl(
  	.clk		(clk),
  	.reset_l 	(reset_l),
  	.wr		(rdreq_xtb_wr | wreq_xtb_wr),
  	.addr_wr	(sel_xtb_waddr[5:0]),
  	.data_wr	({16'h0, sel_xtb_wdata[127:0]}),
  	.rd		(xtb_rd),
  	.addr_rd	(xtb_raddr[5:0]),
  	.data_rd	(sel_xtb_rdata[143:0])
); 
*/

/*
 not use
niu_smx_regfl #(144,5) xtb_wr_regfl(
  	.clk		(clk),
  	.reset_l	(reset_l),
  	.wr		(wreq_xtb_wr),
  	.addr_wr	(wreq_xtb_waddr[4:0]),
  	.data_wr	({16'h0, wreq_xtb_wdata[127:0]}),
  	.rd		(wreq_xtb_rd),
  	.addr_rd	(wreq_xtb_raddr[4:0]),
  	.data_rd	(wreq_xtb_rdata[143:0])
); 
*/


/*
wire[5:0] xtb_waddr= (wreq_xtb_wr)? {1'b1, wreq_xtb_waddr[4:0]} : 
				 {1'b0, rdreq_xtb_waddr[4:0]};
wire [9:0] rcvfile_rdata;
wire [128:0] xtb_rdata= {rcvfile_rdata[9:0],sel_xtb_rdata[118:0]};
wire xtb_wr= rdreq_xtb_wr | wreq_xtb_wr; 
*/
		// ??? no parity  yet
		// ??? can more bits remove ?
		// ??? rcvfile rdata truncate to 9bits

// make 2 copies; one for rd, one for wr; ???
// might need to add arb if combine both ????

// wire [9:0] rdreq_rcvfile_rdata;
// // // // // // // // wire [9:0] wreq_rcvfile_rdata;
/*
wire [9:0] sel_rcvfile_rdata= (xtb_raddr[5])? 
			wreq_rcvfile_rdata : rdreq_rcvfile_rdata;
*/

wire [9:0] rcvfile_rdata;
wire [128:0] xtb_rdata= {rcvfile_rdata[9:0], xtb_rdata_r4[118:0]};

wire [5:0] rcvfile_raddr_n= (xtb_rcvfile_update)? 
			xtb_rcvfile_update_addr : xtb_raddr;
niu_smx_resp_rcvfile #(10,6) rdreq_resp_rcvfile(
	.clk		(clk),
	.reset_l	(reset_l),
	.rd		(xtb_rd_ack_n), 
	.rd_inc		(xtb_rcvfile_update),
	.raddr		(rcvfile_raddr_n[5:0]),
  	.wr_rst		(rdreq_xtb_wr | wreq_xtb_wr),
  	.waddr		(sel_xtb_waddr[5:0]),
	.rdata		(rcvfile_rdata[9:0]) 
);

/*
niu_smx_resp_rcvfile #(10,5) wreq_resp_rcvfile(
        .clk            (clk),
        .reset_l        (reset_l),
        .rd             (), // nc
        .rd_inc         (xtb_rd),
        .raddr          (xtb_raddr[4:0]),
        .wr_rst         (wreq_xtb_wr),
        .waddr          (wreq_xtb_waddr[4:0]),
        .rdata          (wreq_rcvfile_rdata[9:0])
);
*/

// ??? add xtb_rd arb; rcvfile xtb_rd fix ?????

// error inject
reg one_pkt_flag;
reg alt_pkt_flag;
wire rd_ack_n= xtb_rd_ack_r3 | tohdl_xtb_rd_ack_r3; 
		// mux err-injected data occurs at r3

always @(posedge clk) begin
  if(!reset_l) begin
    one_pkt_flag <= `SMX_PD 1'b0;
    alt_pkt_flag <= `SMX_PD 1'b0;
  end
  else begin
    if(rd_ack_n & ~one_pkt_flag & pio_xtb_err_inject_cfg[0])
      one_pkt_flag <= `SMX_PD 1'b1;  // set one_pkt flag 
    else if (~pio_xtb_err_inject_cfg[0]) one_pkt_flag <=  `SMX_PD 1'b0;
				// reset when cfg one_pkt unset

    if(rd_ack_n & pio_xtb_err_inject_cfg[1]) // alternate each rd
      alt_pkt_flag <= `SMX_PD ~alt_pkt_flag;
   
  end
end


assign err_inject_enable_n= (~one_pkt_flag &  pio_xtb_err_inject_cfg[0]) |
			  (alt_pkt_flag & pio_xtb_err_inject_cfg[1]) |
			  pio_xtb_err_inject_cfg[2];


endmodule


