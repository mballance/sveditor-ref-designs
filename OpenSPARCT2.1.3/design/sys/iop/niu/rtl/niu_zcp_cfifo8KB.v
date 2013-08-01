// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_cfifo8KB.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : niu_zcp_cfifo8KB.v
 * Author Name  : John Lo
 * Description  :   
 * Parent Module:  
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 3/25/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "niu_zcp.h"

module niu_zcp_cfifo8KB (/*AUTOARG*/
   // Outputs
   zcp_dmc_ack, zcp_dmc_dat, zcp_dmc_dat_err, zcp_dmc_ful_pkt, 
   cfifo_slv_rdata, scan_out, sram_hdr_read_data, niu_tcu_mbist_fail, 
   niu_tcu_mbist_done, mb_scan_out, mb_dmo_dout, 
   // Inputs
   clk, iol2clk, reset, wr_en, wr_data, dmc_zcp_req, double_bit_err, 
   single_bit_err, last_line_err, second_line_err, first_line_err, 
   last_line, second_line, first_line, ecc_chk_dis, chk_bit_data, 
   cfifo_ren, cfifo_wen, slv_ram_wdata, slv_ram_addr, 
   tcu_mbist_user_mode, tcu_aclk, tcu_bclk, tcu_se_scancollar_in, 
   tcu_se_scancollar_out, tcu_array_wr_inhibit, scan_in, 
   hdr_sram_rvalue, hdr_sram_rid, hdr_sram_wr_en, hdr_sram_red_clr, 
   l2clk_2x, mb_scan_in, tcu_niu_mbist_start, tcu_mbist_bisi_en, 
   tcu_scan_en
   );
   input 	            clk;
   input 		    iol2clk; // for TI sram only
   input 	            reset;
                            // from niu_zcp_tt for write to cfifo
   input 		    wr_en;
   input  [`CFIFO_W_R]      wr_data;
                            // dmc intf for read from cfifo
   input 		    dmc_zcp_req;
   output 		    zcp_dmc_ack;
   output [`CFIFO_W_R]      zcp_dmc_dat; // This is alos slave read data to niu_zcp_slv -loj
   output 		    zcp_dmc_dat_err;
   output 		    zcp_dmc_ful_pkt;
                            // slv intf
   input 		    double_bit_err; 
   input 		    single_bit_err; 
   input 		    last_line_err;  
   input                    second_line_err;
   input                    first_line_err; 
   input  		    last_line;
   input  		    second_line;
   input  		    first_line;
   input 		    ecc_chk_dis;
   input  [15:0] 	    chk_bit_data;
   input 		    cfifo_ren;    // from niu_zcp_ram_access_sm
   output [`CFIFO_W_R]      cfifo_slv_rdata;
   input 		    cfifo_wen;    // from niu_zcp_ram_access_sm
   input [`CFIFO_W_R] 	    slv_ram_wdata;
   input  [8:0] 	    slv_ram_addr; // slv ram read addr
                            // DFT signals
   input 		    tcu_mbist_user_mode;
   input 		    tcu_aclk;
   input 		    tcu_bclk;
   input 		    tcu_se_scancollar_in;
   input 		    tcu_se_scancollar_out;
// input 		    tcu_clk_stop;
   input 		    tcu_array_wr_inhibit;
   input 		    scan_in;
   output 		    scan_out;
   input  [6:0] 	    hdr_sram_rvalue;
   input  [1:0] 	    hdr_sram_rid;
   input 		    hdr_sram_wr_en;
   input 		    hdr_sram_red_clr;
   output [6:0] 	    sram_hdr_read_data;
   input 		    l2clk_2x;
                            //
   output 		    niu_tcu_mbist_fail;
   output 		    niu_tcu_mbist_done;
   input 		    mb_scan_in;
   output 		    mb_scan_out;
   output [39:0]	    mb_dmo_dout;
