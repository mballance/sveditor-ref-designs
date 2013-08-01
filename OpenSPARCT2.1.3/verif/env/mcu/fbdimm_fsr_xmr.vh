// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fbdimm_fsr_xmr.vh
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
`ifdef  AXIS_FBDIMM_NO_FSR
module no_fsr_for_axis;

assign tb_top.cpu.fsr_left.fsr0_mcu0_rxbclk[13:0] =   {14{tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.dram_clk}};
assign tb_top.cpu.fsr_left.fsr1_mcu0_rxbclk[13:0] =   {14{tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.dram_clk}};
assign tb_top.cpu.fsr_left.fsr2_mcu1_rxbclk[13:0] =   {14{tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.dram_clk}};
assign tb_top.cpu.fsr_left.fsr3_mcu1_rxbclk[13:0] =   {14{tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.dram_clk}};
assign tb_top.cpu.fsr_right.fsr4_mcu2_rxbclk[13:0] =  {14{tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.dram_clk}};
assign tb_top.cpu.fsr_right.fsr5_mcu2_rxbclk[13:0] =  {14{tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.dram_clk}};
assign tb_top.cpu.fsr_right.fsr6_mcu3_rxbclk[13:0] =  {14{tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.dram_clk}};
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_rxbclk[13:0] = {14{tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.dram_clk}};

// tie the data buses between mcu and fbdimm, bypassing fsr

//wire link_clk = tb_top.dram_12x_clk;
//wire link_clk = tb_top.dram_3x_clk;
wire link_clk = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.fbdimm_clk_gen.clk_int;

reg [119:0] data0;
reg [119:0] data1;
reg [119:0] data2;
reg [119:0] data3;
reg [119:0] data4;
reg [119:0] data5;
reg [119:0] data6;
reg [119:0] data7;

// South Bound
always@(negedge link_clk)
begin

data0[119:0] <= tb_top.cpu.mcu0_fsr0_data[119:0];
data1[119:0] <= tb_top.cpu.mcu0_fsr1_data[119:0];
data2[119:0] <= tb_top.cpu.mcu1_fsr2_data[119:0];
data3[119:0] <= tb_top.cpu.mcu1_fsr3_data[119:0];
data4[119:0] <= tb_top.cpu.mcu2_fsr4_data[119:0];
data5[119:0] <= tb_top.cpu.mcu2_fsr5_data[119:0];
data6[119:0] <= tb_top.cpu.mcu3_fsr6_data[119:0];
data7[119:0] <= tb_top.cpu.mcu3_fsr7_data[119:0];

end


// reg0

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg0[11:0] = data0[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg0[11:0] = data1[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg0[11:0] = data2[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg0[11:0] = data3[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg0[11:0] = data4[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg0[11:0] = data5[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg0[11:0] = data6[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg0[11:0] = data7[(0*12)+11:0*12];

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg0_b[11:0] = (tb_top.cpu.mcu0_fsr0_cfgtx_enidl)? data0[(0*12)+11:0*12] : ~data0[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg0_b[11:0] = (tb_top.cpu.mcu0_fsr1_cfgtx_enidl)? data1[(0*12)+11:0*12] : ~data1[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg0_b[11:0] = (tb_top.cpu.mcu1_fsr2_cfgtx_enidl)? data2[(0*12)+11:0*12] : ~data2[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg0_b[11:0] = (tb_top.cpu.mcu1_fsr3_cfgtx_enidl)? data3[(0*12)+11:0*12] : ~data3[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg0_b[11:0] = (tb_top.cpu.mcu2_fsr4_cfgtx_enidl)? data4[(0*12)+11:0*12] : ~data4[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg0_b[11:0] = (tb_top.cpu.mcu2_fsr5_cfgtx_enidl)? data5[(0*12)+11:0*12] : ~data5[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg0_b[11:0] = (tb_top.cpu.mcu3_fsr6_cfgtx_enidl)? data6[(0*12)+11:0*12] : ~data6[(0*12)+11:0*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg0_b[11:0] = (tb_top.cpu.mcu3_fsr7_cfgtx_enidl)? data7[(0*12)+11:0*12] : ~data7[(0*12)+11:0*12];


// reg1

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg1[11:0] = data0[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg1[11:0] = data1[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg1[11:0] = data2[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg1[11:0] = data3[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg1[11:0] = data4[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg1[11:0] = data5[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg1[11:0] = data6[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg1[11:0] = data7[(1*12)+11:1*12];

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg1_b[11:0] = (tb_top.cpu.mcu0_fsr0_cfgtx_enidl)? data0[(1*12)+11:1*12] : ~data0[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg1_b[11:0] = (tb_top.cpu.mcu0_fsr1_cfgtx_enidl)? data1[(1*12)+11:1*12] : ~data1[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg1_b[11:0] = (tb_top.cpu.mcu1_fsr2_cfgtx_enidl)? data2[(1*12)+11:1*12] : ~data2[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg1_b[11:0] = (tb_top.cpu.mcu1_fsr3_cfgtx_enidl)? data3[(1*12)+11:1*12] : ~data3[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg1_b[11:0] = (tb_top.cpu.mcu2_fsr4_cfgtx_enidl)? data4[(1*12)+11:1*12] : ~data4[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg1_b[11:0] = (tb_top.cpu.mcu2_fsr5_cfgtx_enidl)? data5[(1*12)+11:1*12] : ~data5[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg1_b[11:0] = (tb_top.cpu.mcu3_fsr6_cfgtx_enidl)? data6[(1*12)+11:1*12] : ~data6[(1*12)+11:1*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg1_b[11:0] = (tb_top.cpu.mcu3_fsr7_cfgtx_enidl)? data7[(1*12)+11:1*12] : ~data7[(1*12)+11:1*12];


// reg2

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg2[11:0] = data0[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg2[11:0] = data1[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg2[11:0] = data2[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg2[11:0] = data3[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg2[11:0] = data4[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg2[11:0] = data5[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg2[11:0] = data6[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg2[11:0] = data7[(2*12)+11:2*12];

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg2_b[11:0] = (tb_top.cpu.mcu0_fsr0_cfgtx_enidl)? data0[(2*12)+11:2*12] : ~data0[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg2_b[11:0] = (tb_top.cpu.mcu0_fsr1_cfgtx_enidl)? data1[(2*12)+11:2*12] : ~data1[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg2_b[11:0] = (tb_top.cpu.mcu1_fsr2_cfgtx_enidl)? data2[(2*12)+11:2*12] : ~data2[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg2_b[11:0] = (tb_top.cpu.mcu1_fsr3_cfgtx_enidl)? data3[(2*12)+11:2*12] : ~data3[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg2_b[11:0] = (tb_top.cpu.mcu2_fsr4_cfgtx_enidl)? data4[(2*12)+11:2*12] : ~data4[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg2_b[11:0] = (tb_top.cpu.mcu2_fsr5_cfgtx_enidl)? data5[(2*12)+11:2*12] : ~data5[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg2_b[11:0] = (tb_top.cpu.mcu3_fsr6_cfgtx_enidl)? data6[(2*12)+11:2*12] : ~data6[(2*12)+11:2*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg2_b[11:0] = (tb_top.cpu.mcu3_fsr7_cfgtx_enidl)? data7[(2*12)+11:2*12] : ~data7[(2*12)+11:2*12];


// reg3

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg3[11:0] = data0[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg3[11:0] = data1[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg3[11:0] = data2[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg3[11:0] = data3[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg3[11:0] = data4[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg3[11:0] = data5[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg3[11:0] = data6[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg3[11:0] = data7[(3*12)+11:3*12];

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg3_b[11:0] = (tb_top.cpu.mcu0_fsr0_cfgtx_enidl)? data0[(3*12)+11:3*12] : ~data0[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg3_b[11:0] = (tb_top.cpu.mcu0_fsr1_cfgtx_enidl)? data1[(3*12)+11:3*12] : ~data1[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg3_b[11:0] = (tb_top.cpu.mcu1_fsr2_cfgtx_enidl)? data2[(3*12)+11:3*12] : ~data2[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg3_b[11:0] = (tb_top.cpu.mcu1_fsr3_cfgtx_enidl)? data3[(3*12)+11:3*12] : ~data3[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg3_b[11:0] = (tb_top.cpu.mcu2_fsr4_cfgtx_enidl)? data4[(3*12)+11:3*12] : ~data4[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg3_b[11:0] = (tb_top.cpu.mcu2_fsr5_cfgtx_enidl)? data5[(3*12)+11:3*12] : ~data5[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg3_b[11:0] = (tb_top.cpu.mcu3_fsr6_cfgtx_enidl)? data6[(3*12)+11:3*12] : ~data6[(3*12)+11:3*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg3_b[11:0] = (tb_top.cpu.mcu3_fsr7_cfgtx_enidl)? data7[(3*12)+11:3*12] : ~data7[(3*12)+11:3*12];


// reg4

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg4[11:0] = data0[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg4[11:0] = data1[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg4[11:0] = data2[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg4[11:0] = data3[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg4[11:0] = data4[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg4[11:0] = data5[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg4[11:0] = data6[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg4[11:0] = data7[(4*12)+11:4*12];

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg4_b[11:0] = (tb_top.cpu.mcu0_fsr0_cfgtx_enidl)? data0[(4*12)+11:4*12] : ~data0[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg4_b[11:0] = (tb_top.cpu.mcu0_fsr1_cfgtx_enidl)? data1[(4*12)+11:4*12] : ~data1[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg4_b[11:0] = (tb_top.cpu.mcu1_fsr2_cfgtx_enidl)? data2[(4*12)+11:4*12] : ~data2[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg4_b[11:0] = (tb_top.cpu.mcu1_fsr3_cfgtx_enidl)? data3[(4*12)+11:4*12] : ~data3[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg4_b[11:0] = (tb_top.cpu.mcu2_fsr4_cfgtx_enidl)? data4[(4*12)+11:4*12] : ~data4[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg4_b[11:0] = (tb_top.cpu.mcu2_fsr5_cfgtx_enidl)? data5[(4*12)+11:4*12] : ~data5[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg4_b[11:0] = (tb_top.cpu.mcu3_fsr6_cfgtx_enidl)? data6[(4*12)+11:4*12] : ~data6[(4*12)+11:4*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg4_b[11:0] = (tb_top.cpu.mcu3_fsr7_cfgtx_enidl)? data7[(4*12)+11:4*12] : ~data7[(4*12)+11:4*12];


// reg5

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg5[11:0] = data0[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg5[11:0] = data1[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg5[11:0] = data2[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg5[11:0] = data3[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg5[11:0] = data4[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg5[11:0] = data5[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg5[11:0] = data6[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg5[11:0] = data7[(5*12)+11:5*12];

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg5_b[11:0] = (tb_top.cpu.mcu0_fsr0_cfgtx_enidl)? data0[(5*12)+11:5*12] : ~data0[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg5_b[11:0] = (tb_top.cpu.mcu0_fsr1_cfgtx_enidl)? data1[(5*12)+11:5*12] : ~data1[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg5_b[11:0] = (tb_top.cpu.mcu1_fsr2_cfgtx_enidl)? data2[(5*12)+11:5*12] : ~data2[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg5_b[11:0] = (tb_top.cpu.mcu1_fsr3_cfgtx_enidl)? data3[(5*12)+11:5*12] : ~data3[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg5_b[11:0] = (tb_top.cpu.mcu2_fsr4_cfgtx_enidl)? data4[(5*12)+11:5*12] : ~data4[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg5_b[11:0] = (tb_top.cpu.mcu2_fsr5_cfgtx_enidl)? data5[(5*12)+11:5*12] : ~data5[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg5_b[11:0] = (tb_top.cpu.mcu3_fsr6_cfgtx_enidl)? data6[(5*12)+11:5*12] : ~data6[(5*12)+11:5*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg5_b[11:0] = (tb_top.cpu.mcu3_fsr7_cfgtx_enidl)? data7[(5*12)+11:5*12] : ~data7[(5*12)+11:5*12];


// reg6

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg6[11:0] = data0[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg6[11:0] = data1[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg6[11:0] = data2[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg6[11:0] = data3[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg6[11:0] = data4[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg6[11:0] = data5[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg6[11:0] = data6[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg6[11:0] = data7[(6*12)+11:6*12];

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg6_b[11:0] = (tb_top.cpu.mcu0_fsr0_cfgtx_enidl)? data0[(6*12)+11:6*12] : ~data0[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg6_b[11:0] = (tb_top.cpu.mcu0_fsr1_cfgtx_enidl)? data1[(6*12)+11:6*12] : ~data1[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg6_b[11:0] = (tb_top.cpu.mcu1_fsr2_cfgtx_enidl)? data2[(6*12)+11:6*12] : ~data2[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg6_b[11:0] = (tb_top.cpu.mcu1_fsr3_cfgtx_enidl)? data3[(6*12)+11:6*12] : ~data3[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg6_b[11:0] = (tb_top.cpu.mcu2_fsr4_cfgtx_enidl)? data4[(6*12)+11:6*12] : ~data4[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg6_b[11:0] = (tb_top.cpu.mcu2_fsr5_cfgtx_enidl)? data5[(6*12)+11:6*12] : ~data5[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg6_b[11:0] = (tb_top.cpu.mcu3_fsr6_cfgtx_enidl)? data6[(6*12)+11:6*12] : ~data6[(6*12)+11:6*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg6_b[11:0] = (tb_top.cpu.mcu3_fsr7_cfgtx_enidl)? data7[(6*12)+11:6*12] : ~data7[(6*12)+11:6*12];


// reg7

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg7[11:0] = data0[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg7[11:0] = data1[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg7[11:0] = data2[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg7[11:0] = data3[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg7[11:0] = data4[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg7[11:0] = data5[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg7[11:0] = data6[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg7[11:0] = data7[(7*12)+11:7*12];

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg7_b[11:0] = (tb_top.cpu.mcu0_fsr0_cfgtx_enidl)? data0[(7*12)+11:7*12] : ~data0[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg7_b[11:0] = (tb_top.cpu.mcu0_fsr1_cfgtx_enidl)? data1[(7*12)+11:7*12] : ~data1[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg7_b[11:0] = (tb_top.cpu.mcu1_fsr2_cfgtx_enidl)? data2[(7*12)+11:7*12] : ~data2[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg7_b[11:0] = (tb_top.cpu.mcu1_fsr3_cfgtx_enidl)? data3[(7*12)+11:7*12] : ~data3[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg7_b[11:0] = (tb_top.cpu.mcu2_fsr4_cfgtx_enidl)? data4[(7*12)+11:7*12] : ~data4[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg7_b[11:0] = (tb_top.cpu.mcu2_fsr5_cfgtx_enidl)? data5[(7*12)+11:7*12] : ~data5[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg7_b[11:0] = (tb_top.cpu.mcu3_fsr6_cfgtx_enidl)? data6[(7*12)+11:7*12] : ~data6[(7*12)+11:7*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg7_b[11:0] = (tb_top.cpu.mcu3_fsr7_cfgtx_enidl)? data7[(7*12)+11:7*12] : ~data7[(7*12)+11:7*12];


// reg8

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg8[11:0] = data0[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg8[11:0] = data1[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg8[11:0] = data2[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg8[11:0] = data3[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg8[11:0] = data4[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg8[11:0] = data5[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg8[11:0] = data6[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg8[11:0] = data7[(8*12)+11:8*12];

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg8_b[11:0] = (tb_top.cpu.mcu0_fsr0_cfgtx_enidl)? data0[(8*12)+11:8*12] : ~data0[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg8_b[11:0] = (tb_top.cpu.mcu0_fsr1_cfgtx_enidl)? data1[(8*12)+11:8*12] : ~data1[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg8_b[11:0] = (tb_top.cpu.mcu1_fsr2_cfgtx_enidl)? data2[(8*12)+11:8*12] : ~data2[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg8_b[11:0] = (tb_top.cpu.mcu1_fsr3_cfgtx_enidl)? data3[(8*12)+11:8*12] : ~data3[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg8_b[11:0] = (tb_top.cpu.mcu2_fsr4_cfgtx_enidl)? data4[(8*12)+11:8*12] : ~data4[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg8_b[11:0] = (tb_top.cpu.mcu2_fsr5_cfgtx_enidl)? data5[(8*12)+11:8*12] : ~data5[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg8_b[11:0] = (tb_top.cpu.mcu3_fsr6_cfgtx_enidl)? data6[(8*12)+11:8*12] : ~data6[(8*12)+11:8*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg8_b[11:0] = (tb_top.cpu.mcu3_fsr7_cfgtx_enidl)? data7[(8*12)+11:8*12] : ~data7[(8*12)+11:8*12];


// reg9

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg9[11:0] = data0[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg9[11:0] = data1[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg9[11:0] = data2[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg9[11:0] = data3[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg9[11:0] = data4[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg9[11:0] = data5[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg9[11:0] = data6[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg9[11:0] = data7[(9*12)+11:9*12];

assign tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_sb_fsr.reg9_b[11:0] = (tb_top.cpu.mcu0_fsr0_cfgtx_enidl)? data0[(9*12)+11:9*12] : ~data0[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_sb_fsr.reg9_b[11:0] = (tb_top.cpu.mcu0_fsr1_cfgtx_enidl)? data1[(9*12)+11:9*12] : ~data1[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_sb_fsr.reg9_b[11:0] = (tb_top.cpu.mcu1_fsr2_cfgtx_enidl)? data2[(9*12)+11:9*12] : ~data2[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_sb_fsr.reg9_b[11:0] = (tb_top.cpu.mcu1_fsr3_cfgtx_enidl)? data3[(9*12)+11:9*12] : ~data3[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_sb_fsr.reg9_b[11:0] = (tb_top.cpu.mcu2_fsr4_cfgtx_enidl)? data4[(9*12)+11:9*12] : ~data4[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_sb_fsr.reg9_b[11:0] = (tb_top.cpu.mcu2_fsr5_cfgtx_enidl)? data5[(9*12)+11:9*12] : ~data5[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_sb_fsr.reg9_b[11:0] = (tb_top.cpu.mcu3_fsr6_cfgtx_enidl)? data6[(9*12)+11:9*12] : ~data6[(9*12)+11:9*12];
assign tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_sb_fsr.reg9_b[11:0] = (tb_top.cpu.mcu3_fsr7_cfgtx_enidl)? data7[(9*12)+11:9*12] : ~data7[(9*12)+11:9*12];


// North Bound

// rd0

assign tb_top.cpu.fsr0_mcu0_data[0*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[0];


assign tb_top.cpu.fsr0_mcu0_data[0*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[0];
assign tb_top.cpu.fsr1_mcu0_data[0*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[0];
assign tb_top.cpu.fsr2_mcu1_data[0*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[0];
assign tb_top.cpu.fsr3_mcu1_data[0*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[0];
assign tb_top.cpu.fsr4_mcu2_data[0*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[0];
assign tb_top.cpu.fsr5_mcu2_data[0*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[0];
assign tb_top.cpu.fsr6_mcu3_data[0*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[0];
assign tb_top.cpu.fsr7_mcu3_data[0*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[0];


// rd1

assign tb_top.cpu.fsr0_mcu0_data[1*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[1];


assign tb_top.cpu.fsr0_mcu0_data[1*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[1];
assign tb_top.cpu.fsr1_mcu0_data[1*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[1];
assign tb_top.cpu.fsr2_mcu1_data[1*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[1];
assign tb_top.cpu.fsr3_mcu1_data[1*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[1];
assign tb_top.cpu.fsr4_mcu2_data[1*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[1];
assign tb_top.cpu.fsr5_mcu2_data[1*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[1];
assign tb_top.cpu.fsr6_mcu3_data[1*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[1];
assign tb_top.cpu.fsr7_mcu3_data[1*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[1];


// rd2

assign tb_top.cpu.fsr0_mcu0_data[2*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[2];


assign tb_top.cpu.fsr0_mcu0_data[2*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[2];
assign tb_top.cpu.fsr1_mcu0_data[2*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[2];
assign tb_top.cpu.fsr2_mcu1_data[2*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[2];
assign tb_top.cpu.fsr3_mcu1_data[2*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[2];
assign tb_top.cpu.fsr4_mcu2_data[2*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[2];
assign tb_top.cpu.fsr5_mcu2_data[2*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[2];
assign tb_top.cpu.fsr6_mcu3_data[2*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[2];
assign tb_top.cpu.fsr7_mcu3_data[2*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[2];


// rd3

assign tb_top.cpu.fsr0_mcu0_data[3*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[3];


assign tb_top.cpu.fsr0_mcu0_data[3*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[3];
assign tb_top.cpu.fsr1_mcu0_data[3*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[3];
assign tb_top.cpu.fsr2_mcu1_data[3*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[3];
assign tb_top.cpu.fsr3_mcu1_data[3*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[3];
assign tb_top.cpu.fsr4_mcu2_data[3*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[3];
assign tb_top.cpu.fsr5_mcu2_data[3*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[3];
assign tb_top.cpu.fsr6_mcu3_data[3*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[3];
assign tb_top.cpu.fsr7_mcu3_data[3*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[3];


// rd4

assign tb_top.cpu.fsr0_mcu0_data[4*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[4];


assign tb_top.cpu.fsr0_mcu0_data[4*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[4];
assign tb_top.cpu.fsr1_mcu0_data[4*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[4];
assign tb_top.cpu.fsr2_mcu1_data[4*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[4];
assign tb_top.cpu.fsr3_mcu1_data[4*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[4];
assign tb_top.cpu.fsr4_mcu2_data[4*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[4];
assign tb_top.cpu.fsr5_mcu2_data[4*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[4];
assign tb_top.cpu.fsr6_mcu3_data[4*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[4];
assign tb_top.cpu.fsr7_mcu3_data[4*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[4];


// rd5

assign tb_top.cpu.fsr0_mcu0_data[5*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[5];


assign tb_top.cpu.fsr0_mcu0_data[5*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[5];
assign tb_top.cpu.fsr1_mcu0_data[5*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[5];
assign tb_top.cpu.fsr2_mcu1_data[5*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[5];
assign tb_top.cpu.fsr3_mcu1_data[5*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[5];
assign tb_top.cpu.fsr4_mcu2_data[5*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[5];
assign tb_top.cpu.fsr5_mcu2_data[5*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[5];
assign tb_top.cpu.fsr6_mcu3_data[5*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[5];
assign tb_top.cpu.fsr7_mcu3_data[5*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[5];


// rd6

assign tb_top.cpu.fsr0_mcu0_data[6*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[6];


assign tb_top.cpu.fsr0_mcu0_data[6*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[6];
assign tb_top.cpu.fsr1_mcu0_data[6*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[6];
assign tb_top.cpu.fsr2_mcu1_data[6*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[6];
assign tb_top.cpu.fsr3_mcu1_data[6*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[6];
assign tb_top.cpu.fsr4_mcu2_data[6*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[6];
assign tb_top.cpu.fsr5_mcu2_data[6*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[6];
assign tb_top.cpu.fsr6_mcu3_data[6*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[6];
assign tb_top.cpu.fsr7_mcu3_data[6*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[6];


// rd7

assign tb_top.cpu.fsr0_mcu0_data[7*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[7];


assign tb_top.cpu.fsr0_mcu0_data[7*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[7];
assign tb_top.cpu.fsr1_mcu0_data[7*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[7];
assign tb_top.cpu.fsr2_mcu1_data[7*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[7];
assign tb_top.cpu.fsr3_mcu1_data[7*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[7];
assign tb_top.cpu.fsr4_mcu2_data[7*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[7];
assign tb_top.cpu.fsr5_mcu2_data[7*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[7];
assign tb_top.cpu.fsr6_mcu3_data[7*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[7];
assign tb_top.cpu.fsr7_mcu3_data[7*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[7];


// rd8

assign tb_top.cpu.fsr0_mcu0_data[8*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[8];


assign tb_top.cpu.fsr0_mcu0_data[8*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[8];
assign tb_top.cpu.fsr1_mcu0_data[8*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[8];
assign tb_top.cpu.fsr2_mcu1_data[8*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[8];
assign tb_top.cpu.fsr3_mcu1_data[8*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[8];
assign tb_top.cpu.fsr4_mcu2_data[8*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[8];
assign tb_top.cpu.fsr5_mcu2_data[8*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[8];
assign tb_top.cpu.fsr6_mcu3_data[8*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[8];
assign tb_top.cpu.fsr7_mcu3_data[8*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[8];


// rd9

assign tb_top.cpu.fsr0_mcu0_data[9*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[9];


assign tb_top.cpu.fsr0_mcu0_data[9*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[9];
assign tb_top.cpu.fsr1_mcu0_data[9*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[9];
assign tb_top.cpu.fsr2_mcu1_data[9*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[9];
assign tb_top.cpu.fsr3_mcu1_data[9*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[9];
assign tb_top.cpu.fsr4_mcu2_data[9*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[9];
assign tb_top.cpu.fsr5_mcu2_data[9*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[9];
assign tb_top.cpu.fsr6_mcu3_data[9*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[9];
assign tb_top.cpu.fsr7_mcu3_data[9*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[9];


// rd10

assign tb_top.cpu.fsr0_mcu0_data[10*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[10];


assign tb_top.cpu.fsr0_mcu0_data[10*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[10];
assign tb_top.cpu.fsr1_mcu0_data[10*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[10];
assign tb_top.cpu.fsr2_mcu1_data[10*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[10];
assign tb_top.cpu.fsr3_mcu1_data[10*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[10];
assign tb_top.cpu.fsr4_mcu2_data[10*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[10];
assign tb_top.cpu.fsr5_mcu2_data[10*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[10];
assign tb_top.cpu.fsr6_mcu3_data[10*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[10];
assign tb_top.cpu.fsr7_mcu3_data[10*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[10];


// rd11

assign tb_top.cpu.fsr0_mcu0_data[11*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[11];


assign tb_top.cpu.fsr0_mcu0_data[11*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[11];
assign tb_top.cpu.fsr1_mcu0_data[11*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[11];
assign tb_top.cpu.fsr2_mcu1_data[11*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[11];
assign tb_top.cpu.fsr3_mcu1_data[11*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[11];
assign tb_top.cpu.fsr4_mcu2_data[11*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[11];
assign tb_top.cpu.fsr5_mcu2_data[11*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[11];
assign tb_top.cpu.fsr6_mcu3_data[11*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[11];
assign tb_top.cpu.fsr7_mcu3_data[11*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[11];


// rd12

assign tb_top.cpu.fsr0_mcu0_data[12*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[12];


assign tb_top.cpu.fsr0_mcu0_data[12*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[12];
assign tb_top.cpu.fsr1_mcu0_data[12*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[12];
assign tb_top.cpu.fsr2_mcu1_data[12*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[12];
assign tb_top.cpu.fsr3_mcu1_data[12*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[12];
assign tb_top.cpu.fsr4_mcu2_data[12*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[12];
assign tb_top.cpu.fsr5_mcu2_data[12*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[12];
assign tb_top.cpu.fsr6_mcu3_data[12*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[12];
assign tb_top.cpu.fsr7_mcu3_data[12*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[12];


// rd13

assign tb_top.cpu.fsr0_mcu0_data[13*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+0] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn0_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+1] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn1_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+2] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn2_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+3] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn3_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+4] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn4_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+5] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn5_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+6] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn6_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+7] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn7_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+8] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn8_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+9] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn9_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+10] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn10_in[13];


assign tb_top.cpu.fsr0_mcu0_data[13*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem0.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[13];
assign tb_top.cpu.fsr1_mcu0_data[13*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem1.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[13];
assign tb_top.cpu.fsr2_mcu1_data[13*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem2.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[13];
assign tb_top.cpu.fsr3_mcu1_data[13*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem3.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[13];
assign tb_top.cpu.fsr4_mcu2_data[13*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem4.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[13];
assign tb_top.cpu.fsr5_mcu2_data[13*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem5.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[13];
assign tb_top.cpu.fsr6_mcu3_data[13*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem6.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[13];
assign tb_top.cpu.fsr7_mcu3_data[13*12+11] = tb_top.mcusat_fbdimm.fbdimm_mem7.fbdimm0.amb.fbdimm_nb_fsr.pn11_in[13];


// tie up stsrx_sync

assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[0] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd0[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[0] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd0[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[0] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd0[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[0] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd0[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[0] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd0[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[0] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd0[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[0] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd0[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[0] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd0[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[1] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd1[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[1] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd1[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[1] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd1[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[1] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd1[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[1] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd1[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[1] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd1[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[1] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd1[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[1] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd1[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[2] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd2[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[2] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd2[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[2] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd2[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[2] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd2[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[2] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd2[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[2] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd2[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[2] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd2[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[2] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd2[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[3] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd3[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[3] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd3[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[3] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd3[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[3] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd3[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[3] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd3[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[3] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd3[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[3] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd3[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[3] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd3[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[4] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd4[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[4] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd4[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[4] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd4[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[4] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd4[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[4] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd4[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[4] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd4[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[4] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd4[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[4] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd4[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[5] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd5[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[5] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd5[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[5] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd5[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[5] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd5[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[5] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd5[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[5] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd5[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[5] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd5[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[5] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd5[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[6] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd6[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[6] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd6[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[6] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd6[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[6] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd6[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[6] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd6[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[6] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd6[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[6] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd6[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[6] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd6[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[7] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd7[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[7] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd7[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[7] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd7[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[7] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd7[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[7] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd7[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[7] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd7[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[7] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd7[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[7] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd7[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[8] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd8[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[8] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd8[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[8] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd8[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[8] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd8[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[8] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd8[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[8] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd8[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[8] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd8[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[8] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd8[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[9] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd9[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[9] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd9[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[9] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd9[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[9] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd9[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[9] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd9[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[9] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd9[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[9] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd9[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[9] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd9[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[10] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd10[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[10] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd10[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[10] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd10[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[10] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd10[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[10] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd10[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[10] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd10[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[10] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd10[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[10] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd10[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[11] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd11[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[11] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd11[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[11] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd11[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[11] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd11[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[11] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd11[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[11] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd11[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[11] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd11[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[11] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd11[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[12] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd12[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[12] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd12[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[12] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd12[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[12] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd12[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[12] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd12[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[12] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd12[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[12] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd12[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[12] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd12[11:0] == 12'hbfe);


assign tb_top.cpu.fsr_left.fsr0_mcu0_stsrx_sync[13] = (tb_top.cpu.mcu0_fsr0_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr0_mcu0_rd13[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr1_mcu0_stsrx_sync[13] = (tb_top.cpu.mcu0_fsr1_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr1_mcu0_rd13[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr2_mcu1_stsrx_sync[13] = (tb_top.cpu.mcu1_fsr2_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr2_mcu1_rd13[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_left.fsr3_mcu1_stsrx_sync[13] = (tb_top.cpu.mcu1_fsr3_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_left.fsr3_mcu1_rd13[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr4_mcu2_stsrx_sync[13] = (tb_top.cpu.mcu2_fsr4_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr4_mcu2_rd13[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr5_mcu2_stsrx_sync[13] = (tb_top.cpu.mcu2_fsr5_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr5_mcu2_rd13[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_right.fsr6_mcu3_stsrx_sync[13] = (tb_top.cpu.mcu3_fsr6_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_right.fsr6_mcu3_rd13[11:0] == 12'hbfe);
assign tb_top.cpu.fsr_bottom.fsr7_mcu3_stsrx_sync[13] = (tb_top.cpu.mcu3_fsr7_cfgrx_enrx == 1'b1) & (tb_top.cpu.fsr_bottom.fsr7_mcu3_rd13[11:0] == 12'hbfe);

endmodule
`endif

