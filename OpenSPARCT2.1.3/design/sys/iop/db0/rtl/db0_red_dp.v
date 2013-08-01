// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: db0_red_dp.v
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
module db0_red_dp (
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  red_rtc_rep_bus, 
  wr_en0, 
  wr_en1, 
  wr_en2, 
  wr_en3, 
  mux1_sel0, 
  mux1_sel1, 
  mux1_sel2, 
  mux2_sel0, 
  mux2_sel1, 
  mux2_sel2, 
  mux3_sel0, 
  mux3_sel1, 
  mux3_sel2, 
  mux4_sel0, 
  mux4_sel1, 
  mux4_sel2, 
  mux5_sel0, 
  mux5_sel1, 
  mux5_sel2, 
  mux5_sel3, 
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
  dbg0_mio_debug_bus_a, 
  dbg0_mio_debug_bus_b);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire [11:0] dmu_ncu_data_fnl;
wire ff_dmu_ncu_data_scanin;
wire ff_dmu_ncu_data_scanout;
wire dmu_ncu_vld_r;
wire [31:0] dmu_ncu_data_r;
wire ff_dmu_ncu_data_r0_scanin;
wire ff_dmu_ncu_data_r0_scanout;
wire ff_dmu_ncu_data_r1_scanin;
wire ff_dmu_ncu_data_r1_scanout;
wire ff_dmu_ncu_data_r2_scanin;
wire ff_dmu_ncu_data_r2_scanout;
wire ff_dmu_ncu_data_r3_scanin;
wire ff_dmu_ncu_data_r3_scanout;
wire ff_rep_bus_slice0_scanin;
wire ff_rep_bus_slice0_scanout;
wire ff_rep_bus_slice1_scanin;
wire ff_rep_bus_slice1_scanout;
wire ff_rep_bus_slice2_scanin;
wire ff_rep_bus_slice2_scanout;
wire ff_rep_bus_slice3_scanin;
wire ff_rep_bus_slice3_scanout;
wire ff_rep_bus_slice4_scanin;
wire ff_rep_bus_slice4_scanout;
wire ff_rep_bus_slice5_scanin;
wire ff_rep_bus_slice5_scanout;
wire ff_rep_bus_slice6_scanin;
wire ff_rep_bus_slice6_scanout;
wire ff_rep_bus_slice7_scanin;
wire ff_rep_bus_slice7_scanout;
wire ff_rep_bus_slice8_scanin;
wire ff_rep_bus_slice8_scanout;
wire ff_rep_bus_slice9_scanin;
wire ff_rep_bus_slice9_scanout;


input		iol2clk;                // Internal IO clock from CCU 

input           scan_in;
output          scan_out;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;

output [331:0]  red_rtc_rep_bus;        // repeatability bus

input		wr_en0;
input		wr_en1;
input		wr_en2;
input		wr_en3;	

input		mux1_sel0;
input		mux1_sel1;
input		mux1_sel2;

input           mux2_sel0;
input           mux2_sel1;
input           mux2_sel2;

input           mux3_sel0;
input           mux3_sel1;
input           mux3_sel2;

input           mux4_sel0;
input           mux4_sel1;
input           mux4_sel2;

input		mux5_sel0;
input           mux5_sel1;
input           mux5_sel2;
input           mux5_sel3;

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

input           niu_ncu_vld;            //CSR Data return/Interrupt valid from  NIU  to NCU
input  [31:0]   niu_ncu_data;           //CSR data/ Interrupt packet from NIU to NCU
input           niu_ncu_stall;          //Stall asserted by NIU  to NCU
input           niu_sii_hdr_vld;        //NIU requesting to send packet to SII
input           niu_sii_reqbypass;      //NIU requesting to send packet to bypass queue of SII
input           niu_sii_datareq;        //NIU requesting to send packet w/data to SII
input  [127:0]  niu_sii_data;           //Packet from NIU to SII
input           niu_sio_dq;             //flow control or credit return signal from NIU to SIO

output [7:0]    dbg0_mio_debug_bus_a;   //Flopped version of Debug Bus A from DMU
output [7:0]    dbg0_mio_debug_bus_b;   //Flopped version of Debug Bus B from DMU

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

