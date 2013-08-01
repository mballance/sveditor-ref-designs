// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: MDIO2P_REGS.v
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
// Copyright (c) 2003 Texas Instruments, Inc.
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

////////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: MDIO Registers and associated decode
// COMMENTS: Contains data shift register, indirect address register, access
//           type decode, and mapping between MDIO and parallel interface
//           signals.
//  VERSION: #VERSION#
//     DATE: #DATE#
//
//  Date    Author  Changes
// -------  ------  -----------------------------------------------------
// 27Jan05  Andre   Asynchronous reset removed 
//
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module MDIO2P_REGS
 (
  MDIN,
  MDOUT,
  MDOE,
  IO_MDCLK,
  IO_RESET,
  IO_CLAUSE45,
  IO_PRTID,
  IO_DEVID,
  IO_BASEAD,
  IO_ACRAD,
  IO_IPRAD,
  PD,
  PW,
  PR,
  PA,
  PQ,
  FRMR_STATE
 );


////////////////////////////////////////////////////////////////////////////////
//
// Port Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

  input        IO_RESET;           // Global reset

  // Parallel Interface
  input[15:0]  PD;                 // Data in
  output       PW;                 // Write enable
  output       PR;                 // Read indicator
  output[9:0]  PA;                 // Address
  output[15:0] PQ;                 // Data out
 
  // MDIO Interface
  input        IO_MDCLK;           // Clock
  input        MDIN;               // Data in
  output       MDOUT;              // Data out
  output       MDOE;               // Output enable

  // Configuration
  input        IO_CLAUSE45;        // Clause45
  input[4:0]   IO_PRTID;           // Port address ID
  input[4:0]   IO_DEVID;           // Device address ID
  input[4:0]   IO_BASEAD;          // Base address
  input[3:0]   IO_ACRAD;           // AddrCtl register address
  input[3:0]   IO_IPRAD;           // Indirect port register address

  // Interface to Framer
  input[5:0]   FRMR_STATE;         // LFSR encoded frame state


////////////////////////////////////////////////////////////////////////////////
//
// Outputs which are not wires
//
////////////////////////////////////////////////////////////////////////////////

  reg          PW;
  reg          PR;
  reg          MDOUT;
  reg          MDOE;


////////////////////////////////////////////////////////////////////////////////
//
// Parameters
// - Frame states are decoded from FRMR_STATE.  See MDIO2P_FRMR for details
//   of the state sequence
//
////////////////////////////////////////////////////////////////////////////////

  parameter  frmr_PRE         = 6'b000000;     
  parameter  frmr_SOF         = 6'b001001;
  parameter  frmr_ADD         = 6'b011001;
  parameter  frmr_TA          = 6'b110011;
  parameter  frmr_EOF         = 6'b100000;


////////////////////////////////////////////////////////////////////////////////
//
// Internal Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

  // Flops
  reg        valid;                // Access is valid 
  reg[1:0]   opcode;               // Operation type
  reg        acacc;                // AddrCtl access
  reg[15:0]  data;                 // Data shift register
  reg[15:0]  addrctl;              // Indirect address

  // Combinatorials
  reg        next_valid;           // Next value for valid
  reg[1:0]   next_opcode;          // Next value for opcode
  reg        next_acacc;           // Next value for acacc
  reg        next_mdoe;            // Next value for MDOE
  reg[15:0]  next_data;            // Next value for data
  reg[15:0]  next_addrctl;         // Next value for addrctl
 
  wire       vsmmdbase;            // Vendor Specific MMD base registers


////////////////////////////////////////////////////////////////////////////////
//
// General decode
// - vsmmdbase identifies LS 16 register locations, which must be readable if
//   mapped to DEVID 30 or 31 (Clause 45 only).
//
////////////////////////////////////////////////////////////////////////////////

  assign vsmmdbase = &IO_DEVID[4:1] & ~|addrctl[15:4];


