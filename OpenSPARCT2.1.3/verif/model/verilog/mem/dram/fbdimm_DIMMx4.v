// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fbdimm_DIMMx4.v
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
`timescale 1ps/1ps

module fbdimm_DIMMx4 (CK, bCK, CKE, bCS, bRAS, bCAS, bWE, 
                      BA, Addr, DQ, CB, DQS, bDQS, DM_RDQS,
                      bRDQS, ODT, term, CS_SEL, l0state);

   parameter regdel=500; // ps
   
`ifdef DRAM_SAT 
   parameter addr_bits=15,
`else
   parameter addr_bits=17,
`endif

`ifdef DRAM_BANK_BITS2
   bank_bits=2,
`else
   bank_bits=3,
`endif

   data_bits=64,
   dqs_bits=9;

   input    			CK,bCK;   		// Clock Signals
   input [17:0] 		CKE;      		// Clock Enable
   input [17:0] 		bCS;      		// Rank/Chip Selects
   input [17:0] 		bRAS, bCAS, bWE;	// Command Inputs
   input [(bank_bits-1):0] 	BA;			// Address Inputs (Bank sel)
   input [(addr_bits-1):0] 	Addr;			// Address Inputs
   inout [(data_bits-1):0] 	DQ;			// Data Bus
   inout [7:0] 		   	CB; 		   
   inout [(dqs_bits-1):0]       DQS, bDQS;		// Data Strobe (bidir)
   inout [(dqs_bits-1):0]       DM_RDQS, bRDQS;		// Data Mask
   input [17:0] 		ODT;			// On Die Termination
   output [17:0] 		term;
   input [7:0] 			CS_SEL;
   input			l0state;

   supply0 		   	vss; 		   
   supply1 		   	vdd;

`ifdef X4_REGISTER

   reg [17:0] 		   ODT_int;
   reg [17:0] 		   CKE_int, bCS_int;
   reg [17:0]		   bRAS_int, bCAS_int, bWE_int;
   reg [(bank_bits-1):0]   BA_int;
   reg [(addr_bits-1):0]   Addr_int;

   always @(posedge CK)
   begin
      CKE_int 	  <= #regdel CKE;
      bCS_int 	  <= #regdel bCS;
      bRAS_int 	  <= #regdel bRAS;
      bCAS_int 	  <= #regdel bCAS;
      bWE_int 	  <= #regdel bWE;
      BA_int 	  <= #regdel BA;
      Addr_int 	  <= #regdel Addr;
      ODT_int 	  <= #regdel ODT;
   end // always @ (posedge CK)
