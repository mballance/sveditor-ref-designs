// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: core_sync.v
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

module core_sync_c0();
`ifndef GATESIM

// common defines
`include "defines.vh"

wire [64:0] tlu_rng;
wire [63:0] rng_value;
wire  [2:0] rng_tid;
reg   [2:0] rng_tid_1;
wire        tick_rd;
reg         tick_rd_1;
wire        stick_rd;
reg         stick_rd_1;

wire        hwtwPending_rd;
reg         hwtwPending_rd_1;

//---------------------
//  PMU

wire [64:0] pmu_rng;
wire [63:0] pmu_rng_value;
wire  [2:0] pmu_rng_tid;
reg  [2:0]  pmu_rng_tid_1;

wire [64:0] pmu_rng_in;

wire        pcr_rd;
reg         pcr_rd_1;
wire        pic_rd;
reg         pic_rd_1;

reg         pcr_rd_2;
reg         pic_rd_2;
reg  [2:0]  pmu_rng_tid_2;

reg         pcr_rd_3;
reg         pic_rd_3;
reg  [2:0]  pmu_rng_tid_3;

reg  [5:0]  pmu_tnum;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    junk;
integer                    i;


initial begin // {
    mycid   = 0;
end //}

//----------------------------------------------------------
// DUT probes

//--------------------
// TICK & STICK ASR READ

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign tlu_rng   = `SPC0.tlu.tlu_rngf_cdbus;

assign rng_value     = {1'b0,tlu_rng[62:0]};
assign rng_tid       = tlu_rng[58:56];

assign tick_rd        = ((tlu_rng[64]==1'h1) &     // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         ((tlu_rng[61:60]==2'h1) | (tlu_rng[61:60]==2'h2)) &  // ASR or PR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h04)     // ASR#
                        );
assign stick_rd       = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[61:60]==2'h1) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h18)    // ASR#
                        );

assign hwtwPending_rd = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[62:60]==3'h0) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h54) &   // ASI#
                         (tlu_rng[47:0] == 48'h98)   // VA#
                        );
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC0.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value
  tick_rd_1   <= tick_rd;
  rng_tid_1   <= rng_tid;
  stick_rd_1  <= stick_rd;
  hwtwPending_rd_1 <= hwtwPending_rd;

  // TICK register followme
  if (tick_rd_1) begin // {

    myasi = 8'h04;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // STICK register followme
  if (stick_rd_1) begin // {

    myasi = 8'h18;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // HWTW Pending register followme
  if (hwtwPending_rd_1) begin // {

    myasi = 8'h54;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi,  64'h98, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, 64'h98, rng_value);
    end // }

  end // }

end // always }


//------------------------------------------
// PMU PCR

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign pmu_rng            = `SPC0.pmu.in_rngl_cdbus;

assign pmu_rng_in         = `SPC0.pmu.pmu_rngl_cdbus;
assign pmu_rng_value[63:0] = {pmu_rng_in[63:0]};

assign pmu_rng_tid[2:0]   = pmu_rng[58:56];

assign pcr_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR or PR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h10)    // ASR#
                            );
assign pic_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h11)    // ASR#
                            );

always @ (posedge `SPC0.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value

  pcr_rd_1      <= pcr_rd;
  pmu_rng_tid_1 <= pmu_rng_tid[2:0];
  pic_rd_1      <= pic_rd;

  pcr_rd_2      <= pcr_rd_1;
  pmu_rng_tid_2 <= pmu_rng_tid_1[2:0];
  pic_rd_2      <= pic_rd_1;

  pcr_rd_3      <= pcr_rd_2;
  pmu_rng_tid_3 <= pmu_rng_tid_2[2:0];
  pic_rd_3      <= pic_rd_2;

  pmu_tnum      = (mycid * 8) + pmu_rng_tid_3;

  // PCR register followme
  if (pcr_rd_3) begin // {



    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum,8'h10 , pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h10, pmu_rng_value);
    end // }

  end // }

  // PIC register followme
  if (pic_rd_3) begin // {

   `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum, 8'h11, pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h11, pmu_rng_value);
    end // }

  end // }
end // always }



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_1

module core_sync_c1();
`ifndef GATESIM

