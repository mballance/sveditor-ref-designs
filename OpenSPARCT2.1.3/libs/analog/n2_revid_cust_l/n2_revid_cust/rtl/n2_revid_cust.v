// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_revid_cust.v
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

module n2_revid_cust ( jtag_revid_in, mask_minor, jtag_revid_out, spc_revid_out);

   input  [3:0]     jtag_revid_in;
   input  [3:0]     mask_minor;

   output [3:0]     jtag_revid_out;
   output [3:0]     spc_revid_out;


   wire  [3:0]     jtag_vector_metal_01;
   wire  [3:0]     jtag_vector_metal_02;
   wire  [3:0]     jtag_vector_metal_03;
   wire  [3:0]     jtag_vector_metal_04;
   wire  [3:0]     jtag_vector_metal_05;
   wire  [3:0]     jtag_vector_metal_06;
   wire  [3:0]     jtag_vector_metal_07;
   wire  [3:0]     jtag_vector_metal_08;
   wire  [3:0]     jtag_vector_metal_09;
   wire  [3:0]     jtag_vector_metal_10;
   wire  [3:0]     jtag_vector_metal_11;


   wire  [3:0]     mask_vector_metal_01;
   wire  [3:0]     mask_vector_metal_02;
   wire  [3:0]     mask_vector_metal_03;
   wire  [3:0]     mask_vector_metal_04;
   wire  [3:0]     mask_vector_metal_05;
   wire  [3:0]     mask_vector_metal_06;
   wire  [3:0]     mask_vector_metal_07;
   wire  [3:0]     mask_vector_metal_08;
   wire  [3:0]     mask_vector_metal_09;
   wire  [3:0]     mask_vector_metal_10;
   wire  [3:0]     mask_vector_metal_11;


   //synopsys translate_off


// How to set the versions:
//
// This custom controls the minor revision field of the HVER register
// (via spc_revid_out[3:0]) and the JTAG version number 
// (via jtag_revid_out[3:0]).
//
// The minor revision field indicates the metal mask revision number
// (the "y" in TO x.y).
//
// The JTAG version number is a unique value for each tapeout.
//
// If a tapeout affects all metal layers, then
// 	- the inputs (spec_revid_in[3:0], jtag_revid_in[3:0]) can be set
//		to the values required of the version registers
// and
//	- the "metal_nn" masks in this custom can be set to all zeroes
//
// If a tapeout does not affect all metal layers, then
//	- the inputs should not be changed from the previous tapeout
// and
// 	- the "metal_nn" masks corresponding to the layer being changed
//		should be set to flip the bits (via XOR) in the input
//		vectors (and other metal masks) to generate the new 
//		revision numbers.
//
// Paul Jordan 01/25/2007


// The following comments were made by Hunter Donahue, but they
// make little sense.  
////////////////////////////////////////////////////////////////////////
// For the following JTAG_VECTOR and MASK_VECTOR the user
// must assign the vector to either of two values: (4'b0000, 4'b1111)  (only one of these two values)

// We start the initial programming to all be 4'0000 for (TO 1.0)  Hunter Donahue  July 11, 2005
////////////////////////////////////////////////////////////////////////
// The preceeding comments were made by Hunter Donahue, but they
// make little sense.  

   assign jtag_vector_metal_01 = 4'b0000; 
   assign jtag_vector_metal_02 = 4'b0000; 
   assign jtag_vector_metal_03 = 4'b0111; // set for TO 2.2 to change input 4'b0011 to output 4'b0100
   assign jtag_vector_metal_04 = 4'b0000; 
   assign jtag_vector_metal_05 = 4'b0000; 
   assign jtag_vector_metal_06 = 4'b0000; 
   assign jtag_vector_metal_07 = 4'b0000; 
   assign jtag_vector_metal_08 = 4'b0000; 
   assign jtag_vector_metal_09 = 4'b0000; 
   assign jtag_vector_metal_10 = 4'b0000; 
   assign jtag_vector_metal_11 = 4'b0000; 


   assign mask_vector_metal_01 = 4'b0000; 
   assign mask_vector_metal_02 = 4'b0000; 
   assign mask_vector_metal_03 = 4'b0011; // set for TO 2.2 to change input 4'b0001 to output 4'b0010
   assign mask_vector_metal_04 = 4'b0000; 
   assign mask_vector_metal_05 = 4'b0000; 
   assign mask_vector_metal_06 = 4'b0000; 
   assign mask_vector_metal_07 = 4'b0000; 
   assign mask_vector_metal_08 = 4'b0000; 
   assign mask_vector_metal_09 = 4'b0000; 
   assign mask_vector_metal_10 = 4'b0000; 
   assign mask_vector_metal_11 = 4'b0000; 

   
   assign jtag_revid_out = jtag_revid_in ^
                jtag_vector_metal_01 ^  jtag_vector_metal_02 ^  jtag_vector_metal_03 ^  jtag_vector_metal_04 ^
                jtag_vector_metal_05 ^  jtag_vector_metal_06 ^  jtag_vector_metal_07 ^  jtag_vector_metal_08 ^
                jtag_vector_metal_09 ^  jtag_vector_metal_10 ^  jtag_vector_metal_11; 

   assign spc_revid_out = mask_minor ^
                mask_vector_metal_01 ^  mask_vector_metal_02 ^  mask_vector_metal_03 ^  mask_vector_metal_04 ^
                mask_vector_metal_05 ^  mask_vector_metal_06 ^  mask_vector_metal_07 ^  mask_vector_metal_08 ^
                mask_vector_metal_09 ^  mask_vector_metal_10 ^  mask_vector_metal_11;

   
   //synopsys translate_on

endmodule 

