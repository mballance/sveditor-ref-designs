// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_tt.v
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

/***************************************************************
 *
 * File Name    : niu_zcp_tt.v
 * Author Name  : John Lo
 * Description  : 
 * Parent Module:
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 5/6/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 * Design Notes:  
 *              
 * 
 **************************************************************/

`include  "niu_zcp.h"

module niu_zcp_tt (
`ifdef NEPTUNE
dmaw_threshold,
// error handling
va_ram_perr,
dn_ram_perr,
st_ram_perr,
// tt intf
va_dout,
st_dout,
dn_dout,
tt_index_4va,
tt_index_4dn,
tt_index_4st,
// req ptr intf
credit_ok,
zcp_tt_index_err_lv,
tt_index,
buf_req,
wptr_HoQ_reg,
cross_q_end_reg,
cross_4KB_reg,
ring_size_reg,
ring_base_addr_reg,
reach_buf_end_reg,
total_num_buf_requested_reg,
// wb
wb_dn_reg,
wb_tt0,
wb_tt1,
//
tt_rd_en0,
tt_rd_en1,
tt_rd_en2,
tt_rd_en3,
tt_active,
tt_sm_rw,
// debug
tcp_payld_len,
l2_hdr_len,
l3_hdr_len,
header_len,
tt_ok_reg7,
buf_req_ok,
// MCP debug
TL,  
S,
payload_len,  // registered output.
header_delta, // registered output.
UE,
TL_bt_UE,
TL_eq_UE,
qual_ulp_end_fail_reg,
running_anchor_seq,
first_byte_buf,
last_byte_buf,
index0,
index1,
index2,
index3,
win_ok,
ulp_end_fail,
mapped_in_fail,
dmaw_threshold_fail,
unmap_on_left_oc,
last_line2,
second_line2,
first_line2,
last_line3,
second_line3,
first_line3,
`else // N2
`endif
last_line0,
second_line0,
first_line0,
last_line1,
second_line1,
first_line1,
clk,
reset,
kickoff_tt_reg,
set_tt_program_err,
fflp_data,
// zcp_slv intf
tt_en,
fn,
handle,
// fflp wr intf
ififo_ren,
ififo_dout,
// rx dmc stuff
decode_default_rdc,
decode_table_rdc,
decode_zc_rdc,
tt_rdc_reg,
fflp_rdc,
default_rdc,
table_rdc,
zc_rdc,
wr_data,
wr_en0,
wr_en1,
wr_en2,
wr_en3,
tt_state
);

                              `ifdef NEPTUNE
   input  [10:0] 	      dmaw_threshold;
                              // error handling
   input                      va_ram_perr;
   input                      dn_ram_perr;
   input                      st_ram_perr;
                              // tt intf
   input  [1023:0] 	      va_dout;
   input  [`ST_R] 	      st_dout;
   input  [`DN_R] 	      dn_dout;
   output [11:0] 	      tt_index_4va;
   output [11:0] 	      tt_index_4dn;
   output [11:0] 	      tt_index_4st;
                              // req ptr intf
   input 		      credit_ok;
   input 		      zcp_tt_index_err_lv;
   output [11:0] 	      tt_index             ;
   output 		      buf_req              ;
   output [15:0]              wptr_HoQ_reg         ;
   output 		      cross_q_end_reg      ;
   output 		      cross_4KB_reg        ;
   output [3:0] 	      ring_size_reg        ;
   output [38:0] 	      ring_base_addr_reg   ;
   output 		      reach_buf_end_reg    ;
   output [5:0] 	      total_num_buf_requested_reg;
                              // wb
   output [`DN_R] 	      wb_dn_reg;
   output 		      wb_tt0;
   output 		      wb_tt1;
                              //
   output 		      tt_rd_en0;
   output 		      tt_rd_en1;
   output 		      tt_rd_en2;
   output 		      tt_rd_en3;
   output 		      tt_active;
   output 		      tt_sm_rw;
                              // debug
   output [15:0] 	      tcp_payld_len;
   output [9:0] 	      l2_hdr_len;
   output [9:0] 	      l3_hdr_len;
   output [9:0] 	      header_len;
   output         	      tt_ok_reg7;
   output 		      buf_req_ok;
                              // MCP debug
   output [`XPAN_TCP_SEQ_SPACE]TL;
   output [`XPAN_TCP_SEQ_SPACE]S;
   output [`PKT_LEN_R]        payload_len;  // registered output.
   output [`PKT_LEN_R]	      header_delta; // registered output.
   output [`XPAN_TCP_SEQ_SPACE]UE;
   output 		      TL_bt_UE;
   output 		      TL_eq_UE;
   output 		      qual_ulp_end_fail_reg;
   output [`TCP_SEQ_SPACE]    running_anchor_seq;
   output [5:0] 	      first_byte_buf;
   output [20:0]	      last_byte_buf;
   output [5:0] 	      index0;
   output [5:0] 	      index1;
   output [5:0] 	      index2;
   output [5:0] 	      index3;
   output 		      win_ok;
   output 		      ulp_end_fail;
   output 		      mapped_in_fail;
   output 		      dmaw_threshold_fail;
   output 		      unmap_on_left_oc;
                              //
   output 		      last_line2;
   output 		      second_line2;
   output 		      first_line2;
   output 		      last_line3;
   output 		      second_line3;
   output 		      first_line3;
                              `else // N2
                              `endif
   output 		      last_line0;
   output 		      second_line0;
   output 		      first_line0;
   output 		      last_line1;
   output 		      second_line1;
   output 		      first_line1;
   input                      clk;
   // vlint flag_input_port_not_connected off
   input  [10:0]	      reset;
   // vlint flag_input_port_not_connected on
   output 		      kickoff_tt_reg;
   output 		      set_tt_program_err   ; // zcp_slv.v
   output [`IFIFO_W_R] 	      fflp_data;
                              // zcp_slv intf
   input 		      tt_en;
   input  [1:0] 	      fn;
   input  [19:0] 	      handle;
                              // fflp wr intf
                              // vlint flag_input_port_not_connected off
   input  [2:0]		      ififo_ren;
                              // vlint flag_input_port_not_connected on
   input  [`IFIFO_W_R]	      ififo_dout;
                              // rx dmc stuff
   output 		      decode_default_rdc;
   output 		      decode_table_rdc;
   output 		      decode_zc_rdc;
   output [7:0] 	      tt_rdc_reg;
   output [7:0] 	      fflp_rdc;
   input  [4:0] 	      default_rdc;
   input  [4:0] 	      table_rdc;
   input  [4:0] 	      zc_rdc;
   output [`CFIFO_W_R] 	      wr_data;
   output 		      wr_en0;
   output 		      wr_en1;
   output 		      wr_en2;
   output 		      wr_en3;
   output [3:0] 	      tt_state;
   
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics

// manually created by loj
   wire [1:0] 	        dmaw_type_reg;
   wire [23:0] 		first_byte_offset_reg;
   wire [`PKT_LEN_R] 	tt_dmaw_len0_reg;
   wire [`PKT_LEN_R] 	tt_dmaw_len1_reg;
   wire [`PKT_LEN_R] 	tt_dmaw_len2_reg;
   wire [`PKT_LEN_R] 	tt_dmaw_len3_reg;
   wire [`DMA_R] 	tt_dmaw_va0_reg;
   wire [`DMA_R] 	tt_dmaw_va1_reg;
   wire [`DMA_R] 	tt_dmaw_va2_reg;
   wire [`DMA_R] 	tt_dmaw_va3_reg;
   wire [`PKT_LEN_R] 	tt_hdr_len_reg;
   wire 		wr_2words;
   wire 		wr_4words;
   wire 		zc_mode;
   wire 		kickoff_tt;
   wire [1:0] 		mac_port;
   wire 		wr_en0;
   wire 		wr_en1;
   wire 		wr_en2;
   wire 		wr_en3;
   wire 		wr_2words0;
   wire 		wr_2words1;
   wire [`IFIFO_W_R] 	fflp_data;
   wire 		va_ram_perr;
   wire 		dn_ram_perr;
   wire 		st_ram_perr;
   wire 		tt_err = va_ram_perr | dn_ram_perr | st_ram_perr;

   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire [10:0] 		reset;
   wire 		reset9 = reset[9];   // for niu_zcp_tt_dpath
   wire 		reset10= reset[10];  // for niu_zcp_tt_sm
   wire 	        wb_tt0;
   wire 		wb_tt1;
   wire 		tt_rd_en0;
   wire 		tt_rd_en1;
   wire 		tt_rd_en2;
   wire 		tt_rd_en3;
   wire 		tt_rd_en4;
   wire 		tt_active;
   wire 		tt_sm_rw;
   wire   [7:0] 	tt_rdc_reg            ;
   wire   		buf_req               ;
   wire   [15:0]        wptr_HoQ_reg          ;
   wire   [15:0]        HoQ_reg               ;
   wire   		cross_q_end_reg       ;
   wire   		cross_4KB_reg         ;
   wire   [3:0] 	ring_size_reg         ;
   wire   [38:0] 	ring_base_addr_reg    ;
   wire   		reach_buf_end_reg     ;
   wire   [5:0] 	total_num_buf_requested_reg ; // total number of buffer requested
   wire   [`DN_R] 	wb_dn_reg             ;
   wire 		wr_4words0;
   wire 		wr_4words1;
   wire 		wr_4words2;
   wire 		wr_4words3;
   wire 		set_tt_program_err;
   wire [7:0]		tt_ok_reg;
   wire 		tt_ok_reg6 = tt_ok_reg[6];
   wire 		tt_ok_reg7 = tt_ok_reg[7];    
   wire 		buf_req_ok;
   wire [`PKT_LEN_R]    payload_len;  // registered output.
   wire 	        neptune_signature;
   wire [5:0] 		first_byte_buf_reg;
   wire [31:0] 		ld_cal_results;
   wire 		tt_fail;
   wire [2:0]           ififo_ren;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on

   
/* ----------------- start of fflp load ------------------ */
// This is the first pipeline register after ififo.
dffre #(`IFIFO_W) fflp_data_dffre (.clk(clk),
		   	      .reset(reset[0]),
                  	      .en(ififo_ren[0]),
                 	      .d(ififo_dout[`IFIFO_W_R]),
                 	      .q(fflp_data[`IFIFO_W_R]));

