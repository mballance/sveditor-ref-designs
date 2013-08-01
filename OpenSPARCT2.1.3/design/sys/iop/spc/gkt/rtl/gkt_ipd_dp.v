// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: gkt_ipd_dp.v
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
module  gkt_ipd_dp (
  tcu_scan_en, 
  tcu_se_scancollar_out, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  core_isolate, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  slow_cmp_sync_en, 
  const_cpuid, 
  ncu_spc_pm, 
  ncu_spc_ba01, 
  ncu_spc_ba23, 
  ncu_spc_ba45, 
  ncu_spc_ba67, 
  ncu_pm_ff, 
  ncu_ba01_ff, 
  ncu_ba23_ff, 
  ncu_ba45_ff, 
  ncu_ba67_ff, 
  spc_pcx_data_pa, 
  spc_pcx_req_pq, 
  spc_pcx_atm_pq, 
  l15_spc_data1, 
  cpx_spc_data_cx_rep0, 
  l15_spc_cpkt, 
  l15_mmu_valid, 
  l15_spu_valid, 
  ipd_optype, 
  pcx_spc_grant_px_buf, 
  cpx_spc_data_cx, 
  pcx_spc_grant_px, 
  ifu_l15_addr, 
  mmu_l15_addr, 
  lsu_l15_addr, 
  spu_l15_addr, 
  ifu_l15_valid, 
  mmu_l15_valid, 
  spu_l15_valid, 
  ifu_l15_cpkt, 
  mmu_l15_cpkt, 
  lsu_l15_cpkt, 
  spu_l15_cpkt, 
  lsu_l15_data, 
  spu_l15_data, 
  ipc_v0_ifu_new, 
  ipc_v0_ifu_shft, 
  ipc_v0_ifu_hold, 
  ipc_v1_ifu_new, 
  ipc_v1_ifu_hold, 
  ipc_v0_mmu_new, 
  ipc_v0_mmu_shft, 
  ipc_v0_mmu_hold, 
  ipc_v1_mmu_new, 
  ipc_v1_mmu_hold, 
  ipc_v0_lsu_new, 
  ipc_v0_lsu_shft, 
  ipc_v0_lsu_hold, 
  ipc_v1_lsu_new, 
  ipc_v1_lsu_hold, 
  ipc_v0_spu_new, 
  ipc_v0_spu_shft, 
  ipc_v0_spu_hold, 
  ipc_v1_spu_new, 
  ipc_v1_spu_hold, 
  ipc_sel_ndrop_ifu_l1, 
  ipc_sel_ndrop_mmu_l1, 
  ipc_sel_ndrop_lsu_l1, 
  ipc_sel_ndrop_spu_l1, 
  ipc_sel_drop_ifu_l1, 
  ipc_sel_drop_mmu_l1, 
  ipc_sel_drop_lsu_l1, 
  ipc_sel_drop_spu_l1, 
  ipc_pq_clken, 
  ipc_dropreg_wen, 
  ipc_op_req_li, 
  ipc_atm_req_li, 
  ncu_spc_l2_idx_hash_en);
wire stop;
wire cpuid_reg_scanin;
wire cpuid_reg_scanout;
wire [2:0] cpuid;
wire ncu_spc_l2_idx_hash_en_buf;
wire ncu_spc_pm_buf;
wire ncu_spc_ba01_buf;
wire ncu_spc_ba23_buf;
wire ncu_spc_ba45_buf;
wire ncu_spc_ba67_buf;
wire i_ncu_reg_scanin;
wire i_ncu_reg_scanout;
wire slow_cmp_sync_en_ff;
wire idx_hash_en_ff;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [39:0] mmu_l15_addr1;
wire [25:0] lsu_l15_cpkt1;
wire [25:0] spu_l15_cpkt1;
wire [39:0] spu_l15_addr1;
wire [25:0] mmu_l15_cpkt1;
wire [25:0] ifu_l15_cpkt1;
wire i_cpx_data1lo_reg_scanin;
wire i_cpx_data1lo_reg_scanout;
wire [145:0] l15_spc_data;
wire i_cpx_data1hi_reg_scanin;
wire i_cpx_data1hi_reg_scanout;
wire i_cpx_cpkt_reg_scanin;
wire i_cpx_cpkt_reg_scanout;
wire [18:0] cpx_cpkt;
wire i_req_li_reg_scanin;
wire i_req_li_reg_scanout;
wire [8:0] op_req;
wire [8:0] atm_req;
wire core_isolate_;
wire [8:0] pcx_req_pq_;
wire [8:0] pcx_atm_pq_;
wire i_ifu_addr_v1_muxreg_scanin;
wire i_ifu_addr_v1_muxreg_scanout;
wire [25:0] v1_ifu_cpkt;
wire [39:0] v1_ifu_addr;
wire i_ifu_addr_v0_muxreg_scanin;
wire i_ifu_addr_v0_muxreg_scanout;
wire [25:0] v0_ifu_cpkt;
wire [39:0] v0_ifu_addr;
wire i_mmu_addr_v1_muxreg_scanin;
wire i_mmu_addr_v1_muxreg_scanout;
wire [25:0] v1_mmu_cpkt;
wire [39:0] v1_mmu_addr;
wire i_mmu_addr_v0_muxreg_scanin;
wire i_mmu_addr_v0_muxreg_scanout;
wire [25:0] v0_mmu_cpkt;
wire [39:0] v0_mmu_addr;
wire i_lsu_addr_v1_muxreg_scanin;
wire i_lsu_addr_v1_muxreg_scanout;
wire [25:0] v1_lsu_cpkt;
wire [39:0] v1_lsu_addr;
wire i_lsu_addr_v0_muxreg_scanin;
wire i_lsu_addr_v0_muxreg_scanout;
wire [25:0] v0_lsu_cpkt;
wire [39:0] v0_lsu_addr;
wire i_lsu_data_v1_muxreg_scanin;
wire i_lsu_data_v1_muxreg_scanout;
wire [63:0] v1_lsu_data;
wire i_lsu_data_v0_muxreg_scanin;
wire i_lsu_data_v0_muxreg_scanout;
wire [63:0] v0_lsu_data;
wire i_spu_addr_v1_muxreg_scanin;
wire i_spu_addr_v1_muxreg_scanout;
wire [25:0] v1_spu_cpkt;
wire [39:0] v1_spu_addr;
wire i_spu_addr_v0_muxreg_scanin;
wire i_spu_addr_v0_muxreg_scanout;
wire [25:0] v0_spu_cpkt;
wire [39:0] v0_spu_addr;
wire i_spu_data_v1_muxreg_scanin;
wire i_spu_data_v1_muxreg_scanout;
wire [63:0] v1_spu_data;
wire i_spu_data_v0_muxreg_scanin;
wire i_spu_data_v0_muxreg_scanout;
wire [63:0] v0_spu_data;
wire i_ifu_addr_drop_reg_scanin;
wire i_ifu_addr_drop_reg_scanout;
wire [25:0] ipd_cpkt_l1;
wire [39:0] ipd_addr_l1;
wire [25:0] drop_ifu_cpkt;
wire [39:0] drop_ifu_addr;
wire i_mmu_addr_drop_reg_scanin;
wire i_mmu_addr_drop_reg_scanout;
wire [25:0] drop_mmu_cpkt;
wire [39:0] drop_mmu_addr;
wire i_lsu_addr_drop_reg_scanin;
wire i_lsu_addr_drop_reg_scanout;
wire [25:0] drop_lsu_cpkt;
wire [39:0] drop_lsu_addr;
wire i_spu_addr_drop_reg_scanin;
wire i_spu_addr_drop_reg_scanout;
wire [25:0] drop_spu_cpkt;
wire [39:0] drop_spu_addr;
wire i_lsu_data_drop_reg_scanin;
wire i_lsu_data_drop_reg_scanout;
wire [63:0] ipd_data_l1;
wire [63:0] drop_lsu_data;
wire i_spu_data_drop_reg_scanin;
wire i_spu_data_drop_reg_scanout;
wire [63:0] drop_spu_data;
wire [39:0] ipd_addr_l1_prebuf;
wire i_hash_en_ff2_scanin;
wire i_hash_en_ff2_scanout;
wire idx_hash_en_ff2;
wire idx_hash_en_;
wire enable_hash;
wire [17:11] ipd_addr_hashed_l1;
wire [17:11] ipd_addr_out_l1;
wire i_pcx_addr_pa_reg_scanin;
wire i_pcx_addr_pa_reg_scanout;
wire [25:0] pcx_cpkt_pa;
wire [39:0] pcx_addr_pa;
wire i_pcx_data_pa_reg_scanin;
wire i_pcx_data_pa_reg_scanout;
wire [63:0] pcx_data_pa;


