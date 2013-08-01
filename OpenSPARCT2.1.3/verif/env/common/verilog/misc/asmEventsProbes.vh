// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: asmEventsProbes.vh
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
wire [63:0] ev_ready;

// one/thread
wire [63:0] ev_pc0;
wire [63:0] ev_pc1;
wire [63:0] ev_pc2;
wire [63:0] ev_pc3;
wire [63:0] ev_pc4;
wire [63:0] ev_pc5;
wire [63:0] ev_pc6;
wire [63:0] ev_pc7;
wire [63:0] ev_pc8;
wire [63:0] ev_pc9;
wire [63:0] ev_pc10;
wire [63:0] ev_pc11;
wire [63:0] ev_pc12;
wire [63:0] ev_pc13;
wire [63:0] ev_pc14;
wire [63:0] ev_pc15;
wire [63:0] ev_pc16;
wire [63:0] ev_pc17;
wire [63:0] ev_pc18;
wire [63:0] ev_pc19;
wire [63:0] ev_pc20;
wire [63:0] ev_pc21;
wire [63:0] ev_pc22;
wire [63:0] ev_pc23;
wire [63:0] ev_pc24;
wire [63:0] ev_pc25;
wire [63:0] ev_pc26;
wire [63:0] ev_pc27;
wire [63:0] ev_pc28;
wire [63:0] ev_pc29;
wire [63:0] ev_pc30;
wire [63:0] ev_pc31;
wire [63:0] ev_pc32;
wire [63:0] ev_pc33;
wire [63:0] ev_pc34;
wire [63:0] ev_pc35;
wire [63:0] ev_pc36;
wire [63:0] ev_pc37;
wire [63:0] ev_pc38;
wire [63:0] ev_pc39;
wire [63:0] ev_pc40;
wire [63:0] ev_pc41;
wire [63:0] ev_pc42;
wire [63:0] ev_pc43;
wire [63:0] ev_pc44;
wire [63:0] ev_pc45;
wire [63:0] ev_pc46;
wire [63:0] ev_pc47;
wire [63:0] ev_pc48;
wire [63:0] ev_pc49;
wire [63:0] ev_pc50;
wire [63:0] ev_pc51;
wire [63:0] ev_pc52;
wire [63:0] ev_pc53;
wire [63:0] ev_pc54;
wire [63:0] ev_pc55;
wire [63:0] ev_pc56;
wire [63:0] ev_pc57;
wire [63:0] ev_pc58;
wire [63:0] ev_pc59;
wire [63:0] ev_pc60;
wire [63:0] ev_pc61;
wire [63:0] ev_pc62;
wire [63:0] ev_pc63;

//--------------------------------------------------
`ifndef GATESIM

//--------------------------------------------------
`ifdef ASM_EVENTS_EARLY


`ifdef CORE_0
     assign ev_pc0 = tb_top.intf0.pc_0_w;
     assign ev_ready[0] = tb_top.intf0.select_pc_b[0];
     assign ev_pc1 = tb_top.intf0.pc_1_w;
     assign ev_ready[1] = tb_top.intf0.select_pc_b[1];
     assign ev_pc2 = tb_top.intf0.pc_2_w;
     assign ev_ready[2] = tb_top.intf0.select_pc_b[2];
     assign ev_pc3 = tb_top.intf0.pc_3_w;
     assign ev_ready[3] = tb_top.intf0.select_pc_b[3];
     assign ev_pc4 = tb_top.intf0.pc_4_w;
     assign ev_ready[4] = tb_top.intf0.select_pc_b[4];
     assign ev_pc5 = tb_top.intf0.pc_5_w;
     assign ev_ready[5] = tb_top.intf0.select_pc_b[5];
     assign ev_pc6 = tb_top.intf0.pc_6_w;
     assign ev_ready[6] = tb_top.intf0.select_pc_b[6];
     assign ev_pc7 = tb_top.intf0.pc_7_w;
     assign ev_ready[7] = tb_top.intf0.select_pc_b[7];
`else
    assign ev_pc0 = 0;
    assign ev_ready[0] = 0;
    assign ev_pc1 = 0;
    assign ev_ready[1] = 0;
    assign ev_pc2 = 0;
    assign ev_ready[2] = 0;
    assign ev_pc3 = 0;
    assign ev_ready[3] = 0;
    assign ev_pc4 = 0;
    assign ev_ready[4] = 0;
    assign ev_pc5 = 0;
    assign ev_ready[5] = 0;
    assign ev_pc6 = 0;
    assign ev_ready[6] = 0;
    assign ev_pc7 = 0;
    assign ev_ready[7] = 0;
`endif

`ifdef CORE_1
     assign ev_pc8 = tb_top.intf1.pc_0_w;
     assign ev_ready[8] = tb_top.intf1.select_pc_b[0];
     assign ev_pc9 = tb_top.intf1.pc_1_w;
     assign ev_ready[9] = tb_top.intf1.select_pc_b[1];
     assign ev_pc10 = tb_top.intf1.pc_2_w;
     assign ev_ready[10] = tb_top.intf1.select_pc_b[2];
     assign ev_pc11 = tb_top.intf1.pc_3_w;
     assign ev_ready[11] = tb_top.intf1.select_pc_b[3];
     assign ev_pc12 = tb_top.intf1.pc_4_w;
     assign ev_ready[12] = tb_top.intf1.select_pc_b[4];
     assign ev_pc13 = tb_top.intf1.pc_5_w;
     assign ev_ready[13] = tb_top.intf1.select_pc_b[5];
     assign ev_pc14 = tb_top.intf1.pc_6_w;
     assign ev_ready[14] = tb_top.intf1.select_pc_b[6];
     assign ev_pc15 = tb_top.intf1.pc_7_w;
     assign ev_ready[15] = tb_top.intf1.select_pc_b[7];
`else
    assign ev_pc8 = 0;
    assign ev_ready[8] = 0;
    assign ev_pc9 = 0;
    assign ev_ready[9] = 0;
    assign ev_pc10 = 0;
    assign ev_ready[10] = 0;
    assign ev_pc11 = 0;
    assign ev_ready[11] = 0;
    assign ev_pc12 = 0;
    assign ev_ready[12] = 0;
    assign ev_pc13 = 0;
    assign ev_ready[13] = 0;
    assign ev_pc14 = 0;
    assign ev_ready[14] = 0;
    assign ev_pc15 = 0;
    assign ev_ready[15] = 0;
`endif

