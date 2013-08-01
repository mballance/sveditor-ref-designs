// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: itlb_rd.v
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

module itlb_rd_c0 (

  mytg,
  itlb_pipe_d0,
  itlb_pipe_d1,
  itlb_pipe_d2,
  itlb_pipe_d3
);

// common defines
`include "tlb_sync.vh"

parameter WIDTH = `TLB_FIFO_WIDTH;

input                         mytg;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3;
`ifndef GATESIM

reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_e;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_m;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_b;
reg                     [1:0] tid_e;
reg                     [1:0] tid_m;
reg                     [1:0] tid_b;

wire                 [1:0] tid_d;
wire                       inst_d;
wire                       inst_b;
wire                [47:0] pc_b;

reg                  [2:0] mycid;
reg                  [5:0] mytnum;
wire                 [5:0] newtnum;
wire                 [2:0] newtid;
wire     [(`TS_WIDTH-1):0] ts_b;
reg      [(`TS_WIDTH-1):0] tstamp;
reg                        ready;
integer                    junk;

initial begin // {
    ready = 0;
    @(posedge `SPC0.l2clk) ;
    @(posedge `SPC0.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 0;
end //}

assign   newtid  = ((mytg*4) + tid_b);
assign   newtnum = (mycid * 8) + newtid;

//----------------------------------------------------------
// DUT probes

assign tid_d = mytg ? `SPC0.dec.dec_tid1_d :
                      `SPC0.dec.dec_tid0_d;

assign inst_d = mytg ? `SPC0.dec.dec_decode1_d : 
                       `SPC0.dec.dec_decode0_d;

assign inst_b = mytg ? |(`PROBES0.select_pc_b[7:4]) : 
                       |(`PROBES0.select_pc_b[3:0]);

assign pc_b   = mytg ? `PROBES0.pc_1_b :
                       `PROBES0.pc_0_b;

assign ts_b   = itlb_pipe_b[(`TS_WIDTH-1):0];

`ifdef TLB_FIFO_WIDE
wire [7:0] ifu_err_vect;
wire ifu_err_vld;
assign ifu_err_vect = itlb_pipe_b[`TLB_FIFO_WIDTH-2:`TLB_FIFO_WIDTH-9];
assign ifu_err_vld = itlb_pipe_b[`TLB_FIFO_WIDTH-1];
`endif

//----------------------------------------------------------
// Initialize pipeline
initial begin // {

  @ (posedge `SPC0.l2clk);
  // Initialize pipeline
  itlb_pipe_d   = 0;
  itlb_pipe_e   = 0;
  itlb_pipe_m   = 0;
  itlb_pipe_b   = 0;
  tid_e         = 0;
  tid_m         = 0;
  tid_b         = 0;

end // }

//----------------------------------------------------------
// Combo logic
always @ (tid_d or itlb_pipe_d0 or itlb_pipe_d1 or itlb_pipe_d2 or itlb_pipe_d3) begin // {
  case (tid_d)
    2'b00:  itlb_pipe_d = itlb_pipe_d0;
    2'b01:  itlb_pipe_d = itlb_pipe_d1;
    2'b10:  itlb_pipe_d = itlb_pipe_d2;
    2'b11:  itlb_pipe_d = itlb_pipe_d3;
  endcase 
end // }

//----------------------------------------------------------
//  Pipeline registers 
//  Send Command to NAS