// input 		    tcu_pce_ov;
   input 		    tcu_niu_mbist_start;
   input 		    tcu_mbist_bisi_en;
   input 		    tcu_scan_en;

   wire [`CFIFO_W_R] 	    cfifo_slv_rdata;
   // Mar22.05 -loj
   wire			    first_line_time;
   wire			    second_line_time;
   wire 		    inject_first_line_err       = first_line_err  & first_line_time;
   wire 		    inject_second_line_err      = second_line_err & second_line_time;
   wire 		    inject_last_line_err        = last_line_err   & last_line;
   wire 		    inject_first_line_err_1bit  = inject_first_line_err  & single_bit_err;
   wire 		    inject_first_line_err_2bit  = inject_first_line_err  & double_bit_err;
   wire 		    inject_second_line_err_1bit = inject_second_line_err & single_bit_err;
   wire 		    inject_second_line_err_2bit = inject_second_line_err & double_bit_err;
   wire 		    inject_last_line_err_1bit   = inject_last_line_err   & single_bit_err;
   wire 		    inject_last_line_err_2bit   = inject_last_line_err   & double_bit_err;
   //
   wire  [6:0] 		    hdr_sram_rvalue;
   wire  [1:0] 		    hdr_sram_rid;
   wire  [6:0] 		    sram_hdr_read_data;
   wire 		    uncorr_error0;
   wire 		    uncorr_error1;
   wire   [`CFIFO_A9_R]     waddr;
   wire   [`CFIFO_A9_R]     raddr;
   wire   [`CFIFO_W_R]      wr_data;
   wire   [`CFIFO_W_R] 	    ecc_gen_din;
   wire   [`CFIFO_W_ECC_R]  wdata;
   wire   [`CFIFO_W_ECC_R]  rdata;
   wire   [`CFIFO_W_ECC_R]  ecc_chk_din;
   wire   [`CFIFO_W_R]      zcp_dmc_dat;
   wire 		    full;
   wire 		    empty;
   wire 		    we,wen,wr_en;
   wire 		    ren,rd_en;
   wire 		    ren_d1;
   wire 		    ren_d2;
   wire 		    dat_err_oc;
   wire                     err_oc;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire   [`CFIFO_W_ECC_R]  ecc_chk_dout;
   wire 		    error0;
   wire 		    no_error0;
   wire 		    corr_error0;
   wire 		    error1;
   wire 		    no_error1;
   wire 		    corr_error1;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load on
   
/* ----- start of cfifo pointer management ------------------- */
   /* -----  wr pointer ----- */
   reg  [`CFIFO_A9_PTR] nx_wptr;
   wire [`CFIFO_A9_PTR] wptr;
always @(wen or wptr)
   if (wen)
          nx_wptr = wptr + 1;
   else
          nx_wptr = wptr;      // hold the value

dffr #(`CFIFO_A9_ADD1) wptr_dffr(.clk(clk),.reset(reset),.d(nx_wptr),.q(wptr));
   
   /* -----  rd pointer ----- */
   reg  [`CFIFO_A9_PTR] nx_rptr;
   wire [`CFIFO_A9_PTR] rptr;
always @(ren or rptr)
   if (ren)
          nx_rptr = rptr + 1;
   else
          nx_rptr = rptr;      // hold the value

