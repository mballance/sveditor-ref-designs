// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: axis_modules.v
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
`ifdef AXIS_TL
//----------------------------------------------------------
//----------------------------------------------------------
`timescale 1ps/1ps
module axis_clock_gen(sclkdiv2,sclk,sysclk);
output sclkdiv2;
output sclk;
output sysclk;

`ifdef AXIS_FBDIMM_NO_FSR
`ifndef RESET_AXIS_ONLY
assign  sclkdiv2 = 0;
`else
assign  sclkdiv2 = tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk44;
`endif
`else
`ifdef FAST_AXIS
assign  sclkdiv2 = tb_top.cpu.ccu.ccu_pll.clk44;
`else
assign  sclkdiv2 = tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk44;
`endif
`endif
`ifdef FAST_AXIS
assign  sysclk=tb_top.cpu.ccu.ccu_pll.clk2424;
`else
assign  sysclk=tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2424;
`endif
`ifdef AXIS_TL
`ifdef AXIS_FBDIMM_NO_FSR
`ifdef FAST_AXIS
assign     sclk = tb_top.cpu.ccu.ccu_pll.clk33;
`else
assign     sclk = tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk33;
`endif
`else
`ifdef FAST_AXIS
assign     sclk = tb_top.cpu.ccu.ccu_pll.clk11;
`else
assign     sclk = tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk11;
`endif
`endif
`else
`ifdef FAST_AXIS
assign     sclk = tb_top.cpu.ccu.ccu_pll.clk2424;
`else
assign     sclk = tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk2424;
`endif
`endif

endmodule

module axis_clock_force (mac_clk,peu_clk);
input mac_clk;
input peu_clk;

       assign tb_top.cpu.psr_peu_txbclk0 = peu_clk;   //ref clk to PEU
       assign tb_top.cpu.mac.esr_mac_tclk_0 = mac_clk;  //ref clk inputs to xMAC
       assign tb_top.cpu.mac.esr_mac_tclk_1 = mac_clk;
       assign tb_top.cpu.mac.esr_mac_rclk_0[3] = mac_clk; //ref clk inputs to xMAC
       assign tb_top.cpu.mac.esr_mac_rclk_0[2] = mac_clk; // req'd for xPCS loopback
       assign tb_top.cpu.mac.esr_mac_rclk_0[1] = mac_clk;
       assign tb_top.cpu.mac.esr_mac_rclk_0[0] = mac_clk;
       assign tb_top.cpu.mac.esr_mac_rclk_1[3] = mac_clk;
       assign tb_top.cpu.mac.esr_mac_rclk_1[2] = mac_clk;
       assign tb_top.cpu.mac.esr_mac_rclk_1[1] = mac_clk;
       assign tb_top.cpu.mac.esr_mac_rclk_1[0] = mac_clk;

endmodule

module axis_clock_generator (sclk,fbclk,sysclk);

output sclk;
output fbclk;
output sysclk;
wire mac_clk,peu_clk;
`ifdef FAST_AXIS
assign mac_clk = tb_top.cpu.ccu.ccu_pll.n2_core_pll_cust.mac_clk_1;
assign peu_clk = tb_top.cpu.ccu.ccu_pll.n2_core_pll_cust.peu_clk_1;
`else
assign mac_clk = tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.mac_clk_1;
assign peu_clk = tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.peu_clk_1;
`endif
//assign sclk;=axis_clock_gen.sclk;
//assign fbclk;=axis_clock_gen.sclkdiv2;
//assign sysclk; //=axis_clock_gen.sysclk;

axis_clock_force axis_clock_force (mac_clk,peu_clk);

axis_clock_gen axis_clock_gen  (fbclk,sclk,sysclk);
endmodule
`endif

module dbuff_pc (
		 cycle,pc,clk,core,thread
		 );


   input  [63:0]      cycle;
   input  [63:0]      pc;
   input  clk;
   input  [2:0]       core;
   input  [2:0]       thread;


`ifdef AXIS_TL
reg     [63:0] last_pc;
reg     [111:0] pc_r;
reg     [17:0] addr;
reg     we;
reg     [63:0] inact_cnt;
reg     [63:0] ptr_0_cycle;
reg     [2:0] core_r;
reg     [2:0] thread_r;
reg     [63:0] cycle_r;


wire   [17:0]      a_adr0 = addr;
wire   [111:0]      a_data0=pc_r;
wire a_we=we;
wire [7:0] status;

`ifdef PALLADIUM
// INTERNAL ERROR
//
    reg [112:0] DBUFF [0:262143];
//    always @ (a_adr0 or a_data0 or a_we)
//      begin
//      if(a_we)
//        DBUFF[a_adr0] <= a_data0 ;
//      end
//
`else // !`ifdef PALLADIUM

