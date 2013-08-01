// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_trap_pipe.v
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


module axis_trap_pipe0 (
  mycid,
  mytid,
  PC_reg,
);

//----------------------------------------------------------
input [2:0]  mycid;
input [2:0]  mytid;

input [47:0] PC_reg;

reg   [47:0] pc_fx4;
reg   [47:0] pc_fx5;
reg   [47:0] pc_fb;
reg   [47:0] pc_fw;
reg   [47:0] pc_fw1;
reg   [47:0] pc_fw2;
reg   [47:0] last_pc;

`ifndef PALLADIUM

`ifdef AXIS_TL

`ifndef GATESIM

//----------------------------------------------------------
wire   [5:0] mytnum;
assign mytnum = (mycid*8)+mytid;

//----------------------------------------------------------
// Pipelined Signals
always @  (posedge `SPC0.gclk) begin // {   

  pc_fx4 <= PC_reg;
  pc_fx5 <= pc_fx4;
  pc_fb  <= pc_fx5;
  pc_fw  <= pc_fb;
  pc_fw1 <= pc_fw;
  pc_fw2 <= pc_fw1;

end // }

//----------------------------------------------------------
// When instruction completes,
//   Push differences to simics

wire        myclk            = `SPC0.gclk; 
reg hit_good_trap;
initial hit_good_trap=1'b0;
initial last_pc = 0;

always @ (posedge myclk) begin // {

    //----------
    // End detection for non-sas runs ..
    if (! `PARGS.nas_check_on) begin 
        if (last_pc[47:0] != pc_fw2[47:0]) begin 
          if (`PARGS.bad_trap_count >= 1) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr1 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr1);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 2) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr2 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr2);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
              //end 
            end
          end
          if (`PARGS.bad_trap_count >= 3) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr3 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr3);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 4) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr4 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr4);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          last_pc <= pc_fw2;
        end
        if (({16'b0,pc_fw2}&`PC_MASK) ===
                 (`PARGS.good_trap_addr&`PC_MASK) && !hit_good_trap) begin
            hit_good_trap<=1'b1;
        end 
    end 

end 
`endif
`endif //AXIS_TL

`endif //PALLADIUM
endmodule
//----------------------------------------------------------
//----------------------------------------------------------

`endif


`ifdef CORE_1


module axis_trap_pipe1 (
  mycid,
  mytid,
  PC_reg,
);

//----------------------------------------------------------
input [2:0]  mycid;
input [2:0]  mytid;

input [47:0] PC_reg;

reg   [47:0] pc_fx4;
reg   [47:0] pc_fx5;
reg   [47:0] pc_fb;
reg   [47:0] pc_fw;
reg   [47:0] pc_fw1;
reg   [47:0] pc_fw2;
reg   [47:0] last_pc;

`ifndef PALLADIUM

`ifdef AXIS_TL

`ifndef GATESIM

//----------------------------------------------------------
wire   [5:0] mytnum;
assign mytnum = (mycid*8)+mytid;

//----------------------------------------------------------
// Pipelined Signals
always @  (posedge `SPC1.gclk) begin // {   

  pc_fx4 <= PC_reg;
  pc_fx5 <= pc_fx4;
  pc_fb  <= pc_fx5;
  pc_fw  <= pc_fb;
  pc_fw1 <= pc_fw;
  pc_fw2 <= pc_fw1;

end // }

//----------------------------------------------------------
// When instruction completes,
//   Push differences to simics

wire        myclk            = `SPC1.gclk; 
reg hit_good_trap;
initial hit_good_trap=1'b0;
initial last_pc = 0;

always @ (posedge myclk) begin // {

    //----------
    // End detection for non-sas runs ..
    if (! `PARGS.nas_check_on) begin 
        if (last_pc[47:0] != pc_fw2[47:0]) begin 
          if (`PARGS.bad_trap_count >= 1) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr1 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr1);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 2) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr2 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr2);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
              //end 
            end
          end
          if (`PARGS.bad_trap_count >= 3) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr3 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr3);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 4) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr4 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr4);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          last_pc <= pc_fw2;
        end
        if (({16'b0,pc_fw2}&`PC_MASK) ===
                 (`PARGS.good_trap_addr&`PC_MASK) && !hit_good_trap) begin
            hit_good_trap<=1'b1;
        end 
    end 

end 
`endif
`endif //AXIS_TL

`endif //PALLADIUM
endmodule
//----------------------------------------------------------
//----------------------------------------------------------

`endif


