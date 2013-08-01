// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_trap_core.v
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

module axis_trap_core0 (
  cid,
  pc_dmp_sz,
);

input [2:0] cid;
input [21:0] pc_dmp_sz;

`ifdef AXIS_TL
`ifndef GATESIM
   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;
`endif

//----------------------------------------------------------
reg [63:0] cycle;
  initial cycle = 64'b0;
  always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
    if (`CPU.tcu_aclk) cycle = 0;
    else cycle = cycle + 64'b1;
  end

//*******************************************************************************************************/
reg [76:0] sig_reg_0; 
reg [76:0] sig_reg_1; 
reg [76:0] sig_reg_2; 
reg [76:0] sig_reg_3; 
reg [63:0] kern_cnt;
reg [47:0] pc_0_saved;

//wire kern_start = (pc_0_saved != 48'h20) && (pc_0_w == 48'h20);
always @(negedge `CPU.tcu_aclk) begin
      begin // axis tbcall_region
	$display("%t: dbg rst detected by repeatability_check", $time);
      end
end

always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
  pc_0_saved <= pc_0_w;
  if (`CPU.tcu_aclk) begin 
      sig_reg_1 <= 0;
      sig_reg_2 <= 0;
      sig_reg_3 <= 0;
      sig_reg_0 <= 0;
      kern_cnt <= 0;
  end
  else if (!`CPU.tcu_aclk) begin
    if (tb_top.cpu.spc0.exu0.irf.wr_en_p0) sig_reg_0 <= sig_reg_0 ^ {tb_top.cpu.spc0.exu0.irf.wr_addr_p0,tb_top.cpu.spc0.exu0.irf.wr_data_p0};
    if (tb_top.cpu.spc0.exu0.irf.wr_en_p1) sig_reg_1 <= sig_reg_1 ^ {tb_top.cpu.spc0.exu0.irf.wr_addr_p1,tb_top.cpu.spc0.exu0.irf.wr_data_p1};
    if (tb_top.cpu.spc0.exu1.irf.wr_en_p0) sig_reg_2 <= sig_reg_2 ^ {tb_top.cpu.spc0.exu1.irf.wr_addr_p0,tb_top.cpu.spc0.exu1.irf.wr_data_p0};
    if (tb_top.cpu.spc0.exu1.irf.wr_en_p1) sig_reg_3 <= sig_reg_3 ^ {tb_top.cpu.spc0.exu1.irf.wr_addr_p1,tb_top.cpu.spc0.exu1.irf.wr_data_p1};
    kern_cnt <= kern_cnt + 1;
  end

  if ((kern_cnt[19:0] == 20'hfffff) && tb_top.repeatablility_check) begin // axis tbcall_region
     $display("%t: repeatability_check: core 0, sig_reg_0 = %0h, sig_reg_1 = %0h,  sig_reg_2 = %0h, sig_reg_3 = %0h kern_cnt = %0h, cycle = %0h",$time,sig_reg_0,sig_reg_1,sig_reg_2,sig_reg_3,kern_cnt,cycle);
  end

end

//**************************************************************************************************
//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//


  axis_trap_pipe0 t0 (
   .mycid               (cid),
   .mytid               (3'h0),
   .PC_reg              (pc_0_w)
  );

  wire [2:0] thread0_id=3'h0;
//dbuff_pc dbuff_pc_t0 ({cycle[19:4],`TOP.axis_trap_top.c0.t0.pc_fw2},`CPU.l2clk,3'h0,0);
  dbuff_pc dbuff_pc_t0 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c0.t0.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread0_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP0_0: %h %h \n",tb_top.axis_trap_top.c0.dbuff_pc_t0.addr,tb_top.axis_trap_top.c0.dbuff_pc_t0.ptr_0_cycle);
     $axis_dumpmemh("c0_t0_pctrc.dat",
		    tb_top.axis_trap_top.c0.dbuff_pc_t0.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 1
//


  axis_trap_pipe0 t1 (
   .mycid               (cid),
   .mytid               (3'h1),
   .PC_reg              (pc_1_w)
  );

  wire [2:0] thread1_id=3'h1;
//dbuff_pc dbuff_pc_t1 ({cycle[19:4],`TOP.axis_trap_top.c0.t1.pc_fw2},`CPU.l2clk,3'h1,0);
  dbuff_pc dbuff_pc_t1 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c0.t1.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread1_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP0_1: %h %h \n",tb_top.axis_trap_top.c0.dbuff_pc_t1.addr,tb_top.axis_trap_top.c0.dbuff_pc_t1.ptr_0_cycle);
     $axis_dumpmemh("c0_t1_pctrc.dat",
		    tb_top.axis_trap_top.c0.dbuff_pc_t1.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 2
//


  axis_trap_pipe0 t2 (
   .mycid               (cid),
   .mytid               (3'h2),
   .PC_reg              (pc_2_w)
  );

  wire [2:0] thread2_id=3'h2;
//dbuff_pc dbuff_pc_t2 ({cycle[19:4],`TOP.axis_trap_top.c0.t2.pc_fw2},`CPU.l2clk,3'h2,0);
  dbuff_pc dbuff_pc_t2 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c0.t2.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread2_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP0_2: %h %h \n",tb_top.axis_trap_top.c0.dbuff_pc_t2.addr,tb_top.axis_trap_top.c0.dbuff_pc_t2.ptr_0_cycle);
     $axis_dumpmemh("c0_t2_pctrc.dat",
		    tb_top.axis_trap_top.c0.dbuff_pc_t2.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 3
//


  axis_trap_pipe0 t3 (
   .mycid               (cid),
   .mytid               (3'h3),
   .PC_reg              (pc_3_w)
  );

  wire [2:0] thread3_id=3'h3;
//dbuff_pc dbuff_pc_t3 ({cycle[19:4],`TOP.axis_trap_top.c0.t3.pc_fw2},`CPU.l2clk,3'h3,0);
  dbuff_pc dbuff_pc_t3 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c0.t3.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread3_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP0_3: %h %h \n",tb_top.axis_trap_top.c0.dbuff_pc_t3.addr,tb_top.axis_trap_top.c0.dbuff_pc_t3.ptr_0_cycle);
     $axis_dumpmemh("c0_t3_pctrc.dat",
		    tb_top.axis_trap_top.c0.dbuff_pc_t3.DBUFF);
end


reg [5:0] trl0_tsa_wr_addr_r;
reg [1:0] tsd0_wr_gl_r;
reg [8:0] tsd0_wr_trap_type_r;
reg [47:2] tsd0_wr_tpc_r;
reg        trl0_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl0_tsa_wr_addr_r <= tb_top.cpu.spc0.tlu.trl0_tsa_wr_addr;
   tsd0_wr_gl_r <= tb_top.cpu.spc0.tlu.tsd0_wr_gl;
   tsd0_wr_trap_type_r <= tb_top.cpu.spc0.tlu.tsd0_wr_trap_type[8:0];
   tsd0_wr_tpc_r <= tb_top.cpu.spc0.tlu.tsd0_wr_tpc;
   trl0_tsa_wr_en_r <= tb_top.cpu.spc0.tlu.trl_tsa_wr_en[0];
   if ( trl0_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 0: PIPE 0: %x %3x %12x %2x", $time, tsd0_wr_gl_r, tsd0_wr_trap_type_r, {tsd0_wr_tpc_r, 2'b00}, trl0_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------
//
//  THREAD 4
//


  axis_trap_pipe0 t4 (
   .mycid               (cid),
   .mytid               (3'h4),
   .PC_reg              (pc_4_w)
  );

  wire [2:0] thread4_id=3'h4;
//dbuff_pc dbuff_pc_t4 ({cycle[19:4],`TOP.axis_trap_top.c0.t4.pc_fw2},`CPU.l2clk,3'h4,0);
  dbuff_pc dbuff_pc_t4 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c0.t4.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread4_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP0_4: %h %h \n",tb_top.axis_trap_top.c0.dbuff_pc_t4.addr,tb_top.axis_trap_top.c0.dbuff_pc_t4.ptr_0_cycle);
     $axis_dumpmemh("c0_t4_pctrc.dat",
		    tb_top.axis_trap_top.c0.dbuff_pc_t4.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 5
//


  axis_trap_pipe0 t5 (
   .mycid               (cid),
   .mytid               (3'h5),
   .PC_reg              (pc_5_w)
  );

  wire [2:0] thread5_id=3'h5;
//dbuff_pc dbuff_pc_t5 ({cycle[19:4],`TOP.axis_trap_top.c0.t5.pc_fw2},`CPU.l2clk,3'h5,0);
  dbuff_pc dbuff_pc_t5 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c0.t5.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread5_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP0_5: %h %h \n",tb_top.axis_trap_top.c0.dbuff_pc_t5.addr,tb_top.axis_trap_top.c0.dbuff_pc_t5.ptr_0_cycle);
     $axis_dumpmemh("c0_t5_pctrc.dat",
		    tb_top.axis_trap_top.c0.dbuff_pc_t5.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 6
//


  axis_trap_pipe0 t6 (
   .mycid               (cid),
   .mytid               (3'h6),
   .PC_reg              (pc_6_w)
  );

  wire [2:0] thread6_id=3'h6;
//dbuff_pc dbuff_pc_t6 ({cycle[19:4],`TOP.axis_trap_top.c0.t6.pc_fw2},`CPU.l2clk,3'h6,0);
  dbuff_pc dbuff_pc_t6 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c0.t6.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread6_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP0_6: %h %h \n",tb_top.axis_trap_top.c0.dbuff_pc_t6.addr,tb_top.axis_trap_top.c0.dbuff_pc_t6.ptr_0_cycle);
     $axis_dumpmemh("c0_t6_pctrc.dat",
		    tb_top.axis_trap_top.c0.dbuff_pc_t6.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 7
//


  axis_trap_pipe0 t7 (
   .mycid               (cid),
   .mytid               (3'h7),
   .PC_reg              (pc_7_w)
  );

  wire [2:0] thread7_id=3'h7;
//dbuff_pc dbuff_pc_t7 ({cycle[19:4],`TOP.axis_trap_top.c0.t7.pc_fw2},`CPU.l2clk,3'h7,0);
  dbuff_pc dbuff_pc_t7 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c0.t7.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread7_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP0_7: %h %h \n",tb_top.axis_trap_top.c0.dbuff_pc_t7.addr,tb_top.axis_trap_top.c0.dbuff_pc_t7.ptr_0_cycle);
     $axis_dumpmemh("c0_t7_pctrc.dat",
		    tb_top.axis_trap_top.c0.dbuff_pc_t7.DBUFF);
end


reg [5:0] trl1_tsa_wr_addr_r;
reg [1:0] tsd1_wr_gl_r;
reg [8:0] tsd1_wr_trap_type_r;
reg [47:2] tsd1_wr_tpc_r;
reg        trl1_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl1_tsa_wr_addr_r <= tb_top.cpu.spc0.tlu.trl1_tsa_wr_addr;
   tsd1_wr_gl_r <= tb_top.cpu.spc0.tlu.tsd1_wr_gl;
   tsd1_wr_trap_type_r <= tb_top.cpu.spc0.tlu.tsd1_wr_trap_type[8:0];
   tsd1_wr_tpc_r <= tb_top.cpu.spc0.tlu.tsd1_wr_tpc;
   trl1_tsa_wr_en_r <= tb_top.cpu.spc0.tlu.trl_tsa_wr_en[1];
   if ( trl1_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 0: PIPE 1: %x %3x %12x %2x", $time, tsd1_wr_gl_r, tsd1_wr_trap_type_r, {tsd1_wr_tpc_r, 2'b00}, trl1_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------

`ifndef GATESIM

// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
wire [7:0] select_pc_b_with_errors;

assign select_pc_b_with_errors =
     {{4 {~`SPC0.dec_flush_b[1]}}, {4 {~`SPC0.dec_flush_b[0]}}} & 

     {~(`SPC0.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC0.tlu.fls1.idl_req_in}}),
      ~(`SPC0.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC0.tlu.fls0.idl_req_in}})} &
     {`SPC0.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC0.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Suppress instruction on flush or park request (clear_disrupting_flush_pending)
// Qualify select_pc_b_with_errors, with no errors to get final select_pc_b signal
wire [7:0] select_pc_b;

assign select_pc_b =
     select_pc_b_with_errors[7:0]  &
     {{4 {~`SPC0.tlu.fls1.ic_err_w_in}}, {4 {~`SPC0.tlu.fls0.ic_err_w_in}}};

//------------------------------------
// ASI & Trap State machines
always @(posedge `SPC0.gclk) begin // {

//    pc_0_e[47:0] <= `SPC0.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC0.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC0.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC0.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;
end

`endif
`endif //AXIS_TL

//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_1

module axis_trap_core1 (
  cid,
  pc_dmp_sz,
);

input [2:0] cid;
input [21:0] pc_dmp_sz;

`ifdef AXIS_TL
`ifndef GATESIM
   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;
`endif

//----------------------------------------------------------
reg [63:0] cycle;
  initial cycle = 64'b0;
  always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
    if (`CPU.tcu_aclk) cycle = 0;
    else cycle = cycle + 64'b1;
  end