`ifdef CORE_2
     assign ev_pc16 = tb_top.intf2.pc_0_w;
     assign ev_ready[16] = tb_top.intf2.select_pc_b[0];
     assign ev_pc17 = tb_top.intf2.pc_1_w;
     assign ev_ready[17] = tb_top.intf2.select_pc_b[1];
     assign ev_pc18 = tb_top.intf2.pc_2_w;
     assign ev_ready[18] = tb_top.intf2.select_pc_b[2];
     assign ev_pc19 = tb_top.intf2.pc_3_w;
     assign ev_ready[19] = tb_top.intf2.select_pc_b[3];
     assign ev_pc20 = tb_top.intf2.pc_4_w;
     assign ev_ready[20] = tb_top.intf2.select_pc_b[4];
     assign ev_pc21 = tb_top.intf2.pc_5_w;
     assign ev_ready[21] = tb_top.intf2.select_pc_b[5];
     assign ev_pc22 = tb_top.intf2.pc_6_w;
     assign ev_ready[22] = tb_top.intf2.select_pc_b[6];
     assign ev_pc23 = tb_top.intf2.pc_7_w;
     assign ev_ready[23] = tb_top.intf2.select_pc_b[7];
`else
    assign ev_pc16 = 0;
    assign ev_ready[16] = 0;
    assign ev_pc17 = 0;
    assign ev_ready[17] = 0;
    assign ev_pc18 = 0;
    assign ev_ready[18] = 0;
    assign ev_pc19 = 0;
    assign ev_ready[19] = 0;
    assign ev_pc20 = 0;
    assign ev_ready[20] = 0;
    assign ev_pc21 = 0;
    assign ev_ready[21] = 0;
    assign ev_pc22 = 0;
    assign ev_ready[22] = 0;
    assign ev_pc23 = 0;
    assign ev_ready[23] = 0;
`endif

`ifdef CORE_3
     assign ev_pc24 = tb_top.intf3.pc_0_w;
     assign ev_ready[24] = tb_top.intf3.select_pc_b[0];
     assign ev_pc25 = tb_top.intf3.pc_1_w;
     assign ev_ready[25] = tb_top.intf3.select_pc_b[1];
     assign ev_pc26 = tb_top.intf3.pc_2_w;
     assign ev_ready[26] = tb_top.intf3.select_pc_b[2];
     assign ev_pc27 = tb_top.intf3.pc_3_w;
     assign ev_ready[27] = tb_top.intf3.select_pc_b[3];
     assign ev_pc28 = tb_top.intf3.pc_4_w;
     assign ev_ready[28] = tb_top.intf3.select_pc_b[4];
     assign ev_pc29 = tb_top.intf3.pc_5_w;
     assign ev_ready[29] = tb_top.intf3.select_pc_b[5];
     assign ev_pc30 = tb_top.intf3.pc_6_w;
     assign ev_ready[30] = tb_top.intf3.select_pc_b[6];
     assign ev_pc31 = tb_top.intf3.pc_7_w;
     assign ev_ready[31] = tb_top.intf3.select_pc_b[7];
`else
    assign ev_pc24 = 0;
    assign ev_ready[24] = 0;
    assign ev_pc25 = 0;
    assign ev_ready[25] = 0;
    assign ev_pc26 = 0;
    assign ev_ready[26] = 0;
    assign ev_pc27 = 0;
    assign ev_ready[27] = 0;
    assign ev_pc28 = 0;
    assign ev_ready[28] = 0;
    assign ev_pc29 = 0;
    assign ev_ready[29] = 0;
    assign ev_pc30 = 0;
    assign ev_ready[30] = 0;
    assign ev_pc31 = 0;
    assign ev_ready[31] = 0;
`endif

`ifdef CORE_4
     assign ev_pc32 = tb_top.intf4.pc_0_w;
     assign ev_ready[32] = tb_top.intf4.select_pc_b[0];
     assign ev_pc33 = tb_top.intf4.pc_1_w;
     assign ev_ready[33] = tb_top.intf4.select_pc_b[1];
     assign ev_pc34 = tb_top.intf4.pc_2_w;
     assign ev_ready[34] = tb_top.intf4.select_pc_b[2];
     assign ev_pc35 = tb_top.intf4.pc_3_w;
     assign ev_ready[35] = tb_top.intf4.select_pc_b[3];
     assign ev_pc36 = tb_top.intf4.pc_4_w;
     assign ev_ready[36] = tb_top.intf4.select_pc_b[4];
     assign ev_pc37 = tb_top.intf4.pc_5_w;
     assign ev_ready[37] = tb_top.intf4.select_pc_b[5];
     assign ev_pc38 = tb_top.intf4.pc_6_w;
     assign ev_ready[38] = tb_top.intf4.select_pc_b[6];
     assign ev_pc39 = tb_top.intf4.pc_7_w;
     assign ev_ready[39] = tb_top.intf4.select_pc_b[7];
`else
    assign ev_pc32 = 0;
    assign ev_ready[32] = 0;
    assign ev_pc33 = 0;
    assign ev_ready[33] = 0;
    assign ev_pc34 = 0;
    assign ev_ready[34] = 0;
    assign ev_pc35 = 0;
    assign ev_ready[35] = 0;
    assign ev_pc36 = 0;
    assign ev_ready[36] = 0;
    assign ev_pc37 = 0;
    assign ev_ready[37] = 0;
    assign ev_pc38 = 0;
    assign ev_ready[38] = 0;
    assign ev_pc39 = 0;
    assign ev_ready[39] = 0;
