// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_asi_ctl.v
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
`define BUS_CTL 64
`define BUS_VLD 63
`define BUS_ACK 62
`define BUS_RD  59
`define BUS_TID_END 58
`define BUS_TID_ST 56

`define IC_ASI  8'h66
`define TG_ASI  8'h67
`define ITD_ASI 8'h55
`define ITT_ASI 8'h56
`define ITH_ASI 8'h53
`define ASI 2'b00
`define IT_VA 48'h000000000FF8

module  ifu_ftu_asi_ctl (
  tcu_scan_en, 
  l2clk, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  scan_in, 
  rng_in_cdbus, 
  ic_rd_data, 
  tg_rd_data, 
  it_rd_data, 
  agc_vl_data_c, 
  ftp_asi_ic_rd_done, 
  ftp_asi_ic_wr_done, 
  ftp_asi_tg_rd_done, 
  ftp_asi_tg_wr_done, 
  ftp_asi_it_rd_done, 
  asi_wr_data, 
  asi_ic_rd_req, 
  asi_ic_wr_req, 
  asi_tg_rd_req, 
  asi_tg_wr_req, 
  asi_itd_rd_req, 
  asi_itt_rd_req, 
  asi_ith_det_req, 
  asi_wr_request, 
  asi_rd_request, 
  scan_out, 
  asi_addr_bf, 
  asi_way_bf, 
  asi_tid, 
  ifu_rngl_cdbus);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire asi_rd_data_rdy;
wire asi_it_rd_done_p;
wire [63:0] asi_data_out;
wire asi_wr_done_in;
wire l1clk;
wire asi_it_rd_done_reg_scanin;
wire asi_it_rd_done_reg_scanout;
wire rng_stg1_data_scanin;
wire rng_stg1_data_scanout;
wire [63:0] data_1f;
wire ic_data_parity;
wire ic_par_err_inj;
wire tg_data_parity;
wire tg_par_err_inj;
wire [63:0] data_2f;
wire [1:0] vl_bits;
wire [32:0] asi_wr_data_mux;
wire asi_ic_wr_req_2f;
wire [32:0] asi_wr_data_in;
wire asi_wr_request_2f;
wire [32:0] asi_wr_data_hold;
wire wr_data_hold_scanin;
wire wr_data_hold_scanout;
wire rng_stg1_ctl_scanin;
wire rng_stg1_ctl_scanout;
wire ctl_1f;
wire asi_ic_wr_req_in;
wire asi_tg_wr_req_in;
wire wr_req_ff_scanin;
wire wr_req_ff_scanout;
wire hole_det_1;
wire indet_acc_1;
wire rng_stg2_data_scanin;
wire rng_stg2_data_scanout;
wire rng_stg2_ctl_scanin;
wire rng_stg2_ctl_scanout;
wire ctl_2f;
wire rng_stg2_decctl_scanin;
wire rng_stg2_decctl_scanout;
wire hole_det_2f;
wire indet_acc_2f;
wire next_indet_return_rd_first;
wire indet_rd_rdy_f;
wire indet_return_rd_first;
wire indet_rd_done_2;
wire indet_wr_rdy_f;
wire indet_wr_done_2;
wire rng_stg3_decctl_scanin;
wire rng_stg3_decctl_scanout;
wire indet_rd_done_3f;
wire bypass_data_3;
wire [63:0] data_2;
wire [63:0] indet_data_f;
wire valid_2;
wire [2:0] tid_2;
wire [2:0] indet_wr_tid_f;
wire [2:0] indet_rd_tid_f;
wire rdwr_2;
wire ack_2;
wire [7:0] asi_err_2;
wire [63:0] ctl_2;
wire [63:0] rng_data_out_mux;
wire rng_stg3_scanin;
wire rng_stg3_scanout;
wire rng_stg3_ctl_scanin;
wire rng_stg3_ctl_scanout;
wire indet_rd_data_scanin;
wire indet_rd_data_scanout;
wire [2:0] next_indet_wr_tid;
wire pr_tid_wr_ret_scanin;
wire pr_tid_wr_ret_scanout;
wire [2:0] next_indet_rd_tid;
wire pr_tid_rd_ret_scanin;
wire pr_tid_rd_ret_scanout;
wire [39:3] next_rd_addr_bf;
wire [39:3] asi_rd_addr_bf;
wire address_rd_reg_scanin;
wire address_rd_reg_scanout;
wire [39:3] next_wr_addr_bf;
wire [39:3] asi_wr_addr_bf;
wire address_wr_reg_scanin;
wire address_wr_reg_scanout;
wire [2:0] next_rd_way_bf;
wire [2:0] asi_rd_way_bf;
wire rd_way_bf_reg_scanin;
wire rd_way_bf_reg_scanout;
wire [2:0] next_wr_way_bf;
wire [2:0] asi_wr_way_bf;
wire wr_way_bf_reg_scanin;
wire wr_way_bf_reg_scanout;
wire next_rd_is_first;
wire true_old_wr_req_pending;
wire rd_request_pending;
wire asi_rd_is_first;
wire rd_is_first_reg_scanin;
wire rd_is_first_reg_scanout;
wire wr_request_pending;
wire next_wr_request_pending;
wire next_rd_request_pending;
wire wr_request_pending_reg_scanin;
wire wr_request_pending_reg_scanout;
wire [39:3] next_asi_addr_bf;
wire address_reg_bf_scanin;
wire address_reg_bf_scanout;
wire [2:0] indet_tid_f;
wire [2:0] indet_tid_unused;
wire indet_rd_rdy_c;
wire indet_wr_rdy_c;
wire indet_comp_state_scanin;
wire indet_comp_state_scanout;
wire se;
wire spares_scanin;
wire spares_scanout;


// globals
input tcu_scan_en ;
input         l2clk ;
input  tcu_pce_ov;
input  spc_aclk;
input  spc_bclk;



input        scan_in;


input [64:0]  rng_in_cdbus; // 65 bit control/data bus to the  ring from lsu
input [32:0]  ic_rd_data  ;
input [29:0]  tg_rd_data  ;
input [63:0]  it_rd_data  ;
input [1:0]   agc_vl_data_c  ;


input         ftp_asi_ic_rd_done;    // indicates indeterminate ld data from ic is valid
input         ftp_asi_ic_wr_done;    // indicates indeterminate store to IC is done.
input         ftp_asi_tg_rd_done;    // indicates indeterminate ld data from tag is valid
input         ftp_asi_tg_wr_done;    // indicates indeterminate store to tag is done.
input         ftp_asi_it_rd_done;    // indicates indeterminate ld data from itlb is valid



output [32:0] asi_wr_data;       // Indeterminate store data to Cache or tag and Valid bits.  
output        asi_ic_rd_req;     // send indeterminate load  request to Icache data, sent in stage 1
output        asi_ic_wr_req;     // send indeterminate store request to Icache data, sent in stage 1
output        asi_tg_rd_req;     // send indeterminate load  request to Icache Tag, sent in stage 1
output        asi_tg_wr_req;     // send indeterminate store request to Icache Tag, sent in stage 1
output        asi_itd_rd_req;    // send indeterminate load  request to ITLB data , sent in stage 1
output        asi_itt_rd_req;    // send indeterminate load  request to ITLB tag  , sent in stage 1
output        asi_ith_det_req;   // send indeterminate load  request to ITLB to get translation  , sent in stage 1
output        asi_wr_request;    // indeterminate sent in stage 1
output        asi_rd_request;    // indeterminate sent in stage 1
output        scan_out ;
output [39:3] asi_addr_bf ;      // Read/write address
output [2:0]  asi_way_bf ;       // Read/write way
output [2:0]  asi_tid ;          // Thread id


output [64:0] ifu_rngl_cdbus; // 65 bit control/data bus output from the ring
                              // 64    - ctl/data
                              // 63    - valid/hole
                              // 62    - ack
                              // 61:60 - 00-ASI, 01-ASR, 10-PR, 11-HPR   
                              // 59    - rd/wrx
                              // 58:56 - Thread ID
                              // 55:48 - ASI field
                              // 47:0  - Virtual Address


assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;



assign asi_rd_data_rdy =  ftp_asi_ic_rd_done | ftp_asi_tg_rd_done | asi_it_rd_done_p;
assign asi_data_out[63:0] = ({64{ftp_asi_ic_rd_done}} &  {31'b0, ic_rd_data[32:0]}) |
                            ({64{ftp_asi_tg_rd_done}} &  {32'b0, tg_rd_data[29:0],agc_vl_data_c[1:0]}) |
                            ({64{asi_it_rd_done_p}} &  it_rd_data[63:0]) ; 

assign asi_wr_done_in = ftp_asi_ic_wr_done | ftp_asi_tg_wr_done;




////////////////////////////////////////////////////////
ifu_ftu_asi_ctl_l1clkhdr_ctl_macro clkgen 
  (
   .l2clk(l2clk),
   .l1en (1'b1 ),
   .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));
////////////////////////////////////////////////////////

ifu_ftu_asi_ctl_msff_ctl_macro__width_1 asi_it_rd_done_reg  (
	.scan_in(asi_it_rd_done_reg_scanin),
	.scan_out(asi_it_rd_done_reg_scanout),
	.l1clk	(l1clk),
	.din	(ftp_asi_it_rd_done),
	.dout	(asi_it_rd_done_p),
  .siclk(siclk),
  .soclk(soclk)
);


/////////////////////////////////////////////////////////////////////
//STAGE 1
/////////////////////////////////////////////////////////////////////
// Stage the packet coming on the ring
// First cycle of the packet holds control and address information
// Second cycle holds the store/load data

ifu_ftu_asi_ctl_msff_ctl_macro__width_64 rng_stg1_data  (
	.scan_in(rng_stg1_data_scanin),
	.scan_out(rng_stg1_data_scanout),
	.l1clk	(l1clk),
        .din( rng_in_cdbus[63:0]), 
        .dout( data_1f[63:0]),
  .siclk(siclk),
  .soclk(soclk));

assign ic_data_parity = ^data_1f[31:0] ;
assign ic_par_err_inj = ic_data_parity ^ data_1f[32] ;

assign tg_data_parity  = ^data_1f[30:2] ; 
assign tg_par_err_inj = tg_data_parity ^ data_2f[16] ;

assign vl_bits[1] = data_1f[1] ; 
assign vl_bits[0] = data_1f[1] ^ data_2f[15] ; 

assign asi_wr_data_mux[32:0] = asi_ic_wr_req_2f   ? {ic_par_err_inj,data_1f[31:0]} : {1'b0,vl_bits[1:0],tg_par_err_inj,data_1f[30:2]} ; 
assign asi_wr_data_in[32:0]  = asi_wr_request_2f  ? asi_wr_data_mux[32:0] : asi_wr_data_hold[32:0] ;

ifu_ftu_asi_ctl_msff_ctl_macro__width_33 wr_data_hold  (
	.scan_in(wr_data_hold_scanin),
	.scan_out(wr_data_hold_scanout),
	.l1clk	(l1clk),
        .din( asi_wr_data_in[32:0]), 
        .dout( asi_wr_data_hold[32:0]),
  .siclk(siclk),
  .soclk(soclk));

assign asi_wr_data[32:0] = asi_wr_data_hold[32:0] ;

// register control bit, bit 64 indicates whether ctl packet or data packet
ifu_ftu_asi_ctl_msff_ctl_macro__width_1 rng_stg1_ctl  (
	.scan_in(rng_stg1_ctl_scanin),
	.scan_out(rng_stg1_ctl_scanout),
	.l1clk	(l1clk),
	.din	(rng_in_cdbus[`BUS_CTL]),
	.dout	(ctl_1f),
  .siclk(siclk),
  .soclk(soclk)
);