// common defines
`include "defines.vh"

wire [64:0] tlu_rng;
wire [63:0] rng_value;
wire  [2:0] rng_tid;
reg   [2:0] rng_tid_1;
wire        tick_rd;
reg         tick_rd_1;
wire        stick_rd;
reg         stick_rd_1;

wire        hwtwPending_rd;
reg         hwtwPending_rd_1;

//---------------------
//  PMU

wire [64:0] pmu_rng;
wire [63:0] pmu_rng_value;
wire  [2:0] pmu_rng_tid;
reg  [2:0]  pmu_rng_tid_1;

wire [64:0] pmu_rng_in;

wire        pcr_rd;
reg         pcr_rd_1;
wire        pic_rd;
reg         pic_rd_1;

reg         pcr_rd_2;
reg         pic_rd_2;
reg  [2:0]  pmu_rng_tid_2;

reg         pcr_rd_3;
reg         pic_rd_3;
reg  [2:0]  pmu_rng_tid_3;

reg  [5:0]  pmu_tnum;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    junk;
integer                    i;


initial begin // {
    mycid   = 1;
end //}

//----------------------------------------------------------
// DUT probes

//--------------------
// TICK & STICK ASR READ

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign tlu_rng   = `SPC1.tlu.tlu_rngf_cdbus;

assign rng_value     = {1'b0,tlu_rng[62:0]};
assign rng_tid       = tlu_rng[58:56];

assign tick_rd        = ((tlu_rng[64]==1'h1) &     // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         ((tlu_rng[61:60]==2'h1) | (tlu_rng[61:60]==2'h2)) &  // ASR or PR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h04)     // ASR#
                        );
assign stick_rd       = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[61:60]==2'h1) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h18)    // ASR#
                        );

assign hwtwPending_rd = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[62:60]==3'h0) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h54) &   // ASI#
                         (tlu_rng[47:0] == 48'h98)   // VA#
                        );
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC1.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value
  tick_rd_1   <= tick_rd;
  rng_tid_1   <= rng_tid;
  stick_rd_1  <= stick_rd;
  hwtwPending_rd_1 <= hwtwPending_rd;

  // TICK register followme
  if (tick_rd_1) begin // {

    myasi = 8'h04;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // STICK register followme
  if (stick_rd_1) begin // {

    myasi = 8'h18;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // HWTW Pending register followme
  if (hwtwPending_rd_1) begin // {

    myasi = 8'h54;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi,  64'h98, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, 64'h98, rng_value);
    end // }

  end // }

end // always }


//------------------------------------------
// PMU PCR

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign pmu_rng            = `SPC1.pmu.in_rngl_cdbus;

assign pmu_rng_in         = `SPC1.pmu.pmu_rngl_cdbus;
assign pmu_rng_value[63:0] = {pmu_rng_in[63:0]};

assign pmu_rng_tid[2:0]   = pmu_rng[58:56];

assign pcr_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR or PR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h10)    // ASR#
                            );
assign pic_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h11)    // ASR#
                            );