`endif

`ifdef CORE_5
     assign ev_pc40 = tb_top.intf5.pc_0_w;
     assign ev_ready[40] = tb_top.intf5.select_pc_b[0];
     assign ev_pc41 = tb_top.intf5.pc_1_w;
     assign ev_ready[41] = tb_top.intf5.select_pc_b[1];
     assign ev_pc42 = tb_top.intf5.pc_2_w;
     assign ev_ready[42] = tb_top.intf5.select_pc_b[2];
     assign ev_pc43 = tb_top.intf5.pc_3_w;
     assign ev_ready[43] = tb_top.intf5.select_pc_b[3];
     assign ev_pc44 = tb_top.intf5.pc_4_w;
     assign ev_ready[44] = tb_top.intf5.select_pc_b[4];
     assign ev_pc45 = tb_top.intf5.pc_5_w;
     assign ev_ready[45] = tb_top.intf5.select_pc_b[5];
     assign ev_pc46 = tb_top.intf5.pc_6_w;
     assign ev_ready[46] = tb_top.intf5.select_pc_b[6];
     assign ev_pc47 = tb_top.intf5.pc_7_w;
     assign ev_ready[47] = tb_top.intf5.select_pc_b[7];
`else
    assign ev_pc40 = 0;
    assign ev_ready[40] = 0;
    assign ev_pc41 = 0;
    assign ev_ready[41] = 0;
    assign ev_pc42 = 0;
    assign ev_ready[42] = 0;
    assign ev_pc43 = 0;
    assign ev_ready[43] = 0;
    assign ev_pc44 = 0;
    assign ev_ready[44] = 0;
    assign ev_pc45 = 0;
    assign ev_ready[45] = 0;
    assign ev_pc46 = 0;
    assign ev_ready[46] = 0;
    assign ev_pc47 = 0;
    assign ev_ready[47] = 0;
`endif

`ifdef CORE_6
     assign ev_pc48 = tb_top.intf6.pc_0_w;
     assign ev_ready[48] = tb_top.intf6.select_pc_b[0];
     assign ev_pc49 = tb_top.intf6.pc_1_w;
     assign ev_ready[49] = tb_top.intf6.select_pc_b[1];
     assign ev_pc50 = tb_top.intf6.pc_2_w;
     assign ev_ready[50] = tb_top.intf6.select_pc_b[2];
     assign ev_pc51 = tb_top.intf6.pc_3_w;
     assign ev_ready[51] = tb_top.intf6.select_pc_b[3];
     assign ev_pc52 = tb_top.intf6.pc_4_w;
     assign ev_ready[52] = tb_top.intf6.select_pc_b[4];
     assign ev_pc53 = tb_top.intf6.pc_5_w;
     assign ev_ready[53] = tb_top.intf6.select_pc_b[5];
     assign ev_pc54 = tb_top.intf6.pc_6_w;
     assign ev_ready[54] = tb_top.intf6.select_pc_b[6];
     assign ev_pc55 = tb_top.intf6.pc_7_w;
     assign ev_ready[55] = tb_top.intf6.select_pc_b[7];
`else
    assign ev_pc48 = 0;
    assign ev_ready[48] = 0;
    assign ev_pc49 = 0;
    assign ev_ready[49] = 0;
    assign ev_pc50 = 0;
    assign ev_ready[50] = 0;
    assign ev_pc51 = 0;
    assign ev_ready[51] = 0;
    assign ev_pc52 = 0;
    assign ev_ready[52] = 0;
    assign ev_pc53 = 0;
    assign ev_ready[53] = 0;
    assign ev_pc54 = 0;
    assign ev_ready[54] = 0;
    assign ev_pc55 = 0;
    assign ev_ready[55] = 0;
`endif

`ifdef CORE_7
     assign ev_pc56 = tb_top.intf7.pc_0_w;
     assign ev_ready[56] = tb_top.intf7.select_pc_b[0];
     assign ev_pc57 = tb_top.intf7.pc_1_w;
     assign ev_ready[57] = tb_top.intf7.select_pc_b[1];
     assign ev_pc58 = tb_top.intf7.pc_2_w;
     assign ev_ready[58] = tb_top.intf7.select_pc_b[2];
     assign ev_pc59 = tb_top.intf7.pc_3_w;
     assign ev_ready[59] = tb_top.intf7.select_pc_b[3];
     assign ev_pc60 = tb_top.intf7.pc_4_w;
     assign ev_ready[60] = tb_top.intf7.select_pc_b[4];
     assign ev_pc61 = tb_top.intf7.pc_5_w;
     assign ev_ready[61] = tb_top.intf7.select_pc_b[5];
     assign ev_pc62 = tb_top.intf7.pc_6_w;
     assign ev_ready[62] = tb_top.intf7.select_pc_b[6];
     assign ev_pc63 = tb_top.intf7.pc_7_w;
     assign ev_ready[63] = tb_top.intf7.select_pc_b[7];
`else
    assign ev_pc56 = 0;
    assign ev_ready[56] = 0;
    assign ev_pc57 = 0;
    assign ev_ready[57] = 0;
    assign ev_pc58 = 0;
    assign ev_ready[58] = 0;
    assign ev_pc59 = 0;
    assign ev_ready[59] = 0;
    assign ev_pc60 = 0;
    assign ev_ready[60] = 0;
    assign ev_pc61 = 0;
    assign ev_ready[61] = 0;
    assign ev_pc62 = 0;
    assign ev_ready[62] = 0;
    assign ev_pc63 = 0;
    assign ev_ready[63] = 0;
`endif


//--------------------------------------------------
`else  // ASM_EVENTS_EARLY


`ifdef CORE_0
     assign ev_pc0 = tb_top.nas_top.c0.t0.pc_fw2;
     assign ev_ready[0] = |tb_top.nas_top.c0.t0.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc1 = tb_top.nas_top.c0.t1.pc_fw2;
     assign ev_ready[1] = |tb_top.nas_top.c0.t1.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc2 = tb_top.nas_top.c0.t2.pc_fw2;
     assign ev_ready[2] = |tb_top.nas_top.c0.t2.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc3 = tb_top.nas_top.c0.t3.pc_fw2;
     assign ev_ready[3] = |tb_top.nas_top.c0.t3.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc4 = tb_top.nas_top.c0.t4.pc_fw2;
     assign ev_ready[4] = |tb_top.nas_top.c0.t4.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc5 = tb_top.nas_top.c0.t5.pc_fw2;
     assign ev_ready[5] = |tb_top.nas_top.c0.t5.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc6 = tb_top.nas_top.c0.t6.pc_fw2;
     assign ev_ready[6] = |tb_top.nas_top.c0.t6.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc7 = tb_top.nas_top.c0.t7.pc_fw2;
     assign ev_ready[7] = |tb_top.nas_top.c0.t7.complete_fw2[7:0]; // 1 bit/unit
