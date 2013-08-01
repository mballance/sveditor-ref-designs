// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lru_mon.v
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
`ifdef CORE_0


module lru_mon_c0;

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef GATESIM
`ifndef NO_MONITORS
`ifdef SPC

wire [7:0] core0_ld_rq_vld  = `SPC0.lsu.lmc.ld_rq_vld[7:0];
wire [7:0] core0_ld_asi_rq_sel  = `SPC0.lsu.lmc.ld_asi_rq_sel[7:0];
wire [7:0] core0_ld_pcx_rq_sel  = `SPC0.lsu.lmc.ld_pcx_rq_sel[7:0];


always @(posedge `SPC0.l2clk) begin 

    if (core0_ld_rq_vld[0] == 8'h0) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_START_REQ \n");
    end
    if (core0_ld_rq_vld[1] == 8'h1) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_START_REQ \n");
    end
    if (core0_ld_rq_vld[2] == 8'h2) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_START_REQ \n");
    end
    if (core0_ld_rq_vld[3] == 8'h3) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_START_REQ \n");
    end
    if (core0_ld_rq_vld[4] == 8'h4) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_START_REQ \n");
    end
    if (core0_ld_rq_vld[5] == 8'h5) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_START_REQ \n");
    end
    if (core0_ld_rq_vld[6] == 8'h6) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_START_REQ \n");
    end
    if (core0_ld_rq_vld[7] == 8'h7) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_START_REQ \n");
    end

    if ((core0_ld_asi_rq_sel[0] == 8'h0) | (core0_ld_pcx_rq_sel[0] == 8'h0)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_END_SEL\n");
    end
    if ((core0_ld_asi_rq_sel[1] == 8'h1) | (core0_ld_pcx_rq_sel[1] == 8'h1)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_END_SEL\n");
    end
    if ((core0_ld_asi_rq_sel[2] == 8'h2) | (core0_ld_pcx_rq_sel[2] == 8'h2)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_END_SEL\n");
    end
    if ((core0_ld_asi_rq_sel[3] == 8'h3) | (core0_ld_pcx_rq_sel[3] == 8'h3)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_END_SEL\n");
    end
    if ((core0_ld_asi_rq_sel[4] == 8'h4) | (core0_ld_pcx_rq_sel[4] == 8'h4)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_END_SEL\n");
    end
    if ((core0_ld_asi_rq_sel[5] == 8'h5) | (core0_ld_pcx_rq_sel[5] == 8'h5)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_END_SEL\n");
    end
    if ((core0_ld_asi_rq_sel[6] == 8'h6) | (core0_ld_pcx_rq_sel[6] == 8'h6)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_END_SEL\n");
    end
    if ((core0_ld_asi_rq_sel[7] == 8'h7) | (core0_ld_pcx_rq_sel[7] == 8'h7)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_END_SEL\n");
    end

end

`endif
`endif
`endif

endmodule

`endif


`ifdef CORE_1


module lru_mon_c1;

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef GATESIM
`ifndef NO_MONITORS
`ifdef SPC

wire [7:0] core1_ld_rq_vld  = `SPC1.lsu.lmc.ld_rq_vld[7:0];
wire [7:0] core1_ld_asi_rq_sel  = `SPC1.lsu.lmc.ld_asi_rq_sel[7:0];
wire [7:0] core1_ld_pcx_rq_sel  = `SPC1.lsu.lmc.ld_pcx_rq_sel[7:0];


always @(posedge `SPC1.l2clk) begin 

    if (core1_ld_rq_vld[0] == 8'h0) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_START_REQ \n");
    end
    if (core1_ld_rq_vld[1] == 8'h1) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_START_REQ \n");
    end
    if (core1_ld_rq_vld[2] == 8'h2) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_START_REQ \n");
    end
    if (core1_ld_rq_vld[3] == 8'h3) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_START_REQ \n");
    end
    if (core1_ld_rq_vld[4] == 8'h4) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_START_REQ \n");
    end
    if (core1_ld_rq_vld[5] == 8'h5) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_START_REQ \n");
    end
    if (core1_ld_rq_vld[6] == 8'h6) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_START_REQ \n");
    end
    if (core1_ld_rq_vld[7] == 8'h7) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_START_REQ \n");
    end

    if ((core1_ld_asi_rq_sel[0] == 8'h0) | (core1_ld_pcx_rq_sel[0] == 8'h0)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_END_SEL\n");
    end
    if ((core1_ld_asi_rq_sel[1] == 8'h1) | (core1_ld_pcx_rq_sel[1] == 8'h1)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_END_SEL\n");
    end
    if ((core1_ld_asi_rq_sel[2] == 8'h2) | (core1_ld_pcx_rq_sel[2] == 8'h2)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_END_SEL\n");
    end
    if ((core1_ld_asi_rq_sel[3] == 8'h3) | (core1_ld_pcx_rq_sel[3] == 8'h3)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_END_SEL\n");
    end
    if ((core1_ld_asi_rq_sel[4] == 8'h4) | (core1_ld_pcx_rq_sel[4] == 8'h4)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_END_SEL\n");
    end
    if ((core1_ld_asi_rq_sel[5] == 8'h5) | (core1_ld_pcx_rq_sel[5] == 8'h5)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_END_SEL\n");
    end
    if ((core1_ld_asi_rq_sel[6] == 8'h6) | (core1_ld_pcx_rq_sel[6] == 8'h6)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_END_SEL\n");
    end
    if ((core1_ld_asi_rq_sel[7] == 8'h7) | (core1_ld_pcx_rq_sel[7] == 8'h7)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_END_SEL\n");
    end

end

`endif
`endif
`endif

endmodule

`endif


`ifdef CORE_2


module lru_mon_c2;

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef GATESIM
`ifndef NO_MONITORS
`ifdef SPC

wire [7:0] core2_ld_rq_vld  = `SPC2.lsu.lmc.ld_rq_vld[7:0];
wire [7:0] core2_ld_asi_rq_sel  = `SPC2.lsu.lmc.ld_asi_rq_sel[7:0];
wire [7:0] core2_ld_pcx_rq_sel  = `SPC2.lsu.lmc.ld_pcx_rq_sel[7:0];


always @(posedge `SPC2.l2clk) begin 

    if (core2_ld_rq_vld[0] == 8'h0) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_START_REQ \n");
    end
    if (core2_ld_rq_vld[1] == 8'h1) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_START_REQ \n");
    end
    if (core2_ld_rq_vld[2] == 8'h2) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_START_REQ \n");
    end
    if (core2_ld_rq_vld[3] == 8'h3) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_START_REQ \n");
    end
    if (core2_ld_rq_vld[4] == 8'h4) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_START_REQ \n");
    end
    if (core2_ld_rq_vld[5] == 8'h5) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_START_REQ \n");
    end
    if (core2_ld_rq_vld[6] == 8'h6) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_START_REQ \n");
    end
    if (core2_ld_rq_vld[7] == 8'h7) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_START_REQ \n");
    end

    if ((core2_ld_asi_rq_sel[0] == 8'h0) | (core2_ld_pcx_rq_sel[0] == 8'h0)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_END_SEL\n");
    end
    if ((core2_ld_asi_rq_sel[1] == 8'h1) | (core2_ld_pcx_rq_sel[1] == 8'h1)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_END_SEL\n");
    end
    if ((core2_ld_asi_rq_sel[2] == 8'h2) | (core2_ld_pcx_rq_sel[2] == 8'h2)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_END_SEL\n");
    end
    if ((core2_ld_asi_rq_sel[3] == 8'h3) | (core2_ld_pcx_rq_sel[3] == 8'h3)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_END_SEL\n");
    end
    if ((core2_ld_asi_rq_sel[4] == 8'h4) | (core2_ld_pcx_rq_sel[4] == 8'h4)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_END_SEL\n");
    end
    if ((core2_ld_asi_rq_sel[5] == 8'h5) | (core2_ld_pcx_rq_sel[5] == 8'h5)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_END_SEL\n");
    end
    if ((core2_ld_asi_rq_sel[6] == 8'h6) | (core2_ld_pcx_rq_sel[6] == 8'h6)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_END_SEL\n");
    end
    if ((core2_ld_asi_rq_sel[7] == 8'h7) | (core2_ld_pcx_rq_sel[7] == 8'h7)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_END_SEL\n");
    end

end

`endif
`endif
`endif

endmodule

`endif


`ifdef CORE_3


module lru_mon_c3;

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef GATESIM
`ifndef NO_MONITORS
`ifdef SPC

wire [7:0] core3_ld_rq_vld  = `SPC3.lsu.lmc.ld_rq_vld[7:0];
wire [7:0] core3_ld_asi_rq_sel  = `SPC3.lsu.lmc.ld_asi_rq_sel[7:0];
wire [7:0] core3_ld_pcx_rq_sel  = `SPC3.lsu.lmc.ld_pcx_rq_sel[7:0];


always @(posedge `SPC3.l2clk) begin 

    if (core3_ld_rq_vld[0] == 8'h0) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_START_REQ \n");
    end
    if (core3_ld_rq_vld[1] == 8'h1) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_START_REQ \n");
    end
    if (core3_ld_rq_vld[2] == 8'h2) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_START_REQ \n");
    end
    if (core3_ld_rq_vld[3] == 8'h3) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_START_REQ \n");
    end
    if (core3_ld_rq_vld[4] == 8'h4) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_START_REQ \n");
    end
    if (core3_ld_rq_vld[5] == 8'h5) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_START_REQ \n");
    end
    if (core3_ld_rq_vld[6] == 8'h6) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_START_REQ \n");
    end
    if (core3_ld_rq_vld[7] == 8'h7) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_START_REQ \n");
    end

    if ((core3_ld_asi_rq_sel[0] == 8'h0) | (core3_ld_pcx_rq_sel[0] == 8'h0)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_END_SEL\n");
    end
    if ((core3_ld_asi_rq_sel[1] == 8'h1) | (core3_ld_pcx_rq_sel[1] == 8'h1)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_END_SEL\n");
    end
    if ((core3_ld_asi_rq_sel[2] == 8'h2) | (core3_ld_pcx_rq_sel[2] == 8'h2)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_END_SEL\n");
    end
    if ((core3_ld_asi_rq_sel[3] == 8'h3) | (core3_ld_pcx_rq_sel[3] == 8'h3)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_END_SEL\n");
    end
    if ((core3_ld_asi_rq_sel[4] == 8'h4) | (core3_ld_pcx_rq_sel[4] == 8'h4)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_END_SEL\n");
    end
    if ((core3_ld_asi_rq_sel[5] == 8'h5) | (core3_ld_pcx_rq_sel[5] == 8'h5)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_END_SEL\n");
    end
    if ((core3_ld_asi_rq_sel[6] == 8'h6) | (core3_ld_pcx_rq_sel[6] == 8'h6)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_END_SEL\n");
    end
    if ((core3_ld_asi_rq_sel[7] == 8'h7) | (core3_ld_pcx_rq_sel[7] == 8'h7)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_END_SEL\n");
    end

end

`endif
`endif
`endif

endmodule

`endif


`ifdef CORE_4


module lru_mon_c4;

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef GATESIM
`ifndef NO_MONITORS
`ifdef SPC

wire [7:0] core4_ld_rq_vld  = `SPC4.lsu.lmc.ld_rq_vld[7:0];
wire [7:0] core4_ld_asi_rq_sel  = `SPC4.lsu.lmc.ld_asi_rq_sel[7:0];
wire [7:0] core4_ld_pcx_rq_sel  = `SPC4.lsu.lmc.ld_pcx_rq_sel[7:0];


always @(posedge `SPC4.l2clk) begin 

    if (core4_ld_rq_vld[0] == 8'h0) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_START_REQ \n");
    end
    if (core4_ld_rq_vld[1] == 8'h1) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_START_REQ \n");
    end
    if (core4_ld_rq_vld[2] == 8'h2) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_START_REQ \n");
    end
    if (core4_ld_rq_vld[3] == 8'h3) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_START_REQ \n");
    end
    if (core4_ld_rq_vld[4] == 8'h4) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_START_REQ \n");
    end
    if (core4_ld_rq_vld[5] == 8'h5) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_START_REQ \n");
    end
    if (core4_ld_rq_vld[6] == 8'h6) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_START_REQ \n");
    end
    if (core4_ld_rq_vld[7] == 8'h7) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_START_REQ \n");
    end

    if ((core4_ld_asi_rq_sel[0] == 8'h0) | (core4_ld_pcx_rq_sel[0] == 8'h0)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_END_SEL\n");
    end
    if ((core4_ld_asi_rq_sel[1] == 8'h1) | (core4_ld_pcx_rq_sel[1] == 8'h1)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_END_SEL\n");
    end
    if ((core4_ld_asi_rq_sel[2] == 8'h2) | (core4_ld_pcx_rq_sel[2] == 8'h2)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_END_SEL\n");
    end
    if ((core4_ld_asi_rq_sel[3] == 8'h3) | (core4_ld_pcx_rq_sel[3] == 8'h3)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_END_SEL\n");
    end
    if ((core4_ld_asi_rq_sel[4] == 8'h4) | (core4_ld_pcx_rq_sel[4] == 8'h4)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_END_SEL\n");
    end
    if ((core4_ld_asi_rq_sel[5] == 8'h5) | (core4_ld_pcx_rq_sel[5] == 8'h5)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_END_SEL\n");
    end
    if ((core4_ld_asi_rq_sel[6] == 8'h6) | (core4_ld_pcx_rq_sel[6] == 8'h6)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_END_SEL\n");
    end
    if ((core4_ld_asi_rq_sel[7] == 8'h7) | (core4_ld_pcx_rq_sel[7] == 8'h7)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_END_SEL\n");
    end

end

`endif
`endif
`endif

endmodule

`endif


`ifdef CORE_5


module lru_mon_c5;

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef GATESIM
`ifndef NO_MONITORS
`ifdef SPC

wire [7:0] core5_ld_rq_vld  = `SPC5.lsu.lmc.ld_rq_vld[7:0];
wire [7:0] core5_ld_asi_rq_sel  = `SPC5.lsu.lmc.ld_asi_rq_sel[7:0];
wire [7:0] core5_ld_pcx_rq_sel  = `SPC5.lsu.lmc.ld_pcx_rq_sel[7:0];


always @(posedge `SPC5.l2clk) begin 

    if (core5_ld_rq_vld[0] == 8'h0) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_START_REQ \n");
    end
    if (core5_ld_rq_vld[1] == 8'h1) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_START_REQ \n");
    end
    if (core5_ld_rq_vld[2] == 8'h2) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_START_REQ \n");
    end
    if (core5_ld_rq_vld[3] == 8'h3) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_START_REQ \n");
    end
    if (core5_ld_rq_vld[4] == 8'h4) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_START_REQ \n");
    end
    if (core5_ld_rq_vld[5] == 8'h5) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_START_REQ \n");
    end
    if (core5_ld_rq_vld[6] == 8'h6) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_START_REQ \n");
    end
    if (core5_ld_rq_vld[7] == 8'h7) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_START_REQ \n");
    end

    if ((core5_ld_asi_rq_sel[0] == 8'h0) | (core5_ld_pcx_rq_sel[0] == 8'h0)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_END_SEL\n");
    end
    if ((core5_ld_asi_rq_sel[1] == 8'h1) | (core5_ld_pcx_rq_sel[1] == 8'h1)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_END_SEL\n");
    end
    if ((core5_ld_asi_rq_sel[2] == 8'h2) | (core5_ld_pcx_rq_sel[2] == 8'h2)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_END_SEL\n");
    end
    if ((core5_ld_asi_rq_sel[3] == 8'h3) | (core5_ld_pcx_rq_sel[3] == 8'h3)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_END_SEL\n");
    end
    if ((core5_ld_asi_rq_sel[4] == 8'h4) | (core5_ld_pcx_rq_sel[4] == 8'h4)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_END_SEL\n");
    end
    if ((core5_ld_asi_rq_sel[5] == 8'h5) | (core5_ld_pcx_rq_sel[5] == 8'h5)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_END_SEL\n");
    end
    if ((core5_ld_asi_rq_sel[6] == 8'h6) | (core5_ld_pcx_rq_sel[6] == 8'h6)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_END_SEL\n");
    end
    if ((core5_ld_asi_rq_sel[7] == 8'h7) | (core5_ld_pcx_rq_sel[7] == 8'h7)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_END_SEL\n");
    end

end

`endif
`endif
`endif

endmodule

`endif


`ifdef CORE_6


module lru_mon_c6;

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef GATESIM
`ifndef NO_MONITORS
`ifdef SPC

wire [7:0] core6_ld_rq_vld  = `SPC6.lsu.lmc.ld_rq_vld[7:0];
wire [7:0] core6_ld_asi_rq_sel  = `SPC6.lsu.lmc.ld_asi_rq_sel[7:0];
wire [7:0] core6_ld_pcx_rq_sel  = `SPC6.lsu.lmc.ld_pcx_rq_sel[7:0];


always @(posedge `SPC6.l2clk) begin 

    if (core6_ld_rq_vld[0] == 8'h0) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_START_REQ \n");
    end
    if (core6_ld_rq_vld[1] == 8'h1) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_START_REQ \n");
    end
    if (core6_ld_rq_vld[2] == 8'h2) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_START_REQ \n");
    end
    if (core6_ld_rq_vld[3] == 8'h3) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_START_REQ \n");
    end
    if (core6_ld_rq_vld[4] == 8'h4) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_START_REQ \n");
    end
    if (core6_ld_rq_vld[5] == 8'h5) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_START_REQ \n");
    end
    if (core6_ld_rq_vld[6] == 8'h6) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_START_REQ \n");
    end
    if (core6_ld_rq_vld[7] == 8'h7) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_START_REQ \n");
    end

    if ((core6_ld_asi_rq_sel[0] == 8'h0) | (core6_ld_pcx_rq_sel[0] == 8'h0)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_END_SEL\n");
    end
    if ((core6_ld_asi_rq_sel[1] == 8'h1) | (core6_ld_pcx_rq_sel[1] == 8'h1)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_END_SEL\n");
    end
    if ((core6_ld_asi_rq_sel[2] == 8'h2) | (core6_ld_pcx_rq_sel[2] == 8'h2)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_END_SEL\n");
    end
    if ((core6_ld_asi_rq_sel[3] == 8'h3) | (core6_ld_pcx_rq_sel[3] == 8'h3)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_END_SEL\n");
    end
    if ((core6_ld_asi_rq_sel[4] == 8'h4) | (core6_ld_pcx_rq_sel[4] == 8'h4)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_END_SEL\n");
    end
    if ((core6_ld_asi_rq_sel[5] == 8'h5) | (core6_ld_pcx_rq_sel[5] == 8'h5)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_END_SEL\n");
    end
    if ((core6_ld_asi_rq_sel[6] == 8'h6) | (core6_ld_pcx_rq_sel[6] == 8'h6)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_END_SEL\n");
    end
    if ((core6_ld_asi_rq_sel[7] == 8'h7) | (core6_ld_pcx_rq_sel[7] == 8'h7)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_END_SEL\n");
    end

end

`endif
`endif
`endif

endmodule

`endif


`ifdef CORE_7


module lru_mon_c7;

// If vcs_build_args NO_MONITORS, then module will be empty
`ifndef GATESIM
`ifndef NO_MONITORS
`ifdef SPC

wire [7:0] core7_ld_rq_vld  = `SPC7.lsu.lmc.ld_rq_vld[7:0];
wire [7:0] core7_ld_asi_rq_sel  = `SPC7.lsu.lmc.ld_asi_rq_sel[7:0];
wire [7:0] core7_ld_pcx_rq_sel  = `SPC7.lsu.lmc.ld_pcx_rq_sel[7:0];


always @(posedge `SPC7.l2clk) begin 

    if (core7_ld_rq_vld[0] == 8'h0) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_START_REQ \n");
    end
    if (core7_ld_rq_vld[1] == 8'h1) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_START_REQ \n");
    end
    if (core7_ld_rq_vld[2] == 8'h2) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_START_REQ \n");
    end
    if (core7_ld_rq_vld[3] == 8'h3) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_START_REQ \n");
    end
    if (core7_ld_rq_vld[4] == 8'h4) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_START_REQ \n");
    end
    if (core7_ld_rq_vld[5] == 8'h5) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_START_REQ \n");
    end
    if (core7_ld_rq_vld[6] == 8'h6) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_START_REQ \n");
    end
    if (core7_ld_rq_vld[7] == 8'h7) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_START_REQ \n");
    end

    if ((core7_ld_asi_rq_sel[0] == 8'h0) | (core7_ld_pcx_rq_sel[0] == 8'h0)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD0_END_SEL\n");
    end
    if ((core7_ld_asi_rq_sel[1] == 8'h1) | (core7_ld_pcx_rq_sel[1] == 8'h1)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD1_END_SEL\n");
    end
    if ((core7_ld_asi_rq_sel[2] == 8'h2) | (core7_ld_pcx_rq_sel[2] == 8'h2)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD2_END_SEL\n");
    end
    if ((core7_ld_asi_rq_sel[3] == 8'h3) | (core7_ld_pcx_rq_sel[3] == 8'h3)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD3_END_SEL\n");
    end
    if ((core7_ld_asi_rq_sel[4] == 8'h4) | (core7_ld_pcx_rq_sel[4] == 8'h4)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD4_END_SEL\n");
    end
    if ((core7_ld_asi_rq_sel[5] == 8'h5) | (core7_ld_pcx_rq_sel[5] == 8'h5)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD5_END_SEL\n");
    end
    if ((core7_ld_asi_rq_sel[6] == 8'h6) | (core7_ld_pcx_rq_sel[6] == 8'h6)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD6_END_SEL\n");
    end
    if ((core7_ld_asi_rq_sel[7] == 8'h7) | (core7_ld_pcx_rq_sel[7] == 8'h7)) begin
        `PR_INFO("lru_mon", `INFO, "THREAD7_END_SEL\n");
    end

end

`endif
`endif
`endif

endmodule

`endif


