// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rst_ucbflow_ctl.v
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
module rst_ucbflow_ctl (
  iol2clk, 
  ucb_clr_io_, 
  scan_in, 
  ucb_ctl_scanout, 
  tcu_pce_ov, 
  rst_clk_stop, 
  rst_aclk, 
  rst_bclk, 
  rst_scan_en, 
  tcu_rst_scan_mode, 
  ncu_rst_vld, 
  ncu_rst_data, 
  rst_ncu_stall, 
  rst_ncu_vld, 
  rst_ncu_data, 
  ncu_rst_stall, 
  rd_req_vld, 
  wr_req_vld, 
  thr_id_in, 
  buf_id_in, 
  addr_in, 
  data_in, 
  req_acpted, 
  rd_ack_vld, 
  rd_nack_vld, 
  thr_id_out, 
  buf_id_out, 
  data_out, 
  ack_busy) ;
wire indata_buf_vld;
wire [127:0] indata_buf;
wire rst_ucbbusin4_ctl_scanin;
wire rst_ucbbusin4_ctl_scanout;
wire tcu_clk_stop;
wire tcu_aclk;
wire tcu_bclk;
wire tcu_scan_en;
wire rst_ncu_stall_a1;
wire read_pending;
wire write_pending;
wire buf_full;
wire rd_buf;
wire [1:0] buf_head_next;
wire [1:0] buf_head;
wire buf_head_next0_;
wire buf_head0_;
wire buf_head_ff0_scanin;
wire buf_head_ff0_scanout;
wire l1clk;
wire buf_head_ff1_scanin;
wire buf_head_ff1_scanout;
wire wr_buf;
wire [1:0] buf_tail_next;
wire [1:0] buf_tail;
wire buf_tail_next0_;
wire buf_tail0_;
wire buf_tail_ff0_scanin;
wire buf_tail_ff0_scanout;
wire buf_tail_ff1_scanin;
wire buf_tail_ff1_scanout;
wire buf_full_next;
wire buf_full_ff_scanin;
wire buf_full_ff_scanout;
wire buf_empty_next;
wire buf_empty_next_;
wire buf_empty;
wire buf_empty_;
wire buf_empty_ff_scanin;
wire buf_empty_ff_scanout;
wire [116:0] req_in;
wire [8:0] unconnected_rsvd;
wire buf0_en;
wire buf0_ff_scanin;
wire buf0_ff_scanout;
wire [116:0] buf0;
wire buf1_en;
wire buf1_ff_scanin;
wire buf1_ff_scanout;
wire [116:0] buf1;
wire [116:0] req_out;
wire [2:0] unconnected_size_in;
wire wr_req_vld_nq;
wire rd_req_vld_nq;
wire ack_buf_wr;
wire ack_buf_vld_next;
wire ack_buf_rd;
wire ack_buf_vld;
wire ack_buf_vld_ff_scanin;
wire ack_buf_vld_ff_scanout;
wire ack_buf_is_nack_ff_scanin;
wire ack_buf_is_nack_ff_scanout;
wire ack_buf_is_nack;
wire [3:0] ack_typ_out;
wire [75:0] ack_buf_in;
wire ack_buf_ff_scanin;
wire ack_buf_ff_scanout;
wire [75:0] ack_buf;
wire [31:0] ack_buf_vec;
wire outdata_buf_busy;
wire outdata_buf_wr;
wire [127:0] outdata_buf_in;
wire [31:0] outdata_vec_in;
wire rst_ucbbusout4_ctl_scanin;
wire rst_ucbbusout4_ctl_scanout;
wire spares_scanin;
wire spares_scanout;
wire scan_out;
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;



// Globals
input		iol2clk;
input		ucb_clr_io_;	//BP 8-19-05
input		scan_in;
output		ucb_ctl_scanout;
input		tcu_pce_ov;
input		rst_clk_stop;   //BP 8-22-05
input		rst_aclk    ;   //BP 8-22-05
input		rst_bclk    ;   //BP 8-22-05
input           rst_scan_en ;   //BP 8-22-05
input           tcu_rst_scan_mode ;  //BP 8-22-05

