// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2_tagstate_mon.v
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
`define TB_TOP0   tb_top.cpu.l2t0
`define TB_TOP1   tb_top.cpu.l2t1
`define TB_TOP2   tb_top.cpu.l2t2
`define TB_TOP3   tb_top.cpu.l2t3
`define TB_TOP4   tb_top.cpu.l2t4
`define TB_TOP5   tb_top.cpu.l2t5
`define TB_TOP6   tb_top.cpu.l2t6
`define TB_TOP7   tb_top.cpu.l2t7

module l2_tagstate_mon() ;

reg l2_tagstate_mon;

initial
begin
l2_tagstate_mon = 1; //Enabled by default
if(("l2_tagstate_mon_off"))
        l2_tagstate_mon = 0;
end

//--------------------------------------------------------------------------------------
// Enable/Disable support : MAQ
//--------------------------------------------------------------------------------------

wire flush_reset_complete = `TOP.flush_reset_complete;

reg enabled;
initial
begin
  enabled = 1'b1;
  if ($test$plusargs("l2_tagstate_mon_off"))
    enabled = 1'b0;
end

always @ (flush_reset_complete)
begin
  if (flush_reset_complete == 1'b0)
    enabled = 1'b0;

  if ((flush_reset_complete == 1'b1) && (!($test$plusargs("l2_tagstate_mon_off"))))
    enabled = 1'b1;
end

  wire  cmp_clk     =         (tb_top.cpu.l2clk & enabled);

//--------------------------------------------------------------------------------------


// MAQ:  wire  cmp_clk     =         tb_top.cpu.l2clk;
  wire  cmp_rst_l   =         tb_top.cpu.rst_l2_por_;



//----------------------------------------------------------------------------------------
// Tag and VUAD update signals
//----------------------------------------------------------------------------------------

   wire  [8:0]            l2t0_tag_index     = `TB_TOP0.tag.index0[8:0];
   wire                   l2t0_wr_en         = `TB_TOP0.tag.wr_en0;
   wire  [15:0]           l2t0_way           = `TB_TOP0.tag.way[15:0];
   wire  [27:0]           l2t0_wrdata        = `TB_TOP0.tag.wrdata0[27:0];
   wire  [21:0]           l2t0_tag           = `TB_TOP0.tag.wrdata0[27:6];

   wire  [39:0]           l2t0_addr          = `TB_TOP0.arbadr.arbdp_addr_c2[39:0];
   wire                   l2t0_inst_vld      = `TB_TOP0.arb.arb_inst_vld_c2;
   wire  [15:0]           l2t0_used          = `TB_TOP0.usaloc.usaloc_vuad_array_wr_data_c4[70:55];
   wire  [15:0]           l2t0_alloc         = `TB_TOP0.usaloc.usaloc_vuad_array_wr_data_c4[54:39];
   wire  [15:0]           l2t0_valid         = `TB_TOP0.vlddir.vlddir_vuad_array_wr_data_c4[31:16];
   wire  [15:0]           l2t0_dirty         = `TB_TOP0.vlddir.vlddir_vuad_array_wr_data_c4[15:0];
   wire  [8:0]            l2t0_vuad_index    = `TB_TOP0.vuad.vuaddp_vuad_idx_c4[8:0];
   wire                   l2t0_vuad_wr       = `TB_TOP0.vuad.vuad_array_wr_en0_c3;

   wire                   l2t0_tagonly_hit   = `TB_TOP0.tagctl.tag_hit_c2;


//----------------------------------------------------------------------------------------
// Tag and VUAD update signals
//----------------------------------------------------------------------------------------

   wire  [8:0]            l2t1_tag_index     = `TB_TOP1.tag.index0[8:0];
   wire                   l2t1_wr_en         = `TB_TOP1.tag.wr_en0;
   wire  [15:0]           l2t1_way           = `TB_TOP1.tag.way[15:0];
   wire  [27:0]           l2t1_wrdata        = `TB_TOP1.tag.wrdata0[27:0];
   wire  [21:0]           l2t1_tag           = `TB_TOP1.tag.wrdata0[27:6];

   wire  [39:0]           l2t1_addr          = `TB_TOP1.arbadr.arbdp_addr_c2[39:0];
   wire                   l2t1_inst_vld      = `TB_TOP1.arb.arb_inst_vld_c2;
   wire  [15:0]           l2t1_used          = `TB_TOP1.usaloc.usaloc_vuad_array_wr_data_c4[70:55];
   wire  [15:0]           l2t1_alloc         = `TB_TOP1.usaloc.usaloc_vuad_array_wr_data_c4[54:39];
   wire  [15:0]           l2t1_valid         = `TB_TOP1.vlddir.vlddir_vuad_array_wr_data_c4[31:16];
   wire  [15:0]           l2t1_dirty         = `TB_TOP1.vlddir.vlddir_vuad_array_wr_data_c4[15:0];
   wire  [8:0]            l2t1_vuad_index    = `TB_TOP1.vuad.vuaddp_vuad_idx_c4[8:0];
   wire                   l2t1_vuad_wr       = `TB_TOP1.vuad.vuad_array_wr_en0_c3;

   wire                   l2t1_tagonly_hit   = `TB_TOP1.tagctl.tag_hit_c2;


//----------------------------------------------------------------------------------------
// Tag and VUAD update signals
//----------------------------------------------------------------------------------------

   wire  [8:0]            l2t2_tag_index     = `TB_TOP2.tag.index0[8:0];
   wire                   l2t2_wr_en         = `TB_TOP2.tag.wr_en0;
   wire  [15:0]           l2t2_way           = `TB_TOP2.tag.way[15:0];
   wire  [27:0]           l2t2_wrdata        = `TB_TOP2.tag.wrdata0[27:0];
   wire  [21:0]           l2t2_tag           = `TB_TOP2.tag.wrdata0[27:6];

   wire  [39:0]           l2t2_addr          = `TB_TOP2.arbadr.arbdp_addr_c2[39:0];
   wire                   l2t2_inst_vld      = `TB_TOP2.arb.arb_inst_vld_c2;
   wire  [15:0]           l2t2_used          = `TB_TOP2.usaloc.usaloc_vuad_array_wr_data_c4[70:55];
   wire  [15:0]           l2t2_alloc         = `TB_TOP2.usaloc.usaloc_vuad_array_wr_data_c4[54:39];
   wire  [15:0]           l2t2_valid         = `TB_TOP2.vlddir.vlddir_vuad_array_wr_data_c4[31:16];
   wire  [15:0]           l2t2_dirty         = `TB_TOP2.vlddir.vlddir_vuad_array_wr_data_c4[15:0];
   wire  [8:0]            l2t2_vuad_index    = `TB_TOP2.vuad.vuaddp_vuad_idx_c4[8:0];
   wire                   l2t2_vuad_wr       = `TB_TOP2.vuad.vuad_array_wr_en0_c3;

   wire                   l2t2_tagonly_hit   = `TB_TOP2.tagctl.tag_hit_c2;


//----------------------------------------------------------------------------------------
// Tag and VUAD update signals
//----------------------------------------------------------------------------------------

   wire  [8:0]            l2t3_tag_index     = `TB_TOP3.tag.index0[8:0];
   wire                   l2t3_wr_en         = `TB_TOP3.tag.wr_en0;
   wire  [15:0]           l2t3_way           = `TB_TOP3.tag.way[15:0];
   wire  [27:0]           l2t3_wrdata        = `TB_TOP3.tag.wrdata0[27:0];
   wire  [21:0]           l2t3_tag           = `TB_TOP3.tag.wrdata0[27:6];

   wire  [39:0]           l2t3_addr          = `TB_TOP3.arbadr.arbdp_addr_c2[39:0];
   wire                   l2t3_inst_vld      = `TB_TOP3.arb.arb_inst_vld_c2;
   wire  [15:0]           l2t3_used          = `TB_TOP3.usaloc.usaloc_vuad_array_wr_data_c4[70:55];
   wire  [15:0]           l2t3_alloc         = `TB_TOP3.usaloc.usaloc_vuad_array_wr_data_c4[54:39];
   wire  [15:0]           l2t3_valid         = `TB_TOP3.vlddir.vlddir_vuad_array_wr_data_c4[31:16];
   wire  [15:0]           l2t3_dirty         = `TB_TOP3.vlddir.vlddir_vuad_array_wr_data_c4[15:0];
   wire  [8:0]            l2t3_vuad_index    = `TB_TOP3.vuad.vuaddp_vuad_idx_c4[8:0];
   wire                   l2t3_vuad_wr       = `TB_TOP3.vuad.vuad_array_wr_en0_c3;

   wire                   l2t3_tagonly_hit   = `TB_TOP3.tagctl.tag_hit_c2;


//----------------------------------------------------------------------------------------
// Tag and VUAD update signals
//----------------------------------------------------------------------------------------

   wire  [8:0]            l2t4_tag_index     = `TB_TOP4.tag.index0[8:0];
   wire                   l2t4_wr_en         = `TB_TOP4.tag.wr_en0;
   wire  [15:0]           l2t4_way           = `TB_TOP4.tag.way[15:0];
   wire  [27:0]           l2t4_wrdata        = `TB_TOP4.tag.wrdata0[27:0];
   wire  [21:0]           l2t4_tag           = `TB_TOP4.tag.wrdata0[27:6];

   wire  [39:0]           l2t4_addr          = `TB_TOP4.arbadr.arbdp_addr_c2[39:0];
   wire                   l2t4_inst_vld      = `TB_TOP4.arb.arb_inst_vld_c2;
   wire  [15:0]           l2t4_used          = `TB_TOP4.usaloc.usaloc_vuad_array_wr_data_c4[70:55];
   wire  [15:0]           l2t4_alloc         = `TB_TOP4.usaloc.usaloc_vuad_array_wr_data_c4[54:39];
   wire  [15:0]           l2t4_valid         = `TB_TOP4.vlddir.vlddir_vuad_array_wr_data_c4[31:16];
   wire  [15:0]           l2t4_dirty         = `TB_TOP4.vlddir.vlddir_vuad_array_wr_data_c4[15:0];
   wire  [8:0]            l2t4_vuad_index    = `TB_TOP4.vuad.vuaddp_vuad_idx_c4[8:0];
   wire                   l2t4_vuad_wr       = `TB_TOP4.vuad.vuad_array_wr_en0_c3;

   wire                   l2t4_tagonly_hit   = `TB_TOP4.tagctl.tag_hit_c2;


//----------------------------------------------------------------------------------------
// Tag and VUAD update signals
//----------------------------------------------------------------------------------------

   wire  [8:0]            l2t5_tag_index     = `TB_TOP5.tag.index0[8:0];
   wire                   l2t5_wr_en         = `TB_TOP5.tag.wr_en0;
   wire  [15:0]           l2t5_way           = `TB_TOP5.tag.way[15:0];
   wire  [27:0]           l2t5_wrdata        = `TB_TOP5.tag.wrdata0[27:0];
   wire  [21:0]           l2t5_tag           = `TB_TOP5.tag.wrdata0[27:6];

   wire  [39:0]           l2t5_addr          = `TB_TOP5.arbadr.arbdp_addr_c2[39:0];
   wire                   l2t5_inst_vld      = `TB_TOP5.arb.arb_inst_vld_c2;
   wire  [15:0]           l2t5_used          = `TB_TOP5.usaloc.usaloc_vuad_array_wr_data_c4[70:55];
   wire  [15:0]           l2t5_alloc         = `TB_TOP5.usaloc.usaloc_vuad_array_wr_data_c4[54:39];
   wire  [15:0]           l2t5_valid         = `TB_TOP5.vlddir.vlddir_vuad_array_wr_data_c4[31:16];
   wire  [15:0]           l2t5_dirty         = `TB_TOP5.vlddir.vlddir_vuad_array_wr_data_c4[15:0];
   wire  [8:0]            l2t5_vuad_index    = `TB_TOP5.vuad.vuaddp_vuad_idx_c4[8:0];
   wire                   l2t5_vuad_wr       = `TB_TOP5.vuad.vuad_array_wr_en0_c3;

   wire                   l2t5_tagonly_hit   = `TB_TOP5.tagctl.tag_hit_c2;


//----------------------------------------------------------------------------------------
// Tag and VUAD update signals
//----------------------------------------------------------------------------------------

   wire  [8:0]            l2t6_tag_index     = `TB_TOP6.tag.index0[8:0];
   wire                   l2t6_wr_en         = `TB_TOP6.tag.wr_en0;
   wire  [15:0]           l2t6_way           = `TB_TOP6.tag.way[15:0];
   wire  [27:0]           l2t6_wrdata        = `TB_TOP6.tag.wrdata0[27:0];
   wire  [21:0]           l2t6_tag           = `TB_TOP6.tag.wrdata0[27:6];

   wire  [39:0]           l2t6_addr          = `TB_TOP6.arbadr.arbdp_addr_c2[39:0];
   wire                   l2t6_inst_vld      = `TB_TOP6.arb.arb_inst_vld_c2;
   wire  [15:0]           l2t6_used          = `TB_TOP6.usaloc.usaloc_vuad_array_wr_data_c4[70:55];
   wire  [15:0]           l2t6_alloc         = `TB_TOP6.usaloc.usaloc_vuad_array_wr_data_c4[54:39];
   wire  [15:0]           l2t6_valid         = `TB_TOP6.vlddir.vlddir_vuad_array_wr_data_c4[31:16];
   wire  [15:0]           l2t6_dirty         = `TB_TOP6.vlddir.vlddir_vuad_array_wr_data_c4[15:0];
   wire  [8:0]            l2t6_vuad_index    = `TB_TOP6.vuad.vuaddp_vuad_idx_c4[8:0];
   wire                   l2t6_vuad_wr       = `TB_TOP6.vuad.vuad_array_wr_en0_c3;

   wire                   l2t6_tagonly_hit   = `TB_TOP6.tagctl.tag_hit_c2;


//----------------------------------------------------------------------------------------
// Tag and VUAD update signals
//----------------------------------------------------------------------------------------

   wire  [8:0]            l2t7_tag_index     = `TB_TOP7.tag.index0[8:0];
   wire                   l2t7_wr_en         = `TB_TOP7.tag.wr_en0;
   wire  [15:0]           l2t7_way           = `TB_TOP7.tag.way[15:0];
   wire  [27:0]           l2t7_wrdata        = `TB_TOP7.tag.wrdata0[27:0];
   wire  [21:0]           l2t7_tag           = `TB_TOP7.tag.wrdata0[27:6];

   wire  [39:0]           l2t7_addr          = `TB_TOP7.arbadr.arbdp_addr_c2[39:0];
   wire                   l2t7_inst_vld      = `TB_TOP7.arb.arb_inst_vld_c2;
   wire  [15:0]           l2t7_used          = `TB_TOP7.usaloc.usaloc_vuad_array_wr_data_c4[70:55];
   wire  [15:0]           l2t7_alloc         = `TB_TOP7.usaloc.usaloc_vuad_array_wr_data_c4[54:39];
   wire  [15:0]           l2t7_valid         = `TB_TOP7.vlddir.vlddir_vuad_array_wr_data_c4[31:16];
   wire  [15:0]           l2t7_dirty         = `TB_TOP7.vlddir.vlddir_vuad_array_wr_data_c4[15:0];
   wire  [8:0]            l2t7_vuad_index    = `TB_TOP7.vuad.vuaddp_vuad_idx_c4[8:0];
   wire                   l2t7_vuad_wr       = `TB_TOP7.vuad.vuad_array_wr_en0_c3;

   wire                   l2t7_tagonly_hit   = `TB_TOP7.tagctl.tag_hit_c2;



//=====================================================================
// Monitor to print out L2-DRAM RD/WR and RD Response
//=====================================================================





reg [8:0]  l2t0_tag_index_c1, l2t0_tag_index_c2, l2t0_tag_index_c3, l2t0_tag_index_c4;
reg        l2t0_wr_en_c1, l2t0_wr_en_c2, l2t0_wr_en_c3, l2t0_wr_en_c4;
reg [15:0] l2t0_way_c1, l2t0_way_c2, l2t0_way_c3, l2t0_way_c4;
reg [21:0] l2t0_tag_c1, l2t0_tag_c2, l2t0_tag_c3, l2t0_tag_c4; 

reg [39:0] l2t0_addr_c3, l2t0_addr_c4;
reg        l2t0_inst_vld_c3, l2t0_inst_vld_c4; 
reg        l2t0_tagonly_hit_c3, l2t0_tagonly_hit_c4; 

reg        l2t0_vuad_wr_c4;

reg  [3:0] way_0;

initial 
begin 
l2t0_tag_index_c1 = 0;
l2t0_wr_en_c1 = 0;
l2t0_way_c1 = 0;
l2t0_tag_c1 = 0;
l2t0_tag_index_c2 = 0;
l2t0_wr_en_c2 = 0;
l2t0_way_c2 = 0;
l2t0_tag_c2 = 0;
l2t0_tag_index_c3 = 0;
l2t0_wr_en_c3 = 0;
l2t0_way_c3 = 0;
l2t0_tag_c3 = 0;
l2t0_tag_index_c4 = 0;
l2t0_wr_en_c4 = 0;
l2t0_way_c4 = 0;
l2t0_tag_c4 = 0;
l2t0_addr_c3 = 0;
l2t0_inst_vld_c3 = 0;
l2t0_addr_c4 = 0;
l2t0_inst_vld_c4 = 0;
l2t0_vuad_wr_c4 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   l2t0_tag_index_c1 <= l2t0_tag_index ;
   l2t0_tag_index_c2 <= l2t0_tag_index_c1 ;
   l2t0_tag_index_c3 <= l2t0_tag_index_c2 ;
   l2t0_tag_index_c4 <= l2t0_tag_index_c3 ;

   l2t0_wr_en_c1     <= l2t0_wr_en;
   l2t0_wr_en_c2     <= l2t0_wr_en_c1;
   l2t0_wr_en_c3     <= l2t0_wr_en_c2;
   l2t0_wr_en_c4     <= l2t0_wr_en_c3;

   l2t0_way_c1       <= l2t0_way;
   l2t0_way_c2       <= l2t0_way_c1;
   l2t0_way_c3       <= l2t0_way_c2;
   l2t0_way_c4       <= l2t0_way_c3;

   l2t0_tag_c1       <= l2t0_tag;
   l2t0_tag_c2       <= l2t0_tag_c1;
   l2t0_tag_c3       <= l2t0_tag_c2;
   l2t0_tag_c4       <= l2t0_tag_c3;

   l2t0_addr_c3      <= l2t0_addr;
   l2t0_addr_c4      <= l2t0_addr_c3;

   l2t0_inst_vld_c3  <= l2t0_inst_vld;
   l2t0_inst_vld_c4  <= l2t0_inst_vld_c3;
  
   l2t0_tagonly_hit_c3  <= l2t0_tagonly_hit;
   l2t0_tagonly_hit_c4  <= l2t0_tagonly_hit_c3;

   l2t0_vuad_wr_c4   <= l2t0_vuad_wr;

    case (l2t0_way_c4) 
      16'h1: way_0 = 4'b0;
      16'h2: way_0 = 4'h1;
      16'h4: way_0 = 4'h2;
      16'h8: way_0 = 4'h3;
      16'h10: way_0 = 4'h4;
      16'h20: way_0 = 4'h5;
      16'h40: way_0 = 4'h6;
      16'h80: way_0 = 4'h7;
      16'h100: way_0 = 4'h8;
      16'h200: way_0 = 4'h9;
      16'h400: way_0 = 4'ha;
      16'h800: way_0 = 4'hb;
      16'h1000: way_0 = 4'hc;
      16'h2000: way_0 = 4'hd;
      16'h4000: way_0 = 4'he;
      16'h8000: way_0 = 4'hf;
    endcase


     // VUAD write Req 
     if (l2t0_vuad_wr_c4 ) begin 
       // VUAD & Tag Write
       if (l2t0_wr_en_c4 ) begin 
         if (l2t0_tag_index_c4 != l2t0_vuad_index) begin 

         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x, Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,0, l2t0_tagonly_hit_c4, l2t0_addr_c4, l2t0_tag_c4, l2t0_tag_index_c4,  0, way_0, l2t0_valid, l2t0_used, l2t0_alloc, l2t0_dirty); 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,0, l2t0_tag_index_c4, l2t0_vuad_index);
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,0, l2t0_addr_c4, l2t0_tag_c4, l2t0_tag_index_c4,  0, way_0, l2t0_valid, l2t0_used, l2t0_alloc, l2t0_dirty); 
         $display("%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,0, l2t0_tag_index_c4, l2t0_vuad_index);
*/
         end  else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,0,l2t0_tagonly_hit_c4, l2t0_addr_c4, l2t0_tag_c4, l2t0_tag_index_c4,  0, way_0, l2t0_valid, l2t0_used, l2t0_alloc, l2t0_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,0, l2t0_addr_c4, l2t0_tag_c4, l2t0_tag_index_c4,  0, way_0, l2t0_valid, l2t0_used, l2t0_alloc, l2t0_dirty); 
*/
         end 
       end else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only  VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,0, l2t0_tagonly_hit_c4, l2t0_addr_c4, l2t0_vuad_index, 0, l2t0_valid, l2t0_used, l2t0_alloc, l2t0_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] ->         VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,0, l2t0_addr_c4, l2t0_vuad_index, 0, l2t0_valid, l2t0_used, l2t0_alloc, l2t0_dirty); 
*/
       end
     end

   end else begin 
     if (!l2t0_vuad_wr_c4 && l2t0_wr_en_c4) begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,0,l2t0_tagonly_hit_c4, l2t0_addr_c4, l2t0_tag_c4, l2t0_tag_index_c4,  0, way_0); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,0, l2t0_addr_c4, l2t0_tag_c4, l2t0_tag_index_c4,  0, way_0); 
*/
     end
   end

end




reg [8:0]  l2t1_tag_index_c1, l2t1_tag_index_c2, l2t1_tag_index_c3, l2t1_tag_index_c4;
reg        l2t1_wr_en_c1, l2t1_wr_en_c2, l2t1_wr_en_c3, l2t1_wr_en_c4;
reg [15:0] l2t1_way_c1, l2t1_way_c2, l2t1_way_c3, l2t1_way_c4;
reg [21:0] l2t1_tag_c1, l2t1_tag_c2, l2t1_tag_c3, l2t1_tag_c4; 

reg [39:0] l2t1_addr_c3, l2t1_addr_c4;
reg        l2t1_inst_vld_c3, l2t1_inst_vld_c4; 
reg        l2t1_tagonly_hit_c3, l2t1_tagonly_hit_c4; 

reg        l2t1_vuad_wr_c4;

reg  [3:0] way_1;

initial 
begin 
l2t1_tag_index_c1 = 0;
l2t1_wr_en_c1 = 0;
l2t1_way_c1 = 0;
l2t1_tag_c1 = 0;
l2t1_tag_index_c2 = 0;
l2t1_wr_en_c2 = 0;
l2t1_way_c2 = 0;
l2t1_tag_c2 = 0;
l2t1_tag_index_c3 = 0;
l2t1_wr_en_c3 = 0;
l2t1_way_c3 = 0;
l2t1_tag_c3 = 0;
l2t1_tag_index_c4 = 0;
l2t1_wr_en_c4 = 0;
l2t1_way_c4 = 0;
l2t1_tag_c4 = 0;
l2t1_addr_c3 = 0;
l2t1_inst_vld_c3 = 0;
l2t1_addr_c4 = 0;
l2t1_inst_vld_c4 = 0;
l2t1_vuad_wr_c4 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   l2t1_tag_index_c1 <= l2t1_tag_index ;
   l2t1_tag_index_c2 <= l2t1_tag_index_c1 ;
   l2t1_tag_index_c3 <= l2t1_tag_index_c2 ;
   l2t1_tag_index_c4 <= l2t1_tag_index_c3 ;

   l2t1_wr_en_c1     <= l2t1_wr_en;
   l2t1_wr_en_c2     <= l2t1_wr_en_c1;
   l2t1_wr_en_c3     <= l2t1_wr_en_c2;
   l2t1_wr_en_c4     <= l2t1_wr_en_c3;

   l2t1_way_c1       <= l2t1_way;
   l2t1_way_c2       <= l2t1_way_c1;
   l2t1_way_c3       <= l2t1_way_c2;
   l2t1_way_c4       <= l2t1_way_c3;

   l2t1_tag_c1       <= l2t1_tag;
   l2t1_tag_c2       <= l2t1_tag_c1;
   l2t1_tag_c3       <= l2t1_tag_c2;
   l2t1_tag_c4       <= l2t1_tag_c3;

   l2t1_addr_c3      <= l2t1_addr;
   l2t1_addr_c4      <= l2t1_addr_c3;

   l2t1_inst_vld_c3  <= l2t1_inst_vld;
   l2t1_inst_vld_c4  <= l2t1_inst_vld_c3;
  
   l2t1_tagonly_hit_c3  <= l2t1_tagonly_hit;
   l2t1_tagonly_hit_c4  <= l2t1_tagonly_hit_c3;

   l2t1_vuad_wr_c4   <= l2t1_vuad_wr;

    case (l2t1_way_c4) 
      16'h1: way_1 = 4'b0;
      16'h2: way_1 = 4'h1;
      16'h4: way_1 = 4'h2;
      16'h8: way_1 = 4'h3;
      16'h10: way_1 = 4'h4;
      16'h20: way_1 = 4'h5;
      16'h40: way_1 = 4'h6;
      16'h80: way_1 = 4'h7;
      16'h100: way_1 = 4'h8;
      16'h200: way_1 = 4'h9;
      16'h400: way_1 = 4'ha;
      16'h800: way_1 = 4'hb;
      16'h1000: way_1 = 4'hc;
      16'h2000: way_1 = 4'hd;
      16'h4000: way_1 = 4'he;
      16'h8000: way_1 = 4'hf;
    endcase


     // VUAD write Req 
     if (l2t1_vuad_wr_c4 ) begin 
       // VUAD & Tag Write
       if (l2t1_wr_en_c4 ) begin 
         if (l2t1_tag_index_c4 != l2t1_vuad_index) begin 

         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x, Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,1, l2t1_tagonly_hit_c4, l2t1_addr_c4, l2t1_tag_c4, l2t1_tag_index_c4,  1, way_1, l2t1_valid, l2t1_used, l2t1_alloc, l2t1_dirty); 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,1, l2t1_tag_index_c4, l2t1_vuad_index);
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,1, l2t1_addr_c4, l2t1_tag_c4, l2t1_tag_index_c4,  1, way_1, l2t1_valid, l2t1_used, l2t1_alloc, l2t1_dirty); 
         $display("%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,1, l2t1_tag_index_c4, l2t1_vuad_index);
*/
         end  else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,1,l2t1_tagonly_hit_c4, l2t1_addr_c4, l2t1_tag_c4, l2t1_tag_index_c4,  1, way_1, l2t1_valid, l2t1_used, l2t1_alloc, l2t1_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,1, l2t1_addr_c4, l2t1_tag_c4, l2t1_tag_index_c4,  1, way_1, l2t1_valid, l2t1_used, l2t1_alloc, l2t1_dirty); 
*/
         end 
       end else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only  VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,1, l2t1_tagonly_hit_c4, l2t1_addr_c4, l2t1_vuad_index, 1, l2t1_valid, l2t1_used, l2t1_alloc, l2t1_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] ->         VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,1, l2t1_addr_c4, l2t1_vuad_index, 1, l2t1_valid, l2t1_used, l2t1_alloc, l2t1_dirty); 
*/
       end
     end

   end else begin 
     if (!l2t1_vuad_wr_c4 && l2t1_wr_en_c4) begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,1,l2t1_tagonly_hit_c4, l2t1_addr_c4, l2t1_tag_c4, l2t1_tag_index_c4,  1, way_1); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,1, l2t1_addr_c4, l2t1_tag_c4, l2t1_tag_index_c4,  1, way_1); 
*/
     end
   end

end




reg [8:0]  l2t2_tag_index_c1, l2t2_tag_index_c2, l2t2_tag_index_c3, l2t2_tag_index_c4;
reg        l2t2_wr_en_c1, l2t2_wr_en_c2, l2t2_wr_en_c3, l2t2_wr_en_c4;
reg [15:0] l2t2_way_c1, l2t2_way_c2, l2t2_way_c3, l2t2_way_c4;
reg [21:0] l2t2_tag_c1, l2t2_tag_c2, l2t2_tag_c3, l2t2_tag_c4; 

reg [39:0] l2t2_addr_c3, l2t2_addr_c4;
reg        l2t2_inst_vld_c3, l2t2_inst_vld_c4; 
reg        l2t2_tagonly_hit_c3, l2t2_tagonly_hit_c4; 

reg        l2t2_vuad_wr_c4;

reg  [3:0] way_2;

initial 
begin 
l2t2_tag_index_c1 = 0;
l2t2_wr_en_c1 = 0;
l2t2_way_c1 = 0;
l2t2_tag_c1 = 0;
l2t2_tag_index_c2 = 0;
l2t2_wr_en_c2 = 0;
l2t2_way_c2 = 0;
l2t2_tag_c2 = 0;
l2t2_tag_index_c3 = 0;
l2t2_wr_en_c3 = 0;
l2t2_way_c3 = 0;
l2t2_tag_c3 = 0;
l2t2_tag_index_c4 = 0;
l2t2_wr_en_c4 = 0;
l2t2_way_c4 = 0;
l2t2_tag_c4 = 0;
l2t2_addr_c3 = 0;
l2t2_inst_vld_c3 = 0;
l2t2_addr_c4 = 0;
l2t2_inst_vld_c4 = 0;
l2t2_vuad_wr_c4 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   l2t2_tag_index_c1 <= l2t2_tag_index ;
   l2t2_tag_index_c2 <= l2t2_tag_index_c1 ;
   l2t2_tag_index_c3 <= l2t2_tag_index_c2 ;
   l2t2_tag_index_c4 <= l2t2_tag_index_c3 ;

   l2t2_wr_en_c1     <= l2t2_wr_en;
   l2t2_wr_en_c2     <= l2t2_wr_en_c1;
   l2t2_wr_en_c3     <= l2t2_wr_en_c2;
   l2t2_wr_en_c4     <= l2t2_wr_en_c3;

   l2t2_way_c1       <= l2t2_way;
   l2t2_way_c2       <= l2t2_way_c1;
   l2t2_way_c3       <= l2t2_way_c2;
   l2t2_way_c4       <= l2t2_way_c3;

   l2t2_tag_c1       <= l2t2_tag;
   l2t2_tag_c2       <= l2t2_tag_c1;
   l2t2_tag_c3       <= l2t2_tag_c2;
   l2t2_tag_c4       <= l2t2_tag_c3;

   l2t2_addr_c3      <= l2t2_addr;
   l2t2_addr_c4      <= l2t2_addr_c3;

   l2t2_inst_vld_c3  <= l2t2_inst_vld;
   l2t2_inst_vld_c4  <= l2t2_inst_vld_c3;
  
   l2t2_tagonly_hit_c3  <= l2t2_tagonly_hit;
   l2t2_tagonly_hit_c4  <= l2t2_tagonly_hit_c3;

   l2t2_vuad_wr_c4   <= l2t2_vuad_wr;

    case (l2t2_way_c4) 
      16'h1: way_2 = 4'b0;
      16'h2: way_2 = 4'h1;
      16'h4: way_2 = 4'h2;
      16'h8: way_2 = 4'h3;
      16'h10: way_2 = 4'h4;
      16'h20: way_2 = 4'h5;
      16'h40: way_2 = 4'h6;
      16'h80: way_2 = 4'h7;
      16'h100: way_2 = 4'h8;
      16'h200: way_2 = 4'h9;
      16'h400: way_2 = 4'ha;
      16'h800: way_2 = 4'hb;
      16'h1000: way_2 = 4'hc;
      16'h2000: way_2 = 4'hd;
      16'h4000: way_2 = 4'he;
      16'h8000: way_2 = 4'hf;
    endcase


     // VUAD write Req 
     if (l2t2_vuad_wr_c4 ) begin 
       // VUAD & Tag Write
       if (l2t2_wr_en_c4 ) begin 
         if (l2t2_tag_index_c4 != l2t2_vuad_index) begin 

         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x, Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,2, l2t2_tagonly_hit_c4, l2t2_addr_c4, l2t2_tag_c4, l2t2_tag_index_c4,  2, way_2, l2t2_valid, l2t2_used, l2t2_alloc, l2t2_dirty); 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,2, l2t2_tag_index_c4, l2t2_vuad_index);
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,2, l2t2_addr_c4, l2t2_tag_c4, l2t2_tag_index_c4,  2, way_2, l2t2_valid, l2t2_used, l2t2_alloc, l2t2_dirty); 
         $display("%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,2, l2t2_tag_index_c4, l2t2_vuad_index);
*/
         end  else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,2,l2t2_tagonly_hit_c4, l2t2_addr_c4, l2t2_tag_c4, l2t2_tag_index_c4,  2, way_2, l2t2_valid, l2t2_used, l2t2_alloc, l2t2_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,2, l2t2_addr_c4, l2t2_tag_c4, l2t2_tag_index_c4,  2, way_2, l2t2_valid, l2t2_used, l2t2_alloc, l2t2_dirty); 
*/
         end 
       end else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only  VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,2, l2t2_tagonly_hit_c4, l2t2_addr_c4, l2t2_vuad_index, 2, l2t2_valid, l2t2_used, l2t2_alloc, l2t2_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] ->         VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,2, l2t2_addr_c4, l2t2_vuad_index, 2, l2t2_valid, l2t2_used, l2t2_alloc, l2t2_dirty); 
*/
       end
     end

   end else begin 
     if (!l2t2_vuad_wr_c4 && l2t2_wr_en_c4) begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,2,l2t2_tagonly_hit_c4, l2t2_addr_c4, l2t2_tag_c4, l2t2_tag_index_c4,  2, way_2); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,2, l2t2_addr_c4, l2t2_tag_c4, l2t2_tag_index_c4,  2, way_2); 
*/
     end
   end

end




reg [8:0]  l2t3_tag_index_c1, l2t3_tag_index_c2, l2t3_tag_index_c3, l2t3_tag_index_c4;
reg        l2t3_wr_en_c1, l2t3_wr_en_c2, l2t3_wr_en_c3, l2t3_wr_en_c4;
reg [15:0] l2t3_way_c1, l2t3_way_c2, l2t3_way_c3, l2t3_way_c4;
reg [21:0] l2t3_tag_c1, l2t3_tag_c2, l2t3_tag_c3, l2t3_tag_c4; 

reg [39:0] l2t3_addr_c3, l2t3_addr_c4;
reg        l2t3_inst_vld_c3, l2t3_inst_vld_c4; 
reg        l2t3_tagonly_hit_c3, l2t3_tagonly_hit_c4; 

reg        l2t3_vuad_wr_c4;

reg  [3:0] way_3;

initial 
begin 
l2t3_tag_index_c1 = 0;
l2t3_wr_en_c1 = 0;
l2t3_way_c1 = 0;
l2t3_tag_c1 = 0;
l2t3_tag_index_c2 = 0;
l2t3_wr_en_c2 = 0;
l2t3_way_c2 = 0;
l2t3_tag_c2 = 0;
l2t3_tag_index_c3 = 0;
l2t3_wr_en_c3 = 0;
l2t3_way_c3 = 0;
l2t3_tag_c3 = 0;
l2t3_tag_index_c4 = 0;
l2t3_wr_en_c4 = 0;
l2t3_way_c4 = 0;
l2t3_tag_c4 = 0;
l2t3_addr_c3 = 0;
l2t3_inst_vld_c3 = 0;
l2t3_addr_c4 = 0;
l2t3_inst_vld_c4 = 0;
l2t3_vuad_wr_c4 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   l2t3_tag_index_c1 <= l2t3_tag_index ;
   l2t3_tag_index_c2 <= l2t3_tag_index_c1 ;
   l2t3_tag_index_c3 <= l2t3_tag_index_c2 ;
   l2t3_tag_index_c4 <= l2t3_tag_index_c3 ;

   l2t3_wr_en_c1     <= l2t3_wr_en;
   l2t3_wr_en_c2     <= l2t3_wr_en_c1;
   l2t3_wr_en_c3     <= l2t3_wr_en_c2;
   l2t3_wr_en_c4     <= l2t3_wr_en_c3;

   l2t3_way_c1       <= l2t3_way;
   l2t3_way_c2       <= l2t3_way_c1;
   l2t3_way_c3       <= l2t3_way_c2;
   l2t3_way_c4       <= l2t3_way_c3;

   l2t3_tag_c1       <= l2t3_tag;
   l2t3_tag_c2       <= l2t3_tag_c1;
   l2t3_tag_c3       <= l2t3_tag_c2;
   l2t3_tag_c4       <= l2t3_tag_c3;

   l2t3_addr_c3      <= l2t3_addr;
   l2t3_addr_c4      <= l2t3_addr_c3;

   l2t3_inst_vld_c3  <= l2t3_inst_vld;
   l2t3_inst_vld_c4  <= l2t3_inst_vld_c3;
  
   l2t3_tagonly_hit_c3  <= l2t3_tagonly_hit;
   l2t3_tagonly_hit_c4  <= l2t3_tagonly_hit_c3;

   l2t3_vuad_wr_c4   <= l2t3_vuad_wr;

    case (l2t3_way_c4) 
      16'h1: way_3 = 4'b0;
      16'h2: way_3 = 4'h1;
      16'h4: way_3 = 4'h2;
      16'h8: way_3 = 4'h3;
      16'h10: way_3 = 4'h4;
      16'h20: way_3 = 4'h5;
      16'h40: way_3 = 4'h6;
      16'h80: way_3 = 4'h7;
      16'h100: way_3 = 4'h8;
      16'h200: way_3 = 4'h9;
      16'h400: way_3 = 4'ha;
      16'h800: way_3 = 4'hb;
      16'h1000: way_3 = 4'hc;
      16'h2000: way_3 = 4'hd;
      16'h4000: way_3 = 4'he;
      16'h8000: way_3 = 4'hf;
    endcase


     // VUAD write Req 
     if (l2t3_vuad_wr_c4 ) begin 
       // VUAD & Tag Write
       if (l2t3_wr_en_c4 ) begin 
         if (l2t3_tag_index_c4 != l2t3_vuad_index) begin 

         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x, Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,3, l2t3_tagonly_hit_c4, l2t3_addr_c4, l2t3_tag_c4, l2t3_tag_index_c4,  3, way_3, l2t3_valid, l2t3_used, l2t3_alloc, l2t3_dirty); 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,3, l2t3_tag_index_c4, l2t3_vuad_index);
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,3, l2t3_addr_c4, l2t3_tag_c4, l2t3_tag_index_c4,  3, way_3, l2t3_valid, l2t3_used, l2t3_alloc, l2t3_dirty); 
         $display("%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,3, l2t3_tag_index_c4, l2t3_vuad_index);
*/
         end  else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,3,l2t3_tagonly_hit_c4, l2t3_addr_c4, l2t3_tag_c4, l2t3_tag_index_c4,  3, way_3, l2t3_valid, l2t3_used, l2t3_alloc, l2t3_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,3, l2t3_addr_c4, l2t3_tag_c4, l2t3_tag_index_c4,  3, way_3, l2t3_valid, l2t3_used, l2t3_alloc, l2t3_dirty); 
*/
         end 
       end else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only  VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,3, l2t3_tagonly_hit_c4, l2t3_addr_c4, l2t3_vuad_index, 3, l2t3_valid, l2t3_used, l2t3_alloc, l2t3_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] ->         VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,3, l2t3_addr_c4, l2t3_vuad_index, 3, l2t3_valid, l2t3_used, l2t3_alloc, l2t3_dirty); 
*/
       end
     end

   end else begin 
     if (!l2t3_vuad_wr_c4 && l2t3_wr_en_c4) begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,3,l2t3_tagonly_hit_c4, l2t3_addr_c4, l2t3_tag_c4, l2t3_tag_index_c4,  3, way_3); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,3, l2t3_addr_c4, l2t3_tag_c4, l2t3_tag_index_c4,  3, way_3); 
*/
     end
   end

end




reg [8:0]  l2t4_tag_index_c1, l2t4_tag_index_c2, l2t4_tag_index_c3, l2t4_tag_index_c4;
reg        l2t4_wr_en_c1, l2t4_wr_en_c2, l2t4_wr_en_c3, l2t4_wr_en_c4;
reg [15:0] l2t4_way_c1, l2t4_way_c2, l2t4_way_c3, l2t4_way_c4;
reg [21:0] l2t4_tag_c1, l2t4_tag_c2, l2t4_tag_c3, l2t4_tag_c4; 

reg [39:0] l2t4_addr_c3, l2t4_addr_c4;
reg        l2t4_inst_vld_c3, l2t4_inst_vld_c4; 
reg        l2t4_tagonly_hit_c3, l2t4_tagonly_hit_c4; 

reg        l2t4_vuad_wr_c4;

reg  [3:0] way_4;

initial 
begin 
l2t4_tag_index_c1 = 0;
l2t4_wr_en_c1 = 0;
l2t4_way_c1 = 0;
l2t4_tag_c1 = 0;
l2t4_tag_index_c2 = 0;
l2t4_wr_en_c2 = 0;
l2t4_way_c2 = 0;
l2t4_tag_c2 = 0;
l2t4_tag_index_c3 = 0;
l2t4_wr_en_c3 = 0;
l2t4_way_c3 = 0;
l2t4_tag_c3 = 0;
l2t4_tag_index_c4 = 0;
l2t4_wr_en_c4 = 0;
l2t4_way_c4 = 0;
l2t4_tag_c4 = 0;
l2t4_addr_c3 = 0;
l2t4_inst_vld_c3 = 0;
l2t4_addr_c4 = 0;
l2t4_inst_vld_c4 = 0;
l2t4_vuad_wr_c4 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   l2t4_tag_index_c1 <= l2t4_tag_index ;
   l2t4_tag_index_c2 <= l2t4_tag_index_c1 ;
   l2t4_tag_index_c3 <= l2t4_tag_index_c2 ;
   l2t4_tag_index_c4 <= l2t4_tag_index_c3 ;

   l2t4_wr_en_c1     <= l2t4_wr_en;
   l2t4_wr_en_c2     <= l2t4_wr_en_c1;
   l2t4_wr_en_c3     <= l2t4_wr_en_c2;
   l2t4_wr_en_c4     <= l2t4_wr_en_c3;

   l2t4_way_c1       <= l2t4_way;
   l2t4_way_c2       <= l2t4_way_c1;
   l2t4_way_c3       <= l2t4_way_c2;
   l2t4_way_c4       <= l2t4_way_c3;

   l2t4_tag_c1       <= l2t4_tag;
   l2t4_tag_c2       <= l2t4_tag_c1;
   l2t4_tag_c3       <= l2t4_tag_c2;
   l2t4_tag_c4       <= l2t4_tag_c3;

   l2t4_addr_c3      <= l2t4_addr;
   l2t4_addr_c4      <= l2t4_addr_c3;

   l2t4_inst_vld_c3  <= l2t4_inst_vld;
   l2t4_inst_vld_c4  <= l2t4_inst_vld_c3;
  
   l2t4_tagonly_hit_c3  <= l2t4_tagonly_hit;
   l2t4_tagonly_hit_c4  <= l2t4_tagonly_hit_c3;

   l2t4_vuad_wr_c4   <= l2t4_vuad_wr;

    case (l2t4_way_c4) 
      16'h1: way_4 = 4'b0;
      16'h2: way_4 = 4'h1;
      16'h4: way_4 = 4'h2;
      16'h8: way_4 = 4'h3;
      16'h10: way_4 = 4'h4;
      16'h20: way_4 = 4'h5;
      16'h40: way_4 = 4'h6;
      16'h80: way_4 = 4'h7;
      16'h100: way_4 = 4'h8;
      16'h200: way_4 = 4'h9;
      16'h400: way_4 = 4'ha;
      16'h800: way_4 = 4'hb;
      16'h1000: way_4 = 4'hc;
      16'h2000: way_4 = 4'hd;
      16'h4000: way_4 = 4'he;
      16'h8000: way_4 = 4'hf;
    endcase


     // VUAD write Req 
     if (l2t4_vuad_wr_c4 ) begin 
       // VUAD & Tag Write
       if (l2t4_wr_en_c4 ) begin 
         if (l2t4_tag_index_c4 != l2t4_vuad_index) begin 

         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x, Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,4, l2t4_tagonly_hit_c4, l2t4_addr_c4, l2t4_tag_c4, l2t4_tag_index_c4,  4, way_4, l2t4_valid, l2t4_used, l2t4_alloc, l2t4_dirty); 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,4, l2t4_tag_index_c4, l2t4_vuad_index);
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,4, l2t4_addr_c4, l2t4_tag_c4, l2t4_tag_index_c4,  4, way_4, l2t4_valid, l2t4_used, l2t4_alloc, l2t4_dirty); 
         $display("%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,4, l2t4_tag_index_c4, l2t4_vuad_index);
*/
         end  else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,4,l2t4_tagonly_hit_c4, l2t4_addr_c4, l2t4_tag_c4, l2t4_tag_index_c4,  4, way_4, l2t4_valid, l2t4_used, l2t4_alloc, l2t4_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,4, l2t4_addr_c4, l2t4_tag_c4, l2t4_tag_index_c4,  4, way_4, l2t4_valid, l2t4_used, l2t4_alloc, l2t4_dirty); 
*/
         end 
       end else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only  VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,4, l2t4_tagonly_hit_c4, l2t4_addr_c4, l2t4_vuad_index, 4, l2t4_valid, l2t4_used, l2t4_alloc, l2t4_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] ->         VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,4, l2t4_addr_c4, l2t4_vuad_index, 4, l2t4_valid, l2t4_used, l2t4_alloc, l2t4_dirty); 
*/
       end
     end

   end else begin 
     if (!l2t4_vuad_wr_c4 && l2t4_wr_en_c4) begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,4,l2t4_tagonly_hit_c4, l2t4_addr_c4, l2t4_tag_c4, l2t4_tag_index_c4,  4, way_4); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,4, l2t4_addr_c4, l2t4_tag_c4, l2t4_tag_index_c4,  4, way_4); 
*/
     end
   end

end




reg [8:0]  l2t5_tag_index_c1, l2t5_tag_index_c2, l2t5_tag_index_c3, l2t5_tag_index_c4;
reg        l2t5_wr_en_c1, l2t5_wr_en_c2, l2t5_wr_en_c3, l2t5_wr_en_c4;
reg [15:0] l2t5_way_c1, l2t5_way_c2, l2t5_way_c3, l2t5_way_c4;
reg [21:0] l2t5_tag_c1, l2t5_tag_c2, l2t5_tag_c3, l2t5_tag_c4; 

reg [39:0] l2t5_addr_c3, l2t5_addr_c4;
reg        l2t5_inst_vld_c3, l2t5_inst_vld_c4; 
reg        l2t5_tagonly_hit_c3, l2t5_tagonly_hit_c4; 

reg        l2t5_vuad_wr_c4;

reg  [3:0] way_5;

initial 
begin 
l2t5_tag_index_c1 = 0;
l2t5_wr_en_c1 = 0;
l2t5_way_c1 = 0;
l2t5_tag_c1 = 0;
l2t5_tag_index_c2 = 0;
l2t5_wr_en_c2 = 0;
l2t5_way_c2 = 0;
l2t5_tag_c2 = 0;
l2t5_tag_index_c3 = 0;
l2t5_wr_en_c3 = 0;
l2t5_way_c3 = 0;
l2t5_tag_c3 = 0;
l2t5_tag_index_c4 = 0;
l2t5_wr_en_c4 = 0;
l2t5_way_c4 = 0;
l2t5_tag_c4 = 0;
l2t5_addr_c3 = 0;
l2t5_inst_vld_c3 = 0;
l2t5_addr_c4 = 0;
l2t5_inst_vld_c4 = 0;
l2t5_vuad_wr_c4 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   l2t5_tag_index_c1 <= l2t5_tag_index ;
   l2t5_tag_index_c2 <= l2t5_tag_index_c1 ;
   l2t5_tag_index_c3 <= l2t5_tag_index_c2 ;
   l2t5_tag_index_c4 <= l2t5_tag_index_c3 ;

   l2t5_wr_en_c1     <= l2t5_wr_en;
   l2t5_wr_en_c2     <= l2t5_wr_en_c1;
   l2t5_wr_en_c3     <= l2t5_wr_en_c2;
   l2t5_wr_en_c4     <= l2t5_wr_en_c3;

   l2t5_way_c1       <= l2t5_way;
   l2t5_way_c2       <= l2t5_way_c1;
   l2t5_way_c3       <= l2t5_way_c2;
   l2t5_way_c4       <= l2t5_way_c3;

   l2t5_tag_c1       <= l2t5_tag;
   l2t5_tag_c2       <= l2t5_tag_c1;
   l2t5_tag_c3       <= l2t5_tag_c2;
   l2t5_tag_c4       <= l2t5_tag_c3;

   l2t5_addr_c3      <= l2t5_addr;
   l2t5_addr_c4      <= l2t5_addr_c3;

   l2t5_inst_vld_c3  <= l2t5_inst_vld;
   l2t5_inst_vld_c4  <= l2t5_inst_vld_c3;
  
   l2t5_tagonly_hit_c3  <= l2t5_tagonly_hit;
   l2t5_tagonly_hit_c4  <= l2t5_tagonly_hit_c3;

   l2t5_vuad_wr_c4   <= l2t5_vuad_wr;

    case (l2t5_way_c4) 
      16'h1: way_5 = 4'b0;
      16'h2: way_5 = 4'h1;
      16'h4: way_5 = 4'h2;
      16'h8: way_5 = 4'h3;
      16'h10: way_5 = 4'h4;
      16'h20: way_5 = 4'h5;
      16'h40: way_5 = 4'h6;
      16'h80: way_5 = 4'h7;
      16'h100: way_5 = 4'h8;
      16'h200: way_5 = 4'h9;
      16'h400: way_5 = 4'ha;
      16'h800: way_5 = 4'hb;
      16'h1000: way_5 = 4'hc;
      16'h2000: way_5 = 4'hd;
      16'h4000: way_5 = 4'he;
      16'h8000: way_5 = 4'hf;
    endcase


     // VUAD write Req 
     if (l2t5_vuad_wr_c4 ) begin 
       // VUAD & Tag Write
       if (l2t5_wr_en_c4 ) begin 
         if (l2t5_tag_index_c4 != l2t5_vuad_index) begin 

         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x, Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,5, l2t5_tagonly_hit_c4, l2t5_addr_c4, l2t5_tag_c4, l2t5_tag_index_c4,  5, way_5, l2t5_valid, l2t5_used, l2t5_alloc, l2t5_dirty); 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,5, l2t5_tag_index_c4, l2t5_vuad_index);
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,5, l2t5_addr_c4, l2t5_tag_c4, l2t5_tag_index_c4,  5, way_5, l2t5_valid, l2t5_used, l2t5_alloc, l2t5_dirty); 
         $display("%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,5, l2t5_tag_index_c4, l2t5_vuad_index);
*/
         end  else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,5,l2t5_tagonly_hit_c4, l2t5_addr_c4, l2t5_tag_c4, l2t5_tag_index_c4,  5, way_5, l2t5_valid, l2t5_used, l2t5_alloc, l2t5_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,5, l2t5_addr_c4, l2t5_tag_c4, l2t5_tag_index_c4,  5, way_5, l2t5_valid, l2t5_used, l2t5_alloc, l2t5_dirty); 
*/
         end 
       end else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only  VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,5, l2t5_tagonly_hit_c4, l2t5_addr_c4, l2t5_vuad_index, 5, l2t5_valid, l2t5_used, l2t5_alloc, l2t5_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] ->         VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,5, l2t5_addr_c4, l2t5_vuad_index, 5, l2t5_valid, l2t5_used, l2t5_alloc, l2t5_dirty); 
*/
       end
     end

   end else begin 
     if (!l2t5_vuad_wr_c4 && l2t5_wr_en_c4) begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,5,l2t5_tagonly_hit_c4, l2t5_addr_c4, l2t5_tag_c4, l2t5_tag_index_c4,  5, way_5); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,5, l2t5_addr_c4, l2t5_tag_c4, l2t5_tag_index_c4,  5, way_5); 
*/
     end
   end

end




reg [8:0]  l2t6_tag_index_c1, l2t6_tag_index_c2, l2t6_tag_index_c3, l2t6_tag_index_c4;
reg        l2t6_wr_en_c1, l2t6_wr_en_c2, l2t6_wr_en_c3, l2t6_wr_en_c4;
reg [15:0] l2t6_way_c1, l2t6_way_c2, l2t6_way_c3, l2t6_way_c4;
reg [21:0] l2t6_tag_c1, l2t6_tag_c2, l2t6_tag_c3, l2t6_tag_c4; 

reg [39:0] l2t6_addr_c3, l2t6_addr_c4;
reg        l2t6_inst_vld_c3, l2t6_inst_vld_c4; 
reg        l2t6_tagonly_hit_c3, l2t6_tagonly_hit_c4; 

reg        l2t6_vuad_wr_c4;

reg  [3:0] way_6;

initial 
begin 
l2t6_tag_index_c1 = 0;
l2t6_wr_en_c1 = 0;
l2t6_way_c1 = 0;
l2t6_tag_c1 = 0;
l2t6_tag_index_c2 = 0;
l2t6_wr_en_c2 = 0;
l2t6_way_c2 = 0;
l2t6_tag_c2 = 0;
l2t6_tag_index_c3 = 0;
l2t6_wr_en_c3 = 0;
l2t6_way_c3 = 0;
l2t6_tag_c3 = 0;
l2t6_tag_index_c4 = 0;
l2t6_wr_en_c4 = 0;
l2t6_way_c4 = 0;
l2t6_tag_c4 = 0;
l2t6_addr_c3 = 0;
l2t6_inst_vld_c3 = 0;
l2t6_addr_c4 = 0;
l2t6_inst_vld_c4 = 0;
l2t6_vuad_wr_c4 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   l2t6_tag_index_c1 <= l2t6_tag_index ;
   l2t6_tag_index_c2 <= l2t6_tag_index_c1 ;
   l2t6_tag_index_c3 <= l2t6_tag_index_c2 ;
   l2t6_tag_index_c4 <= l2t6_tag_index_c3 ;

   l2t6_wr_en_c1     <= l2t6_wr_en;
   l2t6_wr_en_c2     <= l2t6_wr_en_c1;
   l2t6_wr_en_c3     <= l2t6_wr_en_c2;
   l2t6_wr_en_c4     <= l2t6_wr_en_c3;

   l2t6_way_c1       <= l2t6_way;
   l2t6_way_c2       <= l2t6_way_c1;
   l2t6_way_c3       <= l2t6_way_c2;
   l2t6_way_c4       <= l2t6_way_c3;

   l2t6_tag_c1       <= l2t6_tag;
   l2t6_tag_c2       <= l2t6_tag_c1;
   l2t6_tag_c3       <= l2t6_tag_c2;
   l2t6_tag_c4       <= l2t6_tag_c3;

   l2t6_addr_c3      <= l2t6_addr;
   l2t6_addr_c4      <= l2t6_addr_c3;

   l2t6_inst_vld_c3  <= l2t6_inst_vld;
   l2t6_inst_vld_c4  <= l2t6_inst_vld_c3;
  
   l2t6_tagonly_hit_c3  <= l2t6_tagonly_hit;
   l2t6_tagonly_hit_c4  <= l2t6_tagonly_hit_c3;

   l2t6_vuad_wr_c4   <= l2t6_vuad_wr;

    case (l2t6_way_c4) 
      16'h1: way_6 = 4'b0;
      16'h2: way_6 = 4'h1;
      16'h4: way_6 = 4'h2;
      16'h8: way_6 = 4'h3;
      16'h10: way_6 = 4'h4;
      16'h20: way_6 = 4'h5;
      16'h40: way_6 = 4'h6;
      16'h80: way_6 = 4'h7;
      16'h100: way_6 = 4'h8;
      16'h200: way_6 = 4'h9;
      16'h400: way_6 = 4'ha;
      16'h800: way_6 = 4'hb;
      16'h1000: way_6 = 4'hc;
      16'h2000: way_6 = 4'hd;
      16'h4000: way_6 = 4'he;
      16'h8000: way_6 = 4'hf;
    endcase


     // VUAD write Req 
     if (l2t6_vuad_wr_c4 ) begin 
       // VUAD & Tag Write
       if (l2t6_wr_en_c4 ) begin 
         if (l2t6_tag_index_c4 != l2t6_vuad_index) begin 

         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x, Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,6, l2t6_tagonly_hit_c4, l2t6_addr_c4, l2t6_tag_c4, l2t6_tag_index_c4,  6, way_6, l2t6_valid, l2t6_used, l2t6_alloc, l2t6_dirty); 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,6, l2t6_tag_index_c4, l2t6_vuad_index);
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,6, l2t6_addr_c4, l2t6_tag_c4, l2t6_tag_index_c4,  6, way_6, l2t6_valid, l2t6_used, l2t6_alloc, l2t6_dirty); 
         $display("%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,6, l2t6_tag_index_c4, l2t6_vuad_index);
*/
         end  else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,6,l2t6_tagonly_hit_c4, l2t6_addr_c4, l2t6_tag_c4, l2t6_tag_index_c4,  6, way_6, l2t6_valid, l2t6_used, l2t6_alloc, l2t6_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,6, l2t6_addr_c4, l2t6_tag_c4, l2t6_tag_index_c4,  6, way_6, l2t6_valid, l2t6_used, l2t6_alloc, l2t6_dirty); 
*/
         end 
       end else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only  VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,6, l2t6_tagonly_hit_c4, l2t6_addr_c4, l2t6_vuad_index, 6, l2t6_valid, l2t6_used, l2t6_alloc, l2t6_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] ->         VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,6, l2t6_addr_c4, l2t6_vuad_index, 6, l2t6_valid, l2t6_used, l2t6_alloc, l2t6_dirty); 
*/
       end
     end

   end else begin 
     if (!l2t6_vuad_wr_c4 && l2t6_wr_en_c4) begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,6,l2t6_tagonly_hit_c4, l2t6_addr_c4, l2t6_tag_c4, l2t6_tag_index_c4,  6, way_6); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,6, l2t6_addr_c4, l2t6_tag_c4, l2t6_tag_index_c4,  6, way_6); 
*/
     end
   end

end




reg [8:0]  l2t7_tag_index_c1, l2t7_tag_index_c2, l2t7_tag_index_c3, l2t7_tag_index_c4;
reg        l2t7_wr_en_c1, l2t7_wr_en_c2, l2t7_wr_en_c3, l2t7_wr_en_c4;
reg [15:0] l2t7_way_c1, l2t7_way_c2, l2t7_way_c3, l2t7_way_c4;
reg [21:0] l2t7_tag_c1, l2t7_tag_c2, l2t7_tag_c3, l2t7_tag_c4; 

reg [39:0] l2t7_addr_c3, l2t7_addr_c4;
reg        l2t7_inst_vld_c3, l2t7_inst_vld_c4; 
reg        l2t7_tagonly_hit_c3, l2t7_tagonly_hit_c4; 

reg        l2t7_vuad_wr_c4;

reg  [3:0] way_7;

initial 
begin 
l2t7_tag_index_c1 = 0;
l2t7_wr_en_c1 = 0;
l2t7_way_c1 = 0;
l2t7_tag_c1 = 0;
l2t7_tag_index_c2 = 0;
l2t7_wr_en_c2 = 0;
l2t7_way_c2 = 0;
l2t7_tag_c2 = 0;
l2t7_tag_index_c3 = 0;
l2t7_wr_en_c3 = 0;
l2t7_way_c3 = 0;
l2t7_tag_c3 = 0;
l2t7_tag_index_c4 = 0;
l2t7_wr_en_c4 = 0;
l2t7_way_c4 = 0;
l2t7_tag_c4 = 0;
l2t7_addr_c3 = 0;
l2t7_inst_vld_c3 = 0;
l2t7_addr_c4 = 0;
l2t7_inst_vld_c4 = 0;
l2t7_vuad_wr_c4 = 0;
end

always @ (posedge cmp_clk)
begin
  if (cmp_rst_l) begin 

   l2t7_tag_index_c1 <= l2t7_tag_index ;
   l2t7_tag_index_c2 <= l2t7_tag_index_c1 ;
   l2t7_tag_index_c3 <= l2t7_tag_index_c2 ;
   l2t7_tag_index_c4 <= l2t7_tag_index_c3 ;

   l2t7_wr_en_c1     <= l2t7_wr_en;
   l2t7_wr_en_c2     <= l2t7_wr_en_c1;
   l2t7_wr_en_c3     <= l2t7_wr_en_c2;
   l2t7_wr_en_c4     <= l2t7_wr_en_c3;

   l2t7_way_c1       <= l2t7_way;
   l2t7_way_c2       <= l2t7_way_c1;
   l2t7_way_c3       <= l2t7_way_c2;
   l2t7_way_c4       <= l2t7_way_c3;

   l2t7_tag_c1       <= l2t7_tag;
   l2t7_tag_c2       <= l2t7_tag_c1;
   l2t7_tag_c3       <= l2t7_tag_c2;
   l2t7_tag_c4       <= l2t7_tag_c3;

   l2t7_addr_c3      <= l2t7_addr;
   l2t7_addr_c4      <= l2t7_addr_c3;

   l2t7_inst_vld_c3  <= l2t7_inst_vld;
   l2t7_inst_vld_c4  <= l2t7_inst_vld_c3;
  
   l2t7_tagonly_hit_c3  <= l2t7_tagonly_hit;
   l2t7_tagonly_hit_c4  <= l2t7_tagonly_hit_c3;

   l2t7_vuad_wr_c4   <= l2t7_vuad_wr;

    case (l2t7_way_c4) 
      16'h1: way_7 = 4'b0;
      16'h2: way_7 = 4'h1;
      16'h4: way_7 = 4'h2;
      16'h8: way_7 = 4'h3;
      16'h10: way_7 = 4'h4;
      16'h20: way_7 = 4'h5;
      16'h40: way_7 = 4'h6;
      16'h80: way_7 = 4'h7;
      16'h100: way_7 = 4'h8;
      16'h200: way_7 = 4'h9;
      16'h400: way_7 = 4'ha;
      16'h800: way_7 = 4'hb;
      16'h1000: way_7 = 4'hc;
      16'h2000: way_7 = 4'hd;
      16'h4000: way_7 = 4'he;
      16'h8000: way_7 = 4'hf;
    endcase


     // VUAD write Req 
     if (l2t7_vuad_wr_c4 ) begin 
       // VUAD & Tag Write
       if (l2t7_wr_en_c4 ) begin 
         if (l2t7_tag_index_c4 != l2t7_vuad_index) begin 

         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x, Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,7, l2t7_tagonly_hit_c4, l2t7_addr_c4, l2t7_tag_c4, l2t7_tag_index_c4,  7, way_7, l2t7_valid, l2t7_used, l2t7_alloc, l2t7_dirty); 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,7, l2t7_tag_index_c4, l2t7_vuad_index);
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,7, l2t7_addr_c4, l2t7_tag_c4, l2t7_tag_index_c4,  7, way_7, l2t7_valid, l2t7_used, l2t7_alloc, l2t7_dirty); 
         $display("%0d:L2_TAGSTATE_MON[%0d] -> ** L2 Tag Index in Tag Update differe from VUAD index update***  Tag Index = %0x, VUAD Index = %0x, , ", $time,7, l2t7_tag_index_c4, l2t7_vuad_index);
*/
         end  else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,7,l2t7_tagonly_hit_c4, l2t7_addr_c4, l2t7_tag_c4, l2t7_tag_index_c4,  7, way_7, l2t7_valid, l2t7_used, l2t7_alloc, l2t7_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag and VUAD updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,7, l2t7_addr_c4, l2t7_tag_c4, l2t7_tag_index_c4,  7, way_7, l2t7_valid, l2t7_used, l2t7_alloc, l2t7_dirty); 
*/
         end 
       end else begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only  VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,7, l2t7_tagonly_hit_c4, l2t7_addr_c4, l2t7_vuad_index, 7, l2t7_valid, l2t7_used, l2t7_alloc, l2t7_dirty); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] ->         VUAD updated :: Addr = %x, Index = %0x, Bank = %0x, Valid = %0x, Used = %0x, Allocate = %0x, Dirty = %0x ", $time,7, l2t7_addr_c4, l2t7_vuad_index, 7, l2t7_valid, l2t7_used, l2t7_alloc, l2t7_dirty); 
*/
       end
     end

   end else begin 
     if (!l2t7_vuad_wr_c4 && l2t7_wr_en_c4) begin 
         `PR_INFO("l2_tagstate_mon",`INFO,"%0d:L2_TAGSTATE_MON[%0d] -> Tag Hit= %0x  Only Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,7,l2t7_tagonly_hit_c4, l2t7_addr_c4, l2t7_tag_c4, l2t7_tag_index_c4,  7, way_7); 
/*
         $display("%0d:L2_TAGSTATE_MON[%0d] -> Tag          updated :: Addr = %x, Tag = %0x, Index = %0x, Bank = %0x,  Way = %0d", $time,7, l2t7_addr_c4, l2t7_tag_c4, l2t7_tag_index_c4,  7, way_7); 
*/
     end
   end

end



//=====================================================================
// This task allows some more clocks and kills the test
//=====================================================================
task finish_test;
input [512:0] message;
input [2:0]   id;

begin
  $display("%0d ERROR: L2 Bank %d %s", $time, id, message);
  @(posedge cmp_clk);
  @(posedge cmp_clk);
  @(posedge cmp_clk);
  $error ("l2_tagstate_mon", "L2_TAGSTATE  monitor exited") ;
end
endtask







endmodule