// globals
input tcu_scan_en ;
input		tcu_se_scancollar_out;
input           l2clk;
input           scan_in;
input           tcu_pce_ov;             // scan signals
input           core_isolate;
input           spc_aclk;
input           spc_bclk;
output          scan_out;

input           slow_cmp_sync_en;

input [2:0]     const_cpuid;

input           ncu_spc_pm;
input           ncu_spc_ba01;
input           ncu_spc_ba23;
input           ncu_spc_ba45;
input           ncu_spc_ba67;

output           ncu_pm_ff;
output           ncu_ba01_ff;
output           ncu_ba23_ff;
output           ncu_ba45_ff;
output           ncu_ba67_ff;

output [129:0]  spc_pcx_data_pa;
output [8:0]    spc_pcx_req_pq;
output [8:0]    spc_pcx_atm_pq;



output [127:0]  l15_spc_data1;
output [145:0]  cpx_spc_data_cx_rep0;

output [17:0]   l15_spc_cpkt;
output          l15_mmu_valid;
output          l15_spu_valid;

output [8:0]    ipd_optype;
output [8:0]    pcx_spc_grant_px_buf;


input [145:0]   cpx_spc_data_cx;
input [8:0]     pcx_spc_grant_px;


input [39:0]   ifu_l15_addr;
input [39:4]   mmu_l15_addr;
input [39:0]   lsu_l15_addr;
input [38:3]   spu_l15_addr;

input          ifu_l15_valid;
input          mmu_l15_valid;
input          spu_l15_valid;


input [7:0]   ifu_l15_cpkt;
input [4:0]    mmu_l15_cpkt;
input [25:0]   lsu_l15_cpkt;
input [12:0]   spu_l15_cpkt;


input [63:0]   lsu_l15_data;
input [63:0]   spu_l15_data;


input          ipc_v0_ifu_new;
input          ipc_v0_ifu_shft;
input          ipc_v0_ifu_hold;

input          ipc_v1_ifu_new;
input          ipc_v1_ifu_hold;

input          ipc_v0_mmu_new;
input          ipc_v0_mmu_shft;
input          ipc_v0_mmu_hold;

input          ipc_v1_mmu_new;
input          ipc_v1_mmu_hold;

input          ipc_v0_lsu_new;
input          ipc_v0_lsu_shft;
input          ipc_v0_lsu_hold;

input          ipc_v1_lsu_new;
input          ipc_v1_lsu_hold;


input          ipc_v0_spu_new;
input          ipc_v0_spu_shft;
input          ipc_v0_spu_hold;

input          ipc_v1_spu_new;
input          ipc_v1_spu_hold;


input          ipc_sel_ndrop_ifu_l1;
input          ipc_sel_ndrop_mmu_l1;
input          ipc_sel_ndrop_lsu_l1;
input          ipc_sel_ndrop_spu_l1;

input          ipc_sel_drop_ifu_l1;
input          ipc_sel_drop_mmu_l1;
input          ipc_sel_drop_lsu_l1;
input          ipc_sel_drop_spu_l1;

input          ipc_pq_clken;


input [3:0]    ipc_dropreg_wen;


input [8:0]    ipc_op_req_li;
input [8:0]    ipc_atm_req_li;



input          ncu_spc_l2_idx_hash_en;


// scan renames
assign stop = 1'b0;
// end scan

// flop cpuid