df1 #(1)   kickoff_tt_df1 (.clk(clk),
                       .d(ififo_ren[1]),
                       .q(kickoff_tt));

df1 #(1)   kickoff_tt_reg_df1 (.clk(clk),
                       .d(kickoff_tt),
                       .q(kickoff_tt_reg));


// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
   wire [7:0] 		B0    = fflp_data[`BBYTE0];
   wire [7:0] 		B1    = fflp_data[`BBYTE1];
   wire [7:0] 		B4    = fflp_data[`BBYTE4];
   wire [7:0] 		B6    = fflp_data[`BBYTE6];
   wire [7:0] 		B18   = fflp_data[`BBYTE18];
   wire [7:0] 		B2    = fflp_data[`BBYTE2];
   wire [7:0] 		B7    = fflp_data[`BBYTE7];
   wire [7:0] 		B20   = fflp_data[`BBYTE20];
   wire [7:0] 		B21   = fflp_data[`BBYTE21];
   wire [7:0] 		B22   = fflp_data[`BBYTE22];
   wire [7:0] 		B23   = fflp_data[`BBYTE23];
   wire [7:0] 		B24   = fflp_data[`BBYTE24];
   wire [7:0] 		B25   = fflp_data[`BBYTE25];
   wire [7:0] 		B26   = fflp_data[`BBYTE26];
   // aliasing
   wire 		vlan        = B1[7];  // 4 bytes
   wire 		llc_snap    = B1[6];  // 8 bytes
   wire                 tzfvld      = B1[0];
   wire [7:0] 		fflp_rdc    = B2;     // will be replaced by default_RDC, and table_RDC after RDC table lookup.
   wire 		hzfvld      = B4[3];
   wire [11:0] 		tt_index    ={B6[3:0],B7};
   wire 		ip_ver      = B18[6];
   wire [1:0]           tt_index_hi = tt_index[11:10];
   wire [15:0] 		ip_pkt_len  ={B20,B21}; // IPv4 pkt len or IPv6 payload len
   wire [3:0] 		ip_hdr_len  = B22[7:4]; // IPv4 header only
   wire [3:0] 		tcp_hdr_len = B22[3:0];
   wire [`TCP_SEQ_SPACE]tcp_seq_num ={B23,B24,B25,B26};
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on

   assign 		zc_mode     = tzfvld | hzfvld; // un register version
   
/* ----------------- end of fflp load -------------------- */

/* ******* translation algorithm is happening here ******* */

/* ----------------- post TT to cfifo -------------------- */
   
// latch data from zero copy processing results
// and prepare for writing to cfifo

// latch the first 20 bytes from fflp for posting to rdmc
// wire [151:0]         fflp_cword;
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
   wire [`IFIFO_W_R]    fflp_cword;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on

assign fflp_cword[63:0] = 0;
zcp_xREG #(32) fflp_cword0_xREG(.clk(clk),.reset(reset[1]),.en(ld_cal_results[26]),.din(fflp_data[95:64]  ),.qout(fflp_cword[95:64]  ));
zcp_xREG #(32) fflp_cword1_xREG(.clk(clk),.reset(reset[2]),.en(ld_cal_results[27]),.din(fflp_data[127:96] ),.qout(fflp_cword[127:96] ));
zcp_xREG #(32) fflp_cword2_xREG(.clk(clk),.reset(reset[3]),.en(ld_cal_results[28]),.din(fflp_data[159:128]),.qout(fflp_cword[159:128]));
zcp_xREG #(32) fflp_cword3_xREG(.clk(clk),.reset(reset[4]),.en(ld_cal_results[29]),.din(fflp_data[191:160]),.qout(fflp_cword[191:160]));
zcp_xREG #(24) fflp_cword4_xREG(.clk(clk),.reset(reset[5]),.en(ld_cal_results[31]),.din(fflp_data[215:192]),.qout(fflp_cword[215:192]));

/* vlint change by Shimon --- this is not used anywhere
   wire [7:0] 		CC2    = fflp_cword[`BBYTE2];
   wire [7:0] 		CC5    = fflp_cword[`BBYTE5];
*/
   // The following data will stay for 8 clocks
   // until another ld_cal_results happens.
   // These CC/fflp_cword data are valid at the same time
   // as tt_ok_reg, wb_tt, wr_2words, wr_4words.
   wire [7:0] 		CC0    = fflp_cword[`BBYTE0];
   wire [7:0] 		CC1    = fflp_cword[`BBYTE1];
   wire [7:0] 		CC3    = fflp_cword[`BBYTE3];
   wire [7:0] 		CC6    = fflp_cword[`BBYTE6];
   wire [7:0] 		CC7    = fflp_cword[`BBYTE7];
   wire [7:0] 		CC8    = fflp_cword[`BBYTE8];
   wire [7:0] 		CC9    = fflp_cword[`BBYTE9];
   wire [7:0] 		CC10   = fflp_cword[`BBYTE10];
   wire [7:0] 		CC11   = fflp_cword[`BBYTE11];
   wire [7:0] 		CC12   = fflp_cword[`BBYTE12];
   wire [7:0] 		CC13   = fflp_cword[`BBYTE13];
   wire [7:0] 		CC14   = fflp_cword[`BBYTE14];
   wire [7:0] 		CC15   = fflp_cword[`BBYTE15];
   wire [7:0] 		CC16   = fflp_cword[`BBYTE16];
   wire [7:0] 		CC17   = fflp_cword[`BBYTE17];
   wire [7:0] 		CC18   = fflp_cword[`BBYTE18];
   wire [7:0] 		CC19   = fflp_cword[`BBYTE19];
   wire [7:0] 		CC20   = fflp_cword[`BBYTE20];
   wire [7:0] 		CC21   = fflp_cword[`BBYTE21];
   wire [7:0] 		CC22   = fflp_cword[`BBYTE22];
   wire [7:0] 		CC23   = fflp_cword[`BBYTE23];
   wire [7:0] 		CC24   = fflp_cword[`BBYTE24];
   wire [7:0] 		CC25   = fflp_cword[`BBYTE25];
   wire [7:0] 		CC26   = fflp_cword[`BBYTE26];
   wire [7:0] 		CC27   = 8'b0;  // unused field
   wire [7:0] 		CC28   = 8'b0;  // unused field
   wire [7:0] 		CC29   = 8'b0;  // unused field
   wire [7:0] 		CC30   = 8'b0;  // unused field
   wire [7:0] 		CC31   = 8'b0;  // unused field
// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
   wire [7:0] 		CC4    = fflp_cword[`BBYTE4];
   wire [7:0] 		CC32   = 8'b0;  // unused field
   wire [7:0] 		CC40   = 8'b0;  // unused field
   wire [7:0] 		CC48   = 8'b0;  // unused field
   wire [7:0] 		CC56   = 8'b0;  // unused field
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
   wire [`CFIFO_W_R] 	full_cword0;
   wire [`CFIFO_W_R] 	full_cword1;
   wire [`CFIFO_W_R] 	full_cword2;
   wire [`CFIFO_W_R] 	full_cword3;
   reg  [127:0]         cword0;
   reg  [127:0]         cword1;
   wire [127:0]         cword2;
   wire [127:0]         cword3;
   wire                 rdmc_tzfvld      = CC1[0];
   wire 		rdmc_hzfvld      = CC4[3];
   wire                 rdmc_zc_mode     = rdmc_tzfvld | rdmc_hzfvld;
   wire 		rsv = 1'b0;
   
   always @ (/*AUTOSENSE*/CC0 or CC1 or CC10 or CC11 or CC12 or CC13
	     or CC14 or CC15 or CC16 or CC17 or CC18 or CC19 or CC20
	     or CC21 or CC22 or CC23 or CC24 or CC25 or CC26 or CC27
	     or CC28 or CC29 or CC3 or CC30 or CC31 or CC4 or CC6
	     or CC7 or CC8 or CC9 or HoQ_reg or default_rdc
	     or dmaw_type_reg or first_byte_buf_reg
	     or first_byte_offset_reg or fn or handle or payload_len
	     or rdmc_zc_mode or reach_buf_end_reg or rsv or table_rdc
	     or tt_err or tt_hdr_len_reg or tt_ok_reg6 or zc_rdc)
     begin
     if (rdmc_zc_mode & tt_ok_reg6)
       begin // zcp packet
	  cword0 = {CC0,CC1,{default_rdc[4:0],table_rdc[4:2]},CC3,{table_rdc[1:0],CC4[5:0]},
                    {1'b1,{tt_err,{6{rsv}}}},// <-B5[7] tt_succeed == 1 => zc mode;
                    CC6,CC7,
                    tt_hdr_len_reg[15:0],payload_len[15:0],HoQ_reg[15:0],first_byte_offset_reg[23:8]};
          cword1 = {first_byte_offset_reg[7:0],                                     // 17th Byte
                    {reach_buf_end_reg,dmaw_type_reg[1:0],first_byte_buf_reg[4:0]}, // 18th Byte // win_buf_offset == first_byte_buf_reg
                    CC18,{CC19[7],dmaw_type_reg[1:0],zc_rdc[4:0]},CC20,CC21,CC22,CC23,CC24,CC25,CC26,CC27,CC28,
                    handle[19:0],fn[1:0],CC31[1:0]}; //CC29,CC30,CC31
       end
     else
       begin // bypass packet
	  cword0 = {CC0,CC1,{default_rdc[4:0],table_rdc[4:2]},CC3,{table_rdc[1:0],CC4[5:0]},
                    {1'b0,{1'b0,{6{rsv}}}}, // <-B5[7] tt_succeed == 0 => bypass mode/ B5[6] tt_err == 0 always.
                    CC6,CC7,
                    CC8,CC9,CC10,CC11,CC12,CC13,CC14,CC15};
          cword1 = {CC16,CC17,  // end of control header
                    CC18,CC19,CC20,CC21,CC22,CC23,CC24,CC25,CC26,CC27,CC28,
                    CC29,CC30,CC31};
       end
     end // always @ (...
   
  assign  cword2 = {CC32[7:4],tt_dmaw_va0_reg[43:0],tt_dmaw_len0_reg[15:0],
                    CC40[7:4],tt_dmaw_va1_reg[43:0],tt_dmaw_len1_reg[15:0]};
  assign  cword3 = {CC48[7:4],tt_dmaw_va2_reg[43:0],tt_dmaw_len2_reg[15:0],
                    CC56[7:4],tt_dmaw_va3_reg[43:0],tt_dmaw_len3_reg[15:0]};
   

   
	   
   assign  full_cword0[`CFIFO_W_R] = {`CFIFO_SOP,    cword0};  // sop = 2'b01, B0~B15
   assign  full_cword1[`CFIFO_W_R] = {wr_2words1,1'b0,cword1}; // {eop,,,}; 
   assign  full_cword2[`CFIFO_W_R] = {2'b00,         cword2}; 
   assign  full_cword3[`CFIFO_W_R] = {2'b10,         cword3};  // {eop,,,}; 
   assign  mac_port                = CC0[7:6];

// wr_2words and wr_4words happens at the same time as 
df1 #(1)  wr_2words0_df1(.clk(clk),.d(wr_2words), .q(wr_2words0));
df1 #(1)  wr_2words1_df1(.clk(clk),.d(wr_2words0),.q(wr_2words1));
   
df1 #(1)  wr_4words0_df1(.clk(clk),.d(wr_4words), .q(wr_4words0));
df1 #(1)  wr_4words1_df1(.clk(clk),.d(wr_4words0),.q(wr_4words1));
df1 #(1)  wr_4words2_df1(.clk(clk),.d(wr_4words1),.q(wr_4words2));
df1 #(1)  wr_4words3_df1(.clk(clk),.d(wr_4words2),.q(wr_4words3));

   wire   wr_ens = wr_2words0 | wr_2words1 |
	           wr_4words0 | wr_4words1 |
	           wr_4words2 | wr_4words3 ;
   
   wire   port0 = mac_port[1:0] == 2'b00;
   wire   port1 = mac_port[1:0] == 2'b01;
   wire   port2 = mac_port[1:0] == 2'b10;
   wire   port3 = mac_port[1:0] == 2'b11;
	
   assign wr_en0 = (port0 & wr_ens);
   assign wr_en1 = (port1 & wr_ens);
   assign wr_en2 = (port2 & wr_ens);
   assign wr_en3 = (port3 & wr_ens);

   wire  [`CFIFO_W_R] wr_data = (wr_4words0 | wr_2words0) ? full_cword0 :
		                (wr_4words1 | wr_2words1) ? full_cword1 :
		                (wr_4words2             ) ? full_cword2 :
		                (wr_4words3             ) ? full_cword3 :
	                                                    full_cword0 ;

   // ECC error injection logic
   wire                       last_line0   = (port0 & (wr_2words1 | wr_4words3));
   wire                       second_line0 = (port0 & (wr_2words1 | wr_4words1));
   wire                       first_line0  = (port0 & (wr_2words0 | wr_4words0));
   wire                       last_line1   = (port1 & (wr_2words1 | wr_4words3));
   wire                       second_line1 = (port1 & (wr_2words1 | wr_4words1));
   wire                       first_line1  = (port1 & (wr_2words0 | wr_4words0));

/////////////////////////////////////////////////////////////////
//  ifdef between neptune and n2
/////////////////////////////////////////////////////////////////
   
`ifdef NEPTUNE
   wire                       last_line2   = (port2 & (wr_2words1 | wr_4words3));
   wire                       second_line2 = (port2 & (wr_2words1 | wr_4words1));
   wire                       first_line2  = (port2 & (wr_2words0 | wr_4words0));
   wire                       last_line3   = (port3 & (wr_2words1 | wr_4words3));
   wire                       second_line3 = (port3 & (wr_2words1 | wr_4words1));
   wire                       first_line3  = (port3 & (wr_2words0 | wr_4words0));
   wire [1023:0] 	va_dout;
   wire [`ST_R] 	st_dout;
   wire [`DN_R] 	dn_dout;
   wire [9:0] 		header_len;
   wire [9:0] 		l3_hdr_len;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire [23:0] 		buf_size;
   wire  [`XPAN_TCP_SEQ_SPACE]TL;
   wire  [`XPAN_TCP_SEQ_SPACE]S;
   wire  [`PKT_LEN_R]	header_delta; // registered output.
   wire  [`XPAN_TCP_SEQ_SPACE]UE;
   wire  		TL_bt_UE;
   wire  		TL_eq_UE;
   wire  		qual_ulp_end_fail_reg;
   wire  [`TCP_SEQ_SPACE]running_anchor_seq;
   wire  [5:0] 	        first_byte_buf;
   wire  [20:0]	        last_byte_buf;
   wire  [5:0] 	        index0;
   wire  [5:0] 	        index1;
   wire  [5:0] 	        index2;
   wire  [5:0] 	        index3;
   wire  	        win_ok;
   wire  	        ulp_end_fail;
   wire  	        mapped_in_fail;
   wire  	        dmaw_threshold_fail;
   wire  	        unmap_on_left_oc;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load on
   wire [10:0] 		dmaw_threshold;

   assign  neptune_signature = 1;

// tcp_payload_len (tcp_segment_len) calculation:
//
// IPv4: tcp_payld_len = ip_pkt_length (16 bits) - ip_hdr_length x 4 bytes - tcp_hdr_length x 4 bytes;
//
// IPv6: tcp_payld_len = ip_payload_length (16 bits) - tcp_hdr_length x 4 bytes;
//
// Generate pkt_off_set for calculating pkt_length for IBTP
   wire  [15:0]		ipv4_hdr_lenx4 = {10'b0,ip_hdr_len, 2'b0};
   wire  [15:0]		tcp_hdr_lenx4  = {10'b0,tcp_hdr_len,2'b0};

/* ----- Start the tt_index registration which is to resolve timing issues ----- */
// Every ram got its own tt_index as address
// wire [11:0] tt_index     ={B6[3:0],B7};

// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
   wire [3:0] 		fflp_data_4va_rsv;
   wire [3:0] 		fflp_data_4dn_rsv;
   wire [3:0] 		fflp_data_4st_rsv;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on

   wire [11:0] 		tt_index_4va;
   
dffre #(16) fflp_data_4va_dffre (.clk(clk),
		   	      .reset(reset[6]),
                  	      .en(ififo_ren[1]),
                 	      .d({ififo_dout[`BBYTE6],ififo_dout[`BBYTE7]}),
                 	      .q({fflp_data_4va_rsv[3:0],tt_index_4va[11:0]}));

   wire [11:0] 		tt_index_4dn;

dffre #(16) fflp_data_4dn_dffre (.clk(clk),
		   	      .reset(reset[7]),
                  	      .en(ififo_ren[2]),
                 	      .d({ififo_dout[`BBYTE6],ififo_dout[`BBYTE7]}),
                 	      .q({fflp_data_4dn_rsv[3:0],tt_index_4dn[11:0]}));
   
   wire [11:0] 		tt_index_4st;
dffre #(16) fflp_data_4st_dffre (.clk(clk),
		   	      .reset(reset[8]),
                  	      .en(ififo_ren[2]),
                 	      .d({ififo_dout[`BBYTE6],ififo_dout[`BBYTE7]}),
                 	      .q({fflp_data_4st_rsv[3:0],tt_index_4st[11:0]}));
/* ----- end of tt_index registration which is to resolve timing issues ----- */   

   
   reg   [15:0] 	tcp_payld_len;
always @ (/*AUTOSENSE*/ip_pkt_len or ip_ver or ipv4_hdr_lenx4
	  or tcp_hdr_lenx4)
  case(ip_ver)
    1'b0:   tcp_payld_len = ip_pkt_len[15:0] - ipv4_hdr_lenx4[15:0] - tcp_hdr_lenx4[15:0]; // IPv4
    1'b1:   tcp_payld_len = ip_pkt_len[15:0] - tcp_hdr_lenx4[15:0];                        // IPv6
    default:tcp_payld_len = ip_pkt_len[15:0] - ipv4_hdr_lenx4[15:0] - tcp_hdr_lenx4[15:0]; // IPv4
  endcase


   reg [9:0] 		l2_hdr_len;
always @ (/*AUTOSENSE*/llc_snap or vlan)
  casex({llc_snap,vlan})
    2'b00:  l2_hdr_len = 10'd14;
    2'b01:  l2_hdr_len = 10'd18;
    2'b10:  l2_hdr_len = 10'd22;
    2'b11:  l2_hdr_len = 10'd26;
    default:l2_hdr_len = 10'd14;
  endcase

  assign l3_hdr_len = ip_ver ? 10'd40 : ipv4_hdr_lenx4[9:0];
   
  assign header_len = tcp_hdr_lenx4[9:0] + l3_hdr_len[9:0] + l2_hdr_len[9:0];


/* ------------ instantiations ------------ */   
niu_zcp_tt_dpath  niu_zcp_tt_dpath   
  (/*AUTOINST*/
   // Outputs
   .tt_rdc_reg				(tt_rdc_reg[7:0]),
   .tt_ok_reg				(tt_ok_reg[7:0]),
   .dmaw_type_reg			(dmaw_type_reg[1:0]),
   .tt_dmaw_va0_reg			(tt_dmaw_va0_reg[`DMA_R]),
   .tt_dmaw_len0_reg			(tt_dmaw_len0_reg[`PKT_LEN_R]),
   .tt_dmaw_va1_reg			(tt_dmaw_va1_reg[`DMA_R]),
   .tt_dmaw_len1_reg			(tt_dmaw_len1_reg[`PKT_LEN_R]),
   .tt_dmaw_va2_reg			(tt_dmaw_va2_reg[`DMA_R]),
   .tt_dmaw_len2_reg			(tt_dmaw_len2_reg[`PKT_LEN_R]),
   .tt_dmaw_va3_reg			(tt_dmaw_va3_reg[`DMA_R]),
   .tt_dmaw_len3_reg			(tt_dmaw_len3_reg[`PKT_LEN_R]),
   .tt_hdr_len_reg			(tt_hdr_len_reg[`PKT_LEN_R]),
   .first_byte_buf_reg			(first_byte_buf_reg[5:0]),
   .first_byte_offset_reg		(first_byte_offset_reg[23:0]),
   .HoQ_reg				(HoQ_reg[15:0]),
   .wptr_HoQ_reg			(wptr_HoQ_reg[15:0]),
   .cross_q_end_reg			(cross_q_end_reg),
   .cross_4KB_reg			(cross_4KB_reg),
   .ring_size_reg			(ring_size_reg[3:0]),
   .ring_base_addr_reg			(ring_base_addr_reg[38:0]),
   .reach_buf_end_reg			(reach_buf_end_reg),
   .total_num_buf_requested_reg		(total_num_buf_requested_reg[5:0]),
   .wb_dn_reg				(wb_dn_reg[`DN_R]),
   .buf_req_ok				(buf_req_ok),
   .set_tt_program_err			(set_tt_program_err),
   .buf_size				(buf_size[23:0]),
   .TL					(TL[`XPAN_TCP_SEQ_SPACE]),
   .S					(S[`XPAN_TCP_SEQ_SPACE]),
   .payload_len				(payload_len[`PKT_LEN_R]),
   .header_delta			(header_delta[`PKT_LEN_R]),
   .UE					(UE[`XPAN_TCP_SEQ_SPACE]),
   .TL_bt_UE				(TL_bt_UE),
   .TL_eq_UE				(TL_eq_UE),
   .qual_ulp_end_fail_reg		(qual_ulp_end_fail_reg),
   .running_anchor_seq			(running_anchor_seq[`TCP_SEQ_SPACE]),
   .first_byte_buf			(first_byte_buf[5:0]),
   .last_byte_buf			(last_byte_buf[20:0]),
   .index0				(index0[5:0]),
   .index1				(index1[5:0]),
   .index2				(index2[5:0]),
   .index3				(index3[5:0]),
   .win_ok				(win_ok),
   .ulp_end_fail			(ulp_end_fail),
   .mapped_in_fail			(mapped_in_fail),
   .dmaw_threshold_fail			(dmaw_threshold_fail),
   .unmap_on_left_oc			(unmap_on_left_oc),
   // Inputs
   .clk					(clk),
   .reset9				(reset9),
   .dmaw_threshold			(dmaw_threshold[10:0]),
   .credit_ok				(credit_ok),
   .tcp_seq_num				(tcp_seq_num[`TCP_SEQ_SPACE]),
   .tcp_payld_len			(tcp_payld_len[`PKT_LEN_R]),
   .header_len				(header_len[9:0]),
   .tt_index_hi				(tt_index_hi[1:0]),
   .zcp_tt_index_err_lv			(zcp_tt_index_err_lv),
   .tt_rd_en4				(tt_rd_en4),
   .ld_cal_results			(ld_cal_results[21:0]),
   .va_dout				(va_dout[1023:0]),
   .st_dout				(st_dout[`ST_R]),
   .dn_dout				(dn_dout[`DN_R]));
`else  // N2 mode
   // Unused niu_zcp_tt_dpath signals are driven to 0.
   
   assign  dmaw_type_reg               = 0;
   assign  first_byte_offset_reg       = 0;
   assign  tt_dmaw_len0_reg            = 0;
   assign  tt_dmaw_len1_reg            = 0;
   assign  tt_dmaw_len2_reg            = 0;
   assign  tt_dmaw_len3_reg            = 0;
   assign  tt_dmaw_va0_reg             = 0;
   assign  tt_dmaw_va1_reg             = 0;
   assign  tt_dmaw_va2_reg             = 0;
   assign  tt_dmaw_va3_reg             = 0;
   assign  tt_hdr_len_reg              = 0;
   assign  va_ram_perr                 = 0;
   assign  dn_ram_perr                 = 0;
   assign  st_ram_perr                 = 0;
   
   assign  neptune_signature           = 0;
   assign  tt_ok_reg                   = 0;
   assign  buf_req_ok                  = 0;
   // error handling      
   assign  wptr_HoQ_reg                = 0;
   assign  HoQ_reg                     = 0;
   assign  cross_q_end_reg             = 0;
   assign  cross_4KB_reg               = 0;
   assign  ring_size_reg               = 0;
   assign  ring_base_addr_reg          = 0;
   assign  reach_buf_end_reg           = 0;
   assign  total_num_buf_requested_reg = 0;
   assign  wb_dn_reg                   = 0;
   //
   assign  tt_rdc_reg                  = 0;
   assign  first_byte_buf_reg          = 0;
   assign  set_tt_program_err          = 0;
   assign  payload_len                 = 0;

`endif

niu_zcp_tt_sm  niu_zcp_tt_sm
  (/*AUTOINST*/
   // Outputs
   .tt_rd_en0				(tt_rd_en0),
   .tt_rd_en1				(tt_rd_en1),
   .tt_rd_en2				(tt_rd_en2),
   .tt_rd_en3				(tt_rd_en3),
   .tt_rd_en4				(tt_rd_en4),
   .wb_tt0				(wb_tt0),
   .wb_tt1				(wb_tt1),
   .decode_default_rdc			(decode_default_rdc),
   .decode_table_rdc			(decode_table_rdc),
   .decode_zc_rdc			(decode_zc_rdc),
   .tt_active				(tt_active),
   .tt_sm_rw				(tt_sm_rw),
   .ld_cal_results			(ld_cal_results[31:0]),
   .tt_fail				(tt_fail),
   .buf_req				(buf_req),
   .wr_2words				(wr_2words),
   .wr_4words				(wr_4words),
   .tt_state				(tt_state[3:0]),
   // Inputs
   .clk					(clk),
   .reset10				(reset10),
   .kickoff_tt				(kickoff_tt),
   .tt_ok_reg				(tt_ok_reg[5:0]),
   .tt_en				(tt_en),
   .zc_mode				(zc_mode),
   .buf_req_ok				(buf_req_ok));

/* --------------- spare gates --------------- */
`ifdef NEPTUNE
wire      [3:0] do_nad;
wire      [3:0] do_nor;
wire      [3:0] do_inv;
wire      [3:0] do_mux;
wire      [3:0] do_q;
wire            so;

  zcp_spare_gates zcp_tt_spare_gates (
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
                             .rst        (reset[10:7]),
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

`else
`endif

   
endmodule // niu_zcp_tt

