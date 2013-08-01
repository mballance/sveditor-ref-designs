// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_dmo_ctl.v
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
module tcu_dmo_ctl (
  l2clk, 
  scan_in, 
  scan_out, 
  tcu_int_se, 
  tcu_int_aclk, 
  tcu_int_bclk, 
  tcu_int_ce, 
  tcu_pce_ov, 
  io_cmp_sync_en_local, 
  cmp_io2x_sync_en_local, 
  mbist_start_io_sync, 
  tcu_mio_dmo_data, 
  tcu_mio_dmo_sync, 
  tcu_mio_mbist_done, 
  tcu_mio_mbist_fail, 
  tcu_mio_jtag_membist_mode, 
  spc4_dmo_dout, 
  spc6_dmo_dout, 
  dmo_coresel, 
  dmo_dcmuxctl, 
  dmo_icmuxctl, 
  l2t4_dmo_dout, 
  l2t6_dmo_dout, 
  dmo_l2tsel, 
  dmo_tagmuxctl, 
  rtx_tcu_dmo_data_out, 
  tds_tcu_dmo_dout, 
  rdp_tcu_dmo_dout, 
  tcu_rtx_dmo_ctl, 
  jtag_dmo_enable, 
  jtag_dmo_control_upd, 
  jtag_dmo_control, 
  dmo_cfg, 
  mbist_all_done, 
  mbist_one_fail);
