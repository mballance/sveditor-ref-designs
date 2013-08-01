// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ddr2_monitor.v
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
`ifdef MCUSAT
  `include "mcu_dispmonDefines.vh"
`else
  `include "defines.vh"
  `include "dispmonDefines.vh"
`endif

// Some general `defines used for OVA checker readability.
`ifdef DDR2_OVA_SIM_MON // {{{

`define DELAY 0
`define EDGE_EXPR 0 // 0 -> posedge, 1 -> negedge, 2 -> edge
`define SEVERITY 0
`define CATEGORY 0
`define START 1'b0
`define STOP 1'b0

`endif
// }}}

// DDR-II Commands // {{{
`define DESELECT   4'b1000      // cs_bar 
`define NOP        4'b0111      // ~cs_bar,ras_bar,cas_bar,we_bar
`define ACTIVE     4'b0011      // ~cs_bar,~ras_bar,cas_bar,we_bar
`define READ       4'b0101      // ~cs_bar,ras_bar,~cas_bar,we_bar
`define WRITE      4'b0100      // ~cs_bar,ras_bar,~cas_bar,~we_bar
`define BURST_STOP 4'b0110      // ~cs_bar,ras_bar,cas_bar,~we_bar 
                                // NOTE: DDR-II does not have such command

`define PRECHARGE  4'b0010      // ~cs_bar,~ras_bar,cas_bar,~we_bar, 
                                // addr[10]: for precharging all banks,
                                // ~addr[10], ba[1:0]: for precharging a specific bank.
`define REF_SREF   4'b0001      // ~cs_bar,~ras_bar,~cas_bar,we_bar  ~cke: SREF, cke: REF
`define MRS        4'b0000      // ~cs_bar,~ras_bar,~cas_bar,~we_bar 
                                // NOTE: ba[1:0]=2'b00 for MRS, 2'b01 for EMRS
// }}}

// Controler States // {{{
`define CS_MODE_REG_SET    3'b000
`define CS_IDLE            3'b001              // All banks are idle
`define CS_BANKS_ACTIVE_OR_IDLE    3'b010      // Some banks are active of R/W
`define CS_SELF_REFRESH    3'b011
`define CS_REFRESH         3'b100
`define CS_POWER_DOWN      3'b101              // When (~CKE @ t-1) and ~CKE @ t
`define CS_POWER_DOWN_EXIT 3'b110
`define CS_ILLEGAL         3'b111

// }}}

// Bank States  // {{{
`define BS_IDLE            3'b000
`define BS_ROW_ACT         3'b001
`define BS_READING         3'b010 
`define BS_READING_AUTOPRE 3'b011
`define BS_WRITING         3'b100
`define BS_WRITING_AUTOPRE 3'b101
`define BS_PRECHARGE       3'b110
`define BS_ILLEGAL         3'b111

// }}}

module ddr2_monitor(/*{{{*/
		    ck,            
		    ck_bar,        
		    cke,  
		    areset,      	
		    cs_bar,      	
		    ras_bar,     	
		    cas_bar,     	
		    ba,  	
		    we_bar,      	
		    addr,
		    dm,   
		    dq,
		    dqs,
            dqs_bar,
            init_done,
            odt
		    );
   
   parameter tMRD  = 2;    // Mode reg set command cycle time -- 
                           // any new command needs to wait tMRD cycles after MRD
   parameter tRFC  = 15;   // Min delay between SHELF REFRESH to ACT/SHELF REFRESH
   parameter tXSRD = 200;  // Min delay between exit SHELF REFRESH and a READ
   parameter tXSNR = 10;   // Min delay between exit SHELF REFRESH and a non-READ 
   parameter tRAS  = 9;    // Min delay between ACT and a PRECHARGE -- Rank Active Time
   parameter tCAS  = 3;    // Min CAS latency
   parameter tRCD  = 3;    // Min delay between ACT and a READ/WRITE to the same row (RAS -> CAS)
   parameter tCCD  = 2;    // Min delay between READ/WRITE -- CAS to CAS delay time
   parameter tRC   = 12;   // Min delay between successive ACTIVE to the same banks -- RAS Cycle time
   parameter tRRD  = 2;    // Min delay between successive ACTIVE to diff banks
   parameter tWTR  = 2;    // Min delay between a WRITE and a READ (WRITE -> READ)
   parameter tRTW  = 4;    // Min delay between a READ and a WRITE to the same bank (READ -> WRITE)
   parameter tWR   = 3;    // Write recovery time -- 
                           // Min delay between completion of WRITE burst and precharge
   parameter tXP   = 2;    // Min delay from PRECHARGE Power-down Exit to non-read command
   parameter tXARD = 2;    // Min delay from Active Power-down Exit to READ command
   parameter tRP   = 3;    // Row precharge period
   parameter tFAW  = 9;    // Four Activate Window.

   parameter ROW_WIDTH       = 15;   // A0-A12, while if A13 is used for 1G densities the width should be 14
   parameter DATA_WIDTH      = 8;    // Min data bus width
   parameter DATA_MASK_WIDTH = 1;
   parameter DDL_TRACK_EN    = 1;    // DDL tracking enable
   parameter BURST_TYPE_SEQ  = 1;    // Default Burst Sequentially
   parameter BURST_LENGTH    = 4;    // Default Burst length
   parameter ADDITIVE_LATENCY = 0;   // Default additive latency
                                     // Actually DDR-II does require you to program AL in
                                     // EMRS.
   parameter DATA_STROBE_NUM = 4;    // numbers of data strobe signals (dqs, ldqs, udqs, rdqs)

      
   input ck;                  // ck and ck_bar are differential clock inputs
   input ck_bar;              //
   input cke;                 // Clock enalbe
   input areset;              // Asyn Reset
   input cs_bar;      	      // Chip select
   input ras_bar;     	      // Row addr strobe
   input cas_bar;     	      // Column addr strob
   input [2:0] 			 ba;  	       // Bank addr b[1:0] for 256Mb/512Mb with 4 banks, 
   // b[2:0] for 1/2/4Gb with 8 banks
   input we_bar;      	                  // Write enable
   input [ROW_WIDTH - 1 : 0] 	   addr;    // Addr bus
   input [DATA_MASK_WIDTH - 1 : 0]   dm;    // Data mask
   input [DATA_WIDTH - 1 : 0] 	     dq;    // Data 
   input [DATA_STROBE_NUM - 1 : 0]   dqs;   // Data strobe
   input [DATA_STROBE_NUM - 1 : 0]   dqs_bar;   // Data strobe
   input init_done;           // dram_init_done
   input odt;                 // On Die Termination
   
   

   wire [3:0] command = ((cs_bar !== 1'bz) && (ras_bar !== 1'bz) && (cas_bar !== 1'bz) && (we_bar !== 1'bz)) ? {cs_bar,ras_bar,cas_bar,we_bar} : 4'h7;
  // wire [3:0] command =  {cs_bar,ras_bar,cas_bar,we_bar};
   wire       command_DESELECT = cs_bar;
   
   reg [4:0] tMRD_reg  = tMRD;    
   reg [4:0] tRFC_reg = tRFC;
   reg [8:0] tXSRD_reg = tXSRD;
   reg [4:0] tXSNR_reg = tXSNR;
   reg [4:0] tRAS_reg = tRAS;
   reg [4:0] tCAS_reg = tCAS;
   reg [4:0] tRCD_reg = tRCD;
   reg [4:0] tCCD_reg = tCCD;
   reg [4:0] tRC_reg = tRC;
   reg [4:0] tRRD_reg = tRRD;
   reg [4:0] tWTR_reg = tWTR;
   reg [4:0] tRTW_reg = tRTW;
   reg [4:0] tWR_reg = tWR;
   reg [4:0] tXP_reg = tXP;
   reg [4:0] tXARD_reg = tXARD;
   reg [4:0] tRP_reg = tRP;
   reg [4:0] tFAW_reg = tFAW;

   reg [4:0] BURST_LENGTH_reg = BURST_LENGTH;
   reg [4:0] ADDITIVE_LATENCY_reg = ADDITIVE_LATENCY;
   reg [4:0] BURST_TYPE_SEQ_reg = BURST_TYPE_SEQ;
   //   reg ROW_WIDTH_reg = ROW_WIDTH;
   //   reg DATA_WIDTH_reg = DATA_WIDTH;
   //   reg DATA_MASK_WIDTH_reg = DATA_MASK_WIDTH;
   //   reg DDL_TRACK_EN_reg = DDL_TRACK_EN;
   //   reg DATA_STROBE_NUM_reg = DATA_STROBE_NUM;



   
   // Rule6: RAS Cycle Time 
   // Time( Act(Bank x) ->  Precharge (Bank x) -> Act(Bank x) ) >= tRC_reg
   //
   
   // Rule7: Bank Active Time
   // Time( Act(Bank x) ->  Precharge (Bank x) ) >= tRAS_reg
   //
   
   // Rule8: 
   // if Time((Act(Bank x) -> Read(Bank x)) < tRCD_reg then 
   //    Time((Act(Bank x) -> Read(Bank x)) + Additive >= tRCD_reg
   
   // MRS fields
   reg [3:0] MRS_BL;  // Addr [2:0],  Burst Len
   reg       MRS_BT;  // Addr [3],    Burst Type; ~Addr[3] for Sequential, Addr[3] for Interleave.
   reg [2:0] MRS_CAS; // Addr [6:4],  Cas latency
   reg [2:0] MRS_WR;  // Addr [11:9], Write Recovery
   reg MRS_TM;
   reg MRS_DLL_RESET;
   
   // EMRS files
   reg [2:0] EMRS_AL; // Addr [5:3], Additive Latency
   reg EMRS_DLL_ENABLE;
   reg [1:0] EMRS_RTT;
   reg [2:0] EMRS_OCD;
   reg EMRS_DQS_BAR_DISABLE;
   

   // Global Timers
   reg [5:0] time_after_ACT;
   reg 	     is_there_ACT;
   reg [5:0] time_after_READ;
   reg 	     is_there_READ;
   reg [5:0] time_after_WRITE;
   reg 	     is_there_WRITE;      
   reg [5:0] time_after_MRS;
   reg 	     is_there_MRS;
   reg [5:0] time_after_REF;
   reg 	     is_there_REF;
   reg [7:0] time_after_SREF;
   reg 	     is_there_SREF;
   reg [10:0] time_after_DLL_reset;
   reg       start_time_after_DLL_reset;
   reg [5:0] time_after_PWD_EXIT;
   reg 	     is_there_PWD_EXIT;
   reg 	     precharge_pwdn;      // power down types: precharge/active power down
   
   reg [5:0] time_after_PREALL;

   reg [15:0] ddr2_err;
   reg [21:0] init_err;
   reg seq_act_violation;
   reg is_init_done;
   reg is_DLL_reset;
   

   initial
        `PR_DEBUG("ddr2_monitor", `DEBUG, "INFO: DDR2_mon initiated at %m");


   // Global Timing constraint flags (applicable to all banks)
   wire      tREAD_TO_WRITE_met = (time_after_READ >= tRTW_reg);   

   wire      tREAD_TO_READ_met = 
	     (time_after_READ >= ( (MRS_BL > tCCD_reg) ? MRS_BL : tCCD_reg) );

   wire      stop_time_after_READ = (time_after_READ == 6'b111111) || 
	     (tREAD_TO_WRITE_met && tREAD_TO_READ_met);
   
   // min time (WRITE -> READ) : WL + 1/2 * BL + tWTR_reg
   wire      tWRITE_TO_READ_met = 
	     (time_after_WRITE >= ( (EMRS_AL + MRS_CAS - 1) + (MRS_BL >> 1) + tWTR_reg ) );
   // min time (WRITE -> WRITE): 
   wire      tWRITE_TO_WRITE_met = 
	     (time_after_WRITE >= ( (MRS_BL > tCCD_reg) ? MRS_BL : tCCD_reg) );

   wire      stop_time_after_WRITE = (time_after_WRITE == 6'b111111) ||
	     ( tWRITE_TO_READ_met &&  tWRITE_TO_WRITE_met );
   // min time (ACT -> ACT) : See JC 42.3 page 24
   wire      tACT_TO_ACT_met =  ( time_after_ACT >= tRRD_reg);
   wire      stop_time_after_ACT = (time_after_ACT == 6'b111111) || tACT_TO_ACT_met;

   // min time (MRS -> Any) :
   wire      tMRS_TO_ANY_met = (time_after_MRS >= tMRD_reg) && is_there_MRS;
   wire      stop_time_after_MRS = ( time_after_MRS == 6'b111111) || tMRS_TO_ANY_met ;

   // min time (REF -> any command) See JC42.3 page 46
   wire      tREF_TO_ANY_met =  (time_after_REF >= tRFC_reg);
   wire      stop_time_after_REF =  (time_after_REF == 6'b111111) || tREF_TO_ANY_met;

   // min time (SREF -> any_non_read) : `tXSNR_reg
   // min time (SREF -> read) : `tXSRD_reg
   wire      tSREF_TO_ANY_NON_RD_met = (time_after_SREF >= tXSNR_reg);

   wire      tSREF_TO_RD_met = (time_after_SREF >= tXSRD_reg);

   wire      stop_time_after_SREF = (time_after_REF == 8'b11111111) || 
	     ( tSREF_TO_ANY_NON_RD_met && tSREF_TO_RD_met);

   // min time (ACT_PWDN_EXIT -> RD):
   // min time (PRECHARGE_PWDN_EXIT -> ANY_NON_RD)
   wire      tACTIVE_POWERDOWN_EXIT_TO_RD_met = (time_after_PWD_EXIT >= tXARD_reg);
   wire      tPRECHARGE_POWERDOWN_EXIT_TO_NON_RD_met = (time_after_PWD_EXIT >= tXP_reg);
   
   wire      stop_time_after_PWD_EXIT = ( time_after_PWD_EXIT == 6'b111111) ||
	     ( tACTIVE_POWERDOWN_EXIT_TO_RD_met &&  tPRECHARGE_POWERDOWN_EXIT_TO_NON_RD_met);
   
   
   // min time (PRECHARGE_ALL -> REFRESHING) : tRP_reg see JC42.3 page 46 on the Refresh command
   wire       tPREALL_TO_REF_met = ( time_after_PREALL >= tRP_reg);
   wire       stop_time_after_PREALL = (time_after_PREALL == 6'b111111) || tPREALL_TO_REF_met;
   
   
   // PreCharge Indiation: One bank or All banks
   
   wire      ref = ( command ==  `REF_SREF) && cke;
   wire      sref = ( command == `REF_SREF) && ~cke;

   // Controller State
   reg [2:0] controller_state;

   wire [2:0] bank1_status;
   wire [2:0] bank2_status;
   wire [2:0] bank3_status;
   wire [2:0] bank4_status;
   wire [2:0] bank5_status;
   wire [2:0] bank6_status;
   wire [2:0] bank7_status;
   wire [2:0] bank8_status;
   
   wire       all_bank_idle = 
	      (bank1_status == `BS_IDLE) &&
              (bank2_status == `BS_IDLE) &&
	      (bank3_status == `BS_IDLE) &&
              (bank4_status == `BS_IDLE) &&
	      (bank5_status == `BS_IDLE) &&
              (bank6_status == `BS_IDLE) &&
	      (bank7_status == `BS_IDLE) &&
              (bank8_status == `BS_IDLE);

   /* Monitors for DDR-II */

      reg err_cmd_BURST_STOP;
      reg err_bad_ba_for_mrs;
      reg err_bad_burst_len;
      reg err_bad_addr_for_mrs;
      reg err_bad_write_recover;
      reg err_bad_cas_latency;
      reg err_bad_additive_latency;
      reg err_rd_dqs_not_asserted_when_rd_data_ready;
      reg err_wr_dqs_not_asserted_when_wr_data_ready;
      reg err_normal_operation_started_with_DLL_reset_in_MRS;
      reg err_normal_operation_started_with_TM_set_in_MRS;
      reg err_normal_operation_started_without_DLL_enable;
      reg err_normal_operation_started_without_initialization;
      reg err_invalid_ODT_value_RTT_in_EMRS;
      reg err_unknown_value_in_MRS_or_EMRS;
      reg err_invalid_cmd;
      reg err_clk_and_clkbar_not_in_sync;
      reg err_dqs_bar_disabled_but_not_tied_low;
      reg err_unknown_clk_or_clkbar_or_cke;
      reg err_unknown_value_on_precharge_pin_during_read_or_write;
      reg err_unknown_col_or_bank_addr_during_read;
      reg err_unknown_col_or_bank_addr_during_write;
      reg err_unknown_row_or_bank_addr_during_active_cmd;
      reg err_unknown_bank_or_precharge_pin_during_precharge;
      reg err_sref_issued_when_bank_not_idle;
      reg err_dqs_and_dqsbar_not_in_sync;
      reg err_unknown_value_on_odt_pin;
      reg err_ref_issued_when_bank_not_idle;
      reg Ill_OCD_activity;

      // Rule: data strobe is not asserted when write data is enabled
      `ifdef REGISTERED_DIMMS
        wire [3:0] RL = MRS_CAS + EMRS_AL + 1'b1; // RL = CL + AL
      `else
        wire [3:0] RL = MRS_CAS + EMRS_AL; // RL = CL + AL
      `endif
      // I only assert rd_data_ready when 1st cycle of the read data is ready (I need to check the rest latter)
      wire       rd_data_ready = (time_after_READ == RL) ;
      wire [2:0] burst_len_addr2_0 = addr[2:0];
      // rd_data_ready ==> (&dqs)

      // Rule: data strobe is not asserted when read data is ready
      // WL = RL - 1 == AL + CL - 1
      wire [3:0] WL = RL - 1;

      // I only assert wr_data_ready when 1st cycle of the write data is ready (I need to check the rest latter)
      wire       wr_data_ready = time_after_WRITE == WL;


    integer j;


    always @(posedge ck)
    begin
        if(init_done)
        begin
            // Rule: DDR-2 does not support burst_stop
            err_cmd_BURST_STOP = ( command == `BURST_STOP) ? 1'b1 : 1'b0;
            // Rule: Ill bank address
            //  See JC42.3 Page 14 on the Bank Address Table

            err_bad_ba_for_mrs = (command == `MRS) && (ba[2] == 1'b1);

            //err_bad_ba_for_mrs = (command == `MRS) && (ba[1:0] == 2'b10 || ba[1:0] == 2'b11 || ba[2] == 1'b1 );


            // Rule: Burst length can be either 4 or 8 in MRS (A[2:0])
            err_bad_burst_len = (areset  != 1'b1) && (command == `MRS) && (ba[1:0] == 2'b00) && 
            ~(addr[2:0] == 3'b010 || addr[2:0] == 3'b011);

            // Rule: See JC42.3 Page 14 A13 - A15 shoud be set to 0 when MRS/EMRS
            // err_bad_addr_for_mrs = (command == `MRS) && (addr[14:13] != 2'b00);
            if(command == `MRS)
            begin
                for(j = ROW_WIDTH - 1; j > 12; j = j - 1)
                begin
                    if(addr[j])
                        err_bad_addr_for_mrs = 1'b1;
                end
            end

            // Rule: Write recovery for autoprecharge in MRS (A[11:9])
            //        The possilbe vaules are 2, 3, 4, 5 or 6
            err_bad_write_recover = (areset  != 1'b1) && (command == `MRS) && (ba[1:0] == 2'b00) && 
            ~(addr[11:9] == 3'b001 || addr[11:9] == 3'b010 || addr[11:9] == 3'b011 || addr[11:9] == 3'b100 || addr[11:9] == 3'b101);

            // Rule: Cas latency can be 3, 4 or 5 in MRS (A[6:4])
            err_bad_cas_latency = (areset  != 1'b1) && (command == `MRS) && (ba[1:0] == 2'b00) &&
            ~(addr[6:4] == 3'b010 || addr[6:4] == 3'b011 || addr[6:4] == 3'b100 || addr[6:4] == 3'b101 );

            // Rule: Additive latency can be 0, 1, 2, 3 or 4, in EMRS (A[5:3])
            err_bad_additive_latency = (areset  != 1'b1) && (command == `MRS) && (ba[1:0] == 2'b01) &&
            ~(addr[5:3] == 3'b000 || addr[5:3] == 3'b001 || addr[5:3] == 3'b010 || addr[5:3] == 3'b011 || addr[5:3] == 3'b100 );

            // rd_data_ready ==> (&dqs)
            err_rd_dqs_not_asserted_when_rd_data_ready = rd_data_ready && (^dqs[DATA_STROBE_NUM - 1 : 0] != 1'b1 && ^dqs[DATA_STROBE_NUM - 1 : 0] != 1'b0 );
            //err_rd_dqs_not_asserted_when_rd_data_ready = ddr2_err[10];

            // wr_data_ready ==> active (dqs)
            err_wr_dqs_not_asserted_when_wr_data_ready = wr_data_ready &&  (^dqs[DATA_STROBE_NUM - 1 : 0] != 1'b1 && ^dqs[DATA_STROBE_NUM - 1 : 0] != 1'b0 );

            err_normal_operation_started_with_DLL_reset_in_MRS = (command == `ACTIVE) && MRS_DLL_RESET;

            err_normal_operation_started_with_TM_set_in_MRS = is_init_done && (command == `ACTIVE) && MRS_TM;

            err_normal_operation_started_without_DLL_enable = is_init_done && (command == `ACTIVE) && ~EMRS_DLL_ENABLE;

            err_normal_operation_started_without_initialization = !is_init_done && (command == `ACTIVE);

            err_invalid_ODT_value_RTT_in_EMRS = (EMRS_RTT == 2'b11);

            err_unknown_value_in_MRS_or_EMRS = (command == `MRS) && ((^addr[ROW_WIDTH - 1:0]) === 1'bx);

            err_invalid_cmd = (!areset) && (command_DESELECT !== 1'b1) && ((command !== `DESELECT) && (command !== `NOP) && (command !== `ACTIVE) && (command !== `READ) && (command !== `WRITE) && (command !== `BURST_STOP) && (command !== `PRECHARGE) && (command !== `REF_SREF) && (command !== `MRS));
               
            err_clk_and_clkbar_not_in_sync = ((!areset) && (cke) && (ck !== ~ck_bar));

            err_dqs_bar_disabled_but_not_tied_low = (EMRS_DQS_BAR_DISABLE) && (dqs_bar[DATA_STROBE_NUM - 1 : 0] !== {DATA_STROBE_NUM{1'b0}});

            err_unknown_clk_or_clkbar_or_cke = (!areset) && ((ck === 1'bx) || (ck_bar === 1'bx) || (cke === 1'bx));

            err_unknown_value_on_precharge_pin_during_read_or_write = ((command == `READ) || (command == `WRITE)) && ((addr[10] !== 1'b1) && (addr[10] !== 1'b0));

            err_unknown_col_or_bank_addr_during_read = ((command == `READ) && (((^addr[ROW_WIDTH - 1:0]) === 1'bx) || (^ba[2:0] === 1'bx)));

            err_unknown_col_or_bank_addr_during_write = ((command == `WRITE) && (((^addr[ROW_WIDTH - 1:0]) === 1'bx) || (^ba[2:0] === 1'bx)));

            err_unknown_row_or_bank_addr_during_active_cmd = ((command == `ACTIVE) && (((^addr[ROW_WIDTH - 1:0]) === 1'bx) || (^ba[2:0] === 1'bx)));

            err_unknown_bank_or_precharge_pin_during_precharge = ((command == `PRECHARGE) && ((addr[10] === 1'bx) || (^ba[2:0] === 1'bx)));

            err_sref_issued_when_bank_not_idle = (sref && !all_bank_idle);

            err_dqs_and_dqsbar_not_in_sync = ((!EMRS_DQS_BAR_DISABLE) ? (((dqs[DATA_STROBE_NUM - 1 : 0] !== {DATA_STROBE_NUM{1'bz}}) || (dqs_bar[DATA_STROBE_NUM - 1 : 0] !== {DATA_STROBE_NUM{1'bz}})) ? (dqs !== ~dqs_bar) : 1'b0 ) : 1'b0);

            err_unknown_value_on_odt_pin = (odt != 1'b1 && odt != 1'b0);

            err_ref_issued_when_bank_not_idle = (ref && !all_bank_idle);

            Ill_OCD_activity = ((command == `MRS) && (ba[0] == 1'b1 && ba[1] == 1'b0 && ba[2] == 1'b0) && ({addr[9],addr[8],addr[7]} != 3'b000) && is_init_done);

        end // init_done
    end
   

   // Rules: Sequential errors
   
   // err[1]
   wire err_mrs_when_not_bank_idle =  ddr2_err[1];
   // err[2]
   wire err_mrs_to_any = ddr2_err[2];
   // err[3]
   wire err_ref_to_any = ddr2_err[3];
   // err[4]
   wire err_sref_to_rd = ddr2_err[4];
   // err[5]
   wire err_sref_to_any_non_rd = ddr2_err[5];
   // err[6]
   wire err_pwr_down =  ddr2_err[6];
   // err[7]
   wire err_active_pwr_down_exit_to_rd = ddr2_err[7];
   // err[8]
   wire err_precharge_pwr_down_exit_to_non_rd = ddr2_err[8];
   // err[9]
   wire err_cke_diasserted_when_not_pwr_down = ddr2_err[9];

   wire err_sequential_activation_violation = seq_act_violation;

   // Initialization Errors (init_err)
   wire Ill_cmd_before_init = init_err[0];
   wire Ill_cmd_during_init_pre_all_expected = init_err[1];
   wire Ill_cmd_during_init_EMRS2_expected = init_err[2];
   wire Ill_cmd_during_init_EMRS3_expected = init_err[3];
   wire Ill_cmd_during_init_EMRS_with_DLL_enable_expected = init_err[4];
   wire Ill_cmd_during_init_MRS_with_DLL_reset_expected = init_err[5];
   wire Ill_cmd_during_init_pre_all_after_MRS_expected = init_err[6];
   wire Ill_cmd_during_init_ref_expected = init_err[7];
   wire Ill_cmd_during_init_2_ref_expected = init_err[8];
   wire Ill_cmd_during_init_MRS_with_DLL_disable_expected = init_err[9];
   wire Ill_cmd_during_init_cke_not_low_for_200ns = init_err[10];
   wire Ill_cmd_during_init_pre_all_issued_early = init_err[11];
   wire Ill_cmd_during_init_odt_not_low = init_err[12];
   wire Ill_cmd_during_init_DLL_lock_time_violation = init_err[13];
   wire Ill_cmd_during_init_missing_OCD_calibration = init_err[14];
   wire err_No_EMRS_to_turn_OCD_mode_off = init_err[15];
   wire Ill_cmd_during_OCD_calibration = init_err[16];
   wire Ill_cmd_or_data_during_OCD_calibration = init_err[17];
   wire err_BL_not_4_during_OCD_calibration = init_err[18];
   wire err_exceeded_max_attempts_during_OCD_adjust = init_err[19];
   wire err_dq_or_dqs_not_driven_during_OCD_adjust = init_err[20];
   wire err_extra_dqs_during_OCD_adjust = init_err[21];

   task finish_test;
   input [512:0] message;
   integer Failure_time;

   begin
       Failure_time =$time;
       `PR_ERROR("ddr2_monitor", `ERROR, " %s", message);
       @(posedge ck);
       @(posedge ck);
       @(posedge ck);
       `PR_ERROR("ddr2_monitor", `ERROR, "DDR2 monitor exiting because of ERROR at %d", Failure_time) ;
       $finish;
   end
   endtask

`ifdef DDR2_0IN_SIM_MON /*{{{*/

   always @(posedge ck_bar) begin
   `ifdef NO_err_cmd_BURST_STOP_CHECK
   `else
      if (err_cmd_BURST_STOP) 
	`PR_ERROR("ddr2_monitor", `ERROR, "err_cmd_BURST_STOP\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_cmd_BURST_STOP\n" ) -constraint
   `endif

   `ifdef NO_err_bad_ba_for_mrs_CHECK
   `else
      if (err_bad_ba_for_mrs )
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_ba_for_mrs\n");  // 0in < fire -message ("ERROR: DDR2_mon: err_bad_ba_for_mrs\n" )  -constraint
    `endif

    `ifdef NO_err_bad_burst_len_CHECK
    `else
      if (err_bad_burst_len)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_burst_len\n");  // 0in < fire -message ("ERROR: DDR2_mon: err_bad_burst_len\n" )  -constraint
    `endif

    `ifdef NO_err_bad_addr_for_mrs_CHECK
    `else
      if(err_bad_addr_for_mrs)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_addr_for_mrs\n");  // 0in < fire -message ("ERROR: DDR2_mon: err_bad_addr_for_mrs\n") -constraint
    `endif

    `ifdef NO_err_bad_write_recover_CHECK
    `else
      if (err_bad_write_recover)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_write_recover\n "); // 0in < fire -message ("ERROR: DDR2_mon: err_bad_write_recover\n ") -constraint
    `endif
       
    `ifdef NO_err_bad_cas_latency_CHECK
    `else
      if (err_bad_cas_latency )
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_cas_latency\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_bad_cas_latency \n") 

    `endif

    `ifdef NO_err_bad_additive_latency_CHECK
    `else
      if (err_bad_additive_latency )
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_additive_latency \n"); // 0in < fire -message ("ERROR: DDR2_mon: err_bad_additive_latency \n") -constraint
    `endif

    `ifdef NO_err_wr_dqs_not_asserted_when_wr_data_ready_CHECK
    `else
      if(err_wr_dqs_not_asserted_when_wr_data_ready)
      	`PR_ERROR("ddr2_monitor", `ERROR, " err_wr_dqs_not_asserted_when_wr_data_ready \n"); // 0in < fire -message ("ERROR: DDR2_mon: err_wr_dqs_not_asserted_when_wr_data_ready \n") -constraint
    `endif

    `ifdef NO_err_rd_dqs_not_asserted_when_rd_data_ready_CHECK
    `else
      if(err_rd_dqs_not_asserted_when_rd_data_ready)
      	`PR_ERROR("ddr2_monitor", `ERROR, " err_rd_dqs_not_asserted_when_rd_data_ready \n"); // 0in < fire -message ("ERROR: DDR2_mon: err_rd_dqs_not_asserted_when_rd_data_ready \n")  -constraint
    `endif
             
    `ifdef NO_err_mrs_when_not_bank_idle_CHECK
    `else
      if (err_mrs_when_not_bank_idle )
	`PR_ERROR("ddr2_monitor", `ERROR, "err_mrs_when_not_bank_idle\n");  // 0in < fire -message ("ERROR: DDR2_mon: err_mrs_when_not_bank_idle\n" )
    `endif

    `ifdef NO_err_mrs_to_any_CHECK
    `else
      if (err_mrs_to_any)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_mrs_to_any\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_mrs_to_any\n")
    `endif

    `ifdef NO_err_ref_to_any_CHECK
    `else
      if (err_ref_to_any)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_ref_to_any\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_ref_to_any\n")
    `endif

    `ifdef NO_err_sref_to_rd_CHECK
    `else
      if (err_sref_to_rd)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_sref_to_rd\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_sref_to_rd\n" )
    `endif

    `ifdef NO_err_sref_to_any_non_rd_CHECK
    `else
      if (err_sref_to_any_non_rd)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_sref_to_any_non_rd\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_sref_to_any_non_rd\n" )
    `endif
      
    `ifdef NO_err_pwr_down_CHECK
    `else
      if (err_pwr_down)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_pwr_down\n");  // 0in < fire -message ("ERROR: DDR2_mon: err_pwr_down\n" )
    `endif
      
    `ifdef NO_err_active_pwr_down_exit_to_rd_CHECK
    `else
      if (err_active_pwr_down_exit_to_rd)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_active_pwr_down_exit_to_rd\n");  // 0in < fire -message ("ERROR: DDR2_mon: err_active_pwr_down_exit_to_rd\n" )
    `endif
      
    `ifdef NO_err_precharge_pwr_down_exit_to_non_rd_CHECK
    `else
      if (err_precharge_pwr_down_exit_to_non_rd)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_precharge_pwr_down_exit_to_non_rd\n");  // 0in < fire -message ("ERROR: DDR2_mon: err_precharge_pwr_down_exit_to_non_rd\n" )
    `endif
      
    `ifdef NO_err_cke_diasserted_when_not_pwr_down_CHECK
    `else
      if (err_cke_diasserted_when_not_pwr_down) 
	 `PR_ERROR("ddr2_monitor", `ERROR, "err_cke_diasserted_when_not_pwr_down\n");  // 0in < fire -message ("ERROR: DDR2_mon: err_cke_diasserted_when_not_pwr_down\n" )
    `endif

    `ifdef NO_err_sequential_activation_violation_CHECK
    `else
        if(err_sequential_activation_violation)
        begin
//            `PR_ERROR("ddr2_monitor", `ERROR, "err_sequential_activation_violation : More than 4 ACTIVE commands in a window of (tFAW_reg).");  // 0in < fire -message ("ERROR: DDR2_mon: err_sequential_activation_violation : More than 4 ACTIVE commands in a window of (tFAW_reg).")
            $display ("ERROR: err_sequential_activation_violation\n");
            finish_test("err_sequential_activation_violation : More than 4 ACTIVE commands in a window of tFAW_reg.");
        end
    `endif

    `ifdef NO_Ill_cmd_before_init_CHECK
    `else
        if(Ill_cmd_before_init)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_before_init\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_before_init\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_pre_all_expected_CHECK
    `else
        if(Ill_cmd_during_init_pre_all_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_pre_all_expected\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_pre_all_expected\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_EMRS2_expected_CHECK
    `else
        if(Ill_cmd_during_init_EMRS2_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_EMRS2_expected\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_EMRS2_expected\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_EMRS3_expected_CHECK
    `else
        if(Ill_cmd_during_init_EMRS3_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_EMRS3_expected\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_EMRS3_expected\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_EMRS_with_DLL_enable_expected_CHECK
    `else
        if(Ill_cmd_during_init_EMRS_with_DLL_enable_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_EMRS_with_DLL_enable_expected\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_EMRS_with_DLL_enable_expected\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_MRS_with_DLL_reset_expected_CHECK
    `else
        if(Ill_cmd_during_init_MRS_with_DLL_reset_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_MRS_with_DLL_reset_expected\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_MRS_with_DLL_reset_expected\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_pre_all_after_MRS_expected_CHECK
    `else
        if(Ill_cmd_during_init_pre_all_after_MRS_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_pre_all_after_MRS_expected\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_pre_all_after_MRS_expected\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_ref_expected_CHECK
    `else
        if(Ill_cmd_during_init_ref_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_ref_expected\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_ref_expected\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_2_ref_expected_CHECK
    `else
        if(Ill_cmd_during_init_2_ref_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_2_ref_expected\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_2_ref_expected\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_MRS_with_DLL_disable_expected_CHECK
    `else
        if(Ill_cmd_during_init_MRS_with_DLL_disable_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_MRS_with_DLL_disable_expected\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_MRS_with_DLL_disable_expected\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_cke_not_low_for_200ns_CHECK
    `else
        if(Ill_cmd_during_init_cke_not_low_for_200ns)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_cke_not_low_for_200ns\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_cke_not_low_for_200ns\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_pre_all_issued_early_CHECK
    `else
        if(Ill_cmd_during_init_pre_all_issued_early)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_pre_all_issued_early\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_pre_all_issued_early\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_odt_not_low_CHECK
    `else
        if(Ill_cmd_during_init_odt_not_low)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_odt_not_low\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_odt_not_low\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_DLL_lock_time_violation_CHECK
    `else
        if(Ill_cmd_during_init_DLL_lock_time_violation)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_DLL_lock_time_violation\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_DLL_lock_time_violation\n")
    `endif

    `ifdef NO_Ill_cmd_during_init_missing_OCD_calibration_CHECK
    `else
        if(Ill_cmd_during_init_missing_OCD_calibration)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_missing_OCD_calibration\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_init_missing_OCD_calibration\n")
    `endif

    `ifdef NO_No_EMRS_to_turn_OCD_mode_off_CHECK
    `else
        if(err_No_EMRS_to_turn_OCD_mode_off)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_No_EMRS_to_turn_OCD_mode_off\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_No_EMRS_to_turn_OCD_mode_off\n")
    `endif

    `ifdef NO_Ill_cmd_during_OCD_calibration_CHECK
    `else
        if(Ill_cmd_during_OCD_calibration)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_OCD_calibration\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_during_OCD_calibration\n")
    `endif

    `ifdef NO_err_normal_operation_started_with_DLL_reset_in_MRS_CHECK
    `else
        if( err_normal_operation_started_with_DLL_reset_in_MRS)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_normal_operation_started_with_DLL_reset_in_MRS\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_normal_operation_started_with_DLL_reset_in_MRS\n")
    `endif

    `ifdef NO_err_normal_operation_started_with_TM_set_in_MRS_CHECK
    `else
        if( err_normal_operation_started_with_TM_set_in_MRS)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_normal_operation_started_with_TM_set_in_MRS\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_normal_operation_started_with_TM_set_in_MRS\n")
    `endif

    `ifdef NO_err_normal_operation_started_without_DLL_enable_CHECK
    `else
        if( err_normal_operation_started_without_DLL_enable)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_normal_operation_started_without_DLL_enable\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_normal_operation_started_without_DLL_enable\n")
    `endif

    `ifdef NO_err_normal_operation_started_without_initialization_CHECK
    `else
        if( err_normal_operation_started_without_initialization)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_normal_operation_started_without_initialization\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_normal_operation_started_without_initialization\n")
    `endif

    `ifdef NO_err_invalid_ODT_value_RTT_in_EMRS_CHECK
    `else
        if( err_invalid_ODT_value_RTT_in_EMRS)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_invalid_ODT_value_RTT_in_EMRS\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_invalid_ODT_value_RTT_in_EMRS\n")
    `endif

    `ifdef NO_err_unknown_value_in_MRS_or_EMRS_CHECK
    `else
        if(err_unknown_value_in_MRS_or_EMRS)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_value_in_MRS_or_EMRS\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_unknown_value_in_MRS_or_EMRS\n")
    `endif

    `ifdef NO_err_invalid_cmd_CHECK
    `else
        if(err_invalid_cmd)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_invalid_cmd\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_invalid_cmd\n")
    `endif

    `ifdef NO_err_clk_and_clkbar_not_in_sync_CHECK
    `else
        if(err_clk_and_clkbar_not_in_sync)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_clk_and_clkbar_not_in_sync\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_clk_and_clkbar_not_in_sync\n")
    `endif

    `ifdef NO_err_dqs_bar_disabled_but_not_tied_low_CHECK
    `else
        if(err_dqs_bar_disabled_but_not_tied_low)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_dqs_bar_disabled_but_not_tied_low\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_dqs_bar_disabled_but_not_tied_low\n")
    `endif

    `ifdef NO_err_unknown_clk_or_clkbar_CHECK
    `else
        if(err_unknown_clk_or_clkbar_or_cke)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_clk_or_clkbar_or_cke\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_unknown_clk_or_clkbar_or_cke\n")
    `endif

    `ifdef NO_err_unknown_value_on_precharge_pin_during_read_or_write_CHECK
    `else
        if(err_unknown_value_on_precharge_pin_during_read_or_write)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_value_on_precharge_pin_during_read_or_write\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_unknown_value_on_precharge_pin_during_read_or_write\n")
    `endif

    `ifdef NO_err_unknown_col_or_bank_addr_during_read_CHECK
    `else
        if(err_unknown_col_or_bank_addr_during_read)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_col_or_bank_addr_during_read\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_unknown_col_or_bank_addr_during_read\n")
    `endif

    `ifdef NO_err_unknown_col_or_bank_addr_during_write_CHECK
    `else
        if(err_unknown_col_or_bank_addr_during_write)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_col_or_bank_addr_during_write\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_unknown_col_or_bank_addr_during_write\n")
    `endif

    `ifdef NO_err_unknown_row_or_bank_addr_during_active_cmd_CHECK
    `else
        if(err_unknown_row_or_bank_addr_during_active_cmd)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_row_or_bank_addr_during_active_cmd\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_unknown_row_or_bank_addr_during_active_cmd\n")
    `endif

    `ifdef NO_err_unknown_bank_or_precharge_pin_during_precharge_CHECK
    `else
        if(err_unknown_bank_or_precharge_pin_during_precharge)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_bank_or_precharge_pin_during_precharge\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_unknown_bank_or_precharge_pin_during_precharge\n")
    `endif

    `ifdef NO_Ill_cmd_or_data_during_OCD_calibration_CHECK
    `else
        if(Ill_cmd_or_data_during_OCD_calibration)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_or_data_during_OCD_calibration\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_cmd_or_data_during_OCD_calibration\n")
    `endif

    `ifdef NO_err_BL_not_4_during_OCD_calibration_CHECK
    `else
        if(err_BL_not_4_during_OCD_calibration)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_BL_not_4_during_OCD_calibration\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_BL_not_4_during_OCD_calibration\n")
    `endif

    `ifdef NO_err_exceeded_max_attempts_during_OCD_adjust_CHECK
    `else
        if(err_exceeded_max_attempts_during_OCD_adjust)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_exceeded_max_attempts_during_OCD_adjust\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_exceeded_max_attempts_during_OCD_adjust\n")
    `endif

    `ifdef NO_err_dq_or_dqs_not_driven_during_OCD_adjust_CHECK
    `else
        if(err_dq_or_dqs_not_driven_during_OCD_adjust)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_dq_or_dqs_not_driven_during_OCD_adjust\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_dq_or_dqs_not_driven_during_OCD_adjust\n")
    `endif

    `ifdef NO_err_extra_dqs_during_OCD_adjust_CHECK
    `else
        if(err_extra_dqs_during_OCD_adjust)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_extra_dqs_during_OCD_adjust\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_extra_dqs_during_OCD_adjust\n")
    `endif

    `ifdef NO_err_sref_issued_when_bank_not_idle_CHECK
    `else
        if(err_sref_issued_when_bank_not_idle)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_sref_issued_when_bank_not_idle\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_sref_issued_when_bank_not_idle\n")
    `endif

    `ifdef NO_err_dqs_and_dqsbar_not_in_sync_CHECK
    `else
        if(err_dqs_and_dqsbar_not_in_sync)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_dqs_and_dqsbar_not_in_sync\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_dqs_and_dqsbar_not_in_sync\n")
    `endif

    `ifdef NO_err_unknown_value_on_odt_pin_CHECK
    `else
        if(err_unknown_value_on_odt_pin)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_value_on_odt_pin\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_unknown_value_on_odt_pin\n")
    `endif

    `ifdef NO_err_ref_issued_when_bank_not_idle_CHECK
    `else
        if(err_ref_issued_when_bank_not_idle)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_ref_issued_when_bank_not_idle\n"); // 0in < fire -message ("ERROR: DDR2_mon: err_ref_issued_when_bank_not_idle\n")
    `endif

    `ifdef NO_Ill_OCD_activity_CHECK
    `else
        if(Ill_OCD_activity)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_OCD_activity\n"); // 0in < fire -message ("ERROR: DDR2_mon: Ill_OCD_activity\n")
    `endif

   end // always

`else /*}}}*/
`ifdef DDR2_OVA_SIM_MON /*{{{*/

   always @(posedge ck_bar) begin
   `ifdef NO_err_cmd_BURST_STOP_CHECK
   `else
      if (err_cmd_BURST_STOP) 
	`PR_ERROR("ddr2_monitor", `ERROR, "err_cmd_BURST_STOP\n"); 
    /* ova ova_asserted ddr2_ova1 
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_cmd_BURST_STOP\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_cmd_BURST_STOP), `START, `STOP ); */
    `endif

    `ifdef NO_err_bad_ba_for_mrs_CHECK
    `else
      if (err_bad_ba_for_mrs)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_ba_for_mrs\n");  
    /* ova ova_asserted ddr2_ova2
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_bad_ba_for_mrs\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_bad_ba_for_mrs), `START, `STOP ); */
    `endif

    `ifdef NO_err_bad_burst_len_CHECK
    `else
      if (err_bad_burst_len)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_burst_len\n");  
    /* ova ova_asserted ddr2_ova3
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_bad_burst_len\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_bad_burst_len), `START, `STOP ); */
    `endif

    `ifdef NO_err_bad_addr_for_mrs_CHECK
    `else
      if(err_bad_addr_for_mrs)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_addr_for_mrs\n");  
    /* ova ova_asserted ddr2_ova4
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_bad_addr_for_mrs\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_bad_addr_for_mrs), `START, `STOP ); */
    `endif

    `ifdef NO_err_bad_write_recover_CHECK
    `else
      if (err_bad_write_recover)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_write_recover\n "); 
    /* ova ova_asserted ddr2_ova5
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_bad_write_recover\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_bad_write_recover), `START, `STOP ); */
    `endif
       
    `ifdef NO_err_bad_cas_latency_CHECK
    `else
      if (err_bad_cas_latency)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_cas_latency\n"); 
    /* ova ova_asserted ddr2_ova6
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_bad_cas_latency\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_bad_cas_latency), `START, `STOP ); */
    `endif

    `ifdef NO_err_bad_additive_latency_CHECK
    `else
      if (err_bad_additive_latency)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_bad_additive_latency \n"); 
    /* ova ova_asserted ddr2_ova7
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_bad_additive_latency\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_bad_additive_latency), `START, `STOP ); */
    `endif

    `ifdef NO_err_wr_dqs_not_asserted_when_wr_data_ready_CHECK
    `else
      if(err_wr_dqs_not_asserted_when_wr_data_ready)
      	`PR_ERROR("ddr2_monitor", `ERROR, " err_wr_dqs_not_asserted_when_wr_data_ready \n"); 
    /* ova ova_asserted ddr2_ova8
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_wr_dqs_not_asserted_when_wr_data_ready\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_wr_dqs_not_asserted_when_wr_data_ready), `START, `STOP ); */
        `endif

        `ifdef NO_err_rd_dqs_not_asserted_when_rd_data_ready_CHECK
        `else
      if(err_rd_dqs_not_asserted_when_rd_data_ready)
      	`PR_ERROR("ddr2_monitor", `ERROR, " err_rd_dqs_not_asserted_when_rd_data_ready \n"); 
    /* ova ova_asserted ddr2_ova9
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_rd_dqs_not_asserted_when_rd_data_ready\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_rd_dqs_not_asserted_when_rd_data_ready), `START, `STOP ); */
        `endif
             
        `ifdef NO_err_mrs_when_not_bank_idle_CHECK
        `else
      if (err_mrs_when_not_bank_idle)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_mrs_when_not_bank_idle\n");  
    /* ova ova_asserted ddr2_ova10
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_mrs_when_not_bank_idle\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_mrs_when_not_bank_idle), `START, `STOP ); */
    `endif

    `ifdef NO_err_mrs_to_any_CHECK
    `else
      if (err_mrs_to_any)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_mrs_to_any\n"); 
    /* ova ova_asserted ddr2_ova11
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_mrs_to_any\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_mrs_to_any), `START, `STOP ); */
    `endif

    `ifdef NO_err_ref_to_any_CHECK
    `else
      if (err_ref_to_any)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_ref_to_any\n"); 
    /* ova ova_asserted ddr2_ova12
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_ref_to_any\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_ref_to_any), `START, `STOP ); */
    `endif

    `ifdef NO_err_sref_to_rd_CHECK
    `else
      if (err_sref_to_rd)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_sref_to_rd\n"); 
    /* ova ova_asserted ddr2_ova13
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_sref_to_rd\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_sref_to_rd), `START, `STOP ); */
    `endif

    `ifdef NO_err_sref_to_any_non_rd_CHECK
    `else
      if (err_sref_to_any_non_rd)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_sref_to_any_non_rd\n"); 
    /* ova ova_asserted ddr2_ova14
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_sref_to_any_non_rd\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_sref_to_any_non_rd), `START, `STOP ); */
    `endif

    `ifdef NO_err_pwr_down_CHECK
    `else
      if (err_pwr_down)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_pwr_down\n");  
    /* ova ova_asserted ddr2_ova15
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_pwr_down\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_pwr_down), `START, `STOP ); */
    `endif

    `ifdef NO_err_active_pwr_down_exit_to_rd_CHECK
    `else
      if (err_active_pwr_down_exit_to_rd)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_active_pwr_down_exit_to_rd\n");  
    /* ova ova_asserted ddr2_ova16
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_active_pwr_down_exit_to_rd\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_active_pwr_down_exit_to_rd), `START, `STOP ); */
    `endif

    `ifdef NO_err_precharge_pwr_down_exit_to_non_rd_CHECK
    `else
      if (err_precharge_pwr_down_exit_to_non_rd)
	`PR_ERROR("ddr2_monitor", `ERROR, "err_precharge_pwr_down_exit_to_non_rd\n");  
    /* ova ova_asserted ddr2_ova17
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_precharge_pwr_down_exit_to_non_rd\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_precharge_pwr_down_exit_to_non_rd), `START, `STOP ); */
    `endif

    `ifdef NO_err_cke_diasserted_when_not_pwr_down_CHECK
    `else
      if (err_cke_diasserted_when_not_pwr_down) 
	 `PR_ERROR("ddr2_monitor", `ERROR, "err_cke_diasserted_when_not_pwr_down\n");  
    /* ova ova_asserted ddr2_ova18
      #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_cke_diasserted_when_not_pwr_down\n", `SEVERITY, `CATEGORY)
       (!(areset), ck, !(err_cke_diasserted_when_not_pwr_down), `START, `STOP ); */
     `endif

     `ifdef NO_err_sequential_activation_violation_CHECK
     `else
        if(err_sequential_activation_violation)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_sequential_activation_violation : More than 4 ACTIVE commands in a window of (tFAW_reg).");  
            /* ova ova_asserted ddr2_ova19
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_sequential_activation_violation\n", `SEVERITY, `CATEGORY)
                (!(areset), ck, !(err_sequential_activation_violation), `START, `STOP ); */
     `endif

     `ifdef NO_Ill_cmd_before_init_CHECK
     `else
        if(Ill_cmd_before_init)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_before_init\n"); 
            /* ova ova_asserted ddr2_ova20
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_before_init\n", `SEVERITY, `CATEGORY)
                (!(areset), ck, !(Ill_cmd_before_init), `START, `STOP); */
     `endif

    `ifdef NO_Ill_cmd_during_init_pre_all_expected_CHECK
    `else
        if(Ill_cmd_during_init_pre_all_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_pre_all_expected\n"); 
            /* ova ova_asserted ddr2_ova21
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_pre_all_expected\n", `SEVERITY, `CATEGORY)
               (!(areset), ck, !(Ill_cmd_during_init_pre_all_expected), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_EMRS2_expected_CHECK
    `else
        if(Ill_cmd_during_init_EMRS2_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_EMRS2_expected\n"); 
            /* ova ova_asserted ddr2_ova22
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_EMRS2_expected\n", `SEVERITY, `CATEGORY)
               (!(areset), ck, !(Ill_cmd_during_init_EMRS2_expected), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_EMRS3_expected_CHECK
    `else
        if(Ill_cmd_during_init_EMRS3_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_EMRS3_expected\n"); 
            /* ova ova_asserted ddr2_ova23
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_EMRS3_expected\n", `SEVERITY, `CATEGORY)
                (!(areset), ck, !(Ill_cmd_during_init_EMRS3_expected), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_EMRS_with_DLL_enable_expected_CHECK
    `else
        if(Ill_cmd_during_init_EMRS_with_DLL_enable_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_EMRS_with_DLL_enable_expected\n"); 
            /* ova ova_asserted ddr2_ova24
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_EMRS_with_DLL_enable_expected\n", `SEVERITY, `CATEGORY)
                (!(areset), ck, !(Ill_cmd_during_init_EMRS_with_DLL_enable_expected), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_MRS_with_DLL_reset_expected_CHECK
    `else
        if(Ill_cmd_during_init_MRS_with_DLL_reset_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_MRS_with_DLL_reset_expected\n"); 
            /* ova ova_asserted ddr2_ova25
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_MRS_with_DLL_reset_expected\n", `SEVERITY, `CATEGORY)
                (!(areset), ck, !(Ill_cmd_during_init_MRS_with_DLL_reset_expected), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_pre_all_after_MRS_expected_CHECK
    `else
        if(Ill_cmd_during_init_pre_all_after_MRS_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_pre_all_after_MRS_expected\n"); 
            /* ova ova_asserted ddr2_ova26
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_pre_all_after_MRS_expected\n", `SEVERITY, `CATEGORY)
                (!(areset), ck, !(Ill_cmd_during_init_pre_all_after_MRS_expected), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_ref_expected_CHECK
    `else
        if(Ill_cmd_during_init_ref_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_ref_expected\n"); 
            /* ova ova_asserted ddr2_ova27
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_ref_expected\n", `SEVERITY, `CATEGORY)
                (!(areset), ck, !(Ill_cmd_during_init_ref_expected), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_2_ref_expected_CHECK
    `else
        if(Ill_cmd_during_init_2_ref_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_2_ref_expected\n"); 
            /* ova ova_asserted ddr2_ova28
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_2_ref_expected\n", `SEVERITY, `CATEGORY)
                (!(areset), ck, !(Ill_cmd_during_init_2_ref_expected), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_MRS_with_DLL_disable_expected_CHECK
    `else
        if(Ill_cmd_during_init_MRS_with_DLL_disable_expected)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_MRS_with_DLL_disable_expected\n"); 
            /* ova ova_asserted ddr2_ova29
               #(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_MRS_with_DLL_disable_expected\n", `SEVERITY, `CATEGORY)
                (!(areset), ck, !(Ill_cmd_during_init_MRS_with_DLL_disable_expected), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_cke_not_low_for_200ns_CHECK
    `else
        if(Ill_cmd_during_init_cke_not_low_for_200ns)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_cke_not_low_for_200ns\n");
            /* ova ova_asserted ddr2_ova30
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_cke_not_low_for_200ns\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_during_init_cke_not_low_for_200ns), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_pre_all_issued_early_CHECK
    `else
        if(Ill_cmd_during_init_pre_all_issued_early)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_pre_all_issued_early\n");
            /* ova ova_asserted ddr2_ova31
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_pre_all_issued_early\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_during_init_pre_all_issued_early), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_odt_not_low_CHECK
    `else
        if(Ill_cmd_during_init_odt_not_low)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_odt_not_low\n");
            /* ova ova_asserted ddr2_ova32
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_odt_not_low\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_during_init_odt_not_low), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_DLL_lock_time_violation_CHECK
    `else
        if(Ill_cmd_during_init_DLL_lock_time_violation)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_DLL_lock_time_violation\n");
    /* ova ova_asserted ddr2_ova33
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_DLL_lock_time_violation\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_during_init_DLL_lock_time_violation), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_init_missing_OCD_calibration_CHECK
    `else
        if(Ill_cmd_during_init_missing_OCD_calibration)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_init_missing_OCD_calibration\n");
    /* ova ova_asserted ddr2_ova34
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_init_missing_OCD_calibration\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_during_init_missing_OCD_calibration), `START, `STOP); */
    `endif

    `ifdef NO_err_No_EMRS_to_turn_OCD_mode_off_CHECK
    `else
        if(err_No_EMRS_to_turn_OCD_mode_off)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_No_EMRS_to_turn_OCD_mode_off\n");
    /* ova ova_asserted ddr2_ova35
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_No_EMRS_to_turn_OCD_mode_off\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_No_EMRS_to_turn_OCD_mode_off), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_during_OCD_calibration_CHECK
    `else
        if(Ill_cmd_during_OCD_calibration)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_during_OCD_calibration\n"); 
    /* ova ova_asserted ddr2_ova36
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_during_OCD_calibration\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_during_OCD_calibration), `START, `STOP); */
    `endif

    `ifdef NO_err_normal_operation_started_with_DLL_reset_in_MRS_CHECK
    `else
        if( err_normal_operation_started_with_DLL_reset_in_MRS)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_normal_operation_started_with_DLL_reset_in_MRS\n");
    /* ova ova_asserted ddr2_ova37
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_normal_operation_started_with_DLL_reset_in_MRS\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_normal_operation_started_with_DLL_reset_in_MRS), `START, `STOP); */
    `endif

    `ifdef NO_err_normal_operation_started_with_TM_set_in_MRS_CHECK
    `else
        if( err_normal_operation_started_with_TM_set_in_MRS)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_normal_operation_started_with_TM_set_in_MRS\n");
    /* ova ova_asserted ddr2_ova38
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_normal_operation_started_with_TM_set_in_MRS\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_normal_operation_started_with_TM_set_in_MRS), `START, `STOP); */
    `endif

    `ifdef NO_err_normal_operation_started_without_DLL_enable_CHECK
    `else
        if( err_normal_operation_started_without_DLL_enable)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_normal_operation_started_without_DLL_enable\n");
    /* ova ova_asserted ddr2_ova39
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_normal_operation_started_without_DLL_enable\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_normal_operation_started_without_DLL_enable), `START, `STOP); */
    `endif

    `ifdef NO_err_normal_operation_started_without_initialization_CHECK
    `else
if( err_normal_operation_started_without_initialization)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_normal_operation_started_without_initialization\n"); 
    /* ova ova_asserted ddr2_ova40
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_normal_operation_started_without_initialization\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_normal_operation_started_without_initialization), `START, `STOP); */

    `endif

    `ifdef NO_err_invalid_ODT_value_RTT_in_EMRS_CHECK
    `else
        if( err_invalid_ODT_value_RTT_in_EMRS)
    `PR_ERROR("ddr2_monitor", `ERROR, "err_invalid_ODT_value_RTT_in_EMRS\n");
    /* ova ova_asserted ddr2_ova41
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_invalid_ODT_value_RTT_in_EMRS\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_invalid_ODT_value_RTT_in_EMRS), `START, `STOP); */
    `endif

    `ifdef NO_err_unknown_value_in_MRS_or_EMRS_CHECK
    `else
        if(err_unknown_value_in_MRS_or_EMRS)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_value_in_MRS_or_EMRS\n");
            /* ova ova_asserted ddr2_ova42
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_unknown_value_in_MRS_or_EMRS\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_unknown_value_in_MRS_or_EMRS), `START, `STOP); */
    `endif

    `ifdef NO_err_invalid_cmd_CHECK
    `else
        if(err_invalid_cmd)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_invalid_cmd\n"); 
            /* ova ova_asserted ddr2_ova43
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_invalid_cmd\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_invalid_cmd), `START, `STOP); */
    `endif

    `ifdef NO_err_clk_and_clkbar_not_in_sync_CHECK
    `else
        if(err_clk_and_clkbar_not_in_sync)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_clk_and_clkbar_not_in_sync\n"); 
            /* ova ova_asserted ddr2_ova44
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_clk_and_clkbar_not_in_sync\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_clk_and_clkbar_not_in_sync), `START, `STOP); */
    `endif

    `ifdef NO_err_dqs_bar_disabled_but_not_tied_low_CHECK
    `else
        if(err_dqs_bar_disabled_but_not_tied_low)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_dqs_bar_disabled_but_not_tied_low\n"); 
            /* ova ova_asserted ddr2_ova45
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_dqs_bar_disabled_but_not_tied_low\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_dqs_bar_disabled_but_not_tied_low), `START, `STOP); */
    `endif

    `ifdef NO_err_unknown_clk_or_clkbar_CHECK
    `else
        if(err_unknown_clk_or_clkbar_or_cke)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_clk_or_clkbar_or_cke\n"); 
            /* ova ova_asserted ddr2_ova46
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_unknown_clk_or_clkbar_or_cke\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_unknown_clk_or_clkbar_or_cke), `START, `STOP); */
    `endif

    `ifdef NO_err_unknown_value_on_precharge_pin_during_read_or_write_CHECK
    `else
        if(err_unknown_value_on_precharge_pin_during_read_or_write)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_value_on_precharge_pin_during_read_or_write\n"); 
            /* ova ova_asserted ddr2_ova47
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_unknown_value_on_precharge_pin_during_read_or_write\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_unknown_value_on_precharge_pin_during_read_or_write), `START, `STOP); */
    `endif

    `ifdef NO_err_unknown_col_or_bank_addr_during_read_CHECK
    `else
        if(err_unknown_col_or_bank_addr_during_read)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_col_or_bank_addr_during_read\n"); 
            /* ova ova_asserted ddr2_ova48
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_unknown_col_or_bank_addr_during_read\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_unknown_col_or_bank_addr_during_read), `START, `STOP); */
    `endif

    `ifdef NO_err_unknown_col_or_bank_addr_during_write_CHECK
    `else
        if(err_unknown_col_or_bank_addr_during_write)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_col_or_bank_addr_during_write\n"); 
            /* ova ova_asserted ddr2_ova49
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_unknown_col_or_bank_addr_during_write\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_unknown_col_or_bank_addr_during_write), `START, `STOP); */
    `endif

    `ifdef NO_err_unknown_row_or_bank_addr_during_active_cmd_CHECK
    `else
        if(err_unknown_row_or_bank_addr_during_active_cmd)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_row_or_bank_addr_during_active_cmd\n"); 
            /* ova ova_asserted ddr2_ova50
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_unknown_row_or_bank_addr_during_active_cmd\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_unknown_row_or_bank_addr_during_active_cmd), `START, `STOP); */
    `endif

    `ifdef NO_err_unknown_bank_or_precharge_pin_during_precharge_CHECK
    `else
        if(err_unknown_bank_or_precharge_pin_during_precharge)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_bank_or_precharge_pin_during_precharge\n"); 
            /* ova ova_asserted ddr2_ova51
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_unknown_bank_or_precharge_pin_during_precharge\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_unknown_bank_or_precharge_pin_during_precharge), `START, `STOP); */
    `endif

    `ifdef NO_Ill_cmd_or_data_during_OCD_calibration_CHECK
    `else
        if(Ill_cmd_or_data_during_OCD_calibration)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_or_data_during_OCD_calibration\n"); 
            /* ova ova_asserted ddr2_ova52
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_cmd_or_data_during_OCD_calibration\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_or_data_during_OCD_calibration), `START, `STOP); */
    `endif

    `ifdef NO_err_BL_not_4_during_OCD_calibration_CHECK
    `else
        if(err_BL_not_4_during_OCD_calibration)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_BL_not_4_during_OCD_calibration\n"); 
            /* ova ova_asserted ddr2_ova53
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_BL_not_4_during_OCD_calibration\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_BL_not_4_during_OCD_calibration), `START, `STOP); */
    `endif

    `ifdef NO_err_exceeded_max_attempts_during_OCD_adjust_CHECK
    `else
        if(err_exceeded_max_attempts_during_OCD_adjust)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_exceeded_max_attempts_during_OCD_adjust\n"); 
            /* ova ova_asserted ddr2_ova54
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_exceeded_max_attempts_during_OCD_adjust\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_exceeded_max_attempts_during_OCD_adjust), `START, `STOP); */
    `endif

    `ifdef NO_err_dq_or_dqs_not_driven_during_OCD_adjust_CHECK
    `else
        if(err_dq_or_dqs_not_driven_during_OCD_adjust)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_dq_or_dqs_not_driven_during_OCD_adjust\n"); 
            /* ova ova_asserted ddr2_ova55
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_dq_or_dqs_not_driven_during_OCD_adjust\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_dq_or_dqs_not_driven_during_OCD_adjust), `START, `STOP); */
    `endif

    `ifdef NO_err_extra_dqs_during_OCD_adjust_CHECK
    `else
        if(err_extra_dqs_during_OCD_adjust)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_extra_dqs_during_OCD_adjust\n"); 
            /* ova ova_asserted ddr2_ova56
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_extra_dqs_during_OCD_adjust\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_extra_dqs_during_OCD_adjust), `START, `STOP); */
    `endif

    `ifdef NO_err_sref_issued_when_bank_not_idle_CHECK
    `else
        if(err_sref_issued_when_bank_not_idle)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_sref_issued_when_bank_not_idle\n"); 
            /* ova ova_asserted ddr2_ova57
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_sref_issued_when_bank_not_idle\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_sref_issued_when_bank_not_idle), `START, `STOP); */
    `endif

    `ifdef NO_err_dqs_and_dqsbar_not_in_sync_CHECK
    `else
        if(err_dqs_and_dqsbar_not_in_sync)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_dqs_and_dqsbar_not_in_sync\n"); 
            /* ova ova_asserted ddr2_ova58
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_dqs_and_dqsbar_not_in_sync\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_dqs_and_dqsbar_not_in_sync), `START, `STOP); */
    `endif

    `ifdef NO_err_unknown_value_on_odt_pin_CHECK
    `else
        if(err_unknown_value_on_odt_pin)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_unknown_value_on_odt_pin\n"); 
            /* ova ova_asserted ddr2_ova59
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_unknown_value_on_odt_pin\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_unknown_value_on_odt_pin), `START, `STOP); */
    `endif

    `ifdef NO_err_ref_issued_when_bank_not_idle_CHECK
    `else
        if(err_ref_issued_when_bank_not_idle)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_ref_issued_when_bank_not_idle\n"); 
            /* ova ova_asserted ddr2_ova60
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: err_ref_issued_when_bank_not_idle\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_ref_issued_when_bank_not_idle), `START, `STOP); */
    `endif

    `ifdef NO_Ill_OCD_activity_CHECK
    `else
        if(Ill_OCD_activity)
            `PR_ERROR("ddr2_monitor", `ERROR, "Ill_OCD_activity\n"); 
            /* ova ova_asserted ddr2_ova61
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_mon: Ill_OCD_activity\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_OCD_activity), `START, `STOP); */
    `endif

   end // always
`else
    initial
        `PR_DEBUG("ddr2_monitor", `DEBUG, "WARNING: NONE of the monitors enabled. Enable OVA/ZIN monitor\n");
`endif // ifdef DDR2_OVA_SIM_MON
`endif // ifdef DDR2_0IN_SIM_MON/*}}}*/


   // Need to add ECC checks for Niagara project. Note that such checks
   // are NOT specified in the JDEC specifiction.
   
   always  @( posedge areset or posedge ck) begin
      if (areset) 
	ddr2_err[15:10] <= 7'b0;
      else
	;
   end
   
   // Initialization Checks /*{{{*/
   reg [14:0] cs;
   reg starttimecheck;
   time startrealtime, midrealtime, endrealtime;
   real duration;
   reg is_odt_low;
   reg OCD_calibration_default;
   reg OCD_drive_1, OCD_drive_0, OCD_adjust ;
   reg [9:0] dqs_adjust_queue;
   reg [4:0] dqs_adjust_window;
   reg [4:0] time_ellapsed_in_adjust;

   parameter
    PRE_INIT  = 15'b000_0000_0000_0001,
        INIT  = 15'b000_0000_0000_0010,
        ST_1  = 15'b000_0000_0000_0100,
        ST_2  = 15'b000_0000_0000_1000,
        ST_3  = 15'b000_0000_0001_0000,
        ST_4  = 15'b000_0000_0010_0000,
        ST_5  = 15'b000_0000_0100_0000,
        ST_6  = 15'b000_0000_1000_0000,
        ST_7  = 15'b000_0001_0000_0000,
        ST_8  = 15'b000_0010_0000_0000,
        ST_9  = 15'b000_0100_0000_0000,
        ST_10 = 15'b000_1000_0000_0000,
        ST_11 = 15'b001_0000_0000_0000,
        ST_12 = 15'b010_0000_0000_0000,
        END   = 15'b100_0000_0000_0000;

    initial
    begin
        init_err <= 22'b0;
        cs <= PRE_INIT;
        is_init_done <= 1'b0;
        is_DLL_reset <= 0;
        starttimecheck = 1'b0;
        OCD_calibration_default <= 1'b0;
        OCD_drive_0 <= 1'b0;
        OCD_drive_1 <= 1'b0;
        OCD_adjust <= 1'b0;
        dqs_adjust_window <= 5'b0;
        dqs_adjust_queue <= 10'b0;
        time_ellapsed_in_adjust <= 5'b0;
    end

 

    task calc_nextstate;
    inout [14:0] cs;
    input [3:0] command;
    input [ROW_WIDTH - 1 : 0] addr;
    input [2:0] ba;
    input cke;
    input command_DESELECT;
    inout [21:0] init_err;
    output is_init_done;
    output is_DLL_reset;
    output is_odt_low;
    output OCD_calibration_default;
    output OCD_drive_0;
    output OCD_drive_1;
    output OCD_adjust;
    output [4:0] dqs_adjust_window;
    output [9:0] dqs_adjust_queue;
    output [4:0] time_ellapsed_in_adjust;
    begin
        if(areset)
            init_err = 22'b0;
        else
        begin
            case (cs)
                PRE_INIT: // check if cke is low b4 ck is stable 
                begin
                    if(~cke && ~starttimecheck)
                    begin
                        startrealtime = $time;
                        starttimecheck = 1'b1;
                        if(odt == 1'b0)
                            is_odt_low = 1'b1;
                        else
                            is_odt_low = 1'b0;
                    end
                    if(cke && starttimecheck)
                    begin
                        midrealtime = $time;
                        duration = midrealtime - startrealtime;
                        if(duration < 200)
                           init_err[10] = 1'b1;
                        if(~is_odt_low || odt)
                            init_err[12] = 1'b1;
                        if(command != `NOP)
                            init_err[0] = 1'b1;
                        cs = INIT;
                    end
                    else if(cke && ~starttimecheck)
                    begin
                        init_err[0] = 1'b1;
                        cs = INIT;
                    end
                end

                INIT: // Only NOP's accepted
                begin
                    if(command == `NOP && cke)
                        cs = ST_1;
                    else if(cke)
                    begin
                        init_err[0] = 1'b1;
                        cs = INIT;
                    end
                end

                ST_1: // wait minimum of 400ns then issue prechargeall
                      // cmd.
                begin
                    if(command == `PRECHARGE && addr[10])
                    begin
                        cs = ST_2;
                        if(starttimecheck)
                        begin
                            endrealtime = $time;
                            duration = endrealtime - midrealtime;
                            if(duration < 400)
                                init_err[11] = 1'b1;
                        end
                    end
                    else if(command == `NOP || command_DESELECT)
                        cs = ST_1;
                    else 
                    begin
                        init_err[1] = 1'b1;
                        cs = ST_1;
                    end
                end

                ST_2: // expect EMRS(2)
                begin
                    if(command == `MRS && ba[0] == 1'b0 && ba[1] == 1'b1 && ba[2] == 1'b0)
                        cs = ST_3;
                    else if(command == `NOP || command_DESELECT)
                        cs = ST_2;
                    else 
                    begin
                        init_err[2] = 1'b1;
                        cs = ST_2;
                    end
                end

                ST_3: // expect EMRS(3)
                begin
                    if(command == `MRS && ba[0] == 1'b1 && ba[1] == 1'b1 && ba[2] == 1'b0)
                        cs = ST_4;
                    else if (command == `NOP || command_DESELECT)
                        cs = ST_3;
                    else
                    begin
                        init_err[3] = 1'b1;
                        cs = ST_3;
                    end
                end
           
                ST_4: // expect EMRS to enable DLL
                begin
                    if(command == `MRS && addr[0] == 1'b0 && ba[0] == 1'b1 && ba[1] == 1'b0 && ba[2] == 1'b0) // addr[13-15] == 1'b0
                        cs = ST_5;
                    else if (command == `NOP || command_DESELECT)
                        cs = ST_4;
                    else
                    begin
                        init_err[4] = 1'b1;
                        cs = ST_4;
                    end
                end

                ST_5: // expect MRS for DLL reset
                begin
                    if(command == `MRS && addr[8] && ba[0] == 1'b0 && ba[1] == 1'b0 && ba[2] == 1'b0) // addr[13-15] == 1'b0
                    begin
                        cs = ST_6;
                        is_DLL_reset <= 1;
                    end
                    else if (command == `NOP || command_DESELECT)
                        cs = ST_5;
                    else
                    begin
                        init_err[5] = 1'b1;
                        cs = ST_5;
                    end
                end

                ST_6: // expect precharge all cmd
                begin
                    if(command == `PRECHARGE && addr[10])
                        cs = ST_7;
                    else if (command == `NOP || command_DESELECT)
                        cs = ST_6;
                    else
                    begin
                        init_err[6] = 1'b1;
                        cs = ST_6;
                    end
                end

                ST_7: // 1st auto-refresh cmd 
                begin
                    if(command == `REF_SREF && cke)
                        cs = ST_8;
                    else if (command == `NOP || command_DESELECT)
                        cs = ST_7;
                    else
                    begin
                        init_err[7] = 1'b1;
                        cs = ST_7;
                    end
                end

                ST_8: // 2nd auto-refresh cmd
                begin
                    if(command == `REF_SREF && cke)
                        cs = ST_9;
                    else if ((command == `NOP) || (command_DESELECT))
                        cs = ST_8;
                    else
                    begin
                        init_err[8] = 1'b1;
                        cs = ST_8;
                    end
                end

                ST_9: // MRS cmd without DLL reset
                begin
                    if(command == `MRS && addr[8] == 1'b0)
                    begin
                        cs = ST_10;
                        is_DLL_reset <= 0;
                    end
                    else if (command == `NOP || command_DESELECT  || (command == `REF_SREF && cke))
                        cs = ST_9;
                    else
                    begin
                        init_err[9] = 1'b1;
                        cs = ST_9;
                    end
                end

                // OCD calibration
                ST_10: 
                begin
                    if(command == `MRS && ba[0] == 1'b1 && ba[1] == 1'b0 && ba[2] == 1'b0) // addr[13-15] == 1'b0
                    begin
                        if(time_after_DLL_reset >= 200)
                        begin
                            cs = ST_11;
                            if({addr[9],addr[8],addr[7]} == 3'b111)
                                OCD_calibration_default <= 1'b1;
                            if(({addr[9],addr[8],addr[7]} == 3'b001) && (&dq[DATA_WIDTH - 1 : 0] == 1'b1) && (&dqs[DATA_STROBE_NUM - 1 : 0] == 1'b1))
                                OCD_drive_1 <= 1;
                        end
                        else
                            init_err[13] <= 1'b1;
                    end
                    else if (command == `NOP || command_DESELECT)
                        cs = ST_10;
                    else
                    begin
                        init_err[14] <= 1'b1;
                        cs = ST_10;
                    end
                end

                ST_11:
                begin
                    if(command == `MRS && ba[0] == 1'b1 && ba[1] == 1'b0 && ba[2] == 1'b0) // addr[13-15] == 1'b0
                    begin
                        if(OCD_calibration_default && ({addr[9],addr[8],addr[7]} == 3'b0))
                        begin
                            OCD_calibration_default <= 1'b0;
                            cs = END;
                        end
                        else if (OCD_calibration_default)
                            init_err[15] <= 1'b1;

                        if(OCD_drive_1)
                        begin
                            if({addr[9],addr[8],addr[7]} == 3'b0)
                                OCD_drive_1 <= 1'b0;

                            if(({addr[9],addr[8],addr[7]} != 3'b0) || (&dq[DATA_WIDTH - 1 : 0] != 1'b1) || (&dqs[DATA_STROBE_NUM - 1 : 0] != 1'b1) || (&dqs_bar[DATA_STROBE_NUM - 1 : 0] != 1'b0))
                                init_err[17] <= 1'b1;
                        end

                        if(!OCD_drive_1 && ({addr[9],addr[8],addr[7]} == 3'b100))
                        begin
                            OCD_adjust = 1'b1;
                            dqs_adjust_queue[0] = 1'b1;
                            time_ellapsed_in_adjust = 5'b0;
                        end
                        
                        if(OCD_adjust && ({addr[9],addr[8],addr[7]} == 3'b0))
                        begin
                            OCD_adjust = 1'b0;
                            cs = ST_10;
                        end

                        if(!OCD_drive_1 && !OCD_adjust && ({addr[9],addr[8],addr[7]} == 3'b010))
                        begin
                            OCD_drive_0 <= 1'b1;
                            cs = ST_12;
                        end

                        if(!OCD_drive_1 && !OCD_adjust && ({addr[9],addr[8],addr[7]} != 3'b010) && ({addr[9],addr[8],addr[7]} != 3'b100) && ({addr[9],addr[8],addr[7]} != 3'b000))
                            init_err[16] <= 1'b1;

                    end
                    else if (command == `NOP || command_DESELECT)
                    begin
                        if(OCD_adjust)
                        begin
                            if(MRS_BL != 4'd4)
                                init_err[18] <= 1'b1;

                            time_ellapsed_in_adjust = time_ellapsed_in_adjust + 1'b1;
                            if(time_ellapsed_in_adjust > 5'd16)
                                init_err[19] <= 1'b1;

                            dqs_adjust_queue = dqs_adjust_queue << 1;
                            if(dqs_adjust_queue[WL])
                                dqs_adjust_window = dqs_adjust_window + (MRS_BL >> 1);

                            if(dqs_adjust_window > 0)
                            begin
                                if((^dq[DATA_WIDTH - 1 : 0] == 1'bx) || (^dqs[DATA_STROBE_NUM - 1 : 0] == 1'bx))
                                    init_err[20] <= 1'b1;
                                dqs_adjust_window = dqs_adjust_window - 1;
                            end
                            else 
                            begin
                                if((^dqs[DATA_STROBE_NUM - 1 : 0] == 1'b1) || (^dqs[DATA_STROBE_NUM - 1 : 0] == 1'b0))
                                    init_err[21] <= 1'b1;
                            end
                                
                            cs = ST_11;
                        end
                    end
                    else
                    begin
                        init_err[16] <= 1'b1;
                        cs = ST_11;
                    end
                end
        
                ST_12:
                begin
                    if(command == `MRS && ba[0] == 1'b1 && ba[1] == 1'b0 && ba[2] == 1'b0) // addr[13-15] == 1'b0
                    begin
                        if(OCD_drive_0)
                        begin
                            if({addr[9],addr[8],addr[7]} == 3'b0)
                            begin
                                OCD_drive_0 <= 1'b0;
                                cs = END;
                            end

                            if(({addr[9],addr[8],addr[7]} != 3'b0) || (&dq[DATA_WIDTH - 1 : 0] != 1'b0) || (&dqs[DATA_STROBE_NUM - 1 : 0] != 1'b0) || (&dqs_bar[DATA_STROBE_NUM - 1 : 0] != 1'b1))
                                init_err[17] <= 1'b1;
                        end

                        // I'm not checking for drive_0 adjust coz of
                        // the ambigious nature of the FSM it is 
                        // difficult to tell the END of inti_sequence
                        /*
                        if(!OCD_drive_0 && ({addr[9],addr[8],addr[7]} == 3'b100))
                            OCD_adjust <= 1'b1;

                        if(OCD_adjust)
                        begin
                            // adjust check
                        end
                        */

                    end
                    else if (command == `NOP || command_DESELECT)
                        cs = ST_12;
                    else
                    begin
                        init_err[16] <= 1'b1;
                        cs = ST_12;
                    end
                end   

                END:
                begin
                    is_init_done <= 1'b1;
                end
            endcase
        end
    end
    endtask
                
    /*
    always @ (areset or posedge ck)
        calc_nextstate(cs, command, addr, ba, cke, command_DESELECT, init_err, is_init_done, is_DLL_reset, is_odt_low, OCD_calibration_default, OCD_drive_0, OCD_drive_1, OCD_adjust, dqs_adjust_window, dqs_adjust_queue, time_ellapsed_in_adjust);
    */

    always @ (posedge ck)
        is_init_done <= init_done;
                    
/*}}}*/

    // Decode MRS /*{{{*/
    // For DDR-II there is no default value for MRS, the user have to
    // program it before any access is performed.
    always @( posedge areset or posedge ck) 
    begin
        if (areset) 
        begin
	        MRS_BL  <= BURST_LENGTH_reg;
	        MRS_BT  <= BURST_TYPE_SEQ_reg;
	        MRS_CAS <= tCAS_reg;
            MRS_TM <= 0;
            MRS_DLL_RESET <= 0;
	        MRS_WR  <= tWR_reg;
	        EMRS_AL <= ADDITIVE_LATENCY_reg;
        end 
        else 
        begin
	        if(command == `MRS) 
            begin
	            case (ba[1:0]) 
	            2'b00 : // MRS 
                begin
		            MRS_BL  <= ((addr [2:0] == 3'd2) ? 4'd4 : (addr [2:0] == 3'd3) ? 4'd8 : BURST_LENGTH_reg);
		            MRS_BT  <= addr [3];
		            MRS_CAS <= addr [6:4];
                    MRS_TM <= addr [7];
                    MRS_DLL_RESET <= addr [8];
		            MRS_WR  <= addr [11:9];
	            end
	            2'b01: // EMRS
                begin
                    EMRS_DLL_ENABLE <= ~addr [0];
		            EMRS_AL <= addr [5:3];
                    EMRS_RTT <= {addr[2], addr[6]};
                    EMRS_OCD <= addr[9:7];
                    EMRS_DQS_BAR_DISABLE <= addr[10];
	            end

	            default:
	       	        ;
	      
	            endcase // case(ba[1:0])
	        end 
        end // else: !if(areset)
    end // always @ ( posedge areset or posedge ck) /*}}}*/

   // Sequential Activation Check /*{{{*/
   // Check if ACT to multiple banks obey sequential bank activation
   // restriction (4 in tFAW_reg )
    reg [3:0]  act_act_window[3:0];
    reg vld_windows[3:0];
    integer i;

    initial
    begin
        for(i = 0; i < 4; i = i + 1)
        begin
            vld_windows[i] = 1'b0;
            act_act_window[i] = 4'b0;
        end
    end

    always @(posedge ck or posedge areset)
    begin
        if(areset)
        begin
            for(i = 0; i < 4; i = i + 1)
            begin
                vld_windows[i] = 1'b0;
                act_act_window[i] = 4'b0;
            end
            seq_act_violation <= 1'b0;
        end
        else 
        begin
            for(i = 0; i < 4; i = i + 1)
            begin
                if(vld_windows[i] == 1'b1)
                begin
                    act_act_window[i] = act_act_window[i] + 4'b0001; 
                    if(act_act_window[i] > (tFAW_reg))
                    begin
                        act_act_window[i] = 4'b0;
                        vld_windows[i] = 1'b0;
                    end
                end
            end


            if(command == `ACTIVE)
            begin
                if(vld_windows[0] == 1'b1 && vld_windows[1] == 1'b1 && vld_windows[2] == 1'b1 && vld_windows[3] == 1'b1)
                    seq_act_violation <= 1'b1;

                if(vld_windows[0] == 1'b0)
                begin
                    vld_windows[0] = 1'b1;
                    act_act_window[0] = 4'b0001;
                end
                else if(vld_windows[1] == 1'b0)
                begin
                    vld_windows[1] = 1'b1;
                    act_act_window[1] = 4'b0001;
                end
                else if(vld_windows[2] == 1'b0)
                begin
                    vld_windows[2] = 1'b1;
                    act_act_window[2] = 4'b0001;
                end
                else if(vld_windows[3] == 1'b0)
                begin
                    vld_windows[3] = 1'b1;
                    act_act_window[3] = 4'b0001;
                end
            end
        end
    end /*}}}*/

   
   always @(posedge ck or posedge areset) begin
      if(areset) 
	 is_there_ACT <= 1'b0;
      else if (command == `ACTIVE)
	is_there_ACT <= 1'b1;    
   end

   always @(posedge ck or posedge areset) begin
      if(areset) 
	 is_there_READ <= 1'b0;
      else if (command == `READ)
	is_there_READ <= 1'b1;    
   end   

   always @(posedge ck or posedge areset) begin
      if(areset) 
	 is_there_WRITE <= 1'b0;
      else if (command == `WRITE)
	is_there_WRITE <= 1'b1;    
   end   


   always @(posedge ck or posedge areset) begin
      if(areset) 
	is_there_MRS <= 1'b0;
      else if (command == `MRS)
	is_there_MRS <= 1'b1;    
   end   


   always @(posedge ck or posedge areset) begin
      if(areset) 
	is_there_REF<= 1'b0;
      else if (ref)
	is_there_REF <= 1'b1;
   end   
   
   always @(posedge ck or posedge areset) begin
      if(areset) 
	 is_there_SREF <= 1'b0;
      else if (sref)
	is_there_SREF <= 1'b1;    
   end   

   always @(posedge ck or posedge areset) begin
      if(areset) 
	is_there_PWD_EXIT <= 1'b0;
      else if (controller_state == `CS_POWER_DOWN_EXIT)
	is_there_PWD_EXIT<= 1'b1;    
   end   

   
   // NOTE!!!: 
   // After areset, all banks are in idle. 
   // 1. All banks should be allowed to accept an which means 
   //    min_time(ACT -> ACT) is met. (`tRRD_reg)
   // 2. Assume min_time(MRS -> Any) is met (`tMRD_reg)
   // 3. Assume min_time(REF -> Any) is met (`tRFC_reg)
   
   always @(posedge ck or posedge areset) begin
      if (areset)
	time_after_ACT <= tRRD_reg;
      else if ( command == `ACTIVE) 
	time_after_ACT <= 6'd0;
      else if(~stop_time_after_ACT && is_there_ACT)
	time_after_ACT <= time_after_ACT +  6'd1;
   end

   always @(posedge ck or posedge areset) begin
      if (areset )
	time_after_READ <= 6'd1;
      else  if (command == `READ)
	time_after_READ <= 6'd0;
      else if (~stop_time_after_READ && is_there_READ)
	time_after_READ <= time_after_READ +  6'd1;
   end

   always @(posedge ck or posedge areset) begin
      if (areset )
	time_after_WRITE <= 6'd1;
      else if ( command == `WRITE)
	time_after_WRITE <= 6'd0;
      else if (~stop_time_after_WRITE && is_there_WRITE)
	time_after_WRITE <= time_after_WRITE +  6'd1;
   end
   
   always @(posedge ck or posedge areset) begin
      if (areset)
 	time_after_MRS <= tMRD_reg;
      else if (command == `MRS)   
	time_after_MRS <= 6'd0;
      else if (~stop_time_after_MRS && is_there_MRS)
	time_after_MRS <= time_after_MRS + 6'd1;
   end

    always @(posedge ck or posedge areset) begin
       if (areset)
	 time_after_REF <= tRFC_reg;
       else if (ref)
	 time_after_REF <= 6'd0;
       else if (~stop_time_after_REF && is_there_REF)
	 time_after_REF <= time_after_REF + 6'd1;
    end
   
   //wire [7:0] min_self_ref_cycle_time = ( ( tXSNR_reg >= tXSRD_reg ) ? tXSRD_reg : tXSNR_reg);
   
    always @(posedge ck or posedge areset) 
    begin
        if (areset)
	    // time_after_SREF <= min_self_ref_cycle_time;
	        time_after_SREF <=  ( ( tXSNR_reg >= tXSRD_reg ) ? tXSRD_reg : tXSNR_reg);
        else if (sref)
	        time_after_SREF <= 8'd0;
        else if (~stop_time_after_SREF && is_there_SREF)
	        time_after_SREF <= time_after_SREF + 8'd1;
    end

    always @(posedge ck or posedge areset or is_DLL_reset)
    begin
        if(areset)
        begin
            time_after_DLL_reset <= 11'd0;
            start_time_after_DLL_reset <= 1'b0;
        end
        else if (!start_time_after_DLL_reset && is_DLL_reset)
        begin
            start_time_after_DLL_reset <= 1'b1;
            time_after_DLL_reset <= 11'd1;
        end
        else if (start_time_after_DLL_reset)
            time_after_DLL_reset <= time_after_DLL_reset + 11'd1;
    end

   //wire [5:0] min_powerdown_exit_cycle_time = ( (tXP_reg >= tXARD_reg) ? tXARD_reg : tXP_reg);
	      
    always @(posedge ck or posedge areset) 
    begin
        if (areset)
   	    // time_after_PWD_EXIT <= min_powerdown_exit_cycle_time;
	        time_after_PWD_EXIT <= ( (tXP_reg >= tXARD_reg) ? tXARD_reg : tXP_reg);
        else if (controller_state == `CS_POWER_DOWN_EXIT)
	        time_after_PWD_EXIT <= 1'd0;
        else if (~stop_time_after_PWD_EXIT && is_there_PWD_EXIT)
	        time_after_PWD_EXIT <= time_after_PWD_EXIT  +  6'd1;
    end	

   reg [3:0] bank1_command;
   reg [3:0] bank2_command;
   reg [3:0] bank3_command;
   reg [3:0] bank4_command;
   reg [3:0] bank5_command;
   reg [3:0] bank6_command;
   reg [3:0] bank7_command;
   reg [3:0] bank8_command; 
   
    // Issuing commands to banks /*{{{*/
    always @(command or ba or addr or cke or cs_bar ) 
    begin
        if ((command == `NOP) || ( command_DESELECT)  || (command == `PRECHARGE && addr[10]) || (command == `MRS)) 
        begin
            bank1_command = command;
            bank2_command = command;
            bank3_command = command;
            bank4_command = command;
            bank5_command = command;
            bank6_command = command;
            bank7_command = command;
            bank8_command = command; 
	    end
        else 
        begin
	        case (ba)
	        3'b000: 
            begin
	            bank1_command = command;
	            bank2_command = `NOP;
	            bank3_command = `NOP;
	            bank4_command = `NOP;
	            bank5_command = `NOP;
	            bank6_command = `NOP;
	            bank7_command = `NOP;
	            bank8_command = `NOP;
	        end

	        3'b001: 
            begin
	            bank1_command = `NOP;
	            bank2_command = command;
	            bank3_command = `NOP;
	            bank4_command = `NOP;
	            bank5_command = `NOP;
	            bank6_command = `NOP;
	            bank7_command = `NOP;
	            bank8_command = `NOP;
	        end

	        3'b010: 
            begin
	            bank1_command = `NOP;
	            bank2_command = `NOP;
	            bank3_command = command;
	            bank4_command = `NOP;
	            bank5_command = `NOP;
	            bank6_command = `NOP;
	            bank7_command = `NOP;
	            bank8_command = `NOP;
	        end	   

	        3'b011: 
            begin
	            bank1_command = `NOP;
	            bank2_command = `NOP;
	            bank3_command = `NOP;
	            bank4_command = command;
	            bank5_command = `NOP;
	            bank6_command = `NOP;
	            bank7_command = `NOP;
	            bank8_command = `NOP;
	        end

	        3'b100: 
            begin
	            bank1_command = `NOP;
	            bank2_command = `NOP;
	            bank3_command = `NOP;
	            bank4_command = `NOP;
	            bank5_command = command;
	            bank6_command = `NOP;
	            bank7_command = `NOP;
	            bank8_command = `NOP;	      
	        end
	   
	        3'b101: 
            begin
	            bank1_command = `NOP;
	            bank2_command = `NOP;
	            bank3_command = `NOP;
	            bank4_command = `NOP;
	            bank5_command = `NOP;
	            bank6_command = command;
	            bank7_command = `NOP;
	            bank8_command = `NOP;
	        end

	        3'b110: 
            begin
	            bank1_command = `NOP;
	            bank2_command = `NOP;
	            bank3_command = `NOP;
	            bank4_command = `NOP;
	            bank5_command = `NOP;
	            bank6_command = `NOP;
	            bank7_command = command;
	            bank8_command = `NOP;
	        end	   

	        3'b111: 
            begin
	            bank1_command = `NOP;
	            bank2_command = `NOP;
	            bank3_command = `NOP;
	            bank4_command = `NOP;
	            bank5_command = `NOP;
	            bank6_command = `NOP;
	            bank7_command = `NOP;
	            bank8_command = command;
	        end

	        default: 
            begin
	            bank1_command = `NOP;
	            bank2_command = `NOP;
	            bank3_command = `NOP;
	            bank4_command = `NOP;
	            bank5_command = `NOP;
	            bank6_command = `NOP;
	            bank7_command = `NOP;
	            bank8_command = `NOP;
	        end
	        endcase // case(ba
        end // else: !if((command == `NOP) || (command == `PRECHARGE && addr[10]))
    end // always (command or ba or addr[10] or cke or cs_bar) /*}}}*/
   
    // Controller FSM /*{{{*/
    always @(posedge ck or posedge areset) 
    begin
        if (areset && ~init_done) 
        begin
       	    controller_state <= `CS_IDLE;
	        ddr2_err[9:0] <= 10'b0;
        end   
        else if (all_bank_idle && controller_state != `CS_ILLEGAL) 
        begin
            case (command) 
            `MRS: 
                begin
                    if(cke) 
                        controller_state <= `CS_MODE_REG_SET;
                    else 
                    begin
                        controller_state <= `CS_ILLEGAL; // err[1]
		                ddr2_err[1] <= 1'b1;
	                end
                end  
	   
            `REF_SREF: 
                begin
                    if (cke)
                        controller_state <= `CS_REFRESH;
                    else
                        controller_state <= `CS_SELF_REFRESH;
                end
               
               //`DESELECT: begin
               //   if(~cke) begin
               //     controller_state <= `CS_POWER_DOWN;
               //	 precharge_pwdn <= 1'b1;
               //   end else
               //     controller_state <= `CS_IDLE;
               //end
		
            `NOP: 
                begin
                    if(~cke) 
                    begin
                        controller_state <= `CS_POWER_DOWN;
		                precharge_pwdn <= 1'b1; // if all bank idle, it is a precharge pwr_down
	                end 
                    else
               	        controller_state <= `CS_IDLE; 
                end
	   
            default: 
                begin
	                if(command_DESELECT) 
                    begin
		                if(~cke) 
                        begin
                            controller_state <= `CS_POWER_DOWN;
		                    precharge_pwdn <= 1'b1;
		                end 
                        else
                            controller_state <= `CS_IDLE;
	                end 
                    else
                        controller_state <= `CS_BANKS_ACTIVE_OR_IDLE;
	            end
            endcase // end of case (command) 
      
        end // if (all_bank_idle)
        else 
        begin
	        case (controller_state)
	            // After MRS, only NOP can be issued before tMRD_reg is met
	            `CS_MODE_REG_SET: 
                begin
	                if((command != `NOP && ~command_DESELECT) && ~tMRS_TO_ANY_met)  
                    begin
		                controller_state <= `CS_ILLEGAL; // err[2]
		                ddr2_err[2] <= 1'b1;
	                end 
                    else
		                controller_state <= `CS_BANKS_ACTIVE_OR_IDLE;
	            end

	            // After REF, only NOP can be issued before tRFC_reg is met
	            `CS_REFRESH: 
                begin
	                if((command != `NOP && ~command_DESELECT) && ~tREF_TO_ANY_met) 
                    begin
		                controller_state <= `CS_ILLEGAL;  // err[3]
		                ddr2_err[3] <= 1'b1;
	                end 
                    else
		                controller_state <= `CS_BANKS_ACTIVE_OR_IDLE;
                end

               // After SELF_REFRESH, there are 2 possible commands can be issued
               // and the corresponding time to be met; so, after one command is issued
               // and the corresponding time is met, we need to check if the other
               // type of timing requirement is met too to move the Controller State
               // to from CS_SELF_REFRESH to CS_BANKS_ACTIVE_OR_IDLE.
               `CS_SELF_REFRESH: 
               begin
	                if (command == `READ ) 
                    begin
		                if(~tSREF_TO_RD_met) 
                        begin
		                    controller_state <= `CS_ILLEGAL; // err[4]
		                    ddr2_err[4] <= 1'b1;
		                end 
		                else if  (tSREF_TO_ANY_NON_RD_met)
		                    controller_state <= `CS_BANKS_ACTIVE_OR_IDLE;
		                else
		                    controller_state <= `CS_SELF_REFRESH;
	                end 
                    else 
                    begin
		                if (command != `NOP &&  ~command_DESELECT) 
                        begin
		                    if(~tSREF_TO_ANY_NON_RD_met) 
                            begin
		                        controller_state <= `CS_ILLEGAL; //err[5]
		                        ddr2_err[5] <= 1'b1;
		                    end
		                    else if(tSREF_TO_RD_met)
		                        controller_state <= `CS_BANKS_ACTIVE_OR_IDLE;
		                    else
		                        controller_state <= `CS_SELF_REFRESH;
		                end 
                        if (tSREF_TO_ANY_NON_RD_met && tSREF_TO_RD_met)
		                    controller_state <= `CS_BANKS_ACTIVE_OR_IDLE;
		                else
		                    controller_state <= `CS_SELF_REFRESH;
	                end // else: !if(command == `READ )
	            end // case: `CS_SELF_REFRESH
	   
	            `CS_POWER_DOWN: 
                begin
	                if(command == `NOP ||  command_DESELECT) 
                    begin
		                if(cke)
		                    controller_state <= `CS_POWER_DOWN_EXIT;
		                else
		                    controller_state <= `CS_POWER_DOWN;
	                end 
                    else 
                    begin
		                controller_state <= `CS_ILLEGAL;  //err[6]
		                ddr2_err[6] <= 1'b1;
	                end
	            end

	            `CS_POWER_DOWN_EXIT: 
                begin
	                if(stop_time_after_PWD_EXIT) 
                    begin
		                controller_state <= `CS_BANKS_ACTIVE_OR_IDLE;
	                end 
                    else 
                    begin
		                if ((command == `READ) && ~precharge_pwdn && ~tACTIVE_POWERDOWN_EXIT_TO_RD_met) 
                        begin
		                    controller_state <= `CS_ILLEGAL; // err[7]
		                    ddr2_err[7] <= 1'b1;
		                end
		                else if ((command != `READ) && precharge_pwdn && ~tPRECHARGE_POWERDOWN_EXIT_TO_NON_RD_met) 
                        begin
		                    controller_state <= `CS_ILLEGAL; // err[8]
		                    ddr2_err[8] <= 1'b1;
		                end
		                else
		                    controller_state <= controller_state;
	                end
	            end // case: `CS_POWER_DOWN_EXIT
	   
	            `CS_ILLEGAL: 
                begin
	                controller_state <= `CS_ILLEGAL;
	            end

	            default: 
                begin
                    if(command_DESELECT || command == `NOP) 
                    begin
		                if(~cke) 
                        begin
                            controller_state <= `CS_POWER_DOWN;
		                    precharge_pwdn <= 1'b0; // if not all bank idle, it is an active power-down
		                end 
                        else 
                        begin
		                    controller_state <= controller_state;
		                end 
                    end 
                    else 
                    begin
		                if(~cke) 
                        begin
		                    controller_state <= `CS_ILLEGAL; //cke should not go low if not PWDN
		                    ddr2_err[9] <= 1'b1;
		                end 
                        else
		                    controller_state <= controller_state;
	                end // else: !if(command_DESELECT || command == `NOP)
	            end // case: default
	   
	        endcase // case(controller_state)
	  
        end // else: !if(all_bank_idle)

    end // end of Contoller FSM /*}}}*/
 
// Instantiantion of banks /*{{{*/   
   ddr_bank #(tMRD,
	      tRFC,
	      tXSRD,
	      tXSNR,
	      tRAS,
	      tCAS,
	      tRCD,
	      tCCD,
	      tRC,
	      tRRD,
	      tWTR,
	      tRTW,
	      tWR,
	      tXP,
	      tXARD,
	      tRP,
          DATA_WIDTH,
          DATA_STROBE_NUM
	      )   bank1(
			.ck                    (ck),
			.cke                   (cke),
			.areset                (areset),
			.bank_cmd              (bank1_command),
			.addr_10               (addr[10]),
			.mrs_bl                (MRS_BL),
			.mrs_bt                (MRS_BT),
			.mrs_cas               (MRS_CAS),
			.mrs_wr                (MRS_WR),
			.emrs_al               (EMRS_AL),
			.global_tWRITE_TO      (time_after_WRITE),
			.global_tREAD_TO       (time_after_READ),
			.bank_status            (bank1_status),
            .dq                     (dq),
            .dqs                    (dqs)
			);

   
     ddr_bank #(tMRD,
	      	tRFC,
	      	tXSRD,
	      	tXSNR,
	      	tRAS,
	      	tCAS,
	      	tRCD,
	      	tCCD,
	      	tRC,
	      	tRRD,
	      	tWTR,
	      	tRTW,
	      	tWR,
		tXP,
	      	tXARD,
		tRP,
        DATA_WIDTH,
        DATA_STROBE_NUM
	      	)    bank2(
			   .ck                    (ck),
			   .cke                   (cke),
			   .areset                (areset),
			   .bank_cmd              (bank2_command),
			   .addr_10               (addr[10]),
			   .mrs_bl                (MRS_BL),
			   .mrs_bt                (MRS_BT),
			   .mrs_cas               (MRS_CAS),
			   .mrs_wr                (MRS_WR),
			   .emrs_al               (EMRS_AL),
			   .global_tWRITE_TO      (time_after_WRITE),
			   .global_tREAD_TO       (time_after_READ),			   
			   .bank_status            (bank2_status),
               .dq                      (dq),
               .dqs                     (dqs)
			   );
   
   ddr_bank #(tMRD,
	      tRFC,
	      tXSRD,
	      tXSNR,
	      tRAS,
	      tCAS,
	      tRCD,
	      tCCD,
	      tRC,
	      tRRD,
	      tWTR,
	      tRTW,
	      tWR,
	      tXP,
	      tXARD,
	      tRP,
          DATA_WIDTH,
          DATA_STROBE_NUM
	      )    bank3(
			 .ck                    (ck),
			 .cke                   (cke),
			 .areset                (areset),
			 .bank_cmd              (bank3_command),
			 .addr_10               (addr[10]),
			 .mrs_bl                (MRS_BL),
			 .mrs_bt                (MRS_BT),
			 .mrs_cas               (MRS_CAS),
			 .mrs_wr                (MRS_WR),
			 .emrs_al               (EMRS_AL),
			 .global_tWRITE_TO      (time_after_WRITE),
			 .global_tREAD_TO       (time_after_READ),			 
			 .bank_status            (bank3_status),
             .dq                        (dq),
             .dqs                   (dqs)
			 );
   
   ddr_bank #(tMRD,
	      tRFC,
	      tXSRD,
	      tXSNR,
	      tRAS,
	      tCAS,
	      tRCD,
	      tCCD,
	      tRC,
	      tRRD,
	      tWTR,
	      tRTW,
	      tWR,
	      tXP,
	      tXARD,
	      tRP,
          DATA_WIDTH,
          DATA_STROBE_NUM
	      )    bank4(
			 .ck                    (ck),
			 .cke                   (cke),
			 .areset                (areset),
			 .bank_cmd              (bank4_command),
			 .addr_10               (addr[10]),
			 .mrs_bl                (MRS_BL),
			 .mrs_bt                (MRS_BT),
			 .mrs_cas               (MRS_CAS),
			 .mrs_wr                (MRS_WR),
			 .emrs_al               (EMRS_AL),
			 .global_tWRITE_TO      (time_after_WRITE),
			 .global_tREAD_TO       (time_after_READ),
			 .bank_status           (bank4_status),
             .dq                        (dq),
             .dqs                   (dqs)
			 ); 


   ddr_bank #(tMRD,
	      tRFC,
	      tXSRD,
	      tXSNR,
	      tRAS,
	      tCAS,
	      tRCD,
	      tCCD,
	      tRC,
	      tRRD,
	      tWTR,
	      tRTW,
	      tWR,
	      tXP,
	      tXARD,
	      tRP,
          DATA_WIDTH,
          DATA_STROBE_NUM
	      )    bank5(
			 .ck                    (ck),
			 .cke                   (cke),
			 .areset                (areset),
			 .bank_cmd              (bank5_command),
			 .addr_10               (addr[10]),
			 .mrs_bl                (MRS_BL),
			 .mrs_bt                (MRS_BT),
			 .mrs_cas               (MRS_CAS),
			 .mrs_wr                (MRS_WR),
			 .emrs_al               (EMRS_AL),
			 .global_tWRITE_TO      (time_after_WRITE),
			 .global_tREAD_TO       (time_after_READ),
			 .bank_status           (bank5_status),
             .dq                        (dq),
             .dqs                   (dqs)
			 );


   ddr_bank #(tMRD,
	      tRFC,
	      tXSRD,
	      tXSNR,
	      tRAS,
	      tCAS,
	      tRCD,
	      tCCD,
	      tRC,
	      tRRD,
	      tWTR,
	      tRTW,
	      tWR,
	      tXP,
	      tXARD,
	      tRP,
          DATA_WIDTH,
          DATA_STROBE_NUM
	      )    bank6(
			 .ck                    (ck),
			 .cke                   (cke),
			 .areset                (areset),
			 .bank_cmd              (bank6_command),
			 .addr_10               (addr[10]),
			 .mrs_bl                (MRS_BL),
			 .mrs_bt                (MRS_BT),
			 .mrs_cas               (MRS_CAS),
			 .mrs_wr                (MRS_WR),
			 .emrs_al               (EMRS_AL),
			 .global_tWRITE_TO      (time_after_WRITE),
			 .global_tREAD_TO       (time_after_READ),
			 .bank_status           (bank6_status),
             .dq                        (dq),
             .dqs                   (dqs)
			 ); 

   ddr_bank #(tMRD,
	      tRFC,
	      tXSRD,
	      tXSNR,
	      tRAS,
	      tCAS,
	      tRCD,
	      tCCD,
	      tRC,
	      tRRD,
	      tWTR,
	      tRTW,
	      tWR,
	      tXP,
	      tXARD,
	      tRP,
          DATA_WIDTH,
          DATA_STROBE_NUM
	      )    bank7(
			 .ck                    (ck),
			 .cke                   (cke),
			 .areset                (areset),
			 .bank_cmd              (bank7_command),
			 .addr_10               (addr[10]),
			 .mrs_bl                (MRS_BL),
			 .mrs_bt                (MRS_BT),
			 .mrs_cas               (MRS_CAS),
			 .mrs_wr                (MRS_WR),
			 .emrs_al               (EMRS_AL),
			 .global_tWRITE_TO      (time_after_WRITE),
			 .global_tREAD_TO       (time_after_READ),
			 .bank_status           (bank7_status),
             .dq                        (dq),
             .dqs                   (dqs)
			 );

   ddr_bank #(tMRD,
	      tRFC,
	      tXSRD,
	      tXSNR,
	      tRAS,
	      tCAS,
	      tRCD,
	      tCCD,
	      tRC,
	      tRRD,
	      tWTR,
	      tRTW,
	      tWR,
	      tXP,
	      tXARD,
	      tRP,
          DATA_WIDTH,
          DATA_STROBE_NUM
	      )    bank8(
			 .ck                    (ck),
			 .cke                   (cke),
			 .areset                (areset),
			 .bank_cmd              (bank8_command),
			 .addr_10               (addr[10]),
			 .mrs_bl                (MRS_BL),
			 .mrs_bt                (MRS_BT),
			 .mrs_cas               (MRS_CAS),
			 .mrs_wr                (MRS_WR),
			 .emrs_al               (EMRS_AL),
			 .global_tWRITE_TO      (time_after_WRITE),
			 .global_tREAD_TO       (time_after_READ),
			 .bank_status           (bank8_status),
             .dq                        (dq),
             .dqs                   (dqs)
			 );    
   
/*}}}*/
   
endmodule/*}}}*/

module ddr_bank (ck,cke,areset, bank_cmd, addr_10, mrs_bl, mrs_bt, mrs_cas, mrs_wr, emrs_al, /*{{{*/
		 global_tWRITE_TO, 
		 global_tREAD_TO, dqs, dq,
		 bank_status);

   parameter tMRD  = 2;    // Mode reg set command cycle time -- 
                           // any new command needs to wait tMRD cycles after MRD
   parameter tRFC  = 15;   // Min delay between SHELF REFRESH to ACT/SHELF REFRESH
   parameter tXSRD = 200;  // Min delay between exit SHELF REFRESH and a READ
   parameter tXSNR = 10;   // Min delay between exit SHELF REFRESH and a non-READ 
   parameter tRAS  = 9;    // Min delay between ACT and a PRECHARGE -- Rank Active Time
   parameter tCAS  = 3;    // Min CAS latency
   parameter tRCD  = 3;    // Min delay between ACT and a READ/WRITE to the same row (RAS -> CAS)
   parameter tCCD  = 2;    // Min delay between READ/WRITE -- CAS to CAS delay time
   parameter tRC   = 12;   // Min delay between successive ACTIVE to the same banks -- RAS Cycle time
   parameter tRRD  = 2;    // Min delay between successive ACTIVE to diff banks
   parameter tWTR  = 2;    // Min delay between a WRITE and a READ (WRITE -> READ)
   parameter tRTW  = 4;    // Min delay between a READ and a WRITE to the same bank (READ -> WRITE)
   parameter tWR   = 3;    // Write recovery time -- 
   parameter tXP   = 2;    // Min delay from PRECHARGE Power-down Exit to non-read command
   parameter tXARD = 2;    // Min delay from Active Power-down Exit to READ command
   parameter tRP   = 3;    // Row precharge period
   parameter DATA_WIDTH      = 8;    // Min data bus width
   parameter DATA_STROBE_NUM = 4;    // numbers of data strobe signals (dqs, ldqs, udqs, rdqs)

   input ck;
   input cke;
   input areset;
   input [3:0] bank_cmd;
   input addr_10;       // indicator for precharge of all banks
   input [3:0] mrs_bl;  // burst len
   input       mrs_bt;  // burst type
   input [2:0] mrs_cas; // cas latency
   input [2:0] mrs_wr;  // write recovery
   input [2:0] emrs_al; // additive latency
   input [5:0] global_tWRITE_TO; // time passed since the last WRITE
   input [5:0] global_tREAD_TO;  // time passed since the last READ
   input [DATA_WIDTH - 1 : 0] 	     dq;    // Data 
   input [DATA_STROBE_NUM - 1 : 0]   dqs;   // Data strobe

   output [2:0] bank_status;

   // Rule8: 
   // if Time((Act(Bank x) -> Read(Bank x))) < tRCD_reg then 
   //    Time((Act(Bank x) -> Read(Bank x))) + Additive >= tRCD_reg
   
   reg [5:0]   tACT_TO;    // timer for the time passed by after an ACT
   reg [5:0]   tWRITE_TO;  //           the time passed by after a WRITE
   reg [5:0]   tREAD_TO;   //           the time passed by after a READ   
   reg [5:0]   tPRE_TO;    //           the time passed by after a PRECHARGE
   reg [2:0]   bank_state;
   reg [18:0]  ddr2_bank_err;
   reg begin_auto_pre;

   reg [4:0] tMRD_reg  = tMRD;
   reg [4:0] tRFC_reg  = tRFC;
   reg [8:0] tXSRD_reg = tXSRD;
   reg [4:0] tXSNR_reg = tXSNR;
   reg [4:0] tRAS_reg  = tRAS;
   reg [4:0] tCAS_reg  = tCAS;
   reg [4:0] tRCD_reg  = tRCD;
   reg [4:0] tCCD_reg  = tCCD;
   reg [4:0] tRC_reg   = tRC;
   reg [4:0] tRRD_reg  = tRRD;
   reg [4:0] tWTR_reg  = tWTR;
   reg [4:0] tRTW_reg  = tRTW;
   reg [4:0] tWR_reg   = tWR;
   reg [4:0] tXP_reg   = tXP;
   reg [4:0] tXARD_reg = tXARD;
   reg [4:0] tRP_reg   = tRP;
//   reg DATA_WIDTH_reg      = DATA_WIDTH;
//   reg DATA_STROBE_NUM_reg = DATA_STROBE_NUM;




   wire stop_tACT_TO;
   wire stop_tWRITE_TO;
   wire stop_tREAD_TO;
   wire stop_tPRE_TO;


   wire       command_DESELECT = bank_cmd[3];
   
   // time (ACT -> READ) + AL >= tRCD_reg
   // So, min time (ACT -> READ) >= tRCD_reg - AL  
   wire tACT_TO_READ_met = (tACT_TO >= (tRCD_reg - emrs_al) );
   
   wire tACT_TO_WRITE_met = (tACT_TO >= (tRCD_reg - emrs_al) );
   wire tACT_TO_PRE_met =  (tACT_TO >= tRAS_reg );

   // min time (READ -> PRE ): additive + 1/2 * burst len
   wire tREAD_TO_PRE_met =  (tREAD_TO >= (emrs_al + (mrs_bl >> 1)) );
   // gloabl RD -> RD min delay
   wire tREAD_TO_READ_met = (global_tREAD_TO  >= ( (mrs_bl > tCCD_reg) ? mrs_bl : tCCD_reg) );
   // global READ -> WRITE min trun around time
   wire tREAD_TO_WRITE_met = (global_tREAD_TO >= tRTW_reg);
  
   
   wire tWRITE_TO_PRE_met =  (tWRITE_TO >= (emrs_al + (mrs_cas - 1) + (mrs_bl >> 1) + mrs_wr ) ) ;
   // global WRITE -> WRITE min delay
   wire tWRITE_TO_WRITE_met = (global_tWRITE_TO >=   ( (mrs_bl > tCCD_reg) ? mrs_bl : tCCD_reg) );
   // global WRIE -> READ) min delay: WL + 1/2 * burst len + tWTR_reg, where WL (Write Latency) is (additive + CL - 1)
   
   wire tWRITE_TO_READ_met = (global_tWRITE_TO >= (emrs_al + (mrs_cas - 1) + (mrs_bl >> 1) + tWTR_reg) ) ;
					   
   // min time (PRE -> Idle State): tRP_reg; See JESD79 Rel 2 Page14
   wire tPRE_TO_IDLE_met = (tPRE_TO >= tRP_reg);
   
   assign stop_tACT_TO = (tACT_TO == 6'b111111) || 
	  ( tACT_TO_READ_met && tACT_TO_WRITE_met && tACT_TO_PRE_met);

   assign stop_tWRITE_TO = (tWRITE_TO == 6'b111111) ||  tWRITE_TO_PRE_met;

   assign stop_tREAD_TO = (tREAD_TO == 6'b111111) ||  tREAD_TO_PRE_met;

   assign stop_tPRE_TO = (tPRE_TO == 6'b111111 ) || tPRE_TO_IDLE_met;

   assign bank_status = bank_state;
   

   wire   bank_cmd_ACT = (bank_cmd == `ACTIVE);

   /* Bank Error Conditions */

   wire   Ill_cmd_while_bank_idle = ddr2_bank_err[0];
   wire   Ill_cmd_after_act_while_act_to_rd_wr_pre_timing_not_met = ddr2_bank_err[1];
   wire   act_to_pre_timing_not_met = ddr2_bank_err[2];
   wire   act_to_rd_timing_not_met = ddr2_bank_err[3];
   wire   act_to_wr_timing_not_met = ddr2_bank_err[4];
   wire   Ill_cmd_after_wr_while_wr_to_rd_pre_timing_not_met = ddr2_bank_err[5];
   wire   wr_to_pre_or_act_to_pre_timing_not_met_when_wr_to_pre = ddr2_bank_err[6];
   wire   wr_to_rd_timing_not_met_when_wr_to_rd = ddr2_bank_err[7];
   wire   wr_to_wr_timing_not_met = ddr2_bank_err[8];
   wire   Ill_cmd_after_wr = ddr2_bank_err[9]; // nor nop, rd, wr
   wire   Ill_cmd_after_wra = ddr2_bank_err[10];
   wire   Ill_cmd_after_rd_while_rd_to_rd_and_rd_pre_timing_not_met =   ddr2_bank_err[11];
   wire   rd_to_pre_or_act_to_pre_timing_not_met_when_rd_pre = ddr2_bank_err[12];
   wire   rd_to_rd_timing_not_met = ddr2_bank_err[13];
   wire   rd_to_wr_timing_not_met = ddr2_bank_err[14];
   wire   Ill_cmd_after_rd = ddr2_bank_err[15]; // nor nop, rd, wr
   wire   Ill_cmd_after_rda =  ddr2_bank_err[16];
   wire   Ill_cmd_after_pre = ddr2_bank_err[17];
   wire   Ill_cmd_while_bank_active = ddr2_bank_err[18];
   wire   Ill_bank_state = (bank_state == `CS_ILLEGAL);
   

   //   always  @( posedge areset or posedge ck) begin
   //   if (areset) 
   //	ddr2_bank_err <= 18'b0;
   //   else
   //	;
   //   
   //end
   
   always @(posedge ck or posedge areset) begin
      if(areset)   // we assume after a reset, Time (ACT -> Pre) is satisfied
        tACT_TO <= tRAS_reg;
      else if (bank_cmd_ACT)
       	tACT_TO <= 6'd1;
      else if (~stop_tACT_TO)
       	tACT_TO <= tACT_TO + 6'd1;
   end

   wire bank_cmd_NOP = (bank_cmd == `NOP) || command_DESELECT;
   wire bank_cmd_WRITE = (bank_cmd == `WRITE);
   always @(posedge ck or posedge areset or begin_auto_pre) begin
      if(areset)   
        tWRITE_TO <= 6'd1;
      else if (bank_cmd_WRITE || begin_auto_pre)
       	tWRITE_TO <= 6'd1;
      else if (~stop_tWRITE_TO)
       	tWRITE_TO <= tWRITE_TO + 6'd1;
   end 

   wire bank_cmd_READ = ( bank_cmd == `READ );   
   always @(posedge ck or posedge areset or begin_auto_pre) begin
     if(areset)   
        tREAD_TO <= 6'd1;
     else if (bank_cmd_READ || begin_auto_pre)
       tREAD_TO <= 6'd1;
     else if (~stop_tREAD_TO)
       tREAD_TO <= tREAD_TO + 6'd1;
   end

   wire bank_cmd_PRECHARGE = (bank_cmd == `PRECHARGE );
   wire bank_cmd_non_REF_MRS_NOP = (!( (bank_cmd ==  `REF_SREF) ||
				       (bank_cmd ==  `MRS) ||
				       (bank_cmd ==  `NOP || command_DESELECT )
				       ));
   always @(posedge ck or posedge areset) begin
     if(areset)   
        tPRE_TO <= 6'd1;
     else if (bank_cmd_PRECHARGE)
       tPRE_TO <= 6'd1;
     else if (~stop_tPRE_TO)
       tPRE_TO <= tPRE_TO + 6'd1;
   end


   wire tACT_TO_READ_tACT_TO_WRITE_tACT_TO_PRE_not_met =  (~tACT_TO_READ_met && 
							   ~tACT_TO_WRITE_met && 
							   ~tACT_TO_PRE_met);
   wire tWRITE_TO_READ_tWRITE_TO_PRE_not_met = ~tWRITE_TO_READ_met &&  ~tWRITE_TO_PRE_met;
   wire tREAD_TO_READ_tREAD_TO_PRE_not_met= ~tREAD_TO_READ_met &&  ~tREAD_TO_PRE_met;
   
   `ifdef REGISTERED_DIMMS
   wire [3:0] RL = mrs_cas + emrs_al + 1'b1; // RL = CL + AL
   `else
   wire [3:0] RL = mrs_cas + emrs_al; // RL = CL + AL
   `endif
   reg rd_dqs_not_asserted;
   reg [9:0] read_queue;
   reg [3:0] rd_data_window;
   wire err_rd_dqs_not_asserted_when_rd_data_ready = rd_dqs_not_asserted;

   initial
   begin
        rd_data_window <= 4'b0;
        read_queue <= 10'b0;
        rd_dqs_not_asserted <= 1'b0;
   end

    always @(posedge ck)
    begin
        read_queue = read_queue << 1;
        if(read_queue[RL])
        begin
            rd_data_window = rd_data_window + (mrs_bl >> 1 );
        end

        if(rd_data_window > 0)
        begin
            rd_dqs_not_asserted = (^dqs[DATA_STROBE_NUM - 1 : 0] != 1'b1 && ^dqs[DATA_STROBE_NUM - 1 : 0] != 1'b0 );
            rd_data_window = rd_data_window - 1;
        end

        if(bank_cmd_READ)
            read_queue[0] <= 1'b1;
    end


    // WL = RL - 1 == AL + CL - 1
    wire [3:0] WL = RL - 1; 
    reg wr_dqs_not_asserted;
    wire err_wr_dqs_not_asserted_when_wr_data_ready = wr_dqs_not_asserted;
    reg [9:0] write_queue;
    reg [3:0] wr_data_window;

    initial
    begin
    wr_data_window <= 4'b0;
    write_queue <= 10'b0;
    wr_dqs_not_asserted <= 1'b0;
    end

    always @(posedge ck)
    begin
        write_queue = write_queue << 1;
        if(write_queue[WL])
        begin
            wr_data_window = wr_data_window + (mrs_bl >> 1);
        end

        if(wr_data_window > 0)
        begin
            wr_dqs_not_asserted = (^dqs[DATA_STROBE_NUM - 1 : 0] != 1'b1 && ^dqs[DATA_STROBE_NUM - 1 : 0] != 1'b0 );
            wr_data_window = wr_data_window - 1;
        end

        if(bank_cmd_WRITE)
            write_queue[0] <= 1'b1;
    end


   // Bank FSM /*{{{*/
    always @(posedge ck or posedge areset) 
    begin
        if(areset) 
        begin
	        ddr2_bank_err <= 19'b0; 
	        bank_state <= `BS_IDLE;
            begin_auto_pre <= 1'b0;
        end 
        else 
        begin
  	        case (bank_state)
	        `BS_IDLE: 
                begin
	                if (bank_cmd_PRECHARGE )
		                bank_state <= `BS_PRECHARGE;
	                else if (bank_cmd_ACT)
		                bank_state <= `BS_ROW_ACT;
	                else if ( bank_cmd_non_REF_MRS_NOP ) 
                        begin
		                    bank_state <= `BS_ILLEGAL;
		                    ddr2_bank_err[0] <= 1'b1;
	                    end
	                else
		                bank_state <= `BS_IDLE;	      
	            end
	  
	        // I merge the ROW_ACTIVATING state into the ROW_ACT state,
	        // since ROW_ACTIVATING -> ROW_ACT is an auto sequence
	        `BS_ROW_ACT: 
                begin
	                if(tACT_TO_READ_tACT_TO_WRITE_tACT_TO_PRE_not_met) 
                    begin
		                if(bank_cmd_NOP)
		                    bank_state <= bank_state;
	      	            else 
                        begin
		                    bank_state <= `BS_ILLEGAL;
		                    ddr2_bank_err[1] <= 1'b1;
		                end
	                end 
                    else if (bank_cmd_PRECHARGE) 
                    begin
		                if (tACT_TO_PRE_met)
		                    bank_state <= `BS_PRECHARGE;
		                else 
                        begin
		                    bank_state <= `BS_ILLEGAL;
		                    ddr2_bank_err[2] <= 1'b1;
		                end
	                end 
                    else if (bank_cmd_READ) 
                    begin
	      	            if(tACT_TO_READ_met)
		                // If a READ is with addr[10] asserted, autopre is performed
		                    if(addr_10)    
		                        bank_state <= `BS_READING_AUTOPRE;
	      	                else
		                        bank_state <= `BS_READING;
		                else 
                        begin
		                    bank_state <= `BS_ILLEGAL;
		                    ddr2_bank_err[3] <= 1'b1;
		                end
	                end 
                    else if (bank_cmd_WRITE) 
                    begin
		                if (tACT_TO_WRITE_met)
		                    if(addr_10)
		                        bank_state <= `BS_WRITING_AUTOPRE;
	      	                else
		                        bank_state <= `BS_WRITING;
		                else 
                        begin
		                    bank_state <= `BS_ILLEGAL;
		                    ddr2_bank_err[4] <= 1'b1;
		                end
	                end 
                    else if (bank_cmd_NOP)
                        bank_state <= bank_state;
                    else
                    begin
                        bank_state <= `BS_ILLEGAL;
                        ddr2_bank_err[18] <= 1'b1;
                    end
	            end // BS_ROW_ACT
	   
	   
	        `BS_WRITING:
                begin
	                if(tWRITE_TO_READ_tWRITE_TO_PRE_not_met)
                    begin
		                if(bank_cmd_NOP)
		                    bank_state <= bank_state;
	      	            else 
                        begin
		                    bank_state <= `BS_ILLEGAL;
		                    ddr2_bank_err[5] <= 1'b1;
		                end
                    end
                    else if (bank_cmd_PRECHARGE) 
                    begin
                        if (tACT_TO_PRE_met &&  tWRITE_TO_PRE_met)
                            bank_state <= `BS_PRECHARGE;
                        else 
                        begin
                            bank_state <= `BS_ILLEGAL;
                            ddr2_bank_err[6] <= 1'b1;
                        end
                    end 
                    else if (bank_cmd_READ)  
                    begin
                        if(tWRITE_TO_READ_met)
                        // If a READ is with addr[10] asserted, autopre is performed
                            if(addr_10)    
                                bank_state <= `BS_READING_AUTOPRE;
                            else
                                bank_state <= `BS_READING;
                        else 
                        begin
                            bank_state <= `BS_ILLEGAL;
                            ddr2_bank_err[7] <= 1'b1;
                        end
                    end 
                    else if (bank_cmd_WRITE) 
                    begin
                        if (tWRITE_TO_WRITE_met)
                            if(addr_10)
                                bank_state <= `BS_WRITING_AUTOPRE;
                            else
                                bank_state <= `BS_WRITING;
                        else 
                        begin
                            bank_state <= `BS_ILLEGAL;
                            ddr2_bank_err[8] <= 1'b1;
                        end
                    end 
                    else if (bank_cmd_NOP) 
                    begin
                     // from WRITE to BS_ROW_ACT is an auto path which
                     // means if tWRIE_TO_READ_met && tWRITE_TO_WRITE_met &&
                     // tWRITE_TO_PRE_met
     
                        if(tWRITE_TO_READ_met && tWRITE_TO_WRITE_met && tWRITE_TO_PRE_met)
                            bank_state <= `BS_ROW_ACT;
                        else
                            bank_state <= bank_state;
                    end 
                    else 
                    begin
                        bank_state <= `BS_ILLEGAL;
                        ddr2_bank_err[9] <= 1'b1;
                    end
	            end // case: `BS_WRITING
      
	   
	        // from WRITE_A to PRE is an auto path when tWRITE_TO_PRE_met
	        `BS_WRITING_AUTOPRE: 
                begin
	                if (bank_cmd_NOP) 
                    begin
		                if(tWRITE_TO_PRE_met)
                        begin
		                    bank_state <= `BS_PRECHARGE;
                            begin_auto_pre <= 1'b1;
                        end
		                else
		                    bank_state <= bank_state;
	                end 
                    else 
                    begin
	       	            bank_state <= `BS_ILLEGAL;
		                ddr2_bank_err[10] <= 1'b1;
	                end
		
	            end // case: `BS_WRITING_AUTOPRE
	
      
	        `BS_READING:
                begin
	                if(tREAD_TO_READ_tREAD_TO_PRE_not_met) 
                    begin
		                if(bank_cmd_NOP)
		                    bank_state <= bank_state;
	      	            else 
                        begin
		                    bank_state <= `BS_ILLEGAL;
		                    ddr2_bank_err[11] <= 1'b1;
		                end
	                end 
                    else if (bank_cmd_PRECHARGE) 
                    begin
		                if (tACT_TO_PRE_met &&  tREAD_TO_PRE_met)
		                    bank_state <= `BS_PRECHARGE;
		                else 
                        begin
		                    bank_state <= `BS_ILLEGAL;
		                    ddr2_bank_err[12] <= 1'b1;
		                end
	                end 
                    else if (bank_cmd_READ) 
                    begin
		                if(tREAD_TO_READ_met)
		                // If a READ is with addr[10] asserted, autopre is performed
		                    if(addr_10)    
		                        bank_state <= `BS_READING_AUTOPRE;
	      	                else
		                        bank_state <= `BS_READING;
		                else 
                        begin
		                    bank_state <= `BS_ILLEGAL;
		                    ddr2_bank_err[13] <= 1'b1;
		                end
	                end 
                    else if (bank_cmd_WRITE) 
                    begin
		                if (tREAD_TO_WRITE_met)
		                    if(addr_10)
		                        bank_state <= `BS_WRITING_AUTOPRE;
	      	                else
		                        bank_state <= `BS_WRITING;
		                else 
                        begin
		                    bank_state <= `BS_ILLEGAL;
		                    ddr2_bank_err[14] <= 1'b1;
		                end
	                end 
                    else if (bank_cmd_NOP) 
                    begin
                     // from READ to BS_ROW_ACT is an auto path which
                     // means if tREAD_TO_READ_met && tREAD_TO_WRITE_met &&
                     // tREAD_TO_PRE_met
		                if(tREAD_TO_READ_met && tREAD_TO_WRITE_met && tREAD_TO_PRE_met)
		                    bank_state <= `BS_ROW_ACT;
		                else
		                    bank_state <= bank_state;
	                end 
                    else  
                    begin
		                bank_state <= `BS_ILLEGAL;
		                ddr2_bank_err[15] <= 1'b1;
	                end
	            end // case: `BS_READING
	   
	        `BS_READING_AUTOPRE: 
                begin
	                if (bank_cmd_NOP) 
                    begin
		                if(tREAD_TO_PRE_met)
                        begin
		                    bank_state <= `BS_PRECHARGE;
                            begin_auto_pre <= 1'b1;
                        end
		                else
		                    bank_state <= bank_state;
	                end 
                    else 
                    begin
	   	                bank_state <= `BS_ILLEGAL;
		                ddr2_bank_err[16] <= 1'b1;
	                end
	            end
	   
	        `BS_PRECHARGE:
                begin
	                if(bank_cmd_NOP)
		                if(~tPRE_TO_IDLE_met)
		                    bank_state <= bank_state;
	      	            else
                        begin
		                    bank_state <= `BS_IDLE;
                            begin_auto_pre <= 1'b0;
                        end
	                else 
                    begin
		                bank_state <= `BS_ILLEGAL;
		                ddr2_bank_err[17] <= 1'b1;
	                end
	            end
	   
	        `CS_ILLEGAL:
                begin
	                bank_state <= `BS_ILLEGAL;
	            end // CS_ILLEGAL

	        endcase // case(bank_state)
        end // else: !if(arese)
    end // always @(posedge ck or posedge areset) /*}}}*/
   
    `ifdef DDR2_0IN_SIM_MON /*{{{*/
    always @(posedge ck) begin
    `ifdef NO_Ill_cmd_while_bank_idle_CHECK
    `else
if (Ill_cmd_while_bank_idle)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_while_bank_idle \n"); // 0in < fire -message ("Ill_cmd_while_bank_idle \n")
    `endif

    `ifdef NO_Ill_cmd_after_act_while_act_to_rd_wr_pre_timing_not_met_CHECK
    `else
if (Ill_cmd_after_act_while_act_to_rd_wr_pre_timing_not_met)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_act_while_act_to_rd_wr_pre_timing_not_met \n"); //0in < fire -message ("Ill_cmd_after_act_while_act_to_rd_wr_pre_timing_not_met \n")
    `endif

    `ifdef NO_act_to_pre_timing_not_met_CHECK
    `else
if (act_to_pre_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "act_to_pre_timing_not_met\n"); //0in < fire -message ("act_to_pre_timing_not_met \n")
    `endif

    `ifdef NO_act_to_rd_timing_not_met_CHECK
    `else
if (act_to_rd_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "act_to_rd_timing_not_met\n"); //0in < fire -message ("act_to_rd_timing_not_met \n")
    `endif

    `ifdef NO_act_to_wr_timing_not_met_CHECK
    `else
if (act_to_wr_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "act_to_wr_timing_not_met\n"); //0in < fire -message ("act_to_wr_timing_not_met \n")
    `endif

    `ifdef NO_Ill_cmd_after_wr_while_wr_to_rd_pre_timing_not_met_CHECK
    `else
if (Ill_cmd_after_wr_while_wr_to_rd_pre_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_wr_while_wr_to_rd_pre_timing_not_met\n"); //0in < fire -message ("Ill_cmd_after_wr_while_wr_to_rd_pre_timing_not_met \n")
    `endif

    `ifdef NO_wr_to_pre_or_act_to_pre_timing_not_met_when_wr_to_pre_CHECK
    `else
if (wr_to_pre_or_act_to_pre_timing_not_met_when_wr_to_pre )
    `PR_ERROR("ddr2_monitor", `ERROR, "wr_to_pre_or_act_to_pre_timing_not_met_when_wr_to_pre\n"); //0in < fire -message ("wr_to_pre_or_act_to_pre_timing_not_met_when_wr_to_pre \n")
    `endif

    `ifdef NO_wr_to_rd_timing_not_met_when_wr_to_rd_CHECK
    `else
if (wr_to_rd_timing_not_met_when_wr_to_rd )
    `PR_ERROR("ddr2_monitor", `ERROR, "wr_to_rd_timing_not_met_when_wr_to_rd\n"); //0in < fire -message ("wr_to_rd_timing_not_met_when_wr_to_rd \n")
    `endif

    `ifdef NO_wr_to_wr_timing_not_met_CHECK
    `else
if (wr_to_wr_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "wr_to_wr_timing_not_met\n"); //0in < fire -message ("wr_to_wr_timing_not_met \n")
    `endif

    `ifdef NO_Ill_cmd_after_wr_CHECK
    `else
if (Ill_cmd_after_wr )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_wr\n"); //0in < fire -message ("Ill_cmd_after_wr \n")
    `endif

    `ifdef NO_Ill_cmd_after_wra_CHECK
    `else
if (Ill_cmd_after_wra )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_wra\n"); //0in < fire -message ("Ill_cmd_after_wra \n")
    `endif

    `ifdef NO_Ill_cmd_after_rd_while_rd_to_rd_and_rd_pre_timing_not_met_CHECK
    `else
if (Ill_cmd_after_rd_while_rd_to_rd_and_rd_pre_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_rd_while_rd_to_rd_and_rd_pre_timing_not_met\n"); //0in < fire -message ("Ill_cmd_after_rd_while_rd_to_rd_and_rd_pre_timing_not_met \n")
    `endif

    `ifdef NO_rd_to_pre_or_act_to_pre_timing_not_met_when_rd_pre_CHECK
    `else
if (rd_to_pre_or_act_to_pre_timing_not_met_when_rd_pre )
    `PR_ERROR("ddr2_monitor", `ERROR, "rd_to_pre_or_act_to_pre_timing_not_met_when_rd_pre\n"); //0in < fire -message ("rd_to_pre_or_act_to_pre_timing_not_met_when_rd_pre \n")
    `endif

    `ifdef NO_rd_to_rd_timing_not_met_CHECK
    `else
if (rd_to_rd_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "rd_to_rd_timing_not_met\n"); //0in < fire -message ("rd_to_rd_timing_not_met \n")
    `endif

    `ifdef NO_rd_to_wr_timing_not_met_CHECK
    `else
if (rd_to_wr_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "rd_to_wr_timing_not_met\n"); //0in < fire -message ("rd_to_wr_timing_not_met \n")
    `endif

    `ifdef NO_Ill_cmd_after_rd_CHECK
    `else
if (Ill_cmd_after_rd )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_rd\n"); //0in < fire -message ("Ill_cmd_after_rd \n")
    `endif

    `ifdef NO_Ill_cmd_after_rda_CHECK
    `else
if (Ill_cmd_after_rda )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_rda\n"); //0in < fire -message ("Ill_cmd_after_rda \n")
    `endif

    `ifdef NO_Ill_cmd_after_pre_CHECK
    `else
if (Ill_cmd_after_pre )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_pre\n"); //0in < fire -message ("Ill_cmd_after_pre \n")
    `endif

    `ifdef NO_Ill_cmd_while_bank_active_CHECK
    `else
if(Ill_cmd_while_bank_active)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_while_bank_active\n"); // 0in < fire -message ("Ill_cmd_while_bank_active\n")
    `endif

    `ifdef NO_Ill_bank_state_CHECK
    `else
if (Ill_bank_state )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_bank_state\n"); //0in < fire -message ("Ill_bank_state \n")
    `endif

    `ifdef NO_err_rd_dqs_not_asserted_when_rd_data_ready_CHECK
    `else
        if(err_rd_dqs_not_asserted_when_rd_data_ready)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_rd_dqs_not_asserted_when_rd_data_ready\n"); // 0in < fire -message ("err_rd_dqs_not_asserted_when_rd_data_ready\n")
    `endif

    `ifdef NO_err_wr_dqs_not_asserted_when_wr_data_ready_CHECK
    `else
        if(err_wr_dqs_not_asserted_when_wr_data_ready)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_wr_dqs_not_asserted_when_wr_data_ready\n"); // 0in < fire -message ("err_wr_dqs_not_asserted_when_wr_data_ready\n")
    `endif

    end
    `else /*}}}*/
    `ifdef DDR2_OVA_SIM_MON /*{{{*/
    always @(posedge ck) begin
    `ifdef NO_Ill_cmd_while_bank_idle_CHECK
    `else
if (Ill_cmd_while_bank_idle)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_while_bank_idle \n"); 
    /* ova ova_asserted ddr2_bank_ova1
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_cmd_while_bank_idle\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_while_bank_idle), `START, `STOP ); */
    `endif

    `ifdef NO_Ill_cmd_after_act_while_act_to_rd_wr_pre_timing_not_met_CHECK
    `else
if (Ill_cmd_after_act_while_act_to_rd_wr_pre_timing_not_met)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_act_while_act_to_rd_wr_pre_timing_not_met \n"); 
    /* ova ova_asserted ddr2_bank_ova2
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_cmd_after_act_while_act_to_rd_wr_pre_timing_not_met\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_after_act_while_act_to_rd_wr_pre_timing_not_met), `START, `STOP ); */
    `endif

    `ifdef NO_act_to_pre_timing_not_met_CHECK
    `else
if (act_to_pre_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "act_to_pre_timing_not_met\n"); 
    /* ova ova_asserted ddr2_bank_ova3
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: act_to_pre_timing_not_met\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(act_to_pre_timing_not_met), `START, `STOP ); */
    `endif

    `ifdef NO_act_to_rd_timing_not_met_CHECK
    `else
if (act_to_rd_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "act_to_rd_timing_not_met\n"); 
    /* ova ova_asserted ddr2_bank_ova4
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: act_to_rd_timing_not_met\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(act_to_rd_timing_not_met), `START, `STOP ); */
    `endif

    `ifdef NO_act_to_wr_timing_not_met_CHECK
    `else
if (act_to_wr_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "act_to_wr_timing_not_met\n"); 
    /* ova ova_asserted ddr2_bank_ova5
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: act_to_wr_timing_not_met\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(act_to_wr_timing_not_met), `START, `STOP ); */
    `endif

    `ifdef NO_Ill_cmd_after_wr_while_wr_to_rd_pre_timing_not_met_CHECK
    `else
if (Ill_cmd_after_wr_while_wr_to_rd_pre_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_wr_while_wr_to_rd_pre_timing_not_met\n"); 
    /* ova ova_asserted ddr2_bank_ova6
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_cmd_after_wr_while_wr_to_rd_pre_timing_not_met\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_after_wr_while_wr_to_rd_pre_timing_not_met), `START, `STOP ); */
    `endif

    `ifdef NO_wr_to_pre_or_act_to_pre_timing_not_met_when_wr_to_pre_CHECK
    `else
if (wr_to_pre_or_act_to_pre_timing_not_met_when_wr_to_pre )
    `PR_ERROR("ddr2_monitor", `ERROR, "wr_to_pre_or_act_to_pre_timing_not_met_when_wr_to_pre\n"); 
    /* ova ova_asserted ddr2_bank_ova7
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: wr_to_pre_or_act_to_pre_timing_not_met_when_wr_to_pre\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(wr_to_pre_or_act_to_pre_timing_not_met_when_wr_to_pre), `START, `STOP ); */
    `endif

    `ifdef NO_wr_to_rd_timing_not_met_when_wr_to_rd_CHECK
    `else
if (wr_to_rd_timing_not_met_when_wr_to_rd )
    `PR_ERROR("ddr2_monitor", `ERROR, "wr_to_rd_timing_not_met_when_wr_to_rd\n"); 
    /* ova ova_asserted ddr2_bank_ova8
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: wr_to_rd_timing_not_met_when_wr_to_rd\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(wr_to_rd_timing_not_met_when_wr_to_rd), `START, `STOP ); */
    `endif

    `ifdef NO_wr_to_wr_timing_not_met_CHECK
    `else
if (wr_to_wr_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "wr_to_wr_timing_not_met\n"); 
    /* ova ova_asserted ddr2_bank_ova9
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: wr_to_wr_timing_not_met\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(wr_to_wr_timing_not_met), `START, `STOP ); */
    `endif

    `ifdef NO_Ill_cmd_after_wr_CHECK
    `else
if (Ill_cmd_after_wr )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_wr\n"); 
    /* ova ova_asserted ddr2_bank_ova10
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_cmd_after_wr\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_after_wr), `START, `STOP ); */
    `endif

    `ifdef NO_Ill_cmd_after_wra_CHECK
    `else
if (Ill_cmd_after_wra )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_wra\n"); 
    /* ova ova_asserted ddr2_bank_ova11
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_cmd_after_wra\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_after_wra), `START, `STOP ); */
    `endif

    `ifdef NO_Ill_cmd_after_rd_while_rd_to_rd_and_rd_pre_timing_not_met_CHECK
    `else
if (Ill_cmd_after_rd_while_rd_to_rd_and_rd_pre_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_rd_while_rd_to_rd_and_rd_pre_timing_not_met\n"); 
    /* ova ova_asserted ddr2_bank_ova12
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_cmd_after_rd_while_rd_to_rd_and_rd_pre_timing_not_met\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_after_rd_while_rd_to_rd_and_rd_pre_timing_not_met), `START, `STOP ); */
    `endif

    `ifdef NO_rd_to_pre_or_act_to_pre_timing_not_met_when_rd_pre_CHECK
    `else
if (rd_to_pre_or_act_to_pre_timing_not_met_when_rd_pre )
    `PR_ERROR("ddr2_monitor", `ERROR, "rd_to_pre_or_act_to_pre_timing_not_met_when_rd_pre\n"); 
    /* ova ova_asserted ddr2_bank_ova13
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: rd_to_pre_or_act_to_pre_timing_not_met_when_rd_pre\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(rd_to_pre_or_act_to_pre_timing_not_met_when_rd_pre), `START, `STOP ); */
    `endif

    `ifdef NO_rd_to_rd_timing_not_met_CHECK
    `else
if (rd_to_rd_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "rd_to_rd_timing_not_met\n"); 
    /* ova ova_asserted ddr2_bank_ova14
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: rd_to_rd_timing_not_met\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(rd_to_rd_timing_not_met), `START, `STOP ); */
    `endif

    `ifdef NO_rd_to_wr_timing_not_met_CHECK
    `else
if (rd_to_wr_timing_not_met )
    `PR_ERROR("ddr2_monitor", `ERROR, "rd_to_wr_timing_not_met\n"); 
    /* ova ova_asserted ddr2_bank_ova15
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: rd_to_wr_timing_not_met\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(rd_to_wr_timing_not_met), `START, `STOP ); */
    `endif

    `ifdef NO_Ill_cmd_after_rd_CHECK
    `else
if (Ill_cmd_after_rd )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_rd\n"); 
    /* ova ova_asserted ddr2_bank_ova16
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_cmd_after_rd\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_after_rd), `START, `STOP ); */
    `endif

    `ifdef NO_Ill_cmd_after_rda_CHECK
    `else
if (Ill_cmd_after_rda )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_rda\n"); 
    /* ova ova_asserted ddr2_bank_ova17
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_cmd_after_rda\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_after_rda), `START, `STOP ); */
    `endif

    `ifdef NO_Ill_cmd_after_pre_CHECK
    `else
if (Ill_cmd_after_pre )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_after_pre\n"); 
    /* ova ova_asserted ddr2_bank_ova18
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_cmd_after_pre\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_after_pre), `START, `STOP ); */
    `endif

    `ifdef NO_Ill_cmd_while_bank_active_CHECK
    `else
if(Ill_cmd_while_bank_active)
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_cmd_while_bank_active\n"); 
    /* ova ova_asserted ddr2_bank_ova19
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_cmd_while_bank_active\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_cmd_while_bank_active), `START, `STOP ); */
    `endif

    `ifdef NO_Ill_bank_state_CHECK
    `else
if (Ill_bank_state )
    `PR_ERROR("ddr2_monitor", `ERROR, "Ill_bank_state\n"); 
    /* ova ova_asserted ddr2_bank_ova20
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: Ill_bank_state\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(Ill_bank_state), `START, `STOP ); */
    `endif

    `ifdef NO_err_rd_dqs_not_asserted_when_rd_data_ready_CHECK
    `else
        if(err_rd_dqs_not_asserted_when_rd_data_ready)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_rd_dqs_not_asserted_when_rd_data_ready\n"); 
            /* ova ova_asserted ddr2_bank_ova21
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: err_rd_dqs_not_asserted_when_rd_data_ready\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_rd_dqs_not_asserted_when_rd_data_ready), `START, `STOP ); */
    `endif

    `ifdef NO_err_wr_dqs_not_asserted_when_wr_data_ready_CHECK
    `else
        if(err_wr_dqs_not_asserted_when_wr_data_ready)
            `PR_ERROR("ddr2_monitor", `ERROR, "err_wr_dqs_not_asserted_when_wr_data_ready\n"); 
            /* ova ova_asserted ddr2_bank_ova22
#(`DELAY, `EDGE_EXPR, "ERROR: DDR2_bank_mon: err_wr_dqs_not_asserted_when_wr_data_ready\n", `SEVERITY, `CATEGORY)
(!(areset), ck, !(err_wr_dqs_not_asserted_when_wr_data_ready), `START, `STOP ); */
    `endif

    end
    `endif
    `endif /*}}}*/

endmodule // ddr_bank /*}}}*/
/*}}}*/
