// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fc_csr_cabinet.v
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
`include "fc.vh"

module fc_csr_cabinet();


wire    [63:0]  gOutOfBoot;             // Vera Interface signal
wire    boot_done;

assign   boot_done     = `TOP.system_reset.Not_in_Boot;

//L2 CSR
wire [22:0] l2_ctl_reg;
assign l2_ctl_reg = `CPU.l2t0.csr.csr_l2_control_reg;  //[22:0]

//CCU control reg
wire [5:0] ccu_ctl_reg_div1;
assign ccu_ctl_reg_div1 = `CCU.csr_blk.pll_div1;
wire [5:0] ccu_ctl_reg_div2;
assign ccu_ctl_reg_div2 = `CCU.csr_blk.pll_div2;
wire [5:0] ccu_ctl_reg_div3;
assign ccu_ctl_reg_div3 = `CCU.csr_blk.pll_div3;
wire [5:0] ccu_ctl_reg_div4;
assign ccu_ctl_reg_div4 = `CCU.csr_blk.pll_div4;

//MCU reg bits
wire [4:0] mem_density; //DIMM_SIZE
assign mem_density[4:0] = {`DRIF_PATH0.drif_eight_bank_mode, `DRIF_PATH0.drif_ras_addr_bits[3:0]};

  //channel type
wire single_channel;
assign single_channel = `DRIF_PATH0.drif_single_channel_mode;

  //rank sel
wire rank_sel;
assign rank_sel  = `DRIF_PATH0.drif_addr_bank_low_sel;

  //stack_dimm
wire stack_dimm;
assign stack_dimm = `DRIF_PATH0.drif_stacked_dimm;

  //no of dimms
wire [2:0]  no_of_dimms;
assign no_of_dimms[2:0] = `DRIF_PATH0.drif_dimms_present[2:0];

//NCU clk ratio
wire ncu_clk_ratio;
assign ncu_clk_ratio =  `TOP.cpu.ncu.ncu_ssitop_ctl.ncu_scksel;

//hash enable
wire hash_enable;
assign hash_enable = `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.l2idxhs_en_status;

//mps -- monitor the dmu to piu interface
//supported sizez 128, 256, 512
wire [2:0] pcie_mps;
assign pcie_mps          = `CPU.dmu.p2d_mps;

