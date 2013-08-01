// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sio_opcc_ctl.v
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
module sio_opcc_ctl (
  l2clk, 
  olc0_opcc_req, 
  olc1_opcc_req, 
  olc2_opcc_req, 
  olc3_opcc_req, 
  olc4_opcc_req, 
  olc5_opcc_req, 
  olc6_opcc_req, 
  olc7_opcc_req, 
  olc0_opcc_dmureq, 
  olc1_opcc_dmureq, 
  olc2_opcc_dmureq, 
  olc3_opcc_dmureq, 
  olc4_opcc_dmureq, 
  olc5_opcc_dmureq, 
  olc6_opcc_dmureq, 
  olc7_opcc_dmureq, 
  olc0_opcc_datareq, 
  olc1_opcc_datareq, 
  olc2_opcc_datareq, 
  olc3_opcc_datareq, 
  olc4_opcc_datareq, 
  olc5_opcc_datareq, 
  olc6_opcc_datareq, 
  olc7_opcc_datareq, 
  l2sio_v_bits, 
  l2sio_j_bits, 
  l2sio_r_bits, 
  l2sio_o_bits, 
  l2sio_s_bits, 
  ojc0_opcc_sync, 
  ojc1_opcc_sync, 
  ojc2_opcc_sync, 
  ojc3_opcc_sync, 
  ojc4_opcc_sync, 
  ojc5_opcc_sync, 
  ojc6_opcc_sync, 
  ojc7_opcc_sync, 
  ojc0_opcc_ack, 
  ojc1_opcc_ack, 
  ojc2_opcc_ack, 
  ojc3_opcc_ack, 
  ojc4_opcc_ack, 
  ojc5_opcc_ack, 
  ojc6_opcc_ack, 
  ojc7_opcc_ack, 
  old0_opcc_jtag, 
  old1_opcc_jtag, 
  old2_opcc_jtag, 
  old3_opcc_jtag, 
  old4_opcc_jtag, 
  old5_opcc_jtag, 
  old6_opcc_jtag, 
  old7_opcc_jtag, 
  sio_tcu_vld, 
  sio_tcu_data, 
  sio_sii_opcc_ipcc_niu_by_deq, 
  sio_sii_opcc_ipcc_niu_by_cnt, 
  sio_sii_opcc_ipcc_niu_or_deq, 
  sio_sii_opcc_ipcc_dmu_by_deq, 
  sio_sii_opcc_ipcc_dmu_by_cnt, 
  sio_sii_opcc_ipcc_dmu_or_deq, 
  array_wr_inhibit_cmp, 
  array_wr_inhibit_io, 
  array_wr_inhibit, 
  opcc_olc0_gnt, 
  opcc_olc1_gnt, 
  opcc_olc2_gnt, 
  opcc_olc3_gnt, 
  opcc_olc4_gnt, 
  opcc_olc5_gnt, 
  opcc_olc6_gnt, 
  opcc_olc7_gnt, 
  opcc_opdc_gnt0_opc0, 
  opcc_opdc_gnt2_opc0, 
  opcc_opdc_gnt4_opc0, 
  opcc_opdc_gnt6_opc0, 
  opcc_opdc_gnt01_opc1, 
  opcc_opdc_gnt45_opc1, 
  opcc_opdc_gnt0123_opc1, 
  opcc_opddq00_wr_addr, 
  opcc_opddq10_wr_addr, 
  opcc_opddq01_wr_addr, 
  opcc_opddq11_wr_addr, 
  opcc_opdhq0_wr_addr, 
  opcc_opdhq1_wr_addr, 
  opcc_opddq00_wr_en, 
  opcc_opddq10_wr_en, 
  opcc_opddq01_wr_en, 
  opcc_opddq11_wr_en, 
  opcc_opdhq0_wr_en, 
  opcc_opdhq1_wr_en, 
  cmp_io_sync_en_in, 
  io_cmp_sync_en_in, 
  opcc_opcs_opddq00_wr_addr, 
  opcc_opcs_opddq10_wr_addr, 
  opcc_opcs_opddq01_wr_addr, 
  opcc_opcs_opddq11_wr_addr, 
  opcc_opcs_opdhq0_wr_addr, 
  opcc_opcs_opdhq1_wr_addr, 
  opcs_opcc_opdhq0_rd_addr, 
  opcs_opcc_opdhq1_rd_addr, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_out);
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire tcu_vld;
wire tcu_data;
wire ff_tcu_jtag_scanin;
wire ff_tcu_jtag_scanout;
wire [7:0] sio_sii_opcc_ipcc_niu_by_cnt_mask;
wire [1:0] niubysum10;
wire [1:0] niubysum32;
wire [1:0] niubysum54;
wire [1:0] niubysum76;
wire [3:0] niubysum;
wire [3:0] sio_sii_opcc_ipcc_niu_by_cnt_next;
wire sio_sii_opcc_ipcc_niu_by_deq_next;
wire sio_sii_opcc_ipcc_niu_or_deq_next;
wire [7:0] sio_sii_opcc_ipcc_dmu_by_cnt_mask;
wire [1:0] dmubysum10;
wire [1:0] dmubysum32;
wire [1:0] dmubysum54;
wire [1:0] dmubysum76;
wire [3:0] dmubysum;
wire [3:0] sio_sii_opcc_ipcc_dmu_by_cnt_next;
wire sio_sii_opcc_ipcc_dmu_by_deq_next;
wire sio_sii_opcc_ipcc_dmu_or_deq_next;
wire ff_dqcnt_scanin;
wire ff_dqcnt_scanout;
wire [4:0] sync_in_opdhq0_rd_addr;
wire io_cmp_sync_en;
wire [4:0] sync_out_opdhq0_rd_addr;
wire ff_syn_opdhq0_rd_addr_scanin;
wire ff_syn_opdhq0_rd_addr_scanout;
wire ff_opdhq0_rd_addr_scanin;
wire ff_opdhq0_rd_addr_scanout;
wire [4:0] opdhq0_rd_addr;
wire [4:0] sync_in_opdhq1_rd_addr;
wire [4:0] sync_out_opdhq1_rd_addr;
wire ff_syn_opdhq1_rd_addr_scanin;
wire ff_syn_opdhq1_rd_addr_scanout;
wire ff_opdhq1_rd_addr_scanin;
wire ff_opdhq1_rd_addr_scanout;
wire [4:0] opdhq1_rd_addr;
wire ff_opdhq0sub_scanin;
wire ff_opdhq0sub_scanout;
wire [4:0] opdhq0sub_l;
wire [4:0] opdhq0sub;
wire ff_opdhq1sub_scanin;
wire ff_opdhq1sub_scanout;
wire [4:0] opdhq1sub_l;
wire [4:0] opdhq1sub;
wire [4:0] opdhq0_rd_addr_early;
wire [4:0] opdhq1_rd_addr_early;
wire [4:0] opdhq0_wr_addr_early;
wire opdhq0_wr_addrinc;
wire [4:0] opdhq0_wr_addr;
wire [4:0] opdhq1_wr_addr_early;
wire opdhq1_wr_addrinc;
wire [4:0] opdhq1_wr_addr;
wire [1:0] opdhq0sub_unused;
wire [1:0] opdhq1sub_unused;
wire dmureqfull;
wire entreqfull;
wire [7:0] gnt_d1;
wire [5:0] gnt_d2;
wire [7:0] queuecredit;
wire [7:0] nextreq;
wire [7:0] gnt;
wire [7:0] newwinner;
wire [7:0] gnt_hist;
wire busbusy;
wire read_slph;
wire [7:0] nextwinner;
wire [2:0] buscnt;
wire nextread_slph;
wire [7:0] winner;
wire [7:0] nextgnt;
wire [7:0] gnt_hist_l;
wire ff_slpstates_scanin;
wire ff_slpstates_scanout;
wire [7:0] nextgntd1;
wire nextcycleis_slph;
wire nextdmuread_slph;
wire nextentread_slph;
wire cycle_slph;
wire dmuread_slph;
wire entread_slph;
wire [7:0] dmuwinner;
wire [7:0] dmureq;
wire [7:0] entwinner;
wire [7:0] entreq;
wire [7:0] dmureadreq;
wire [7:0] readreq;
wire [7:0] entreadreq;
wire [2:0] buscnt_plus1;
wire buscnt_inc;
wire [2:0] buscnt_next;
wire ff_buscnt_scanin;
wire ff_buscnt_scanout;
wire opdhq0won;
wire opdhq1won;
wire opdhq0won_slph;
wire opdhq0won_d1;
wire opdhq1won_slph;
wire opdhq1won_d1;
wire opdhq0won_opc1;
wire opdhq1won_opc1;
wire [4:0] opdhq0_wr_addr_next;
wire [4:0] opdhq1_wr_addr_next;
wire opddq0x_wr_addrinc4_next;
wire opddq1x_wr_addrinc4_next;
wire opddq00_wr_addrinc_next;
wire dmuread_opc1;
wire dmuread_opc3;
wire dmuread_opc5;
wire dmuread_opc7;
wire opddq10_wr_addrinc_next;
wire entread_opc1;
wire entread_opc3;
wire entread_opc5;
wire entread_opc7;
wire opddq01_wr_addrinc_next;
wire dmuread_opc2;
wire dmuread_opc4;
wire dmuread_opc6;
wire dmuread_opc8;
wire opddq11_wr_addrinc_next;
wire entread_opc2;
wire entread_opc4;
wire entread_opc6;
wire entread_opc8;
wire [6:0] opddq00_wr_addr_next;
wire [6:0] opddq00_wr_addr;
wire opddq00_wr_addrinc;
wire [6:0] opddq10_wr_addr_next;
wire [6:0] opddq10_wr_addr;
wire opddq10_wr_addrinc;
wire [6:0] opddq01_wr_addr_next;
wire [6:0] opddq01_wr_addr;
wire opddq01_wr_addrinc;
wire [6:0] opddq11_wr_addr_next;
wire [6:0] opddq11_wr_addr;
wire opddq11_wr_addrinc;
wire ff_hqxwonstage_scanin;
wire ff_hqxwonstage_scanout;
wire ff_qxdatastage_scanin;
wire ff_qxdatastage_scanout;
wire ff_opdhq0_wr_addr_scanin;
wire ff_opdhq0_wr_addr_scanout;
wire ff_opdhq1_wr_addr_scanin;
wire ff_opdhq1_wr_addr_scanout;
wire ff_opddq00_wr_addr_scanin;
wire ff_opddq00_wr_addr_scanout;
wire ff_opddq10_wr_addr_scanin;
wire ff_opddq10_wr_addr_scanout;
wire ff_opddq01_wr_addr_scanin;
wire ff_opddq01_wr_addr_scanout;
wire ff_opddq11_wr_addr_scanin;
wire ff_opddq11_wr_addr_scanout;
wire ff_opddq00_wr_addrinc_scanin;
wire ff_opddq00_wr_addrinc_scanout;
wire ff_opddq01_wr_addrinc_scanin;
wire ff_opddq01_wr_addrinc_scanout;
wire ff_opddq10_wr_addrinc_scanin;
wire ff_opddq10_wr_addrinc_scanout;
wire ff_opddq11_wr_addrinc_scanin;
wire ff_opddq11_wr_addrinc_scanout;
wire ff_opddq00_wr_addr_d1_scanin;
wire ff_opddq00_wr_addr_d1_scanout;
wire [6:0] opddq00_wr_addr_d1;
wire [6:0] sync_in_opddq00_wr_addr;
wire cmp_io_sync_en;
wire [6:0] sync_out_opddq00_wr_addr;
wire ff_syn_opddq00_wr_addr_scanin;
wire ff_syn_opddq00_wr_addr_scanout;
wire ff_opddq01_wr_addr_d1_scanin;
wire ff_opddq01_wr_addr_d1_scanout;
wire [6:0] opddq01_wr_addr_d1;
wire [6:0] sync_in_opddq01_wr_addr;
wire [6:0] sync_out_opddq01_wr_addr;
wire ff_syn_opddq01_wr_addr_scanin;
wire ff_syn_opddq01_wr_addr_scanout;
wire ff_opddq10_wr_addr_d1_scanin;
wire ff_opddq10_wr_addr_d1_scanout;
wire [6:0] opddq10_wr_addr_d1;
wire [6:0] sync_in_opddq10_wr_addr;
wire [6:0] sync_out_opddq10_wr_addr;
wire ff_syn_opddq10_wr_addr_scanin;
wire ff_syn_opddq10_wr_addr_scanout;
wire ff_opddq11_wr_addr_d1_scanin;
wire ff_opddq11_wr_addr_d1_scanout;
wire [6:0] opddq11_wr_addr_d1;
wire [6:0] sync_in_opddq11_wr_addr;
wire [6:0] sync_out_opddq11_wr_addr;
wire ff_syn_opddq11_wr_addr_scanin;
wire ff_syn_opddq11_wr_addr_scanout;
wire ff_opdhq0_wr_addr_d1_scanin;
wire ff_opdhq0_wr_addr_d1_scanout;
wire [4:0] opdhq0_wr_addr_d1;
wire [4:0] sync_in_opdhq0_wr_addr;
wire [4:0] sync_out_opdhq0_wr_addr;
wire ff_syn_opdhq0_wr_addr_scanin;
wire ff_syn_opdhq0_wr_addr_scanout;
wire ff_opdhq1_wr_addr_d1_scanin;
wire ff_opdhq1_wr_addr_d1_scanout;
wire [4:0] opdhq1_wr_addr_d1;
wire [4:0] sync_in_opdhq1_wr_addr;
wire [4:0] sync_out_opdhq1_wr_addr;
wire ff_syn_opdhq1_wr_addr_scanin;
wire ff_syn_opdhq1_wr_addr_scanout;
wire sync_in_opdhq0_wr_en;
wire sync_out_opdhq0_wr_en_d1;
wire opdhq0_wr_en_tmp;
wire sync_out_opdhq0_wr_en;
wire sync_out_opdhq0_wr_en_d2;
wire ff_syn_opdhq0_wr_en_d1_scanin;
wire ff_syn_opdhq0_wr_en_d1_scanout;
wire ff_syn_opdhq0_wr_en_d2_scanin;
wire ff_syn_opdhq0_wr_en_d2_scanout;
wire sync_in_opdhq1_wr_en;
wire sync_out_opdhq1_wr_en_d1;
wire opdhq1_wr_en_tmp;
wire sync_out_opdhq1_wr_en;
wire sync_out_opdhq1_wr_en_d2;
wire ff_syn_opdhq1_wr_en_d1_scanin;
wire ff_syn_opdhq1_wr_en_d1_scanout;
wire ff_syn_opdhq1_wr_en_d2_scanin;
wire ff_syn_opdhq1_wr_en_d2_scanout;
wire reg_cmp_io_sync_en_scanin;
wire reg_cmp_io_sync_en_scanout;
wire reg_io_cmp_sync_en_scanin;
wire reg_io_cmp_sync_en_scanout;


   input          l2clk;

   input 	  olc0_opcc_req;
   input 	  olc1_opcc_req;
   input 	  olc2_opcc_req;
   input 	  olc3_opcc_req;
   input 	  olc4_opcc_req;
   input 	  olc5_opcc_req;  
   input 	  olc6_opcc_req;
   input 	  olc7_opcc_req;
   
   input 	  olc0_opcc_dmureq;
   input 	  olc1_opcc_dmureq;
   input 	  olc2_opcc_dmureq;
   input 	  olc3_opcc_dmureq;
   input 	  olc4_opcc_dmureq;
   input 	  olc5_opcc_dmureq;   
   input 	  olc6_opcc_dmureq;
   input 	  olc7_opcc_dmureq;

   input 	  olc0_opcc_datareq;
   input 	  olc1_opcc_datareq;
   input 	  olc2_opcc_datareq;
   input 	  olc3_opcc_datareq;
   input 	  olc4_opcc_datareq;
   input 	  olc5_opcc_datareq;   
   input 	  olc6_opcc_datareq;
   input 	  olc7_opcc_datareq;


   input [7:0] 	  l2sio_v_bits; // valid bit
   input [7:0] 	  l2sio_j_bits; // jtag bit
   input [7:0] 	  l2sio_r_bits; // read bit
   input [7:0] 	  l2sio_o_bits; // ordered bit
   input [7:0] 	  l2sio_s_bits; // source-bit (1=dmu, 0=ent)
   
   input 	  ojc0_opcc_sync;
   input 	  ojc1_opcc_sync;
   input 	  ojc2_opcc_sync;
   input 	  ojc3_opcc_sync;
   input 	  ojc4_opcc_sync;
   input 	  ojc5_opcc_sync;  
   input 	  ojc6_opcc_sync;
   input 	  ojc7_opcc_sync;
   
   input 	  ojc0_opcc_ack;
   input 	  ojc1_opcc_ack;
   input 	  ojc2_opcc_ack;
   input 	  ojc3_opcc_ack;
   input 	  ojc4_opcc_ack;
   input 	  ojc5_opcc_ack;  
   input 	  ojc6_opcc_ack;
   input 	  ojc7_opcc_ack;
   
   input 	  old0_opcc_jtag;
   input 	  old1_opcc_jtag;
   input 	  old2_opcc_jtag;
   input 	  old3_opcc_jtag;
   input 	  old4_opcc_jtag;
   input 	  old5_opcc_jtag;  
   input 	  old6_opcc_jtag;
   input 	  old7_opcc_jtag;
   


   // ================== JTAG_RAS =============
   output       sio_tcu_vld;    // assert for jtag read return valid
   output       sio_tcu_data;   // bit 0 is transfered on first cycle...63 on last cycle
   // ================== JTAG_RAS =============


   output         sio_sii_opcc_ipcc_niu_by_deq;
   output [3:0]   sio_sii_opcc_ipcc_niu_by_cnt;
   output         sio_sii_opcc_ipcc_niu_or_deq;

   output         sio_sii_opcc_ipcc_dmu_by_deq;
   output [3:0]   sio_sii_opcc_ipcc_dmu_by_cnt;
   output         sio_sii_opcc_ipcc_dmu_or_deq;

   input	  array_wr_inhibit_cmp; 
   input	  array_wr_inhibit_io; 
   output	  array_wr_inhibit; 
   
   output         opcc_olc0_gnt;
   output         opcc_olc1_gnt;
   output         opcc_olc2_gnt;
   output         opcc_olc3_gnt;
   output         opcc_olc4_gnt;
   output         opcc_olc5_gnt;   
   output         opcc_olc6_gnt;
   output         opcc_olc7_gnt;

   output         opcc_opdc_gnt0_opc0;
   output         opcc_opdc_gnt2_opc0;
   output         opcc_opdc_gnt4_opc0;
   output         opcc_opdc_gnt6_opc0;
   output         opcc_opdc_gnt01_opc1;
   output         opcc_opdc_gnt45_opc1;
   output         opcc_opdc_gnt0123_opc1;

   output [5:0]   opcc_opddq00_wr_addr; // DMU dataq -- valid on opc1
   output [5:0]   opcc_opddq10_wr_addr; // ENT dataq -- valid on opc1
   output [5:0]   opcc_opddq01_wr_addr; // DMU dataq -- valid on opc1
   output [5:0]   opcc_opddq11_wr_addr; // ENT dataq -- valid on opc1

   output [3:0]   opcc_opdhq0_wr_addr; // DMU hdrq -- valid on opc1
   output [3:0]   opcc_opdhq1_wr_addr; // ENT hdrq -- valid on opc1

   output 	  opcc_opddq00_wr_en; // DMU dataq -- valid on opc1
   output 	  opcc_opddq10_wr_en; // ENT dataq -- valid on opc1
   output 	  opcc_opddq01_wr_en; // DMU dataq -- valid on opc1
   output 	  opcc_opddq11_wr_en; // ENT dataq -- valid on opc1
   output 	  opcc_opdhq0_wr_en; // DMU hdrq -- valid on opc1
   output 	  opcc_opdhq1_wr_en; // ENT hdrq -- valid on opc1
	  
   input 	  cmp_io_sync_en_in; // active high - ok to cross from CMP to IO clock domain
   input 	  io_cmp_sync_en_in; // active high - ok to cross from IO to CMP clock domain
   output [6:0]   opcc_opcs_opddq00_wr_addr; // DMU dataq -- cmp domain synced, gray-coded + 1 bit, valid on 
   output [6:0]   opcc_opcs_opddq10_wr_addr; // ENT dataq -- cmp domain synced, gray-coded + 1 bit, valid on 
   output [6:0]   opcc_opcs_opddq01_wr_addr; // DMU dataq -- cmp domain synced, gray-coded + 1 bit, valid on  
   output [6:0]   opcc_opcs_opddq11_wr_addr; // ENT dataq -- cmp domain synced, gray-coded + 1 bit, valid on  

   output [4:0]   opcc_opcs_opdhq0_wr_addr; // DMU hdrq -- cmp domain synced, gray-coded + 1 bit, valid on  
   output [4:0]   opcc_opcs_opdhq1_wr_addr; // ENT hdrq -- cmp domain synced, gray-coded + 1 bit, valid on  



   input [4:0] 	  opcs_opcc_opdhq0_rd_addr; // DMU hdrq -- io domain unsync, gray-coded + 1 bit, valid on 
   input [4:0] 	  opcs_opcc_opdhq1_rd_addr; // ENT hdrq -- io domain unsync, gray-coded + 1 bit, valid on 
   

   input 	  tcu_scan_en;
   input 	  scan_in;
   input 	  tcu_aclk;
   input 	  tcu_bclk; 
   input 	  tcu_pce_ov;
   input 	  tcu_clk_stop;
   output 	  scan_out;

   ///////////////////////////////////////
   // Scan chain connections            
   ///////////////////////////////////////
   // scan renames
   assign 	  se = tcu_scan_en;   
   assign 	  siclk = tcu_aclk;
   assign 	  soclk = tcu_bclk;
   assign 	  pce_ov = tcu_pce_ov;
   assign 	  stop = tcu_clk_stop;
   assign	  array_wr_inhibit = array_wr_inhibit_cmp & array_wr_inhibit_io;
   // end scan

   sio_opcc_ctl_l1clkhdr_ctl_macro clkgen (
			      .l2clk  (l2clk  ),
			      .l1en   (1'b1 ),
			      .l1clk  (l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
			      );
   //Spare gates
   sio_opcc_ctl_spare_ctl_macro__num_3 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
   );



   assign tcu_vld = |{ojc0_opcc_sync,
		      ojc1_opcc_sync,
		      ojc2_opcc_sync,
		      ojc3_opcc_sync,
		      ojc4_opcc_sync,
		      ojc5_opcc_sync,  
		      ojc6_opcc_sync,
		      ojc7_opcc_sync};

   assign tcu_data = |{old0_opcc_jtag ,
		       old1_opcc_jtag ,
		       old2_opcc_jtag ,
		       old3_opcc_jtag ,
		       old4_opcc_jtag ,
		       old5_opcc_jtag ,  
		       old6_opcc_jtag ,
		       old7_opcc_jtag};
   
   sio_opcc_ctl_msff_ctl_macro__width_2 ff_tcu_jtag  (
	.scan_in(ff_tcu_jtag_scanin),
	.scan_out(ff_tcu_jtag_scanout),
	.din  ({tcu_vld, tcu_data}),
	.dout ({sio_tcu_vld, sio_tcu_data}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


   assign sio_sii_opcc_ipcc_niu_by_cnt_mask[7:0] = (l2sio_v_bits[7:0] & ~l2sio_j_bits[7:0] & ~l2sio_o_bits[7:0] & ~l2sio_s_bits[7:0] & ~l2sio_r_bits[7:0]);
   // implement summing of all 8 bits in the mask
   assign niubysum10[1:0] = {&sio_sii_opcc_ipcc_niu_by_cnt_mask[1:0], ^sio_sii_opcc_ipcc_niu_by_cnt_mask[1:0]};
   assign niubysum32[1:0] = {&sio_sii_opcc_ipcc_niu_by_cnt_mask[3:2], ^sio_sii_opcc_ipcc_niu_by_cnt_mask[3:2]};
   assign niubysum54[1:0] = {&sio_sii_opcc_ipcc_niu_by_cnt_mask[5:4], ^sio_sii_opcc_ipcc_niu_by_cnt_mask[5:4]};
   assign niubysum76[1:0] = {&sio_sii_opcc_ipcc_niu_by_cnt_mask[7:6], ^sio_sii_opcc_ipcc_niu_by_cnt_mask[7:6]};
   assign niubysum[3:0] = {2'b00, niubysum32[1:0]} + {2'b00, niubysum10[1:0]} + {2'b00, niubysum76[1:0]} + {2'b00, niubysum54[1:0]};
   assign sio_sii_opcc_ipcc_niu_by_cnt_next[3:0] = niubysum[3:0];
   assign sio_sii_opcc_ipcc_niu_by_deq_next = |sio_sii_opcc_ipcc_niu_by_cnt_mask[7:0];
   assign sio_sii_opcc_ipcc_niu_or_deq_next = |(l2sio_v_bits[7:0] & ~l2sio_j_bits[7:0] & l2sio_o_bits[7:0] & ~l2sio_s_bits[7:0] & ~l2sio_r_bits[7:0]);





   assign sio_sii_opcc_ipcc_dmu_by_cnt_mask[7:0] = (l2sio_v_bits[7:0] & ~l2sio_j_bits[7:0] & ~l2sio_o_bits[7:0] & l2sio_s_bits[7:0] & ~l2sio_r_bits[7:0]);
   // implement summing of all 8 bits in the mask
   assign dmubysum10[1:0] = {&sio_sii_opcc_ipcc_dmu_by_cnt_mask[1:0], ^sio_sii_opcc_ipcc_dmu_by_cnt_mask[1:0]};
   assign dmubysum32[1:0] = {&sio_sii_opcc_ipcc_dmu_by_cnt_mask[3:2], ^sio_sii_opcc_ipcc_dmu_by_cnt_mask[3:2]};
   assign dmubysum54[1:0] = {&sio_sii_opcc_ipcc_dmu_by_cnt_mask[5:4], ^sio_sii_opcc_ipcc_dmu_by_cnt_mask[5:4]};
   assign dmubysum76[1:0] = {&sio_sii_opcc_ipcc_dmu_by_cnt_mask[7:6], ^sio_sii_opcc_ipcc_dmu_by_cnt_mask[7:6]};
   assign dmubysum[3:0] = {2'b00, dmubysum32[1:0]} + {2'b00, dmubysum10[1:0]} + {2'b00, dmubysum76[1:0]} + {2'b00, dmubysum54[1:0]};
   assign sio_sii_opcc_ipcc_dmu_by_cnt_next[3:0] = dmubysum[3:0];
   assign sio_sii_opcc_ipcc_dmu_by_deq_next = |sio_sii_opcc_ipcc_dmu_by_cnt_mask[7:0];
   assign sio_sii_opcc_ipcc_dmu_or_deq_next = |(l2sio_v_bits[7:0] & ~l2sio_j_bits[7:0] & l2sio_o_bits[7:0] &  l2sio_s_bits[7:0] & ~l2sio_r_bits[7:0]);
   
   sio_opcc_ctl_msff_ctl_macro__width_12 ff_dqcnt  (
	.scan_in(ff_dqcnt_scanin),
	.scan_out(ff_dqcnt_scanout),
	.din  ({sio_sii_opcc_ipcc_niu_or_deq_next, sio_sii_opcc_ipcc_niu_by_deq_next, sio_sii_opcc_ipcc_niu_by_cnt_next[3:0], 
	        sio_sii_opcc_ipcc_dmu_or_deq_next, sio_sii_opcc_ipcc_dmu_by_deq_next, sio_sii_opcc_ipcc_dmu_by_cnt_next[3:0]}),

	.dout ({sio_sii_opcc_ipcc_niu_or_deq, sio_sii_opcc_ipcc_niu_by_deq, sio_sii_opcc_ipcc_niu_by_cnt[3:0], 
	        sio_sii_opcc_ipcc_dmu_or_deq, sio_sii_opcc_ipcc_dmu_by_deq, sio_sii_opcc_ipcc_dmu_by_cnt[3:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
       );
   

   
   // Synchronize the gray coded read pointers from sio_opcs_ctl and compare with write pointer
   // to generate full signals

   // until we have a sync macro cell, i'm using 2 msff_ctl_macros
   assign sync_in_opdhq0_rd_addr[4:0] = io_cmp_sync_en ? opcs_opcc_opdhq0_rd_addr[4:0] : sync_out_opdhq0_rd_addr[4:0];
   
   sio_opcc_ctl_msff_ctl_macro__width_5 ff_syn_opdhq0_rd_addr  (
	.scan_in(ff_syn_opdhq0_rd_addr_scanin),
	.scan_out(ff_syn_opdhq0_rd_addr_scanout),
	.din  (sync_in_opdhq0_rd_addr[4:0]),
	.dout (sync_out_opdhq0_rd_addr[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
   sio_opcc_ctl_msff_ctl_macro__width_5 ff_opdhq0_rd_addr  (
	.scan_in(ff_opdhq0_rd_addr_scanin),
	.scan_out(ff_opdhq0_rd_addr_scanout),
	.din  (sync_out_opdhq0_rd_addr[4:0]),
	.dout (opdhq0_rd_addr[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   assign sync_in_opdhq1_rd_addr[4:0] = io_cmp_sync_en ? opcs_opcc_opdhq1_rd_addr[4:0] : sync_out_opdhq1_rd_addr[4:0];
   
   sio_opcc_ctl_msff_ctl_macro__width_5 ff_syn_opdhq1_rd_addr  (
	.scan_in(ff_syn_opdhq1_rd_addr_scanin),
	.scan_out(ff_syn_opdhq1_rd_addr_scanout),
	.din  (sync_in_opdhq1_rd_addr[4:0]),
	.dout (sync_out_opdhq1_rd_addr[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
   sio_opcc_ctl_msff_ctl_macro__width_5 ff_opdhq1_rd_addr  (
	.scan_in(ff_opdhq1_rd_addr_scanin),
	.scan_out(ff_opdhq1_rd_addr_scanout),
	.din  (sync_out_opdhq1_rd_addr[4:0]),
	.dout (opdhq1_rd_addr[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


   sio_opcc_ctl_msff_ctl_macro__width_5 ff_opdhq0sub  (
	.scan_in(ff_opdhq0sub_scanin),
	.scan_out(ff_opdhq0sub_scanout),
	.din  (opdhq0sub_l[4:0]),
	.dout (opdhq0sub[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
   sio_opcc_ctl_msff_ctl_macro__width_5 ff_opdhq1sub  (
	.scan_in(ff_opdhq1sub_scanin),
	.scan_out(ff_opdhq1sub_scanout),
	.din  (opdhq1sub_l[4:0]),
	.dout (opdhq1sub[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   assign opdhq0_rd_addr_early[4:0] = sync_out_opdhq0_rd_addr[4:0];
   assign opdhq1_rd_addr_early[4:0] = sync_out_opdhq1_rd_addr[4:0];
   assign opdhq0_wr_addr_early[4:0] = opdhq0_wr_addrinc ? opdhq0_wr_addr[4:0] + 5'b00001 :  opdhq0_wr_addr[4:0];
   assign opdhq1_wr_addr_early[4:0] = opdhq1_wr_addrinc ? opdhq1_wr_addr[4:0] + 5'b00001 :  opdhq1_wr_addr[4:0];

   assign opdhq0sub_l[4:0]  = (opdhq0_wr_addr_early[4:0]  - opdhq0_rd_addr_early[4:0])  ;
   assign opdhq1sub_l[4:0]  = (opdhq1_wr_addr_early[4:0]  - opdhq1_rd_addr_early[4:0]) ;
   assign opdhq0sub_unused[1:0] = opdhq0sub[1:0];
   assign opdhq1sub_unused[1:0] = opdhq1sub[1:0];
 

   assign dmureqfull = (opdhq0sub[4]) |
                      (~opdhq0sub[4]  & (&opdhq0sub[3:2]))
		       ;

  assign entreqfull = (opdhq1sub[4]) |
                      (~opdhq1sub[4]  & (&opdhq1sub[3:2]))
		       ;


   // REQUEST - GRANT LOGIC
   assign	  opcc_opdc_gnt0_opc0		= gnt_d1[0] ;
   assign	  opcc_opdc_gnt2_opc0		= gnt_d1[2] ;
   assign	  opcc_opdc_gnt4_opc0		= gnt_d1[4] ;
   assign	  opcc_opdc_gnt6_opc0		= gnt_d1[6] ;
   assign	  opcc_opdc_gnt01_opc1		= gnt_d2[0] | gnt_d2[1];
   assign	  opcc_opdc_gnt45_opc1		= gnt_d2[4] | gnt_d2[5];
   assign	  opcc_opdc_gnt0123_opc1	= gnt_d2[0] | gnt_d2[1] | gnt_d2[2] | gnt_d2[3] ;

   assign 	  queuecredit[0] = (olc0_opcc_dmureq & ~dmureqfull) | (~olc0_opcc_dmureq & ~entreqfull);
   assign 	  queuecredit[1] = (olc1_opcc_dmureq & ~dmureqfull) | (~olc1_opcc_dmureq & ~entreqfull);
   assign 	  queuecredit[2] = (olc2_opcc_dmureq & ~dmureqfull) | (~olc2_opcc_dmureq & ~entreqfull);
   assign 	  queuecredit[3] = (olc3_opcc_dmureq & ~dmureqfull) | (~olc3_opcc_dmureq & ~entreqfull);
   assign 	  queuecredit[4] = (olc4_opcc_dmureq & ~dmureqfull) | (~olc4_opcc_dmureq & ~entreqfull);
   assign 	  queuecredit[5] = (olc5_opcc_dmureq & ~dmureqfull) | (~olc5_opcc_dmureq & ~entreqfull);
   assign 	  queuecredit[6] = (olc6_opcc_dmureq & ~dmureqfull) | (~olc6_opcc_dmureq & ~entreqfull);
   assign 	  queuecredit[7] = (olc7_opcc_dmureq & ~dmureqfull) | (~olc7_opcc_dmureq & ~entreqfull);

   assign 	  nextreq[0]  =  olc0_opcc_req & queuecredit[0] & ~gnt[0];
   assign 	  nextreq[1]  =  olc1_opcc_req & queuecredit[1] & ~gnt[1];
   assign 	  nextreq[2]  =  olc2_opcc_req & queuecredit[2] & ~gnt[2];
   assign 	  nextreq[3]  =  olc3_opcc_req & queuecredit[3] & ~gnt[3];
   assign 	  nextreq[4]  =  olc4_opcc_req & queuecredit[4] & ~gnt[4];
   assign 	  nextreq[5]  =  olc5_opcc_req & queuecredit[5] & ~gnt[5];
   assign 	  nextreq[6]  =  olc6_opcc_req & queuecredit[6] & ~gnt[6];
   assign 	  nextreq[7]  =  olc7_opcc_req & queuecredit[7] & ~gnt[7];


   assign 	  newwinner[0] = (nextreq[0] & (gnt_hist[7] | (~|gnt_hist[6:0]))) |
		                  (nextreq[0] & ~nextreq[7   ] & gnt_hist[6]) |  
		                  (nextreq[0] & ~|nextreq[7:6] & gnt_hist[5]) |
		                  (nextreq[0] & ~|nextreq[7:5] & gnt_hist[4]) |
		                  (nextreq[0] & ~|nextreq[7:4] & gnt_hist[3]) |
		                  (nextreq[0] & ~|nextreq[7:3] & gnt_hist[2]) |
		                  (nextreq[0] & ~|nextreq[7:2] & gnt_hist[1]) |
		                  (nextreq[0] & ~|nextreq[7:1]);
   

   assign 	  newwinner[1] = (nextreq[1] & gnt_hist[0]) |
		                  (nextreq[1] & ~nextreq[0] & (gnt_hist[7] || (~|gnt_hist[6:0]))) |
		                  (nextreq[1] & ~|{nextreq[7  ], nextreq[0]}   & gnt_hist[6]) |
		                  (nextreq[1] & ~|{nextreq[7:6], nextreq[0]}   & gnt_hist[5]) |
		                  (nextreq[1] & ~|{nextreq[7:5], nextreq[0]}   & gnt_hist[4]) |
		                  (nextreq[1] & ~|{nextreq[7:4], nextreq[0]}   & gnt_hist[3]) |
		                  (nextreq[1] & ~|{nextreq[7:3], nextreq[0]}   & gnt_hist[2]) |
		                  (nextreq[1] & ~|{nextreq[7:2], nextreq[0]});
   
   assign 	  newwinner[2] = (nextreq[2] & gnt_hist[1]) |
		                  (nextreq[2] & ~nextreq[1] 		       & gnt_hist[0]) |
		                  (nextreq[2] & ~|{nextreq[1:0]} & (gnt_hist[7] || (~|gnt_hist[6:0]))) |
		                  (nextreq[2] & ~|{nextreq[7  ], nextreq[1:0]} & gnt_hist[6]) |
		                  (nextreq[2] & ~|{nextreq[7:6], nextreq[1:0]} & gnt_hist[5]) |
		                  (nextreq[2] & ~|{nextreq[7:5], nextreq[1:0]} & gnt_hist[4]) |
		                  (nextreq[2] & ~|{nextreq[7:4], nextreq[1:0]} & gnt_hist[3]) |
		                  (nextreq[2] & ~|{nextreq[7:3], nextreq[1:0]});

   assign 	  newwinner[3] = (nextreq[3] & gnt_hist[2]) |
		                  (nextreq[3] & ~nextreq[2] 		       & gnt_hist[1]) |
		                  (nextreq[3] & ~|{              nextreq[2:1]} & gnt_hist[0]) |
		                  (nextreq[3] & ~|{nextreq[2:0]} & (gnt_hist[7] || (~|gnt_hist[6:0]))) |
		                  (nextreq[3] & ~|{nextreq[7  ], nextreq[2:0]} & gnt_hist[6]) |
		                  (nextreq[3] & ~|{nextreq[7:6], nextreq[2:0]} & gnt_hist[5]) |
		                  (nextreq[3] & ~|{nextreq[7:5], nextreq[2:0]} & gnt_hist[4]) |
		                  (nextreq[3] & ~|{nextreq[7:4], nextreq[2:0]});

   assign 	  newwinner[4] = (nextreq[4] & gnt_hist[3]) |
		                  (nextreq[4] & ~nextreq[3] 		       & gnt_hist[2]) |
		                  (nextreq[4] & ~|{              nextreq[3:2]} & gnt_hist[1]) |
		                  (nextreq[4] & ~|{              nextreq[3:1]} & gnt_hist[0]) |
		                  (nextreq[4] & ~|{nextreq[3:0]} & (gnt_hist[7] || (~|gnt_hist[6:0]))) |
		                  (nextreq[4] & ~|{nextreq[7  ], nextreq[3:0]} & gnt_hist[6]) |
		                  (nextreq[4] & ~|{nextreq[7:6], nextreq[3:0]} & gnt_hist[5]) |
		                  (nextreq[4] & ~|{nextreq[7:5], nextreq[3:0]});

   assign 	  newwinner[5] = (nextreq[5] & gnt_hist[4]) |
		                  (nextreq[5] & ~nextreq[4]     	       & gnt_hist[3]) |
		                  (nextreq[5] & ~|{              nextreq[4:3]} & gnt_hist[2]) |
		                  (nextreq[5] & ~|{              nextreq[4:2]} & gnt_hist[1]) |
		                  (nextreq[5] & ~|{              nextreq[4:1]} & gnt_hist[0]) |
		                  (nextreq[5] & ~|{nextreq[4:0]} & (gnt_hist[7] || (~|gnt_hist[6:0]))) |
		                  (nextreq[5] & ~|{nextreq[7  ], nextreq[4:0]} & gnt_hist[6]) |
		                  (nextreq[5] & ~|{nextreq[7:6], nextreq[4:0]});

   assign 	  newwinner[6] = (nextreq[6] & gnt_hist[5]) |
		                  (nextreq[6] & ~nextreq[5]    		       & gnt_hist[4]) |
		                  (nextreq[6] & ~|{              nextreq[5:4]} & gnt_hist[3]) |
		                  (nextreq[6] & ~|{              nextreq[5:3]} & gnt_hist[2]) |
		                  (nextreq[6] & ~|{              nextreq[5:2]} & gnt_hist[1]) |
		                  (nextreq[6] & ~|{              nextreq[5:1]} & gnt_hist[0]) |
		                  (nextreq[6] & ~|{nextreq[5:0]} & (gnt_hist[7] || (~|gnt_hist[6:0]))) |
		                  (nextreq[6] & ~|{nextreq[7  ], nextreq[5:0]});

   assign 	  newwinner[7] = (nextreq[7] & gnt_hist[6]) |
		                  (nextreq[7] & ~nextreq[6] 		       & gnt_hist[5]) |
		                  (nextreq[7] & ~|{              nextreq[6:5]} & gnt_hist[4]) |
		                  (nextreq[7] & ~|{              nextreq[6:4]} & gnt_hist[3]) |
		                  (nextreq[7] & ~|{              nextreq[6:3]} & gnt_hist[2]) |
		                  (nextreq[7] & ~|{              nextreq[6:2]} & gnt_hist[1]) |
		                  (nextreq[7] & ~|{              nextreq[6:1]} & gnt_hist[0]) |
		                  (nextreq[7] & ~|{              nextreq[6:0]});

   assign 	  opcc_olc0_gnt 	= ~busbusy & ~read_slph & gnt[0] ;
   assign 	  opcc_olc1_gnt 	= ~busbusy & ~read_slph & gnt[1] ;
   assign 	  opcc_olc2_gnt 	= ~busbusy & ~read_slph & gnt[2] ;
   assign 	  opcc_olc3_gnt 	= ~busbusy & ~read_slph & gnt[3] ;
   assign 	  opcc_olc4_gnt 	= ~busbusy & ~read_slph & gnt[4] ;
   assign 	  opcc_olc5_gnt 	= ~busbusy & ~read_slph & gnt[5] ;   
   assign 	  opcc_olc6_gnt 	= ~busbusy & ~read_slph & gnt[6] ;
   assign 	  opcc_olc7_gnt 	= ~busbusy & ~read_slph & gnt[7] ;

   assign 	  nextwinner[7:0] = (~busbusy | &buscnt[2:0]) & ~nextread_slph & ~read_slph ? newwinner[7:0] : winner[7:0];
 //  assign 	  nextgnt[7:0] = (~busbusy | &buscnt[2:0] ) & ~nextread_slph & ~read_slph ? nextwinner[7:0] :gnt[7:0] ;

    assign 	  nextgnt[7:0] = (~busbusy | &buscnt[2:0] ) & ~nextread_slph & ~read_slph ? newwinner[7:0] :gnt[7:0] ;
    assign	  gnt_hist_l[7:0] = | nextgnt[7:0] ? nextgnt[7:0] : gnt_hist[7:0] ;
   

   
   sio_opcc_ctl_msff_ctl_macro__width_42 ff_slpstates  (
	.scan_in(ff_slpstates_scanin),
	.scan_out(ff_slpstates_scanout),
	.din  ({gnt_d1[5:0], nextgntd1[7:0], nextgnt[7:0], nextwinner[7:0],
		nextread_slph, nextcycleis_slph, 
		nextdmuread_slph,
		nextentread_slph,
		gnt_hist_l[7:0]}),
	.dout ({gnt_d2[5:0], gnt_d1[7:0], gnt[7:0], winner[7:0],
		read_slph, cycle_slph,
		dmuread_slph,
		entread_slph,
		gnt_hist[7:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


   assign dmuwinner[7:0] = gnt[7:0] & dmureq[7:0];

   assign entwinner[7:0] = gnt[7:0] & entreq[7:0];
				       
   // the follow signals are not qualified by the request valid signal nor grant
   
   assign dmureadreq[7:0] = dmureq[7:0] & readreq[7:0];
   assign entreadreq[7:0] = entreq[7:0] & readreq[7:0];
   

   assign readreq[7:0] = {olc7_opcc_datareq,
			  olc6_opcc_datareq,
			  olc5_opcc_datareq,
			  olc4_opcc_datareq,
			  olc3_opcc_datareq,
			  olc2_opcc_datareq,
			  olc1_opcc_datareq,
			  olc0_opcc_datareq};
   
   assign dmureq[7:0] =  {olc7_opcc_dmureq,
			  olc6_opcc_dmureq,
			  olc5_opcc_dmureq,
			  olc4_opcc_dmureq,
			  olc3_opcc_dmureq,
			  olc2_opcc_dmureq,
			  olc1_opcc_dmureq,
			  olc0_opcc_dmureq};
				  
   assign entreq[7:0] =  {~olc7_opcc_dmureq,
			  ~olc6_opcc_dmureq,
			  ~olc5_opcc_dmureq,
			  ~olc4_opcc_dmureq,
			  ~olc3_opcc_dmureq,
			  ~olc2_opcc_dmureq,
			  ~olc1_opcc_dmureq,
			  ~olc0_opcc_dmureq};

   assign nextcycleis_slph = ~busbusy & ~read_slph & (|gnt[7:0]);
   assign nextread_slph = ~busbusy & ~read_slph & |(gnt[7:0] & readreq[7:0]);
   assign nextdmuread_slph = ~busbusy & ~read_slph & |(gnt[7:0] & dmureadreq[7:0]);
   assign nextentread_slph = ~busbusy & ~read_slph & |(gnt[7:0] & entreadreq[7:0]);

   assign busbusy = (|buscnt[2:0]); //  | nextread_slph;

   assign buscnt_plus1[2:0] = buscnt[2:0] + 3'b001;
   assign buscnt_inc = (|buscnt[2:0]) | (read_slph);
   assign buscnt_next[2:0] = buscnt_inc ? buscnt_plus1[2:0] : buscnt[2:0];
   assign nextgntd1[7:0] = (nextcycleis_slph) ? gnt[7:0] : gnt_d1[7:0];
   

   
   sio_opcc_ctl_msff_ctl_macro__width_3 ff_buscnt  (
	.scan_in(ff_buscnt_scanin),
	.scan_out(ff_buscnt_scanout),
	.din  (buscnt_next[2:0]),
	.dout (buscnt[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


   // CREATE FIFO WRITE POINTER LOGIC

   assign opdhq0won = |dmuwinner[7:0];
   assign opdhq1won = |entwinner[7:0];
   assign opdhq0won_slph = cycle_slph & opdhq0won_d1;
   assign opdhq1won_slph = cycle_slph & opdhq1won_d1;

   assign opcc_opdhq0_wr_en = opdhq0won_opc1; // DMU hdrq -- valid on opc1
   assign opcc_opdhq1_wr_en = opdhq1won_opc1; // ENT hdrq -- valid on opc1

   assign opdhq0_wr_addrinc = opdhq0won_opc1;
   assign opdhq1_wr_addrinc = opdhq1won_opc1;
   assign opdhq0_wr_addr_next[4:0] = opdhq0_wr_addrinc ? opdhq0_wr_addr[4:0] + 5'b00001 :  opdhq0_wr_addr[4:0];
   assign opdhq1_wr_addr_next[4:0] = opdhq1_wr_addrinc ? opdhq1_wr_addr[4:0] + 5'b00001 :  opdhq1_wr_addr[4:0];

   assign opcc_opdhq0_wr_addr[3:0] = opdhq0_wr_addr[3:0]; // DMU hdrq -- valid on opc1
   assign opcc_opdhq1_wr_addr[3:0] = opdhq1_wr_addr[3:0]; // ENT hdrq -- valid on opc1 
   

//   assign opddq0x_wr_addrinc4_next = opdhq0won_opc1 & ~dmuread_opc1;
//   assign opddq1x_wr_addrinc4_next = opdhq1won_opc1 & ~entread_opc1;
   assign opddq0x_wr_addrinc4_next = 1'b0;
   assign opddq1x_wr_addrinc4_next = 1'b0;	//do not skip 4 location when no data
   
   assign opddq00_wr_addrinc_next = |{dmuread_opc1, dmuread_opc3, 
		 		      dmuread_opc5, dmuread_opc7};
   
   assign opddq10_wr_addrinc_next = |{entread_opc1, entread_opc3,
				      entread_opc5, entread_opc7};
   
   assign opddq01_wr_addrinc_next = |{dmuread_opc2, dmuread_opc4, 
		 		      dmuread_opc6, dmuread_opc8};
   
   assign opddq11_wr_addrinc_next = |{entread_opc2, entread_opc4,  
				      entread_opc6, entread_opc8};
   
   assign opddq00_wr_addr_next[6:0] = opddq0x_wr_addrinc4_next ? (opddq00_wr_addr[6:0] + 7'b0000100) : 
	                                 (opddq00_wr_addrinc ? opddq00_wr_addr[6:0] + 7'b0000001 :  opddq00_wr_addr[6:0]);
   assign opddq10_wr_addr_next[6:0] = opddq1x_wr_addrinc4_next ? (opddq10_wr_addr[6:0] + 7'b0000100) :
                                         (opddq10_wr_addrinc ? opddq10_wr_addr[6:0] + 7'b0000001 :  opddq10_wr_addr[6:0]);

   assign opcc_opddq00_wr_addr[5:0] = opddq00_wr_addr[5:0]; // DMU dataq -- valid on opc2,4,6,8
   assign opcc_opddq10_wr_addr[5:0] = opddq10_wr_addr[5:0]; // ENT dataq -- valid on opc2,4,6,8 

   assign opddq01_wr_addr_next[6:0] = opddq0x_wr_addrinc4_next ? (opddq01_wr_addr[6:0] + 7'b0000100) :
	                                 (opddq01_wr_addrinc ? opddq01_wr_addr[6:0] + 7'b0000001 :  opddq01_wr_addr[6:0]);
   assign opddq11_wr_addr_next[6:0] = opddq1x_wr_addrinc4_next ? (opddq11_wr_addr[6:0] + 7'b0000100) :
	                                 (opddq11_wr_addrinc ? opddq11_wr_addr[6:0] + 7'b0000001 :  opddq11_wr_addr[6:0]);

   assign opcc_opddq01_wr_addr[5:0] = opddq01_wr_addr[5:0]; // DMU dataq -- valid on opc3,5,7,9
   assign opcc_opddq11_wr_addr[5:0] = opddq11_wr_addr[5:0]; // ENT dataq -- valid on opc3,5,7,9 
   
   assign opcc_opddq00_wr_en = opddq00_wr_addrinc; // DMU dataq -- valid on opc1
   assign opcc_opddq10_wr_en = opddq10_wr_addrinc; // ENT dataq -- valid on opc1
   assign opcc_opddq01_wr_en = opddq01_wr_addrinc; // DMU dataq -- valid on opc1
   assign opcc_opddq11_wr_en = opddq11_wr_addrinc; // ENT dataq -- valid on opc1



   sio_opcc_ctl_msff_ctl_macro__width_4 ff_hqxwonstage  (
	.scan_in(ff_hqxwonstage_scanin),
	.scan_out(ff_hqxwonstage_scanout),
	.din  ({opdhq0won, opdhq0won_slph,
		opdhq1won, opdhq1won_slph}
	       ),
	.dout ({opdhq0won_d1, opdhq0won_opc1,
		opdhq1won_d1, opdhq1won_opc1}
	       ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_opcc_ctl_msff_ctl_macro__width_16 ff_qxdatastage  (
	.scan_in(ff_qxdatastage_scanin),
	.scan_out(ff_qxdatastage_scanout),
	.din  ({dmuread_slph, dmuread_opc1, dmuread_opc2, dmuread_opc3, 
		dmuread_opc4, dmuread_opc5, dmuread_opc6, dmuread_opc7,
	        entread_slph, entread_opc1, entread_opc2, entread_opc3, 
		entread_opc4, entread_opc5, entread_opc6, entread_opc7}
	       ),
	.dout ({dmuread_opc1, dmuread_opc2, dmuread_opc3, dmuread_opc4,
		dmuread_opc5, dmuread_opc6, dmuread_opc7, dmuread_opc8,
 		entread_opc1, entread_opc2, entread_opc3, entread_opc4,
		entread_opc5, entread_opc6, entread_opc7, entread_opc8}
	       ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   // INTERNAL DMU hdrq -- valid on opc1

   sio_opcc_ctl_msff_ctl_macro__width_5 ff_opdhq0_wr_addr  (
	.scan_in(ff_opdhq0_wr_addr_scanin),
	.scan_out(ff_opdhq0_wr_addr_scanout),
	.din  (opdhq0_wr_addr_next[4:0]),
	.dout (opdhq0_wr_addr[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   // INTERNAL ENT hdrq -- valid on opc1

   sio_opcc_ctl_msff_ctl_macro__width_5 ff_opdhq1_wr_addr  (
	.scan_in(ff_opdhq1_wr_addr_scanin),
	.scan_out(ff_opdhq1_wr_addr_scanout),
	.din  (opdhq1_wr_addr_next[4:0]),
	.dout (opdhq1_wr_addr[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   // INTERNAL DMU dataq0 -- valid on opc2,4,6,8
   sio_opcc_ctl_msff_ctl_macro__width_7 ff_opddq00_wr_addr  (
	.scan_in(ff_opddq00_wr_addr_scanin),
	.scan_out(ff_opddq00_wr_addr_scanout),
	.din  (opddq00_wr_addr_next[6:0]),
	.dout (opddq00_wr_addr[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   // INTERNAL ENT dataq0 -- valid on opc2,4,6,8
   sio_opcc_ctl_msff_ctl_macro__width_7 ff_opddq10_wr_addr  (
	.scan_in(ff_opddq10_wr_addr_scanin),
	.scan_out(ff_opddq10_wr_addr_scanout),
	.din  (opddq10_wr_addr_next[6:0]),
	.dout (opddq10_wr_addr[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   // INTERNAL DMU dataq1 -- valid on opc3,5,7,9
   sio_opcc_ctl_msff_ctl_macro__width_7 ff_opddq01_wr_addr  (
	.scan_in(ff_opddq01_wr_addr_scanin),
	.scan_out(ff_opddq01_wr_addr_scanout),
	.din  (opddq01_wr_addr_next[6:0]),
	.dout (opddq01_wr_addr[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   // INTERNAL ENT dataq1-- valid on opc3,5,7,9
   sio_opcc_ctl_msff_ctl_macro__width_7 ff_opddq11_wr_addr  (
	.scan_in(ff_opddq11_wr_addr_scanin),
	.scan_out(ff_opddq11_wr_addr_scanout),
	.din  (opddq11_wr_addr_next[6:0]),
	.dout (opddq11_wr_addr[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   // INTERNAL dataq write pointer increment
						   
   sio_opcc_ctl_msff_ctl_macro__width_1 ff_opddq00_wr_addrinc  (
	.scan_in(ff_opddq00_wr_addrinc_scanin),
	.scan_out(ff_opddq00_wr_addrinc_scanout),
	.din  (opddq00_wr_addrinc_next),
	.dout (opddq00_wr_addrinc),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_opcc_ctl_msff_ctl_macro__width_1 ff_opddq01_wr_addrinc  (
	.scan_in(ff_opddq01_wr_addrinc_scanin),
	.scan_out(ff_opddq01_wr_addrinc_scanout),
	.din  (opddq01_wr_addrinc_next),
	.dout (opddq01_wr_addrinc),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
						   
   sio_opcc_ctl_msff_ctl_macro__width_1 ff_opddq10_wr_addrinc  (
	.scan_in(ff_opddq10_wr_addrinc_scanin),
	.scan_out(ff_opddq10_wr_addrinc_scanout),
	.din  (opddq10_wr_addrinc_next),
	.dout (opddq10_wr_addrinc),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
     
   sio_opcc_ctl_msff_ctl_macro__width_1 ff_opddq11_wr_addrinc  (
	.scan_in(ff_opddq11_wr_addrinc_scanin),
	.scan_out(ff_opddq11_wr_addrinc_scanout),
	.din  (opddq11_wr_addrinc_next),
	.dout (opddq11_wr_addrinc),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);


   // Synchronize the gray coded write pointers TO sio_opcs_ctl

   // until we have a sync macro cell, i'm using 2 msff_ctl_macros
   sio_opcc_ctl_msff_ctl_macro__width_7 ff_opddq00_wr_addr_d1  (
	.scan_in(ff_opddq00_wr_addr_d1_scanin),
	.scan_out(ff_opddq00_wr_addr_d1_scanout),
	.din  (opddq00_wr_addr[6:0]),
	.dout (opddq00_wr_addr_d1[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
 	);

   assign sync_in_opddq00_wr_addr[6:0] = cmp_io_sync_en ? opddq00_wr_addr_d1[6:0] : sync_out_opddq00_wr_addr[6:0];
   sio_opcc_ctl_msff_ctl_macro__width_7 ff_syn_opddq00_wr_addr  (
	.scan_in(ff_syn_opddq00_wr_addr_scanin),
	.scan_out(ff_syn_opddq00_wr_addr_scanout),
	.din  (sync_in_opddq00_wr_addr[6:0]),
	.dout (sync_out_opddq00_wr_addr[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
   


   sio_opcc_ctl_msff_ctl_macro__width_7 ff_opddq01_wr_addr_d1  (
	.scan_in(ff_opddq01_wr_addr_d1_scanin),
	.scan_out(ff_opddq01_wr_addr_d1_scanout),
	.din  (opddq01_wr_addr[6:0]),
	.dout (opddq01_wr_addr_d1[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
   assign sync_in_opddq01_wr_addr[6:0] = cmp_io_sync_en ? opddq01_wr_addr_d1[6:0] : sync_out_opddq01_wr_addr[6:0];
   sio_opcc_ctl_msff_ctl_macro__width_7 ff_syn_opddq01_wr_addr  (
	.scan_in(ff_syn_opddq01_wr_addr_scanin),
	.scan_out(ff_syn_opddq01_wr_addr_scanout),
	.din  (sync_in_opddq01_wr_addr[6:0]),
	.dout (sync_out_opddq01_wr_addr[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);



   sio_opcc_ctl_msff_ctl_macro__width_7 ff_opddq10_wr_addr_d1  (
	.scan_in(ff_opddq10_wr_addr_d1_scanin),
	.scan_out(ff_opddq10_wr_addr_d1_scanout),
	.din  (opddq10_wr_addr[6:0]),
	.dout (opddq10_wr_addr_d1[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
   assign sync_in_opddq10_wr_addr[6:0] = cmp_io_sync_en ? opddq10_wr_addr_d1[6:0] : sync_out_opddq10_wr_addr[6:0];


   sio_opcc_ctl_msff_ctl_macro__width_7 ff_syn_opddq10_wr_addr  (
	.scan_in(ff_syn_opddq10_wr_addr_scanin),
	.scan_out(ff_syn_opddq10_wr_addr_scanout),
	.din  (sync_in_opddq10_wr_addr[6:0]),
	.dout (sync_out_opddq10_wr_addr[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);



   sio_opcc_ctl_msff_ctl_macro__width_7 ff_opddq11_wr_addr_d1  (
	.scan_in(ff_opddq11_wr_addr_d1_scanin),
	.scan_out(ff_opddq11_wr_addr_d1_scanout),
	.din  (opddq11_wr_addr[6:0]),
	.dout (opddq11_wr_addr_d1[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
   assign sync_in_opddq11_wr_addr[6:0] = cmp_io_sync_en ? opddq11_wr_addr_d1[6:0] : sync_out_opddq11_wr_addr[6:0];
   sio_opcc_ctl_msff_ctl_macro__width_7 ff_syn_opddq11_wr_addr  (
	.scan_in(ff_syn_opddq11_wr_addr_scanin),
	.scan_out(ff_syn_opddq11_wr_addr_scanout),
	.din  (sync_in_opddq11_wr_addr[6:0]),
	.dout (sync_out_opddq11_wr_addr[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_opcc_ctl_msff_ctl_macro__width_5 ff_opdhq0_wr_addr_d1  (
	.scan_in(ff_opdhq0_wr_addr_d1_scanin),
	.scan_out(ff_opdhq0_wr_addr_d1_scanout),
	.din  (opdhq0_wr_addr[4:0]),
	.dout (opdhq0_wr_addr_d1[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
   assign sync_in_opdhq0_wr_addr[4:0] = cmp_io_sync_en ? opdhq0_wr_addr_d1[4:0] : sync_out_opdhq0_wr_addr[4:0];
   sio_opcc_ctl_msff_ctl_macro__width_5 ff_syn_opdhq0_wr_addr  (
	.scan_in(ff_syn_opdhq0_wr_addr_scanin),
	.scan_out(ff_syn_opdhq0_wr_addr_scanout),
	.din  (sync_in_opdhq0_wr_addr[4:0]),
	.dout (sync_out_opdhq0_wr_addr[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

   sio_opcc_ctl_msff_ctl_macro__width_5 ff_opdhq1_wr_addr_d1  (
	.scan_in(ff_opdhq1_wr_addr_d1_scanin),
	.scan_out(ff_opdhq1_wr_addr_d1_scanout),
	.din  (opdhq1_wr_addr[4:0]),
	.dout (opdhq1_wr_addr_d1[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);
   assign sync_in_opdhq1_wr_addr[4:0] = cmp_io_sync_en ? opdhq1_wr_addr_d1[4:0] : sync_out_opdhq1_wr_addr[4:0];
   sio_opcc_ctl_msff_ctl_macro__width_5 ff_syn_opdhq1_wr_addr  (
	.scan_in(ff_syn_opdhq1_wr_addr_scanin),
	.scan_out(ff_syn_opdhq1_wr_addr_scanout),
	.din  (sync_in_opdhq1_wr_addr[4:0]),
	.dout (sync_out_opdhq1_wr_addr[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
	);

//---

   assign sync_in_opdhq0_wr_en = opcc_opdhq0_wr_en ? 1'b1 : cmp_io_sync_en ? 1'b0 : sync_out_opdhq0_wr_en_d1;
   assign opdhq0_wr_en_tmp = sync_out_opdhq0_wr_en_d1  || sync_in_opdhq0_wr_en;
   assign sync_out_opdhq0_wr_en = sync_out_opdhq0_wr_en_d2  || sync_in_opdhq0_wr_en;

   sio_opcc_ctl_msff_ctl_macro__width_1 ff_syn_opdhq0_wr_en_d1  (
        .scan_in(ff_syn_opdhq0_wr_en_d1_scanin),
        .scan_out(ff_syn_opdhq0_wr_en_d1_scanout),
        .din  (sync_in_opdhq0_wr_en),
        .dout (sync_out_opdhq0_wr_en_d1),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

   sio_opcc_ctl_msff_ctl_macro__en_1__width_1 ff_syn_opdhq0_wr_en_d2   (
	.scan_in(ff_syn_opdhq0_wr_en_d2_scanin),
	.scan_out(ff_syn_opdhq0_wr_en_d2_scanout),
	.en (cmp_io_sync_en),
        .din  (opdhq0_wr_en_tmp),
        .dout (sync_out_opdhq0_wr_en_d2),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

   assign sync_in_opdhq1_wr_en = opcc_opdhq1_wr_en ? 1'b1 : cmp_io_sync_en ? 1'b0 : sync_out_opdhq1_wr_en_d1;
   assign opdhq1_wr_en_tmp = sync_out_opdhq1_wr_en_d1  || sync_in_opdhq1_wr_en;
   assign sync_out_opdhq1_wr_en = sync_out_opdhq1_wr_en_d2  || sync_in_opdhq1_wr_en;

   sio_opcc_ctl_msff_ctl_macro__width_1 ff_syn_opdhq1_wr_en_d1  (
        .scan_in(ff_syn_opdhq1_wr_en_d1_scanin),
        .scan_out(ff_syn_opdhq1_wr_en_d1_scanout),
        .din  (sync_in_opdhq1_wr_en),
        .dout (sync_out_opdhq1_wr_en_d1),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );

   sio_opcc_ctl_msff_ctl_macro__width_1 ff_syn_opdhq1_wr_en_d2  (
//	.en(cmp_io_sync_en),
        .scan_in(ff_syn_opdhq1_wr_en_d2_scanin),
        .scan_out(ff_syn_opdhq1_wr_en_d2_scanout),
        .din  (opdhq1_wr_en_tmp),
        .dout (sync_out_opdhq1_wr_en_d2),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
        );




   assign opcc_opcs_opddq00_wr_addr[6:0] = sync_out_opddq00_wr_addr[6:0]; // DMU dataq -- cmp domain synced, gray-coded + 1 bit
   assign opcc_opcs_opddq10_wr_addr[6:0] = sync_out_opddq10_wr_addr[6:0]; // ENT dataq -- cmp domain synced, gray-coded + 1 bit
   assign opcc_opcs_opddq01_wr_addr[6:0] = sync_out_opddq01_wr_addr[6:0]; // DMU dataq -- cmp domain synced, gray-coded + 1 bit
   assign opcc_opcs_opddq11_wr_addr[6:0] = sync_out_opddq11_wr_addr[6:0]; // ENT dataq -- cmp domain synced, gray-coded + 1 bit
   assign opcc_opcs_opdhq0_wr_addr[4:0] = sync_out_opdhq0_wr_addr[4:0]; // DMU hdrq -- cmp domain synced, gray-coded + 1 bit
   assign opcc_opcs_opdhq1_wr_addr[4:0] = sync_out_opdhq1_wr_addr[4:0]; // ENT hdrq -- cmp domain synced, gray-coded + 1 bit

sio_opcc_ctl_msff_ctl_macro__width_1 reg_cmp_io_sync_en  // ASYNC reset active low
                                (
                                        .scan_in(reg_cmp_io_sync_en_scanin),
                                        .scan_out(reg_cmp_io_sync_en_scanout),
                                        .dout(cmp_io_sync_en),
                                        .l1clk(l1clk),
                                        .din(cmp_io_sync_en_in),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sio_opcc_ctl_msff_ctl_macro__width_1 reg_io_cmp_sync_en  // ASYNC reset active low
                                (
                                        .scan_in(reg_io_cmp_sync_en_scanin),
                                        .scan_out(reg_io_cmp_sync_en_scanout),
                                        .dout(io_cmp_sync_en),
                                        .l1clk(l1clk),
                                        .din(io_cmp_sync_en_in),
  .siclk(siclk),
  .soclk(soclk)
                                        );

// fixscan start:
assign spares_scanin             = scan_in                  ;
assign ff_tcu_jtag_scanin        = spares_scanout           ;
assign ff_dqcnt_scanin           = ff_tcu_jtag_scanout      ;
assign ff_syn_opdhq0_rd_addr_scanin = ff_dqcnt_scanout         ;
assign ff_opdhq0_rd_addr_scanin  = ff_syn_opdhq0_rd_addr_scanout;
assign ff_syn_opdhq1_rd_addr_scanin = ff_opdhq0_rd_addr_scanout;
assign ff_opdhq1_rd_addr_scanin  = ff_syn_opdhq1_rd_addr_scanout;
assign ff_opdhq0sub_scanin       = ff_opdhq1_rd_addr_scanout;
assign ff_opdhq1sub_scanin       = ff_opdhq0sub_scanout     ;
assign ff_slpstates_scanin       = ff_opdhq1sub_scanout     ;
assign ff_buscnt_scanin          = ff_slpstates_scanout     ;
assign ff_hqxwonstage_scanin     = ff_buscnt_scanout        ;
assign ff_qxdatastage_scanin     = ff_hqxwonstage_scanout   ;
assign ff_opdhq0_wr_addr_scanin  = ff_qxdatastage_scanout   ;
assign ff_opdhq1_wr_addr_scanin  = ff_opdhq0_wr_addr_scanout;
assign ff_opddq00_wr_addr_scanin = ff_opdhq1_wr_addr_scanout;
assign ff_opddq10_wr_addr_scanin = ff_opddq00_wr_addr_scanout;
assign ff_opddq01_wr_addr_scanin = ff_opddq10_wr_addr_scanout;
assign ff_opddq11_wr_addr_scanin = ff_opddq01_wr_addr_scanout;
assign ff_opddq00_wr_addrinc_scanin = ff_opddq11_wr_addr_scanout;
assign ff_opddq01_wr_addrinc_scanin = ff_opddq00_wr_addrinc_scanout;
assign ff_opddq10_wr_addrinc_scanin = ff_opddq01_wr_addrinc_scanout;
assign ff_opddq11_wr_addrinc_scanin = ff_opddq10_wr_addrinc_scanout;
assign ff_opddq00_wr_addr_d1_scanin = ff_opddq11_wr_addrinc_scanout;
assign ff_syn_opddq00_wr_addr_scanin = ff_opddq00_wr_addr_d1_scanout;
assign ff_opddq01_wr_addr_d1_scanin = ff_syn_opddq00_wr_addr_scanout;
assign ff_syn_opddq01_wr_addr_scanin = ff_opddq01_wr_addr_d1_scanout;
assign ff_opddq10_wr_addr_d1_scanin = ff_syn_opddq01_wr_addr_scanout;
assign ff_syn_opddq10_wr_addr_scanin = ff_opddq10_wr_addr_d1_scanout;
assign ff_opddq11_wr_addr_d1_scanin = ff_syn_opddq10_wr_addr_scanout;
assign ff_syn_opddq11_wr_addr_scanin = ff_opddq11_wr_addr_d1_scanout;
assign ff_opdhq0_wr_addr_d1_scanin = ff_syn_opddq11_wr_addr_scanout;
assign ff_syn_opdhq0_wr_addr_scanin = ff_opdhq0_wr_addr_d1_scanout;
assign ff_opdhq1_wr_addr_d1_scanin = ff_syn_opdhq0_wr_addr_scanout;
assign ff_syn_opdhq1_wr_addr_scanin = ff_opdhq1_wr_addr_d1_scanout;
assign ff_syn_opdhq0_wr_en_d1_scanin = ff_syn_opdhq1_wr_addr_scanout;
assign ff_syn_opdhq0_wr_en_d2_scanin = ff_syn_opdhq0_wr_en_d1_scanout;
assign ff_syn_opdhq1_wr_en_d1_scanin = ff_syn_opdhq0_wr_en_d2_scanout;
assign ff_syn_opdhq1_wr_en_d2_scanin = ff_syn_opdhq1_wr_en_d1_scanout;
assign reg_cmp_io_sync_en_scanin = ff_syn_opdhq1_wr_en_d2_scanout;
assign reg_io_cmp_sync_en_scanin = reg_cmp_io_sync_en_scanout;
assign scan_out                  = reg_io_cmp_sync_en_scanout;
// fixscan end:
endmodule // sio_opcc_ctl






// any PARAMS parms go into naming of macro

module sio_opcc_ctl_l1clkhdr_ctl_macro (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module sio_opcc_ctl_spare_ctl_macro__num_3 (
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
assign scan_out = so_2;



endmodule






// any PARAMS parms go into naming of macro

module sio_opcc_ctl_msff_ctl_macro__width_2 (
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

module sio_opcc_ctl_msff_ctl_macro__width_12 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = din[11:0];






dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_opcc_ctl_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_opcc_ctl_msff_ctl_macro__width_42 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [41:0] fdin;
wire [40:0] so;

  input [41:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [41:0] dout;
  output scan_out;
assign fdin[41:0] = din[41:0];






dff #(42)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[41:0]),
.si({scan_in,so[40:0]}),
.so({so[40:0],scan_out}),
.q(dout[41:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_opcc_ctl_msff_ctl_macro__width_3 (
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

module sio_opcc_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






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

module sio_opcc_ctl_msff_ctl_macro__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_opcc_ctl_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_opcc_ctl_msff_ctl_macro__width_1 (
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

module sio_opcc_ctl_msff_ctl_macro__en_1__width_1 (
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