wire  [11:0]   dmu_ncu_data_reg0,dmu_ncu_data_reg1,dmu_ncu_data_reg2,dmu_ncu_data_reg3;
wire  [35:0]   dmu_ncu_data_0,dmu_ncu_data_1,dmu_ncu_data_2,dmu_ncu_data_3;
wire  [165:0]  dmu_data, niu_data;

// flop dmu_ncu_data[31:0] and dmu_ncu_vld

assign niu_data = {niu_ncu_vld,niu_ncu_data[31:0],niu_ncu_stall,niu_sii_hdr_vld,
                   niu_sii_reqbypass,niu_sii_datareq,niu_sio_dq,niu_sii_data[127:0]};

assign dmu_data = {dmu_ncu_data_fnl[11:0],dmu_ncu_wrack_vld,dmu_ncu_wrack_tag[3:0],
                   dmu_ncu_stall,dmu_sii_hdr_vld,dmu_sii_reqbypass,dmu_sii_datareq,
                   dmu_sii_datareq16,dmu_sii_be[15:0],dmu_sii_data[127:0]
                   };
                   

db0_red_dp_msff_macro__stack_34r__width_33 ff_dmu_ncu_data         (
                .scan_in(ff_dmu_ncu_data_scanin),
                .scan_out(ff_dmu_ncu_data_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    ({dmu_ncu_vld,dmu_ncu_data[31:0]}),
                .dout   ({dmu_ncu_vld_r,dmu_ncu_data_r[31:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

// flop dmu_ncu_vld_r,dmu_ncu_data_r[31:0] into 4 separate flops
// based on write enables coming from dbg0_red_ctl.sv
// these are the 4 data beats from dmu to ncu for csr
// data return

db0_red_dp_msff_macro__stack_36r__width_36 ff_dmu_ncu_data_r0         (
                .scan_in(ff_dmu_ncu_data_r0_scanin),
                .scan_out(ff_dmu_ncu_data_r0_scanout),
                .clk    ( iol2clk ),
                .en     ( wr_en0 ),
                .din    ({dmu_ncu_vld_r,1'b0,dmu_ncu_data_r[31:22],
                         dmu_ncu_vld_r,dmu_ncu_data_r[21:11],
                         dmu_ncu_vld_r,dmu_ncu_data_r[10:0]}
                        ),
                .dout  (dmu_ncu_data_0[35:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_red_dp_msff_macro__stack_36r__width_36 ff_dmu_ncu_data_r1         (
                .scan_in(ff_dmu_ncu_data_r1_scanin),
                .scan_out(ff_dmu_ncu_data_r1_scanout),
                .clk    ( iol2clk ),
                .en     ( wr_en1 ),
                .din    ({dmu_ncu_vld_r,1'b0,dmu_ncu_data_r[31:22], 
                         dmu_ncu_vld_r,dmu_ncu_data_r[21:11],
                         dmu_ncu_vld_r,dmu_ncu_data_r[10:0]}
                        ),
                .dout  (dmu_ncu_data_1[35:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );
db0_red_dp_msff_macro__stack_36r__width_36 ff_dmu_ncu_data_r2         (
                .scan_in(ff_dmu_ncu_data_r2_scanin),
                .scan_out(ff_dmu_ncu_data_r2_scanout),
                .clk    ( iol2clk ),
                .en     ( wr_en2 ),
                .din    ({dmu_ncu_vld_r,1'b0,dmu_ncu_data_r[31:22], 
                         dmu_ncu_vld_r,dmu_ncu_data_r[21:11],
                         dmu_ncu_vld_r,dmu_ncu_data_r[10:0]}
                        ),
                .dout  (dmu_ncu_data_2[35:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );
db0_red_dp_msff_macro__stack_36r__width_36 ff_dmu_ncu_data_r3         (
                .scan_in(ff_dmu_ncu_data_r3_scanin),
                .scan_out(ff_dmu_ncu_data_r3_scanout),
                .clk    ( iol2clk ),
                .en     ( wr_en3 ),
                .din    ({dmu_ncu_vld_r,1'b0,dmu_ncu_data_r[31:22], 
                         dmu_ncu_vld_r,dmu_ncu_data_r[21:11],
                         dmu_ncu_vld_r,dmu_ncu_data_r[10:0]}
                        ),
                .dout  (dmu_ncu_data_3[35:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

// Mux out the outputs of these 4 flop macros based on
// control signals from dbg0_red_ctl

db0_red_dp_mux_macro__mux_aonpe__ports_3__stack_12r__width_12 mux_1 
               (
                .dout (dmu_ncu_data_reg0[11:0]),
                .din0  (dmu_ncu_data_0[11:0]),
                .din1  (dmu_ncu_data_0[23:12]),
                .din2  (dmu_ncu_data_0[35:24]),
                .sel0 (mux1_sel0),
                .sel1 (mux1_sel1),
                .sel2 (mux1_sel2)
              ) ;
db0_red_dp_mux_macro__mux_aonpe__ports_3__stack_12r__width_12 mux_2 
               (
                .dout (dmu_ncu_data_reg1[11:0]),
                .din0  (dmu_ncu_data_1[11:0]),
                .din1  (dmu_ncu_data_1[23:12]),
                .din2  (dmu_ncu_data_1[35:24]),
                .sel0 (mux2_sel0),
                .sel1 (mux2_sel1),
                .sel2 (mux2_sel2)
              ) ;
db0_red_dp_mux_macro__mux_aonpe__ports_3__stack_12r__width_12 mux_3 
               (
                .dout (dmu_ncu_data_reg2[11:0]),
                .din0  (dmu_ncu_data_2[11:0]),
                .din1  (dmu_ncu_data_2[23:12]),
                .din2  (dmu_ncu_data_2[35:24]),
                .sel0 (mux3_sel0),
                .sel1 (mux3_sel1),
                .sel2 (mux3_sel2)
              ) ;
db0_red_dp_mux_macro__mux_aonpe__ports_3__stack_12r__width_12 mux_4 
               (
                .dout (dmu_ncu_data_reg3[11:0]),
                .din0  (dmu_ncu_data_3[11:0]),
                .din1  (dmu_ncu_data_3[23:12]),
                .din2  (dmu_ncu_data_3[35:24]),
                .sel0 (mux4_sel0),
                .sel1 (mux4_sel1),
                .sel2 (mux4_sel2)
              ) ;

db0_red_dp_mux_macro__mux_aonpe__ports_4__stack_12r__width_12 mux_5 
               (
                .dout (dmu_ncu_data_fnl[11:0]),
        	.din0   (dmu_ncu_data_reg0[11:0]),
        	.din1   (dmu_ncu_data_reg1[11:0]),
        	.din2   (dmu_ncu_data_reg2[11:0]),
        	.din3   (dmu_ncu_data_reg3[11:0]),
        	.sel0   (mux5_sel0),
        	.sel1   (mux5_sel1),
        	.sel2   (mux5_sel2),
        	.sel3   (mux5_sel3)
        );

// Output flops for rep_bus[331:0] , DMU data on 165:0,NIU on 331:166

db0_red_dp_msff_macro__stack_36r__width_36 ff_rep_bus_slice0         (
                .scan_in(ff_rep_bus_slice0_scanin),
                .scan_out(ff_rep_bus_slice0_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    (dmu_data[35:0]
                        ),
                .dout  (red_rtc_rep_bus[35:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_red_dp_msff_macro__stack_36r__width_36 ff_rep_bus_slice1         (
                .scan_in(ff_rep_bus_slice1_scanin),
                .scan_out(ff_rep_bus_slice1_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    (dmu_data[71:36]
                        ),
                .dout  (red_rtc_rep_bus[71:36]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_red_dp_msff_macro__stack_36r__width_36 ff_rep_bus_slice2         (
                .scan_in(ff_rep_bus_slice2_scanin),
                .scan_out(ff_rep_bus_slice2_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    (dmu_data[107:72]
                        ),
                .dout  (red_rtc_rep_bus[107:72]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_red_dp_msff_macro__stack_36r__width_36 ff_rep_bus_slice3         (
                .scan_in(ff_rep_bus_slice3_scanin),
                .scan_out(ff_rep_bus_slice3_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    (dmu_data[143:108]
                        ),
                .dout  (red_rtc_rep_bus[143:108]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_red_dp_msff_macro__stack_36r__width_36 ff_rep_bus_slice4         (
                .scan_in(ff_rep_bus_slice4_scanin),
                .scan_out(ff_rep_bus_slice4_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    ({niu_data[13:0],dmu_data[165:144]}
                        ),
                .dout  (red_rtc_rep_bus[179:144]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_red_dp_msff_macro__stack_36r__width_36 ff_rep_bus_slice5         (
                .scan_in(ff_rep_bus_slice5_scanin),
                .scan_out(ff_rep_bus_slice5_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    (niu_data[49:14]
                        ),
                .dout  (red_rtc_rep_bus[215:180]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_red_dp_msff_macro__stack_36r__width_36 ff_rep_bus_slice6         (
                .scan_in(ff_rep_bus_slice6_scanin),
                .scan_out(ff_rep_bus_slice6_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    (niu_data[85:50]
                        ),
                .dout  (red_rtc_rep_bus[251:216]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_red_dp_msff_macro__stack_36r__width_36 ff_rep_bus_slice7         (
                .scan_in(ff_rep_bus_slice7_scanin),
                .scan_out(ff_rep_bus_slice7_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    (niu_data[121:86]
                        ),
                .dout  (red_rtc_rep_bus[287:252]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_red_dp_msff_macro__stack_36r__width_36 ff_rep_bus_slice8         (
                .scan_in(ff_rep_bus_slice8_scanin),
                .scan_out(ff_rep_bus_slice8_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    (niu_data[157:122]
                        ),
                .dout  (red_rtc_rep_bus[323:288]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_red_dp_msff_macro__stack_24r__width_24 ff_rep_bus_slice9         (
                .scan_in(ff_rep_bus_slice9_scanin),
                .scan_out(ff_rep_bus_slice9_scanout),
                .clk    ( iol2clk ),
                .en     ( 1'b1 ),
                .din    ({dmu_dbg0_debug_bus_b[7:0],
                          dmu_dbg0_debug_bus_a[7:0],
                          niu_data[165:158]}
                        ),
                .dout  ({dbg0_mio_debug_bus_b[7:0],
                         dbg0_mio_debug_bus_a[7:0],
                         red_rtc_rep_bus[331:324]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

// fixscan start:
assign ff_dmu_ncu_data_scanin    = scan_in                  ;
assign ff_dmu_ncu_data_r0_scanin = ff_dmu_ncu_data_scanout  ;
assign ff_dmu_ncu_data_r1_scanin = ff_dmu_ncu_data_r0_scanout;
assign ff_dmu_ncu_data_r2_scanin = ff_dmu_ncu_data_r1_scanout;
assign ff_dmu_ncu_data_r3_scanin = ff_dmu_ncu_data_r2_scanout;
assign ff_rep_bus_slice0_scanin  = ff_dmu_ncu_data_r3_scanout;
assign ff_rep_bus_slice1_scanin  = ff_rep_bus_slice0_scanout;
assign ff_rep_bus_slice2_scanin  = ff_rep_bus_slice1_scanout;
assign ff_rep_bus_slice3_scanin  = ff_rep_bus_slice2_scanout;
assign ff_rep_bus_slice4_scanin  = ff_rep_bus_slice3_scanout;
assign ff_rep_bus_slice5_scanin  = ff_rep_bus_slice4_scanout;
assign ff_rep_bus_slice6_scanin  = ff_rep_bus_slice5_scanout;
assign ff_rep_bus_slice7_scanin  = ff_rep_bus_slice6_scanout;
assign ff_rep_bus_slice8_scanin  = ff_rep_bus_slice7_scanout;
assign ff_rep_bus_slice9_scanin  = ff_rep_bus_slice8_scanout;
assign scan_out                  = ff_rep_bus_slice9_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module db0_red_dp_msff_macro__stack_34r__width_33 (
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
wire [31:0] so;

  input [32:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [32:0] dout;


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
dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module db0_red_dp_msff_macro__stack_36r__width_36 (
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
wire [34:0] so;

  input [35:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [35:0] dout;


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
dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db0_red_dp_mux_macro__mux_aonpe__ports_3__stack_12r__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  input [11:0] din2;
  input sel2;
  output [11:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(12)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
.dout(dout[11:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db0_red_dp_mux_macro__mux_aonpe__ports_4__stack_12r__width_12 (
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

  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  input [11:0] din2;
  input sel2;
  input [11:0] din3;
  input sel3;
  output [11:0] dout;





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
mux4s #(12)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
  .in3(din3[11:0]),
.dout(dout[11:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module db0_red_dp_msff_macro__stack_24r__width_24 (
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
wire [22:0] so;

  input [23:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [23:0] dout;


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
dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);




















endmodule