// decode the packet, ack bit must not be set


assign asi_ic_rd_req  = ctl_1f & ~data_1f[`BUS_ACK] & data_1f[`BUS_VLD] & 
                       (data_1f[61:60] == `ASI) &  data_1f[`BUS_RD] & (data_1f[55:48]==`IC_ASI) ; // & (data_1f[47:0] == `PR_VA);
assign asi_ic_wr_req_in  = ctl_1f & ~data_1f[`BUS_ACK] & data_1f[`BUS_VLD] & 
                       (data_1f[61:60] == `ASI) & ~data_1f[`BUS_RD] & (data_1f[55:48]==`IC_ASI);//  & (data_1f[47:0] == `PR_VA);

assign asi_tg_rd_req  = ctl_1f & ~data_1f[`BUS_ACK] & data_1f[`BUS_VLD] & 
                       (data_1f[61:60] == `ASI) &  data_1f[`BUS_RD] & (data_1f[55:48]==`TG_ASI) ; // & (data_1f[47:0] == `PR_VA);

assign asi_tg_wr_req_in  = ctl_1f & ~data_1f[`BUS_ACK] & data_1f[`BUS_VLD] & 
                       (data_1f[61:60] == `ASI) & ~data_1f[`BUS_RD] & (data_1f[55:48]==`TG_ASI);//  & (data_1f[47:0] == `PR_VA);

