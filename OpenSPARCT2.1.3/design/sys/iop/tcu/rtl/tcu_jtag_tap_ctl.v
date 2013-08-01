// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_jtag_tap_ctl.v
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
`define TAP_RESET       4'hF 
`define TAP_CAP_IR      4'hE
`define TAP_UPDATE_IR   4'hD
`define TAP_RTI         4'hC
`define TAP_PAUSE_IR    4'hB
`define TAP_SHIFT_IR    4'hA
`define TAP_EXIT1_IR    4'h9
`define TAP_EXIT2_IR    4'h8
`define TAP_SEL_DR      4'h7
`define TAP_CAP_DR      4'h6
`define TAP_UPDATE_DR   4'h5
`define TAP_SEL_IR      4'h4
`define TAP_PAUSE_DR    4'h3
`define TAP_SHIFT_DR    4'h2
`define TAP_EXIT1_DR    4'h1
`define TAP_EXIT2_DR    4'h0

//*****************************
// JTAG IDCODE - bits 27:1 need to be UPDATED
//   31:28 = jtag_id[3:0]           Version     = 4 bits   
//   27:12 = 0bxxxx_xxxx_xxxx_xxxx  Part Number = 16 bits 
//   11:1  = 0b000_0011_1110        Manuf. Id.  = 11 bits; Sun=0x03e
//      0  = 1'b1           lsb is constant one = 1 bit
//*****************************
`define PART_ID        16'h2aaa
`define MANUF_ID       11'h3e

//*****************************
// JTAG Instruction Opcodes
//*****************************

`define TAP_EXTEST            8'h00
`define TAP_BYPASS            8'hff
`define TAP_IDCODE            8'h01
`define TAP_SAMPLE_PRELOAD    8'h02
`define TAP_HIGHZ             8'h03
`define TAP_CLAMP             8'h04
`define TAP_EXTEST_PULSE      8'h05
`define TAP_EXTEST_TRAIN      8'h06

`define TAP_CREG_ADDR         8'h08
`define TAP_CREG_WDATA        8'h09
`define TAP_CREG_RDATA        8'h0a
`define TAP_CREG_SCRATCH      8'h0b
`define TAP_NCU_WR            8'h0c
`define TAP_NCU_RD            8'h0d
`define TAP_NCU_WADDR         8'h0e
`define TAP_NCU_WDATA         8'h0f
`define TAP_NCU_RADDR         8'h10

`define TAP_SERSCAN           8'h80
`define TAP_CHAINSEL          8'h81
`define TAP_MT_ACCESS         8'h82
`define TAP_MT_CLEAR          8'h83
`define TAP_MT_SCAN           8'h84

`define TAP_TP_ACCESS         8'h88
`define TAP_TP_CLEAR          8'h89

`define TAP_FUSE_READ         8'h28
`define TAP_FUSE_BYPASS_DATA  8'h29
`define TAP_FUSE_BYPASS       8'h2a
`define TAP_FUSE_ROW_ADDR     8'h2b
`define TAP_FUSE_COL_ADDR     8'h2c
`define TAP_FUSE_READ_MODE    8'h2d
`define TAP_FUSE_DEST_SAMPLE  8'h2e
`define TAP_FUSE_RVCLR        8'h2f

`define TAP_MBIST_CLKSTPEN    8'h13
`define TAP_MBIST_BYPASS      8'h14
`define TAP_MBIST_MODE        8'h15
`define TAP_MBIST_START       8'h16
`define TAP_MBIST_RESULT      8'h18
`define TAP_MBIST_DIAG        8'h19
`define TAP_MBIST_GETDONE     8'h1a
`define TAP_MBIST_GETFAIL     8'h1b
`define TAP_DMO_ACCESS        8'h1c
`define TAP_DMO_CLEAR         8'h1d
`define TAP_DMO_CONFIG        8'h1e
`define TAP_MBIST_ABORT       8'h1f

`define TAP_SPC_SHSCAN        5'b00110
`define TAP_SPCTHR0_SHSCAN    8'h30
`define TAP_SPCTHR1_SHSCAN    8'h31
`define TAP_SPCTHR2_SHSCAN    8'h32
`define TAP_SPCTHR3_SHSCAN    8'h33
`define TAP_SPCTHR4_SHSCAN    8'h34
`define TAP_SPCTHR5_SHSCAN    8'h35
`define TAP_SPCTHR6_SHSCAN    8'h36
`define TAP_SPCTHR7_SHSCAN    8'h37
`define TAP_L2T_SHSCAN        8'h38