dffr #(`CFIFO_A9_ADD1) rptr_dffr(.clk(clk),.reset(reset),.d(nx_rptr),.q(rptr));
   
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
   wire    [`CFIFO_A9_PTR] empty_space =  
              (wptr[`CFIFO_A9] ==  rptr[`CFIFO_A9]) ?
`CFIFO_D512 - ({1'b0,wptr[`CFIFO_A9_R]} - {1'b0,rptr[`CFIFO_A9_R]}):
              ({1'b0,rptr[`CFIFO_A9_R]} - {1'b0,wptr[`CFIFO_A9_R]}) ;

   wire    [`CFIFO_A9_PTR] full_space = 
              (wptr[`CFIFO_A9] ==  rptr[`CFIFO_A9]) ?
              ({1'b0,wptr[`CFIFO_A9_R]} - {1'b0,rptr[`CFIFO_A9_R]}):
`CFIFO_D512 - ({1'b0,rptr[`CFIFO_A9_R]} - {1'b0,wptr[`CFIFO_A9_R]}) ;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on


   assign  full     = (wptr[`CFIFO_A9] == 
                     (!rptr[`CFIFO_A9])) &&
                      (wptr[`CFIFO_A9_R] == 
                       rptr[`CFIFO_A9_R]) ;

   assign  empty    = (wptr[`CFIFO_A9_PTR] == 
                       rptr[`CFIFO_A9_PTR]);

// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
   wire    overrun  =  full  & wen;
   wire    underrun =  empty & ren;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on

/* ----- end of cfifo pointer management ------------------- */
/* ----- start of glue logic ------------------------- */
   // Use eop to increase the counter.
   // Use sop to decrease the counter.
   wire    inc_cnt;
   wire    inc_cnt_p1;
   wire    inc_cnt_p2;
   wire    dec_cnt;
   
   assign  inc_cnt_p2 = we & ecc_gen_din[`CFIFO_W_SUB1];  // wr eop
df1 #(1)   inc_cnt_p1_df1(.clk(clk),.d(inc_cnt_p2),.q(inc_cnt_p1));
df1 #(1)   inc_cnt_df1   (.clk(clk),.d(inc_cnt_p1),.q(inc_cnt));   

   assign  dec_cnt    = ren_d1 & rdata[`CFIFO_W_ECC_SUB2];// rd sop

   reg  [`CFIFO_A11_PTR] pkt_cnt;

always @(posedge clk)
  if (reset)
            pkt_cnt <= 0;
  else
   case ({inc_cnt,dec_cnt}) // synopsys full_case parallel_case
     2'b00: pkt_cnt <= pkt_cnt;
     2'b01: pkt_cnt <= pkt_cnt - 1;
     2'b10: pkt_cnt <= pkt_cnt + 1;
     2'b11: pkt_cnt <= pkt_cnt;
   endcase // case({inc_cnt,dec_cnt})
   
   reg 	 zcp_dmc_ful_pkt;
always @(posedge clk)
	 zcp_dmc_ful_pkt <= (|pkt_cnt) & (~dat_err_oc);

   
/* ----- start of write path logic ------------------- */
   assign  wen = ~full  & wr_en;

   wire                     we_p1;
   wire   [`CFIFO_A9_R]     waddr_p1;
   wire   [`CFIFO_W_R] 	    ecc_gen_din_p1;
df1 #(1)      first_line_time_df1(.clk(clk),.d(first_line),         .q(first_line_time));
df1 #(1)     second_line_time_df1(.clk(clk),.d(second_line),        .q(second_line_time));
df1 #(1)                   we_df1(.clk(clk),.d(wen),                .q(we_p1));
df1 #(`CFIFO_A9)        waddr_df1(.clk(clk),.d(wptr[`CFIFO_A9_R]),  .q(waddr_p1[`CFIFO_A9_R]));
df1 #(130)        ecc_gen_din_df1(.clk(clk),.d(wr_data[`CFIFO_W_R]),.q(ecc_gen_din_p1[`CFIFO_W_R]));

   assign  we          = cfifo_wen ? 1'b1          : we_p1;
   assign  waddr       = cfifo_wen ? slv_ram_addr  : waddr_p1;
   assign  ecc_gen_din = cfifo_wen ? slv_ram_wdata : ecc_gen_din_p1;
   
// Mar22.05 -loj
   wire  		    add_first_line_err_1bit  = inject_first_line_err_1bit  & single_bit_err;
   wire 		    add_first_line_err_2bit  = inject_first_line_err_2bit  & double_bit_err;
   wire 		    add_second_line_err_1bit = inject_second_line_err_1bit & single_bit_err;
   wire 		    add_second_line_err_2bit = inject_second_line_err_2bit & double_bit_err;
   wire 		    add_last_line_err_1bit   = inject_last_line_err_1bit   & single_bit_err;
   wire 		    add_last_line_err_2bit   = inject_last_line_err_2bit   & double_bit_err;

   wire     chk_bit0_data = chk_bit_data[0]          |
                            add_first_line_err_1bit  |
			    add_first_line_err_2bit  |
			    add_second_line_err_1bit |
			    add_second_line_err_2bit |
			    add_last_line_err_1bit   |
			    add_last_line_err_2bit   ;

   wire     chk_bit1_data = chk_bit_data[1]          |
			    add_first_line_err_2bit  |
			    add_second_line_err_2bit |
			    add_last_line_err_2bit   ;

   wire [7:0] chk_bit_data_mod = {chk_bit_data[7:2],chk_bit1_data,chk_bit0_data};
   
niu_65data_ecc_generate_w_err_injection niu_65data_ecc_generate_w_err_injection0(.chk_bit_data(chk_bit_data_mod[7:0]),.din(ecc_gen_din[64:0]),  .dout(wdata[72:0]));   
niu_65data_ecc_generate_w_err_injection niu_65data_ecc_generate_w_err_injection1(.chk_bit_data(chk_bit_data[15:8]),.din(ecc_gen_din[129:65]),.dout(wdata[145:73]));   

/* ----- start of read path logic ------------------- */
df1 #(1)   rd_en_df1(.clk(clk),.d(dmc_zcp_req),.q(rd_en));
   assign  ren = ~empty & rd_en;
   
df1 #(1)      ren_d1_df1(.clk(clk),.d(ren),   .q(ren_d1));
df1 #(1)      ren_d2_df1(.clk(clk),.d(ren_d1),.q(ren_d2));
df1 #(1) zcp_dmc_ack_df1(.clk(clk),.d(ren_d2),.q(zcp_dmc_ack));

df1 #(`CFIFO_W_ECC) ecc_chk_din_df1 (.clk(clk),
                                .d(rdata[`CFIFO_W_ECC_R]),
                                .q(ecc_chk_din[`CFIFO_W_ECC_R]));

   assign  cfifo_slv_rdata = {ecc_chk_din[145:81],ecc_chk_din[72:8]};  // 6-8-05
   
