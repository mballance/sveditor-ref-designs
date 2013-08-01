// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: spc_lb_ctl.v
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
`define    SHFT_LENGTH  15'b010_0000_0000_0000		// (Longest) Shift Length
`define    VECT_COUNT   16'b0000_0000_0000_0011		// Vector Count
`define    PRPG_SEED    24'h111111			// PRPG Seed (non-zero)
`define    CH_BYP       16'b0000_0000_0000_0000		// Bypass Channels (Outputs)

module spc_lb_ctl (
  l2clk, 
  tcu_pce_ov, 
  scan_in, 
  scan_out, 
  aclk, 
  bclk, 
  scan_en, 
  se_scancollar_in, 
  se_scancollar_out, 
  clk_stop, 
  test_mode, 
  wmr_protect, 
  array_wr_inhibit, 
  io_si, 
  mbist_si, 
  io_so, 
  mbist_so, 
  lbist_start, 
  lbist_pgm, 
  lbist_done, 
  lbist_run, 
  channel_so, 
  mb_channel_so, 
  channel_si, 
  mb_channel_si, 
  core_aclk, 
  core_bclk, 
  core_scan_en, 
  core_scan_en_wmr, 
  core_se_sc_in, 
  core_se_sc_out, 
  core_clk_stop, 
  core_awi, 
  slow_cmp_sync_en, 
  core_isolate);