always @ (posedge `SPC0.l2clk & ready) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    itlb_pipe_e   <= 0;
    itlb_pipe_m   <= 0;
    itlb_pipe_b   <= 0;

    tid_e <= 0;
    tid_m <= 0;
    tid_b <= 0;

  end // }
  else begin // {

    //---------------------------------
    // Pipeline signals
    itlb_pipe_e   <= inst_d ? itlb_pipe_d : 0;
    itlb_pipe_m   <= itlb_pipe_e;
    itlb_pipe_b   <= itlb_pipe_m;

    tid_e <= inst_d ? tid_d : 0;
    tid_m <= tid_e;
    tid_b <= tid_m;

    //---------------------------------
    // ITLBREAD

    if (inst_b) begin // {
      if (ts_b==0)  begin // {
         `PR_ERROR ("tlb_sync", `ERROR, 
            "C%0d T%0d nas_probes/select_pc_b is asserted, but there is not a valid instruction in B stage for this thread.",
            mycid,newtid);
      end // }
      else   begin // {
        // Must suppress PLI_ITLBREAD messages if th_check_enable=0.
        // This is required since the bench stops sending SSTEPs after th_check_enable=0 (on good/bad trap).
        // So, Bench must also stop sending ITLBREADs.  Without SSTEPs, Riesling will not pop any ITLBREADs.

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on && `PARGS.th_check_enable[newtnum] && `TOP.tlb_sync.nas_pipe_enabled_core0[newtid]) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_ITLBREAD  tid=%d ts=%0d pc=%h",
                     mycid,newtid,newtnum,ts_b,pc_b);
          junk = $sim_send(`PLI_ITLBREAD, newtnum,ts_b);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: ITLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                        mycid,newtid,pc_b,ts_b*`TOP.core_period);
          end //}

        end //}

      end // }
    end // }
  end // in_reset}
    
end // always} 

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_1

module itlb_rd_c1 (

  mytg,
  itlb_pipe_d0,
  itlb_pipe_d1,
  itlb_pipe_d2,
  itlb_pipe_d3
);

// common defines
`include "tlb_sync.vh"

parameter WIDTH = `TLB_FIFO_WIDTH;

input                         mytg;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3;
`ifndef GATESIM

reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_e;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_m;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_b;
reg                     [1:0] tid_e;
reg                     [1:0] tid_m;
reg                     [1:0] tid_b;

wire                 [1:0] tid_d;
wire                       inst_d;
wire                       inst_b;
wire                [47:0] pc_b;

reg                  [2:0] mycid;
reg                  [5:0] mytnum;
wire                 [5:0] newtnum;
wire                 [2:0] newtid;
wire     [(`TS_WIDTH-1):0] ts_b;
reg      [(`TS_WIDTH-1):0] tstamp;
reg                        ready;
integer                    junk;

initial begin // {
    ready = 0;
    @(posedge `SPC1.l2clk) ;
    @(posedge `SPC1.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 1;
end //}

assign   newtid  = ((mytg*4) + tid_b);
assign   newtnum = (mycid * 8) + newtid;

//----------------------------------------------------------
// DUT probes

assign tid_d = mytg ? `SPC1.dec.dec_tid1_d :
                      `SPC1.dec.dec_tid0_d;

assign inst_d = mytg ? `SPC1.dec.dec_decode1_d : 
                       `SPC1.dec.dec_decode0_d;

assign inst_b = mytg ? |(`PROBES1.select_pc_b[7:4]) : 
                       |(`PROBES1.select_pc_b[3:0]);

assign pc_b   = mytg ? `PROBES1.pc_1_b :
                       `PROBES1.pc_0_b;

assign ts_b   = itlb_pipe_b[(`TS_WIDTH-1):0];

`ifdef TLB_FIFO_WIDE
wire [7:0] ifu_err_vect;
wire ifu_err_vld;
assign ifu_err_vect = itlb_pipe_b[`TLB_FIFO_WIDTH-2:`TLB_FIFO_WIDTH-9];
assign ifu_err_vld = itlb_pipe_b[`TLB_FIFO_WIDTH-1];
`endif

//----------------------------------------------------------
// Initialize pipeline
initial begin // {

  @ (posedge `SPC1.l2clk);
  // Initialize pipeline
  itlb_pipe_d   = 0;
  itlb_pipe_e   = 0;
  itlb_pipe_m   = 0;
  itlb_pipe_b   = 0;
  tid_e         = 0;
  tid_m         = 0;
  tid_b         = 0;

end // }

//----------------------------------------------------------
// Combo logic
always @ (tid_d or itlb_pipe_d0 or itlb_pipe_d1 or itlb_pipe_d2 or itlb_pipe_d3) begin // {
  case (tid_d)
    2'b00:  itlb_pipe_d = itlb_pipe_d0;
    2'b01:  itlb_pipe_d = itlb_pipe_d1;
    2'b10:  itlb_pipe_d = itlb_pipe_d2;
    2'b11:  itlb_pipe_d = itlb_pipe_d3;
  endcase 
end // }

//----------------------------------------------------------
//  Pipeline registers 
//  Send Command to NAS

always @ (posedge `SPC1.l2clk & ready) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    itlb_pipe_e   <= 0;
    itlb_pipe_m   <= 0;
    itlb_pipe_b   <= 0;

    tid_e <= 0;
    tid_m <= 0;
    tid_b <= 0;

  end // }
  else begin // {

    //---------------------------------
    // Pipeline signals
    itlb_pipe_e   <= inst_d ? itlb_pipe_d : 0;
    itlb_pipe_m   <= itlb_pipe_e;
    itlb_pipe_b   <= itlb_pipe_m;

    tid_e <= inst_d ? tid_d : 0;
    tid_m <= tid_e;
    tid_b <= tid_m;

    //---------------------------------
    // ITLBREAD

    if (inst_b) begin // {
      if (ts_b==0)  begin // {
         `PR_ERROR ("tlb_sync", `ERROR, 
            "C%0d T%0d nas_probes/select_pc_b is asserted, but there is not a valid instruction in B stage for this thread.",
            mycid,newtid);
      end // }
      else   begin // {
        // Must suppress PLI_ITLBREAD messages if th_check_enable=0.
        // This is required since the bench stops sending SSTEPs after th_check_enable=0 (on good/bad trap).
        // So, Bench must also stop sending ITLBREADs.  Without SSTEPs, Riesling will not pop any ITLBREADs.

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on && `PARGS.th_check_enable[newtnum] && `TOP.tlb_sync.nas_pipe_enabled_core1[newtid]) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_ITLBREAD  tid=%d ts=%0d pc=%h",
                     mycid,newtid,newtnum,ts_b,pc_b);
          junk = $sim_send(`PLI_ITLBREAD, newtnum,ts_b);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: ITLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                        mycid,newtid,pc_b,ts_b*`TOP.core_period);
          end //}

        end //}

      end // }
    end // }
  end // in_reset}
    
end // always} 

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_2

module itlb_rd_c2 (

  mytg,
  itlb_pipe_d0,
  itlb_pipe_d1,
  itlb_pipe_d2,
  itlb_pipe_d3
);

// common defines
`include "tlb_sync.vh"

parameter WIDTH = `TLB_FIFO_WIDTH;

input                         mytg;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3;
`ifndef GATESIM

reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_e;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_m;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_b;
reg                     [1:0] tid_e;
reg                     [1:0] tid_m;
reg                     [1:0] tid_b;

wire                 [1:0] tid_d;
wire                       inst_d;
wire                       inst_b;
wire                [47:0] pc_b;

reg                  [2:0] mycid;
reg                  [5:0] mytnum;
wire                 [5:0] newtnum;
wire                 [2:0] newtid;
wire     [(`TS_WIDTH-1):0] ts_b;
reg      [(`TS_WIDTH-1):0] tstamp;
reg                        ready;
integer                    junk;

initial begin // {
    ready = 0;
    @(posedge `SPC2.l2clk) ;
    @(posedge `SPC2.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 2;
end //}

assign   newtid  = ((mytg*4) + tid_b);
assign   newtnum = (mycid * 8) + newtid;

//----------------------------------------------------------
// DUT probes

assign tid_d = mytg ? `SPC2.dec.dec_tid1_d :
                      `SPC2.dec.dec_tid0_d;

assign inst_d = mytg ? `SPC2.dec.dec_decode1_d : 
                       `SPC2.dec.dec_decode0_d;

assign inst_b = mytg ? |(`PROBES2.select_pc_b[7:4]) : 
                       |(`PROBES2.select_pc_b[3:0]);

assign pc_b   = mytg ? `PROBES2.pc_1_b :
                       `PROBES2.pc_0_b;

assign ts_b   = itlb_pipe_b[(`TS_WIDTH-1):0];