ifu_ftu_asi_ctl_msff_ctl_macro__width_2 wr_req_ff  (
	.scan_in(wr_req_ff_scanin),
	.scan_out(wr_req_ff_scanout),
	.l1clk	(l1clk),
	.din	({asi_ic_wr_req_in, asi_tg_wr_req_in}),
	.dout	({asi_ic_wr_req, asi_tg_wr_req}),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_itd_rd_req  = ctl_1f & ~data_1f[`BUS_ACK] & data_1f[`BUS_VLD] & 
                       (data_1f[61:60] == `ASI) &  data_1f[`BUS_RD] & (data_1f[55:48]==`ITD_ASI) ; // & (data_1f[47:0] == `IT_VA);

assign asi_itt_rd_req  = ctl_1f & ~data_1f[`BUS_ACK] & data_1f[`BUS_VLD] & 
                       (data_1f[61:60] == `ASI) &  data_1f[`BUS_RD] & (data_1f[55:48]==`ITT_ASI) ;

assign asi_ith_det_req = ctl_1f & ~data_1f[`BUS_ACK] & data_1f[`BUS_VLD] & 
                       (data_1f[61:60] == `ASI) & data_1f[`BUS_RD] & (data_1f[55:48]==`ITH_ASI);//  & (data_1f[47:0] == `PR_VA);



// assign pr_rd_1 = 1'b0 ;
// assign pr_wr_1 = 1'b0 ;

//detect a hole, this is used by indeterminate accesses.
assign hole_det_1 = ctl_1f & ~data_1f[`BUS_VLD];

// indeterminate accesses will clear the valid bit on the packet
// In this example stub, PR addresses are indeterminate. 
assign indet_acc_1 = asi_ic_rd_req | asi_ic_wr_req_in | asi_tg_rd_req | asi_tg_wr_req_in | asi_itd_rd_req | asi_itt_rd_req | asi_ith_det_req;

// decode determinate accesses


// Send load request and thread information from stage 1.
// In this example stub, data will be returned 2 cycles later,
// when ctl is in stage 3 and data is in stage 2.

/////////////////////////////////////////////////////////////////////
//STAGE 2
/////////////////////////////////////////////////////////////////////
// pipe the packets and decoded control information
ifu_ftu_asi_ctl_msff_ctl_macro__width_64 rng_stg2_data  (
	.scan_in(rng_stg2_data_scanin),
	.scan_out(rng_stg2_data_scanout),
	.l1clk	(l1clk),
        .din( data_1f[63:0]), 
        .dout( data_2f[63:0]),
  .siclk(siclk),
  .soclk(soclk));

// register control bit
ifu_ftu_asi_ctl_msff_ctl_macro__width_3 rng_stg2_ctl  (
	.scan_in(rng_stg2_ctl_scanin),
	.scan_out(rng_stg2_ctl_scanout),
	.l1clk	(l1clk),
	.din	({ctl_1f,asi_ic_wr_req_in, asi_wr_request}),
	.dout	({ctl_2f,asi_ic_wr_req_2f, asi_wr_request_2f}),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_asi_ctl_msff_ctl_macro__width_2 rng_stg2_decctl  (
	.scan_in(rng_stg2_decctl_scanin),
	.scan_out(rng_stg2_decctl_scanout),
	.l1clk	(l1clk),
	.din	({hole_det_1, indet_acc_1}),
	.dout	({hole_det_2f, indet_acc_2f}),
  .siclk(siclk),
  .soclk(soclk)
);

// send the store data out to the unit. Store data is in stage1 when control is in stage 2
// The data is accompanied by write control signal.


// also send the Thread ID with store data. It is in stage 2 (control packet).
// assign rng_wr_tid[2:0] = data_2f[`BUS_TID_END:`BUS_TID_ST];

assign next_indet_return_rd_first = (hole_det_2f & (indet_rd_rdy_f | indet_rd_rdy_f)) & ~indet_return_rd_first ; 
// If a hole is detected, and an indeterminate access is waiting to be sent, then insert it.
assign indet_rd_done_2 = hole_det_2f & indet_rd_rdy_f  & (~indet_wr_rdy_f |  indet_return_rd_first) ;
assign indet_wr_done_2 = hole_det_2f & indet_wr_rdy_f  & (~indet_rd_rdy_f | ~indet_return_rd_first);

// pipe the control bits 1 more cycle to line it up with data
ifu_ftu_asi_ctl_msff_ctl_macro__width_2 rng_stg3_decctl  (
	.scan_in(rng_stg3_decctl_scanin),
	.scan_out(rng_stg3_decctl_scanout),
	.l1clk	(l1clk),
	.din	({indet_rd_done_2,next_indet_return_rd_first}),
	.dout	({indet_rd_done_3f,indet_return_rd_first}),
  .siclk(siclk),
  .soclk(soclk)
);

// bypass incoming data if the packet is not a read request to the unit.
assign bypass_data_3 = ~indet_rd_done_3f;

// Mux the output data
// mux_macro mux_data_stg2 (width=64,ports=2,mux=aonpe) 
// (
//  .din0(data_2f[63:0]),
//  .din1(indet_data_f[63:0]),
//  .sel0(bypass_data_3),
//  .sel1(indet_rd_done_3f),
//  .dout(data_2[63:0]));

assign data_2[63:0] = bypass_data_3 ? data_2f[63:0] : indet_data_f[63:0] ;

// valid bit is cleared if current packet is indeterminate rd/wr
// valid bit is set if indeterminate data is being returned on current packet, indicated by indet_done
// indet_done and indet_acc are mutually exclusive by design.
assign valid_2 = (indet_wr_done_2 | indet_rd_done_2 | data_2f[`BUS_VLD]) & !indet_acc_2f;
// assign tid_2[2:0] = (indet_wr_done_2 | indet_rd_done_2)? indet_tid_f[2:0]: data_2f[`BUS_TID_END:`BUS_TID_ST];