`else
    assign ev_pc0 = 0;
    assign ev_ready[0] = 0;
    assign ev_pc1 = 0;
    assign ev_ready[1] = 0;
    assign ev_pc2 = 0;
    assign ev_ready[2] = 0;
    assign ev_pc3 = 0;
    assign ev_ready[3] = 0;
    assign ev_pc4 = 0;
    assign ev_ready[4] = 0;
    assign ev_pc5 = 0;
    assign ev_ready[5] = 0;
    assign ev_pc6 = 0;
    assign ev_ready[6] = 0;
    assign ev_pc7 = 0;
    assign ev_ready[7] = 0;
`endif

`ifdef CORE_1
     assign ev_pc8 = tb_top.nas_top.c1.t0.pc_fw2;
     assign ev_ready[8] = |tb_top.nas_top.c1.t0.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc9 = tb_top.nas_top.c1.t1.pc_fw2;
     assign ev_ready[9] = |tb_top.nas_top.c1.t1.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc10 = tb_top.nas_top.c1.t2.pc_fw2;
     assign ev_ready[10] = |tb_top.nas_top.c1.t2.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc11 = tb_top.nas_top.c1.t3.pc_fw2;
     assign ev_ready[11] = |tb_top.nas_top.c1.t3.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc12 = tb_top.nas_top.c1.t4.pc_fw2;
     assign ev_ready[12] = |tb_top.nas_top.c1.t4.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc13 = tb_top.nas_top.c1.t5.pc_fw2;
     assign ev_ready[13] = |tb_top.nas_top.c1.t5.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc14 = tb_top.nas_top.c1.t6.pc_fw2;
     assign ev_ready[14] = |tb_top.nas_top.c1.t6.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc15 = tb_top.nas_top.c1.t7.pc_fw2;
     assign ev_ready[15] = |tb_top.nas_top.c1.t7.complete_fw2[7:0]; // 1 bit/unit
`else
    assign ev_pc8 = 0;
    assign ev_ready[8] = 0;
    assign ev_pc9 = 0;
    assign ev_ready[9] = 0;
    assign ev_pc10 = 0;
    assign ev_ready[10] = 0;
    assign ev_pc11 = 0;
    assign ev_ready[11] = 0;
    assign ev_pc12 = 0;
    assign ev_ready[12] = 0;
    assign ev_pc13 = 0;
    assign ev_ready[13] = 0;
    assign ev_pc14 = 0;
    assign ev_ready[14] = 0;
    assign ev_pc15 = 0;
    assign ev_ready[15] = 0;
`endif

`ifdef CORE_2
     assign ev_pc16 = tb_top.nas_top.c2.t0.pc_fw2;
     assign ev_ready[16] = |tb_top.nas_top.c2.t0.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc17 = tb_top.nas_top.c2.t1.pc_fw2;
     assign ev_ready[17] = |tb_top.nas_top.c2.t1.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc18 = tb_top.nas_top.c2.t2.pc_fw2;
     assign ev_ready[18] = |tb_top.nas_top.c2.t2.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc19 = tb_top.nas_top.c2.t3.pc_fw2;
     assign ev_ready[19] = |tb_top.nas_top.c2.t3.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc20 = tb_top.nas_top.c2.t4.pc_fw2;
     assign ev_ready[20] = |tb_top.nas_top.c2.t4.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc21 = tb_top.nas_top.c2.t5.pc_fw2;
     assign ev_ready[21] = |tb_top.nas_top.c2.t5.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc22 = tb_top.nas_top.c2.t6.pc_fw2;
     assign ev_ready[22] = |tb_top.nas_top.c2.t6.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc23 = tb_top.nas_top.c2.t7.pc_fw2;
     assign ev_ready[23] = |tb_top.nas_top.c2.t7.complete_fw2[7:0]; // 1 bit/unit
`else
    assign ev_pc16 = 0;
    assign ev_ready[16] = 0;
    assign ev_pc17 = 0;
    assign ev_ready[17] = 0;
    assign ev_pc18 = 0;
    assign ev_ready[18] = 0;
    assign ev_pc19 = 0;
    assign ev_ready[19] = 0;
    assign ev_pc20 = 0;
    assign ev_ready[20] = 0;
    assign ev_pc21 = 0;
    assign ev_ready[21] = 0;
    assign ev_pc22 = 0;
    assign ev_ready[22] = 0;
    assign ev_pc23 = 0;
    assign ev_ready[23] = 0;
`endif

`ifdef CORE_3
     assign ev_pc24 = tb_top.nas_top.c3.t0.pc_fw2;
     assign ev_ready[24] = |tb_top.nas_top.c3.t0.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc25 = tb_top.nas_top.c3.t1.pc_fw2;
     assign ev_ready[25] = |tb_top.nas_top.c3.t1.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc26 = tb_top.nas_top.c3.t2.pc_fw2;
     assign ev_ready[26] = |tb_top.nas_top.c3.t2.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc27 = tb_top.nas_top.c3.t3.pc_fw2;
     assign ev_ready[27] = |tb_top.nas_top.c3.t3.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc28 = tb_top.nas_top.c3.t4.pc_fw2;
     assign ev_ready[28] = |tb_top.nas_top.c3.t4.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc29 = tb_top.nas_top.c3.t5.pc_fw2;
     assign ev_ready[29] = |tb_top.nas_top.c3.t5.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc30 = tb_top.nas_top.c3.t6.pc_fw2;
     assign ev_ready[30] = |tb_top.nas_top.c3.t6.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc31 = tb_top.nas_top.c3.t7.pc_fw2;
     assign ev_ready[31] = |tb_top.nas_top.c3.t7.complete_fw2[7:0]; // 1 bit/unit
`else
    assign ev_pc24 = 0;
    assign ev_ready[24] = 0;
    assign ev_pc25 = 0;
    assign ev_ready[25] = 0;
    assign ev_pc26 = 0;
    assign ev_ready[26] = 0;
    assign ev_pc27 = 0;
    assign ev_ready[27] = 0;
    assign ev_pc28 = 0;
    assign ev_ready[28] = 0;
    assign ev_pc29 = 0;
    assign ev_ready[29] = 0;
    assign ev_pc30 = 0;
    assign ev_ready[30] = 0;
    assign ev_pc31 = 0;
    assign ev_ready[31] = 0;
