// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_ssiflow_ctl.v
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
module ncu_ssiflow_ctl (
  iol2clk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  scan_in, 
  scan_out, 
  sck_cntexp, 
  iob_ucb_vld, 
  iob_ucb_data, 
  ucb_iob_stall, 
  rd_req_vld, 
  wr_req_vld, 
  ifill_req_vld, 
  thr_id_in, 
  buf_id_in, 
  size_in, 
  addr_in, 
  data_in, 
  req_acpted, 
  rd_ack_vld, 
  rd_nack_vld, 
  ifill_ack_vld, 
  ifill_nack_vld, 
  thr_id_out, 
  buf_id_out, 
  data_out, 
  ack_busy, 
  int_vld, 
  int_typ, 
  int_thr_id, 
  dev_id, 
  int_stat, 
  int_vec, 
  int_busy, 
  ucb_iob_vld, 
  ucb_iob_data, 
  iob_ucb_stall) ;
wire indata_buf_vld;
wire [127:0] indata_buf;
wire ucb_bus_in_scanin;
wire ucb_bus_in_scanout;
wire ucb_iob_stall_a1;
wire read_pending;
wire write_pending;
wire ifill_pending;
wire buf_full;
wire rd_buf;
wire [1:0] buf_head_next;
wire [1:0] buf_head;
wire buf_head_next0_n;
wire buf_head0_n;
wire buf_head_ff0_scanin;
wire buf_head_ff0_scanout;
wire l1clk;
wire buf_head_ff1_scanin;
wire buf_head_ff1_scanout;
wire wr_buf;
wire [1:0] buf_tail_next;
wire [1:0] buf_tail;
wire buf_tail_next0_n;
wire buf_tail0_n;
wire buf_tail_ff0_scanin;
wire buf_tail_ff0_scanout;
wire buf_tail_ff1_scanin;
wire buf_tail_ff1_scanout;
wire buf_full_next;
wire buf_full_ff_scanin;
wire buf_full_ff_scanout;
wire buf_empty_next;
wire buf_empty_next_n;
wire buf_empty;
wire buf_empty_n;
wire buf_empty_ff_scanin;
wire buf_empty_ff_scanout;
wire [117:0] req_in;
wire [8:0] unconnected_rsvd;
wire buf0_en;
wire buf0_ff_scanin;
wire buf0_ff_scanout;
wire [117:0] buf0;
wire buf1_en;
wire buf1_ff_scanin;
wire buf1_ff_scanout;
wire [117:0] buf1;
wire [117:0] req_out;
wire ifill_req_vld_nq;
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
wire int_buf_wr;
wire int_buf_vld_next;
wire int_buf_rd;
wire int_buf_vld;
wire int_buf_vld_ff_scanin;
wire int_buf_vld_ff_scanout;
wire [56:0] int_buf_in;
wire int_buf_ff_scanin;
wire int_buf_ff_scanout;
wire [56:0] int_buf;
wire [31:0] int_buf_vec;
wire int_last_rd_ff_scanin;
wire int_last_rd_ff_scanout;
wire int_last_rd;
wire outdata_buf_busy;
wire outdata_buf_wr;
wire [127:0] outdata_buf_in;
wire [31:0] outdata_vec_in;
wire ucb_bus_out_scanin;
wire ucb_bus_out_scanout;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;


// Globals
input           iol2clk;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;
input		scan_in;
output		scan_out;
input		sck_cntexp;

// Request from IO Bridge
input 		iob_ucb_vld;
input [3:0] 	iob_ucb_data;
output 		ucb_iob_stall;

// Request to local unit
output 		rd_req_vld;
output 		wr_req_vld;
output 		ifill_req_vld;
output [5:0] 	thr_id_in;
output [1:0] 	buf_id_in;
output [2:0] 	size_in;   // only pertinent to JBI and SPI
output [39:0] 	addr_in;
output [63:0] 	data_in;
input 		req_acpted;