assign tid_2[2:0] = (({3{( indet_wr_done_2 & ~indet_rd_done_2)}}) & indet_wr_tid_f[2:0]) |  
                    (({3{(~indet_wr_done_2 & indet_rd_done_2)}})  & indet_rd_tid_f[2:0]) |
                    (({3{(~indet_wr_done_2 & ~indet_rd_done_2)}}) & data_2f[`BUS_TID_END:`BUS_TID_ST]);

assign rdwr_2 = (indet_rd_done_2 & !indet_wr_done_2) | (!indet_rd_done_2 & !indet_wr_done_2 & data_2f[`BUS_RD]);

// ack bit is set if current packet was a determinate rd/wr destined for the unit.
// ack bit is also set if indeterminate data is being returned on current packet.
// ack bit is cleared if current packet is indeterminate rd/wr destined for the unit
// Else, ack bit is passed unchanged

assign ack_2 = (indet_wr_done_2 | indet_rd_done_2 |  data_2f[`BUS_ACK]) & !indet_acc_2f;

// report exceptions
assign asi_err_2[7:0] = (ack_2 & ~data_2f[`BUS_ACK]) ? 8'b0 : data_2f[55:48];

assign ctl_2[63:0] = {valid_2, ack_2, data_2f[61:60], rdwr_2, tid_2[2:0], asi_err_2[7:0],  data_2f[47:0]};

/////////////////////////////////////////////////////////////////////
//STAGE 3
/////////////////////////////////////////////////////////////////////
// This is the output register
// Mux ctl and data
// 

assign rng_data_out_mux[63:0] = ctl_2f ? ctl_2[63:0] : data_2[63:0] ; 

ifu_ftu_asi_ctl_msff_ctl_macro__width_64 rng_stg3  (
	.scan_in(rng_stg3_scanin),
	.scan_out(rng_stg3_scanout),
	.l1clk	(l1clk),
	.din	(rng_data_out_mux[63:0]),
	.dout	(ifu_rngl_cdbus[63:0]),
  .siclk(siclk),
  .soclk(soclk)
);


ifu_ftu_asi_ctl_msff_ctl_macro__width_1 rng_stg3_ctl  (
	.scan_in(rng_stg3_ctl_scanin),
	.scan_out(rng_stg3_ctl_scanout),
	.l1clk	(l1clk),
	.din	(ctl_2f),
	.dout	(ifu_rngl_cdbus[`BUS_CTL]),
  .siclk(siclk),
  .soclk(soclk)
);