`endif

`ifdef CORE_4
     assign ev_pc32 = tb_top.nas_top.c4.t0.pc_fw2;
     assign ev_ready[32] = |tb_top.nas_top.c4.t0.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc33 = tb_top.nas_top.c4.t1.pc_fw2;
     assign ev_ready[33] = |tb_top.nas_top.c4.t1.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc34 = tb_top.nas_top.c4.t2.pc_fw2;
     assign ev_ready[34] = |tb_top.nas_top.c4.t2.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc35 = tb_top.nas_top.c4.t3.pc_fw2;
     assign ev_ready[35] = |tb_top.nas_top.c4.t3.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc36 = tb_top.nas_top.c4.t4.pc_fw2;
     assign ev_ready[36] = |tb_top.nas_top.c4.t4.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc37 = tb_top.nas_top.c4.t5.pc_fw2;
     assign ev_ready[37] = |tb_top.nas_top.c4.t5.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc38 = tb_top.nas_top.c4.t6.pc_fw2;
     assign ev_ready[38] = |tb_top.nas_top.c4.t6.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc39 = tb_top.nas_top.c4.t7.pc_fw2;
     assign ev_ready[39] = |tb_top.nas_top.c4.t7.complete_fw2[7:0]; // 1 bit/unit
`else
    assign ev_pc32 = 0;
    assign ev_ready[32] = 0;
    assign ev_pc33 = 0;
    assign ev_ready[33] = 0;
    assign ev_pc34 = 0;
    assign ev_ready[34] = 0;
    assign ev_pc35 = 0;
    assign ev_ready[35] = 0;
    assign ev_pc36 = 0;
    assign ev_ready[36] = 0;
    assign ev_pc37 = 0;
    assign ev_ready[37] = 0;
    assign ev_pc38 = 0;
    assign ev_ready[38] = 0;
    assign ev_pc39 = 0;
    assign ev_ready[39] = 0;
`endif

`ifdef CORE_5
     assign ev_pc40 = tb_top.nas_top.c5.t0.pc_fw2;
     assign ev_ready[40] = |tb_top.nas_top.c5.t0.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc41 = tb_top.nas_top.c5.t1.pc_fw2;
     assign ev_ready[41] = |tb_top.nas_top.c5.t1.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc42 = tb_top.nas_top.c5.t2.pc_fw2;
     assign ev_ready[42] = |tb_top.nas_top.c5.t2.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc43 = tb_top.nas_top.c5.t3.pc_fw2;
     assign ev_ready[43] = |tb_top.nas_top.c5.t3.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc44 = tb_top.nas_top.c5.t4.pc_fw2;
     assign ev_ready[44] = |tb_top.nas_top.c5.t4.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc45 = tb_top.nas_top.c5.t5.pc_fw2;
     assign ev_ready[45] = |tb_top.nas_top.c5.t5.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc46 = tb_top.nas_top.c5.t6.pc_fw2;
     assign ev_ready[46] = |tb_top.nas_top.c5.t6.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc47 = tb_top.nas_top.c5.t7.pc_fw2;
     assign ev_ready[47] = |tb_top.nas_top.c5.t7.complete_fw2[7:0]; // 1 bit/unit
`else
    assign ev_pc40 = 0;
    assign ev_ready[40] = 0;
    assign ev_pc41 = 0;
    assign ev_ready[41] = 0;
    assign ev_pc42 = 0;
    assign ev_ready[42] = 0;
    assign ev_pc43 = 0;
    assign ev_ready[43] = 0;
    assign ev_pc44 = 0;
    assign ev_ready[44] = 0;
    assign ev_pc45 = 0;
    assign ev_ready[45] = 0;
    assign ev_pc46 = 0;
    assign ev_ready[46] = 0;
    assign ev_pc47 = 0;
    assign ev_ready[47] = 0;
`endif

`ifdef CORE_6
     assign ev_pc48 = tb_top.nas_top.c6.t0.pc_fw2;
     assign ev_ready[48] = |tb_top.nas_top.c6.t0.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc49 = tb_top.nas_top.c6.t1.pc_fw2;
     assign ev_ready[49] = |tb_top.nas_top.c6.t1.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc50 = tb_top.nas_top.c6.t2.pc_fw2;
     assign ev_ready[50] = |tb_top.nas_top.c6.t2.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc51 = tb_top.nas_top.c6.t3.pc_fw2;
     assign ev_ready[51] = |tb_top.nas_top.c6.t3.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc52 = tb_top.nas_top.c6.t4.pc_fw2;
     assign ev_ready[52] = |tb_top.nas_top.c6.t4.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc53 = tb_top.nas_top.c6.t5.pc_fw2;
     assign ev_ready[53] = |tb_top.nas_top.c6.t5.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc54 = tb_top.nas_top.c6.t6.pc_fw2;
     assign ev_ready[54] = |tb_top.nas_top.c6.t6.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc55 = tb_top.nas_top.c6.t7.pc_fw2;
     assign ev_ready[55] = |tb_top.nas_top.c6.t7.complete_fw2[7:0]; // 1 bit/unit
`else
    assign ev_pc48 = 0;
    assign ev_ready[48] = 0;
    assign ev_pc49 = 0;
    assign ev_ready[49] = 0;
    assign ev_pc50 = 0;
    assign ev_ready[50] = 0;
    assign ev_pc51 = 0;
    assign ev_ready[51] = 0;
    assign ev_pc52 = 0;
    assign ev_ready[52] = 0;
    assign ev_pc53 = 0;
    assign ev_ready[53] = 0;
    assign ev_pc54 = 0;
    assign ev_ready[54] = 0;
    assign ev_pc55 = 0;
    assign ev_ready[55] = 0;
`endif