// Ack/Nack from local unit
input 		rd_ack_vld;
input 		rd_nack_vld;
input 		ifill_ack_vld;
input 		ifill_nack_vld;
input [5:0] 	thr_id_out;
input [1:0] 	buf_id_out;
input [63:0] 	data_out;
output 		ack_busy;

// Interrupt from local unit
input		int_vld;
input [3:0] 	int_typ;     // interrupt type
input [5:0] 	int_thr_id;  // interrupt thread ID
input [8:0]  	dev_id;    // interrupt device ID
input [31:0] 	int_stat;  // interrupt status
input [5:0]  	int_vec;   // interrupt vector
output 		int_busy;

// Output to IO Bridge
output 		ucb_iob_vld;
output [3:0] 	ucb_iob_data;
input 		iob_ucb_stall;




   // Local signals










////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
ncu_ssiui4_ctl  ucb_bus_in (/*autoinst*/
				     // Outputs
				     .stall(ucb_iob_stall),	 // Templated
				     .indata_buf_vld(indata_buf_vld),
				     .indata_buf(indata_buf[127:0]),
				     // Inputs
				     .scan_in(ucb_bus_in_scanin),
				     .scan_out(ucb_bus_in_scanout),
				     .iol2clk(iol2clk),
				     .tcu_pce_ov(tcu_pce_ov),
				     .tcu_clk_stop(tcu_clk_stop),
				     .tcu_aclk(tcu_aclk),
				     .tcu_bclk(tcu_bclk),
				     .tcu_scan_en(tcu_scan_en),
				     .vld(iob_ucb_vld),		 // Templated
				     .data(iob_ucb_data[3:0]),	 // Templated
				     .stall_a1(ucb_iob_stall_a1)); // Templated

   
   /************************************************************
    * Decode inbound packet type
    ************************************************************/