`ifdef TLB_FIFO_WIDE
wire [7:0] ifu_err_vect;
wire ifu_err_vld;
assign ifu_err_vect = itlb_pipe_b[`TLB_FIFO_WIDTH-2:`TLB_FIFO_WIDTH-9];
assign ifu_err_vld = itlb_pipe_b[`TLB_FIFO_WIDTH-1];
`endif

//----------------------------------------------------------
// Initialize pipeline
initial begin // {

  @ (posedge `SPC2.l2clk);
  // Initialize pipeline
  itlb_pipe_d   = 0;
  itlb_pipe_e   = 0;
  itlb_pipe_m   = 0;
  itlb_pipe_b   = 0;
  tid_e         = 0;
  tid_m         = 0;
  tid_b         = 0;

end // }

//----------------------------------------------------------
// Combo logic
always @ (tid_d or itlb_pipe_d0 or itlb_pipe_d1 or itlb_pipe_d2 or itlb_pipe_d3) begin // {
  case (tid_d)
    2'b00:  itlb_pipe_d = itlb_pipe_d0;
    2'b01:  itlb_pipe_d = itlb_pipe_d1;
    2'b10:  itlb_pipe_d = itlb_pipe_d2;
    2'b11:  itlb_pipe_d = itlb_pipe_d3;
  endcase 
end // }

//----------------------------------------------------------
//  Pipeline registers 
//  Send Command to NAS