// latch the indeterminate load data and set up state to hold it until
// a hole is detected and data is returned. Same applies to indeterminate
// store, except there is no data to return. Only a valid packet is returned
// with the right tid and rd/wr bit.


ifu_ftu_asi_ctl_msff_ctl_macro__en_1__width_64 indet_rd_data  (
 .scan_in(indet_rd_data_scanin),
 .scan_out(indet_rd_data_scanout),
 .l1clk	(l1clk),
 .en  ( asi_rd_data_rdy),
 .din( asi_data_out[63:0]), 
 .dout( indet_data_f[63:0]),
  .siclk(siclk),
  .soclk(soclk));

assign next_indet_wr_tid[2:0] = asi_wr_request ? data_1f[`BUS_TID_END:`BUS_TID_ST] : indet_wr_tid_f; 

ifu_ftu_asi_ctl_msff_ctl_macro__width_3 pr_tid_wr_ret  (
	.scan_in(pr_tid_wr_ret_scanin),
	.scan_out(pr_tid_wr_ret_scanout),
	.l1clk	(l1clk),
	.din	(next_indet_wr_tid[2:0]),
	.dout	(indet_wr_tid_f[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign next_indet_rd_tid[2:0] = asi_rd_request ? data_1f[`BUS_TID_END:`BUS_TID_ST] : indet_rd_tid_f; 

ifu_ftu_asi_ctl_msff_ctl_macro__width_3 pr_tid_rd_ret  (
	.scan_in(pr_tid_rd_ret_scanin),
	.scan_out(pr_tid_rd_ret_scanout),
	.l1clk	(l1clk),
	.din	(next_indet_rd_tid[2:0]),
	.dout	(indet_rd_tid_f[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign next_rd_addr_bf[39:3] = asi_rd_request ? data_1f[39:3] : asi_rd_addr_bf[39:3]; 
ifu_ftu_asi_ctl_msff_ctl_macro__width_37 address_rd_reg  (
	.scan_in(address_rd_reg_scanin),
	.scan_out(address_rd_reg_scanout),
	.l1clk	(l1clk),
	.din	(next_rd_addr_bf[39:3]),
	.dout	(asi_rd_addr_bf[39:3]),
  .siclk(siclk),
  .soclk(soclk)
);

assign next_wr_addr_bf[39:3] = asi_wr_request ? data_1f[39:3] : asi_wr_addr_bf[39:3]; 
ifu_ftu_asi_ctl_msff_ctl_macro__width_37 address_wr_reg  (
	.scan_in(address_wr_reg_scanin),
	.scan_out(address_wr_reg_scanout),
	.l1clk	(l1clk),
	.din	(next_wr_addr_bf[39:3]),
	.dout	(asi_wr_addr_bf[39:3]),
  .siclk(siclk),
  .soclk(soclk)
);


assign next_rd_way_bf[2:0] = asi_rd_request ? data_1f[14:12] : asi_rd_way_bf[2:0]; 
ifu_ftu_asi_ctl_msff_ctl_macro__width_3 rd_way_bf_reg  (
	.scan_in(rd_way_bf_reg_scanin),
	.scan_out(rd_way_bf_reg_scanout),
	.l1clk	(l1clk),
	.din	(next_rd_way_bf[2:0]),
	.dout	(asi_rd_way_bf[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign next_wr_way_bf[2:0] = asi_wr_request ? data_1f[14:12] : asi_wr_way_bf[2:0]; 
ifu_ftu_asi_ctl_msff_ctl_macro__width_3 wr_way_bf_reg  (
	.scan_in(wr_way_bf_reg_scanin),
	.scan_out(wr_way_bf_reg_scanout),
	.l1clk	(l1clk),
	.din	(next_wr_way_bf[2:0]),
	.dout	(asi_wr_way_bf[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign next_rd_is_first = (asi_rd_request     & ~true_old_wr_req_pending)  | 
                          (rd_request_pending & ~true_old_wr_req_pending & ~asi_rd_data_rdy)  | 
                          (asi_rd_is_first    & ~asi_rd_data_rdy);

ifu_ftu_asi_ctl_msff_ctl_macro__width_1 rd_is_first_reg  (
	.scan_in(rd_is_first_reg_scanin),
	.scan_out(rd_is_first_reg_scanout),
	.l1clk	(l1clk),
	.din	(next_rd_is_first),
	.dout	(asi_rd_is_first),
  .siclk(siclk),
  .soclk(soclk)
);


assign true_old_wr_req_pending = (wr_request_pending	   & ~asi_wr_done_in) ;
assign next_wr_request_pending = asi_wr_request   | (wr_request_pending    & ~asi_wr_done_in);
assign next_rd_request_pending = asi_rd_request   | (rd_request_pending    & ~asi_rd_data_rdy);

ifu_ftu_asi_ctl_msff_ctl_macro__width_2 wr_request_pending_reg  (
	.scan_in(wr_request_pending_reg_scanin),
	.scan_out(wr_request_pending_reg_scanout),
	.l1clk	(l1clk),
	.din	({next_wr_request_pending, next_rd_request_pending}),
	.dout	({wr_request_pending,rd_request_pending}),
  .siclk(siclk),
  .soclk(soclk)
);


assign next_asi_addr_bf[39:3]  = next_rd_is_first ? next_rd_addr_bf[39:3] : next_wr_addr_bf[39:3] ;

ifu_ftu_asi_ctl_msff_ctl_macro__width_37 address_reg_bf  (
	.scan_in(address_reg_bf_scanin),
	.scan_out(address_reg_bf_scanout),
	.l1clk	(l1clk),
	.din	(next_asi_addr_bf[39:3]),
	.dout	(asi_addr_bf[39:3]),
  .siclk(siclk),
  .soclk(soclk)
);


assign asi_way_bf[2:0]    = asi_rd_is_first ? asi_rd_way_bf[2:0]   : asi_wr_way_bf[2:0]   ;
assign indet_tid_f[2:0]   = asi_rd_is_first ? indet_rd_tid_f[2:0]  : indet_wr_tid_f[2:0]   ; 
assign indet_tid_unused[2:0]    = indet_tid_f[2:0] ;

// assign next_tid_bf[2:0] = asi_request ? data_1f[14:12] : asi_tid[2:0]; 
// msff_ctl_macro tid_bf_reg (width=3) (
// 	.scan_in(tid_bf_reg_scanin),
// 	.scan_out(tid_bf_reg_scanout),
// 	.l1clk	(l1clk),
// 	.din	(next_tid_bf[2:0]),
// 	.dout	(asi_tid[2:0])
// );

assign asi_tid[2:0] = data_1f[58:56] ;

// set up state to inidicate completed indeterminate operation
assign indet_rd_rdy_c = (asi_rd_data_rdy | indet_rd_rdy_f) & !indet_rd_done_2;
assign indet_wr_rdy_c = (asi_wr_done_in  | indet_wr_rdy_f) & !indet_wr_done_2;

ifu_ftu_asi_ctl_msff_ctl_macro__width_2 indet_comp_state  (
	.scan_in(indet_comp_state_scanin),
	.scan_out(indet_comp_state_scanout),
	.l1clk	(l1clk),
	.din	({indet_rd_rdy_c, indet_wr_rdy_c}),
	.dout	({indet_rd_rdy_f, indet_wr_rdy_f}),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_wr_request = asi_ic_wr_req_in | asi_tg_wr_req_in ;
assign asi_rd_request = asi_ic_rd_req | asi_tg_rd_req |  asi_itd_rd_req | asi_itt_rd_req | asi_ith_det_req;

assign se = tcu_scan_en ;
///////////////////////////////////////////////////////////////////////
// Spare circuits                                                    //
///////////////////////////////////////////////////////////////////////
ifu_ftu_asi_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



// fixscan start:
assign asi_it_rd_done_reg_scanin = scan_in                  ;
assign rng_stg1_data_scanin      = asi_it_rd_done_reg_scanout;
assign wr_data_hold_scanin       = rng_stg1_data_scanout    ;
assign rng_stg1_ctl_scanin       = wr_data_hold_scanout     ;
assign wr_req_ff_scanin          = rng_stg1_ctl_scanout     ;
assign rng_stg2_data_scanin      = wr_req_ff_scanout        ;
assign rng_stg2_ctl_scanin       = rng_stg2_data_scanout    ;
assign rng_stg2_decctl_scanin    = rng_stg2_ctl_scanout     ;
assign rng_stg3_decctl_scanin    = rng_stg2_decctl_scanout  ;
assign rng_stg3_scanin           = rng_stg3_decctl_scanout  ;
assign rng_stg3_ctl_scanin       = rng_stg3_scanout         ;
assign indet_rd_data_scanin      = rng_stg3_ctl_scanout     ;
assign pr_tid_wr_ret_scanin      = indet_rd_data_scanout    ;
assign pr_tid_rd_ret_scanin      = pr_tid_wr_ret_scanout    ;
assign address_rd_reg_scanin     = pr_tid_rd_ret_scanout    ;
assign address_wr_reg_scanin     = address_rd_reg_scanout   ;
assign rd_way_bf_reg_scanin      = address_wr_reg_scanout   ;
assign wr_way_bf_reg_scanin      = rd_way_bf_reg_scanout    ;
assign rd_is_first_reg_scanin    = wr_way_bf_reg_scanout    ;
assign wr_request_pending_reg_scanin = rd_is_first_reg_scanout  ;
assign address_reg_bf_scanin     = wr_request_pending_reg_scanout;
assign indet_comp_state_scanin   = address_reg_bf_scanout   ;
assign spares_scanin             = indet_comp_state_scanout ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module ifu_ftu_asi_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_asi_ctl_msff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_asi_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_asi_ctl_msff_ctl_macro__width_33 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [32:0] fdin;
wire [31:0] so;

  input [32:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [32:0] dout;
  output scan_out;
assign fdin[32:0] = din[32:0];






dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_asi_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_asi_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_asi_ctl_msff_ctl_macro__en_1__width_64 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = (din[63:0] & {64{en}}) | (dout[63:0] & ~{64{en}});






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_asi_ctl_msff_ctl_macro__width_37 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [36:0] fdin;
wire [35:0] so;

  input [36:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [36:0] dout;
  output scan_out;
assign fdin[36:0] = din[36:0];






dff #(37)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[36:0]),
.si({scan_in,so[35:0]}),
.so({so[35:0],scan_out}),
.q(dout[36:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ifu_ftu_asi_ctl_spare_ctl_macro__num_4 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));
assign scan_out = so_3;



endmodule