axis_smem #(18,  112, 1, 0) DBUFF
(
    {112'bz   }, // Data Out
    {a_data0  }, // Data In
    {a_adr0   }, // Address
    {a_we       }, // Write Enable : 1'b0 means always read
    {1'b1       }, // Chip Enable
    {1'bz       }, // Clocks : 1'bz means asynchronous
    {112'bz    }  // Mask
);
initial addr=18'b0;
initial last_pc=48'b0;
initial we=1'b0;
initial inact_cnt = 64'b1;

always @(posedge clk) begin
  pc_r <= {cycle[63:0],pc[47:0]};
  core_r <= core;
  cycle_r <= cycle;
  thread_r <= thread;
  if (pc[47:0] != last_pc[47:0]) begin
    inact_cnt <= 64'b0;
    if (!tb_top.pc_trc_mode || (pc[47:0] != last_pc[47:0]+4)) begin
      last_pc<= pc;
      addr<=addr+18'b1;
      we<=1'b1;
      if (addr == 0) ptr_0_cycle <= cycle;
    end
  end else begin
    we<=1'b0;
    if ((pc[47:0] != 0) && (pc[47:44] != 4'hf))  inact_cnt <= inact_cnt + 1;
  end
  if (inact_cnt == tb_top.thread_wdto) begin // axis tbcall_region
     $display("INACT%h_%h at cycle %d, t=%d.",core_r,thread_r,cycle_r,$time);
     if(tb_top.stop_on_wdto) begin
	axis_top.task_dump_mem;
	axis_top.task_rcc_off;
     end
  end
end
`endif // !PALLADIUM
`endif //AXIS_TL

endmodule

`ifdef AXIS_TL_ICE
`timescale 1ps/1ps
module jtag_ice (tms,tdi,tdo,tck,tck_fb);
input  tdo;
input  tck_fb;
output  tms;
output  tdi;
output  tck;

wire tdo_to_asl;
wire tck_fb_to_asl;
wire tdi_from_asl;
wire tms_from_asl;
wire tck_from_asl;


reg tms_r,tdi_r,tdo_r,tck_r,tck_r2, tck_r3,tck_r_r;
assign tdo_to_asl=tdo;
assign tck_fb_to_asl=tck_fb;
wire tdi_i=tdi_from_asl;
wire tms_i=tms_from_asl;
wire tck_i=tck_from_asl;
assign tdi=tdi_r;
assign tms=tms_r;
assign tck=tck_r_r;
reg dbg,dbg1;
initial dbg=0;

`ifndef PALLADIUM
`ifdef FAST_AXIS
  always @(posedge tb_top.cpu.ccu.ccu_pll.clk22) begin
`else
always @(posedge tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk22) begin
`endif
  tms_r=tms_i;
  tdi_r=tdi_i;
  tdo_r=tdo;
  tck_r_r=tck_r3;
  tck_r3=tck_r2;
  tck_r2=tck_r;
  tck_r=tck_i;
end
always @(posedge tck_r_r)
  if (dbg & (tms_r | tdi_r | tck_r | tdo_r))
    begin // axis tbcall_region
     $display($time,"dbg:tms,tdi,tck,tdo %b %b %b %b",tms_r,tdi_r,tck_r,tdo_r);
   end
`endif // !PALLADIUM

reg tms_r1,tdi_r1,tdo_r1,tck_r1;

`ifndef PALLADIUM
initial dbg1=0;
`ifdef FAST_AXIS
  always @(posedge tb_top.cpu.ccu.ccu_pll.clk22) begin
`else
always @(posedge tb_top.cpu.ccu.ccu_pll.x1.imaginary_vco_gen.pll_core.clk22) begin
`endif
  tms_r1=tms;
  tdi_r1=tdi;
  tdo_r1=tdo;
  tck_r1=tck;
end
always @(tms_r1 or tdi_r1 or tck_r1 or tdo_r1)
  if (dbg1)
    begin // axis tbcall_region
     $display($time,"dbg1: tms,tdi,tck,tdo %b %b %b %b",tms_r1,tdi_r1,tck_r1,tdo_r1);
   end
`endif // !PALLADIUM

wire tck_fb_to_asl_a=tck_fb_to_asl;
wire tck_fb_to_asl_b=tck_fb_to_asl;

`ifndef PALLADIUM
axis_asl_use  (tdo_to_asl,"d",11,"js1",88);
axis_asl_use  (tck_fb_to_asl,"d",11,"js1",89);
axis_asl_use  (tck_fb_to_asl_a,"d",11,"js1",93);
axis_asl_use  (tck_fb_to_asl_b,"d",11,"js1",97);
axis_asl_drive  (tms_from_asl,"d",11,"js1",138);
axis_asl_drive  (tdi_from_asl,"d",11,"js1",96);
axis_asl_drive  (tck_from_asl,"c",11,"js1",92);
`endif // !PALLADIUM
endmodule
`endif

`timescale 1ps/1ps
module axis_mcu_errmon (clk,
			rdpctl_meu_error,
			rdpctl_mec_error,
			rdpctl_dac_error,
			rdpctl_dau_error,
			rdpctl_dsc_error,
			rdpctl_dsu_error,
			rdpctl_dbu_error,
			rdpctl_meb_error,
			rdpctl_fbu_error,
			rdpctl_fbr_error
			);
   parameter INST          = 0; // Instance of MCU

   input clk;
   input rdpctl_meu_error;
   input rdpctl_mec_error;
   input rdpctl_dac_error;
   input rdpctl_dau_error;
   input rdpctl_dsc_error;
   input rdpctl_dsu_error;
   input rdpctl_dbu_error;
   input rdpctl_meb_error;
   input rdpctl_fbu_error;
   input rdpctl_fbr_error;

   wire [31:0] rdpctl_err_sts_next;
   reg [31:0]  rdpctl_err_sts_reg;

   assign      rdpctl_err_sts_next[25:16] = {rdpctl_meu_error, rdpctl_mec_error, rdpctl_dac_error, rdpctl_dau_error,
					     rdpctl_dsc_error, rdpctl_dsu_error, rdpctl_dbu_error, rdpctl_meb_error,
					     rdpctl_fbu_error, rdpctl_fbr_error};

   initial begin
      rdpctl_err_sts_reg = 0;
   end

// always @(posedge clk) begin
   always @(rdpctl_err_sts_next) begin
      if(rdpctl_err_sts_reg != rdpctl_err_sts_next)  begin // axis tbcall_region
	 $display("%d mcu%d rdpctl_err_sts_next <= %08X", $time, INST, rdpctl_err_sts_next);
      end

      rdpctl_err_sts_reg <= rdpctl_err_sts_next;
   end
endmodule // axis_mcu_errmon