always @ (posedge `SPC1.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value

  pcr_rd_1      <= pcr_rd;
  pmu_rng_tid_1 <= pmu_rng_tid[2:0];
  pic_rd_1      <= pic_rd;

  pcr_rd_2      <= pcr_rd_1;
  pmu_rng_tid_2 <= pmu_rng_tid_1[2:0];
  pic_rd_2      <= pic_rd_1;

  pcr_rd_3      <= pcr_rd_2;
  pmu_rng_tid_3 <= pmu_rng_tid_2[2:0];
  pic_rd_3      <= pic_rd_2;

  pmu_tnum      = (mycid * 8) + pmu_rng_tid_3;

  // PCR register followme
  if (pcr_rd_3) begin // {



    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum,8'h10 , pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h10, pmu_rng_value);
    end // }

  end // }

  // PIC register followme
  if (pic_rd_3) begin // {

   `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum, 8'h11, pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h11, pmu_rng_value);
    end // }

  end // }
end // always }



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_2

module core_sync_c2();
`ifndef GATESIM

// common defines
`include "defines.vh"

wire [64:0] tlu_rng;
wire [63:0] rng_value;
wire  [2:0] rng_tid;
reg   [2:0] rng_tid_1;
wire        tick_rd;
reg         tick_rd_1;
wire        stick_rd;
reg         stick_rd_1;

wire        hwtwPending_rd;
reg         hwtwPending_rd_1;

//---------------------
//  PMU

wire [64:0] pmu_rng;
wire [63:0] pmu_rng_value;
wire  [2:0] pmu_rng_tid;
reg  [2:0]  pmu_rng_tid_1;

wire [64:0] pmu_rng_in;

wire        pcr_rd;
reg         pcr_rd_1;
wire        pic_rd;
reg         pic_rd_1;

reg         pcr_rd_2;
reg         pic_rd_2;
reg  [2:0]  pmu_rng_tid_2;

reg         pcr_rd_3;
reg         pic_rd_3;
reg  [2:0]  pmu_rng_tid_3;

reg  [5:0]  pmu_tnum;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    junk;
integer                    i;


initial begin // {
    mycid   = 2;
end //}

//----------------------------------------------------------
// DUT probes

//--------------------
// TICK & STICK ASR READ

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign tlu_rng   = `SPC2.tlu.tlu_rngf_cdbus;

assign rng_value     = {1'b0,tlu_rng[62:0]};
assign rng_tid       = tlu_rng[58:56];

assign tick_rd        = ((tlu_rng[64]==1'h1) &     // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         ((tlu_rng[61:60]==2'h1) | (tlu_rng[61:60]==2'h2)) &  // ASR or PR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h04)     // ASR#
                        );
assign stick_rd       = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[61:60]==2'h1) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h18)    // ASR#
                        );

assign hwtwPending_rd = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[62:60]==3'h0) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h54) &   // ASI#
                         (tlu_rng[47:0] == 48'h98)   // VA#
                        );
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC2.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value
  tick_rd_1   <= tick_rd;
  rng_tid_1   <= rng_tid;
  stick_rd_1  <= stick_rd;
  hwtwPending_rd_1 <= hwtwPending_rd;

  // TICK register followme
  if (tick_rd_1) begin // {

    myasi = 8'h04;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // STICK register followme
  if (stick_rd_1) begin // {

    myasi = 8'h18;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // HWTW Pending register followme
  if (hwtwPending_rd_1) begin // {

    myasi = 8'h54;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi,  64'h98, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, 64'h98, rng_value);
    end // }

  end // }

end // always }


//------------------------------------------
// PMU PCR

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign pmu_rng            = `SPC2.pmu.in_rngl_cdbus;

assign pmu_rng_in         = `SPC2.pmu.pmu_rngl_cdbus;
assign pmu_rng_value[63:0] = {pmu_rng_in[63:0]};

assign pmu_rng_tid[2:0]   = pmu_rng[58:56];

assign pcr_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR or PR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h10)    // ASR#
                            );
assign pic_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h11)    // ASR#
                            );

always @ (posedge `SPC2.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value

  pcr_rd_1      <= pcr_rd;
  pmu_rng_tid_1 <= pmu_rng_tid[2:0];
  pic_rd_1      <= pic_rd;

  pcr_rd_2      <= pcr_rd_1;
  pmu_rng_tid_2 <= pmu_rng_tid_1[2:0];
  pic_rd_2      <= pic_rd_1;

  pcr_rd_3      <= pcr_rd_2;
  pmu_rng_tid_3 <= pmu_rng_tid_2[2:0];
  pic_rd_3      <= pic_rd_2;

  pmu_tnum      = (mycid * 8) + pmu_rng_tid_3;

  // PCR register followme
  if (pcr_rd_3) begin // {



    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum,8'h10 , pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h10, pmu_rng_value);
    end // }

  end // }

  // PIC register followme
  if (pic_rd_3) begin // {

   `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum, 8'h11, pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h11, pmu_rng_value);
    end // }

  end // }
end // always }



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_3

module core_sync_c3();
`ifndef GATESIM

// common defines
`include "defines.vh"

wire [64:0] tlu_rng;
wire [63:0] rng_value;
wire  [2:0] rng_tid;
reg   [2:0] rng_tid_1;
wire        tick_rd;
reg         tick_rd_1;
wire        stick_rd;
reg         stick_rd_1;

wire        hwtwPending_rd;
reg         hwtwPending_rd_1;

//---------------------
//  PMU

wire [64:0] pmu_rng;
wire [63:0] pmu_rng_value;
wire  [2:0] pmu_rng_tid;
reg  [2:0]  pmu_rng_tid_1;

wire [64:0] pmu_rng_in;

wire        pcr_rd;
reg         pcr_rd_1;
wire        pic_rd;
reg         pic_rd_1;

reg         pcr_rd_2;
reg         pic_rd_2;
reg  [2:0]  pmu_rng_tid_2;

reg         pcr_rd_3;
reg         pic_rd_3;
reg  [2:0]  pmu_rng_tid_3;

reg  [5:0]  pmu_tnum;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    junk;
integer                    i;


initial begin // {
    mycid   = 3;
end //}

//----------------------------------------------------------
// DUT probes

//--------------------
// TICK & STICK ASR READ

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign tlu_rng   = `SPC3.tlu.tlu_rngf_cdbus;

assign rng_value     = {1'b0,tlu_rng[62:0]};
assign rng_tid       = tlu_rng[58:56];

assign tick_rd        = ((tlu_rng[64]==1'h1) &     // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         ((tlu_rng[61:60]==2'h1) | (tlu_rng[61:60]==2'h2)) &  // ASR or PR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h04)     // ASR#
                        );
assign stick_rd       = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[61:60]==2'h1) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h18)    // ASR#
                        );

assign hwtwPending_rd = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[62:60]==3'h0) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h54) &   // ASI#
                         (tlu_rng[47:0] == 48'h98)   // VA#
                        );
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC3.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value
  tick_rd_1   <= tick_rd;
  rng_tid_1   <= rng_tid;
  stick_rd_1  <= stick_rd;
  hwtwPending_rd_1 <= hwtwPending_rd;

  // TICK register followme
  if (tick_rd_1) begin // {

    myasi = 8'h04;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // STICK register followme
  if (stick_rd_1) begin // {

    myasi = 8'h18;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // HWTW Pending register followme
  if (hwtwPending_rd_1) begin // {

    myasi = 8'h54;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi,  64'h98, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, 64'h98, rng_value);
    end // }

  end // }

end // always }


//------------------------------------------
// PMU PCR

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign pmu_rng            = `SPC3.pmu.in_rngl_cdbus;

assign pmu_rng_in         = `SPC3.pmu.pmu_rngl_cdbus;
assign pmu_rng_value[63:0] = {pmu_rng_in[63:0]};

assign pmu_rng_tid[2:0]   = pmu_rng[58:56];

assign pcr_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR or PR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h10)    // ASR#
                            );