`ifdef CORE_2


module axis_trap_pipe2 (
  mycid,
  mytid,
  PC_reg,
);

//----------------------------------------------------------
input [2:0]  mycid;
input [2:0]  mytid;

input [47:0] PC_reg;

reg   [47:0] pc_fx4;
reg   [47:0] pc_fx5;
reg   [47:0] pc_fb;
reg   [47:0] pc_fw;
reg   [47:0] pc_fw1;
reg   [47:0] pc_fw2;
reg   [47:0] last_pc;

`ifndef PALLADIUM

`ifdef AXIS_TL

`ifndef GATESIM

//----------------------------------------------------------
wire   [5:0] mytnum;
assign mytnum = (mycid*8)+mytid;

//----------------------------------------------------------
// Pipelined Signals
always @  (posedge `SPC2.gclk) begin // {   

  pc_fx4 <= PC_reg;
  pc_fx5 <= pc_fx4;
  pc_fb  <= pc_fx5;
  pc_fw  <= pc_fb;
  pc_fw1 <= pc_fw;
  pc_fw2 <= pc_fw1;

end // }

//----------------------------------------------------------
// When instruction completes,
//   Push differences to simics

wire        myclk            = `SPC2.gclk; 
reg hit_good_trap;
initial hit_good_trap=1'b0;
initial last_pc = 0;

always @ (posedge myclk) begin // {

    //----------
    // End detection for non-sas runs ..
    if (! `PARGS.nas_check_on) begin 
        if (last_pc[47:0] != pc_fw2[47:0]) begin 
          if (`PARGS.bad_trap_count >= 1) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr1 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr1);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 2) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr2 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr2);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
              //end 
            end
          end
          if (`PARGS.bad_trap_count >= 3) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr3 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr3);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 4) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr4 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr4);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          last_pc <= pc_fw2;
        end
        if (({16'b0,pc_fw2}&`PC_MASK) ===
                 (`PARGS.good_trap_addr&`PC_MASK) && !hit_good_trap) begin
            hit_good_trap<=1'b1;
        end 
    end 

end 
`endif
`endif //AXIS_TL

`endif //PALLADIUM
endmodule
//----------------------------------------------------------
//----------------------------------------------------------

`endif


`ifdef CORE_3


module axis_trap_pipe3 (
  mycid,
  mytid,
  PC_reg,
);

//----------------------------------------------------------
input [2:0]  mycid;
input [2:0]  mytid;

input [47:0] PC_reg;

reg   [47:0] pc_fx4;
reg   [47:0] pc_fx5;
reg   [47:0] pc_fb;
reg   [47:0] pc_fw;
reg   [47:0] pc_fw1;
reg   [47:0] pc_fw2;
reg   [47:0] last_pc;

`ifndef PALLADIUM

`ifdef AXIS_TL

`ifndef GATESIM

//----------------------------------------------------------
wire   [5:0] mytnum;
assign mytnum = (mycid*8)+mytid;

//----------------------------------------------------------
// Pipelined Signals
always @  (posedge `SPC3.gclk) begin // {   

  pc_fx4 <= PC_reg;
  pc_fx5 <= pc_fx4;
  pc_fb  <= pc_fx5;
  pc_fw  <= pc_fb;
  pc_fw1 <= pc_fw;
  pc_fw2 <= pc_fw1;

end // }

//----------------------------------------------------------
// When instruction completes,
//   Push differences to simics

wire        myclk            = `SPC3.gclk; 
reg hit_good_trap;
initial hit_good_trap=1'b0;
initial last_pc = 0;

always @ (posedge myclk) begin // {

    //----------
    // End detection for non-sas runs ..
    if (! `PARGS.nas_check_on) begin 
        if (last_pc[47:0] != pc_fw2[47:0]) begin 
          if (`PARGS.bad_trap_count >= 1) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr1 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr1);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 2) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr2 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr2);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
              //end 
            end
          end
          if (`PARGS.bad_trap_count >= 3) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr3 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr3);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 4) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr4 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr4);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          last_pc <= pc_fw2;
        end
        if (({16'b0,pc_fw2}&`PC_MASK) ===
                 (`PARGS.good_trap_addr&`PC_MASK) && !hit_good_trap) begin
            hit_good_trap<=1'b1;
        end 
    end 

end 
`endif
`endif //AXIS_TL

`endif //PALLADIUM
endmodule
//----------------------------------------------------------
//----------------------------------------------------------

`endif


