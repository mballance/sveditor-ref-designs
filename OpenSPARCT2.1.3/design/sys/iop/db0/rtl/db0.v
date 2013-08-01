// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: db0.v
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
module db0 (
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_atpg_mode, 
  cluster_arst_l, 
  ccu_io_out, 
  tcu_div_bypass, 
  scan_in, 
  scan_out, 
  dmu_ncu_wrack_vld, 
  dmu_ncu_wrack_tag, 
  dmu_ncu_data, 
  dmu_ncu_vld, 
  dmu_ncu_stall, 
  dmu_sii_hdr_vld, 
  dmu_sii_reqbypass, 
  dmu_sii_datareq, 
  dmu_sii_datareq16, 
  dmu_sii_data, 
  dmu_sii_be, 
  dmu_dbg0_debug_bus_a, 
  dmu_dbg0_debug_bus_b, 
  niu_ncu_vld, 
  niu_ncu_data, 
  niu_ncu_stall, 
  niu_sii_hdr_vld, 
  niu_sii_reqbypass, 
  niu_sii_datareq, 
  niu_sii_data, 
  niu_sio_dq, 
  l2t0_dbg0_sii_iq_dequeue, 
  l2t2_dbg0_sii_iq_dequeue, 
  l2t0_dbg0_sii_wib_dequeue, 
  l2t2_dbg0_sii_wib_dequeue, 
  l2t0_dbg0_err_event, 
  l2t2_dbg0_err_event, 
  l2t0_dbg0_pa_match, 
  l2t2_dbg0_pa_match, 
  l2t0_dbg0_xbar_vcid, 
  l2t2_dbg0_xbar_vcid, 
  l2b0_dbg0_sio_ctag_vld, 
  l2b1_dbg0_sio_ctag_vld, 
  l2b2_dbg0_sio_ctag_vld, 
  l2b3_dbg0_sio_ctag_vld, 
  l2b0_dbg0_sio_ack_type, 
  l2b1_dbg0_sio_ack_type, 
  l2b2_dbg0_sio_ack_type, 
  l2b3_dbg0_sio_ack_type, 
  l2b0_dbg0_sio_ack_dest, 
  l2b1_dbg0_sio_ack_dest, 
  l2b2_dbg0_sio_ack_dest, 
  l2b3_dbg0_sio_ack_dest, 
  spc0_dbg0_instr_cmt_grp0, 
  spc0_dbg0_instr_cmt_grp1, 
  spc2_dbg0_instr_cmt_grp0, 
  spc2_dbg0_instr_cmt_grp1, 
  gclk, 
  io_cmp_sync_en, 
  cmp_io2x_sync_en, 
  dbg0_dbg1_debug_data, 
  dbg0_dbg1_l2t0_sii_iq_dequeue, 
  dbg0_dbg1_l2t2_sii_iq_dequeue, 
  dbg0_dbg1_l2t0_sii_wib_dequeue, 
  dbg0_dbg1_l2t2_sii_wib_dequeue, 
  dbg0_dbg1_l2t0_err_event, 
  dbg0_dbg1_l2t2_err_event, 
  dbg0_dbg1_l2t0_pa_match, 
  dbg0_dbg1_l2t2_pa_match, 
  dbg0_dbg1_l2t0_xbar_vcid, 
  dbg0_dbg1_l2t2_xbar_vcid, 
  dbg0_dbg1_l2b0_sio_ctag_vld, 
  dbg0_dbg1_l2b1_sio_ctag_vld, 
  dbg0_dbg1_l2b2_sio_ctag_vld, 
  dbg0_dbg1_l2b3_sio_ctag_vld, 
  dbg0_dbg1_l2b0_sio_ack_type, 
  dbg0_dbg1_l2b1_sio_ack_type, 
  dbg0_dbg1_l2b2_sio_ack_type, 
  dbg0_dbg1_l2b3_sio_ack_type, 
  dbg0_dbg1_l2b0_sio_ack_dest, 
  dbg0_dbg1_l2b1_sio_ack_dest, 
  dbg0_dbg1_l2b2_sio_ack_dest, 
  dbg0_dbg1_l2b3_sio_ack_dest, 
  dbg0_dbg1_spc0_instr_cmt_grp0, 
  dbg0_dbg1_spc0_instr_cmt_grp1, 
  dbg0_dbg1_spc2_instr_cmt_grp0, 
  dbg0_dbg1_spc2_instr_cmt_grp1, 
  dbg0_mio_debug_bus_a, 
  dbg0_mio_debug_bus_b);