assign pic_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h11)    // ASR#
                            );

always @ (posedge `SPC3.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value

  pcr_rd_1      <= pcr_rd;
  pmu_rng_tid_1 <= pmu_rng_tid[2:0];
  pic_rd_1      <= pic_rd;

  pcr_rd_2      <= pcr_rd_1;
  pmu_rng_tid_2 <= pmu_rng_tid_1[2:0];
  pic_rd_2      <= pic_rd_1;

  pcr_rd_3      <= pcr_rd_2;
  pmu_rng_tid_3 <= pmu_rng_tid_2[2:0];
  pic_rd_3      <= pic_rd_2;

  pmu_tnum      = (mycid * 8) + pmu_rng_tid_3;

  // PCR register followme
  if (pcr_rd_3) begin // {



    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum,8'h10 , pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h10, pmu_rng_value);
    end // }

  end // }

  // PIC register followme
  if (pic_rd_3) begin // {

   `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum, 8'h11, pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h11, pmu_rng_value);
    end // }

  end // }
end // always }



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_4

module core_sync_c4();
`ifndef GATESIM

// common defines
`include "defines.vh"

wire [64:0] tlu_rng;
wire [63:0] rng_value;
wire  [2:0] rng_tid;
reg   [2:0] rng_tid_1;
wire        tick_rd;
reg         tick_rd_1;
wire        stick_rd;
reg         stick_rd_1;

wire        hwtwPending_rd;
reg         hwtwPending_rd_1;

//---------------------
//  PMU

wire [64:0] pmu_rng;
wire [63:0] pmu_rng_value;
wire  [2:0] pmu_rng_tid;
reg  [2:0]  pmu_rng_tid_1;

wire [64:0] pmu_rng_in;

wire        pcr_rd;
reg         pcr_rd_1;
wire        pic_rd;
reg         pic_rd_1;

reg         pcr_rd_2;
reg         pic_rd_2;
reg  [2:0]  pmu_rng_tid_2;

reg         pcr_rd_3;
reg         pic_rd_3;
reg  [2:0]  pmu_rng_tid_3;

reg  [5:0]  pmu_tnum;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    junk;
integer                    i;


initial begin // {
    mycid   = 4;
end //}

//----------------------------------------------------------
// DUT probes

//--------------------
// TICK & STICK ASR READ

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign tlu_rng   = `SPC4.tlu.tlu_rngf_cdbus;

assign rng_value     = {1'b0,tlu_rng[62:0]};
assign rng_tid       = tlu_rng[58:56];

assign tick_rd        = ((tlu_rng[64]==1'h1) &     // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         ((tlu_rng[61:60]==2'h1) | (tlu_rng[61:60]==2'h2)) &  // ASR or PR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h04)     // ASR#
                        );
assign stick_rd       = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[61:60]==2'h1) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h18)    // ASR#
                        );

assign hwtwPending_rd = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[62:60]==3'h0) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h54) &   // ASI#
                         (tlu_rng[47:0] == 48'h98)   // VA#
                        );
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC4.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value
  tick_rd_1   <= tick_rd;
  rng_tid_1   <= rng_tid;
  stick_rd_1  <= stick_rd;
  hwtwPending_rd_1 <= hwtwPending_rd;

  // TICK register followme
  if (tick_rd_1) begin // {

    myasi = 8'h04;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // STICK register followme
  if (stick_rd_1) begin // {

    myasi = 8'h18;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // HWTW Pending register followme
  if (hwtwPending_rd_1) begin // {

    myasi = 8'h54;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi,  64'h98, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, 64'h98, rng_value);
    end // }

  end // }

end // always }


//------------------------------------------
// PMU PCR

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign pmu_rng            = `SPC4.pmu.in_rngl_cdbus;

assign pmu_rng_in         = `SPC4.pmu.pmu_rngl_cdbus;
assign pmu_rng_value[63:0] = {pmu_rng_in[63:0]};

assign pmu_rng_tid[2:0]   = pmu_rng[58:56];

assign pcr_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR or PR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h10)    // ASR#
                            );
assign pic_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h11)    // ASR#
                            );

always @ (posedge `SPC4.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value

  pcr_rd_1      <= pcr_rd;
  pmu_rng_tid_1 <= pmu_rng_tid[2:0];
  pic_rd_1      <= pic_rd;

  pcr_rd_2      <= pcr_rd_1;
  pmu_rng_tid_2 <= pmu_rng_tid_1[2:0];
  pic_rd_2      <= pic_rd_1;

  pcr_rd_3      <= pcr_rd_2;
  pmu_rng_tid_3 <= pmu_rng_tid_2[2:0];
  pic_rd_3      <= pic_rd_2;

  pmu_tnum      = (mycid * 8) + pmu_rng_tid_3;

  // PCR register followme
  if (pcr_rd_3) begin // {



    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum,8'h10 , pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h10, pmu_rng_value);
    end // }

  end // }

  // PIC register followme
  if (pic_rd_3) begin // {

   `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum, 8'h11, pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h11, pmu_rng_value);
    end // }

  end // }
end // always }



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_5

module core_sync_c5();
`ifndef GATESIM

// common defines
`include "defines.vh"

wire [64:0] tlu_rng;
wire [63:0] rng_value;
wire  [2:0] rng_tid;
reg   [2:0] rng_tid_1;
wire        tick_rd;
reg         tick_rd_1;
wire        stick_rd;
reg         stick_rd_1;

wire        hwtwPending_rd;
reg         hwtwPending_rd_1;

//---------------------
//  PMU

wire [64:0] pmu_rng;
wire [63:0] pmu_rng_value;
wire  [2:0] pmu_rng_tid;
reg  [2:0]  pmu_rng_tid_1;

wire [64:0] pmu_rng_in;

wire        pcr_rd;
reg         pcr_rd_1;
wire        pic_rd;
reg         pic_rd_1;

reg         pcr_rd_2;
reg         pic_rd_2;
reg  [2:0]  pmu_rng_tid_2;

reg         pcr_rd_3;
reg         pic_rd_3;
reg  [2:0]  pmu_rng_tid_3;

reg  [5:0]  pmu_tnum;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    junk;
integer                    i;


initial begin // {
    mycid   = 5;
end //}

//----------------------------------------------------------
// DUT probes

//--------------------
// TICK & STICK ASR READ

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign tlu_rng   = `SPC5.tlu.tlu_rngf_cdbus;

assign rng_value     = {1'b0,tlu_rng[62:0]};
assign rng_tid       = tlu_rng[58:56];

assign tick_rd        = ((tlu_rng[64]==1'h1) &     // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         ((tlu_rng[61:60]==2'h1) | (tlu_rng[61:60]==2'h2)) &  // ASR or PR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h04)     // ASR#
                        );
assign stick_rd       = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[61:60]==2'h1) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h18)    // ASR#
                        );

assign hwtwPending_rd = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[62:60]==3'h0) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h54) &   // ASI#
                         (tlu_rng[47:0] == 48'h98)   // VA#
                        );
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC5.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value
  tick_rd_1   <= tick_rd;
  rng_tid_1   <= rng_tid;
  stick_rd_1  <= stick_rd;
  hwtwPending_rd_1 <= hwtwPending_rd;

  // TICK register followme
  if (tick_rd_1) begin // {

    myasi = 8'h04;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // STICK register followme
  if (stick_rd_1) begin // {

    myasi = 8'h18;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // HWTW Pending register followme
  if (hwtwPending_rd_1) begin // {

    myasi = 8'h54;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi,  64'h98, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, 64'h98, rng_value);
    end // }

  end // }

end // always }


//------------------------------------------
// PMU PCR

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign pmu_rng            = `SPC5.pmu.in_rngl_cdbus;

assign pmu_rng_in         = `SPC5.pmu.pmu_rngl_cdbus;
assign pmu_rng_value[63:0] = {pmu_rng_in[63:0]};

assign pmu_rng_tid[2:0]   = pmu_rng[58:56];

assign pcr_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR or PR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h10)    // ASR#
                            );