gkt_ipd_dp_msff_macro__stack_66c__width_3 cpuid_reg   
(
 .scan_in(cpuid_reg_scanin),
 .scan_out(cpuid_reg_scanout),
 .clk( l2clk ),
 .en  (1'b1),
 .din  ({const_cpuid[2:0]}),
 .dout (cpuid[2:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
 );

// ISOLATION BUFFER for grant signals
gkt_ipd_dp_buff_macro__dbuff_16x__rep_1__stack_none__width_9 isolate_grant_buf 
(
 .din({pcx_spc_grant_px[8:0]}),
 .dout({pcx_spc_grant_px_buf[8:0]})
 );

//flop ncu signals
// They are launched in iol2clk domain, and captured in cmp domain using sync enable
// Also since these are primary inputs to sparc core, se port is connected to scancollar_out.
// This stops the flops from capturing state during logic bist.

// ISOLATION BUFFER
gkt_ipd_dp_buff_macro__dbuff_16x__rep_1__stack_none__width_6 isolate_ncu_buf 
(
 .din({ncu_spc_l2_idx_hash_en,ncu_spc_pm,ncu_spc_ba01,ncu_spc_ba23,ncu_spc_ba45,ncu_spc_ba67}),
 .dout({ncu_spc_l2_idx_hash_en_buf,ncu_spc_pm_buf,ncu_spc_ba01_buf,ncu_spc_ba23_buf,ncu_spc_ba45_buf,ncu_spc_ba67_buf})

 );

gkt_ipd_dp_msff_macro__stack_64c__width_6 i_ncu_reg  
(
 .scan_in(i_ncu_reg_scanin),
 .scan_out(i_ncu_reg_scanout),
 .se(tcu_se_scancollar_out),
 .clk (l2clk),
 .en  (slow_cmp_sync_en_ff),
 .din({ncu_spc_l2_idx_hash_en_buf,ncu_spc_pm_buf,ncu_spc_ba01_buf,ncu_spc_ba23_buf,ncu_spc_ba45_buf,ncu_spc_ba67_buf}),
 .dout({idx_hash_en_ff, ncu_pm_ff, ncu_ba01_ff, ncu_ba23_ff, ncu_ba45_ff, ncu_ba67_ff}),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0   (
  .din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
  .dout({se,pce_ov,siclk,soclk})
);


assign mmu_l15_addr1[39:0] = {mmu_l15_addr[39:4],4'b0};


// form the cpkts
assign lsu_l15_cpkt1[25:0] = lsu_l15_cpkt[25:0];


// actual spu pkt format:
//assign spu_l15_cpkt[25] = spu_l15_valid;
//assign spu_l15_cpkt[24:21] = 4'b0010;                    //rqtyp
// assign spu_l15_cpkt[20] = req_type
//assign spu_l15_cpkt[19] = 1'b1;                           //nc
//assign spu_l15_cpkt[18:16] = cpuid[2:0];                  //cpuid
//assign spu_l15_cpkt[15:13] = tid 
//assign spu_l15_cpkt[12:11] = 2'b00;                      //inv,pf,bis
//assign spu_l15_cpkt[10] = maid
//assign spu_l15_cpkt[9:8] =  2'b00
//assign spu_l15_cpkt[7:0] = byte valids                          //size

assign spu_l15_cpkt1[25:0] = {spu_l15_valid, 4'b0010, spu_l15_cpkt[4], 1'b1, cpuid[2:0], spu_l15_cpkt[2:0], 2'b0, spu_l15_cpkt[3], 2'b0, spu_l15_cpkt[12:5]};

assign spu_l15_addr1[39:0] = {1'b0, spu_l15_addr[38:3], 3'b000};

// actual mmu pkt format:
//assign mmu_l15_cpkt[25] = mmu_l15_valid;
//assign mmu_l15_cpkt[24:20] = 5'b01000;                    //rqtyp
//assign mmu_l15_cpkt[19] = 1'b1;                           //nc
//assign mmu_l15_cpkt[18:16] = cpuid[2:0];                  //cpuid
//assign mmu_l15_cpkt[15:13] = tid 
//assign mmu_l15_cpkt[12:10] = 3'b000;                      //inv,pf,bis
//assign mmu_l15_cpkt[9:7] =  mmuid
//assign mmu_l15_cpkt[7:0] = 8'b0;                          //size

assign mmu_l15_cpkt1[25:0] = {mmu_l15_valid,5'b01000,1'b1,cpuid[2:0],mmu_l15_cpkt[2:0],3'b0,mmu_l15_cpkt[4:3],8'b0};

// Actual ifu_l15_cpkt has following fields
// ifu_l15_cpkt[25]   = ifu_l15_valid
// ifu_l15_cpkt[24:20] = ifu_l15_req_type[4:0] = 5'b10000
// ifu_l15_cpkt[19]   = ifu_l15_nc
// ifu_l15_cpkt[18:16] = ifu_l15_cpuid[2:0]
// ifu_l15_cpkt[15:13] = ifu_l15_tid[2:0]
// ifu_l15_cpkt[12]    = ifu_l15_inv
// ifu_l15_cpkt[11]    = ifu_l15_pf = 0
// ifu_l15_cpkt[10:8] = ifu_l15_rway[2:0]
// ifu_l15_cpkt[7:0] = ifu_l15_size[7:0] = 0

assign ifu_l15_cpkt1[25:0] = {ifu_l15_valid,5'b10000,ifu_l15_cpkt[7],cpuid[2:0],
                              ifu_l15_cpkt[2:0],ifu_l15_cpkt[6],1'b0,ifu_l15_cpkt[5:3],8'b0};


///////////////////////////////////////////////////////////////////
// PIPE the CPX data and cpkt to SPARC core
// Also since these are primary inputs to sparc core, se port is connected to scancollar_out.
// This stops the flops from capturing state during logic bist.
///////////////////////////////////////////////////////////////////
// ISOLATION BUFFER 
gkt_ipd_dp_buff_macro__dbuff_48x__rep_1__stack_64c__width_64 gkt_lsu_datalo_rep0  (
.din (cpx_spc_data_cx[63:0]),
  .dout(cpx_spc_data_cx_rep0[63:0])
  );

gkt_ipd_dp_msff_macro__stack_64c__width_64 i_cpx_data1lo_reg  
(
 .scan_in(i_cpx_data1lo_reg_scanin),
 .scan_out(i_cpx_data1lo_reg_scanout),
 .se(tcu_se_scancollar_out),
 .clk (l2clk),
 .en  (1'b1),
 .din(cpx_spc_data_cx_rep0[63:0]),          
 .dout(l15_spc_data[63:0]),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_buff_macro__dbuff_48x__rep_1__stack_64c__width_64 i_buf_data1lo_spc    (
	.din	(l15_spc_data[63:0]),
	.dout	(l15_spc_data1[63:0])
);

//ISOLATION BUFFER 
gkt_ipd_dp_buff_macro__dbuff_48x__rep_1__stack_64c__width_64 gkt_lsu_datahi_rep0  (
  .din (cpx_spc_data_cx[127:64]),
  .dout(cpx_spc_data_cx_rep0[127:64])
  );

gkt_ipd_dp_msff_macro__stack_64c__width_64 i_cpx_data1hi_reg  
(
 .scan_in(i_cpx_data1hi_reg_scanin),
 .scan_out(i_cpx_data1hi_reg_scanout),
 .se(tcu_se_scancollar_out),
 .clk (l2clk),
 .en  (1'b1),
 .din(cpx_spc_data_cx_rep0[127:64]),          
 .dout(l15_spc_data[127:64]),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_buff_macro__dbuff_48x__rep_1__stack_64c__width_64 i_buf_data1hi_spc    (
	.din	(l15_spc_data[127:64]),
	.dout	(l15_spc_data1[127:64])
);

//ISOLATION BUFFER 
gkt_ipd_dp_buff_macro__dbuff_48x__rep_1__stack_none__width_18 gkt_lsu_cpkt_rep0  (
  .din (cpx_spc_data_cx[145:128]),
  .dout(cpx_spc_data_cx_rep0[145:128])
);

gkt_ipd_dp_msff_macro__stack_64c__width_18 i_cpx_cpkt_reg  
(
 .scan_in(i_cpx_cpkt_reg_scanin),
 .scan_out(i_cpx_cpkt_reg_scanout),
 .se(tcu_se_scancollar_out),
 .clk (l2clk),
 .en  (1'b1),
 .din({cpx_spc_data_cx_rep0[145:128]}),
 .dout({l15_spc_data[145:128]}),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign cpx_cpkt[18:0] = {l15_spc_data[145:140],1'b0,l15_spc_data[139:128]};

gkt_ipd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_20 i_buf_cpkt_spc    (
	.din	({cpx_cpkt[18],cpx_cpkt[18:0]}),
	.dout	({l15_spu_valid,l15_mmu_valid,l15_spc_cpkt[17:0]})
);

///////////////////////////////////////////////////////////////////
// Generate request and atomic signals going to PCX
///////////////////////////////////////////////////////////////////
//assign op_req[8:0] = ({9{req_dropped_lat}} & req_repeat_drop_l1[8:0]) |
//                     ({9{req_dropped_lat_}} & req_repeat_ndrop_l1[8:0]) |
//                     (req_nrepeat_drop_l1[8:0]) |
//                     (req_nrepeat_ndrop_l1[8:0]);
//assign spc_pcx_req_pq[8:0] = op_req[8:0] & {9{~core_isolate}};

// flop op_req_li and atm_req_li


gkt_ipd_dp_msff_macro__dmsff_8x__stack_64c__width_19 i_req_li_reg  
(
 .scan_in(i_req_li_reg_scanin),
 .scan_out(i_req_li_reg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din({slow_cmp_sync_en,ipc_op_req_li[8:0],ipc_atm_req_li[8:0]}),
 .dout({slow_cmp_sync_en_ff, op_req[8:0], atm_req[8:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


gkt_ipd_dp_inv_macro__dinv_8x__stack_64c__width_1 i_clk_stop_inv    (
.din (core_isolate),
.dout (core_isolate_)
);
                                               
gkt_ipd_dp_nand_macro__dnand_16x__ports_2__stack_64c__width_9 i_pcx_req_nand_w9    
(
 .din0(op_req[8:0]),
 .din1({9{core_isolate_}}),
 .dout(pcx_req_pq_[8:0])
 );

gkt_ipd_dp_inv_macro__dinv_48x__stack_64c__width_9 i_pcx_req_inv_w9   
(
 .din({pcx_req_pq_[8:0]}),
 .dout({spc_pcx_req_pq[8:0]})
 );


//assign atm_req[8:0] = {9{~ipc_dropreg_valid[2]}} & ipc_atm_l1[8:0];
//assign spc_pcx_atm_pq[8:0] = atm_req[8:0] & {9{~core_isolate}};

gkt_ipd_dp_nand_macro__dnand_16x__ports_2__stack_64c__width_9 i_atm_nand     (
.din0 (atm_req[8:0]),
.din1 ({9{core_isolate_}}),
.dout (pcx_atm_pq_[8:0])
);
                                                            
gkt_ipd_dp_inv_macro__dinv_48x__stack_64c__width_9 i_pcx_atm_inv_w9   
(
 .din({pcx_atm_pq_[8:0]}),
 .dout({spc_pcx_atm_pq[8:0]})
 );


// assertion, atomic request cannot be asserted without valid request
/* 0in assert -var (~(|(spc_pcx_atm_pq[8:0] & ~(spc_pcx_req_pq[8:0]))))
 -message "l15_ipc_ctl: spc_pcx_atm_pq asserted without spc_pcx_req_pq" */



///////////////////////////////////////////////////////////////////
// Latch ifu pkt in 2-entry FIFO
///////////////////////////////////////////////////////////////////
gkt_ipd_dp_msff_macro__mux_aonpe__ports_2__stack_66c__width_66 i_ifu_addr_v1_muxreg  
(
 .scan_in(i_ifu_addr_v1_muxreg_scanin),
 .scan_out(i_ifu_addr_v1_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0({ifu_l15_cpkt1[25:0],ifu_l15_addr[39:0]}),          
 .din1({v1_ifu_cpkt[25:0],v1_ifu_addr[39:0]}),                     
 .sel0(ipc_v1_ifu_new),
 .sel1(ipc_v1_ifu_hold),
 .dout({v1_ifu_cpkt[25:0],v1_ifu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__mux_aonpe__ports_3__stack_66c__width_66 i_ifu_addr_v0_muxreg  
(
 .scan_in(i_ifu_addr_v0_muxreg_scanin),
 .scan_out(i_ifu_addr_v0_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0({ifu_l15_cpkt1[25:0],ifu_l15_addr[39:0]}),          
 .din1({v1_ifu_cpkt[25:0],v1_ifu_addr[39:0]}),                     
 .din2({v0_ifu_cpkt[25:0],v0_ifu_addr[39:0]}),                     
 .sel0(ipc_v0_ifu_new),
 .sel1(ipc_v0_ifu_shft),
 .sel2(ipc_v0_ifu_hold),
 .dout({v0_ifu_cpkt[25:0],v0_ifu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


///////////////////////////////////////////////////////////////////
// Latch mmu pkt in 2-entry FIFO
///////////////////////////////////////////////////////////////////
gkt_ipd_dp_msff_macro__mux_aonpe__ports_2__stack_66c__width_66 i_mmu_addr_v1_muxreg  
(
 .scan_in(i_mmu_addr_v1_muxreg_scanin),
 .scan_out(i_mmu_addr_v1_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0({mmu_l15_cpkt1[25:0],mmu_l15_addr1[39:0]}),          
 .din1({v1_mmu_cpkt[25:0],v1_mmu_addr[39:0]}),                     
 .sel0(ipc_v1_mmu_new),
 .sel1(ipc_v1_mmu_hold),
 .dout({v1_mmu_cpkt[25:0],v1_mmu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__mux_aonpe__ports_3__stack_66c__width_66 i_mmu_addr_v0_muxreg  
(
 .scan_in(i_mmu_addr_v0_muxreg_scanin),
 .scan_out(i_mmu_addr_v0_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0({mmu_l15_cpkt1[25:0],mmu_l15_addr1[39:0]}),          
 .din1({v1_mmu_cpkt[25:0],v1_mmu_addr[39:0]}),                     
 .din2({v0_mmu_cpkt[25:0],v0_mmu_addr[39:0]}),                     
 .sel0(ipc_v0_mmu_new),
 .sel1(ipc_v0_mmu_shft),
 .sel2(ipc_v0_mmu_hold),
 .dout({v0_mmu_cpkt[25:0],v0_mmu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

///////////////////////////////////////////////////////////////////
// Latch lsu pkt in 2-entry FIFO
///////////////////////////////////////////////////////////////////
gkt_ipd_dp_msff_macro__mux_aonpe__ports_2__stack_66c__width_66 i_lsu_addr_v1_muxreg  
(
 .scan_in(i_lsu_addr_v1_muxreg_scanin),
 .scan_out(i_lsu_addr_v1_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0({lsu_l15_cpkt1[25:0],lsu_l15_addr[39:0]}),          
 .din1({v1_lsu_cpkt[25:0],v1_lsu_addr[39:0]}),                     
 .sel0(ipc_v1_lsu_new),
 .sel1(ipc_v1_lsu_hold),
 .dout({v1_lsu_cpkt[25:0],v1_lsu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__mux_aonpe__ports_3__stack_66c__width_66 i_lsu_addr_v0_muxreg  
(
 .scan_in(i_lsu_addr_v0_muxreg_scanin),
 .scan_out(i_lsu_addr_v0_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0({lsu_l15_cpkt1[25:0],lsu_l15_addr[39:0]}),          
 .din1({v1_lsu_cpkt[25:0],v1_lsu_addr[39:0]}),                     
 .din2({v0_lsu_cpkt[25:0],v0_lsu_addr[39:0]}),                     
 .sel0(ipc_v0_lsu_new),
 .sel1(ipc_v0_lsu_shft),
 .sel2(ipc_v0_lsu_hold),
 .dout({v0_lsu_cpkt[25:0],v0_lsu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__mux_aonpe__ports_2__stack_64c__width_64 i_lsu_data_v1_muxreg  
(
 .scan_in(i_lsu_data_v1_muxreg_scanin),
 .scan_out(i_lsu_data_v1_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0(lsu_l15_data[63:0]),          
 .din1(v1_lsu_data[63:0]),                     
 .sel0(ipc_v1_lsu_new),
 .sel1(ipc_v1_lsu_hold),
 .dout(v1_lsu_data[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__mux_aonpe__ports_3__stack_64c__width_64 i_lsu_data_v0_muxreg  
(
 .scan_in(i_lsu_data_v0_muxreg_scanin),
 .scan_out(i_lsu_data_v0_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0(lsu_l15_data[63:0]),          
 .din1(v1_lsu_data[63:0]),                     
 .din2(v0_lsu_data[63:0]),                     
 .sel0(ipc_v0_lsu_new),
 .sel1(ipc_v0_lsu_shft),
 .sel2(ipc_v0_lsu_hold),
 .dout(v0_lsu_data[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

///////////////////////////////////////////////////////////////////
// Latch spu pkt in 2-entry FIFO
///////////////////////////////////////////////////////////////////
gkt_ipd_dp_msff_macro__mux_aonpe__ports_2__stack_66c__width_66 i_spu_addr_v1_muxreg  
(
 .scan_in(i_spu_addr_v1_muxreg_scanin),
 .scan_out(i_spu_addr_v1_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0({spu_l15_cpkt1[25:0],spu_l15_addr1[39:0]}),          
 .din1({v1_spu_cpkt[25:0],v1_spu_addr[39:0]}),                     
 .sel0(ipc_v1_spu_new),
 .sel1(ipc_v1_spu_hold),
 .dout({v1_spu_cpkt[25:0],v1_spu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__mux_aonpe__ports_3__stack_66c__width_66 i_spu_addr_v0_muxreg  
(
 .scan_in(i_spu_addr_v0_muxreg_scanin),
 .scan_out(i_spu_addr_v0_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0({spu_l15_cpkt1[25:0],spu_l15_addr1[39:0]}),          
 .din1({v1_spu_cpkt[25:0],v1_spu_addr[39:0]}),                     
 .din2({v0_spu_cpkt[25:0],v0_spu_addr[39:0]}),                     
 .sel0(ipc_v0_spu_new),
 .sel1(ipc_v0_spu_shft),
 .sel2(ipc_v0_spu_hold),
 .dout({v0_spu_cpkt[25:0],v0_spu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__mux_aonpe__ports_2__stack_64c__width_64 i_spu_data_v1_muxreg  
(
 .scan_in(i_spu_data_v1_muxreg_scanin),
 .scan_out(i_spu_data_v1_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0(spu_l15_data[63:0]),          
 .din1(v1_spu_data[63:0]),                     
 .sel0(ipc_v1_spu_new),
 .sel1(ipc_v1_spu_hold),
 .dout(v1_spu_data[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__mux_aonpe__ports_3__stack_64c__width_64 i_spu_data_v0_muxreg  
(
 .scan_in(i_spu_data_v0_muxreg_scanin),
 .scan_out(i_spu_data_v0_muxreg_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din0(spu_l15_data[63:0]),          
 .din1(v1_spu_data[63:0]),                     
 .din2(v0_spu_data[63:0]),                     
 .sel0(ipc_v0_spu_new),
 .sel1(ipc_v0_spu_shft),
 .sel2(ipc_v0_spu_hold),
 .dout(v0_spu_data[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

///////////////////////////////////////////////////////////////////
// L1/PQ cycle. Mux the pcx packets from all sources and corresponding
// DROP registers
///////////////////////////////////////////////////////////////////

// save Muxed data into drop registers
gkt_ipd_dp_msff_macro__stack_66c__width_66 i_ifu_addr_drop_reg  
(
 .scan_in(i_ifu_addr_drop_reg_scanin),
 .scan_out(i_ifu_addr_drop_reg_scanout),
 .clk (l2clk),
 .en  (ipc_dropreg_wen[0]),
 .din({ipd_cpkt_l1[25:0],ipd_addr_l1[39:0]}),          
 .dout({drop_ifu_cpkt[25:0],drop_ifu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__stack_66c__width_66 i_mmu_addr_drop_reg  
(
 .scan_in(i_mmu_addr_drop_reg_scanin),
 .scan_out(i_mmu_addr_drop_reg_scanout),
 .clk (l2clk),
 .en  (ipc_dropreg_wen[1]),
 .din({ipd_cpkt_l1[25:0],ipd_addr_l1[39:0]}),          
 .dout({drop_mmu_cpkt[25:0],drop_mmu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__stack_66c__width_66 i_lsu_addr_drop_reg  
(
 .scan_in(i_lsu_addr_drop_reg_scanin),
 .scan_out(i_lsu_addr_drop_reg_scanout),
 .clk (l2clk),
 .en  (ipc_dropreg_wen[2]),
 .din({ipd_cpkt_l1[25:0],ipd_addr_l1[39:0]}),          
 .dout({drop_lsu_cpkt[25:0],drop_lsu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__stack_66c__width_66 i_spu_addr_drop_reg  
(
 .scan_in(i_spu_addr_drop_reg_scanin),
 .scan_out(i_spu_addr_drop_reg_scanout),
 .clk (l2clk),
 .en  (ipc_dropreg_wen[3]),
 .din({ipd_cpkt_l1[25:0],ipd_addr_l1[39:0]}),          
 .dout({drop_spu_cpkt[25:0],drop_spu_addr[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__stack_64c__width_64 i_lsu_data_drop_reg  
(
 .scan_in(i_lsu_data_drop_reg_scanin),
 .scan_out(i_lsu_data_drop_reg_scanout),
 .clk (l2clk),
 .en  (ipc_dropreg_wen[2]),
 .din(ipd_data_l1[63:0]),          
 .dout(drop_lsu_data[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_msff_macro__stack_64c__width_64 i_spu_data_drop_reg  
(
 .scan_in(i_spu_data_drop_reg_scanin),
 .scan_out(i_spu_data_drop_reg_scanout),
 .clk (l2clk),
 .en  (ipc_dropreg_wen[3]),
 .din(ipd_data_l1[63:0]),          
 .dout(drop_spu_data[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// MUX the PCX packet out

gkt_ipd_dp_mux_macro__mux_aonpe__ports_8__stack_66c__width_66 i_l1_addr_mux  
(
 .din0({v0_ifu_cpkt[25:0],v0_ifu_addr[39:0]}),          
 .din1({v0_mmu_cpkt[25:0],v0_mmu_addr[39:0]}),          
 .din2({v0_lsu_cpkt[25:0],v0_lsu_addr[39:0]}),          
 .din3({v0_spu_cpkt[25:0],v0_spu_addr[39:0]}),
 .din4({drop_ifu_cpkt[25:0],drop_ifu_addr[39:0]}),          
 .din5({drop_mmu_cpkt[25:0],drop_mmu_addr[39:0]}),          
 .din6({drop_lsu_cpkt[25:0],drop_lsu_addr[39:0]}),          
 .din7({drop_spu_cpkt[25:0],drop_spu_addr[39:0]}),
 .sel0(ipc_sel_ndrop_ifu_l1),
 .sel1(ipc_sel_ndrop_mmu_l1),
 .sel2(ipc_sel_ndrop_lsu_l1),
 .sel3(ipc_sel_ndrop_spu_l1),
 .sel4(ipc_sel_drop_ifu_l1),
 .sel5(ipc_sel_drop_mmu_l1),
 .sel6(ipc_sel_drop_lsu_l1),
 .sel7(ipc_sel_drop_spu_l1),
 .dout({ipd_cpkt_l1[25:0],ipd_addr_l1_prebuf[39:0]})
);

gkt_ipd_dp_buff_macro__stack_66c__width_40 i_l1_addr_buf 
(
 .din ({ipd_addr_l1_prebuf[39:0]}),
 .dout({ipd_addr_l1[39:0]})
 );

// IF Address Hashing is enabled and Bit 39 of the address is not set (not an I/O,
// or L2 diagnostic access) then hash the addresses in following manner:
//PA[17:11]  = {(PA[32:28] ^ PA[17:13]), (PA[19:18] ^ PA[12:11])}
// enable_hash = lsu_hash_en & ~PA[39]
//             = ~(~lsu_hash_en | PA[39])
gkt_ipd_dp_msff_macro__stack_64c__width_1 i_hash_en_ff2  
(
 .scan_in(i_hash_en_ff2_scanin),
 .scan_out(i_hash_en_ff2_scanout),
 .clk (l2clk),
 .en  (1'b1),
 .din(idx_hash_en_ff),          
 .dout(idx_hash_en_ff2),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_inv_macro__stack_64c__width_1 i_hash_en_inv
(
 .din(idx_hash_en_ff2),
 .dout(idx_hash_en_)
 );

gkt_ipd_dp_nor_macro__stack_66c__width_1 i_enable_hash_nor
(
 .din0(ipd_addr_l1[39]),
 .din1(idx_hash_en_),
 .dout(enable_hash)
 );

gkt_ipd_dp_xor_macro__ports_2__stack_66c__width_7 i_l1_hash_xor 
(
 .din0({ipd_addr_l1[32:28],ipd_addr_l1[19:18]}),
 .din1({ipd_addr_l1[17:13],ipd_addr_l1[12:11]}),
 .dout(ipd_addr_hashed_l1[17:11])
 );


gkt_ipd_dp_mux_macro__mux_aope__ports_2__stack_66c__width_7 i_l1_hash_mux  
(
 .din0(ipd_addr_hashed_l1[17:11]),
 .din1(ipd_addr_l1[17:11]),
 .sel0(enable_hash),
 .dout(ipd_addr_out_l1[17:11])
);

 
// mux the store data out
gkt_ipd_dp_mux_macro__mux_aonpe__ports_4__stack_64c__width_64 i_l1_data_mux  
(
 .din0(v0_lsu_data[63:0]),          
 .din1(v0_spu_data[63:0]),          
 .din2(drop_lsu_data[63:0]),          
 .din3(drop_spu_data[63:0]),          
 .sel0(ipc_sel_ndrop_lsu_l1),
 .sel1(ipc_sel_ndrop_spu_l1),
 .sel2(ipc_sel_drop_lsu_l1),
 .sel3(ipc_sel_drop_spu_l1),
 .dout(ipd_data_l1[63:0])
);


// pipe the data out to PCX in PA
gkt_ipd_dp_msff_macro__dmsff_8x__stack_66c__width_66 i_pcx_addr_pa_reg   
(
 .scan_in(i_pcx_addr_pa_reg_scanin),
 .scan_out(i_pcx_addr_pa_reg_scanout),
 .clk (l2clk),
 .en  (ipc_pq_clken),
 .din({ipd_cpkt_l1[25:0],ipd_addr_l1[39:18],ipd_addr_out_l1[17:11],ipd_addr_l1[10:0]}),          
 .dout({pcx_cpkt_pa[25:0],pcx_addr_pa[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_buff_macro__dbuff_32x__rep_1__stack_66c__width_66 i_pcx_addr_buf   
(
 .din({pcx_cpkt_pa[25:0],pcx_addr_pa[39:0]}),
 .dout({spc_pcx_data_pa[129:64]})
 );

gkt_ipd_dp_buff_macro__stack_none__width_9 i_optype_buf 
(
 .din({pcx_cpkt_pa[10],pcx_cpkt_pa[24:20],pcx_cpkt_pa[15:13]}),
 .dout({ipd_optype[8:0]})
 );



gkt_ipd_dp_msff_macro__dmsff_8x__stack_64c__width_64 i_pcx_data_pa_reg   
(
 .scan_in(i_pcx_data_pa_reg_scanin),
 .scan_out(i_pcx_data_pa_reg_scanout),
 .clk (l2clk),
 .en  (ipc_pq_clken),
 .din(ipd_data_l1[63:0]),          
 .dout(pcx_data_pa[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

gkt_ipd_dp_buff_macro__dbuff_32x__rep_1__stack_64c__width_64 i_pcx_data_buf   
(
 .din(pcx_data_pa[63:0]),
 .dout(spc_pcx_data_pa[63:0])
 );





// fixscan start:
assign cpuid_reg_scanin          = scan_in                  ;
assign i_ncu_reg_scanin          = cpuid_reg_scanout        ;
assign i_cpx_data1lo_reg_scanin  = i_ncu_reg_scanout        ;
assign i_cpx_data1hi_reg_scanin  = i_cpx_data1lo_reg_scanout;
assign i_cpx_cpkt_reg_scanin     = i_cpx_data1hi_reg_scanout;
assign i_req_li_reg_scanin       = i_cpx_cpkt_reg_scanout   ;
assign i_ifu_addr_v1_muxreg_scanin = i_req_li_reg_scanout     ;
assign i_ifu_addr_v0_muxreg_scanin = i_ifu_addr_v1_muxreg_scanout;
assign i_mmu_addr_v1_muxreg_scanin = i_ifu_addr_v0_muxreg_scanout;
assign i_mmu_addr_v0_muxreg_scanin = i_mmu_addr_v1_muxreg_scanout;
assign i_lsu_addr_v1_muxreg_scanin = i_mmu_addr_v0_muxreg_scanout;
assign i_lsu_addr_v0_muxreg_scanin = i_lsu_addr_v1_muxreg_scanout;
assign i_lsu_data_v1_muxreg_scanin = i_lsu_addr_v0_muxreg_scanout;
assign i_lsu_data_v0_muxreg_scanin = i_lsu_data_v1_muxreg_scanout;
assign i_spu_addr_v1_muxreg_scanin = i_lsu_data_v0_muxreg_scanout;
assign i_spu_addr_v0_muxreg_scanin = i_spu_addr_v1_muxreg_scanout;
assign i_spu_data_v1_muxreg_scanin = i_spu_addr_v0_muxreg_scanout;
assign i_spu_data_v0_muxreg_scanin = i_spu_data_v1_muxreg_scanout;
assign i_ifu_addr_drop_reg_scanin = i_spu_data_v0_muxreg_scanout;
assign i_mmu_addr_drop_reg_scanin = i_ifu_addr_drop_reg_scanout;
assign i_lsu_addr_drop_reg_scanin = i_mmu_addr_drop_reg_scanout;
assign i_spu_addr_drop_reg_scanin = i_lsu_addr_drop_reg_scanout;
assign i_lsu_data_drop_reg_scanin = i_spu_addr_drop_reg_scanout;
assign i_spu_data_drop_reg_scanin = i_lsu_data_drop_reg_scanout;
assign i_hash_en_ff2_scanin      = i_spu_data_drop_reg_scanout;
assign i_pcx_addr_pa_reg_scanin  = i_hash_en_ff2_scanout    ;
assign i_pcx_data_pa_reg_scanin  = i_pcx_addr_pa_reg_scanout;
assign scan_out                  = i_pcx_data_pa_reg_scanout;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__stack_66c__width_3 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [1:0] so;

  input [2:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [2:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);




















endmodule









//
//   buff macro
//
//





module gkt_ipd_dp_buff_macro__dbuff_16x__rep_1__stack_none__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





//
//   buff macro
//
//





module gkt_ipd_dp_buff_macro__dbuff_16x__rep_1__stack_none__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






buff #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);








endmodule









// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__stack_64c__width_6 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [4:0] so;

  input [5:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [5:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);




















endmodule









//
//   buff macro
//
//





module gkt_ipd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





//
//   buff macro
//
//





module gkt_ipd_dp_buff_macro__dbuff_48x__rep_1__stack_64c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule









// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__stack_64c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//
//   buff macro
//
//





module gkt_ipd_dp_buff_macro__dbuff_48x__rep_1__stack_none__width_18 (
  din, 
  dout);
  input [17:0] din;
  output [17:0] dout;






buff #(18)  d0_0 (
.in(din[17:0]),
.out(dout[17:0])
);








endmodule









// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__stack_64c__width_18 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [16:0] so;

  input [17:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [17:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);




















endmodule









//
//   buff macro
//
//





module gkt_ipd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_20 (
  din, 
  dout);
  input [19:0] din;
  output [19:0] dout;






buff #(20)  d0_0 (
.in(din[19:0]),
.out(dout[19:0])
);








endmodule









// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__dmsff_8x__stack_64c__width_19 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [17:0] so;

  input [18:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [18:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(19)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[18:0]),
.si({scan_in,so[17:0]}),
.so({so[17:0],scan_out}),
.q(dout[18:0])
);




















endmodule









//
//   invert macro
//
//





module gkt_ipd_dp_inv_macro__dinv_8x__stack_64c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module gkt_ipd_dp_nand_macro__dnand_16x__ports_2__stack_64c__width_9 (
  din0, 
  din1, 
  dout);
  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;






nand2 #(9)  d0_0 (
.in0(din0[8:0]),
.in1(din1[8:0]),
.out(dout[8:0])
);









endmodule





//
//   invert macro
//
//





module gkt_ipd_dp_inv_macro__dinv_48x__stack_64c__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






inv #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);









endmodule









// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__mux_aonpe__ports_2__stack_66c__width_66 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire [65:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [64:0] so;

  input [65:0] din0;
  input sel0;
  input [65:0] din1;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


  output scan_out;




cl_dp1_muxbuff2_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(66)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
.dout(muxout[65:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__mux_aonpe__ports_3__stack_66c__width_66 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire buffout2;
wire [65:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [64:0] so;

  input [65:0] din0;
  input sel0;
  input [65:0] din1;
  input sel1;
  input [65:0] din2;
  input sel2;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


  output scan_out;




cl_dp1_muxbuff3_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(66)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
  .in2(din2[65:0]),
.dout(muxout[65:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__mux_aonpe__ports_2__stack_64c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_muxbuff2_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(64)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__mux_aonpe__ports_3__stack_64c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire buffout2;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_muxbuff3_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(64)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__stack_66c__width_66 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [64:0] so;

  input [65:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module gkt_ipd_dp_mux_macro__mux_aonpe__ports_8__stack_66c__width_66 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [65:0] din0;
  input sel0;
  input [65:0] din1;
  input sel1;
  input [65:0] din2;
  input sel2;
  input [65:0] din3;
  input sel3;
  input [65:0] din4;
  input sel4;
  input [65:0] din5;
  input sel5;
  input [65:0] din6;
  input sel6;
  input [65:0] din7;
  input sel7;
  output [65:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(66)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
  .in2(din2[65:0]),
  .in3(din3[65:0]),
  .in4(din4[65:0]),
  .in5(din5[65:0]),
  .in6(din6[65:0]),
  .in7(din7[65:0]),
.dout(dout[65:0])
);









  



endmodule


//
//   buff macro
//
//





module gkt_ipd_dp_buff_macro__stack_66c__width_40 (
  din, 
  dout);
  input [39:0] din;
  output [39:0] dout;






buff #(40)  d0_0 (
.in(din[39:0]),
.out(dout[39:0])
);








endmodule









// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__stack_64c__width_1 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;

  input [0:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [0:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);




















endmodule









//
//   invert macro
//
//





module gkt_ipd_dp_inv_macro__stack_64c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module gkt_ipd_dp_nor_macro__stack_66c__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   xor macro for ports = 2,3
//
//





module gkt_ipd_dp_xor_macro__ports_2__stack_66c__width_7 (
  din0, 
  din1, 
  dout);
  input [6:0] din0;
  input [6:0] din1;
  output [6:0] dout;





xor2 #(7)  d0_0 (
.in0(din0[6:0]),
.in1(din1[6:0]),
.out(dout[6:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module gkt_ipd_dp_mux_macro__mux_aope__ports_2__stack_66c__width_7 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [6:0] din0;
  input [6:0] din1;
  input sel0;
  output [6:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(7)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[6:0]),
  .in1(din1[6:0]),
.dout(dout[6:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module gkt_ipd_dp_mux_macro__mux_aonpe__ports_4__stack_64c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  output [63:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__dmsff_8x__stack_66c__width_66 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [64:0] so;

  input [65:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule









//
//   buff macro
//
//





module gkt_ipd_dp_buff_macro__dbuff_32x__rep_1__stack_66c__width_66 (
  din, 
  dout);
  input [65:0] din;
  output [65:0] dout;






buff #(66)  d0_0 (
.in(din[65:0]),
.out(dout[65:0])
);








endmodule





//
//   buff macro
//
//





module gkt_ipd_dp_buff_macro__stack_none__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule









// any PARAMS parms go into naming of macro

module gkt_ipd_dp_msff_macro__dmsff_8x__stack_64c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//
//   buff macro
//
//





module gkt_ipd_dp_buff_macro__dbuff_32x__rep_1__stack_64c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule




