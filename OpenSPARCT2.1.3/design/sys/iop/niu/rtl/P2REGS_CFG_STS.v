// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: P2REGS_CFG_STS.v
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
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2004 Texas Instruments, Inc.
// All rights reserved
//
// This is an unpublished work created in the year stated above.
// Texas Instruments owns all rights in and to the work and intends to
// maintain it and protect it as unpublished copyright. In the event
// of either inadvertant or deliberate publication, the above stated
// date shall be treated as the year of first publication. In the event
// of such publication, Texas Instruments intends to enforce its rights
// in the work under the copyright laws as a published work.
//
// These commodities are under U.S. Government distribution license
// control. As such, they are not be re-exported without prior approval
// from the U.S. Department of Commerce.
//
////////////////////////////////////////////////////////////////////////////////
// ***********************************************************************
//
//  File: P2REGS_CFG_STS.v
//
//  Author: Andre Szczepanek 
//
//  Purpose: CFG/STS register block
//             
//
//  Date    Author  Changes
// -------  ------  -----------------------------------------------------
// 21May04  Andre   Created 
// 27Jan05  Andre   Asynchronous reset removed 
// 31Jan05  Andre   Asynchronous sticky input removed 
// 
// ***********************************************************************
////////////////////////////////////////////////////////////////////////////////
//
//                    ____      ____      ___
//          MDCLK ___/    \____/    \____/  
//                               _________
//             PW XXXXX_________/         XXX
//                     _________ _________
//             PA XXXXX____A1___X____A2___XXX
//                               _________
//             PR XXXXX_________/         XXX
//                               _________ 
//     WRITE_DATA XXXXXXXXXXXXXXX____Q1___XXX
//                                      ___
//      READ_DATA XXXXXXXXXXXXXXXXXXXXX<D2_>X
//
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module P2REGS_CFG_STS
 (
  RESET,
  MDCLK,
  WDCLK,
  PW,
  PR,
  PA,
  READ_DATA,
  WRITE_DATA,
  CONFIG_BUS,
  STATUS_BUS
 );


////////////////////////////////////////////////////////////////////////////////
//
// Parameters                  
//
////////////////////////////////////////////////////////////////////////////////
 
parameter cfg_width=32;                // (default) config bus width
parameter cfg_reset=32'h5555_5555;     // (default) config reg reset value
parameter cfg_instn=32'h0000_000f;     // (default) config reg bit instantiations

parameter sts_width=32;                // (default) status bus width
parameter sts_reset=32'h5555_5555;     // (default) status reg reset value
parameter sts_instn=32'h0000_000f;     // (default) status reg bit instantiations
parameter sts_stiky=32'h0000_0001;     // (default) status sticky reg bits  

////////////////////////////////////////////////////////////////////////////////
//
// Port Declarations                  
//
////////////////////////////////////////////////////////////////////////////////


  // MDIO Interface
  input        RESET;              // Global reset
  input        MDCLK;              // MDIO Clock
  input        WDCLK;              // WORD Clock 

  // Parallel Interface to MDIO framer
  input        PW;                 // Write enable
  input        PR;                 // Read enable
  input  [1:0] PA;                 // LSB of Address
  input [15:0] WRITE_DATA;         // Data in
  output[15:0] READ_DATA;          // Data out

 
  // Interface to MACRO
  output[cfg_width-1:0]  CONFIG_BUS;      // Config bus output to Macro
  input [sts_width-1:0]  STATUS_BUS;      // Status bus from Macro




////////////////////////////////////////////////////////////////////////////////
//
// Internal Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

  // Flops
  reg  [31:0]  this_config_reg;         // This value for config register
  reg  [31:0]  this_status_reg;         // This value for status register
  

  // Combinatorials
  reg  [31:0]  new__config_reg;         // New  value for config register
  wire [31:0]  next_config_reg;         // Next value for config register
  reg  [31:0]  new__status_reg;         // New  value for status register
  wire [31:0]  new2_status_reg;         // New  value for status register
  wire [31:0]  next_status_reg;         // Next value for status register
 
  wire [31:0]  inst_config_reg;         // Value of config reg with non-instanced bits masked
  wire [31:0]  inst_status_reg;         // Value of status reg with non-instanced bits masked


  // WDCLK Latches
  wire [31:0]  wd_sr_set,      wd_sr_reset;     // set/reset inputs
  wire [31:0]                  next_wd_sr_reg;  // WDCLK Set/Reset Latch
  reg  [31:0]  this_wd_sr_reg;                  // WDCLK Set/Reset Latch
  wire [31:0]                  next_wd_sync_0;  // Sync to WDCLK Domain stage 0
  reg  [31:0]  this_wd_sync_0;                  // Sync to WDCLK Domain stage 0
  reg  [31:0]  this_wd_sync_1;                  // Sync to WDCLK Domain stage 1

  // MDCLK Latches
  wire [31:0]  md_sr_set,      md_sr_reset;     // set/reset inputs
  wire [31:0]                  next_md_sr_reg;  // MDCLK Set/Reset Latch
  reg  [31:0]  this_md_sr_reg;                  // MDCLK Set/Reset Latch
  wire [31:0]                  next_md_sync_0;  // Sync to MDCLK Domain stage 0
  reg  [31:0]  this_md_sync_0;                  // Sync to MDCLK Domain stage 0


