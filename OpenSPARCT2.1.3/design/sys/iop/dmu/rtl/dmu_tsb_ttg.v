// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_tsb_ttg.v
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
module dmu_tsb_ttg 
  (
   // Control Signals
   clk,
   rst_l,
   
   // TIC-TTG INTERFACE
   // TIC-TTG Interface (Internal Input from TIC to TTG)
   tag_deq,

   // TTG-TIC Interface (Internal Output to TIC)
   no_tag_avail,
   tag_issue,

   // TEC-TTG INTERFACE
   // TEC-TTG Interface (Internal Input from TEC to TTG)
   tag_enq,
   tag_retire,
 
   // CSR interface
   tsb_sts_ext_select,
   tsb_sts_ext_done,
   tsb_sts_full_ext_read_data,
   tsb_sts_num_pnd_dma_ext_read_data,
   tsb_sts_empty_ext_read_data,

   // Debug ports
   ttg2dbg_dbg_a,
   ttg2dbg_dbg_b,
   dbg2ttg_dbg_sel_a,
   dbg2ttg_dbg_sel_b
     );
 
  // synopsys sync_set_reset "rst_l"
    
  ///////////////////////////////////////////////////////////////////////
  // *************************   Parameters   *************************
  ///////////////////////////////////////////////////////////////////////
  parameter TAG_NUM  = 32;    // number of tags
  parameter TAG_WDTH = 5;     // number of bits to encode tag

  //////////////////////////////////////////////////////////////////////
  //*************************   Port Declarations   *******************
  //////////////////////////////////////////////////////////////////////
 
  // Control Signals
  input                                  clk;
  input 				 rst_l;
  
  // generator external interface inputs  
  input 				 tag_deq;        // request from SRM for trtag
  input 				 tag_enq;        // request from RRM
  input [TAG_WDTH-1:0] 			 tag_retire;     // trtag from RRM
  
  // generator external interface outputs
  output 				 no_tag_avail;   // all trtags are in use 
  output [TAG_WDTH-1:0] 		 tag_issue;      // trtag to be issued to SRM per request
 
  // Debug Wires
  output [`FIRE_DBG_DATA_BITS] 		ttg2dbg_dbg_a;
  output [`FIRE_DBG_DATA_BITS] 		ttg2dbg_dbg_b;
  
  input [2:0] 				dbg2ttg_dbg_sel_a;
  input [2:0] 				dbg2ttg_dbg_sel_b;
   
  // CSR interface
  input                                  tsb_sts_ext_select;
  output                                 tsb_sts_ext_done;
  output                                 tsb_sts_full_ext_read_data;
  output [5:0]                           tsb_sts_num_pnd_dma_ext_read_data;
  output                                 tsb_sts_empty_ext_read_data;

  //////////////////////////////////////////////////////////////////////
  //***********************    Wires and Regs   ************************
  //////////////////////////////////////////////////////////////////////
    
  wire 					 tag_deq; 
  reg  [TAG_WDTH-1:0] 			 next_tag_issue;  
  wire 					 n_no_tag_avail;

  wire 					 tag_enq;
  wire [TAG_WDTH-1:0] 			 tag_retire;
  

  wire [TAG_NUM-1:0] 			 tag_issue_vctr;
  wire [TAG_NUM-1:0] 			 next_tag; 
  wire [TAG_NUM-1:0] 			 higher_priority_tag;

  //non flops
  wire  [TAG_NUM-1:0] 			 nxt_tag_pool;
  reg  [TAG_NUM-1:0] 			 tag_dec_vctr;
  reg  [TAG_NUM-1:0] 			 dcd_vec;
  
  // flops
  reg [TAG_NUM-1:0] 			 tag_pool;
  reg [TAG_WDTH-1:0] 			 tag_issue;
  reg 					 no_tag_avail;
  
  // Idle
  reg [5:0] 				count;
  reg 					ttg_idle;

  // debug 
  reg [2:0] 				dbg_sel     [0:1];
  reg [`FIRE_DBG_DATA_BITS] 		dbg_bus     [0:1];
  reg [`FIRE_DBG_DATA_BITS] 		nxt_dbg_bus [0:1];
  
  // debug ports
  wire [`FIRE_DBG_DATA_BITS] 		ttg2dbg_dbg_a;          // TTG debug output a
  wire [`FIRE_DBG_DATA_BITS] 		ttg2dbg_dbg_b;          // TTG debug output b
  wire [2:0] 				dbg2ttg_dbg_sel_a;      // TTG debug select a
  wire [2:0] 				dbg2ttg_dbg_sel_b;      // TTG debug select b

  reg					tsb_empty ;

  integer 				i;  
    
  //////////////////////////////////////////////////////////////////////
  // ******** Zero-in checkers************************************
  //////////////////////////////////////////////////////////////////////

  // 0in bus_id -req tag_deq -req_id tag_issue -ret tag_enq -ret_id tag_retire  -max_ids 32
  // 0in encoder -in next_tag -out next_tag_issue -zero off
  // 0in decoder -in tag_retire -out dcd_vec
 
 
  //////////////////////////////////////////////////////////////////////
  // *********************  Combinational Logic  ***********************
  //////////////////////////////////////////////////////////////////////
 
  // debug

  always @ (dbg2ttg_dbg_sel_a or dbg2ttg_dbg_sel_b) 
    begin
      dbg_sel[0] = dbg2ttg_dbg_sel_a;
      dbg_sel[1] = dbg2ttg_dbg_sel_b;
    end

  always @ (dbg_sel[0] or dbg_sel[1] or tag_enq or tag_deq or tag_issue or tag_retire
            or no_tag_avail or ttg_idle) 
    begin
      for (i = 0; i < 2; i = i + 1) 
	begin
	  case (dbg_sel[i]) // synopsys  parallel_case infer_mux
	    3'b000: nxt_dbg_bus[i] = {2'b0, tag_enq, tag_retire};
	    3'b001: nxt_dbg_bus[i] = {1'b0, no_tag_avail, tag_deq, tag_issue};
	    3'b010: nxt_dbg_bus[i] = 8'b0;
	    3'b011: nxt_dbg_bus[i] = 8'b0;
	    3'b100: nxt_dbg_bus[i] = 8'b0;
	    3'b101: nxt_dbg_bus[i] = 8'b0;
	    3'b110: nxt_dbg_bus[i] = 8'b0;
	    3'b111: nxt_dbg_bus[i] = {7'b0, ttg_idle};
	  endcase
	end
    end

  assign ttg2dbg_dbg_a = dbg_bus[0];
  assign ttg2dbg_dbg_b = dbg_bus[1];

  // end debug


  //************************************
  //             CLEAR (RETIRE) TAG
  //************************************
  // if tag pool is empty the retired tag becomes the next tag to issue
  always @ (tag_retire or tag_enq or no_tag_avail)
    begin
      if(no_tag_avail & tag_enq)
	begin
	  dcd_vec = {TAG_NUM{1'b0}};
	  dcd_vec[tag_retire] = 1'b1;
	  tag_dec_vctr = dcd_vec & {TAG_NUM{1'b0}};
	end
      else
	begin
	  dcd_vec = {TAG_NUM{1'b0}};
	  dcd_vec[tag_retire] = 1'b1;
	  tag_dec_vctr = dcd_vec & {TAG_NUM{tag_enq}}; 
	end
    end // always @ (tag_retire or tag_enq)
  

  //************************************
  //             ISSUE TAG 
  //************************************
 
  assign tag_issue_vctr = (next_tag & {TAG_NUM{tag_deq}});
 
  
  // generate "next tag pool" storage vector
  assign nxt_tag_pool = (tag_dec_vctr | tag_pool) & ~tag_issue_vctr;
 
  // generate full signal
  assign n_no_tag_avail = ~(|tag_pool);

  always @(posedge clk)
    if (~rst_l)
      no_tag_avail <= 1'b0;
    else if (tag_deq)
      no_tag_avail <= n_no_tag_avail;
    else if (tag_enq)
      no_tag_avail <=  1'b0;

  // "tag pool" storage vector: 1 = avail, 0 = used
  always @(posedge clk)
    if (~rst_l)
      tag_pool <= 32'hffff_fffe;   // all tags available on reset
    else
      tag_pool <= nxt_tag_pool; // retire/issue tags

  //***********************************
  // priority select
  //***********************************
  
  assign higher_priority_tag[TAG_NUM-1:1] = higher_priority_tag[TAG_NUM-2:0] | tag_pool[TAG_NUM-2:0];
  assign higher_priority_tag[0] = 1'b0;
  assign next_tag[TAG_NUM-1:0] = tag_pool[TAG_NUM-1:0] & ~higher_priority_tag[TAG_NUM-1:0];
  
  //***********************************
  // encode tag 
  //***********************************

 always @(next_tag)
    begin
      
      next_tag_issue[0] = (next_tag[1]  | next_tag[3]  | next_tag[5]  |
		    next_tag[7]  | next_tag[9]  | next_tag[11] |
		    next_tag[13] | next_tag[15] |
		    next_tag[17] | next_tag[19] | next_tag[21] |
		    next_tag[23] | next_tag[25] | next_tag[27] |
		    next_tag[29] | next_tag[31]);
      
      next_tag_issue[1] = (next_tag[2]  | next_tag[3]  | next_tag[6]  |
		    next_tag[7]  | next_tag[10] | next_tag[11] |
		    next_tag[14] | next_tag[15] |
		    next_tag[18] | next_tag[19] | next_tag[22] |
		    next_tag[23] | next_tag[26] | next_tag[27] |
		    next_tag[30] | next_tag[31]);
      
      next_tag_issue[2] = (next_tag[4]  | next_tag[5]  | next_tag[6]  |
		    next_tag[7]  | next_tag[12] | next_tag[13] |
		    next_tag[14] | next_tag[15] |
		    next_tag[20] | next_tag[21] | next_tag[22] |
		    next_tag[23] | next_tag[28] | next_tag[29] |
		    next_tag[30] | next_tag[31]);
      
      next_tag_issue[3] = (next_tag[8]  | next_tag[9]  | next_tag[10] |
		    next_tag[11] | next_tag[12] | next_tag[13] |
		    next_tag[14] | next_tag[15] |
		    next_tag[24] | next_tag[25] | next_tag[26] |
		    next_tag[27] | next_tag[28] | next_tag[29] |
		    next_tag[30] | next_tag[31]);
      
      next_tag_issue[4] = (next_tag[16] | next_tag[17] | next_tag[18] |
		    next_tag[19] | next_tag[20] | next_tag[21] |
		    next_tag[22] | next_tag[23] |
		    next_tag[24] | next_tag[25] | next_tag[26] |
		    next_tag[27] | next_tag[28] | next_tag[29] |
		    next_tag[30] | next_tag[31]);
    end 

  always @(posedge clk)
    if (~rst_l)
      tag_issue <= {TAG_WDTH{1'b0}};
    else if (tag_enq & no_tag_avail)
      tag_issue <= tag_retire;
    else if (tag_deq)
      tag_issue <= next_tag_issue;
  
  // Idle counter 
  
  always @(posedge clk) 
    if (~rst_l) 
      count <= 6'b00_0000;
    else if(tag_enq | tag_deq) 
      begin
	if (tag_deq & tag_enq)
	  count <= count;
	else if (tag_deq)
	  count <= count + 1'b1;
	else
	  count <= count - 1'b1;
      end
  
  always @(count)
    if (count == 6'b00_0000)
      ttg_idle = 1'b1;
    else
      ttg_idle = 1'b0;

  always @(posedge clk)
    begin
      tsb_empty <= ttg_idle;
    end


  // CSR interface
  assign tsb_sts_ext_done = tsb_sts_ext_select;
  assign tsb_sts_full_ext_read_data = no_tag_avail;
  assign tsb_sts_num_pnd_dma_ext_read_data = count;
  assign tsb_sts_empty_ext_read_data = tsb_empty;


  // Debug port outputs
  always @ (posedge clk)
    begin 
      if(~rst_l) 
	for (i = 0; i < 2; i = i + 1)
	  dbg_bus[i] <= 8'h00;
      else 
	for (i = 0; i < 2; i = i + 1)
	  dbg_bus[i] <= nxt_dbg_bus[i];
    end // always @ (posedge clk)
  
endmodule // dmu_tsb_ttg