`ifdef CORE_7
     assign ev_pc56 = tb_top.nas_top.c7.t0.pc_fw2;
     assign ev_ready[56] = |tb_top.nas_top.c7.t0.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc57 = tb_top.nas_top.c7.t1.pc_fw2;
     assign ev_ready[57] = |tb_top.nas_top.c7.t1.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc58 = tb_top.nas_top.c7.t2.pc_fw2;
     assign ev_ready[58] = |tb_top.nas_top.c7.t2.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc59 = tb_top.nas_top.c7.t3.pc_fw2;
     assign ev_ready[59] = |tb_top.nas_top.c7.t3.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc60 = tb_top.nas_top.c7.t4.pc_fw2;
     assign ev_ready[60] = |tb_top.nas_top.c7.t4.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc61 = tb_top.nas_top.c7.t5.pc_fw2;
     assign ev_ready[61] = |tb_top.nas_top.c7.t5.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc62 = tb_top.nas_top.c7.t6.pc_fw2;
     assign ev_ready[62] = |tb_top.nas_top.c7.t6.complete_fw2[7:0]; // 1 bit/unit
     assign ev_pc63 = tb_top.nas_top.c7.t7.pc_fw2;
     assign ev_ready[63] = |tb_top.nas_top.c7.t7.complete_fw2[7:0]; // 1 bit/unit
`else
    assign ev_pc56 = 0;
    assign ev_ready[56] = 0;
    assign ev_pc57 = 0;
    assign ev_ready[57] = 0;
    assign ev_pc58 = 0;
    assign ev_ready[58] = 0;
    assign ev_pc59 = 0;
    assign ev_ready[59] = 0;
    assign ev_pc60 = 0;
    assign ev_ready[60] = 0;
    assign ev_pc61 = 0;
    assign ev_ready[61] = 0;
    assign ev_pc62 = 0;
    assign ev_ready[62] = 0;
    assign ev_pc63 = 0;
    assign ev_ready[63] = 0;
`endif


`endif  // ASM_EVENTS_EARLY

//--------------------------------------------------
`else   // GATESIM


`ifdef CORE_0
     assign ev_pc0 = tb_top.nas_top.c0.t0.pc_fw2;
     assign ev_ready[0] = tb_top.nas_top.c0.t0.inst_valid_fw2;
     assign ev_pc1 = tb_top.nas_top.c0.t1.pc_fw2;
     assign ev_ready[1] = tb_top.nas_top.c0.t1.inst_valid_fw2;
     assign ev_pc2 = tb_top.nas_top.c0.t2.pc_fw2;
     assign ev_ready[2] = tb_top.nas_top.c0.t2.inst_valid_fw2;
     assign ev_pc3 = tb_top.nas_top.c0.t3.pc_fw2;
     assign ev_ready[3] = tb_top.nas_top.c0.t3.inst_valid_fw2;
     assign ev_pc4 = tb_top.nas_top.c0.t4.pc_fw2;
     assign ev_ready[4] = tb_top.nas_top.c0.t4.inst_valid_fw2;
     assign ev_pc5 = tb_top.nas_top.c0.t5.pc_fw2;
     assign ev_ready[5] = tb_top.nas_top.c0.t5.inst_valid_fw2;
     assign ev_pc6 = tb_top.nas_top.c0.t6.pc_fw2;
     assign ev_ready[6] = tb_top.nas_top.c0.t6.inst_valid_fw2;
     assign ev_pc7 = tb_top.nas_top.c0.t7.pc_fw2;
     assign ev_ready[7] = tb_top.nas_top.c0.t7.inst_valid_fw2;
`else
    assign ev_pc0 = 0;
    assign ev_ready[0] = 0;
    assign ev_pc1 = 0;
    assign ev_ready[1] = 0;
    assign ev_pc2 = 0;
    assign ev_ready[2] = 0;
    assign ev_pc3 = 0;
    assign ev_ready[3] = 0;
    assign ev_pc4 = 0;
    assign ev_ready[4] = 0;
    assign ev_pc5 = 0;
    assign ev_ready[5] = 0;
    assign ev_pc6 = 0;
    assign ev_ready[6] = 0;
    assign ev_pc7 = 0;
    assign ev_ready[7] = 0;
`endif

`ifdef CORE_1
     assign ev_pc8 = tb_top.nas_top.c1.t0.pc_fw2;
     assign ev_ready[8] = tb_top.nas_top.c1.t0.inst_valid_fw2;
     assign ev_pc9 = tb_top.nas_top.c1.t1.pc_fw2;
     assign ev_ready[9] = tb_top.nas_top.c1.t1.inst_valid_fw2;
     assign ev_pc10 = tb_top.nas_top.c1.t2.pc_fw2;
     assign ev_ready[10] = tb_top.nas_top.c1.t2.inst_valid_fw2;
     assign ev_pc11 = tb_top.nas_top.c1.t3.pc_fw2;
     assign ev_ready[11] = tb_top.nas_top.c1.t3.inst_valid_fw2;
     assign ev_pc12 = tb_top.nas_top.c1.t4.pc_fw2;
     assign ev_ready[12] = tb_top.nas_top.c1.t4.inst_valid_fw2;
     assign ev_pc13 = tb_top.nas_top.c1.t5.pc_fw2;
     assign ev_ready[13] = tb_top.nas_top.c1.t5.inst_valid_fw2;
     assign ev_pc14 = tb_top.nas_top.c1.t6.pc_fw2;
     assign ev_ready[14] = tb_top.nas_top.c1.t6.inst_valid_fw2;
     assign ev_pc15 = tb_top.nas_top.c1.t7.pc_fw2;
     assign ev_ready[15] = tb_top.nas_top.c1.t7.inst_valid_fw2;
`else
    assign ev_pc8 = 0;
    assign ev_ready[8] = 0;
    assign ev_pc9 = 0;
    assign ev_ready[9] = 0;
    assign ev_pc10 = 0;
    assign ev_ready[10] = 0;
    assign ev_pc11 = 0;
    assign ev_ready[11] = 0;
    assign ev_pc12 = 0;
    assign ev_ready[12] = 0;
    assign ev_pc13 = 0;
    assign ev_ready[13] = 0;
    assign ev_pc14 = 0;
    assign ev_ready[14] = 0;
    assign ev_pc15 = 0;
    assign ev_ready[15] = 0;