wire pce_ov;
wire stop;
wire lb_int_clk_stop;
wire se;
wire siclk;
wire soclk;
wire clock_enable;
wire [4:0] lbcontrol_out;
wire lbl2clk;
wire l1clk_pm1;
wire frl1clk;
wire lb_clkstop_reg_scanin;
wire lb_clkstop_reg_scanout;
wire lb_iocmpsyncen_reg_scanin;
wire lb_iocmpsyncen_reg_scanout;
wire io_cmp_sync_en_local;
wire lb_control_reg_scanin;
wire lb_control_reg_scanout;
wire [4:0] lbcontrol_new;
wire reset;
wire lb_done;
wire load_default;
wire load_pgm;
wire capclk_done;
wire init_done;
wire init_cycle;
wire vect_count_equal;
wire capture_mode;
wire vect_unload_done;
wire lb_shftpgm_reg_scanin;
wire lb_shftpgm_reg_scanout;
wire [14:0] shft_pgm_new;
wire [14:0] shft_pgm_out;
wire lb_shftcnt_reg_scanin;
wire lb_shftcnt_reg_scanout;
wire [18:0] shft_cnt_new;
wire [18:0] shft_cnt_out;
wire shift_chains;
wire shft_count_equal;
wire capclk_cycle;
wire lb_capclkcnt_reg_scanin;
wire lb_capclkcnt_reg_scanout;
wire [4:0] capclk_cnt_new;
wire [4:0] capclk_cnt_out;
wire lb_vectpgm_reg_scanin;
wire lb_vectpgm_reg_scanout;
wire [15:0] vect_pgm_new;
wire [15:0] vect_pgm_out;
wire lb_vectorcnt_reg_scanin;
wire lb_vectorcnt_reg_scanout;
wire [15:0] vect_cnt_new;
wire [15:0] vect_cnt_out;
wire increase_vect_cnt;
wire lb_clk_stop;
wire lb_scan_en;
wire lb_aclk;
wire lb_bclk;
wire lb_prpg_reg_scanin;
wire lb_prpg_reg_scanout;
wire [23:0] prpg_new;
wire [23:0] prpg_out;
wire prpg_run;
wire [23:0] prpg_calc;
wire prpg_xor7_out;
wire prpg_xor2_out;
wire prpg_xor1_out;
wire lb_misr_reg_scanin;
wire lb_misr_reg_scanout;
wire [23:0] misr_new;
wire [23:0] misr_out;
wire misr_run;
wire [23:0] misr_calc;
wire misr_xor7_out;
wire [15:0] misr_ch;
wire misr_xor2_out;
wire misr_xor1_out;
wire [15:0] ch_byp;
wire lb_cb_reg_scanin;
wire lb_cb_reg_scanout;
wire [15:0] cb_new;
wire [15:0] cb_out;
wire lb_done_reg_scanin;
wire lb_done_reg_scanout;
wire spare_scanin;
wire spare_scanout;

   
   input         l2clk;
   input         tcu_pce_ov;

   // Scan input/output for this block 
   input 	 scan_in;
   output 	 scan_out;

   // Scan Controls for Core & this block (LBIST) are shared
   input 	 aclk;              // Core aclk from TCU
   input 	 bclk;              // Core bclk from TCU
   input 	 scan_en;           // Core scan_en from TCU
   input         se_scancollar_in;
   input         se_scancollar_out;
   input         clk_stop;          // Core clk_stop from TCU; must be low 
                                    //  to run Logic BIST
   input         test_mode;         // From TCU, indicates ATPG mode
   input         wmr_protect;       // From cluster header, protect warm scan outputs
   input         array_wr_inhibit;  // From TCU 

   input   [1:0] io_si;             // From pins: Core scan chain for ATPG 
   input         mbist_si;          // From TCU:  To core's mbist scan chain
   output  [1:0] io_so;             // To pins:   Core scan chain for ATPG
   output        mbist_so;          // To TCU:    From core's mbist scan chain
   
   // Logic BIST Control Signals
   input 	 lbist_start;       // Drive high and hold to run Logic BIST
   input 	 lbist_pgm;         // Use programmed values, not defaults
   // Logic BIST Status Signals
   output        lbist_done;        // Indicates Logic BIST is done
   output        lbist_run;         // Indicates Logic BIST is running

   input  [15:0] channel_so;        // Receives so from core scan chains
   input         mb_channel_so;     // Receives so from core mbist chain
   output [15:0] channel_si;        // Feeds si of Core scan chains
   output        mb_channel_si;     // Feeds si of core's mbist chain

   output        core_aclk;         // aclk to Core scan chains
   output        core_bclk;         // bclk to Core scan chains
   output        core_scan_en;      // scan_en to Core scan chains
   output        core_scan_en_wmr;  // scan_en to Core scan chains, wmr protect version
   output        core_se_sc_in;     // se_scancollar_in to Core scan chains
   output        core_se_sc_out;    // se_scancollar_out to Core scan chains
   output        core_clk_stop;     // clk_stop to Core scan chains
   output        core_awi;          // array write inhibit to cluster header

   // Sync Enable
   input         slow_cmp_sync_en;  // io_cmp_sync_en from cluster header

   // Signal to isolate SPC from CCX
   output        core_isolate;      // Blocks requests to CCX
  
   // ********************************************************************
   // Scan reassigns
   // ********************************************************************
   assign        pce_ov = tcu_pce_ov;
   assign        stop   = lb_int_clk_stop; // this must be free-running
   assign 	 se     = scan_en;
   assign        siclk  = aclk;
   assign        soclk  = bclk;


   assign     clock_enable        =  lbist_start | lbcontrol_out[1] | lbist_done;

 `ifndef FPGA
   // synopsys translate_off
   spc_lb_ctll1clkhdr_ctl_macro lbist_clkgen 
     (.l2clk    (lbl2clk),
      .l1en     (clock_enable),
      .l1clk    (l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se) );
     
   // ********************************************************************
   // Buffer Clock for LBIST to flop headers & Add Staging Flop for
   // LBIST internal clock stop with its own Flop Header
   // ********************************************************************
   cl_u1_buf_4x lbist_clkbuf // instantiated at back-end request to 
     (.in       (l2clk),     //  isolate clock
      .out      (lbl2clk) );

   spc_lb_ctll1clkhdr_ctl_macro lbist_frclkgen 
     (.l2clk    (lbl2clk),
      .l1en     (1'b1),
      .stop     (1'b0),
      .l1clk    (frl1clk),
  .pce_ov(pce_ov),
  .se(se) ); // free-run clock only to clk_stop staging flop

   // synopsys translate_on
`endif
   spc_lb_ctlmsff_ctl_macro__width_1 lb_clkstop_reg 
   (
    .scan_in(lb_clkstop_reg_scanin),
    .scan_out(lb_clkstop_reg_scanout),
    .l1clk    (frl1clk),
    .din      (clk_stop),
    .dout     (lb_int_clk_stop),
  .siclk(siclk),
  .soclk(soclk) // internal clock stop
    );
   
   // ********************************************************************
   // Flop io_cmp_sync_en
   // ********************************************************************
   spc_lb_ctlmsff_ctl_macro__width_1 lb_iocmpsyncen_reg 
   (
    .scan_in(lb_iocmpsyncen_reg_scanin),
    .scan_out(lb_iocmpsyncen_reg_scanout),
    .l1clk    (l1clk_pm1),
    .din      (slow_cmp_sync_en),
    .dout     (io_cmp_sync_en_local),
  .siclk(siclk),
  .soclk(soclk) 
    );

   // ********************************************************************
   // Control Register
   // Drive lbist_pgm to prevent reset updates to registers, allows
   //  programmed values to be used instead of defaults
   // ********************************************************************
   spc_lb_ctlmsff_ctl_macro__width_5 lb_control_reg 
   (
    .scan_in(lb_control_reg_scanin),
    .scan_out(lb_control_reg_scanout),
    .l1clk    (l1clk_pm1),
    .din      (lbcontrol_new[4:0]),
    .dout     (lbcontrol_out[4:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
  
   // Generate reset, run signals off of start
   assign     lbcontrol_new[0]    =  io_cmp_sync_en_local  ?  lbist_start :   lbcontrol_out[0];
   assign     lbcontrol_new[1]    =  lbcontrol_out[0];
   assign     reset               =  lbcontrol_out[0]	   & ~lbcontrol_out[1];
   
   // Allow clk_stop to core to override lbist control of core_clk_stop for scan dumps
   assign     lbist_run           =  lbcontrol_out[1]      & ~lb_done     &  ~test_mode;// & ~clk_stop;

   // User drives this bit to use programmed values
   assign     lbcontrol_new[2]    =  lbist_pgm;
   assign     load_default        =  reset                 & ~lbcontrol_out[2]; 
   assign     load_pgm            =  reset                 &  lbcontrol_out[2]; 

   // bits [3] & [4] used for control
   assign     lbcontrol_new[3]	  =  reset                 ?  1'b0           
                                  :  capclk_done           ?  1'b1
                                  :  lbcontrol_out[3];
   assign     init_done           =  lbcontrol_out[1]      &  lbcontrol_out[3];
   assign     init_cycle          =  lbist_run             & ~init_done;

   assign     lbcontrol_new[4]	  =  reset                 ?  1'b0
                                  :  vect_count_equal & capture_mode  ? 1'b1
                                  :  lbcontrol_out[4];
   assign     vect_unload_done    =  lbcontrol_out[4];

   // ********************************************************************
   // Shift Counter
   // ********************************************************************
   spc_lb_ctlmsff_ctl_macro__width_15 lb_shftpgm_reg 
   (
    .scan_in(lb_shftpgm_reg_scanin),
    .scan_out(lb_shftpgm_reg_scanout),
    .l1clk    (l1clk_pm1),
    .din      (shft_pgm_new[14:0]),
    .dout     (shft_pgm_out[14:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   // Hard-coded default shift count equal to length of longest core scan chain during LBist 
   assign     shft_pgm_new[14:0]  =  load_default          ?  `SHFT_LENGTH
                                  :  shft_pgm_out[14:0];

   spc_lb_ctlmsff_ctl_macro__width_19 lb_shftcnt_reg 
   (
    .scan_in(lb_shftcnt_reg_scanin),
    .scan_out(lb_shftcnt_reg_scanout),
    .l1clk    (l1clk_pm1),
    .din      (shft_cnt_new[18:0]),
    .dout     (shft_cnt_out[18:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign     shft_cnt_new[18:0]  =  load_default          ?  {`SHFT_LENGTH,4'b0000}
                                  :  load_pgm              ?  {shft_pgm_out[14:0],4'b0000}
                                  :  shift_chains          ?  (shft_cnt_out[18:0] + 19'b1) 
                                  :  capclk_done           ?  19'b0
                                  :  shft_cnt_out[18:0];

   // 4 lsb's are used to generate and separate a, bclks during lbist 
   // to provide 7 cycles between aclk to bclk changes and bclk to aclk changes
   assign     shft_count_equal    =  (shft_cnt_out[18:4]  ==  shft_pgm_out[14:0]);
   assign     shift_chains        =  lbist_run             & ~shft_count_equal    & ~capclk_cycle;

   // ********************************************************************
   // Capture Clock Counter
   // ********************************************************************
   spc_lb_ctlmsff_ctl_macro__width_5 lb_capclkcnt_reg 
   (
    .scan_in(lb_capclkcnt_reg_scanin),
    .scan_out(lb_capclkcnt_reg_scanout),
    .l1clk    (l1clk_pm1),
    .din      (capclk_cnt_new[4:0]),
    .dout     (capclk_cnt_out[4:0]),
  .siclk(siclk),
  .soclk(soclk)
   );

   assign     capclk_cnt_new[4:0] =  reset                 ?  5'b10010 
                                  :  capclk_cycle          ?  (capclk_cnt_out[4:0] + 5'b1)
                                  :  capclk_cnt_out[4:0];

   assign     capclk_cycle        =  (shft_count_equal      |  (reset  & shft_count_equal)) & lbist_run;
   assign     capclk_done         =  (capclk_cnt_out[4:0] ==  5'b11111);

   // ********************************************************************
   // Vector Counter
   // ********************************************************************
   spc_lb_ctlmsff_ctl_macro__width_16 lb_vectpgm_reg 
   (
    .scan_in(lb_vectpgm_reg_scanin),
    .scan_out(lb_vectpgm_reg_scanout),
    .l1clk    (l1clk_pm1),
    .din      (vect_pgm_new[15:0]),
    .dout     (vect_pgm_out[15:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   // Hard-coded default vector count equal to 2^^15
   // msb used to indicate done 
   assign     vect_pgm_new[15:0]  =  load_default          ?  `VECT_COUNT
                                  :  vect_pgm_out[15:0];

   spc_lb_ctlmsff_ctl_macro__width_16 lb_vectorcnt_reg 
   (
    .scan_in(lb_vectorcnt_reg_scanin),
    .scan_out(lb_vectorcnt_reg_scanout),
    .l1clk    (l1clk_pm1),
    .din      (vect_cnt_new[15:0]),
    .dout     (vect_cnt_out[15:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   
   // Set vector count equal to number of vector patterns desired; user can define also
   assign     vect_count_equal    =  (vect_cnt_out[15:0]  ==  vect_pgm_out[15:0]);

   assign     vect_cnt_new[15:0]  =  reset                 ?  16'b0 
                                  :  increase_vect_cnt     ?  (vect_cnt_out[15:0] + 16'b1) 
                                  :  vect_cnt_out[15:0];

   assign     lb_done             =  (vect_cnt_out[15]     |  vect_unload_done)   &  lbcontrol_out[1];

   assign     increase_vect_cnt   =  lbist_run             &  capclk_done         &  ~init_cycle; 

   // ********************************************************************
   // Generate Scan Controls for Core 
   //  Logic BIST Mode: LBist drives signals
   //  Else: Signals sourced externally to Core
   // LBIST can't drive scan controls when test_mode driven 'high'
   // When clk_stop is 'high', lbist loses control of scan 
   // Note:
   //    Bclk, Scan_En and Clk_Stop are separated to insure minimum multi-cycle paths
   //    are met; bclk to scan_en = 3 cycles; scan_en to bclk = 3 cycles;
   //    bclk to clk_stop = 3 cycles; clk_stop to bclk = 1 cycle (clk_stop timed) 
   // ********************************************************************

   assign     core_clk_stop       = (lbist_run             &  lb_clk_stop)        |  clk_stop;
   assign     core_scan_en        =  lbist_run             ?  lb_scan_en          :  scan_en; 
   assign     core_scan_en_wmr    =  wmr_protect           ?  1'b0                :  core_scan_en; 
   assign     core_se_sc_in       =  lbist_run             ?  lb_scan_en          :  se_scancollar_in;
   assign     core_se_sc_out      =  lbist_run             ?  1'b1                :  se_scancollar_out;
   assign     core_awi            = (lbist_run             &  capclk_cycle)       |  array_wr_inhibit;

   // Clock stop occurs out of cluster header with 4-cycle latency
   assign     lb_clk_stop         = ~(capclk_cnt_out[4:0] ==  5'b10001)  // ~h11 to effect h15
                                  & ~(capclk_cnt_out[4:0] ==  5'b10010); // ~h12 to effect h16

   assign     core_aclk           =  lbist_run             ?  lb_aclk             :  aclk;
   assign     core_bclk           =  lbist_run             ?  lb_bclk             :  bclk;

   assign     lb_aclk             =  (shft_cnt_out[3:0]   ==  4'b0111); //  h7
   assign     lb_bclk             = ~(shft_cnt_out[3:0]   ==  4'b1111)  //  hF
                                  & ~(capclk_cnt_out[4:0] ==  5'b01110) // ~h0E
                                  & ~(capclk_cnt_out[4:0] ==  5'b01111) // ~h0F
                                  & ~(capclk_cnt_out[4:0] ==  5'b10000) // ~h10
                                  & ~(capclk_cnt_out[4:0] ==  5'b10001) // ~h11
                                  & ~(capclk_cnt_out[4:0] ==  5'b10010) // ~h12
                                  & ~(capclk_cnt_out[4:0] ==  5'b10011) // ~h13
                                  & ~(capclk_cnt_out[4:0] ==  5'b10100) // ~h14
                                  & ~(capclk_cnt_out[4:0] ==  5'b10101) // ~h15
                                  & ~(capclk_cnt_out[4:0] ==  5'b10110) // ~h16
                                  & ~(capclk_cnt_out[4:0] ==  5'b10111);// ~h17

   // Note: exit scan shift mode, first turn off scan_en, then turn off bclk
   assign     lb_scan_en          = ~(capclk_cnt_out[4:0] ==  5'b00111) // ~h07
                                  & ~(capclk_cnt_out[4:0] ==  5'b01000) // ~h08
                                  & ~(capclk_cnt_out[4:0] ==  5'b01001) // ~h09
                                  & ~(capclk_cnt_out[4:0] ==  5'b01010) // ~h0A
                                  & ~(capclk_cnt_out[4:0] ==  5'b01011) // ~h0B
                                  & ~(capclk_cnt_out[4:0] ==  5'b01100) // ~h0C
                                  & ~(capclk_cnt_out[4:0] ==  5'b01101) // ~h0D
                                  & ~(capclk_cnt_out[4:0] ==  5'b01110) // ~h0E
                                  & ~(capclk_cnt_out[4:0] ==  5'b01111) // ~h0F
                                  & ~(capclk_cnt_out[4:0] ==  5'b10000) // ~h10
                                  & ~(capclk_cnt_out[4:0] ==  5'b10001) // ~h11
                                  & ~(capclk_cnt_out[4:0] ==  5'b10010) // ~h12
                                  & ~(capclk_cnt_out[4:0] ==  5'b10011) // ~h13
                                  & ~(capclk_cnt_out[4:0] ==  5'b10100) // ~h14
                                  & ~(capclk_cnt_out[4:0] ==  5'b10101) // ~h15
                                  & ~(capclk_cnt_out[4:0] ==  5'b10110) // ~h16
                                  & ~(capclk_cnt_out[4:0] ==  5'b10111) // ~h17
                                  & ~(capclk_cnt_out[4:0] ==  5'b11000) // ~h18
                                  & ~(capclk_cnt_out[4:0] ==  5'b11001) // ~h19
                                  & ~(capclk_cnt_out[4:0] ==  5'b11010) // ~h1A
                                  & ~(capclk_cnt_out[4:0] ==  5'b11011) // ~h1B
                                  & ~(capclk_cnt_out[4:0] ==  5'b11100) // ~h1C
                                  & ~(capclk_cnt_out[4:0] ==  5'b11101) // ~h1D
                                  & ~(capclk_cnt_out[4:0] ==  5'b11110) // ~h1E
                                  & ~(capclk_cnt_out[4:0] ==  5'b11111);// ~h1F

   assign     capture_mode        = ~lb_aclk   & ~lb_bclk  & ~lb_scan_en  & ~lb_clk_stop; 

   // ********************************************************************
   // Psuedo-Random Pattern Generator - updates on bclk
   // ********************************************************************
   spc_lb_ctlmsff_ctl_macro__width_24 lb_prpg_reg 
   (
    .scan_in(lb_prpg_reg_scanin),
    .scan_out(lb_prpg_reg_scanout),
    .l1clk    (l1clk_pm1),
    .din      (prpg_new[23:0]),
    .dout     (prpg_out[23:0]),
  .siclk(siclk),
  .soclk(soclk)
   );

   // Hard-coded default Seed can be overridden; Seed must not be zero
   assign     prpg_new[23:0]      =  load_default          ?  `PRPG_SEED
                                  :  load_pgm              ?  prpg_out[23:0]
                                  :  prpg_run              ?  prpg_calc[23:0]
                                  :  prpg_out[23:0];

   // f(x) = x^^24 + x^^7 + x^^2 + x^^1 + 1
   assign     prpg_calc[23]       =  prpg_xor7_out;
   assign     prpg_calc[22:0]     =  prpg_out[23:1];

   assign     prpg_xor7_out       =  prpg_out[7]           ^  prpg_xor2_out;
   assign     prpg_xor2_out       =  prpg_out[2]           ^  prpg_xor1_out;
   assign     prpg_xor1_out       =  prpg_out[1]           ^  prpg_out[0];

   assign     prpg_run            = ~core_bclk             &  lbist_run           
                                  &  init_done             & ~capclk_cycle;

   // ********************************************************************
   // Pattern Compactor - updates on aclk
   // ********************************************************************
   spc_lb_ctlmsff_ctl_macro__width_24 lb_misr_reg 
   (
    .scan_in(lb_misr_reg_scanin),
    .scan_out(lb_misr_reg_scanout),
    .l1clk    (l1clk_pm1),
    .din      (misr_new[23:0]),
    .dout     (misr_out[23:0]),
  .siclk(siclk),
  .soclk(soclk)
   );

   assign     misr_new[23:0]      =  reset                 ?  24'b0
                                  :  misr_run              ?  misr_calc[23:0]
                                  :  misr_out[23:0];

   assign     misr_run            =  core_aclk             &  lbist_run
                                  &  init_done             & ~capclk_cycle
                                  &  (|(vect_cnt_out[15:0]));

   // f(x) = x^^24 + x^^7 + x^^2 + x^^1 + 1
   assign     misr_calc[23]       =  misr_xor7_out;
   assign     misr_calc[22:16]    =  misr_out[23:17];
   assign     misr_calc[15]       =  misr_out[16]          ^  misr_ch[15];
   assign     misr_calc[14]       =  misr_out[15]          ^  misr_ch[14];
   assign     misr_calc[13]       =  misr_out[14]          ^  misr_ch[13];
   assign     misr_calc[12]       =  misr_out[13]          ^  misr_ch[12];
   assign     misr_calc[11]       =  misr_out[12]          ^  misr_ch[11];
   assign     misr_calc[10]       =  misr_out[11]          ^  misr_ch[10];
   assign     misr_calc[9]        =  misr_out[10]          ^  misr_ch[9];
   assign     misr_calc[8]        =  misr_out[9]           ^  misr_ch[8];
   assign     misr_calc[7]        =  misr_out[8]           ^  misr_ch[7];
   assign     misr_calc[6]        =  misr_out[7]           ^  misr_ch[6];
   assign     misr_calc[5]        =  misr_out[6]           ^  misr_ch[5];
   assign     misr_calc[4]        =  misr_out[5]           ^  misr_ch[4];
   assign     misr_calc[3]        =  misr_out[4]           ^  misr_ch[3];
   assign     misr_calc[2]        =  misr_out[3]           ^  misr_ch[2];
   assign     misr_calc[1]        =  misr_out[2]           ^  misr_ch[1];
   assign     misr_calc[0]        =  misr_out[1]           ^  misr_ch[0];

   assign     misr_xor7_out       =  misr_out[7]           ^  misr_xor2_out;
   assign     misr_xor2_out       =  misr_out[2]           ^  misr_xor1_out;
   assign     misr_xor1_out       =  misr_out[1]           ^  misr_out[0];

   // ********************************************************************
   // Drive Channels to Core
   // ********************************************************************
   // These feed the scan_in of the channels in the core
   // Outputs to Core Scan Chains (16 Channels + mbist)
   // Channel 15 is the warm reset protected scan-out from the SPC
// assign     channel_si[15]      =  lbist_run             ?  prpg_out[15]        :  1'b0;
// assign     channel_si[14]      =  lbist_run             ?  prpg_out[14]        :  io_si[1];
   assign     channel_si[15]      =  lbist_run             ?  prpg_out[15]        :  io_si[1];
   assign     channel_si[14]      =  lbist_run             ?  prpg_out[14]        :  wmr_protect ? 1'b0 : channel_so[15];
   assign     channel_si[13]      =  lbist_run             ?  prpg_out[13]        :  channel_so[14];
   assign     channel_si[12]      =  lbist_run             ?  prpg_out[12]        :  channel_so[13];
   assign     channel_si[11]      =  lbist_run             ?  prpg_out[11]        :  channel_so[12]; 
   assign     channel_si[10]      =  lbist_run             ?  prpg_out[10]        :  channel_so[11]; 
   assign     channel_si[9]       =  lbist_run             ?  prpg_out[9]         :  channel_so[10]; 
   assign     channel_si[8]       =  lbist_run             ?  prpg_out[8]         :  channel_so[9];
   assign     channel_si[7]       =  lbist_run             ?  prpg_out[7]         :  channel_so[8]; 
   assign     channel_si[6]       =  lbist_run             ?  prpg_out[6]         :  channel_so[7];
   assign     channel_si[5]       =  lbist_run             ?  prpg_out[5]         :  channel_so[6]; 
   assign     channel_si[4]       =  lbist_run             ?  prpg_out[4]         :  channel_so[5];
   assign     channel_si[3]       =  lbist_run             ?  prpg_out[3]         :  io_si[0]; 
   assign     channel_si[2]       =  lbist_run             ?  prpg_out[2]         :  channel_so[3];
   assign     channel_si[1]       =  lbist_run             ?  prpg_out[1]         :  channel_so[2];
   assign     channel_si[0]       =  lbist_run             ?  prpg_out[0]         :  channel_so[1];
   assign     mb_channel_si       =  lbist_run             ?  channel_so[0]       :  mbist_si;

   // ********************************************************************
   // Receive Channels from Core
   // ********************************************************************
   // Inputs from Core Scan Chains (16 Channels + mbist)

   // 0in known_driven -var (channel_so[15:0] & ~ch_byp[15:0]) -clock l2clk -active misr_run -group zin_core_lbist  -message "LBIST : X's detected on channel_so"

   assign     misr_ch[15]         =  channel_so[15]        & ~ch_byp[15];
   assign     misr_ch[14]         =  channel_so[14]        & ~ch_byp[14];
   assign     misr_ch[13]         =  channel_so[13]        & ~ch_byp[13];
   assign     misr_ch[12]         =  channel_so[12]        & ~ch_byp[12];
   assign     misr_ch[11]         =  channel_so[11]        & ~ch_byp[11];  
   assign     misr_ch[10]         =  channel_so[10]        & ~ch_byp[10];
   assign     misr_ch[9]          =  channel_so[9]         & ~ch_byp[9];
   assign     misr_ch[8]          =  channel_so[8]         & ~ch_byp[8];
   assign     misr_ch[7]          =  channel_so[7]         & ~ch_byp[7];
   assign     misr_ch[6]          =  channel_so[6]         & ~ch_byp[6];
   assign     misr_ch[5]          =  channel_so[5]         & ~ch_byp[5];
   assign     misr_ch[4]          =  channel_so[4]         & ~ch_byp[4];
   assign     misr_ch[3]          =  channel_so[3]         & ~ch_byp[3];
   assign     misr_ch[2]          =  channel_so[2]         & ~ch_byp[2];
   assign     misr_ch[1]          =  channel_so[1]         & ~ch_byp[1];
   assign     misr_ch[0]          =  mb_channel_so         & ~ch_byp[0];


   assign     io_so[1]            = channel_so[4]; 
   assign     io_so[0]            = channel_so[0];
   assign     mbist_so            = mb_channel_so;
   
   // ********************************************************************
   // Pattern Disable & Channel Bypass
   // ********************************************************************
   spc_lb_ctlmsff_ctl_macro__width_16 lb_cb_reg 
   (
    .scan_in(lb_cb_reg_scanin),
    .scan_out(lb_cb_reg_scanout),
    .l1clk    (l1clk_pm1),
    .din      (cb_new[15:0]),
    .dout     (cb_out[15:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   // Default is no channel bypass (16'b0)
   assign     cb_new[15:0]        =  load_default          ?  `CH_BYP
                                  :  load_pgm              ?  cb_out[15:0]
                                  :  cb_out[15:0];
   assign     ch_byp[15:0]        =  cb_out[15:0];

   // ********************************************************************
   // Generate LBist Done on IO Clock Domain
   // ********************************************************************
   spc_lb_ctlmsff_ctl_macro__en_1__width_1 lb_done_reg 
   (
    .scan_in(lb_done_reg_scanin),
    .scan_out(lb_done_reg_scanout),
    .l1clk    (l1clk_pm1),
    .en       (io_cmp_sync_en_local),
    .din      (lb_done),
    .dout     (lbist_done),
  .siclk(siclk),
  .soclk(soclk)
   );

   // ********************************************************************
   // Signal to isolate SPC from CCX; Blocks requests to CCX
   //  during either ATPG or JTAG scan, or during LBIST
   // ********************************************************************
   assign     core_isolate       =   scan_en               |  lbist_run;

   spc_lb_ctlspare_ctl_macro__num_3 spare  
   (
    .l1clk    (l1clk_pm1     ),
    .scan_in  (spare_scanin  ),
    .scan_out (spare_scanout ),
  .siclk(siclk),
  .soclk(soclk)
   );

// fixscan start:lb_clkstop_reg_scanin
assign lb_clkstop_reg_scanin     = scan_in                  ;
assign lb_iocmpsyncen_reg_scanin = lb_clkstop_reg_scanout   ;
assign lb_control_reg_scanin     = lb_iocmpsyncen_reg_scanout ;
assign lb_shftpgm_reg_scanin     = lb_control_reg_scanout   ;
assign lb_shftcnt_reg_scanin     = lb_shftpgm_reg_scanout   ;
assign lb_capclkcnt_reg_scanin   = lb_shftcnt_reg_scanout   ;
assign lb_vectpgm_reg_scanin     = lb_capclkcnt_reg_scanout ;
assign lb_vectorcnt_reg_scanin   = lb_vectpgm_reg_scanout   ;
assign lb_prpg_reg_scanin        = lb_vectorcnt_reg_scanout ;
assign lb_misr_reg_scanin        = lb_prpg_reg_scanout      ;
assign lb_cb_reg_scanin          = lb_misr_reg_scanout      ;
assign lb_done_reg_scanin        = lb_cb_reg_scanout        ;
assign spare_scanin              = lb_done_reg_scanout      ;
assign scan_out                  = spare_scanout            ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module spc_lb_ctll1clkhdr_ctl_macro (
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

module spc_lb_ctlmsff_ctl_macro__width_1 (
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

module spc_lb_ctlmsff_ctl_macro__width_5 (
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

module spc_lb_ctlmsff_ctl_macro__width_15 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [14:0] fdin;
wire [13:0] so;

  input [14:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [14:0] dout;
  output scan_out;
assign fdin[14:0] = din[14:0];






dff #(15)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[14:0]),
.si({scan_in,so[13:0]}),
.so({so[13:0],scan_out}),
.q(dout[14:0])
);












endmodule













// any PARAMS parms go into naming of macro

module spc_lb_ctlmsff_ctl_macro__width_19 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [18:0] fdin;
wire [17:0] so;

  input [18:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [18:0] dout;
  output scan_out;
assign fdin[18:0] = din[18:0];






dff #(19)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[18:0]),
.si({scan_in,so[17:0]}),
.so({so[17:0],scan_out}),
.q(dout[18:0])
);












endmodule













// any PARAMS parms go into naming of macro

module spc_lb_ctlmsff_ctl_macro__width_16 (
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

module spc_lb_ctlmsff_ctl_macro__width_24 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = din[23:0];






dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);












endmodule













// any PARAMS parms go into naming of macro

module spc_lb_ctlmsff_ctl_macro__en_1__width_1 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module spc_lb_ctlspare_ctl_macro__num_3 (
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