//*******************************************************************************************************/
reg [76:0] sig_reg_0; 
reg [76:0] sig_reg_1; 
reg [76:0] sig_reg_2; 
reg [76:0] sig_reg_3; 
reg [63:0] kern_cnt;
reg [47:0] pc_0_saved;

//wire kern_start = (pc_0_saved != 48'h20) && (pc_0_w == 48'h20);
always @(negedge `CPU.tcu_aclk) begin
      begin // axis tbcall_region
	$display("%t: dbg rst detected by repeatability_check", $time);
      end
end

always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
  pc_0_saved <= pc_0_w;
  if (`CPU.tcu_aclk) begin 
      sig_reg_1 <= 0;
      sig_reg_2 <= 0;
      sig_reg_3 <= 0;
      sig_reg_0 <= 0;
      kern_cnt <= 0;
  end
  else if (!`CPU.tcu_aclk) begin
    if (tb_top.cpu.spc1.exu0.irf.wr_en_p0) sig_reg_0 <= sig_reg_0 ^ {tb_top.cpu.spc1.exu0.irf.wr_addr_p0,tb_top.cpu.spc1.exu0.irf.wr_data_p0};
    if (tb_top.cpu.spc1.exu0.irf.wr_en_p1) sig_reg_1 <= sig_reg_1 ^ {tb_top.cpu.spc1.exu0.irf.wr_addr_p1,tb_top.cpu.spc1.exu0.irf.wr_data_p1};
    if (tb_top.cpu.spc1.exu1.irf.wr_en_p0) sig_reg_2 <= sig_reg_2 ^ {tb_top.cpu.spc1.exu1.irf.wr_addr_p0,tb_top.cpu.spc1.exu1.irf.wr_data_p0};
    if (tb_top.cpu.spc1.exu1.irf.wr_en_p1) sig_reg_3 <= sig_reg_3 ^ {tb_top.cpu.spc1.exu1.irf.wr_addr_p1,tb_top.cpu.spc1.exu1.irf.wr_data_p1};
    kern_cnt <= kern_cnt + 1;
  end

  if ((kern_cnt[19:0] == 20'hfffff) && tb_top.repeatablility_check) begin // axis tbcall_region
     $display("%t: repeatability_check: core 1, sig_reg_0 = %0h, sig_reg_1 = %0h,  sig_reg_2 = %0h, sig_reg_3 = %0h kern_cnt = %0h, cycle = %0h",$time,sig_reg_0,sig_reg_1,sig_reg_2,sig_reg_3,kern_cnt,cycle);
  end

end

//**************************************************************************************************
//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//


  axis_trap_pipe1 t0 (
   .mycid               (cid),
   .mytid               (3'h0),
   .PC_reg              (pc_0_w)
  );

  wire [2:0] thread0_id=3'h0;
//dbuff_pc dbuff_pc_t0 ({cycle[19:4],`TOP.axis_trap_top.c1.t0.pc_fw2},`CPU.l2clk,3'h0,1);
  dbuff_pc dbuff_pc_t0 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c1.t0.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread0_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP1_0: %h %h \n",tb_top.axis_trap_top.c1.dbuff_pc_t0.addr,tb_top.axis_trap_top.c1.dbuff_pc_t0.ptr_0_cycle);
     $axis_dumpmemh("c1_t0_pctrc.dat",
		    tb_top.axis_trap_top.c1.dbuff_pc_t0.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 1
//


  axis_trap_pipe1 t1 (
   .mycid               (cid),
   .mytid               (3'h1),
   .PC_reg              (pc_1_w)
  );

  wire [2:0] thread1_id=3'h1;
//dbuff_pc dbuff_pc_t1 ({cycle[19:4],`TOP.axis_trap_top.c1.t1.pc_fw2},`CPU.l2clk,3'h1,1);
  dbuff_pc dbuff_pc_t1 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c1.t1.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread1_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP1_1: %h %h \n",tb_top.axis_trap_top.c1.dbuff_pc_t1.addr,tb_top.axis_trap_top.c1.dbuff_pc_t1.ptr_0_cycle);
     $axis_dumpmemh("c1_t1_pctrc.dat",
		    tb_top.axis_trap_top.c1.dbuff_pc_t1.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 2
//


  axis_trap_pipe1 t2 (
   .mycid               (cid),
   .mytid               (3'h2),
   .PC_reg              (pc_2_w)
  );

  wire [2:0] thread2_id=3'h2;
//dbuff_pc dbuff_pc_t2 ({cycle[19:4],`TOP.axis_trap_top.c1.t2.pc_fw2},`CPU.l2clk,3'h2,1);
  dbuff_pc dbuff_pc_t2 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c1.t2.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread2_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP1_2: %h %h \n",tb_top.axis_trap_top.c1.dbuff_pc_t2.addr,tb_top.axis_trap_top.c1.dbuff_pc_t2.ptr_0_cycle);
     $axis_dumpmemh("c1_t2_pctrc.dat",
		    tb_top.axis_trap_top.c1.dbuff_pc_t2.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 3
//


  axis_trap_pipe1 t3 (
   .mycid               (cid),
   .mytid               (3'h3),
   .PC_reg              (pc_3_w)
  );

  wire [2:0] thread3_id=3'h3;
//dbuff_pc dbuff_pc_t3 ({cycle[19:4],`TOP.axis_trap_top.c1.t3.pc_fw2},`CPU.l2clk,3'h3,1);
  dbuff_pc dbuff_pc_t3 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c1.t3.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread3_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP1_3: %h %h \n",tb_top.axis_trap_top.c1.dbuff_pc_t3.addr,tb_top.axis_trap_top.c1.dbuff_pc_t3.ptr_0_cycle);
     $axis_dumpmemh("c1_t3_pctrc.dat",
		    tb_top.axis_trap_top.c1.dbuff_pc_t3.DBUFF);
end


reg [5:0] trl0_tsa_wr_addr_r;
reg [1:0] tsd0_wr_gl_r;
reg [8:0] tsd0_wr_trap_type_r;
reg [47:2] tsd0_wr_tpc_r;
reg        trl0_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl0_tsa_wr_addr_r <= tb_top.cpu.spc1.tlu.trl0_tsa_wr_addr;
   tsd0_wr_gl_r <= tb_top.cpu.spc1.tlu.tsd0_wr_gl;
   tsd0_wr_trap_type_r <= tb_top.cpu.spc1.tlu.tsd0_wr_trap_type[8:0];
   tsd0_wr_tpc_r <= tb_top.cpu.spc1.tlu.tsd0_wr_tpc;
   trl0_tsa_wr_en_r <= tb_top.cpu.spc1.tlu.trl_tsa_wr_en[0];
   if ( trl0_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 1: PIPE 0: %x %3x %12x %2x", $time, tsd0_wr_gl_r, tsd0_wr_trap_type_r, {tsd0_wr_tpc_r, 2'b00}, trl0_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------
//
//  THREAD 4
//


  axis_trap_pipe1 t4 (
   .mycid               (cid),
   .mytid               (3'h4),
   .PC_reg              (pc_4_w)
  );

  wire [2:0] thread4_id=3'h4;
//dbuff_pc dbuff_pc_t4 ({cycle[19:4],`TOP.axis_trap_top.c1.t4.pc_fw2},`CPU.l2clk,3'h4,1);
  dbuff_pc dbuff_pc_t4 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c1.t4.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread4_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP1_4: %h %h \n",tb_top.axis_trap_top.c1.dbuff_pc_t4.addr,tb_top.axis_trap_top.c1.dbuff_pc_t4.ptr_0_cycle);
     $axis_dumpmemh("c1_t4_pctrc.dat",
		    tb_top.axis_trap_top.c1.dbuff_pc_t4.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 5
//


  axis_trap_pipe1 t5 (
   .mycid               (cid),
   .mytid               (3'h5),
   .PC_reg              (pc_5_w)
  );

  wire [2:0] thread5_id=3'h5;
//dbuff_pc dbuff_pc_t5 ({cycle[19:4],`TOP.axis_trap_top.c1.t5.pc_fw2},`CPU.l2clk,3'h5,1);
  dbuff_pc dbuff_pc_t5 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c1.t5.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread5_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP1_5: %h %h \n",tb_top.axis_trap_top.c1.dbuff_pc_t5.addr,tb_top.axis_trap_top.c1.dbuff_pc_t5.ptr_0_cycle);
     $axis_dumpmemh("c1_t5_pctrc.dat",
		    tb_top.axis_trap_top.c1.dbuff_pc_t5.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 6
//


  axis_trap_pipe1 t6 (
   .mycid               (cid),
   .mytid               (3'h6),
   .PC_reg              (pc_6_w)
  );

  wire [2:0] thread6_id=3'h6;
//dbuff_pc dbuff_pc_t6 ({cycle[19:4],`TOP.axis_trap_top.c1.t6.pc_fw2},`CPU.l2clk,3'h6,1);
  dbuff_pc dbuff_pc_t6 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c1.t6.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread6_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP1_6: %h %h \n",tb_top.axis_trap_top.c1.dbuff_pc_t6.addr,tb_top.axis_trap_top.c1.dbuff_pc_t6.ptr_0_cycle);
     $axis_dumpmemh("c1_t6_pctrc.dat",
		    tb_top.axis_trap_top.c1.dbuff_pc_t6.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 7
//


  axis_trap_pipe1 t7 (
   .mycid               (cid),
   .mytid               (3'h7),
   .PC_reg              (pc_7_w)
  );

  wire [2:0] thread7_id=3'h7;
//dbuff_pc dbuff_pc_t7 ({cycle[19:4],`TOP.axis_trap_top.c1.t7.pc_fw2},`CPU.l2clk,3'h7,1);
  dbuff_pc dbuff_pc_t7 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c1.t7.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread7_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP1_7: %h %h \n",tb_top.axis_trap_top.c1.dbuff_pc_t7.addr,tb_top.axis_trap_top.c1.dbuff_pc_t7.ptr_0_cycle);
     $axis_dumpmemh("c1_t7_pctrc.dat",
		    tb_top.axis_trap_top.c1.dbuff_pc_t7.DBUFF);
end


reg [5:0] trl1_tsa_wr_addr_r;
reg [1:0] tsd1_wr_gl_r;
reg [8:0] tsd1_wr_trap_type_r;
reg [47:2] tsd1_wr_tpc_r;
reg        trl1_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl1_tsa_wr_addr_r <= tb_top.cpu.spc1.tlu.trl1_tsa_wr_addr;
   tsd1_wr_gl_r <= tb_top.cpu.spc1.tlu.tsd1_wr_gl;
   tsd1_wr_trap_type_r <= tb_top.cpu.spc1.tlu.tsd1_wr_trap_type[8:0];
   tsd1_wr_tpc_r <= tb_top.cpu.spc1.tlu.tsd1_wr_tpc;
   trl1_tsa_wr_en_r <= tb_top.cpu.spc1.tlu.trl_tsa_wr_en[1];
   if ( trl1_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 1: PIPE 1: %x %3x %12x %2x", $time, tsd1_wr_gl_r, tsd1_wr_trap_type_r, {tsd1_wr_tpc_r, 2'b00}, trl1_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------

`ifndef GATESIM

// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
wire [7:0] select_pc_b_with_errors;

assign select_pc_b_with_errors =
     {{4 {~`SPC1.dec_flush_b[1]}}, {4 {~`SPC1.dec_flush_b[0]}}} & 

     {~(`SPC1.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC1.tlu.fls1.idl_req_in}}),
      ~(`SPC1.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC1.tlu.fls0.idl_req_in}})} &
     {`SPC1.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC1.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Suppress instruction on flush or park request (clear_disrupting_flush_pending)
// Qualify select_pc_b_with_errors, with no errors to get final select_pc_b signal
wire [7:0] select_pc_b;

assign select_pc_b =
     select_pc_b_with_errors[7:0]  &
     {{4 {~`SPC1.tlu.fls1.ic_err_w_in}}, {4 {~`SPC1.tlu.fls0.ic_err_w_in}}};

//------------------------------------
// ASI & Trap State machines
always @(posedge `SPC1.gclk) begin // {

//    pc_0_e[47:0] <= `SPC1.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC1.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC1.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC1.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;
end

`endif
`endif //AXIS_TL

//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_2

module axis_trap_core2 (
  cid,
  pc_dmp_sz,
);

input [2:0] cid;
input [21:0] pc_dmp_sz;

`ifdef AXIS_TL
`ifndef GATESIM
   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;
`endif

//----------------------------------------------------------
reg [63:0] cycle;
  initial cycle = 64'b0;
  always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
    if (`CPU.tcu_aclk) cycle = 0;
    else cycle = cycle + 64'b1;
  end

//*******************************************************************************************************/
reg [76:0] sig_reg_0; 
reg [76:0] sig_reg_1; 
reg [76:0] sig_reg_2; 
reg [76:0] sig_reg_3; 
reg [63:0] kern_cnt;
reg [47:0] pc_0_saved;