////////////////////////////////////////////////////////////////////////////////
//
// Write register 
//
////////////////////////////////////////////////////////////////////////////////

  always @(PW or PA or WRITE_DATA or this_config_reg)
  begin
    // defaults
    new__config_reg   = this_config_reg;

    // MDIO register writes to low and high locations
    //
    if (PW & ~PA[1] & ~PA[0])
      new__config_reg[15:0]  = WRITE_DATA;
     else if (PW & ~PA[1] & PA[0])
      new__config_reg[31:16] = WRITE_DATA;
  end
      
// Force reset values on uninstantiated bits
//
// cfg_instn is bit mask indicating bits to instantiate
// cfg_reset is bit mask indicating register reset values
//
assign next_config_reg   = (new__config_reg & cfg_instn) | (cfg_reset & ~cfg_instn);



////////////////////////////////////////////////////////////////////////////////
//
// Sequential registers for config 
//
////////////////////////////////////////////////////////////////////////////////

  always @(posedge MDCLK)
  begin
    if(RESET)
    begin
      this_config_reg <= cfg_reset;
    end
    else
    begin
      this_config_reg <= next_config_reg;
    end
  end

assign inst_config_reg = (this_config_reg & cfg_instn) | (cfg_reset & ~cfg_instn);


////////////////////////////////////////////////////////////////////////////////
//
// Load STS register 
//
////////////////////////////////////////////////////////////////////////////////

  always @(STATUS_BUS)
  begin
    // defaults
    new__status_reg   = sts_reset;
    
    new__status_reg[sts_width-1:0]   = STATUS_BUS;

  end
      
// Selected Synced SR latch value for sticky bits
//
// sts_stiky is bit mask indicating bits that are sticky
//
assign new2_status_reg   = (this_md_sync_0 & sts_stiky) | (new__status_reg & ~sts_stiky);

// Force reset values on uninstantiated bits
//
// sts_instn is bit mask indicating bits to instantiate
// sts_reset is bit mask indicating register reset values
//
assign next_status_reg   = (new2_status_reg & sts_instn) | (sts_reset & ~sts_instn);

// Create Reset signal for sticky bits
//
// sts_clr is a bit mask indicating bits to clear (synchronous to MDCLK))
//
wire [31:0] sts_clr  = sts_instn & sts_stiky & {32{PA[1]& ~PA[0] & PR}};

 
  



////////////////////////////////////////////////////////////////////////////////
//
// WDCLK Domain 
//
////////////////////////////////////////////////////////////////////////////////

  SYNC_CELL  RESET_WDCLK_SYNC_CELL (.D(RESET),.CP(WDCLK),.Q(RESET_WDCLK)); // loj@8-30-05

// Reset over Set synchronous SR latch
//
assign wd_sr_set      = new__status_reg; // Status bus pulse input
assign wd_sr_reset    = this_wd_sync_1;  // Clear on synced read of a 1 on MDIO
assign next_wd_sr_reg = (~wd_sr_reset) & (this_wd_sr_reg | wd_sr_set) & sts_stiky;

assign next_wd_sync_0 = this_md_sr_reg;

always @(posedge WDCLK)
  begin
    if(RESET_WDCLK) // loj@8-30-05
    begin
      this_wd_sr_reg <= 32'h0000_0000;
      this_wd_sync_0 <= 32'h0000_0000;
      this_wd_sync_1 <= 32'h0000_0000;
    end
    else
    begin
      this_wd_sr_reg <= next_wd_sr_reg;
      this_wd_sync_0 <= next_wd_sync_0;
      this_wd_sync_1 <= this_wd_sync_0;
    end
  end



////////////////////////////////////////////////////////////////////////////////
//
// MDCLK Domain 
//
////////////////////////////////////////////////////////////////////////////////



// Reset over Set synchronous SR latch
//
assign md_sr_set      = this_status_reg & sts_clr & sts_stiky; //STS read clears flag
assign md_sr_reset    = ~this_md_sync_0;
assign next_md_sr_reg = (~md_sr_reset) & (this_md_sr_reg | md_sr_set) & sts_stiky;

assign next_md_sync_0 = this_wd_sr_reg;

always @(posedge MDCLK)
  begin
    if(RESET)
    begin
      this_md_sr_reg  <= 32'h0000_0000;
      this_md_sync_0  <= 32'h0000_0000;
      this_status_reg <= sts_reset;
    end
    else
    begin
      this_md_sr_reg  <= next_md_sr_reg;
      this_md_sync_0  <= next_md_sync_0;
      this_status_reg <= next_status_reg;
    end
  end

 

////////////////////////////////////////////////////////////////////////////////
//
// Output Assignments
//
////////////////////////////////////////////////////////////////////////////////
  
  assign inst_status_reg = (this_status_reg & sts_instn) | (sts_reset & ~sts_instn);

  assign CONFIG_BUS = inst_config_reg[cfg_width-1:0];
  assign READ_DATA  = PA[1] ? (PA[0] ? inst_status_reg[31:16] : inst_status_reg[15:0]) : 
                              (PA[0] ? inst_config_reg[31:16] : inst_config_reg[15:0])   ;

endmodule