//monitor wether we are in sun4v sun4u mode
wire sun4v_mode          = `CPU.dmu.dmc.mmu.csr_sun4v_en;

//monitor wether we are using FirePIO
wire p2d_npwr_stall_en   = `CPU.dmu.dmc.clu.crm.p2d_npwr_stall_en;
wire im2crm_ilu_stall_en = `CPU.dmu.dmc.clu.crm.im2crm_ilu_stall_en;

//power throttle
wire power_throttle_en = (|`CPU.PWR_THRTTL_0[2:0]) | (|`CPU.PWR_THRTTL_1[2:0]);

//For partial mode monitoring
wire			spc0_core_available ;
wire			spc1_core_available ;
wire			spc2_core_available ;
wire			spc3_core_available ;
wire			spc4_core_available ;
wire			spc5_core_available ;
wire			spc6_core_available ;
wire			spc7_core_available ;


wire			l2t_pm  ;
wire			l2t_ba01;
wire			l2t_ba23;
wire			l2t_ba45;
wire			l2t_ba67;


assign			spc0_core_available = `CPU.ncu.ncu_spc0_core_available;
assign			spc1_core_available = `CPU.ncu.ncu_spc1_core_available;
assign			spc2_core_available = `CPU.ncu.ncu_spc2_core_available;
assign			spc3_core_available = `CPU.ncu.ncu_spc3_core_available;
assign			spc4_core_available = `CPU.ncu.ncu_spc4_core_available;
assign			spc5_core_available = `CPU.ncu.ncu_spc5_core_available;
assign			spc6_core_available = `CPU.ncu.ncu_spc6_core_available;
assign			spc7_core_available = `CPU.ncu.ncu_spc7_core_available;


assign			l2t_pm   = `CPU.ncu.ncu_l2t_pm  ;
assign			l2t_ba01 = `CPU.ncu.ncu_l2t_ba01;
assign			l2t_ba23 = `CPU.ncu.ncu_l2t_ba23;
assign			l2t_ba45 = `CPU.ncu.ncu_l2t_ba45;
assign			l2t_ba67 = `CPU.ncu.ncu_l2t_ba67;

reg [3:0]  denali_link_width;
reg [1:0]  pcie_ref_clk;
reg [1:0]  system_clock;
reg [1:0]  amb_used;
reg        RANDOM_REDUNDANCY_VALUES;
reg        RANDOM_PB_RST;
reg        RANDOM_POR_RST;
reg	   EIGHT_CORE_DTM2_TESTER_SIG;  // MSA 
reg        FSR_RTL;
integer    denaliLink;

initial
   begin
   #1;
   //denali link width
   denali_link_width = 8; //default value
   denaliLink = $value$plusargs("denali_link_width=%d", denali_link_width);
   $display("denaliLink = %d,  denali_link_width = %d\n\n", denaliLink, denali_link_width);

   //psr ref clk
   //$test$plusargs("PCIE_REF_CLK_100")
   //Defaults for all the parameters
   system_clock = 2'b00; // 166 MHz
   pcie_ref_clk  = 2'b11; // 250 Mhz
   RANDOM_REDUNDANCY_VALUES = 1'b0; 
   amb_used      = 2'b00; //Corresponds to sun amb
   RANDOM_PB_RST = 1'b0;
   RANDOM_POR_RST = 1'b0;
   EIGHT_CORE_DTM2_TESTER_SIG = 1'b0;  // MSA
   FSR_RTL        = 1'b0;
   //FSR RTL used
   if($test$plusargs("FSR_RTL_USED")) begin
      FSR_RTL     = 1'b1;
   end
   //process for pci ref clock freq   
   if($test$plusargs("PCIE_REF_CLK_100")) begin
      pcie_ref_clk[1:0] = 2'b00;
   end
   if($test$plusargs("PCIE_REF_CLK_125")) begin
      pcie_ref_clk = 2'b01;
   end
   if($test$plusargs("PCIE_REF_CLK_250")) begin
      pcie_ref_clk = 2'b10;
   end

   //process for ref clock freqency
   if( $test$plusargs("SYSCLK_166")) begin
     system_clock = 2'b00;
   end

   if( $test$plusargs("SYSCLK_133")) begin
     system_clock = 2'b01;
   end

   if( $test$plusargs("SYSCLK_200")) begin
     system_clock = 2'b10;
   end

   if( $test$plusargs("DTM_ENABLED")) begin
     system_clock = 2'b11;
   end
 
   if( $test$plusargs("RANDOM_REDUNDANCY_VALUES")) begin
     RANDOM_REDUNDANCY_VALUES = 1'b1;
   end

   if( $test$plusargs("SUN_AMB_USED")) begin
     amb_used = 2'b00;
   end

   if( $test$plusargs("IDT_AMB_USED")) begin
     amb_used = 2'b01;
   end

   if( $test$plusargs("MICRON_AMB_USED")) begin
     amb_used = 2'b10;
   end

   if( $test$plusargs("NEC_AMB_USED")) begin
     amb_used = 2'b10;
   end

   if( $test$plusargs("TB_RANDOM_PB_RST")) begin
      RANDOM_PB_RST = 1'b1;
   end

   if( $test$plusargs("TB_RANDOM_POR")) begin
      RANDOM_POR_RST = 1'b1;
   end

   // MSA 12/06/06
   if( $test$plusargs("EIGHT_CORE_DTM2_TESTER")) begin
      EIGHT_CORE_DTM2_TESTER_SIG = 1'b1;
   end

   end

/*
 * Detect scrub happening in any of the eight banks
 */

reg scrub_happened_bank0;
reg scrub_happened_bank1;
reg scrub_happened_bank2;
reg scrub_happened_bank3;
reg scrub_happened_bank4;
reg scrub_happened_bank5;
reg scrub_happened_bank6;
reg scrub_happened_bank7;

wire scrub_happened;

initial begin
scrub_happened_bank0 = 0;
scrub_happened_bank1 = 0;
scrub_happened_bank2 = 0;
scrub_happened_bank3 = 0;
scrub_happened_bank4 = 0;
scrub_happened_bank5 = 0;
scrub_happened_bank6 = 0;
scrub_happened_bank7 = 0;
end

always @(posedge `CPU.l2t0.csr.csr_filbuf_scrub_ready) scrub_happened_bank0 = 1;
always @(posedge `CPU.l2t1.csr.csr_filbuf_scrub_ready) scrub_happened_bank1 = 1;
always @(posedge `CPU.l2t2.csr.csr_filbuf_scrub_ready) scrub_happened_bank2 = 1;
always @(posedge `CPU.l2t3.csr.csr_filbuf_scrub_ready) scrub_happened_bank3 = 1;
always @(posedge `CPU.l2t4.csr.csr_filbuf_scrub_ready) scrub_happened_bank4 = 1;
always @(posedge `CPU.l2t5.csr.csr_filbuf_scrub_ready) scrub_happened_bank5 = 1;
always @(posedge `CPU.l2t6.csr.csr_filbuf_scrub_ready) scrub_happened_bank6 = 1;
always @(posedge `CPU.l2t7.csr.csr_filbuf_scrub_ready) scrub_happened_bank7 = 1;


assign scrub_happened = scrub_happened_bank0 | scrub_happened_bank1 | scrub_happened_bank2 | scrub_happened_bank3 | scrub_happened_bank4 |scrub_happened_bank5 |  scrub_happened_bank6 | scrub_happened_bank7;

// MSA 12/06/06 `ifdef ONE_CORE_DTM2_TESTER
`ifdef DTM_ENABLED

// DBG1 signals
wire [3:0] cpu0_sigs,cpu1_sigs,cpu2_sigs,cpu3_sigs,cpu4_sigs,cpu5_sigs,cpu6_sigs,cpu7_sigs;
wire [5:0] l2t0_sigs,l2t1_sigs,l2t2_sigs,l2t3_sigs,l2t4_sigs,l2t5_sigs,l2t6_sigs,l2t7_sigs;
wire       io2x_sync_en,dbg1_l2clk;
reg        io2x_sync_en_r,io2x_sync_en_r2;
reg  [3:0] cpu0_sigs_lo,cpu0_sigs_hi;
reg  [7:0] cpu0_sigs_dlyd;
wire [3:0] cpu0_sigs_actual_hi,cpu0_sigs_actual_low;
reg  [3:0] cpu0_sigs_actual_hi_r,cpu0_sigs_actual_low_r;
reg [165:0] dtm2_one_core_tester_dbg_pins_dtm,dtm2_one_core_tester_dbg_bus_int_dtm;
reg [165:0] dtm2_one_core_tester_dbg_pins_nondtm;
wire [165:0] dtm2_one_core_tester_dbg_bus_dtm,dtm2_one_core_tester_dbg_bus_nondtm;
wire [165:0] dtm2_one_core_tester_dbg_pins;
wire [165:0] dtm2_one_core_tester_dbg_pins_1core;  // MSA 12/06/06
wire        dtm_mode_on;

assign l2t0_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[5:0];
assign l2t1_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[11:6];
assign l2t2_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[17:12];
assign l2t3_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[23:18];
assign l2t4_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[29:24];
assign l2t5_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[35:30];
assign l2t6_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[41:36];
assign l2t7_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[47:42];
assign cpu0_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[51:48];
assign cpu1_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[55:52];
assign cpu2_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[59:56];
assign cpu3_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[63:60];
assign cpu4_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[67:64];
assign cpu5_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[71:68];
assign cpu6_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[75:72];
assign cpu7_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[79:76];
assign dtm_mode_on = `CPU.ccu.ccu_core.ccu_serdes_dtm_lat;

assign io2x_sync_en = `CPU.dbg1.dbg1_dbgprt.cmp_io2x_sync_en_2;
assign io2x_sync_en_inv = `CPU.dbg1.dbg1_dbgprt.cmp_io2x_sync_en_2_n;
assign dbg1_l2clk = `CPU.dbg1.dbg1_dbgprt.l2clk; 

`ifndef TO_1_0_VECTORS
wire [47:0] l2t_sigs_low,l2t_sigs_hi;
reg  [47:0] l2t_sigs_low_r,l2t_sigs_hi_r;

assign l2t_sigs_low = { 3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[44:42],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[38:36],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[32:30],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[26:24],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[20:18],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[14:12],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[8:6],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[2:0]};

assign l2t_sigs_hi = { 3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[124:122],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[118:116],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[112:110],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[106:104],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[100:98],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[94:92],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[88:86],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[82:80]};
 
// Debug port ONE_CORE_DTM2_TESTER probe logic
always @(posedge dbg1_l2clk)
   begin
       io2x_sync_en_r <= io2x_sync_en;
       io2x_sync_en_r2 <= io2x_sync_en_r;
   end 

always @(posedge dbg1_l2clk)
 if (io2x_sync_en_r)
        cpu0_sigs_hi <= cpu0_sigs[3:0];
     
 else;

always @(posedge dbg1_l2clk)
 if (io2x_sync_en_r2)
   begin
        cpu0_sigs_lo <= cpu0_sigs[3:0];
        cpu0_sigs_dlyd <= {cpu0_sigs_hi[3:0],cpu0_sigs_lo[3:0]};
   end
 else;

assign cpu0_sigs_actual_low = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[51:48];
assign cpu0_sigs_actual_hi = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[131:128];

assign dtm2_one_core_tester_dbg_bus_dtm = {6'b0,cpu0_sigs_dlyd[7:4],cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_dlyd[7:4],cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_actual_hi[3:0], 
                                            cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_actual_hi[3:0], 
                                            l2t_sigs_hi[47:0],              
                                            cpu0_sigs_dlyd[3:0],cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_dlyd[3:0],cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_actual_low[3:0], 
                                            cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_actual_low[3:0], 
                                            l2t_sigs_low[47:0]};
always @(posedge dbg1_l2clk)
 if (io2x_sync_en)
  begin
      cpu0_sigs_actual_low_r <= cpu0_sigs_actual_low[3:0];
      cpu0_sigs_actual_hi_r <= cpu0_sigs_actual_hi[3:0];
      l2t_sigs_low_r <= l2t_sigs_low[47:0];
      l2t_sigs_hi_r <= l2t_sigs_hi[47:0];
  end
 else;

assign dtm2_one_core_tester_dbg_bus_nondtm = {6'b0,cpu0_sigs_dlyd[7:4],cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_dlyd[7:4],cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_actual_hi_r[3:0],
                                            cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_actual_hi_r[3:0],
                                            l2t_sigs_hi_r[47:0],
                                            cpu0_sigs_dlyd[3:0],cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_dlyd[3:0],cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_actual_low_r[3:0],
                                            cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_actual_low_r[3:0],
                                            l2t_sigs_low_r[47:0]};

always @(posedge dbg1_l2clk)
 if (io2x_sync_en)
  begin
      dtm2_one_core_tester_dbg_bus_int_dtm <= dtm2_one_core_tester_dbg_bus_dtm[165:0];
      dtm2_one_core_tester_dbg_pins_dtm <= dtm2_one_core_tester_dbg_bus_int_dtm[165:0];
      dtm2_one_core_tester_dbg_pins_nondtm <= dtm2_one_core_tester_dbg_bus_nondtm[165:0]; 
  end
 else;

assign dtm2_one_core_tester_dbg_pins_1core  = dtm_mode_on ? 
                dtm2_one_core_tester_dbg_pins_dtm[165:0] : dtm2_one_core_tester_dbg_pins_nondtm[165:0];  // MSA 12/06/06

`else

wire [47:0] l2t_sigs_low,l2t_sigs_hi,l2t_sigs_r_low,l2t_sigs_r_hi;
reg  [47:0] l2t_sigs_low_r,l2t_sigs_hi_r;
reg [3:0] cpu0_sigs_r,cpu0_sigs_hi_r,cpu0_sigs_lo_r,cpu0_sigs_lo_act,cpu0_sigs_hi_act;
reg [7:0] cpu0_sigs_dlyd_r,cpu0_sigs_act;
reg [2:0] l2t0_tid_lo,l2t1_tid_lo,l2t2_tid_lo,l2t3_tid_lo,l2t4_tid_lo,l2t5_tid_lo,l2t6_tid_lo,l2t7_tid_lo;
reg [2:0] l2t0_sigs_r,l2t1_sigs_r,l2t2_sigs_r,l2t3_sigs_r,l2t4_sigs_r,l2t5_sigs_r,l2t6_sigs_r,l2t7_sigs_r;
reg [2:0] l2t0_tid_hi,l2t1_tid_hi,l2t2_tid_hi,l2t3_tid_hi,l2t4_tid_hi,l2t5_tid_hi,l2t6_tid_hi,l2t7_tid_hi;
reg [5:0] l2t0_tid,l2t1_tid,l2t2_tid,l2t3_tid,l2t4_tid,l2t5_tid,l2t6_tid,l2t7_tid;

assign l2t_sigs_low = { 3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[44:42],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[38:36],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[32:30],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[26:24],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[20:18],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[14:12],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[8:6],
			3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[2:0]};

assign l2t_sigs_hi = { 3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[124:122],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[118:116],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[112:110],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[106:104],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[100:98],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[94:92],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[88:86],
                        3'bx,
                       `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[82:80]};
 