//wire kern_start = (pc_0_saved != 48'h20) && (pc_0_w == 48'h20);
always @(negedge `CPU.tcu_aclk) begin
      begin // axis tbcall_region
	$display("%t: dbg rst detected by repeatability_check", $time);
      end
end

always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
  pc_0_saved <= pc_0_w;
  if (`CPU.tcu_aclk) begin 
      sig_reg_1 <= 0;
      sig_reg_2 <= 0;
      sig_reg_3 <= 0;
      sig_reg_0 <= 0;
      kern_cnt <= 0;
  end
  else if (!`CPU.tcu_aclk) begin
    if (tb_top.cpu.spc2.exu0.irf.wr_en_p0) sig_reg_0 <= sig_reg_0 ^ {tb_top.cpu.spc2.exu0.irf.wr_addr_p0,tb_top.cpu.spc2.exu0.irf.wr_data_p0};
    if (tb_top.cpu.spc2.exu0.irf.wr_en_p1) sig_reg_1 <= sig_reg_1 ^ {tb_top.cpu.spc2.exu0.irf.wr_addr_p1,tb_top.cpu.spc2.exu0.irf.wr_data_p1};
    if (tb_top.cpu.spc2.exu1.irf.wr_en_p0) sig_reg_2 <= sig_reg_2 ^ {tb_top.cpu.spc2.exu1.irf.wr_addr_p0,tb_top.cpu.spc2.exu1.irf.wr_data_p0};
    if (tb_top.cpu.spc2.exu1.irf.wr_en_p1) sig_reg_3 <= sig_reg_3 ^ {tb_top.cpu.spc2.exu1.irf.wr_addr_p1,tb_top.cpu.spc2.exu1.irf.wr_data_p1};
    kern_cnt <= kern_cnt + 1;
  end

  if ((kern_cnt[19:0] == 20'hfffff) && tb_top.repeatablility_check) begin // axis tbcall_region
     $display("%t: repeatability_check: core 2, sig_reg_0 = %0h, sig_reg_1 = %0h,  sig_reg_2 = %0h, sig_reg_3 = %0h kern_cnt = %0h, cycle = %0h",$time,sig_reg_0,sig_reg_1,sig_reg_2,sig_reg_3,kern_cnt,cycle);
  end

end

//**************************************************************************************************
//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//


  axis_trap_pipe2 t0 (
   .mycid               (cid),
   .mytid               (3'h0),
   .PC_reg              (pc_0_w)
  );

  wire [2:0] thread0_id=3'h0;
//dbuff_pc dbuff_pc_t0 ({cycle[19:4],`TOP.axis_trap_top.c2.t0.pc_fw2},`CPU.l2clk,3'h0,2);
  dbuff_pc dbuff_pc_t0 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c2.t0.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread0_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP2_0: %h %h \n",tb_top.axis_trap_top.c2.dbuff_pc_t0.addr,tb_top.axis_trap_top.c2.dbuff_pc_t0.ptr_0_cycle);
     $axis_dumpmemh("c2_t0_pctrc.dat",
		    tb_top.axis_trap_top.c2.dbuff_pc_t0.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 1
//


  axis_trap_pipe2 t1 (
   .mycid               (cid),
   .mytid               (3'h1),
   .PC_reg              (pc_1_w)
  );

  wire [2:0] thread1_id=3'h1;
//dbuff_pc dbuff_pc_t1 ({cycle[19:4],`TOP.axis_trap_top.c2.t1.pc_fw2},`CPU.l2clk,3'h1,2);
  dbuff_pc dbuff_pc_t1 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c2.t1.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread1_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP2_1: %h %h \n",tb_top.axis_trap_top.c2.dbuff_pc_t1.addr,tb_top.axis_trap_top.c2.dbuff_pc_t1.ptr_0_cycle);
     $axis_dumpmemh("c2_t1_pctrc.dat",
		    tb_top.axis_trap_top.c2.dbuff_pc_t1.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 2
//


  axis_trap_pipe2 t2 (
   .mycid               (cid),
   .mytid               (3'h2),
   .PC_reg              (pc_2_w)
  );

  wire [2:0] thread2_id=3'h2;
//dbuff_pc dbuff_pc_t2 ({cycle[19:4],`TOP.axis_trap_top.c2.t2.pc_fw2},`CPU.l2clk,3'h2,2);
  dbuff_pc dbuff_pc_t2 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c2.t2.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread2_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP2_2: %h %h \n",tb_top.axis_trap_top.c2.dbuff_pc_t2.addr,tb_top.axis_trap_top.c2.dbuff_pc_t2.ptr_0_cycle);
     $axis_dumpmemh("c2_t2_pctrc.dat",
		    tb_top.axis_trap_top.c2.dbuff_pc_t2.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 3
//


  axis_trap_pipe2 t3 (
   .mycid               (cid),
   .mytid               (3'h3),
   .PC_reg              (pc_3_w)
  );

  wire [2:0] thread3_id=3'h3;
//dbuff_pc dbuff_pc_t3 ({cycle[19:4],`TOP.axis_trap_top.c2.t3.pc_fw2},`CPU.l2clk,3'h3,2);
  dbuff_pc dbuff_pc_t3 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c2.t3.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread3_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP2_3: %h %h \n",tb_top.axis_trap_top.c2.dbuff_pc_t3.addr,tb_top.axis_trap_top.c2.dbuff_pc_t3.ptr_0_cycle);
     $axis_dumpmemh("c2_t3_pctrc.dat",
		    tb_top.axis_trap_top.c2.dbuff_pc_t3.DBUFF);
end


reg [5:0] trl0_tsa_wr_addr_r;
reg [1:0] tsd0_wr_gl_r;
reg [8:0] tsd0_wr_trap_type_r;
reg [47:2] tsd0_wr_tpc_r;
reg        trl0_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl0_tsa_wr_addr_r <= tb_top.cpu.spc2.tlu.trl0_tsa_wr_addr;
   tsd0_wr_gl_r <= tb_top.cpu.spc2.tlu.tsd0_wr_gl;
   tsd0_wr_trap_type_r <= tb_top.cpu.spc2.tlu.tsd0_wr_trap_type[8:0];
   tsd0_wr_tpc_r <= tb_top.cpu.spc2.tlu.tsd0_wr_tpc;
   trl0_tsa_wr_en_r <= tb_top.cpu.spc2.tlu.trl_tsa_wr_en[0];
   if ( trl0_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 2: PIPE 0: %x %3x %12x %2x", $time, tsd0_wr_gl_r, tsd0_wr_trap_type_r, {tsd0_wr_tpc_r, 2'b00}, trl0_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------
//
//  THREAD 4
//


  axis_trap_pipe2 t4 (
   .mycid               (cid),
   .mytid               (3'h4),
   .PC_reg              (pc_4_w)
  );

  wire [2:0] thread4_id=3'h4;
//dbuff_pc dbuff_pc_t4 ({cycle[19:4],`TOP.axis_trap_top.c2.t4.pc_fw2},`CPU.l2clk,3'h4,2);
  dbuff_pc dbuff_pc_t4 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c2.t4.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread4_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP2_4: %h %h \n",tb_top.axis_trap_top.c2.dbuff_pc_t4.addr,tb_top.axis_trap_top.c2.dbuff_pc_t4.ptr_0_cycle);
     $axis_dumpmemh("c2_t4_pctrc.dat",
		    tb_top.axis_trap_top.c2.dbuff_pc_t4.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 5
//


  axis_trap_pipe2 t5 (
   .mycid               (cid),
   .mytid               (3'h5),
   .PC_reg              (pc_5_w)
  );

  wire [2:0] thread5_id=3'h5;
//dbuff_pc dbuff_pc_t5 ({cycle[19:4],`TOP.axis_trap_top.c2.t5.pc_fw2},`CPU.l2clk,3'h5,2);
  dbuff_pc dbuff_pc_t5 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c2.t5.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread5_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP2_5: %h %h \n",tb_top.axis_trap_top.c2.dbuff_pc_t5.addr,tb_top.axis_trap_top.c2.dbuff_pc_t5.ptr_0_cycle);
     $axis_dumpmemh("c2_t5_pctrc.dat",
		    tb_top.axis_trap_top.c2.dbuff_pc_t5.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 6
//


  axis_trap_pipe2 t6 (
   .mycid               (cid),
   .mytid               (3'h6),
   .PC_reg              (pc_6_w)
  );

  wire [2:0] thread6_id=3'h6;
//dbuff_pc dbuff_pc_t6 ({cycle[19:4],`TOP.axis_trap_top.c2.t6.pc_fw2},`CPU.l2clk,3'h6,2);
  dbuff_pc dbuff_pc_t6 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c2.t6.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread6_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP2_6: %h %h \n",tb_top.axis_trap_top.c2.dbuff_pc_t6.addr,tb_top.axis_trap_top.c2.dbuff_pc_t6.ptr_0_cycle);
     $axis_dumpmemh("c2_t6_pctrc.dat",
		    tb_top.axis_trap_top.c2.dbuff_pc_t6.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 7
//


  axis_trap_pipe2 t7 (
   .mycid               (cid),
   .mytid               (3'h7),
   .PC_reg              (pc_7_w)
  );

  wire [2:0] thread7_id=3'h7;
//dbuff_pc dbuff_pc_t7 ({cycle[19:4],`TOP.axis_trap_top.c2.t7.pc_fw2},`CPU.l2clk,3'h7,2);
  dbuff_pc dbuff_pc_t7 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c2.t7.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread7_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP2_7: %h %h \n",tb_top.axis_trap_top.c2.dbuff_pc_t7.addr,tb_top.axis_trap_top.c2.dbuff_pc_t7.ptr_0_cycle);
     $axis_dumpmemh("c2_t7_pctrc.dat",
		    tb_top.axis_trap_top.c2.dbuff_pc_t7.DBUFF);
end


reg [5:0] trl1_tsa_wr_addr_r;
reg [1:0] tsd1_wr_gl_r;
reg [8:0] tsd1_wr_trap_type_r;
reg [47:2] tsd1_wr_tpc_r;
reg        trl1_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl1_tsa_wr_addr_r <= tb_top.cpu.spc2.tlu.trl1_tsa_wr_addr;
   tsd1_wr_gl_r <= tb_top.cpu.spc2.tlu.tsd1_wr_gl;
   tsd1_wr_trap_type_r <= tb_top.cpu.spc2.tlu.tsd1_wr_trap_type[8:0];
   tsd1_wr_tpc_r <= tb_top.cpu.spc2.tlu.tsd1_wr_tpc;
   trl1_tsa_wr_en_r <= tb_top.cpu.spc2.tlu.trl_tsa_wr_en[1];
   if ( trl1_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 2: PIPE 1: %x %3x %12x %2x", $time, tsd1_wr_gl_r, tsd1_wr_trap_type_r, {tsd1_wr_tpc_r, 2'b00}, trl1_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------

`ifndef GATESIM

// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
wire [7:0] select_pc_b_with_errors;

assign select_pc_b_with_errors =
     {{4 {~`SPC2.dec_flush_b[1]}}, {4 {~`SPC2.dec_flush_b[0]}}} & 

     {~(`SPC2.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC2.tlu.fls1.idl_req_in}}),
      ~(`SPC2.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC2.tlu.fls0.idl_req_in}})} &
     {`SPC2.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC2.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Suppress instruction on flush or park request (clear_disrupting_flush_pending)
// Qualify select_pc_b_with_errors, with no errors to get final select_pc_b signal
wire [7:0] select_pc_b;

assign select_pc_b =
     select_pc_b_with_errors[7:0]  &
     {{4 {~`SPC2.tlu.fls1.ic_err_w_in}}, {4 {~`SPC2.tlu.fls0.ic_err_w_in}}};

//------------------------------------
// ASI & Trap State machines
always @(posedge `SPC2.gclk) begin // {

//    pc_0_e[47:0] <= `SPC2.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC2.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC2.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC2.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;
end

`endif
`endif //AXIS_TL

//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_3

module axis_trap_core3 (
  cid,
  pc_dmp_sz,
);

input [2:0] cid;
input [21:0] pc_dmp_sz;

`ifdef AXIS_TL
`ifndef GATESIM
   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;
`endif

//----------------------------------------------------------
reg [63:0] cycle;
  initial cycle = 64'b0;
  always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
    if (`CPU.tcu_aclk) cycle = 0;
    else cycle = cycle + 64'b1;
  end

//*******************************************************************************************************/
reg [76:0] sig_reg_0; 
reg [76:0] sig_reg_1; 
reg [76:0] sig_reg_2; 
reg [76:0] sig_reg_3; 
reg [63:0] kern_cnt;
reg [47:0] pc_0_saved;