`define TAP_CLOCK_SSTOP       8'h40
`define TAP_CLOCK_HSTOP       8'h41
`define TAP_CLOCK_START       8'h42
`define TAP_CLOCK_DOMAIN      8'h43
`define TAP_CLOCK_STATUS      8'h44
`define TAP_CLKSTP_DELAY      8'h45
`define TAP_CORE_SELECT       8'h46

`define TAP_DE_COUNT          8'h48
`define TAP_CYCLE_COUNT       8'h49
`define TAP_TCU_DCR           8'h4A
`define TAP_CORE_RUN_STATUS   8'h4C
`define TAP_DOSS_ENABLE       8'h4D
`define TAP_DOSS_MODE         8'h4E
`define TAP_SS_REQUEST        8'h4F

`define TAP_DOSS_STATUS       8'h50
`define TAP_CS_MODE           8'h51
`define TAP_CS_STATUS         8'h52

`define TAP_L2_ADDR           8'h58
`define TAP_L2_WRDATA         8'h59
`define TAP_L2_WR             8'h5A
`define TAP_L2_RD             8'h5B

`define TAP_LBIST_START       8'h60
`define TAP_LBIST_BYPASS      8'h61
`define TAP_LBIST_MODE        8'h62
`define TAP_LBIST_ACCESS      8'h63
`define TAP_LBIST_GETDONE     8'h64
`define TAP_LBIST_ABORT       8'h65

`define TAP_STCI_ACCESS       8'h90
`define TAP_STCI_CLEAR        8'h91

`define TAP_JTPOR_ACCESS      8'hA0
`define TAP_JTPOR_CLEAR       8'hA1
`define TAP_JTPOR_STATUS      8'hA2
`define TAP_SCKBYP_ACCESS     8'hA3
`define TAP_SCKBYP_CLEAR      8'hA4




module tcu_jtag_tap_ctl (
  io_tdi, 
  io_tms, 
  io_tck, 
  io_trst_l, 
  jtag_dr_tdo, 
  ext_dr_tdo, 
  bypass_sel, 
  ext_jtag_instr, 
  tap_tdo, 
  tap_tdo_en, 
  tap_state, 
  instr, 
  next_instr, 
  capture_dr_state, 
  shift_dr_state, 
  update_dr_state, 
  update_ireg, 
  tlr_state, 
  tap_scan_in, 
  siclk, 
  soclk, 
  tcu_jtag_se, 
  tap_scan_out);