wire l2clk;
wire db0_clk_header_cmp_clk_scan_out;
wire aclk;
wire bclk;
wire ce_ovrd;
wire cmp_io2x_sync_en_out;
wire io_cmp_sync_en_out;
wire db0_clk_header_cmp_clk_scan_in;
wire iol2clk;
wire db0_clk_header_iol2clk_scan_out;
wire db0_clk_header_iol2clk_scan_in;
wire rtc_scanin;
wire rtc_scanout;
wire red_dp_scanin;
wire red_dp_scanout;
wire red_ctl_scanin;
wire red_ctl_scanout;
wire [331:0] red_rtc_rep_bus;
wire wr_en0;
wire wr_en1;
wire wr_en2;
wire wr_en3;
wire mux1_sel0;
wire mux1_sel1;
wire mux1_sel2;
wire mux2_sel0;
wire mux2_sel1;
wire mux2_sel2;
wire mux3_sel0;
wire mux3_sel1;
wire mux3_sel2;
wire mux4_sel0;
wire mux4_sel1;
wire mux4_sel2;
wire mux5_sel0;
wire mux5_sel1;
wire mux5_sel2;
wire mux5_sel3;


input           tcu_pce_ov;
input           tcu_clk_stop;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input		tcu_atpg_mode;

// new signals after clock header insertion

input		cluster_arst_l;
input		ccu_io_out;
input           tcu_div_bypass;

input		scan_in;
output		scan_out;


// interface with DMU

input           dmu_ncu_wrack_vld;      //CSR Wr Ack from DMU to NCU
input  [3:0]    dmu_ncu_wrack_tag;      //CSR Wr Tag [3:0] from DMU to NCU
input  [31:0]   dmu_ncu_data;           //CSR read data from DMU to NCU
input           dmu_ncu_vld;            //CSR Data return valid from DMU to NCU
input           dmu_ncu_stall;          //Stall asserted by DMU to NCU
input           dmu_sii_hdr_vld;        //DMU requesting to send DMA/Pio Read return/Interrupt packet to SII
input           dmu_sii_reqbypass;      //DMU requesting to send packet to bypass queue of SII
input           dmu_sii_datareq;        //DMU requesting to send packet w/data to SII
input           dmu_sii_datareq16;      //DMU requesting to send packet w/16B only
input  [127:0]  dmu_sii_data;           //Packet from DMU to SII
input  [15:0]   dmu_sii_be;             //Packet byte enables from DMU to SII
input  [7:0]    dmu_dbg0_debug_bus_a;   //Debug Bus A from DMU
input  [7:0]    dmu_dbg0_debug_bus_b;   //Debug Bus B from DMU

//interface with NIU

input		niu_ncu_vld;		//CSR Data return/Interrupt valid from  NIU  to NCU
input  [31:0]	niu_ncu_data;		//CSR data/ Interrupt packet from NIU to NCU 
input		niu_ncu_stall;		//Stall asserted by NIU  to NCU
input		niu_sii_hdr_vld;	//NIU requesting to send packet to SII
input		niu_sii_reqbypass;	//NIU requesting to send packet to bypass queue of SII
input		niu_sii_datareq;	//NIU requesting to send packet w/data to SII
input  [127:0]	niu_sii_data;		//Packet from NIU to SII
input		niu_sio_dq;		//flow control or credit return signal from NIU to SIO

// interface with L2T 0,2 

input		l2t0_dbg0_sii_iq_dequeue;	//L2t 0  dequeue from IQ
input           l2t2_dbg0_sii_iq_dequeue;        //L2t 2  dequeue from IQ
input		l2t0_dbg0_sii_wib_dequeue;	//L2t 0  dequeue from IOWB
input		l2t2_dbg0_sii_wib_dequeue;	//L2t 2  dequeue from IOWB
input		l2t0_dbg0_err_event;	//An Error event occurred in l2t 0
input		l2t2_dbg0_err_event;	//An Error event occurred in l2t 2
input		l2t0_dbg0_pa_match;	//A PA match detected in l2t 0
input		l2t2_dbg0_pa_match;	//A PA match detected in l2t 2
input  [5:0]	l2t0_dbg0_xbar_vcid;	//VCID[5:0] from Xbar to L2t 0
input  [5:0]	l2t2_dbg0_xbar_vcid;	//VCID[5:0] from Xbar to L2t 2