//wire kern_start = (pc_0_saved != 48'h20) && (pc_0_w == 48'h20);
always @(negedge `CPU.tcu_aclk) begin
      begin // axis tbcall_region
	$display("%t: dbg rst detected by repeatability_check", $time);
      end
end

always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
  pc_0_saved <= pc_0_w;
  if (`CPU.tcu_aclk) begin 
      sig_reg_1 <= 0;
      sig_reg_2 <= 0;
      sig_reg_3 <= 0;
      sig_reg_0 <= 0;
      kern_cnt <= 0;
  end
  else if (!`CPU.tcu_aclk) begin
    if (tb_top.cpu.spc3.exu0.irf.wr_en_p0) sig_reg_0 <= sig_reg_0 ^ {tb_top.cpu.spc3.exu0.irf.wr_addr_p0,tb_top.cpu.spc3.exu0.irf.wr_data_p0};
    if (tb_top.cpu.spc3.exu0.irf.wr_en_p1) sig_reg_1 <= sig_reg_1 ^ {tb_top.cpu.spc3.exu0.irf.wr_addr_p1,tb_top.cpu.spc3.exu0.irf.wr_data_p1};
    if (tb_top.cpu.spc3.exu1.irf.wr_en_p0) sig_reg_2 <= sig_reg_2 ^ {tb_top.cpu.spc3.exu1.irf.wr_addr_p0,tb_top.cpu.spc3.exu1.irf.wr_data_p0};
    if (tb_top.cpu.spc3.exu1.irf.wr_en_p1) sig_reg_3 <= sig_reg_3 ^ {tb_top.cpu.spc3.exu1.irf.wr_addr_p1,tb_top.cpu.spc3.exu1.irf.wr_data_p1};
    kern_cnt <= kern_cnt + 1;
  end

  if ((kern_cnt[19:0] == 20'hfffff) && tb_top.repeatablility_check) begin // axis tbcall_region
     $display("%t: repeatability_check: core 3, sig_reg_0 = %0h, sig_reg_1 = %0h,  sig_reg_2 = %0h, sig_reg_3 = %0h kern_cnt = %0h, cycle = %0h",$time,sig_reg_0,sig_reg_1,sig_reg_2,sig_reg_3,kern_cnt,cycle);
  end

end

//**************************************************************************************************
//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//


  axis_trap_pipe3 t0 (
   .mycid               (cid),
   .mytid               (3'h0),
   .PC_reg              (pc_0_w)
  );

  wire [2:0] thread0_id=3'h0;
//dbuff_pc dbuff_pc_t0 ({cycle[19:4],`TOP.axis_trap_top.c3.t0.pc_fw2},`CPU.l2clk,3'h0,3);
  dbuff_pc dbuff_pc_t0 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c3.t0.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread0_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP3_0: %h %h \n",tb_top.axis_trap_top.c3.dbuff_pc_t0.addr,tb_top.axis_trap_top.c3.dbuff_pc_t0.ptr_0_cycle);
     $axis_dumpmemh("c3_t0_pctrc.dat",
		    tb_top.axis_trap_top.c3.dbuff_pc_t0.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 1
//


  axis_trap_pipe3 t1 (
   .mycid               (cid),
   .mytid               (3'h1),
   .PC_reg              (pc_1_w)
  );

  wire [2:0] thread1_id=3'h1;
//dbuff_pc dbuff_pc_t1 ({cycle[19:4],`TOP.axis_trap_top.c3.t1.pc_fw2},`CPU.l2clk,3'h1,3);
  dbuff_pc dbuff_pc_t1 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c3.t1.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread1_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP3_1: %h %h \n",tb_top.axis_trap_top.c3.dbuff_pc_t1.addr,tb_top.axis_trap_top.c3.dbuff_pc_t1.ptr_0_cycle);
     $axis_dumpmemh("c3_t1_pctrc.dat",
		    tb_top.axis_trap_top.c3.dbuff_pc_t1.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 2
//


  axis_trap_pipe3 t2 (
   .mycid               (cid),
   .mytid               (3'h2),
   .PC_reg              (pc_2_w)
  );

  wire [2:0] thread2_id=3'h2;
//dbuff_pc dbuff_pc_t2 ({cycle[19:4],`TOP.axis_trap_top.c3.t2.pc_fw2},`CPU.l2clk,3'h2,3);
  dbuff_pc dbuff_pc_t2 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c3.t2.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread2_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP3_2: %h %h \n",tb_top.axis_trap_top.c3.dbuff_pc_t2.addr,tb_top.axis_trap_top.c3.dbuff_pc_t2.ptr_0_cycle);
     $axis_dumpmemh("c3_t2_pctrc.dat",
		    tb_top.axis_trap_top.c3.dbuff_pc_t2.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 3
//


  axis_trap_pipe3 t3 (
   .mycid               (cid),
   .mytid               (3'h3),
   .PC_reg              (pc_3_w)
  );

  wire [2:0] thread3_id=3'h3;
//dbuff_pc dbuff_pc_t3 ({cycle[19:4],`TOP.axis_trap_top.c3.t3.pc_fw2},`CPU.l2clk,3'h3,3);
  dbuff_pc dbuff_pc_t3 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c3.t3.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread3_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP3_3: %h %h \n",tb_top.axis_trap_top.c3.dbuff_pc_t3.addr,tb_top.axis_trap_top.c3.dbuff_pc_t3.ptr_0_cycle);
     $axis_dumpmemh("c3_t3_pctrc.dat",
		    tb_top.axis_trap_top.c3.dbuff_pc_t3.DBUFF);
end


reg [5:0] trl0_tsa_wr_addr_r;
reg [1:0] tsd0_wr_gl_r;
reg [8:0] tsd0_wr_trap_type_r;
reg [47:2] tsd0_wr_tpc_r;
reg        trl0_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl0_tsa_wr_addr_r <= tb_top.cpu.spc3.tlu.trl0_tsa_wr_addr;
   tsd0_wr_gl_r <= tb_top.cpu.spc3.tlu.tsd0_wr_gl;
   tsd0_wr_trap_type_r <= tb_top.cpu.spc3.tlu.tsd0_wr_trap_type[8:0];
   tsd0_wr_tpc_r <= tb_top.cpu.spc3.tlu.tsd0_wr_tpc;
   trl0_tsa_wr_en_r <= tb_top.cpu.spc3.tlu.trl_tsa_wr_en[0];
   if ( trl0_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 3: PIPE 0: %x %3x %12x %2x", $time, tsd0_wr_gl_r, tsd0_wr_trap_type_r, {tsd0_wr_tpc_r, 2'b00}, trl0_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------
//
//  THREAD 4
//


  axis_trap_pipe3 t4 (
   .mycid               (cid),
   .mytid               (3'h4),
   .PC_reg              (pc_4_w)
  );

  wire [2:0] thread4_id=3'h4;
//dbuff_pc dbuff_pc_t4 ({cycle[19:4],`TOP.axis_trap_top.c3.t4.pc_fw2},`CPU.l2clk,3'h4,3);
  dbuff_pc dbuff_pc_t4 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c3.t4.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread4_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP3_4: %h %h \n",tb_top.axis_trap_top.c3.dbuff_pc_t4.addr,tb_top.axis_trap_top.c3.dbuff_pc_t4.ptr_0_cycle);
     $axis_dumpmemh("c3_t4_pctrc.dat",
		    tb_top.axis_trap_top.c3.dbuff_pc_t4.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 5
//


  axis_trap_pipe3 t5 (
   .mycid               (cid),
   .mytid               (3'h5),
   .PC_reg              (pc_5_w)
  );

  wire [2:0] thread5_id=3'h5;
//dbuff_pc dbuff_pc_t5 ({cycle[19:4],`TOP.axis_trap_top.c3.t5.pc_fw2},`CPU.l2clk,3'h5,3);
  dbuff_pc dbuff_pc_t5 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c3.t5.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread5_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP3_5: %h %h \n",tb_top.axis_trap_top.c3.dbuff_pc_t5.addr,tb_top.axis_trap_top.c3.dbuff_pc_t5.ptr_0_cycle);
     $axis_dumpmemh("c3_t5_pctrc.dat",
		    tb_top.axis_trap_top.c3.dbuff_pc_t5.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 6
//


  axis_trap_pipe3 t6 (
   .mycid               (cid),
   .mytid               (3'h6),
   .PC_reg              (pc_6_w)
  );

  wire [2:0] thread6_id=3'h6;
//dbuff_pc dbuff_pc_t6 ({cycle[19:4],`TOP.axis_trap_top.c3.t6.pc_fw2},`CPU.l2clk,3'h6,3);
  dbuff_pc dbuff_pc_t6 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c3.t6.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread6_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP3_6: %h %h \n",tb_top.axis_trap_top.c3.dbuff_pc_t6.addr,tb_top.axis_trap_top.c3.dbuff_pc_t6.ptr_0_cycle);
     $axis_dumpmemh("c3_t6_pctrc.dat",
		    tb_top.axis_trap_top.c3.dbuff_pc_t6.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 7
//


  axis_trap_pipe3 t7 (
   .mycid               (cid),
   .mytid               (3'h7),
   .PC_reg              (pc_7_w)
  );

  wire [2:0] thread7_id=3'h7;
//dbuff_pc dbuff_pc_t7 ({cycle[19:4],`TOP.axis_trap_top.c3.t7.pc_fw2},`CPU.l2clk,3'h7,3);
  dbuff_pc dbuff_pc_t7 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c3.t7.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread7_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP3_7: %h %h \n",tb_top.axis_trap_top.c3.dbuff_pc_t7.addr,tb_top.axis_trap_top.c3.dbuff_pc_t7.ptr_0_cycle);
     $axis_dumpmemh("c3_t7_pctrc.dat",
		    tb_top.axis_trap_top.c3.dbuff_pc_t7.DBUFF);
end


reg [5:0] trl1_tsa_wr_addr_r;
reg [1:0] tsd1_wr_gl_r;
reg [8:0] tsd1_wr_trap_type_r;
reg [47:2] tsd1_wr_tpc_r;
reg        trl1_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl1_tsa_wr_addr_r <= tb_top.cpu.spc3.tlu.trl1_tsa_wr_addr;
   tsd1_wr_gl_r <= tb_top.cpu.spc3.tlu.tsd1_wr_gl;
   tsd1_wr_trap_type_r <= tb_top.cpu.spc3.tlu.tsd1_wr_trap_type[8:0];
   tsd1_wr_tpc_r <= tb_top.cpu.spc3.tlu.tsd1_wr_tpc;
   trl1_tsa_wr_en_r <= tb_top.cpu.spc3.tlu.trl_tsa_wr_en[1];
   if ( trl1_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 3: PIPE 1: %x %3x %12x %2x", $time, tsd1_wr_gl_r, tsd1_wr_trap_type_r, {tsd1_wr_tpc_r, 2'b00}, trl1_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------

`ifndef GATESIM

// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
wire [7:0] select_pc_b_with_errors;

assign select_pc_b_with_errors =
     {{4 {~`SPC3.dec_flush_b[1]}}, {4 {~`SPC3.dec_flush_b[0]}}} & 

     {~(`SPC3.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC3.tlu.fls1.idl_req_in}}),
      ~(`SPC3.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC3.tlu.fls0.idl_req_in}})} &
     {`SPC3.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC3.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Suppress instruction on flush or park request (clear_disrupting_flush_pending)
// Qualify select_pc_b_with_errors, with no errors to get final select_pc_b signal
wire [7:0] select_pc_b;

assign select_pc_b =
     select_pc_b_with_errors[7:0]  &
     {{4 {~`SPC3.tlu.fls1.ic_err_w_in}}, {4 {~`SPC3.tlu.fls0.ic_err_w_in}}};

//------------------------------------
// ASI & Trap State machines
always @(posedge `SPC3.gclk) begin // {

//    pc_0_e[47:0] <= `SPC3.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC3.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC3.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC3.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;
end

`endif
`endif //AXIS_TL

//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_4

module axis_trap_core4 (
  cid,
  pc_dmp_sz,
);

input [2:0] cid;
input [21:0] pc_dmp_sz;

`ifdef AXIS_TL
`ifndef GATESIM
   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;
`endif

//----------------------------------------------------------
reg [63:0] cycle;
  initial cycle = 64'b0;
  always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
    if (`CPU.tcu_aclk) cycle = 0;
    else cycle = cycle + 64'b1;
  end

//*******************************************************************************************************/
reg [76:0] sig_reg_0; 
reg [76:0] sig_reg_1; 
reg [76:0] sig_reg_2; 
reg [76:0] sig_reg_3; 
reg [63:0] kern_cnt;
reg [47:0] pc_0_saved;