`ifdef CORE_4


module axis_trap_pipe4 (
  mycid,
  mytid,
  PC_reg,
);

//----------------------------------------------------------
input [2:0]  mycid;
input [2:0]  mytid;

input [47:0] PC_reg;

reg   [47:0] pc_fx4;
reg   [47:0] pc_fx5;
reg   [47:0] pc_fb;
reg   [47:0] pc_fw;
reg   [47:0] pc_fw1;
reg   [47:0] pc_fw2;
reg   [47:0] last_pc;

`ifndef PALLADIUM

`ifdef AXIS_TL

`ifndef GATESIM

//----------------------------------------------------------
wire   [5:0] mytnum;
assign mytnum = (mycid*8)+mytid;

//----------------------------------------------------------
// Pipelined Signals
always @  (posedge `SPC4.gclk) begin // {   

  pc_fx4 <= PC_reg;
  pc_fx5 <= pc_fx4;
  pc_fb  <= pc_fx5;
  pc_fw  <= pc_fb;
  pc_fw1 <= pc_fw;
  pc_fw2 <= pc_fw1;

end // }

//----------------------------------------------------------
// When instruction completes,
//   Push differences to simics

wire        myclk            = `SPC4.gclk; 
reg hit_good_trap;
initial hit_good_trap=1'b0;
initial last_pc = 0;

always @ (posedge myclk) begin // {

    //----------
    // End detection for non-sas runs ..
    if (! `PARGS.nas_check_on) begin 
        if (last_pc[47:0] != pc_fw2[47:0]) begin 
          if (`PARGS.bad_trap_count >= 1) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr1 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr1);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 2) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr2 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr2);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
              //end 
            end
          end
          if (`PARGS.bad_trap_count >= 3) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr3 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr3);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 4) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr4 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr4);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          last_pc <= pc_fw2;
        end
        if (({16'b0,pc_fw2}&`PC_MASK) ===
                 (`PARGS.good_trap_addr&`PC_MASK) && !hit_good_trap) begin
            hit_good_trap<=1'b1;
        end 
    end 

end 
`endif
`endif //AXIS_TL

`endif //PALLADIUM
endmodule
//----------------------------------------------------------
//----------------------------------------------------------

`endif


`ifdef CORE_5


module axis_trap_pipe5 (
  mycid,
  mytid,
  PC_reg,
);

//----------------------------------------------------------
input [2:0]  mycid;
input [2:0]  mytid;

input [47:0] PC_reg;

reg   [47:0] pc_fx4;
reg   [47:0] pc_fx5;
reg   [47:0] pc_fb;
reg   [47:0] pc_fw;
reg   [47:0] pc_fw1;
reg   [47:0] pc_fw2;
reg   [47:0] last_pc;

`ifndef PALLADIUM

`ifdef AXIS_TL

`ifndef GATESIM

//----------------------------------------------------------
wire   [5:0] mytnum;
assign mytnum = (mycid*8)+mytid;

//----------------------------------------------------------
// Pipelined Signals
always @  (posedge `SPC5.gclk) begin // {   

  pc_fx4 <= PC_reg;
  pc_fx5 <= pc_fx4;
  pc_fb  <= pc_fx5;
  pc_fw  <= pc_fb;
  pc_fw1 <= pc_fw;
  pc_fw2 <= pc_fw1;

end // }

//----------------------------------------------------------
// When instruction completes,
//   Push differences to simics

wire        myclk            = `SPC5.gclk; 
reg hit_good_trap;
initial hit_good_trap=1'b0;
initial last_pc = 0;

always @ (posedge myclk) begin // {

    //----------
    // End detection for non-sas runs ..
    if (! `PARGS.nas_check_on) begin 
        if (last_pc[47:0] != pc_fw2[47:0]) begin 
          if (`PARGS.bad_trap_count >= 1) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr1 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr1);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 2) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr2 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr2);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
              //end 
            end
          end
          if (`PARGS.bad_trap_count >= 3) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr3 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr3);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 4) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr4 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr4);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          last_pc <= pc_fw2;
        end
        if (({16'b0,pc_fw2}&`PC_MASK) ===
                 (`PARGS.good_trap_addr&`PC_MASK) && !hit_good_trap) begin
            hit_good_trap<=1'b1;
        end 
    end 

end 
`endif
`endif //AXIS_TL

`endif //PALLADIUM
endmodule
//----------------------------------------------------------
//----------------------------------------------------------

`endif


`ifdef CORE_6


module axis_trap_pipe6 (
  mycid,
  mytid,
  PC_reg,
);

//----------------------------------------------------------
input [2:0]  mycid;
input [2:0]  mytid;

input [47:0] PC_reg;

reg   [47:0] pc_fx4;
reg   [47:0] pc_fx5;
reg   [47:0] pc_fb;
reg   [47:0] pc_fw;
reg   [47:0] pc_fw1;
reg   [47:0] pc_fw2;
reg   [47:0] last_pc;

`ifndef PALLADIUM