always @ (posedge `SPC2.l2clk & ready) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    itlb_pipe_e   <= 0;
    itlb_pipe_m   <= 0;
    itlb_pipe_b   <= 0;

    tid_e <= 0;
    tid_m <= 0;
    tid_b <= 0;

  end // }
  else begin // {

    //---------------------------------
    // Pipeline signals
    itlb_pipe_e   <= inst_d ? itlb_pipe_d : 0;
    itlb_pipe_m   <= itlb_pipe_e;
    itlb_pipe_b   <= itlb_pipe_m;

    tid_e <= inst_d ? tid_d : 0;
    tid_m <= tid_e;
    tid_b <= tid_m;

    //---------------------------------
    // ITLBREAD

    if (inst_b) begin // {
      if (ts_b==0)  begin // {
         `PR_ERROR ("tlb_sync", `ERROR, 
            "C%0d T%0d nas_probes/select_pc_b is asserted, but there is not a valid instruction in B stage for this thread.",
            mycid,newtid);
      end // }
      else   begin // {
        // Must suppress PLI_ITLBREAD messages if th_check_enable=0.
        // This is required since the bench stops sending SSTEPs after th_check_enable=0 (on good/bad trap).
        // So, Bench must also stop sending ITLBREADs.  Without SSTEPs, Riesling will not pop any ITLBREADs.

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on && `PARGS.th_check_enable[newtnum] && `TOP.tlb_sync.nas_pipe_enabled_core2[newtid]) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_ITLBREAD  tid=%d ts=%0d pc=%h",
                     mycid,newtid,newtnum,ts_b,pc_b);
          junk = $sim_send(`PLI_ITLBREAD, newtnum,ts_b);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: ITLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                        mycid,newtid,pc_b,ts_b*`TOP.core_period);
          end //}

        end //}

      end // }
    end // }
  end // in_reset}
    
end // always} 

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_3

module itlb_rd_c3 (

  mytg,
  itlb_pipe_d0,
  itlb_pipe_d1,
  itlb_pipe_d2,
  itlb_pipe_d3
);

// common defines
`include "tlb_sync.vh"

parameter WIDTH = `TLB_FIFO_WIDTH;

input                         mytg;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3;
`ifndef GATESIM

reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_e;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_m;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_b;
reg                     [1:0] tid_e;
reg                     [1:0] tid_m;
reg                     [1:0] tid_b;

wire                 [1:0] tid_d;
wire                       inst_d;
wire                       inst_b;
wire                [47:0] pc_b;

reg                  [2:0] mycid;
reg                  [5:0] mytnum;
wire                 [5:0] newtnum;
wire                 [2:0] newtid;
wire     [(`TS_WIDTH-1):0] ts_b;
reg      [(`TS_WIDTH-1):0] tstamp;
reg                        ready;
integer                    junk;

initial begin // {
    ready = 0;
    @(posedge `SPC3.l2clk) ;
    @(posedge `SPC3.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 3;
end //}

assign   newtid  = ((mytg*4) + tid_b);
assign   newtnum = (mycid * 8) + newtid;

//----------------------------------------------------------
// DUT probes

assign tid_d = mytg ? `SPC3.dec.dec_tid1_d :
                      `SPC3.dec.dec_tid0_d;

assign inst_d = mytg ? `SPC3.dec.dec_decode1_d : 
                       `SPC3.dec.dec_decode0_d;

assign inst_b = mytg ? |(`PROBES3.select_pc_b[7:4]) : 
                       |(`PROBES3.select_pc_b[3:0]);

assign pc_b   = mytg ? `PROBES3.pc_1_b :
                       `PROBES3.pc_0_b;

assign ts_b   = itlb_pipe_b[(`TS_WIDTH-1):0];

`ifdef TLB_FIFO_WIDE
wire [7:0] ifu_err_vect;
wire ifu_err_vld;
assign ifu_err_vect = itlb_pipe_b[`TLB_FIFO_WIDTH-2:`TLB_FIFO_WIDTH-9];
assign ifu_err_vld = itlb_pipe_b[`TLB_FIFO_WIDTH-1];
`endif

//----------------------------------------------------------
// Initialize pipeline
initial begin // {

  @ (posedge `SPC3.l2clk);
  // Initialize pipeline
  itlb_pipe_d   = 0;
  itlb_pipe_e   = 0;
  itlb_pipe_m   = 0;
  itlb_pipe_b   = 0;
  tid_e         = 0;
  tid_m         = 0;
  tid_b         = 0;

end // }

//----------------------------------------------------------
// Combo logic
always @ (tid_d or itlb_pipe_d0 or itlb_pipe_d1 or itlb_pipe_d2 or itlb_pipe_d3) begin // {
  case (tid_d)
    2'b00:  itlb_pipe_d = itlb_pipe_d0;
    2'b01:  itlb_pipe_d = itlb_pipe_d1;
    2'b10:  itlb_pipe_d = itlb_pipe_d2;
    2'b11:  itlb_pipe_d = itlb_pipe_d3;
  endcase 
end // }

//----------------------------------------------------------
//  Pipeline registers 
//  Send Command to NAS

always @ (posedge `SPC3.l2clk & ready) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    itlb_pipe_e   <= 0;
    itlb_pipe_m   <= 0;
    itlb_pipe_b   <= 0;

    tid_e <= 0;
    tid_m <= 0;
    tid_b <= 0;

  end // }
  else begin // {

    //---------------------------------
    // Pipeline signals
    itlb_pipe_e   <= inst_d ? itlb_pipe_d : 0;
    itlb_pipe_m   <= itlb_pipe_e;
    itlb_pipe_b   <= itlb_pipe_m;

    tid_e <= inst_d ? tid_d : 0;
    tid_m <= tid_e;
    tid_b <= tid_m;

    //---------------------------------
    // ITLBREAD

    if (inst_b) begin // {
      if (ts_b==0)  begin // {
         `PR_ERROR ("tlb_sync", `ERROR, 
            "C%0d T%0d nas_probes/select_pc_b is asserted, but there is not a valid instruction in B stage for this thread.",
            mycid,newtid);
      end // }
      else   begin // {
        // Must suppress PLI_ITLBREAD messages if th_check_enable=0.
        // This is required since the bench stops sending SSTEPs after th_check_enable=0 (on good/bad trap).
        // So, Bench must also stop sending ITLBREADs.  Without SSTEPs, Riesling will not pop any ITLBREADs.

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on && `PARGS.th_check_enable[newtnum] && `TOP.tlb_sync.nas_pipe_enabled_core3[newtid]) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_ITLBREAD  tid=%d ts=%0d pc=%h",
                     mycid,newtid,newtnum,ts_b,pc_b);
          junk = $sim_send(`PLI_ITLBREAD, newtnum,ts_b);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: ITLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                        mycid,newtid,pc_b,ts_b*`TOP.core_period);
          end //}

        end //}

      end // }
    end // }
  end // in_reset}
    
end // always} 

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_4

module itlb_rd_c4 (

  mytg,
  itlb_pipe_d0,
  itlb_pipe_d1,
  itlb_pipe_d2,
  itlb_pipe_d3
);

// common defines
`include "tlb_sync.vh"

parameter WIDTH = `TLB_FIFO_WIDTH;

input                         mytg;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3;
`ifndef GATESIM

reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_e;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_m;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_b;
reg                     [1:0] tid_e;
reg                     [1:0] tid_m;
reg                     [1:0] tid_b;

wire                 [1:0] tid_d;
wire                       inst_d;
wire                       inst_b;
wire                [47:0] pc_b;

reg                  [2:0] mycid;
reg                  [5:0] mytnum;
wire                 [5:0] newtnum;
wire                 [2:0] newtid;
wire     [(`TS_WIDTH-1):0] ts_b;
reg      [(`TS_WIDTH-1):0] tstamp;
reg                        ready;
integer                    junk;

initial begin // {
    ready = 0;
    @(posedge `SPC4.l2clk) ;
    @(posedge `SPC4.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 4;
end //}

assign   newtid  = ((mytg*4) + tid_b);
assign   newtnum = (mycid * 8) + newtid;

//----------------------------------------------------------
// DUT probes

assign tid_d = mytg ? `SPC4.dec.dec_tid1_d :
                      `SPC4.dec.dec_tid0_d;

assign inst_d = mytg ? `SPC4.dec.dec_decode1_d : 
                       `SPC4.dec.dec_decode0_d;

assign inst_b = mytg ? |(`PROBES4.select_pc_b[7:4]) : 
                       |(`PROBES4.select_pc_b[3:0]);

assign pc_b   = mytg ? `PROBES4.pc_1_b :
                       `PROBES4.pc_0_b;

assign ts_b   = itlb_pipe_b[(`TS_WIDTH-1):0];