//wire kern_start = (pc_0_saved != 48'h20) && (pc_0_w == 48'h20);
always @(negedge `CPU.tcu_aclk) begin
      begin // axis tbcall_region
	$display("%t: dbg rst detected by repeatability_check", $time);
      end
end

always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
  pc_0_saved <= pc_0_w;
  if (`CPU.tcu_aclk) begin 
      sig_reg_1 <= 0;
      sig_reg_2 <= 0;
      sig_reg_3 <= 0;
      sig_reg_0 <= 0;
      kern_cnt <= 0;
  end
  else if (!`CPU.tcu_aclk) begin
    if (tb_top.cpu.spc4.exu0.irf.wr_en_p0) sig_reg_0 <= sig_reg_0 ^ {tb_top.cpu.spc4.exu0.irf.wr_addr_p0,tb_top.cpu.spc4.exu0.irf.wr_data_p0};
    if (tb_top.cpu.spc4.exu0.irf.wr_en_p1) sig_reg_1 <= sig_reg_1 ^ {tb_top.cpu.spc4.exu0.irf.wr_addr_p1,tb_top.cpu.spc4.exu0.irf.wr_data_p1};
    if (tb_top.cpu.spc4.exu1.irf.wr_en_p0) sig_reg_2 <= sig_reg_2 ^ {tb_top.cpu.spc4.exu1.irf.wr_addr_p0,tb_top.cpu.spc4.exu1.irf.wr_data_p0};
    if (tb_top.cpu.spc4.exu1.irf.wr_en_p1) sig_reg_3 <= sig_reg_3 ^ {tb_top.cpu.spc4.exu1.irf.wr_addr_p1,tb_top.cpu.spc4.exu1.irf.wr_data_p1};
    kern_cnt <= kern_cnt + 1;
  end

  if ((kern_cnt[19:0] == 20'hfffff) && tb_top.repeatablility_check) begin // axis tbcall_region
     $display("%t: repeatability_check: core 4, sig_reg_0 = %0h, sig_reg_1 = %0h,  sig_reg_2 = %0h, sig_reg_3 = %0h kern_cnt = %0h, cycle = %0h",$time,sig_reg_0,sig_reg_1,sig_reg_2,sig_reg_3,kern_cnt,cycle);
  end

end

//**************************************************************************************************
//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//


  axis_trap_pipe4 t0 (
   .mycid               (cid),
   .mytid               (3'h0),
   .PC_reg              (pc_0_w)
  );

  wire [2:0] thread0_id=3'h0;
//dbuff_pc dbuff_pc_t0 ({cycle[19:4],`TOP.axis_trap_top.c4.t0.pc_fw2},`CPU.l2clk,3'h0,4);
  dbuff_pc dbuff_pc_t0 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c4.t0.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread0_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP4_0: %h %h \n",tb_top.axis_trap_top.c4.dbuff_pc_t0.addr,tb_top.axis_trap_top.c4.dbuff_pc_t0.ptr_0_cycle);
     $axis_dumpmemh("c4_t0_pctrc.dat",
		    tb_top.axis_trap_top.c4.dbuff_pc_t0.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 1
//


  axis_trap_pipe4 t1 (
   .mycid               (cid),
   .mytid               (3'h1),
   .PC_reg              (pc_1_w)
  );

  wire [2:0] thread1_id=3'h1;
//dbuff_pc dbuff_pc_t1 ({cycle[19:4],`TOP.axis_trap_top.c4.t1.pc_fw2},`CPU.l2clk,3'h1,4);
  dbuff_pc dbuff_pc_t1 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c4.t1.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread1_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP4_1: %h %h \n",tb_top.axis_trap_top.c4.dbuff_pc_t1.addr,tb_top.axis_trap_top.c4.dbuff_pc_t1.ptr_0_cycle);
     $axis_dumpmemh("c4_t1_pctrc.dat",
		    tb_top.axis_trap_top.c4.dbuff_pc_t1.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 2
//


  axis_trap_pipe4 t2 (
   .mycid               (cid),
   .mytid               (3'h2),
   .PC_reg              (pc_2_w)
  );

  wire [2:0] thread2_id=3'h2;
//dbuff_pc dbuff_pc_t2 ({cycle[19:4],`TOP.axis_trap_top.c4.t2.pc_fw2},`CPU.l2clk,3'h2,4);
  dbuff_pc dbuff_pc_t2 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c4.t2.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread2_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP4_2: %h %h \n",tb_top.axis_trap_top.c4.dbuff_pc_t2.addr,tb_top.axis_trap_top.c4.dbuff_pc_t2.ptr_0_cycle);
     $axis_dumpmemh("c4_t2_pctrc.dat",
		    tb_top.axis_trap_top.c4.dbuff_pc_t2.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 3
//


  axis_trap_pipe4 t3 (
   .mycid               (cid),
   .mytid               (3'h3),
   .PC_reg              (pc_3_w)
  );

  wire [2:0] thread3_id=3'h3;
//dbuff_pc dbuff_pc_t3 ({cycle[19:4],`TOP.axis_trap_top.c4.t3.pc_fw2},`CPU.l2clk,3'h3,4);
  dbuff_pc dbuff_pc_t3 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c4.t3.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread3_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP4_3: %h %h \n",tb_top.axis_trap_top.c4.dbuff_pc_t3.addr,tb_top.axis_trap_top.c4.dbuff_pc_t3.ptr_0_cycle);
     $axis_dumpmemh("c4_t3_pctrc.dat",
		    tb_top.axis_trap_top.c4.dbuff_pc_t3.DBUFF);
end


reg [5:0] trl0_tsa_wr_addr_r;
reg [1:0] tsd0_wr_gl_r;
reg [8:0] tsd0_wr_trap_type_r;
reg [47:2] tsd0_wr_tpc_r;
reg        trl0_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl0_tsa_wr_addr_r <= tb_top.cpu.spc4.tlu.trl0_tsa_wr_addr;
   tsd0_wr_gl_r <= tb_top.cpu.spc4.tlu.tsd0_wr_gl;
   tsd0_wr_trap_type_r <= tb_top.cpu.spc4.tlu.tsd0_wr_trap_type[8:0];
   tsd0_wr_tpc_r <= tb_top.cpu.spc4.tlu.tsd0_wr_tpc;
   trl0_tsa_wr_en_r <= tb_top.cpu.spc4.tlu.trl_tsa_wr_en[0];
   if ( trl0_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 4: PIPE 0: %x %3x %12x %2x", $time, tsd0_wr_gl_r, tsd0_wr_trap_type_r, {tsd0_wr_tpc_r, 2'b00}, trl0_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------
//
//  THREAD 4
//


  axis_trap_pipe4 t4 (
   .mycid               (cid),
   .mytid               (3'h4),
   .PC_reg              (pc_4_w)
  );

  wire [2:0] thread4_id=3'h4;
//dbuff_pc dbuff_pc_t4 ({cycle[19:4],`TOP.axis_trap_top.c4.t4.pc_fw2},`CPU.l2clk,3'h4,4);
  dbuff_pc dbuff_pc_t4 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c4.t4.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread4_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP4_4: %h %h \n",tb_top.axis_trap_top.c4.dbuff_pc_t4.addr,tb_top.axis_trap_top.c4.dbuff_pc_t4.ptr_0_cycle);
     $axis_dumpmemh("c4_t4_pctrc.dat",
		    tb_top.axis_trap_top.c4.dbuff_pc_t4.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 5
//


  axis_trap_pipe4 t5 (
   .mycid               (cid),
   .mytid               (3'h5),
   .PC_reg              (pc_5_w)
  );

  wire [2:0] thread5_id=3'h5;
//dbuff_pc dbuff_pc_t5 ({cycle[19:4],`TOP.axis_trap_top.c4.t5.pc_fw2},`CPU.l2clk,3'h5,4);
  dbuff_pc dbuff_pc_t5 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c4.t5.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread5_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP4_5: %h %h \n",tb_top.axis_trap_top.c4.dbuff_pc_t5.addr,tb_top.axis_trap_top.c4.dbuff_pc_t5.ptr_0_cycle);
     $axis_dumpmemh("c4_t5_pctrc.dat",
		    tb_top.axis_trap_top.c4.dbuff_pc_t5.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 6
//


  axis_trap_pipe4 t6 (
   .mycid               (cid),
   .mytid               (3'h6),
   .PC_reg              (pc_6_w)
  );

  wire [2:0] thread6_id=3'h6;
//dbuff_pc dbuff_pc_t6 ({cycle[19:4],`TOP.axis_trap_top.c4.t6.pc_fw2},`CPU.l2clk,3'h6,4);
  dbuff_pc dbuff_pc_t6 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c4.t6.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread6_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP4_6: %h %h \n",tb_top.axis_trap_top.c4.dbuff_pc_t6.addr,tb_top.axis_trap_top.c4.dbuff_pc_t6.ptr_0_cycle);
     $axis_dumpmemh("c4_t6_pctrc.dat",
		    tb_top.axis_trap_top.c4.dbuff_pc_t6.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 7
//


  axis_trap_pipe4 t7 (
   .mycid               (cid),
   .mytid               (3'h7),
   .PC_reg              (pc_7_w)
  );

  wire [2:0] thread7_id=3'h7;
//dbuff_pc dbuff_pc_t7 ({cycle[19:4],`TOP.axis_trap_top.c4.t7.pc_fw2},`CPU.l2clk,3'h7,4);
  dbuff_pc dbuff_pc_t7 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c4.t7.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread7_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP4_7: %h %h \n",tb_top.axis_trap_top.c4.dbuff_pc_t7.addr,tb_top.axis_trap_top.c4.dbuff_pc_t7.ptr_0_cycle);
     $axis_dumpmemh("c4_t7_pctrc.dat",
		    tb_top.axis_trap_top.c4.dbuff_pc_t7.DBUFF);
end


reg [5:0] trl1_tsa_wr_addr_r;
reg [1:0] tsd1_wr_gl_r;
reg [8:0] tsd1_wr_trap_type_r;
reg [47:2] tsd1_wr_tpc_r;
reg        trl1_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl1_tsa_wr_addr_r <= tb_top.cpu.spc4.tlu.trl1_tsa_wr_addr;
   tsd1_wr_gl_r <= tb_top.cpu.spc4.tlu.tsd1_wr_gl;
   tsd1_wr_trap_type_r <= tb_top.cpu.spc4.tlu.tsd1_wr_trap_type[8:0];
   tsd1_wr_tpc_r <= tb_top.cpu.spc4.tlu.tsd1_wr_tpc;
   trl1_tsa_wr_en_r <= tb_top.cpu.spc4.tlu.trl_tsa_wr_en[1];
   if ( trl1_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 4: PIPE 1: %x %3x %12x %2x", $time, tsd1_wr_gl_r, tsd1_wr_trap_type_r, {tsd1_wr_tpc_r, 2'b00}, trl1_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------

`ifndef GATESIM

// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
wire [7:0] select_pc_b_with_errors;

assign select_pc_b_with_errors =
     {{4 {~`SPC4.dec_flush_b[1]}}, {4 {~`SPC4.dec_flush_b[0]}}} & 

     {~(`SPC4.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC4.tlu.fls1.idl_req_in}}),
      ~(`SPC4.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC4.tlu.fls0.idl_req_in}})} &
     {`SPC4.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC4.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Suppress instruction on flush or park request (clear_disrupting_flush_pending)
// Qualify select_pc_b_with_errors, with no errors to get final select_pc_b signal
wire [7:0] select_pc_b;

assign select_pc_b =
     select_pc_b_with_errors[7:0]  &
     {{4 {~`SPC4.tlu.fls1.ic_err_w_in}}, {4 {~`SPC4.tlu.fls0.ic_err_w_in}}};

//------------------------------------
// ASI & Trap State machines
always @(posedge `SPC4.gclk) begin // {

//    pc_0_e[47:0] <= `SPC4.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC4.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC4.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC4.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;
end

`endif
`endif //AXIS_TL

//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_5

module axis_trap_core5 (
  cid,
  pc_dmp_sz,
);

input [2:0] cid;
input [21:0] pc_dmp_sz;

`ifdef AXIS_TL
`ifndef GATESIM
   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;
`endif

//----------------------------------------------------------
reg [63:0] cycle;
  initial cycle = 64'b0;
  always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
    if (`CPU.tcu_aclk) cycle = 0;
    else cycle = cycle + 64'b1;
  end

//*******************************************************************************************************/
reg [76:0] sig_reg_0; 
reg [76:0] sig_reg_1; 
reg [76:0] sig_reg_2; 
reg [76:0] sig_reg_3; 
reg [63:0] kern_cnt;
reg [47:0] pc_0_saved;