// Downstream from NCU
input           ncu_rst_vld;
input  [3:0]    ncu_rst_data;
output          rst_ncu_stall;

// Upstream to NCU
output          rst_ncu_vld;
output [3:0]    rst_ncu_data;
input           ncu_rst_stall;

// CMDs to local unit
output          rd_req_vld;
output          wr_req_vld;
output [5:0]    thr_id_in;
output [1:0]    buf_id_in;
output [39:0]   addr_in;
output [63:0]   data_in;
input           req_acpted;

// Ack/Nack from local unit
input           rd_ack_vld;
input           rd_nack_vld;
input  [5:0]    thr_id_out;
input  [1:0]    buf_id_out;
input  [63:0]   data_out;
output          ack_busy;




// Local signals




//wire           int_buf_rd;
//wire           int_buf_wr;
//wire           int_buf_vld;
//wire           int_buf_vld_next;
//wire  [6:0]    int_buf_in;
//wire  [6:0]    int_buf;
//wire  [3:0]    int_buf_vec;

//wire           int_last_rd;
   
   
////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
 * Inbound Data
 ************************************************************/
/*rst_ucbbusin4_ctl auto_template ( .scan_in(rst_ucbbusin4_ctl_scanin),
				    .vld(ncu_rst_vld),
				    .data(ncu_rst_data[3:0]),
				    .stall(rst_ncu_stall),
				    .stall_a1(rst_ncu_stall_a1) );
*/
rst_ucbbusin4_ctl rst_ucbbusin4_ctl (/*autoinst*/
				     // Outputs
				     .stall(rst_ncu_stall),	 // Templated
				     .indata_buf_vld(indata_buf_vld),
				     .indata_buf(indata_buf[127:0]),
				     // Inputs
				     .scan_in(rst_ucbbusin4_ctl_scanin),
				     .scan_out(rst_ucbbusin4_ctl_scanout),
				     .iol2clk(iol2clk),
				     .ucb_clr_io_(ucb_clr_io_),	//BP 8-19-05
				     .tcu_pce_ov(tcu_pce_ov),
				     .tcu_clk_stop(tcu_clk_stop),
				     .tcu_aclk    (tcu_aclk    ),
				     .tcu_bclk    (tcu_bclk    ),
				     .tcu_scan_en (tcu_scan_en ),
				     .vld(ncu_rst_vld),		 // Templated
				     .data(ncu_rst_data[3:0]),	 // Templated
				     .stall_a1(rst_ncu_stall_a1)); // Templated

/************************************************************
 * Decode inbound packet type
 ************************************************************/