// dout [72:0] refers to {data bits[64:0], check bits[7:0]}
niu_65data_ecc_correct niu_65data_ecc_correct0(
.ecc_chk_dis(ecc_chk_dis),
.din(ecc_chk_din[72:0]),           // 73b
.dout(ecc_chk_dout[72:0]),         // 73b
.no_error(no_error0), 
.error(error0),
.corr_error(corr_error0),
.uncorr_error(uncorr_error0));

niu_65data_ecc_correct niu_65data_ecc_correct1(
.ecc_chk_dis(ecc_chk_dis),
.din(ecc_chk_din[145:73]),         // 73b
.dout(ecc_chk_dout[145:73]),       // 73b
.no_error(no_error1), 
.error(error1),
.corr_error(corr_error1),
.uncorr_error(uncorr_error1));

df1 #(130) zcp_dmc_dat_df1(.clk(clk),.d({ecc_chk_dout[145:81],ecc_chk_dout[72:8]}),.q(zcp_dmc_dat[129:0]));

   // use ren_d2 to qualify err so that the control signal won't be affect by "x" coming from SRAM.
   wire    err_flow_through = (uncorr_error0 | uncorr_error1) & (~ecc_chk_dis);
   wire    err = ren_d2 & err_flow_through;
df1 #(1)   zcp_dmc_dat_err_df1(.clk(clk),.d(err_flow_through),.q(zcp_dmc_dat_err));
zcp_SRFF   dat_err_oc_SRFF    (.clk(clk),.reset(reset),.set(err),.rst(reset),.q(err_oc));
   assign  dat_err_oc = err | err_oc;