//wire kern_start = (pc_0_saved != 48'h20) && (pc_0_w == 48'h20);
always @(negedge `CPU.tcu_aclk) begin
      begin // axis tbcall_region
	$display("%t: dbg rst detected by repeatability_check", $time);
      end
end

always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
  pc_0_saved <= pc_0_w;
  if (`CPU.tcu_aclk) begin 
      sig_reg_1 <= 0;
      sig_reg_2 <= 0;
      sig_reg_3 <= 0;
      sig_reg_0 <= 0;
      kern_cnt <= 0;
  end
  else if (!`CPU.tcu_aclk) begin
    if (tb_top.cpu.spc5.exu0.irf.wr_en_p0) sig_reg_0 <= sig_reg_0 ^ {tb_top.cpu.spc5.exu0.irf.wr_addr_p0,tb_top.cpu.spc5.exu0.irf.wr_data_p0};
    if (tb_top.cpu.spc5.exu0.irf.wr_en_p1) sig_reg_1 <= sig_reg_1 ^ {tb_top.cpu.spc5.exu0.irf.wr_addr_p1,tb_top.cpu.spc5.exu0.irf.wr_data_p1};
    if (tb_top.cpu.spc5.exu1.irf.wr_en_p0) sig_reg_2 <= sig_reg_2 ^ {tb_top.cpu.spc5.exu1.irf.wr_addr_p0,tb_top.cpu.spc5.exu1.irf.wr_data_p0};
    if (tb_top.cpu.spc5.exu1.irf.wr_en_p1) sig_reg_3 <= sig_reg_3 ^ {tb_top.cpu.spc5.exu1.irf.wr_addr_p1,tb_top.cpu.spc5.exu1.irf.wr_data_p1};
    kern_cnt <= kern_cnt + 1;
  end

  if ((kern_cnt[19:0] == 20'hfffff) && tb_top.repeatablility_check) begin // axis tbcall_region
     $display("%t: repeatability_check: core 5, sig_reg_0 = %0h, sig_reg_1 = %0h,  sig_reg_2 = %0h, sig_reg_3 = %0h kern_cnt = %0h, cycle = %0h",$time,sig_reg_0,sig_reg_1,sig_reg_2,sig_reg_3,kern_cnt,cycle);
  end

end

//**************************************************************************************************
//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//


  axis_trap_pipe5 t0 (
   .mycid               (cid),
   .mytid               (3'h0),
   .PC_reg              (pc_0_w)
  );

  wire [2:0] thread0_id=3'h0;
//dbuff_pc dbuff_pc_t0 ({cycle[19:4],`TOP.axis_trap_top.c5.t0.pc_fw2},`CPU.l2clk,3'h0,5);
  dbuff_pc dbuff_pc_t0 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c5.t0.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread0_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP5_0: %h %h \n",tb_top.axis_trap_top.c5.dbuff_pc_t0.addr,tb_top.axis_trap_top.c5.dbuff_pc_t0.ptr_0_cycle);
     $axis_dumpmemh("c5_t0_pctrc.dat",
		    tb_top.axis_trap_top.c5.dbuff_pc_t0.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 1
//


  axis_trap_pipe5 t1 (
   .mycid               (cid),
   .mytid               (3'h1),
   .PC_reg              (pc_1_w)
  );

  wire [2:0] thread1_id=3'h1;
//dbuff_pc dbuff_pc_t1 ({cycle[19:4],`TOP.axis_trap_top.c5.t1.pc_fw2},`CPU.l2clk,3'h1,5);
  dbuff_pc dbuff_pc_t1 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c5.t1.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread1_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP5_1: %h %h \n",tb_top.axis_trap_top.c5.dbuff_pc_t1.addr,tb_top.axis_trap_top.c5.dbuff_pc_t1.ptr_0_cycle);
     $axis_dumpmemh("c5_t1_pctrc.dat",
		    tb_top.axis_trap_top.c5.dbuff_pc_t1.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 2
//


  axis_trap_pipe5 t2 (
   .mycid               (cid),
   .mytid               (3'h2),
   .PC_reg              (pc_2_w)
  );

  wire [2:0] thread2_id=3'h2;
//dbuff_pc dbuff_pc_t2 ({cycle[19:4],`TOP.axis_trap_top.c5.t2.pc_fw2},`CPU.l2clk,3'h2,5);
  dbuff_pc dbuff_pc_t2 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c5.t2.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread2_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP5_2: %h %h \n",tb_top.axis_trap_top.c5.dbuff_pc_t2.addr,tb_top.axis_trap_top.c5.dbuff_pc_t2.ptr_0_cycle);
     $axis_dumpmemh("c5_t2_pctrc.dat",
		    tb_top.axis_trap_top.c5.dbuff_pc_t2.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 3
//


  axis_trap_pipe5 t3 (
   .mycid               (cid),
   .mytid               (3'h3),
   .PC_reg              (pc_3_w)
  );

  wire [2:0] thread3_id=3'h3;
//dbuff_pc dbuff_pc_t3 ({cycle[19:4],`TOP.axis_trap_top.c5.t3.pc_fw2},`CPU.l2clk,3'h3,5);
  dbuff_pc dbuff_pc_t3 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c5.t3.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread3_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP5_3: %h %h \n",tb_top.axis_trap_top.c5.dbuff_pc_t3.addr,tb_top.axis_trap_top.c5.dbuff_pc_t3.ptr_0_cycle);
     $axis_dumpmemh("c5_t3_pctrc.dat",
		    tb_top.axis_trap_top.c5.dbuff_pc_t3.DBUFF);
end


reg [5:0] trl0_tsa_wr_addr_r;
reg [1:0] tsd0_wr_gl_r;
reg [8:0] tsd0_wr_trap_type_r;
reg [47:2] tsd0_wr_tpc_r;
reg        trl0_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl0_tsa_wr_addr_r <= tb_top.cpu.spc5.tlu.trl0_tsa_wr_addr;
   tsd0_wr_gl_r <= tb_top.cpu.spc5.tlu.tsd0_wr_gl;
   tsd0_wr_trap_type_r <= tb_top.cpu.spc5.tlu.tsd0_wr_trap_type[8:0];
   tsd0_wr_tpc_r <= tb_top.cpu.spc5.tlu.tsd0_wr_tpc;
   trl0_tsa_wr_en_r <= tb_top.cpu.spc5.tlu.trl_tsa_wr_en[0];
   if ( trl0_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 5: PIPE 0: %x %3x %12x %2x", $time, tsd0_wr_gl_r, tsd0_wr_trap_type_r, {tsd0_wr_tpc_r, 2'b00}, trl0_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------
//
//  THREAD 4
//


  axis_trap_pipe5 t4 (
   .mycid               (cid),
   .mytid               (3'h4),
   .PC_reg              (pc_4_w)
  );

  wire [2:0] thread4_id=3'h4;
//dbuff_pc dbuff_pc_t4 ({cycle[19:4],`TOP.axis_trap_top.c5.t4.pc_fw2},`CPU.l2clk,3'h4,5);
  dbuff_pc dbuff_pc_t4 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c5.t4.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread4_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP5_4: %h %h \n",tb_top.axis_trap_top.c5.dbuff_pc_t4.addr,tb_top.axis_trap_top.c5.dbuff_pc_t4.ptr_0_cycle);
     $axis_dumpmemh("c5_t4_pctrc.dat",
		    tb_top.axis_trap_top.c5.dbuff_pc_t4.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 5
//


  axis_trap_pipe5 t5 (
   .mycid               (cid),
   .mytid               (3'h5),
   .PC_reg              (pc_5_w)
  );

  wire [2:0] thread5_id=3'h5;
//dbuff_pc dbuff_pc_t5 ({cycle[19:4],`TOP.axis_trap_top.c5.t5.pc_fw2},`CPU.l2clk,3'h5,5);
  dbuff_pc dbuff_pc_t5 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c5.t5.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread5_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP5_5: %h %h \n",tb_top.axis_trap_top.c5.dbuff_pc_t5.addr,tb_top.axis_trap_top.c5.dbuff_pc_t5.ptr_0_cycle);
     $axis_dumpmemh("c5_t5_pctrc.dat",
		    tb_top.axis_trap_top.c5.dbuff_pc_t5.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 6
//


  axis_trap_pipe5 t6 (
   .mycid               (cid),
   .mytid               (3'h6),
   .PC_reg              (pc_6_w)
  );

  wire [2:0] thread6_id=3'h6;
//dbuff_pc dbuff_pc_t6 ({cycle[19:4],`TOP.axis_trap_top.c5.t6.pc_fw2},`CPU.l2clk,3'h6,5);
  dbuff_pc dbuff_pc_t6 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c5.t6.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread6_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP5_6: %h %h \n",tb_top.axis_trap_top.c5.dbuff_pc_t6.addr,tb_top.axis_trap_top.c5.dbuff_pc_t6.ptr_0_cycle);
     $axis_dumpmemh("c5_t6_pctrc.dat",
		    tb_top.axis_trap_top.c5.dbuff_pc_t6.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 7
//


  axis_trap_pipe5 t7 (
   .mycid               (cid),
   .mytid               (3'h7),
   .PC_reg              (pc_7_w)
  );

  wire [2:0] thread7_id=3'h7;
//dbuff_pc dbuff_pc_t7 ({cycle[19:4],`TOP.axis_trap_top.c5.t7.pc_fw2},`CPU.l2clk,3'h7,5);
  dbuff_pc dbuff_pc_t7 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c5.t7.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread7_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP5_7: %h %h \n",tb_top.axis_trap_top.c5.dbuff_pc_t7.addr,tb_top.axis_trap_top.c5.dbuff_pc_t7.ptr_0_cycle);
     $axis_dumpmemh("c5_t7_pctrc.dat",
		    tb_top.axis_trap_top.c5.dbuff_pc_t7.DBUFF);
end


reg [5:0] trl1_tsa_wr_addr_r;
reg [1:0] tsd1_wr_gl_r;
reg [8:0] tsd1_wr_trap_type_r;
reg [47:2] tsd1_wr_tpc_r;
reg        trl1_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl1_tsa_wr_addr_r <= tb_top.cpu.spc5.tlu.trl1_tsa_wr_addr;
   tsd1_wr_gl_r <= tb_top.cpu.spc5.tlu.tsd1_wr_gl;
   tsd1_wr_trap_type_r <= tb_top.cpu.spc5.tlu.tsd1_wr_trap_type[8:0];
   tsd1_wr_tpc_r <= tb_top.cpu.spc5.tlu.tsd1_wr_tpc;
   trl1_tsa_wr_en_r <= tb_top.cpu.spc5.tlu.trl_tsa_wr_en[1];
   if ( trl1_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 5: PIPE 1: %x %3x %12x %2x", $time, tsd1_wr_gl_r, tsd1_wr_trap_type_r, {tsd1_wr_tpc_r, 2'b00}, trl1_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------

`ifndef GATESIM

// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
wire [7:0] select_pc_b_with_errors;

assign select_pc_b_with_errors =
     {{4 {~`SPC5.dec_flush_b[1]}}, {4 {~`SPC5.dec_flush_b[0]}}} & 

     {~(`SPC5.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC5.tlu.fls1.idl_req_in}}),
      ~(`SPC5.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC5.tlu.fls0.idl_req_in}})} &
     {`SPC5.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC5.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Suppress instruction on flush or park request (clear_disrupting_flush_pending)
// Qualify select_pc_b_with_errors, with no errors to get final select_pc_b signal
wire [7:0] select_pc_b;

assign select_pc_b =
     select_pc_b_with_errors[7:0]  &
     {{4 {~`SPC5.tlu.fls1.ic_err_w_in}}, {4 {~`SPC5.tlu.fls0.ic_err_w_in}}};

//------------------------------------
// ASI & Trap State machines
always @(posedge `SPC5.gclk) begin // {

//    pc_0_e[47:0] <= `SPC5.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC5.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC5.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC5.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;
end

`endif
`endif //AXIS_TL

//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_6

module axis_trap_core6 (
  cid,
  pc_dmp_sz,
);

input [2:0] cid;
input [21:0] pc_dmp_sz;

`ifdef AXIS_TL
`ifndef GATESIM
   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;
`endif

//----------------------------------------------------------
reg [63:0] cycle;
  initial cycle = 64'b0;
  always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
    if (`CPU.tcu_aclk) cycle = 0;
    else cycle = cycle + 64'b1;
  end

//*******************************************************************************************************/
reg [76:0] sig_reg_0; 
reg [76:0] sig_reg_1; 
reg [76:0] sig_reg_2; 
reg [76:0] sig_reg_3; 
reg [63:0] kern_cnt;
reg [47:0] pc_0_saved;

