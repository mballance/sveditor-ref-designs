// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: int.v
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
`timescale 1 ps/ 1 ps

`ifdef CORE_0

// }}}

module int_c0t0 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 0;
    assign   mytid = 0;
    assign   mytnum = 0*8 + 0;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC0_GCLK) ;
    @(posedge `BENCH_SPC0_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_0 `SPC0.tlu.cth.int_rec0
`define INT_VEC_RECV_ASIWR_0 (`TOP.nas_top.c0.t0.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_0 (`TOP.nas_top.c0.t0.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_0 `SPC0.tlu.trl0.take_ivt&`SPC0.tlu.trl0.trap[0]

`define CPU_MONDO_TAKEN_0 `SPC0.tlu.trl0.take_mqr&`SPC0.tlu.trl0.trap[0]
`define DEV_MONDO_TAKEN_0 `SPC0.tlu.trl0.take_dqr&`SPC0.tlu.trl0.trap[0]
`define RES_MONDO_TAKEN_0 `SPC0.tlu.trl0.take_rqr&`SPC0.tlu.trl0.trap[0]

`define XIR_TAKEN_0 `SPC0.tlu.trl0.take_xir&`SPC0.tlu.trl0.trap[0]

`define SOFTINT_RDWR_0 (`TOP.nas_top.c0.t0.asi_rdwr_softint|`TOP.nas_top.c0.t0.asi_wr_softint_delay)

`define SOFTINT_REG_0 `SPC0.tlu.trl0.softint0
`define RD_SOFTINT_REG_0 `SPC0.tlu.trl0.rd_softint0
`define INT_LEVEL_TAKEN_0 `SPC0.tlu.trl0.take_iln&`SPC0.tlu.trl0.trap[0]
`define INT_LEVEL_NUM_0 `SPC0.tlu.trl0.int_level_n
`define PMU_TAKEN_0 `SPC0.tlu.trl0.take_pmu&`SPC0.tlu.trl0.trap[0]

`define HINTP_RDWR_0 (`TOP.nas_top.c0.t0.asi_rdwr_hintp | `TOP.nas_top.c0.t0.asi_wr_hintp_delay)
`define HINTP_WR_0 (`SPC0.tlu.asi_wr_hintp[0])
`define HSTMATCH_0 `SPC0.tlu.trl0.hstick0_compare

`define HINTP_REG_0 `SPC0.tlu.trl0.hintp0
`define HSTM_TAKEN_0 `SPC0.tlu.trl0.take_hst&`SPC0.tlu.trl0.trap[0]

`define NAS_PIPE_FW2_0 |`TOP.nas_top.c0.t0.complete_fw2

`define CWQ_TAKEN_0 `SPC0.tlu.trl0.take_cwq&`SPC0.tlu.trl0.trap[0]
`define SMA_TAKEN_0 `SPC0.tlu.trl0.take_sma&`SPC0.tlu.trl0.trap[0]

`define POR_TAKEN_0 `SPC0.tlu.trl0.take_por&`SPC0.tlu.trl0.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC0_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_0 || `CPU_MONDO_TAKEN_0 ||
                          `DEV_MONDO_TAKEN_0 || `RES_MONDO_TAKEN_0 ||
                          `XIR_TAKEN_0 || `INT_LEVEL_TAKEN_0 ||
                          `HSTM_TAKEN_0 || `CWQ_TAKEN_0 ||
                          `SMA_TAKEN_0 || `PMU_TAKEN_0 || `POR_TAKEN_0);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_0, `CPU_MONDO_TAKEN_0, 
           `DEV_MONDO_TAKEN_0, `RES_MONDO_TAKEN_0,
           `XIR_TAKEN_0, `INT_LEVEL_TAKEN_0,
           `HSTM_TAKEN_0, `CWQ_TAKEN_0, `SMA_TAKEN_0 ,
           `PMU_TAKEN_0, `POR_TAKEN_0})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_0;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_0 | `INT_VEC_RECV_ASIWR_0)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_0 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_0 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_0;
    end // }
    else if (`INT_VEC_RECV_ASIWR_0)
        int_vec_recv_reg <= `TOP.nas_top.c0.t0.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_0 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_0 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_0 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_0 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_0 | `INT_VEC_RECV_ASIWR_0;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_0 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_0)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_0)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_0) begin  // {
        if (softint !== `RD_SOFTINT_REG_0 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_0;
    end // }
    
    if ((`NAS_PIPE_FW2_0 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_0&(softint !== `RD_SOFTINT_REG_0)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC0.tlu.asi_wr_clear_softint[0] |
             `SPC0.tlu.asi_wr_set_softint[0] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_0});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_0});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_0 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_0;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_0 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_0 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_0;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_0;
    hstmatch_late <= `HSTMATCH_0;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c0t1 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 0;
    assign   mytid = 1;
    assign   mytnum = 0*8 + 1;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC0_GCLK) ;
    @(posedge `BENCH_SPC0_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_1 `SPC0.tlu.cth.int_rec1
`define INT_VEC_RECV_ASIWR_1 (`TOP.nas_top.c0.t1.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_1 (`TOP.nas_top.c0.t1.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_1 `SPC0.tlu.trl0.take_ivt&`SPC0.tlu.trl0.trap[1]

`define CPU_MONDO_TAKEN_1 `SPC0.tlu.trl0.take_mqr&`SPC0.tlu.trl0.trap[1]
`define DEV_MONDO_TAKEN_1 `SPC0.tlu.trl0.take_dqr&`SPC0.tlu.trl0.trap[1]
`define RES_MONDO_TAKEN_1 `SPC0.tlu.trl0.take_rqr&`SPC0.tlu.trl0.trap[1]

`define XIR_TAKEN_1 `SPC0.tlu.trl0.take_xir&`SPC0.tlu.trl0.trap[1]

`define SOFTINT_RDWR_1 (`TOP.nas_top.c0.t1.asi_rdwr_softint|`TOP.nas_top.c0.t1.asi_wr_softint_delay)

`define SOFTINT_REG_1 `SPC0.tlu.trl0.softint1
`define RD_SOFTINT_REG_1 `SPC0.tlu.trl0.rd_softint1
`define INT_LEVEL_TAKEN_1 `SPC0.tlu.trl0.take_iln&`SPC0.tlu.trl0.trap[1]
`define INT_LEVEL_NUM_1 `SPC0.tlu.trl0.int_level_n
`define PMU_TAKEN_1 `SPC0.tlu.trl0.take_pmu&`SPC0.tlu.trl0.trap[1]

`define HINTP_RDWR_1 (`TOP.nas_top.c0.t1.asi_rdwr_hintp | `TOP.nas_top.c0.t1.asi_wr_hintp_delay)
`define HINTP_WR_1 (`SPC0.tlu.asi_wr_hintp[1])
`define HSTMATCH_1 `SPC0.tlu.trl0.hstick1_compare

`define HINTP_REG_1 `SPC0.tlu.trl0.hintp1
`define HSTM_TAKEN_1 `SPC0.tlu.trl0.take_hst&`SPC0.tlu.trl0.trap[1]

`define NAS_PIPE_FW2_1 |`TOP.nas_top.c0.t1.complete_fw2

`define CWQ_TAKEN_1 `SPC0.tlu.trl0.take_cwq&`SPC0.tlu.trl0.trap[1]
`define SMA_TAKEN_1 `SPC0.tlu.trl0.take_sma&`SPC0.tlu.trl0.trap[1]

`define POR_TAKEN_1 `SPC0.tlu.trl0.take_por&`SPC0.tlu.trl0.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC0_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_1 || `CPU_MONDO_TAKEN_1 ||
                          `DEV_MONDO_TAKEN_1 || `RES_MONDO_TAKEN_1 ||
                          `XIR_TAKEN_1 || `INT_LEVEL_TAKEN_1 ||
                          `HSTM_TAKEN_1 || `CWQ_TAKEN_1 ||
                          `SMA_TAKEN_1 || `PMU_TAKEN_1 || `POR_TAKEN_1);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_1, `CPU_MONDO_TAKEN_1, 
           `DEV_MONDO_TAKEN_1, `RES_MONDO_TAKEN_1,
           `XIR_TAKEN_1, `INT_LEVEL_TAKEN_1,
           `HSTM_TAKEN_1, `CWQ_TAKEN_1, `SMA_TAKEN_1 ,
           `PMU_TAKEN_1, `POR_TAKEN_1})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_1;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_1 | `INT_VEC_RECV_ASIWR_1)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_1 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_1 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_1;
    end // }
    else if (`INT_VEC_RECV_ASIWR_1)
        int_vec_recv_reg <= `TOP.nas_top.c0.t1.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_1 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_1 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_1 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_1 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_1 | `INT_VEC_RECV_ASIWR_1;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_1 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_1)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_1)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_1) begin  // {
        if (softint !== `RD_SOFTINT_REG_1 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_1;
    end // }
    
    if ((`NAS_PIPE_FW2_1 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_1&(softint !== `RD_SOFTINT_REG_1)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC0.tlu.asi_wr_clear_softint[1] |
             `SPC0.tlu.asi_wr_set_softint[1] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_1});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_1});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_1 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_1;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_1 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_1 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_1;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_1;
    hstmatch_late <= `HSTMATCH_1;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c0t2 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 0;
    assign   mytid = 2;
    assign   mytnum = 0*8 + 2;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC0_GCLK) ;
    @(posedge `BENCH_SPC0_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_2 `SPC0.tlu.cth.int_rec2
`define INT_VEC_RECV_ASIWR_2 (`TOP.nas_top.c0.t2.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_2 (`TOP.nas_top.c0.t2.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_2 `SPC0.tlu.trl0.take_ivt&`SPC0.tlu.trl0.trap[2]

`define CPU_MONDO_TAKEN_2 `SPC0.tlu.trl0.take_mqr&`SPC0.tlu.trl0.trap[2]
`define DEV_MONDO_TAKEN_2 `SPC0.tlu.trl0.take_dqr&`SPC0.tlu.trl0.trap[2]
`define RES_MONDO_TAKEN_2 `SPC0.tlu.trl0.take_rqr&`SPC0.tlu.trl0.trap[2]

`define XIR_TAKEN_2 `SPC0.tlu.trl0.take_xir&`SPC0.tlu.trl0.trap[2]

`define SOFTINT_RDWR_2 (`TOP.nas_top.c0.t2.asi_rdwr_softint|`TOP.nas_top.c0.t2.asi_wr_softint_delay)

`define SOFTINT_REG_2 `SPC0.tlu.trl0.softint2
`define RD_SOFTINT_REG_2 `SPC0.tlu.trl0.rd_softint2
`define INT_LEVEL_TAKEN_2 `SPC0.tlu.trl0.take_iln&`SPC0.tlu.trl0.trap[2]
`define INT_LEVEL_NUM_2 `SPC0.tlu.trl0.int_level_n
`define PMU_TAKEN_2 `SPC0.tlu.trl0.take_pmu&`SPC0.tlu.trl0.trap[2]

`define HINTP_RDWR_2 (`TOP.nas_top.c0.t2.asi_rdwr_hintp | `TOP.nas_top.c0.t2.asi_wr_hintp_delay)
`define HINTP_WR_2 (`SPC0.tlu.asi_wr_hintp[2])
`define HSTMATCH_2 `SPC0.tlu.trl0.hstick2_compare

`define HINTP_REG_2 `SPC0.tlu.trl0.hintp2
`define HSTM_TAKEN_2 `SPC0.tlu.trl0.take_hst&`SPC0.tlu.trl0.trap[2]

`define NAS_PIPE_FW2_2 |`TOP.nas_top.c0.t2.complete_fw2

`define CWQ_TAKEN_2 `SPC0.tlu.trl0.take_cwq&`SPC0.tlu.trl0.trap[2]
`define SMA_TAKEN_2 `SPC0.tlu.trl0.take_sma&`SPC0.tlu.trl0.trap[2]

`define POR_TAKEN_2 `SPC0.tlu.trl0.take_por&`SPC0.tlu.trl0.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC0_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_2 || `CPU_MONDO_TAKEN_2 ||
                          `DEV_MONDO_TAKEN_2 || `RES_MONDO_TAKEN_2 ||
                          `XIR_TAKEN_2 || `INT_LEVEL_TAKEN_2 ||
                          `HSTM_TAKEN_2 || `CWQ_TAKEN_2 ||
                          `SMA_TAKEN_2 || `PMU_TAKEN_2 || `POR_TAKEN_2);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_2, `CPU_MONDO_TAKEN_2, 
           `DEV_MONDO_TAKEN_2, `RES_MONDO_TAKEN_2,
           `XIR_TAKEN_2, `INT_LEVEL_TAKEN_2,
           `HSTM_TAKEN_2, `CWQ_TAKEN_2, `SMA_TAKEN_2 ,
           `PMU_TAKEN_2, `POR_TAKEN_2})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_2;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_2 | `INT_VEC_RECV_ASIWR_2)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_2 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_2 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_2;
    end // }
    else if (`INT_VEC_RECV_ASIWR_2)
        int_vec_recv_reg <= `TOP.nas_top.c0.t2.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_2 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_2 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_2 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_2 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_2 | `INT_VEC_RECV_ASIWR_2;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_2 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_2)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_2)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_2) begin  // {
        if (softint !== `RD_SOFTINT_REG_2 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_2;
    end // }
    
    if ((`NAS_PIPE_FW2_2 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_2&(softint !== `RD_SOFTINT_REG_2)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC0.tlu.asi_wr_clear_softint[2] |
             `SPC0.tlu.asi_wr_set_softint[2] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_2});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_2});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_2 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_2;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_2 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_2 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_2;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_2;
    hstmatch_late <= `HSTMATCH_2;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c0t3 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 0;
    assign   mytid = 3;
    assign   mytnum = 0*8 + 3;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC0_GCLK) ;
    @(posedge `BENCH_SPC0_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_3 `SPC0.tlu.cth.int_rec3
`define INT_VEC_RECV_ASIWR_3 (`TOP.nas_top.c0.t3.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_3 (`TOP.nas_top.c0.t3.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_3 `SPC0.tlu.trl0.take_ivt&`SPC0.tlu.trl0.trap[3]

`define CPU_MONDO_TAKEN_3 `SPC0.tlu.trl0.take_mqr&`SPC0.tlu.trl0.trap[3]
`define DEV_MONDO_TAKEN_3 `SPC0.tlu.trl0.take_dqr&`SPC0.tlu.trl0.trap[3]
`define RES_MONDO_TAKEN_3 `SPC0.tlu.trl0.take_rqr&`SPC0.tlu.trl0.trap[3]

`define XIR_TAKEN_3 `SPC0.tlu.trl0.take_xir&`SPC0.tlu.trl0.trap[3]

`define SOFTINT_RDWR_3 (`TOP.nas_top.c0.t3.asi_rdwr_softint|`TOP.nas_top.c0.t3.asi_wr_softint_delay)

`define SOFTINT_REG_3 `SPC0.tlu.trl0.softint3
`define RD_SOFTINT_REG_3 `SPC0.tlu.trl0.rd_softint3
`define INT_LEVEL_TAKEN_3 `SPC0.tlu.trl0.take_iln&`SPC0.tlu.trl0.trap[3]
`define INT_LEVEL_NUM_3 `SPC0.tlu.trl0.int_level_n
`define PMU_TAKEN_3 `SPC0.tlu.trl0.take_pmu&`SPC0.tlu.trl0.trap[3]

`define HINTP_RDWR_3 (`TOP.nas_top.c0.t3.asi_rdwr_hintp | `TOP.nas_top.c0.t3.asi_wr_hintp_delay)
`define HINTP_WR_3 (`SPC0.tlu.asi_wr_hintp[3])
`define HSTMATCH_3 `SPC0.tlu.trl0.hstick3_compare

`define HINTP_REG_3 `SPC0.tlu.trl0.hintp3
`define HSTM_TAKEN_3 `SPC0.tlu.trl0.take_hst&`SPC0.tlu.trl0.trap[3]

`define NAS_PIPE_FW2_3 |`TOP.nas_top.c0.t3.complete_fw2

`define CWQ_TAKEN_3 `SPC0.tlu.trl0.take_cwq&`SPC0.tlu.trl0.trap[3]
`define SMA_TAKEN_3 `SPC0.tlu.trl0.take_sma&`SPC0.tlu.trl0.trap[3]

`define POR_TAKEN_3 `SPC0.tlu.trl0.take_por&`SPC0.tlu.trl0.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC0_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_3 || `CPU_MONDO_TAKEN_3 ||
                          `DEV_MONDO_TAKEN_3 || `RES_MONDO_TAKEN_3 ||
                          `XIR_TAKEN_3 || `INT_LEVEL_TAKEN_3 ||
                          `HSTM_TAKEN_3 || `CWQ_TAKEN_3 ||
                          `SMA_TAKEN_3 || `PMU_TAKEN_3 || `POR_TAKEN_3);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_3, `CPU_MONDO_TAKEN_3, 
           `DEV_MONDO_TAKEN_3, `RES_MONDO_TAKEN_3,
           `XIR_TAKEN_3, `INT_LEVEL_TAKEN_3,
           `HSTM_TAKEN_3, `CWQ_TAKEN_3, `SMA_TAKEN_3 ,
           `PMU_TAKEN_3, `POR_TAKEN_3})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_3;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_3 | `INT_VEC_RECV_ASIWR_3)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_3 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_3 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_3;
    end // }
    else if (`INT_VEC_RECV_ASIWR_3)
        int_vec_recv_reg <= `TOP.nas_top.c0.t3.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_3 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_3 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_3 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_3 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_3 | `INT_VEC_RECV_ASIWR_3;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_3 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_3)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_3)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_3) begin  // {
        if (softint !== `RD_SOFTINT_REG_3 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_3;
    end // }
    
    if ((`NAS_PIPE_FW2_3 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_3&(softint !== `RD_SOFTINT_REG_3)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC0.tlu.asi_wr_clear_softint[3] |
             `SPC0.tlu.asi_wr_set_softint[3] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_3});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_3});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_3 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_3;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_3 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_3 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_3;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_3;
    hstmatch_late <= `HSTMATCH_3;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c0t4 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 0;
    assign   mytid = 4;
    assign   mytnum = 0*8 + 4;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC0_GCLK) ;
    @(posedge `BENCH_SPC0_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_4 `SPC0.tlu.cth.int_rec4
`define INT_VEC_RECV_ASIWR_4 (`TOP.nas_top.c0.t4.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_4 (`TOP.nas_top.c0.t4.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_4 `SPC0.tlu.trl1.take_ivt&`SPC0.tlu.trl1.trap[0]

`define CPU_MONDO_TAKEN_4 `SPC0.tlu.trl1.take_mqr&`SPC0.tlu.trl1.trap[0]
`define DEV_MONDO_TAKEN_4 `SPC0.tlu.trl1.take_dqr&`SPC0.tlu.trl1.trap[0]
`define RES_MONDO_TAKEN_4 `SPC0.tlu.trl1.take_rqr&`SPC0.tlu.trl1.trap[0]

`define XIR_TAKEN_4 `SPC0.tlu.trl1.take_xir&`SPC0.tlu.trl1.trap[0]

`define SOFTINT_RDWR_4 (`TOP.nas_top.c0.t4.asi_rdwr_softint|`TOP.nas_top.c0.t4.asi_wr_softint_delay)

`define SOFTINT_REG_4 `SPC0.tlu.trl1.softint0
`define RD_SOFTINT_REG_4 `SPC0.tlu.trl1.rd_softint0
`define INT_LEVEL_TAKEN_4 `SPC0.tlu.trl1.take_iln&`SPC0.tlu.trl1.trap[0]
`define INT_LEVEL_NUM_4 `SPC0.tlu.trl1.int_level_n
`define PMU_TAKEN_4 `SPC0.tlu.trl1.take_pmu&`SPC0.tlu.trl1.trap[0]

`define HINTP_RDWR_4 (`TOP.nas_top.c0.t4.asi_rdwr_hintp | `TOP.nas_top.c0.t4.asi_wr_hintp_delay)
`define HINTP_WR_4 (`SPC0.tlu.asi_wr_hintp[4])
`define HSTMATCH_4 `SPC0.tlu.trl1.hstick0_compare

`define HINTP_REG_4 `SPC0.tlu.trl1.hintp0
`define HSTM_TAKEN_4 `SPC0.tlu.trl1.take_hst&`SPC0.tlu.trl1.trap[0]

`define NAS_PIPE_FW2_4 |`TOP.nas_top.c0.t4.complete_fw2

`define CWQ_TAKEN_4 `SPC0.tlu.trl1.take_cwq&`SPC0.tlu.trl1.trap[0]
`define SMA_TAKEN_4 `SPC0.tlu.trl1.take_sma&`SPC0.tlu.trl1.trap[0]

`define POR_TAKEN_4 `SPC0.tlu.trl1.take_por&`SPC0.tlu.trl1.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC0_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_4 || `CPU_MONDO_TAKEN_4 ||
                          `DEV_MONDO_TAKEN_4 || `RES_MONDO_TAKEN_4 ||
                          `XIR_TAKEN_4 || `INT_LEVEL_TAKEN_4 ||
                          `HSTM_TAKEN_4 || `CWQ_TAKEN_4 ||
                          `SMA_TAKEN_4 || `PMU_TAKEN_4 || `POR_TAKEN_4);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_4, `CPU_MONDO_TAKEN_4, 
           `DEV_MONDO_TAKEN_4, `RES_MONDO_TAKEN_4,
           `XIR_TAKEN_4, `INT_LEVEL_TAKEN_4,
           `HSTM_TAKEN_4, `CWQ_TAKEN_4, `SMA_TAKEN_4 ,
           `PMU_TAKEN_4, `POR_TAKEN_4})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_4;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_4 | `INT_VEC_RECV_ASIWR_4)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_4 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_4 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_4;
    end // }
    else if (`INT_VEC_RECV_ASIWR_4)
        int_vec_recv_reg <= `TOP.nas_top.c0.t4.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_4 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_4 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_4 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_4 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_4 | `INT_VEC_RECV_ASIWR_4;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_4 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_4)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_4)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_4) begin  // {
        if (softint !== `RD_SOFTINT_REG_4 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_4;
    end // }
    
    if ((`NAS_PIPE_FW2_4 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_4&(softint !== `RD_SOFTINT_REG_4)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC0.tlu.asi_wr_clear_softint[4] |
             `SPC0.tlu.asi_wr_set_softint[4] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_4});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_4});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_4 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_4;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_4 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_4 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_4;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_4;
    hstmatch_late <= `HSTMATCH_4;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c0t5 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 0;
    assign   mytid = 5;
    assign   mytnum = 0*8 + 5;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC0_GCLK) ;
    @(posedge `BENCH_SPC0_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_5 `SPC0.tlu.cth.int_rec5
`define INT_VEC_RECV_ASIWR_5 (`TOP.nas_top.c0.t5.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_5 (`TOP.nas_top.c0.t5.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_5 `SPC0.tlu.trl1.take_ivt&`SPC0.tlu.trl1.trap[1]

`define CPU_MONDO_TAKEN_5 `SPC0.tlu.trl1.take_mqr&`SPC0.tlu.trl1.trap[1]
`define DEV_MONDO_TAKEN_5 `SPC0.tlu.trl1.take_dqr&`SPC0.tlu.trl1.trap[1]
`define RES_MONDO_TAKEN_5 `SPC0.tlu.trl1.take_rqr&`SPC0.tlu.trl1.trap[1]

`define XIR_TAKEN_5 `SPC0.tlu.trl1.take_xir&`SPC0.tlu.trl1.trap[1]

`define SOFTINT_RDWR_5 (`TOP.nas_top.c0.t5.asi_rdwr_softint|`TOP.nas_top.c0.t5.asi_wr_softint_delay)

`define SOFTINT_REG_5 `SPC0.tlu.trl1.softint1
`define RD_SOFTINT_REG_5 `SPC0.tlu.trl1.rd_softint1
`define INT_LEVEL_TAKEN_5 `SPC0.tlu.trl1.take_iln&`SPC0.tlu.trl1.trap[1]
`define INT_LEVEL_NUM_5 `SPC0.tlu.trl1.int_level_n
`define PMU_TAKEN_5 `SPC0.tlu.trl1.take_pmu&`SPC0.tlu.trl1.trap[1]

`define HINTP_RDWR_5 (`TOP.nas_top.c0.t5.asi_rdwr_hintp | `TOP.nas_top.c0.t5.asi_wr_hintp_delay)
`define HINTP_WR_5 (`SPC0.tlu.asi_wr_hintp[5])
`define HSTMATCH_5 `SPC0.tlu.trl1.hstick1_compare

`define HINTP_REG_5 `SPC0.tlu.trl1.hintp1
`define HSTM_TAKEN_5 `SPC0.tlu.trl1.take_hst&`SPC0.tlu.trl1.trap[1]

`define NAS_PIPE_FW2_5 |`TOP.nas_top.c0.t5.complete_fw2

`define CWQ_TAKEN_5 `SPC0.tlu.trl1.take_cwq&`SPC0.tlu.trl1.trap[1]
`define SMA_TAKEN_5 `SPC0.tlu.trl1.take_sma&`SPC0.tlu.trl1.trap[1]

`define POR_TAKEN_5 `SPC0.tlu.trl1.take_por&`SPC0.tlu.trl1.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC0_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_5 || `CPU_MONDO_TAKEN_5 ||
                          `DEV_MONDO_TAKEN_5 || `RES_MONDO_TAKEN_5 ||
                          `XIR_TAKEN_5 || `INT_LEVEL_TAKEN_5 ||
                          `HSTM_TAKEN_5 || `CWQ_TAKEN_5 ||
                          `SMA_TAKEN_5 || `PMU_TAKEN_5 || `POR_TAKEN_5);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_5, `CPU_MONDO_TAKEN_5, 
           `DEV_MONDO_TAKEN_5, `RES_MONDO_TAKEN_5,
           `XIR_TAKEN_5, `INT_LEVEL_TAKEN_5,
           `HSTM_TAKEN_5, `CWQ_TAKEN_5, `SMA_TAKEN_5 ,
           `PMU_TAKEN_5, `POR_TAKEN_5})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_5;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_5 | `INT_VEC_RECV_ASIWR_5)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_5 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_5 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_5;
    end // }
    else if (`INT_VEC_RECV_ASIWR_5)
        int_vec_recv_reg <= `TOP.nas_top.c0.t5.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_5 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_5 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_5 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_5 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_5 | `INT_VEC_RECV_ASIWR_5;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_5 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_5)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_5)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_5) begin  // {
        if (softint !== `RD_SOFTINT_REG_5 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_5;
    end // }
    
    if ((`NAS_PIPE_FW2_5 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_5&(softint !== `RD_SOFTINT_REG_5)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC0.tlu.asi_wr_clear_softint[5] |
             `SPC0.tlu.asi_wr_set_softint[5] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_5});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_5});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_5 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_5;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_5 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_5 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_5;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_5;
    hstmatch_late <= `HSTMATCH_5;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c0t6 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 0;
    assign   mytid = 6;
    assign   mytnum = 0*8 + 6;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC0_GCLK) ;
    @(posedge `BENCH_SPC0_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_6 `SPC0.tlu.cth.int_rec6
`define INT_VEC_RECV_ASIWR_6 (`TOP.nas_top.c0.t6.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_6 (`TOP.nas_top.c0.t6.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_6 `SPC0.tlu.trl1.take_ivt&`SPC0.tlu.trl1.trap[2]

`define CPU_MONDO_TAKEN_6 `SPC0.tlu.trl1.take_mqr&`SPC0.tlu.trl1.trap[2]
`define DEV_MONDO_TAKEN_6 `SPC0.tlu.trl1.take_dqr&`SPC0.tlu.trl1.trap[2]
`define RES_MONDO_TAKEN_6 `SPC0.tlu.trl1.take_rqr&`SPC0.tlu.trl1.trap[2]

`define XIR_TAKEN_6 `SPC0.tlu.trl1.take_xir&`SPC0.tlu.trl1.trap[2]

`define SOFTINT_RDWR_6 (`TOP.nas_top.c0.t6.asi_rdwr_softint|`TOP.nas_top.c0.t6.asi_wr_softint_delay)

`define SOFTINT_REG_6 `SPC0.tlu.trl1.softint2
`define RD_SOFTINT_REG_6 `SPC0.tlu.trl1.rd_softint2
`define INT_LEVEL_TAKEN_6 `SPC0.tlu.trl1.take_iln&`SPC0.tlu.trl1.trap[2]
`define INT_LEVEL_NUM_6 `SPC0.tlu.trl1.int_level_n
`define PMU_TAKEN_6 `SPC0.tlu.trl1.take_pmu&`SPC0.tlu.trl1.trap[2]

`define HINTP_RDWR_6 (`TOP.nas_top.c0.t6.asi_rdwr_hintp | `TOP.nas_top.c0.t6.asi_wr_hintp_delay)
`define HINTP_WR_6 (`SPC0.tlu.asi_wr_hintp[6])
`define HSTMATCH_6 `SPC0.tlu.trl1.hstick2_compare

`define HINTP_REG_6 `SPC0.tlu.trl1.hintp2
`define HSTM_TAKEN_6 `SPC0.tlu.trl1.take_hst&`SPC0.tlu.trl1.trap[2]

`define NAS_PIPE_FW2_6 |`TOP.nas_top.c0.t6.complete_fw2

`define CWQ_TAKEN_6 `SPC0.tlu.trl1.take_cwq&`SPC0.tlu.trl1.trap[2]
`define SMA_TAKEN_6 `SPC0.tlu.trl1.take_sma&`SPC0.tlu.trl1.trap[2]

`define POR_TAKEN_6 `SPC0.tlu.trl1.take_por&`SPC0.tlu.trl1.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC0_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_6 || `CPU_MONDO_TAKEN_6 ||
                          `DEV_MONDO_TAKEN_6 || `RES_MONDO_TAKEN_6 ||
                          `XIR_TAKEN_6 || `INT_LEVEL_TAKEN_6 ||
                          `HSTM_TAKEN_6 || `CWQ_TAKEN_6 ||
                          `SMA_TAKEN_6 || `PMU_TAKEN_6 || `POR_TAKEN_6);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_6, `CPU_MONDO_TAKEN_6, 
           `DEV_MONDO_TAKEN_6, `RES_MONDO_TAKEN_6,
           `XIR_TAKEN_6, `INT_LEVEL_TAKEN_6,
           `HSTM_TAKEN_6, `CWQ_TAKEN_6, `SMA_TAKEN_6 ,
           `PMU_TAKEN_6, `POR_TAKEN_6})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_6;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_6 | `INT_VEC_RECV_ASIWR_6)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_6 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_6 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_6;
    end // }
    else if (`INT_VEC_RECV_ASIWR_6)
        int_vec_recv_reg <= `TOP.nas_top.c0.t6.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_6 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_6 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_6 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_6 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_6 | `INT_VEC_RECV_ASIWR_6;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_6 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_6)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_6)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_6) begin  // {
        if (softint !== `RD_SOFTINT_REG_6 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_6;
    end // }
    
    if ((`NAS_PIPE_FW2_6 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_6&(softint !== `RD_SOFTINT_REG_6)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC0.tlu.asi_wr_clear_softint[6] |
             `SPC0.tlu.asi_wr_set_softint[6] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_6});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_6});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_6 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_6;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_6 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_6 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_6;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_6;
    hstmatch_late <= `HSTMATCH_6;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c0t7 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 0;
    assign   mytid = 7;
    assign   mytnum = 0*8 + 7;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC0_GCLK) ;
    @(posedge `BENCH_SPC0_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_7 `SPC0.tlu.cth.int_rec7
`define INT_VEC_RECV_ASIWR_7 (`TOP.nas_top.c0.t7.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_7 (`TOP.nas_top.c0.t7.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_7 `SPC0.tlu.trl1.take_ivt&`SPC0.tlu.trl1.trap[3]

`define CPU_MONDO_TAKEN_7 `SPC0.tlu.trl1.take_mqr&`SPC0.tlu.trl1.trap[3]
`define DEV_MONDO_TAKEN_7 `SPC0.tlu.trl1.take_dqr&`SPC0.tlu.trl1.trap[3]
`define RES_MONDO_TAKEN_7 `SPC0.tlu.trl1.take_rqr&`SPC0.tlu.trl1.trap[3]

`define XIR_TAKEN_7 `SPC0.tlu.trl1.take_xir&`SPC0.tlu.trl1.trap[3]

`define SOFTINT_RDWR_7 (`TOP.nas_top.c0.t7.asi_rdwr_softint|`TOP.nas_top.c0.t7.asi_wr_softint_delay)

`define SOFTINT_REG_7 `SPC0.tlu.trl1.softint3
`define RD_SOFTINT_REG_7 `SPC0.tlu.trl1.rd_softint3
`define INT_LEVEL_TAKEN_7 `SPC0.tlu.trl1.take_iln&`SPC0.tlu.trl1.trap[3]
`define INT_LEVEL_NUM_7 `SPC0.tlu.trl1.int_level_n
`define PMU_TAKEN_7 `SPC0.tlu.trl1.take_pmu&`SPC0.tlu.trl1.trap[3]

`define HINTP_RDWR_7 (`TOP.nas_top.c0.t7.asi_rdwr_hintp | `TOP.nas_top.c0.t7.asi_wr_hintp_delay)
`define HINTP_WR_7 (`SPC0.tlu.asi_wr_hintp[7])
`define HSTMATCH_7 `SPC0.tlu.trl1.hstick3_compare

`define HINTP_REG_7 `SPC0.tlu.trl1.hintp3
`define HSTM_TAKEN_7 `SPC0.tlu.trl1.take_hst&`SPC0.tlu.trl1.trap[3]

`define NAS_PIPE_FW2_7 |`TOP.nas_top.c0.t7.complete_fw2

`define CWQ_TAKEN_7 `SPC0.tlu.trl1.take_cwq&`SPC0.tlu.trl1.trap[3]
`define SMA_TAKEN_7 `SPC0.tlu.trl1.take_sma&`SPC0.tlu.trl1.trap[3]

`define POR_TAKEN_7 `SPC0.tlu.trl1.take_por&`SPC0.tlu.trl1.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC0_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_7 || `CPU_MONDO_TAKEN_7 ||
                          `DEV_MONDO_TAKEN_7 || `RES_MONDO_TAKEN_7 ||
                          `XIR_TAKEN_7 || `INT_LEVEL_TAKEN_7 ||
                          `HSTM_TAKEN_7 || `CWQ_TAKEN_7 ||
                          `SMA_TAKEN_7 || `PMU_TAKEN_7 || `POR_TAKEN_7);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_7, `CPU_MONDO_TAKEN_7, 
           `DEV_MONDO_TAKEN_7, `RES_MONDO_TAKEN_7,
           `XIR_TAKEN_7, `INT_LEVEL_TAKEN_7,
           `HSTM_TAKEN_7, `CWQ_TAKEN_7, `SMA_TAKEN_7 ,
           `PMU_TAKEN_7, `POR_TAKEN_7})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_7;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_7 | `INT_VEC_RECV_ASIWR_7)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_7 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_7 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_7;
    end // }
    else if (`INT_VEC_RECV_ASIWR_7)
        int_vec_recv_reg <= `TOP.nas_top.c0.t7.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_7 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_7 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_7 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_7 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_7 | `INT_VEC_RECV_ASIWR_7;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_7 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_7)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_7)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_7) begin  // {
        if (softint !== `RD_SOFTINT_REG_7 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_7;
    end // }
    
    if ((`NAS_PIPE_FW2_7 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_7&(softint !== `RD_SOFTINT_REG_7)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC0.tlu.asi_wr_clear_softint[7] |
             `SPC0.tlu.asi_wr_set_softint[7] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_7});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_7});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_7 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_7;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_7 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_7 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_7;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_7;
    hstmatch_late <= `HSTMATCH_7;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

`endif
`ifdef CORE_1

// }}}

module int_c1t0 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 1;
    assign   mytid = 0;
    assign   mytnum = 1*8 + 0;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC1_GCLK) ;
    @(posedge `BENCH_SPC1_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_8 `SPC1.tlu.cth.int_rec0
`define INT_VEC_RECV_ASIWR_8 (`TOP.nas_top.c1.t0.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_8 (`TOP.nas_top.c1.t0.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_8 `SPC1.tlu.trl0.take_ivt&`SPC1.tlu.trl0.trap[0]

`define CPU_MONDO_TAKEN_8 `SPC1.tlu.trl0.take_mqr&`SPC1.tlu.trl0.trap[0]
`define DEV_MONDO_TAKEN_8 `SPC1.tlu.trl0.take_dqr&`SPC1.tlu.trl0.trap[0]
`define RES_MONDO_TAKEN_8 `SPC1.tlu.trl0.take_rqr&`SPC1.tlu.trl0.trap[0]

`define XIR_TAKEN_8 `SPC1.tlu.trl0.take_xir&`SPC1.tlu.trl0.trap[0]

`define SOFTINT_RDWR_8 (`TOP.nas_top.c1.t0.asi_rdwr_softint|`TOP.nas_top.c1.t0.asi_wr_softint_delay)

`define SOFTINT_REG_8 `SPC1.tlu.trl0.softint0
`define RD_SOFTINT_REG_8 `SPC1.tlu.trl0.rd_softint0
`define INT_LEVEL_TAKEN_8 `SPC1.tlu.trl0.take_iln&`SPC1.tlu.trl0.trap[0]
`define INT_LEVEL_NUM_8 `SPC1.tlu.trl0.int_level_n
`define PMU_TAKEN_8 `SPC1.tlu.trl0.take_pmu&`SPC1.tlu.trl0.trap[0]

`define HINTP_RDWR_8 (`TOP.nas_top.c1.t0.asi_rdwr_hintp | `TOP.nas_top.c1.t0.asi_wr_hintp_delay)
`define HINTP_WR_8 (`SPC1.tlu.asi_wr_hintp[8])
`define HSTMATCH_8 `SPC1.tlu.trl0.hstick0_compare

`define HINTP_REG_8 `SPC1.tlu.trl0.hintp0
`define HSTM_TAKEN_8 `SPC1.tlu.trl0.take_hst&`SPC1.tlu.trl0.trap[0]

`define NAS_PIPE_FW2_8 |`TOP.nas_top.c1.t0.complete_fw2

`define CWQ_TAKEN_8 `SPC1.tlu.trl0.take_cwq&`SPC1.tlu.trl0.trap[0]
`define SMA_TAKEN_8 `SPC1.tlu.trl0.take_sma&`SPC1.tlu.trl0.trap[0]

`define POR_TAKEN_8 `SPC1.tlu.trl0.take_por&`SPC1.tlu.trl0.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC1_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_8 || `CPU_MONDO_TAKEN_8 ||
                          `DEV_MONDO_TAKEN_8 || `RES_MONDO_TAKEN_8 ||
                          `XIR_TAKEN_8 || `INT_LEVEL_TAKEN_8 ||
                          `HSTM_TAKEN_8 || `CWQ_TAKEN_8 ||
                          `SMA_TAKEN_8 || `PMU_TAKEN_8 || `POR_TAKEN_8);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_8, `CPU_MONDO_TAKEN_8, 
           `DEV_MONDO_TAKEN_8, `RES_MONDO_TAKEN_8,
           `XIR_TAKEN_8, `INT_LEVEL_TAKEN_8,
           `HSTM_TAKEN_8, `CWQ_TAKEN_8, `SMA_TAKEN_8 ,
           `PMU_TAKEN_8, `POR_TAKEN_8})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_8;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_8 | `INT_VEC_RECV_ASIWR_8)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_8 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_8 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_8;
    end // }
    else if (`INT_VEC_RECV_ASIWR_8)
        int_vec_recv_reg <= `TOP.nas_top.c1.t0.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_8 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_8 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_8 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_8 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_8 | `INT_VEC_RECV_ASIWR_8;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_8 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_8)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_8)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_8) begin  // {
        if (softint !== `RD_SOFTINT_REG_8 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_8;
    end // }
    
    if ((`NAS_PIPE_FW2_8 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_8&(softint !== `RD_SOFTINT_REG_8)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC1.tlu.asi_wr_clear_softint[0] |
             `SPC1.tlu.asi_wr_set_softint[0] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_8});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_8});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_8 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_8;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_8 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_8 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_8;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_8;
    hstmatch_late <= `HSTMATCH_8;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c1t1 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 1;
    assign   mytid = 1;
    assign   mytnum = 1*8 + 1;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC1_GCLK) ;
    @(posedge `BENCH_SPC1_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_9 `SPC1.tlu.cth.int_rec1
`define INT_VEC_RECV_ASIWR_9 (`TOP.nas_top.c1.t1.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_9 (`TOP.nas_top.c1.t1.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_9 `SPC1.tlu.trl0.take_ivt&`SPC1.tlu.trl0.trap[1]

`define CPU_MONDO_TAKEN_9 `SPC1.tlu.trl0.take_mqr&`SPC1.tlu.trl0.trap[1]
`define DEV_MONDO_TAKEN_9 `SPC1.tlu.trl0.take_dqr&`SPC1.tlu.trl0.trap[1]
`define RES_MONDO_TAKEN_9 `SPC1.tlu.trl0.take_rqr&`SPC1.tlu.trl0.trap[1]

`define XIR_TAKEN_9 `SPC1.tlu.trl0.take_xir&`SPC1.tlu.trl0.trap[1]

`define SOFTINT_RDWR_9 (`TOP.nas_top.c1.t1.asi_rdwr_softint|`TOP.nas_top.c1.t1.asi_wr_softint_delay)

`define SOFTINT_REG_9 `SPC1.tlu.trl0.softint1
`define RD_SOFTINT_REG_9 `SPC1.tlu.trl0.rd_softint1
`define INT_LEVEL_TAKEN_9 `SPC1.tlu.trl0.take_iln&`SPC1.tlu.trl0.trap[1]
`define INT_LEVEL_NUM_9 `SPC1.tlu.trl0.int_level_n
`define PMU_TAKEN_9 `SPC1.tlu.trl0.take_pmu&`SPC1.tlu.trl0.trap[1]

`define HINTP_RDWR_9 (`TOP.nas_top.c1.t1.asi_rdwr_hintp | `TOP.nas_top.c1.t1.asi_wr_hintp_delay)
`define HINTP_WR_9 (`SPC1.tlu.asi_wr_hintp[9])
`define HSTMATCH_9 `SPC1.tlu.trl0.hstick1_compare

`define HINTP_REG_9 `SPC1.tlu.trl0.hintp1
`define HSTM_TAKEN_9 `SPC1.tlu.trl0.take_hst&`SPC1.tlu.trl0.trap[1]

`define NAS_PIPE_FW2_9 |`TOP.nas_top.c1.t1.complete_fw2

`define CWQ_TAKEN_9 `SPC1.tlu.trl0.take_cwq&`SPC1.tlu.trl0.trap[1]
`define SMA_TAKEN_9 `SPC1.tlu.trl0.take_sma&`SPC1.tlu.trl0.trap[1]

`define POR_TAKEN_9 `SPC1.tlu.trl0.take_por&`SPC1.tlu.trl0.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC1_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_9 || `CPU_MONDO_TAKEN_9 ||
                          `DEV_MONDO_TAKEN_9 || `RES_MONDO_TAKEN_9 ||
                          `XIR_TAKEN_9 || `INT_LEVEL_TAKEN_9 ||
                          `HSTM_TAKEN_9 || `CWQ_TAKEN_9 ||
                          `SMA_TAKEN_9 || `PMU_TAKEN_9 || `POR_TAKEN_9);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_9, `CPU_MONDO_TAKEN_9, 
           `DEV_MONDO_TAKEN_9, `RES_MONDO_TAKEN_9,
           `XIR_TAKEN_9, `INT_LEVEL_TAKEN_9,
           `HSTM_TAKEN_9, `CWQ_TAKEN_9, `SMA_TAKEN_9 ,
           `PMU_TAKEN_9, `POR_TAKEN_9})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_9;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_9 | `INT_VEC_RECV_ASIWR_9)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_9 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_9 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_9;
    end // }
    else if (`INT_VEC_RECV_ASIWR_9)
        int_vec_recv_reg <= `TOP.nas_top.c1.t1.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_9 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_9 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_9 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_9 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_9 | `INT_VEC_RECV_ASIWR_9;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_9 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_9)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_9)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_9) begin  // {
        if (softint !== `RD_SOFTINT_REG_9 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_9;
    end // }
    
    if ((`NAS_PIPE_FW2_9 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_9&(softint !== `RD_SOFTINT_REG_9)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC1.tlu.asi_wr_clear_softint[1] |
             `SPC1.tlu.asi_wr_set_softint[1] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_9});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_9});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_9 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_9;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_9 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_9 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_9;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_9;
    hstmatch_late <= `HSTMATCH_9;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c1t2 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 1;
    assign   mytid = 2;
    assign   mytnum = 1*8 + 2;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC1_GCLK) ;
    @(posedge `BENCH_SPC1_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_10 `SPC1.tlu.cth.int_rec2
`define INT_VEC_RECV_ASIWR_10 (`TOP.nas_top.c1.t2.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_10 (`TOP.nas_top.c1.t2.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_10 `SPC1.tlu.trl0.take_ivt&`SPC1.tlu.trl0.trap[2]

`define CPU_MONDO_TAKEN_10 `SPC1.tlu.trl0.take_mqr&`SPC1.tlu.trl0.trap[2]
`define DEV_MONDO_TAKEN_10 `SPC1.tlu.trl0.take_dqr&`SPC1.tlu.trl0.trap[2]
`define RES_MONDO_TAKEN_10 `SPC1.tlu.trl0.take_rqr&`SPC1.tlu.trl0.trap[2]

`define XIR_TAKEN_10 `SPC1.tlu.trl0.take_xir&`SPC1.tlu.trl0.trap[2]

`define SOFTINT_RDWR_10 (`TOP.nas_top.c1.t2.asi_rdwr_softint|`TOP.nas_top.c1.t2.asi_wr_softint_delay)

`define SOFTINT_REG_10 `SPC1.tlu.trl0.softint2
`define RD_SOFTINT_REG_10 `SPC1.tlu.trl0.rd_softint2
`define INT_LEVEL_TAKEN_10 `SPC1.tlu.trl0.take_iln&`SPC1.tlu.trl0.trap[2]
`define INT_LEVEL_NUM_10 `SPC1.tlu.trl0.int_level_n
`define PMU_TAKEN_10 `SPC1.tlu.trl0.take_pmu&`SPC1.tlu.trl0.trap[2]

`define HINTP_RDWR_10 (`TOP.nas_top.c1.t2.asi_rdwr_hintp | `TOP.nas_top.c1.t2.asi_wr_hintp_delay)
`define HINTP_WR_10 (`SPC1.tlu.asi_wr_hintp[10])
`define HSTMATCH_10 `SPC1.tlu.trl0.hstick2_compare

`define HINTP_REG_10 `SPC1.tlu.trl0.hintp2
`define HSTM_TAKEN_10 `SPC1.tlu.trl0.take_hst&`SPC1.tlu.trl0.trap[2]

`define NAS_PIPE_FW2_10 |`TOP.nas_top.c1.t2.complete_fw2

`define CWQ_TAKEN_10 `SPC1.tlu.trl0.take_cwq&`SPC1.tlu.trl0.trap[2]
`define SMA_TAKEN_10 `SPC1.tlu.trl0.take_sma&`SPC1.tlu.trl0.trap[2]

`define POR_TAKEN_10 `SPC1.tlu.trl0.take_por&`SPC1.tlu.trl0.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC1_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_10 || `CPU_MONDO_TAKEN_10 ||
                          `DEV_MONDO_TAKEN_10 || `RES_MONDO_TAKEN_10 ||
                          `XIR_TAKEN_10 || `INT_LEVEL_TAKEN_10 ||
                          `HSTM_TAKEN_10 || `CWQ_TAKEN_10 ||
                          `SMA_TAKEN_10 || `PMU_TAKEN_10 || `POR_TAKEN_10);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_10, `CPU_MONDO_TAKEN_10, 
           `DEV_MONDO_TAKEN_10, `RES_MONDO_TAKEN_10,
           `XIR_TAKEN_10, `INT_LEVEL_TAKEN_10,
           `HSTM_TAKEN_10, `CWQ_TAKEN_10, `SMA_TAKEN_10 ,
           `PMU_TAKEN_10, `POR_TAKEN_10})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_10;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_10 | `INT_VEC_RECV_ASIWR_10)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_10 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_10 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_10;
    end // }
    else if (`INT_VEC_RECV_ASIWR_10)
        int_vec_recv_reg <= `TOP.nas_top.c1.t2.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_10 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_10 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_10 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_10 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_10 | `INT_VEC_RECV_ASIWR_10;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_10 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_10)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_10)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_10) begin  // {
        if (softint !== `RD_SOFTINT_REG_10 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_10;
    end // }
    
    if ((`NAS_PIPE_FW2_10 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_10&(softint !== `RD_SOFTINT_REG_10)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC1.tlu.asi_wr_clear_softint[2] |
             `SPC1.tlu.asi_wr_set_softint[2] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_10});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_10});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_10 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_10;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_10 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_10 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_10;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_10;
    hstmatch_late <= `HSTMATCH_10;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c1t3 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 1;
    assign   mytid = 3;
    assign   mytnum = 1*8 + 3;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC1_GCLK) ;
    @(posedge `BENCH_SPC1_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_11 `SPC1.tlu.cth.int_rec3
`define INT_VEC_RECV_ASIWR_11 (`TOP.nas_top.c1.t3.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_11 (`TOP.nas_top.c1.t3.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_11 `SPC1.tlu.trl0.take_ivt&`SPC1.tlu.trl0.trap[3]

`define CPU_MONDO_TAKEN_11 `SPC1.tlu.trl0.take_mqr&`SPC1.tlu.trl0.trap[3]
`define DEV_MONDO_TAKEN_11 `SPC1.tlu.trl0.take_dqr&`SPC1.tlu.trl0.trap[3]
`define RES_MONDO_TAKEN_11 `SPC1.tlu.trl0.take_rqr&`SPC1.tlu.trl0.trap[3]

`define XIR_TAKEN_11 `SPC1.tlu.trl0.take_xir&`SPC1.tlu.trl0.trap[3]

`define SOFTINT_RDWR_11 (`TOP.nas_top.c1.t3.asi_rdwr_softint|`TOP.nas_top.c1.t3.asi_wr_softint_delay)

`define SOFTINT_REG_11 `SPC1.tlu.trl0.softint3
`define RD_SOFTINT_REG_11 `SPC1.tlu.trl0.rd_softint3
`define INT_LEVEL_TAKEN_11 `SPC1.tlu.trl0.take_iln&`SPC1.tlu.trl0.trap[3]
`define INT_LEVEL_NUM_11 `SPC1.tlu.trl0.int_level_n
`define PMU_TAKEN_11 `SPC1.tlu.trl0.take_pmu&`SPC1.tlu.trl0.trap[3]

`define HINTP_RDWR_11 (`TOP.nas_top.c1.t3.asi_rdwr_hintp | `TOP.nas_top.c1.t3.asi_wr_hintp_delay)
`define HINTP_WR_11 (`SPC1.tlu.asi_wr_hintp[11])
`define HSTMATCH_11 `SPC1.tlu.trl0.hstick3_compare

`define HINTP_REG_11 `SPC1.tlu.trl0.hintp3
`define HSTM_TAKEN_11 `SPC1.tlu.trl0.take_hst&`SPC1.tlu.trl0.trap[3]

`define NAS_PIPE_FW2_11 |`TOP.nas_top.c1.t3.complete_fw2

`define CWQ_TAKEN_11 `SPC1.tlu.trl0.take_cwq&`SPC1.tlu.trl0.trap[3]
`define SMA_TAKEN_11 `SPC1.tlu.trl0.take_sma&`SPC1.tlu.trl0.trap[3]

`define POR_TAKEN_11 `SPC1.tlu.trl0.take_por&`SPC1.tlu.trl0.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC1_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_11 || `CPU_MONDO_TAKEN_11 ||
                          `DEV_MONDO_TAKEN_11 || `RES_MONDO_TAKEN_11 ||
                          `XIR_TAKEN_11 || `INT_LEVEL_TAKEN_11 ||
                          `HSTM_TAKEN_11 || `CWQ_TAKEN_11 ||
                          `SMA_TAKEN_11 || `PMU_TAKEN_11 || `POR_TAKEN_11);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_11, `CPU_MONDO_TAKEN_11, 
           `DEV_MONDO_TAKEN_11, `RES_MONDO_TAKEN_11,
           `XIR_TAKEN_11, `INT_LEVEL_TAKEN_11,
           `HSTM_TAKEN_11, `CWQ_TAKEN_11, `SMA_TAKEN_11 ,
           `PMU_TAKEN_11, `POR_TAKEN_11})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_11;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_11 | `INT_VEC_RECV_ASIWR_11)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_11 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_11 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_11;
    end // }
    else if (`INT_VEC_RECV_ASIWR_11)
        int_vec_recv_reg <= `TOP.nas_top.c1.t3.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_11 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_11 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_11 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_11 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_11 | `INT_VEC_RECV_ASIWR_11;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_11 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_11)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_11)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_11) begin  // {
        if (softint !== `RD_SOFTINT_REG_11 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_11;
    end // }
    
    if ((`NAS_PIPE_FW2_11 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_11&(softint !== `RD_SOFTINT_REG_11)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC1.tlu.asi_wr_clear_softint[3] |
             `SPC1.tlu.asi_wr_set_softint[3] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_11});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_11});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_11 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_11;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_11 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_11 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_11;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_11;
    hstmatch_late <= `HSTMATCH_11;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c1t4 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 1;
    assign   mytid = 4;
    assign   mytnum = 1*8 + 4;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC1_GCLK) ;
    @(posedge `BENCH_SPC1_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_12 `SPC1.tlu.cth.int_rec4
`define INT_VEC_RECV_ASIWR_12 (`TOP.nas_top.c1.t4.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_12 (`TOP.nas_top.c1.t4.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_12 `SPC1.tlu.trl1.take_ivt&`SPC1.tlu.trl1.trap[0]

`define CPU_MONDO_TAKEN_12 `SPC1.tlu.trl1.take_mqr&`SPC1.tlu.trl1.trap[0]
`define DEV_MONDO_TAKEN_12 `SPC1.tlu.trl1.take_dqr&`SPC1.tlu.trl1.trap[0]
`define RES_MONDO_TAKEN_12 `SPC1.tlu.trl1.take_rqr&`SPC1.tlu.trl1.trap[0]

`define XIR_TAKEN_12 `SPC1.tlu.trl1.take_xir&`SPC1.tlu.trl1.trap[0]

`define SOFTINT_RDWR_12 (`TOP.nas_top.c1.t4.asi_rdwr_softint|`TOP.nas_top.c1.t4.asi_wr_softint_delay)

`define SOFTINT_REG_12 `SPC1.tlu.trl1.softint0
`define RD_SOFTINT_REG_12 `SPC1.tlu.trl1.rd_softint0
`define INT_LEVEL_TAKEN_12 `SPC1.tlu.trl1.take_iln&`SPC1.tlu.trl1.trap[0]
`define INT_LEVEL_NUM_12 `SPC1.tlu.trl1.int_level_n
`define PMU_TAKEN_12 `SPC1.tlu.trl1.take_pmu&`SPC1.tlu.trl1.trap[0]

`define HINTP_RDWR_12 (`TOP.nas_top.c1.t4.asi_rdwr_hintp | `TOP.nas_top.c1.t4.asi_wr_hintp_delay)
`define HINTP_WR_12 (`SPC1.tlu.asi_wr_hintp[12])
`define HSTMATCH_12 `SPC1.tlu.trl1.hstick0_compare

`define HINTP_REG_12 `SPC1.tlu.trl1.hintp0
`define HSTM_TAKEN_12 `SPC1.tlu.trl1.take_hst&`SPC1.tlu.trl1.trap[0]

`define NAS_PIPE_FW2_12 |`TOP.nas_top.c1.t4.complete_fw2

`define CWQ_TAKEN_12 `SPC1.tlu.trl1.take_cwq&`SPC1.tlu.trl1.trap[0]
`define SMA_TAKEN_12 `SPC1.tlu.trl1.take_sma&`SPC1.tlu.trl1.trap[0]

`define POR_TAKEN_12 `SPC1.tlu.trl1.take_por&`SPC1.tlu.trl1.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC1_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_12 || `CPU_MONDO_TAKEN_12 ||
                          `DEV_MONDO_TAKEN_12 || `RES_MONDO_TAKEN_12 ||
                          `XIR_TAKEN_12 || `INT_LEVEL_TAKEN_12 ||
                          `HSTM_TAKEN_12 || `CWQ_TAKEN_12 ||
                          `SMA_TAKEN_12 || `PMU_TAKEN_12 || `POR_TAKEN_12);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_12, `CPU_MONDO_TAKEN_12, 
           `DEV_MONDO_TAKEN_12, `RES_MONDO_TAKEN_12,
           `XIR_TAKEN_12, `INT_LEVEL_TAKEN_12,
           `HSTM_TAKEN_12, `CWQ_TAKEN_12, `SMA_TAKEN_12 ,
           `PMU_TAKEN_12, `POR_TAKEN_12})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_12;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_12 | `INT_VEC_RECV_ASIWR_12)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_12 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_12 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_12;
    end // }
    else if (`INT_VEC_RECV_ASIWR_12)
        int_vec_recv_reg <= `TOP.nas_top.c1.t4.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_12 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_12 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_12 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_12 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_12 | `INT_VEC_RECV_ASIWR_12;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_12 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_12)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_12)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_12) begin  // {
        if (softint !== `RD_SOFTINT_REG_12 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_12;
    end // }
    
    if ((`NAS_PIPE_FW2_12 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_12&(softint !== `RD_SOFTINT_REG_12)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC1.tlu.asi_wr_clear_softint[4] |
             `SPC1.tlu.asi_wr_set_softint[4] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_12});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_12});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_12 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_12;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_12 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_12 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_12;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_12;
    hstmatch_late <= `HSTMATCH_12;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c1t5 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 1;
    assign   mytid = 5;
    assign   mytnum = 1*8 + 5;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC1_GCLK) ;
    @(posedge `BENCH_SPC1_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_13 `SPC1.tlu.cth.int_rec5
`define INT_VEC_RECV_ASIWR_13 (`TOP.nas_top.c1.t5.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_13 (`TOP.nas_top.c1.t5.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_13 `SPC1.tlu.trl1.take_ivt&`SPC1.tlu.trl1.trap[1]

`define CPU_MONDO_TAKEN_13 `SPC1.tlu.trl1.take_mqr&`SPC1.tlu.trl1.trap[1]
`define DEV_MONDO_TAKEN_13 `SPC1.tlu.trl1.take_dqr&`SPC1.tlu.trl1.trap[1]
`define RES_MONDO_TAKEN_13 `SPC1.tlu.trl1.take_rqr&`SPC1.tlu.trl1.trap[1]

`define XIR_TAKEN_13 `SPC1.tlu.trl1.take_xir&`SPC1.tlu.trl1.trap[1]

`define SOFTINT_RDWR_13 (`TOP.nas_top.c1.t5.asi_rdwr_softint|`TOP.nas_top.c1.t5.asi_wr_softint_delay)

`define SOFTINT_REG_13 `SPC1.tlu.trl1.softint1
`define RD_SOFTINT_REG_13 `SPC1.tlu.trl1.rd_softint1
`define INT_LEVEL_TAKEN_13 `SPC1.tlu.trl1.take_iln&`SPC1.tlu.trl1.trap[1]
`define INT_LEVEL_NUM_13 `SPC1.tlu.trl1.int_level_n
`define PMU_TAKEN_13 `SPC1.tlu.trl1.take_pmu&`SPC1.tlu.trl1.trap[1]

`define HINTP_RDWR_13 (`TOP.nas_top.c1.t5.asi_rdwr_hintp | `TOP.nas_top.c1.t5.asi_wr_hintp_delay)
`define HINTP_WR_13 (`SPC1.tlu.asi_wr_hintp[13])
`define HSTMATCH_13 `SPC1.tlu.trl1.hstick1_compare

`define HINTP_REG_13 `SPC1.tlu.trl1.hintp1
`define HSTM_TAKEN_13 `SPC1.tlu.trl1.take_hst&`SPC1.tlu.trl1.trap[1]

`define NAS_PIPE_FW2_13 |`TOP.nas_top.c1.t5.complete_fw2

`define CWQ_TAKEN_13 `SPC1.tlu.trl1.take_cwq&`SPC1.tlu.trl1.trap[1]
`define SMA_TAKEN_13 `SPC1.tlu.trl1.take_sma&`SPC1.tlu.trl1.trap[1]

`define POR_TAKEN_13 `SPC1.tlu.trl1.take_por&`SPC1.tlu.trl1.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC1_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_13 || `CPU_MONDO_TAKEN_13 ||
                          `DEV_MONDO_TAKEN_13 || `RES_MONDO_TAKEN_13 ||
                          `XIR_TAKEN_13 || `INT_LEVEL_TAKEN_13 ||
                          `HSTM_TAKEN_13 || `CWQ_TAKEN_13 ||
                          `SMA_TAKEN_13 || `PMU_TAKEN_13 || `POR_TAKEN_13);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_13, `CPU_MONDO_TAKEN_13, 
           `DEV_MONDO_TAKEN_13, `RES_MONDO_TAKEN_13,
           `XIR_TAKEN_13, `INT_LEVEL_TAKEN_13,
           `HSTM_TAKEN_13, `CWQ_TAKEN_13, `SMA_TAKEN_13 ,
           `PMU_TAKEN_13, `POR_TAKEN_13})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_13;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_13 | `INT_VEC_RECV_ASIWR_13)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_13 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_13 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_13;
    end // }
    else if (`INT_VEC_RECV_ASIWR_13)
        int_vec_recv_reg <= `TOP.nas_top.c1.t5.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_13 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_13 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_13 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_13 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_13 | `INT_VEC_RECV_ASIWR_13;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_13 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_13)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_13)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_13) begin  // {
        if (softint !== `RD_SOFTINT_REG_13 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_13;
    end // }
    
    if ((`NAS_PIPE_FW2_13 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_13&(softint !== `RD_SOFTINT_REG_13)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC1.tlu.asi_wr_clear_softint[5] |
             `SPC1.tlu.asi_wr_set_softint[5] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_13});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_13});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_13 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_13;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_13 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_13 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_13;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_13;
    hstmatch_late <= `HSTMATCH_13;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c1t6 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 1;
    assign   mytid = 6;
    assign   mytnum = 1*8 + 6;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC1_GCLK) ;
    @(posedge `BENCH_SPC1_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_14 `SPC1.tlu.cth.int_rec6
`define INT_VEC_RECV_ASIWR_14 (`TOP.nas_top.c1.t6.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_14 (`TOP.nas_top.c1.t6.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_14 `SPC1.tlu.trl1.take_ivt&`SPC1.tlu.trl1.trap[2]

`define CPU_MONDO_TAKEN_14 `SPC1.tlu.trl1.take_mqr&`SPC1.tlu.trl1.trap[2]
`define DEV_MONDO_TAKEN_14 `SPC1.tlu.trl1.take_dqr&`SPC1.tlu.trl1.trap[2]
`define RES_MONDO_TAKEN_14 `SPC1.tlu.trl1.take_rqr&`SPC1.tlu.trl1.trap[2]

`define XIR_TAKEN_14 `SPC1.tlu.trl1.take_xir&`SPC1.tlu.trl1.trap[2]

`define SOFTINT_RDWR_14 (`TOP.nas_top.c1.t6.asi_rdwr_softint|`TOP.nas_top.c1.t6.asi_wr_softint_delay)

`define SOFTINT_REG_14 `SPC1.tlu.trl1.softint2
`define RD_SOFTINT_REG_14 `SPC1.tlu.trl1.rd_softint2
`define INT_LEVEL_TAKEN_14 `SPC1.tlu.trl1.take_iln&`SPC1.tlu.trl1.trap[2]
`define INT_LEVEL_NUM_14 `SPC1.tlu.trl1.int_level_n
`define PMU_TAKEN_14 `SPC1.tlu.trl1.take_pmu&`SPC1.tlu.trl1.trap[2]

`define HINTP_RDWR_14 (`TOP.nas_top.c1.t6.asi_rdwr_hintp | `TOP.nas_top.c1.t6.asi_wr_hintp_delay)
`define HINTP_WR_14 (`SPC1.tlu.asi_wr_hintp[14])
`define HSTMATCH_14 `SPC1.tlu.trl1.hstick2_compare

`define HINTP_REG_14 `SPC1.tlu.trl1.hintp2
`define HSTM_TAKEN_14 `SPC1.tlu.trl1.take_hst&`SPC1.tlu.trl1.trap[2]

`define NAS_PIPE_FW2_14 |`TOP.nas_top.c1.t6.complete_fw2

`define CWQ_TAKEN_14 `SPC1.tlu.trl1.take_cwq&`SPC1.tlu.trl1.trap[2]
`define SMA_TAKEN_14 `SPC1.tlu.trl1.take_sma&`SPC1.tlu.trl1.trap[2]

`define POR_TAKEN_14 `SPC1.tlu.trl1.take_por&`SPC1.tlu.trl1.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC1_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_14 || `CPU_MONDO_TAKEN_14 ||
                          `DEV_MONDO_TAKEN_14 || `RES_MONDO_TAKEN_14 ||
                          `XIR_TAKEN_14 || `INT_LEVEL_TAKEN_14 ||
                          `HSTM_TAKEN_14 || `CWQ_TAKEN_14 ||
                          `SMA_TAKEN_14 || `PMU_TAKEN_14 || `POR_TAKEN_14);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_14, `CPU_MONDO_TAKEN_14, 
           `DEV_MONDO_TAKEN_14, `RES_MONDO_TAKEN_14,
           `XIR_TAKEN_14, `INT_LEVEL_TAKEN_14,
           `HSTM_TAKEN_14, `CWQ_TAKEN_14, `SMA_TAKEN_14 ,
           `PMU_TAKEN_14, `POR_TAKEN_14})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_14;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_14 | `INT_VEC_RECV_ASIWR_14)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_14 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_14 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_14;
    end // }
    else if (`INT_VEC_RECV_ASIWR_14)
        int_vec_recv_reg <= `TOP.nas_top.c1.t6.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_14 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_14 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_14 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_14 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_14 | `INT_VEC_RECV_ASIWR_14;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_14 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_14)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_14)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_14) begin  // {
        if (softint !== `RD_SOFTINT_REG_14 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_14;
    end // }
    
    if ((`NAS_PIPE_FW2_14 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_14&(softint !== `RD_SOFTINT_REG_14)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC1.tlu.asi_wr_clear_softint[6] |
             `SPC1.tlu.asi_wr_set_softint[6] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_14});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_14});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_14 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_14;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_14 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_14 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_14;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_14;
    hstmatch_late <= `HSTMATCH_14;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c1t7 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 1;
    assign   mytid = 7;
    assign   mytnum = 1*8 + 7;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC1_GCLK) ;
    @(posedge `BENCH_SPC1_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_15 `SPC1.tlu.cth.int_rec7
`define INT_VEC_RECV_ASIWR_15 (`TOP.nas_top.c1.t7.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_15 (`TOP.nas_top.c1.t7.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_15 `SPC1.tlu.trl1.take_ivt&`SPC1.tlu.trl1.trap[3]

`define CPU_MONDO_TAKEN_15 `SPC1.tlu.trl1.take_mqr&`SPC1.tlu.trl1.trap[3]
`define DEV_MONDO_TAKEN_15 `SPC1.tlu.trl1.take_dqr&`SPC1.tlu.trl1.trap[3]
`define RES_MONDO_TAKEN_15 `SPC1.tlu.trl1.take_rqr&`SPC1.tlu.trl1.trap[3]

`define XIR_TAKEN_15 `SPC1.tlu.trl1.take_xir&`SPC1.tlu.trl1.trap[3]

`define SOFTINT_RDWR_15 (`TOP.nas_top.c1.t7.asi_rdwr_softint|`TOP.nas_top.c1.t7.asi_wr_softint_delay)

`define SOFTINT_REG_15 `SPC1.tlu.trl1.softint3
`define RD_SOFTINT_REG_15 `SPC1.tlu.trl1.rd_softint3
`define INT_LEVEL_TAKEN_15 `SPC1.tlu.trl1.take_iln&`SPC1.tlu.trl1.trap[3]
`define INT_LEVEL_NUM_15 `SPC1.tlu.trl1.int_level_n
`define PMU_TAKEN_15 `SPC1.tlu.trl1.take_pmu&`SPC1.tlu.trl1.trap[3]

`define HINTP_RDWR_15 (`TOP.nas_top.c1.t7.asi_rdwr_hintp | `TOP.nas_top.c1.t7.asi_wr_hintp_delay)
`define HINTP_WR_15 (`SPC1.tlu.asi_wr_hintp[15])
`define HSTMATCH_15 `SPC1.tlu.trl1.hstick3_compare

`define HINTP_REG_15 `SPC1.tlu.trl1.hintp3
`define HSTM_TAKEN_15 `SPC1.tlu.trl1.take_hst&`SPC1.tlu.trl1.trap[3]

`define NAS_PIPE_FW2_15 |`TOP.nas_top.c1.t7.complete_fw2

`define CWQ_TAKEN_15 `SPC1.tlu.trl1.take_cwq&`SPC1.tlu.trl1.trap[3]
`define SMA_TAKEN_15 `SPC1.tlu.trl1.take_sma&`SPC1.tlu.trl1.trap[3]

`define POR_TAKEN_15 `SPC1.tlu.trl1.take_por&`SPC1.tlu.trl1.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC1_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_15 || `CPU_MONDO_TAKEN_15 ||
                          `DEV_MONDO_TAKEN_15 || `RES_MONDO_TAKEN_15 ||
                          `XIR_TAKEN_15 || `INT_LEVEL_TAKEN_15 ||
                          `HSTM_TAKEN_15 || `CWQ_TAKEN_15 ||
                          `SMA_TAKEN_15 || `PMU_TAKEN_15 || `POR_TAKEN_15);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_15, `CPU_MONDO_TAKEN_15, 
           `DEV_MONDO_TAKEN_15, `RES_MONDO_TAKEN_15,
           `XIR_TAKEN_15, `INT_LEVEL_TAKEN_15,
           `HSTM_TAKEN_15, `CWQ_TAKEN_15, `SMA_TAKEN_15 ,
           `PMU_TAKEN_15, `POR_TAKEN_15})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_15;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_15 | `INT_VEC_RECV_ASIWR_15)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_15 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_15 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_15;
    end // }
    else if (`INT_VEC_RECV_ASIWR_15)
        int_vec_recv_reg <= `TOP.nas_top.c1.t7.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_15 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_15 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_15 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_15 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_15 | `INT_VEC_RECV_ASIWR_15;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_15 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_15)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_15)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_15) begin  // {
        if (softint !== `RD_SOFTINT_REG_15 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_15;
    end // }
    
    if ((`NAS_PIPE_FW2_15 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_15&(softint !== `RD_SOFTINT_REG_15)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC1.tlu.asi_wr_clear_softint[7] |
             `SPC1.tlu.asi_wr_set_softint[7] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_15});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_15});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_15 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_15;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_15 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_15 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_15;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_15;
    hstmatch_late <= `HSTMATCH_15;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

`endif
`ifdef CORE_2

// }}}

module int_c2t0 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 2;
    assign   mytid = 0;
    assign   mytnum = 2*8 + 0;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC2_GCLK) ;
    @(posedge `BENCH_SPC2_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_16 `SPC2.tlu.cth.int_rec0
`define INT_VEC_RECV_ASIWR_16 (`TOP.nas_top.c2.t0.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_16 (`TOP.nas_top.c2.t0.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_16 `SPC2.tlu.trl0.take_ivt&`SPC2.tlu.trl0.trap[0]

`define CPU_MONDO_TAKEN_16 `SPC2.tlu.trl0.take_mqr&`SPC2.tlu.trl0.trap[0]
`define DEV_MONDO_TAKEN_16 `SPC2.tlu.trl0.take_dqr&`SPC2.tlu.trl0.trap[0]
`define RES_MONDO_TAKEN_16 `SPC2.tlu.trl0.take_rqr&`SPC2.tlu.trl0.trap[0]

`define XIR_TAKEN_16 `SPC2.tlu.trl0.take_xir&`SPC2.tlu.trl0.trap[0]

`define SOFTINT_RDWR_16 (`TOP.nas_top.c2.t0.asi_rdwr_softint|`TOP.nas_top.c2.t0.asi_wr_softint_delay)

`define SOFTINT_REG_16 `SPC2.tlu.trl0.softint0
`define RD_SOFTINT_REG_16 `SPC2.tlu.trl0.rd_softint0
`define INT_LEVEL_TAKEN_16 `SPC2.tlu.trl0.take_iln&`SPC2.tlu.trl0.trap[0]
`define INT_LEVEL_NUM_16 `SPC2.tlu.trl0.int_level_n
`define PMU_TAKEN_16 `SPC2.tlu.trl0.take_pmu&`SPC2.tlu.trl0.trap[0]

`define HINTP_RDWR_16 (`TOP.nas_top.c2.t0.asi_rdwr_hintp | `TOP.nas_top.c2.t0.asi_wr_hintp_delay)
`define HINTP_WR_16 (`SPC2.tlu.asi_wr_hintp[16])
`define HSTMATCH_16 `SPC2.tlu.trl0.hstick0_compare

`define HINTP_REG_16 `SPC2.tlu.trl0.hintp0
`define HSTM_TAKEN_16 `SPC2.tlu.trl0.take_hst&`SPC2.tlu.trl0.trap[0]

`define NAS_PIPE_FW2_16 |`TOP.nas_top.c2.t0.complete_fw2

`define CWQ_TAKEN_16 `SPC2.tlu.trl0.take_cwq&`SPC2.tlu.trl0.trap[0]
`define SMA_TAKEN_16 `SPC2.tlu.trl0.take_sma&`SPC2.tlu.trl0.trap[0]

`define POR_TAKEN_16 `SPC2.tlu.trl0.take_por&`SPC2.tlu.trl0.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC2_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_16 || `CPU_MONDO_TAKEN_16 ||
                          `DEV_MONDO_TAKEN_16 || `RES_MONDO_TAKEN_16 ||
                          `XIR_TAKEN_16 || `INT_LEVEL_TAKEN_16 ||
                          `HSTM_TAKEN_16 || `CWQ_TAKEN_16 ||
                          `SMA_TAKEN_16 || `PMU_TAKEN_16 || `POR_TAKEN_16);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_16, `CPU_MONDO_TAKEN_16, 
           `DEV_MONDO_TAKEN_16, `RES_MONDO_TAKEN_16,
           `XIR_TAKEN_16, `INT_LEVEL_TAKEN_16,
           `HSTM_TAKEN_16, `CWQ_TAKEN_16, `SMA_TAKEN_16 ,
           `PMU_TAKEN_16, `POR_TAKEN_16})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_16;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_16 | `INT_VEC_RECV_ASIWR_16)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_16 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_16 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_16;
    end // }
    else if (`INT_VEC_RECV_ASIWR_16)
        int_vec_recv_reg <= `TOP.nas_top.c2.t0.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_16 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_16 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_16 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_16 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_16 | `INT_VEC_RECV_ASIWR_16;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_16 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_16)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_16)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_16) begin  // {
        if (softint !== `RD_SOFTINT_REG_16 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_16;
    end // }
    
    if ((`NAS_PIPE_FW2_16 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_16&(softint !== `RD_SOFTINT_REG_16)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC2.tlu.asi_wr_clear_softint[0] |
             `SPC2.tlu.asi_wr_set_softint[0] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_16});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_16});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_16 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_16;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_16 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_16 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_16;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_16;
    hstmatch_late <= `HSTMATCH_16;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c2t1 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 2;
    assign   mytid = 1;
    assign   mytnum = 2*8 + 1;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC2_GCLK) ;
    @(posedge `BENCH_SPC2_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_17 `SPC2.tlu.cth.int_rec1
`define INT_VEC_RECV_ASIWR_17 (`TOP.nas_top.c2.t1.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_17 (`TOP.nas_top.c2.t1.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_17 `SPC2.tlu.trl0.take_ivt&`SPC2.tlu.trl0.trap[1]

`define CPU_MONDO_TAKEN_17 `SPC2.tlu.trl0.take_mqr&`SPC2.tlu.trl0.trap[1]
`define DEV_MONDO_TAKEN_17 `SPC2.tlu.trl0.take_dqr&`SPC2.tlu.trl0.trap[1]
`define RES_MONDO_TAKEN_17 `SPC2.tlu.trl0.take_rqr&`SPC2.tlu.trl0.trap[1]

`define XIR_TAKEN_17 `SPC2.tlu.trl0.take_xir&`SPC2.tlu.trl0.trap[1]

`define SOFTINT_RDWR_17 (`TOP.nas_top.c2.t1.asi_rdwr_softint|`TOP.nas_top.c2.t1.asi_wr_softint_delay)

`define SOFTINT_REG_17 `SPC2.tlu.trl0.softint1
`define RD_SOFTINT_REG_17 `SPC2.tlu.trl0.rd_softint1
`define INT_LEVEL_TAKEN_17 `SPC2.tlu.trl0.take_iln&`SPC2.tlu.trl0.trap[1]
`define INT_LEVEL_NUM_17 `SPC2.tlu.trl0.int_level_n
`define PMU_TAKEN_17 `SPC2.tlu.trl0.take_pmu&`SPC2.tlu.trl0.trap[1]

`define HINTP_RDWR_17 (`TOP.nas_top.c2.t1.asi_rdwr_hintp | `TOP.nas_top.c2.t1.asi_wr_hintp_delay)
`define HINTP_WR_17 (`SPC2.tlu.asi_wr_hintp[17])
`define HSTMATCH_17 `SPC2.tlu.trl0.hstick1_compare

`define HINTP_REG_17 `SPC2.tlu.trl0.hintp1
`define HSTM_TAKEN_17 `SPC2.tlu.trl0.take_hst&`SPC2.tlu.trl0.trap[1]

`define NAS_PIPE_FW2_17 |`TOP.nas_top.c2.t1.complete_fw2

`define CWQ_TAKEN_17 `SPC2.tlu.trl0.take_cwq&`SPC2.tlu.trl0.trap[1]
`define SMA_TAKEN_17 `SPC2.tlu.trl0.take_sma&`SPC2.tlu.trl0.trap[1]

`define POR_TAKEN_17 `SPC2.tlu.trl0.take_por&`SPC2.tlu.trl0.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC2_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_17 || `CPU_MONDO_TAKEN_17 ||
                          `DEV_MONDO_TAKEN_17 || `RES_MONDO_TAKEN_17 ||
                          `XIR_TAKEN_17 || `INT_LEVEL_TAKEN_17 ||
                          `HSTM_TAKEN_17 || `CWQ_TAKEN_17 ||
                          `SMA_TAKEN_17 || `PMU_TAKEN_17 || `POR_TAKEN_17);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_17, `CPU_MONDO_TAKEN_17, 
           `DEV_MONDO_TAKEN_17, `RES_MONDO_TAKEN_17,
           `XIR_TAKEN_17, `INT_LEVEL_TAKEN_17,
           `HSTM_TAKEN_17, `CWQ_TAKEN_17, `SMA_TAKEN_17 ,
           `PMU_TAKEN_17, `POR_TAKEN_17})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_17;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_17 | `INT_VEC_RECV_ASIWR_17)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_17 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_17 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_17;
    end // }
    else if (`INT_VEC_RECV_ASIWR_17)
        int_vec_recv_reg <= `TOP.nas_top.c2.t1.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_17 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_17 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_17 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_17 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_17 | `INT_VEC_RECV_ASIWR_17;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_17 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_17)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_17)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_17) begin  // {
        if (softint !== `RD_SOFTINT_REG_17 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_17;
    end // }
    
    if ((`NAS_PIPE_FW2_17 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_17&(softint !== `RD_SOFTINT_REG_17)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC2.tlu.asi_wr_clear_softint[1] |
             `SPC2.tlu.asi_wr_set_softint[1] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_17});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_17});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_17 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_17;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_17 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_17 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_17;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_17;
    hstmatch_late <= `HSTMATCH_17;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c2t2 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 2;
    assign   mytid = 2;
    assign   mytnum = 2*8 + 2;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC2_GCLK) ;
    @(posedge `BENCH_SPC2_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_18 `SPC2.tlu.cth.int_rec2
`define INT_VEC_RECV_ASIWR_18 (`TOP.nas_top.c2.t2.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_18 (`TOP.nas_top.c2.t2.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_18 `SPC2.tlu.trl0.take_ivt&`SPC2.tlu.trl0.trap[2]

`define CPU_MONDO_TAKEN_18 `SPC2.tlu.trl0.take_mqr&`SPC2.tlu.trl0.trap[2]
`define DEV_MONDO_TAKEN_18 `SPC2.tlu.trl0.take_dqr&`SPC2.tlu.trl0.trap[2]
`define RES_MONDO_TAKEN_18 `SPC2.tlu.trl0.take_rqr&`SPC2.tlu.trl0.trap[2]

`define XIR_TAKEN_18 `SPC2.tlu.trl0.take_xir&`SPC2.tlu.trl0.trap[2]

`define SOFTINT_RDWR_18 (`TOP.nas_top.c2.t2.asi_rdwr_softint|`TOP.nas_top.c2.t2.asi_wr_softint_delay)

`define SOFTINT_REG_18 `SPC2.tlu.trl0.softint2
`define RD_SOFTINT_REG_18 `SPC2.tlu.trl0.rd_softint2
`define INT_LEVEL_TAKEN_18 `SPC2.tlu.trl0.take_iln&`SPC2.tlu.trl0.trap[2]
`define INT_LEVEL_NUM_18 `SPC2.tlu.trl0.int_level_n
`define PMU_TAKEN_18 `SPC2.tlu.trl0.take_pmu&`SPC2.tlu.trl0.trap[2]

`define HINTP_RDWR_18 (`TOP.nas_top.c2.t2.asi_rdwr_hintp | `TOP.nas_top.c2.t2.asi_wr_hintp_delay)
`define HINTP_WR_18 (`SPC2.tlu.asi_wr_hintp[18])
`define HSTMATCH_18 `SPC2.tlu.trl0.hstick2_compare

`define HINTP_REG_18 `SPC2.tlu.trl0.hintp2
`define HSTM_TAKEN_18 `SPC2.tlu.trl0.take_hst&`SPC2.tlu.trl0.trap[2]

`define NAS_PIPE_FW2_18 |`TOP.nas_top.c2.t2.complete_fw2

`define CWQ_TAKEN_18 `SPC2.tlu.trl0.take_cwq&`SPC2.tlu.trl0.trap[2]
`define SMA_TAKEN_18 `SPC2.tlu.trl0.take_sma&`SPC2.tlu.trl0.trap[2]

`define POR_TAKEN_18 `SPC2.tlu.trl0.take_por&`SPC2.tlu.trl0.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC2_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_18 || `CPU_MONDO_TAKEN_18 ||
                          `DEV_MONDO_TAKEN_18 || `RES_MONDO_TAKEN_18 ||
                          `XIR_TAKEN_18 || `INT_LEVEL_TAKEN_18 ||
                          `HSTM_TAKEN_18 || `CWQ_TAKEN_18 ||
                          `SMA_TAKEN_18 || `PMU_TAKEN_18 || `POR_TAKEN_18);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_18, `CPU_MONDO_TAKEN_18, 
           `DEV_MONDO_TAKEN_18, `RES_MONDO_TAKEN_18,
           `XIR_TAKEN_18, `INT_LEVEL_TAKEN_18,
           `HSTM_TAKEN_18, `CWQ_TAKEN_18, `SMA_TAKEN_18 ,
           `PMU_TAKEN_18, `POR_TAKEN_18})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_18;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_18 | `INT_VEC_RECV_ASIWR_18)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_18 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_18 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_18;
    end // }
    else if (`INT_VEC_RECV_ASIWR_18)
        int_vec_recv_reg <= `TOP.nas_top.c2.t2.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_18 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_18 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_18 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_18 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_18 | `INT_VEC_RECV_ASIWR_18;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_18 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_18)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_18)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_18) begin  // {
        if (softint !== `RD_SOFTINT_REG_18 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_18;
    end // }
    
    if ((`NAS_PIPE_FW2_18 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_18&(softint !== `RD_SOFTINT_REG_18)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC2.tlu.asi_wr_clear_softint[2] |
             `SPC2.tlu.asi_wr_set_softint[2] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_18});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_18});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_18 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_18;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_18 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_18 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_18;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_18;
    hstmatch_late <= `HSTMATCH_18;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c2t3 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 2;
    assign   mytid = 3;
    assign   mytnum = 2*8 + 3;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC2_GCLK) ;
    @(posedge `BENCH_SPC2_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_19 `SPC2.tlu.cth.int_rec3
`define INT_VEC_RECV_ASIWR_19 (`TOP.nas_top.c2.t3.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_19 (`TOP.nas_top.c2.t3.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_19 `SPC2.tlu.trl0.take_ivt&`SPC2.tlu.trl0.trap[3]

`define CPU_MONDO_TAKEN_19 `SPC2.tlu.trl0.take_mqr&`SPC2.tlu.trl0.trap[3]
`define DEV_MONDO_TAKEN_19 `SPC2.tlu.trl0.take_dqr&`SPC2.tlu.trl0.trap[3]
`define RES_MONDO_TAKEN_19 `SPC2.tlu.trl0.take_rqr&`SPC2.tlu.trl0.trap[3]

`define XIR_TAKEN_19 `SPC2.tlu.trl0.take_xir&`SPC2.tlu.trl0.trap[3]

`define SOFTINT_RDWR_19 (`TOP.nas_top.c2.t3.asi_rdwr_softint|`TOP.nas_top.c2.t3.asi_wr_softint_delay)

`define SOFTINT_REG_19 `SPC2.tlu.trl0.softint3
`define RD_SOFTINT_REG_19 `SPC2.tlu.trl0.rd_softint3
`define INT_LEVEL_TAKEN_19 `SPC2.tlu.trl0.take_iln&`SPC2.tlu.trl0.trap[3]
`define INT_LEVEL_NUM_19 `SPC2.tlu.trl0.int_level_n
`define PMU_TAKEN_19 `SPC2.tlu.trl0.take_pmu&`SPC2.tlu.trl0.trap[3]

`define HINTP_RDWR_19 (`TOP.nas_top.c2.t3.asi_rdwr_hintp | `TOP.nas_top.c2.t3.asi_wr_hintp_delay)
`define HINTP_WR_19 (`SPC2.tlu.asi_wr_hintp[19])
`define HSTMATCH_19 `SPC2.tlu.trl0.hstick3_compare

`define HINTP_REG_19 `SPC2.tlu.trl0.hintp3
`define HSTM_TAKEN_19 `SPC2.tlu.trl0.take_hst&`SPC2.tlu.trl0.trap[3]

`define NAS_PIPE_FW2_19 |`TOP.nas_top.c2.t3.complete_fw2

`define CWQ_TAKEN_19 `SPC2.tlu.trl0.take_cwq&`SPC2.tlu.trl0.trap[3]
`define SMA_TAKEN_19 `SPC2.tlu.trl0.take_sma&`SPC2.tlu.trl0.trap[3]

`define POR_TAKEN_19 `SPC2.tlu.trl0.take_por&`SPC2.tlu.trl0.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC2_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_19 || `CPU_MONDO_TAKEN_19 ||
                          `DEV_MONDO_TAKEN_19 || `RES_MONDO_TAKEN_19 ||
                          `XIR_TAKEN_19 || `INT_LEVEL_TAKEN_19 ||
                          `HSTM_TAKEN_19 || `CWQ_TAKEN_19 ||
                          `SMA_TAKEN_19 || `PMU_TAKEN_19 || `POR_TAKEN_19);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_19, `CPU_MONDO_TAKEN_19, 
           `DEV_MONDO_TAKEN_19, `RES_MONDO_TAKEN_19,
           `XIR_TAKEN_19, `INT_LEVEL_TAKEN_19,
           `HSTM_TAKEN_19, `CWQ_TAKEN_19, `SMA_TAKEN_19 ,
           `PMU_TAKEN_19, `POR_TAKEN_19})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_19;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_19 | `INT_VEC_RECV_ASIWR_19)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_19 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_19 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_19;
    end // }
    else if (`INT_VEC_RECV_ASIWR_19)
        int_vec_recv_reg <= `TOP.nas_top.c2.t3.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_19 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_19 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_19 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_19 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_19 | `INT_VEC_RECV_ASIWR_19;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_19 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_19)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_19)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_19) begin  // {
        if (softint !== `RD_SOFTINT_REG_19 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_19;
    end // }
    
    if ((`NAS_PIPE_FW2_19 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_19&(softint !== `RD_SOFTINT_REG_19)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC2.tlu.asi_wr_clear_softint[3] |
             `SPC2.tlu.asi_wr_set_softint[3] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_19});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_19});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_19 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_19;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_19 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_19 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_19;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_19;
    hstmatch_late <= `HSTMATCH_19;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c2t4 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 2;
    assign   mytid = 4;
    assign   mytnum = 2*8 + 4;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC2_GCLK) ;
    @(posedge `BENCH_SPC2_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_20 `SPC2.tlu.cth.int_rec4
`define INT_VEC_RECV_ASIWR_20 (`TOP.nas_top.c2.t4.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_20 (`TOP.nas_top.c2.t4.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_20 `SPC2.tlu.trl1.take_ivt&`SPC2.tlu.trl1.trap[0]

`define CPU_MONDO_TAKEN_20 `SPC2.tlu.trl1.take_mqr&`SPC2.tlu.trl1.trap[0]
`define DEV_MONDO_TAKEN_20 `SPC2.tlu.trl1.take_dqr&`SPC2.tlu.trl1.trap[0]
`define RES_MONDO_TAKEN_20 `SPC2.tlu.trl1.take_rqr&`SPC2.tlu.trl1.trap[0]

`define XIR_TAKEN_20 `SPC2.tlu.trl1.take_xir&`SPC2.tlu.trl1.trap[0]

`define SOFTINT_RDWR_20 (`TOP.nas_top.c2.t4.asi_rdwr_softint|`TOP.nas_top.c2.t4.asi_wr_softint_delay)

`define SOFTINT_REG_20 `SPC2.tlu.trl1.softint0
`define RD_SOFTINT_REG_20 `SPC2.tlu.trl1.rd_softint0
`define INT_LEVEL_TAKEN_20 `SPC2.tlu.trl1.take_iln&`SPC2.tlu.trl1.trap[0]
`define INT_LEVEL_NUM_20 `SPC2.tlu.trl1.int_level_n
`define PMU_TAKEN_20 `SPC2.tlu.trl1.take_pmu&`SPC2.tlu.trl1.trap[0]

`define HINTP_RDWR_20 (`TOP.nas_top.c2.t4.asi_rdwr_hintp | `TOP.nas_top.c2.t4.asi_wr_hintp_delay)
`define HINTP_WR_20 (`SPC2.tlu.asi_wr_hintp[20])
`define HSTMATCH_20 `SPC2.tlu.trl1.hstick0_compare

`define HINTP_REG_20 `SPC2.tlu.trl1.hintp0
`define HSTM_TAKEN_20 `SPC2.tlu.trl1.take_hst&`SPC2.tlu.trl1.trap[0]

`define NAS_PIPE_FW2_20 |`TOP.nas_top.c2.t4.complete_fw2

`define CWQ_TAKEN_20 `SPC2.tlu.trl1.take_cwq&`SPC2.tlu.trl1.trap[0]
`define SMA_TAKEN_20 `SPC2.tlu.trl1.take_sma&`SPC2.tlu.trl1.trap[0]

`define POR_TAKEN_20 `SPC2.tlu.trl1.take_por&`SPC2.tlu.trl1.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC2_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_20 || `CPU_MONDO_TAKEN_20 ||
                          `DEV_MONDO_TAKEN_20 || `RES_MONDO_TAKEN_20 ||
                          `XIR_TAKEN_20 || `INT_LEVEL_TAKEN_20 ||
                          `HSTM_TAKEN_20 || `CWQ_TAKEN_20 ||
                          `SMA_TAKEN_20 || `PMU_TAKEN_20 || `POR_TAKEN_20);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_20, `CPU_MONDO_TAKEN_20, 
           `DEV_MONDO_TAKEN_20, `RES_MONDO_TAKEN_20,
           `XIR_TAKEN_20, `INT_LEVEL_TAKEN_20,
           `HSTM_TAKEN_20, `CWQ_TAKEN_20, `SMA_TAKEN_20 ,
           `PMU_TAKEN_20, `POR_TAKEN_20})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_20;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_20 | `INT_VEC_RECV_ASIWR_20)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_20 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_20 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_20;
    end // }
    else if (`INT_VEC_RECV_ASIWR_20)
        int_vec_recv_reg <= `TOP.nas_top.c2.t4.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_20 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_20 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_20 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_20 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_20 | `INT_VEC_RECV_ASIWR_20;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_20 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_20)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_20)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_20) begin  // {
        if (softint !== `RD_SOFTINT_REG_20 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_20;
    end // }
    
    if ((`NAS_PIPE_FW2_20 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_20&(softint !== `RD_SOFTINT_REG_20)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC2.tlu.asi_wr_clear_softint[4] |
             `SPC2.tlu.asi_wr_set_softint[4] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_20});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_20});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_20 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_20;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_20 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_20 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_20;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_20;
    hstmatch_late <= `HSTMATCH_20;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c2t5 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 2;
    assign   mytid = 5;
    assign   mytnum = 2*8 + 5;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC2_GCLK) ;
    @(posedge `BENCH_SPC2_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_21 `SPC2.tlu.cth.int_rec5
`define INT_VEC_RECV_ASIWR_21 (`TOP.nas_top.c2.t5.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_21 (`TOP.nas_top.c2.t5.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_21 `SPC2.tlu.trl1.take_ivt&`SPC2.tlu.trl1.trap[1]

`define CPU_MONDO_TAKEN_21 `SPC2.tlu.trl1.take_mqr&`SPC2.tlu.trl1.trap[1]
`define DEV_MONDO_TAKEN_21 `SPC2.tlu.trl1.take_dqr&`SPC2.tlu.trl1.trap[1]
`define RES_MONDO_TAKEN_21 `SPC2.tlu.trl1.take_rqr&`SPC2.tlu.trl1.trap[1]

`define XIR_TAKEN_21 `SPC2.tlu.trl1.take_xir&`SPC2.tlu.trl1.trap[1]

`define SOFTINT_RDWR_21 (`TOP.nas_top.c2.t5.asi_rdwr_softint|`TOP.nas_top.c2.t5.asi_wr_softint_delay)

`define SOFTINT_REG_21 `SPC2.tlu.trl1.softint1
`define RD_SOFTINT_REG_21 `SPC2.tlu.trl1.rd_softint1
`define INT_LEVEL_TAKEN_21 `SPC2.tlu.trl1.take_iln&`SPC2.tlu.trl1.trap[1]
`define INT_LEVEL_NUM_21 `SPC2.tlu.trl1.int_level_n
`define PMU_TAKEN_21 `SPC2.tlu.trl1.take_pmu&`SPC2.tlu.trl1.trap[1]

`define HINTP_RDWR_21 (`TOP.nas_top.c2.t5.asi_rdwr_hintp | `TOP.nas_top.c2.t5.asi_wr_hintp_delay)
`define HINTP_WR_21 (`SPC2.tlu.asi_wr_hintp[21])
`define HSTMATCH_21 `SPC2.tlu.trl1.hstick1_compare

`define HINTP_REG_21 `SPC2.tlu.trl1.hintp1
`define HSTM_TAKEN_21 `SPC2.tlu.trl1.take_hst&`SPC2.tlu.trl1.trap[1]

`define NAS_PIPE_FW2_21 |`TOP.nas_top.c2.t5.complete_fw2

`define CWQ_TAKEN_21 `SPC2.tlu.trl1.take_cwq&`SPC2.tlu.trl1.trap[1]
`define SMA_TAKEN_21 `SPC2.tlu.trl1.take_sma&`SPC2.tlu.trl1.trap[1]

`define POR_TAKEN_21 `SPC2.tlu.trl1.take_por&`SPC2.tlu.trl1.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC2_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_21 || `CPU_MONDO_TAKEN_21 ||
                          `DEV_MONDO_TAKEN_21 || `RES_MONDO_TAKEN_21 ||
                          `XIR_TAKEN_21 || `INT_LEVEL_TAKEN_21 ||
                          `HSTM_TAKEN_21 || `CWQ_TAKEN_21 ||
                          `SMA_TAKEN_21 || `PMU_TAKEN_21 || `POR_TAKEN_21);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_21, `CPU_MONDO_TAKEN_21, 
           `DEV_MONDO_TAKEN_21, `RES_MONDO_TAKEN_21,
           `XIR_TAKEN_21, `INT_LEVEL_TAKEN_21,
           `HSTM_TAKEN_21, `CWQ_TAKEN_21, `SMA_TAKEN_21 ,
           `PMU_TAKEN_21, `POR_TAKEN_21})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_21;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_21 | `INT_VEC_RECV_ASIWR_21)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_21 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_21 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_21;
    end // }
    else if (`INT_VEC_RECV_ASIWR_21)
        int_vec_recv_reg <= `TOP.nas_top.c2.t5.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_21 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_21 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_21 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_21 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_21 | `INT_VEC_RECV_ASIWR_21;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_21 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_21)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_21)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_21) begin  // {
        if (softint !== `RD_SOFTINT_REG_21 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_21;
    end // }
    
    if ((`NAS_PIPE_FW2_21 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_21&(softint !== `RD_SOFTINT_REG_21)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC2.tlu.asi_wr_clear_softint[5] |
             `SPC2.tlu.asi_wr_set_softint[5] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_21});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_21});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_21 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_21;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_21 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_21 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_21;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_21;
    hstmatch_late <= `HSTMATCH_21;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c2t6 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 2;
    assign   mytid = 6;
    assign   mytnum = 2*8 + 6;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC2_GCLK) ;
    @(posedge `BENCH_SPC2_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_22 `SPC2.tlu.cth.int_rec6
`define INT_VEC_RECV_ASIWR_22 (`TOP.nas_top.c2.t6.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_22 (`TOP.nas_top.c2.t6.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_22 `SPC2.tlu.trl1.take_ivt&`SPC2.tlu.trl1.trap[2]

`define CPU_MONDO_TAKEN_22 `SPC2.tlu.trl1.take_mqr&`SPC2.tlu.trl1.trap[2]
`define DEV_MONDO_TAKEN_22 `SPC2.tlu.trl1.take_dqr&`SPC2.tlu.trl1.trap[2]
`define RES_MONDO_TAKEN_22 `SPC2.tlu.trl1.take_rqr&`SPC2.tlu.trl1.trap[2]

`define XIR_TAKEN_22 `SPC2.tlu.trl1.take_xir&`SPC2.tlu.trl1.trap[2]

`define SOFTINT_RDWR_22 (`TOP.nas_top.c2.t6.asi_rdwr_softint|`TOP.nas_top.c2.t6.asi_wr_softint_delay)

`define SOFTINT_REG_22 `SPC2.tlu.trl1.softint2
`define RD_SOFTINT_REG_22 `SPC2.tlu.trl1.rd_softint2
`define INT_LEVEL_TAKEN_22 `SPC2.tlu.trl1.take_iln&`SPC2.tlu.trl1.trap[2]
`define INT_LEVEL_NUM_22 `SPC2.tlu.trl1.int_level_n
`define PMU_TAKEN_22 `SPC2.tlu.trl1.take_pmu&`SPC2.tlu.trl1.trap[2]

`define HINTP_RDWR_22 (`TOP.nas_top.c2.t6.asi_rdwr_hintp | `TOP.nas_top.c2.t6.asi_wr_hintp_delay)
`define HINTP_WR_22 (`SPC2.tlu.asi_wr_hintp[22])
`define HSTMATCH_22 `SPC2.tlu.trl1.hstick2_compare

`define HINTP_REG_22 `SPC2.tlu.trl1.hintp2
`define HSTM_TAKEN_22 `SPC2.tlu.trl1.take_hst&`SPC2.tlu.trl1.trap[2]

`define NAS_PIPE_FW2_22 |`TOP.nas_top.c2.t6.complete_fw2

`define CWQ_TAKEN_22 `SPC2.tlu.trl1.take_cwq&`SPC2.tlu.trl1.trap[2]
`define SMA_TAKEN_22 `SPC2.tlu.trl1.take_sma&`SPC2.tlu.trl1.trap[2]

`define POR_TAKEN_22 `SPC2.tlu.trl1.take_por&`SPC2.tlu.trl1.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC2_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_22 || `CPU_MONDO_TAKEN_22 ||
                          `DEV_MONDO_TAKEN_22 || `RES_MONDO_TAKEN_22 ||
                          `XIR_TAKEN_22 || `INT_LEVEL_TAKEN_22 ||
                          `HSTM_TAKEN_22 || `CWQ_TAKEN_22 ||
                          `SMA_TAKEN_22 || `PMU_TAKEN_22 || `POR_TAKEN_22);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_22, `CPU_MONDO_TAKEN_22, 
           `DEV_MONDO_TAKEN_22, `RES_MONDO_TAKEN_22,
           `XIR_TAKEN_22, `INT_LEVEL_TAKEN_22,
           `HSTM_TAKEN_22, `CWQ_TAKEN_22, `SMA_TAKEN_22 ,
           `PMU_TAKEN_22, `POR_TAKEN_22})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_22;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_22 | `INT_VEC_RECV_ASIWR_22)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_22 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_22 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_22;
    end // }
    else if (`INT_VEC_RECV_ASIWR_22)
        int_vec_recv_reg <= `TOP.nas_top.c2.t6.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_22 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_22 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_22 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_22 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_22 | `INT_VEC_RECV_ASIWR_22;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_22 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_22)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_22)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_22) begin  // {
        if (softint !== `RD_SOFTINT_REG_22 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_22;
    end // }
    
    if ((`NAS_PIPE_FW2_22 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_22&(softint !== `RD_SOFTINT_REG_22)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC2.tlu.asi_wr_clear_softint[6] |
             `SPC2.tlu.asi_wr_set_softint[6] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_22});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_22});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_22 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_22;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_22 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_22 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_22;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_22;
    hstmatch_late <= `HSTMATCH_22;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c2t7 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 2;
    assign   mytid = 7;
    assign   mytnum = 2*8 + 7;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC2_GCLK) ;
    @(posedge `BENCH_SPC2_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_23 `SPC2.tlu.cth.int_rec7
`define INT_VEC_RECV_ASIWR_23 (`TOP.nas_top.c2.t7.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_23 (`TOP.nas_top.c2.t7.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_23 `SPC2.tlu.trl1.take_ivt&`SPC2.tlu.trl1.trap[3]

`define CPU_MONDO_TAKEN_23 `SPC2.tlu.trl1.take_mqr&`SPC2.tlu.trl1.trap[3]
`define DEV_MONDO_TAKEN_23 `SPC2.tlu.trl1.take_dqr&`SPC2.tlu.trl1.trap[3]
`define RES_MONDO_TAKEN_23 `SPC2.tlu.trl1.take_rqr&`SPC2.tlu.trl1.trap[3]

`define XIR_TAKEN_23 `SPC2.tlu.trl1.take_xir&`SPC2.tlu.trl1.trap[3]

`define SOFTINT_RDWR_23 (`TOP.nas_top.c2.t7.asi_rdwr_softint|`TOP.nas_top.c2.t7.asi_wr_softint_delay)

`define SOFTINT_REG_23 `SPC2.tlu.trl1.softint3
`define RD_SOFTINT_REG_23 `SPC2.tlu.trl1.rd_softint3
`define INT_LEVEL_TAKEN_23 `SPC2.tlu.trl1.take_iln&`SPC2.tlu.trl1.trap[3]
`define INT_LEVEL_NUM_23 `SPC2.tlu.trl1.int_level_n
`define PMU_TAKEN_23 `SPC2.tlu.trl1.take_pmu&`SPC2.tlu.trl1.trap[3]

`define HINTP_RDWR_23 (`TOP.nas_top.c2.t7.asi_rdwr_hintp | `TOP.nas_top.c2.t7.asi_wr_hintp_delay)
`define HINTP_WR_23 (`SPC2.tlu.asi_wr_hintp[23])
`define HSTMATCH_23 `SPC2.tlu.trl1.hstick3_compare

`define HINTP_REG_23 `SPC2.tlu.trl1.hintp3
`define HSTM_TAKEN_23 `SPC2.tlu.trl1.take_hst&`SPC2.tlu.trl1.trap[3]

`define NAS_PIPE_FW2_23 |`TOP.nas_top.c2.t7.complete_fw2

`define CWQ_TAKEN_23 `SPC2.tlu.trl1.take_cwq&`SPC2.tlu.trl1.trap[3]
`define SMA_TAKEN_23 `SPC2.tlu.trl1.take_sma&`SPC2.tlu.trl1.trap[3]

`define POR_TAKEN_23 `SPC2.tlu.trl1.take_por&`SPC2.tlu.trl1.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC2_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_23 || `CPU_MONDO_TAKEN_23 ||
                          `DEV_MONDO_TAKEN_23 || `RES_MONDO_TAKEN_23 ||
                          `XIR_TAKEN_23 || `INT_LEVEL_TAKEN_23 ||
                          `HSTM_TAKEN_23 || `CWQ_TAKEN_23 ||
                          `SMA_TAKEN_23 || `PMU_TAKEN_23 || `POR_TAKEN_23);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_23, `CPU_MONDO_TAKEN_23, 
           `DEV_MONDO_TAKEN_23, `RES_MONDO_TAKEN_23,
           `XIR_TAKEN_23, `INT_LEVEL_TAKEN_23,
           `HSTM_TAKEN_23, `CWQ_TAKEN_23, `SMA_TAKEN_23 ,
           `PMU_TAKEN_23, `POR_TAKEN_23})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_23;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_23 | `INT_VEC_RECV_ASIWR_23)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_23 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_23 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_23;
    end // }
    else if (`INT_VEC_RECV_ASIWR_23)
        int_vec_recv_reg <= `TOP.nas_top.c2.t7.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_23 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_23 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_23 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_23 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_23 | `INT_VEC_RECV_ASIWR_23;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_23 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_23)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_23)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_23) begin  // {
        if (softint !== `RD_SOFTINT_REG_23 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_23;
    end // }
    
    if ((`NAS_PIPE_FW2_23 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_23&(softint !== `RD_SOFTINT_REG_23)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC2.tlu.asi_wr_clear_softint[7] |
             `SPC2.tlu.asi_wr_set_softint[7] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_23});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_23});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_23 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_23;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_23 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_23 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_23;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_23;
    hstmatch_late <= `HSTMATCH_23;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

`endif
`ifdef CORE_3

// }}}

module int_c3t0 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 3;
    assign   mytid = 0;
    assign   mytnum = 3*8 + 0;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC3_GCLK) ;
    @(posedge `BENCH_SPC3_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_24 `SPC3.tlu.cth.int_rec0
`define INT_VEC_RECV_ASIWR_24 (`TOP.nas_top.c3.t0.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_24 (`TOP.nas_top.c3.t0.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_24 `SPC3.tlu.trl0.take_ivt&`SPC3.tlu.trl0.trap[0]

`define CPU_MONDO_TAKEN_24 `SPC3.tlu.trl0.take_mqr&`SPC3.tlu.trl0.trap[0]
`define DEV_MONDO_TAKEN_24 `SPC3.tlu.trl0.take_dqr&`SPC3.tlu.trl0.trap[0]
`define RES_MONDO_TAKEN_24 `SPC3.tlu.trl0.take_rqr&`SPC3.tlu.trl0.trap[0]

`define XIR_TAKEN_24 `SPC3.tlu.trl0.take_xir&`SPC3.tlu.trl0.trap[0]

`define SOFTINT_RDWR_24 (`TOP.nas_top.c3.t0.asi_rdwr_softint|`TOP.nas_top.c3.t0.asi_wr_softint_delay)

`define SOFTINT_REG_24 `SPC3.tlu.trl0.softint0
`define RD_SOFTINT_REG_24 `SPC3.tlu.trl0.rd_softint0
`define INT_LEVEL_TAKEN_24 `SPC3.tlu.trl0.take_iln&`SPC3.tlu.trl0.trap[0]
`define INT_LEVEL_NUM_24 `SPC3.tlu.trl0.int_level_n
`define PMU_TAKEN_24 `SPC3.tlu.trl0.take_pmu&`SPC3.tlu.trl0.trap[0]

`define HINTP_RDWR_24 (`TOP.nas_top.c3.t0.asi_rdwr_hintp | `TOP.nas_top.c3.t0.asi_wr_hintp_delay)
`define HINTP_WR_24 (`SPC3.tlu.asi_wr_hintp[24])
`define HSTMATCH_24 `SPC3.tlu.trl0.hstick0_compare

`define HINTP_REG_24 `SPC3.tlu.trl0.hintp0
`define HSTM_TAKEN_24 `SPC3.tlu.trl0.take_hst&`SPC3.tlu.trl0.trap[0]

`define NAS_PIPE_FW2_24 |`TOP.nas_top.c3.t0.complete_fw2

`define CWQ_TAKEN_24 `SPC3.tlu.trl0.take_cwq&`SPC3.tlu.trl0.trap[0]
`define SMA_TAKEN_24 `SPC3.tlu.trl0.take_sma&`SPC3.tlu.trl0.trap[0]

`define POR_TAKEN_24 `SPC3.tlu.trl0.take_por&`SPC3.tlu.trl0.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC3_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_24 || `CPU_MONDO_TAKEN_24 ||
                          `DEV_MONDO_TAKEN_24 || `RES_MONDO_TAKEN_24 ||
                          `XIR_TAKEN_24 || `INT_LEVEL_TAKEN_24 ||
                          `HSTM_TAKEN_24 || `CWQ_TAKEN_24 ||
                          `SMA_TAKEN_24 || `PMU_TAKEN_24 || `POR_TAKEN_24);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_24, `CPU_MONDO_TAKEN_24, 
           `DEV_MONDO_TAKEN_24, `RES_MONDO_TAKEN_24,
           `XIR_TAKEN_24, `INT_LEVEL_TAKEN_24,
           `HSTM_TAKEN_24, `CWQ_TAKEN_24, `SMA_TAKEN_24 ,
           `PMU_TAKEN_24, `POR_TAKEN_24})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_24;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_24 | `INT_VEC_RECV_ASIWR_24)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_24 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_24 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_24;
    end // }
    else if (`INT_VEC_RECV_ASIWR_24)
        int_vec_recv_reg <= `TOP.nas_top.c3.t0.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_24 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_24 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_24 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_24 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_24 | `INT_VEC_RECV_ASIWR_24;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_24 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_24)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_24)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_24) begin  // {
        if (softint !== `RD_SOFTINT_REG_24 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_24;
    end // }
    
    if ((`NAS_PIPE_FW2_24 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_24&(softint !== `RD_SOFTINT_REG_24)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC3.tlu.asi_wr_clear_softint[0] |
             `SPC3.tlu.asi_wr_set_softint[0] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_24});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_24});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_24 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_24;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_24 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_24 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_24;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_24;
    hstmatch_late <= `HSTMATCH_24;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c3t1 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 3;
    assign   mytid = 1;
    assign   mytnum = 3*8 + 1;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC3_GCLK) ;
    @(posedge `BENCH_SPC3_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_25 `SPC3.tlu.cth.int_rec1
`define INT_VEC_RECV_ASIWR_25 (`TOP.nas_top.c3.t1.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_25 (`TOP.nas_top.c3.t1.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_25 `SPC3.tlu.trl0.take_ivt&`SPC3.tlu.trl0.trap[1]

`define CPU_MONDO_TAKEN_25 `SPC3.tlu.trl0.take_mqr&`SPC3.tlu.trl0.trap[1]
`define DEV_MONDO_TAKEN_25 `SPC3.tlu.trl0.take_dqr&`SPC3.tlu.trl0.trap[1]
`define RES_MONDO_TAKEN_25 `SPC3.tlu.trl0.take_rqr&`SPC3.tlu.trl0.trap[1]

`define XIR_TAKEN_25 `SPC3.tlu.trl0.take_xir&`SPC3.tlu.trl0.trap[1]

`define SOFTINT_RDWR_25 (`TOP.nas_top.c3.t1.asi_rdwr_softint|`TOP.nas_top.c3.t1.asi_wr_softint_delay)

`define SOFTINT_REG_25 `SPC3.tlu.trl0.softint1
`define RD_SOFTINT_REG_25 `SPC3.tlu.trl0.rd_softint1
`define INT_LEVEL_TAKEN_25 `SPC3.tlu.trl0.take_iln&`SPC3.tlu.trl0.trap[1]
`define INT_LEVEL_NUM_25 `SPC3.tlu.trl0.int_level_n
`define PMU_TAKEN_25 `SPC3.tlu.trl0.take_pmu&`SPC3.tlu.trl0.trap[1]

`define HINTP_RDWR_25 (`TOP.nas_top.c3.t1.asi_rdwr_hintp | `TOP.nas_top.c3.t1.asi_wr_hintp_delay)
`define HINTP_WR_25 (`SPC3.tlu.asi_wr_hintp[25])
`define HSTMATCH_25 `SPC3.tlu.trl0.hstick1_compare

`define HINTP_REG_25 `SPC3.tlu.trl0.hintp1
`define HSTM_TAKEN_25 `SPC3.tlu.trl0.take_hst&`SPC3.tlu.trl0.trap[1]

`define NAS_PIPE_FW2_25 |`TOP.nas_top.c3.t1.complete_fw2

`define CWQ_TAKEN_25 `SPC3.tlu.trl0.take_cwq&`SPC3.tlu.trl0.trap[1]
`define SMA_TAKEN_25 `SPC3.tlu.trl0.take_sma&`SPC3.tlu.trl0.trap[1]

`define POR_TAKEN_25 `SPC3.tlu.trl0.take_por&`SPC3.tlu.trl0.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC3_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_25 || `CPU_MONDO_TAKEN_25 ||
                          `DEV_MONDO_TAKEN_25 || `RES_MONDO_TAKEN_25 ||
                          `XIR_TAKEN_25 || `INT_LEVEL_TAKEN_25 ||
                          `HSTM_TAKEN_25 || `CWQ_TAKEN_25 ||
                          `SMA_TAKEN_25 || `PMU_TAKEN_25 || `POR_TAKEN_25);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_25, `CPU_MONDO_TAKEN_25, 
           `DEV_MONDO_TAKEN_25, `RES_MONDO_TAKEN_25,
           `XIR_TAKEN_25, `INT_LEVEL_TAKEN_25,
           `HSTM_TAKEN_25, `CWQ_TAKEN_25, `SMA_TAKEN_25 ,
           `PMU_TAKEN_25, `POR_TAKEN_25})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_25;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_25 | `INT_VEC_RECV_ASIWR_25)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_25 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_25 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_25;
    end // }
    else if (`INT_VEC_RECV_ASIWR_25)
        int_vec_recv_reg <= `TOP.nas_top.c3.t1.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_25 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_25 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_25 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_25 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_25 | `INT_VEC_RECV_ASIWR_25;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_25 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_25)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_25)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_25) begin  // {
        if (softint !== `RD_SOFTINT_REG_25 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_25;
    end // }
    
    if ((`NAS_PIPE_FW2_25 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_25&(softint !== `RD_SOFTINT_REG_25)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC3.tlu.asi_wr_clear_softint[1] |
             `SPC3.tlu.asi_wr_set_softint[1] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_25});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_25});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_25 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_25;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_25 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_25 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_25;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_25;
    hstmatch_late <= `HSTMATCH_25;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c3t2 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 3;
    assign   mytid = 2;
    assign   mytnum = 3*8 + 2;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC3_GCLK) ;
    @(posedge `BENCH_SPC3_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_26 `SPC3.tlu.cth.int_rec2
`define INT_VEC_RECV_ASIWR_26 (`TOP.nas_top.c3.t2.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_26 (`TOP.nas_top.c3.t2.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_26 `SPC3.tlu.trl0.take_ivt&`SPC3.tlu.trl0.trap[2]

`define CPU_MONDO_TAKEN_26 `SPC3.tlu.trl0.take_mqr&`SPC3.tlu.trl0.trap[2]
`define DEV_MONDO_TAKEN_26 `SPC3.tlu.trl0.take_dqr&`SPC3.tlu.trl0.trap[2]
`define RES_MONDO_TAKEN_26 `SPC3.tlu.trl0.take_rqr&`SPC3.tlu.trl0.trap[2]

`define XIR_TAKEN_26 `SPC3.tlu.trl0.take_xir&`SPC3.tlu.trl0.trap[2]

`define SOFTINT_RDWR_26 (`TOP.nas_top.c3.t2.asi_rdwr_softint|`TOP.nas_top.c3.t2.asi_wr_softint_delay)

`define SOFTINT_REG_26 `SPC3.tlu.trl0.softint2
`define RD_SOFTINT_REG_26 `SPC3.tlu.trl0.rd_softint2
`define INT_LEVEL_TAKEN_26 `SPC3.tlu.trl0.take_iln&`SPC3.tlu.trl0.trap[2]
`define INT_LEVEL_NUM_26 `SPC3.tlu.trl0.int_level_n
`define PMU_TAKEN_26 `SPC3.tlu.trl0.take_pmu&`SPC3.tlu.trl0.trap[2]

`define HINTP_RDWR_26 (`TOP.nas_top.c3.t2.asi_rdwr_hintp | `TOP.nas_top.c3.t2.asi_wr_hintp_delay)
`define HINTP_WR_26 (`SPC3.tlu.asi_wr_hintp[26])
`define HSTMATCH_26 `SPC3.tlu.trl0.hstick2_compare

`define HINTP_REG_26 `SPC3.tlu.trl0.hintp2
`define HSTM_TAKEN_26 `SPC3.tlu.trl0.take_hst&`SPC3.tlu.trl0.trap[2]

`define NAS_PIPE_FW2_26 |`TOP.nas_top.c3.t2.complete_fw2

`define CWQ_TAKEN_26 `SPC3.tlu.trl0.take_cwq&`SPC3.tlu.trl0.trap[2]
`define SMA_TAKEN_26 `SPC3.tlu.trl0.take_sma&`SPC3.tlu.trl0.trap[2]

`define POR_TAKEN_26 `SPC3.tlu.trl0.take_por&`SPC3.tlu.trl0.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC3_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_26 || `CPU_MONDO_TAKEN_26 ||
                          `DEV_MONDO_TAKEN_26 || `RES_MONDO_TAKEN_26 ||
                          `XIR_TAKEN_26 || `INT_LEVEL_TAKEN_26 ||
                          `HSTM_TAKEN_26 || `CWQ_TAKEN_26 ||
                          `SMA_TAKEN_26 || `PMU_TAKEN_26 || `POR_TAKEN_26);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_26, `CPU_MONDO_TAKEN_26, 
           `DEV_MONDO_TAKEN_26, `RES_MONDO_TAKEN_26,
           `XIR_TAKEN_26, `INT_LEVEL_TAKEN_26,
           `HSTM_TAKEN_26, `CWQ_TAKEN_26, `SMA_TAKEN_26 ,
           `PMU_TAKEN_26, `POR_TAKEN_26})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_26;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_26 | `INT_VEC_RECV_ASIWR_26)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_26 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_26 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_26;
    end // }
    else if (`INT_VEC_RECV_ASIWR_26)
        int_vec_recv_reg <= `TOP.nas_top.c3.t2.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_26 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_26 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_26 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_26 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_26 | `INT_VEC_RECV_ASIWR_26;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_26 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_26)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_26)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_26) begin  // {
        if (softint !== `RD_SOFTINT_REG_26 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_26;
    end // }
    
    if ((`NAS_PIPE_FW2_26 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_26&(softint !== `RD_SOFTINT_REG_26)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC3.tlu.asi_wr_clear_softint[2] |
             `SPC3.tlu.asi_wr_set_softint[2] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_26});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_26});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_26 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_26;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_26 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_26 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_26;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_26;
    hstmatch_late <= `HSTMATCH_26;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c3t3 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 3;
    assign   mytid = 3;
    assign   mytnum = 3*8 + 3;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC3_GCLK) ;
    @(posedge `BENCH_SPC3_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_27 `SPC3.tlu.cth.int_rec3
`define INT_VEC_RECV_ASIWR_27 (`TOP.nas_top.c3.t3.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_27 (`TOP.nas_top.c3.t3.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_27 `SPC3.tlu.trl0.take_ivt&`SPC3.tlu.trl0.trap[3]

`define CPU_MONDO_TAKEN_27 `SPC3.tlu.trl0.take_mqr&`SPC3.tlu.trl0.trap[3]
`define DEV_MONDO_TAKEN_27 `SPC3.tlu.trl0.take_dqr&`SPC3.tlu.trl0.trap[3]
`define RES_MONDO_TAKEN_27 `SPC3.tlu.trl0.take_rqr&`SPC3.tlu.trl0.trap[3]

`define XIR_TAKEN_27 `SPC3.tlu.trl0.take_xir&`SPC3.tlu.trl0.trap[3]

`define SOFTINT_RDWR_27 (`TOP.nas_top.c3.t3.asi_rdwr_softint|`TOP.nas_top.c3.t3.asi_wr_softint_delay)

`define SOFTINT_REG_27 `SPC3.tlu.trl0.softint3
`define RD_SOFTINT_REG_27 `SPC3.tlu.trl0.rd_softint3
`define INT_LEVEL_TAKEN_27 `SPC3.tlu.trl0.take_iln&`SPC3.tlu.trl0.trap[3]
`define INT_LEVEL_NUM_27 `SPC3.tlu.trl0.int_level_n
`define PMU_TAKEN_27 `SPC3.tlu.trl0.take_pmu&`SPC3.tlu.trl0.trap[3]

`define HINTP_RDWR_27 (`TOP.nas_top.c3.t3.asi_rdwr_hintp | `TOP.nas_top.c3.t3.asi_wr_hintp_delay)
`define HINTP_WR_27 (`SPC3.tlu.asi_wr_hintp[27])
`define HSTMATCH_27 `SPC3.tlu.trl0.hstick3_compare

`define HINTP_REG_27 `SPC3.tlu.trl0.hintp3
`define HSTM_TAKEN_27 `SPC3.tlu.trl0.take_hst&`SPC3.tlu.trl0.trap[3]

`define NAS_PIPE_FW2_27 |`TOP.nas_top.c3.t3.complete_fw2

`define CWQ_TAKEN_27 `SPC3.tlu.trl0.take_cwq&`SPC3.tlu.trl0.trap[3]
`define SMA_TAKEN_27 `SPC3.tlu.trl0.take_sma&`SPC3.tlu.trl0.trap[3]

`define POR_TAKEN_27 `SPC3.tlu.trl0.take_por&`SPC3.tlu.trl0.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC3_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_27 || `CPU_MONDO_TAKEN_27 ||
                          `DEV_MONDO_TAKEN_27 || `RES_MONDO_TAKEN_27 ||
                          `XIR_TAKEN_27 || `INT_LEVEL_TAKEN_27 ||
                          `HSTM_TAKEN_27 || `CWQ_TAKEN_27 ||
                          `SMA_TAKEN_27 || `PMU_TAKEN_27 || `POR_TAKEN_27);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_27, `CPU_MONDO_TAKEN_27, 
           `DEV_MONDO_TAKEN_27, `RES_MONDO_TAKEN_27,
           `XIR_TAKEN_27, `INT_LEVEL_TAKEN_27,
           `HSTM_TAKEN_27, `CWQ_TAKEN_27, `SMA_TAKEN_27 ,
           `PMU_TAKEN_27, `POR_TAKEN_27})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_27;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_27 | `INT_VEC_RECV_ASIWR_27)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_27 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_27 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_27;
    end // }
    else if (`INT_VEC_RECV_ASIWR_27)
        int_vec_recv_reg <= `TOP.nas_top.c3.t3.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_27 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_27 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_27 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_27 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_27 | `INT_VEC_RECV_ASIWR_27;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_27 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_27)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_27)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_27) begin  // {
        if (softint !== `RD_SOFTINT_REG_27 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_27;
    end // }
    
    if ((`NAS_PIPE_FW2_27 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_27&(softint !== `RD_SOFTINT_REG_27)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC3.tlu.asi_wr_clear_softint[3] |
             `SPC3.tlu.asi_wr_set_softint[3] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_27});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_27});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_27 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_27;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_27 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_27 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_27;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_27;
    hstmatch_late <= `HSTMATCH_27;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c3t4 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 3;
    assign   mytid = 4;
    assign   mytnum = 3*8 + 4;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC3_GCLK) ;
    @(posedge `BENCH_SPC3_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_28 `SPC3.tlu.cth.int_rec4
`define INT_VEC_RECV_ASIWR_28 (`TOP.nas_top.c3.t4.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_28 (`TOP.nas_top.c3.t4.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_28 `SPC3.tlu.trl1.take_ivt&`SPC3.tlu.trl1.trap[0]

`define CPU_MONDO_TAKEN_28 `SPC3.tlu.trl1.take_mqr&`SPC3.tlu.trl1.trap[0]
`define DEV_MONDO_TAKEN_28 `SPC3.tlu.trl1.take_dqr&`SPC3.tlu.trl1.trap[0]
`define RES_MONDO_TAKEN_28 `SPC3.tlu.trl1.take_rqr&`SPC3.tlu.trl1.trap[0]

`define XIR_TAKEN_28 `SPC3.tlu.trl1.take_xir&`SPC3.tlu.trl1.trap[0]

`define SOFTINT_RDWR_28 (`TOP.nas_top.c3.t4.asi_rdwr_softint|`TOP.nas_top.c3.t4.asi_wr_softint_delay)

`define SOFTINT_REG_28 `SPC3.tlu.trl1.softint0
`define RD_SOFTINT_REG_28 `SPC3.tlu.trl1.rd_softint0
`define INT_LEVEL_TAKEN_28 `SPC3.tlu.trl1.take_iln&`SPC3.tlu.trl1.trap[0]
`define INT_LEVEL_NUM_28 `SPC3.tlu.trl1.int_level_n
`define PMU_TAKEN_28 `SPC3.tlu.trl1.take_pmu&`SPC3.tlu.trl1.trap[0]

`define HINTP_RDWR_28 (`TOP.nas_top.c3.t4.asi_rdwr_hintp | `TOP.nas_top.c3.t4.asi_wr_hintp_delay)
`define HINTP_WR_28 (`SPC3.tlu.asi_wr_hintp[28])
`define HSTMATCH_28 `SPC3.tlu.trl1.hstick0_compare

`define HINTP_REG_28 `SPC3.tlu.trl1.hintp0
`define HSTM_TAKEN_28 `SPC3.tlu.trl1.take_hst&`SPC3.tlu.trl1.trap[0]

`define NAS_PIPE_FW2_28 |`TOP.nas_top.c3.t4.complete_fw2

`define CWQ_TAKEN_28 `SPC3.tlu.trl1.take_cwq&`SPC3.tlu.trl1.trap[0]
`define SMA_TAKEN_28 `SPC3.tlu.trl1.take_sma&`SPC3.tlu.trl1.trap[0]

`define POR_TAKEN_28 `SPC3.tlu.trl1.take_por&`SPC3.tlu.trl1.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC3_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_28 || `CPU_MONDO_TAKEN_28 ||
                          `DEV_MONDO_TAKEN_28 || `RES_MONDO_TAKEN_28 ||
                          `XIR_TAKEN_28 || `INT_LEVEL_TAKEN_28 ||
                          `HSTM_TAKEN_28 || `CWQ_TAKEN_28 ||
                          `SMA_TAKEN_28 || `PMU_TAKEN_28 || `POR_TAKEN_28);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_28, `CPU_MONDO_TAKEN_28, 
           `DEV_MONDO_TAKEN_28, `RES_MONDO_TAKEN_28,
           `XIR_TAKEN_28, `INT_LEVEL_TAKEN_28,
           `HSTM_TAKEN_28, `CWQ_TAKEN_28, `SMA_TAKEN_28 ,
           `PMU_TAKEN_28, `POR_TAKEN_28})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_28;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_28 | `INT_VEC_RECV_ASIWR_28)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_28 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_28 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_28;
    end // }
    else if (`INT_VEC_RECV_ASIWR_28)
        int_vec_recv_reg <= `TOP.nas_top.c3.t4.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_28 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_28 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_28 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_28 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_28 | `INT_VEC_RECV_ASIWR_28;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_28 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_28)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_28)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_28) begin  // {
        if (softint !== `RD_SOFTINT_REG_28 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_28;
    end // }
    
    if ((`NAS_PIPE_FW2_28 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_28&(softint !== `RD_SOFTINT_REG_28)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC3.tlu.asi_wr_clear_softint[4] |
             `SPC3.tlu.asi_wr_set_softint[4] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_28});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_28});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_28 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_28;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_28 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_28 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_28;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_28;
    hstmatch_late <= `HSTMATCH_28;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c3t5 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 3;
    assign   mytid = 5;
    assign   mytnum = 3*8 + 5;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC3_GCLK) ;
    @(posedge `BENCH_SPC3_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_29 `SPC3.tlu.cth.int_rec5
`define INT_VEC_RECV_ASIWR_29 (`TOP.nas_top.c3.t5.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_29 (`TOP.nas_top.c3.t5.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_29 `SPC3.tlu.trl1.take_ivt&`SPC3.tlu.trl1.trap[1]

`define CPU_MONDO_TAKEN_29 `SPC3.tlu.trl1.take_mqr&`SPC3.tlu.trl1.trap[1]
`define DEV_MONDO_TAKEN_29 `SPC3.tlu.trl1.take_dqr&`SPC3.tlu.trl1.trap[1]
`define RES_MONDO_TAKEN_29 `SPC3.tlu.trl1.take_rqr&`SPC3.tlu.trl1.trap[1]

`define XIR_TAKEN_29 `SPC3.tlu.trl1.take_xir&`SPC3.tlu.trl1.trap[1]

`define SOFTINT_RDWR_29 (`TOP.nas_top.c3.t5.asi_rdwr_softint|`TOP.nas_top.c3.t5.asi_wr_softint_delay)

`define SOFTINT_REG_29 `SPC3.tlu.trl1.softint1
`define RD_SOFTINT_REG_29 `SPC3.tlu.trl1.rd_softint1
`define INT_LEVEL_TAKEN_29 `SPC3.tlu.trl1.take_iln&`SPC3.tlu.trl1.trap[1]
`define INT_LEVEL_NUM_29 `SPC3.tlu.trl1.int_level_n
`define PMU_TAKEN_29 `SPC3.tlu.trl1.take_pmu&`SPC3.tlu.trl1.trap[1]

`define HINTP_RDWR_29 (`TOP.nas_top.c3.t5.asi_rdwr_hintp | `TOP.nas_top.c3.t5.asi_wr_hintp_delay)
`define HINTP_WR_29 (`SPC3.tlu.asi_wr_hintp[29])
`define HSTMATCH_29 `SPC3.tlu.trl1.hstick1_compare

`define HINTP_REG_29 `SPC3.tlu.trl1.hintp1
`define HSTM_TAKEN_29 `SPC3.tlu.trl1.take_hst&`SPC3.tlu.trl1.trap[1]

`define NAS_PIPE_FW2_29 |`TOP.nas_top.c3.t5.complete_fw2

`define CWQ_TAKEN_29 `SPC3.tlu.trl1.take_cwq&`SPC3.tlu.trl1.trap[1]
`define SMA_TAKEN_29 `SPC3.tlu.trl1.take_sma&`SPC3.tlu.trl1.trap[1]

`define POR_TAKEN_29 `SPC3.tlu.trl1.take_por&`SPC3.tlu.trl1.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC3_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_29 || `CPU_MONDO_TAKEN_29 ||
                          `DEV_MONDO_TAKEN_29 || `RES_MONDO_TAKEN_29 ||
                          `XIR_TAKEN_29 || `INT_LEVEL_TAKEN_29 ||
                          `HSTM_TAKEN_29 || `CWQ_TAKEN_29 ||
                          `SMA_TAKEN_29 || `PMU_TAKEN_29 || `POR_TAKEN_29);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_29, `CPU_MONDO_TAKEN_29, 
           `DEV_MONDO_TAKEN_29, `RES_MONDO_TAKEN_29,
           `XIR_TAKEN_29, `INT_LEVEL_TAKEN_29,
           `HSTM_TAKEN_29, `CWQ_TAKEN_29, `SMA_TAKEN_29 ,
           `PMU_TAKEN_29, `POR_TAKEN_29})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_29;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_29 | `INT_VEC_RECV_ASIWR_29)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_29 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_29 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_29;
    end // }
    else if (`INT_VEC_RECV_ASIWR_29)
        int_vec_recv_reg <= `TOP.nas_top.c3.t5.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_29 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_29 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_29 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_29 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_29 | `INT_VEC_RECV_ASIWR_29;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_29 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_29)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_29)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_29) begin  // {
        if (softint !== `RD_SOFTINT_REG_29 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_29;
    end // }
    
    if ((`NAS_PIPE_FW2_29 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_29&(softint !== `RD_SOFTINT_REG_29)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC3.tlu.asi_wr_clear_softint[5] |
             `SPC3.tlu.asi_wr_set_softint[5] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_29});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_29});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_29 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_29;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_29 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_29 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_29;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_29;
    hstmatch_late <= `HSTMATCH_29;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c3t6 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 3;
    assign   mytid = 6;
    assign   mytnum = 3*8 + 6;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC3_GCLK) ;
    @(posedge `BENCH_SPC3_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_30 `SPC3.tlu.cth.int_rec6
`define INT_VEC_RECV_ASIWR_30 (`TOP.nas_top.c3.t6.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_30 (`TOP.nas_top.c3.t6.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_30 `SPC3.tlu.trl1.take_ivt&`SPC3.tlu.trl1.trap[2]

`define CPU_MONDO_TAKEN_30 `SPC3.tlu.trl1.take_mqr&`SPC3.tlu.trl1.trap[2]
`define DEV_MONDO_TAKEN_30 `SPC3.tlu.trl1.take_dqr&`SPC3.tlu.trl1.trap[2]
`define RES_MONDO_TAKEN_30 `SPC3.tlu.trl1.take_rqr&`SPC3.tlu.trl1.trap[2]

`define XIR_TAKEN_30 `SPC3.tlu.trl1.take_xir&`SPC3.tlu.trl1.trap[2]

`define SOFTINT_RDWR_30 (`TOP.nas_top.c3.t6.asi_rdwr_softint|`TOP.nas_top.c3.t6.asi_wr_softint_delay)

`define SOFTINT_REG_30 `SPC3.tlu.trl1.softint2
`define RD_SOFTINT_REG_30 `SPC3.tlu.trl1.rd_softint2
`define INT_LEVEL_TAKEN_30 `SPC3.tlu.trl1.take_iln&`SPC3.tlu.trl1.trap[2]
`define INT_LEVEL_NUM_30 `SPC3.tlu.trl1.int_level_n
`define PMU_TAKEN_30 `SPC3.tlu.trl1.take_pmu&`SPC3.tlu.trl1.trap[2]

`define HINTP_RDWR_30 (`TOP.nas_top.c3.t6.asi_rdwr_hintp | `TOP.nas_top.c3.t6.asi_wr_hintp_delay)
`define HINTP_WR_30 (`SPC3.tlu.asi_wr_hintp[30])
`define HSTMATCH_30 `SPC3.tlu.trl1.hstick2_compare

`define HINTP_REG_30 `SPC3.tlu.trl1.hintp2
`define HSTM_TAKEN_30 `SPC3.tlu.trl1.take_hst&`SPC3.tlu.trl1.trap[2]

`define NAS_PIPE_FW2_30 |`TOP.nas_top.c3.t6.complete_fw2

`define CWQ_TAKEN_30 `SPC3.tlu.trl1.take_cwq&`SPC3.tlu.trl1.trap[2]
`define SMA_TAKEN_30 `SPC3.tlu.trl1.take_sma&`SPC3.tlu.trl1.trap[2]

`define POR_TAKEN_30 `SPC3.tlu.trl1.take_por&`SPC3.tlu.trl1.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC3_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_30 || `CPU_MONDO_TAKEN_30 ||
                          `DEV_MONDO_TAKEN_30 || `RES_MONDO_TAKEN_30 ||
                          `XIR_TAKEN_30 || `INT_LEVEL_TAKEN_30 ||
                          `HSTM_TAKEN_30 || `CWQ_TAKEN_30 ||
                          `SMA_TAKEN_30 || `PMU_TAKEN_30 || `POR_TAKEN_30);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_30, `CPU_MONDO_TAKEN_30, 
           `DEV_MONDO_TAKEN_30, `RES_MONDO_TAKEN_30,
           `XIR_TAKEN_30, `INT_LEVEL_TAKEN_30,
           `HSTM_TAKEN_30, `CWQ_TAKEN_30, `SMA_TAKEN_30 ,
           `PMU_TAKEN_30, `POR_TAKEN_30})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_30;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_30 | `INT_VEC_RECV_ASIWR_30)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_30 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_30 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_30;
    end // }
    else if (`INT_VEC_RECV_ASIWR_30)
        int_vec_recv_reg <= `TOP.nas_top.c3.t6.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_30 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_30 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_30 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_30 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_30 | `INT_VEC_RECV_ASIWR_30;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_30 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_30)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_30)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_30) begin  // {
        if (softint !== `RD_SOFTINT_REG_30 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_30;
    end // }
    
    if ((`NAS_PIPE_FW2_30 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_30&(softint !== `RD_SOFTINT_REG_30)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC3.tlu.asi_wr_clear_softint[6] |
             `SPC3.tlu.asi_wr_set_softint[6] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_30});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_30});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_30 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_30;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_30 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_30 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_30;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_30;
    hstmatch_late <= `HSTMATCH_30;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c3t7 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 3;
    assign   mytid = 7;
    assign   mytnum = 3*8 + 7;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC3_GCLK) ;
    @(posedge `BENCH_SPC3_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_31 `SPC3.tlu.cth.int_rec7
`define INT_VEC_RECV_ASIWR_31 (`TOP.nas_top.c3.t7.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_31 (`TOP.nas_top.c3.t7.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_31 `SPC3.tlu.trl1.take_ivt&`SPC3.tlu.trl1.trap[3]

`define CPU_MONDO_TAKEN_31 `SPC3.tlu.trl1.take_mqr&`SPC3.tlu.trl1.trap[3]
`define DEV_MONDO_TAKEN_31 `SPC3.tlu.trl1.take_dqr&`SPC3.tlu.trl1.trap[3]
`define RES_MONDO_TAKEN_31 `SPC3.tlu.trl1.take_rqr&`SPC3.tlu.trl1.trap[3]

`define XIR_TAKEN_31 `SPC3.tlu.trl1.take_xir&`SPC3.tlu.trl1.trap[3]

`define SOFTINT_RDWR_31 (`TOP.nas_top.c3.t7.asi_rdwr_softint|`TOP.nas_top.c3.t7.asi_wr_softint_delay)

`define SOFTINT_REG_31 `SPC3.tlu.trl1.softint3
`define RD_SOFTINT_REG_31 `SPC3.tlu.trl1.rd_softint3
`define INT_LEVEL_TAKEN_31 `SPC3.tlu.trl1.take_iln&`SPC3.tlu.trl1.trap[3]
`define INT_LEVEL_NUM_31 `SPC3.tlu.trl1.int_level_n
`define PMU_TAKEN_31 `SPC3.tlu.trl1.take_pmu&`SPC3.tlu.trl1.trap[3]

`define HINTP_RDWR_31 (`TOP.nas_top.c3.t7.asi_rdwr_hintp | `TOP.nas_top.c3.t7.asi_wr_hintp_delay)
`define HINTP_WR_31 (`SPC3.tlu.asi_wr_hintp[31])
`define HSTMATCH_31 `SPC3.tlu.trl1.hstick3_compare

`define HINTP_REG_31 `SPC3.tlu.trl1.hintp3
`define HSTM_TAKEN_31 `SPC3.tlu.trl1.take_hst&`SPC3.tlu.trl1.trap[3]

`define NAS_PIPE_FW2_31 |`TOP.nas_top.c3.t7.complete_fw2

`define CWQ_TAKEN_31 `SPC3.tlu.trl1.take_cwq&`SPC3.tlu.trl1.trap[3]
`define SMA_TAKEN_31 `SPC3.tlu.trl1.take_sma&`SPC3.tlu.trl1.trap[3]

`define POR_TAKEN_31 `SPC3.tlu.trl1.take_por&`SPC3.tlu.trl1.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC3_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_31 || `CPU_MONDO_TAKEN_31 ||
                          `DEV_MONDO_TAKEN_31 || `RES_MONDO_TAKEN_31 ||
                          `XIR_TAKEN_31 || `INT_LEVEL_TAKEN_31 ||
                          `HSTM_TAKEN_31 || `CWQ_TAKEN_31 ||
                          `SMA_TAKEN_31 || `PMU_TAKEN_31 || `POR_TAKEN_31);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_31, `CPU_MONDO_TAKEN_31, 
           `DEV_MONDO_TAKEN_31, `RES_MONDO_TAKEN_31,
           `XIR_TAKEN_31, `INT_LEVEL_TAKEN_31,
           `HSTM_TAKEN_31, `CWQ_TAKEN_31, `SMA_TAKEN_31 ,
           `PMU_TAKEN_31, `POR_TAKEN_31})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_31;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_31 | `INT_VEC_RECV_ASIWR_31)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_31 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_31 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_31;
    end // }
    else if (`INT_VEC_RECV_ASIWR_31)
        int_vec_recv_reg <= `TOP.nas_top.c3.t7.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_31 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_31 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_31 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_31 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_31 | `INT_VEC_RECV_ASIWR_31;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_31 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_31)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_31)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_31) begin  // {
        if (softint !== `RD_SOFTINT_REG_31 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_31;
    end // }
    
    if ((`NAS_PIPE_FW2_31 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_31&(softint !== `RD_SOFTINT_REG_31)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC3.tlu.asi_wr_clear_softint[7] |
             `SPC3.tlu.asi_wr_set_softint[7] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_31});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_31});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_31 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_31;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_31 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_31 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_31;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_31;
    hstmatch_late <= `HSTMATCH_31;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

`endif
`ifdef CORE_4

// }}}

module int_c4t0 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 4;
    assign   mytid = 0;
    assign   mytnum = 4*8 + 0;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC4_GCLK) ;
    @(posedge `BENCH_SPC4_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_32 `SPC4.tlu.cth.int_rec0
`define INT_VEC_RECV_ASIWR_32 (`TOP.nas_top.c4.t0.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_32 (`TOP.nas_top.c4.t0.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_32 `SPC4.tlu.trl0.take_ivt&`SPC4.tlu.trl0.trap[0]

`define CPU_MONDO_TAKEN_32 `SPC4.tlu.trl0.take_mqr&`SPC4.tlu.trl0.trap[0]
`define DEV_MONDO_TAKEN_32 `SPC4.tlu.trl0.take_dqr&`SPC4.tlu.trl0.trap[0]
`define RES_MONDO_TAKEN_32 `SPC4.tlu.trl0.take_rqr&`SPC4.tlu.trl0.trap[0]

`define XIR_TAKEN_32 `SPC4.tlu.trl0.take_xir&`SPC4.tlu.trl0.trap[0]

`define SOFTINT_RDWR_32 (`TOP.nas_top.c4.t0.asi_rdwr_softint|`TOP.nas_top.c4.t0.asi_wr_softint_delay)

`define SOFTINT_REG_32 `SPC4.tlu.trl0.softint0
`define RD_SOFTINT_REG_32 `SPC4.tlu.trl0.rd_softint0
`define INT_LEVEL_TAKEN_32 `SPC4.tlu.trl0.take_iln&`SPC4.tlu.trl0.trap[0]
`define INT_LEVEL_NUM_32 `SPC4.tlu.trl0.int_level_n
`define PMU_TAKEN_32 `SPC4.tlu.trl0.take_pmu&`SPC4.tlu.trl0.trap[0]

`define HINTP_RDWR_32 (`TOP.nas_top.c4.t0.asi_rdwr_hintp | `TOP.nas_top.c4.t0.asi_wr_hintp_delay)
`define HINTP_WR_32 (`SPC4.tlu.asi_wr_hintp[32])
`define HSTMATCH_32 `SPC4.tlu.trl0.hstick0_compare

`define HINTP_REG_32 `SPC4.tlu.trl0.hintp0
`define HSTM_TAKEN_32 `SPC4.tlu.trl0.take_hst&`SPC4.tlu.trl0.trap[0]

`define NAS_PIPE_FW2_32 |`TOP.nas_top.c4.t0.complete_fw2

`define CWQ_TAKEN_32 `SPC4.tlu.trl0.take_cwq&`SPC4.tlu.trl0.trap[0]
`define SMA_TAKEN_32 `SPC4.tlu.trl0.take_sma&`SPC4.tlu.trl0.trap[0]

`define POR_TAKEN_32 `SPC4.tlu.trl0.take_por&`SPC4.tlu.trl0.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC4_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_32 || `CPU_MONDO_TAKEN_32 ||
                          `DEV_MONDO_TAKEN_32 || `RES_MONDO_TAKEN_32 ||
                          `XIR_TAKEN_32 || `INT_LEVEL_TAKEN_32 ||
                          `HSTM_TAKEN_32 || `CWQ_TAKEN_32 ||
                          `SMA_TAKEN_32 || `PMU_TAKEN_32 || `POR_TAKEN_32);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_32, `CPU_MONDO_TAKEN_32, 
           `DEV_MONDO_TAKEN_32, `RES_MONDO_TAKEN_32,
           `XIR_TAKEN_32, `INT_LEVEL_TAKEN_32,
           `HSTM_TAKEN_32, `CWQ_TAKEN_32, `SMA_TAKEN_32 ,
           `PMU_TAKEN_32, `POR_TAKEN_32})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_32;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_32 | `INT_VEC_RECV_ASIWR_32)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_32 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_32 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_32;
    end // }
    else if (`INT_VEC_RECV_ASIWR_32)
        int_vec_recv_reg <= `TOP.nas_top.c4.t0.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_32 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_32 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_32 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_32 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_32 | `INT_VEC_RECV_ASIWR_32;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_32 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_32)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_32)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_32) begin  // {
        if (softint !== `RD_SOFTINT_REG_32 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_32;
    end // }
    
    if ((`NAS_PIPE_FW2_32 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_32&(softint !== `RD_SOFTINT_REG_32)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC4.tlu.asi_wr_clear_softint[0] |
             `SPC4.tlu.asi_wr_set_softint[0] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_32});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_32});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_32 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_32;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_32 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_32 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_32;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_32;
    hstmatch_late <= `HSTMATCH_32;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c4t1 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 4;
    assign   mytid = 1;
    assign   mytnum = 4*8 + 1;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC4_GCLK) ;
    @(posedge `BENCH_SPC4_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_33 `SPC4.tlu.cth.int_rec1
`define INT_VEC_RECV_ASIWR_33 (`TOP.nas_top.c4.t1.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_33 (`TOP.nas_top.c4.t1.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_33 `SPC4.tlu.trl0.take_ivt&`SPC4.tlu.trl0.trap[1]

`define CPU_MONDO_TAKEN_33 `SPC4.tlu.trl0.take_mqr&`SPC4.tlu.trl0.trap[1]
`define DEV_MONDO_TAKEN_33 `SPC4.tlu.trl0.take_dqr&`SPC4.tlu.trl0.trap[1]
`define RES_MONDO_TAKEN_33 `SPC4.tlu.trl0.take_rqr&`SPC4.tlu.trl0.trap[1]

`define XIR_TAKEN_33 `SPC4.tlu.trl0.take_xir&`SPC4.tlu.trl0.trap[1]

`define SOFTINT_RDWR_33 (`TOP.nas_top.c4.t1.asi_rdwr_softint|`TOP.nas_top.c4.t1.asi_wr_softint_delay)

`define SOFTINT_REG_33 `SPC4.tlu.trl0.softint1
`define RD_SOFTINT_REG_33 `SPC4.tlu.trl0.rd_softint1
`define INT_LEVEL_TAKEN_33 `SPC4.tlu.trl0.take_iln&`SPC4.tlu.trl0.trap[1]
`define INT_LEVEL_NUM_33 `SPC4.tlu.trl0.int_level_n
`define PMU_TAKEN_33 `SPC4.tlu.trl0.take_pmu&`SPC4.tlu.trl0.trap[1]

`define HINTP_RDWR_33 (`TOP.nas_top.c4.t1.asi_rdwr_hintp | `TOP.nas_top.c4.t1.asi_wr_hintp_delay)
`define HINTP_WR_33 (`SPC4.tlu.asi_wr_hintp[33])
`define HSTMATCH_33 `SPC4.tlu.trl0.hstick1_compare

`define HINTP_REG_33 `SPC4.tlu.trl0.hintp1
`define HSTM_TAKEN_33 `SPC4.tlu.trl0.take_hst&`SPC4.tlu.trl0.trap[1]

`define NAS_PIPE_FW2_33 |`TOP.nas_top.c4.t1.complete_fw2

`define CWQ_TAKEN_33 `SPC4.tlu.trl0.take_cwq&`SPC4.tlu.trl0.trap[1]
`define SMA_TAKEN_33 `SPC4.tlu.trl0.take_sma&`SPC4.tlu.trl0.trap[1]

`define POR_TAKEN_33 `SPC4.tlu.trl0.take_por&`SPC4.tlu.trl0.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC4_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_33 || `CPU_MONDO_TAKEN_33 ||
                          `DEV_MONDO_TAKEN_33 || `RES_MONDO_TAKEN_33 ||
                          `XIR_TAKEN_33 || `INT_LEVEL_TAKEN_33 ||
                          `HSTM_TAKEN_33 || `CWQ_TAKEN_33 ||
                          `SMA_TAKEN_33 || `PMU_TAKEN_33 || `POR_TAKEN_33);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_33, `CPU_MONDO_TAKEN_33, 
           `DEV_MONDO_TAKEN_33, `RES_MONDO_TAKEN_33,
           `XIR_TAKEN_33, `INT_LEVEL_TAKEN_33,
           `HSTM_TAKEN_33, `CWQ_TAKEN_33, `SMA_TAKEN_33 ,
           `PMU_TAKEN_33, `POR_TAKEN_33})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_33;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_33 | `INT_VEC_RECV_ASIWR_33)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_33 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_33 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_33;
    end // }
    else if (`INT_VEC_RECV_ASIWR_33)
        int_vec_recv_reg <= `TOP.nas_top.c4.t1.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_33 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_33 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_33 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_33 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_33 | `INT_VEC_RECV_ASIWR_33;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_33 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_33)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_33)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_33) begin  // {
        if (softint !== `RD_SOFTINT_REG_33 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_33;
    end // }
    
    if ((`NAS_PIPE_FW2_33 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_33&(softint !== `RD_SOFTINT_REG_33)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC4.tlu.asi_wr_clear_softint[1] |
             `SPC4.tlu.asi_wr_set_softint[1] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_33});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_33});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_33 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_33;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_33 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_33 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_33;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_33;
    hstmatch_late <= `HSTMATCH_33;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c4t2 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 4;
    assign   mytid = 2;
    assign   mytnum = 4*8 + 2;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC4_GCLK) ;
    @(posedge `BENCH_SPC4_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_34 `SPC4.tlu.cth.int_rec2
`define INT_VEC_RECV_ASIWR_34 (`TOP.nas_top.c4.t2.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_34 (`TOP.nas_top.c4.t2.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_34 `SPC4.tlu.trl0.take_ivt&`SPC4.tlu.trl0.trap[2]

`define CPU_MONDO_TAKEN_34 `SPC4.tlu.trl0.take_mqr&`SPC4.tlu.trl0.trap[2]
`define DEV_MONDO_TAKEN_34 `SPC4.tlu.trl0.take_dqr&`SPC4.tlu.trl0.trap[2]
`define RES_MONDO_TAKEN_34 `SPC4.tlu.trl0.take_rqr&`SPC4.tlu.trl0.trap[2]

`define XIR_TAKEN_34 `SPC4.tlu.trl0.take_xir&`SPC4.tlu.trl0.trap[2]

`define SOFTINT_RDWR_34 (`TOP.nas_top.c4.t2.asi_rdwr_softint|`TOP.nas_top.c4.t2.asi_wr_softint_delay)

`define SOFTINT_REG_34 `SPC4.tlu.trl0.softint2
`define RD_SOFTINT_REG_34 `SPC4.tlu.trl0.rd_softint2
`define INT_LEVEL_TAKEN_34 `SPC4.tlu.trl0.take_iln&`SPC4.tlu.trl0.trap[2]
`define INT_LEVEL_NUM_34 `SPC4.tlu.trl0.int_level_n
`define PMU_TAKEN_34 `SPC4.tlu.trl0.take_pmu&`SPC4.tlu.trl0.trap[2]

`define HINTP_RDWR_34 (`TOP.nas_top.c4.t2.asi_rdwr_hintp | `TOP.nas_top.c4.t2.asi_wr_hintp_delay)
`define HINTP_WR_34 (`SPC4.tlu.asi_wr_hintp[34])
`define HSTMATCH_34 `SPC4.tlu.trl0.hstick2_compare

`define HINTP_REG_34 `SPC4.tlu.trl0.hintp2
`define HSTM_TAKEN_34 `SPC4.tlu.trl0.take_hst&`SPC4.tlu.trl0.trap[2]

`define NAS_PIPE_FW2_34 |`TOP.nas_top.c4.t2.complete_fw2

`define CWQ_TAKEN_34 `SPC4.tlu.trl0.take_cwq&`SPC4.tlu.trl0.trap[2]
`define SMA_TAKEN_34 `SPC4.tlu.trl0.take_sma&`SPC4.tlu.trl0.trap[2]

`define POR_TAKEN_34 `SPC4.tlu.trl0.take_por&`SPC4.tlu.trl0.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC4_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_34 || `CPU_MONDO_TAKEN_34 ||
                          `DEV_MONDO_TAKEN_34 || `RES_MONDO_TAKEN_34 ||
                          `XIR_TAKEN_34 || `INT_LEVEL_TAKEN_34 ||
                          `HSTM_TAKEN_34 || `CWQ_TAKEN_34 ||
                          `SMA_TAKEN_34 || `PMU_TAKEN_34 || `POR_TAKEN_34);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_34, `CPU_MONDO_TAKEN_34, 
           `DEV_MONDO_TAKEN_34, `RES_MONDO_TAKEN_34,
           `XIR_TAKEN_34, `INT_LEVEL_TAKEN_34,
           `HSTM_TAKEN_34, `CWQ_TAKEN_34, `SMA_TAKEN_34 ,
           `PMU_TAKEN_34, `POR_TAKEN_34})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_34;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_34 | `INT_VEC_RECV_ASIWR_34)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_34 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_34 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_34;
    end // }
    else if (`INT_VEC_RECV_ASIWR_34)
        int_vec_recv_reg <= `TOP.nas_top.c4.t2.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_34 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_34 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_34 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_34 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_34 | `INT_VEC_RECV_ASIWR_34;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_34 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_34)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_34)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_34) begin  // {
        if (softint !== `RD_SOFTINT_REG_34 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_34;
    end // }
    
    if ((`NAS_PIPE_FW2_34 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_34&(softint !== `RD_SOFTINT_REG_34)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC4.tlu.asi_wr_clear_softint[2] |
             `SPC4.tlu.asi_wr_set_softint[2] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_34});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_34});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_34 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_34;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_34 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_34 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_34;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_34;
    hstmatch_late <= `HSTMATCH_34;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c4t3 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 4;
    assign   mytid = 3;
    assign   mytnum = 4*8 + 3;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC4_GCLK) ;
    @(posedge `BENCH_SPC4_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_35 `SPC4.tlu.cth.int_rec3
`define INT_VEC_RECV_ASIWR_35 (`TOP.nas_top.c4.t3.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_35 (`TOP.nas_top.c4.t3.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_35 `SPC4.tlu.trl0.take_ivt&`SPC4.tlu.trl0.trap[3]

`define CPU_MONDO_TAKEN_35 `SPC4.tlu.trl0.take_mqr&`SPC4.tlu.trl0.trap[3]
`define DEV_MONDO_TAKEN_35 `SPC4.tlu.trl0.take_dqr&`SPC4.tlu.trl0.trap[3]
`define RES_MONDO_TAKEN_35 `SPC4.tlu.trl0.take_rqr&`SPC4.tlu.trl0.trap[3]

`define XIR_TAKEN_35 `SPC4.tlu.trl0.take_xir&`SPC4.tlu.trl0.trap[3]

`define SOFTINT_RDWR_35 (`TOP.nas_top.c4.t3.asi_rdwr_softint|`TOP.nas_top.c4.t3.asi_wr_softint_delay)

`define SOFTINT_REG_35 `SPC4.tlu.trl0.softint3
`define RD_SOFTINT_REG_35 `SPC4.tlu.trl0.rd_softint3
`define INT_LEVEL_TAKEN_35 `SPC4.tlu.trl0.take_iln&`SPC4.tlu.trl0.trap[3]
`define INT_LEVEL_NUM_35 `SPC4.tlu.trl0.int_level_n
`define PMU_TAKEN_35 `SPC4.tlu.trl0.take_pmu&`SPC4.tlu.trl0.trap[3]

`define HINTP_RDWR_35 (`TOP.nas_top.c4.t3.asi_rdwr_hintp | `TOP.nas_top.c4.t3.asi_wr_hintp_delay)
`define HINTP_WR_35 (`SPC4.tlu.asi_wr_hintp[35])
`define HSTMATCH_35 `SPC4.tlu.trl0.hstick3_compare

`define HINTP_REG_35 `SPC4.tlu.trl0.hintp3
`define HSTM_TAKEN_35 `SPC4.tlu.trl0.take_hst&`SPC4.tlu.trl0.trap[3]

`define NAS_PIPE_FW2_35 |`TOP.nas_top.c4.t3.complete_fw2

`define CWQ_TAKEN_35 `SPC4.tlu.trl0.take_cwq&`SPC4.tlu.trl0.trap[3]
`define SMA_TAKEN_35 `SPC4.tlu.trl0.take_sma&`SPC4.tlu.trl0.trap[3]

`define POR_TAKEN_35 `SPC4.tlu.trl0.take_por&`SPC4.tlu.trl0.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC4_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_35 || `CPU_MONDO_TAKEN_35 ||
                          `DEV_MONDO_TAKEN_35 || `RES_MONDO_TAKEN_35 ||
                          `XIR_TAKEN_35 || `INT_LEVEL_TAKEN_35 ||
                          `HSTM_TAKEN_35 || `CWQ_TAKEN_35 ||
                          `SMA_TAKEN_35 || `PMU_TAKEN_35 || `POR_TAKEN_35);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_35, `CPU_MONDO_TAKEN_35, 
           `DEV_MONDO_TAKEN_35, `RES_MONDO_TAKEN_35,
           `XIR_TAKEN_35, `INT_LEVEL_TAKEN_35,
           `HSTM_TAKEN_35, `CWQ_TAKEN_35, `SMA_TAKEN_35 ,
           `PMU_TAKEN_35, `POR_TAKEN_35})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_35;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_35 | `INT_VEC_RECV_ASIWR_35)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_35 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_35 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_35;
    end // }
    else if (`INT_VEC_RECV_ASIWR_35)
        int_vec_recv_reg <= `TOP.nas_top.c4.t3.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_35 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_35 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_35 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_35 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_35 | `INT_VEC_RECV_ASIWR_35;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_35 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_35)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_35)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_35) begin  // {
        if (softint !== `RD_SOFTINT_REG_35 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_35;
    end // }
    
    if ((`NAS_PIPE_FW2_35 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_35&(softint !== `RD_SOFTINT_REG_35)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC4.tlu.asi_wr_clear_softint[3] |
             `SPC4.tlu.asi_wr_set_softint[3] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_35});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_35});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_35 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_35;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_35 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_35 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_35;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_35;
    hstmatch_late <= `HSTMATCH_35;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c4t4 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 4;
    assign   mytid = 4;
    assign   mytnum = 4*8 + 4;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC4_GCLK) ;
    @(posedge `BENCH_SPC4_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_36 `SPC4.tlu.cth.int_rec4
`define INT_VEC_RECV_ASIWR_36 (`TOP.nas_top.c4.t4.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_36 (`TOP.nas_top.c4.t4.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_36 `SPC4.tlu.trl1.take_ivt&`SPC4.tlu.trl1.trap[0]

`define CPU_MONDO_TAKEN_36 `SPC4.tlu.trl1.take_mqr&`SPC4.tlu.trl1.trap[0]
`define DEV_MONDO_TAKEN_36 `SPC4.tlu.trl1.take_dqr&`SPC4.tlu.trl1.trap[0]
`define RES_MONDO_TAKEN_36 `SPC4.tlu.trl1.take_rqr&`SPC4.tlu.trl1.trap[0]

`define XIR_TAKEN_36 `SPC4.tlu.trl1.take_xir&`SPC4.tlu.trl1.trap[0]

`define SOFTINT_RDWR_36 (`TOP.nas_top.c4.t4.asi_rdwr_softint|`TOP.nas_top.c4.t4.asi_wr_softint_delay)

`define SOFTINT_REG_36 `SPC4.tlu.trl1.softint0
`define RD_SOFTINT_REG_36 `SPC4.tlu.trl1.rd_softint0
`define INT_LEVEL_TAKEN_36 `SPC4.tlu.trl1.take_iln&`SPC4.tlu.trl1.trap[0]
`define INT_LEVEL_NUM_36 `SPC4.tlu.trl1.int_level_n
`define PMU_TAKEN_36 `SPC4.tlu.trl1.take_pmu&`SPC4.tlu.trl1.trap[0]

`define HINTP_RDWR_36 (`TOP.nas_top.c4.t4.asi_rdwr_hintp | `TOP.nas_top.c4.t4.asi_wr_hintp_delay)
`define HINTP_WR_36 (`SPC4.tlu.asi_wr_hintp[36])
`define HSTMATCH_36 `SPC4.tlu.trl1.hstick0_compare

`define HINTP_REG_36 `SPC4.tlu.trl1.hintp0
`define HSTM_TAKEN_36 `SPC4.tlu.trl1.take_hst&`SPC4.tlu.trl1.trap[0]

`define NAS_PIPE_FW2_36 |`TOP.nas_top.c4.t4.complete_fw2

`define CWQ_TAKEN_36 `SPC4.tlu.trl1.take_cwq&`SPC4.tlu.trl1.trap[0]
`define SMA_TAKEN_36 `SPC4.tlu.trl1.take_sma&`SPC4.tlu.trl1.trap[0]

`define POR_TAKEN_36 `SPC4.tlu.trl1.take_por&`SPC4.tlu.trl1.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC4_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_36 || `CPU_MONDO_TAKEN_36 ||
                          `DEV_MONDO_TAKEN_36 || `RES_MONDO_TAKEN_36 ||
                          `XIR_TAKEN_36 || `INT_LEVEL_TAKEN_36 ||
                          `HSTM_TAKEN_36 || `CWQ_TAKEN_36 ||
                          `SMA_TAKEN_36 || `PMU_TAKEN_36 || `POR_TAKEN_36);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_36, `CPU_MONDO_TAKEN_36, 
           `DEV_MONDO_TAKEN_36, `RES_MONDO_TAKEN_36,
           `XIR_TAKEN_36, `INT_LEVEL_TAKEN_36,
           `HSTM_TAKEN_36, `CWQ_TAKEN_36, `SMA_TAKEN_36 ,
           `PMU_TAKEN_36, `POR_TAKEN_36})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_36;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_36 | `INT_VEC_RECV_ASIWR_36)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_36 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_36 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_36;
    end // }
    else if (`INT_VEC_RECV_ASIWR_36)
        int_vec_recv_reg <= `TOP.nas_top.c4.t4.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_36 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_36 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_36 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_36 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_36 | `INT_VEC_RECV_ASIWR_36;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_36 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_36)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_36)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_36) begin  // {
        if (softint !== `RD_SOFTINT_REG_36 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_36;
    end // }
    
    if ((`NAS_PIPE_FW2_36 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_36&(softint !== `RD_SOFTINT_REG_36)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC4.tlu.asi_wr_clear_softint[4] |
             `SPC4.tlu.asi_wr_set_softint[4] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_36});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_36});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_36 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_36;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_36 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_36 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_36;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_36;
    hstmatch_late <= `HSTMATCH_36;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c4t5 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 4;
    assign   mytid = 5;
    assign   mytnum = 4*8 + 5;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC4_GCLK) ;
    @(posedge `BENCH_SPC4_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_37 `SPC4.tlu.cth.int_rec5
`define INT_VEC_RECV_ASIWR_37 (`TOP.nas_top.c4.t5.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_37 (`TOP.nas_top.c4.t5.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_37 `SPC4.tlu.trl1.take_ivt&`SPC4.tlu.trl1.trap[1]

`define CPU_MONDO_TAKEN_37 `SPC4.tlu.trl1.take_mqr&`SPC4.tlu.trl1.trap[1]
`define DEV_MONDO_TAKEN_37 `SPC4.tlu.trl1.take_dqr&`SPC4.tlu.trl1.trap[1]
`define RES_MONDO_TAKEN_37 `SPC4.tlu.trl1.take_rqr&`SPC4.tlu.trl1.trap[1]

`define XIR_TAKEN_37 `SPC4.tlu.trl1.take_xir&`SPC4.tlu.trl1.trap[1]

`define SOFTINT_RDWR_37 (`TOP.nas_top.c4.t5.asi_rdwr_softint|`TOP.nas_top.c4.t5.asi_wr_softint_delay)

`define SOFTINT_REG_37 `SPC4.tlu.trl1.softint1
`define RD_SOFTINT_REG_37 `SPC4.tlu.trl1.rd_softint1
`define INT_LEVEL_TAKEN_37 `SPC4.tlu.trl1.take_iln&`SPC4.tlu.trl1.trap[1]
`define INT_LEVEL_NUM_37 `SPC4.tlu.trl1.int_level_n
`define PMU_TAKEN_37 `SPC4.tlu.trl1.take_pmu&`SPC4.tlu.trl1.trap[1]

`define HINTP_RDWR_37 (`TOP.nas_top.c4.t5.asi_rdwr_hintp | `TOP.nas_top.c4.t5.asi_wr_hintp_delay)
`define HINTP_WR_37 (`SPC4.tlu.asi_wr_hintp[37])
`define HSTMATCH_37 `SPC4.tlu.trl1.hstick1_compare

`define HINTP_REG_37 `SPC4.tlu.trl1.hintp1
`define HSTM_TAKEN_37 `SPC4.tlu.trl1.take_hst&`SPC4.tlu.trl1.trap[1]

`define NAS_PIPE_FW2_37 |`TOP.nas_top.c4.t5.complete_fw2

`define CWQ_TAKEN_37 `SPC4.tlu.trl1.take_cwq&`SPC4.tlu.trl1.trap[1]
`define SMA_TAKEN_37 `SPC4.tlu.trl1.take_sma&`SPC4.tlu.trl1.trap[1]

`define POR_TAKEN_37 `SPC4.tlu.trl1.take_por&`SPC4.tlu.trl1.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC4_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_37 || `CPU_MONDO_TAKEN_37 ||
                          `DEV_MONDO_TAKEN_37 || `RES_MONDO_TAKEN_37 ||
                          `XIR_TAKEN_37 || `INT_LEVEL_TAKEN_37 ||
                          `HSTM_TAKEN_37 || `CWQ_TAKEN_37 ||
                          `SMA_TAKEN_37 || `PMU_TAKEN_37 || `POR_TAKEN_37);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_37, `CPU_MONDO_TAKEN_37, 
           `DEV_MONDO_TAKEN_37, `RES_MONDO_TAKEN_37,
           `XIR_TAKEN_37, `INT_LEVEL_TAKEN_37,
           `HSTM_TAKEN_37, `CWQ_TAKEN_37, `SMA_TAKEN_37 ,
           `PMU_TAKEN_37, `POR_TAKEN_37})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_37;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_37 | `INT_VEC_RECV_ASIWR_37)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_37 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_37 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_37;
    end // }
    else if (`INT_VEC_RECV_ASIWR_37)
        int_vec_recv_reg <= `TOP.nas_top.c4.t5.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_37 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_37 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_37 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_37 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_37 | `INT_VEC_RECV_ASIWR_37;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_37 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_37)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_37)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_37) begin  // {
        if (softint !== `RD_SOFTINT_REG_37 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_37;
    end // }
    
    if ((`NAS_PIPE_FW2_37 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_37&(softint !== `RD_SOFTINT_REG_37)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC4.tlu.asi_wr_clear_softint[5] |
             `SPC4.tlu.asi_wr_set_softint[5] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_37});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_37});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_37 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_37;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_37 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_37 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_37;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_37;
    hstmatch_late <= `HSTMATCH_37;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c4t6 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 4;
    assign   mytid = 6;
    assign   mytnum = 4*8 + 6;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC4_GCLK) ;
    @(posedge `BENCH_SPC4_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_38 `SPC4.tlu.cth.int_rec6
`define INT_VEC_RECV_ASIWR_38 (`TOP.nas_top.c4.t6.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_38 (`TOP.nas_top.c4.t6.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_38 `SPC4.tlu.trl1.take_ivt&`SPC4.tlu.trl1.trap[2]

`define CPU_MONDO_TAKEN_38 `SPC4.tlu.trl1.take_mqr&`SPC4.tlu.trl1.trap[2]
`define DEV_MONDO_TAKEN_38 `SPC4.tlu.trl1.take_dqr&`SPC4.tlu.trl1.trap[2]
`define RES_MONDO_TAKEN_38 `SPC4.tlu.trl1.take_rqr&`SPC4.tlu.trl1.trap[2]

`define XIR_TAKEN_38 `SPC4.tlu.trl1.take_xir&`SPC4.tlu.trl1.trap[2]

`define SOFTINT_RDWR_38 (`TOP.nas_top.c4.t6.asi_rdwr_softint|`TOP.nas_top.c4.t6.asi_wr_softint_delay)

`define SOFTINT_REG_38 `SPC4.tlu.trl1.softint2
`define RD_SOFTINT_REG_38 `SPC4.tlu.trl1.rd_softint2
`define INT_LEVEL_TAKEN_38 `SPC4.tlu.trl1.take_iln&`SPC4.tlu.trl1.trap[2]
`define INT_LEVEL_NUM_38 `SPC4.tlu.trl1.int_level_n
`define PMU_TAKEN_38 `SPC4.tlu.trl1.take_pmu&`SPC4.tlu.trl1.trap[2]

`define HINTP_RDWR_38 (`TOP.nas_top.c4.t6.asi_rdwr_hintp | `TOP.nas_top.c4.t6.asi_wr_hintp_delay)
`define HINTP_WR_38 (`SPC4.tlu.asi_wr_hintp[38])
`define HSTMATCH_38 `SPC4.tlu.trl1.hstick2_compare

`define HINTP_REG_38 `SPC4.tlu.trl1.hintp2
`define HSTM_TAKEN_38 `SPC4.tlu.trl1.take_hst&`SPC4.tlu.trl1.trap[2]

`define NAS_PIPE_FW2_38 |`TOP.nas_top.c4.t6.complete_fw2

`define CWQ_TAKEN_38 `SPC4.tlu.trl1.take_cwq&`SPC4.tlu.trl1.trap[2]
`define SMA_TAKEN_38 `SPC4.tlu.trl1.take_sma&`SPC4.tlu.trl1.trap[2]

`define POR_TAKEN_38 `SPC4.tlu.trl1.take_por&`SPC4.tlu.trl1.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC4_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_38 || `CPU_MONDO_TAKEN_38 ||
                          `DEV_MONDO_TAKEN_38 || `RES_MONDO_TAKEN_38 ||
                          `XIR_TAKEN_38 || `INT_LEVEL_TAKEN_38 ||
                          `HSTM_TAKEN_38 || `CWQ_TAKEN_38 ||
                          `SMA_TAKEN_38 || `PMU_TAKEN_38 || `POR_TAKEN_38);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_38, `CPU_MONDO_TAKEN_38, 
           `DEV_MONDO_TAKEN_38, `RES_MONDO_TAKEN_38,
           `XIR_TAKEN_38, `INT_LEVEL_TAKEN_38,
           `HSTM_TAKEN_38, `CWQ_TAKEN_38, `SMA_TAKEN_38 ,
           `PMU_TAKEN_38, `POR_TAKEN_38})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_38;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_38 | `INT_VEC_RECV_ASIWR_38)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_38 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_38 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_38;
    end // }
    else if (`INT_VEC_RECV_ASIWR_38)
        int_vec_recv_reg <= `TOP.nas_top.c4.t6.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_38 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_38 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_38 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_38 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_38 | `INT_VEC_RECV_ASIWR_38;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_38 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_38)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_38)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_38) begin  // {
        if (softint !== `RD_SOFTINT_REG_38 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_38;
    end // }
    
    if ((`NAS_PIPE_FW2_38 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_38&(softint !== `RD_SOFTINT_REG_38)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC4.tlu.asi_wr_clear_softint[6] |
             `SPC4.tlu.asi_wr_set_softint[6] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_38});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_38});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_38 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_38;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_38 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_38 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_38;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_38;
    hstmatch_late <= `HSTMATCH_38;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c4t7 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 4;
    assign   mytid = 7;
    assign   mytnum = 4*8 + 7;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC4_GCLK) ;
    @(posedge `BENCH_SPC4_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_39 `SPC4.tlu.cth.int_rec7
`define INT_VEC_RECV_ASIWR_39 (`TOP.nas_top.c4.t7.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_39 (`TOP.nas_top.c4.t7.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_39 `SPC4.tlu.trl1.take_ivt&`SPC4.tlu.trl1.trap[3]

`define CPU_MONDO_TAKEN_39 `SPC4.tlu.trl1.take_mqr&`SPC4.tlu.trl1.trap[3]
`define DEV_MONDO_TAKEN_39 `SPC4.tlu.trl1.take_dqr&`SPC4.tlu.trl1.trap[3]
`define RES_MONDO_TAKEN_39 `SPC4.tlu.trl1.take_rqr&`SPC4.tlu.trl1.trap[3]

`define XIR_TAKEN_39 `SPC4.tlu.trl1.take_xir&`SPC4.tlu.trl1.trap[3]

`define SOFTINT_RDWR_39 (`TOP.nas_top.c4.t7.asi_rdwr_softint|`TOP.nas_top.c4.t7.asi_wr_softint_delay)

`define SOFTINT_REG_39 `SPC4.tlu.trl1.softint3
`define RD_SOFTINT_REG_39 `SPC4.tlu.trl1.rd_softint3
`define INT_LEVEL_TAKEN_39 `SPC4.tlu.trl1.take_iln&`SPC4.tlu.trl1.trap[3]
`define INT_LEVEL_NUM_39 `SPC4.tlu.trl1.int_level_n
`define PMU_TAKEN_39 `SPC4.tlu.trl1.take_pmu&`SPC4.tlu.trl1.trap[3]

`define HINTP_RDWR_39 (`TOP.nas_top.c4.t7.asi_rdwr_hintp | `TOP.nas_top.c4.t7.asi_wr_hintp_delay)
`define HINTP_WR_39 (`SPC4.tlu.asi_wr_hintp[39])
`define HSTMATCH_39 `SPC4.tlu.trl1.hstick3_compare

`define HINTP_REG_39 `SPC4.tlu.trl1.hintp3
`define HSTM_TAKEN_39 `SPC4.tlu.trl1.take_hst&`SPC4.tlu.trl1.trap[3]

`define NAS_PIPE_FW2_39 |`TOP.nas_top.c4.t7.complete_fw2

`define CWQ_TAKEN_39 `SPC4.tlu.trl1.take_cwq&`SPC4.tlu.trl1.trap[3]
`define SMA_TAKEN_39 `SPC4.tlu.trl1.take_sma&`SPC4.tlu.trl1.trap[3]

`define POR_TAKEN_39 `SPC4.tlu.trl1.take_por&`SPC4.tlu.trl1.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC4_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_39 || `CPU_MONDO_TAKEN_39 ||
                          `DEV_MONDO_TAKEN_39 || `RES_MONDO_TAKEN_39 ||
                          `XIR_TAKEN_39 || `INT_LEVEL_TAKEN_39 ||
                          `HSTM_TAKEN_39 || `CWQ_TAKEN_39 ||
                          `SMA_TAKEN_39 || `PMU_TAKEN_39 || `POR_TAKEN_39);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_39, `CPU_MONDO_TAKEN_39, 
           `DEV_MONDO_TAKEN_39, `RES_MONDO_TAKEN_39,
           `XIR_TAKEN_39, `INT_LEVEL_TAKEN_39,
           `HSTM_TAKEN_39, `CWQ_TAKEN_39, `SMA_TAKEN_39 ,
           `PMU_TAKEN_39, `POR_TAKEN_39})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_39;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_39 | `INT_VEC_RECV_ASIWR_39)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_39 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_39 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_39;
    end // }
    else if (`INT_VEC_RECV_ASIWR_39)
        int_vec_recv_reg <= `TOP.nas_top.c4.t7.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_39 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_39 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_39 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_39 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_39 | `INT_VEC_RECV_ASIWR_39;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_39 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_39)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_39)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_39) begin  // {
        if (softint !== `RD_SOFTINT_REG_39 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_39;
    end // }
    
    if ((`NAS_PIPE_FW2_39 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_39&(softint !== `RD_SOFTINT_REG_39)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC4.tlu.asi_wr_clear_softint[7] |
             `SPC4.tlu.asi_wr_set_softint[7] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_39});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_39});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_39 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_39;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_39 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_39 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_39;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_39;
    hstmatch_late <= `HSTMATCH_39;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

`endif
`ifdef CORE_5

// }}}

module int_c5t0 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 5;
    assign   mytid = 0;
    assign   mytnum = 5*8 + 0;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC5_GCLK) ;
    @(posedge `BENCH_SPC5_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_40 `SPC5.tlu.cth.int_rec0
`define INT_VEC_RECV_ASIWR_40 (`TOP.nas_top.c5.t0.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_40 (`TOP.nas_top.c5.t0.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_40 `SPC5.tlu.trl0.take_ivt&`SPC5.tlu.trl0.trap[0]

`define CPU_MONDO_TAKEN_40 `SPC5.tlu.trl0.take_mqr&`SPC5.tlu.trl0.trap[0]
`define DEV_MONDO_TAKEN_40 `SPC5.tlu.trl0.take_dqr&`SPC5.tlu.trl0.trap[0]
`define RES_MONDO_TAKEN_40 `SPC5.tlu.trl0.take_rqr&`SPC5.tlu.trl0.trap[0]

`define XIR_TAKEN_40 `SPC5.tlu.trl0.take_xir&`SPC5.tlu.trl0.trap[0]

`define SOFTINT_RDWR_40 (`TOP.nas_top.c5.t0.asi_rdwr_softint|`TOP.nas_top.c5.t0.asi_wr_softint_delay)

`define SOFTINT_REG_40 `SPC5.tlu.trl0.softint0
`define RD_SOFTINT_REG_40 `SPC5.tlu.trl0.rd_softint0
`define INT_LEVEL_TAKEN_40 `SPC5.tlu.trl0.take_iln&`SPC5.tlu.trl0.trap[0]
`define INT_LEVEL_NUM_40 `SPC5.tlu.trl0.int_level_n
`define PMU_TAKEN_40 `SPC5.tlu.trl0.take_pmu&`SPC5.tlu.trl0.trap[0]

`define HINTP_RDWR_40 (`TOP.nas_top.c5.t0.asi_rdwr_hintp | `TOP.nas_top.c5.t0.asi_wr_hintp_delay)
`define HINTP_WR_40 (`SPC5.tlu.asi_wr_hintp[40])
`define HSTMATCH_40 `SPC5.tlu.trl0.hstick0_compare

`define HINTP_REG_40 `SPC5.tlu.trl0.hintp0
`define HSTM_TAKEN_40 `SPC5.tlu.trl0.take_hst&`SPC5.tlu.trl0.trap[0]

`define NAS_PIPE_FW2_40 |`TOP.nas_top.c5.t0.complete_fw2

`define CWQ_TAKEN_40 `SPC5.tlu.trl0.take_cwq&`SPC5.tlu.trl0.trap[0]
`define SMA_TAKEN_40 `SPC5.tlu.trl0.take_sma&`SPC5.tlu.trl0.trap[0]

`define POR_TAKEN_40 `SPC5.tlu.trl0.take_por&`SPC5.tlu.trl0.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC5_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_40 || `CPU_MONDO_TAKEN_40 ||
                          `DEV_MONDO_TAKEN_40 || `RES_MONDO_TAKEN_40 ||
                          `XIR_TAKEN_40 || `INT_LEVEL_TAKEN_40 ||
                          `HSTM_TAKEN_40 || `CWQ_TAKEN_40 ||
                          `SMA_TAKEN_40 || `PMU_TAKEN_40 || `POR_TAKEN_40);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_40, `CPU_MONDO_TAKEN_40, 
           `DEV_MONDO_TAKEN_40, `RES_MONDO_TAKEN_40,
           `XIR_TAKEN_40, `INT_LEVEL_TAKEN_40,
           `HSTM_TAKEN_40, `CWQ_TAKEN_40, `SMA_TAKEN_40 ,
           `PMU_TAKEN_40, `POR_TAKEN_40})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_40;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_40 | `INT_VEC_RECV_ASIWR_40)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_40 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_40 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_40;
    end // }
    else if (`INT_VEC_RECV_ASIWR_40)
        int_vec_recv_reg <= `TOP.nas_top.c5.t0.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_40 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_40 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_40 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_40 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_40 | `INT_VEC_RECV_ASIWR_40;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_40 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_40)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_40)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_40) begin  // {
        if (softint !== `RD_SOFTINT_REG_40 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_40;
    end // }
    
    if ((`NAS_PIPE_FW2_40 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_40&(softint !== `RD_SOFTINT_REG_40)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC5.tlu.asi_wr_clear_softint[0] |
             `SPC5.tlu.asi_wr_set_softint[0] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_40});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_40});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_40 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_40;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_40 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_40 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_40;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_40;
    hstmatch_late <= `HSTMATCH_40;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c5t1 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 5;
    assign   mytid = 1;
    assign   mytnum = 5*8 + 1;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC5_GCLK) ;
    @(posedge `BENCH_SPC5_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_41 `SPC5.tlu.cth.int_rec1
`define INT_VEC_RECV_ASIWR_41 (`TOP.nas_top.c5.t1.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_41 (`TOP.nas_top.c5.t1.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_41 `SPC5.tlu.trl0.take_ivt&`SPC5.tlu.trl0.trap[1]

`define CPU_MONDO_TAKEN_41 `SPC5.tlu.trl0.take_mqr&`SPC5.tlu.trl0.trap[1]
`define DEV_MONDO_TAKEN_41 `SPC5.tlu.trl0.take_dqr&`SPC5.tlu.trl0.trap[1]
`define RES_MONDO_TAKEN_41 `SPC5.tlu.trl0.take_rqr&`SPC5.tlu.trl0.trap[1]

`define XIR_TAKEN_41 `SPC5.tlu.trl0.take_xir&`SPC5.tlu.trl0.trap[1]

`define SOFTINT_RDWR_41 (`TOP.nas_top.c5.t1.asi_rdwr_softint|`TOP.nas_top.c5.t1.asi_wr_softint_delay)

`define SOFTINT_REG_41 `SPC5.tlu.trl0.softint1
`define RD_SOFTINT_REG_41 `SPC5.tlu.trl0.rd_softint1
`define INT_LEVEL_TAKEN_41 `SPC5.tlu.trl0.take_iln&`SPC5.tlu.trl0.trap[1]
`define INT_LEVEL_NUM_41 `SPC5.tlu.trl0.int_level_n
`define PMU_TAKEN_41 `SPC5.tlu.trl0.take_pmu&`SPC5.tlu.trl0.trap[1]

`define HINTP_RDWR_41 (`TOP.nas_top.c5.t1.asi_rdwr_hintp | `TOP.nas_top.c5.t1.asi_wr_hintp_delay)
`define HINTP_WR_41 (`SPC5.tlu.asi_wr_hintp[41])
`define HSTMATCH_41 `SPC5.tlu.trl0.hstick1_compare

`define HINTP_REG_41 `SPC5.tlu.trl0.hintp1
`define HSTM_TAKEN_41 `SPC5.tlu.trl0.take_hst&`SPC5.tlu.trl0.trap[1]

`define NAS_PIPE_FW2_41 |`TOP.nas_top.c5.t1.complete_fw2

`define CWQ_TAKEN_41 `SPC5.tlu.trl0.take_cwq&`SPC5.tlu.trl0.trap[1]
`define SMA_TAKEN_41 `SPC5.tlu.trl0.take_sma&`SPC5.tlu.trl0.trap[1]

`define POR_TAKEN_41 `SPC5.tlu.trl0.take_por&`SPC5.tlu.trl0.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC5_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_41 || `CPU_MONDO_TAKEN_41 ||
                          `DEV_MONDO_TAKEN_41 || `RES_MONDO_TAKEN_41 ||
                          `XIR_TAKEN_41 || `INT_LEVEL_TAKEN_41 ||
                          `HSTM_TAKEN_41 || `CWQ_TAKEN_41 ||
                          `SMA_TAKEN_41 || `PMU_TAKEN_41 || `POR_TAKEN_41);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_41, `CPU_MONDO_TAKEN_41, 
           `DEV_MONDO_TAKEN_41, `RES_MONDO_TAKEN_41,
           `XIR_TAKEN_41, `INT_LEVEL_TAKEN_41,
           `HSTM_TAKEN_41, `CWQ_TAKEN_41, `SMA_TAKEN_41 ,
           `PMU_TAKEN_41, `POR_TAKEN_41})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_41;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_41 | `INT_VEC_RECV_ASIWR_41)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_41 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_41 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_41;
    end // }
    else if (`INT_VEC_RECV_ASIWR_41)
        int_vec_recv_reg <= `TOP.nas_top.c5.t1.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_41 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_41 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_41 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_41 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_41 | `INT_VEC_RECV_ASIWR_41;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_41 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_41)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_41)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_41) begin  // {
        if (softint !== `RD_SOFTINT_REG_41 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_41;
    end // }
    
    if ((`NAS_PIPE_FW2_41 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_41&(softint !== `RD_SOFTINT_REG_41)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC5.tlu.asi_wr_clear_softint[1] |
             `SPC5.tlu.asi_wr_set_softint[1] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_41});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_41});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_41 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_41;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_41 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_41 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_41;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_41;
    hstmatch_late <= `HSTMATCH_41;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c5t2 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 5;
    assign   mytid = 2;
    assign   mytnum = 5*8 + 2;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC5_GCLK) ;
    @(posedge `BENCH_SPC5_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_42 `SPC5.tlu.cth.int_rec2
`define INT_VEC_RECV_ASIWR_42 (`TOP.nas_top.c5.t2.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_42 (`TOP.nas_top.c5.t2.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_42 `SPC5.tlu.trl0.take_ivt&`SPC5.tlu.trl0.trap[2]

`define CPU_MONDO_TAKEN_42 `SPC5.tlu.trl0.take_mqr&`SPC5.tlu.trl0.trap[2]
`define DEV_MONDO_TAKEN_42 `SPC5.tlu.trl0.take_dqr&`SPC5.tlu.trl0.trap[2]
`define RES_MONDO_TAKEN_42 `SPC5.tlu.trl0.take_rqr&`SPC5.tlu.trl0.trap[2]

`define XIR_TAKEN_42 `SPC5.tlu.trl0.take_xir&`SPC5.tlu.trl0.trap[2]

`define SOFTINT_RDWR_42 (`TOP.nas_top.c5.t2.asi_rdwr_softint|`TOP.nas_top.c5.t2.asi_wr_softint_delay)

`define SOFTINT_REG_42 `SPC5.tlu.trl0.softint2
`define RD_SOFTINT_REG_42 `SPC5.tlu.trl0.rd_softint2
`define INT_LEVEL_TAKEN_42 `SPC5.tlu.trl0.take_iln&`SPC5.tlu.trl0.trap[2]
`define INT_LEVEL_NUM_42 `SPC5.tlu.trl0.int_level_n
`define PMU_TAKEN_42 `SPC5.tlu.trl0.take_pmu&`SPC5.tlu.trl0.trap[2]

`define HINTP_RDWR_42 (`TOP.nas_top.c5.t2.asi_rdwr_hintp | `TOP.nas_top.c5.t2.asi_wr_hintp_delay)
`define HINTP_WR_42 (`SPC5.tlu.asi_wr_hintp[42])
`define HSTMATCH_42 `SPC5.tlu.trl0.hstick2_compare

`define HINTP_REG_42 `SPC5.tlu.trl0.hintp2
`define HSTM_TAKEN_42 `SPC5.tlu.trl0.take_hst&`SPC5.tlu.trl0.trap[2]

`define NAS_PIPE_FW2_42 |`TOP.nas_top.c5.t2.complete_fw2

`define CWQ_TAKEN_42 `SPC5.tlu.trl0.take_cwq&`SPC5.tlu.trl0.trap[2]
`define SMA_TAKEN_42 `SPC5.tlu.trl0.take_sma&`SPC5.tlu.trl0.trap[2]

`define POR_TAKEN_42 `SPC5.tlu.trl0.take_por&`SPC5.tlu.trl0.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC5_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_42 || `CPU_MONDO_TAKEN_42 ||
                          `DEV_MONDO_TAKEN_42 || `RES_MONDO_TAKEN_42 ||
                          `XIR_TAKEN_42 || `INT_LEVEL_TAKEN_42 ||
                          `HSTM_TAKEN_42 || `CWQ_TAKEN_42 ||
                          `SMA_TAKEN_42 || `PMU_TAKEN_42 || `POR_TAKEN_42);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_42, `CPU_MONDO_TAKEN_42, 
           `DEV_MONDO_TAKEN_42, `RES_MONDO_TAKEN_42,
           `XIR_TAKEN_42, `INT_LEVEL_TAKEN_42,
           `HSTM_TAKEN_42, `CWQ_TAKEN_42, `SMA_TAKEN_42 ,
           `PMU_TAKEN_42, `POR_TAKEN_42})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_42;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_42 | `INT_VEC_RECV_ASIWR_42)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_42 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_42 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_42;
    end // }
    else if (`INT_VEC_RECV_ASIWR_42)
        int_vec_recv_reg <= `TOP.nas_top.c5.t2.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_42 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_42 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_42 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_42 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_42 | `INT_VEC_RECV_ASIWR_42;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_42 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_42)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_42)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_42) begin  // {
        if (softint !== `RD_SOFTINT_REG_42 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_42;
    end // }
    
    if ((`NAS_PIPE_FW2_42 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_42&(softint !== `RD_SOFTINT_REG_42)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC5.tlu.asi_wr_clear_softint[2] |
             `SPC5.tlu.asi_wr_set_softint[2] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_42});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_42});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_42 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_42;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_42 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_42 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_42;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_42;
    hstmatch_late <= `HSTMATCH_42;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c5t3 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 5;
    assign   mytid = 3;
    assign   mytnum = 5*8 + 3;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC5_GCLK) ;
    @(posedge `BENCH_SPC5_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_43 `SPC5.tlu.cth.int_rec3
`define INT_VEC_RECV_ASIWR_43 (`TOP.nas_top.c5.t3.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_43 (`TOP.nas_top.c5.t3.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_43 `SPC5.tlu.trl0.take_ivt&`SPC5.tlu.trl0.trap[3]

`define CPU_MONDO_TAKEN_43 `SPC5.tlu.trl0.take_mqr&`SPC5.tlu.trl0.trap[3]
`define DEV_MONDO_TAKEN_43 `SPC5.tlu.trl0.take_dqr&`SPC5.tlu.trl0.trap[3]
`define RES_MONDO_TAKEN_43 `SPC5.tlu.trl0.take_rqr&`SPC5.tlu.trl0.trap[3]

`define XIR_TAKEN_43 `SPC5.tlu.trl0.take_xir&`SPC5.tlu.trl0.trap[3]

`define SOFTINT_RDWR_43 (`TOP.nas_top.c5.t3.asi_rdwr_softint|`TOP.nas_top.c5.t3.asi_wr_softint_delay)

`define SOFTINT_REG_43 `SPC5.tlu.trl0.softint3
`define RD_SOFTINT_REG_43 `SPC5.tlu.trl0.rd_softint3
`define INT_LEVEL_TAKEN_43 `SPC5.tlu.trl0.take_iln&`SPC5.tlu.trl0.trap[3]
`define INT_LEVEL_NUM_43 `SPC5.tlu.trl0.int_level_n
`define PMU_TAKEN_43 `SPC5.tlu.trl0.take_pmu&`SPC5.tlu.trl0.trap[3]

`define HINTP_RDWR_43 (`TOP.nas_top.c5.t3.asi_rdwr_hintp | `TOP.nas_top.c5.t3.asi_wr_hintp_delay)
`define HINTP_WR_43 (`SPC5.tlu.asi_wr_hintp[43])
`define HSTMATCH_43 `SPC5.tlu.trl0.hstick3_compare

`define HINTP_REG_43 `SPC5.tlu.trl0.hintp3
`define HSTM_TAKEN_43 `SPC5.tlu.trl0.take_hst&`SPC5.tlu.trl0.trap[3]

`define NAS_PIPE_FW2_43 |`TOP.nas_top.c5.t3.complete_fw2

`define CWQ_TAKEN_43 `SPC5.tlu.trl0.take_cwq&`SPC5.tlu.trl0.trap[3]
`define SMA_TAKEN_43 `SPC5.tlu.trl0.take_sma&`SPC5.tlu.trl0.trap[3]

`define POR_TAKEN_43 `SPC5.tlu.trl0.take_por&`SPC5.tlu.trl0.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC5_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_43 || `CPU_MONDO_TAKEN_43 ||
                          `DEV_MONDO_TAKEN_43 || `RES_MONDO_TAKEN_43 ||
                          `XIR_TAKEN_43 || `INT_LEVEL_TAKEN_43 ||
                          `HSTM_TAKEN_43 || `CWQ_TAKEN_43 ||
                          `SMA_TAKEN_43 || `PMU_TAKEN_43 || `POR_TAKEN_43);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_43, `CPU_MONDO_TAKEN_43, 
           `DEV_MONDO_TAKEN_43, `RES_MONDO_TAKEN_43,
           `XIR_TAKEN_43, `INT_LEVEL_TAKEN_43,
           `HSTM_TAKEN_43, `CWQ_TAKEN_43, `SMA_TAKEN_43 ,
           `PMU_TAKEN_43, `POR_TAKEN_43})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_43;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_43 | `INT_VEC_RECV_ASIWR_43)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_43 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_43 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_43;
    end // }
    else if (`INT_VEC_RECV_ASIWR_43)
        int_vec_recv_reg <= `TOP.nas_top.c5.t3.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_43 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_43 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_43 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_43 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_43 | `INT_VEC_RECV_ASIWR_43;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_43 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_43)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_43)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_43) begin  // {
        if (softint !== `RD_SOFTINT_REG_43 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_43;
    end // }
    
    if ((`NAS_PIPE_FW2_43 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_43&(softint !== `RD_SOFTINT_REG_43)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC5.tlu.asi_wr_clear_softint[3] |
             `SPC5.tlu.asi_wr_set_softint[3] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_43});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_43});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_43 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_43;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_43 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_43 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_43;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_43;
    hstmatch_late <= `HSTMATCH_43;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c5t4 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 5;
    assign   mytid = 4;
    assign   mytnum = 5*8 + 4;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC5_GCLK) ;
    @(posedge `BENCH_SPC5_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_44 `SPC5.tlu.cth.int_rec4
`define INT_VEC_RECV_ASIWR_44 (`TOP.nas_top.c5.t4.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_44 (`TOP.nas_top.c5.t4.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_44 `SPC5.tlu.trl1.take_ivt&`SPC5.tlu.trl1.trap[0]

`define CPU_MONDO_TAKEN_44 `SPC5.tlu.trl1.take_mqr&`SPC5.tlu.trl1.trap[0]
`define DEV_MONDO_TAKEN_44 `SPC5.tlu.trl1.take_dqr&`SPC5.tlu.trl1.trap[0]
`define RES_MONDO_TAKEN_44 `SPC5.tlu.trl1.take_rqr&`SPC5.tlu.trl1.trap[0]

`define XIR_TAKEN_44 `SPC5.tlu.trl1.take_xir&`SPC5.tlu.trl1.trap[0]

`define SOFTINT_RDWR_44 (`TOP.nas_top.c5.t4.asi_rdwr_softint|`TOP.nas_top.c5.t4.asi_wr_softint_delay)

`define SOFTINT_REG_44 `SPC5.tlu.trl1.softint0
`define RD_SOFTINT_REG_44 `SPC5.tlu.trl1.rd_softint0
`define INT_LEVEL_TAKEN_44 `SPC5.tlu.trl1.take_iln&`SPC5.tlu.trl1.trap[0]
`define INT_LEVEL_NUM_44 `SPC5.tlu.trl1.int_level_n
`define PMU_TAKEN_44 `SPC5.tlu.trl1.take_pmu&`SPC5.tlu.trl1.trap[0]

`define HINTP_RDWR_44 (`TOP.nas_top.c5.t4.asi_rdwr_hintp | `TOP.nas_top.c5.t4.asi_wr_hintp_delay)
`define HINTP_WR_44 (`SPC5.tlu.asi_wr_hintp[44])
`define HSTMATCH_44 `SPC5.tlu.trl1.hstick0_compare

`define HINTP_REG_44 `SPC5.tlu.trl1.hintp0
`define HSTM_TAKEN_44 `SPC5.tlu.trl1.take_hst&`SPC5.tlu.trl1.trap[0]

`define NAS_PIPE_FW2_44 |`TOP.nas_top.c5.t4.complete_fw2

`define CWQ_TAKEN_44 `SPC5.tlu.trl1.take_cwq&`SPC5.tlu.trl1.trap[0]
`define SMA_TAKEN_44 `SPC5.tlu.trl1.take_sma&`SPC5.tlu.trl1.trap[0]

`define POR_TAKEN_44 `SPC5.tlu.trl1.take_por&`SPC5.tlu.trl1.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC5_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_44 || `CPU_MONDO_TAKEN_44 ||
                          `DEV_MONDO_TAKEN_44 || `RES_MONDO_TAKEN_44 ||
                          `XIR_TAKEN_44 || `INT_LEVEL_TAKEN_44 ||
                          `HSTM_TAKEN_44 || `CWQ_TAKEN_44 ||
                          `SMA_TAKEN_44 || `PMU_TAKEN_44 || `POR_TAKEN_44);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_44, `CPU_MONDO_TAKEN_44, 
           `DEV_MONDO_TAKEN_44, `RES_MONDO_TAKEN_44,
           `XIR_TAKEN_44, `INT_LEVEL_TAKEN_44,
           `HSTM_TAKEN_44, `CWQ_TAKEN_44, `SMA_TAKEN_44 ,
           `PMU_TAKEN_44, `POR_TAKEN_44})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_44;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_44 | `INT_VEC_RECV_ASIWR_44)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_44 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_44 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_44;
    end // }
    else if (`INT_VEC_RECV_ASIWR_44)
        int_vec_recv_reg <= `TOP.nas_top.c5.t4.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_44 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_44 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_44 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_44 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_44 | `INT_VEC_RECV_ASIWR_44;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_44 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_44)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_44)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_44) begin  // {
        if (softint !== `RD_SOFTINT_REG_44 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_44;
    end // }
    
    if ((`NAS_PIPE_FW2_44 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_44&(softint !== `RD_SOFTINT_REG_44)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC5.tlu.asi_wr_clear_softint[4] |
             `SPC5.tlu.asi_wr_set_softint[4] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_44});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_44});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_44 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_44;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_44 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_44 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_44;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_44;
    hstmatch_late <= `HSTMATCH_44;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c5t5 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 5;
    assign   mytid = 5;
    assign   mytnum = 5*8 + 5;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC5_GCLK) ;
    @(posedge `BENCH_SPC5_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_45 `SPC5.tlu.cth.int_rec5
`define INT_VEC_RECV_ASIWR_45 (`TOP.nas_top.c5.t5.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_45 (`TOP.nas_top.c5.t5.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_45 `SPC5.tlu.trl1.take_ivt&`SPC5.tlu.trl1.trap[1]

`define CPU_MONDO_TAKEN_45 `SPC5.tlu.trl1.take_mqr&`SPC5.tlu.trl1.trap[1]
`define DEV_MONDO_TAKEN_45 `SPC5.tlu.trl1.take_dqr&`SPC5.tlu.trl1.trap[1]
`define RES_MONDO_TAKEN_45 `SPC5.tlu.trl1.take_rqr&`SPC5.tlu.trl1.trap[1]

`define XIR_TAKEN_45 `SPC5.tlu.trl1.take_xir&`SPC5.tlu.trl1.trap[1]

`define SOFTINT_RDWR_45 (`TOP.nas_top.c5.t5.asi_rdwr_softint|`TOP.nas_top.c5.t5.asi_wr_softint_delay)

`define SOFTINT_REG_45 `SPC5.tlu.trl1.softint1
`define RD_SOFTINT_REG_45 `SPC5.tlu.trl1.rd_softint1
`define INT_LEVEL_TAKEN_45 `SPC5.tlu.trl1.take_iln&`SPC5.tlu.trl1.trap[1]
`define INT_LEVEL_NUM_45 `SPC5.tlu.trl1.int_level_n
`define PMU_TAKEN_45 `SPC5.tlu.trl1.take_pmu&`SPC5.tlu.trl1.trap[1]

`define HINTP_RDWR_45 (`TOP.nas_top.c5.t5.asi_rdwr_hintp | `TOP.nas_top.c5.t5.asi_wr_hintp_delay)
`define HINTP_WR_45 (`SPC5.tlu.asi_wr_hintp[45])
`define HSTMATCH_45 `SPC5.tlu.trl1.hstick1_compare

`define HINTP_REG_45 `SPC5.tlu.trl1.hintp1
`define HSTM_TAKEN_45 `SPC5.tlu.trl1.take_hst&`SPC5.tlu.trl1.trap[1]

`define NAS_PIPE_FW2_45 |`TOP.nas_top.c5.t5.complete_fw2

`define CWQ_TAKEN_45 `SPC5.tlu.trl1.take_cwq&`SPC5.tlu.trl1.trap[1]
`define SMA_TAKEN_45 `SPC5.tlu.trl1.take_sma&`SPC5.tlu.trl1.trap[1]

`define POR_TAKEN_45 `SPC5.tlu.trl1.take_por&`SPC5.tlu.trl1.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC5_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_45 || `CPU_MONDO_TAKEN_45 ||
                          `DEV_MONDO_TAKEN_45 || `RES_MONDO_TAKEN_45 ||
                          `XIR_TAKEN_45 || `INT_LEVEL_TAKEN_45 ||
                          `HSTM_TAKEN_45 || `CWQ_TAKEN_45 ||
                          `SMA_TAKEN_45 || `PMU_TAKEN_45 || `POR_TAKEN_45);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_45, `CPU_MONDO_TAKEN_45, 
           `DEV_MONDO_TAKEN_45, `RES_MONDO_TAKEN_45,
           `XIR_TAKEN_45, `INT_LEVEL_TAKEN_45,
           `HSTM_TAKEN_45, `CWQ_TAKEN_45, `SMA_TAKEN_45 ,
           `PMU_TAKEN_45, `POR_TAKEN_45})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_45;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_45 | `INT_VEC_RECV_ASIWR_45)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_45 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_45 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_45;
    end // }
    else if (`INT_VEC_RECV_ASIWR_45)
        int_vec_recv_reg <= `TOP.nas_top.c5.t5.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_45 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_45 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_45 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_45 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_45 | `INT_VEC_RECV_ASIWR_45;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_45 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_45)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_45)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_45) begin  // {
        if (softint !== `RD_SOFTINT_REG_45 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_45;
    end // }
    
    if ((`NAS_PIPE_FW2_45 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_45&(softint !== `RD_SOFTINT_REG_45)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC5.tlu.asi_wr_clear_softint[5] |
             `SPC5.tlu.asi_wr_set_softint[5] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_45});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_45});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_45 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_45;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_45 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_45 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_45;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_45;
    hstmatch_late <= `HSTMATCH_45;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c5t6 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 5;
    assign   mytid = 6;
    assign   mytnum = 5*8 + 6;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC5_GCLK) ;
    @(posedge `BENCH_SPC5_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_46 `SPC5.tlu.cth.int_rec6
`define INT_VEC_RECV_ASIWR_46 (`TOP.nas_top.c5.t6.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_46 (`TOP.nas_top.c5.t6.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_46 `SPC5.tlu.trl1.take_ivt&`SPC5.tlu.trl1.trap[2]

`define CPU_MONDO_TAKEN_46 `SPC5.tlu.trl1.take_mqr&`SPC5.tlu.trl1.trap[2]
`define DEV_MONDO_TAKEN_46 `SPC5.tlu.trl1.take_dqr&`SPC5.tlu.trl1.trap[2]
`define RES_MONDO_TAKEN_46 `SPC5.tlu.trl1.take_rqr&`SPC5.tlu.trl1.trap[2]

`define XIR_TAKEN_46 `SPC5.tlu.trl1.take_xir&`SPC5.tlu.trl1.trap[2]

`define SOFTINT_RDWR_46 (`TOP.nas_top.c5.t6.asi_rdwr_softint|`TOP.nas_top.c5.t6.asi_wr_softint_delay)

`define SOFTINT_REG_46 `SPC5.tlu.trl1.softint2
`define RD_SOFTINT_REG_46 `SPC5.tlu.trl1.rd_softint2
`define INT_LEVEL_TAKEN_46 `SPC5.tlu.trl1.take_iln&`SPC5.tlu.trl1.trap[2]
`define INT_LEVEL_NUM_46 `SPC5.tlu.trl1.int_level_n
`define PMU_TAKEN_46 `SPC5.tlu.trl1.take_pmu&`SPC5.tlu.trl1.trap[2]

`define HINTP_RDWR_46 (`TOP.nas_top.c5.t6.asi_rdwr_hintp | `TOP.nas_top.c5.t6.asi_wr_hintp_delay)
`define HINTP_WR_46 (`SPC5.tlu.asi_wr_hintp[46])
`define HSTMATCH_46 `SPC5.tlu.trl1.hstick2_compare

`define HINTP_REG_46 `SPC5.tlu.trl1.hintp2
`define HSTM_TAKEN_46 `SPC5.tlu.trl1.take_hst&`SPC5.tlu.trl1.trap[2]

`define NAS_PIPE_FW2_46 |`TOP.nas_top.c5.t6.complete_fw2

`define CWQ_TAKEN_46 `SPC5.tlu.trl1.take_cwq&`SPC5.tlu.trl1.trap[2]
`define SMA_TAKEN_46 `SPC5.tlu.trl1.take_sma&`SPC5.tlu.trl1.trap[2]

`define POR_TAKEN_46 `SPC5.tlu.trl1.take_por&`SPC5.tlu.trl1.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC5_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_46 || `CPU_MONDO_TAKEN_46 ||
                          `DEV_MONDO_TAKEN_46 || `RES_MONDO_TAKEN_46 ||
                          `XIR_TAKEN_46 || `INT_LEVEL_TAKEN_46 ||
                          `HSTM_TAKEN_46 || `CWQ_TAKEN_46 ||
                          `SMA_TAKEN_46 || `PMU_TAKEN_46 || `POR_TAKEN_46);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_46, `CPU_MONDO_TAKEN_46, 
           `DEV_MONDO_TAKEN_46, `RES_MONDO_TAKEN_46,
           `XIR_TAKEN_46, `INT_LEVEL_TAKEN_46,
           `HSTM_TAKEN_46, `CWQ_TAKEN_46, `SMA_TAKEN_46 ,
           `PMU_TAKEN_46, `POR_TAKEN_46})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_46;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_46 | `INT_VEC_RECV_ASIWR_46)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_46 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_46 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_46;
    end // }
    else if (`INT_VEC_RECV_ASIWR_46)
        int_vec_recv_reg <= `TOP.nas_top.c5.t6.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_46 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_46 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_46 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_46 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_46 | `INT_VEC_RECV_ASIWR_46;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_46 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_46)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_46)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_46) begin  // {
        if (softint !== `RD_SOFTINT_REG_46 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_46;
    end // }
    
    if ((`NAS_PIPE_FW2_46 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_46&(softint !== `RD_SOFTINT_REG_46)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC5.tlu.asi_wr_clear_softint[6] |
             `SPC5.tlu.asi_wr_set_softint[6] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_46});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_46});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_46 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_46;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_46 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_46 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_46;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_46;
    hstmatch_late <= `HSTMATCH_46;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c5t7 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 5;
    assign   mytid = 7;
    assign   mytnum = 5*8 + 7;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC5_GCLK) ;
    @(posedge `BENCH_SPC5_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_47 `SPC5.tlu.cth.int_rec7
`define INT_VEC_RECV_ASIWR_47 (`TOP.nas_top.c5.t7.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_47 (`TOP.nas_top.c5.t7.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_47 `SPC5.tlu.trl1.take_ivt&`SPC5.tlu.trl1.trap[3]

`define CPU_MONDO_TAKEN_47 `SPC5.tlu.trl1.take_mqr&`SPC5.tlu.trl1.trap[3]
`define DEV_MONDO_TAKEN_47 `SPC5.tlu.trl1.take_dqr&`SPC5.tlu.trl1.trap[3]
`define RES_MONDO_TAKEN_47 `SPC5.tlu.trl1.take_rqr&`SPC5.tlu.trl1.trap[3]

`define XIR_TAKEN_47 `SPC5.tlu.trl1.take_xir&`SPC5.tlu.trl1.trap[3]

`define SOFTINT_RDWR_47 (`TOP.nas_top.c5.t7.asi_rdwr_softint|`TOP.nas_top.c5.t7.asi_wr_softint_delay)

`define SOFTINT_REG_47 `SPC5.tlu.trl1.softint3
`define RD_SOFTINT_REG_47 `SPC5.tlu.trl1.rd_softint3
`define INT_LEVEL_TAKEN_47 `SPC5.tlu.trl1.take_iln&`SPC5.tlu.trl1.trap[3]
`define INT_LEVEL_NUM_47 `SPC5.tlu.trl1.int_level_n
`define PMU_TAKEN_47 `SPC5.tlu.trl1.take_pmu&`SPC5.tlu.trl1.trap[3]

`define HINTP_RDWR_47 (`TOP.nas_top.c5.t7.asi_rdwr_hintp | `TOP.nas_top.c5.t7.asi_wr_hintp_delay)
`define HINTP_WR_47 (`SPC5.tlu.asi_wr_hintp[47])
`define HSTMATCH_47 `SPC5.tlu.trl1.hstick3_compare

`define HINTP_REG_47 `SPC5.tlu.trl1.hintp3
`define HSTM_TAKEN_47 `SPC5.tlu.trl1.take_hst&`SPC5.tlu.trl1.trap[3]

`define NAS_PIPE_FW2_47 |`TOP.nas_top.c5.t7.complete_fw2

`define CWQ_TAKEN_47 `SPC5.tlu.trl1.take_cwq&`SPC5.tlu.trl1.trap[3]
`define SMA_TAKEN_47 `SPC5.tlu.trl1.take_sma&`SPC5.tlu.trl1.trap[3]

`define POR_TAKEN_47 `SPC5.tlu.trl1.take_por&`SPC5.tlu.trl1.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC5_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_47 || `CPU_MONDO_TAKEN_47 ||
                          `DEV_MONDO_TAKEN_47 || `RES_MONDO_TAKEN_47 ||
                          `XIR_TAKEN_47 || `INT_LEVEL_TAKEN_47 ||
                          `HSTM_TAKEN_47 || `CWQ_TAKEN_47 ||
                          `SMA_TAKEN_47 || `PMU_TAKEN_47 || `POR_TAKEN_47);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_47, `CPU_MONDO_TAKEN_47, 
           `DEV_MONDO_TAKEN_47, `RES_MONDO_TAKEN_47,
           `XIR_TAKEN_47, `INT_LEVEL_TAKEN_47,
           `HSTM_TAKEN_47, `CWQ_TAKEN_47, `SMA_TAKEN_47 ,
           `PMU_TAKEN_47, `POR_TAKEN_47})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_47;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_47 | `INT_VEC_RECV_ASIWR_47)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_47 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_47 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_47;
    end // }
    else if (`INT_VEC_RECV_ASIWR_47)
        int_vec_recv_reg <= `TOP.nas_top.c5.t7.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_47 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_47 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_47 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_47 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_47 | `INT_VEC_RECV_ASIWR_47;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_47 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_47)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_47)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_47) begin  // {
        if (softint !== `RD_SOFTINT_REG_47 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_47;
    end // }
    
    if ((`NAS_PIPE_FW2_47 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_47&(softint !== `RD_SOFTINT_REG_47)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC5.tlu.asi_wr_clear_softint[7] |
             `SPC5.tlu.asi_wr_set_softint[7] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_47});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_47});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_47 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_47;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_47 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_47 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_47;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_47;
    hstmatch_late <= `HSTMATCH_47;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

`endif
`ifdef CORE_6

// }}}

module int_c6t0 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 6;
    assign   mytid = 0;
    assign   mytnum = 6*8 + 0;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC6_GCLK) ;
    @(posedge `BENCH_SPC6_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_48 `SPC6.tlu.cth.int_rec0
`define INT_VEC_RECV_ASIWR_48 (`TOP.nas_top.c6.t0.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_48 (`TOP.nas_top.c6.t0.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_48 `SPC6.tlu.trl0.take_ivt&`SPC6.tlu.trl0.trap[0]

`define CPU_MONDO_TAKEN_48 `SPC6.tlu.trl0.take_mqr&`SPC6.tlu.trl0.trap[0]
`define DEV_MONDO_TAKEN_48 `SPC6.tlu.trl0.take_dqr&`SPC6.tlu.trl0.trap[0]
`define RES_MONDO_TAKEN_48 `SPC6.tlu.trl0.take_rqr&`SPC6.tlu.trl0.trap[0]

`define XIR_TAKEN_48 `SPC6.tlu.trl0.take_xir&`SPC6.tlu.trl0.trap[0]

`define SOFTINT_RDWR_48 (`TOP.nas_top.c6.t0.asi_rdwr_softint|`TOP.nas_top.c6.t0.asi_wr_softint_delay)

`define SOFTINT_REG_48 `SPC6.tlu.trl0.softint0
`define RD_SOFTINT_REG_48 `SPC6.tlu.trl0.rd_softint0
`define INT_LEVEL_TAKEN_48 `SPC6.tlu.trl0.take_iln&`SPC6.tlu.trl0.trap[0]
`define INT_LEVEL_NUM_48 `SPC6.tlu.trl0.int_level_n
`define PMU_TAKEN_48 `SPC6.tlu.trl0.take_pmu&`SPC6.tlu.trl0.trap[0]

`define HINTP_RDWR_48 (`TOP.nas_top.c6.t0.asi_rdwr_hintp | `TOP.nas_top.c6.t0.asi_wr_hintp_delay)
`define HINTP_WR_48 (`SPC6.tlu.asi_wr_hintp[48])
`define HSTMATCH_48 `SPC6.tlu.trl0.hstick0_compare

`define HINTP_REG_48 `SPC6.tlu.trl0.hintp0
`define HSTM_TAKEN_48 `SPC6.tlu.trl0.take_hst&`SPC6.tlu.trl0.trap[0]

`define NAS_PIPE_FW2_48 |`TOP.nas_top.c6.t0.complete_fw2

`define CWQ_TAKEN_48 `SPC6.tlu.trl0.take_cwq&`SPC6.tlu.trl0.trap[0]
`define SMA_TAKEN_48 `SPC6.tlu.trl0.take_sma&`SPC6.tlu.trl0.trap[0]

`define POR_TAKEN_48 `SPC6.tlu.trl0.take_por&`SPC6.tlu.trl0.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC6_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_48 || `CPU_MONDO_TAKEN_48 ||
                          `DEV_MONDO_TAKEN_48 || `RES_MONDO_TAKEN_48 ||
                          `XIR_TAKEN_48 || `INT_LEVEL_TAKEN_48 ||
                          `HSTM_TAKEN_48 || `CWQ_TAKEN_48 ||
                          `SMA_TAKEN_48 || `PMU_TAKEN_48 || `POR_TAKEN_48);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_48, `CPU_MONDO_TAKEN_48, 
           `DEV_MONDO_TAKEN_48, `RES_MONDO_TAKEN_48,
           `XIR_TAKEN_48, `INT_LEVEL_TAKEN_48,
           `HSTM_TAKEN_48, `CWQ_TAKEN_48, `SMA_TAKEN_48 ,
           `PMU_TAKEN_48, `POR_TAKEN_48})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_48;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_48 | `INT_VEC_RECV_ASIWR_48)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_48 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_48 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_48;
    end // }
    else if (`INT_VEC_RECV_ASIWR_48)
        int_vec_recv_reg <= `TOP.nas_top.c6.t0.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_48 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_48 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_48 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_48 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_48 | `INT_VEC_RECV_ASIWR_48;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_48 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_48)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_48)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_48) begin  // {
        if (softint !== `RD_SOFTINT_REG_48 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_48;
    end // }
    
    if ((`NAS_PIPE_FW2_48 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_48&(softint !== `RD_SOFTINT_REG_48)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC6.tlu.asi_wr_clear_softint[0] |
             `SPC6.tlu.asi_wr_set_softint[0] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_48});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_48});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_48 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_48;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_48 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_48 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_48;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_48;
    hstmatch_late <= `HSTMATCH_48;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c6t1 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 6;
    assign   mytid = 1;
    assign   mytnum = 6*8 + 1;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC6_GCLK) ;
    @(posedge `BENCH_SPC6_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_49 `SPC6.tlu.cth.int_rec1
`define INT_VEC_RECV_ASIWR_49 (`TOP.nas_top.c6.t1.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_49 (`TOP.nas_top.c6.t1.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_49 `SPC6.tlu.trl0.take_ivt&`SPC6.tlu.trl0.trap[1]

`define CPU_MONDO_TAKEN_49 `SPC6.tlu.trl0.take_mqr&`SPC6.tlu.trl0.trap[1]
`define DEV_MONDO_TAKEN_49 `SPC6.tlu.trl0.take_dqr&`SPC6.tlu.trl0.trap[1]
`define RES_MONDO_TAKEN_49 `SPC6.tlu.trl0.take_rqr&`SPC6.tlu.trl0.trap[1]

`define XIR_TAKEN_49 `SPC6.tlu.trl0.take_xir&`SPC6.tlu.trl0.trap[1]

`define SOFTINT_RDWR_49 (`TOP.nas_top.c6.t1.asi_rdwr_softint|`TOP.nas_top.c6.t1.asi_wr_softint_delay)

`define SOFTINT_REG_49 `SPC6.tlu.trl0.softint1
`define RD_SOFTINT_REG_49 `SPC6.tlu.trl0.rd_softint1
`define INT_LEVEL_TAKEN_49 `SPC6.tlu.trl0.take_iln&`SPC6.tlu.trl0.trap[1]
`define INT_LEVEL_NUM_49 `SPC6.tlu.trl0.int_level_n
`define PMU_TAKEN_49 `SPC6.tlu.trl0.take_pmu&`SPC6.tlu.trl0.trap[1]

`define HINTP_RDWR_49 (`TOP.nas_top.c6.t1.asi_rdwr_hintp | `TOP.nas_top.c6.t1.asi_wr_hintp_delay)
`define HINTP_WR_49 (`SPC6.tlu.asi_wr_hintp[49])
`define HSTMATCH_49 `SPC6.tlu.trl0.hstick1_compare

`define HINTP_REG_49 `SPC6.tlu.trl0.hintp1
`define HSTM_TAKEN_49 `SPC6.tlu.trl0.take_hst&`SPC6.tlu.trl0.trap[1]

`define NAS_PIPE_FW2_49 |`TOP.nas_top.c6.t1.complete_fw2

`define CWQ_TAKEN_49 `SPC6.tlu.trl0.take_cwq&`SPC6.tlu.trl0.trap[1]
`define SMA_TAKEN_49 `SPC6.tlu.trl0.take_sma&`SPC6.tlu.trl0.trap[1]

`define POR_TAKEN_49 `SPC6.tlu.trl0.take_por&`SPC6.tlu.trl0.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC6_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_49 || `CPU_MONDO_TAKEN_49 ||
                          `DEV_MONDO_TAKEN_49 || `RES_MONDO_TAKEN_49 ||
                          `XIR_TAKEN_49 || `INT_LEVEL_TAKEN_49 ||
                          `HSTM_TAKEN_49 || `CWQ_TAKEN_49 ||
                          `SMA_TAKEN_49 || `PMU_TAKEN_49 || `POR_TAKEN_49);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_49, `CPU_MONDO_TAKEN_49, 
           `DEV_MONDO_TAKEN_49, `RES_MONDO_TAKEN_49,
           `XIR_TAKEN_49, `INT_LEVEL_TAKEN_49,
           `HSTM_TAKEN_49, `CWQ_TAKEN_49, `SMA_TAKEN_49 ,
           `PMU_TAKEN_49, `POR_TAKEN_49})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_49;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_49 | `INT_VEC_RECV_ASIWR_49)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_49 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_49 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_49;
    end // }
    else if (`INT_VEC_RECV_ASIWR_49)
        int_vec_recv_reg <= `TOP.nas_top.c6.t1.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_49 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_49 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_49 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_49 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_49 | `INT_VEC_RECV_ASIWR_49;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_49 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_49)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_49)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_49) begin  // {
        if (softint !== `RD_SOFTINT_REG_49 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_49;
    end // }
    
    if ((`NAS_PIPE_FW2_49 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_49&(softint !== `RD_SOFTINT_REG_49)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC6.tlu.asi_wr_clear_softint[1] |
             `SPC6.tlu.asi_wr_set_softint[1] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_49});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_49});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_49 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_49;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_49 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_49 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_49;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_49;
    hstmatch_late <= `HSTMATCH_49;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c6t2 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 6;
    assign   mytid = 2;
    assign   mytnum = 6*8 + 2;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC6_GCLK) ;
    @(posedge `BENCH_SPC6_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_50 `SPC6.tlu.cth.int_rec2
`define INT_VEC_RECV_ASIWR_50 (`TOP.nas_top.c6.t2.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_50 (`TOP.nas_top.c6.t2.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_50 `SPC6.tlu.trl0.take_ivt&`SPC6.tlu.trl0.trap[2]

`define CPU_MONDO_TAKEN_50 `SPC6.tlu.trl0.take_mqr&`SPC6.tlu.trl0.trap[2]
`define DEV_MONDO_TAKEN_50 `SPC6.tlu.trl0.take_dqr&`SPC6.tlu.trl0.trap[2]
`define RES_MONDO_TAKEN_50 `SPC6.tlu.trl0.take_rqr&`SPC6.tlu.trl0.trap[2]

`define XIR_TAKEN_50 `SPC6.tlu.trl0.take_xir&`SPC6.tlu.trl0.trap[2]

`define SOFTINT_RDWR_50 (`TOP.nas_top.c6.t2.asi_rdwr_softint|`TOP.nas_top.c6.t2.asi_wr_softint_delay)

`define SOFTINT_REG_50 `SPC6.tlu.trl0.softint2
`define RD_SOFTINT_REG_50 `SPC6.tlu.trl0.rd_softint2
`define INT_LEVEL_TAKEN_50 `SPC6.tlu.trl0.take_iln&`SPC6.tlu.trl0.trap[2]
`define INT_LEVEL_NUM_50 `SPC6.tlu.trl0.int_level_n
`define PMU_TAKEN_50 `SPC6.tlu.trl0.take_pmu&`SPC6.tlu.trl0.trap[2]

`define HINTP_RDWR_50 (`TOP.nas_top.c6.t2.asi_rdwr_hintp | `TOP.nas_top.c6.t2.asi_wr_hintp_delay)
`define HINTP_WR_50 (`SPC6.tlu.asi_wr_hintp[50])
`define HSTMATCH_50 `SPC6.tlu.trl0.hstick2_compare

`define HINTP_REG_50 `SPC6.tlu.trl0.hintp2
`define HSTM_TAKEN_50 `SPC6.tlu.trl0.take_hst&`SPC6.tlu.trl0.trap[2]

`define NAS_PIPE_FW2_50 |`TOP.nas_top.c6.t2.complete_fw2

`define CWQ_TAKEN_50 `SPC6.tlu.trl0.take_cwq&`SPC6.tlu.trl0.trap[2]
`define SMA_TAKEN_50 `SPC6.tlu.trl0.take_sma&`SPC6.tlu.trl0.trap[2]

`define POR_TAKEN_50 `SPC6.tlu.trl0.take_por&`SPC6.tlu.trl0.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC6_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_50 || `CPU_MONDO_TAKEN_50 ||
                          `DEV_MONDO_TAKEN_50 || `RES_MONDO_TAKEN_50 ||
                          `XIR_TAKEN_50 || `INT_LEVEL_TAKEN_50 ||
                          `HSTM_TAKEN_50 || `CWQ_TAKEN_50 ||
                          `SMA_TAKEN_50 || `PMU_TAKEN_50 || `POR_TAKEN_50);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_50, `CPU_MONDO_TAKEN_50, 
           `DEV_MONDO_TAKEN_50, `RES_MONDO_TAKEN_50,
           `XIR_TAKEN_50, `INT_LEVEL_TAKEN_50,
           `HSTM_TAKEN_50, `CWQ_TAKEN_50, `SMA_TAKEN_50 ,
           `PMU_TAKEN_50, `POR_TAKEN_50})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_50;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_50 | `INT_VEC_RECV_ASIWR_50)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_50 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_50 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_50;
    end // }
    else if (`INT_VEC_RECV_ASIWR_50)
        int_vec_recv_reg <= `TOP.nas_top.c6.t2.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_50 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_50 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_50 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_50 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_50 | `INT_VEC_RECV_ASIWR_50;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_50 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_50)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_50)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_50) begin  // {
        if (softint !== `RD_SOFTINT_REG_50 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_50;
    end // }
    
    if ((`NAS_PIPE_FW2_50 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_50&(softint !== `RD_SOFTINT_REG_50)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC6.tlu.asi_wr_clear_softint[2] |
             `SPC6.tlu.asi_wr_set_softint[2] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_50});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_50});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_50 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_50;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_50 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_50 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_50;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_50;
    hstmatch_late <= `HSTMATCH_50;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c6t3 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 6;
    assign   mytid = 3;
    assign   mytnum = 6*8 + 3;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC6_GCLK) ;
    @(posedge `BENCH_SPC6_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_51 `SPC6.tlu.cth.int_rec3
`define INT_VEC_RECV_ASIWR_51 (`TOP.nas_top.c6.t3.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_51 (`TOP.nas_top.c6.t3.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_51 `SPC6.tlu.trl0.take_ivt&`SPC6.tlu.trl0.trap[3]

`define CPU_MONDO_TAKEN_51 `SPC6.tlu.trl0.take_mqr&`SPC6.tlu.trl0.trap[3]
`define DEV_MONDO_TAKEN_51 `SPC6.tlu.trl0.take_dqr&`SPC6.tlu.trl0.trap[3]
`define RES_MONDO_TAKEN_51 `SPC6.tlu.trl0.take_rqr&`SPC6.tlu.trl0.trap[3]

`define XIR_TAKEN_51 `SPC6.tlu.trl0.take_xir&`SPC6.tlu.trl0.trap[3]

`define SOFTINT_RDWR_51 (`TOP.nas_top.c6.t3.asi_rdwr_softint|`TOP.nas_top.c6.t3.asi_wr_softint_delay)

`define SOFTINT_REG_51 `SPC6.tlu.trl0.softint3
`define RD_SOFTINT_REG_51 `SPC6.tlu.trl0.rd_softint3
`define INT_LEVEL_TAKEN_51 `SPC6.tlu.trl0.take_iln&`SPC6.tlu.trl0.trap[3]
`define INT_LEVEL_NUM_51 `SPC6.tlu.trl0.int_level_n
`define PMU_TAKEN_51 `SPC6.tlu.trl0.take_pmu&`SPC6.tlu.trl0.trap[3]

`define HINTP_RDWR_51 (`TOP.nas_top.c6.t3.asi_rdwr_hintp | `TOP.nas_top.c6.t3.asi_wr_hintp_delay)
`define HINTP_WR_51 (`SPC6.tlu.asi_wr_hintp[51])
`define HSTMATCH_51 `SPC6.tlu.trl0.hstick3_compare

`define HINTP_REG_51 `SPC6.tlu.trl0.hintp3
`define HSTM_TAKEN_51 `SPC6.tlu.trl0.take_hst&`SPC6.tlu.trl0.trap[3]

`define NAS_PIPE_FW2_51 |`TOP.nas_top.c6.t3.complete_fw2

`define CWQ_TAKEN_51 `SPC6.tlu.trl0.take_cwq&`SPC6.tlu.trl0.trap[3]
`define SMA_TAKEN_51 `SPC6.tlu.trl0.take_sma&`SPC6.tlu.trl0.trap[3]

`define POR_TAKEN_51 `SPC6.tlu.trl0.take_por&`SPC6.tlu.trl0.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC6_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_51 || `CPU_MONDO_TAKEN_51 ||
                          `DEV_MONDO_TAKEN_51 || `RES_MONDO_TAKEN_51 ||
                          `XIR_TAKEN_51 || `INT_LEVEL_TAKEN_51 ||
                          `HSTM_TAKEN_51 || `CWQ_TAKEN_51 ||
                          `SMA_TAKEN_51 || `PMU_TAKEN_51 || `POR_TAKEN_51);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_51, `CPU_MONDO_TAKEN_51, 
           `DEV_MONDO_TAKEN_51, `RES_MONDO_TAKEN_51,
           `XIR_TAKEN_51, `INT_LEVEL_TAKEN_51,
           `HSTM_TAKEN_51, `CWQ_TAKEN_51, `SMA_TAKEN_51 ,
           `PMU_TAKEN_51, `POR_TAKEN_51})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_51;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_51 | `INT_VEC_RECV_ASIWR_51)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_51 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_51 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_51;
    end // }
    else if (`INT_VEC_RECV_ASIWR_51)
        int_vec_recv_reg <= `TOP.nas_top.c6.t3.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_51 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_51 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_51 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_51 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_51 | `INT_VEC_RECV_ASIWR_51;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_51 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_51)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_51)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_51) begin  // {
        if (softint !== `RD_SOFTINT_REG_51 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_51;
    end // }
    
    if ((`NAS_PIPE_FW2_51 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_51&(softint !== `RD_SOFTINT_REG_51)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC6.tlu.asi_wr_clear_softint[3] |
             `SPC6.tlu.asi_wr_set_softint[3] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_51});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_51});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_51 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_51;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_51 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_51 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_51;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_51;
    hstmatch_late <= `HSTMATCH_51;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c6t4 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 6;
    assign   mytid = 4;
    assign   mytnum = 6*8 + 4;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC6_GCLK) ;
    @(posedge `BENCH_SPC6_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_52 `SPC6.tlu.cth.int_rec4
`define INT_VEC_RECV_ASIWR_52 (`TOP.nas_top.c6.t4.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_52 (`TOP.nas_top.c6.t4.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_52 `SPC6.tlu.trl1.take_ivt&`SPC6.tlu.trl1.trap[0]

`define CPU_MONDO_TAKEN_52 `SPC6.tlu.trl1.take_mqr&`SPC6.tlu.trl1.trap[0]
`define DEV_MONDO_TAKEN_52 `SPC6.tlu.trl1.take_dqr&`SPC6.tlu.trl1.trap[0]
`define RES_MONDO_TAKEN_52 `SPC6.tlu.trl1.take_rqr&`SPC6.tlu.trl1.trap[0]

`define XIR_TAKEN_52 `SPC6.tlu.trl1.take_xir&`SPC6.tlu.trl1.trap[0]

`define SOFTINT_RDWR_52 (`TOP.nas_top.c6.t4.asi_rdwr_softint|`TOP.nas_top.c6.t4.asi_wr_softint_delay)

`define SOFTINT_REG_52 `SPC6.tlu.trl1.softint0
`define RD_SOFTINT_REG_52 `SPC6.tlu.trl1.rd_softint0
`define INT_LEVEL_TAKEN_52 `SPC6.tlu.trl1.take_iln&`SPC6.tlu.trl1.trap[0]
`define INT_LEVEL_NUM_52 `SPC6.tlu.trl1.int_level_n
`define PMU_TAKEN_52 `SPC6.tlu.trl1.take_pmu&`SPC6.tlu.trl1.trap[0]

`define HINTP_RDWR_52 (`TOP.nas_top.c6.t4.asi_rdwr_hintp | `TOP.nas_top.c6.t4.asi_wr_hintp_delay)
`define HINTP_WR_52 (`SPC6.tlu.asi_wr_hintp[52])
`define HSTMATCH_52 `SPC6.tlu.trl1.hstick0_compare

`define HINTP_REG_52 `SPC6.tlu.trl1.hintp0
`define HSTM_TAKEN_52 `SPC6.tlu.trl1.take_hst&`SPC6.tlu.trl1.trap[0]

`define NAS_PIPE_FW2_52 |`TOP.nas_top.c6.t4.complete_fw2

`define CWQ_TAKEN_52 `SPC6.tlu.trl1.take_cwq&`SPC6.tlu.trl1.trap[0]
`define SMA_TAKEN_52 `SPC6.tlu.trl1.take_sma&`SPC6.tlu.trl1.trap[0]

`define POR_TAKEN_52 `SPC6.tlu.trl1.take_por&`SPC6.tlu.trl1.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC6_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_52 || `CPU_MONDO_TAKEN_52 ||
                          `DEV_MONDO_TAKEN_52 || `RES_MONDO_TAKEN_52 ||
                          `XIR_TAKEN_52 || `INT_LEVEL_TAKEN_52 ||
                          `HSTM_TAKEN_52 || `CWQ_TAKEN_52 ||
                          `SMA_TAKEN_52 || `PMU_TAKEN_52 || `POR_TAKEN_52);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_52, `CPU_MONDO_TAKEN_52, 
           `DEV_MONDO_TAKEN_52, `RES_MONDO_TAKEN_52,
           `XIR_TAKEN_52, `INT_LEVEL_TAKEN_52,
           `HSTM_TAKEN_52, `CWQ_TAKEN_52, `SMA_TAKEN_52 ,
           `PMU_TAKEN_52, `POR_TAKEN_52})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_52;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_52 | `INT_VEC_RECV_ASIWR_52)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_52 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_52 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_52;
    end // }
    else if (`INT_VEC_RECV_ASIWR_52)
        int_vec_recv_reg <= `TOP.nas_top.c6.t4.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_52 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_52 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_52 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_52 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_52 | `INT_VEC_RECV_ASIWR_52;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_52 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_52)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_52)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_52) begin  // {
        if (softint !== `RD_SOFTINT_REG_52 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_52;
    end // }
    
    if ((`NAS_PIPE_FW2_52 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_52&(softint !== `RD_SOFTINT_REG_52)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC6.tlu.asi_wr_clear_softint[4] |
             `SPC6.tlu.asi_wr_set_softint[4] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_52});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_52});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_52 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_52;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_52 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_52 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_52;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_52;
    hstmatch_late <= `HSTMATCH_52;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c6t5 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 6;
    assign   mytid = 5;
    assign   mytnum = 6*8 + 5;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC6_GCLK) ;
    @(posedge `BENCH_SPC6_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_53 `SPC6.tlu.cth.int_rec5
`define INT_VEC_RECV_ASIWR_53 (`TOP.nas_top.c6.t5.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_53 (`TOP.nas_top.c6.t5.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_53 `SPC6.tlu.trl1.take_ivt&`SPC6.tlu.trl1.trap[1]

`define CPU_MONDO_TAKEN_53 `SPC6.tlu.trl1.take_mqr&`SPC6.tlu.trl1.trap[1]
`define DEV_MONDO_TAKEN_53 `SPC6.tlu.trl1.take_dqr&`SPC6.tlu.trl1.trap[1]
`define RES_MONDO_TAKEN_53 `SPC6.tlu.trl1.take_rqr&`SPC6.tlu.trl1.trap[1]

`define XIR_TAKEN_53 `SPC6.tlu.trl1.take_xir&`SPC6.tlu.trl1.trap[1]

`define SOFTINT_RDWR_53 (`TOP.nas_top.c6.t5.asi_rdwr_softint|`TOP.nas_top.c6.t5.asi_wr_softint_delay)

`define SOFTINT_REG_53 `SPC6.tlu.trl1.softint1
`define RD_SOFTINT_REG_53 `SPC6.tlu.trl1.rd_softint1
`define INT_LEVEL_TAKEN_53 `SPC6.tlu.trl1.take_iln&`SPC6.tlu.trl1.trap[1]
`define INT_LEVEL_NUM_53 `SPC6.tlu.trl1.int_level_n
`define PMU_TAKEN_53 `SPC6.tlu.trl1.take_pmu&`SPC6.tlu.trl1.trap[1]

`define HINTP_RDWR_53 (`TOP.nas_top.c6.t5.asi_rdwr_hintp | `TOP.nas_top.c6.t5.asi_wr_hintp_delay)
`define HINTP_WR_53 (`SPC6.tlu.asi_wr_hintp[53])
`define HSTMATCH_53 `SPC6.tlu.trl1.hstick1_compare

`define HINTP_REG_53 `SPC6.tlu.trl1.hintp1
`define HSTM_TAKEN_53 `SPC6.tlu.trl1.take_hst&`SPC6.tlu.trl1.trap[1]

`define NAS_PIPE_FW2_53 |`TOP.nas_top.c6.t5.complete_fw2

`define CWQ_TAKEN_53 `SPC6.tlu.trl1.take_cwq&`SPC6.tlu.trl1.trap[1]
`define SMA_TAKEN_53 `SPC6.tlu.trl1.take_sma&`SPC6.tlu.trl1.trap[1]

`define POR_TAKEN_53 `SPC6.tlu.trl1.take_por&`SPC6.tlu.trl1.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC6_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_53 || `CPU_MONDO_TAKEN_53 ||
                          `DEV_MONDO_TAKEN_53 || `RES_MONDO_TAKEN_53 ||
                          `XIR_TAKEN_53 || `INT_LEVEL_TAKEN_53 ||
                          `HSTM_TAKEN_53 || `CWQ_TAKEN_53 ||
                          `SMA_TAKEN_53 || `PMU_TAKEN_53 || `POR_TAKEN_53);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_53, `CPU_MONDO_TAKEN_53, 
           `DEV_MONDO_TAKEN_53, `RES_MONDO_TAKEN_53,
           `XIR_TAKEN_53, `INT_LEVEL_TAKEN_53,
           `HSTM_TAKEN_53, `CWQ_TAKEN_53, `SMA_TAKEN_53 ,
           `PMU_TAKEN_53, `POR_TAKEN_53})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_53;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_53 | `INT_VEC_RECV_ASIWR_53)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_53 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_53 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_53;
    end // }
    else if (`INT_VEC_RECV_ASIWR_53)
        int_vec_recv_reg <= `TOP.nas_top.c6.t5.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_53 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_53 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_53 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_53 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_53 | `INT_VEC_RECV_ASIWR_53;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_53 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_53)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_53)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_53) begin  // {
        if (softint !== `RD_SOFTINT_REG_53 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_53;
    end // }
    
    if ((`NAS_PIPE_FW2_53 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_53&(softint !== `RD_SOFTINT_REG_53)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC6.tlu.asi_wr_clear_softint[5] |
             `SPC6.tlu.asi_wr_set_softint[5] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_53});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_53});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_53 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_53;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_53 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_53 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_53;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_53;
    hstmatch_late <= `HSTMATCH_53;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c6t6 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 6;
    assign   mytid = 6;
    assign   mytnum = 6*8 + 6;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC6_GCLK) ;
    @(posedge `BENCH_SPC6_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_54 `SPC6.tlu.cth.int_rec6
`define INT_VEC_RECV_ASIWR_54 (`TOP.nas_top.c6.t6.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_54 (`TOP.nas_top.c6.t6.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_54 `SPC6.tlu.trl1.take_ivt&`SPC6.tlu.trl1.trap[2]

`define CPU_MONDO_TAKEN_54 `SPC6.tlu.trl1.take_mqr&`SPC6.tlu.trl1.trap[2]
`define DEV_MONDO_TAKEN_54 `SPC6.tlu.trl1.take_dqr&`SPC6.tlu.trl1.trap[2]
`define RES_MONDO_TAKEN_54 `SPC6.tlu.trl1.take_rqr&`SPC6.tlu.trl1.trap[2]

`define XIR_TAKEN_54 `SPC6.tlu.trl1.take_xir&`SPC6.tlu.trl1.trap[2]

`define SOFTINT_RDWR_54 (`TOP.nas_top.c6.t6.asi_rdwr_softint|`TOP.nas_top.c6.t6.asi_wr_softint_delay)

`define SOFTINT_REG_54 `SPC6.tlu.trl1.softint2
`define RD_SOFTINT_REG_54 `SPC6.tlu.trl1.rd_softint2
`define INT_LEVEL_TAKEN_54 `SPC6.tlu.trl1.take_iln&`SPC6.tlu.trl1.trap[2]
`define INT_LEVEL_NUM_54 `SPC6.tlu.trl1.int_level_n
`define PMU_TAKEN_54 `SPC6.tlu.trl1.take_pmu&`SPC6.tlu.trl1.trap[2]

`define HINTP_RDWR_54 (`TOP.nas_top.c6.t6.asi_rdwr_hintp | `TOP.nas_top.c6.t6.asi_wr_hintp_delay)
`define HINTP_WR_54 (`SPC6.tlu.asi_wr_hintp[54])
`define HSTMATCH_54 `SPC6.tlu.trl1.hstick2_compare

`define HINTP_REG_54 `SPC6.tlu.trl1.hintp2
`define HSTM_TAKEN_54 `SPC6.tlu.trl1.take_hst&`SPC6.tlu.trl1.trap[2]

`define NAS_PIPE_FW2_54 |`TOP.nas_top.c6.t6.complete_fw2

`define CWQ_TAKEN_54 `SPC6.tlu.trl1.take_cwq&`SPC6.tlu.trl1.trap[2]
`define SMA_TAKEN_54 `SPC6.tlu.trl1.take_sma&`SPC6.tlu.trl1.trap[2]

`define POR_TAKEN_54 `SPC6.tlu.trl1.take_por&`SPC6.tlu.trl1.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC6_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_54 || `CPU_MONDO_TAKEN_54 ||
                          `DEV_MONDO_TAKEN_54 || `RES_MONDO_TAKEN_54 ||
                          `XIR_TAKEN_54 || `INT_LEVEL_TAKEN_54 ||
                          `HSTM_TAKEN_54 || `CWQ_TAKEN_54 ||
                          `SMA_TAKEN_54 || `PMU_TAKEN_54 || `POR_TAKEN_54);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_54, `CPU_MONDO_TAKEN_54, 
           `DEV_MONDO_TAKEN_54, `RES_MONDO_TAKEN_54,
           `XIR_TAKEN_54, `INT_LEVEL_TAKEN_54,
           `HSTM_TAKEN_54, `CWQ_TAKEN_54, `SMA_TAKEN_54 ,
           `PMU_TAKEN_54, `POR_TAKEN_54})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_54;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_54 | `INT_VEC_RECV_ASIWR_54)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_54 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_54 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_54;
    end // }
    else if (`INT_VEC_RECV_ASIWR_54)
        int_vec_recv_reg <= `TOP.nas_top.c6.t6.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_54 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_54 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_54 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_54 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_54 | `INT_VEC_RECV_ASIWR_54;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_54 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_54)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_54)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_54) begin  // {
        if (softint !== `RD_SOFTINT_REG_54 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_54;
    end // }
    
    if ((`NAS_PIPE_FW2_54 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_54&(softint !== `RD_SOFTINT_REG_54)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC6.tlu.asi_wr_clear_softint[6] |
             `SPC6.tlu.asi_wr_set_softint[6] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_54});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_54});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_54 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_54;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_54 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_54 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_54;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_54;
    hstmatch_late <= `HSTMATCH_54;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c6t7 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 6;
    assign   mytid = 7;
    assign   mytnum = 6*8 + 7;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC6_GCLK) ;
    @(posedge `BENCH_SPC6_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_55 `SPC6.tlu.cth.int_rec7
`define INT_VEC_RECV_ASIWR_55 (`TOP.nas_top.c6.t7.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_55 (`TOP.nas_top.c6.t7.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_55 `SPC6.tlu.trl1.take_ivt&`SPC6.tlu.trl1.trap[3]

`define CPU_MONDO_TAKEN_55 `SPC6.tlu.trl1.take_mqr&`SPC6.tlu.trl1.trap[3]
`define DEV_MONDO_TAKEN_55 `SPC6.tlu.trl1.take_dqr&`SPC6.tlu.trl1.trap[3]
`define RES_MONDO_TAKEN_55 `SPC6.tlu.trl1.take_rqr&`SPC6.tlu.trl1.trap[3]

`define XIR_TAKEN_55 `SPC6.tlu.trl1.take_xir&`SPC6.tlu.trl1.trap[3]

`define SOFTINT_RDWR_55 (`TOP.nas_top.c6.t7.asi_rdwr_softint|`TOP.nas_top.c6.t7.asi_wr_softint_delay)

`define SOFTINT_REG_55 `SPC6.tlu.trl1.softint3
`define RD_SOFTINT_REG_55 `SPC6.tlu.trl1.rd_softint3
`define INT_LEVEL_TAKEN_55 `SPC6.tlu.trl1.take_iln&`SPC6.tlu.trl1.trap[3]
`define INT_LEVEL_NUM_55 `SPC6.tlu.trl1.int_level_n
`define PMU_TAKEN_55 `SPC6.tlu.trl1.take_pmu&`SPC6.tlu.trl1.trap[3]

`define HINTP_RDWR_55 (`TOP.nas_top.c6.t7.asi_rdwr_hintp | `TOP.nas_top.c6.t7.asi_wr_hintp_delay)
`define HINTP_WR_55 (`SPC6.tlu.asi_wr_hintp[55])
`define HSTMATCH_55 `SPC6.tlu.trl1.hstick3_compare

`define HINTP_REG_55 `SPC6.tlu.trl1.hintp3
`define HSTM_TAKEN_55 `SPC6.tlu.trl1.take_hst&`SPC6.tlu.trl1.trap[3]

`define NAS_PIPE_FW2_55 |`TOP.nas_top.c6.t7.complete_fw2

`define CWQ_TAKEN_55 `SPC6.tlu.trl1.take_cwq&`SPC6.tlu.trl1.trap[3]
`define SMA_TAKEN_55 `SPC6.tlu.trl1.take_sma&`SPC6.tlu.trl1.trap[3]

`define POR_TAKEN_55 `SPC6.tlu.trl1.take_por&`SPC6.tlu.trl1.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC6_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_55 || `CPU_MONDO_TAKEN_55 ||
                          `DEV_MONDO_TAKEN_55 || `RES_MONDO_TAKEN_55 ||
                          `XIR_TAKEN_55 || `INT_LEVEL_TAKEN_55 ||
                          `HSTM_TAKEN_55 || `CWQ_TAKEN_55 ||
                          `SMA_TAKEN_55 || `PMU_TAKEN_55 || `POR_TAKEN_55);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_55, `CPU_MONDO_TAKEN_55, 
           `DEV_MONDO_TAKEN_55, `RES_MONDO_TAKEN_55,
           `XIR_TAKEN_55, `INT_LEVEL_TAKEN_55,
           `HSTM_TAKEN_55, `CWQ_TAKEN_55, `SMA_TAKEN_55 ,
           `PMU_TAKEN_55, `POR_TAKEN_55})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_55;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_55 | `INT_VEC_RECV_ASIWR_55)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_55 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_55 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_55;
    end // }
    else if (`INT_VEC_RECV_ASIWR_55)
        int_vec_recv_reg <= `TOP.nas_top.c6.t7.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_55 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_55 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_55 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_55 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_55 | `INT_VEC_RECV_ASIWR_55;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_55 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_55)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_55)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_55) begin  // {
        if (softint !== `RD_SOFTINT_REG_55 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_55;
    end // }
    
    if ((`NAS_PIPE_FW2_55 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_55&(softint !== `RD_SOFTINT_REG_55)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC6.tlu.asi_wr_clear_softint[7] |
             `SPC6.tlu.asi_wr_set_softint[7] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_55});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_55});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_55 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_55;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_55 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_55 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_55;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_55;
    hstmatch_late <= `HSTMATCH_55;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

`endif
`ifdef CORE_7

// }}}

module int_c7t0 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 7;
    assign   mytid = 0;
    assign   mytnum = 7*8 + 0;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC7_GCLK) ;
    @(posedge `BENCH_SPC7_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_56 `SPC7.tlu.cth.int_rec0
`define INT_VEC_RECV_ASIWR_56 (`TOP.nas_top.c7.t0.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_56 (`TOP.nas_top.c7.t0.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_56 `SPC7.tlu.trl0.take_ivt&`SPC7.tlu.trl0.trap[0]

`define CPU_MONDO_TAKEN_56 `SPC7.tlu.trl0.take_mqr&`SPC7.tlu.trl0.trap[0]
`define DEV_MONDO_TAKEN_56 `SPC7.tlu.trl0.take_dqr&`SPC7.tlu.trl0.trap[0]
`define RES_MONDO_TAKEN_56 `SPC7.tlu.trl0.take_rqr&`SPC7.tlu.trl0.trap[0]

`define XIR_TAKEN_56 `SPC7.tlu.trl0.take_xir&`SPC7.tlu.trl0.trap[0]

`define SOFTINT_RDWR_56 (`TOP.nas_top.c7.t0.asi_rdwr_softint|`TOP.nas_top.c7.t0.asi_wr_softint_delay)

`define SOFTINT_REG_56 `SPC7.tlu.trl0.softint0
`define RD_SOFTINT_REG_56 `SPC7.tlu.trl0.rd_softint0
`define INT_LEVEL_TAKEN_56 `SPC7.tlu.trl0.take_iln&`SPC7.tlu.trl0.trap[0]
`define INT_LEVEL_NUM_56 `SPC7.tlu.trl0.int_level_n
`define PMU_TAKEN_56 `SPC7.tlu.trl0.take_pmu&`SPC7.tlu.trl0.trap[0]

`define HINTP_RDWR_56 (`TOP.nas_top.c7.t0.asi_rdwr_hintp | `TOP.nas_top.c7.t0.asi_wr_hintp_delay)
`define HINTP_WR_56 (`SPC7.tlu.asi_wr_hintp[56])
`define HSTMATCH_56 `SPC7.tlu.trl0.hstick0_compare

`define HINTP_REG_56 `SPC7.tlu.trl0.hintp0
`define HSTM_TAKEN_56 `SPC7.tlu.trl0.take_hst&`SPC7.tlu.trl0.trap[0]

`define NAS_PIPE_FW2_56 |`TOP.nas_top.c7.t0.complete_fw2

`define CWQ_TAKEN_56 `SPC7.tlu.trl0.take_cwq&`SPC7.tlu.trl0.trap[0]
`define SMA_TAKEN_56 `SPC7.tlu.trl0.take_sma&`SPC7.tlu.trl0.trap[0]

`define POR_TAKEN_56 `SPC7.tlu.trl0.take_por&`SPC7.tlu.trl0.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC7_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_56 || `CPU_MONDO_TAKEN_56 ||
                          `DEV_MONDO_TAKEN_56 || `RES_MONDO_TAKEN_56 ||
                          `XIR_TAKEN_56 || `INT_LEVEL_TAKEN_56 ||
                          `HSTM_TAKEN_56 || `CWQ_TAKEN_56 ||
                          `SMA_TAKEN_56 || `PMU_TAKEN_56 || `POR_TAKEN_56);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_56, `CPU_MONDO_TAKEN_56, 
           `DEV_MONDO_TAKEN_56, `RES_MONDO_TAKEN_56,
           `XIR_TAKEN_56, `INT_LEVEL_TAKEN_56,
           `HSTM_TAKEN_56, `CWQ_TAKEN_56, `SMA_TAKEN_56 ,
           `PMU_TAKEN_56, `POR_TAKEN_56})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_56;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_56 | `INT_VEC_RECV_ASIWR_56)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_56 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_56 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_56;
    end // }
    else if (`INT_VEC_RECV_ASIWR_56)
        int_vec_recv_reg <= `TOP.nas_top.c7.t0.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_56 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_56 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_56 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_56 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_56 | `INT_VEC_RECV_ASIWR_56;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_56 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_56)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_56)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_56) begin  // {
        if (softint !== `RD_SOFTINT_REG_56 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_56;
    end // }
    
    if ((`NAS_PIPE_FW2_56 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_56&(softint !== `RD_SOFTINT_REG_56)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC7.tlu.asi_wr_clear_softint[0] |
             `SPC7.tlu.asi_wr_set_softint[0] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_56});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_56});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_56 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_56;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_56 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_56 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_56;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_56;
    hstmatch_late <= `HSTMATCH_56;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c7t1 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 7;
    assign   mytid = 1;
    assign   mytnum = 7*8 + 1;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC7_GCLK) ;
    @(posedge `BENCH_SPC7_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_57 `SPC7.tlu.cth.int_rec1
`define INT_VEC_RECV_ASIWR_57 (`TOP.nas_top.c7.t1.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_57 (`TOP.nas_top.c7.t1.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_57 `SPC7.tlu.trl0.take_ivt&`SPC7.tlu.trl0.trap[1]

`define CPU_MONDO_TAKEN_57 `SPC7.tlu.trl0.take_mqr&`SPC7.tlu.trl0.trap[1]
`define DEV_MONDO_TAKEN_57 `SPC7.tlu.trl0.take_dqr&`SPC7.tlu.trl0.trap[1]
`define RES_MONDO_TAKEN_57 `SPC7.tlu.trl0.take_rqr&`SPC7.tlu.trl0.trap[1]

`define XIR_TAKEN_57 `SPC7.tlu.trl0.take_xir&`SPC7.tlu.trl0.trap[1]

`define SOFTINT_RDWR_57 (`TOP.nas_top.c7.t1.asi_rdwr_softint|`TOP.nas_top.c7.t1.asi_wr_softint_delay)

`define SOFTINT_REG_57 `SPC7.tlu.trl0.softint1
`define RD_SOFTINT_REG_57 `SPC7.tlu.trl0.rd_softint1
`define INT_LEVEL_TAKEN_57 `SPC7.tlu.trl0.take_iln&`SPC7.tlu.trl0.trap[1]
`define INT_LEVEL_NUM_57 `SPC7.tlu.trl0.int_level_n
`define PMU_TAKEN_57 `SPC7.tlu.trl0.take_pmu&`SPC7.tlu.trl0.trap[1]

`define HINTP_RDWR_57 (`TOP.nas_top.c7.t1.asi_rdwr_hintp | `TOP.nas_top.c7.t1.asi_wr_hintp_delay)
`define HINTP_WR_57 (`SPC7.tlu.asi_wr_hintp[57])
`define HSTMATCH_57 `SPC7.tlu.trl0.hstick1_compare

`define HINTP_REG_57 `SPC7.tlu.trl0.hintp1
`define HSTM_TAKEN_57 `SPC7.tlu.trl0.take_hst&`SPC7.tlu.trl0.trap[1]

`define NAS_PIPE_FW2_57 |`TOP.nas_top.c7.t1.complete_fw2

`define CWQ_TAKEN_57 `SPC7.tlu.trl0.take_cwq&`SPC7.tlu.trl0.trap[1]
`define SMA_TAKEN_57 `SPC7.tlu.trl0.take_sma&`SPC7.tlu.trl0.trap[1]

`define POR_TAKEN_57 `SPC7.tlu.trl0.take_por&`SPC7.tlu.trl0.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC7_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_57 || `CPU_MONDO_TAKEN_57 ||
                          `DEV_MONDO_TAKEN_57 || `RES_MONDO_TAKEN_57 ||
                          `XIR_TAKEN_57 || `INT_LEVEL_TAKEN_57 ||
                          `HSTM_TAKEN_57 || `CWQ_TAKEN_57 ||
                          `SMA_TAKEN_57 || `PMU_TAKEN_57 || `POR_TAKEN_57);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_57, `CPU_MONDO_TAKEN_57, 
           `DEV_MONDO_TAKEN_57, `RES_MONDO_TAKEN_57,
           `XIR_TAKEN_57, `INT_LEVEL_TAKEN_57,
           `HSTM_TAKEN_57, `CWQ_TAKEN_57, `SMA_TAKEN_57 ,
           `PMU_TAKEN_57, `POR_TAKEN_57})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_57;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_57 | `INT_VEC_RECV_ASIWR_57)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_57 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_57 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_57;
    end // }
    else if (`INT_VEC_RECV_ASIWR_57)
        int_vec_recv_reg <= `TOP.nas_top.c7.t1.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_57 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_57 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_57 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_57 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_57 | `INT_VEC_RECV_ASIWR_57;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_57 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_57)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_57)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_57) begin  // {
        if (softint !== `RD_SOFTINT_REG_57 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_57;
    end // }
    
    if ((`NAS_PIPE_FW2_57 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_57&(softint !== `RD_SOFTINT_REG_57)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC7.tlu.asi_wr_clear_softint[1] |
             `SPC7.tlu.asi_wr_set_softint[1] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_57});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_57});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_57 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_57;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_57 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_57 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_57;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_57;
    hstmatch_late <= `HSTMATCH_57;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c7t2 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 7;
    assign   mytid = 2;
    assign   mytnum = 7*8 + 2;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC7_GCLK) ;
    @(posedge `BENCH_SPC7_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_58 `SPC7.tlu.cth.int_rec2
`define INT_VEC_RECV_ASIWR_58 (`TOP.nas_top.c7.t2.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_58 (`TOP.nas_top.c7.t2.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_58 `SPC7.tlu.trl0.take_ivt&`SPC7.tlu.trl0.trap[2]

`define CPU_MONDO_TAKEN_58 `SPC7.tlu.trl0.take_mqr&`SPC7.tlu.trl0.trap[2]
`define DEV_MONDO_TAKEN_58 `SPC7.tlu.trl0.take_dqr&`SPC7.tlu.trl0.trap[2]
`define RES_MONDO_TAKEN_58 `SPC7.tlu.trl0.take_rqr&`SPC7.tlu.trl0.trap[2]

`define XIR_TAKEN_58 `SPC7.tlu.trl0.take_xir&`SPC7.tlu.trl0.trap[2]

`define SOFTINT_RDWR_58 (`TOP.nas_top.c7.t2.asi_rdwr_softint|`TOP.nas_top.c7.t2.asi_wr_softint_delay)

`define SOFTINT_REG_58 `SPC7.tlu.trl0.softint2
`define RD_SOFTINT_REG_58 `SPC7.tlu.trl0.rd_softint2
`define INT_LEVEL_TAKEN_58 `SPC7.tlu.trl0.take_iln&`SPC7.tlu.trl0.trap[2]
`define INT_LEVEL_NUM_58 `SPC7.tlu.trl0.int_level_n
`define PMU_TAKEN_58 `SPC7.tlu.trl0.take_pmu&`SPC7.tlu.trl0.trap[2]

`define HINTP_RDWR_58 (`TOP.nas_top.c7.t2.asi_rdwr_hintp | `TOP.nas_top.c7.t2.asi_wr_hintp_delay)
`define HINTP_WR_58 (`SPC7.tlu.asi_wr_hintp[58])
`define HSTMATCH_58 `SPC7.tlu.trl0.hstick2_compare

`define HINTP_REG_58 `SPC7.tlu.trl0.hintp2
`define HSTM_TAKEN_58 `SPC7.tlu.trl0.take_hst&`SPC7.tlu.trl0.trap[2]

`define NAS_PIPE_FW2_58 |`TOP.nas_top.c7.t2.complete_fw2

`define CWQ_TAKEN_58 `SPC7.tlu.trl0.take_cwq&`SPC7.tlu.trl0.trap[2]
`define SMA_TAKEN_58 `SPC7.tlu.trl0.take_sma&`SPC7.tlu.trl0.trap[2]

`define POR_TAKEN_58 `SPC7.tlu.trl0.take_por&`SPC7.tlu.trl0.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC7_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_58 || `CPU_MONDO_TAKEN_58 ||
                          `DEV_MONDO_TAKEN_58 || `RES_MONDO_TAKEN_58 ||
                          `XIR_TAKEN_58 || `INT_LEVEL_TAKEN_58 ||
                          `HSTM_TAKEN_58 || `CWQ_TAKEN_58 ||
                          `SMA_TAKEN_58 || `PMU_TAKEN_58 || `POR_TAKEN_58);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_58, `CPU_MONDO_TAKEN_58, 
           `DEV_MONDO_TAKEN_58, `RES_MONDO_TAKEN_58,
           `XIR_TAKEN_58, `INT_LEVEL_TAKEN_58,
           `HSTM_TAKEN_58, `CWQ_TAKEN_58, `SMA_TAKEN_58 ,
           `PMU_TAKEN_58, `POR_TAKEN_58})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_58;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_58 | `INT_VEC_RECV_ASIWR_58)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_58 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_58 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_58;
    end // }
    else if (`INT_VEC_RECV_ASIWR_58)
        int_vec_recv_reg <= `TOP.nas_top.c7.t2.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_58 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_58 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_58 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_58 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_58 | `INT_VEC_RECV_ASIWR_58;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_58 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_58)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_58)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_58) begin  // {
        if (softint !== `RD_SOFTINT_REG_58 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_58;
    end // }
    
    if ((`NAS_PIPE_FW2_58 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_58&(softint !== `RD_SOFTINT_REG_58)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC7.tlu.asi_wr_clear_softint[2] |
             `SPC7.tlu.asi_wr_set_softint[2] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_58});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_58});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_58 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_58;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_58 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_58 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_58;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_58;
    hstmatch_late <= `HSTMATCH_58;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c7t3 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 7;
    assign   mytid = 3;
    assign   mytnum = 7*8 + 3;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC7_GCLK) ;
    @(posedge `BENCH_SPC7_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_59 `SPC7.tlu.cth.int_rec3
`define INT_VEC_RECV_ASIWR_59 (`TOP.nas_top.c7.t3.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_59 (`TOP.nas_top.c7.t3.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_59 `SPC7.tlu.trl0.take_ivt&`SPC7.tlu.trl0.trap[3]

`define CPU_MONDO_TAKEN_59 `SPC7.tlu.trl0.take_mqr&`SPC7.tlu.trl0.trap[3]
`define DEV_MONDO_TAKEN_59 `SPC7.tlu.trl0.take_dqr&`SPC7.tlu.trl0.trap[3]
`define RES_MONDO_TAKEN_59 `SPC7.tlu.trl0.take_rqr&`SPC7.tlu.trl0.trap[3]

`define XIR_TAKEN_59 `SPC7.tlu.trl0.take_xir&`SPC7.tlu.trl0.trap[3]

`define SOFTINT_RDWR_59 (`TOP.nas_top.c7.t3.asi_rdwr_softint|`TOP.nas_top.c7.t3.asi_wr_softint_delay)

`define SOFTINT_REG_59 `SPC7.tlu.trl0.softint3
`define RD_SOFTINT_REG_59 `SPC7.tlu.trl0.rd_softint3
`define INT_LEVEL_TAKEN_59 `SPC7.tlu.trl0.take_iln&`SPC7.tlu.trl0.trap[3]
`define INT_LEVEL_NUM_59 `SPC7.tlu.trl0.int_level_n
`define PMU_TAKEN_59 `SPC7.tlu.trl0.take_pmu&`SPC7.tlu.trl0.trap[3]

`define HINTP_RDWR_59 (`TOP.nas_top.c7.t3.asi_rdwr_hintp | `TOP.nas_top.c7.t3.asi_wr_hintp_delay)
`define HINTP_WR_59 (`SPC7.tlu.asi_wr_hintp[59])
`define HSTMATCH_59 `SPC7.tlu.trl0.hstick3_compare

`define HINTP_REG_59 `SPC7.tlu.trl0.hintp3
`define HSTM_TAKEN_59 `SPC7.tlu.trl0.take_hst&`SPC7.tlu.trl0.trap[3]

`define NAS_PIPE_FW2_59 |`TOP.nas_top.c7.t3.complete_fw2

`define CWQ_TAKEN_59 `SPC7.tlu.trl0.take_cwq&`SPC7.tlu.trl0.trap[3]
`define SMA_TAKEN_59 `SPC7.tlu.trl0.take_sma&`SPC7.tlu.trl0.trap[3]

`define POR_TAKEN_59 `SPC7.tlu.trl0.take_por&`SPC7.tlu.trl0.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC7_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_59 || `CPU_MONDO_TAKEN_59 ||
                          `DEV_MONDO_TAKEN_59 || `RES_MONDO_TAKEN_59 ||
                          `XIR_TAKEN_59 || `INT_LEVEL_TAKEN_59 ||
                          `HSTM_TAKEN_59 || `CWQ_TAKEN_59 ||
                          `SMA_TAKEN_59 || `PMU_TAKEN_59 || `POR_TAKEN_59);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_59, `CPU_MONDO_TAKEN_59, 
           `DEV_MONDO_TAKEN_59, `RES_MONDO_TAKEN_59,
           `XIR_TAKEN_59, `INT_LEVEL_TAKEN_59,
           `HSTM_TAKEN_59, `CWQ_TAKEN_59, `SMA_TAKEN_59 ,
           `PMU_TAKEN_59, `POR_TAKEN_59})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_59;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_59 | `INT_VEC_RECV_ASIWR_59)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_59 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_59 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_59;
    end // }
    else if (`INT_VEC_RECV_ASIWR_59)
        int_vec_recv_reg <= `TOP.nas_top.c7.t3.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_59 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_59 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_59 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_59 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_59 | `INT_VEC_RECV_ASIWR_59;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_59 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_59)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_59)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_59) begin  // {
        if (softint !== `RD_SOFTINT_REG_59 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_59;
    end // }
    
    if ((`NAS_PIPE_FW2_59 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_59&(softint !== `RD_SOFTINT_REG_59)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC7.tlu.asi_wr_clear_softint[3] |
             `SPC7.tlu.asi_wr_set_softint[3] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_59});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_59});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_59 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_59;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_59 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_59 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_59;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_59;
    hstmatch_late <= `HSTMATCH_59;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c7t4 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 7;
    assign   mytid = 4;
    assign   mytnum = 7*8 + 4;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC7_GCLK) ;
    @(posedge `BENCH_SPC7_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_60 `SPC7.tlu.cth.int_rec4
`define INT_VEC_RECV_ASIWR_60 (`TOP.nas_top.c7.t4.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_60 (`TOP.nas_top.c7.t4.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_60 `SPC7.tlu.trl1.take_ivt&`SPC7.tlu.trl1.trap[0]

`define CPU_MONDO_TAKEN_60 `SPC7.tlu.trl1.take_mqr&`SPC7.tlu.trl1.trap[0]
`define DEV_MONDO_TAKEN_60 `SPC7.tlu.trl1.take_dqr&`SPC7.tlu.trl1.trap[0]
`define RES_MONDO_TAKEN_60 `SPC7.tlu.trl1.take_rqr&`SPC7.tlu.trl1.trap[0]

`define XIR_TAKEN_60 `SPC7.tlu.trl1.take_xir&`SPC7.tlu.trl1.trap[0]

`define SOFTINT_RDWR_60 (`TOP.nas_top.c7.t4.asi_rdwr_softint|`TOP.nas_top.c7.t4.asi_wr_softint_delay)

`define SOFTINT_REG_60 `SPC7.tlu.trl1.softint0
`define RD_SOFTINT_REG_60 `SPC7.tlu.trl1.rd_softint0
`define INT_LEVEL_TAKEN_60 `SPC7.tlu.trl1.take_iln&`SPC7.tlu.trl1.trap[0]
`define INT_LEVEL_NUM_60 `SPC7.tlu.trl1.int_level_n
`define PMU_TAKEN_60 `SPC7.tlu.trl1.take_pmu&`SPC7.tlu.trl1.trap[0]

`define HINTP_RDWR_60 (`TOP.nas_top.c7.t4.asi_rdwr_hintp | `TOP.nas_top.c7.t4.asi_wr_hintp_delay)
`define HINTP_WR_60 (`SPC7.tlu.asi_wr_hintp[60])
`define HSTMATCH_60 `SPC7.tlu.trl1.hstick0_compare

`define HINTP_REG_60 `SPC7.tlu.trl1.hintp0
`define HSTM_TAKEN_60 `SPC7.tlu.trl1.take_hst&`SPC7.tlu.trl1.trap[0]

`define NAS_PIPE_FW2_60 |`TOP.nas_top.c7.t4.complete_fw2

`define CWQ_TAKEN_60 `SPC7.tlu.trl1.take_cwq&`SPC7.tlu.trl1.trap[0]
`define SMA_TAKEN_60 `SPC7.tlu.trl1.take_sma&`SPC7.tlu.trl1.trap[0]

`define POR_TAKEN_60 `SPC7.tlu.trl1.take_por&`SPC7.tlu.trl1.trap[0]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC7_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_60 || `CPU_MONDO_TAKEN_60 ||
                          `DEV_MONDO_TAKEN_60 || `RES_MONDO_TAKEN_60 ||
                          `XIR_TAKEN_60 || `INT_LEVEL_TAKEN_60 ||
                          `HSTM_TAKEN_60 || `CWQ_TAKEN_60 ||
                          `SMA_TAKEN_60 || `PMU_TAKEN_60 || `POR_TAKEN_60);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_60, `CPU_MONDO_TAKEN_60, 
           `DEV_MONDO_TAKEN_60, `RES_MONDO_TAKEN_60,
           `XIR_TAKEN_60, `INT_LEVEL_TAKEN_60,
           `HSTM_TAKEN_60, `CWQ_TAKEN_60, `SMA_TAKEN_60 ,
           `PMU_TAKEN_60, `POR_TAKEN_60})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_60;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_60 | `INT_VEC_RECV_ASIWR_60)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_60 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_60 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_60;
    end // }
    else if (`INT_VEC_RECV_ASIWR_60)
        int_vec_recv_reg <= `TOP.nas_top.c7.t4.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_60 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_60 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_60 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_60 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_60 | `INT_VEC_RECV_ASIWR_60;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_60 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_60)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_60)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_60) begin  // {
        if (softint !== `RD_SOFTINT_REG_60 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_60;
    end // }
    
    if ((`NAS_PIPE_FW2_60 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_60&(softint !== `RD_SOFTINT_REG_60)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC7.tlu.asi_wr_clear_softint[4] |
             `SPC7.tlu.asi_wr_set_softint[4] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_60});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_60});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_60 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_60;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_60 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_60 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_60;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_60;
    hstmatch_late <= `HSTMATCH_60;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c7t5 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 7;
    assign   mytid = 5;
    assign   mytnum = 7*8 + 5;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC7_GCLK) ;
    @(posedge `BENCH_SPC7_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_61 `SPC7.tlu.cth.int_rec5
`define INT_VEC_RECV_ASIWR_61 (`TOP.nas_top.c7.t5.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_61 (`TOP.nas_top.c7.t5.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_61 `SPC7.tlu.trl1.take_ivt&`SPC7.tlu.trl1.trap[1]

`define CPU_MONDO_TAKEN_61 `SPC7.tlu.trl1.take_mqr&`SPC7.tlu.trl1.trap[1]
`define DEV_MONDO_TAKEN_61 `SPC7.tlu.trl1.take_dqr&`SPC7.tlu.trl1.trap[1]
`define RES_MONDO_TAKEN_61 `SPC7.tlu.trl1.take_rqr&`SPC7.tlu.trl1.trap[1]

`define XIR_TAKEN_61 `SPC7.tlu.trl1.take_xir&`SPC7.tlu.trl1.trap[1]

`define SOFTINT_RDWR_61 (`TOP.nas_top.c7.t5.asi_rdwr_softint|`TOP.nas_top.c7.t5.asi_wr_softint_delay)

`define SOFTINT_REG_61 `SPC7.tlu.trl1.softint1
`define RD_SOFTINT_REG_61 `SPC7.tlu.trl1.rd_softint1
`define INT_LEVEL_TAKEN_61 `SPC7.tlu.trl1.take_iln&`SPC7.tlu.trl1.trap[1]
`define INT_LEVEL_NUM_61 `SPC7.tlu.trl1.int_level_n
`define PMU_TAKEN_61 `SPC7.tlu.trl1.take_pmu&`SPC7.tlu.trl1.trap[1]

`define HINTP_RDWR_61 (`TOP.nas_top.c7.t5.asi_rdwr_hintp | `TOP.nas_top.c7.t5.asi_wr_hintp_delay)
`define HINTP_WR_61 (`SPC7.tlu.asi_wr_hintp[61])
`define HSTMATCH_61 `SPC7.tlu.trl1.hstick1_compare

`define HINTP_REG_61 `SPC7.tlu.trl1.hintp1
`define HSTM_TAKEN_61 `SPC7.tlu.trl1.take_hst&`SPC7.tlu.trl1.trap[1]

`define NAS_PIPE_FW2_61 |`TOP.nas_top.c7.t5.complete_fw2

`define CWQ_TAKEN_61 `SPC7.tlu.trl1.take_cwq&`SPC7.tlu.trl1.trap[1]
`define SMA_TAKEN_61 `SPC7.tlu.trl1.take_sma&`SPC7.tlu.trl1.trap[1]

`define POR_TAKEN_61 `SPC7.tlu.trl1.take_por&`SPC7.tlu.trl1.trap[1]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC7_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_61 || `CPU_MONDO_TAKEN_61 ||
                          `DEV_MONDO_TAKEN_61 || `RES_MONDO_TAKEN_61 ||
                          `XIR_TAKEN_61 || `INT_LEVEL_TAKEN_61 ||
                          `HSTM_TAKEN_61 || `CWQ_TAKEN_61 ||
                          `SMA_TAKEN_61 || `PMU_TAKEN_61 || `POR_TAKEN_61);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_61, `CPU_MONDO_TAKEN_61, 
           `DEV_MONDO_TAKEN_61, `RES_MONDO_TAKEN_61,
           `XIR_TAKEN_61, `INT_LEVEL_TAKEN_61,
           `HSTM_TAKEN_61, `CWQ_TAKEN_61, `SMA_TAKEN_61 ,
           `PMU_TAKEN_61, `POR_TAKEN_61})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_61;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_61 | `INT_VEC_RECV_ASIWR_61)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_61 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_61 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_61;
    end // }
    else if (`INT_VEC_RECV_ASIWR_61)
        int_vec_recv_reg <= `TOP.nas_top.c7.t5.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_61 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_61 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_61 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_61 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_61 | `INT_VEC_RECV_ASIWR_61;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_61 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_61)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_61)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_61) begin  // {
        if (softint !== `RD_SOFTINT_REG_61 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_61;
    end // }
    
    if ((`NAS_PIPE_FW2_61 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_61&(softint !== `RD_SOFTINT_REG_61)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC7.tlu.asi_wr_clear_softint[5] |
             `SPC7.tlu.asi_wr_set_softint[5] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_61});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_61});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_61 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_61;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_61 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_61 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_61;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_61;
    hstmatch_late <= `HSTMATCH_61;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c7t6 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 7;
    assign   mytid = 6;
    assign   mytnum = 7*8 + 6;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC7_GCLK) ;
    @(posedge `BENCH_SPC7_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_62 `SPC7.tlu.cth.int_rec6
`define INT_VEC_RECV_ASIWR_62 (`TOP.nas_top.c7.t6.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_62 (`TOP.nas_top.c7.t6.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_62 `SPC7.tlu.trl1.take_ivt&`SPC7.tlu.trl1.trap[2]

`define CPU_MONDO_TAKEN_62 `SPC7.tlu.trl1.take_mqr&`SPC7.tlu.trl1.trap[2]
`define DEV_MONDO_TAKEN_62 `SPC7.tlu.trl1.take_dqr&`SPC7.tlu.trl1.trap[2]
`define RES_MONDO_TAKEN_62 `SPC7.tlu.trl1.take_rqr&`SPC7.tlu.trl1.trap[2]

`define XIR_TAKEN_62 `SPC7.tlu.trl1.take_xir&`SPC7.tlu.trl1.trap[2]

`define SOFTINT_RDWR_62 (`TOP.nas_top.c7.t6.asi_rdwr_softint|`TOP.nas_top.c7.t6.asi_wr_softint_delay)

`define SOFTINT_REG_62 `SPC7.tlu.trl1.softint2
`define RD_SOFTINT_REG_62 `SPC7.tlu.trl1.rd_softint2
`define INT_LEVEL_TAKEN_62 `SPC7.tlu.trl1.take_iln&`SPC7.tlu.trl1.trap[2]
`define INT_LEVEL_NUM_62 `SPC7.tlu.trl1.int_level_n
`define PMU_TAKEN_62 `SPC7.tlu.trl1.take_pmu&`SPC7.tlu.trl1.trap[2]

`define HINTP_RDWR_62 (`TOP.nas_top.c7.t6.asi_rdwr_hintp | `TOP.nas_top.c7.t6.asi_wr_hintp_delay)
`define HINTP_WR_62 (`SPC7.tlu.asi_wr_hintp[62])
`define HSTMATCH_62 `SPC7.tlu.trl1.hstick2_compare

`define HINTP_REG_62 `SPC7.tlu.trl1.hintp2
`define HSTM_TAKEN_62 `SPC7.tlu.trl1.take_hst&`SPC7.tlu.trl1.trap[2]

`define NAS_PIPE_FW2_62 |`TOP.nas_top.c7.t6.complete_fw2

`define CWQ_TAKEN_62 `SPC7.tlu.trl1.take_cwq&`SPC7.tlu.trl1.trap[2]
`define SMA_TAKEN_62 `SPC7.tlu.trl1.take_sma&`SPC7.tlu.trl1.trap[2]

`define POR_TAKEN_62 `SPC7.tlu.trl1.take_por&`SPC7.tlu.trl1.trap[2]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC7_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_62 || `CPU_MONDO_TAKEN_62 ||
                          `DEV_MONDO_TAKEN_62 || `RES_MONDO_TAKEN_62 ||
                          `XIR_TAKEN_62 || `INT_LEVEL_TAKEN_62 ||
                          `HSTM_TAKEN_62 || `CWQ_TAKEN_62 ||
                          `SMA_TAKEN_62 || `PMU_TAKEN_62 || `POR_TAKEN_62);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_62, `CPU_MONDO_TAKEN_62, 
           `DEV_MONDO_TAKEN_62, `RES_MONDO_TAKEN_62,
           `XIR_TAKEN_62, `INT_LEVEL_TAKEN_62,
           `HSTM_TAKEN_62, `CWQ_TAKEN_62, `SMA_TAKEN_62 ,
           `PMU_TAKEN_62, `POR_TAKEN_62})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_62;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_62 | `INT_VEC_RECV_ASIWR_62)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_62 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_62 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_62;
    end // }
    else if (`INT_VEC_RECV_ASIWR_62)
        int_vec_recv_reg <= `TOP.nas_top.c7.t6.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_62 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_62 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_62 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_62 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_62 | `INT_VEC_RECV_ASIWR_62;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_62 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_62)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_62)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_62) begin  // {
        if (softint !== `RD_SOFTINT_REG_62 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_62;
    end // }
    
    if ((`NAS_PIPE_FW2_62 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_62&(softint !== `RD_SOFTINT_REG_62)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC7.tlu.asi_wr_clear_softint[6] |
             `SPC7.tlu.asi_wr_set_softint[6] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_62});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_62});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_62 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_62;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_62 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_62 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_62;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_62;
    hstmatch_late <= `HSTMATCH_62;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

// }}}

module int_c7t7 ();
`ifndef GATESIM

// common defines
`include "defines.vh"
`include "ccx.vri"
`include "cmp.vri"

wire [2:0] mycid;
wire [2:0] mytid;
wire [5:0] mytnum;
integer junk;

reg [63:0] int_vec_recv_reg;
reg        int_vec_recv_reg_delta;
reg        int_vec_reg_rdwr;
reg        inc_vec_reg_rd;
reg        int_vec_reg_rdwr_late;
reg [16:0] softint;
reg        softint_rdwr;
reg        softint_rdwr_late;
reg        softint_delta;
reg        hintp;
reg        hintp_rdwr;
reg        hintp_rdwr_late;
reg        hintp_delta;
reg        hstmatch_late;
reg        ready;
reg [7:0]  int_num_w;
reg [7:0]  int_num_fx4;
reg [7:0]  int_num_fx5;
reg [7:0]  int_num_fb;
reg [7:0]  int_num_fw;
reg [7:0]  int_num_fw1;
reg [7:0]  int_num_fw2;
reg        take_disrupting_w;
reg        take_disrupting_fx4;
reg        take_disrupting_fx5;
reg        take_disrupting_fb;
reg        take_disrupting_fw;
reg        take_disrupting_fw1;
reg        take_disrupting_fw2;

    assign   mycid = 7;
    assign   mytid = 7;
    assign   mytnum = 7*8 + 7;

initial begin // {
    ready = 0;      // Wait for socket setup ..
    inc_vec_reg_rd <= 1'b0;
    int_vec_recv_reg_delta <= 1'b0;
    softint_delta <= 1'b0;
    hintp_delta <= 1'b0;
    int_vec_recv_reg = 64'b0;
    @(posedge `BENCH_SPC7_GCLK) ;
    @(posedge `BENCH_SPC7_GCLK) ;
    ready = `PARGS.int_sync_on;
end //}


/////////////////////////////// Probes //////////////////////////////////// {{{

`define INT_VEC_RECV_REG_63 `SPC7.tlu.cth.int_rec7
`define INT_VEC_RECV_ASIWR_63 (`TOP.nas_top.c7.t7.asi_wr_int_rec_delay)
`define INT_VEC_RDWR_63 (`TOP.nas_top.c7.t7.asi_rdwr_int_rec)
`define INT_VEC_TAKEN_63 `SPC7.tlu.trl1.take_ivt&`SPC7.tlu.trl1.trap[3]

`define CPU_MONDO_TAKEN_63 `SPC7.tlu.trl1.take_mqr&`SPC7.tlu.trl1.trap[3]
`define DEV_MONDO_TAKEN_63 `SPC7.tlu.trl1.take_dqr&`SPC7.tlu.trl1.trap[3]
`define RES_MONDO_TAKEN_63 `SPC7.tlu.trl1.take_rqr&`SPC7.tlu.trl1.trap[3]

`define XIR_TAKEN_63 `SPC7.tlu.trl1.take_xir&`SPC7.tlu.trl1.trap[3]

`define SOFTINT_RDWR_63 (`TOP.nas_top.c7.t7.asi_rdwr_softint|`TOP.nas_top.c7.t7.asi_wr_softint_delay)

`define SOFTINT_REG_63 `SPC7.tlu.trl1.softint3
`define RD_SOFTINT_REG_63 `SPC7.tlu.trl1.rd_softint3
`define INT_LEVEL_TAKEN_63 `SPC7.tlu.trl1.take_iln&`SPC7.tlu.trl1.trap[3]
`define INT_LEVEL_NUM_63 `SPC7.tlu.trl1.int_level_n
`define PMU_TAKEN_63 `SPC7.tlu.trl1.take_pmu&`SPC7.tlu.trl1.trap[3]

`define HINTP_RDWR_63 (`TOP.nas_top.c7.t7.asi_rdwr_hintp | `TOP.nas_top.c7.t7.asi_wr_hintp_delay)
`define HINTP_WR_63 (`SPC7.tlu.asi_wr_hintp[63])
`define HSTMATCH_63 `SPC7.tlu.trl1.hstick3_compare

`define HINTP_REG_63 `SPC7.tlu.trl1.hintp3
`define HSTM_TAKEN_63 `SPC7.tlu.trl1.take_hst&`SPC7.tlu.trl1.trap[3]

`define NAS_PIPE_FW2_63 |`TOP.nas_top.c7.t7.complete_fw2

`define CWQ_TAKEN_63 `SPC7.tlu.trl1.take_cwq&`SPC7.tlu.trl1.trap[3]
`define SMA_TAKEN_63 `SPC7.tlu.trl1.take_sma&`SPC7.tlu.trl1.trap[3]

`define POR_TAKEN_63 `SPC7.tlu.trl1.take_por&`SPC7.tlu.trl1.trap[3]

/////////////////////////////// Probes //////////////////////////////////// }}}

always @(negedge (`BENCH_SPC7_GCLK & ready)) begin // {

    // {{{ DETECT, PIPE & SEND
    take_disrupting_w <= (`INT_VEC_TAKEN_63 || `CPU_MONDO_TAKEN_63 ||
                          `DEV_MONDO_TAKEN_63 || `RES_MONDO_TAKEN_63 ||
                          `XIR_TAKEN_63 || `INT_LEVEL_TAKEN_63 ||
                          `HSTM_TAKEN_63 || `CWQ_TAKEN_63 ||
                          `SMA_TAKEN_63 || `PMU_TAKEN_63 || `POR_TAKEN_63);
    take_disrupting_fx4 <= take_disrupting_w;
    take_disrupting_fx5 <= take_disrupting_fx4;
    take_disrupting_fb <= take_disrupting_fx5;
    take_disrupting_fw <= take_disrupting_fb;
    take_disrupting_fw1 <= take_disrupting_fw;
    take_disrupting_fw2 <= take_disrupting_fw1;

    case ({`INT_VEC_TAKEN_63, `CPU_MONDO_TAKEN_63, 
           `DEV_MONDO_TAKEN_63, `RES_MONDO_TAKEN_63,
           `XIR_TAKEN_63, `INT_LEVEL_TAKEN_63,
           `HSTM_TAKEN_63, `CWQ_TAKEN_63, `SMA_TAKEN_63 ,
           `PMU_TAKEN_63, `POR_TAKEN_63})
        11'b10000000000: int_num_w <= 8'h60;
        11'b01000000000: int_num_w <= 8'h7c;
        11'b00100000000: int_num_w <= 8'h7d;
        11'b00010000000: int_num_w <= 8'h7e;
        11'b00001000000: int_num_w <= 8'h03;
        11'b00000100000: int_num_w <= 8'h40 + `INT_LEVEL_NUM_63;
        11'b00000010000: int_num_w <= 8'h5e;
        11'b00000001000: int_num_w <= 8'h3c;
        11'b00000000100: int_num_w <= 8'h3d;
        11'b00000000010: int_num_w <= 8'h4f;
        11'b00000000001: int_num_w <= 8'h01;
    endcase

    int_num_fx4 <= int_num_w;
    int_num_fx5 <= int_num_fx4;
    int_num_fb <= int_num_fx5;
    int_num_fw <= int_num_fb;
    int_num_fw1 <= int_num_fw;
    int_num_fw2 <= int_num_fw1;
    if (`PARGS.nas_check_on && `PARGS.int_sync_on && take_disrupting_fw2) 
    begin // {
        `PR_INFO ("pli_int", `INFO, 
                  "C%0d T%0d PLI_INT_INTP 0x%h", mycid,mytid, int_num_fw2);
        junk = $sim_send(`PLI_INT_INTP, mytnum, int_num_fw2);
    end // }

    // }}}

/////////////////////////// Vectored Interrupt /////////////////////////// {{{

  // Vectored Interrupt Recv Register Detection
  // Indicate when register changes due to arriving interrupt, and not 
  // due to read of incoming register or ASI write ..


  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..


    if (!(`INT_VEC_RDWR_63 | `INT_VEC_RECV_ASIWR_63)) begin  // {
        if (~`INT_VEC_RECV_ASIWR_63 & 
             (int_vec_recv_reg !== `INT_VEC_RECV_REG_63 ))
            int_vec_recv_reg_delta <= 1'b1;
        int_vec_recv_reg <= `INT_VEC_RECV_REG_63;
    end // }
    else if (`INT_VEC_RECV_ASIWR_63)
        int_vec_recv_reg <= `TOP.nas_top.c7.t7.asi_updated_int_rec;
    
    if ((`NAS_PIPE_FW2_63 & int_vec_recv_reg_delta ) | 
            int_vec_reg_rdwr_late & ~inc_vec_reg_rd |
            `INT_VEC_RECV_ASIWR_63 ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASI_WRITE ASI=0x72 VA=0x0 val=0x%h",
                      mycid,mytid, int_vec_recv_reg);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, mytnum ,8'h72,
                               64'h0, int_vec_recv_reg);
        end // }
        if (!(~int_vec_reg_rdwr & (~`INT_VEC_RECV_ASIWR_63 &
                     (int_vec_recv_reg !== `INT_VEC_RECV_REG_63 ))))
            int_vec_recv_reg_delta <= 1'b0;
    end //}

    int_vec_reg_rdwr <= `INT_VEC_RDWR_63 | `INT_VEC_RECV_ASIWR_63;
    int_vec_reg_rdwr_late <= int_vec_reg_rdwr & ~`INT_VEC_RDWR_63 & ~ inc_vec_reg_rd;

    if (`INT_VEC_RECV_ASIWR_63)
        inc_vec_reg_rd <= 1'b1;
    if (`NAS_PIPE_FW2_63)
         inc_vec_reg_rd <= 1'b0;

    
/////////////////////////// Vectored Interrupt /////////////////////////// }}}

/////////////////////////// Asynchronous Resets ////////////////////////// {{{

  
/////////////////////////// Asynchronous Resets ////////////////////////// }}}

///////////////////////////  Softint ///////////////////////////////////// {{{

  // Softint Register hardware Update Detection

  // Non software updates (TM/SM)

  // If any read occurs, send value right away.
  // While a read/write is pending, do not update delta.
  // Send non read/wr delta during fw2 ..

  // RTL keeps pic_ovf indication in rd_softint and not softint.
  // So for set/clear writes, we send softint before the write .., 
  // and for read/asyncs we send rd_softint ..


    if (~`SOFTINT_RDWR_63) begin  // {
        if (softint !== `RD_SOFTINT_REG_63 )
            softint_delta <= 1'b1;
            softint <= `RD_SOFTINT_REG_63;
    end // }
    
    if ((`NAS_PIPE_FW2_63 & !`TOP.nas_top.sstep_early[mytnum] & softint_delta ) | softint_rdwr_late 
       ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, softint});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, softint});
        end // }
        if (!(~`SOFTINT_RDWR_63&(softint !== `RD_SOFTINT_REG_63)))
            softint_delta <= 1'b0;
    end //}
    else if (`SPC7.tlu.asi_wr_clear_softint[7] |
             `SPC7.tlu.asi_wr_set_softint[7] ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x16 val=0x%h",
                      mycid,mytid, {47'h0, `RD_SOFTINT_REG_63});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h16,
                               {47'h0, `RD_SOFTINT_REG_63});
        end // }
    end //}


    softint_rdwr <= `SOFTINT_RDWR_63 ;
    softint_rdwr_late <= softint_rdwr & ~`SOFTINT_RDWR_63;


///////////////////////////  Softint ///////////////////////////////////// }}}

///////////////////////////  Hintp   ///////////////////////////////////// {{{

  // Hintp Register hardware Update Detection

  // Non software updates (HSP)
  // If HINTP is already read/written by SW, then don't send 
  // any async updates to Nas. Reads/Writes pending sstep is detected 
  // by snooping nas_pipe ..

    hintp <= `HINTP_REG_63 ;
    if (hstmatch_late)
        hintp_delta <= 1'b1;

    if ((~hintp_rdwr & `NAS_PIPE_FW2_63 & hintp_delta & !`TOP.nas_top.sstep_early[mytnum]) |
            (hintp_rdwr_late & hintp_delta) ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "C%0d T%0d PLI_ASR_WRITE ASR=0x43 val=0x%h",
                      mycid,mytid, {63'h0, hintp});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASR_WRITE, mytnum,8'h43,
                               {63'h0, hintp});
        end // }
        if (~(hintp_rdwr_late & hintp_delta))
         hintp_delta <= 1'b0;
    end //}

    hintp_rdwr <= `HINTP_RDWR_63;
    hintp_rdwr_late <= hintp_rdwr & ~`HINTP_RDWR_63;
    hstmatch_late <= `HSTMATCH_63;


///////////////////////////  Hintp   ///////////////////////////////////// }}}

end //}
`endif
endmodule

`endif

//----------------------------------------------------------
///////////////////////////  CMP //////////////////////////////////////// {{{

module int_cmp ();
`ifndef GATESIM
  // CMP Register hardware Update & Read Detection

`ifdef NCURTL
`define NCU_PCX_ADDR (`CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[103:64]&40'hff03ffffff)
`define NCU_PCX_VLD (`CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_vld&&`CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifc_ctl.pcx_ncu_data_rdy&(`CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[128:124]==0))
`define NCU_PCX_TID (`CPU.ncu.ncu_fcd_ctl.ncu_c2ifcd_ctl.ncu_c2ifd_ctl.pcx_ncu_data[122:117])
`define NCU_CPX_REQ (`CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.ncu_cpx_req_cq)
`define NCU_CPX_CMP_RET (`CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.ncu_cpx_data_ca[145:141]=='b11000)
`define NCU_CPX_DATA (`CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.ncu_cpx_data_ca[63:0])
`define NCU_CPX_TID (`CPU.ncu.ncu_fcd_ctl.ncu_i2cfcd_ctl.ncu_i2cfd_ctl.ncu_cpx_data_ca[136:134])
`define CMP_CORE_RUNNING_STATUS `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_core_running_status
`define CMP_CORE_RUNNING_RW `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.core_running
`define CMP_CORE_ENABLE_STATUS `CPU.ncu.ncu_scd_ctl.ncu_c2iscd_ctl.ncu_ctrl_ctl.creg_core_enable_status
`define READ_CMP_CORE_RUNNING_STATUS (cmp_ld_pending[asi_read_tid] & cmp_ld_type[asi_read_tid] & ~cmp_ld_type2[asi_read_tid])
`define READ_CMP_CORE_ENABLE_STATUS (cmp_ld_pending[asi_read_tid] & ~cmp_ld_type[asi_read_tid])
`define READ_CMP_CORE_RUNNING_RW cmp_ld_type2[asi_read_tid]
`define DATA_CMP_CORE_ asi_read_data[63:0]
`define TID_CMP_CORE_ asi_read_tid
`define ASI_READ_EDGE asi_read_edge
`define NCUCLK `CPU.ncu.l2clk
`else
`define CMP_CORE_RUNNING_STATUS `TOP.cmp_core_running_status
`define CMP_CORE_ENABLE_STATUS `TOP.cmp_core_enable_status
`define CMP_CORE_RUNNING_RW    `TOP.cmp_core_running_rw
`define READ_CMP_CORE_RUNNING_STATUS (`TOP.asi_read_addr[25:18]==`ASI_CMP_CORE & `TOP.asi_read_addr[17:00]==`ASI_CMP_CORE_RUNNING_STATUS)
`define READ_CMP_CORE_ENABLE_STATUS  (`TOP.asi_read_addr[25:18]==`ASI_CMP_CORE & `TOP.asi_read_addr[17:00]==`ASI_CMP_CORE_ENABLED)
`define READ_CMP_CORE_RUNNING_RW  (`TOP.asi_read_addr[25:18]==`ASI_CMP_CORE & `TOP.asi_read_addr[17:00]==`ASI_CMP_CORE_RUNNING_RW)
`define DATA_CMP_CORE_ (`TOP.asi_read_data[63:0])
`define TID_CMP_CORE_ (`TOP.asi_read_tid)
`define ASI_READ_EDGE (`TOP.asi_read_edge)
`define NCUCLK `SYSTEMCLOCK
`endif
`define ASI_WMR_VEC_MASK `CPU.ncu_wmr_vec_mask
`ifdef FC_BENCH
`define RESET_STATUS_REG `CPU.rst.rst_fsm_ctl.rset_stat_q
`else
`ifndef NCURTL
`define RESET_STATUS_REG `TOP.asi_reset_stat[11:0]
`else 
// FOR CCM1NCU, reset_status_register is not implemented. 
// Using dummy register for compilation ..
`define RESET_STATUS_REG 12'h4
`endif
`endif

reg  [63:0] core_running_status;
reg  [63:0] core_running_rw;
reg  [63:0] core_enable_status;
reg  asi_read_edge_last;
reg  asi_read_valid;
reg  asi_wmr_vec_mask;
reg  ready;
reg  wmr;
integer junk;
reg  wmr_sync;
reg  [11:0] reset_status_reg;

initial begin // {
    wmr_sync = 0;
    ready = 0;
    wmr = 1;
    asi_wmr_vec_mask = 1'b0;
    core_running_status = 64'b0;
    core_running_rw = 64'b0;
    core_enable_status = 64'b0;
    asi_read_valid = 1'b0;
    asi_read_edge_last = 1'b0;
    @(posedge `NCUCLK) ;
    @(posedge `NCUCLK) ;
    ready = `PARGS.int_sync_on;
    wmr_sync = 1;
    reset_status_reg = 0;


    // Send HVER to RS
    if (`PARGS.nas_check_on)  begin // {
    `PR_INFO ("pli_int", `INFO, 
              "C0 T0 PLI_ASR_WRITE ASR=0x46 val=0x%h", `SPC0.tlu.asi.hver_value);
        junk = $sim_send(`PLI_ASR_WRITE, 8'h0, 8'h46, `SPC0.tlu.asi.hver_value);
    end //}
end //}

// NCU RTL {{{
`ifdef NCURTL
reg [8:0] ncu_cpx_req;
reg [63:0] cmp_ld_pending;
reg [63:0] cmp_ld_type;       // 0 = enable_status, 1=running_status
reg [63:0] cmp_ld_type2;      // 0 = x, 1=running_rw
reg [63:0] asi_read_data;
reg [5:0] asi_read_tid;
reg       asi_read_edge;


initial begin // {
    ncu_cpx_req <= 0;
    cmp_ld_pending <= 0;
    cmp_ld_type <= 0;
    cmp_ld_type2 <= 0;
    asi_read_data <= 0;
    asi_read_tid <= 0;
    asi_read_edge <= 0;
end // }

always @(posedge (`NCUCLK & ready)) begin // {
    if ((`NCU_PCX_VLD) && (`NCU_PCX_ADDR == 40'h9001040010 ||
                           `NCU_PCX_ADDR == 40'h9001040058 ||
                           `NCU_PCX_ADDR == 40'h9001040050)) begin // {
        cmp_ld_pending[`NCU_PCX_TID] = 1'b1;
        if (`NCU_PCX_ADDR == 40'h9001040010)
            cmp_ld_type[`NCU_PCX_TID] <= 1'b0;
        else
            cmp_ld_type[`NCU_PCX_TID] <= 1'b1;

        if (`NCU_PCX_ADDR == 40'h9001040050)
            cmp_ld_type2[`NCU_PCX_TID] <= 1'b1;
        else
            cmp_ld_type2[`NCU_PCX_TID] <= 1'b0;
    end //}
    if (|ncu_cpx_req && `NCU_CPX_CMP_RET) begin // {
        case (ncu_cpx_req)
        8'h1: asi_read_tid <= {3'b000, `NCU_CPX_TID};
        8'h2: asi_read_tid <= {3'b001, `NCU_CPX_TID};
        8'h4: asi_read_tid <= {3'b010, `NCU_CPX_TID};
        8'h8: asi_read_tid <= {3'b011, `NCU_CPX_TID};
        8'h10: asi_read_tid <= {3'b100, `NCU_CPX_TID};
        8'h20: asi_read_tid <= {3'b101, `NCU_CPX_TID};
        8'h40: asi_read_tid <= {3'b110, `NCU_CPX_TID};
        8'h80: asi_read_tid <= {3'b111, `NCU_CPX_TID};
        endcase
        asi_read_data <= `NCU_CPX_DATA ;
        asi_read_edge <= ~asi_read_edge;
    end // }
    ncu_cpx_req <= `NCU_CPX_REQ ;

    if (asi_read_edge_last !== `ASI_READ_EDGE) begin // {
        cmp_ld_pending[asi_read_tid] <= 0;
    end // }
end //}
`endif
//}}}

always @(posedge (`NCUCLK & ready)) begin // {{{

    if (wmr_sync && wmr && (wmr != `CPU.rst_wmr_protect)) begin /// {
        repeat (10) @(posedge `NCUCLK) ;     // Wait for any nas_pipe to drain 
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            `PR_INFO ("pli_int", `INFO, "Reset: PLI_INT_INTP 0x0");
            junk = $sim_send(`PLI_INT_INTP, 8'h0, 8'h0);
        end // }
    end // }
    wmr <= `CPU.rst_wmr_protect ;

    if (core_running_rw !== `CMP_CORE_RUNNING_RW ) begin //{
        `PR_INFO ("pli_int", `INFO, 
            "PLI_CMP_WRITE va=0x50, val=0x%h", `CMP_CORE_RUNNING_RW);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_CMP_WRITE, 8'h50, `CMP_CORE_RUNNING_RW);
        end // }
    end //}
    core_running_rw <= `CMP_CORE_RUNNING_RW ;

    if (core_running_status !== `CMP_CORE_RUNNING_STATUS ) begin //{
        `PR_INFO ("pli_int", `INFO, 
            "PLI_CMP_WRITE va=0x58, val=0x%h", `CMP_CORE_RUNNING_STATUS);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_CMP_WRITE, 8'h58, `CMP_CORE_RUNNING_STATUS);
        end // }
        for (junk=0;junk<=63;junk=junk+1) begin // {
            if (core_running_status[junk]&~`CMP_CORE_RUNNING_STATUS [junk])
                `PR_NORMAL("nas_top", `NORMAL, "@%d T%d Parked", $time,junk);
            if (~core_running_status[junk]&`CMP_CORE_RUNNING_STATUS [junk])
                `PR_NORMAL("nas_top", `NORMAL, "@%d T%d Unparked", $time,junk);
        end // }
    end //}

    core_running_status <= `CMP_CORE_RUNNING_STATUS ;

    if (core_enable_status !== `CMP_CORE_ENABLE_STATUS ) begin //{
        `PR_INFO ("pli_int", `INFO, 
            "PLI_CMP_WRITE va=0x10, val=0x%h", `CMP_CORE_ENABLE_STATUS);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_CMP_WRITE, 8'h10, `CMP_CORE_ENABLE_STATUS);
        end // }
    end //}

    core_enable_status <= `CMP_CORE_ENABLE_STATUS ;

    if (asi_read_edge_last !== `ASI_READ_EDGE) begin // {
        asi_read_valid <= 1'b1;
        if (`READ_CMP_CORE_RUNNING_STATUS) begin // {
            `PR_INFO ("pli_int", `INFO, 
                "PLI_ASI_READ tid=%0d asi=0x41 va=0x58, val=0x%h", 
                `TID_CMP_CORE_, `DATA_CMP_CORE_);
            if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
                junk = $sim_send(`PLI_ASI_READ, `TID_CMP_CORE_, 
                8'h41, 64'h58, `DATA_CMP_CORE_);
            end // }
        end // }
        else if (`READ_CMP_CORE_ENABLE_STATUS) begin // {
            `PR_INFO ("pli_int", `INFO, 
                "PLI_ASI_READ tid=%0d asi=0x41 va=0x10, val=0x%h", 
                `TID_CMP_CORE_, `DATA_CMP_CORE_);
            if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
                junk = $sim_send(`PLI_ASI_READ, `TID_CMP_CORE_, 
                8'h41, 64'h10, `DATA_CMP_CORE_);
            end // }
        end // }
        else if (`READ_CMP_CORE_RUNNING_RW) begin // {
            `PR_INFO ("pli_int", `INFO, 
                "PLI_ASI_READ tid=%0d asi=0x41 va=0x50, val=0x%h", 
                `TID_CMP_CORE_, `DATA_CMP_CORE_);
            if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
                junk = $sim_send(`PLI_ASI_READ, `TID_CMP_CORE_, 
                8'h41, 64'h50, `DATA_CMP_CORE_);
            end // }
        end // }
    end // }
    else begin // {
        asi_read_valid <= 'b0;
    end // }

    asi_read_edge_last <= `ASI_READ_EDGE ;

///////////////////////////  ASI_WMR_VEC_MASK /////////////////////////// 

    if (asi_wmr_vec_mask !== `ASI_WMR_VEC_MASK ) begin //{
        `PR_INFO ("pli_int", `INFO, 
            "PLI_ASI_WRITE ASI=0x45 VA=0x18 val=0x%h",
                       {63'h0,`ASI_WMR_VEC_MASK});
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_ASI_WRITE, 8'h0 , 8'h45,
                               64'h18, {63'h0,`ASI_WMR_VEC_MASK});
        end // }
    end //}
    asi_wmr_vec_mask <= `ASI_WMR_VEC_MASK ;

///////////////////////////  RESET_STATUS_REG /////////////////////////// 

    if (reset_status_reg != `RESET_STATUS_REG ) begin // {
        `PR_INFO ("pli_int", `INFO, 
            "PLI_MEM_SLAM PA=0x8900000810 data=%h mask=ff, ts=%0d)",
                 {52'h0,`RESET_STATUS_REG}, `TOP.core_cycle_cnt);
        if (`PARGS.nas_check_on && `PARGS.int_sync_on) begin // {
            junk = $sim_send(`PLI_MEM_SLAM, 40'h8900000810 , {52'h0,`RESET_STATUS_REG},
                               8'hff, `TOP.core_cycle_cnt);
        end // }
    end // }
    reset_status_reg <= `RESET_STATUS_REG ;

end //}}}

`endif
endmodule

///////////////////////////   CMP  /////////////////////////////////////// }}}


//----------------------------------------------------------