wire l1en;
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire dmo_spc4din_reg_scanin;
wire dmo_spc4din_reg_scanout;
wire [35:0] spc4_dmo_data;
wire dmo_spc6din_reg_scanin;
wire dmo_spc6din_reg_scanout;
wire [35:0] spc6_dmo_data;
wire dmo_l2t4din_reg_scanin;
wire dmo_l2t4din_reg_scanout;
wire [38:0] l2t4_dmo_data;
wire dmo_l2t6din_reg_scanin;
wire dmo_l2t6din_reg_scanout;
wire [38:0] l2t6_dmo_data;
wire dmo_rtxdin_reg_scanin;
wire dmo_rtxdin_reg_scanout;
wire [39:0] rtx_dmo_data;
wire dmo_rdpdin_reg_scanin;
wire dmo_rdpdin_reg_scanout;
wire [39:0] rdp_dmo_data;
wire dmo_tdsdin_reg_scanin;
wire dmo_tdsdin_reg_scanout;
wire [39:0] tds_dmo_data;
wire spcl2t_sel;
wire [15:0] dmo_control;
wire [1:0] spcl2tag_ctl;
wire [1:0] niu_ctl;
wire spc4_sel;
wire spc6_sel;
wire l2t4_sel;
wire l2t6_sel;
wire l2tag_sel;
wire rtx_sel;
wire rdp_sel;
wire tds_sel;
wire [35:0] spc_data;
wire [38:0] l2t_data;
wire [38:0] spcl2t_data;
wire [39:0] niu_data;
wire [39:0] dmo_data;
wire dmo_sampledata_reg_scanin;
wire dmo_sampledata_reg_scanout;
wire sample_data;
wire [39:0] dmo_sampled_data;
wire [31:0] sr_out;
wire dmo_io2xdata_reg_scanin;
wire dmo_io2xdata_reg_scanout;
wire [39:0] dmo_sampled_data_io2x;
wire dmo_sr_reg_scanin;
wire dmo_sr_reg_scanout;
wire [31:0] sr_next;
wire shift;
wire dmoctl_upd;
wire jtag_dmo_enable_io2x_sync;
wire start_dmo;
wire dmo_muxctl_reg_scanin;
wire dmo_muxctl_reg_scanout;
wire [15:0] dmo_ctl_next;
wire dmo_ensync_reg_scanin;
wire dmo_ensync_reg_scanout;
wire jtag_dmo_enable_sync;
wire dmo_dmoen_reg_scanin;
wire dmo_dmoen_reg_scanout;
wire dmo_updsync_reg_scanin;
wire dmo_updsync_reg_scanout;
wire jtag_dmo_control_upd_sync;
wire dmo_dmosync_reg_scanin;
wire dmo_dmosync_reg_scanout;
wire dmo_sync_next;
wire dmo_sync;
wire dmo_dmosyncout_reg_scanin;
wire dmo_dmosyncout_reg_scanout;
wire dmo_dmodf_reg_scanin;
wire dmo_dmodf_reg_scanout;
wire done;
wire fail;
wire mbist_start_io2x_sync;
wire done_sync;
wire fail_sync;
wire mbist_start_pulse;

   
   input         l2clk;

   // Scan input/output for this block 
   input 	 scan_in;
   output 	 scan_out;
   // Scan Controls
   input         tcu_int_se;
   input         tcu_int_aclk;
   input         tcu_int_bclk;
   input         tcu_int_ce;
   input         tcu_pce_ov;
   
   // Synchronizer enables
   input         io_cmp_sync_en_local;
   input 	 cmp_io2x_sync_en_local;
   // MBIST Start from mbist controller
   input         mbist_start_io_sync;

   // MIO Interface
   output [39:0] tcu_mio_dmo_data; 
   output 	 tcu_mio_dmo_sync; 
   output 	 tcu_mio_mbist_done; 
   output 	 tcu_mio_mbist_fail; 
   output 	 tcu_mio_jtag_membist_mode; 
   
   // Core Interface
   input [35:0]  spc4_dmo_dout;
   input [35:0]  spc6_dmo_dout;
   output [5:0]  dmo_coresel;
   output 	 dmo_dcmuxctl;
   output 	 dmo_icmuxctl;
   
   // L2Tag Interface
   input [38:0]  l2t4_dmo_dout;
   input [38:0]  l2t6_dmo_dout;
   output [5:0]  dmo_l2tsel; 
   output 	 dmo_tagmuxctl;  

   // NIU Interface
   input [39:0]  rtx_tcu_dmo_data_out;
   input [39:0]  tds_tcu_dmo_dout;
   input [39:0]  rdp_tcu_dmo_dout;

   output [2:0]  tcu_rtx_dmo_ctl; 

   // JTAG Interface
   input 	 jtag_dmo_enable; // enables DMO port
   input 	 jtag_dmo_control_upd;
   input [47:0]  jtag_dmo_control;
   output [47:0] dmo_cfg;

   // Done, Fail from mbist
   input         mbist_all_done;
   input         mbist_one_fail;
   
   //********************************************************************
   // Scan reassigns
   //********************************************************************
   assign     l1en   = tcu_int_ce; // 1'b1; 
   assign     pce_ov = tcu_pce_ov; // 1'b1;
   assign     stop   = 1'b0;
   assign     se     = tcu_int_se;
   assign     siclk  = tcu_int_aclk;
   assign     soclk  = tcu_int_bclk;

   tcu_dmo_ctl_l1clkhdr_ctl_macro dmo_clkgen 
     ( .l2clk  (l2clk),
       .l1clk  (l1clk),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se) );

   //*******************************************************************
   // Incoming BIST Data from SPC Cores 4 & 6
   //*******************************************************************
   tcu_dmo_ctl_msff_ctl_macro__width_36 dmo_spc4din_reg 
   (
    .scan_in(dmo_spc4din_reg_scanin),
    .scan_out(dmo_spc4din_reg_scanout),
    .l1clk    (l1clk),
    .din      (spc4_dmo_dout[35:0]),
    .dout     (spc4_dmo_data[35:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_dmo_ctl_msff_ctl_macro__width_36 dmo_spc6din_reg 
   (
    .scan_in(dmo_spc6din_reg_scanin),
    .scan_out(dmo_spc6din_reg_scanout),
    .l1clk    (l1clk),
    .din      (spc6_dmo_dout[35:0]),
    .dout     (spc6_dmo_data[35:0]),
  .siclk(siclk),
  .soclk(soclk)
    );

   //*******************************************************************
   // Incoming BIST Data from L2 Tags 4 & 6
   //*******************************************************************
   tcu_dmo_ctl_msff_ctl_macro__width_39 dmo_l2t4din_reg 
   (
    .scan_in(dmo_l2t4din_reg_scanin),
    .scan_out(dmo_l2t4din_reg_scanout),
    .l1clk    (l1clk),
    .din      (l2t4_dmo_dout[38:0]),
    .dout     (l2t4_dmo_data[38:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_dmo_ctl_msff_ctl_macro__width_39 dmo_l2t6din_reg 
   (
    .scan_in(dmo_l2t6din_reg_scanin),
    .scan_out(dmo_l2t6din_reg_scanout),
    .l1clk    (l1clk),
    .din      (l2t6_dmo_dout[38:0]),
    .dout     (l2t6_dmo_data[38:0]),
  .siclk(siclk),
  .soclk(soclk)
    );

   //*******************************************************************
   // Incoming BIST Data from RTX, RDP & TDS (all NIU)
   // Synchronized into cmp clock domain from IO clock domain
   //*******************************************************************
   tcu_dmo_ctl_msff_ctl_macro__en_1__width_40 dmo_rtxdin_reg 
   (
    .scan_in(dmo_rtxdin_reg_scanin),
    .scan_out(dmo_rtxdin_reg_scanout),
    .l1clk    (l1clk),
    .en       (io_cmp_sync_en_local),
    .din      (rtx_tcu_dmo_data_out[39:0]),
    .dout     (rtx_dmo_data[39:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_dmo_ctl_msff_ctl_macro__en_1__width_40 dmo_rdpdin_reg 
   (
    .scan_in(dmo_rdpdin_reg_scanin),
    .scan_out(dmo_rdpdin_reg_scanout),
    .l1clk    (l1clk),
    .en       (io_cmp_sync_en_local),
    .din      (rdp_tcu_dmo_dout[39:0]),
    .dout     (rdp_dmo_data[39:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_dmo_ctl_msff_ctl_macro__en_1__width_40 dmo_tdsdin_reg 
   (
    .scan_in(dmo_tdsdin_reg_scanin),
    .scan_out(dmo_tdsdin_reg_scanout),
    .l1clk    (l1clk),
    .en       (io_cmp_sync_en_local),
    .din      (tds_tcu_dmo_dout[39:0]),
    .dout     (tds_dmo_data[39:0]),
  .siclk(siclk),
  .soclk(soclk)
    );

   //*******************************************************************
   // Assign jtag register values to control signals
   //*******************************************************************

   assign     spcl2t_sel          =  dmo_control[15];
   
   assign     spcl2tag_ctl[1:0]   =  dmo_control[14:13];
   assign     niu_ctl[1:0]        =  dmo_control[12:11];

   assign     tcu_rtx_dmo_ctl[2:0]= dmo_control[10:8];

   assign     dmo_dcmuxctl        =  dmo_control[7];
   assign     dmo_icmuxctl        =  dmo_control[6];
   assign     dmo_coresel[5:0]    =  dmo_control[5:0];

   assign     dmo_tagmuxctl       =  dmo_control[6];   // same as core's?
   assign     dmo_l2tsel          =  dmo_control[5:0]; // same as coresel
   
   //*******************************************************************
   // Incoming BIST Data from RTX, RDP & TDS (all NIU)
   // Synchronized into cmp clock domain from IO clock domain
   //*******************************************************************

   assign     spc4_sel            = ~spcl2tag_ctl[1]       & ~spcl2tag_ctl[0];
   assign     spc6_sel            = ~spcl2tag_ctl[1]       &  spcl2tag_ctl[0];
   assign     l2t4_sel            =  spcl2tag_ctl[1]       & ~spcl2tag_ctl[0];
   assign     l2t6_sel            =  spcl2tag_ctl[1]       &  spcl2tag_ctl[0];
   assign     l2tag_sel           =  spcl2tag_ctl[1];

   assign     rtx_sel             = ~niu_ctl[1]            & ~niu_ctl[0];
   assign     rdp_sel             = ~niu_ctl[1]            &  niu_ctl[0];
   assign     tds_sel             =  niu_ctl[1]            & ~niu_ctl[0];
   
   // Multiplex core & l2tag dmo data
   assign     spc_data[35:0]      =  spc4_sel    ?  spc4_dmo_data[35:0]  
                                  :  spc6_sel    ?  spc6_dmo_data[35:0]   :  36'b0;
   
   assign     l2t_data[38:0]      =  l2t4_sel    ?  l2t4_dmo_data[38:0]  
                                  :  l2t6_sel    ?  l2t6_dmo_data[38:0]   :  39'b0;
   

   assign     spcl2t_data[38:0]   =  l2tag_sel   ?  l2t_data[38:0]       : {3'b0,spc_data[35:0]};

   // Multiplex NIU dmo data
   assign     niu_data[39:0]      =  rtx_sel     ?  rtx_dmo_data[39:0]
	                          :  rdp_sel     ?  rdp_dmo_data[39:0]
 	                          :  tds_sel     ?  tds_dmo_data[39:0]   
                                  :  40'b0;

   // Select between core/l2tag and NIU
   assign     dmo_data[39:0]      =  spcl2t_sel  ?  {1'b0,spcl2t_data[38:0]} :  niu_data[39:0];

   //*******************************************************************
   // Sample DMO Data
   //*******************************************************************
   tcu_dmo_ctl_msff_ctl_macro__en_1__width_40 dmo_sampledata_reg 
   (
    .scan_in(dmo_sampledata_reg_scanin),
    .scan_out(dmo_sampledata_reg_scanout),
    .l1clk    (l1clk),
    .en       (sample_data),
    .din      (dmo_data[39:0]),
    .dout     (dmo_sampled_data[39:0]),
  .siclk(siclk),
  .soclk(soclk)
    );

   assign     sample_data            =  sr_out[31];
   
   //*******************************************************************
   // Send Sample DMO Data to MIO in IO2X Domain
   //*******************************************************************
   tcu_dmo_ctl_msff_ctl_macro__en_1__width_40 dmo_io2xdata_reg 
   (
    .scan_in(dmo_io2xdata_reg_scanin),
    .scan_out(dmo_io2xdata_reg_scanout),
    .l1clk    (l1clk),
    .en       (cmp_io2x_sync_en_local),
    .din      (dmo_sampled_data[39:0]),
    .dout     (dmo_sampled_data_io2x[39:0]),
  .siclk(siclk),
  .soclk(soclk)
    );

   assign     tcu_mio_dmo_data[39:0] =  dmo_sampled_data_io2x[39:0];

   //*******************************************************************
   // Shift Register to Generate Sample Points for DMO Data
   // Uses bits 31:16 of JTAG DMO Register
   //*******************************************************************
   tcu_dmo_ctl_msff_ctl_macro__width_32 dmo_sr_reg 
   (
    .scan_in(dmo_sr_reg_scanin),
    .scan_out(dmo_sr_reg_scanout),
    .l1clk    (l1clk),
    .din      (sr_next[31:0]),
    .dout     (sr_out[31:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   
   assign     sr_next[31:0]      =  shift        ?  {sr_out[0],sr_out[31:1]}
	                         :  dmoctl_upd   ?  jtag_dmo_control[47:16] 
                                 :  sr_out[31:0];

   assign     shift              =  jtag_dmo_enable_io2x_sync & start_dmo; 

   //*******************************************************************
   // Mux Controls for DMO Data
   // Uses bits 15:0 of JTAG DMO Register
   //*******************************************************************
   tcu_dmo_ctl_msff_ctl_macro__en_1__width_16 dmo_muxctl_reg 
   (
    .scan_in(dmo_muxctl_reg_scanin),
    .scan_out(dmo_muxctl_reg_scanout),
    .l1clk    (l1clk),
    .en       (cmp_io2x_sync_en_local),
    .din      (dmo_ctl_next[15:0]),
    .dout     (dmo_control[15:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   
   assign     dmo_ctl_next[15:0] =  dmoctl_upd   ?  jtag_dmo_control[15:0] 
                                 :  dmo_control[15:0];
   
   assign     dmo_cfg[47:0]      = {sr_out[31:0],dmo_control[15:0]}; // to jtag

   //********************************************************************
   // DMO Enable from JTAG (TCK Clock Domain)
   //********************************************************************
   cl_sc1_clksyncff_4x dmo_en_sync_reg 
   (
    .si      (dmo_ensync_reg_scanin),
    .so      (dmo_ensync_reg_scanout),   
    .l1clk    (l1clk),
    .d        (jtag_dmo_enable),
    .q        (jtag_dmo_enable_sync),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_dmo_ctl_msff_ctl_macro__en_1__width_1 dmo_dmoen_reg 
   (
    .scan_in(dmo_dmoen_reg_scanin),
    .scan_out(dmo_dmoen_reg_scanout),
    .l1clk    (l1clk),
    .en       (cmp_io2x_sync_en_local),
    .din      (jtag_dmo_enable_sync),
    .dout     (jtag_dmo_enable_io2x_sync),
  .siclk(siclk),
  .soclk(soclk)
    );
   
   
   assign     tcu_mio_jtag_membist_mode = jtag_dmo_enable_io2x_sync;

   assign     start_dmo = mbist_start_io_sync; 
 //assign     start_dmo = jtag_dmo_enable_io2x_sync; //mbist_start_io_sync; 
   // mbist_start_io_sync is mbist_start from mbist_ctl synch'ed with cmp_io_sync_en
    
   //********************************************************************
   // Synchronizers for Updates from JTAG (TCK Clock Domain)
   //********************************************************************
   cl_sc1_clksyncff_4x dmo_upd_sync_reg 
   (
    .si      (dmo_updsync_reg_scanin),
    .so      (dmo_updsync_reg_scanout),   
    .l1clk    (l1clk),
    .d        (jtag_dmo_control_upd),
    .q        (jtag_dmo_control_upd_sync),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign     dmoctl_upd         =  jtag_dmo_control_upd_sync;
   
   //*******************************************************************
   // Generate mbist_sync to MIO; this runs at 1/2 frequency of data 
   //  going to MIO, for tester to tell where/when data is valid
   //*******************************************************************
   tcu_dmo_ctl_msff_ctl_macro__clr__1__width_1 dmo_dmosync_reg 
   (
    .scan_in(dmo_dmosync_reg_scanin),
    .scan_out(dmo_dmosync_reg_scanout),
    .l1clk    (l1clk),
    .clr_     (shift),
    .din      (dmo_sync_next),
    .dout     (dmo_sync),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_dmo_ctl_msff_ctl_macro__en_1__width_1 dmo_dmosyncout_reg 
   (
    .scan_in(dmo_dmosyncout_reg_scanin),
    .scan_out(dmo_dmosyncout_reg_scanout),
    .l1clk    (l1clk),
    .en       (cmp_io2x_sync_en_local),
    .din      (dmo_sync),
    .dout     (tcu_mio_dmo_sync),
  .siclk(siclk),
  .soclk(soclk)
    );

   assign     dmo_sync_next      =  sample_data  ? ~dmo_sync  :  dmo_sync;

   //*******************************************************************
   // Generate mbist_done, mbist_fail to MIO; 
   //*******************************************************************
   tcu_dmo_ctl_msff_ctl_macro__en_1__width_3 dmo_dmodf_reg 
   (
    .scan_in(dmo_dmodf_reg_scanin),
    .scan_out(dmo_dmodf_reg_scanout),
    .l1clk    (l1clk),
    .en       (cmp_io2x_sync_en_local),
    .din      ({mbist_start_io_sync,   done,      fail}),
    .dout     ({mbist_start_io2x_sync, done_sync, fail_sync}),
  .siclk(siclk),
  .soclk(soclk)
    );

   assign     mbist_start_pulse  =  mbist_start_io_sync  & ~mbist_start_io2x_sync;
   assign     done               =  mbist_start_pulse    |  mbist_all_done;
   assign     fail               =  mbist_start_pulse    |  mbist_one_fail;

   assign     tcu_mio_mbist_done =  done_sync;
   assign     tcu_mio_mbist_fail =  fail_sync;

// fixscan start:
assign dmo_spc4din_reg_scanin    = scan_in                  ;
assign dmo_spc6din_reg_scanin    = dmo_spc4din_reg_scanout  ;
assign dmo_l2t4din_reg_scanin    = dmo_spc6din_reg_scanout  ;
assign dmo_l2t6din_reg_scanin    = dmo_l2t4din_reg_scanout  ;
assign dmo_rtxdin_reg_scanin     = dmo_l2t6din_reg_scanout  ;
assign dmo_rdpdin_reg_scanin     = dmo_rtxdin_reg_scanout   ;
assign dmo_tdsdin_reg_scanin     = dmo_rdpdin_reg_scanout   ;
assign dmo_sampledata_reg_scanin = dmo_tdsdin_reg_scanout   ;
assign dmo_io2xdata_reg_scanin   = dmo_sampledata_reg_scanout;
assign dmo_sr_reg_scanin         = dmo_io2xdata_reg_scanout ;
assign dmo_muxctl_reg_scanin     = dmo_sr_reg_scanout       ;
assign dmo_ensync_reg_scanin     = dmo_muxctl_reg_scanout   ;
assign dmo_dmoen_reg_scanin      = dmo_ensync_reg_scanout   ;
assign dmo_updsync_reg_scanin    = dmo_dmoen_reg_scanout    ;
assign dmo_dmosync_reg_scanin    = dmo_updsync_reg_scanout  ;
assign dmo_dmosyncout_reg_scanin = dmo_dmosync_reg_scanout  ;
assign dmo_dmodf_reg_scanin      = dmo_dmosyncout_reg_scanout  ;
assign scan_out                  = dmo_dmodf_reg_scanout    ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module tcu_dmo_ctl_l1clkhdr_ctl_macro (
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

module tcu_dmo_ctl_msff_ctl_macro__width_36 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [35:0] fdin;
wire [34:0] so;

  input [35:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [35:0] dout;
  output scan_out;
assign fdin[35:0] = din[35:0];






dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_dmo_ctl_msff_ctl_macro__width_39 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [38:0] fdin;
wire [37:0] so;

  input [38:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [38:0] dout;
  output scan_out;
assign fdin[38:0] = din[38:0];






dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_dmo_ctl_msff_ctl_macro__en_1__width_40 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [39:0] fdin;
wire [38:0] so;

  input [39:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = (din[39:0] & {40{en}}) | (dout[39:0] & ~{40{en}});






dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_dmo_ctl_msff_ctl_macro__width_32 (
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

module tcu_dmo_ctl_msff_ctl_macro__en_1__width_16 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = (din[15:0] & {16{en}}) | (dout[15:0] & ~{16{en}});






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

module tcu_dmo_ctl_msff_ctl_macro__en_1__width_1 (
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

module tcu_dmo_ctl_msff_ctl_macro__clr__1__width_1 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{(~clr_)}};






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

module tcu_dmo_ctl_msff_ctl_macro__en_1__width_3 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






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