//wire kern_start = (pc_0_saved != 48'h20) && (pc_0_w == 48'h20);
always @(negedge `CPU.tcu_aclk) begin
      begin // axis tbcall_region
	$display("%t: dbg rst detected by repeatability_check", $time);
      end
end

always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
  pc_0_saved <= pc_0_w;
  if (`CPU.tcu_aclk) begin 
      sig_reg_1 <= 0;
      sig_reg_2 <= 0;
      sig_reg_3 <= 0;
      sig_reg_0 <= 0;
      kern_cnt <= 0;
  end
  else if (!`CPU.tcu_aclk) begin
    if (tb_top.cpu.spc6.exu0.irf.wr_en_p0) sig_reg_0 <= sig_reg_0 ^ {tb_top.cpu.spc6.exu0.irf.wr_addr_p0,tb_top.cpu.spc6.exu0.irf.wr_data_p0};
    if (tb_top.cpu.spc6.exu0.irf.wr_en_p1) sig_reg_1 <= sig_reg_1 ^ {tb_top.cpu.spc6.exu0.irf.wr_addr_p1,tb_top.cpu.spc6.exu0.irf.wr_data_p1};
    if (tb_top.cpu.spc6.exu1.irf.wr_en_p0) sig_reg_2 <= sig_reg_2 ^ {tb_top.cpu.spc6.exu1.irf.wr_addr_p0,tb_top.cpu.spc6.exu1.irf.wr_data_p0};
    if (tb_top.cpu.spc6.exu1.irf.wr_en_p1) sig_reg_3 <= sig_reg_3 ^ {tb_top.cpu.spc6.exu1.irf.wr_addr_p1,tb_top.cpu.spc6.exu1.irf.wr_data_p1};
    kern_cnt <= kern_cnt + 1;
  end

  if ((kern_cnt[19:0] == 20'hfffff) && tb_top.repeatablility_check) begin // axis tbcall_region
     $display("%t: repeatability_check: core 6, sig_reg_0 = %0h, sig_reg_1 = %0h,  sig_reg_2 = %0h, sig_reg_3 = %0h kern_cnt = %0h, cycle = %0h",$time,sig_reg_0,sig_reg_1,sig_reg_2,sig_reg_3,kern_cnt,cycle);
  end

end

//**************************************************************************************************
//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//


  axis_trap_pipe6 t0 (
   .mycid               (cid),
   .mytid               (3'h0),
   .PC_reg              (pc_0_w)
  );

  wire [2:0] thread0_id=3'h0;
//dbuff_pc dbuff_pc_t0 ({cycle[19:4],`TOP.axis_trap_top.c6.t0.pc_fw2},`CPU.l2clk,3'h0,6);
  dbuff_pc dbuff_pc_t0 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c6.t0.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread0_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP6_0: %h %h \n",tb_top.axis_trap_top.c6.dbuff_pc_t0.addr,tb_top.axis_trap_top.c6.dbuff_pc_t0.ptr_0_cycle);
     $axis_dumpmemh("c6_t0_pctrc.dat",
		    tb_top.axis_trap_top.c6.dbuff_pc_t0.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 1
//


  axis_trap_pipe6 t1 (
   .mycid               (cid),
   .mytid               (3'h1),
   .PC_reg              (pc_1_w)
  );

  wire [2:0] thread1_id=3'h1;
//dbuff_pc dbuff_pc_t1 ({cycle[19:4],`TOP.axis_trap_top.c6.t1.pc_fw2},`CPU.l2clk,3'h1,6);
  dbuff_pc dbuff_pc_t1 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c6.t1.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread1_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP6_1: %h %h \n",tb_top.axis_trap_top.c6.dbuff_pc_t1.addr,tb_top.axis_trap_top.c6.dbuff_pc_t1.ptr_0_cycle);
     $axis_dumpmemh("c6_t1_pctrc.dat",
		    tb_top.axis_trap_top.c6.dbuff_pc_t1.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 2
//


  axis_trap_pipe6 t2 (
   .mycid               (cid),
   .mytid               (3'h2),
   .PC_reg              (pc_2_w)
  );

  wire [2:0] thread2_id=3'h2;
//dbuff_pc dbuff_pc_t2 ({cycle[19:4],`TOP.axis_trap_top.c6.t2.pc_fw2},`CPU.l2clk,3'h2,6);
  dbuff_pc dbuff_pc_t2 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c6.t2.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread2_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP6_2: %h %h \n",tb_top.axis_trap_top.c6.dbuff_pc_t2.addr,tb_top.axis_trap_top.c6.dbuff_pc_t2.ptr_0_cycle);
     $axis_dumpmemh("c6_t2_pctrc.dat",
		    tb_top.axis_trap_top.c6.dbuff_pc_t2.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 3
//


  axis_trap_pipe6 t3 (
   .mycid               (cid),
   .mytid               (3'h3),
   .PC_reg              (pc_3_w)
  );

  wire [2:0] thread3_id=3'h3;
//dbuff_pc dbuff_pc_t3 ({cycle[19:4],`TOP.axis_trap_top.c6.t3.pc_fw2},`CPU.l2clk,3'h3,6);
  dbuff_pc dbuff_pc_t3 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c6.t3.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread3_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP6_3: %h %h \n",tb_top.axis_trap_top.c6.dbuff_pc_t3.addr,tb_top.axis_trap_top.c6.dbuff_pc_t3.ptr_0_cycle);
     $axis_dumpmemh("c6_t3_pctrc.dat",
		    tb_top.axis_trap_top.c6.dbuff_pc_t3.DBUFF);
end


reg [5:0] trl0_tsa_wr_addr_r;
reg [1:0] tsd0_wr_gl_r;
reg [8:0] tsd0_wr_trap_type_r;
reg [47:2] tsd0_wr_tpc_r;
reg        trl0_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl0_tsa_wr_addr_r <= tb_top.cpu.spc6.tlu.trl0_tsa_wr_addr;
   tsd0_wr_gl_r <= tb_top.cpu.spc6.tlu.tsd0_wr_gl;
   tsd0_wr_trap_type_r <= tb_top.cpu.spc6.tlu.tsd0_wr_trap_type[8:0];
   tsd0_wr_tpc_r <= tb_top.cpu.spc6.tlu.tsd0_wr_tpc;
   trl0_tsa_wr_en_r <= tb_top.cpu.spc6.tlu.trl_tsa_wr_en[0];
   if ( trl0_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 6: PIPE 0: %x %3x %12x %2x", $time, tsd0_wr_gl_r, tsd0_wr_trap_type_r, {tsd0_wr_tpc_r, 2'b00}, trl0_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------
//
//  THREAD 4
//


  axis_trap_pipe6 t4 (
   .mycid               (cid),
   .mytid               (3'h4),
   .PC_reg              (pc_4_w)
  );

  wire [2:0] thread4_id=3'h4;
//dbuff_pc dbuff_pc_t4 ({cycle[19:4],`TOP.axis_trap_top.c6.t4.pc_fw2},`CPU.l2clk,3'h4,6);
  dbuff_pc dbuff_pc_t4 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c6.t4.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread4_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP6_4: %h %h \n",tb_top.axis_trap_top.c6.dbuff_pc_t4.addr,tb_top.axis_trap_top.c6.dbuff_pc_t4.ptr_0_cycle);
     $axis_dumpmemh("c6_t4_pctrc.dat",
		    tb_top.axis_trap_top.c6.dbuff_pc_t4.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 5
//


  axis_trap_pipe6 t5 (
   .mycid               (cid),
   .mytid               (3'h5),
   .PC_reg              (pc_5_w)
  );

  wire [2:0] thread5_id=3'h5;
//dbuff_pc dbuff_pc_t5 ({cycle[19:4],`TOP.axis_trap_top.c6.t5.pc_fw2},`CPU.l2clk,3'h5,6);
  dbuff_pc dbuff_pc_t5 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c6.t5.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread5_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP6_5: %h %h \n",tb_top.axis_trap_top.c6.dbuff_pc_t5.addr,tb_top.axis_trap_top.c6.dbuff_pc_t5.ptr_0_cycle);
     $axis_dumpmemh("c6_t5_pctrc.dat",
		    tb_top.axis_trap_top.c6.dbuff_pc_t5.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 6
//


  axis_trap_pipe6 t6 (
   .mycid               (cid),
   .mytid               (3'h6),
   .PC_reg              (pc_6_w)
  );

  wire [2:0] thread6_id=3'h6;
//dbuff_pc dbuff_pc_t6 ({cycle[19:4],`TOP.axis_trap_top.c6.t6.pc_fw2},`CPU.l2clk,3'h6,6);
  dbuff_pc dbuff_pc_t6 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c6.t6.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread6_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP6_6: %h %h \n",tb_top.axis_trap_top.c6.dbuff_pc_t6.addr,tb_top.axis_trap_top.c6.dbuff_pc_t6.ptr_0_cycle);
     $axis_dumpmemh("c6_t6_pctrc.dat",
		    tb_top.axis_trap_top.c6.dbuff_pc_t6.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 7
//


  axis_trap_pipe6 t7 (
   .mycid               (cid),
   .mytid               (3'h7),
   .PC_reg              (pc_7_w)
  );

  wire [2:0] thread7_id=3'h7;
//dbuff_pc dbuff_pc_t7 ({cycle[19:4],`TOP.axis_trap_top.c6.t7.pc_fw2},`CPU.l2clk,3'h7,6);
  dbuff_pc dbuff_pc_t7 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c6.t7.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread7_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP6_7: %h %h \n",tb_top.axis_trap_top.c6.dbuff_pc_t7.addr,tb_top.axis_trap_top.c6.dbuff_pc_t7.ptr_0_cycle);
     $axis_dumpmemh("c6_t7_pctrc.dat",
		    tb_top.axis_trap_top.c6.dbuff_pc_t7.DBUFF);
end


reg [5:0] trl1_tsa_wr_addr_r;
reg [1:0] tsd1_wr_gl_r;
reg [8:0] tsd1_wr_trap_type_r;
reg [47:2] tsd1_wr_tpc_r;
reg        trl1_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl1_tsa_wr_addr_r <= tb_top.cpu.spc6.tlu.trl1_tsa_wr_addr;
   tsd1_wr_gl_r <= tb_top.cpu.spc6.tlu.tsd1_wr_gl;
   tsd1_wr_trap_type_r <= tb_top.cpu.spc6.tlu.tsd1_wr_trap_type[8:0];
   tsd1_wr_tpc_r <= tb_top.cpu.spc6.tlu.tsd1_wr_tpc;
   trl1_tsa_wr_en_r <= tb_top.cpu.spc6.tlu.trl_tsa_wr_en[1];
   if ( trl1_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 6: PIPE 1: %x %3x %12x %2x", $time, tsd1_wr_gl_r, tsd1_wr_trap_type_r, {tsd1_wr_tpc_r, 2'b00}, trl1_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------

`ifndef GATESIM

// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
wire [7:0] select_pc_b_with_errors;

assign select_pc_b_with_errors =
     {{4 {~`SPC6.dec_flush_b[1]}}, {4 {~`SPC6.dec_flush_b[0]}}} & 

     {~(`SPC6.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC6.tlu.fls1.idl_req_in}}),
      ~(`SPC6.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC6.tlu.fls0.idl_req_in}})} &
     {`SPC6.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC6.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Suppress instruction on flush or park request (clear_disrupting_flush_pending)
// Qualify select_pc_b_with_errors, with no errors to get final select_pc_b signal
wire [7:0] select_pc_b;

assign select_pc_b =
     select_pc_b_with_errors[7:0]  &
     {{4 {~`SPC6.tlu.fls1.ic_err_w_in}}, {4 {~`SPC6.tlu.fls0.ic_err_w_in}}};

//------------------------------------
// ASI & Trap State machines
always @(posedge `SPC6.gclk) begin // {

//    pc_0_e[47:0] <= `SPC6.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC6.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC6.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC6.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;
end

`endif
`endif //AXIS_TL

//----------------------------------------------------------
endmodule

`endif

`ifdef CORE_7

module axis_trap_core7 (
  cid,
  pc_dmp_sz,
);

input [2:0] cid;
input [21:0] pc_dmp_sz;

`ifdef AXIS_TL
`ifndef GATESIM
   reg [47:0] pc_0_e;
   reg [47:0] pc_1_e;
   reg [47:0] pc_0_m;
   reg [47:0] pc_1_m;
   reg [47:0] pc_0_b;
   reg [47:0] pc_1_b;
   reg [47:0] pc_0_w;
   reg [47:0] pc_1_w;
   reg [47:0] pc_2_w;
   reg [47:0] pc_3_w;
   reg [47:0] pc_4_w;
   reg [47:0] pc_5_w;
   reg [47:0] pc_6_w;
   reg [47:0] pc_7_w;
`endif

//----------------------------------------------------------
reg [63:0] cycle;
  initial cycle = 64'b0;
  always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
    if (`CPU.tcu_aclk) cycle = 0;
    else cycle = cycle + 64'b1;
  end

//*******************************************************************************************************/
reg [76:0] sig_reg_0; 
reg [76:0] sig_reg_1; 
reg [76:0] sig_reg_2; 
reg [76:0] sig_reg_3; 
reg [63:0] kern_cnt;
reg [47:0] pc_0_saved;

