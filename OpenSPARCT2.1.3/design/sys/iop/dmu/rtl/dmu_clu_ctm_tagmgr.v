// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_clu_ctm_tagmgr.v
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
module dmu_clu_ctm_tagmgr 
  (
   // clock/reset
   clk,
   rst_l,
   
   // tag retire port 0
   tag_ret_0,
   tag_ret_0_vld,
   
   // tag retire port 1
   tag_ret_1,
   tag_ret_1_vld,
   
   // tag issue port
   nxt_tag,
   
   // tag ctl/status port
   tag_pool_full,
   nxt_tag_avail,
   nxt_tag_req
   );
  
  // synopsys sync_set_reset "rst_l"
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Parameter Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Tag Manager Configuration
  // --------------------------------------------------------
  
  parameter TAG_NUM  = 16;
  parameter TAG_WDTH = 4;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Port Declarations <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Clock/Reset Signals
  // --------------------------------------------------------
  
  input clk;
  input rst_l;
  
  // --------------------------------------------------------
  // Tag Retire Port 0
  // --------------------------------------------------------
  
  input [(TAG_WDTH - 1):0] tag_ret_0;
  input                    tag_ret_0_vld;
  
  // --------------------------------------------------------
  // Tag Retire Port 1
  // --------------------------------------------------------
  
  input [(TAG_WDTH - 1):0] tag_ret_1;
  input                    tag_ret_1_vld;
  
  // --------------------------------------------------------
  // Tag Issue Port
  // --------------------------------------------------------
  
  output [(TAG_WDTH - 1):0] nxt_tag;
  
  // --------------------------------------------------------
  // Tag Control/Status Port
  // --------------------------------------------------------
  
  output tag_pool_full;
  output nxt_tag_avail;
  input  nxt_tag_req;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> Data Type Declarations <<<<<<<<<<<<<<<<<<<<<<<<<
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ REGISTERS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // ********** Flops **********
  
  reg [(TAG_NUM - 1):0] tag_pool_vctr;
  
  // ********** Non-Flops ******
  
  reg [(TAG_WDTH - 1):0] nxt_tag;
  reg  [(TAG_NUM - 1):0] dcd_vec0;
  reg  [(TAG_NUM - 1):0] dcd_vec1;
  reg  [(TAG_NUM - 1):0] tag_dcd_0;
  reg  [(TAG_NUM - 1):0] tag_dcd_1;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~ NETS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
  // --------------------------------------------------------
  // Internal Signals
  // --------------------------------------------------------
  
  wire [(TAG_NUM - 1):0] tag_retire_vctr;
  wire [(TAG_NUM - 1):0] tag_consume_vctr;
  wire [(TAG_NUM - 1):0] nxt_tag_select;
  wire [(TAG_NUM - 1):0] higher_pri_tags;
  wire [(TAG_NUM - 1):0] nxt_tag_pool_vctr;
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> 0-in Checkers <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  /* 0in oid
     -req              nxt_tag_req
     -req_id           nxt_tag
     -ret              tag_ret_0_vld
     -ret_id           tag_ret_0
     -flush            tag_ret_1_vld
     -flush_id         tag_ret_1
     -flush_count      1
     -known_flush
     -max_ids          16
     -max_count_per_id 1
     -message "TAGMGR VIOLATION"
  */
  
  // 0in bits_on -var tag_retire_vctr -max 2
  
  // 0in bits_on -var tag_consume_vctr
  
  // 0in decode -in tag_ret_0 -out dcd_vec0
  
  // 0in decode -in tag_ret_1 -out dcd_vec1
  
  // 0in encode -in nxt_tag_select -out nxt_tag -zero off
  
  // >>>>>>>>>>>>>>>>>>>>>>>>> RTL Model <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  
  // --------------------------------------------------------
  // Decoder : tag retire port 0
  // --------------------------------------------------------
  
  always @(tag_ret_0 or tag_ret_0_vld)
    begin
      dcd_vec0            = {TAG_NUM{1'b0}};
      dcd_vec0[tag_ret_0] = 1'b1;
      tag_dcd_0           = dcd_vec0 & {TAG_NUM{tag_ret_0_vld}};
    end
  
  // --------------------------------------------------------
  // Decoder : tag retire port 1
  // --------------------------------------------------------
  
  always @(tag_ret_1 or tag_ret_1_vld)
    begin
      dcd_vec1            = {TAG_NUM{1'b0}};
      dcd_vec1[tag_ret_1] = 1'b1;
      tag_dcd_1           = dcd_vec1 & {TAG_NUM{tag_ret_1_vld}};
    end
  
  // --------------------------------------------------------
  // Tag Pool : storage vector
  // --------------------------------------------------------
  
  // generate composite tag retire vector
  assign tag_retire_vctr = tag_dcd_0 | tag_dcd_1;
  
  // generate tag consume vector
  assign tag_consume_vctr = nxt_tag_select & {TAG_NUM{nxt_tag_req}};
  
  // generate nxt_tag_avail signal
  assign nxt_tag_avail = |tag_pool_vctr;
  
  // generate tag_pool_full signal
  assign tag_pool_full = &tag_pool_vctr;
  
  // generate "next tag pool" storage vector
  assign nxt_tag_pool_vctr = (tag_retire_vctr | tag_pool_vctr) & ~tag_consume_vctr;
  
  // "tag pool" storage vector: 1 = avail, 0 = used
  always @(posedge clk)
    if (~rst_l)
      tag_pool_vctr <= {TAG_NUM{1'b1}}; // all tags available on reset
    else
      tag_pool_vctr <= nxt_tag_pool_vctr; // retire/consume tags
  
  // --------------------------------------------------------
  // Priority Select : next available tag selection
  // --------------------------------------------------------
  
  // generate "priority tag select" mask vector
  assign higher_pri_tags[(TAG_NUM-1):1] = higher_pri_tags[(TAG_NUM-2):0] | tag_pool_vctr[(TAG_NUM-2):0];
  assign higher_pri_tags[0] = 1'b0;
  
  // apply mask vector to "tag pool" vector to determine next tag
  assign nxt_tag_select[(TAG_NUM-1):0] = tag_pool_vctr[(TAG_NUM-1):0] & ~higher_pri_tags[(TAG_NUM-1):0];
  
  // --------------------------------------------------------
  // Encoder : next available tag generation
  // --------------------------------------------------------
  
  always @(nxt_tag_select[15:1])
    begin
      
      nxt_tag[0] = (nxt_tag_select[1]  | nxt_tag_select[3]  | nxt_tag_select[5]  |
                    nxt_tag_select[7]  | nxt_tag_select[9]  | nxt_tag_select[11] |
                    nxt_tag_select[13] | nxt_tag_select[15]);
      
      nxt_tag[1] = (nxt_tag_select[2]  | nxt_tag_select[3]  | nxt_tag_select[6]  |
                    nxt_tag_select[7]  | nxt_tag_select[10] | nxt_tag_select[11] |
                    nxt_tag_select[14] | nxt_tag_select[15]);
      
      nxt_tag[2] = (nxt_tag_select[4]  | nxt_tag_select[5]  | nxt_tag_select[6]  |
                    nxt_tag_select[7]  | nxt_tag_select[12] | nxt_tag_select[13] |
                    nxt_tag_select[14] | nxt_tag_select[15]);
      
      nxt_tag[3] = (nxt_tag_select[8]  | nxt_tag_select[9]  | nxt_tag_select[10] |
                    nxt_tag_select[11] | nxt_tag_select[12] | nxt_tag_select[13] |
                    nxt_tag_select[14] | nxt_tag_select[15]);
      
    end
  
endmodule // dmu_clu_ctm_tagmgr