wire tck_l;
wire l1en;
wire pce_ov;
wire stop;
wire se;
wire l1tck;
wire tap_state_reg_scanin;
wire tap_state_reg_scanout;
wire [3:0] tap_next_state_l;
wire [3:0] tap_state_l;
wire [3:0] tap_next_state;
wire capture_ir_state;
wire shift_ir_state;
wire update_ir_state;
wire shift_exit1_dr_state;
wire [7:0] tap_instr_reg_scanin;
wire [7:0] tap_instr_reg_scanout;
wire [0:0] next_instr_l;
wire [0:0] instr_l;
wire [7:0] instr_q;
wire tap_instr_reg_scanout_l;
wire ireg_tdo;
wire bypass_reg_scanin;
wire bypass_reg_scanout;
wire next_tdi_bypass;
wire bypass_tdo;
wire next_tdo;
wire bypass_ll_reg_scanin;
wire bypass_ll_reg_scanout_unused;
wire int_dr_tdo;
wire tdo_enable_reg_scanin;
wire tdo_enable_reg_scanout_unused;
wire next_tdo_en;
wire tdo_en;
wire tlr_state_reg_scanin;
wire tlr_state_reg_scanout;
wire tap_next_tlr_l;
wire tlr_out_l;

   //inputs
   input       io_tdi;
   input       io_tms;
   input       io_tck;
   input       io_trst_l;
   input       jtag_dr_tdo; // scan-outs from jtag internal data regs
   input       ext_dr_tdo;  // scan-outs from data regs external to jtag
   input       bypass_sel;  // indicates an instr. will use the bypass reg.
   input       ext_jtag_instr;
   //outputs
   output      tap_tdo;
   output      tap_tdo_en;
   output [3:0] tap_state;   // output [15:0] jtag_sm_state;
   output [7:0] instr;
   output [7:0] next_instr;
   output 	capture_dr_state;
   output 	shift_dr_state;
   output 	update_dr_state;
   output 	update_ireg;
   output       tlr_state;

   //scan
   input 	tap_scan_in;
   input 	siclk; 
   input 	soclk;
   input 	tcu_jtag_se;
   output 	tap_scan_out;

   //assign 	 tck   =  io_tck; 
   assign 	 tck_l = ~io_tck;

      // Scan reassigns
   assign 	 l1en   = 1'b1; // this is "ce" or "pce"   
   assign        pce_ov = 1'b1;
   assign        stop   = 1'b0;
   assign 	 se     = tcu_jtag_se;
   
   tcu_jtag_tap_ctl_l1clkhdr_ctl_macro tap_clkgen 
     (
      .l2clk  (io_tck),
      .l1clk  (l1tck  ),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
      );

   ////////////////////////////////////////////////////////////////////////
   // TAP State Machine
   ////////////////////////////////////////////////////////////////////////
   
   //register bank to store TAP state; these will change to reset flops when available
   tcu_jtag_tap_ctl_msff_ctl_macro__jtag_1__width_4 tap_state_reg  
   (
    .scan_in  (tap_state_reg_scanin),
    .scan_out (tap_state_reg_scanout),
    .l1clk    (l1tck),			       
    .updateclk (l1tck),
    .reset    (~io_trst_l),
    .din      (tap_next_state_l[3:0]), 
    .dout     (tap_state_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)       
   );
   //inverting because of reset value, to allow flush of zeros
   assign      tap_next_state_l[3:0] = ~tap_next_state[3:0];
   assign      tap_state        = ~tap_state_l;
   

   //tap states (tap_state[3:0]) mapped to common industry usage
   // - see jtag.h include file   
   reg [3:0] 	 next_state;
   always @ (tap_state or io_tms) begin
      case (tap_state)
      	`TAP_RESET: begin
           if (io_tms) next_state[3:0] = `TAP_RESET;
           else        next_state[3:0] = `TAP_RTI;
      	end
      	`TAP_RTI: begin
           if (io_tms) next_state[3:0] = `TAP_SEL_DR;
           else        next_state[3:0] = `TAP_RTI;
      	end
      	`TAP_SEL_DR: begin
           if (io_tms) next_state[3:0] = `TAP_SEL_IR;
           else        next_state[3:0] = `TAP_CAP_DR;
      	end
      	`TAP_CAP_DR: begin
           if (io_tms) next_state[3:0] = `TAP_EXIT1_DR;
           else        next_state[3:0] = `TAP_SHIFT_DR;
      	end
      	`TAP_SHIFT_DR: begin
           if (io_tms) next_state[3:0] = `TAP_EXIT1_DR;
           else        next_state[3:0] = `TAP_SHIFT_DR;
      	end
      	`TAP_EXIT1_DR: begin
           if (io_tms) next_state[3:0] = `TAP_UPDATE_DR;
           else        next_state[3:0] = `TAP_PAUSE_DR;
      	end
      	`TAP_PAUSE_DR: begin
           if (io_tms) next_state[3:0] = `TAP_EXIT2_DR;
           else        next_state[3:0] = `TAP_PAUSE_DR;
      	end
      	`TAP_EXIT2_DR: begin
           if (io_tms) next_state[3:0] = `TAP_UPDATE_DR;
           else        next_state[3:0] = `TAP_SHIFT_DR;
      	end
      	`TAP_UPDATE_DR: begin
           if (io_tms) next_state[3:0] = `TAP_SEL_DR;
           else        next_state[3:0] = `TAP_RTI;
      	end
      	`TAP_SEL_IR: begin
           if (io_tms) next_state[3:0] = `TAP_RESET;
           else        next_state[3:0] = `TAP_CAP_IR;
      	end
      	`TAP_CAP_IR: begin
           if (io_tms) next_state[3:0] = `TAP_EXIT1_IR;
           else        next_state[3:0] = `TAP_SHIFT_IR;
      	end
      	`TAP_SHIFT_IR:  begin
           if (io_tms) next_state[3:0] = `TAP_EXIT1_IR;
           else        next_state[3:0] = `TAP_SHIFT_IR;
      	end
      	`TAP_EXIT1_IR:  begin
           if (io_tms) next_state[3:0] = `TAP_UPDATE_IR;
           else        next_state[3:0] = `TAP_PAUSE_IR;
      	end
      	`TAP_PAUSE_IR:  begin
           if (io_tms) next_state[3:0] = `TAP_EXIT2_IR;
           else        next_state[3:0] = `TAP_PAUSE_IR;
      	end
      	`TAP_EXIT2_IR:  begin
           if (io_tms) next_state[3:0] = `TAP_UPDATE_IR;
           else        next_state[3:0] = `TAP_SHIFT_IR;
      	end
      	`TAP_UPDATE_IR: begin
           if (io_tms) next_state[3:0] = `TAP_SEL_DR;
           else        next_state[3:0] = `TAP_RTI;
      	end
      	default: next_state[3:0] = 4'b1111;
      endcase
   end 

   // implement asynchronous reset 
   // --do this until we get reset flops in library
   assign 	 tap_next_state = io_trst_l ? next_state[3:0] : 4'hF;

   ////////////////////////////////////////////////////////////////////////
   // Signals to indicate specific tap states
   ////////////////////////////////////////////////////////////////////////
   assign 	 capture_dr_state     = (tap_state[3:0] == `TAP_CAP_DR);
   assign 	 shift_dr_state       = (tap_state[3:0] == `TAP_SHIFT_DR);
   //assign 	 pause_dr_state       = (tap_state[3:0] == `TAP_PAUSE_DR);
   assign 	 update_dr_state      = (tap_state[3:0] == `TAP_UPDATE_DR);
   assign 	 capture_ir_state     = (tap_state[3:0] == `TAP_CAP_IR);
   assign 	 shift_ir_state       = (tap_state[3:0] == `TAP_SHIFT_IR);
   assign 	 update_ir_state      = (tap_state[3:0] == `TAP_UPDATE_IR);
   assign 	 shift_exit1_dr_state = (tap_state[3:0] == `TAP_SHIFT_DR) | 
   				  (tap_state[3:0] == `TAP_EXIT1_DR);
   //assign 	 shift_exit2_dr_state = (tap_state[3:0] == `TAP_SHIFT_DR) | 
   //				  (tap_state[3:0] == `TAP_EXIT2_DR);
   //assign 	 cap_shift_dr_state   = (tap_state[3:0] == `TAP_CAP_DR) | 
   //					    (tap_state[3:0] == `TAP_SHIFT_DR);
   //assign 	 tlr_state            = 1'b1; //(tap_state[3:0] == `TAP_RESET); // TLR ECO
   
   //// ClockDR signal to boundary scan logic - this will change when bscan
   ////  clocking is finalized?
   //msff_ctl_macro clock_dr_reg (width=1) 
   //(
   // .scan_in  (clock_dr_reg_scanin),
   // .scan_out (clock_dr_reg_scanout),
   // .l1clk    (tck_l),			       
   // .din      (cap_shift_dr_state), 
   // .dout     (pre_clock_dr)       
   //);
   //
   //assign 	 clock_dr = pre_clock_dr & tck;
   
   ////////////////////////////////////////////////////////////////////////
   // Instruction Register
   ////////////////////////////////////////////////////////////////////////