//wire kern_start = (pc_0_saved != 48'h20) && (pc_0_w == 48'h20);
always @(negedge `CPU.tcu_aclk) begin
      begin // axis tbcall_region
	$display("%t: dbg rst detected by repeatability_check", $time);
      end
end

always @(posedge `CPU.l2clk , posedge `CPU.tcu_aclk) begin
  pc_0_saved <= pc_0_w;
  if (`CPU.tcu_aclk) begin 
      sig_reg_1 <= 0;
      sig_reg_2 <= 0;
      sig_reg_3 <= 0;
      sig_reg_0 <= 0;
      kern_cnt <= 0;
  end
  else if (!`CPU.tcu_aclk) begin
    if (tb_top.cpu.spc7.exu0.irf.wr_en_p0) sig_reg_0 <= sig_reg_0 ^ {tb_top.cpu.spc7.exu0.irf.wr_addr_p0,tb_top.cpu.spc7.exu0.irf.wr_data_p0};
    if (tb_top.cpu.spc7.exu0.irf.wr_en_p1) sig_reg_1 <= sig_reg_1 ^ {tb_top.cpu.spc7.exu0.irf.wr_addr_p1,tb_top.cpu.spc7.exu0.irf.wr_data_p1};
    if (tb_top.cpu.spc7.exu1.irf.wr_en_p0) sig_reg_2 <= sig_reg_2 ^ {tb_top.cpu.spc7.exu1.irf.wr_addr_p0,tb_top.cpu.spc7.exu1.irf.wr_data_p0};
    if (tb_top.cpu.spc7.exu1.irf.wr_en_p1) sig_reg_3 <= sig_reg_3 ^ {tb_top.cpu.spc7.exu1.irf.wr_addr_p1,tb_top.cpu.spc7.exu1.irf.wr_data_p1};
    kern_cnt <= kern_cnt + 1;
  end

  if ((kern_cnt[19:0] == 20'hfffff) && tb_top.repeatablility_check) begin // axis tbcall_region
     $display("%t: repeatability_check: core 7, sig_reg_0 = %0h, sig_reg_1 = %0h,  sig_reg_2 = %0h, sig_reg_3 = %0h kern_cnt = %0h, cycle = %0h",$time,sig_reg_0,sig_reg_1,sig_reg_2,sig_reg_3,kern_cnt,cycle);
  end

end

//**************************************************************************************************
//----------------------------------------------------------

//----------------------------------------------------------
//
//  THREAD 0
//


  axis_trap_pipe7 t0 (
   .mycid               (cid),
   .mytid               (3'h0),
   .PC_reg              (pc_0_w)
  );

  wire [2:0] thread0_id=3'h0;
//dbuff_pc dbuff_pc_t0 ({cycle[19:4],`TOP.axis_trap_top.c7.t0.pc_fw2},`CPU.l2clk,3'h0,7);
  dbuff_pc dbuff_pc_t0 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c7.t0.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread0_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP7_0: %h %h \n",tb_top.axis_trap_top.c7.dbuff_pc_t0.addr,tb_top.axis_trap_top.c7.dbuff_pc_t0.ptr_0_cycle);
     $axis_dumpmemh("c7_t0_pctrc.dat",
		    tb_top.axis_trap_top.c7.dbuff_pc_t0.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 1
//


  axis_trap_pipe7 t1 (
   .mycid               (cid),
   .mytid               (3'h1),
   .PC_reg              (pc_1_w)
  );

  wire [2:0] thread1_id=3'h1;
//dbuff_pc dbuff_pc_t1 ({cycle[19:4],`TOP.axis_trap_top.c7.t1.pc_fw2},`CPU.l2clk,3'h1,7);
  dbuff_pc dbuff_pc_t1 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c7.t1.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread1_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP7_1: %h %h \n",tb_top.axis_trap_top.c7.dbuff_pc_t1.addr,tb_top.axis_trap_top.c7.dbuff_pc_t1.ptr_0_cycle);
     $axis_dumpmemh("c7_t1_pctrc.dat",
		    tb_top.axis_trap_top.c7.dbuff_pc_t1.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 2
//


  axis_trap_pipe7 t2 (
   .mycid               (cid),
   .mytid               (3'h2),
   .PC_reg              (pc_2_w)
  );

  wire [2:0] thread2_id=3'h2;
//dbuff_pc dbuff_pc_t2 ({cycle[19:4],`TOP.axis_trap_top.c7.t2.pc_fw2},`CPU.l2clk,3'h2,7);
  dbuff_pc dbuff_pc_t2 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c7.t2.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread2_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP7_2: %h %h \n",tb_top.axis_trap_top.c7.dbuff_pc_t2.addr,tb_top.axis_trap_top.c7.dbuff_pc_t2.ptr_0_cycle);
     $axis_dumpmemh("c7_t2_pctrc.dat",
		    tb_top.axis_trap_top.c7.dbuff_pc_t2.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 3
//


  axis_trap_pipe7 t3 (
   .mycid               (cid),
   .mytid               (3'h3),
   .PC_reg              (pc_3_w)
  );

  wire [2:0] thread3_id=3'h3;
//dbuff_pc dbuff_pc_t3 ({cycle[19:4],`TOP.axis_trap_top.c7.t3.pc_fw2},`CPU.l2clk,3'h3,7);
  dbuff_pc dbuff_pc_t3 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c7.t3.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread3_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP7_3: %h %h \n",tb_top.axis_trap_top.c7.dbuff_pc_t3.addr,tb_top.axis_trap_top.c7.dbuff_pc_t3.ptr_0_cycle);
     $axis_dumpmemh("c7_t3_pctrc.dat",
		    tb_top.axis_trap_top.c7.dbuff_pc_t3.DBUFF);
end


reg [5:0] trl0_tsa_wr_addr_r;
reg [1:0] tsd0_wr_gl_r;
reg [8:0] tsd0_wr_trap_type_r;
reg [47:2] tsd0_wr_tpc_r;
reg        trl0_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl0_tsa_wr_addr_r <= tb_top.cpu.spc7.tlu.trl0_tsa_wr_addr;
   tsd0_wr_gl_r <= tb_top.cpu.spc7.tlu.tsd0_wr_gl;
   tsd0_wr_trap_type_r <= tb_top.cpu.spc7.tlu.tsd0_wr_trap_type[8:0];
   tsd0_wr_tpc_r <= tb_top.cpu.spc7.tlu.tsd0_wr_tpc;
   trl0_tsa_wr_en_r <= tb_top.cpu.spc7.tlu.trl_tsa_wr_en[0];
   if ( trl0_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 7: PIPE 0: %x %3x %12x %2x", $time, tsd0_wr_gl_r, tsd0_wr_trap_type_r, {tsd0_wr_tpc_r, 2'b00}, trl0_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------
//
//  THREAD 4
//


  axis_trap_pipe7 t4 (
   .mycid               (cid),
   .mytid               (3'h4),
   .PC_reg              (pc_4_w)
  );

  wire [2:0] thread4_id=3'h4;
//dbuff_pc dbuff_pc_t4 ({cycle[19:4],`TOP.axis_trap_top.c7.t4.pc_fw2},`CPU.l2clk,3'h4,7);
  dbuff_pc dbuff_pc_t4 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c7.t4.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread4_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP7_4: %h %h \n",tb_top.axis_trap_top.c7.dbuff_pc_t4.addr,tb_top.axis_trap_top.c7.dbuff_pc_t4.ptr_0_cycle);
     $axis_dumpmemh("c7_t4_pctrc.dat",
		    tb_top.axis_trap_top.c7.dbuff_pc_t4.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 5
//


  axis_trap_pipe7 t5 (
   .mycid               (cid),
   .mytid               (3'h5),
   .PC_reg              (pc_5_w)
  );

  wire [2:0] thread5_id=3'h5;
//dbuff_pc dbuff_pc_t5 ({cycle[19:4],`TOP.axis_trap_top.c7.t5.pc_fw2},`CPU.l2clk,3'h5,7);
  dbuff_pc dbuff_pc_t5 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c7.t5.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread5_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP7_5: %h %h \n",tb_top.axis_trap_top.c7.dbuff_pc_t5.addr,tb_top.axis_trap_top.c7.dbuff_pc_t5.ptr_0_cycle);
     $axis_dumpmemh("c7_t5_pctrc.dat",
		    tb_top.axis_trap_top.c7.dbuff_pc_t5.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 6
//


  axis_trap_pipe7 t6 (
   .mycid               (cid),
   .mytid               (3'h6),
   .PC_reg              (pc_6_w)
  );

  wire [2:0] thread6_id=3'h6;
//dbuff_pc dbuff_pc_t6 ({cycle[19:4],`TOP.axis_trap_top.c7.t6.pc_fw2},`CPU.l2clk,3'h6,7);
  dbuff_pc dbuff_pc_t6 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c7.t6.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread6_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP7_6: %h %h \n",tb_top.axis_trap_top.c7.dbuff_pc_t6.addr,tb_top.axis_trap_top.c7.dbuff_pc_t6.ptr_0_cycle);
     $axis_dumpmemh("c7_t6_pctrc.dat",
		    tb_top.axis_trap_top.c7.dbuff_pc_t6.DBUFF);
end


//----------------------------------------------------------
//
//  THREAD 7
//


  axis_trap_pipe7 t7 (
   .mycid               (cid),
   .mytid               (3'h7),
   .PC_reg              (pc_7_w)
  );

  wire [2:0] thread7_id=3'h7;
//dbuff_pc dbuff_pc_t7 ({cycle[19:4],`TOP.axis_trap_top.c7.t7.pc_fw2},`CPU.l2clk,3'h7,7);
  dbuff_pc dbuff_pc_t7 (
  .cycle        (cycle[63:0]),
  .pc           (`TOP.axis_trap_top.c7.t7.pc_fw2),
  .clk          (`CPU.l2clk),
  .core         (cid),
  .thread       (thread7_id)
  );

always @(posedge axis_top.start_dumps)
begin // axis tbcall_region
     $display("DMP7_7: %h %h \n",tb_top.axis_trap_top.c7.dbuff_pc_t7.addr,tb_top.axis_trap_top.c7.dbuff_pc_t7.ptr_0_cycle);
     $axis_dumpmemh("c7_t7_pctrc.dat",
		    tb_top.axis_trap_top.c7.dbuff_pc_t7.DBUFF);
end


reg [5:0] trl1_tsa_wr_addr_r;
reg [1:0] tsd1_wr_gl_r;
reg [8:0] tsd1_wr_trap_type_r;
reg [47:2] tsd1_wr_tpc_r;
reg        trl1_tsa_wr_en_r;
always @(posedge `CPU.l2clk) begin
   trl1_tsa_wr_addr_r <= tb_top.cpu.spc7.tlu.trl1_tsa_wr_addr;
   tsd1_wr_gl_r <= tb_top.cpu.spc7.tlu.tsd1_wr_gl;
   tsd1_wr_trap_type_r <= tb_top.cpu.spc7.tlu.tsd1_wr_trap_type[8:0];
   tsd1_wr_tpc_r <= tb_top.cpu.spc7.tlu.tsd1_wr_tpc;
   trl1_tsa_wr_en_r <= tb_top.cpu.spc7.tlu.trl_tsa_wr_en[1];
   if ( trl1_tsa_wr_en_r & tb_top.tlu_dbg_en) begin
     begin // axis tbcall_region
       $display("%t: TRAP WRITE: CORE 7: PIPE 1: %x %3x %12x %2x", $time, tsd1_wr_gl_r, tsd1_wr_trap_type_r, {tsd1_wr_tpc_r, 2'b00}, trl1_tsa_wr_addr_r);
    end
   end
end

//----------------------------------------------------------

`ifndef GATESIM

// This was the original select_pc_b, the latest select_pc_b qualifies with errors
// But some of the error checkers need this signal without the qualification
// of icache errors
wire [7:0] select_pc_b_with_errors;

assign select_pc_b_with_errors =
     {{4 {~`SPC7.dec_flush_b[1]}}, {4 {~`SPC7.dec_flush_b[0]}}} & 

     {~(`SPC7.tlu.fls1.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC7.tlu.fls1.idl_req_in}}),
      ~(`SPC7.tlu.fls0.clear_disrupting_flush_pending_w_in[3:0] & 
	{4 {`SPC7.tlu.fls0.idl_req_in}})} &
     {`SPC7.tlu.fls1.tid_dec_valid_b[3:0], 
      `SPC7.tlu.fls0.tid_dec_valid_b[3:0]};

//------------------------------------
// Suppress instruction on flush or park request (clear_disrupting_flush_pending)
// Qualify select_pc_b_with_errors, with no errors to get final select_pc_b signal
wire [7:0] select_pc_b;

assign select_pc_b =
     select_pc_b_with_errors[7:0]  &
     {{4 {~`SPC7.tlu.fls1.ic_err_w_in}}, {4 {~`SPC7.tlu.fls0.ic_err_w_in}}};

//------------------------------------
// ASI & Trap State machines
always @(posedge `SPC7.gclk) begin // {

//    pc_0_e[47:0] <= `SPC7.ifu_pc_d0[47:0];
//    pc_1_e[47:0] <= `SPC7.ifu_pc_d1[47:0];
    pc_0_e[47:0] <= {`SPC7.tlu_pc_0_d[47:2], 2'b00};
    pc_1_e[47:0] <= {`SPC7.tlu_pc_1_d[47:2], 2'b00};
    pc_0_m[47:0] <= pc_0_e[47:0];
    pc_1_m[47:0] <= pc_1_e[47:0];
    pc_0_b[47:0] <= pc_0_m[47:0];
    pc_1_b[47:0] <= pc_1_m[47:0];
    pc_0_w[47:0] <= ({48 { select_pc_b[0]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[0]}} & pc_0_w[47:0]) ;
    pc_1_w[47:0] <= ({48 { select_pc_b[1]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[1]}} & pc_1_w[47:0]) ;
    pc_2_w[47:0] <= ({48 { select_pc_b[2]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[2]}} & pc_2_w[47:0]) ;
    pc_3_w[47:0] <= ({48 { select_pc_b[3]}} & pc_0_b[47:0]) | 
		    ({48 {~select_pc_b[3]}} & pc_3_w[47:0]) ;
    pc_4_w[47:0] <= ({48 { select_pc_b[4]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[4]}} & pc_4_w[47:0]) ;
    pc_5_w[47:0] <= ({48 { select_pc_b[5]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[5]}} & pc_5_w[47:0]) ;
    pc_6_w[47:0] <= ({48 { select_pc_b[6]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[6]}} & pc_6_w[47:0]) ;
    pc_7_w[47:0] <= ({48 { select_pc_b[7]}} & pc_1_b[47:0]) | 
		    ({48 {~select_pc_b[7]}} & pc_7_w[47:0]) ;
end

`endif
`endif //AXIS_TL

//----------------------------------------------------------
endmodule

`endif