// interface with L2b 0,1,2,3

input		l2b0_dbg0_sio_ctag_vld;	//Ctag  valid from L2b 0  to SIO
input		l2b1_dbg0_sio_ctag_vld;	//Ctag  valid from L2b 1  to SIO
input		l2b2_dbg0_sio_ctag_vld;	//Ctag  valid from L2b 2  to SIO
input		l2b3_dbg0_sio_ctag_vld;	//Ctag  valid from L2b 3  to SIO

input		l2b0_dbg0_sio_ack_type;	//Read or Wr ack from L2b 0  to SIO
input		l2b1_dbg0_sio_ack_type;	//Read or Wr ack from L2b 1  to SIO
input		l2b2_dbg0_sio_ack_type;	//Read or Wr ack from L2b 2  to SIO
input		l2b3_dbg0_sio_ack_type;	//Read or Wr ack from L2b 3  to SIO

input		l2b0_dbg0_sio_ack_dest;	//Read or Wr ack dest (NIU/DMU) from L2b 0  to SIO
input		l2b1_dbg0_sio_ack_dest;	//Read or Wr ack dest (NIU/DMU) from L2b 1  to SIO
input		l2b2_dbg0_sio_ack_dest;	//Read or Wr ack dest (NIU/DMU) from L2b 2  to SIO
input		l2b3_dbg0_sio_ack_dest;	//Read or Wr ack dest (NIU/DMU) from L2b 3  to SIO

// interface with Sparcs 0,2

input  [1:0]	spc0_dbg0_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 0
input  [1:0]	spc0_dbg0_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 0
input  [1:0]	spc2_dbg0_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 2
input  [1:0]	spc2_dbg0_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 2

// interface with CCU

input		gclk;			//Internal CMP clock from CCU
input		io_cmp_sync_en;		// IO to CMP sync enable
input		cmp_io2x_sync_en;	// CMP to IO2X sync enable

// interface with DBG1

output [165:0]   dbg0_dbg1_debug_data;	// 166 bit debug data bus carrying repeatability signals to DBG1
output           dbg0_dbg1_l2t0_sii_iq_dequeue;       //L2t 0  dequeue from IQ : flopped version
output           dbg0_dbg1_l2t2_sii_iq_dequeue;        //L2t 2  dequeue from IQ : flopped version
output           dbg0_dbg1_l2t0_sii_wib_dequeue;      //L2t 0  dequeue from IOWB : flopped version
output           dbg0_dbg1_l2t2_sii_wib_dequeue;      //L2t 2  dequeue from IOWB : flopped version
output           dbg0_dbg1_l2t0_err_event;    //An Error event occurred in l2t 0 : flopped version
output           dbg0_dbg1_l2t2_err_event;    //An Error event occurred in l2t 2 : flopped version
output           dbg0_dbg1_l2t0_pa_match;     //A PA match detected in l2t 0 : flopped version
output           dbg0_dbg1_l2t2_pa_match;     //A PA match detected in l2t 2 : flopped version
output  [5:0]    dbg0_dbg1_l2t0_xbar_vcid;    //VCID[5:0] from Xbar to L2t 0 : flopped version
output  [5:0]    dbg0_dbg1_l2t2_xbar_vcid;    //VCID[5:0] from Xbar to L2t 2 : flopped version
output           dbg0_dbg1_l2b0_sio_ctag_vld; //Ctag  valid from L2b 0  to SIO : flopped version
output           dbg0_dbg1_l2b1_sio_ctag_vld; //Ctag  valid from L2b 1  to SIO : flopped version
output           dbg0_dbg1_l2b2_sio_ctag_vld; //Ctag  valid from L2b 2  to SIO : flopped version
output           dbg0_dbg1_l2b3_sio_ctag_vld; //Ctag  valid from L2b 3  to SIO : flopped version
output           dbg0_dbg1_l2b0_sio_ack_type; //Read or Wr ack from L2b 0  to SIO : flopped version
output           dbg0_dbg1_l2b1_sio_ack_type; //Read or Wr ack from L2b 1  to SIO : flopped version
output           dbg0_dbg1_l2b2_sio_ack_type; //Read or Wr ack from L2b 2  to SIO : flopped version
output           dbg0_dbg1_l2b3_sio_ack_type; //Read or Wr ack from L2b 3  to SIO : flopped version
output           dbg0_dbg1_l2b0_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 0  to SIO : flopped version
output           dbg0_dbg1_l2b1_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 1  to SIO : flopped version
output           dbg0_dbg1_l2b2_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 2  to SIO : flopped version
output           dbg0_dbg1_l2b3_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 3  to SIO : flopped version