/*
   // this is the instruction SHIFT register; separate lsb out of grouping
   //  when trst_l used?
   msff_ctl_macro tap_instr_shift_reg (width=8) 
   (
    .scan_in  (tap_instr_shift_reg_scanin),
    .scan_out (tap_instr_shift_reg_scanout),
    .l1clk    (l1tck),			       
    .din      ({next_new_instr[7:1],next_new_instr_l[0]}), 
    .dout     ({new_instr[7:1],     new_instr_l[0]})       
   );

   // Invert these so during capture_ir state, 1 is effectively put in lsb
   //  - this also allows flush of 0's to put IDCODE into shift IReg 
   assign 	 new_instr[0]        = ~new_instr_l[0];
   assign 	 next_new_instr_l[0] = ~next_new_instr[0];

   // this perfoms shift of IReg, and gets IDCODE during capIR 
   assign 	 next_new_instr[7:0] = shift_ir_state ? {io_tdi, new_instr[7:1]} 
		                       : capture_ir_state ? 8'b00000001 : new_instr[7:0];
   // this is TDO output of shift IReg
   assign 	 ireg_tdo = new_instr[0];

   // this is the instruction UPDATE register - gets tck_l
   // - it needs to load IDCODE instr. during TLR state, and asynchronously during trst_l
   msff_ctl_macro tap_instr_upd_reg (width=8) 
   (
    .scan_in  (tap_instr_upd_reg_scanin),
    .scan_out (tap_instr_upd_reg_scanout_unused),
    .l1clk    (tck_l),			       
    .din      ({next_instr[7:1],next_instr_l[0]}), 
    .dout     ({instr[7:1],instr_l[0]})       
   );
   
   // Invert these so during test-logic-reset state, 1 is effectively put in lsb
   //  - this also allows flush of 0's to put IDCODE into update IReg 
   assign 	 instr[0]        = ~instr_l[0];
   assign 	 next_instr_l[0] = ~next_instr[0];

   // this puts IDCODE in during TLR state, and new instr. during update_IR
   assign 	 next_instr[7:0] = update_ir_state ? new_instr[7:0] 
		                   : tlr_state ? 8'b00000001 : instr[7:0];
*/

   tcu_jtag_tap_ctl_msff_ctl_macro__fs_1__jtag_1__width_8 tap_instr_reg  
   (
    .scan_in  (tap_instr_reg_scanin[7:0]),
    .scan_out (tap_instr_reg_scanout[7:0]),
    .l1clk    (l1tck),
    .updateclk (update_ireg),
    .reset    (~io_trst_l),
    .din      ({next_instr[7:1],next_instr_l[0]}), 
    .dout     ({instr[7:1],instr_l[0]}),
  .siclk(siclk),
  .soclk(soclk)       
   );
   assign 	 instr[0]        = ~instr_l[0];
   assign 	 next_instr_l[0] = ~next_instr[0];

   assign        instr_q[7:0]  = {tap_instr_reg_scanout[7], tap_instr_reg_scanout[6],
                                  tap_instr_reg_scanout[5], tap_instr_reg_scanout[4],
                                  tap_instr_reg_scanout[3], tap_instr_reg_scanout[2],
                                  tap_instr_reg_scanout[1], tap_instr_reg_scanout_l};
   assign        tap_instr_reg_scanout_l = ~tap_instr_reg_scanout[0];

   assign 	 next_instr[7:0] = shift_ir_state   ? {io_tdi, instr_q[7:1]} 
		                 : capture_ir_state ? 8'b00000001 
		                 : tlr_state ? 8'b00000001 : instr_q[7:0];
   // TLR ECO