assign pic_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h11)    // ASR#
                            );

always @ (posedge `SPC5.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value

  pcr_rd_1      <= pcr_rd;
  pmu_rng_tid_1 <= pmu_rng_tid[2:0];
  pic_rd_1      <= pic_rd;

  pcr_rd_2      <= pcr_rd_1;
  pmu_rng_tid_2 <= pmu_rng_tid_1[2:0];
  pic_rd_2      <= pic_rd_1;

  pcr_rd_3      <= pcr_rd_2;
  pmu_rng_tid_3 <= pmu_rng_tid_2[2:0];
  pic_rd_3      <= pic_rd_2;

  pmu_tnum      = (mycid * 8) + pmu_rng_tid_3;

  // PCR register followme
  if (pcr_rd_3) begin // {



    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum,8'h10 , pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h10, pmu_rng_value);
    end // }

  end // }

  // PIC register followme
  if (pic_rd_3) begin // {

   `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum, 8'h11, pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h11, pmu_rng_value);
    end // }

  end // }
end // always }



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_6

module core_sync_c6();
`ifndef GATESIM

// common defines
`include "defines.vh"

wire [64:0] tlu_rng;
wire [63:0] rng_value;
wire  [2:0] rng_tid;
reg   [2:0] rng_tid_1;
wire        tick_rd;
reg         tick_rd_1;
wire        stick_rd;
reg         stick_rd_1;

wire        hwtwPending_rd;
reg         hwtwPending_rd_1;

//---------------------
//  PMU

wire [64:0] pmu_rng;
wire [63:0] pmu_rng_value;
wire  [2:0] pmu_rng_tid;
reg  [2:0]  pmu_rng_tid_1;

wire [64:0] pmu_rng_in;

wire        pcr_rd;
reg         pcr_rd_1;
wire        pic_rd;
reg         pic_rd_1;

reg         pcr_rd_2;
reg         pic_rd_2;
reg  [2:0]  pmu_rng_tid_2;

reg         pcr_rd_3;
reg         pic_rd_3;
reg  [2:0]  pmu_rng_tid_3;

reg  [5:0]  pmu_tnum;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    junk;
integer                    i;


initial begin // {
    mycid   = 6;
end //}

//----------------------------------------------------------
// DUT probes

//--------------------
// TICK & STICK ASR READ

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign tlu_rng   = `SPC6.tlu.tlu_rngf_cdbus;

assign rng_value     = {1'b0,tlu_rng[62:0]};
assign rng_tid       = tlu_rng[58:56];

assign tick_rd        = ((tlu_rng[64]==1'h1) &     // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         ((tlu_rng[61:60]==2'h1) | (tlu_rng[61:60]==2'h2)) &  // ASR or PR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h04)     // ASR#
                        );
assign stick_rd       = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[61:60]==2'h1) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h18)    // ASR#
                        );

assign hwtwPending_rd = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[62:60]==3'h0) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h54) &   // ASI#
                         (tlu_rng[47:0] == 48'h98)   // VA#
                        );
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC6.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value
  tick_rd_1   <= tick_rd;
  rng_tid_1   <= rng_tid;
  stick_rd_1  <= stick_rd;
  hwtwPending_rd_1 <= hwtwPending_rd;

  // TICK register followme
  if (tick_rd_1) begin // {

    myasi = 8'h04;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // STICK register followme
  if (stick_rd_1) begin // {

    myasi = 8'h18;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // HWTW Pending register followme
  if (hwtwPending_rd_1) begin // {

    myasi = 8'h54;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi,  64'h98, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, 64'h98, rng_value);
    end // }

  end // }

end // always }


//------------------------------------------
// PMU PCR

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign pmu_rng            = `SPC6.pmu.in_rngl_cdbus;

assign pmu_rng_in         = `SPC6.pmu.pmu_rngl_cdbus;
assign pmu_rng_value[63:0] = {pmu_rng_in[63:0]};

assign pmu_rng_tid[2:0]   = pmu_rng[58:56];

assign pcr_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR or PR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h10)    // ASR#
                            );
assign pic_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h11)    // ASR#
                            );

always @ (posedge `SPC6.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value

  pcr_rd_1      <= pcr_rd;
  pmu_rng_tid_1 <= pmu_rng_tid[2:0];
  pic_rd_1      <= pic_rd;

  pcr_rd_2      <= pcr_rd_1;
  pmu_rng_tid_2 <= pmu_rng_tid_1[2:0];
  pic_rd_2      <= pic_rd_1;

  pcr_rd_3      <= pcr_rd_2;
  pmu_rng_tid_3 <= pmu_rng_tid_2[2:0];
  pic_rd_3      <= pic_rd_2;

  pmu_tnum      = (mycid * 8) + pmu_rng_tid_3;

  // PCR register followme
  if (pcr_rd_3) begin // {



    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum,8'h10 , pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h10, pmu_rng_value);
    end // }

  end // }

  // PIC register followme
  if (pic_rd_3) begin // {

   `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum, 8'h11, pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h11, pmu_rng_value);
    end // }

  end // }
end // always }



//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_7

module core_sync_c7();
`ifndef GATESIM

// common defines
`include "defines.vh"

wire [64:0] tlu_rng;
wire [63:0] rng_value;
wire  [2:0] rng_tid;
reg   [2:0] rng_tid_1;
wire        tick_rd;
reg         tick_rd_1;
wire        stick_rd;
reg         stick_rd_1;

wire        hwtwPending_rd;
reg         hwtwPending_rd_1;

//---------------------
//  PMU

wire [64:0] pmu_rng;
wire [63:0] pmu_rng_value;
wire  [2:0] pmu_rng_tid;
reg  [2:0]  pmu_rng_tid_1;

wire [64:0] pmu_rng_in;

wire        pcr_rd;
reg         pcr_rd_1;
wire        pic_rd;
reg         pic_rd_1;

reg         pcr_rd_2;
reg         pic_rd_2;
reg  [2:0]  pmu_rng_tid_2;

reg         pcr_rd_3;
reg         pic_rd_3;
reg  [2:0]  pmu_rng_tid_3;

reg  [5:0]  pmu_tnum;

//---------------------
// Misc
reg                  [2:0] mycid;
reg                  [2:0] mytid;
reg                  [5:0] mytnum;
reg                  [7:0] myasi;
reg      [(`TS_WIDTH-1):0] tstamp;
integer                    junk;
integer                    i;