`ifdef AXIS_TL

`ifndef GATESIM

//----------------------------------------------------------
wire   [5:0] mytnum;
assign mytnum = (mycid*8)+mytid;

//----------------------------------------------------------
// Pipelined Signals
always @  (posedge `SPC6.gclk) begin // {   

  pc_fx4 <= PC_reg;
  pc_fx5 <= pc_fx4;
  pc_fb  <= pc_fx5;
  pc_fw  <= pc_fb;
  pc_fw1 <= pc_fw;
  pc_fw2 <= pc_fw1;

end // }

//----------------------------------------------------------
// When instruction completes,
//   Push differences to simics

wire        myclk            = `SPC6.gclk; 
reg hit_good_trap;
initial hit_good_trap=1'b0;
initial last_pc = 0;

always @ (posedge myclk) begin // {

    //----------
    // End detection for non-sas runs ..
    if (! `PARGS.nas_check_on) begin 
        if (last_pc[47:0] != pc_fw2[47:0]) begin 
          if (`PARGS.bad_trap_count >= 1) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr1 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr1);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 2) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr2 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr2);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
              //end 
            end
          end
          if (`PARGS.bad_trap_count >= 3) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr3 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr3);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 4) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr4 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr4);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          last_pc <= pc_fw2;
        end
        if (({16'b0,pc_fw2}&`PC_MASK) ===
                 (`PARGS.good_trap_addr&`PC_MASK) && !hit_good_trap) begin
            hit_good_trap<=1'b1;
        end 
    end 

end 
`endif
`endif //AXIS_TL

`endif //PALLADIUM
endmodule
//----------------------------------------------------------
//----------------------------------------------------------

`endif


`ifdef CORE_7


module axis_trap_pipe7 (
  mycid,
  mytid,
  PC_reg,
);

//----------------------------------------------------------
input [2:0]  mycid;
input [2:0]  mytid;

input [47:0] PC_reg;

reg   [47:0] pc_fx4;
reg   [47:0] pc_fx5;
reg   [47:0] pc_fb;
reg   [47:0] pc_fw;
reg   [47:0] pc_fw1;
reg   [47:0] pc_fw2;
reg   [47:0] last_pc;

`ifndef PALLADIUM

`ifdef AXIS_TL

`ifndef GATESIM

//----------------------------------------------------------
wire   [5:0] mytnum;
assign mytnum = (mycid*8)+mytid;

//----------------------------------------------------------
// Pipelined Signals
always @  (posedge `SPC7.gclk) begin // {   

  pc_fx4 <= PC_reg;
  pc_fx5 <= pc_fx4;
  pc_fb  <= pc_fx5;
  pc_fw  <= pc_fb;
  pc_fw1 <= pc_fw;
  pc_fw2 <= pc_fw1;

end // }

//----------------------------------------------------------
// When instruction completes,
//   Push differences to simics

wire        myclk            = `SPC7.gclk; 
reg hit_good_trap;
initial hit_good_trap=1'b0;
initial last_pc = 0;

always @ (posedge myclk) begin // {

    //----------
    // End detection for non-sas runs ..
    if (! `PARGS.nas_check_on) begin 
        if (last_pc[47:0] != pc_fw2[47:0]) begin 
          if (`PARGS.bad_trap_count >= 1) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr1 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr1);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 2) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr2 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr2);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
              //end 
            end
          end
          if (`PARGS.bad_trap_count >= 3) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr3 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr3);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          if (`PARGS.bad_trap_count >= 4) begin
            if (({16'b0,pc_fw2} & `PC_MASK) == `PARGS.bad_trap_addr4 & `PC_MASK) begin // axis tbcall_region
                  $display("T%0d reached Bad Trap = %h", mytnum,`PARGS.bad_trap_addr4);
                   axis_top.task_dump_mem;
                   axis_top.task_rcc_off;
            end
          end
          last_pc <= pc_fw2;
        end
        if (({16'b0,pc_fw2}&`PC_MASK) ===
                 (`PARGS.good_trap_addr&`PC_MASK) && !hit_good_trap) begin
            hit_good_trap<=1'b1;
        end 
    end 

end 
`endif
`endif //AXIS_TL

`endif //PALLADIUM
endmodule
//----------------------------------------------------------
//----------------------------------------------------------

`endif