`endif

`ifdef CORE_2
     assign ev_pc16 = tb_top.nas_top.c2.t0.pc_fw2;
     assign ev_ready[16] = tb_top.nas_top.c2.t0.inst_valid_fw2;
     assign ev_pc17 = tb_top.nas_top.c2.t1.pc_fw2;
     assign ev_ready[17] = tb_top.nas_top.c2.t1.inst_valid_fw2;
     assign ev_pc18 = tb_top.nas_top.c2.t2.pc_fw2;
     assign ev_ready[18] = tb_top.nas_top.c2.t2.inst_valid_fw2;
     assign ev_pc19 = tb_top.nas_top.c2.t3.pc_fw2;
     assign ev_ready[19] = tb_top.nas_top.c2.t3.inst_valid_fw2;
     assign ev_pc20 = tb_top.nas_top.c2.t4.pc_fw2;
     assign ev_ready[20] = tb_top.nas_top.c2.t4.inst_valid_fw2;
     assign ev_pc21 = tb_top.nas_top.c2.t5.pc_fw2;
     assign ev_ready[21] = tb_top.nas_top.c2.t5.inst_valid_fw2;
     assign ev_pc22 = tb_top.nas_top.c2.t6.pc_fw2;
     assign ev_ready[22] = tb_top.nas_top.c2.t6.inst_valid_fw2;
     assign ev_pc23 = tb_top.nas_top.c2.t7.pc_fw2;
     assign ev_ready[23] = tb_top.nas_top.c2.t7.inst_valid_fw2;
`else
    assign ev_pc16 = 0;
    assign ev_ready[16] = 0;
    assign ev_pc17 = 0;
    assign ev_ready[17] = 0;
    assign ev_pc18 = 0;
    assign ev_ready[18] = 0;
    assign ev_pc19 = 0;
    assign ev_ready[19] = 0;
    assign ev_pc20 = 0;
    assign ev_ready[20] = 0;
    assign ev_pc21 = 0;
    assign ev_ready[21] = 0;
    assign ev_pc22 = 0;
    assign ev_ready[22] = 0;
    assign ev_pc23 = 0;
    assign ev_ready[23] = 0;
`endif

`ifdef CORE_3
     assign ev_pc24 = tb_top.nas_top.c3.t0.pc_fw2;
     assign ev_ready[24] = tb_top.nas_top.c3.t0.inst_valid_fw2;
     assign ev_pc25 = tb_top.nas_top.c3.t1.pc_fw2;
     assign ev_ready[25] = tb_top.nas_top.c3.t1.inst_valid_fw2;
     assign ev_pc26 = tb_top.nas_top.c3.t2.pc_fw2;
     assign ev_ready[26] = tb_top.nas_top.c3.t2.inst_valid_fw2;
     assign ev_pc27 = tb_top.nas_top.c3.t3.pc_fw2;
     assign ev_ready[27] = tb_top.nas_top.c3.t3.inst_valid_fw2;
     assign ev_pc28 = tb_top.nas_top.c3.t4.pc_fw2;
     assign ev_ready[28] = tb_top.nas_top.c3.t4.inst_valid_fw2;
     assign ev_pc29 = tb_top.nas_top.c3.t5.pc_fw2;
     assign ev_ready[29] = tb_top.nas_top.c3.t5.inst_valid_fw2;
     assign ev_pc30 = tb_top.nas_top.c3.t6.pc_fw2;
     assign ev_ready[30] = tb_top.nas_top.c3.t6.inst_valid_fw2;
     assign ev_pc31 = tb_top.nas_top.c3.t7.pc_fw2;
     assign ev_ready[31] = tb_top.nas_top.c3.t7.inst_valid_fw2;
`else
    assign ev_pc24 = 0;
    assign ev_ready[24] = 0;
    assign ev_pc25 = 0;
    assign ev_ready[25] = 0;
    assign ev_pc26 = 0;
    assign ev_ready[26] = 0;
    assign ev_pc27 = 0;
    assign ev_ready[27] = 0;
    assign ev_pc28 = 0;
    assign ev_ready[28] = 0;
    assign ev_pc29 = 0;
    assign ev_ready[29] = 0;
    assign ev_pc30 = 0;
    assign ev_ready[30] = 0;
    assign ev_pc31 = 0;
    assign ev_ready[31] = 0;
`endif

`ifdef CORE_4
     assign ev_pc32 = tb_top.nas_top.c4.t0.pc_fw2;
     assign ev_ready[32] = tb_top.nas_top.c4.t0.inst_valid_fw2;
     assign ev_pc33 = tb_top.nas_top.c4.t1.pc_fw2;
     assign ev_ready[33] = tb_top.nas_top.c4.t1.inst_valid_fw2;
     assign ev_pc34 = tb_top.nas_top.c4.t2.pc_fw2;
     assign ev_ready[34] = tb_top.nas_top.c4.t2.inst_valid_fw2;
     assign ev_pc35 = tb_top.nas_top.c4.t3.pc_fw2;
     assign ev_ready[35] = tb_top.nas_top.c4.t3.inst_valid_fw2;
     assign ev_pc36 = tb_top.nas_top.c4.t4.pc_fw2;
     assign ev_ready[36] = tb_top.nas_top.c4.t4.inst_valid_fw2;
     assign ev_pc37 = tb_top.nas_top.c4.t5.pc_fw2;
     assign ev_ready[37] = tb_top.nas_top.c4.t5.inst_valid_fw2;
     assign ev_pc38 = tb_top.nas_top.c4.t6.pc_fw2;
     assign ev_ready[38] = tb_top.nas_top.c4.t6.inst_valid_fw2;
     assign ev_pc39 = tb_top.nas_top.c4.t7.pc_fw2;
     assign ev_ready[39] = tb_top.nas_top.c4.t7.inst_valid_fw2;
`else
    assign ev_pc32 = 0;
    assign ev_ready[32] = 0;
    assign ev_pc33 = 0;
    assign ev_ready[33] = 0;
    assign ev_pc34 = 0;
    assign ev_ready[34] = 0;
    assign ev_pc35 = 0;
    assign ev_ready[35] = 0;
    assign ev_pc36 = 0;
    assign ev_ready[36] = 0;
    assign ev_pc37 = 0;
    assign ev_ready[37] = 0;
    assign ev_pc38 = 0;
    assign ev_ready[38] = 0;
    assign ev_pc39 = 0;
    assign ev_ready[39] = 0;
`endif