initial begin // {
    mycid   = 7;
end //}

//----------------------------------------------------------
// DUT probes

//--------------------
// TICK & STICK ASR READ

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign tlu_rng   = `SPC7.tlu.tlu_rngf_cdbus;

assign rng_value     = {1'b0,tlu_rng[62:0]};
assign rng_tid       = tlu_rng[58:56];

assign tick_rd        = ((tlu_rng[64]==1'h1) &     // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         ((tlu_rng[61:60]==2'h1) | (tlu_rng[61:60]==2'h2)) &  // ASR or PR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h04)     // ASR#
                        );
assign stick_rd       = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[61:60]==2'h1) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h18)    // ASR#
                        );

assign hwtwPending_rd = ((tlu_rng[64]==1'h1) &      // Ctl pkt
                         (tlu_rng[63]==1'h1) &      // Valid
                         (tlu_rng[62:60]==3'h0) &  // ASR
                         (tlu_rng[59]==1'h1) &      // Read
                         (tlu_rng[55:48]==8'h54) &   // ASI#
                         (tlu_rng[47:0] == 48'h98)   // VA#
                        );
//----------------------------------------------------------
//----------------------------------------------------------

always @ (posedge `SPC7.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value
  tick_rd_1   <= tick_rd;
  rng_tid_1   <= rng_tid;
  stick_rd_1  <= stick_rd;
  hwtwPending_rd_1 <= hwtwPending_rd;

  // TICK register followme
  if (tick_rd_1) begin // {

    myasi = 8'h04;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // STICK register followme
  if (stick_rd_1) begin // {

    myasi = 8'h18;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                mycid,mytid,mytnum, myasi, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ,
                        mytnum, myasi, rng_value);
    end // }

  end // }

  // HWTW Pending register followme
  if (hwtwPending_rd_1) begin // {

    myasi = 8'h54;
    mytid = rng_tid_1;
    mytnum = (mycid * 8) + mytid;

    // followme
    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASI_READ  tid=%d asi=%0h va=%h val=0x%h ts=%0d", 
                mycid,mytid,mytnum,myasi,  64'h98, rng_value, tstamp);
    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASI_READ,
                        mytnum, myasi, 64'h98, rng_value);
    end // }

  end // }