always @(posedge dbg1_l2clk)
   begin
       io2x_sync_en_r <= io2x_sync_en;
       io2x_sync_en_r2 <= io2x_sync_en_r;
       cpu0_sigs_r <= cpu0_sigs[3:0];
       l2t0_sigs_r  <= l2t0_sigs[2:0];
       l2t1_sigs_r  <= l2t1_sigs[2:0];
       l2t2_sigs_r  <= l2t2_sigs[2:0];
       l2t3_sigs_r  <= l2t3_sigs[2:0];
       l2t4_sigs_r  <= l2t4_sigs[2:0];
       l2t5_sigs_r  <= l2t5_sigs[2:0];
       l2t6_sigs_r  <= l2t6_sigs[2:0];
       l2t7_sigs_r  <= l2t7_sigs[2:0];
   end 

always @(posedge dbg1_l2clk)
 if (io2x_sync_en_r)
        cpu0_sigs_hi <= cpu0_sigs[3:0];
 else;


always @(posedge dbg1_l2clk)
 if (io2x_sync_en_r2)
   begin
        cpu0_sigs_lo <= cpu0_sigs[3:0];
        cpu0_sigs_dlyd <= {cpu0_sigs_hi[3:0],cpu0_sigs_lo[3:0]};
   end
 else;

