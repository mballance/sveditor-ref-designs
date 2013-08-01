// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlb_fifo.v
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

module tlb_fifo_c0 (

  // Inputs
  mytid,

  // Outputs
  itlb_pipe_d
);

`include "tlb_sync.vh"

// FIFO_DEPTH is 1 more than IB depth in RTL
// so that overflow can be detected properly.
parameter FIFO_DEPTH = 9;
parameter PTR_WIDTH  = 4;

input                     [2:0] mytid;
output  [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
`ifndef GATESIM

wire                      [2:0] mycid;
wire                            push1;  // 1st signal to qualify push_select
wire                            push2;  // 2nd signal to qualify push_select
wire                      [3:0] push_select;  // 1-4 tstamps are pushed
wire                            flush_upper;
wire                            flush_head;
wire                            pop;
wire                            itlb_miss;
wire                            icache_miss;
wire                            fetch_bypass;
wire                            exc_valid;  // Exception valid
reg                             ib_full;
wire                      [7:0] ifu_err_vect;
wire                      [3:0] ifu_err_select;
wire                      [3:0] ifetch_err_vld;

reg           [(`TS_WIDTH-1):0] tstamp_curr;
reg           [(`TS_WIDTH-1):0] tstamp_prev;

reg     [(`TLB_FIFO_WIDTH-1):0] fifo      [0:(FIFO_DEPTH-1)];  // reg array
reg           [(PTR_WIDTH-1):0] pop_ptr;
reg           [(PTR_WIDTH-1):0] push_ptr;
reg     [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg                             ready;

//----------------------------------------------------------
// Create wires for reg array so signals can be viewed in Debussy
`ifdef DEBUG_TLB
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_0;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_1;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_2;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_3;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_4;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_5;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_6;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_7;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_8;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_9;

  assign fifo_0 = fifo[0];
  assign fifo_1 = fifo[1];
  assign fifo_2 = fifo[2];
  assign fifo_3 = fifo[3];
  assign fifo_4 = fifo[4];
  assign fifo_5 = fifo[5];
  assign fifo_6 = fifo[6];
  assign fifo_7 = fifo[7];
  assign fifo_8 = fifo[8];
  assign fifo_9 = fifo[9];
`endif


//----------------------------------------------------------
// DUT probes

assign mycid        = 0;
assign push1        = `SPC0.ifu_ftu.ftu_fetch_thr_c[mytid];
assign push2        = `SPC0.ifu_ftu.ftu_ibu_redirect_bf[mytid];
assign push_select  = `SPC0.ifu_ftu.ftu_instr_valid_c;
assign flush_upper  = `SPC0.pku.pku_flush_upper_buffer[mytid];
assign flush_head   = `SPC0.pku.pku_flush_buffer0[mytid];
assign pop          = `SPC0.pku.pku_pick_p[mytid];
assign itlb_miss    = `PROBES0.itlb_miss[mytid];
assign icache_miss  = `PROBES0.icache_miss[mytid];
assign fetch_bypass = `PROBES0.fetch_bypass[mytid];
assign exc_valid    = `SPC0.ifu_ftu.ftu_exception_valid_c;

// Error Injection - tlb_sync is pipelining some information that is useful to error injection code.
`ifdef TLB_FIFO_WIDE
assign ifu_err_vect     = {tb_top.ras.ifu_err.ifu_err_code_c[4:0],tb_top.ras.ifu_err.ifu_err_way[2:0]};
assign ifu_err_select   = tb_top.ras.ifu_err.ifu_err_select[3:0];
assign ifetch_err_vld   = tb_top.ras.ifu_err.ifetch_err_vld[3:0];
`else
assign ifu_err_vect     = 8'b0;
assign ifu_err_select   = 4'b0;
assign ifetch_err_vld   = 4'b0;
`endif

//----------------------------------------------------------
initial begin // {
  ready = 0;
  @ (posedge `SPC0.l2clk);
  // Initialize fifo
  fifo_clear;
  itlb_pipe_d = 0;
  ready = `PARGS.tlb_sync_on;
end // }

//----------------------------------------------------------
//  push/pop from FIFO

always @ (posedge (`SPC0.l2clk & ready)) begin // {   

  // Save tstamp if L1 Icache miss & ITLB hit (for later use if bypass)
  if (icache_miss & !itlb_miss) begin // {  
    tstamp_prev = `TOP.core_cycle_cnt - 2;
  end // }


  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {
    fifo_clear;
  end // }
  else begin // {

    itlb_pipe_d <= pop ? fifo[pop_ptr] : itlb_pipe_d;  // Get new value or hold state


    //------------------------
    // Pop FIFO - special case

    // This code must be above the Push FIFO code.
    //   to handle the case if (flush_head and push and IB was empty)
    // Only flush_head if fifo is not empty
    // Don't need to qualify with flush_upper because the buffer will
    //   be cleared by code below.
    if (flush_head && (pop_ptr != push_ptr)) begin // {
      fifo_pop;
    end // }

    //------------------------
    //  Push FIFO

    // push_select may be asserted at same time as exc_valid.
    // exc_valid should override.

    // If exc_valid, I must push 2 valid tstamp in IB before making IB full.
    //   this is because the exception instruction will get to W and will
    //   need a ITLB_READ tstamp.
    // exc_valid will only be asserted if there is room in IB for 4 entries
    //    so it is safe to push 2 entries.
    // It is required to push 2 because the 1st entry may be DS of annul branch,
    //   then the exception happens on next instruction after DS.

    if (exc_valid && push1 && !push2 && !flush_upper) begin // {

      // It is possible to get back-to-back exceptions.
      //   So, need to check for fifo full before fifo_push.
      // It is possible to have only 1 entry available after the 1 exception.
      //   if there was a pop at the same time as the exception.

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
    end // }

    else  begin // {

      if (push_select[0] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }
  
      if (push_select[1] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
  
      if (push_select[2] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[2], ifetch_err_vld[2]);
      end // }

      if (push_select[3] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[3], ifetch_err_vld[3]);
      end // }

    end // }

    //------------------------
    //  Pop FIFO

    // It is possible to push and flush_upper in the same cycle.
    // If this happens, flush_upper takes priority.
    // So, flush code must be after push code since same always block.

    // If flush_head and push in same cycle, there will be 1 entry in IB.
    // Essentially, flush_head is ignored, then an entry is pushed.


    case ({flush_upper, flush_head, pop}) // {
      3'b000: begin
                // NOP
              end
      3'b001: begin
                fifo_pop;
              end
      3'b010: begin
                // NOP - case handled in code above
              end
      3'b011: begin
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
      3'b100: begin
                // Only flush_upper if fifo is not empty
                if (pop_ptr != push_ptr)  begin // {
                  fifo_pop_upper;
                end // }
              end
      3'b101: begin
                fifo_clear;
              end
      3'b110: begin
                fifo_clear;
              end
      3'b111: begin 
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
    endcase  // }

    // It is possible to get a pop and exception.
    // In this case, the pop will happen, then the IB is made full.
    if (exc_valid && push1 && !push2 && !flush_upper) begin // {
      fifo_full;
    end // }

  end // }
end // always }

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_clear;
  integer i;
  begin // {
    // Initialize fifo
    pop_ptr = 0;
    push_ptr = 0;

    for (i=0; i<FIFO_DEPTH; i=i+1) begin // {
      fifo[i] <= 0;
    end  // }

  end // }
endtask

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_full;
  integer i;
  begin // {

    // Increment push_ptr to full buffere
    if (pop_ptr == 0) begin // { 
      push_ptr  = FIFO_DEPTH-1;
    end // }
    else begin // {
      push_ptr  = pop_ptr - 1;
    end // }

  end // }
endtask

//----------------------------------------------------------
// Pop item from FIFO
task fifo_pop;

  begin // {

    // Make sure the FIFO is not empty before pop
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Underflow.  PKU is trying to pick from empty IB.", mycid,mytid);
    end // }

    // Clear entry in fifo
    fifo[pop_ptr] <= 0;

    // Increment pop pointer
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      pop_ptr = 0;
    end // }
    else begin // {
      pop_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Flush all items from FIFO except head
task fifo_pop_upper;

  integer i;

  begin // {

    // Make sure the FIFO is not empty
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IFU is trying to flush upper, but IB is empty.", mycid,mytid);
    end // }

    // Make push ptr 1 entry above pop ptr
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Push item to FIFO
task fifo_push;

  input       err_select;
  input       cache_err_vld;
  reg   [7:0] tmp_err_vect;

  begin // {

    tstamp_curr = `TOP.core_cycle_cnt - 2;

    `ifdef TLB_FIFO_WIDE
      tmp_err_vect = err_select ? ifu_err_vect : 8'b0;
      fifo[push_ptr] <= fetch_bypass ? {cache_err_vld,tmp_err_vect,tstamp_prev} : {cache_err_vld,tmp_err_vect,tstamp_curr};
    `else
      fifo[push_ptr] <= fetch_bypass ? tstamp_prev : tstamp_curr;
    `endif

    // Increment push pointer
    if (push_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = push_ptr + 1;
    end // }
     
    // Check for Overflow after push
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Overflow. IFU is trying to fetch another instruction, but IB is already full.", mycid,mytid);
    end // }

  end // }
endtask

//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_1

module tlb_fifo_c1 (

  // Inputs
  mytid,

  // Outputs
  itlb_pipe_d
);

`include "tlb_sync.vh"

// FIFO_DEPTH is 1 more than IB depth in RTL
// so that overflow can be detected properly.
parameter FIFO_DEPTH = 9;
parameter PTR_WIDTH  = 4;

input                     [2:0] mytid;
output  [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
`ifndef GATESIM

wire                      [2:0] mycid;
wire                            push1;  // 1st signal to qualify push_select
wire                            push2;  // 2nd signal to qualify push_select
wire                      [3:0] push_select;  // 1-4 tstamps are pushed
wire                            flush_upper;
wire                            flush_head;
wire                            pop;
wire                            itlb_miss;
wire                            icache_miss;
wire                            fetch_bypass;
wire                            exc_valid;  // Exception valid
reg                             ib_full;
wire                      [7:0] ifu_err_vect;
wire                      [3:0] ifu_err_select;
wire                      [3:0] ifetch_err_vld;

reg           [(`TS_WIDTH-1):0] tstamp_curr;
reg           [(`TS_WIDTH-1):0] tstamp_prev;

reg     [(`TLB_FIFO_WIDTH-1):0] fifo      [0:(FIFO_DEPTH-1)];  // reg array
reg           [(PTR_WIDTH-1):0] pop_ptr;
reg           [(PTR_WIDTH-1):0] push_ptr;
reg     [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg                             ready;

//----------------------------------------------------------
// Create wires for reg array so signals can be viewed in Debussy
`ifdef DEBUG_TLB
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_0;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_1;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_2;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_3;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_4;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_5;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_6;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_7;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_8;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_9;

  assign fifo_0 = fifo[0];
  assign fifo_1 = fifo[1];
  assign fifo_2 = fifo[2];
  assign fifo_3 = fifo[3];
  assign fifo_4 = fifo[4];
  assign fifo_5 = fifo[5];
  assign fifo_6 = fifo[6];
  assign fifo_7 = fifo[7];
  assign fifo_8 = fifo[8];
  assign fifo_9 = fifo[9];
`endif


//----------------------------------------------------------
// DUT probes

assign mycid        = 1;
assign push1        = `SPC1.ifu_ftu.ftu_fetch_thr_c[mytid];
assign push2        = `SPC1.ifu_ftu.ftu_ibu_redirect_bf[mytid];
assign push_select  = `SPC1.ifu_ftu.ftu_instr_valid_c;
assign flush_upper  = `SPC1.pku.pku_flush_upper_buffer[mytid];
assign flush_head   = `SPC1.pku.pku_flush_buffer0[mytid];
assign pop          = `SPC1.pku.pku_pick_p[mytid];
assign itlb_miss    = `PROBES1.itlb_miss[mytid];
assign icache_miss  = `PROBES1.icache_miss[mytid];
assign fetch_bypass = `PROBES1.fetch_bypass[mytid];
assign exc_valid    = `SPC1.ifu_ftu.ftu_exception_valid_c;

// Error Injection - tlb_sync is pipelining some information that is useful to error injection code.
`ifdef TLB_FIFO_WIDE
assign ifu_err_vect     = {tb_top.ras.ifu_err.ifu_err_code_c[4:0],tb_top.ras.ifu_err.ifu_err_way[2:0]};
assign ifu_err_select   = tb_top.ras.ifu_err.ifu_err_select[3:0];
assign ifetch_err_vld   = tb_top.ras.ifu_err.ifetch_err_vld[3:0];
`else
assign ifu_err_vect     = 8'b0;
assign ifu_err_select   = 4'b0;
assign ifetch_err_vld   = 4'b0;
`endif

//----------------------------------------------------------
initial begin // {
  ready = 0;
  @ (posedge `SPC1.l2clk);
  // Initialize fifo
  fifo_clear;
  itlb_pipe_d = 0;
  ready = `PARGS.tlb_sync_on;
end // }

//----------------------------------------------------------
//  push/pop from FIFO

always @ (posedge (`SPC1.l2clk & ready)) begin // {   

  // Save tstamp if L1 Icache miss & ITLB hit (for later use if bypass)
  if (icache_miss & !itlb_miss) begin // {  
    tstamp_prev = `TOP.core_cycle_cnt - 2;
  end // }


  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {
    fifo_clear;
  end // }
  else begin // {

    itlb_pipe_d <= pop ? fifo[pop_ptr] : itlb_pipe_d;  // Get new value or hold state


    //------------------------
    // Pop FIFO - special case

    // This code must be above the Push FIFO code.
    //   to handle the case if (flush_head and push and IB was empty)
    // Only flush_head if fifo is not empty
    // Don't need to qualify with flush_upper because the buffer will
    //   be cleared by code below.
    if (flush_head && (pop_ptr != push_ptr)) begin // {
      fifo_pop;
    end // }

    //------------------------
    //  Push FIFO

    // push_select may be asserted at same time as exc_valid.
    // exc_valid should override.

    // If exc_valid, I must push 2 valid tstamp in IB before making IB full.
    //   this is because the exception instruction will get to W and will
    //   need a ITLB_READ tstamp.
    // exc_valid will only be asserted if there is room in IB for 4 entries
    //    so it is safe to push 2 entries.
    // It is required to push 2 because the 1st entry may be DS of annul branch,
    //   then the exception happens on next instruction after DS.

    if (exc_valid && push1 && !push2 && !flush_upper) begin // {

      // It is possible to get back-to-back exceptions.
      //   So, need to check for fifo full before fifo_push.
      // It is possible to have only 1 entry available after the 1 exception.
      //   if there was a pop at the same time as the exception.

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
    end // }

    else  begin // {

      if (push_select[0] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }
  
      if (push_select[1] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
  
      if (push_select[2] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[2], ifetch_err_vld[2]);
      end // }

      if (push_select[3] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[3], ifetch_err_vld[3]);
      end // }

    end // }

    //------------------------
    //  Pop FIFO

    // It is possible to push and flush_upper in the same cycle.
    // If this happens, flush_upper takes priority.
    // So, flush code must be after push code since same always block.

    // If flush_head and push in same cycle, there will be 1 entry in IB.
    // Essentially, flush_head is ignored, then an entry is pushed.


    case ({flush_upper, flush_head, pop}) // {
      3'b000: begin
                // NOP
              end
      3'b001: begin
                fifo_pop;
              end
      3'b010: begin
                // NOP - case handled in code above
              end
      3'b011: begin
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
      3'b100: begin
                // Only flush_upper if fifo is not empty
                if (pop_ptr != push_ptr)  begin // {
                  fifo_pop_upper;
                end // }
              end
      3'b101: begin
                fifo_clear;
              end
      3'b110: begin
                fifo_clear;
              end
      3'b111: begin 
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
    endcase  // }

    // It is possible to get a pop and exception.
    // In this case, the pop will happen, then the IB is made full.
    if (exc_valid && push1 && !push2 && !flush_upper) begin // {
      fifo_full;
    end // }

  end // }
end // always }

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_clear;
  integer i;
  begin // {
    // Initialize fifo
    pop_ptr = 0;
    push_ptr = 0;

    for (i=0; i<FIFO_DEPTH; i=i+1) begin // {
      fifo[i] <= 0;
    end  // }

  end // }
endtask

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_full;
  integer i;
  begin // {

    // Increment push_ptr to full buffere
    if (pop_ptr == 0) begin // { 
      push_ptr  = FIFO_DEPTH-1;
    end // }
    else begin // {
      push_ptr  = pop_ptr - 1;
    end // }

  end // }
endtask

//----------------------------------------------------------
// Pop item from FIFO
task fifo_pop;

  begin // {

    // Make sure the FIFO is not empty before pop
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Underflow.  PKU is trying to pick from empty IB.", mycid,mytid);
    end // }

    // Clear entry in fifo
    fifo[pop_ptr] <= 0;

    // Increment pop pointer
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      pop_ptr = 0;
    end // }
    else begin // {
      pop_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Flush all items from FIFO except head
task fifo_pop_upper;

  integer i;

  begin // {

    // Make sure the FIFO is not empty
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IFU is trying to flush upper, but IB is empty.", mycid,mytid);
    end // }

    // Make push ptr 1 entry above pop ptr
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Push item to FIFO
task fifo_push;

  input       err_select;
  input       cache_err_vld;
  reg   [7:0] tmp_err_vect;

  begin // {

    tstamp_curr = `TOP.core_cycle_cnt - 2;

    `ifdef TLB_FIFO_WIDE
      tmp_err_vect = err_select ? ifu_err_vect : 8'b0;
      fifo[push_ptr] <= fetch_bypass ? {cache_err_vld,tmp_err_vect,tstamp_prev} : {cache_err_vld,tmp_err_vect,tstamp_curr};
    `else
      fifo[push_ptr] <= fetch_bypass ? tstamp_prev : tstamp_curr;
    `endif

    // Increment push pointer
    if (push_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = push_ptr + 1;
    end // }
     
    // Check for Overflow after push
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Overflow. IFU is trying to fetch another instruction, but IB is already full.", mycid,mytid);
    end // }

  end // }
endtask

//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_2

module tlb_fifo_c2 (

  // Inputs
  mytid,

  // Outputs
  itlb_pipe_d
);

`include "tlb_sync.vh"

// FIFO_DEPTH is 1 more than IB depth in RTL
// so that overflow can be detected properly.
parameter FIFO_DEPTH = 9;
parameter PTR_WIDTH  = 4;

input                     [2:0] mytid;
output  [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
`ifndef GATESIM

wire                      [2:0] mycid;
wire                            push1;  // 1st signal to qualify push_select
wire                            push2;  // 2nd signal to qualify push_select
wire                      [3:0] push_select;  // 1-4 tstamps are pushed
wire                            flush_upper;
wire                            flush_head;
wire                            pop;
wire                            itlb_miss;
wire                            icache_miss;
wire                            fetch_bypass;
wire                            exc_valid;  // Exception valid
reg                             ib_full;
wire                      [7:0] ifu_err_vect;
wire                      [3:0] ifu_err_select;
wire                      [3:0] ifetch_err_vld;

reg           [(`TS_WIDTH-1):0] tstamp_curr;
reg           [(`TS_WIDTH-1):0] tstamp_prev;

reg     [(`TLB_FIFO_WIDTH-1):0] fifo      [0:(FIFO_DEPTH-1)];  // reg array
reg           [(PTR_WIDTH-1):0] pop_ptr;
reg           [(PTR_WIDTH-1):0] push_ptr;
reg     [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg                             ready;

//----------------------------------------------------------
// Create wires for reg array so signals can be viewed in Debussy
`ifdef DEBUG_TLB
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_0;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_1;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_2;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_3;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_4;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_5;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_6;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_7;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_8;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_9;

  assign fifo_0 = fifo[0];
  assign fifo_1 = fifo[1];
  assign fifo_2 = fifo[2];
  assign fifo_3 = fifo[3];
  assign fifo_4 = fifo[4];
  assign fifo_5 = fifo[5];
  assign fifo_6 = fifo[6];
  assign fifo_7 = fifo[7];
  assign fifo_8 = fifo[8];
  assign fifo_9 = fifo[9];
`endif


//----------------------------------------------------------
// DUT probes

assign mycid        = 2;
assign push1        = `SPC2.ifu_ftu.ftu_fetch_thr_c[mytid];
assign push2        = `SPC2.ifu_ftu.ftu_ibu_redirect_bf[mytid];
assign push_select  = `SPC2.ifu_ftu.ftu_instr_valid_c;
assign flush_upper  = `SPC2.pku.pku_flush_upper_buffer[mytid];
assign flush_head   = `SPC2.pku.pku_flush_buffer0[mytid];
assign pop          = `SPC2.pku.pku_pick_p[mytid];
assign itlb_miss    = `PROBES2.itlb_miss[mytid];
assign icache_miss  = `PROBES2.icache_miss[mytid];
assign fetch_bypass = `PROBES2.fetch_bypass[mytid];
assign exc_valid    = `SPC2.ifu_ftu.ftu_exception_valid_c;

// Error Injection - tlb_sync is pipelining some information that is useful to error injection code.
`ifdef TLB_FIFO_WIDE
assign ifu_err_vect     = {tb_top.ras.ifu_err.ifu_err_code_c[4:0],tb_top.ras.ifu_err.ifu_err_way[2:0]};
assign ifu_err_select   = tb_top.ras.ifu_err.ifu_err_select[3:0];
assign ifetch_err_vld   = tb_top.ras.ifu_err.ifetch_err_vld[3:0];
`else
assign ifu_err_vect     = 8'b0;
assign ifu_err_select   = 4'b0;
assign ifetch_err_vld   = 4'b0;
`endif

//----------------------------------------------------------
initial begin // {
  ready = 0;
  @ (posedge `SPC2.l2clk);
  // Initialize fifo
  fifo_clear;
  itlb_pipe_d = 0;
  ready = `PARGS.tlb_sync_on;
end // }

//----------------------------------------------------------
//  push/pop from FIFO

always @ (posedge (`SPC2.l2clk & ready)) begin // {   

  // Save tstamp if L1 Icache miss & ITLB hit (for later use if bypass)
  if (icache_miss & !itlb_miss) begin // {  
    tstamp_prev = `TOP.core_cycle_cnt - 2;
  end // }


  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {
    fifo_clear;
  end // }
  else begin // {

    itlb_pipe_d <= pop ? fifo[pop_ptr] : itlb_pipe_d;  // Get new value or hold state


    //------------------------
    // Pop FIFO - special case

    // This code must be above the Push FIFO code.
    //   to handle the case if (flush_head and push and IB was empty)
    // Only flush_head if fifo is not empty
    // Don't need to qualify with flush_upper because the buffer will
    //   be cleared by code below.
    if (flush_head && (pop_ptr != push_ptr)) begin // {
      fifo_pop;
    end // }

    //------------------------
    //  Push FIFO

    // push_select may be asserted at same time as exc_valid.
    // exc_valid should override.

    // If exc_valid, I must push 2 valid tstamp in IB before making IB full.
    //   this is because the exception instruction will get to W and will
    //   need a ITLB_READ tstamp.
    // exc_valid will only be asserted if there is room in IB for 4 entries
    //    so it is safe to push 2 entries.
    // It is required to push 2 because the 1st entry may be DS of annul branch,
    //   then the exception happens on next instruction after DS.

    if (exc_valid && push1 && !push2 && !flush_upper) begin // {

      // It is possible to get back-to-back exceptions.
      //   So, need to check for fifo full before fifo_push.
      // It is possible to have only 1 entry available after the 1 exception.
      //   if there was a pop at the same time as the exception.

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
    end // }

    else  begin // {

      if (push_select[0] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }
  
      if (push_select[1] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
  
      if (push_select[2] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[2], ifetch_err_vld[2]);
      end // }

      if (push_select[3] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[3], ifetch_err_vld[3]);
      end // }

    end // }

    //------------------------
    //  Pop FIFO

    // It is possible to push and flush_upper in the same cycle.
    // If this happens, flush_upper takes priority.
    // So, flush code must be after push code since same always block.

    // If flush_head and push in same cycle, there will be 1 entry in IB.
    // Essentially, flush_head is ignored, then an entry is pushed.


    case ({flush_upper, flush_head, pop}) // {
      3'b000: begin
                // NOP
              end
      3'b001: begin
                fifo_pop;
              end
      3'b010: begin
                // NOP - case handled in code above
              end
      3'b011: begin
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
      3'b100: begin
                // Only flush_upper if fifo is not empty
                if (pop_ptr != push_ptr)  begin // {
                  fifo_pop_upper;
                end // }
              end
      3'b101: begin
                fifo_clear;
              end
      3'b110: begin
                fifo_clear;
              end
      3'b111: begin 
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
    endcase  // }

    // It is possible to get a pop and exception.
    // In this case, the pop will happen, then the IB is made full.
    if (exc_valid && push1 && !push2 && !flush_upper) begin // {
      fifo_full;
    end // }

  end // }
end // always }

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_clear;
  integer i;
  begin // {
    // Initialize fifo
    pop_ptr = 0;
    push_ptr = 0;

    for (i=0; i<FIFO_DEPTH; i=i+1) begin // {
      fifo[i] <= 0;
    end  // }

  end // }
endtask

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_full;
  integer i;
  begin // {

    // Increment push_ptr to full buffere
    if (pop_ptr == 0) begin // { 
      push_ptr  = FIFO_DEPTH-1;
    end // }
    else begin // {
      push_ptr  = pop_ptr - 1;
    end // }

  end // }
endtask

//----------------------------------------------------------
// Pop item from FIFO
task fifo_pop;

  begin // {

    // Make sure the FIFO is not empty before pop
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Underflow.  PKU is trying to pick from empty IB.", mycid,mytid);
    end // }

    // Clear entry in fifo
    fifo[pop_ptr] <= 0;

    // Increment pop pointer
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      pop_ptr = 0;
    end // }
    else begin // {
      pop_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Flush all items from FIFO except head
task fifo_pop_upper;

  integer i;

  begin // {

    // Make sure the FIFO is not empty
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IFU is trying to flush upper, but IB is empty.", mycid,mytid);
    end // }

    // Make push ptr 1 entry above pop ptr
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Push item to FIFO
task fifo_push;

  input       err_select;
  input       cache_err_vld;
  reg   [7:0] tmp_err_vect;

  begin // {

    tstamp_curr = `TOP.core_cycle_cnt - 2;

    `ifdef TLB_FIFO_WIDE
      tmp_err_vect = err_select ? ifu_err_vect : 8'b0;
      fifo[push_ptr] <= fetch_bypass ? {cache_err_vld,tmp_err_vect,tstamp_prev} : {cache_err_vld,tmp_err_vect,tstamp_curr};
    `else
      fifo[push_ptr] <= fetch_bypass ? tstamp_prev : tstamp_curr;
    `endif

    // Increment push pointer
    if (push_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = push_ptr + 1;
    end // }
     
    // Check for Overflow after push
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Overflow. IFU is trying to fetch another instruction, but IB is already full.", mycid,mytid);
    end // }

  end // }
endtask

//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_3

module tlb_fifo_c3 (

  // Inputs
  mytid,

  // Outputs
  itlb_pipe_d
);

`include "tlb_sync.vh"

// FIFO_DEPTH is 1 more than IB depth in RTL
// so that overflow can be detected properly.
parameter FIFO_DEPTH = 9;
parameter PTR_WIDTH  = 4;

input                     [2:0] mytid;
output  [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
`ifndef GATESIM

wire                      [2:0] mycid;
wire                            push1;  // 1st signal to qualify push_select
wire                            push2;  // 2nd signal to qualify push_select
wire                      [3:0] push_select;  // 1-4 tstamps are pushed
wire                            flush_upper;
wire                            flush_head;
wire                            pop;
wire                            itlb_miss;
wire                            icache_miss;
wire                            fetch_bypass;
wire                            exc_valid;  // Exception valid
reg                             ib_full;
wire                      [7:0] ifu_err_vect;
wire                      [3:0] ifu_err_select;
wire                      [3:0] ifetch_err_vld;

reg           [(`TS_WIDTH-1):0] tstamp_curr;
reg           [(`TS_WIDTH-1):0] tstamp_prev;

reg     [(`TLB_FIFO_WIDTH-1):0] fifo      [0:(FIFO_DEPTH-1)];  // reg array
reg           [(PTR_WIDTH-1):0] pop_ptr;
reg           [(PTR_WIDTH-1):0] push_ptr;
reg     [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg                             ready;

//----------------------------------------------------------
// Create wires for reg array so signals can be viewed in Debussy
`ifdef DEBUG_TLB
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_0;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_1;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_2;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_3;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_4;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_5;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_6;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_7;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_8;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_9;

  assign fifo_0 = fifo[0];
  assign fifo_1 = fifo[1];
  assign fifo_2 = fifo[2];
  assign fifo_3 = fifo[3];
  assign fifo_4 = fifo[4];
  assign fifo_5 = fifo[5];
  assign fifo_6 = fifo[6];
  assign fifo_7 = fifo[7];
  assign fifo_8 = fifo[8];
  assign fifo_9 = fifo[9];
`endif


//----------------------------------------------------------
// DUT probes

assign mycid        = 3;
assign push1        = `SPC3.ifu_ftu.ftu_fetch_thr_c[mytid];
assign push2        = `SPC3.ifu_ftu.ftu_ibu_redirect_bf[mytid];
assign push_select  = `SPC3.ifu_ftu.ftu_instr_valid_c;
assign flush_upper  = `SPC3.pku.pku_flush_upper_buffer[mytid];
assign flush_head   = `SPC3.pku.pku_flush_buffer0[mytid];
assign pop          = `SPC3.pku.pku_pick_p[mytid];
assign itlb_miss    = `PROBES3.itlb_miss[mytid];
assign icache_miss  = `PROBES3.icache_miss[mytid];
assign fetch_bypass = `PROBES3.fetch_bypass[mytid];
assign exc_valid    = `SPC3.ifu_ftu.ftu_exception_valid_c;

// Error Injection - tlb_sync is pipelining some information that is useful to error injection code.
`ifdef TLB_FIFO_WIDE
assign ifu_err_vect     = {tb_top.ras.ifu_err.ifu_err_code_c[4:0],tb_top.ras.ifu_err.ifu_err_way[2:0]};
assign ifu_err_select   = tb_top.ras.ifu_err.ifu_err_select[3:0];
assign ifetch_err_vld   = tb_top.ras.ifu_err.ifetch_err_vld[3:0];
`else
assign ifu_err_vect     = 8'b0;
assign ifu_err_select   = 4'b0;
assign ifetch_err_vld   = 4'b0;
`endif

//----------------------------------------------------------
initial begin // {
  ready = 0;
  @ (posedge `SPC3.l2clk);
  // Initialize fifo
  fifo_clear;
  itlb_pipe_d = 0;
  ready = `PARGS.tlb_sync_on;
end // }

//----------------------------------------------------------
//  push/pop from FIFO

always @ (posedge (`SPC3.l2clk & ready)) begin // {   

  // Save tstamp if L1 Icache miss & ITLB hit (for later use if bypass)
  if (icache_miss & !itlb_miss) begin // {  
    tstamp_prev = `TOP.core_cycle_cnt - 2;
  end // }


  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {
    fifo_clear;
  end // }
  else begin // {

    itlb_pipe_d <= pop ? fifo[pop_ptr] : itlb_pipe_d;  // Get new value or hold state


    //------------------------
    // Pop FIFO - special case

    // This code must be above the Push FIFO code.
    //   to handle the case if (flush_head and push and IB was empty)
    // Only flush_head if fifo is not empty
    // Don't need to qualify with flush_upper because the buffer will
    //   be cleared by code below.
    if (flush_head && (pop_ptr != push_ptr)) begin // {
      fifo_pop;
    end // }

    //------------------------
    //  Push FIFO

    // push_select may be asserted at same time as exc_valid.
    // exc_valid should override.

    // If exc_valid, I must push 2 valid tstamp in IB before making IB full.
    //   this is because the exception instruction will get to W and will
    //   need a ITLB_READ tstamp.
    // exc_valid will only be asserted if there is room in IB for 4 entries
    //    so it is safe to push 2 entries.
    // It is required to push 2 because the 1st entry may be DS of annul branch,
    //   then the exception happens on next instruction after DS.

    if (exc_valid && push1 && !push2 && !flush_upper) begin // {

      // It is possible to get back-to-back exceptions.
      //   So, need to check for fifo full before fifo_push.
      // It is possible to have only 1 entry available after the 1 exception.
      //   if there was a pop at the same time as the exception.

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
    end // }

    else  begin // {

      if (push_select[0] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }
  
      if (push_select[1] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
  
      if (push_select[2] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[2], ifetch_err_vld[2]);
      end // }

      if (push_select[3] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[3], ifetch_err_vld[3]);
      end // }

    end // }

    //------------------------
    //  Pop FIFO

    // It is possible to push and flush_upper in the same cycle.
    // If this happens, flush_upper takes priority.
    // So, flush code must be after push code since same always block.

    // If flush_head and push in same cycle, there will be 1 entry in IB.
    // Essentially, flush_head is ignored, then an entry is pushed.


    case ({flush_upper, flush_head, pop}) // {
      3'b000: begin
                // NOP
              end
      3'b001: begin
                fifo_pop;
              end
      3'b010: begin
                // NOP - case handled in code above
              end
      3'b011: begin
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
      3'b100: begin
                // Only flush_upper if fifo is not empty
                if (pop_ptr != push_ptr)  begin // {
                  fifo_pop_upper;
                end // }
              end
      3'b101: begin
                fifo_clear;
              end
      3'b110: begin
                fifo_clear;
              end
      3'b111: begin 
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
    endcase  // }

    // It is possible to get a pop and exception.
    // In this case, the pop will happen, then the IB is made full.
    if (exc_valid && push1 && !push2 && !flush_upper) begin // {
      fifo_full;
    end // }

  end // }
end // always }

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_clear;
  integer i;
  begin // {
    // Initialize fifo
    pop_ptr = 0;
    push_ptr = 0;

    for (i=0; i<FIFO_DEPTH; i=i+1) begin // {
      fifo[i] <= 0;
    end  // }

  end // }
endtask

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_full;
  integer i;
  begin // {

    // Increment push_ptr to full buffere
    if (pop_ptr == 0) begin // { 
      push_ptr  = FIFO_DEPTH-1;
    end // }
    else begin // {
      push_ptr  = pop_ptr - 1;
    end // }

  end // }
endtask

//----------------------------------------------------------
// Pop item from FIFO
task fifo_pop;

  begin // {

    // Make sure the FIFO is not empty before pop
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Underflow.  PKU is trying to pick from empty IB.", mycid,mytid);
    end // }

    // Clear entry in fifo
    fifo[pop_ptr] <= 0;

    // Increment pop pointer
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      pop_ptr = 0;
    end // }
    else begin // {
      pop_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Flush all items from FIFO except head
task fifo_pop_upper;

  integer i;

  begin // {

    // Make sure the FIFO is not empty
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IFU is trying to flush upper, but IB is empty.", mycid,mytid);
    end // }

    // Make push ptr 1 entry above pop ptr
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Push item to FIFO
task fifo_push;

  input       err_select;
  input       cache_err_vld;
  reg   [7:0] tmp_err_vect;

  begin // {

    tstamp_curr = `TOP.core_cycle_cnt - 2;

    `ifdef TLB_FIFO_WIDE
      tmp_err_vect = err_select ? ifu_err_vect : 8'b0;
      fifo[push_ptr] <= fetch_bypass ? {cache_err_vld,tmp_err_vect,tstamp_prev} : {cache_err_vld,tmp_err_vect,tstamp_curr};
    `else
      fifo[push_ptr] <= fetch_bypass ? tstamp_prev : tstamp_curr;
    `endif

    // Increment push pointer
    if (push_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = push_ptr + 1;
    end // }
     
    // Check for Overflow after push
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Overflow. IFU is trying to fetch another instruction, but IB is already full.", mycid,mytid);
    end // }

  end // }
endtask

//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_4

module tlb_fifo_c4 (

  // Inputs
  mytid,

  // Outputs
  itlb_pipe_d
);

`include "tlb_sync.vh"

// FIFO_DEPTH is 1 more than IB depth in RTL
// so that overflow can be detected properly.
parameter FIFO_DEPTH = 9;
parameter PTR_WIDTH  = 4;

input                     [2:0] mytid;
output  [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
`ifndef GATESIM

wire                      [2:0] mycid;
wire                            push1;  // 1st signal to qualify push_select
wire                            push2;  // 2nd signal to qualify push_select
wire                      [3:0] push_select;  // 1-4 tstamps are pushed
wire                            flush_upper;
wire                            flush_head;
wire                            pop;
wire                            itlb_miss;
wire                            icache_miss;
wire                            fetch_bypass;
wire                            exc_valid;  // Exception valid
reg                             ib_full;
wire                      [7:0] ifu_err_vect;
wire                      [3:0] ifu_err_select;
wire                      [3:0] ifetch_err_vld;

reg           [(`TS_WIDTH-1):0] tstamp_curr;
reg           [(`TS_WIDTH-1):0] tstamp_prev;

reg     [(`TLB_FIFO_WIDTH-1):0] fifo      [0:(FIFO_DEPTH-1)];  // reg array
reg           [(PTR_WIDTH-1):0] pop_ptr;
reg           [(PTR_WIDTH-1):0] push_ptr;
reg     [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg                             ready;

//----------------------------------------------------------
// Create wires for reg array so signals can be viewed in Debussy
`ifdef DEBUG_TLB
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_0;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_1;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_2;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_3;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_4;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_5;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_6;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_7;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_8;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_9;

  assign fifo_0 = fifo[0];
  assign fifo_1 = fifo[1];
  assign fifo_2 = fifo[2];
  assign fifo_3 = fifo[3];
  assign fifo_4 = fifo[4];
  assign fifo_5 = fifo[5];
  assign fifo_6 = fifo[6];
  assign fifo_7 = fifo[7];
  assign fifo_8 = fifo[8];
  assign fifo_9 = fifo[9];
`endif


//----------------------------------------------------------
// DUT probes

assign mycid        = 4;
assign push1        = `SPC4.ifu_ftu.ftu_fetch_thr_c[mytid];
assign push2        = `SPC4.ifu_ftu.ftu_ibu_redirect_bf[mytid];
assign push_select  = `SPC4.ifu_ftu.ftu_instr_valid_c;
assign flush_upper  = `SPC4.pku.pku_flush_upper_buffer[mytid];
assign flush_head   = `SPC4.pku.pku_flush_buffer0[mytid];
assign pop          = `SPC4.pku.pku_pick_p[mytid];
assign itlb_miss    = `PROBES4.itlb_miss[mytid];
assign icache_miss  = `PROBES4.icache_miss[mytid];
assign fetch_bypass = `PROBES4.fetch_bypass[mytid];
assign exc_valid    = `SPC4.ifu_ftu.ftu_exception_valid_c;

// Error Injection - tlb_sync is pipelining some information that is useful to error injection code.
`ifdef TLB_FIFO_WIDE
assign ifu_err_vect     = {tb_top.ras.ifu_err.ifu_err_code_c[4:0],tb_top.ras.ifu_err.ifu_err_way[2:0]};
assign ifu_err_select   = tb_top.ras.ifu_err.ifu_err_select[3:0];
assign ifetch_err_vld   = tb_top.ras.ifu_err.ifetch_err_vld[3:0];
`else
assign ifu_err_vect     = 8'b0;
assign ifu_err_select   = 4'b0;
assign ifetch_err_vld   = 4'b0;
`endif

//----------------------------------------------------------
initial begin // {
  ready = 0;
  @ (posedge `SPC4.l2clk);
  // Initialize fifo
  fifo_clear;
  itlb_pipe_d = 0;
  ready = `PARGS.tlb_sync_on;
end // }

//----------------------------------------------------------
//  push/pop from FIFO

always @ (posedge (`SPC4.l2clk & ready)) begin // {   

  // Save tstamp if L1 Icache miss & ITLB hit (for later use if bypass)
  if (icache_miss & !itlb_miss) begin // {  
    tstamp_prev = `TOP.core_cycle_cnt - 2;
  end // }


  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {
    fifo_clear;
  end // }
  else begin // {

    itlb_pipe_d <= pop ? fifo[pop_ptr] : itlb_pipe_d;  // Get new value or hold state


    //------------------------
    // Pop FIFO - special case

    // This code must be above the Push FIFO code.
    //   to handle the case if (flush_head and push and IB was empty)
    // Only flush_head if fifo is not empty
    // Don't need to qualify with flush_upper because the buffer will
    //   be cleared by code below.
    if (flush_head && (pop_ptr != push_ptr)) begin // {
      fifo_pop;
    end // }

    //------------------------
    //  Push FIFO

    // push_select may be asserted at same time as exc_valid.
    // exc_valid should override.

    // If exc_valid, I must push 2 valid tstamp in IB before making IB full.
    //   this is because the exception instruction will get to W and will
    //   need a ITLB_READ tstamp.
    // exc_valid will only be asserted if there is room in IB for 4 entries
    //    so it is safe to push 2 entries.
    // It is required to push 2 because the 1st entry may be DS of annul branch,
    //   then the exception happens on next instruction after DS.

    if (exc_valid && push1 && !push2 && !flush_upper) begin // {

      // It is possible to get back-to-back exceptions.
      //   So, need to check for fifo full before fifo_push.
      // It is possible to have only 1 entry available after the 1 exception.
      //   if there was a pop at the same time as the exception.

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
    end // }

    else  begin // {

      if (push_select[0] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }
  
      if (push_select[1] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
  
      if (push_select[2] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[2], ifetch_err_vld[2]);
      end // }

      if (push_select[3] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[3], ifetch_err_vld[3]);
      end // }

    end // }

    //------------------------
    //  Pop FIFO

    // It is possible to push and flush_upper in the same cycle.
    // If this happens, flush_upper takes priority.
    // So, flush code must be after push code since same always block.

    // If flush_head and push in same cycle, there will be 1 entry in IB.
    // Essentially, flush_head is ignored, then an entry is pushed.


    case ({flush_upper, flush_head, pop}) // {
      3'b000: begin
                // NOP
              end
      3'b001: begin
                fifo_pop;
              end
      3'b010: begin
                // NOP - case handled in code above
              end
      3'b011: begin
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
      3'b100: begin
                // Only flush_upper if fifo is not empty
                if (pop_ptr != push_ptr)  begin // {
                  fifo_pop_upper;
                end // }
              end
      3'b101: begin
                fifo_clear;
              end
      3'b110: begin
                fifo_clear;
              end
      3'b111: begin 
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
    endcase  // }

    // It is possible to get a pop and exception.
    // In this case, the pop will happen, then the IB is made full.
    if (exc_valid && push1 && !push2 && !flush_upper) begin // {
      fifo_full;
    end // }

  end // }
end // always }

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_clear;
  integer i;
  begin // {
    // Initialize fifo
    pop_ptr = 0;
    push_ptr = 0;

    for (i=0; i<FIFO_DEPTH; i=i+1) begin // {
      fifo[i] <= 0;
    end  // }

  end // }
endtask

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_full;
  integer i;
  begin // {

    // Increment push_ptr to full buffere
    if (pop_ptr == 0) begin // { 
      push_ptr  = FIFO_DEPTH-1;
    end // }
    else begin // {
      push_ptr  = pop_ptr - 1;
    end // }

  end // }
endtask

//----------------------------------------------------------
// Pop item from FIFO
task fifo_pop;

  begin // {

    // Make sure the FIFO is not empty before pop
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Underflow.  PKU is trying to pick from empty IB.", mycid,mytid);
    end // }

    // Clear entry in fifo
    fifo[pop_ptr] <= 0;

    // Increment pop pointer
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      pop_ptr = 0;
    end // }
    else begin // {
      pop_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Flush all items from FIFO except head
task fifo_pop_upper;

  integer i;

  begin // {

    // Make sure the FIFO is not empty
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IFU is trying to flush upper, but IB is empty.", mycid,mytid);
    end // }

    // Make push ptr 1 entry above pop ptr
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Push item to FIFO
task fifo_push;

  input       err_select;
  input       cache_err_vld;
  reg   [7:0] tmp_err_vect;

  begin // {

    tstamp_curr = `TOP.core_cycle_cnt - 2;

    `ifdef TLB_FIFO_WIDE
      tmp_err_vect = err_select ? ifu_err_vect : 8'b0;
      fifo[push_ptr] <= fetch_bypass ? {cache_err_vld,tmp_err_vect,tstamp_prev} : {cache_err_vld,tmp_err_vect,tstamp_curr};
    `else
      fifo[push_ptr] <= fetch_bypass ? tstamp_prev : tstamp_curr;
    `endif

    // Increment push pointer
    if (push_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = push_ptr + 1;
    end // }
     
    // Check for Overflow after push
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Overflow. IFU is trying to fetch another instruction, but IB is already full.", mycid,mytid);
    end // }

  end // }
endtask

//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_5

module tlb_fifo_c5 (

  // Inputs
  mytid,

  // Outputs
  itlb_pipe_d
);

`include "tlb_sync.vh"

// FIFO_DEPTH is 1 more than IB depth in RTL
// so that overflow can be detected properly.
parameter FIFO_DEPTH = 9;
parameter PTR_WIDTH  = 4;

input                     [2:0] mytid;
output  [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
`ifndef GATESIM

wire                      [2:0] mycid;
wire                            push1;  // 1st signal to qualify push_select
wire                            push2;  // 2nd signal to qualify push_select
wire                      [3:0] push_select;  // 1-4 tstamps are pushed
wire                            flush_upper;
wire                            flush_head;
wire                            pop;
wire                            itlb_miss;
wire                            icache_miss;
wire                            fetch_bypass;
wire                            exc_valid;  // Exception valid
reg                             ib_full;
wire                      [7:0] ifu_err_vect;
wire                      [3:0] ifu_err_select;
wire                      [3:0] ifetch_err_vld;

reg           [(`TS_WIDTH-1):0] tstamp_curr;
reg           [(`TS_WIDTH-1):0] tstamp_prev;

reg     [(`TLB_FIFO_WIDTH-1):0] fifo      [0:(FIFO_DEPTH-1)];  // reg array
reg           [(PTR_WIDTH-1):0] pop_ptr;
reg           [(PTR_WIDTH-1):0] push_ptr;
reg     [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg                             ready;

//----------------------------------------------------------
// Create wires for reg array so signals can be viewed in Debussy
`ifdef DEBUG_TLB
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_0;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_1;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_2;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_3;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_4;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_5;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_6;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_7;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_8;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_9;

  assign fifo_0 = fifo[0];
  assign fifo_1 = fifo[1];
  assign fifo_2 = fifo[2];
  assign fifo_3 = fifo[3];
  assign fifo_4 = fifo[4];
  assign fifo_5 = fifo[5];
  assign fifo_6 = fifo[6];
  assign fifo_7 = fifo[7];
  assign fifo_8 = fifo[8];
  assign fifo_9 = fifo[9];
`endif


//----------------------------------------------------------
// DUT probes

assign mycid        = 5;
assign push1        = `SPC5.ifu_ftu.ftu_fetch_thr_c[mytid];
assign push2        = `SPC5.ifu_ftu.ftu_ibu_redirect_bf[mytid];
assign push_select  = `SPC5.ifu_ftu.ftu_instr_valid_c;
assign flush_upper  = `SPC5.pku.pku_flush_upper_buffer[mytid];
assign flush_head   = `SPC5.pku.pku_flush_buffer0[mytid];
assign pop          = `SPC5.pku.pku_pick_p[mytid];
assign itlb_miss    = `PROBES5.itlb_miss[mytid];
assign icache_miss  = `PROBES5.icache_miss[mytid];
assign fetch_bypass = `PROBES5.fetch_bypass[mytid];
assign exc_valid    = `SPC5.ifu_ftu.ftu_exception_valid_c;

// Error Injection - tlb_sync is pipelining some information that is useful to error injection code.
`ifdef TLB_FIFO_WIDE
assign ifu_err_vect     = {tb_top.ras.ifu_err.ifu_err_code_c[4:0],tb_top.ras.ifu_err.ifu_err_way[2:0]};
assign ifu_err_select   = tb_top.ras.ifu_err.ifu_err_select[3:0];
assign ifetch_err_vld   = tb_top.ras.ifu_err.ifetch_err_vld[3:0];
`else
assign ifu_err_vect     = 8'b0;
assign ifu_err_select   = 4'b0;
assign ifetch_err_vld   = 4'b0;
`endif

//----------------------------------------------------------
initial begin // {
  ready = 0;
  @ (posedge `SPC5.l2clk);
  // Initialize fifo
  fifo_clear;
  itlb_pipe_d = 0;
  ready = `PARGS.tlb_sync_on;
end // }

//----------------------------------------------------------
//  push/pop from FIFO

always @ (posedge (`SPC5.l2clk & ready)) begin // {   

  // Save tstamp if L1 Icache miss & ITLB hit (for later use if bypass)
  if (icache_miss & !itlb_miss) begin // {  
    tstamp_prev = `TOP.core_cycle_cnt - 2;
  end // }


  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {
    fifo_clear;
  end // }
  else begin // {

    itlb_pipe_d <= pop ? fifo[pop_ptr] : itlb_pipe_d;  // Get new value or hold state


    //------------------------
    // Pop FIFO - special case

    // This code must be above the Push FIFO code.
    //   to handle the case if (flush_head and push and IB was empty)
    // Only flush_head if fifo is not empty
    // Don't need to qualify with flush_upper because the buffer will
    //   be cleared by code below.
    if (flush_head && (pop_ptr != push_ptr)) begin // {
      fifo_pop;
    end // }

    //------------------------
    //  Push FIFO

    // push_select may be asserted at same time as exc_valid.
    // exc_valid should override.

    // If exc_valid, I must push 2 valid tstamp in IB before making IB full.
    //   this is because the exception instruction will get to W and will
    //   need a ITLB_READ tstamp.
    // exc_valid will only be asserted if there is room in IB for 4 entries
    //    so it is safe to push 2 entries.
    // It is required to push 2 because the 1st entry may be DS of annul branch,
    //   then the exception happens on next instruction after DS.

    if (exc_valid && push1 && !push2 && !flush_upper) begin // {

      // It is possible to get back-to-back exceptions.
      //   So, need to check for fifo full before fifo_push.
      // It is possible to have only 1 entry available after the 1 exception.
      //   if there was a pop at the same time as the exception.

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
    end // }

    else  begin // {

      if (push_select[0] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }
  
      if (push_select[1] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
  
      if (push_select[2] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[2], ifetch_err_vld[2]);
      end // }

      if (push_select[3] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[3], ifetch_err_vld[3]);
      end // }

    end // }

    //------------------------
    //  Pop FIFO

    // It is possible to push and flush_upper in the same cycle.
    // If this happens, flush_upper takes priority.
    // So, flush code must be after push code since same always block.

    // If flush_head and push in same cycle, there will be 1 entry in IB.
    // Essentially, flush_head is ignored, then an entry is pushed.


    case ({flush_upper, flush_head, pop}) // {
      3'b000: begin
                // NOP
              end
      3'b001: begin
                fifo_pop;
              end
      3'b010: begin
                // NOP - case handled in code above
              end
      3'b011: begin
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
      3'b100: begin
                // Only flush_upper if fifo is not empty
                if (pop_ptr != push_ptr)  begin // {
                  fifo_pop_upper;
                end // }
              end
      3'b101: begin
                fifo_clear;
              end
      3'b110: begin
                fifo_clear;
              end
      3'b111: begin 
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
    endcase  // }

    // It is possible to get a pop and exception.
    // In this case, the pop will happen, then the IB is made full.
    if (exc_valid && push1 && !push2 && !flush_upper) begin // {
      fifo_full;
    end // }

  end // }
end // always }

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_clear;
  integer i;
  begin // {
    // Initialize fifo
    pop_ptr = 0;
    push_ptr = 0;

    for (i=0; i<FIFO_DEPTH; i=i+1) begin // {
      fifo[i] <= 0;
    end  // }

  end // }
endtask

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_full;
  integer i;
  begin // {

    // Increment push_ptr to full buffere
    if (pop_ptr == 0) begin // { 
      push_ptr  = FIFO_DEPTH-1;
    end // }
    else begin // {
      push_ptr  = pop_ptr - 1;
    end // }

  end // }
endtask

//----------------------------------------------------------
// Pop item from FIFO
task fifo_pop;

  begin // {

    // Make sure the FIFO is not empty before pop
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Underflow.  PKU is trying to pick from empty IB.", mycid,mytid);
    end // }

    // Clear entry in fifo
    fifo[pop_ptr] <= 0;

    // Increment pop pointer
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      pop_ptr = 0;
    end // }
    else begin // {
      pop_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Flush all items from FIFO except head
task fifo_pop_upper;

  integer i;

  begin // {

    // Make sure the FIFO is not empty
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IFU is trying to flush upper, but IB is empty.", mycid,mytid);
    end // }

    // Make push ptr 1 entry above pop ptr
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Push item to FIFO
task fifo_push;

  input       err_select;
  input       cache_err_vld;
  reg   [7:0] tmp_err_vect;

  begin // {

    tstamp_curr = `TOP.core_cycle_cnt - 2;

    `ifdef TLB_FIFO_WIDE
      tmp_err_vect = err_select ? ifu_err_vect : 8'b0;
      fifo[push_ptr] <= fetch_bypass ? {cache_err_vld,tmp_err_vect,tstamp_prev} : {cache_err_vld,tmp_err_vect,tstamp_curr};
    `else
      fifo[push_ptr] <= fetch_bypass ? tstamp_prev : tstamp_curr;
    `endif

    // Increment push pointer
    if (push_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = push_ptr + 1;
    end // }
     
    // Check for Overflow after push
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Overflow. IFU is trying to fetch another instruction, but IB is already full.", mycid,mytid);
    end // }

  end // }
endtask

//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_6

module tlb_fifo_c6 (

  // Inputs
  mytid,

  // Outputs
  itlb_pipe_d
);

`include "tlb_sync.vh"

// FIFO_DEPTH is 1 more than IB depth in RTL
// so that overflow can be detected properly.
parameter FIFO_DEPTH = 9;
parameter PTR_WIDTH  = 4;

input                     [2:0] mytid;
output  [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
`ifndef GATESIM

wire                      [2:0] mycid;
wire                            push1;  // 1st signal to qualify push_select
wire                            push2;  // 2nd signal to qualify push_select
wire                      [3:0] push_select;  // 1-4 tstamps are pushed
wire                            flush_upper;
wire                            flush_head;
wire                            pop;
wire                            itlb_miss;
wire                            icache_miss;
wire                            fetch_bypass;
wire                            exc_valid;  // Exception valid
reg                             ib_full;
wire                      [7:0] ifu_err_vect;
wire                      [3:0] ifu_err_select;
wire                      [3:0] ifetch_err_vld;

reg           [(`TS_WIDTH-1):0] tstamp_curr;
reg           [(`TS_WIDTH-1):0] tstamp_prev;

reg     [(`TLB_FIFO_WIDTH-1):0] fifo      [0:(FIFO_DEPTH-1)];  // reg array
reg           [(PTR_WIDTH-1):0] pop_ptr;
reg           [(PTR_WIDTH-1):0] push_ptr;
reg     [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg                             ready;

//----------------------------------------------------------
// Create wires for reg array so signals can be viewed in Debussy
`ifdef DEBUG_TLB
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_0;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_1;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_2;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_3;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_4;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_5;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_6;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_7;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_8;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_9;

  assign fifo_0 = fifo[0];
  assign fifo_1 = fifo[1];
  assign fifo_2 = fifo[2];
  assign fifo_3 = fifo[3];
  assign fifo_4 = fifo[4];
  assign fifo_5 = fifo[5];
  assign fifo_6 = fifo[6];
  assign fifo_7 = fifo[7];
  assign fifo_8 = fifo[8];
  assign fifo_9 = fifo[9];
`endif


//----------------------------------------------------------
// DUT probes

assign mycid        = 6;
assign push1        = `SPC6.ifu_ftu.ftu_fetch_thr_c[mytid];
assign push2        = `SPC6.ifu_ftu.ftu_ibu_redirect_bf[mytid];
assign push_select  = `SPC6.ifu_ftu.ftu_instr_valid_c;
assign flush_upper  = `SPC6.pku.pku_flush_upper_buffer[mytid];
assign flush_head   = `SPC6.pku.pku_flush_buffer0[mytid];
assign pop          = `SPC6.pku.pku_pick_p[mytid];
assign itlb_miss    = `PROBES6.itlb_miss[mytid];
assign icache_miss  = `PROBES6.icache_miss[mytid];
assign fetch_bypass = `PROBES6.fetch_bypass[mytid];
assign exc_valid    = `SPC6.ifu_ftu.ftu_exception_valid_c;

// Error Injection - tlb_sync is pipelining some information that is useful to error injection code.
`ifdef TLB_FIFO_WIDE
assign ifu_err_vect     = {tb_top.ras.ifu_err.ifu_err_code_c[4:0],tb_top.ras.ifu_err.ifu_err_way[2:0]};
assign ifu_err_select   = tb_top.ras.ifu_err.ifu_err_select[3:0];
assign ifetch_err_vld   = tb_top.ras.ifu_err.ifetch_err_vld[3:0];
`else
assign ifu_err_vect     = 8'b0;
assign ifu_err_select   = 4'b0;
assign ifetch_err_vld   = 4'b0;
`endif

//----------------------------------------------------------
initial begin // {
  ready = 0;
  @ (posedge `SPC6.l2clk);
  // Initialize fifo
  fifo_clear;
  itlb_pipe_d = 0;
  ready = `PARGS.tlb_sync_on;
end // }

//----------------------------------------------------------
//  push/pop from FIFO

always @ (posedge (`SPC6.l2clk & ready)) begin // {   

  // Save tstamp if L1 Icache miss & ITLB hit (for later use if bypass)
  if (icache_miss & !itlb_miss) begin // {  
    tstamp_prev = `TOP.core_cycle_cnt - 2;
  end // }


  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {
    fifo_clear;
  end // }
  else begin // {

    itlb_pipe_d <= pop ? fifo[pop_ptr] : itlb_pipe_d;  // Get new value or hold state


    //------------------------
    // Pop FIFO - special case

    // This code must be above the Push FIFO code.
    //   to handle the case if (flush_head and push and IB was empty)
    // Only flush_head if fifo is not empty
    // Don't need to qualify with flush_upper because the buffer will
    //   be cleared by code below.
    if (flush_head && (pop_ptr != push_ptr)) begin // {
      fifo_pop;
    end // }

    //------------------------
    //  Push FIFO

    // push_select may be asserted at same time as exc_valid.
    // exc_valid should override.

    // If exc_valid, I must push 2 valid tstamp in IB before making IB full.
    //   this is because the exception instruction will get to W and will
    //   need a ITLB_READ tstamp.
    // exc_valid will only be asserted if there is room in IB for 4 entries
    //    so it is safe to push 2 entries.
    // It is required to push 2 because the 1st entry may be DS of annul branch,
    //   then the exception happens on next instruction after DS.

    if (exc_valid && push1 && !push2 && !flush_upper) begin // {

      // It is possible to get back-to-back exceptions.
      //   So, need to check for fifo full before fifo_push.
      // It is possible to have only 1 entry available after the 1 exception.
      //   if there was a pop at the same time as the exception.

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
    end // }

    else  begin // {

      if (push_select[0] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }
  
      if (push_select[1] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
  
      if (push_select[2] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[2], ifetch_err_vld[2]);
      end // }

      if (push_select[3] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[3], ifetch_err_vld[3]);
      end // }

    end // }

    //------------------------
    //  Pop FIFO

    // It is possible to push and flush_upper in the same cycle.
    // If this happens, flush_upper takes priority.
    // So, flush code must be after push code since same always block.

    // If flush_head and push in same cycle, there will be 1 entry in IB.
    // Essentially, flush_head is ignored, then an entry is pushed.


    case ({flush_upper, flush_head, pop}) // {
      3'b000: begin
                // NOP
              end
      3'b001: begin
                fifo_pop;
              end
      3'b010: begin
                // NOP - case handled in code above
              end
      3'b011: begin
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
      3'b100: begin
                // Only flush_upper if fifo is not empty
                if (pop_ptr != push_ptr)  begin // {
                  fifo_pop_upper;
                end // }
              end
      3'b101: begin
                fifo_clear;
              end
      3'b110: begin
                fifo_clear;
              end
      3'b111: begin 
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
    endcase  // }

    // It is possible to get a pop and exception.
    // In this case, the pop will happen, then the IB is made full.
    if (exc_valid && push1 && !push2 && !flush_upper) begin // {
      fifo_full;
    end // }

  end // }
end // always }

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_clear;
  integer i;
  begin // {
    // Initialize fifo
    pop_ptr = 0;
    push_ptr = 0;

    for (i=0; i<FIFO_DEPTH; i=i+1) begin // {
      fifo[i] <= 0;
    end  // }

  end // }
endtask

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_full;
  integer i;
  begin // {

    // Increment push_ptr to full buffere
    if (pop_ptr == 0) begin // { 
      push_ptr  = FIFO_DEPTH-1;
    end // }
    else begin // {
      push_ptr  = pop_ptr - 1;
    end // }

  end // }
endtask

//----------------------------------------------------------
// Pop item from FIFO
task fifo_pop;

  begin // {

    // Make sure the FIFO is not empty before pop
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Underflow.  PKU is trying to pick from empty IB.", mycid,mytid);
    end // }

    // Clear entry in fifo
    fifo[pop_ptr] <= 0;

    // Increment pop pointer
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      pop_ptr = 0;
    end // }
    else begin // {
      pop_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Flush all items from FIFO except head
task fifo_pop_upper;

  integer i;

  begin // {

    // Make sure the FIFO is not empty
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IFU is trying to flush upper, but IB is empty.", mycid,mytid);
    end // }

    // Make push ptr 1 entry above pop ptr
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Push item to FIFO
task fifo_push;

  input       err_select;
  input       cache_err_vld;
  reg   [7:0] tmp_err_vect;

  begin // {

    tstamp_curr = `TOP.core_cycle_cnt - 2;

    `ifdef TLB_FIFO_WIDE
      tmp_err_vect = err_select ? ifu_err_vect : 8'b0;
      fifo[push_ptr] <= fetch_bypass ? {cache_err_vld,tmp_err_vect,tstamp_prev} : {cache_err_vld,tmp_err_vect,tstamp_curr};
    `else
      fifo[push_ptr] <= fetch_bypass ? tstamp_prev : tstamp_curr;
    `endif

    // Increment push pointer
    if (push_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = push_ptr + 1;
    end // }
     
    // Check for Overflow after push
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Overflow. IFU is trying to fetch another instruction, but IB is already full.", mycid,mytid);
    end // }

  end // }
endtask

//----------------------------------------------------------
`endif
endmodule

`endif

`ifdef CORE_7

module tlb_fifo_c7 (

  // Inputs
  mytid,

  // Outputs
  itlb_pipe_d
);

`include "tlb_sync.vh"

// FIFO_DEPTH is 1 more than IB depth in RTL
// so that overflow can be detected properly.
parameter FIFO_DEPTH = 9;
parameter PTR_WIDTH  = 4;

input                     [2:0] mytid;
output  [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
`ifndef GATESIM

wire                      [2:0] mycid;
wire                            push1;  // 1st signal to qualify push_select
wire                            push2;  // 2nd signal to qualify push_select
wire                      [3:0] push_select;  // 1-4 tstamps are pushed
wire                            flush_upper;
wire                            flush_head;
wire                            pop;
wire                            itlb_miss;
wire                            icache_miss;
wire                            fetch_bypass;
wire                            exc_valid;  // Exception valid
reg                             ib_full;
wire                      [7:0] ifu_err_vect;
wire                      [3:0] ifu_err_select;
wire                      [3:0] ifetch_err_vld;

reg           [(`TS_WIDTH-1):0] tstamp_curr;
reg           [(`TS_WIDTH-1):0] tstamp_prev;

reg     [(`TLB_FIFO_WIDTH-1):0] fifo      [0:(FIFO_DEPTH-1)];  // reg array
reg           [(PTR_WIDTH-1):0] pop_ptr;
reg           [(PTR_WIDTH-1):0] push_ptr;
reg     [(`TLB_FIFO_WIDTH-1):0] itlb_pipe_d;
reg                             ready;

//----------------------------------------------------------
// Create wires for reg array so signals can be viewed in Debussy
`ifdef DEBUG_TLB
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_0;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_1;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_2;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_3;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_4;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_5;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_6;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_7;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_8;
  wire [(`TLB_FIFO_WIDTH-1):0] fifo_9;

  assign fifo_0 = fifo[0];
  assign fifo_1 = fifo[1];
  assign fifo_2 = fifo[2];
  assign fifo_3 = fifo[3];
  assign fifo_4 = fifo[4];
  assign fifo_5 = fifo[5];
  assign fifo_6 = fifo[6];
  assign fifo_7 = fifo[7];
  assign fifo_8 = fifo[8];
  assign fifo_9 = fifo[9];
`endif


//----------------------------------------------------------
// DUT probes

assign mycid        = 7;
assign push1        = `SPC7.ifu_ftu.ftu_fetch_thr_c[mytid];
assign push2        = `SPC7.ifu_ftu.ftu_ibu_redirect_bf[mytid];
assign push_select  = `SPC7.ifu_ftu.ftu_instr_valid_c;
assign flush_upper  = `SPC7.pku.pku_flush_upper_buffer[mytid];
assign flush_head   = `SPC7.pku.pku_flush_buffer0[mytid];
assign pop          = `SPC7.pku.pku_pick_p[mytid];
assign itlb_miss    = `PROBES7.itlb_miss[mytid];
assign icache_miss  = `PROBES7.icache_miss[mytid];
assign fetch_bypass = `PROBES7.fetch_bypass[mytid];
assign exc_valid    = `SPC7.ifu_ftu.ftu_exception_valid_c;

// Error Injection - tlb_sync is pipelining some information that is useful to error injection code.
`ifdef TLB_FIFO_WIDE
assign ifu_err_vect     = {tb_top.ras.ifu_err.ifu_err_code_c[4:0],tb_top.ras.ifu_err.ifu_err_way[2:0]};
assign ifu_err_select   = tb_top.ras.ifu_err.ifu_err_select[3:0];
assign ifetch_err_vld   = tb_top.ras.ifu_err.ifetch_err_vld[3:0];
`else
assign ifu_err_vect     = 8'b0;
assign ifu_err_select   = 4'b0;
assign ifetch_err_vld   = 4'b0;
`endif

//----------------------------------------------------------
initial begin // {
  ready = 0;
  @ (posedge `SPC7.l2clk);
  // Initialize fifo
  fifo_clear;
  itlb_pipe_d = 0;
  ready = `PARGS.tlb_sync_on;
end // }

//----------------------------------------------------------
//  push/pop from FIFO

always @ (posedge (`SPC7.l2clk & ready)) begin // {   

  // Save tstamp if L1 Icache miss & ITLB hit (for later use if bypass)
  if (icache_miss & !itlb_miss) begin // {  
    tstamp_prev = `TOP.core_cycle_cnt - 2;
  end // }


  // if POR|WMR, then no TLBread
  if (`TOP.in_reset_core) begin // {
    fifo_clear;
  end // }
  else begin // {

    itlb_pipe_d <= pop ? fifo[pop_ptr] : itlb_pipe_d;  // Get new value or hold state


    //------------------------
    // Pop FIFO - special case

    // This code must be above the Push FIFO code.
    //   to handle the case if (flush_head and push and IB was empty)
    // Only flush_head if fifo is not empty
    // Don't need to qualify with flush_upper because the buffer will
    //   be cleared by code below.
    if (flush_head && (pop_ptr != push_ptr)) begin // {
      fifo_pop;
    end // }

    //------------------------
    //  Push FIFO

    // push_select may be asserted at same time as exc_valid.
    // exc_valid should override.

    // If exc_valid, I must push 2 valid tstamp in IB before making IB full.
    //   this is because the exception instruction will get to W and will
    //   need a ITLB_READ tstamp.
    // exc_valid will only be asserted if there is room in IB for 4 entries
    //    so it is safe to push 2 entries.
    // It is required to push 2 because the 1st entry may be DS of annul branch,
    //   then the exception happens on next instruction after DS.

    if (exc_valid && push1 && !push2 && !flush_upper) begin // {

      // It is possible to get back-to-back exceptions.
      //   So, need to check for fifo full before fifo_push.
      // It is possible to have only 1 entry available after the 1 exception.
      //   if there was a pop at the same time as the exception.

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }

      ib_full = (pop_ptr==0) ? (push_ptr==(FIFO_DEPTH-1)): (push_ptr==(pop_ptr-1));
      if (!ib_full) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
    end // }

    else  begin // {

      if (push_select[0] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[0], ifetch_err_vld[0]);
      end // }
  
      if (push_select[1] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[1], ifetch_err_vld[1]);
      end // }
  
      if (push_select[2] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[2], ifetch_err_vld[2]);
      end // }

      if (push_select[3] && push1 && !push2) begin // {
        fifo_push(ifu_err_select[3], ifetch_err_vld[3]);
      end // }

    end // }

    //------------------------
    //  Pop FIFO

    // It is possible to push and flush_upper in the same cycle.
    // If this happens, flush_upper takes priority.
    // So, flush code must be after push code since same always block.

    // If flush_head and push in same cycle, there will be 1 entry in IB.
    // Essentially, flush_head is ignored, then an entry is pushed.


    case ({flush_upper, flush_head, pop}) // {
      3'b000: begin
                // NOP
              end
      3'b001: begin
                fifo_pop;
              end
      3'b010: begin
                // NOP - case handled in code above
              end
      3'b011: begin
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
      3'b100: begin
                // Only flush_upper if fifo is not empty
                if (pop_ptr != push_ptr)  begin // {
                  fifo_pop_upper;
                end // }
              end
      3'b101: begin
                fifo_clear;
              end
      3'b110: begin
                fifo_clear;
              end
      3'b111: begin 
                `PR_ERROR ("tlb_sync", `ERROR, 
                  "C%0d T%0d Illegal signal combination for IB. flush_upper=%0b flush_head=%0b pick=%0b", 
                  mycid,mytid,flush_upper,flush_head,pop);
              end
    endcase  // }

    // It is possible to get a pop and exception.
    // In this case, the pop will happen, then the IB is made full.
    if (exc_valid && push1 && !push2 && !flush_upper) begin // {
      fifo_full;
    end // }

  end // }
end // always }

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_clear;
  integer i;
  begin // {
    // Initialize fifo
    pop_ptr = 0;
    push_ptr = 0;

    for (i=0; i<FIFO_DEPTH; i=i+1) begin // {
      fifo[i] <= 0;
    end  // }

  end // }
endtask

//----------------------------------------------------------
// Empty FIFO and reset push/pop pointers
task fifo_full;
  integer i;
  begin // {

    // Increment push_ptr to full buffere
    if (pop_ptr == 0) begin // { 
      push_ptr  = FIFO_DEPTH-1;
    end // }
    else begin // {
      push_ptr  = pop_ptr - 1;
    end // }

  end // }
endtask

//----------------------------------------------------------
// Pop item from FIFO
task fifo_pop;

  begin // {

    // Make sure the FIFO is not empty before pop
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Underflow.  PKU is trying to pick from empty IB.", mycid,mytid);
    end // }

    // Clear entry in fifo
    fifo[pop_ptr] <= 0;

    // Increment pop pointer
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      pop_ptr = 0;
    end // }
    else begin // {
      pop_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Flush all items from FIFO except head
task fifo_pop_upper;

  integer i;

  begin // {

    // Make sure the FIFO is not empty
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IFU is trying to flush upper, but IB is empty.", mycid,mytid);
    end // }

    // Make push ptr 1 entry above pop ptr
    if (pop_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = pop_ptr + 1;
    end // }
     

  end // }
endtask

//----------------------------------------------------------
// Push item to FIFO
task fifo_push;

  input       err_select;
  input       cache_err_vld;
  reg   [7:0] tmp_err_vect;

  begin // {

    tstamp_curr = `TOP.core_cycle_cnt - 2;

    `ifdef TLB_FIFO_WIDE
      tmp_err_vect = err_select ? ifu_err_vect : 8'b0;
      fifo[push_ptr] <= fetch_bypass ? {cache_err_vld,tmp_err_vect,tstamp_prev} : {cache_err_vld,tmp_err_vect,tstamp_curr};
    `else
      fifo[push_ptr] <= fetch_bypass ? tstamp_prev : tstamp_curr;
    `endif

    // Increment push pointer
    if (push_ptr==(FIFO_DEPTH-1)) begin // { 
      push_ptr = 0;
    end // }
    else begin // {
      push_ptr = push_ptr + 1;
    end // }
     
    // Check for Overflow after push
    if (pop_ptr == push_ptr)  begin // {
      `PR_ERROR ("tlb_sync", `ERROR, 
          "C%0d T%0d IB Overflow. IFU is trying to fetch another instruction, but IB is already full.", mycid,mytid);
    end // }

  end // }
endtask

//----------------------------------------------------------
`endif
endmodule

`endif

//----------------------------------------------------------
//----------------------------------------------------------