assign raddr[`CFIFO_A9_R] = cfifo_ren ? slv_ram_addr[`CFIFO_A9_R] : rptr[`CFIFO_A9_R];

/* ----- start of TI memory instantiation ---------------- */
   wire [7:0]     mb_wdata;
   wire [8:0]     mbi_adr;
   wire 	  mbi_wr_en;
   wire 	  mbi_rd_en;
   wire 	  mbi_run;
// TI SRAM
niu_ram_512_146  cfifo8KB (
.tcu_aclk(tcu_aclk),
.tcu_bclk(tcu_bclk),
.tcu_scan_en(tcu_scan_en),
.tcu_se_scancollar_in(tcu_se_scancollar_in),
.tcu_se_scancollar_out(tcu_se_scancollar_out),
//.tcu_clk_stop(tcu_clk_stop),
.tcu_array_wr_inhibit(tcu_array_wr_inhibit),
.scan_in(scan_in),          // from top
.scan_out(scan_out),        // to   top
.hdr_sram_rvalue(hdr_sram_rvalue[6:0]),
.hdr_sram_rid(hdr_sram_rid[1:0]),
.hdr_sram_wr_en(hdr_sram_wr_en),
.hdr_sram_red_clr(hdr_sram_red_clr),
.sram_hdr_read_data(sram_hdr_read_data[6:0]),
.l2clk_2x(l2clk_2x),        // 750Mhz
.reset(reset),
.mbi_wdata({mb_wdata[1:0],{18{mb_wdata[7:0]}}}),
.mbi_rd_adr(mbi_adr[8:0]),
.mbi_wr_adr(mbi_adr[8:0]),
.mbi_wr_en(mbi_wr_en),
.mbi_rd_en(mbi_rd_en),
.mbi_run(mbi_run),
// functional ports
.data_inp(wdata[`CFIFO_W_ECC_R]),
.addr_rd(raddr[`CFIFO_A9_R]),
.addr_wt(waddr[`CFIFO_A9_R]),
.wt_enable(we),
.cs_rd(1'b1),
.clk(iol2clk),
.data_out(rdata[`CFIFO_W_ECC_R])
);
  
  

/* ----- start of mbist instantiation ------------------ */
niu_mb7  zcp_mb
  (
   // Outputs
   .niu_mb7_cntrl_fifo_zcp_rd_en	(mbi_rd_en),
   .niu_mb7_cntrl_fifo_zcp_wr_en	(mbi_wr_en),
   .niu_mb7_addr			(mbi_adr[8:0]),
   .niu_mb7_wdata			(mb_wdata[7:0]),
   .niu_mb7_run				(mbi_run),
   .niu_tcu_mbist_fail_7		(niu_tcu_mbist_fail),
   .niu_tcu_mbist_done_7		(niu_tcu_mbist_done),
   .mb7_scan_out			(mb_scan_out),
   .mb7_dmo_dout                        (mb_dmo_dout[39:0]),
   // Inputs
   .mb7_scan_in				(mb_scan_in),
   .l1clk				(clk),
   .rst                                 (reset),
   .tcu_mbist_user_mode                 (tcu_mbist_user_mode),
// .tcu_pce_ov				(tcu_pce_ov),
// .tcu_clk_stop			(tcu_clk_stop),
   .tcu_aclk				(tcu_aclk),
   .tcu_bclk				(tcu_bclk),
   .tcu_niu_mbist_start_7		(tcu_niu_mbist_start),
   .tcu_mbist_bisi_en			(tcu_mbist_bisi_en),
   .niu_mb7_cntrl_fifo_zcp_data_out	(rdata[`CFIFO_W_ECC_R])
);
   
/* ----- end of mbist instantiation -------------------- */

   
endmodule // niu_zcp_cfifo8KB