assign cpu0_sigs_actual_low = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[51:48];
assign cpu0_sigs_actual_hi = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus_io2x_fnl[131:128];

always @(posedge dbg1_l2clk)
 if (io2x_sync_en)
  begin
      cpu0_sigs_actual_low_r <= cpu0_sigs_actual_low[3:0];
      cpu0_sigs_actual_hi_r <= cpu0_sigs_actual_hi[3:0];
      l2t_sigs_low_r <= l2t_sigs_low[47:0];
      l2t_sigs_hi_r <= l2t_sigs_hi[47:0];
      dtm2_one_core_tester_dbg_pins_nondtm <= dtm2_one_core_tester_dbg_bus_nondtm[165:0];
  end
 else;

assign dtm2_one_core_tester_dbg_bus_nondtm = {6'b0,cpu0_sigs_dlyd[7:4],cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_dlyd[7:4],cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_actual_hi_r[3:0],
                                            cpu0_sigs_dlyd[7:4],
                                            cpu0_sigs_actual_hi_r[3:0],
                                            l2t_sigs_hi_r[47:0],
                                            cpu0_sigs_dlyd[3:0],cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_dlyd[3:0],cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_actual_low_r[3:0],
                                            cpu0_sigs_dlyd[3:0],
                                            cpu0_sigs_actual_low_r[3:0],
                                            l2t_sigs_low_r[47:0]};