`else
   wire [17:0] 		   ODT_int;
   wire [17:0] 		   CKE_int, bCS_int;
   wire [17:0]		   bRAS_int, bCAS_int, bWE_int;
   wire [(bank_bits-1):0]   BA_int;
   wire [(addr_bits-1):0]   Addr_int;
   assign CKE_int = CKE;
   assign bCS_int 	  =  bCS;
   assign bRAS_int 	  =  bRAS;
   assign bCAS_int 	  =  bCAS;
   assign bWE_int 	  =  bWE;
   assign BA_int 	  =  BA;
   assign Addr_int 	  =  Addr;
   assign ODT_int 	  =  ODT;
`endif
   

   dimm U00 ( .clk (CK),
              .cs  (bCS_int[0]),
              .ras (bRAS_int[0]),
              .cas (bCAS_int[0]),
              .we  (bWE_int[0]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[3:0]),
              .dqs (DQS[0]));

   dimm U02 ( .clk (CK),
              .cs  (bCS_int[1]),
              .ras (bRAS_int[1]),
              .cas (bCAS_int[1]),
              .we  (bWE_int[1]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[11:8]),
              .dqs (DQS[1]));

   dimm U05 ( .clk (CK),
              .cs  (bCS_int[2]),
              .ras (bRAS_int[2]),
              .cas (bCAS_int[2]),
              .we  (bWE_int[2]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[19:16]),
              .dqs (DQS[0]));

   dimm U07 ( .clk (CK),
              .cs  (bCS_int[3]),
              .ras (bRAS_int[3]),
              .cas (bCAS_int[3]),
              .we  (bWE_int[3]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[27:24]),
              .dqs (DQS[0]));

   dimm U09 ( .clk (CK),
              .cs  (bCS_int[4]),
              .ras (bRAS_int[4]),
              .cas (bCAS_int[4]),
              .we  (bWE_int[4]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[35:32]),
              .dqs (DQS[0]));


   dimm U11 ( .clk (CK),
              .cs  (bCS_int[5]),
              .ras (bRAS_int[5]),
              .cas (bCAS_int[5]),
              .we  (bWE_int[5]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[43:40]),
              .dqs (DQS[0]));

   dimm U14 ( .clk (CK),
              .cs  (bCS_int[6]),
              .ras (bRAS_int[6]),
              .cas (bCAS_int[6]),
              .we  (bWE_int[6]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[51:48]),
              .dqs (DQS[0]));

   dimm U16 ( .clk (CK),
              .cs  (bCS_int[7]),
              .ras (bRAS_int[7]),
              .cas (bCAS_int[7]),
              .we  (bWE_int[7]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[59:56]),
              .dqs (DQS[0]));

   dimm U04 ( .clk (CK),
              .cs  (bCS_int[8]),
              .ras (bRAS_int[8]),
              .cas (bCAS_int[8]),
              .we  (bWE_int[8]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (CB[3:0]),
              .dqs (DQS[0]));

   dimm U01 ( .clk (CK),
              .cs  (bCS_int[9]),
              .ras (bRAS_int[9]),
              .cas (bCAS_int[9]),
              .we  (bWE_int[9]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[7:4]),
              .dqs (DQS[0]));

   dimm U03 ( .clk (CK),
              .cs  (bCS_int[10]),
              .ras (bRAS_int[10]),
              .cas (bCAS_int[10]),
              .we  (bWE_int[10]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[15:12]),
              .dqs (DQS[0]));

   dimm U06 ( .clk (CK),
              .cs  (bCS_int[11]),
              .ras (bRAS_int[11]),
              .cas (bCAS_int[11]),
              .we  (bWE_int[11]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[23:20]),
              .dqs (DQS[0]));

   dimm U08 ( .clk (CK),
              .cs  (bCS_int[12]),
              .ras (bRAS_int[12]),
              .cas (bCAS_int[12]),
              .we  (bWE_int[12]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[31:28]),
              .dqs (DQS[0]));

   dimm U10 ( .clk (CK),
              .cs  (bCS_int[13]),
              .ras (bRAS_int[13]),
              .cas (bCAS_int[13]),
              .we  (bWE_int[13]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[39:36]),
              .dqs (DQS[0]));

   dimm U12 ( .clk (CK),
              .cs  (bCS_int[14]),
              .ras (bRAS_int[14]),
              .cas (bCAS_int[14]),
              .we  (bWE_int[14]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[47:44]),
              .dqs (DQS[0]));

   dimm U15 ( .clk (CK),
              .cs  (bCS_int[15]),
              .ras (bRAS_int[15]),
              .cas (bCAS_int[15]),
              .we  (bWE_int[15]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[55:52]),
              .dqs (DQS[0]));

   dimm U17 ( .clk (CK),
              .cs  (bCS_int[16]),
              .ras (bRAS_int[16]),
              .cas (bCAS_int[16]),
              .we  (bWE_int[16]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (DQ[63:60]),
              .dqs (DQS[0]));

   dimm U13 ( .clk (CK),
              .cs  (bCS_int[17]),
              .ras (bRAS_int[17]),
              .cas (bCAS_int[17]),
              .we  (bWE_int[17]),
              .ba  (BA_int),
              .addr (Addr_int),
              .cs_sel (CS_SEL),
              .dataq (CB[7:4]),
              .dqs (DQS[0]));



endmodule 