output  [1:0]    dbg0_dbg1_spc0_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 0
output  [1:0]    dbg0_dbg1_spc0_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 0
output  [1:0]    dbg0_dbg1_spc2_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 2
output  [1:0]    dbg0_dbg1_spc2_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 2


// interface with MIO

output [7:0]    dbg0_mio_debug_bus_a;   //Flopped version of Debug Bus A from DMU
output [7:0]    dbg0_mio_debug_bus_b;   //Flopped version of Debug Bus A from DMU

clkgen_db0_cmp db0_clk_header_cmp_clk
        (
        .l2clk                  (l2clk                  ),
        .scan_out		(db0_clk_header_cmp_clk_scan_out),
        .aclk                   (aclk                   ),
        .bclk                   (bclk                   ),
        .pce_ov                 (ce_ovrd                ),
        .wmr_protect            (            		),
        .wmr_                   (                  	),
        .por_                   (                  	),
        .aclk_wmr               (                       ),
        .dr_sync_en             (                       ),
        .io2x_sync_en           (cmp_io2x_sync_en_out   ),
        .slow_cmp_sync_en       (io_cmp_sync_en_out	),
        .cmp_slow_sync_en       (                       ),
        .tcu_clk_stop           (tcu_clk_stop           ),
        .tcu_pce_ov             (tcu_pce_ov             ),
        .rst_wmr_protect        (1'b0        		),
        .rst_wmr_               (1'b0               	),
        .rst_por_               (1'b0               	),
        .ccu_dr_sync_en         (1'b0                   ),
        .ccu_io2x_sync_en       (cmp_io2x_sync_en       ),
        .ccu_cmp_slow_sync_en   (1'b0                   ),
        .ccu_slow_cmp_sync_en   (io_cmp_sync_en         ),
        .tcu_div_bypass         (1'b0                   ),
        .ccu_div_ph             (1'b1                   ),
        .cluster_div_en         (1'b0                   ),
        .gclk                   (gclk                   ),
        .scan_en                (tcu_scan_en            ),
        .clk_ext                (1'b0                   ),
        .ccu_serdes_dtm         (1'b0                   ),
        .cluster_arst_l         (cluster_arst_l         ),
        .tcu_wr_inhibit         (1'b0                   ),
        .tcu_atpg_mode          (tcu_atpg_mode          ),
        .array_wr_inhibit       (                       ),
        .tcu_aclk               (tcu_aclk               ),
        .tcu_bclk               (tcu_bclk               ),
        .scan_in                (db0_clk_header_cmp_clk_scan_in)
        );


clkgen_db0_io db0_clk_header_iol2clk
        (
        .l2clk                  (iol2clk                ),
        .scan_out	        (db0_clk_header_iol2clk_scan_out),
        .aclk                   (			),
        .bclk                   (			),
        .pce_ov                 (			),
        .wmr_protect            (			),
        .wmr_                   (			),
        .por_                   (			),
        .aclk_wmr               (                       ),
        .slow_cmp_sync_en       (			),
        .cmp_slow_sync_en       (			),
        .tcu_clk_stop           (tcu_clk_stop		),
        .tcu_pce_ov             (tcu_pce_ov		),
        .rst_wmr_protect        (1'b0			),
        .rst_wmr_               (1'b0			),
        .rst_por_               (1'b0			),
        .ccu_cmp_slow_sync_en   (1'b0                   ),
        .ccu_slow_cmp_sync_en   (1'b0                   ),
        .tcu_div_bypass         (tcu_div_bypass         ),
        .ccu_div_ph             (ccu_io_out             ),
        .cluster_div_en         (1'b1                   ),
        .gclk                   (gclk                   ),
        .clk_ext                (1'b0                   ),
        .ccu_serdes_dtm         (1'b0                   ),
        .cluster_arst_l         (cluster_arst_l         ),
        .tcu_wr_inhibit         (1'b0                   ),
        .tcu_atpg_mode          (tcu_atpg_mode          ),
        .array_wr_inhibit       (                       ),
        .tcu_aclk               (tcu_aclk		),
        .tcu_bclk               (tcu_bclk		),
        .scan_en                (tcu_scan_en		),
        .scan_in                (db0_clk_header_iol2clk_scan_in)
        );

db0_rtc_dp   rtc  (
	        .scan_in(rtc_scanin),
	        .scan_out(rtc_scanout),
                .tcu_pce_ov(ce_ovrd),
                .tcu_clk_stop(1'b0),
                .tcu_aclk(aclk),
                .tcu_bclk(bclk),
	        .l2clk(l2clk),
                .cmp_io2x_sync_en(cmp_io2x_sync_en_out),
                .io_cmp_sync_en(io_cmp_sync_en_out),
  .red_rtc_rep_bus(red_rtc_rep_bus[331:0]),
  .tcu_scan_en(tcu_scan_en),
  .l2t0_dbg0_sii_iq_dequeue(l2t0_dbg0_sii_iq_dequeue),
  .l2t2_dbg0_sii_iq_dequeue(l2t2_dbg0_sii_iq_dequeue),
  .l2t0_dbg0_sii_wib_dequeue(l2t0_dbg0_sii_wib_dequeue),
  .l2t2_dbg0_sii_wib_dequeue(l2t2_dbg0_sii_wib_dequeue),
  .l2t0_dbg0_err_event(l2t0_dbg0_err_event),
  .l2t2_dbg0_err_event(l2t2_dbg0_err_event),
  .l2t0_dbg0_pa_match(l2t0_dbg0_pa_match),
  .l2t2_dbg0_pa_match(l2t2_dbg0_pa_match),
  .l2t0_dbg0_xbar_vcid(l2t0_dbg0_xbar_vcid[5:0]),
  .l2t2_dbg0_xbar_vcid(l2t2_dbg0_xbar_vcid[5:0]),
  .l2b0_dbg0_sio_ctag_vld(l2b0_dbg0_sio_ctag_vld),
  .l2b1_dbg0_sio_ctag_vld(l2b1_dbg0_sio_ctag_vld),
  .l2b2_dbg0_sio_ctag_vld(l2b2_dbg0_sio_ctag_vld),
  .l2b3_dbg0_sio_ctag_vld(l2b3_dbg0_sio_ctag_vld),
  .l2b0_dbg0_sio_ack_type(l2b0_dbg0_sio_ack_type),
  .l2b1_dbg0_sio_ack_type(l2b1_dbg0_sio_ack_type),
  .l2b2_dbg0_sio_ack_type(l2b2_dbg0_sio_ack_type),
  .l2b3_dbg0_sio_ack_type(l2b3_dbg0_sio_ack_type),
  .l2b0_dbg0_sio_ack_dest(l2b0_dbg0_sio_ack_dest),
  .l2b1_dbg0_sio_ack_dest(l2b1_dbg0_sio_ack_dest),
  .l2b2_dbg0_sio_ack_dest(l2b2_dbg0_sio_ack_dest),
  .l2b3_dbg0_sio_ack_dest(l2b3_dbg0_sio_ack_dest),
  .spc0_dbg0_instr_cmt_grp0(spc0_dbg0_instr_cmt_grp0[1:0]),
  .spc0_dbg0_instr_cmt_grp1(spc0_dbg0_instr_cmt_grp1[1:0]),
  .spc2_dbg0_instr_cmt_grp0(spc2_dbg0_instr_cmt_grp0[1:0]),
  .spc2_dbg0_instr_cmt_grp1(spc2_dbg0_instr_cmt_grp1[1:0]),
  .dbg0_dbg1_debug_data(dbg0_dbg1_debug_data[165:0]),
  .dbg0_dbg1_l2t0_sii_iq_dequeue(dbg0_dbg1_l2t0_sii_iq_dequeue),
  .dbg0_dbg1_l2t2_sii_iq_dequeue(dbg0_dbg1_l2t2_sii_iq_dequeue),
  .dbg0_dbg1_l2t0_sii_wib_dequeue(dbg0_dbg1_l2t0_sii_wib_dequeue),
  .dbg0_dbg1_l2t2_sii_wib_dequeue(dbg0_dbg1_l2t2_sii_wib_dequeue),
  .dbg0_dbg1_l2t0_err_event(dbg0_dbg1_l2t0_err_event),
  .dbg0_dbg1_l2t2_err_event(dbg0_dbg1_l2t2_err_event),
  .dbg0_dbg1_l2t0_pa_match(dbg0_dbg1_l2t0_pa_match),
  .dbg0_dbg1_l2t2_pa_match(dbg0_dbg1_l2t2_pa_match),
  .dbg0_dbg1_l2t0_xbar_vcid(dbg0_dbg1_l2t0_xbar_vcid[5:0]),
  .dbg0_dbg1_l2t2_xbar_vcid(dbg0_dbg1_l2t2_xbar_vcid[5:0]),
  .dbg0_dbg1_spc0_instr_cmt_grp0(dbg0_dbg1_spc0_instr_cmt_grp0[1:0]),
  .dbg0_dbg1_spc0_instr_cmt_grp1(dbg0_dbg1_spc0_instr_cmt_grp1[1:0]),
  .dbg0_dbg1_spc2_instr_cmt_grp0(dbg0_dbg1_spc2_instr_cmt_grp0[1:0]),
  .dbg0_dbg1_spc2_instr_cmt_grp1(dbg0_dbg1_spc2_instr_cmt_grp1[1:0]),
  .dbg0_dbg1_l2b0_sio_ctag_vld(dbg0_dbg1_l2b0_sio_ctag_vld),
  .dbg0_dbg1_l2b1_sio_ctag_vld(dbg0_dbg1_l2b1_sio_ctag_vld),
  .dbg0_dbg1_l2b2_sio_ctag_vld(dbg0_dbg1_l2b2_sio_ctag_vld),
  .dbg0_dbg1_l2b3_sio_ctag_vld(dbg0_dbg1_l2b3_sio_ctag_vld),
  .dbg0_dbg1_l2b0_sio_ack_type(dbg0_dbg1_l2b0_sio_ack_type),
  .dbg0_dbg1_l2b1_sio_ack_type(dbg0_dbg1_l2b1_sio_ack_type),
  .dbg0_dbg1_l2b2_sio_ack_type(dbg0_dbg1_l2b2_sio_ack_type),
  .dbg0_dbg1_l2b3_sio_ack_type(dbg0_dbg1_l2b3_sio_ack_type),
  .dbg0_dbg1_l2b0_sio_ack_dest(dbg0_dbg1_l2b0_sio_ack_dest),
  .dbg0_dbg1_l2b1_sio_ack_dest(dbg0_dbg1_l2b1_sio_ack_dest),
  .dbg0_dbg1_l2b2_sio_ack_dest(dbg0_dbg1_l2b2_sio_ack_dest),
  .dbg0_dbg1_l2b3_sio_ack_dest(dbg0_dbg1_l2b3_sio_ack_dest)
                );

db0_red_dp   red_dp  (
		.scan_in(red_dp_scanin),
		.scan_out(red_dp_scanout),
                .tcu_pce_ov(ce_ovrd),
                .tcu_clk_stop(1'b0),
                .tcu_aclk(aclk),
                .tcu_bclk(bclk),
		.iol2clk(iol2clk),
  .tcu_scan_en(tcu_scan_en),
  .red_rtc_rep_bus(red_rtc_rep_bus[331:0]),
  .wr_en0(wr_en0),
  .wr_en1(wr_en1),
  .wr_en2(wr_en2),
  .wr_en3(wr_en3),
  .mux1_sel0(mux1_sel0),
  .mux1_sel1(mux1_sel1),
  .mux1_sel2(mux1_sel2),
  .mux2_sel0(mux2_sel0),
  .mux2_sel1(mux2_sel1),
  .mux2_sel2(mux2_sel2),
  .mux3_sel0(mux3_sel0),
  .mux3_sel1(mux3_sel1),
  .mux3_sel2(mux3_sel2),
  .mux4_sel0(mux4_sel0),
  .mux4_sel1(mux4_sel1),
  .mux4_sel2(mux4_sel2),
  .mux5_sel0(mux5_sel0),
  .mux5_sel1(mux5_sel1),
  .mux5_sel2(mux5_sel2),
  .mux5_sel3(mux5_sel3),
  .dmu_ncu_wrack_vld(dmu_ncu_wrack_vld),
  .dmu_ncu_wrack_tag(dmu_ncu_wrack_tag[3:0]),
  .dmu_ncu_data(dmu_ncu_data[31:0]),
  .dmu_ncu_vld(dmu_ncu_vld),
  .dmu_ncu_stall(dmu_ncu_stall),
  .dmu_sii_hdr_vld(dmu_sii_hdr_vld),
  .dmu_sii_reqbypass(dmu_sii_reqbypass),
  .dmu_sii_datareq(dmu_sii_datareq),
  .dmu_sii_datareq16(dmu_sii_datareq16),
  .dmu_sii_data(dmu_sii_data[127:0]),
  .dmu_sii_be(dmu_sii_be[15:0]),
  .dmu_dbg0_debug_bus_a(dmu_dbg0_debug_bus_a[7:0]),
  .dmu_dbg0_debug_bus_b(dmu_dbg0_debug_bus_b[7:0]),
  .niu_ncu_vld(niu_ncu_vld),
  .niu_ncu_data(niu_ncu_data[31:0]),
  .niu_ncu_stall(niu_ncu_stall),
  .niu_sii_hdr_vld(niu_sii_hdr_vld),
  .niu_sii_reqbypass(niu_sii_reqbypass),
  .niu_sii_datareq(niu_sii_datareq),
  .niu_sii_data(niu_sii_data[127:0]),
  .niu_sio_dq(niu_sio_dq),
  .dbg0_mio_debug_bus_a(dbg0_mio_debug_bus_a[7:0]),
  .dbg0_mio_debug_bus_b(dbg0_mio_debug_bus_b[7:0])
                );

db0_reduct_ctl  red_ctl (
		.scan_in(red_ctl_scanin),
		.scan_out(red_ctl_scanout),
                .tcu_pce_ov(ce_ovrd),
                .tcu_clk_stop(1'b0),
                .tcu_aclk(aclk),
                .tcu_bclk(bclk),
		.iol2clk(iol2clk),
  .tcu_scan_en(tcu_scan_en),
  .dmu_ncu_vld(dmu_ncu_vld),
  .wr_en0(wr_en0),
  .wr_en1(wr_en1),
  .wr_en2(wr_en2),
  .wr_en3(wr_en3),
  .mux1_sel0(mux1_sel0),
  .mux1_sel1(mux1_sel1),
  .mux1_sel2(mux1_sel2),
  .mux2_sel0(mux2_sel0),
  .mux2_sel1(mux2_sel1),
  .mux2_sel2(mux2_sel2),
  .mux3_sel0(mux3_sel0),
  .mux3_sel1(mux3_sel1),
  .mux3_sel2(mux3_sel2),
  .mux4_sel0(mux4_sel0),
  .mux4_sel1(mux4_sel1),
  .mux4_sel2(mux4_sel2),
  .mux5_sel0(mux5_sel0),
  .mux5_sel1(mux5_sel1),
  .mux5_sel2(mux5_sel2),
  .mux5_sel3(mux5_sel3)
                );


// fixscan start:
assign db0_clk_header_cmp_clk_scan_in = scan_in                  ;
assign db0_clk_header_iol2clk_scan_in = db0_clk_header_cmp_clk_scan_out; 
assign rtc_scanin                = db0_clk_header_iol2clk_scan_out   ;
assign red_dp_scanin             = rtc_scanout              ;
assign red_ctl_scanin            = red_dp_scanout           ;
assign scan_out                  = red_ctl_scanout          ;
// fixscan end:
endmodule