always @(posedge dbg1_l2clk)
 if (io2x_sync_en_r)
        cpu0_sigs_hi_r <= cpu0_sigs_r[3:0];
 else;

always @(posedge dbg1_l2clk)
 if (io2x_sync_en_r2)
   begin
        cpu0_sigs_lo_r <= cpu0_sigs_r[3:0];
        cpu0_sigs_dlyd_r <= {cpu0_sigs_hi_r[3:0],cpu0_sigs_lo_r[3:0]};
   end
 else;

always @(posedge dbg1_l2clk)
 if (io2x_sync_en_inv)
  begin
     cpu0_sigs_hi_act <= cpu0_sigs_r[3:0];
     l2t0_tid_hi <= l2t0_sigs_r[2:0];
     l2t1_tid_hi <= l2t1_sigs_r[2:0];
     l2t2_tid_hi <= l2t2_sigs_r[2:0];
     l2t3_tid_hi <= l2t3_sigs_r[2:0];
     l2t4_tid_hi <= l2t4_sigs_r[2:0];
     l2t5_tid_hi <= l2t5_sigs_r[2:0];
     l2t6_tid_hi <= l2t6_sigs_r[2:0];
     l2t7_tid_hi <= l2t7_sigs_r[2:0];
  end

always @(posedge dbg1_l2clk)
 if (io2x_sync_en)
   begin
     cpu0_sigs_lo_act <= cpu0_sigs_r[3:0];
     l2t0_tid_lo <= l2t0_sigs_r[2:0];
     l2t1_tid_lo <= l2t1_sigs_r[2:0];
     l2t2_tid_lo <= l2t2_sigs_r[2:0];
     l2t3_tid_lo <= l2t3_sigs_r[2:0];
     l2t4_tid_lo <= l2t4_sigs_r[2:0];
     l2t5_tid_lo <= l2t5_sigs_r[2:0];
     l2t6_tid_lo <= l2t6_sigs_r[2:0];
     l2t7_tid_lo <= l2t7_sigs_r[2:0];
     l2t0_tid <= {l2t0_tid_hi[2:0],l2t0_tid_lo[2:0]};
     l2t1_tid <= {l2t1_tid_hi[2:0],l2t1_tid_lo[2:0]};
     l2t2_tid <= {l2t2_tid_hi[2:0],l2t2_tid_lo[2:0]};
     l2t3_tid <= {l2t3_tid_hi[2:0],l2t3_tid_lo[2:0]};
     l2t4_tid <= {l2t4_tid_hi[2:0],l2t4_tid_lo[2:0]};
     l2t5_tid <= {l2t5_tid_hi[2:0],l2t5_tid_lo[2:0]};
     l2t6_tid <= {l2t6_tid_hi[2:0],l2t6_tid_lo[2:0]};
     l2t7_tid <= {l2t7_tid_hi[2:0],l2t7_tid_lo[2:0]};
     cpu0_sigs_act <= {cpu0_sigs_hi_act[3:0],cpu0_sigs_lo_act[3:0]};
     dtm2_one_core_tester_dbg_bus_int_dtm <= dtm2_one_core_tester_dbg_bus_dtm[165:0];
     dtm2_one_core_tester_dbg_pins_dtm <= dtm2_one_core_tester_dbg_bus_int_dtm[165:0];
   end
  else;