`ifdef TLB_FIFO_WIDE
wire [7:0] ifu_err_vect;
wire ifu_err_vld;
assign ifu_err_vect = itlb_pipe_b[`TLB_FIFO_WIDTH-2:`TLB_FIFO_WIDTH-9];
assign ifu_err_vld = itlb_pipe_b[`TLB_FIFO_WIDTH-1];
`endif

//----------------------------------------------------------
// Initialize pipeline
initial begin // {

  @ (posedge `SPC4.l2clk);
  // Initialize pipeline
  itlb_pipe_d   = 0;
  itlb_pipe_e   = 0;
  itlb_pipe_m   = 0;
  itlb_pipe_b   = 0;
  tid_e         = 0;
  tid_m         = 0;
  tid_b         = 0;

end // }

//----------------------------------------------------------
// Combo logic
always @ (tid_d or itlb_pipe_d0 or itlb_pipe_d1 or itlb_pipe_d2 or itlb_pipe_d3) begin // {
  case (tid_d)
    2'b00:  itlb_pipe_d = itlb_pipe_d0;
    2'b01:  itlb_pipe_d = itlb_pipe_d1;
    2'b10:  itlb_pipe_d = itlb_pipe_d2;
    2'b11:  itlb_pipe_d = itlb_pipe_d3;
  endcase 
end // }

//----------------------------------------------------------
//  Pipeline registers 
//  Send Command to NAS