end // always }


//------------------------------------------
// PMU PCR

// 65 bit control/data ring bus 
//   64    - ctl/data
//   63    - valid/hole
//   62    - ack
//   61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
//   59    - rd/wrx
//   58:56 - Thread ID
//   55:48 - ASI field
//   47:0  - Virtual Address

assign pmu_rng            = `SPC7.pmu.in_rngl_cdbus;

assign pmu_rng_in         = `SPC7.pmu.pmu_rngl_cdbus;
assign pmu_rng_value[63:0] = {pmu_rng_in[63:0]};

assign pmu_rng_tid[2:0]   = pmu_rng[58:56];

assign pcr_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR or PR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h10)    // ASR#
                            );
assign pic_rd            =  ((pmu_rng[64]==1'h1)    &   // Ctl pkt
                             (pmu_rng[63]==1'h1)    &   // Valid
                             (pmu_rng[61:60]==2'h1) &   // ASR
                             (pmu_rng[59]==1'h1)    &   // Read
                             (pmu_rng[55:48]==8'h11)    // ASR#
                            );

always @ (posedge `SPC7.l2clk) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // Delay by 1 cycle so it aligns with rng_value

  pcr_rd_1      <= pcr_rd;
  pmu_rng_tid_1 <= pmu_rng_tid[2:0];
  pic_rd_1      <= pic_rd;

  pcr_rd_2      <= pcr_rd_1;
  pmu_rng_tid_2 <= pmu_rng_tid_1[2:0];
  pic_rd_2      <= pic_rd_1;

  pcr_rd_3      <= pcr_rd_2;
  pmu_rng_tid_3 <= pmu_rng_tid_2[2:0];
  pic_rd_3      <= pic_rd_2;

  pmu_tnum      = (mycid * 8) + pmu_rng_tid_3;

  // PCR register followme
  if (pcr_rd_3) begin // {



    `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum,8'h10 , pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h10, pmu_rng_value);
    end // }

  end // }

  // PIC register followme
  if (pic_rd_3) begin // {

   `PR_INFO ("pli_int", `INFO, 
                "C%0d T%0d PLI_ASR_READ  tid=%h asi=%0h val=0x%h ts=%0d", 
                  mycid, pmu_rng_tid_1, pmu_tnum, 8'h11, pmu_rng_value, tstamp);

    if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
      junk = $sim_send(`PLI_ASR_READ, pmu_tnum, 8'h11, pmu_rng_value);
    end // }

  end // }
end // always }



//----------------------------------------------------------
`endif
endmodule

`endif

//----------------------------------------------------------
//----------------------------------------------------------
