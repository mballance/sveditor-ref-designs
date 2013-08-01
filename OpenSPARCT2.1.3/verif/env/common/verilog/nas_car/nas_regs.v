// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nas_regs.v
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
`ifndef GATESIM

wire [63:0] GSR_wire =  { GSR_reg[42:11]           , // Mask
                          4'b0                     , // Unused
                          GSR_reg[10]              , // IM
                          GSR_reg[9:8]             , // IRND
                          17'b0                    , // Unused
                          GSR_reg[7:3]             , // Scale
                          GSR_reg[2:0]               // Align
                          };


wire [63:0] FSR_wire = {26'b0                 , // unused
                             FSR_reg[7:6]     , // fcc3
                             FSR_reg[5:4]     , // fcc2
                             FSR_reg[3:2]     , // fcc1
                             FSR_reg[27:26]   , // RD
                             2'b0             , // unused
                             FSR_reg[25:21]   , // TEM
                             FSR_reg[20]      , // NS
                             2'b0             , // unused
                             3'b0             , // ver
                             1'b0             , // ftt[2]
                             FSR_reg[19:18]   , // ftt[1:0]
                             1'b0             , // qne
                             1'b0             , // unused
                             FSR_reg[1:0]     , // fcc0
                             FSR_reg[17:13]   , // aexc
                             FSR_reg[12:8] }  ; // cexc

// Exploding Trap Stack 


wire [47:0] TPC1_wire     = {Trap_Entry_1[91:46],2'b0};
wire [47:0] TNPC1_wire    = {Trap_Entry_1[45:0],2'b0};
wire [8 :0] TT1_wire      = Trap_Entry_1[100:92];
wire [41:0] TSTATE1_wire  = {Trap_Entry_1[132:131],    // GL[1:0]
                             Trap_Entry_1[130:123],    // CCR[7:0]
                             Trap_Entry_1[122:115],    // ASI[7:0]
                             2'b0,
                             1'b0,                     // pstate[13]
                             Trap_Entry_1[111],        // pstate.tct
                             2'b0,
                             Trap_Entry_1[113],        // pstate.cle
                             Trap_Entry_1[112],        // pstate.tle
                             3'b0,
                             Trap_Entry_1[108:105],    // pstate.{pef.am.prv.ie}
                             1'b0,
                             5'b0,
                             Trap_Entry_1[103:101]     // CWP[2:0]
                             };
wire [10:0] HTSTATE1_wire = {Trap_Entry_1[114],        // hpstate.ibe
                             4'b0,
                             Trap_Entry_1[109],        // hpstate.red
                             2'b0,
                             Trap_Entry_1[110],        // hpstate.hpriv
                             1'b0,
                             Trap_Entry_1[104]         // hpstate.tlz
                             };


wire [47:0] TPC2_wire     = {Trap_Entry_2[91:46],2'b0};
wire [47:0] TNPC2_wire    = {Trap_Entry_2[45:0],2'b0};
wire [8 :0] TT2_wire      = Trap_Entry_2[100:92];
wire [41:0] TSTATE2_wire  = {Trap_Entry_2[132:131],    // GL[1:0]
                             Trap_Entry_2[130:123],    // CCR[7:0]
                             Trap_Entry_2[122:115],    // ASI[7:0]
                             2'b0,
                             1'b0,                     // pstate[13]
                             Trap_Entry_2[111],        // pstate.tct
                             2'b0,
                             Trap_Entry_2[113],        // pstate.cle
                             Trap_Entry_2[112],        // pstate.tle
                             3'b0,
                             Trap_Entry_2[108:105],    // pstate.{pef.am.prv.ie}
                             1'b0,
                             5'b0,
                             Trap_Entry_2[103:101]     // CWP[2:0]
                             };
wire [10:0] HTSTATE2_wire = {Trap_Entry_2[114],        // hpstate.ibe
                             4'b0,
                             Trap_Entry_2[109],        // hpstate.red
                             2'b0,
                             Trap_Entry_2[110],        // hpstate.hpriv
                             1'b0,
                             Trap_Entry_2[104]         // hpstate.tlz
                             };


wire [47:0] TPC3_wire     = {Trap_Entry_3[91:46],2'b0};
wire [47:0] TNPC3_wire    = {Trap_Entry_3[45:0],2'b0};
wire [8 :0] TT3_wire      = Trap_Entry_3[100:92];
wire [41:0] TSTATE3_wire  = {Trap_Entry_3[132:131],    // GL[1:0]
                             Trap_Entry_3[130:123],    // CCR[7:0]
                             Trap_Entry_3[122:115],    // ASI[7:0]
                             2'b0,
                             1'b0,                     // pstate[13]
                             Trap_Entry_3[111],        // pstate.tct
                             2'b0,
                             Trap_Entry_3[113],        // pstate.cle
                             Trap_Entry_3[112],        // pstate.tle
                             3'b0,
                             Trap_Entry_3[108:105],    // pstate.{pef.am.prv.ie}
                             1'b0,
                             5'b0,
                             Trap_Entry_3[103:101]     // CWP[2:0]
                             };
wire [10:0] HTSTATE3_wire = {Trap_Entry_3[114],        // hpstate.ibe
                             4'b0,
                             Trap_Entry_3[109],        // hpstate.red
                             2'b0,
                             Trap_Entry_3[110],        // hpstate.hpriv
                             1'b0,
                             Trap_Entry_3[104]         // hpstate.tlz
                             };


wire [47:0] TPC4_wire     = {Trap_Entry_4[91:46],2'b0};
wire [47:0] TNPC4_wire    = {Trap_Entry_4[45:0],2'b0};
wire [8 :0] TT4_wire      = Trap_Entry_4[100:92];
wire [41:0] TSTATE4_wire  = {Trap_Entry_4[132:131],    // GL[1:0]
                             Trap_Entry_4[130:123],    // CCR[7:0]
                             Trap_Entry_4[122:115],    // ASI[7:0]
                             2'b0,
                             1'b0,                     // pstate[13]
                             Trap_Entry_4[111],        // pstate.tct
                             2'b0,
                             Trap_Entry_4[113],        // pstate.cle
                             Trap_Entry_4[112],        // pstate.tle
                             3'b0,
                             Trap_Entry_4[108:105],    // pstate.{pef.am.prv.ie}
                             1'b0,
                             5'b0,
                             Trap_Entry_4[103:101]     // CWP[2:0]
                             };
wire [10:0] HTSTATE4_wire = {Trap_Entry_4[114],        // hpstate.ibe
                             4'b0,
                             Trap_Entry_4[109],        // hpstate.red
                             2'b0,
                             Trap_Entry_4[110],        // hpstate.hpriv
                             1'b0,
                             Trap_Entry_4[104]         // hpstate.tlz
                             };


wire [47:0] TPC5_wire     = {Trap_Entry_5[91:46],2'b0};
wire [47:0] TNPC5_wire    = {Trap_Entry_5[45:0],2'b0};
wire [8 :0] TT5_wire      = Trap_Entry_5[100:92];
wire [41:0] TSTATE5_wire  = {Trap_Entry_5[132:131],    // GL[1:0]
                             Trap_Entry_5[130:123],    // CCR[7:0]
                             Trap_Entry_5[122:115],    // ASI[7:0]
                             2'b0,
                             1'b0,                     // pstate[13]
                             Trap_Entry_5[111],        // pstate.tct
                             2'b0,
                             Trap_Entry_5[113],        // pstate.cle
                             Trap_Entry_5[112],        // pstate.tle
                             3'b0,
                             Trap_Entry_5[108:105],    // pstate.{pef.am.prv.ie}
                             1'b0,
                             5'b0,
                             Trap_Entry_5[103:101]     // CWP[2:0]
                             };
wire [10:0] HTSTATE5_wire = {Trap_Entry_5[114],        // hpstate.ibe
                             4'b0,
                             Trap_Entry_5[109],        // hpstate.red
                             2'b0,
                             Trap_Entry_5[110],        // hpstate.hpriv
                             1'b0,
                             Trap_Entry_5[104]         // hpstate.tlz
                             };


wire [47:0] TPC6_wire     = {Trap_Entry_6[91:46],2'b0};
wire [47:0] TNPC6_wire    = {Trap_Entry_6[45:0],2'b0};
wire [8 :0] TT6_wire      = Trap_Entry_6[100:92];
wire [41:0] TSTATE6_wire  = {Trap_Entry_6[132:131],    // GL[1:0]
                             Trap_Entry_6[130:123],    // CCR[7:0]
                             Trap_Entry_6[122:115],    // ASI[7:0]
                             2'b0,
                             1'b0,                     // pstate[13]
                             Trap_Entry_6[111],        // pstate.tct
                             2'b0,
                             Trap_Entry_6[113],        // pstate.cle
                             Trap_Entry_6[112],        // pstate.tle
                             3'b0,
                             Trap_Entry_6[108:105],    // pstate.{pef.am.prv.ie}
                             1'b0,
                             5'b0,
                             Trap_Entry_6[103:101]     // CWP[2:0]
                             };
wire [10:0] HTSTATE6_wire = {Trap_Entry_6[114],        // hpstate.ibe
                             4'b0,
                             Trap_Entry_6[109],        // hpstate.red
                             2'b0,
                             Trap_Entry_6[110],        // hpstate.hpriv
                             1'b0,
                             Trap_Entry_6[104]         // hpstate.tlz
                             };



wire [63:0] TICK_CMPR_wire = {~TICK_CMPR_reg[63],TICK_CMPR_reg[62:0]};
wire [63:0] STICK_CMPR_wire = {~STICK_CMPR_reg[63],STICK_CMPR_reg[62:0]};
wire [63:0] HSTICK_CMPR_wire = {~HSTICK_CMPR_reg[63],HSTICK_CMPR_reg[62:0]};

`endif