always @ (posedge `SPC4.l2clk & ready) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    itlb_pipe_e   <= 0;
    itlb_pipe_m   <= 0;
    itlb_pipe_b   <= 0;

    tid_e <= 0;
    tid_m <= 0;
    tid_b <= 0;

  end // }
  else begin // {

    //---------------------------------
    // Pipeline signals
    itlb_pipe_e   <= inst_d ? itlb_pipe_d : 0;
    itlb_pipe_m   <= itlb_pipe_e;
    itlb_pipe_b   <= itlb_pipe_m;

    tid_e <= inst_d ? tid_d : 0;
    tid_m <= tid_e;
    tid_b <= tid_m;

    //---------------------------------
    // ITLBREAD

    if (inst_b) begin // {
      if (ts_b==0)  begin // {
         `PR_ERROR ("tlb_sync", `ERROR, 
            "C%0d T%0d nas_probes/select_pc_b is asserted, but there is not a valid instruction in B stage for this thread.",
            mycid,newtid);
      end // }
      else   begin // {
        // Must suppress PLI_ITLBREAD messages if th_check_enable=0.
        // This is required since the bench stops sending SSTEPs after th_check_enable=0 (on good/bad trap).
        // So, Bench must also stop sending ITLBREADs.  Without SSTEPs, Riesling will not pop any ITLBREADs.

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on && `PARGS.th_check_enable[newtnum] && `TOP.tlb_sync.nas_pipe_enabled_core4[newtid]) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_ITLBREAD  tid=%d ts=%0d pc=%h",
                     mycid,newtid,newtnum,ts_b,pc_b);
          junk = $sim_send(`PLI_ITLBREAD, newtnum,ts_b);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: ITLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                        mycid,newtid,pc_b,ts_b*`TOP.core_period);
          end //}

        end //}

      end // }
    end // }
  end // in_reset}
    
end // always} 

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_5

module itlb_rd_c5 (

  mytg,
  itlb_pipe_d0,
  itlb_pipe_d1,
  itlb_pipe_d2,
  itlb_pipe_d3
);

// common defines
`include "tlb_sync.vh"

parameter WIDTH = `TLB_FIFO_WIDTH;

input                         mytg;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3;
`ifndef GATESIM

reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_e;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_m;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_b;
reg                     [1:0] tid_e;
reg                     [1:0] tid_m;
reg                     [1:0] tid_b;

wire                 [1:0] tid_d;
wire                       inst_d;
wire                       inst_b;
wire                [47:0] pc_b;

reg                  [2:0] mycid;
reg                  [5:0] mytnum;
wire                 [5:0] newtnum;
wire                 [2:0] newtid;
wire     [(`TS_WIDTH-1):0] ts_b;
reg      [(`TS_WIDTH-1):0] tstamp;
reg                        ready;
integer                    junk;

initial begin // {
    ready = 0;
    @(posedge `SPC5.l2clk) ;
    @(posedge `SPC5.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 5;
end //}

assign   newtid  = ((mytg*4) + tid_b);
assign   newtnum = (mycid * 8) + newtid;

//----------------------------------------------------------
// DUT probes

assign tid_d = mytg ? `SPC5.dec.dec_tid1_d :
                      `SPC5.dec.dec_tid0_d;

assign inst_d = mytg ? `SPC5.dec.dec_decode1_d : 
                       `SPC5.dec.dec_decode0_d;

assign inst_b = mytg ? |(`PROBES5.select_pc_b[7:4]) : 
                       |(`PROBES5.select_pc_b[3:0]);

assign pc_b   = mytg ? `PROBES5.pc_1_b :
                       `PROBES5.pc_0_b;

assign ts_b   = itlb_pipe_b[(`TS_WIDTH-1):0];

`ifdef TLB_FIFO_WIDE
wire [7:0] ifu_err_vect;
wire ifu_err_vld;
assign ifu_err_vect = itlb_pipe_b[`TLB_FIFO_WIDTH-2:`TLB_FIFO_WIDTH-9];
assign ifu_err_vld = itlb_pipe_b[`TLB_FIFO_WIDTH-1];
`endif

//----------------------------------------------------------
// Initialize pipeline
initial begin // {

  @ (posedge `SPC5.l2clk);
  // Initialize pipeline
  itlb_pipe_d   = 0;
  itlb_pipe_e   = 0;
  itlb_pipe_m   = 0;
  itlb_pipe_b   = 0;
  tid_e         = 0;
  tid_m         = 0;
  tid_b         = 0;

end // }

//----------------------------------------------------------
// Combo logic
always @ (tid_d or itlb_pipe_d0 or itlb_pipe_d1 or itlb_pipe_d2 or itlb_pipe_d3) begin // {
  case (tid_d)
    2'b00:  itlb_pipe_d = itlb_pipe_d0;
    2'b01:  itlb_pipe_d = itlb_pipe_d1;
    2'b10:  itlb_pipe_d = itlb_pipe_d2;
    2'b11:  itlb_pipe_d = itlb_pipe_d3;
  endcase 
end // }

//----------------------------------------------------------
//  Pipeline registers 
//  Send Command to NAS

always @ (posedge `SPC5.l2clk & ready) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    itlb_pipe_e   <= 0;
    itlb_pipe_m   <= 0;
    itlb_pipe_b   <= 0;

    tid_e <= 0;
    tid_m <= 0;
    tid_b <= 0;

  end // }
  else begin // {

    //---------------------------------
    // Pipeline signals
    itlb_pipe_e   <= inst_d ? itlb_pipe_d : 0;
    itlb_pipe_m   <= itlb_pipe_e;
    itlb_pipe_b   <= itlb_pipe_m;

    tid_e <= inst_d ? tid_d : 0;
    tid_m <= tid_e;
    tid_b <= tid_m;

    //---------------------------------
    // ITLBREAD

    if (inst_b) begin // {
      if (ts_b==0)  begin // {
         `PR_ERROR ("tlb_sync", `ERROR, 
            "C%0d T%0d nas_probes/select_pc_b is asserted, but there is not a valid instruction in B stage for this thread.",
            mycid,newtid);
      end // }
      else   begin // {
        // Must suppress PLI_ITLBREAD messages if th_check_enable=0.
        // This is required since the bench stops sending SSTEPs after th_check_enable=0 (on good/bad trap).
        // So, Bench must also stop sending ITLBREADs.  Without SSTEPs, Riesling will not pop any ITLBREADs.

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on && `PARGS.th_check_enable[newtnum] && `TOP.tlb_sync.nas_pipe_enabled_core5[newtid]) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_ITLBREAD  tid=%d ts=%0d pc=%h",
                     mycid,newtid,newtnum,ts_b,pc_b);
          junk = $sim_send(`PLI_ITLBREAD, newtnum,ts_b);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: ITLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                        mycid,newtid,pc_b,ts_b*`TOP.core_period);
          end //}

        end //}

      end // }
    end // }
  end // in_reset}
    
end // always} 

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_6

module itlb_rd_c6 (

  mytg,
  itlb_pipe_d0,
  itlb_pipe_d1,
  itlb_pipe_d2,
  itlb_pipe_d3
);

// common defines
`include "tlb_sync.vh"

parameter WIDTH = `TLB_FIFO_WIDTH;

input                         mytg;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3;
`ifndef GATESIM

reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_e;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_m;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_b;
reg                     [1:0] tid_e;
reg                     [1:0] tid_m;
reg                     [1:0] tid_b;

wire                 [1:0] tid_d;
wire                       inst_d;
wire                       inst_b;
wire                [47:0] pc_b;

reg                  [2:0] mycid;
reg                  [5:0] mytnum;
wire                 [5:0] newtnum;
wire                 [2:0] newtid;
wire     [(`TS_WIDTH-1):0] ts_b;
reg      [(`TS_WIDTH-1):0] tstamp;
reg                        ready;
integer                    junk;

initial begin // {
    ready = 0;
    @(posedge `SPC6.l2clk) ;
    @(posedge `SPC6.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 6;
end //}

assign   newtid  = ((mytg*4) + tid_b);
assign   newtnum = (mycid * 8) + newtid;

//----------------------------------------------------------
// DUT probes

assign tid_d = mytg ? `SPC6.dec.dec_tid1_d :
                      `SPC6.dec.dec_tid0_d;

assign inst_d = mytg ? `SPC6.dec.dec_decode1_d : 
                       `SPC6.dec.dec_decode0_d;

assign inst_b = mytg ? |(`PROBES6.select_pc_b[7:4]) : 
                       |(`PROBES6.select_pc_b[3:0]);

assign pc_b   = mytg ? `PROBES6.pc_1_b :
                       `PROBES6.pc_0_b;

assign ts_b   = itlb_pipe_b[(`TS_WIDTH-1):0];