`ifdef CORE_5
     assign ev_pc40 = tb_top.nas_top.c5.t0.pc_fw2;
     assign ev_ready[40] = tb_top.nas_top.c5.t0.inst_valid_fw2;
     assign ev_pc41 = tb_top.nas_top.c5.t1.pc_fw2;
     assign ev_ready[41] = tb_top.nas_top.c5.t1.inst_valid_fw2;
     assign ev_pc42 = tb_top.nas_top.c5.t2.pc_fw2;
     assign ev_ready[42] = tb_top.nas_top.c5.t2.inst_valid_fw2;
     assign ev_pc43 = tb_top.nas_top.c5.t3.pc_fw2;
     assign ev_ready[43] = tb_top.nas_top.c5.t3.inst_valid_fw2;
     assign ev_pc44 = tb_top.nas_top.c5.t4.pc_fw2;
     assign ev_ready[44] = tb_top.nas_top.c5.t4.inst_valid_fw2;
     assign ev_pc45 = tb_top.nas_top.c5.t5.pc_fw2;
     assign ev_ready[45] = tb_top.nas_top.c5.t5.inst_valid_fw2;
     assign ev_pc46 = tb_top.nas_top.c5.t6.pc_fw2;
     assign ev_ready[46] = tb_top.nas_top.c5.t6.inst_valid_fw2;
     assign ev_pc47 = tb_top.nas_top.c5.t7.pc_fw2;
     assign ev_ready[47] = tb_top.nas_top.c5.t7.inst_valid_fw2;
`else
    assign ev_pc40 = 0;
    assign ev_ready[40] = 0;
    assign ev_pc41 = 0;
    assign ev_ready[41] = 0;
    assign ev_pc42 = 0;
    assign ev_ready[42] = 0;
    assign ev_pc43 = 0;
    assign ev_ready[43] = 0;
    assign ev_pc44 = 0;
    assign ev_ready[44] = 0;
    assign ev_pc45 = 0;
    assign ev_ready[45] = 0;
    assign ev_pc46 = 0;
    assign ev_ready[46] = 0;
    assign ev_pc47 = 0;
    assign ev_ready[47] = 0;
`endif

`ifdef CORE_6
     assign ev_pc48 = tb_top.nas_top.c6.t0.pc_fw2;
     assign ev_ready[48] = tb_top.nas_top.c6.t0.inst_valid_fw2;
     assign ev_pc49 = tb_top.nas_top.c6.t1.pc_fw2;
     assign ev_ready[49] = tb_top.nas_top.c6.t1.inst_valid_fw2;
     assign ev_pc50 = tb_top.nas_top.c6.t2.pc_fw2;
     assign ev_ready[50] = tb_top.nas_top.c6.t2.inst_valid_fw2;
     assign ev_pc51 = tb_top.nas_top.c6.t3.pc_fw2;
     assign ev_ready[51] = tb_top.nas_top.c6.t3.inst_valid_fw2;
     assign ev_pc52 = tb_top.nas_top.c6.t4.pc_fw2;
     assign ev_ready[52] = tb_top.nas_top.c6.t4.inst_valid_fw2;
     assign ev_pc53 = tb_top.nas_top.c6.t5.pc_fw2;
     assign ev_ready[53] = tb_top.nas_top.c6.t5.inst_valid_fw2;
     assign ev_pc54 = tb_top.nas_top.c6.t6.pc_fw2;
     assign ev_ready[54] = tb_top.nas_top.c6.t6.inst_valid_fw2;
     assign ev_pc55 = tb_top.nas_top.c6.t7.pc_fw2;
     assign ev_ready[55] = tb_top.nas_top.c6.t7.inst_valid_fw2;
`else
    assign ev_pc48 = 0;
    assign ev_ready[48] = 0;
    assign ev_pc49 = 0;
    assign ev_ready[49] = 0;
    assign ev_pc50 = 0;
    assign ev_ready[50] = 0;
    assign ev_pc51 = 0;
    assign ev_ready[51] = 0;
    assign ev_pc52 = 0;
    assign ev_ready[52] = 0;
    assign ev_pc53 = 0;
    assign ev_ready[53] = 0;
    assign ev_pc54 = 0;
    assign ev_ready[54] = 0;
    assign ev_pc55 = 0;
    assign ev_ready[55] = 0;
`endif

`ifdef CORE_7
     assign ev_pc56 = tb_top.nas_top.c7.t0.pc_fw2;
     assign ev_ready[56] = tb_top.nas_top.c7.t0.inst_valid_fw2;
     assign ev_pc57 = tb_top.nas_top.c7.t1.pc_fw2;
     assign ev_ready[57] = tb_top.nas_top.c7.t1.inst_valid_fw2;
     assign ev_pc58 = tb_top.nas_top.c7.t2.pc_fw2;
     assign ev_ready[58] = tb_top.nas_top.c7.t2.inst_valid_fw2;
     assign ev_pc59 = tb_top.nas_top.c7.t3.pc_fw2;
     assign ev_ready[59] = tb_top.nas_top.c7.t3.inst_valid_fw2;
     assign ev_pc60 = tb_top.nas_top.c7.t4.pc_fw2;
     assign ev_ready[60] = tb_top.nas_top.c7.t4.inst_valid_fw2;
     assign ev_pc61 = tb_top.nas_top.c7.t5.pc_fw2;
     assign ev_ready[61] = tb_top.nas_top.c7.t5.inst_valid_fw2;
     assign ev_pc62 = tb_top.nas_top.c7.t6.pc_fw2;
     assign ev_ready[62] = tb_top.nas_top.c7.t6.inst_valid_fw2;
     assign ev_pc63 = tb_top.nas_top.c7.t7.pc_fw2;
     assign ev_ready[63] = tb_top.nas_top.c7.t7.inst_valid_fw2;
`else
    assign ev_pc56 = 0;
    assign ev_ready[56] = 0;
    assign ev_pc57 = 0;
    assign ev_ready[57] = 0;
    assign ev_pc58 = 0;
    assign ev_ready[58] = 0;
    assign ev_pc59 = 0;
    assign ev_ready[59] = 0;
    assign ev_pc60 = 0;
    assign ev_ready[60] = 0;
    assign ev_pc61 = 0;
    assign ev_ready[61] = 0;
    assign ev_pc62 = 0;
    assign ev_ready[62] = 0;
    assign ev_pc63 = 0;
    assign ev_ready[63] = 0;
`endif


`endif  // GATESIM
//--------------------------------------------------
//--------------------------------------------------
