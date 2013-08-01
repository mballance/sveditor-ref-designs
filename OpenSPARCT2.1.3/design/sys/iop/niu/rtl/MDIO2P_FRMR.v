// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: MDIO2P_FRMR.v
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
// FUNCTION: Identify MDIO Frames, and identify keys cycles within each
//           frame
// COMMENTS: Uses a 6-bit LFSR to map out the MDIO frame.  Cycles within the
//           frame are identified as follows:
//
//           Cycle MDIO Code   Parameter Comment
//           ----- ---- ------ --------- -------------------
//             -    1   000000 frmr_WT   >= 32 bits of preamble complete
//             -    1   110010 frmr_PRE  Start of Preamble
//             0    1   100100            .
//             1    0/1 001001 frmr_SOF  Clause specifier
//             2    OP  010010           Opcode
//             3    OP  100101           Opcode
//             4    PA  001011           Port Address
//             5    PA  010110            .
//             6    PA  101101            .
//             7    PA  011011            .
//             8    PA  110111            .
//             9    DA  101110           Device Address
//            10    DA  011101            .
//            11    DA  111011            .
//            12    DA  110110            .
//            13    DA  101100            .
//            14    1/Z 011001 frmr_ADD   Z on reads, 1 on writes
//            15    0   110011 frmr_TA    Turn around
//            16    D   100110            Data
//            17    D   001101            .
//            18    D   011010            .
//            19    D   110101            .
//            20    D   101010            .
//            21    D   010101            .
//            22    D   101011            .
//            23    D   010111            .
//            24    D   101111            .
//            25    D   011111            .
//            26    D   111111            .
//            27    D   111110            .
//            28    D   111100            .
//            29    D   111000            .
//            30    D   110000            .
//            31    D   100000 frmr_EOF   End of frame
//
//  VERSION: #VERSION#
//     DATE: #DATE#
//
//  Date    Author  Changes
// -------  ------  -----------------------------------------------------
// 27Jan05  Andre   Asynchronous reset removed 
//
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module MDIO2P_FRMR
 (
  IO_MDCLK,
  IO_RESET,
  MDIN,
  FRMR_STATE
 );
 
////////////////////////////////////////////////////////////////////////////////
//
// Port Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

  input        IO_RESET;           // Global reset

  // MDIO Interface
  input        IO_MDCLK;           // Clock
  input        MDIN;               // Data in

  // Interface to Framer
  output[5:0]  FRMR_STATE;         // LFSR encoded frame state


////////////////////////////////////////////////////////////////////////////////
//
// Outputs which are not wires
//
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
//
// Parameters for frame sequencing
//
////////////////////////////////////////////////////////////////////////////////

  parameter  frmr_WT          = 6'b000000;
  parameter  frmr_PRE         = 6'b110010;
  parameter  frmr_SOF         = 6'b001001;
  parameter  frmr_EOF         = 6'b100000;


////////////////////////////////////////////////////////////////////////////////
//
// Internal Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

  // Flops
  reg[5:0]   state;
  reg        preamble;             // Preamble in progress

  // Combinatorials
  wire       frame_done;           // EOF state decode
  wire       preamble_done;        // Preamble at least 32 cycles long


////////////////////////////////////////////////////////////////////////////////
//
// Framer
// - Frame requires 32 states.
// - Frames start with a 0 on MDIN, and can repeat back to back.
// - Preamble is arbitrarily long, during which LFSR is held at zero.
// - Starting position is chosen to make force to zero as simple as possible
//
////////////////////////////////////////////////////////////////////////////////

  assign frame_done    = (state == frmr_EOF);
  assign preamble_done = frame_done | (state == frmr_WT);

  always @(posedge IO_MDCLK)
  begin
    if(IO_RESET)
    begin
      state    <= frmr_PRE;
      preamble <= 1'b1;      
    end
    else if(preamble & ~preamble_done & ~MDIN)
      state <= frmr_PRE;
    else if(preamble & preamble_done &  MDIN)
      state <= frmr_WT;
    else if(preamble & preamble_done & ~MDIN)
    begin
      state    <=  frmr_SOF;
      preamble <= ~preamble;        
    end
    else if(frame_done)
    begin
      state    <= frmr_PRE;
      preamble <= ~preamble;        
    end
    else
      state <= {state[4:0], state[5] ^ state[4]};
  end


////////////////////////////////////////////////////////////////////////////////
//
// Output Assignments
//
////////////////////////////////////////////////////////////////////////////////

  assign FRMR_STATE = preamble ? 5'b0 : state;

endmodule