`ifdef TLB_FIFO_WIDE
wire [7:0] ifu_err_vect;
wire ifu_err_vld;
assign ifu_err_vect = itlb_pipe_b[`TLB_FIFO_WIDTH-2:`TLB_FIFO_WIDTH-9];
assign ifu_err_vld = itlb_pipe_b[`TLB_FIFO_WIDTH-1];
`endif

//----------------------------------------------------------
// Initialize pipeline
initial begin // {

  @ (posedge `SPC6.l2clk);
  // Initialize pipeline
  itlb_pipe_d   = 0;
  itlb_pipe_e   = 0;
  itlb_pipe_m   = 0;
  itlb_pipe_b   = 0;
  tid_e         = 0;
  tid_m         = 0;
  tid_b         = 0;

end // }

//----------------------------------------------------------
// Combo logic
always @ (tid_d or itlb_pipe_d0 or itlb_pipe_d1 or itlb_pipe_d2 or itlb_pipe_d3) begin // {
  case (tid_d)
    2'b00:  itlb_pipe_d = itlb_pipe_d0;
    2'b01:  itlb_pipe_d = itlb_pipe_d1;
    2'b10:  itlb_pipe_d = itlb_pipe_d2;
    2'b11:  itlb_pipe_d = itlb_pipe_d3;
  endcase 
end // }

//----------------------------------------------------------
//  Pipeline registers 
//  Send Command to NAS

