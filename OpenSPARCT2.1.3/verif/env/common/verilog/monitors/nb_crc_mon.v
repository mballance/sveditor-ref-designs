// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: nb_crc_mon.v
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
`timescale 1ps/1ps

`ifdef MCUSAT
  `include "mcu_dispmonDefines.vh"
`else
  `include "defines.vh"
  `include "dispmonDefines.vh"
`endif

module nb_crc_mon();

wire 	    drl2clk = `MCU0.drl2clk;
wire        rst_wmr_protect = `CPU.rst_wmr_protect;

wire	    fbdic_crc_error_0 = `MCU0.fbdic.fbdic_crc_error ;
wire	    fbdic_crc_error_1 = `MCU1.fbdic.fbdic_crc_error ;
wire	    fbdic_crc_error_2 = `MCU2.fbdic.fbdic_crc_error ;
wire	    fbdic_crc_error_3 = `MCU3.fbdic.fbdic_crc_error ;

wire	    fbdic_rddata_vld_0 = tb_top.cpu.mcu0.fbdic_rddata_vld;
wire	    fbdic_rddata_vld_1 = tb_top.cpu.mcu1.fbdic_rddata_vld;
wire	    fbdic_rddata_vld_2 = tb_top.cpu.mcu2.fbdic_rddata_vld;
wire	    fbdic_rddata_vld_3 = tb_top.cpu.mcu3.fbdic_rddata_vld;

wire        mcu0_fbdird_crc_cmp0_0 = tb_top.cpu.mcu0.fbdird_crc_cmp0_0;
wire        mcu0_fbdird_crc_cmp0_1 = tb_top.cpu.mcu0.fbdird_crc_cmp0_1;
wire        mcu0_fbdird_crc_cmp1_0 = tb_top.cpu.mcu0.fbdird_crc_cmp1_0;
wire        mcu0_fbdird_crc_cmp1_1 = tb_top.cpu.mcu0.fbdird_crc_cmp1_1;

wire        mcu1_fbdird_crc_cmp0_0 = tb_top.cpu.mcu1.fbdird_crc_cmp0_0;
wire        mcu1_fbdird_crc_cmp0_1 = tb_top.cpu.mcu1.fbdird_crc_cmp0_1;
wire        mcu1_fbdird_crc_cmp1_0 = tb_top.cpu.mcu1.fbdird_crc_cmp1_0;
wire        mcu1_fbdird_crc_cmp1_1 = tb_top.cpu.mcu1.fbdird_crc_cmp1_1;

wire        mcu2_fbdird_crc_cmp0_0 = tb_top.cpu.mcu2.fbdird_crc_cmp0_0;
wire        mcu2_fbdird_crc_cmp0_1 = tb_top.cpu.mcu2.fbdird_crc_cmp0_1;
wire        mcu2_fbdird_crc_cmp1_0 = tb_top.cpu.mcu2.fbdird_crc_cmp1_0;
wire        mcu2_fbdird_crc_cmp1_1 = tb_top.cpu.mcu2.fbdird_crc_cmp1_1;

wire        mcu3_fbdird_crc_cmp0_0 = tb_top.cpu.mcu3.fbdird_crc_cmp0_0;
wire        mcu3_fbdird_crc_cmp0_1 = tb_top.cpu.mcu3.fbdird_crc_cmp0_1;
wire        mcu3_fbdird_crc_cmp1_0 = tb_top.cpu.mcu3.fbdird_crc_cmp1_0;
wire        mcu3_fbdird_crc_cmp1_1 = tb_top.cpu.mcu3.fbdird_crc_cmp1_1;

wire [11:0] mcu0_act_crc00 = tb_top.cpu.mcu0.fbdird.crc_cmp0_0_actual;
wire [11:0] mcu0_act_crc01 = tb_top.cpu.mcu0.fbdird.crc_cmp0_1_actual;
wire [11:0] mcu0_act_crc10 = tb_top.cpu.mcu0.fbdird.crc_cmp1_0_actual;
wire [11:0] mcu0_act_crc11 = tb_top.cpu.mcu0.fbdird.crc_cmp1_1_actual;

wire [11:0] mcu1_act_crc00 = tb_top.cpu.mcu1.fbdird.crc_cmp0_0_actual;
wire [11:0] mcu1_act_crc01 = tb_top.cpu.mcu1.fbdird.crc_cmp0_1_actual;
wire [11:0] mcu1_act_crc10 = tb_top.cpu.mcu1.fbdird.crc_cmp1_0_actual;
wire [11:0] mcu1_act_crc11 = tb_top.cpu.mcu1.fbdird.crc_cmp1_1_actual;

wire [11:0] mcu2_act_crc00 = tb_top.cpu.mcu2.fbdird.crc_cmp0_0_actual;
wire [11:0] mcu2_act_crc01 = tb_top.cpu.mcu2.fbdird.crc_cmp0_1_actual;
wire [11:0] mcu2_act_crc10 = tb_top.cpu.mcu2.fbdird.crc_cmp1_0_actual;
wire [11:0] mcu2_act_crc11 = tb_top.cpu.mcu2.fbdird.crc_cmp1_1_actual;

wire [11:0] mcu3_act_crc00 = tb_top.cpu.mcu3.fbdird.crc_cmp0_0_actual;
wire [11:0] mcu3_act_crc01 = tb_top.cpu.mcu3.fbdird.crc_cmp0_1_actual;
wire [11:0] mcu3_act_crc10 = tb_top.cpu.mcu3.fbdird.crc_cmp1_0_actual;
wire [11:0] mcu3_act_crc11 = tb_top.cpu.mcu3.fbdird.crc_cmp1_1_actual;

wire [11:0] mcu0_rtl_exp_crc00 = tb_top.cpu.mcu0.fbdird.crc_cmp0_0_expected;
wire [11:0] mcu0_rtl_exp_crc01 = tb_top.cpu.mcu0.fbdird.crc_cmp0_1_expected;
wire [11:0] mcu0_rtl_exp_crc10 = tb_top.cpu.mcu0.fbdird.crc_cmp1_0_expected;
wire [11:0] mcu0_rtl_exp_crc11 = tb_top.cpu.mcu0.fbdird.crc_cmp1_1_expected;

wire [11:0] mcu1_rtl_exp_crc00 = tb_top.cpu.mcu1.fbdird.crc_cmp0_0_expected;
wire [11:0] mcu1_rtl_exp_crc01 = tb_top.cpu.mcu1.fbdird.crc_cmp0_1_expected;
wire [11:0] mcu1_rtl_exp_crc10 = tb_top.cpu.mcu1.fbdird.crc_cmp1_0_expected;
wire [11:0] mcu1_rtl_exp_crc11 = tb_top.cpu.mcu1.fbdird.crc_cmp1_1_expected;

wire [11:0] mcu2_rtl_exp_crc00 = tb_top.cpu.mcu2.fbdird.crc_cmp0_0_expected;
wire [11:0] mcu2_rtl_exp_crc01 = tb_top.cpu.mcu2.fbdird.crc_cmp0_1_expected;
wire [11:0] mcu2_rtl_exp_crc10 = tb_top.cpu.mcu2.fbdird.crc_cmp1_0_expected;
wire [11:0] mcu2_rtl_exp_crc11 = tb_top.cpu.mcu2.fbdird.crc_cmp1_1_expected;

wire [11:0] mcu3_rtl_exp_crc00 = tb_top.cpu.mcu3.fbdird.crc_cmp0_0_expected;
wire [11:0] mcu3_rtl_exp_crc01 = tb_top.cpu.mcu3.fbdird.crc_cmp0_1_expected;
wire [11:0] mcu3_rtl_exp_crc10 = tb_top.cpu.mcu3.fbdird.crc_cmp1_0_expected;
wire [11:0] mcu3_rtl_exp_crc11 = tb_top.cpu.mcu3.fbdird.crc_cmp1_1_expected;

wire [71:0] mcu0_bd00 = tb_top.cpu.mcu0.fbdird.bd00; 
wire [71:0] mcu0_bd01 = tb_top.cpu.mcu0.fbdird.bd01; 
wire [71:0] mcu0_bd10 = tb_top.cpu.mcu0.fbdird.bd10; 
wire [71:0] mcu0_bd11 = tb_top.cpu.mcu0.fbdird.bd11; 

wire [71:0] mcu1_bd00 = tb_top.cpu.mcu1.fbdird.bd00; 
wire [71:0] mcu1_bd01 = tb_top.cpu.mcu1.fbdird.bd01; 
wire [71:0] mcu1_bd10 = tb_top.cpu.mcu1.fbdird.bd10; 
wire [71:0] mcu1_bd11 = tb_top.cpu.mcu1.fbdird.bd11; 

wire [71:0] mcu2_bd00 = tb_top.cpu.mcu2.fbdird.bd00; 
wire [71:0] mcu2_bd01 = tb_top.cpu.mcu2.fbdird.bd01; 
wire [71:0] mcu2_bd10 = tb_top.cpu.mcu2.fbdird.bd10; 
wire [71:0] mcu2_bd11 = tb_top.cpu.mcu2.fbdird.bd11; 

wire [71:0] mcu3_bd00 = tb_top.cpu.mcu3.fbdird.bd00; 
wire [71:0] mcu3_bd01 = tb_top.cpu.mcu3.fbdird.bd01; 
wire [71:0] mcu3_bd10 = tb_top.cpu.mcu3.fbdird.bd10; 
wire [71:0] mcu3_bd11 = tb_top.cpu.mcu3.fbdird.bd11; 

wire [11:0] mcu0_exp_crc00 ,  mcu0_exp_crc01 , mcu0_exp_crc10 , mcu0_exp_crc11 ;   // monitor expected
wire [11:0] mcu1_exp_crc00 ,  mcu1_exp_crc01 , mcu1_exp_crc10 , mcu1_exp_crc11 ;   // monitor expected
wire [11:0] mcu2_exp_crc00 ,  mcu2_exp_crc01 , mcu2_exp_crc10 , mcu2_exp_crc11 ;   // monitor expected
wire [11:0] mcu3_exp_crc00 ,  mcu3_exp_crc01 , mcu3_exp_crc10 , mcu3_exp_crc11 ;   // monitor expected

reg enabled;

initial
begin
  enabled = 1'b1;
  if ($test$plusargs("nb_crc_mon_disable"))
    enabled = 1'b0;
end

//-----------------------------------
// Disable nb_crc_mon during Warm Reset
//-----------------------------------

always @ (posedge rst_wmr_protect)
begin
  enabled = 1'b0;
end

always @ (negedge rst_wmr_protect)
begin
  if (!($test$plusargs("nb_crc_mon_disable")))
    enabled = 1'b1;
end

always @(posedge (drl2clk && enabled))
begin

if (fbdic_rddata_vld_0)
begin
  if (mcu0_exp_crc00 != mcu0_act_crc00)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN00 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu0_act_crc00, mcu0_exp_crc00);
  if (mcu0_exp_crc01 != mcu0_act_crc01)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN01 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu0_act_crc01, mcu0_exp_crc01);
  if (mcu0_exp_crc10 != mcu0_act_crc10)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN10 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu0_act_crc10, mcu0_exp_crc10);
  if (mcu0_exp_crc11 != mcu0_act_crc11)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN11 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu0_act_crc11, mcu0_exp_crc11);

  if (mcu0_exp_crc00 != mcu0_rtl_exp_crc00)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN00 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu0_rtl_exp_crc00, mcu0_exp_crc00);
  if (mcu0_exp_crc01 != mcu0_rtl_exp_crc01)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN01 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu0_rtl_exp_crc01, mcu0_exp_crc01);
  if (mcu0_exp_crc10 != mcu0_rtl_exp_crc10)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN10 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu0_rtl_exp_crc10, mcu0_exp_crc10);
  if (mcu0_exp_crc11 != mcu0_rtl_exp_crc11)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN11 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu0_rtl_exp_crc11, mcu0_exp_crc11);

  if (mcu0_fbdird_crc_cmp0_0 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN00 mcu0_fbdird_crc_cmp0_0 is not asserted");
  if (mcu0_fbdird_crc_cmp0_1 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN01 mcu0_fbdird_crc_cmp0_1 is not asserted");
  if (mcu0_fbdird_crc_cmp1_0 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN10 mcu0_fbdird_crc_cmp1_0 is not asserted");
  if (mcu0_fbdird_crc_cmp1_1 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU0 CHN11 mcu0_fbdird_crc_cmp1_1 is not asserted");

end

if (fbdic_rddata_vld_1)
begin
  if (mcu1_exp_crc00 != mcu1_act_crc00)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN00 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu1_act_crc00, mcu1_exp_crc00);
  if (mcu1_exp_crc01 != mcu1_act_crc01)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN01 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu1_act_crc01, mcu1_exp_crc01);
  if (mcu1_exp_crc10 != mcu1_act_crc10)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN10 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu1_act_crc10, mcu1_exp_crc10);
  if (mcu1_exp_crc11 != mcu1_act_crc11)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN11 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu1_act_crc11, mcu1_exp_crc11);

  if (mcu1_exp_crc00 != mcu1_rtl_exp_crc00)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN00 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu1_rtl_exp_crc00, mcu1_exp_crc00);
  if (mcu1_exp_crc01 != mcu1_rtl_exp_crc01)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN01 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu1_rtl_exp_crc01, mcu1_exp_crc01);
  if (mcu1_exp_crc10 != mcu1_rtl_exp_crc10)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN10 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu1_rtl_exp_crc10, mcu1_exp_crc10);
  if (mcu1_exp_crc11 != mcu1_rtl_exp_crc11)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN11 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu1_rtl_exp_crc11, mcu1_exp_crc11);

  if (mcu1_fbdird_crc_cmp0_0 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN00 mcu1_fbdird_crc_cmp0_0 is not asserted");
  if (mcu1_fbdird_crc_cmp0_1 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN01 mcu1_fbdird_crc_cmp0_1 is not asserted");
  if (mcu1_fbdird_crc_cmp1_0 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN10 mcu1_fbdird_crc_cmp1_0 is not asserted");
  if (mcu1_fbdird_crc_cmp1_1 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU1 CHN11 mcu1_fbdird_crc_cmp1_1 is not asserted");
end

if (fbdic_rddata_vld_2)
begin
  if (mcu2_exp_crc00 != mcu2_act_crc00)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN00 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu2_act_crc00, mcu2_exp_crc00);
  if (mcu2_exp_crc01 != mcu2_act_crc01)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN01 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu2_act_crc01, mcu2_exp_crc01);
  if (mcu2_exp_crc10 != mcu2_act_crc10)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN10 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu2_act_crc10, mcu2_exp_crc10);
  if (mcu2_exp_crc11 != mcu2_act_crc11)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN11 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu2_act_crc11, mcu2_exp_crc11);

  if (mcu2_exp_crc00 != mcu2_rtl_exp_crc00)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN00 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu2_rtl_exp_crc00, mcu2_exp_crc00);
  if (mcu2_exp_crc01 != mcu2_rtl_exp_crc01)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN01 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu2_rtl_exp_crc01, mcu2_exp_crc01);
  if (mcu2_exp_crc10 != mcu2_rtl_exp_crc10)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN10 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu2_rtl_exp_crc10, mcu2_exp_crc10);
  if (mcu2_exp_crc11 != mcu2_rtl_exp_crc11)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN11 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu2_rtl_exp_crc11, mcu2_exp_crc11);

  if (mcu2_fbdird_crc_cmp0_0 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN00 mcu2_fbdird_crc_cmp0_0 is not asserted");
  if (mcu2_fbdird_crc_cmp0_1 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN01 mcu2_fbdird_crc_cmp0_1 is not asserted");
  if (mcu2_fbdird_crc_cmp1_0 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN10 mcu2_fbdird_crc_cmp1_0 is not asserted");
  if (mcu2_fbdird_crc_cmp1_1 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU2 CHN11 mcu2_fbdird_crc_cmp1_1 is not asserted");
end

if (fbdic_rddata_vld_3)
begin
  if (mcu3_exp_crc00 != mcu3_act_crc00)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN00 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu3_act_crc00, mcu3_exp_crc00);
  if (mcu3_exp_crc01 != mcu3_act_crc01)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN01 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu3_act_crc01, mcu3_exp_crc01);
  if (mcu3_exp_crc10 != mcu3_act_crc10)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN10 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu3_act_crc10, mcu3_exp_crc10);
  if (mcu3_exp_crc11 != mcu3_act_crc11)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN11 CRC-12 Mismatch : ACT CRC == %h\tMON EXP CRC == %h",mcu3_act_crc11, mcu3_exp_crc11);

  if (mcu3_exp_crc00 != mcu3_rtl_exp_crc00)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN00 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu3_rtl_exp_crc00, mcu3_exp_crc00);
  if (mcu3_exp_crc01 != mcu3_rtl_exp_crc01)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN01 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu3_rtl_exp_crc01, mcu3_exp_crc01);
  if (mcu3_exp_crc10 != mcu3_rtl_exp_crc10)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN10 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu3_rtl_exp_crc10, mcu3_exp_crc10);
  if (mcu3_exp_crc11 != mcu3_rtl_exp_crc11)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN11 CRC-12 Mismatch : RTL EXP CRC == %h\tMON EXP CRC == %h",mcu3_rtl_exp_crc11, mcu3_exp_crc11);

  if (mcu3_fbdird_crc_cmp0_0 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN00 mcu3_fbdird_crc_cmp0_0 is not asserted");
  if (mcu3_fbdird_crc_cmp0_1 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN01 mcu3_fbdird_crc_cmp0_1 is not asserted");
  if (mcu3_fbdird_crc_cmp1_0 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN10 mcu3_fbdird_crc_cmp1_0 is not asserted");
  if (mcu3_fbdird_crc_cmp1_1 == 0)
    `PR_ERROR("nb_crc_mon", `ERROR, "NB MCU3 CHN11 mcu3_fbdird_crc_cmp1_1 is not asserted");
end

end

`ifdef MCU_FAILOVER_MODE

nbmon_gen_crc_fl mcu0_crc00_fl  ( .d (mcu0_bd00), .crc_fl (mcu0_exp_crc00[5:0]) );  
nbmon_gen_crc_fl mcu0_crc01_fl  ( .d (mcu0_bd01), .crc_fl (mcu0_exp_crc01[5:0]) );  
nbmon_gen_crc_fl mcu0_crc10_fl  ( .d (mcu0_bd10), .crc_fl (mcu0_exp_crc10[5:0]) );  
nbmon_gen_crc_fl mcu0_crc11_fl  ( .d (mcu0_bd11), .crc_fl (mcu0_exp_crc11[5:0]) );  

nbmon_gen_crc_fl mcu1_crc00_fl  ( .d (mcu1_bd00), .crc_fl (mcu1_exp_crc00[5:0]) );  
nbmon_gen_crc_fl mcu1_crc01_fl  ( .d (mcu1_bd01), .crc_fl (mcu1_exp_crc01[5:0]) );  
nbmon_gen_crc_fl mcu1_crc10_fl  ( .d (mcu1_bd10), .crc_fl (mcu1_exp_crc10[5:0]) );  
nbmon_gen_crc_fl mcu1_crc11_fl  ( .d (mcu1_bd11), .crc_fl (mcu1_exp_crc11[5:0]) );  

nbmon_gen_crc_fl mcu2_crc00_fl  ( .d (mcu2_bd00), .crc_fl (mcu2_exp_crc00[5:0]) );  
nbmon_gen_crc_fl mcu2_crc01_fl  ( .d (mcu2_bd01), .crc_fl (mcu2_exp_crc01[5:0]) );  
nbmon_gen_crc_fl mcu2_crc10_fl  ( .d (mcu2_bd10), .crc_fl (mcu2_exp_crc10[5:0]) );  
nbmon_gen_crc_fl mcu2_crc11_fl  ( .d (mcu2_bd11), .crc_fl (mcu2_exp_crc11[5:0]) );  

nbmon_gen_crc_fl mcu3_crc00_fl  ( .d (mcu3_bd00), .crc_fl (mcu3_exp_crc00[5:0]) );  
nbmon_gen_crc_fl mcu3_crc01_fl  ( .d (mcu3_bd01), .crc_fl (mcu3_exp_crc01[5:0]) );  
nbmon_gen_crc_fl mcu3_crc10_fl  ( .d (mcu3_bd10), .crc_fl (mcu3_exp_crc10[5:0]) );  
nbmon_gen_crc_fl mcu3_crc11_fl  ( .d (mcu3_bd11), .crc_fl (mcu3_exp_crc11[5:0]) );  

assign mcu0_exp_crc00[11:6] = 6'h0;
assign mcu0_exp_crc01[11:6] = 6'h0;
assign mcu0_exp_crc10[11:6] = 6'h0;
assign mcu0_exp_crc11[11:6] = 6'h0;

assign mcu1_exp_crc00[11:6] = 6'h0;
assign mcu1_exp_crc01[11:6] = 6'h0;
assign mcu1_exp_crc10[11:6] = 6'h0;
assign mcu1_exp_crc11[11:6] = 6'h0;

assign mcu2_exp_crc00[11:6] = 6'h0;
assign mcu2_exp_crc01[11:6] = 6'h0;
assign mcu2_exp_crc10[11:6] = 6'h0;
assign mcu2_exp_crc11[11:6] = 6'h0;

assign mcu3_exp_crc00[11:6] = 6'h0;
assign mcu3_exp_crc01[11:6] = 6'h0;
assign mcu3_exp_crc10[11:6] = 6'h0;
assign mcu3_exp_crc11[11:6] = 6'h0;

`else

nbmon_gen_crc mcu0_crc00  ( .d (mcu0_bd00), .crc (mcu0_exp_crc00) );  
nbmon_gen_crc mcu0_crc01  ( .d (mcu0_bd01), .crc (mcu0_exp_crc01) );  
nbmon_gen_crc mcu0_crc10  ( .d (mcu0_bd10), .crc (mcu0_exp_crc10) );  
nbmon_gen_crc mcu0_crc11  ( .d (mcu0_bd11), .crc (mcu0_exp_crc11) );  

nbmon_gen_crc mcu1_crc00  ( .d (mcu1_bd00), .crc (mcu1_exp_crc00) );  
nbmon_gen_crc mcu1_crc01  ( .d (mcu1_bd01), .crc (mcu1_exp_crc01) );  
nbmon_gen_crc mcu1_crc10  ( .d (mcu1_bd10), .crc (mcu1_exp_crc10) );  
nbmon_gen_crc mcu1_crc11  ( .d (mcu1_bd11), .crc (mcu1_exp_crc11) );  

nbmon_gen_crc mcu2_crc00  ( .d (mcu2_bd00), .crc (mcu2_exp_crc00) );  
nbmon_gen_crc mcu2_crc01  ( .d (mcu2_bd01), .crc (mcu2_exp_crc01) );  
nbmon_gen_crc mcu2_crc10  ( .d (mcu2_bd10), .crc (mcu2_exp_crc10) );  
nbmon_gen_crc mcu2_crc11  ( .d (mcu2_bd11), .crc (mcu2_exp_crc11) );  

nbmon_gen_crc mcu3_crc00  ( .d (mcu3_bd00), .crc (mcu3_exp_crc00) );  
nbmon_gen_crc mcu3_crc01  ( .d (mcu3_bd01), .crc (mcu3_exp_crc01) );  
nbmon_gen_crc mcu3_crc10  ( .d (mcu3_bd10), .crc (mcu3_exp_crc10) );  
nbmon_gen_crc mcu3_crc11  ( .d (mcu3_bd11), .crc (mcu3_exp_crc11) );  

`endif

endmodule

module nbmon_gen_crc(d, crc);

input [71:0] d;
output [11:0] crc;

assign  crc[0] = d[71]^d[70]^d[68]^d[67]^d[66]^d[63]^
                 d[58]^d[56]^d[55]^d[54]^d[53]^d[52]^
                 d[49]^d[48]^d[46]^d[44]^d[42]^d[41]^
                 d[40]^d[39]^d[38]^d[37]^d[36]^d[35]^
                 d[34]^d[29]^d[26]^d[25]^d[22]^d[21]^
                 d[19]^d[18]^d[16]^d[12]^d[9]^d[8]^
                 d[7]^d[6]^d[3]^d[1]^d[0];

assign  crc[1] = d[70]^d[69]^d[66]^d[64]^d[63]^d[59]^
                 d[58]^d[57]^d[52]^d[50]^d[48]^d[47]^
                 d[46]^d[45]^d[44]^d[43]^d[34]^d[30]^
                 d[29]^d[27]^d[25]^d[23]^d[21]^d[20]^
                 d[18]^d[17]^d[16]^d[13]^d[12]^d[10]^
                 d[6]^d[4]^d[3]^d[2]^d[0];

assign  crc[2] = d[71]^d[70]^d[67]^d[65]^d[64]^d[60]^
                 d[59]^d[58]^d[53]^d[51]^d[49]^d[48]^
                 d[47]^d[46]^d[45]^d[44]^d[35]^d[31]^
                 d[30]^d[28]^d[26]^d[24]^d[22]^d[21]^
                 d[19]^d[18]^d[17]^d[14]^d[13]^d[11]^
                 d[7]^d[5]^d[4]^d[3]^d[1];

assign  crc[3] = d[70]^d[67]^d[65]^d[63]^d[61]^d[60]^
                 d[59]^d[58]^d[56]^d[55]^d[53]^d[50]^
                 d[47]^d[45]^d[44]^d[42]^d[41]^d[40]^
                 d[39]^d[38]^d[37]^d[35]^d[34]^d[32]^ 
                 d[31]^d[27]^d[26]^d[23]^d[21]^d[20]^
                 d[16]^d[15]^d[14]^d[9]^d[7]^d[5]^
                 d[4]^d[3]^d[2]^d[1]^d[0];

assign  crc[4] = d[70]^d[67]^d[64]^d[63]^d[62]^d[61]^
                 d[60]^d[59]^d[58]^d[57]^d[55]^d[53]^
                 d[52]^d[51]^d[49]^d[45]^d[44]^d[43]^
                 d[37]^d[34]^d[33]^d[32]^d[29]^d[28]^
                 d[27]^d[26]^d[25]^d[24]^d[19]^d[18]^
                 d[17]^d[15]^d[12]^d[10]^d[9]^d[7]^
                 d[5]^d[4]^d[2]^d[0];

assign  crc[5] = d[71]^d[68]^d[65]^d[64]^d[63]^d[62]^
                 d[61]^d[60]^d[59]^d[58]^d[56]^d[54]^
                 d[53]^d[52]^d[50]^d[46]^d[45]^d[44]^
                 d[38]^d[35]^d[34]^d[33]^d[30]^d[29]^
                 d[28]^d[27]^d[26]^d[25]^d[20]^d[19]^
                 d[18]^d[16]^d[13]^d[11]^d[10]^d[8]^
                 d[6]^d[5]^d[3]^d[1];

assign  crc[6] = d[71]^d[70]^d[69]^d[68]^d[67]^d[65]^
                 d[64]^d[62]^d[61]^d[60]^d[59]^d[58]^
                 d[57]^d[56]^d[52]^d[51]^d[49]^d[48]^
                 d[47]^d[45]^d[44]^d[42]^d[41]^d[40]^
                 d[38]^d[37]^d[31]^d[30]^d[28]^d[27]^
                 d[25]^d[22]^d[20]^d[18]^d[17]^d[16]^
                 d[14]^d[11]^d[8]^d[4]^d[3]^d[2]^
                 d[1]^d[0];

assign  crc[7] = d[71]^d[70]^d[69]^d[68]^d[66]^d[65]^
                 d[63]^d[62]^d[61]^d[60]^d[59]^d[58]^
                 d[57]^d[53]^d[52]^d[50]^d[49]^d[48]^
                 d[46]^d[45]^d[43]^d[42]^d[41]^d[39]^
                 d[38]^d[32]^d[31]^d[29]^d[28]^d[26]^
                 d[23]^d[21]^d[19]^d[18]^d[17]^d[15]^
                 d[12]^d[9]^d[5]^d[4]^d[3]^d[2]^d[1];

assign  crc[8] = d[69]^d[68]^d[64]^d[62]^d[61]^d[60]^
                 d[59]^d[56]^d[55]^d[52]^d[51]^d[50]^
                 d[48]^d[47]^d[43]^d[41]^d[38]^d[37]^
                 d[36]^d[35]^d[34]^d[33]^d[32]^d[30]^
                 d[27]^d[26]^d[25]^d[24]^d[21]^d[20]^
                 d[13]^d[12]^d[10]^d[9]^d[8]^d[7]^
                 d[5]^d[4]^d[2]^d[1]^d[0];

assign  crc[9] = d[70]^d[69]^d[65]^d[63]^d[62]^d[61]^
                 d[60]^d[57]^d[56]^d[53]^d[52]^d[51]^
                 d[49]^d[48]^d[44]^d[42]^d[39]^d[38]^
                 d[37]^d[36]^d[35]^d[34]^d[33]^d[31]^
                 d[28]^d[27]^d[26]^d[25]^d[22]^d[21]^
                 d[14]^d[13]^d[11]^d[10]^d[9]^d[8]^
                 d[6]^d[5]^d[3]^d[2]^d[1];

assign  crc[10] = d[68]^d[67]^d[64]^d[62]^d[61]^d[57]^
                  d[56]^d[55]^d[50]^d[48]^d[46]^d[45]^
                  d[44]^d[43]^d[42]^d[41]^d[32]^d[28]^
                  d[27]^d[25]^d[23]^d[21]^d[19]^d[18]^
                  d[16]^d[15]^d[14]^d[11]^d[10]^d[8]^
                  d[4]^d[2]^d[1]^d[0];

assign  crc[11] = d[71]^d[70]^d[69]^d[67]^d[66]^d[65]^
                  d[62]^d[57]^d[55]^d[54]^d[53]^d[52]^
                  d[51]^d[48]^d[47]^d[45]^d[43]^d[41]^
                  d[40]^d[39]^d[38]^d[37]^d[36]^d[35]^
                  d[34]^d[33]^d[28]^d[25]^d[24]^d[21]^
                  d[20]^d[18]^d[17]^d[15]^d[11]^d[8]^
                  d[7]^d[6]^d[5]^d[2]^d[0];

endmodule

module nbmon_gen_crc_fl(d, crc_fl);

input  [71:0] d;
output [5:0] crc_fl;

assign crc_fl[0] = d[69]^d[66]^d[65]^d[64]^d[63]^d[57]^
                   d[56]^d[54]^d[53]^d[52]^d[49]^d[48]^
                   d[44]^d[43]^d[42]^d[40]^d[38]^d[37]^
                   d[36]^d[35]^d[34]^d[33]^d[31]^d[30]^
                   d[28]^d[24]^d[19]^d[17]^d[16]^d[13]^
                   d[11]^d[9]^d[6]^d[3]^d[2]^d[1]^d[0];

assign crc_fl[1] = d[70]^d[69]^d[67]^d[63]^d[58]^d[56]^
                   d[55]^d[52]^d[50]^d[48]^d[45]^d[42]^
                   d[41]^d[40]^d[39]^d[33]^d[32]^d[30]^
                   d[29]^d[28]^d[25]^d[24]^d[20]^d[19]^
                   d[18]^d[16]^d[14]^d[13]^d[12]^d[11]^
                   d[10]^d[9]^d[7]^d[6]^d[4]^d[0];

assign crc_fl[2] = d[71]^d[70]^d[69]^d[68]^d[66]^d[65]^
                   d[63]^d[59]^d[54]^d[52]^d[51]^d[48]^
                   d[46]^d[44]^d[41]^d[38]^d[37]^d[36]^
                   d[35]^d[29]^d[28]^d[26]^d[25]^d[24]^
                   d[21]^d[20]^d[16]^d[15]^d[14]^d[12]^
                   d[10]^d[9]^d[8]^d[7]^d[6]^d[5]^d[3]^
                   d[2]^d[0];

assign crc_fl[3] = d[71]^d[70]^d[69]^d[67]^d[66]^d[64]^
                   d[60]^d[55]^d[53]^d[52]^d[49]^d[47]^
                   d[45]^d[42]^d[39]^d[38]^d[37]^d[36]^
                   d[30]^d[29]^d[27]^d[26]^d[25]^d[22]^
                   d[21]^d[17]^d[16]^d[15]^d[13]^d[11]^
                   d[10]^d[9]^d[8]^d[7]^d[6]^d[4]^d[3]^
                   d[1];

assign crc_fl[4] = d[71]^d[70]^d[68]^d[67]^d[65]^d[61]^
                   d[56]^d[54]^d[53]^d[50]^d[48]^d[46]^
                   d[43]^d[40]^d[39]^d[38]^d[37]^d[31]^
                   d[30]^d[28]^d[27]^d[26]^d[23]^d[22]^
                   d[18]^d[17]^d[16]^d[14]^d[12]^d[11]^
                   d[10]^d[9]^d[8]^d[7]^d[5]^d[4]^d[2];

assign crc_fl[5] = d[71]^d[68]^d[65]^d[64]^d[63]^d[62]^
                   d[56]^d[55]^d[53]^d[52]^d[51]^d[48]^
                   d[47]^d[43]^d[42]^d[41]^d[39]^d[37]^
                   d[36]^d[35]^d[34]^d[33]^d[32]^d[30]^
                   d[29]^d[27]^d[23]^d[18]^d[16]^d[15]^
                   d[12]^d[10]^d[8]^d[5]^d[2]^d[1]^d[0]; 

endmodule