assign l2t_sigs_r_low = { 3'bx,
                        l2t7_tid[2:0],
                        3'bx,
                        l2t6_tid[2:0],
                        3'bx,
                        l2t5_tid[2:0],
                        3'bx,
                        l2t4_tid[2:0],
                        3'bx,
                        l2t3_tid[2:0],
                        3'bx,
                        l2t2_tid[2:0],
                        3'bx,
                        l2t1_tid[2:0],
                        3'bx,
                        l2t0_tid[2:0]};

assign l2t_sigs_r_hi = { 3'bx,
                        l2t7_tid[5:3],
                        3'bx,
                        l2t6_tid[5:3],
                        3'bx,
                        l2t5_tid[5:3],
                        3'bx,
                        l2t4_tid[5:3],
                        3'bx,
                        l2t3_tid[5:3],
                        3'bx,
                        l2t2_tid[5:3],
                        3'bx,
                        l2t1_tid[5:3],
                        3'bx,
                        l2t0_tid[5:3]};

assign dtm2_one_core_tester_dbg_bus_dtm = {6'b0,cpu0_sigs_dlyd_r[7:4],cpu0_sigs_dlyd_r[7:4],
                                            cpu0_sigs_dlyd_r[7:4],cpu0_sigs_dlyd_r[7:4],
                                            cpu0_sigs_dlyd_r[7:4],
                                            cpu0_sigs_act[7:4],
                                            cpu0_sigs_dlyd_r[7:4],
                                            cpu0_sigs_act[7:4],
                                            l2t_sigs_r_hi[47:0],
                                            cpu0_sigs_dlyd_r[3:0],cpu0_sigs_dlyd_r[3:0],
                                            cpu0_sigs_dlyd_r[3:0],cpu0_sigs_dlyd_r[3:0],
                                            cpu0_sigs_dlyd_r[3:0],
                                            cpu0_sigs_act[3:0],
                                            cpu0_sigs_dlyd_r[3:0],
                                            cpu0_sigs_act[3:0],
                                            l2t_sigs_r_low[47:0]};