always @ (posedge `SPC6.l2clk & ready) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    itlb_pipe_e   <= 0;
    itlb_pipe_m   <= 0;
    itlb_pipe_b   <= 0;

    tid_e <= 0;
    tid_m <= 0;
    tid_b <= 0;

  end // }
  else begin // {

    //---------------------------------
    // Pipeline signals
    itlb_pipe_e   <= inst_d ? itlb_pipe_d : 0;
    itlb_pipe_m   <= itlb_pipe_e;
    itlb_pipe_b   <= itlb_pipe_m;

    tid_e <= inst_d ? tid_d : 0;
    tid_m <= tid_e;
    tid_b <= tid_m;

    //---------------------------------
    // ITLBREAD

    if (inst_b) begin // {
      if (ts_b==0)  begin // {
         `PR_ERROR ("tlb_sync", `ERROR, 
            "C%0d T%0d nas_probes/select_pc_b is asserted, but there is not a valid instruction in B stage for this thread.",
            mycid,newtid);
      end // }
      else   begin // {
        // Must suppress PLI_ITLBREAD messages if th_check_enable=0.
        // This is required since the bench stops sending SSTEPs after th_check_enable=0 (on good/bad trap).
        // So, Bench must also stop sending ITLBREADs.  Without SSTEPs, Riesling will not pop any ITLBREADs.

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on && `PARGS.th_check_enable[newtnum] && `TOP.tlb_sync.nas_pipe_enabled_core6[newtid]) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_ITLBREAD  tid=%d ts=%0d pc=%h",
                     mycid,newtid,newtnum,ts_b,pc_b);
          junk = $sim_send(`PLI_ITLBREAD, newtnum,ts_b);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: ITLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                        mycid,newtid,pc_b,ts_b*`TOP.core_period);
          end //}

        end //}

      end // }
    end // }
  end // in_reset}
    
end // always} 

//----------------------------------------------------------
`endif
endmodule

`endif
`ifdef CORE_7

module itlb_rd_c7 (

  mytg,
  itlb_pipe_d0,
  itlb_pipe_d1,
  itlb_pipe_d2,
  itlb_pipe_d3
);

// common defines
`include "tlb_sync.vh"

parameter WIDTH = `TLB_FIFO_WIDTH;

input                         mytg;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d0;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d1;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d2;
input [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d3;
`ifndef GATESIM

reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_e;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_m;
reg   [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_b;
reg                     [1:0] tid_e;
reg                     [1:0] tid_m;
reg                     [1:0] tid_b;

wire                 [1:0] tid_d;
wire                       inst_d;
wire                       inst_b;
wire                [47:0] pc_b;

reg                  [2:0] mycid;
reg                  [5:0] mytnum;
wire                 [5:0] newtnum;
wire                 [2:0] newtid;
wire     [(`TS_WIDTH-1):0] ts_b;
reg      [(`TS_WIDTH-1):0] tstamp;
reg                        ready;
integer                    junk;

initial begin // {
    ready = 0;
    @(posedge `SPC7.l2clk) ;
    @(posedge `SPC7.l2clk) ;
    ready = `PARGS.tlb_sync_on;
    mycid = 7;
end //}

assign   newtid  = ((mytg*4) + tid_b);
assign   newtnum = (mycid * 8) + newtid;

//----------------------------------------------------------
// DUT probes

assign tid_d = mytg ? `SPC7.dec.dec_tid1_d :
                      `SPC7.dec.dec_tid0_d;

assign inst_d = mytg ? `SPC7.dec.dec_decode1_d : 
                       `SPC7.dec.dec_decode0_d;

assign inst_b = mytg ? |(`PROBES7.select_pc_b[7:4]) : 
                       |(`PROBES7.select_pc_b[3:0]);

assign pc_b   = mytg ? `PROBES7.pc_1_b :
                       `PROBES7.pc_0_b;

assign ts_b   = itlb_pipe_b[(`TS_WIDTH-1):0];

`ifdef TLB_FIFO_WIDE
wire [7:0] ifu_err_vect;
wire ifu_err_vld;
assign ifu_err_vect = itlb_pipe_b[`TLB_FIFO_WIDTH-2:`TLB_FIFO_WIDTH-9];
assign ifu_err_vld = itlb_pipe_b[`TLB_FIFO_WIDTH-1];
`endif

//----------------------------------------------------------
// Initialize pipeline
initial begin // {

  @ (posedge `SPC7.l2clk);
  // Initialize pipeline
  itlb_pipe_d   = 0;
  itlb_pipe_e   = 0;
  itlb_pipe_m   = 0;
  itlb_pipe_b   = 0;
  tid_e         = 0;
  tid_m         = 0;
  tid_b         = 0;

end // }

//----------------------------------------------------------
// Combo logic
always @ (tid_d or itlb_pipe_d0 or itlb_pipe_d1 or itlb_pipe_d2 or itlb_pipe_d3) begin // {
  case (tid_d)
    2'b00:  itlb_pipe_d = itlb_pipe_d0;
    2'b01:  itlb_pipe_d = itlb_pipe_d1;
    2'b10:  itlb_pipe_d = itlb_pipe_d2;
    2'b11:  itlb_pipe_d = itlb_pipe_d3;
  endcase 
end // }

//----------------------------------------------------------
//  Pipeline registers 
//  Send Command to NAS

always @ (posedge `SPC7.l2clk & ready) begin // {

  tstamp = `TOP.core_cycle_cnt - 1;

  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {

    // flush pipeline during reset
    itlb_pipe_e   <= 0;
    itlb_pipe_m   <= 0;
    itlb_pipe_b   <= 0;

    tid_e <= 0;
    tid_m <= 0;
    tid_b <= 0;

  end // }
  else begin // {

    //---------------------------------
    // Pipeline signals
    itlb_pipe_e   <= inst_d ? itlb_pipe_d : 0;
    itlb_pipe_m   <= itlb_pipe_e;
    itlb_pipe_b   <= itlb_pipe_m;

    tid_e <= inst_d ? tid_d : 0;
    tid_m <= tid_e;
    tid_b <= tid_m;

    //---------------------------------
    // ITLBREAD

    if (inst_b) begin // {
      if (ts_b==0)  begin // {
         `PR_ERROR ("tlb_sync", `ERROR, 
            "C%0d T%0d nas_probes/select_pc_b is asserted, but there is not a valid instruction in B stage for this thread.",
            mycid,newtid);
      end // }
      else   begin // {
        // Must suppress PLI_ITLBREAD messages if th_check_enable=0.
        // This is required since the bench stops sending SSTEPs after th_check_enable=0 (on good/bad trap).
        // So, Bench must also stop sending ITLBREADs.  Without SSTEPs, Riesling will not pop any ITLBREADs.

        if (`PARGS.nas_check_on && `PARGS.tlb_sync_on && `PARGS.th_check_enable[newtnum] && `TOP.tlb_sync.nas_pipe_enabled_core7[newtid]) begin // {
          `PR_INFO ("pli_tlb", `INFO, "C%0d T%0d PLI_ITLBREAD  tid=%d ts=%0d pc=%h",
                     mycid,newtid,newtnum,ts_b,pc_b);
          junk = $sim_send(`PLI_ITLBREAD, newtnum,ts_b);

          //--------------------
          if (`PARGS.show_tlb_on) begin // {
            $display ("SHOW_TLB: ITLB_READ  C%0d T%0d              pc=%h                                   ts=%0d",
                        mycid,newtid,pc_b,ts_b*`TOP.core_period);
          end //}

        end //}

      end // }
    end // }
  end // in_reset}
    
end // always} 

//----------------------------------------------------------
`endif
endmodule

`endif
//----------------------------------------------------------
//----------------------------------------------------------