assign     read_pending = (indata_buf[3:0] == 4'b0100) & indata_buf_vld;

assign     write_pending = (indata_buf[3:0] == 4'b0101) & indata_buf_vld;

assign     rst_ncu_stall_a1 = (read_pending | write_pending) & buf_full;

/************************************************************
 * Inbound buffer
 ************************************************************/
// Head pointer
assign     rd_buf = req_acpted;
assign     buf_head_next[1:0] = rd_buf ? {buf_head[0],buf_head[1]} : buf_head[1:0];

assign     buf_head_next0_ = ~buf_head_next[0] ;
assign     buf_head[0] = ~buf_head0_ ;
rst_ucbflow_ctl_msff_ctl_macro__clr__1__width_1 buf_head_ff0  
				(
				.scan_in(buf_head_ff0_scanin),
				.scan_out(buf_head_ff0_scanout),
				.dout		(buf_head0_),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.din		(buf_head_next0_),
  .siclk(siclk),
  .soclk(soclk)
				);

rst_ucbflow_ctl_msff_ctl_macro__clr__1__width_1 buf_head_ff1  
				(
				.scan_in(buf_head_ff1_scanin),
				.scan_out(buf_head_ff1_scanout),
				.dout		(buf_head[1]),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.din		(buf_head_next[1]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Tail pointer
assign     wr_buf = (read_pending | write_pending) & ~buf_full;

assign     buf_tail_next[1:0] = wr_buf ? {buf_tail[0], buf_tail[1]} : buf_tail[1:0];

assign   buf_tail_next0_ = ~buf_tail_next[0];
assign   buf_tail[0] = ~buf_tail0_ ;
rst_ucbflow_ctl_msff_ctl_macro__clr__1__width_1 buf_tail_ff0  
				(
				.scan_in(buf_tail_ff0_scanin),
				.scan_out(buf_tail_ff0_scanout),
				.dout		(buf_tail0_),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.din		(buf_tail_next0_),
  .siclk(siclk),
  .soclk(soclk)
				);

rst_ucbflow_ctl_msff_ctl_macro__clr__1__width_1 buf_tail_ff1  
				(
				.scan_in(buf_tail_ff1_scanin),
				.scan_out(buf_tail_ff1_scanout),
				.dout		(buf_tail[1]),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.din		(buf_tail_next[1]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Buffer full
assign     buf_full_next = (buf_head_next[1:0] == buf_tail_next[1:0]) & wr_buf;
rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_1 buf_full_ff   
				(
				.scan_in(buf_full_ff_scanin),
				.scan_out(buf_full_ff_scanout),
				.dout		(buf_full),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(rd_buf|wr_buf),
				.din		(buf_full_next),
  .siclk(siclk),
  .soclk(soclk)
				);

// Buffer empty
assign     buf_empty_next = ((buf_head_next[1:0] == buf_tail_next[1:0]) & rd_buf) ;
assign     buf_empty_next_ = ~buf_empty_next ;
assign     buf_empty = ~buf_empty_ ;
rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_1 buf_empty_ff   
				(
				.scan_in(buf_empty_ff_scanin),
				.scan_out(buf_empty_ff_scanout),
				.dout		(buf_empty_),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(rd_buf|wr_buf),
				.din		(buf_empty_next_),
  .siclk(siclk),
  .soclk(soclk)
				);

assign     { req_in[116:53],
	     unconnected_rsvd[8:0],
	     req_in[52:0] }   = { indata_buf[127:64],
	                          indata_buf[63:55],
                                  indata_buf[54:15],
                                  indata_buf[14:12],
                                  indata_buf[11:10],
                                  indata_buf[9:4],
                                  write_pending,
                                  read_pending };
          
// Buffer 0
assign     buf0_en = buf_tail[0] & wr_buf;
rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_117 buf0_ff   
				(
				.scan_in(buf0_ff_scanin),
				.scan_out(buf0_ff_scanout),
				.dout		(buf0[116:0]),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(buf0_en),
				.din		(req_in[116:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
// Buffer 1
assign buf1_en = buf_tail[1] & wr_buf;
rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_117 buf1_ff   
				(
				.scan_in(buf1_ff_scanin),
				.scan_out(buf1_ff_scanout),
				.dout		(buf1[116:0]),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(buf1_en),
				.din		(req_in[116:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign     req_out[116:0] = buf_head[0] ? buf0[116:0] :
                            buf_head[1] ? buf1[116:0] : 117'b0;

   
/************************************************************
* Inbound interface to local unit
************************************************************/
assign     {data_in[63:0],
            addr_in[39:0],
            unconnected_size_in[2:0],
            buf_id_in[1:0],
            thr_id_in[5:0],
            wr_req_vld_nq,
            rd_req_vld_nq} = req_out[116:0];

assign      rd_req_vld = rd_req_vld_nq & ~buf_empty;
assign      wr_req_vld = wr_req_vld_nq & ~buf_empty;
 
 
/************************************************************
 * Outbound Ack/Nack
 ************************************************************/
assign     ack_buf_wr = rd_ack_vld | rd_nack_vld;

assign     ack_buf_vld_next = ack_buf_wr ? 1'b1 :
                              ack_buf_rd ? 1'b0 : ack_buf_vld;

rst_ucbflow_ctl_msff_ctl_macro__clr__1__width_1 ack_buf_vld_ff  
				(
				.scan_in(ack_buf_vld_ff_scanin),
				.scan_out(ack_buf_vld_ff_scanout),
				.dout		(ack_buf_vld),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.din		(ack_buf_vld_next),
  .siclk(siclk),
  .soclk(soclk)
				);

rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_1 ack_buf_is_nack_ff   
				(
				.scan_in(ack_buf_is_nack_ff_scanin),
				.scan_out(ack_buf_is_nack_ff_scanout),
				.dout		(ack_buf_is_nack),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(ack_buf_wr),
				.din		(rd_nack_vld),
  .siclk(siclk),
  .soclk(soclk)
				);

assign     ack_typ_out[3:0] = rd_ack_vld ? 4'b0001: //UCB_READ_ACK
                                           4'b0000; //UCB_READ_NACK
   
assign     ack_buf_in[75:0] = {  data_out[63:0],
                                buf_id_out[1:0],
                                thr_id_out[5:0],
                               ack_typ_out[3:0]  };
   
rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_76 ack_buf_ff   
				(
				.scan_in(ack_buf_ff_scanin),
				.scan_out(ack_buf_ff_scanout),
				.dout		(ack_buf[75:0]),
				.clr_		(ucb_clr_io_),	//BP 8-19-05
				.l1clk		(l1clk),
				.en		(ack_buf_wr),
				.din		(ack_buf_in[75:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign     ack_buf_vec[31:0] = ack_buf_is_nack  ? {16'h0000,16'hffff} : {32'hffff_ffff} ;
   
assign     ack_busy = ack_buf_vld;
   
assign     ack_buf_rd = ~outdata_buf_busy & ack_buf_vld ;

assign     outdata_buf_wr = ack_buf_rd ;

assign     outdata_buf_in[127:0] = {ack_buf[75:12],      //payload 64bit
                                    9'b0,                //reserved [63:55]
                                    40'h00_0000_0000,    //40bit addr [54:15]
                                    3'b000,              //size [14:12]
                                    ack_buf[11:10],      //buf_id 2bit
                                    ack_buf[9:4],        //thr_id 6bit
                                    ack_buf[3:0]};       //type 4bit
   
assign     outdata_vec_in[31:0] = ack_buf_vec[31:0] ;
   

/*rst_ucbbusout4_ctl auto_template  (
				       .vld(rst_ncu_vld),
				       .data(rst_ncu_data[3:0]),
				       .stall(ncu_rst_stall),
				       .outdata_vec_in(outdata_vec_in[31:0]) );
*/
rst_ucbbusout4_ctl rst_ucbbusout4_ctl (/*autoinst*/
				       // Outputs
				       .vld(rst_ncu_vld),	 // Templated
				       .data(rst_ncu_data[3:0]), // Templated
				       .outdata_buf_busy(outdata_buf_busy),
				       // Inputs
				       .scan_in(rst_ucbbusout4_ctl_scanin),
				       .scan_out(rst_ucbbusout4_ctl_scanout),
				       .iol2clk(iol2clk),
				       .ucb_clr_io_(ucb_clr_io_),	//BP 8-19-05
				       .tcu_pce_ov(tcu_pce_ov),
				       .tcu_clk_stop(tcu_clk_stop),
				       .tcu_aclk    (tcu_aclk    ),
				       .tcu_bclk    (tcu_bclk    ),
				       .tcu_scan_en (tcu_scan_en ),
				       .stall(ncu_rst_stall),	 // Templated
				       .outdata_buf_in(outdata_buf_in[127:0]),
				       .outdata_vec_in(outdata_vec_in[31:0]), // Templated
				       .outdata_buf_wr(outdata_buf_wr));


/**** adding clock header ****/
rst_ucbflow_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
                             // .pce_ov (1'b0   ),
                                .stop   (1'b0   ),
                             // .se     (1'b0   ),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .se(se)
				);
// grep "Number of cells:" rst_*_l/*/scf/dc/rpt/syn_area.rpt
//                               Number of cells/450 = spare gate macros
// rst_ucbflow_l/rst_ucbflow_ctl/scf/dc/rpt/syn_area.rpt:Num:2555 /450=6

rst_ucbflow_ctl_spare_ctl_macro__num_6 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)        );


/*** BP 8-22-05 copy scan force similar to rst_fsm_ctl ***/
assign   ucb_ctl_scanout
                      = tcu_rst_scan_mode ? scan_out     : 1'b0;
assign   tcu_aclk     = tcu_rst_scan_mode ? rst_aclk     : 1'b0;
assign   tcu_bclk     = tcu_rst_scan_mode ? rst_bclk     : 1'b0;
assign   tcu_scan_en  = tcu_rst_scan_mode ? rst_scan_en  : 1'b0;
assign   tcu_clk_stop = tcu_rst_scan_mode ? rst_clk_stop : 1'b0;

// scan renames
assign se = tcu_scan_en;
// end scan



/*** building tcu port ***/
assign	siclk = tcu_aclk    ;
assign	soclk = tcu_bclk    ;
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;

// fixscan start:
assign rst_ucbbusin4_ctl_scanin  = scan_in                  ;
assign buf_head_ff0_scanin       = rst_ucbbusin4_ctl_scanout;
assign buf_head_ff1_scanin       = buf_head_ff0_scanout     ;
assign buf_tail_ff0_scanin       = buf_head_ff1_scanout     ;
assign buf_tail_ff1_scanin       = buf_tail_ff0_scanout     ;
assign buf_full_ff_scanin        = buf_tail_ff1_scanout     ;
assign buf_empty_ff_scanin       = buf_full_ff_scanout      ;
assign buf0_ff_scanin            = buf_empty_ff_scanout     ;
assign buf1_ff_scanin            = buf0_ff_scanout          ;
assign ack_buf_vld_ff_scanin     = buf1_ff_scanout          ;
assign ack_buf_is_nack_ff_scanin = ack_buf_vld_ff_scanout   ;
assign ack_buf_ff_scanin         = ack_buf_is_nack_ff_scanout;
assign rst_ucbbusout4_ctl_scanin = ack_buf_ff_scanout       ;
assign spares_scanin             = rst_ucbbusout4_ctl_scanout;
//assign scan_out                  = spares_scanout           ;
assign scan_out                  = spares_scanout  ; 
// fixscan end:
endmodule // ucb_flow_rst

// verilog-library-directories:(".")




// any PARAMS parms go into naming of macro

module rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_1 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}} & ~{1{(~clr_)}}) | (dout[0:0] & ~{1{en}} & ~{1{(~clr_)}});






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

module rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_4 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}} & ~{4{(~clr_)}}) | (dout[3:0] & ~{4{en}} & ~{4{(~clr_)}});






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_ucbflow_ctl_msff_ctl_macro__clr__1__width_1 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{(~clr_)}};






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

module rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_32 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}} & ~{32{(~clr_)}}) | (dout[31:0] & ~{32{en}} & ~{32{(~clr_)}});






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_128 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}} & ~{128{(~clr_)}}) | (dout[127:0] & ~{128{en}} & ~{128{(~clr_)}});






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_ucbflow_ctl_l1clkhdr_ctl_macro (
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

module rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_117 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [116:0] fdin;
wire [115:0] so;

  input [116:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [116:0] dout;
  output scan_out;
assign fdin[116:0] = (din[116:0] & {117{en}} & ~{117{(~clr_)}}) | (dout[116:0] & ~{117{en}} & ~{117{(~clr_)}});






dff #(117)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[116:0]),
.si({scan_in,so[115:0]}),
.so({so[115:0],scan_out}),
.q(dout[116:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_ucbflow_ctl_msff_ctl_macro__clr__1__en_1__width_76 (
  din, 
  en, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [75:0] fdin;
wire [74:0] so;

  input [75:0] din;
  input en;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [75:0] dout;
  output scan_out;
assign fdin[75:0] = (din[75:0] & {76{en}} & ~{76{(~clr_)}}) | (dout[75:0] & ~{76{en}} & ~{76{(~clr_)}});






dff #(76)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[75:0]),
.si({scan_in,so[74:0]}),
.so({so[74:0],scan_out}),
.q(dout[75:0])
);












endmodule






// any PARAMS parms go into naming of macro

module rst_ucbflow_ctl_msff_ctl_macro__clr__1__width_32 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0] & ~{32{(~clr_)}};






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module rst_ucbflow_ctl_msff_ctl_macro__clr__1__width_128 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0] & ~{128{(~clr_)}};






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module rst_ucbflow_ctl_spare_ctl_macro__num_6 (
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
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;


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

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));
assign scan_out = so_5;



endmodule