// assign        update_ireg     = ~l1tck & (update_ir_state | tlr_state) &  io_trst_l;
   assign        update_ireg     = ~l1tck & (tap_state[3] & tap_state[2] & tap_state[0]) &  io_trst_l;
   //assign        update_ireg     = ~l1tck & (update_ir_state | 1'b0     ) &  io_trst_l;

   // this is TDO output of IReg
 //assign 	 ireg_tdo = instr[0];
   assign 	 ireg_tdo =  tap_instr_reg_scanout_l;


   ////////////////////////////////////////////////////////////////////////
   // Bypass Register
   ////////////////////////////////////////////////////////////////////////

   // bypass register
   // - needs to load 0 at tck rising in capDR when bypass selected
   // - does not need trst_l
   tcu_jtag_tap_ctl_msff_ctl_macro__width_1 bypass_reg  
   (
    .scan_in  (bypass_reg_scanin),
    .scan_out (bypass_reg_scanout),
    .l1clk    (l1tck),			       
    .din      (next_tdi_bypass), 
    .dout     (bypass_tdo),
  .siclk(siclk),
  .soclk(soclk)       
   );
   // shift for bypass register
   assign 	 next_tdi_bypass = (bypass_sel & shift_dr_state) ? io_tdi 
		                   : (bypass_sel & capture_dr_state) ? 1'b0 : bypass_tdo;
   // muxing for ireg, bypass reg, or other jtag internal data registers through tdo path
   assign 	 next_tdo = shift_ir_state ? ireg_tdo 
	                    : bypass_sel ? bypass_tdo : jtag_dr_tdo;
   
   // lockup latch for bypass register
   // - does not need trst_l, but can use it
   // - this is not needed since we use non-overlapping a/b clocks
   tcu_jtag_tap_ctl_msff_ctl_macro__width_1 bypass_ll_reg 
   (
    .scan_in  (bypass_ll_reg_scanin),
    .scan_out (bypass_ll_reg_scanout_unused),
    .l1clk    (tck_l),			       
    .din      (next_tdo), 
    .dout     (int_dr_tdo),
  .siclk(siclk),
  .soclk(soclk)       
   );
   assign 	 tap_tdo = (ext_jtag_instr & shift_exit1_dr_state) ? ext_dr_tdo : int_dr_tdo;
   
   //assign 	 tap_tdo = next_tdo;
   
   // lockup latch for tdo enable signal to I/O frame
   // - does not need trst_l, but can use it
   tcu_jtag_tap_ctl_msff_ctl_macro__jtag_1__width_1 tdo_enable_reg 
   (
    .scan_in  (tdo_enable_reg_scanin),
    .scan_out (tdo_enable_reg_scanout_unused),
    .l1clk    (tck_l),			       
    .updateclk (tck_l),
    .reset    (~io_trst_l),
    .din      (next_tdo_en), 
    .dout     (tdo_en),
  .siclk(siclk),
  .soclk(soclk)       
   );
   // TLR ECO
   //assign 	 next_tdo_en = tlr_state ? 1'b0 : (shift_dr_state | shift_ir_state);
   assign        next_tdo_en = shift_dr_state | shift_ir_state;
   assign 	 tap_tdo_en = tdo_en & ~tlr_state;

   ////////////////////////////////////////////////////////////////////////
   // Extra State-Machine Flop for TEST_LOGIC_RESET State
   // TLR ECO
   ////////////////////////////////////////////////////////////////////////
   
   //This flop serves as a single-bit source for the tlr_state signal
   tcu_jtag_tap_ctl_msff_ctl_macro__jtag_1__width_1 tlr_state_reg  
   (
    .scan_in  (tlr_state_reg_scanin),
    .scan_out (tlr_state_reg_scanout),
    .l1clk    (l1tck),
    .updateclk (l1tck),
    .reset    (~io_trst_l),
    .din      (tap_next_tlr_l), 
    .dout     (tlr_out_l),
  .siclk(siclk),
  .soclk(soclk) 
   );
   //inverting because of reset value, to allow flush of zeros
   assign      tap_next_tlr_l =   tap_next_state_l[3] | tap_next_state_l[2]
                                | tap_next_state_l[1] | tap_next_state_l[0];
   assign      tlr_state      = ~tlr_out_l;
	       
   // fixscan start
   assign 	 tlr_state_reg_scanin          = tap_scan_in  ;
   assign 	 tap_state_reg_scanin        = tlr_state_reg_scanout  ;
   //assign 	 tap_state_reg_scanin        = tap_scan_in  ;
   assign 	 tap_instr_reg_scanin[7]     = tap_state_reg_scanout;
   assign 	 tap_instr_reg_scanin[6]     = tap_instr_reg_scanout[7];
   assign 	 tap_instr_reg_scanin[5]     = tap_instr_reg_scanout[6];
   assign 	 tap_instr_reg_scanin[4]     = tap_instr_reg_scanout[5];
   assign 	 tap_instr_reg_scanin[3]     = tap_instr_reg_scanout[4];
   assign 	 tap_instr_reg_scanin[2]     = tap_instr_reg_scanout[3];
   assign 	 tap_instr_reg_scanin[1]     = tap_instr_reg_scanout[2];
   assign 	 tap_instr_reg_scanin[0]     = tap_instr_reg_scanout[1];
   assign 	 bypass_reg_scanin           = tap_instr_reg_scanout[0];
   assign 	 bypass_ll_reg_scanin        = 1'b0; //bypass_reg_scanout;
   assign 	 tdo_enable_reg_scanin       = 1'b0; //bypass_ll_reg_scanout;
   assign 	 tap_scan_out                = bypass_reg_scanout; 
   // fixscan end
   
endmodule






// any PARAMS parms go into naming of macro

module tcu_jtag_tap_ctl_l1clkhdr_ctl_macro (
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

module tcu_jtag_tap_ctl_msff_ctl_macro__jtag_1__width_4 (
  din, 
  reset, 
  updateclk, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input reset;
  input updateclk;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff_jtag #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0]),
  .reset(reset),
  .updateclk(updateclk)
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_jtag_tap_ctl_msff_ctl_macro__fs_1__jtag_1__width_8 (
  din, 
  reset, 
  updateclk, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;

  input [7:0] din;
  input reset;
  input updateclk;
  input l1clk;
  input [7:0] scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output [7:0] scan_out;
assign fdin[7:0] = din[7:0];






dff_jtag #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si(scan_in[7:0]),
.so(scan_out[7:0]),
.q(dout[7:0]),
  .reset(reset),
  .updateclk(updateclk)
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_jtag_tap_ctl_msff_ctl_macro__width_1 (
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

module tcu_jtag_tap_ctl_msff_ctl_macro__jtag_1__width_1 (
  din, 
  reset, 
  updateclk, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input reset;
  input updateclk;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff_jtag #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0]),
  .reset(reset),
  .updateclk(updateclk)
);












endmodule