assign dtm2_one_core_tester_dbg_pins_1core  = dtm_mode_on ? 
                dtm2_one_core_tester_dbg_pins_dtm[165:0] : dtm2_one_core_tester_dbg_pins_nondtm[165:0];  // MSA 12/06/06

`endif

// MSA 12/06/06 `endif


// MSA 12/06/06 `ifdef EIGHT_CORE_DTM2_TESTER

// MSA 12/06/06 `ifndef TO_1_0_VECTORS

// MSA 12/06/06 `else

// DBG1 signals
// MSA 12/06/06 wire       io2x_sync_en,dbg1_l2clk,io2x_sync_en_inv,dtm_mode_on;
wire [79:0] dtm2_sigs_act;
wire [79:0] dtm2_sigs;
reg  [79:0] dtm2_sigs_r;
reg  [79:0] dtm2_sigs_act_low,dtm2_sigs_act_hi;
reg [159:0] dtm2_sigs_accu,dtm2_sigs_fnl;
reg [165:0] dtm2_one_core_tester_dbg_pins_8core;  //MSA 12/06/06

assign dtm2_sigs = `CPU.dbg1.dbg1_dbgprt.charac_signal_bus[79:0];
// MSA 12/06/06 assign dtm_mode_on = `CPU.ccu.ccu_core.ccu_serdes_dtm_lat;

// MSA 12/06/06 assign io2x_sync_en = `CPU.dbg1.dbg1_dbgprt.cmp_io2x_sync_en_2;
// MSA 12/06/06 assign io2x_sync_en_inv = `CPU.dbg1.dbg1_dbgprt.cmp_io2x_sync_en_2_n;
// MSA 12/06/06 assign dbg1_l2clk = `CPU.dbg1.dbg1_dbgprt.l2clk; 

// MSA 12/06/06
`ifdef TO_1_0_VECTORS

always @(posedge dbg1_l2clk)
       dtm2_sigs_r <= dtm2_sigs[79:0];

// pre/post wrm selection
assign dtm2_sigs_act = dtm_mode_on ? dtm2_sigs_r[79:0] : dtm2_sigs[79:0]; 
`else
assign dtm2_sigs_act = dtm2_sigs[79:0];
`endif


// rest of the code all matches dbg pipeline

always @(posedge dbg1_l2clk)
 if (io2x_sync_en_inv)
    dtm2_sigs_act_hi <= dtm2_sigs_act[79:0];
 else;


always @(posedge dbg1_l2clk)
 if (io2x_sync_en)
   begin
    dtm2_sigs_act_low <= dtm2_sigs_act[79:0];   
    dtm2_sigs_accu <= {dtm2_sigs_act_hi[79:0],dtm2_sigs_act_low[79:0]};
    dtm2_sigs_fnl <= dtm2_sigs_accu[159:0];
    dtm2_one_core_tester_dbg_pins_8core <= {6'b0,dtm2_sigs_fnl[159:0]};  // MSA 12/06/06
  end
 else;

// MSA 12/06/06 
assign dtm2_one_core_tester_dbg_pins = EIGHT_CORE_DTM2_TESTER_SIG ? dtm2_one_core_tester_dbg_pins_8core : dtm2_one_core_tester_dbg_pins_1core; 

// MSA 12/06/06 `endif

`endif


endmodule