////////////////////////////////////////////////////////////////////////////////
//
// Access Decode 
// - All access require a match of PRTAD to IO_PRTID
// - Clause 22 accesses require a further match to one of the register addresses
//   (IO_ACRAD or IO_IPRAD).  In both cases, the MSB of REGAD must be 1
// - Clause 45 accesses must be to the address register, or indirect to an
//   address within the range specified by IO_BASEAD, or to an address in the 
//   range 0-15 if the device is 30 or 31.
//
////////////////////////////////////////////////////////////////////////////////

  always @(FRMR_STATE or MDIN or PD or MDOE or valid or acacc or 
           opcode or addrctl or data or vsmmdbase or IO_CLAUSE45 or IO_PRTID or
           IO_DEVID or IO_BASEAD or IO_ACRAD or IO_IPRAD)
  begin
    // defaults
    next_valid   = valid;
    next_acacc   = acacc;
    next_opcode  = opcode;
    next_mdoe    = MDOE;
    next_addrctl = addrctl;
    next_data    = {data[14:0], MDIN};
    
    MDOUT        = data[15];
    PW           = 1'b0;
    PR           = 1'b0;

    casez(FRMR_STATE)
      // Start of frame or Preamble ////////////////////////////////////////////
      // - Reset as no active request
      
      frmr_PRE, frmr_SOF :
      begin
        next_valid = 1'b0;
        next_acacc = 1'b0;
        next_mdoe  = 1'b0;
      end


      // Address and access type fully received ////////////////////////////////
      // - Determine whether to respond to access
      // - At this time, the data register contains the following:
      //   [4:0]   - DEVAD/REGAD
      //   [9:5]   - PRTAD/PHYAD
      //   [11:10] - Opcode (01 = write, 10 = read for Clause 22, 00 = Address
      //                     write, 01 = data write, 10 = post inc read, 11 =
      //                     read for Clause 45)
      //   [12]    - clause specifier (1 for 22, 0 for 45)

      frmr_ADD :
      begin
        next_opcode = data[11:10];

        if(data[9:5] == IO_PRTID)
        begin
          if(IO_CLAUSE45 & ~data[12])
          begin
            if((data[4:0] == IO_DEVID))
            begin
              next_acacc = ~|data[11:10];
              next_valid = (addrctl[15] & (addrctl[14:10] == IO_BASEAD)) | 
                           vsmmdbase | next_acacc;
            end
          end
          else if(~IO_CLAUSE45 & data[12])
          begin
            next_acacc = data[3:0] == IO_ACRAD;
            next_valid = (data[11] ^ data[10]) & data[4] & 
                         (next_acacc | (data[3:0] == IO_IPRAD));
          end
          next_mdoe  = next_valid & data[11];
        end
      end

      // Turn around cycle /////////////////////////////////////////////////////
      // - Drive MDOUT low
      // - Read data is loaded into the data register during any read.  Choices 
      //   are AddrCtl, P2STCI portal or vendor specific MMD base registers.
      //   Selection need not be fully qualified, as MDOUT is only valid when
      //   MDOE is active.
      
      frmr_TA :
      begin
        MDOUT = 1'b0;

        if(opcode[1])
        begin
          if(acacc)
            next_data = addrctl;
          else if(vsmmdbase)
            next_data = {(addrctl[3:0] == 4'h8), 15'b0};
          else
          begin
            next_data = PD;
            PR        = valid;
          end
        end
      end


      // End of Frame //////////////////////////////////////////////////////////
      // - Disable output
      // - Activate PW to write to P2STCI portal on any valid Clause 22 write
      //   not destined for AddrCtl, or any valid Clause 45 write above 8000.
      // - Load AddrCtl on a Clause 22 write, or a Clause 45 address access
      // - Increment AddrCtl (provided the address is not all 1's) on a Clause 
      //   22 access to the P2STCI portal when bit 15 is set, or a Clause 45 
      //   post-increment read.
      
      frmr_EOF :
      begin
        next_mdoe = 1'b0;
        if(valid)
        begin
          if(IO_CLAUSE45)
          begin
            PW = ~acacc & ~opcode[1] & addrctl[15];
            if(acacc)
              next_addrctl = next_data;
            else if ((opcode == 2'b10) & ~&addrctl)
              next_addrctl = addrctl + 1;
          end
          else
          begin
            PW = ~acacc & ~opcode[1];
            if(acacc & ~opcode[1])
              next_addrctl = {next_data[15], 5'b0, next_data[9:0]};
            else if(~acacc & addrctl[15] & ~&addrctl[9:0])
              next_addrctl = addrctl + 1;
          end
        end
      end
    endcase
  end


////////////////////////////////////////////////////////////////////////////////
//
// Sequential registers
//
////////////////////////////////////////////////////////////////////////////////

  always @(posedge IO_MDCLK)
  begin
    if(IO_RESET)
    begin
      MDOE    <= 1'b0;
      addrctl <= 16'h0;
    end
    else
    begin
      MDOE    <= next_mdoe;
      addrctl <= next_addrctl;
    end
  end


  always @(posedge IO_MDCLK)
  begin
    data    <= next_data;
    valid   <= next_valid;
    opcode  <= next_opcode;
    acacc   <= next_acacc;
  end


////////////////////////////////////////////////////////////////////////////////
//
// Output Assignments
//
////////////////////////////////////////////////////////////////////////////////

  assign PA = addrctl[9:0];
  assign PQ = next_data;

endmodule