assign 	 read_pending = (indata_buf[3:0] == 4'b0100) & indata_buf_vld;

assign 	 write_pending = (indata_buf[3:0] == 4'b0101) & indata_buf_vld;

assign 	 ifill_pending = (indata_buf[3:0] == 4'b0110) & indata_buf_vld;

assign 	 ucb_iob_stall_a1 = (read_pending | write_pending | ifill_pending) & buf_full;


   /************************************************************
    * Inbound buffer
    ************************************************************/
// Head pointer
assign     rd_buf = req_acpted;
assign     buf_head_next[1:0] = rd_buf ? {buf_head[0],buf_head[1]} : buf_head[1:0];

assign     buf_head_next0_n = ~buf_head_next[0] ;
assign     buf_head[0] = ~buf_head0_n ;
ncu_ssiflow_ctl_msff_ctl_macro__width_1 buf_head_ff0 
				(
				.scan_in(buf_head_ff0_scanin),
				.scan_out(buf_head_ff0_scanout),
				.dout		(buf_head0_n),
				.l1clk		(l1clk),
				.din		(buf_head_next0_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiflow_ctl_msff_ctl_macro__width_1 buf_head_ff1 
				(
				.scan_in(buf_head_ff1_scanin),
				.scan_out(buf_head_ff1_scanout),
				.dout		(buf_head[1]),
				.l1clk		(l1clk),
				.din		(buf_head_next[1]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Tail pointer
assign     wr_buf = (read_pending | write_pending | ifill_pending) & ~buf_full;

assign     buf_tail_next[1:0] = wr_buf ? {buf_tail[0], buf_tail[1]} : buf_tail[1:0];

assign   buf_tail_next0_n = ~buf_tail_next[0];
assign   buf_tail[0] = ~buf_tail0_n ;
ncu_ssiflow_ctl_msff_ctl_macro__width_1 buf_tail_ff0 
				(
				.scan_in(buf_tail_ff0_scanin),
				.scan_out(buf_tail_ff0_scanout),
				.dout		(buf_tail0_n),
				.l1clk		(l1clk),
				.din		(buf_tail_next0_n),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiflow_ctl_msff_ctl_macro__width_1 buf_tail_ff1 
				(
				.scan_in(buf_tail_ff1_scanin),
				.scan_out(buf_tail_ff1_scanout),
				.dout		(buf_tail[1]),
				.l1clk		(l1clk),
				.din		(buf_tail_next[1]),
  .siclk(siclk),
  .soclk(soclk)
				);

   // Buffer full
assign 	 buf_full_next = (buf_head_next[1:0] == buf_tail_next[1:0]) & wr_buf;
ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_1 buf_full_ff  
				(
				.scan_in(buf_full_ff_scanin),
				.scan_out(buf_full_ff_scanout),
				.dout		(buf_full),
				.l1clk		(l1clk),
				.en		(rd_buf|wr_buf),
				.din		(buf_full_next),
  .siclk(siclk),
  .soclk(soclk)
				);

// Buffer empty
assign     buf_empty_next = ((buf_head_next[1:0] == buf_tail_next[1:0]) & rd_buf) ;
assign     buf_empty_next_n = ~buf_empty_next ;
assign     buf_empty = ~buf_empty_n;
ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_1 buf_empty_ff  
				(
				.scan_in(buf_empty_ff_scanin),
				.scan_out(buf_empty_ff_scanout),
				.dout		(buf_empty_n),
				.l1clk		(l1clk),
				.en		(rd_buf|wr_buf),
				.din		(buf_empty_next_n),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	 {req_in[117:54],
	  unconnected_rsvd[8:0],
	  req_in[53:0]}		= {indata_buf[127:64],
			   	   indata_buf[63:55],
			   	   indata_buf[54:15],
			   	   indata_buf[14:12],
			   	   indata_buf[11:10],
			   	   indata_buf[9:4],
			   	   ifill_pending,
			   	   write_pending,
			   	   read_pending};
	  
   // Buffer 0
assign 	 buf0_en = buf_tail[0] & wr_buf;

ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_118 buf0_ff  
				(
				.scan_in(buf0_ff_scanin),
				.scan_out(buf0_ff_scanout),
				.dout		(buf0[117:0]),
				.l1clk		(l1clk),
				.en		(buf0_en),
				.din		(req_in[117:0]),
  .siclk(siclk),
  .soclk(soclk)
				);
   // Buffer 1
assign 	 buf1_en = buf_tail[1] & wr_buf;

ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_118 buf1_ff  
				(
				.scan_in(buf1_ff_scanin),
				.scan_out(buf1_ff_scanout),
				.dout		(buf1[117:0]),
				.l1clk		(l1clk),
				.en		(buf1_en),
				.din		(req_in[117:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign 	 req_out[117:0]  = buf_head[0] ? buf0[117:0] :
	                   buf_head[1] ? buf1[117:0] :118'b0 ;


   /************************************************************
    * Inbound interface to local unit
    ************************************************************/
assign 	 {data_in[63:0],
	  addr_in[39:0],
	  size_in[2:0],
	  buf_id_in[1:0],
	  thr_id_in[5:0],
	  ifill_req_vld_nq,
	  wr_req_vld_nq,
	  rd_req_vld_nq} = req_out[117:0];

assign 	 rd_req_vld = rd_req_vld_nq & ~buf_empty;
assign 	 wr_req_vld = wr_req_vld_nq & ~buf_empty;
assign 	 ifill_req_vld = ifill_req_vld_nq & ~buf_empty & sck_cntexp;

	  
   /************************************************************
    * Outbound Ack/Nack
    ************************************************************/
assign        ack_buf_wr = rd_ack_vld | rd_nack_vld | ifill_ack_vld | ifill_nack_vld;

assign        ack_buf_vld_next = ack_buf_wr ? 1'b1 :
                                 ack_buf_rd ? 1'b0 : ack_buf_vld;

ncu_ssiflow_ctl_msff_ctl_macro__width_1 ack_buf_vld_ff 
				(
				.scan_in(ack_buf_vld_ff_scanin),
				.scan_out(ack_buf_vld_ff_scanout),
				.dout		(ack_buf_vld),
				.l1clk		(l1clk),
				.din		(ack_buf_vld_next),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_1 ack_buf_is_nack_ff  
				(
				.scan_in(ack_buf_is_nack_ff_scanin),
				.scan_out(ack_buf_is_nack_ff_scanout),
				.dout		(ack_buf_is_nack),
				.l1clk		(l1clk),
				.en		(ack_buf_wr),
				.din		(rd_nack_vld|ifill_nack_vld),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	ack_typ_out[3:0] = rd_ack_vld    ? 4'b0001: //READ_ACK
                           rd_nack_vld   ? 4'b0000: //READ_NACK
	                   ifill_ack_vld ? 4'b0011: //IFILL_ACK
		                           4'b0111; //IFILL_NACK

assign	ack_buf_in[75:0] = {data_out[63:0],
                            buf_id_out[1:0],
                            thr_id_out[5:0],
                            ack_typ_out[3:0]};

ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_76 ack_buf_ff  
				(
				.scan_in(ack_buf_ff_scanin),
				.scan_out(ack_buf_ff_scanout),
				.dout		(ack_buf[75:0]),
				.l1clk		(l1clk),
				.en		(ack_buf_wr),
				.din		(ack_buf_in[75:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	ack_buf_vec[31:0] = ack_buf_is_nack    ? {16'h0000,16'hffff} : {32'hffff_ffff} ;

assign	ack_busy = ack_buf_vld;


   /************************************************************
    * Outbound Interrupt
    ************************************************************/
   // Assertion: int_buf_wr shoudn't be asserted if int_buf_busy
assign  int_buf_wr = int_vld;

assign  int_buf_vld_next = int_buf_wr ? 1'b1 :
                                 int_buf_rd ? 1'b0 : int_buf_vld;

ncu_ssiflow_ctl_msff_ctl_macro__width_1 int_buf_vld_ff 
				(
				.scan_in(int_buf_vld_ff_scanin),
				.scan_out(int_buf_vld_ff_scanout),
				.dout		(int_buf_vld),
				.l1clk		(l1clk),
				.din		(int_buf_vld_next),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	int_buf_in[56:0] = { int_vec[5:0],
                       int_stat[31:0],
                       dev_id[8:0],
                       int_thr_id[5:0],
                       int_typ[3:0]};

ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_57 int_buf_ff  
				(
				.scan_in(int_buf_ff_scanin),
				.scan_out(int_buf_ff_scanout),
				.dout		(int_buf[56:0]),
				.l1clk		(l1clk),
				.en		(int_buf_wr),
				.din		(int_buf_in[56:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign int_buf_vec[31:0] = {16'h0000,16'hffff} ; 
                           

assign int_busy = int_buf_vld;


   /************************************************************
    * Outbound ack/interrupt Arbitration
    ************************************************************/
ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_1 int_last_rd_ff  
				(
				.scan_in(int_last_rd_ff_scanin),
				.scan_out(int_last_rd_ff_scanout),
				.dout		(int_last_rd),
				.l1clk		(l1clk),
				.en		(ack_buf_rd|int_buf_rd),
				.din		(int_buf_rd),
  .siclk(siclk),
  .soclk(soclk)
				);
                        
assign ack_buf_rd = ~outdata_buf_busy & ack_buf_vld &
                           (~int_buf_vld | int_last_rd);

assign int_buf_rd = ~outdata_buf_busy & int_buf_vld &
                           (~ack_buf_vld | ~int_last_rd);

assign outdata_buf_wr = ack_buf_rd | int_buf_rd;

assign outdata_buf_in[127:0] = ack_buf_rd ? {ack_buf[75:12],
                                             9'b0,
                                             40'b0,
                                             3'b0,
                                             ack_buf[11:10],
                                             ack_buf[9:4],
                                             ack_buf[3:0]}:
                                            {64'b0,
                                             7'b0,
                                             int_buf[56:51],
                                             int_buf[50:19],
                                             int_buf[18:10],
                                             int_buf[9:4],
                                             int_buf[3:0]};

assign	outdata_vec_in[31:0] = ack_buf_rd ? ack_buf_vec[31:0] : int_buf_vec[31:0];


ncu_ssiuo4_ctl ucb_bus_out (/*autoinst*/
				       // Outputs
				       .vld(ucb_iob_vld),	 // Templated
				       .data(ucb_iob_data[3:0]), // Templated
				       .outdata_buf_busy(outdata_buf_busy),
				       // Inputs
				       .scan_in(ucb_bus_out_scanin),
				       .scan_out(ucb_bus_out_scanout),
				       .iol2clk(iol2clk),
				       .tcu_pce_ov(tcu_pce_ov),
				       .tcu_clk_stop(tcu_clk_stop),
				       .tcu_aclk(tcu_aclk),
				       .tcu_bclk(tcu_bclk),
				       .tcu_scan_en(tcu_scan_en),
				       .stall(iob_ucb_stall),	 // Templated
				       .outdata_buf_in(outdata_buf_in[127:0]),
				       .outdata_vec_in(outdata_vec_in[31:0]), // Templated
				       .outdata_buf_wr(outdata_buf_wr));




/**** adding clock header ****/
ncu_ssiflow_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk = tcu_aclk;
assign	soclk = tcu_bclk;
assign	   se = tcu_scan_en;
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;

// fixscan start:
assign ucb_bus_in_scanin         = scan_in                  ;
assign buf_head_ff0_scanin       = ucb_bus_in_scanout       ;
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
assign int_buf_vld_ff_scanin     = ack_buf_ff_scanout       ;
assign int_buf_ff_scanin         = int_buf_vld_ff_scanout   ;
assign int_last_rd_ff_scanin     = int_buf_ff_scanout       ;
assign ucb_bus_out_scanin        = int_last_rd_ff_scanout   ;
assign scan_out                  = ucb_bus_out_scanout      ;
// fixscan end:
endmodule 

// Local Variables:
// verilog-library-directories:(".")
// End:



// any PARAMS parms go into naming of macro

module ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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

module ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_4 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});






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

module ncu_ssiflow_ctl_msff_ctl_macro__width_1 (
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

module ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






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

module ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_128 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}}) | (dout[127:0] & ~{128{en}});






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

module ncu_ssiflow_ctl_l1clkhdr_ctl_macro (
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

module ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_118 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [117:0] fdin;
wire [116:0] so;

  input [117:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [117:0] dout;
  output scan_out;
assign fdin[117:0] = (din[117:0] & {118{en}}) | (dout[117:0] & ~{118{en}});






dff #(118)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[117:0]),
.si({scan_in,so[116:0]}),
.so({so[116:0],scan_out}),
.q(dout[117:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_76 (
  din, 
  en, 
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
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [75:0] dout;
  output scan_out;
assign fdin[75:0] = (din[75:0] & {76{en}}) | (dout[75:0] & ~{76{en}});






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

module ncu_ssiflow_ctl_msff_ctl_macro__en_1__width_57 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [56:0] fdin;
wire [55:0] so;

  input [56:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [56:0] dout;
  output scan_out;
assign fdin[56:0] = (din[56:0] & {57{en}}) | (dout[56:0] & ~{57{en}});






dff #(57)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[56:0]),
.si({scan_in,so[55:0]}),
.so({so[55:0],scan_out}),
.q(dout[56:0])
);












endmodule



// any PARAMS parms go into naming of macro

module ncu_ssiflow_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






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

module ncu_ssiflow_ctl_msff_ctl_macro__width_128 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];






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








